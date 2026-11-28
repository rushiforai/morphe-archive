// The update check on the About page. Its whole job is one comparison, and comparing "1.0.9" with "1.0.14" as text
// gives the wrong answer, which is the bug this test exists for.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    function compareVersions"), SOURCE.indexOf("    // A release can be newer without being installable here"));

function compare(a, b) {
    const context = {};
    vm.createContext(context);
    vm.runInContext(code + "\nthis.compare = compareVersions;", context);
    return context.compare(a, b);
}

let failures = 0;
function ok(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

ok("1.0.9 is older than 1.0.14, which text comparison gets wrong", () => {
    assert.strictEqual(compare("1.0.9", "1.0.14"), -1);
    assert.ok("1.0.9" > "1.0.14", "the string comparison really is wrong here");
});

ok("the same version is equal, with or without a v", () => {
    assert.strictEqual(compare("1.0.14", "1.0.14"), 0);
    assert.strictEqual(compare("v1.0.14", "1.0.14"), 0);
});

ok("a newer major or minor is newer", () => {
    assert.strictEqual(compare("1.0.14", "1.1.0"), -1);
    assert.strictEqual(compare("1.0.14", "2.0.0"), -1);
});

ok("an older version is older", () => {
    assert.strictEqual(compare("1.0.14", "1.0.13"), 1);
    assert.strictEqual(compare("1.0.14", "0.9.99"), 1);
});

ok("a missing part counts as zero", () => {
    assert.strictEqual(compare("1.0", "1.0.0"), 0);
    assert.strictEqual(compare("1.0", "1.0.1"), -1);
});

ok("junk does not throw", () => {
    assert.strictEqual(compare("", "1.0.0"), -1);
    assert.strictEqual(compare("x.y.z", "0.0.0"), 0);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
