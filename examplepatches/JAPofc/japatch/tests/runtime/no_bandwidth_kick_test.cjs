// Stay in calls when you are alone hangs on one object: Discord's CallIdleManager (metro 18456) keeps a 180000 ms
// Timeout in `idleTimeout`, and its start() is the only thing that ever schedules the disconnect. The hook replaces
// that one method; everything else about leaving a call - the Disconnect button, the leave chime, the channel modal -
// keeps working because it never goes through the timer. These checks slice the shipped function out of the runtime
// and run it against a fake manager, so the guard, the switch and the AFK exception are all exercised.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}
const eq = (actual, expected, label) => {
    if (JSON.stringify(actual) !== JSON.stringify(expected))
        throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
};
function slice(from, to) {
    const start = SOURCE.indexOf(from);
    const end = SOURCE.indexOf(to, start + 1);
    if (start < 0 || end < 0) throw new Error("slice not found: " + from);
    return SOURCE.slice(start, end);
}

// replaceValue() as the runtime defines it: a live object gets its own property shadowed, never cloned.
const REPLACE = slice("    function replaceValue(object, key, value) {", "    function hookExport(exports, key, operation) {");
const BODY = slice("    let callIdleWarned = false;", "    function NoBandwidthKickSettings() {");

// The fake phone: settings are plain values, enabled() resolves option -> feature, and the store answers are canned.
function run(options) {
    const o = options || {};
    const calls = { start: 0, warnings: [] };
    const timer = { start() { calls.start++; }, stop() {} };
    const exports = { default: { idleTimeout: timer } };
    // `settings` is the live table: enabled() reads it on every call, exactly as the runtime does, so a switch
    // flipped mid-session is seen by the next start().
    const settings = { noBandwidthKick: o.on !== false, noBandwidthKickAfk: !!o.afk, debugLog: true };
    const ctx = {
        settings,
        features: { noBandwidthKick: true },
        enabled: key => key === "noBandwidthKick" ? !!settings.noBandwidthKick : false,
        replaceValue: eval("(" + REPLACE.replace(/^    function replaceValue/, "function replaceValue") + ")"),
        dlog: (level, area, text) => calls.warnings.push(text),
        inspectedExport: (id) => {
            if (id === 5212) return { getCurrentClientVoiceChannelId: () => o.channelId === undefined ? "chan-1" : o.channelId };
            if (id === 2068) return { getChannel: id => o.channel === undefined ? { id, guild_id: "guild-1" } : o.channel };
            if (id === 2090) return { getGuild: id => o.guild === undefined ? { id, afkChannelId: o.afkChannelId } : o.guild };
            return undefined;
        },
        callIdleDone: () => {},
    };
    ctx.callIdleWarned = false;
    vm.createContext(ctx);
    vm.runInContext(BODY + "\nthis.attach = callIdleAttach; this.isAfk = noBandwidthKickAfk;", ctx);
    const after = ctx.attach(exports);
    return { timer, exports, after, calls, ctx, start: (...args) => after.default.idleTimeout.start(...args) };
}

check("with the feature on, Discord's three-minute timer is never started", () => {
    const r = run();
    r.start("handleVoiceStateUpdates");
    eq(r.calls.start, 0);
});

check("the timer is still the same object the manager built, and stop() is untouched", () => {
    const r = run();
    eq(r.after.default.idleTimeout.stop !== undefined, true, "stop()");
    eq(typeof r.after.default.idleTimeout.stop, "function", "stop() is a function");
    r.after.default.idleTimeout.stop();
});

check("with the feature off, Discord's own start() runs exactly as before", () => {
    const r = run({ on: false });
    r.start("handleConnectionClosed");
    eq(r.calls.start, 1);
});

check("turning it off fixes nothing: the wrap asks every time, so one session can switch both ways", () => {
    const r = run();
    r.start(); eq(r.calls.start, 0);
    r.ctx.settings.noBandwidthKick = false;
    r.start(); eq(r.calls.start, 1);
    r.ctx.settings.noBandwidthKick = true;
    r.start(); eq(r.calls.start, 1);
});

check("attaching twice does not stack wrappers (or double-count the call)", () => {
    const r = run();
    r.ctx.attach(r.exports);
    r.ctx.attach(r.exports);
    r.ctx.settings.noBandwidthKick = false;
    r.start();
    eq(r.calls.start, 1);
});

check("nothing is started while the timeout object is missing: it says so and leaves the module alone", () => {
    const weird = { default: {} };
    const ctx = {
        settings: { noBandwidthKick: true, noBandwidthKickAfk: false, debugLog: true },
        features: { noBandwidthKick: true }, enabled: () => true,
        replaceValue: eval("(" + REPLACE.replace(/^    function replaceValue/, "function replaceValue") + ")"),
        dlog: (level, area, text) => { ctx.warned = text; }, inspectedExport: () => undefined,
    };
    vm.createContext(ctx);
    vm.runInContext(BODY + "\nthis.attach = callIdleAttach;", ctx);
    const same = ctx.attach(weird);
    eq(same, weird, "the exports object is returned as it was");
    if (!/18456\.idleTimeout/.test(ctx.warned || "")) throw new Error("no warning was logged: " + ctx.warned);
});

check("the AFK switch is off by default, so a channel is never treated as AFK", () => {
    const r = run({ afk: false, afkChannelId: "chan-1" });
    eq(r.ctx.isAfk(), false);
});

check("being alone in the server's own AFK channel hands the call back to Discord", () => {
    const r = run({ afk: true, channelId: "chan-1", afkChannelId: "chan-1" });
    eq(r.ctx.isAfk(), true);
});

check("being alone anywhere else is kept, even with the AFK switch on", () => {
    const r = run({ afk: true, channelId: "chan-2", afkChannelId: "chan-1" });
    eq(r.ctx.isAfk(), false);
});

check("a store that cannot answer counts as 'not AFK', so the call is kept", () => {
    const noChannel = run({ afk: true, channelId: null });
    eq(noChannel.ctx.isAfk(), false);
    const noGuild = run({ afk: true, channelId: "chan-1", channel: { id: "chan-1", guild_id: null } });
    eq(noGuild.ctx.isAfk(), false);
    const noAfk = run({ afk: true, channelId: "chan-1", afkChannelId: null });
    eq(noAfk.ctx.isAfk(), false);
});

check("the page is listed, keeps its switches real, and says what it does not claim", () => {
    const page = slice("    function NoBandwidthKickSettings() {", "    function FakeDeafenSettings() {");
    if (!/useSettings\("noBandwidthKick"\)/.test(page)) throw new Error("the page does not subscribe to its switch");
    if (!/switchRow\(Switch, "noBandwidthKickAfk"/.test(page)) throw new Error("the AFK switch is gone");
    if (!/offCard\(/.test(page)) throw new Error("no off card: the page cannot be turned on from itself");
    // The two claims the feature must not make: that it beats a server's own kick, or that it tells Discord anything.
    if (/server kicks|moderator|admin/i.test(page)) throw new Error("the page claims something about a server kick");
});

check("the runtime only ever replaces start(), never the manager's disconnect", () => {
    if (/replaceValue\(manager,\s*"disconnect"/.test(BODY)) throw new Error("disconnect itself was replaced");
    if (/selectVoiceChannel\(null\)/.test(BODY)) throw new Error("the runtime sends a leave of its own");
    if (!/replaceValue\(timer,\s*"start"/.test(BODY)) throw new Error("the timer's start is not the thing being wrapped");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
