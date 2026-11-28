// A setting written through setSetting() must keep what it was given.
//
// 1.0.5 turned every value into a boolean before saving it, so a choice setting (the export format, the
// name order) became `true`: picking HTML still exported JSON, and moving a name up never moved the tick.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

const start = SOURCE.indexOf("    function setSetting(key, value)");
if (start < 0) throw new Error("setSetting is missing from bootstrap.js");
// Walk to the end of the function by counting braces, so the slice is exact.
let depth = 0, end = start;
for (let i = SOURCE.indexOf("{", start); i < SOURCE.length; i++) {
    if (SOURCE[i] === "{") depth++;
    else if (SOURCE[i] === "}" && --depth === 0) { end = i + 1; break; }
}
const body = SOURCE.slice(start, end);

function makeContext() {
    const context = {
        console,
        settings: {
            chatExport: true, chatExportFormat: "json", textReplace: true, textReplaceRules: "",
            showMeYourName: true, showMeYourNameOrder: "nickname,display,username", showMeYourNameExtra: "username",
            listenAlong: true, listenAlongOffset: 0, debugLog: false, language: "auto", hideAnything: true, hideAnythingSpots: "",
        },
        features: {chatExport: true, textReplace: true, showMeYourName: true, listenAlong: true, hideAnything: true},
        status: {storage: "ready"}, dirty: new Set(), starter: {},
        FEATURE_ICONS: {chatExport: [1, "x"]},
        reviewAuthAttempt: 0, reviewCache: new Map(), activeJobs: [],
        archiveRestored: false, edits: new Map(), split: {generation: 0},
        RISKY_FEATURES: {}, featureTable: {},
        save() {}, notify() {}, later() {}, dlog() {}, clearDeleted() {}, persistDeleted() {},
        restoreDeleted() {}, questsSettingChanged() {}, badgesSettingChanged() {},
        gestureCancel() {}, turnOnAsking() {}, nativeVoice: () => Promise.resolve(), showNameChanged() {},
        debugLog: {early: false}, dlogText: value => String(value),
    };
    context.owns = (object, key) => Object.prototype.hasOwnProperty.call(object, key);
    context.hiddenViews = {clear() {}};
    context.channelStore = null;
    vm.createContext(context);
    // The real mapping, taken from bootstrap.js: a sub-option must resolve to the feature that owns it, or
    // setSetting refuses it (that is what made the export format and the name order unmovable).
    vm.runInContext(body + "\nthis.setSetting = setSetting;", context);
    const featureStart = SOURCE.indexOf("const featureFor = key => {");
    const featureEnd = SOURCE.indexOf("\n    };", featureStart) + "\n    };".length;
    context.featureTable = {};
    vm.runInContext(SOURCE.slice(featureStart, featureEnd) + "\nthis.featureFor = featureFor;", context);
    return context;
}

function sandboxString() { vm.runInContext("this.hideSpotsText = value => String(value || \"\") ;", context); }
const context = makeContext();
const setSetting = context.setSetting;

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

check("a choice setting keeps the choice (the export format)", () => {
    setSetting("chatExportFormat", "html");
    eq(context.settings.chatExportFormat, "html", "chatExportFormat");
});

check("a comma list keeps its parts (the name order)", () => {
    setSetting("showMeYourNameOrder", "display,nickname,username");
    eq(context.settings.showMeYourNameOrder, "display,nickname,username", "order");
});

check("a list setting can grow (also show)", () => {
    setSetting("showMeYourNameExtra", "username,display");
    eq(context.settings.showMeYourNameExtra, "username,display", "extra");
});

check("a switch still goes on and off as booleans", () => {
    setSetting("chatExport", false);
    eq(context.settings.chatExport, false, "off");
    setSetting("chatExport", true);
    eq(context.settings.chatExport, true, "on");
});

check("a number setting is not turned into true either", () => {
    // listenAlongOffset has its own clamp in setSetting; give the sandbox that helper's behaviour.
    vm.runInContext("this.listenAlongOffsetValue = value => value;", context);
    setSetting("listenAlongOffset", 30);
    eq(context.settings.listenAlongOffset, 30, "offset");
});

check("a text setting that was a string stays a string", () => {
    // The rules text is written straight to settings by its own box (not through setSetting), so this checks
    // the coercion never sees it: a string setting handed to setSetting keeps its text.
    sandboxString();
    setSetting("hideAnythingSpots", "message.reply");
    eq(context.settings.hideAnythingSpots, "message.reply", "spots");
});

check("a feature that was not patched in is still refused", () => {
    const fresh = makeContext();
    fresh.features.chatExport = false;
    fresh.setSetting("chatExport", true);
    eq(fresh.settings.chatExport, true, "unchanged (it was already true)");
    fresh.settings.chatExport = false;
    fresh.setSetting("chatExport", true);
    eq(fresh.settings.chatExport, false, "a switch for a feature that isn't there does nothing");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
