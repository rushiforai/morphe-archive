// The ReviewDB address field, which used to save whatever was typed and fail later with nothing to act on.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    const REVIEW_HOST_RE"), SOURCE.indexOf("    // One cache per tone"));

function check(value) {
    const context = {RegExp, String};
    vm.createContext(context);
    vm.runInContext(code + "\nthis.check = reviewAddressCheck;", context);
    return context.check(value);
}

let failures = 0;
function ok(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

ok("the address JaPatch ships with is accepted", () => {
    const r = check("https://japatch-reviewdb.fly.dev");
    assert.strictEqual(r.ok, true);
    assert.strictEqual(r.value, "https://japatch-reviewdb.fly.dev");
});

ok("an empty field means Reviews off, not an error", () => {
    assert.deepStrictEqual(check("").ok, true);
    assert.strictEqual(check("").off, true);
    assert.strictEqual(check("   ").off, true);
});

ok("a trailing slash is trimmed, so saving the same server keeps the sign-in", () => {
    assert.strictEqual(check("https://example.com/").value, "https://example.com");
    assert.strictEqual(check("https://example.com/api/reviewdb///").value, "https://example.com/api/reviewdb");
});

ok("no scheme is refused with a sentence that says what to type", () => {
    const r = check("example.com");
    assert.strictEqual(r.ok, false);
    assert.match(r.why, /https:\/\//);
});

ok("a typo in the scheme is refused", () => {
    assert.strictEqual(check("hhtps://example.com").ok, false);
    assert.strictEqual(check("ftp://example.com").ok, false);
});

ok("a pasted note with spaces is refused", () => {
    assert.strictEqual(check("https://example.com my server").ok, false);
});

ok("an @ in the authority is refused", () => {
    assert.strictEqual(check("https://user@example.com").ok, false);
});

ok("plain http is allowed on your own network only", () => {
    assert.strictEqual(check("http://192.168.1.5:8080").ok, true);
    assert.strictEqual(check("http://localhost:3000").ok, true);
    assert.strictEqual(check("http://example.com").ok, false);
});

ok("a port and a path survive", () => {
    assert.strictEqual(check("https://example.com:8443/api/reviewdb").value, "https://example.com:8443/api/reviewdb");
});

ok("something that is not a host name is refused", () => {
    assert.strictEqual(check("https://notahost").ok, false);
    assert.strictEqual(check("https://has space.com").ok, false);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
