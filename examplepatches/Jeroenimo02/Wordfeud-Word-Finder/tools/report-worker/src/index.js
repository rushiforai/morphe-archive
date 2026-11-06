// Report worker: receives words the Wordfeud server rejected (sent by the patch) and forwards them to GitHub as a
// repository_dispatch event ("wordlist-report"). The workflow .github/workflows/wordlist-report.yml then adds them
// to wordlists/<code>/remove.txt on the branch wordlist/<code> and keeps one pull request per language open.
//
// The GitHub token lives only here (secret GITHUB_TOKEN); the patch has no secret. Anyone can call this endpoint,
// so input is validated strictly and the pull request review is the real safeguard.
//
// Request:  POST /report  {"type": "remove", "ruleset": 2, "words": ["NDJ"], "patch": "1.1.0"}
//           type "remove" (server rejected the words; default) or "add" (played but missing from our list)
// Response: 202 accepted, 400 invalid input, 405 wrong method, 404 other path, 429 too many reports, 502 GitHub error.
// Nothing is stored or logged by this code.

const MAX_WORDS = 8;
const MAX_BODY = 2048;
// Letters only (any script), 2..15 of them: the board is 15 squares wide.
const WORD = /^\p{L}{2,15}$/u;
const PATCH = /^[0-9A-Za-z.+-]{1,32}$/;
// Rate limit with a KV namespace bound as REPORT_KV (can be set up in the dashboard): at most LIMIT_PER_HOUR
// reports per IP address per hour. The IP is hashed; only the hash prefix and a counter are stored, for 2 hours.
const LIMIT_PER_HOUR = 20;

async function ipKey(ip) {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode("wfwf-report:" + ip));
  const hex = [...new Uint8Array(digest)].slice(0, 12).map((b) => b.toString(16).padStart(2, "0")).join("");
  const hour = Math.floor(Date.now() / 3600000);
  return `rl:${hex}:${hour}`;
}

/** True when this IP may send another report (and counts it). Without REPORT_KV there is no limit. */
export async function allowed(env, ip) {
  if (!env.REPORT_KV) return true;
  const key = await ipKey(ip || "unknown");
  const count = parseInt((await env.REPORT_KV.get(key)) || "0", 10);
  if (count >= LIMIT_PER_HOUR) return false;
  await env.REPORT_KV.put(key, String(count + 1), { expirationTtl: 7200 });
  return true;
}

const LANGUAGES = ["English (US)", "Norsk bokmål", "Nederlands", "Dansk", "Svenska", "English (intl)", "Español",
  "Français", "Svenska (strikt)", "Deutsch", "Norsk nynorsk", "Suomi", "Português"];

/** A usage ping: {"type":"ping","patch":"1.2.3","rulesets":[2,5]} (once per day per install), or null. */
export function validatePing(body) {
  if (!body || typeof body !== "object" || body.type !== "ping") return null;
  if (!Array.isArray(body.rulesets) || body.rulesets.length > 13) return null;
  const rulesets = [];
  for (const r of body.rulesets) {
    if (!Number.isInteger(r) || r < 0 || r > 12) return null;
    if (!rulesets.includes(r)) rulesets.push(r);
  }
  const patch = typeof body.patch === "string" && PATCH.test(body.patch) ? body.patch : "unknown";
  return { patch, rulesets };
}

/** Adds a ping to the counters of today (KV key stats:YYYY-MM-DD, kept a year). Nothing but counts is stored. */
async function countPing(env, ping) {
  if (!env.REPORT_KV) return;
  const key = "stats:" + new Date().toISOString().slice(0, 10);
  const s = JSON.parse((await env.REPORT_KV.get(key)) || '{"total":0,"versions":{},"rulesets":{}}');
  s.total += 1;
  s.versions[ping.patch] = (s.versions[ping.patch] || 0) + 1;
  for (const r of ping.rulesets) s.rulesets[r] = (s.rulesets[r] || 0) + 1;
  await env.REPORT_KV.put(key, JSON.stringify(s), { expirationTtl: 400 * 86400 });
}

function esc(t) {
  return String(t).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[c]);
}

/** GET /stats?key=STATS_KEY: daily active installs of the last 60 days, per version and language. */
async function stats(env) {
  const rows = [];
  for (let i = 0; i < 60; i++) {
    const day = new Date(Date.now() - i * 86400000).toISOString().slice(0, 10);
    const v = env.REPORT_KV ? await env.REPORT_KV.get("stats:" + day) : null;
    if (v) rows.push([day, JSON.parse(v)]);
  }
  const fmt = (o, name) => Object.entries(o).sort((a, b) => b[1] - a[1]).map(([k, n]) => `${esc(name(k))}: ${n}`).join("<br>");
  const body = rows.map(([d, s]) => `<tr><td>${d}</td><td class=n>${s.total}</td><td>${fmt(s.versions, (k) => k)}</td>` +
    `<td>${fmt(s.rulesets, (k) => LANGUAGES[k] || k)}</td></tr>`).join("");
  const html = `<!doctype html><meta charset=utf-8><meta name=viewport content="width=device-width,initial-scale=1">
<title>Wordfeud Word Finder usage</title><style>body{font:15px system-ui,sans-serif;margin:16px;color:#222}
table{border-collapse:collapse}td,th{padding:6px 10px;border-bottom:1px solid #ddd;text-align:left;vertical-align:top}
.n{text-align:right;font-weight:600}</style><h1>Daily active installs</h1>
<p>Installs that opened Wordfeud on that day (UTC), one anonymous ping each.</p>
<table><tr><th>Day</th><th>Installs</th><th>Patch version</th><th>Languages played</th></tr>${body ||
    "<tr><td colspan=4>No pings yet.</td></tr>"}</table>`;
  return new Response(html, { headers: { "content-type": "text/html; charset=utf-8", "cache-control": "no-store" } });
}

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
  const type = body.type === undefined ? "remove" : body.type;
  if (type !== "remove" && type !== "add") return null;
  const patch = typeof body.patch === "string" && PATCH.test(body.patch) ? body.patch : "unknown";
  return { type, ruleset, words, patch };
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    if (url.pathname === "/stats" && request.method === "GET") {
      if (!env.STATS_KEY || url.searchParams.get("key") !== env.STATS_KEY) return reply(404, "not found");
      return stats(env);
    }
    if (url.pathname !== "/report") return reply(404, "not found");
    if (request.method !== "POST") return reply(405, "method not allowed");

    // Optional rate limit (Workers rate limiting binding REPORT_LIMITER, see wrangler.toml).
    if (env.REPORT_LIMITER) {
      const key = request.headers.get("cf-connecting-ip") || "unknown";
      const { success } = await env.REPORT_LIMITER.limit({ key });
      if (!success) return reply(429, "too many reports");
    }

    if (!(await allowed(env, request.headers.get("cf-connecting-ip")))) return reply(429, "too many reports");

    const text = await request.text();
    if (text.length > MAX_BODY) return reply(400, "too large");
    let body;
    try {
      body = JSON.parse(text);
    } catch {
      return reply(400, "invalid json");
    }
    const ping = validatePing(body);
    if (ping) {
      try {
        await countPing(env, ping);
      } catch {
        return reply(503, "not counted");
      }
      return reply(202, "counted");
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
