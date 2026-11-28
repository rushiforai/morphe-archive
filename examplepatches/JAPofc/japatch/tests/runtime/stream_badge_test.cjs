// The Streaming badge feature is a reader: it shows the Go Live session Discord is already running and the progress
// Discord already counted. It cannot start a stream and it sends nothing. Every check below holds the code to that,
// because the failure mode is silent: a guessed module id, or a viewer count of our own, would show a number that
// looks like progress and is not.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const slice = (from, to) => {
    const start = SOURCE.indexOf(from);
    const end = SOURCE.indexOf(to, start + 1);
    if (start < 0 || end < 0) throw new Error(`slice not found: ${from}`);
    return SOURCE.slice(start, end);
};

let failures = 0;
function check(name, fn) {
    try { const out = fn(); if (out && typeof out.then === "function") return out.then(() => console.log("PASS " + name), error => { failures++; console.log("FAIL " + name + " - " + error.message); }); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

const body = slice("    const STREAM_BADGE_DAYS", "    function badgeProgressCard(s, on) {");

// Discord's own event sequence, taken from a real device log: a create with no viewers, an update that adds two,
// a pause and resume, then the stop.
function run(options) {
    const o = options || {};
    const listeners = new Map(), notes = [], writes = [];
    const stored = {};
    const ctx = {
        tr: (text, vars) => String(text).replace(/\{(\w+)\}/g, (_, k) => (vars && vars[k] !== undefined ? vars[k] : "{" + k + "}")),
        pl: (n, one, many) => String(n === 1 ? one : many).replace(/\{n\}/g, n),
        enabled: key => key === "streamBadge" ? o.on !== false : false,
        features: {},
        badges: { user: "111222333444555666" },
        currentUser: () => ({ id: "111222333444555666" }),
        notify: key => notes.push(key),
        global: { clearTimeout: () => {} },
        later: fn => { if (fn) fn(); return 1; },
        badgeInfo: () => o.info === undefined ? { current: 18, goal: 20, tier: "Newcomer", next: "Aficionado" } : o.info,
        files: o.files === false ? null : {
            getConstants: () => ({ DocumentsDirPath: "/docs" }),
            fileExists: () => Boolean(stored.text),
            readFile: () => stored.text || "",
            writeFile: (dir, name, text) => { stored.text = text; writes.push({ name, text }); },
        },
        Date,
        console,
    };
    vm.createContext(ctx);
    vm.runInContext(body + "\nthis.api = {streamBadgeInit, streamBadgeEvent, streamBadgeStatus, streamBadgeEstimate, streamBadgeStop, streamDayId, streamOwner, state: streamBadge};", ctx);
    const app = vm.runInContext("this", ctx);
    app.listeners = listeners;
    app.notes = notes;
    app.writes = writes;
    app.fire = (type, event) => { const fn = listeners.get(type); if (fn) fn(Object.assign({ type }, event)); };
    app.streamBadgeInit({ subscribe: (type, fn) => listeners.set(type, fn) });
    return app;
}

const KEY = "call:222333444555666777:111222333444555666";

check("it subscribes to Discord's own stream events, never to a guessed module", () => {
    const app = run();
    // These are the event names device logs show; no module id appears anywhere in the block.
    ["STREAM_CREATE", "STREAM_UPDATE", "STREAM_SERVER_UPDATE", "STREAM_SET_PAUSED", "STREAM_STOP", "STREAM_DELETE", "LOGOUT"]
        .forEach(type => assert.ok(app.listeners.has(type), "not subscribed to " + type));
    assert.ok(!/inspectedExport\(\d+/.test(body), "the block must not look up modules by number");
});

check("a stream that is not this account's is never adopted", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: "call:222333444555666777:999888777666555444", viewerIds: ["1", "2"] });
    assert.strictEqual(app.api.streamBadgeStatus().live, false);
});

check("a key that cannot be read is not adopted either", () => {
    const app = run();
    assert.strictEqual(app.api.streamOwner("garbage"), null);
    assert.strictEqual(app.api.streamOwner("call:1"), null);
    app.fire("STREAM_CREATE", { streamKey: "garbage", viewerIds: ["1"] });
    assert.strictEqual(app.api.streamBadgeStatus().live, false);
});

check("live with no viewers is live, and counts nothing", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: [] });
    app.fire("STREAM_SERVER_UPDATE", { streamKey: KEY });
    const status = app.api.streamBadgeStatus();
    assert.strictEqual(status.live, true);
    assert.strictEqual(status.viewers, 0);
    assert.strictEqual(status.counted, false);
});

check("the viewer count is Discord's own viewerIds, and it moves when they do", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: [] });
    app.fire("STREAM_SERVER_UPDATE", { streamKey: KEY });
    app.fire("STREAM_UPDATE", { streamKey: KEY, viewerIds: ["a", "b", "c"] });
    assert.strictEqual(app.api.streamBadgeStatus().viewers, 3);
    assert.strictEqual(app.api.streamBadgeStatus().counted, true);
    app.fire("STREAM_UPDATE", { streamKey: KEY, viewerIds: ["a"] });
    assert.strictEqual(app.api.streamBadgeStatus().viewers, 1);
});

check("a paused stream stops counting, and resumes when it is unpaused", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: ["a"] });
    app.fire("STREAM_SERVER_UPDATE", { streamKey: KEY });
    app.fire("STREAM_SET_PAUSED", { streamKey: KEY, paused: true, viewerIds: ["a"] });
    assert.strictEqual(app.api.streamBadgeStatus().paused, true);
    assert.strictEqual(app.api.streamBadgeStatus().counted, false);
    app.fire("STREAM_SET_PAUSED", { streamKey: KEY, paused: false, viewerIds: ["a"] });
    assert.strictEqual(app.api.streamBadgeStatus().counted, true);
});

check("a stop closes the session and writes its minutes to that day", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: ["a"] });
    // Two minutes in the past, so a whole minute has elapsed.
    app.api.state.session.startedAt = Date.now() - 125000;
    app.fire("STREAM_STOP", { streamKey: KEY });
    assert.strictEqual(app.api.streamBadgeStatus().live, false);
    return new Promise(resolve => setTimeout(resolve, 20)).then(() => {
    const day = app.api.streamDayId(Date.now());
    const written = JSON.parse(app.writes[app.writes.length - 1].text);
    assert.strictEqual(written.days[day], 2, "two minutes should land on today");
    });
});

check("another account's stop does not close this session", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: ["a"] });
    app.fire("STREAM_STOP", { streamKey: "call:222333444555666777:999888777666555444" });
    assert.strictEqual(app.api.streamBadgeStatus().live, true);
    // A stop with nothing to match on is ignored too: guessing would lose the minutes.
    app.fire("STREAM_STOP", {});
    assert.strictEqual(app.api.streamBadgeStatus().live, true);
    app.fire("STREAM_STOP", { channelId: "222333444555666777" });
    assert.strictEqual(app.api.streamBadgeStatus().live, false);
});

check("logout clears everything", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: ["a"] });
    app.fire("LOGOUT", {});
    assert.strictEqual(app.api.streamBadgeStatus().live, false);
});

check("nothing here sends a request", () => {
    // The measured behaviour: /science accepts a report and the streaming counter ignores it, so a report would only
    // add risk and noise. The block must contain no network call at all.
    assert.ok(!/questRequest|fetch\(|XMLHttpRequest|\/science/.test(body), "the streaming badge block must stay read only");
});

check("the estimate only appears once a day of streaming has happened", () => {
    const app = run({ info: { current: 18, goal: 20 } });
    const status = app.api.streamBadgeStatus();
    assert.strictEqual(status.week, 0);
    const estimate = app.api.streamBadgeEstimate(status);
    assert.strictEqual(estimate.days, null, "no history means no day estimate");
    assert.strictEqual(estimate.left, 2);
});

check("the week view answers after a stream, with the days it ran", () => {
    const app = run();
    app.fire("STREAM_CREATE", { streamKey: KEY, viewerIds: ["a"] });
    app.api.state.session.startedAt = Date.now() - 3600000;
    app.fire("STREAM_STOP", { streamKey: KEY });
    const status = app.api.streamBadgeStatus();
    assert.strictEqual(status.days.length, 7);
    assert.ok(status.week >= 59 && status.week <= 61, "an hour of streaming should be about 60 minutes, got " + status.week);
    assert.ok(status.average > 0);
    const estimate = app.api.streamBadgeEstimate(status);
    assert.ok(estimate.days >= 1, "an hour a day should give a day estimate");
});

check("the feature is marked risky and says it cannot start a stream", () => {
    const risky = slice("    const RISKY_FEATURES = {", "    // Cancelling remounts the switch");
    assert.ok(/streamBadge:\s*\(\) => tr\(/.test(risky), "streamBadge must ask before switching on");
    assert.ok(/experimental|may stop working/i.test(risky), "it has to say it is experimental");
});

check("the page never claims to start or create a stream", () => {
    const page = slice("    function StreamBadgeSettings() {", "    function BadgeSettings() {");
    assert.ok(!/start (a|the) stream|begin (a|the) stream|go live for you/i.test(page), "the page must not claim to start a stream");
    assert.ok(/cannot start one|only reads/i.test(page), "the page has to say it only reads");
});

check("the feature really is in the table the build emits (the 1.0.21 bug)", () => {
    // The patch asked for this key, but the Kotlin list that becomes the features map never carried it, so the row and
    // its page were silently dropped. Both ends are checked here so a future key cannot repeat it.
    const kt = fs.readFileSync(path.join(ROOT, "patches/src/main/kotlin/app/japatch/patches/DiscordPatches.kt"), "utf8");
    const from = kt.indexOf('listOf("noTyping"');
    const to = kt.indexOf(".joinToString", from);
    assert.ok(to > from, "the runtime feature list is not where the build expects it");
    assert.ok(/\"streamBadge\"/.test(kt.slice(from, to)), "streamBadge must be in the runtime feature list");
    assert.ok(/streamBadge:\s*\[18964/.test(SOURCE), "streamBadge must have an icon, or the feature counter skips it");
});

setTimeout(() => {
    if (failures) { console.log(failures + " failing"); process.exit(1); }
    console.log("all passed");
}, 100);
