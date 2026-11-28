// Chat export (#197): the JSON is built from the messages Discord already has on the phone, and nothing is uploaded.
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");

const start = SOURCE.indexOf("    // Chat export (");
// Stop before the menu row and the settings page: they need React and Discord's menu helpers, which aren't
// what this file tests. The first "// The row goes in" comment marks that boundary.
const end = SOURCE.indexOf("    // The row goes in the channel's hold menu");
if (start < 0 || end < start) throw new Error("the chat export block is missing from bootstrap.js");

// Discord hands out messages wrapped in its own collection: some builds have toArray(), some only each().
const collection = list => ({
    toArray: () => list,
    last: () => list[list.length - 1],
});
const messages = [
    {id: "1", content: "first", timestamp: new Date("2024-05-01T10:00:00Z"), author: {id: "9", username: "ana", globalName: "Ana"}},
    {id: "2", content: "look", timestamp: new Date("2024-05-01T10:05:00Z"), editedTimestamp: new Date("2024-05-01T10:06:00Z"),
        author: {id: "9", username: "ana"},
        attachments: [{filename: "cat.png", url: "https://cdn.discordapp.com/x", size: 12, contentType: "image/png"}]},
    {id: "3", content: "reply", timestamp: new Date("2024-05-01T10:07:00Z"), author: {id: "7", username: "bo"},
        messageReference: {message_id: "2"}},
];

const list = collection(messages);
const context = {
    msgStore: {getMessages: id => (id === "10" ? list : null)},
    inspectedExport: () => null,
    React: null, enabled: () => true, console,
    tr: (s, v) => s.replace("{n}", v && v.n !== undefined ? v.n : "{n}"),
};
vm.createContext(context);
vm.runInContext(SOURCE.slice(start, end) + "\nthis.api = {exportMessages, exportMessage, exportJson};", context);
const api = context.api;

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS", name); }
    catch (error) { failures++; console.log("FAIL", name, "-", error.message); }
}
function eq(actual, expected, label) {
    if (actual !== expected) throw new Error((label || "") + " expected " + JSON.stringify(expected) + ", got " + JSON.stringify(actual));
}

check("every loaded message is exported, in order", () => {
    const out = api.exportMessages("10");
    eq(out.length, 3, "count");
    eq(out.map(m => m.id).join(","), "1,2,3", "ids");
});

check("a channel Discord hasn't loaded exports nothing", () => {
    eq(api.exportMessages("404").length, 0, "count");
});

check("authors come out as name, with the display name preferred", () => {
    const out = api.exportMessages("10");
    eq(out[0].author.name, "Ana", "display name");
    eq(out[1].author.name, "ana", "falls back to the username");
    eq(out[0].author.id, "9", "id");
});

check("attachments and the reply link survive the trip", () => {
    const out = api.exportMessages("10");
    eq(out[1].attachments[0].name, "cat.png", "file name");
    eq(out[1].attachments[0].size, 12, "size");
    eq(out[2].reply_to, "2", "reply target");
    eq(out[0].reply_to, null, "no reply");
});

check("times are ISO strings, and only edited messages carry one", () => {
    const out = api.exportMessages("10");
    eq(out[0].at, "2024-05-01T10:00:00.000Z", "sent");
    eq(out[0].edited_at, null, "not edited");
    eq(out[1].edited_at, "2024-05-01T10:06:00.000Z", "edited");
});

check("a collection with only each() still exports (Discord's own variant)", () => {
    const onlyEach = {each: fn => messages.forEach(fn)};
    context.msgStore = {getMessages: () => onlyEach};
    eq(api.exportMessages("10").length, 3, "count");
    context.msgStore = {getMessages: () => list};
});

check("the file is valid JSON and says how far back it goes", () => {
    const text = api.exportJson({id: "10", name: "umum", type: 0}, api.exportMessages("10"));
    const data = JSON.parse(text);
    eq(data.app, "JaPatch", "app");
    eq(data.format, 1, "format");
    eq(data.count, 3, "count");
    eq(data.channel.name, "umum", "channel");
    eq(/not included/.test(data.note), true, "the note admits old messages are missing");
    eq(data.messages.length, 3, "messages");
});

check("nothing in the export needs the network", () => {
    const text = api.exportJson({id: "10", name: "umum", type: 0}, api.exportMessages("10"));
    eq(/fetch\(|XMLHttpRequest/.test(text), false, "no request code in the output");
});

// --- phase 2: text, HTML and ZIP ---
const phase2Start = SOURCE.indexOf("    // The other two shapes");
const phase2End = SOURCE.indexOf("    // The row goes in the channel's hold menu");
if (phase2Start < 0 || phase2End < phase2Start) throw new Error("the export formats block is missing from bootstrap.js");
vm.runInContext(SOURCE.slice(phase2Start, phase2End) + "\nthis.shapes = {exportText, exportHtml, exportZip, zipStore, exportEscape, exportColor, exportTime};", context);
const shapes = context.shapes;
const channel = {id: "10", name: "umum", type: 0};
const loaded = context.api.exportMessages("10");

check("the text file reads like a transcript, day by day", () => {
    const text = shapes.exportText(channel, loaded);
    eq(/#umum/.test(text), true, "channel heading");
    eq(/3 messages/.test(text), true, "count");
    eq(/--- 2024-05-01 ---/.test(text), true, "day heading");
    eq(/Ana: first/.test(text), true, "first line by the display name");
    eq(/\[file\] cat\.png/.test(text), true, "attachment listed");
    eq(/\(edited\)/.test(text), true, "edited marker");
});

check("the HTML page is self-contained and escapes what people typed", () => {
    const html = shapes.exportHtml(channel, loaded);
    eq(/^<!doctype html>/.test(html), true, "doctype");
    eq(/<title>#umum<\/title>/.test(html), true, "title");
    // Links to attachments are fine; the page must not pull anything in by itself (no external css/js/font).
    eq(/<link|<script|@import|<img/.test(html), false, "nothing loaded from the network");
    eq(/<script/.test(html), false, "no scripts");
    eq(shapes.exportEscape('<b>&"'), "&lt;b&gt;&amp;&quot;", "escaping");
});

check("a name with an emoji and a newline does not break the HTML", () => {
    const nasty = [{id: "9", at: "2024-05-01T10:00:00.000Z", edited_at: null, author: {id: "9", name: "<script>alert(1)</script>"},
        content: "line one\nline two & <b>", attachments: [], reply_to: null}];
    const html = shapes.exportHtml(channel, nasty);
    eq(/<script>alert/.test(html), false, "no injected script");
    eq(/line one<br>line two &amp; &lt;b&gt;/.test(html), true, "newlines become breaks, tags escaped");
});

check("avatar colours are stable per id and always from the palette", () => {
    eq(shapes.exportColor("9"), shapes.exportColor("9"), "stable");
    eq(/^#[0-9a-f]{6}$/.test(shapes.exportColor("123")), true, "hex");
});

// The ZIP has to be a real ZIP: a hand-written one is easy to get subtly wrong, so check the bytes and the
// structures a reader walks (local headers, central directory, end record).
check("the ZIP has the three files, and its structure adds up", () => {
    const zip = shapes.exportZip(channel, loaded);
    eq(zip.size, zip.data.length, "declared size matches the bytes");
    const bytes = zip.data;
    eq(bytes[0] === 0x50 && bytes[1] === 0x4b && bytes[2] === 0x03 && bytes[3] === 0x04, true, "local header signature");
    const text = Buffer.from(bytes).toString("latin1");
    eq(text.includes("chat.html"), true, "chat.html name");
    eq(text.includes("messages.txt"), true, "messages.txt name");
    eq(text.includes("messages.json"), true, "messages.json name");
    const end = bytes.slice(-22);
    eq(end[0] === 0x50 && end[1] === 0x4b && end[2] === 0x05 && end[3] === 0x06, true, "end of central directory");
    eq(end[10] | end[11] << 8, 3, "three entries");
});

check("the menu row says which format it will save", () => {
    eq(/Export chat as \{format\}/.test(SOURCE), true, "the row is translated with the format's name");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
