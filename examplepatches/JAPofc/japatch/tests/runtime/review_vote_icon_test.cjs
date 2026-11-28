// Every japatchIcon(id, "Name") in the runtime is checked against the module map that was dumped from the pinned
// Discord bundle. The wrong pair does not throw: japatchIcon falls back to whatever the caller passed, so a wrong
// module number shows the wrong picture and looks like a design choice. That is exactly how the review vote row
// shipped two thumbs up: it asked module 10004 for a ThumbsDownIcon, Discord has no such module, and the fallback
// was the thumbs up it had just drawn on the other side.
//
// Discord draws one icon per module (156 of 156 icon modules in the map export exactly one), so a name can only
// come from the module that exports it.
const fs = require("fs");
const path = require("path");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const MAP = fs.readFileSync(path.join(ROOT, "scripts/hbc/module-map.md"), "utf8");

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

// "| 9658 | `path` | ThumbsUpIcon | ThumbsUpIcon |" -> 9658 => Set(["ThumbsUpIcon", ...])
function moduleExports() {
    const table = new Map();
    for (const line of MAP.split("\n")) {
        const match = /^\|\s*(\d+)\s*\|\s*(?:`([^`]+)`|([^|]*?))\s*\|\s*([^|]+)\|/.exec(line);
        if (!match) continue;
        const id = Number(match[1]), source = (match[2] || match[3] || "").trim();
        const names = match[4].split(",").map(part => part.trim()).filter(Boolean);
        const base = source && source !== "-" ? path.basename(source).replace(/\.[jt]sx?$/, "") : "";
        table.set(id, new Set(base ? [...names, base] : names));
    }
    return table;
}

const EXPORTS = moduleExports();

function iconCalls() {
    return Array.from(SOURCE.matchAll(/japatchIcon\(\s*(\d+)\s*,\s*"([A-Za-z0-9_]+)"/g))
        .map(match => ({ id: Number(match[1]), name: match[2], at: SOURCE.slice(0, match.index).split("\n").length }));
}

check("the module map was read", () => {
    if (EXPORTS.size < 100) throw new Error("only " + EXPORTS.size + " modules parsed, the map format changed");
});

check("every icon is asked from a module that exports it", () => {
    const wrong = [];
    for (const call of iconCalls()) {
        const exported = EXPORTS.get(call.id);
        if (!exported) { wrong.push(`line ${call.at}: ${call.name} from module ${call.id}, which the map does not list`); continue; }
        if (!exported.has(call.name)) wrong.push(`line ${call.at}: ${call.name} from module ${call.id}, which exports ${[...exported].join(", ")}`);
    }
    if (wrong.length) throw new Error("\n    " + wrong.join("\n    "));
});

check("the map lists every module the runtime asks for, so none is guessed", () => {
    // A module that no check covers is a number nobody has verified against the bundle. 10004 was one, and the icon
    // asked from it did not exist. Every number the runtime uses has to be in the map the port check writes.
    const verified = new Set(moduleExports().keys());
    const missing = new Set();
    for (const match of SOURCE.matchAll(/inspectedExport\(\s*(\d+)/g)) if (!verified.has(Number(match[1]))) missing.add(Number(match[1]));
    for (const call of iconCalls()) if (!verified.has(call.id)) missing.add(call.id);
    if (missing.size) throw new Error("modules used but never verified: " + [...missing].join(", "));
});

check("ThumbsUpIcon really comes from 9658", () => {
    // The one icon the review row and the Reviews row both use.
    const exported = EXPORTS.get(9658);
    if (!exported || !exported.has("ThumbsUpIcon")) throw new Error("9658 no longer exports ThumbsUpIcon");
});

check("the down vote is a flipped thumbs up, not a second thumbs up", () => {
    // There is no ThumbsDownIcon in the pinned bundle, so asking for one can only ever return the fallback. The row
    // has to draw the same glyph mirrored instead. The word may appear in a comment explaining why it is not used.
    const row = SOURCE.slice(SOURCE.indexOf("const votes = !reviewVotesOk()"), SOURCE.indexOf("return el(ui.FormRow,{label,"));
    const code = row.replace(/\/\/[^\n]*/g, "");
    if (/japatchIcon\(\s*\d+\s*,\s*"ThumbsDownIcon"/.test(code)) throw new Error("the vote row asks for a ThumbsDownIcon again");
    if (!/REVIEW_VOTE_DOWN_STYLE/.test(row)) throw new Error("the No button no longer flips the thumb");
    const style = /const REVIEW_VOTE_DOWN_STYLE = ([^;]+);/.exec(SOURCE);
    if (!style) throw new Error("REVIEW_VOTE_DOWN_STYLE is gone");
    if (!/scaleY:\s*-1/.test(style[1])) throw new Error("the down vote is not flipped vertically: " + style[1]);
    if (/rotate/.test(style[1])) throw new Error("a rotation also mirrors it left to right, which points the thumb the wrong way");
});

check("the two vote buttons still vote differently", () => {
    const row = SOURCE.slice(SOURCE.indexOf("const votes = !reviewVotesOk()"), SOURCE.indexOf("return el(ui.FormRow,{label,"));
    if (!/onVote\(review,true\)/.test(row)) throw new Error("no up vote");
    if (!/onVote\(review,false\)/.test(row)) throw new Error("no down vote");
    const up = row.slice(row.indexOf("onVote(review,true)"), row.indexOf("onVote(review,false)"));
    const down = row.slice(row.indexOf("onVote(review,false)"));
    if (!/ThumbsUpIcon/.test(up)) throw new Error("the Yes button is not the thumbs up");
    if (/ThumbsUpIcon/.test(down) && !/REVIEW_VOTE_DOWN_STYLE/.test(down)) throw new Error("the No button draws a plain thumbs up");
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
