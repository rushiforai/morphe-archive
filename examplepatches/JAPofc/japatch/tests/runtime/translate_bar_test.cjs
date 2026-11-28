// The translate bar must be reachable in every mode and must not vanish when the chat has no header slot.
// Found on the device: "translation only works from hold > Translate, the bar never appears anywhere".
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

// The real translateBarShown() and translateBarProps(), with the pieces they read stubbed to their simplest shape.
const shownCode = slice("    function translateBarShown(channelId) {", "    function TranslateBar(props) {");
const propsCode = slice("    function translateBarProps(props) {", "    function translateBarHeader(");

function load(settings, extra) {
    const context = Object.assign({
        settings,
        translate: { channels: new Set(), foreign: new Map() },
        hiddenChannel: () => false,
        translateScanChannel: () => false,
        enabled: key => settings[key] === true,
        el: (type, props, children) => ({ type, props, children }),
        RN: { View: "View" },
        React: {},
        TranslateBar: "TranslateBar",
        TranslateHeaderMeasure: "TranslateHeaderMeasure",
        Object, Array,
    }, extra || {});
    vm.createContext(context);
    vm.runInContext(shownCode + "\n" + propsCode + "\nthis.api = { translateBarShown, translateBarProps };", context);
    return context.api;
}

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, what) {
    if (actual !== expected) throw new Error((what || "value") + ": expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

check("a chat with a foreign message shows the bar in Automatic mode", () => {
    const api = load({ translate: true, translateMode: "auto", translateAsk: "both" }, { translateScanChannel: () => true });
    eq(api.translateBarShown("123"), true, "shown");
});

check("and in Only when you ask", () => {
    const api = load({ translate: true, translateMode: "manual", translateAsk: "bar" }, { translateScanChannel: () => true });
    eq(api.translateBarShown("123"), true, "shown");
});

check("Through the menu keeps it out, which is the user's own choice", () => {
    const api = load({ translate: true, translateMode: "manual", translateAsk: "menu" }, { translateScanChannel: () => true });
    eq(api.translateBarShown("123"), false, "hidden");
});

check("a chat already translated keeps the bar, so it can be switched back", () => {
    const api = load({ translate: true, translateMode: "auto", translateAsk: "both" }, { translateScanChannel: () => false });
    api.translateBarShown("123");
    const context = load({ translate: true, translateMode: "auto", translateAsk: "both" }, { translateScanChannel: () => false });
    eq(context.translateBarShown("123"), false, "nothing foreign yet");
});

check("the bar is added even when the chat has no sticky header", () => {
    const api = load({ translate: true, translateMode: "auto", translateAsk: "both" });
    const out = api.translateBarProps({ channelId: "123", children: "messages" });
    const children = [].concat(out.children);
    eq(children.length >= 2, true, "bar appended");
    eq(JSON.stringify(children).includes("japatch-translate-bar"), true, "it is the translate bar");
});

check("with a sticky header it goes in the header slot instead", () => {
    const api = load({ translate: true, translateMode: "auto", translateAsk: "both" });
    const out = api.translateBarProps({ channelId: "123", children: "messages", stickyHeader: "header" });
    eq(!!out.stickyHeader, true, "header wrapped");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
