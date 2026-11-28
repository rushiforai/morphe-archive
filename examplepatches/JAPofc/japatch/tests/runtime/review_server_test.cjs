// Checks the configurable ReviewDB server without a phone: slices the real functions out of
// patches/src/main/resources/japatch/bootstrap.js and runs them against a fake `settings`.
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

// reviewBase(), reviewClientId() and the defaults they read.
const serverCode = slice("    const REVIEW_API_DEFAULT = \"\";", "    // One cache per tone");

// authorizationUrl(): the only path that turns Discord's redirect into our /auth request.
const authCode = slice("    function authorizationUrl(result) {", "    async function reviewJson(");

// The real `enabled()` gate.
const enabledCode = slice("    const enabled = key => {", "    // The font Discord started with");

function load(settings, features) {
    const context = {
        settings,
        features,
        featureTable: Object.create(null),
        featureFor: key => (/^pi[A-Z]/.test(key) ? "platformIndicators" : key),
        owns: (object, key) => Object.prototype.hasOwnProperty.call(object, key),
        decodeURIComponent,
        RegExp,
        Error,
        console,
        global: {},
    };
    vm.createContext(context);
    vm.runInContext(
        enabledCode + "\n" + serverCode + "\n" + authCode +
        "\nthis.api = { reviewBase, reviewClientId, enabled, authorizationUrl };",
        context);
    return context.api;
}

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}
function throws(fn, label) {
    try { fn(); } catch (_) { return; }
    throw new Error((label || "call") + " should have thrown");
}

const features = { reviewDB: true };

check("no server: the base is empty", () => {
    const api = load({ reviewDB: true, reviewServer: "" }, features);
    eq(api.reviewBase(), "");
});

check("no server: the switch alone cannot turn Reviews on", () => {
    const api = load({ reviewDB: true, reviewServer: "" }, features);
    eq(api.enabled("reviewDB"), false);
});

check("a server turns Reviews back on", () => {
    const api = load({ reviewDB: true, reviewServer: "https://r.example/api/reviewdb" }, features);
    eq(api.enabled("reviewDB"), true);
});

check("trailing slash and spaces are trimmed", () => {
    const api = load({ reviewDB: true, reviewServer: "  https://r.example/api/reviewdb/  " }, features);
    eq(api.reviewBase(), "https://r.example/api/reviewdb");
});

check("a bare URL keeps the community client ID", () => {
    const api = load({ reviewDB: true, reviewServer: "https://r.example/api/reviewdb" }, features);
    eq(api.reviewClientId(), "915703782174752809");
    eq(api.reviewBase(), "https://r.example/api/reviewdb");
});

check("clientId@url sets both", () => {
    const api = load({ reviewDB: true, reviewServer: "123456789012345678@https://mine.example/api/reviewdb" }, features);
    eq(api.reviewClientId(), "123456789012345678");
    eq(api.reviewBase(), "https://mine.example/api/reviewdb");
});

check("the redirect is accepted on the configured server", () => {
    const api = load({ reviewDB: true, reviewServer: "https://mine.example/api/reviewdb" }, features);
    const url = api.authorizationUrl("https://mine.example/api/reviewdb/auth?code=abc123&state=x");
    eq(url, "https://mine.example/api/reviewdb/auth?code=abc123&returnType=json&clientMod=vendetta");
});

check("the redirect is refused on any other host", () => {
    const api = load({ reviewDB: true, reviewServer: "https://mine.example/api/reviewdb" }, features);
    throws(() => api.authorizationUrl("https://manti.vendicated.dev/api/reviewdb/auth?code=abc123"), "foreign host");
    throws(() => api.authorizationUrl("https://mine.example.evil/api/reviewdb/auth?code=abc123"), "lookalike host");
    throws(() => api.authorizationUrl("https://mine.example/other/auth?code=abc123"), "wrong path");
});

check("no server: any redirect is refused", () => {
    const api = load({ reviewDB: true, reviewServer: "" }, features);
    throws(() => api.authorizationUrl("https://manti.vendicated.dev/api/reviewdb/auth?code=abc123"), "no server set");
});

check("Cancel on the authorize screen is not an error", () => {
    const api = load({ reviewDB: true, reviewServer: "https://mine.example/api/reviewdb" }, features);
    eq(api.authorizationUrl("https://mine.example/api/reviewdb/auth?error=access_denied"), null);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
