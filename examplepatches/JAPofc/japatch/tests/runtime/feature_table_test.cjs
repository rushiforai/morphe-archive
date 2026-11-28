// The two bugs the device found in 1.0.4's own pages (#197, #191 and the Reviews switch).
//
// 1. Export chats was patched in and listed, but never added to FEATURE_ICONS, so the Features list and its
//    "N of M turned on" counter skipped it: turning it on still said "0 of 73".
// 2. A page's switch is drawn by switchRow(), which reads settings[key] and writes setSetting(key, value).
//    The Reviews page passed a key the settings table does not change for: reviewWarning is a reviewDB
//    sub-option, and setSetting() refuses a sub-option while its owner is off, so the list switch looked
//    dead while the master switch on Features worked.
// 3. The server editor was drawn inside pushModal with Discord's ActionSheet/Header/Close. Discord's modal host
//    mounts it in a different tree, and it crashed with "Cannot read property 'transitionState' of null".
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const KOTLIN = fs.readFileSync(path.join(ROOT, "patches/src/main/kotlin/app/japatch/patches/DiscordPatches.kt"), "utf8");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

// --- the feature table: every patched-in feature must be countable ---
function featureIconsKeys() {
    const start = SOURCE.indexOf("FEATURE_ICONS = {") + "FEATURE_ICONS = ".length;
    let depth = 0, end = start;
    for (let i = start; i < SOURCE.length; i++) {
        if (SOURCE[i] === "{") depth++;
        else if (SOURCE[i] === "}" && --depth === 0) { end = i + 1; break; }
    }
    const block = SOURCE.slice(start, end);
    return Array.from(block.matchAll(/([A-Za-z0-9_]+)\s*:\s*\[/g)).map(m => m[1]);
}
function kotlinFeatureKeys() {
    const kt = fs.readFileSync(path.join(ROOT, "patches/src/main/kotlin/app/japatch/patches/DiscordPatches.kt"), "utf8");
    // The selection list ends where the next Kotlin call starts, so slice to the closing parenthesis of listOf.
    const from = kt.indexOf('listOf("noTyping"');
    let depth = 0, end = from;
    for (let i = kt.indexOf("(", from); i < kt.length; i++) {
        if (kt[i] === "(") depth++;
        else if (kt[i] === ")" && --depth === 0) { end = i; break; }
    }
    return Array.from(kt.slice(from, end).matchAll(/"([A-Za-z0-9_]+)"/g)).map(m => m[1]);
}

check("every feature patched in can be counted and listed (chatExport was missing)", () => {
    const icons = featureIconsKeys(), patched = kotlinFeatureKeys();
    const missing = patched.filter(key => !icons.includes(key));
    eq(missing.join(","), "", "features in the bundle but not in FEATURE_ICONS:");
});

// The direction nobody checked until 1.0.27: a feature with a page and an icon that the Kotlin side never
// selects. withOptions() returns on an unknown feature, so the row is never drawn and the section that held
// it disappears; selectModules() never marks its module, so the case in switchModule() is unreachable and the
// hook never runs. Bookmarks, Save pictures, Server time and Nicknames sat like that for several releases and
// nothing failed: the count said "77 of 81" and no test compared the two lists both ways.
function uiRowKeys() {
    return Array.from(SOURCE.matchAll(/(?:toggle|withOptions)\(\s*"[a-z]+"\s*,\s*"([A-Za-z0-9_]+)"/g)).map(m => m[1]);
}
check("every feature with a row and an icon is selected in DiscordPatches.kt", () => {
    // The listOf(...) covers most of them; five older features get their own `XSelected` flag in the same
    // file, and those flags are just as much a compile-in. Both count.
    const icons = featureIconsKeys(), patched = kotlinFeatureKeys();
    const flags = Array.from(new Set(Array.from(KOTLIN.matchAll(/\b([A-Za-z0-9_]+)Selected\b/g)).map(m => m[1][0].toLowerCase() + m[1].slice(1))));
    const all = new Set([...patched, ...flags]);
    const lost = icons.filter(key => !all.has(key));
    eq(lost.join(","), "", "features with a row and an icon but no selection:");
});
check("every case in the module switch can actually be reached", () => {
    // a case runs only when targetModules[id] is 1, and that happens from selectModules([...]) or from a
    // direct targetModules[id] = 1. A case nobody selects never runs and its feature silently does nothing.
    const cases = Array.from(SOURCE.matchAll(/^\s+case (\d+):/gm)).map(m => m[1]);
    const selected = new Set();
    for (const m of SOURCE.matchAll(/selectModules\(\[([0-9,\s]+)\]\)/g))
        for (const id of m[1].split(",")) if (id.trim()) selected.add(id.trim());
    for (const m of SOURCE.matchAll(/targetModules\[(\d+)\]\s*=\s*1/g)) selected.add(m[1]);
    const unreachable = cases.filter(id => !selected.has(id));
    eq(unreachable.join(","), "", "cases whose module is never selected:");
});

check("every selectModules line is gated by a feature that exists", () => {
    // The other half of the same bug: a line naming a feature key that was renamed or removed selects
    // nothing, forever, without an error.
    const icons = featureIconsKeys();
    const gated = Array.from(SOURCE.matchAll(/if \(features\.([A-Za-z0-9_]+)\)[^{;]*selectModules\(/g)).map(m => m[1]);
    const unknown = gated.filter(key => !icons.includes(key));
    eq(unknown.join(","), "", "selectModules lines for keys with no icon:");
});

check("Export chats is one of them", () => {
    const icons = featureIconsKeys();
    eq(icons.includes("chatExport"), true, "chatExport in FEATURE_ICONS");
});

// --- every settings key a page's switch writes must be a real setting ---
check("switchRow() is only given keys the settings table knows", () => {
    // Settings that a switch may own are declared with a default value. Only those count: a key that is a
    // derived value (a computed field) or a page-local state must not be given to switchRow, because the switch
    // reads settings[key] and writes setSetting(key, ...), and neither exists for it.
    const defaults = SOURCE;
    const used = Array.from(SOURCE.matchAll(/switchRow\(\s*(?:Switch|ui\.TableSwitchRow)\s*,\s*"([A-Za-z0-9_]+)"/g)).map(m => m[1]);
    const unknown = used.filter(key => !new RegExp("(^|[,{ ])" + key + "\\s*:\\s*(false|true|\\d|\"|'|null)", "m").test(defaults));
    eq(unknown.join(","), "", "switchRow keys missing from the settings table:");
    eq(used.length > 10, true, "found switchRow calls");
});

// --- a page that draws a switch must redraw when that switch changes ---
check("every page with a switch subscribes to settings", () => {
    // useSettings(key) redraws that key and, because notify() also fires the owner's listeners, its whole
    // feature. A page with a switch and no subscription at all never redraws: that is the bug the device saw
    // on Reviews (the switch's knob stayed put while the value changed).
    const silent = [];
    const seen = new Set();
    for (const match of SOURCE.matchAll(/function (\w+Settings)\(\)\s*\{/g)) {
        const name = match[1];
        if (seen.has(name)) continue;
        seen.add(name);
        const body = SOURCE.slice(match.index, SOURCE.indexOf("\n    }", match.index));
        if (!/switchRow\(|TableSwitchRow/.test(body)) continue;
        if (!/useSettings\(/.test(body)) silent.push(name);
    }
    eq(silent.join(","), "", "switch pages with no useSettings():");
});

// --- a key the patches ask to switch on must actually reach the runtime -------------------------------
check("every key a patch switches on is in the runtime list (streamBadge was not)", () => {
    // 1.0.21 shipped a Streaming badge that did not exist inside the app: the patch asked for its key, the Kotlin
    // list that becomes the features map never carried it, and withOptions() drops a row whose key is missing.
    // Nothing checked the direction "asked for, never emitted", which is exactly how it got through.
    const kt = fs.readFileSync(path.join(ROOT, "patches/src/main/kotlin/app/japatch/patches/DiscordPatches.kt"), "utf8");
    const asked = new Set([
        ...Array.from(kt.matchAll(/additionalSelections \+= "([A-Za-z0-9_]+)"/g)).map(m => m[1]),
        ...Array.from(kt.matchAll(/selectRuntimeFeature\("([A-Za-z0-9_]+)"\)/g)).map(m => m[1]),
    ]);
    const emitted = new Set(kotlinFeatureKeys());
    const lost = Array.from(asked).filter(key => !emitted.has(key)).sort();
    eq(lost.join(", "), "", "patches ask for keys the build never emits:");
});

check("every key the runtime emits has an icon, or the counter skips it", () => {
    const icons = featureIconsKeys(), patched = kotlinFeatureKeys();
    const missing = patched.filter(key => !icons.includes(key));
    eq(missing.join(", "), "", "runtime features with no icon:");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
