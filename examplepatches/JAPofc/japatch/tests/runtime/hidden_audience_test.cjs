// #186: who can see a locked channel. Worked out from the overwrites Discord already sent, the way Discord does it:
// a deny beats an allow, @everyone decides for the server, a role bit decides for that role, a member bit for that
// person. Nothing is invented when Discord sent nothing.
const fs = require("fs");
const path = require("path");
const vm = require("vm");
const assert = require("assert");

const ROOT = path.resolve(__dirname, "..", "..");
const SOURCE = fs.readFileSync(path.join(ROOT, "patches/src/main/resources/japatch/bootstrap.js"), "utf8");
const code = SOURCE.slice(SOURCE.indexOf("    const HIDDEN_VIEW = 1024;"), SOURCE.indexOf("    function hiddenAudienceText(audience) {") + SOURCE.slice(SOURCE.indexOf("    function hiddenAudienceText(audience) {")).indexOf("\n    function HiddenDetails(props) {"));

function audience(channel, guild) {
    const context = {Number, String, Array, Map};
    vm.createContext(context);
    vm.runInContext(code + "\nthis.audience = hiddenAudience;\nthis.text = hiddenAudienceText;", context);
    return context.audience(channel, guild);
}
function text(channel, guild) {
    const context = {Number, String, Array, Map, pl: (n, one, many) => (n === 1 ? one : many).replace("{n}", n),
        tr: (key, vars) => vars ? key.replace(/\{(\w+)\}/g, (_, k) => vars[k]) : key};
    vm.createContext(context);
    vm.runInContext(code + "\nthis.audience = hiddenAudience;\nthis.text = hiddenAudienceText;", context);
    return context.text(context.audience(channel, guild));
}

const VIEW = 1024, SEND = 2048;
const GUILD = {id: "1", roles: [{id: "1", name: "@everyone"}, {id: "2", name: "Staff"}, {id: "3", name: "Muted"}]};

let failures = 0;
function ok(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

ok("no overwrites means nothing is claimed", () => {
    assert.strictEqual(audience({permissionOverwrites: []}, GUILD).known, false);
    assert.strictEqual(text({permissionOverwrites: []}, GUILD), "");
    assert.strictEqual(audience({}, GUILD), null);
});

ok("@everyone with View denied reads as hidden from the whole server", () => {
    const a = audience({permissionOverwrites: [{id: "1", type: 0, deny: String(VIEW), allow: "0"}]}, GUILD);
    assert.strictEqual(a.everyone, "deny");
    assert.match(text({permissionOverwrites: [{id: "1", type: 0, deny: String(VIEW), allow: "0"}]}, GUILD), /cannot see it/);
});

ok("a role allowed is named", () => {
    const channel = {permissionOverwrites: [{id: "1", type: 0, deny: String(VIEW), allow: "0"}, {id: "2", type: 0, allow: String(VIEW), deny: "0"}]};
    const a = audience(channel, GUILD);
    assert.deepStrictEqual([...a.allow.map(r => r.name)], ["Staff"]);
    assert.match(text(channel, GUILD), /Staff/);
});

ok("a role hidden is named separately from @everyone", () => {
    const a = audience({permissionOverwrites: [{id: "3", type: 0, deny: String(VIEW), allow: "0"}]}, GUILD);
    assert.deepStrictEqual([...a.deny.map(r => r.name)], ["Muted"]);
    assert.strictEqual(a.everyone, null);
});

ok("a bit other than View Channel is ignored", () => {
    const a = audience({permissionOverwrites: [{id: "2", type: 0, allow: String(SEND), deny: "0"}]}, GUILD);
    assert.strictEqual(a.allow.length, 0);
    assert.strictEqual(a.deny.length, 0);
    assert.strictEqual(text({permissionOverwrites: [{id: "2", type: 0, allow: String(SEND), deny: "0"}]}, GUILD), "");
});

ok("member overrides are counted, not named", () => {
    const channel = {permissionOverwrites: [{id: "9", type: 1, allow: String(VIEW), deny: "0"}, {id: "8", type: 1, deny: String(VIEW), allow: "0"}]};
    const a = audience(channel, GUILD);
    assert.strictEqual(a.members.allow, 1);
    assert.strictEqual(a.members.deny, 1);
    assert.match(text(channel, GUILD), /1 person allowed by name/);
});

ok("the new snake_case shape reads the same as the old one", () => {
    const a = audience({permissionOverwrites: [{id: "2", type: 0, allow: "1024", deny: "0"}]}, GUILD);
    const b = audience({permissionOverwrites: [{role_id: "2", type: 0, allow_: "1024", deny_: "0"}]}, GUILD);
    assert.deepStrictEqual([...a.allow.map(r => r.name)], [...b.allow.map(r => r.name)]);
});

ok("an unknown role keeps a placeholder instead of inventing a name", () => {
    const a = audience({permissionOverwrites: [{id: "404", type: 0, allow: String(VIEW), deny: "0"}]}, GUILD);
    assert.strictEqual(a.allow[0].name, "");
    assert.match(text({permissionOverwrites: [{id: "404", type: 0, allow: String(VIEW), deny: "0"}]}, GUILD), /a role/);
});

if (failures) { console.log(failures + " failing"); process.exit(1); }
console.log("all passed");
