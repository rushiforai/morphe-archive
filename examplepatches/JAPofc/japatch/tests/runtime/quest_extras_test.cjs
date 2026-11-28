// The two Quests extras, and the promise underneath each.
//
// Auto claim: it may only ever claim a reward Discord itself marked finished, never one it has to finish first, and a
// refused claim (a captcha) has to stay refused instead of turning into a loop.
//
// Fast heartbeat: it must not be able to claim it finishes a Quest sooner. Discord counts the time on its own clock and
// each answer carries the total, so the only thing a shorter interval changes is how often the phone asks. The checks
// below pin both down from the code, because the failure mode is silent: a claim loop looks like "it works", and a
// fast mode that does nothing looks like a fast mode.
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
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

// The profile block is the run of const lines from the home constant to the quest state; take its QUEST_ ones plus
// the fast interval and the one-line function that picks between them.
const profile = slice("    const QUEST_HOME_MOBILE = 12;", "    function questSleep(ms)");
// Take whole lines by name: QUEST_HEARTBEAT_MS shares its line with the video constants, and the desktop profile
// spans lines with a trailing "+", so picking lines is safer than picking declarations.
const constants = [...new Set(["QUEST_HOME_MOBILE", "QUEST_HEARTBEAT_MS", "QUEST_HEARTBEAT_TAIL_MS", "QUEST_STALLED_BEATS", "QUEST_FAST_MS"]
    .map(name => {
        const line = profile.split("\n").find(candidate => new RegExp("\\b" + name + " =").test(candidate));
        if (!line) throw new Error(name + " not found");
        if (/\+$/.test(line.trim())) throw new Error(name + " sits in a wrapped declaration");
        return line;
    }))].join("\n");
const beat = profile.split("\n").filter(line => /^    function questBeatMs/.test(line)).join("\n");
if (!/QUEST_HEARTBEAT_MS/.test(constants) || !/QUEST_FAST_MS/.test(constants) || !beat) throw new Error("interval constants not found");
const body = constants + "\n" + beat + "\n" + slice("    function questRewardsRefresh", "    function questsScan() {");

function run(options) {
    const o = options || {};
    const calls = [];
    const ctx = {
        tr: (text, vars) => String(text).replace(/\{(\w+)\}/g, (_, k) => (vars && vars[k] !== undefined ? vars[k] : "{" + k + "}")),
        pl: (n, one, many) => String(n === 1 ? one : many).replace(/\{n\}/g, n),
        enabled: key => key === "quests" ? o.on !== false : false,
        settings: Object.assign({ questAutoClaim: true, questsFastBeat: false }, o.settings || {}),
        quest: { user: "111", rewards: [], claimed: new Map(), claiming: false, error: "", last: "", executables: new Map(), skip: new Map(),
            completed: 0, generation: 0, videoAt: new Map() },
        questStore: () => o.store === undefined ? fakeStore([]) : (typeof o.store === "function" ? o.store() : o.store),
        questName: item => (item && item.nameHint) || "Quest",
        questDispatch: () => {},
        questStatus: () => {},
        notify: () => {},
        haptic: () => {},
        questRequest: (url, payload) => { calls.push({ url, payload }); return o.reply ? o.reply(url, payload) : Promise.resolve({ body: {} }); },
        QUEST_HOME_MOBILE: 12,
        console,
    };
    vm.createContext(ctx);
    vm.runInContext(body + "\nthis.api = {questRewardsRefresh, questClaim, questClaimAll, questBeatMs, QUEST_FAST_MS, QUEST_HEARTBEAT_MS, quest: this.quest};", ctx);
    const app = vm.runInContext("this", ctx);
    app.calls = calls;
    return app;
}

function fakeStore(items) {
    return { quests: new Map(items.map(item => [item.id, item])) };
}

check("rewards waiting are read from Discord's own list", () => {
    const app = run({ store: fakeStore([
        { id: "a", userStatus: { completedAt: "2026-11-01T00:00:00Z" } },
        { id: "b", userStatus: { completedAt: "2026-11-01T00:00:00Z", claimedAt: "2026-11-02T00:00:00Z" } },
        { id: "c", userStatus: { enrolledAt: "2026-11-01T00:00:00Z" } },
    ]) });
    const waiting = app.api.questRewardsRefresh();
    // The store is built inside the sandbox realm, so copy ids out before comparing.
    assert.deepStrictEqual(Array.from(waiting).map(entry => entry.id), ["a"], "only finished and unclaimed");
});

check("a quest that is not finished is never claimed", () => {
    const app = run({ store: fakeStore([{ id: "c", userStatus: { enrolledAt: "2026-11-01T00:00:00Z" } }]) });
    app.api.questClaimAll();
    assert.strictEqual(app.calls.length, 0, "claimed something Discord had not finished");
});

check("claiming uses Discord's own claim call for that quest", () => {
    const app = run({ store: fakeStore([{ id: "a", userStatus: { completedAt: "2026-11-01T00:00:00Z" } }]) });
    app.api.questClaimAll();
    assert.strictEqual(app.calls.length, 1);
    assert.strictEqual(app.calls[0].url, "/quests/a/claim-reward");
    assert.strictEqual(app.calls[0].payload.location, 12, "the claim has to say where it came from, like Discord's own");
});

check("a refused claim is left alone, not retried", () => {
    // A captcha is Discord asking a human. Retrying it is a loop against a challenge.
    let attempts = 0;
    const app = run({ store: fakeStore([{ id: "a", userStatus: { completedAt: "2026-11-01T00:00:00Z" } }]),
        reply: () => { attempts++; const error = new Error("HTTP 403"); error.status = 403; return Promise.reject(error); } });
    const first = app.api.questClaim("a");
    return first.then(() => {
        assert.strictEqual(attempts, 1);
        app.api.questClaimAll();
        assert.strictEqual(attempts, 1, "a refused claim was retried");
    });
});

check("the switch off means nothing is claimed at all", () => {
    const app = run({ settings: { questAutoClaim: false }, store: fakeStore([{ id: "a", userStatus: { completedAt: "2026-11-01T00:00:00Z" } }]) });
    app.api.questClaimAll();
    assert.strictEqual(app.calls.length, 0, "claimed with the switch off");
});

check("the claim switch is off by default", () => {
    // Both risk switches ship off. A feature that claims by itself on first run would be a surprise nobody asked for.
    assert.ok(/questAutoClaim: false/.test(SOURCE), "questAutoClaim must default to false");
    assert.ok(/questsFastBeat: false/.test(SOURCE), "questsFastBeat must default to false");
});

check("fast mode only changes the gap between beats", () => {
    const normal = run({ settings: { questsFastBeat: false } });
    const fast = run({ settings: { questsFastBeat: true } });
    assert.strictEqual(normal.api.questBeatMs(), 60000, "normal is Discord's own one a minute");
    assert.ok(fast.api.questBeatMs() < normal.api.questBeatMs(), "fast has to be sooner");
    // Both modes send the same request to the same place: nothing about the progress reported changes.
    assert.ok(/questHeartbeat\(entry, desktop\)/.test(SOURCE), "both modes go through the same heartbeat");
    // Whatever the interval, the request a beat sends is the one function's output, so the only thing that varies is
    // the gap between calls. If the body ever started carrying elapsed time, this is where that would show up.
    const heartbeat = slice("    async function questHeartbeat(entry, desktop) {", "    // Desktop's pace (QuestProgressManager");
    assert.ok(!/questBeatMs|QUESTS?_FAST/.test(heartbeat), "the heartbeat must not depend on the interval");
});

check("the warning says fast mode finishes nothing sooner", () => {
    // The panel is the only place a person is told, so this is what they read before turning it on.
    const panel = slice("    const QUEST_RISK = {", "    function riskRow(ui, feature");
    assert.ok(/finish no sooner|finishes a Quest no sooner/i.test(panel), "the panel has to say it does not finish sooner");
    assert.ok(/own clock|cannot shorten/i.test(panel), "and why");
});

check("both switches ask three times before they turn on", () => {
    const panel = slice("    function QuestRiskPanel(props) {", "    function StreamBadgeSettings() {");
    const ticks = panel.match(/check\(\d,/g) || [];
    assert.strictEqual(ticks.length, 3, "expected three things to tick, found " + ticks.length);
    assert.ok(/setStep\(1\)/.test(panel), "there has to be a second step");
    assert.ok(/fold\(word\) === fold/.test(panel), "the second step is the word");
    assert.ok(/setSetting\(props\.feature, true\)/.test(panel), "the switch is only set at the end");
    // A single tap must never do it.
    const row = slice("    function riskRow(ui, feature", "    function QuestRiskPanel(props) {");
    assert.ok(!/setSetting\(feature, true\)/.test(row), "the row must not turn it on directly");
    assert.ok(/questRiskAsk\(feature\)/.test(row), "the row has to open the warning instead");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
