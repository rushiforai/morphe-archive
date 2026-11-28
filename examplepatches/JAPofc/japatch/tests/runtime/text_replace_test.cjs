// Text replace (#191, TextReplace part): rules are "from => to", one per line, and only what you send is touched.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

const start = SOURCE.indexOf("    const REPLACE_RULES_MAX");
const end = SOURCE.indexOf("    // A small live preview of a rule");
if (start < 0 || end < start) throw new Error("the text replace block is missing from bootstrap.js");

const settings = {textReplaceRules: ""};
const context = {settings, enabled: () => true, RegExp, Error, console, pl: (n, one, many) => many};
vm.createContext(context);
vm.runInContext(SOURCE.slice(start, end) + "\nthis.api = {applyReplace, replaceRules};", context);
const api = context.api;

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}
function rules(text) { settings.textReplaceRules = text; return api.replaceRules(); }

check("a rule rewrites the word, keeping the wording around it", () => {
    eq(api.applyReplace("brb, gtg soon", rules("brb => be right back\ngtg =>")), "be right back,  soon");
});

check("whole words only: brb2 is not brb", () => {
    eq(api.applyReplace("brb2 stays", rules("brb => be right back")), "brb2 stays");
});

check("an empty right side deletes the word", () => {
    eq(api.applyReplace("omw home", rules("omw =>")), " home");
});

check("case is left alone, so BRB is not matched by brb", () => {
    eq(api.applyReplace("BRB", rules("brb => be right back")), "BRB");
});

check("regex characters in a rule match literally", () => {
    eq(api.applyReplace("a.b and axb", rules("a.b => X")), "X and axb");
});

check("a line without => is ignored", () => {
    eq(rules("nonsense line\nbrb => be right back").length, 1);
});

check("no rules leaves the text untouched", () => {
    settings.textReplaceRules = "";
    eq(api.applyReplace("brb", []), "brb");
});

check("the sent message is what gets replaced", () => {
    settings.textReplaceRules = "brb => be right back";
    vm.runInContext("this.textReplace = textReplace;", context);
    let sent = null;
    // orig is Discord's own sendMessage(channelId, message); the hook passes (orig, self, args).
    const orig = function (channelId, message) { sent = message; return "ok"; };
    context.textReplace(orig, null, ["123", {content: "brb there"}, undefined]);
    eq(sent && sent.content, "be right back there", "content");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
