"use strict";
const {verifyBundle} = require("../../.forgejo/scripts/bundle.cjs");
const {transferTimeout} = require("./api.cjs");
const RETRYABLE = new Set([429, 500, 502, 503, 504]);
/** Seconds GitLab asks for in Retry-After, bounded to 10..120 s; 30 s when absent. */
function retryDelay(response, attempt) {
  const asked = Number(response.headers?.get?.("retry-after"));
  const seconds = Number.isFinite(asked) && asked > 0 ? asked : 30 * attempt;
  return Math.min(120, Math.max(10, seconds)) * 1000;
}
async function download(url, expectedSize, fetcher = fetch, {attempts = 4, pause = milliseconds => new Promise(resolve => setTimeout(resolve, milliseconds))} = {}) {
  const target = new URL(url);
  if (target.protocol !== "https:" || target.hostname !== "gitlab.com" || target.username || target.password) throw new Error("Unexpected GitLab download host");
  if (expectedSize != null && (!Number.isSafeInteger(expectedSize) || expectedSize <= 0)) throw new Error("Invalid expected bundle size");
  // Downloads are public. Never forward a publishing token to an asset redirect.
  // Unknown size: budget for a bundle-sized (up to 64 MiB) transfer.
  let response;
  for (let attempt = 1; ; attempt++) {
    response = await fetcher(url, {signal: AbortSignal.timeout(transferTimeout(expectedSize || 64 * 1024 * 1024))});
    // A rate limit or server hiccup right after upload is not a different bundle: wait and retry.
    if (response.ok || !RETRYABLE.has(response.status) || attempt >= attempts) break;
    await pause(retryDelay(response, attempt));
  }
  if (!response.ok) throw new Error(`Bundle download failed: HTTP ${response.status}`);
  const bytes = Buffer.from(await response.arrayBuffer());
  if (expectedSize != null && bytes.length !== expectedSize) throw new Error("Downloaded bundle size does not match its package");
  return bytes;
}
module.exports = {verifyBundle, download};
