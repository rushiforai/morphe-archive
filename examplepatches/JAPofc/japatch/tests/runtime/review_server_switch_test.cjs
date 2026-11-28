// Changing the ReviewDB address must sign out of the old server. A token is only good for the server it was
// issued by: carrying it over would show "Signed in as <name>" for an address nobody signed in to, and would
// hand the token to whatever host the user typed next (found on the device in 1.0.11).
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

function slice(startMarker, endMarker) {
    const start = SOURCE.indexOf(startMarker);
    if (start < 0) throw new Error("missing: " + startMarker);
    const end = SOURCE.indexOf(endMarker, start);
    if (end < 0) throw new Error("missing end: " + endMarker);
    return SOURCE.slice(start, end);
}

// The real reviewBase(), clearReviewAuth() and reviewServerChanged(), with a fake settings and save().
const base = slice("    function reviewBase() {", "    // One cache per tone");
const clear = slice("    function clearReviewAuth() {", "    // One UserStore listener");
const changed = slice("    function reviewServerChanged(next) {", "    let reviewWatchers");

function load(server) {
    let saved = 0;
    const notified = [];
    const context = {
        settings: { reviewServer: server },
        reviewToken: "token-from-old-server",
        reviewAccount: "1202014848981143597",
        reviewAuthState: "exchanging",
        reviewAuthError: "stale error",
        reviewCache: new Map([["1202014848981143597", { expires: 1 }]]),
        reviewIdentity: { base: "https://old.example/api/reviewdb", clientId: "1575626618276290642", asked: true },
        reviewAuthAttempt: 0,
        REVIEW_API_DEFAULT: "",
        save() { saved += 1; },
        notify(key) { notified.push(key); },
        typeof: value => typeof value,
        Map,
        Error,
        RegExp,
    };
    vm.createContext(context);
    vm.runInContext(
        base + "\n" + clear + "\n" + changed +
        "\nthis.api = { reviewBase, clearReviewAuth, reviewServerChanged };\n" +
        "this.state = () => ({ token: reviewToken, account: reviewAccount, state: reviewAuthState, error: reviewAuthError });",
        context);
    context.saved = () => saved;
    context.notified = notified;
    return context;
}

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, what) {
    if (actual !== expected) throw new Error((what || "") + ": expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

check("changing the address signs out of the old server", () => {
    const c = load("https://old.example/api/reviewdb");
    c.api.reviewServerChanged("https://japatch-reviewdb.fly.dev");
    eq(c.settings.reviewServer, "https://japatch-reviewdb.fly.dev", "address saved");
    eq(c.state().token, "", "token dropped");
    eq(c.state().account, null, "account dropped");
    eq(c.state().state, "idle", "not left mid sign-in");
    eq(c.state().error, "", "old error cleared");
    eq(c.reviewCache.size, 0, "cached reviews dropped");
    eq(c.saved(), 1, "the sign-out is persisted");
});

check("the server's own sign-in app is asked for again", () => {
    const c = load("https://old.example/api/reviewdb");
    c.api.reviewServerChanged("https://japatch-reviewdb.fly.dev");
    eq(c.reviewIdentity.clientId, "", "old client ID forgotten");
    eq(c.reviewIdentity.asked, false, "asked again for the new address");
});

check("clearing the address signs out too", () => {
    const c = load("https://old.example/api/reviewdb");
    c.api.reviewServerChanged("");
    eq(c.settings.reviewServer, "", "address cleared");
    eq(c.state().token, "", "token dropped");
});

check("saving the same address keeps the sign-in", () => {
    const c = load("https://japatch-reviewdb.fly.dev");
    c.api.reviewServerChanged("https://japatch-reviewdb.fly.dev/");
    eq(c.state().token, "token-from-old-server", "token kept");
    eq(c.saved(), 1, "the address is saved");
});

check("nothing signed in: the page is only told to redraw", () => {
    const c = load("https://old.example/api/reviewdb");
    c.reviewToken = ""; c.reviewAccount = null;
    c.api.reviewServerChanged("https://japatch-reviewdb.fly.dev");
    eq(c.state().token, "", "still signed out");
    eq(c.notified.filter(k => k === "reviewDB").length, 1, "redrawn once");
    eq(c.saved(), 1, "the address is saved");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
