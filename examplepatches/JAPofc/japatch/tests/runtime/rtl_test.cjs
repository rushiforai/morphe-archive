// Arabic, Persian and Urdu read right to left. The settings pages have to say so, and the languages that read
// left to right must be left exactly as they were: a wrong flip is worse than no flip.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const block = SOURCE.slice(SOURCE.indexOf("    const RTL_LANGUAGES ="), SOURCE.indexOf("    // Every JaPatch text goes through here"));

function rtlFor(language) {
    const ctx = { Set, settings: { language }, UI_CODES: new Set(["en", "ar", "fa", "ur", "de"]) };
    vm.createContext(ctx);
    vm.runInContext(block + "\nthis.check = uiRightToLeft; this.ui = uiLanguage;", ctx);
    return ctx.check();
}

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

check("the three shipped RTL languages are recognised", () => {
    for (const code of ["ar", "fa", "ur"]) assert.strictEqual(rtlFor(code), true, code);
});

check("left-to-right languages are not flipped", () => {
    for (const code of ["en", "de", "id", "zh-CN"]) assert.strictEqual(rtlFor(code), false, code);
});

check("a language JaPatch doesn't ship falls back to English, not to RTL", () => {
    assert.strictEqual(rtlFor("xx"), false);
});

check("every RTL language in the list ships with a language file", () => {
    const listed = [...block.match(/new Set\(\[([^\]]+)\]\)/)[1].matchAll(/"([a-z-]+)"/g)].map(m => m[1]);
    const index = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/i18n/index.txt"), "utf8").split("\n").map(s => s.trim());
    for (const code of listed) assert.ok(index.includes(code), `${code} is listed RTL but has no language file`);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
