// Regression for the two device reports on 1.0.6:
//   A2 - the Replace text box did not close from Save/Cancel/X. It is shown with ui.showSheet but was closed with
//        ui.popModal under a different key, so nothing happened and only the swipe worked.
//   A4 - the "Also show" rows in Show names your way could not be ticked: the row's own `const on` shadowed the
//        page's `on`, and `disabled: !on` then disabled every row that was not already ticked.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

let failed = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failed++; console.log("FAIL " + name + " - " + error.message); }
}
function ok(value, what) { if (!value) throw new Error(what || "expected a truthy value"); }
function eq(actual, expected, what) {
    if (actual !== expected) throw new Error((what || "value") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

// ---------------------------------------------------------------- A2: the sheet is closed through the sheet host
check("the rules box closes through the sheet host, with the sheet's own key", () => {
    const start = SOURCE.indexOf("    function openTextRules() {");
    ok(start >= 0, "openTextRules is gone");
    const end = SOURCE.indexOf("\n    function ", start + 10);
    const body = SOURCE.slice(start, end < 0 ? SOURCE.length : end);
    ok(/showSheet\(\{key: "JaPatchTextRules"/.test(body), "it is no longer opened as a sheet");
    ok(/hideActionSheet\(sheetKey\)/.test(body), "close() does not call hideActionSheet");
    ok(/const key = "japatch-text-replace", sheetKey = "JaPatchTextRules"/.test(body),
        "sheetKey does not match the key it is opened with; hideActionSheet would miss it");
    // Save, Cancel and the X all go through done(), and done() closes.
    ok(/const apply = \(\) => \{[^}]*done\(\); \};/.test(body), "Save does not close through done()");
    ok(/return \(close\(\), done\(\)\)/.test(body) || /if \(props && typeof props\.onClose === "function"\) try \{ props\.onClose\(\); \} catch \(_\) \{\} \};/.test(body),
        "done() no longer closes");
    eq((body.match(/onPress: done\b/g) || []).length, 2, "Cancel and the X both go through done()");
});

// ------------------------------------------------- A4: every "Also show" row is tappable while the feature is on
check("the Also show rows are not disabled by their own tick state", () => {
    const start = SOURCE.indexOf('el(Group, {key:"extra", title:tr("Also show")}');
    ok(start >= 0, "the Also show group is gone");
    const end = SOURCE.indexOf('footnote("note", "Anything after the name', start);
    const body = SOURCE.slice(start, end);
    // disabled:!on is correct: it follows the feature switch, not the row's own tick.
    ok(/disabled:\s*!on,/.test(body), "the rows do not follow the feature switch");
    ok(!/const on = extra\.includes\(kind\)/.test(body), "the page's `on` is still shadowed by the row");
    ok(/const picked = extra\.includes\(kind\)/.test(body), "the tick state is not read into its own name");
    ok(/extra\.concat\(\[kind\]\)/.test(body), "a tap no longer adds the name");
    ok(/extra\.filter\(other => other !== kind\)/.test(body), "a tap no longer removes the name");
});

// ------------------------------------ A4/A5: a tap while the feature is off does not write, and the page says so
check("turning the feature off greys the rows instead of hiding the page", () => {
    const start = SOURCE.indexOf("    function ShowMeYourNameSettings() {");
    const end = SOURCE.indexOf("\n    // Text replace (", start);
    const body = SOURCE.slice(start, end);
    ok(/const on = enabled\("showMeYourName"\)/.test(body), "the feature switch is not read");
    ok(/offCard\("status", Icon, "showMeYourName"\)/.test(body), "there is no card telling you to turn it on");
    eq((body.match(/disabled:!on/g) || []).length, 2, "the order rows and the extra rows must both follow the switch");
});

// -------------------------------------- the two settings that hold a comma list keep their text on the way in
check("setSetting keeps a comma list as text", () => {
    const start = SOURCE.indexOf("    function setSetting(key, value) {");
    ok(start >= 0, "setSetting is gone");
    const end = SOURCE.indexOf("    function acceptedSetting(", start);
    const body = SOURCE.slice(start, end < 0 ? SOURCE.length : end);
    ok(/const holdsText = typeof settings\[key\] === "string";/.test(body), "the text rule is gone");
    ok(/if \(holdsText\) value = value == null \? "" : String\(value\);/.test(body), "text is not kept as text");
});

// ------------------------------------------------ the row says what a tap will do (device: "give it an X or an item")
check("a ticked name shows an X and an unticked name shows a plus", () => {
    const start = SOURCE.indexOf('el(Group, {key:"extra", title:tr("Also show")}');
    const stop = SOURCE.indexOf('"Anything after the name is drawn', start);
    const body = SOURCE.slice(start, stop > start ? stop : SOURCE.length);
    ok(/icon: picked \? rowIcon\(6573, "CircleXIcon"\) : rowIcon\(10621, "PlusLargeIcon"\)/.test(body),
        "the icon does not follow the tick state");
    ok(/footnote\("note3",/.test(body) && /A plus adds a name/.test(body), "the plus/X line is not explained on the page");
});

if (failed) { console.log(failed + " failing"); process.exit(1); }
console.log("all passed");
