// Show names your way (#191, second half): the name is rewritten in place, because a phone has no hover.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const start = SOURCE.indexOf("    const NAME_KINDS");
const end = SOURCE.indexOf("    function ShowMeYourNameSettings");
if (start < 0 || end < start) throw new Error("the Show names your way block is missing from bootstrap.js");

const settings = {showMeYourName: true, showMeYourNameOrder: "nickname,display,username", showMeYourNameExtra: "username"};
const inspected = {2128: null};
const context = {settings, React: null, enabled: key => !!settings[key], console, inspectedExport: id => inspected[id] || null,
    copyWith: (object, key, value) => { const copy = Object.create(Object.getPrototypeOf(object), Object.getOwnPropertyDescriptors(object)); copy[key] = value; return copy; }};
vm.createContext(context);
vm.runInContext("this.showName = {members:null, cache:new Map()};", context);
vm.runInContext(SOURCE.slice(start, end) + "\nthis.api = {nameOrder, nameParts, pickedName, nameSuffix, shownNameFor, showMeYourNameMessage};", context);
const api = context.api;

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

const person = {user: {id: "1", username: "ana", globalName: "Ana"}, member: {nick: "Ani"}};

check("the first name the person has wins", () => {
    eq(api.pickedName(person).text, "Ani", "nickname first");
});

check("without a server, the display name comes next", () => {
    eq(api.pickedName({user: {username: "bo", globalName: "Bo"}}).text, "Bo", "display");
});

check("without any display name, the @username is used", () => {
    eq(api.pickedName({user: {username: "cy"}}).text, "cy", "username");
});

check("the order is respected, and unknown parts are ignored", () => {
    settings.showMeYourNameOrder = "display,nonsense,nickname";
    eq(api.nameOrder().join(","), "display,nickname,username,serverNickname", "order");
    eq(api.pickedName(person).text, "Ana", "display wins");
    settings.showMeYourNameOrder = "nickname,display,username";
});

check("an empty order falls back to the default", () => {
    settings.showMeYourNameOrder = "";
    eq(api.nameOrder()[0], "username", "default order");
    settings.showMeYourNameOrder = "nickname,display,username";
});

check("other names follow in brackets, without repeating the shown one", () => {
    eq(api.nameSuffix(person, "Ani"), " (ana)", "brackets");
    eq(api.nameSuffix({user: {username: "ana", globalName: "Ana"}}, "Ana"), " (ana)", "username differs from display");
});

check("with nothing else to show there are no brackets", () => {
    settings.showMeYourNameExtra = "";
    eq(api.nameSuffix(person, "Ani"), "", "no brackets");
    settings.showMeYourNameExtra = "username";
});

// The message row is what the phone draws, so that is where the name has to change. DisplayName (10858) only
// reaches the profile card, which is why hooking it changed nothing in chat (device, 1.0.7).
function message(author, extra) {
    return Object.assign({id: "9", channel_id: "5", authorId: author.id || "1", author}, extra || {});
}

check("the chat row shows the name the order picks", () => {
    const row = message({id: "1", username: "ana", globalName: "Ana", nick: "Ani"});
    const next = api.showMeYourNameMessage(row);
    eq(next.author.username, "Ani", "nickname wins");
    eq(row.author.username, "ana", "the stored record is not mutated");
});

check("the other names are handed over for the small line under it", () => {
    const row = message({id: "1", username: "ana", globalName: "Ana", nick: "Ani"});
    const shown = api.shownNameFor(row);
    eq(shown.text, "Ani", "shown");
    eq(shown.extras.join(","), "ana", "extras");
});

check("a webhook keeps its own name", () => {
    const row = message({id: "1", username: "hook", globalName: "Hook"}, {webhookId: "77"});
    eq(api.showMeYourNameMessage(row), row, "untouched");
});

check("turned off, nothing is touched", () => {
    settings.showMeYourName = false;
    const row = message({id: "1", username: "ana", globalName: "Ana", nick: "Ani"});
    eq(api.showMeYourNameMessage(row), row, "same object");
    settings.showMeYourName = true;
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
