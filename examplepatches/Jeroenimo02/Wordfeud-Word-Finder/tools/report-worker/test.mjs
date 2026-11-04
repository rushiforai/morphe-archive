// node tools/report-worker/test.mjs : checks validate() and the request handling with a fake GitHub.
import assert from "node:assert/strict";
import worker, { validate } from "./src/index.js";

assert.deepEqual(validate({ ruleset: 2, words: ["ndj", " Xy "], patch: "1.1.0" }), { ruleset: 2, words: ["NDJ", "XY"], patch: "1.1.0" });
assert.deepEqual(validate({ ruleset: 4, words: ["åsna"] }), { ruleset: 4, words: ["ÅSNA"], patch: "unknown" });
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
assert.deepEqual(JSON.parse(sent.init.body), { event_type: "wordlist-report", client_payload: { ruleset: 2, words: ["NDJ"], patch: "1.1.0" } });
assert.equal((await post("{")).status, 400);
assert.equal((await post(JSON.stringify({ ruleset: 2, words: ["1"] }))).status, 400);
assert.equal((await post("", "/report", "GET")).status, 405);
assert.equal((await post("{}", "/other")).status, 404);
globalThis.fetch = async () => new Response("no", { status: 401 });
assert.equal((await post(JSON.stringify({ ruleset: 2, words: ["ndj"] }))).status, 502);
console.log("report-worker: all checks passed");
