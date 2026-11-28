// #164 and #188: people were logged out after leaving Complete Quests on. The trigger the code can control is what it
// does when Discord answers 401 or 403: before this, it waited six hours and tried the same call again, which is how a
// refusal turns into a revoked session. This test pins the decision down.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    // A 401 or 403 from a Quest call is not"), SOURCE.indexOf("    function questRetryAfter(error) {"));

function context() {
    const ctx = {
        Number, Date, Error,
        quest: {running: {id: "1"}, enrolling: true, scanTimer: 7, refetchTimer: 8},
        global: {clearTimeout: id => { ctx.cleared.push(id); }},
        cleared: [], notified: [], logged: [],
        dlog: (level, tag, text) => ctx.logged.push(text),
        notify: key => ctx.notified.push(key),
    };
    vm.createContext(ctx);
    vm.runInContext(code + "\n" +
        "this.sessionLost = questSessionLost;" +
        "this.stop = questStopForSession;" +
        "this.clear = questClearHalt;", ctx);
    return ctx;
}

let failures = 0;
function ok(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

ok("401 and 403 mean the session is not allowed to go on", () => {
    const ctx = context();
    assert.strictEqual(ctx.sessionLost({status: 401}), true);
    assert.strictEqual(ctx.sessionLost({status: 403}), true);
});

ok("a refused Quest (400) or a rate limit (429) is not that", () => {
    const ctx = context();
    assert.strictEqual(ctx.sessionLost({status: 400}), false);
    assert.strictEqual(ctx.sessionLost({status: 429}), false);
    assert.strictEqual(ctx.sessionLost(new Error("offline")), false);
    assert.strictEqual(ctx.sessionLost(null), false);
});

ok("stopping clears the timers, the running Quest and the enroll", () => {
    const ctx = context();
    ctx.stop({status: 401});
    assert.strictEqual(ctx.quest.halted.status, 401);
    assert.strictEqual(ctx.quest.running, null);
    assert.strictEqual(ctx.quest.enrolling, false);
    assert.strictEqual(ctx.quest.scanTimer, undefined);
    assert.strictEqual(ctx.quest.refetchTimer, undefined);
    assert.deepStrictEqual(ctx.cleared.sort(), [7, 8]);
});

ok("stopping says so once, in the log and to the page", () => {
    const ctx = context();
    ctx.stop({status: 403});
    assert.ok(ctx.logged.some(line => line.indexOf("403") >= 0), "the log should name the status");
    assert.ok(ctx.notified.indexOf("quests") >= 0, "the page subscribes to quests");
});

ok("clearing is what allows it to run again", () => {
    const ctx = context();
    ctx.stop({status: 401});
    assert.ok(ctx.quest.halted);
    ctx.clear();
    assert.strictEqual(ctx.quest.halted, null);
});

ok("a missing status is still treated as a halt, not ignored", () => {
    const ctx = context();
    ctx.stop({});
    assert.strictEqual(ctx.quest.halted.status, 401);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
