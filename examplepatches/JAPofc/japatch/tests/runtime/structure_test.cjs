// bootstrap.js is one file by design (the injector ships it as bytecode), but it must not rot: a single file is
// fine, a single file that grows without anyone noticing is not. This fails when it outgrows its budget or when
// one function swallows the file, so a change that adds 800 lines to one function gets looked at before merging.
const fs = require("fs");
const path = require("path");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const lines = SOURCE.split("\n");

const LINE_BUDGET = 26000;   // 24,573 when this was written
const FUNCTION_BUDGET = 460; // the largest one (translateForget) is 423

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

check("bootstrap.js stays inside its line budget", () => {
    assert.ok(lines.length <= LINE_BUDGET, `${lines.length} lines, budget ${LINE_BUDGET}: split a section out`);
});

check("no single function takes over the file", () => {
    const starts = [];
    lines.forEach((line, i) => { const m = /^    function (\w+)/.exec(line); if (m) starts.push([m[1], i]); });
    let worst = { name: "", size: 0 };
    starts.forEach(([name, at], i) => {
        const end = i + 1 < starts.length ? starts[i + 1][1] : lines.length;
        const size = end - at;
        if (size > worst.size) worst = { name, size };
    });
    assert.ok(worst.size <= FUNCTION_BUDGET, `${worst.name} is ${worst.size} lines, budget ${FUNCTION_BUDGET}`);
    console.log("     largest: " + worst.name + " (" + worst.size + " lines)");
});

check("the two build placeholders are still there, exactly once", () => {
    const count = text => SOURCE.split(text).length - 1;
    assert.strictEqual(count("/*__FEATURES__*/"), 1, "features placeholder");
    // A string, not a comment, and never bare: the build swaps the whole JSON.parse(...) call before printing, so
    // the runtime never sees the marker and the minifier escapes the notes itself.
    assert.strictEqual(count('JSON.parse("__JAPATCH_RELEASE_NOTES__")'), 1, "release notes placeholder");
});

check("no build artifact or editor temporary file is committed", () => {
    const walk = dir => fs.readdirSync(dir, { withFileTypes: true }).flatMap(entry => {
        if (entry.name === ".git" || entry.name === "build" || entry.name === "work") return [];
        const full = path.join(dir, entry.name);
        return entry.isDirectory() ? walk(full) : [entry.name];
    });
    const files = walk(ROOT);
    const junk = files.filter(name => /\.(orig|rej|swp|tmp)$/.test(name) || name.endsWith("~"));
    assert.deepStrictEqual(junk, [], "stray files: " + junk.join(", "));
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
