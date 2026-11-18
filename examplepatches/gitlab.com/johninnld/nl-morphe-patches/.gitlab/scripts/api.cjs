"use strict";
const target = require("./target.cjs");
const {BASE, NAME} = target;
/** 60 s plus one second per 64 KiB, so a bundle transfer survives a slow uplink (~64 KB/s). */
function transferTimeout(bytes = 0) {
  return 60000 + Math.ceil(Math.max(0, bytes) / 65536) * 1000;
}
async function api(endpoint, {token = process.env.GITLAB_TOKEN, method = "GET", body, binary = false, fetcher = fetch, expectedBytes = 0} = {}) {
  if (!endpoint.startsWith("/") || endpoint.startsWith("//")) throw new Error(`Invalid ${NAME} API path`);
  if (!token || !/^[A-Za-z0-9._-]+$/.test(token)) throw new Error("GITLAB_TOKEN is required");
  const headers = {"PRIVATE-TOKEN": token, Accept: "application/json"};
  if (body && !Buffer.isBuffer(body)) {headers["Content-Type"] = "application/json";body = JSON.stringify(body);}
  if (Buffer.isBuffer(body)) headers["Content-Type"] = "application/octet-stream";
  const size = Math.max(Buffer.isBuffer(body) ? body.length : 0, expectedBytes);
  const response = await fetcher(`${BASE}/api/v4${endpoint}`, {method, headers, body, redirect: "error", signal: AbortSignal.timeout(transferTimeout(size))});
  if (response.status === 404 && method === "GET") return null;
  if (!response.ok) throw new Error(`${NAME} ${method} ${endpoint}: HTTP ${response.status}`);
  if (response.status === 204) return null;
  return binary ? Buffer.from(await response.arrayBuffer()) : response.json();
}
module.exports = {api, transferTimeout, ...target};
