"use strict";
const BASE = "https://codeberg.org";
const REPOSITORY = "JohninNL/nl-morphe-patches";
async function api(endpoint, {token = process.env.CODEBERG_TOKEN, method = "GET", body, fetcher = fetch} = {}) {
  if (!endpoint.startsWith("/") || endpoint.startsWith("//")) throw new Error("Invalid Codeberg API path");
  if (!token || !/^[A-Za-z0-9._-]+$/.test(token)) throw new Error("CODEBERG_TOKEN is required");
  const headers = {Authorization: `token ${token}`, Accept: "application/json"};
  if (body && !(body instanceof FormData)) { headers["Content-Type"] = "application/json"; body = JSON.stringify(body); }
  const response = await fetcher(`${BASE}/api/v1${endpoint}`, {method, headers, body, signal: AbortSignal.timeout(60000), redirect: "error"});
  if (response.status === 404 && method === "GET") return null;
  if (!response.ok) throw new Error(`Codeberg ${method} ${endpoint}: HTTP ${response.status}`);
  if (response.status === 204) return null;
  return response.json();
}
module.exports = {api, BASE, REPOSITORY};
