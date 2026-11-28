// The Account and session page reports what JaPatch is holding for the signed-in account. It is read-only and the
// logic is small, but every number on it is a claim about the user's own account: a page that says "2 saved, 2 with
// a token" while one account has none is worse than no page at all.
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

const body = slice("    function accountStatus() {", "    function AccountStatusSettings() {");

// A phone-sized fake: one signed-in account, a saved list, a token per account, an auth store and a running Quest.
function run(options) {
    const o = options || {};
    const ctx = {
        tr: (text, vars) => String(text).replace(/\{(\w+)\}/g, (_, k) => (vars && vars[k] !== undefined ? vars[k] : "{" + k + "}")),
        currentUser: () => o.me === undefined ? { id: "111", username: "someone" } : o.me,
        // tokens: undefined = every account has one; a function or an object answers per account.
        global: { __r: id => id === 1113 ? { getToken: account => o.tokens === undefined ? "t"
            : typeof o.tokens === "function" ? o.tokens(account) : o.tokens[account] } : undefined },
        inspectedExport: (id) => id === 502 ? { getId: () => (o.session === undefined ? (o.me === undefined ? "111" : o.me && o.me.id) : o.session) } : undefined,
        accountSwitcherStore: () => ({ getState: () => ({ users: o.saved || [] }) }),
        aboutText: () => o.about || "Your settings are saved on this phone.\nmore",
        status: { storage: o.storage || "ready", archive: o.archive || "" },
        enabled: key => key === "quests" ? !!o.quests : true,
        quest: o.quest || { running: null, error: "", user: null },
    };
    vm.createContext(ctx);
    vm.runInContext(body + "\nthis.result = accountStatus();", ctx);
    return ctx.result;
}

const row = (result, label) => result.rows.find(r => r.label === label);

check("a signed-in account is named, not shown as an id", () => {
    const r = run({ me: { id: "111", username: "someone", global_name: "Some One" } });
    assert.strictEqual(row(r, "Signed in as").value, "Some One");
});

check("no sign-in says so instead of leaving the row out", () => {
    const r = run({ me: null, session: null });
    assert.strictEqual(row(r, "Signed in as").value, "Not signed in");
    assert.strictEqual(row(r, "Signed in as").state, "note");
});

check("saved accounts are counted apart from the ones that still have a token", () => {
    // The bug this page exists for: an account listed with no token fails to switch and says nothing.
    const r = run({ saved: [{ id: "111" }, { id: "222" }, { id: "333" }], tokens: id => id === "111" ? "t" : null });
    assert.strictEqual(row(r, "Saved accounts").value, "3 saved, 1 with a token");
    assert.strictEqual(row(r, "Saved accounts").state, "note", "a missing token must not read as healthy");
});

check("every saved account with a token reads as healthy", () => {
    const r = run({ saved: [{ id: "111" }, { id: "222" }] });
    assert.strictEqual(row(r, "Saved accounts").value, "2 saved, 2 with a token");
    assert.strictEqual(row(r, "Saved accounts").state, "ok");
});

check("one account only says one account, not '1 saved'", () => {
    const r = run({ saved: [] });
    assert.strictEqual(row(r, "Saved accounts").value, "Only the signed-in account");
});

check("a session belonging to another account is called out", () => {
    // Discord answers the gateway with the account the connection belongs to; a mismatch is how a switch goes wrong.
    const r = run({ me: { id: "111", username: "a" }, session: "999" });
    assert.strictEqual(row(r, "Session").value, "Connected as another account");
    assert.strictEqual(row(r, "Session").state, "note");
});

check("no session at all is not reported as connected", () => {
    const r = run({ me: { id: "111", username: "a" }, session: null });
    assert.strictEqual(row(r, "Session").value, "Not connected");
});

check("the stored settings line is the same sentence the About page uses", () => {
    const r = run({ about: "Your settings are saved on this phone.\nsecond line" });
    assert.strictEqual(row(r, "Settings on this phone").value, "Your settings are saved on this phone.");
});

check("a running Quest names the account it is running on", () => {
    const r = run({ quests: true, quest: { running: { id: "q" }, error: "", user: "222" } });
    assert.strictEqual(row(r, "Complete Quests").value, "Running on 222");
});

check("a stopped Quest shows the reason that stopped it", () => {
    const r = run({ quests: true, quest: { running: null, error: "Not allowed", user: "111" } });
    assert.strictEqual(row(r, "Complete Quests").value, "Stopped: Not allowed");
    assert.strictEqual(row(r, "Complete Quests").state, "note");
});

check("the page never reads or prints a token", () => {
    // getToken is asked whether a token exists, per account, and nothing else. A raw token in the page would be a
    // token on a screenshot.
    const calls = [];
    const r = run({ saved: [{ id: "111" }], tokens: id => { calls.push(id); return "SECRET-TOKEN-VALUE"; } });
    assert.ok(!JSON.stringify(r).includes("SECRET-TOKEN-VALUE"), "a token reached the page");
    assert.deepStrictEqual(calls, ["111"], "getToken should be asked once per saved account, for existence only");
});

check("the page is reachable from About and opens inside the app", () => {
    const route = slice('        next.JAPATCH_STATUS = {', "        const links = [];");
    assert.ok(/type: "route"/.test(route), "JAPATCH_STATUS should open a page");
    assert.ok(/getComponent: \(\) => AccountStatusSettings/.test(route));
    const about = slice('route("JAPATCH_GENERAL", "About"', "undefined,");
    assert.ok(about.includes('"JAPATCH_STATUS"'), "About must list the page");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
