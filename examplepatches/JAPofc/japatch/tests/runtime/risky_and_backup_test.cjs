// Two things that can cost a user something real: switching on a feature Discord can punish, and restoring a
// backup over settings that were working. Both are pure logic, so both can be checked without a phone.
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

// --- the features that ask before they switch on -------------------------------------------------------------
const risky = slice("    const RISKY_FEATURES = {", "    // Cancelling remounts the switch");

function riskyKeys() {
    const ctx = { tr: text => text };
    vm.createContext(ctx);
    vm.runInContext(risky + "\nthis.keys = Object.keys(RISKY_FEATURES); this.get = k => RISKY_FEATURES[k];", ctx);
    return ctx;
}

check("every feature that can get an account actioned asks first", () => {
    // badges: fake playtime. quests: finishing Quests from a phone, and the sign-in risk when Discord refuses.
    // platformSpoof: claiming a platform the account isn't on. streamBadge: a report Discord does not expect from a
    // phone, sent against a live session, and accounts have been actioned for automating badge progress.
    assert.deepStrictEqual([...riskyKeys().keys].sort(), ["badges", "platformSpoof", "quests", "streamBadge"]);
});

check("each warning says what could happen, in one sentence", () => {
    const ctx = riskyKeys();
    for (const key of ctx.keys) {
        const text = ctx.get(key)();
        assert.ok(text.length > 40, `${key}: warning too short to mean anything`);
        assert.ok(/risk|suspend|banned|actioned|sign you out|Terms/i.test(text), `${key}: says nothing about the consequence`);
    }
});

check("quests warning mentions being signed out, which is what actually happened", () => {
    assert.ok(/sign you out/i.test(riskyKeys().get("quests")()));
});

// --- the backup diff ----------------------------------------------------------------------------------------
const diff = slice("    function backupChanges(parsed) {", "\n    function backupConfirm(text) {");

function changeList(settingsOn, values, available) {
    const rows = Object.keys(available).map(key => ({ key, title: key }));
    const ctx = {
        FEATURE_ICONS: available, features: Object.fromEntries(Object.keys(available).map(k => [k, true])),
        settings: Object.fromEntries(Object.keys(available).map(k => [k, !!settingsOn.includes(k)])),
        featureSearch: { rows }, owns: (object, key) => Object.prototype.hasOwnProperty.call(object, key),
    };
    vm.createContext(ctx);
    vm.runInContext(diff + "\nthis.list = backupChanges;", ctx);
    return [...ctx.list({ values })];
}

check("a backup that changes nothing lists nothing", () => {
    assert.deepStrictEqual(changeList([], {}, {}), []);
    assert.deepStrictEqual(changeList(["a"], { a: true }, { a: 1 }), []);
});

check("switched on and switched off are told apart", () => {
    // a: off now, on in the backup. b: on now, off in the backup. c: never mentioned either way.
    const list = changeList(["b"], { a: true, b: false }, { a: 1, b: 1, c: 1 });
    assert.deepStrictEqual(list, ["a", "-b"]);
});

check("a feature the backup does not mention goes off, and says so", () => {
    const list = changeList(["gone"], { other: true }, { gone: 1, other: 1 });
    assert.deepStrictEqual(list, ["other", "-gone"]);
});

check("features that were never patched in are ignored", () => {
    assert.deepStrictEqual(changeList([], { missing: true }, {}), []);
});

check("the list is ordered, so the same backup always reads the same way", () => {
    const list = changeList([], { z: true, a: true, m: true }, { z: 1, a: 1, m: 1 });
    assert.deepStrictEqual(list, ["a", "m", "z"]);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
