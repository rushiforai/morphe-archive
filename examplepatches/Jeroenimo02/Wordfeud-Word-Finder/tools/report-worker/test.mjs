// node tools/report-worker/test.mjs : checks validate() and the request handling with a fake GitHub.
import assert from "node:assert/strict";
import worker, { validate, validatePing } from "./src/index.js";

assert.deepEqual(validate({ ruleset: 2, words: ["ndj", " Xy "], patch: "1.1.0" }), { type: "remove", ruleset: 2, words: ["NDJ", "XY"], patch: "1.1.0" });
assert.deepEqual(validate({ type: "add", ruleset: 2, words: ["tong"] }), { type: "add", ruleset: 2, words: ["TONG"], patch: "unknown" });
assert.equal(validate({ type: "delete", ruleset: 2, words: ["ab"] }), null);
assert.deepEqual(validate({ ruleset: 4, words: ["åsna"] }), { type: "remove", ruleset: 4, words: ["ÅSNA"], patch: "unknown" });
assert.equal(validate({ ruleset: 13, words: ["ab"] }), null);
assert.equal(validate({ ruleset: 2, words: [] }), null);
assert.equal(validate({ ruleset: 2, words: ["a"] }), null);
assert.equal(validate({ ruleset: 2, words: ["abc1"] }), null);
assert.equal(validate({ ruleset: 2, words: ["x".repeat(16)] }), null);
assert.equal(validate({ ruleset: 2, words: Array(9).fill("ab") }), null);
assert.equal(validate({ ruleset: "2", words: ["ab"] }), null);

let sent = null;
globalThis.fetch = async (url, init) => { sent = { url, init }; return new Response(null, { status: 204 }); };
const env = { GITHUB_REPOSITORY: "o/r", GITHUB_TOKEN: "t" };
const post = (body, path = "/report", method = "POST") =>
  worker.fetch(new Request("https://w.example" + path, { method, body: method === "POST" ? body : undefined }), env);

assert.equal((await post(JSON.stringify({ ruleset: 2, words: ["ndj"], patch: "1.1.0" }))).status, 202);
assert.equal(sent.url, "https://api.github.com/repos/o/r/dispatches");
assert.deepEqual(JSON.parse(sent.init.body), { event_type: "wordlist-report", client_payload: { type: "remove", ruleset: 2, words: ["NDJ"], patch: "1.1.0" } });
assert.equal((await post("{")).status, 400);
assert.equal((await post(JSON.stringify({ ruleset: 2, words: ["1"] }))).status, 400);
assert.equal((await post("", "/report", "GET")).status, 405);
assert.equal((await post("{}", "/other")).status, 404);
globalThis.fetch = async () => new Response("no", { status: 401 });
assert.equal((await post(JSON.stringify({ ruleset: 2, words: ["ndj"] }))).status, 502);
// KV rate limit: 20 per IP per hour, then 429; other IPs unaffected; no KV = no limit.
const store = new Map();
const kv = { get: async (k) => store.get(k) ?? null, put: async (k, v) => { store.set(k, v); } };
globalThis.fetch = async () => new Response(null, { status: 204 });
const envKv = { ...env, REPORT_KV: kv };
const fromIp = (ip) => worker.fetch(new Request("https://w.example/report", {
  method: "POST", headers: { "cf-connecting-ip": ip }, body: JSON.stringify({ ruleset: 2, words: ["ndj"] }) }), envKv);
for (let i = 0; i < 20; i++) assert.equal((await fromIp("1.2.3.4")).status, 202);
assert.equal((await fromIp("1.2.3.4")).status, 429);
assert.equal((await fromIp("5.6.7.8")).status, 202);
assert.ok([...store.keys()].every((k) => !k.includes("1.2.3.4")), "IP is not stored in clear text");
// Usage pings: counted per day, version and ruleset in KV, never forwarded to GitHub; /stats needs the key.
store.clear();
let forwarded = 0;
globalThis.fetch = async () => { forwarded++; return new Response(null, { status: 204 }); };
const envStats = { ...envKv, STATS_KEY: "s3cret" };
const ping = (body, ip = "9.9.9.9") => worker.fetch(new Request("https://w.example/report", {
  method: "POST", headers: { "cf-connecting-ip": ip }, body: JSON.stringify(body) }), envStats);
assert.equal((await ping({ type: "ping", patch: "1.2.3", rulesets: [2, 5] })).status, 202);
assert.equal((await ping({ type: "ping", patch: "1.2.3", rulesets: [2] }, "8.8.8.8")).status, 202);
assert.equal((await ping({ type: "ping", rulesets: [13] })).status, 400);
assert.equal(forwarded, 0);
const today = [...store.entries()].find(([k]) => k.startsWith("stats:"));
assert.deepEqual(JSON.parse(today[1]), { total: 2, versions: { "1.2.3": 2 }, rulesets: { 2: 2, 5: 1 } });
const page = (q) => worker.fetch(new Request("https://w.example/stats" + q), envStats);
assert.equal((await page("")).status, 404);
assert.equal((await page("?key=wrong")).status, 404);
const ok = await page("?key=s3cret");
assert.equal(ok.status, 200);
const html = await ok.text();
assert.ok(html.includes("Nederlands: 2") && html.includes("1.2.3: 2"), html);
assert.deepEqual(validatePing({ type: "ping", patch: "1.2.3", rulesets: [2, 2, 0] }), { patch: "1.2.3", rulesets: [2, 0] });
console.log("report-worker: all checks passed");
