// Report worker: receives words the Wordfeud server rejected (sent by the patch) and forwards them to GitHub as a
// repository_dispatch event ("wordlist-report"). The workflow .github/workflows/wordlist-report.yml then adds them
// to wordlists/<code>/remove.txt on the branch wordlist/<code> and keeps one pull request per language open.
//
// The GitHub token lives only here (secret GITHUB_TOKEN); the patch has no secret. Anyone can call this endpoint,
// so input is validated strictly and the pull request review is the real safeguard.
//
// Request:  POST /report  {"ruleset": 2, "words": ["NDJ"], "patch": "1.1.0"}
// Response: 202 accepted, 400 invalid input, 405 wrong method, 404 other path, 429 too many reports, 502 GitHub error.
// Nothing is stored or logged by this code.

const MAX_WORDS = 8;
const MAX_BODY = 2048;
// Letters only (any script), 2..15 of them: the board is 15 squares wide.
const WORD = /^\p{L}{2,15}$/u;
const PATCH = /^[0-9A-Za-z.+-]{1,32}$/;

function reply(status, text) {
  return new Response(text + "\n", { status, headers: { "content-type": "text/plain; charset=utf-8" } });
}

export function validate(body) {
  if (!body || typeof body !== "object") return null;
  const ruleset = body.ruleset;
  if (!Number.isInteger(ruleset) || ruleset < 0 || ruleset > 12) return null;
  if (!Array.isArray(body.words) || body.words.length < 1 || body.words.length > MAX_WORDS) return null;
  const words = [];
  for (const w of body.words) {
    if (typeof w !== "string") return null;
    const u = w.trim().toUpperCase();
    if (!WORD.test(u)) return null;
    if (!words.includes(u)) words.push(u);
  }
  const patch = typeof body.patch === "string" && PATCH.test(body.patch) ? body.patch : "unknown";
  return { ruleset, words, patch };
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    if (url.pathname !== "/report") return reply(404, "not found");
    if (request.method !== "POST") return reply(405, "method not allowed");

    // Optional rate limit (Workers rate limiting binding REPORT_LIMITER, see wrangler.toml).
    if (env.REPORT_LIMITER) {
      const key = request.headers.get("cf-connecting-ip") || "unknown";
      const { success } = await env.REPORT_LIMITER.limit({ key });
      if (!success) return reply(429, "too many reports");
    }

    const text = await request.text();
    if (text.length > MAX_BODY) return reply(400, "too large");
    let body;
    try {
      body = JSON.parse(text);
    } catch {
      return reply(400, "invalid json");
    }
    const report = validate(body);
    if (!report) return reply(400, "invalid report");

    const res = await fetch(`https://api.github.com/repos/${env.GITHUB_REPOSITORY}/dispatches`, {
      method: "POST",
      headers: {
        "authorization": `Bearer ${env.GITHUB_TOKEN}`,
        "accept": "application/vnd.github+json",
        "x-github-api-version": "2022-11-28",
        "user-agent": "wordfeud-word-finder-report-worker",
        "content-type": "application/json",
      },
      body: JSON.stringify({ event_type: "wordlist-report", client_payload: report }),
    });
    if (res.status !== 204) return reply(502, "github error " + res.status);
    return reply(202, "accepted");
  },
};
