// #143: "don't keep these". One saved list of ids, matched against a message's author, its server and its channel.
// A pasted profile, server or channel link has the id inside it, which is why the box accepts a link.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    function noDeleteSkipData()"), SOURCE.indexOf("    function logMessage(kind, message, channelId, content, before) {"));

function fresh() {
    const ctx = {String, Set, Array, noDeleteSkip: new Set(), NO_DELETE_SKIP_MAX: 200, saved: 0, save: () => { ctx.saved++; }};
    vm.createContext(ctx);
    vm.runInContext(code + "\nthis.add = noDeleteSkipAdd; this.has = noDeleteSkipHas; this.data = noDeleteSkipData; this.set = noDeleteSkip;", ctx);
    return ctx;
}

let failures = 0;
function ok(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

ok("a bare id is accepted and saved", () => {
    const ctx = fresh();
    assert.strictEqual(ctx.add("1202014848981143597"), true);
    assert.strictEqual(ctx.set.size, 1);
    assert.strictEqual(ctx.saved, 1);
});

ok("a profile link is accepted, the id taken out of it", () => {
    const ctx = fresh();
    assert.strictEqual(ctx.add("https://discord.com/users/1202014848981143597"), true);
    assert.ok(ctx.set.has("1202014848981143597"));
});

ok("a channel and a server link work the same way", () => {
    const ctx = fresh();
    ctx.add("https://discord.com/channels/111111111111111111/222222222222222222");
    assert.ok(ctx.set.has("111111111111111111"));
});

ok("junk is refused and nothing is saved", () => {
    const ctx = fresh();
    assert.strictEqual(ctx.add("not an id"), false);
    assert.strictEqual(ctx.add(""), false);
    assert.strictEqual(ctx.set.size, 0);
    assert.strictEqual(ctx.saved, 0);
});

ok("the list says nothing when it is empty", () => {
    assert.strictEqual(fresh().data(), null);
});

ok("a message from a listed person is skipped", () => {
    const ctx = fresh(); ctx.add("1202014848981143597");
    assert.strictEqual(ctx.has({author: {id: "1202014848981143597"}, guild_id: "1", channel_id: "2"}, "2"), true);
});

ok("a message in a listed server or channel is skipped", () => {
    const ctx = fresh(); ctx.add("111111111111111111");
    assert.strictEqual(ctx.has({author: {id: "9"}, guild_id: "111111111111111111", channel_id: "2"}, "2"), true);
    const other = fresh(); other.add("333333333333333333");
    assert.strictEqual(other.has({author: {id: "9"}, guild_id: "1"}, "333333333333333333"), true);
});

ok("anyone else is kept", () => {
    const ctx = fresh(); ctx.add("1202014848981143597");
    assert.strictEqual(ctx.has({author: {id: "888888888888888888"}, guild_id: "1", channel_id: "2"}, "2"), false);
});

ok("an empty list matches nothing, without a lookup", () => {
    const ctx = fresh();
    assert.strictEqual(ctx.has({author: {id: "1202014848981143597"}}, "2"), false);
    assert.strictEqual(ctx.has(null, null), false);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
