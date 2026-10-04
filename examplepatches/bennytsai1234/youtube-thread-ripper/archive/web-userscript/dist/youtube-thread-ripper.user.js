// ==UserScript==
// @name         YouTube Thread Ripper 實驗版
// @namespace    local.youtube-thread-ripper
// @version      2026.10.1.1
// @description  BTR 原版面板、通知、自动线程及 Range 下载核心的 YouTube 适配
// @author       Bilibili-thread-ripper contributors; YouTube adaptation contributors
// @match        https://www.youtube.com/*
// @match        https://m.youtube.com/*
// @run-at       document-start
// @noframes
// @sandbox      JavaScript
// @inject-into  content
// @grant        unsafeWindow
// @grant        GM_addElement
// @grant        GM.getValue
// @grant        GM.setValue
// @grant        GM_addValueChangeListener
// @grant        GM_registerMenuCommand
// @license      MIT
// ==/UserScript==

/*
YouTube Thread Ripper experiment, 2026.

This project directly vendors and reuses the BTR settings panel, notification view,
storage shim/loader, bridge, byte-range core, CDN measurement policy, IDM downloader
and the generic fetch/XHR portion of the native range transport from:
Bilibili-thread-ripper, https://github.com/MrTangLuyao/Bilibili-thread-ripper
Reference commit: e64553b1ea911946387a1cf14992ac3fc008e07d

MIT License
Copyright (c) 2026 Bilibili-thread-ripper contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

SABR wire-field definitions consulted (not bundled as a dependency):
https://github.com/LuanRT/googlevideo
Reference commit: 44e360aa1be47298d51535454f899501cf29ce0c
protos/video_streaming/video_playback_abr_request.proto:
  client_abr_state = field 1, length-delimited
protos/video_streaming/client_abr_state.proto:
  player_time_ms = field 28, varint; playback_rate = field 35, float32

No ReVanced/Morphe source code is included in this package.

*/
(function() {
"use strict";
function pageCode() {
"use strict";
if (window.top !== window) return;
if (document.documentElement?.hasAttribute("data-ytr-userscript")) return;
document.documentElement?.setAttribute("data-ytr-userscript", "");
// This small stand-in keeps the parts of the chrome.* API that bridge.js uses: storage,
// and runtime.lastError for its callbacks.
//
// The settings live in the script manager's storage, which every bilibili subdomain shares.
// Only the manager's side of the script (loader.js) can reach it, so this page code asks it
// with events. loader.js marks the page when it answers them; without that mark, or when it
// does not answer, the settings stay in this site's localStorage as before, which is kept per
// subdomain. Changes made in another tab arrive from the manager, or, where the manager does
// not report them, are read again when this tab comes back into view.
//
// What the manager holds is also copied to this site's localStorage. Each manager keeps its
// own storage, so a viewer who moves to another one (say from Tampermonkey to
// Violentmonkey) would otherwise start over: the new one takes the settings over from that
// copy the first time it runs.
const chrome = (() => {
  const PREFIX = "YTR_Userscript.";
  const AREAS = ["sync", "local"];
  const mark = document.documentElement?.getAttribute("data-ytr-userscript-storage") || "";
  const listeners = new Set();
  const parse = (text) => {
    try {
      const value = typeof text === "string" ? JSON.parse(text || "{}") : text;
      return value && typeof value === "object" && !Array.isArray(value) ? value : {};
    } catch (_error) {
      return {};
    }
  };
  const diff = (before, after) => {
    const changes = {};
    for (const key of new Set([...Object.keys(before), ...Object.keys(after)])) {
      if (JSON.stringify(before[key]) !== JSON.stringify(after[key])) changes[key] = { oldValue: before[key], newValue: after[key] };
    }
    return changes;
  };
  const notify = (changes, area) => {
    if (!Object.keys(changes).length) return;
    for (const listener of listeners) {
      try { listener(changes, area); }
      catch (error) { console.error("BTR settings listener", error); }
    }
  };

  // This site's localStorage: the fallback, and what every version before 2026 used.
  const localBackend = {
    load: (area) => {
      try { return Promise.resolve(parse(localStorage.getItem(PREFIX + area))); }
      catch (_error) { return Promise.resolve({}); }
    },
    change: (area, op, value) => {
      let next = {};
      try { next = parse(localStorage.getItem(PREFIX + area)); } catch (_error) {}
      if (op === "set") Object.assign(next, value);
      else for (const key of value) delete next[key];
      try { localStorage.setItem(PREFIX + area, JSON.stringify(next)); }
      catch (error) { return Promise.reject(error); }
      return Promise.resolve(next);
    }
  };

  // The manager's storage, through loader.js. Requests and answers are JSON text: objects
  // would not cross Firefox's boundary between the page and the manager's sandbox.
  let requestCount = 0;
  const pending = new Map();
  const managerBackend = {
    request(message) {
      return new Promise((resolve, reject) => {
        const id = String(++requestCount);
        pending.set(id, { resolve, reject });
        document.dispatchEvent(new CustomEvent("ytr-userscript-storage-request", { detail: JSON.stringify({ ...message, id }) }));
      });
    },
    load(area) { return this.request({ op: "get", area }); },
    change(area, op, value) { return this.request(op === "set" ? { op, area, items: value } : { op, area, keys: value }); }
  };
  document.addEventListener("ytr-userscript-storage-reply", (event) => {
    let reply = null;
    try { reply = JSON.parse(event.detail); } catch (_error) { return; }
    const entry = pending.get(String(reply?.id));
    if (!entry) return;
    pending.delete(String(reply.id));
    if (reply.error) entry.reject(new Error(reply.error));
    else entry.resolve(parse(reply.value));
  });

  const cache = {};
  const loads = {};
  let backend = mark ? managerBackend : localBackend;
  const keepCopy = (area, value) => {
    if (backend !== managerBackend) return;
    try { localStorage.setItem(PREFIX + area, JSON.stringify(value)); } catch (_error) {}
  };
  // A manager that marked the page but never answers must not keep the settings from loading.
  const load = (area) => {
    loads[area] ||= (backend === managerBackend
      ? Promise.race([backend.load(area), new Promise((_resolve, reject) => setTimeout(() => reject(new Error("no answer")), 3000))])
        .catch(() => { backend = localBackend; return backend.load(area); })
      : backend.load(area)).then((value) => { cache[area] = value; keepCopy(area, value); return value; });
    return loads[area];
  };
  // What the storage now holds after a change, from this tab or from another one.
  const settle = (area, value) => {
    const before = cache[area] || {};
    cache[area] = value;
    keepCopy(area, value);
    notify(diff(before, value), area);
  };

  const runtime = { lastError: null };
  // Callers either pass a callback and read runtime.lastError, or await the promise.
  const finish = (promise, callback) => {
    const done = promise.then((value) => [value, null], (error) => [undefined, error]);
    if (typeof callback !== "function") return done.then(([value, error]) => (error ? Promise.reject(error) : value));
    return done.then(([value, error]) => {
      runtime.lastError = error ? { message: String(error.message || error) } : null;
      try { callback(value); }
      finally { runtime.lastError = null; }
      return value;
    });
  };
  // The change shows at once in this tab; the storage's own answer, which may also carry
  // another tab's change, settles it.
  const change = (area, op, value) => load(area).then((stored) => {
    const next = { ...stored };
    if (op === "set") Object.assign(next, value);
    else for (const key of value) delete next[key];
    settle(area, next);
    return backend.change(area, op, value).then((result) => settle(area, result));
  });
  const storageArea = (area) => ({
    get(keys, callback) {
      return finish(load(area).then((stored) => {
        if (keys === null || keys === undefined) return { ...stored };
        if (typeof keys === "string") return keys in stored ? { [keys]: stored[keys] } : {};
        if (Array.isArray(keys)) return Object.fromEntries(keys.filter((key) => key in stored).map((key) => [key, stored[key]]));
        return Object.fromEntries(Object.keys(keys).map((key) => [key, key in stored ? stored[key] : keys[key]]));
      }), callback);
    },
    set(items, callback) {
      return finish(change(area, "set", { ...items }), callback);
    },
    remove(keys, callback) {
      return finish(change(area, "remove", [].concat(keys)), callback);
    }
  });

  // Another tab changed something.
  addEventListener("storage", (event) => {
    if (backend !== localBackend || !event.key?.startsWith(PREFIX)) return;
    const area = event.key.slice(PREFIX.length);
    if (AREAS.includes(area) && cache[area]) settle(area, parse(event.newValue));
  });
  document.addEventListener("ytr-userscript-storage-change", (event) => {
    let message = null;
    try { message = JSON.parse(event.detail); } catch (_error) { return; }
    if (backend === managerBackend && AREAS.includes(message?.area) && cache[message.area]) settle(message.area, parse(message.value));
  });
  // Managers that do not report other tabs' changes ("live" is missing from the mark): read
  // the storage again whenever this tab comes back.
  if (mark && !mark.split(" ").includes("live")) {
    const refresh = () => {
      if (document.visibilityState !== "visible" || backend !== managerBackend) return;
      for (const area of AREAS) if (cache[area]) backend.load(area).then((value) => settle(area, value), () => {});
    };
    addEventListener("focus", refresh);
    document.addEventListener("visibilitychange", refresh);
  }

  return Object.freeze({
    runtime,
    storage: Object.freeze({
      sync: storageArea("sync"),
      local: storageArea("local"),
      onChanged: { addListener: (listener) => listeners.add(listener), removeListener: (listener) => listeners.delete(listener) }
    })
  });
})();

(function installRangeCore(root) {
  "use strict";

  const MEDIA_SUFFIX_RE = /\.(?:m4s|mp4|flv)$/i;
  const MEDIA_HOST_RE = /(?:^|\.)(?:bilivideo\.(?:com|cn|net)|akamaized\.net|szbdyd\.com|hdslb\.com|xycdn\.com|mountaintoys\.cn|nexusedgeio\.com|ahdohpiechei\.com)$/i;

  function parseByteRange(value) {
    if (typeof value !== "string") return null;
    const match = /^(\d+)-(\d+)$/.exec(value.trim());
    if (!match) return null;
    const start = Number(match[1]);
    const end = Number(match[2]);
    if (!Number.isSafeInteger(start) || !Number.isSafeInteger(end) || end < start) return null;
    return { start, end, length: end - start + 1 };
  }

  function parseRangeHeader(value) {
    if (typeof value !== "string") return null;
    const match = /^bytes=(\d+)-(\d+)$/i.exec(value.trim());
    return match ? parseByteRange(`${match[1]}-${match[2]}`) : null;
  }

  function parseContentRange(value) {
    if (typeof value !== "string") return null;
    const match = /^bytes\s+(\d+)-(\d+)\/(\d+|\*)$/i.exec(value.trim());
    if (!match) return null;
    const start = Number(match[1]);
    const end = Number(match[2]);
    const total = match[3] === "*" ? null : Number(match[3]);
    if (!Number.isSafeInteger(start) || !Number.isSafeInteger(end) || end < start) return null;
    if (total !== null && (!Number.isSafeInteger(total) || total <= end)) return null;
    return { start, end, total, length: end - start + 1 };
  }

  function splitRange(start, end, concurrency, minChunkBytes = 128 * 1024) {
    const length = end - start + 1;
    const limit = Math.max(1, Math.min(512, Math.trunc(concurrency) || 1));
    const minimum = Math.max(32 * 1024, Math.trunc(minChunkBytes) || 128 * 1024);
    const count = Math.max(1, Math.min(limit, Math.ceil(length / minimum)));
    const base = Math.floor(length / count);
    const remainder = length % count;
    const pieces = [];
    let cursor = start;
    for (let index = 0; index < count; index += 1) {
      const size = base + (index < remainder ? 1 : 0);
      pieces.push({ index, start: cursor, end: cursor + size - 1, length: size });
      cursor += size;
    }
    return pieces;
  }

  function concatChunks(chunks, expectedLength) {
    const output = new Uint8Array(expectedLength);
    let offset = 0;
    for (const chunk of chunks) {
      const bytes = chunk instanceof Uint8Array ? chunk : new Uint8Array(chunk);
      if (offset + bytes.byteLength > expectedLength) throw new RangeError("子区间超出目标长度");
      output.set(bytes, offset);
      offset += bytes.byteLength;
    }
    if (offset !== expectedLength) throw new RangeError(`子区间长度不符：${offset}/${expectedLength}`);
    return output;
  }

  function isBilibiliMediaUrl(value) {
    try {
      const url = new URL(value, root.location?.href);
      return url.protocol === "https:" && MEDIA_SUFFIX_RE.test(url.pathname) && MEDIA_HOST_RE.test(url.hostname);
    } catch (_error) {
      return false;
    }
  }

  // A server added by hand in the custom CDN mode. Only its host name is kept, and only for
  // the Bilibili video servers isBilibiliMediaUrl accepts: the signed download addresses
  // must never be sent to anyone else.
  function normalizeCdnHost(value) {
    const text = String(value || "").trim().toLowerCase();
    if (!text || text.length > 253) return "";
    let host = "";
    try { host = new URL(/^[a-z][a-z\d+.-]*:\/\//.test(text) ? text : `https://${text}`).hostname; }
    catch (_error) { return ""; }
    return /^[a-z\d](?:[a-z\d-]*[a-z\d])?(?:\.[a-z\d](?:[a-z\d-]*[a-z\d])?)+$/.test(host) && MEDIA_HOST_RE.test(host) ? host : "";
  }

  function normalizeSettings(input) {
    const source = input && typeof input === "object" ? input : {};
    const allowed = [4, 8, 16, 32, 64, 128];
    const requested = Math.trunc(Number(source.concurrency));
    return {
      enabled: source.enabled !== false,
      // The live module on live.bilibili.com; the master switch above still rules.
      liveEnabled: source.liveEnabled !== false,
      // "full" replaces Bilibili's playback core; "compat" leaves it in charge and only
      // downloads its media requests.
      takeover: source.takeover === "compat" ? "compat" : "full",
      mode: ["overseas", "custom"].includes(source.mode) ? source.mode : "mainland",
      customHosts: (Array.isArray(source.customHosts) ? source.customHosts : [])
        .map(normalizeCdnHost)
        .filter((host, index, all) => host && all.indexOf(host) === index)
        .slice(0, 32),
      // The round button in the page corner that opens the settings panel, and where the
      // viewer dragged it: which side, and how far down as a share of the window height.
      floatingButton: source.floatingButton !== false,
      // Where the viewer dragged it, as shares of the window (0 = flush left, 1 = flush
      // right); null when it was never moved.
      floatingButtonLeft: source.floatingButtonLeft != null && Number(source.floatingButtonLeft) >= 0 && Number(source.floatingButtonLeft) <= 1 ? Number(source.floatingButtonLeft) : null,
      floatingButtonTop: source.floatingButtonTop != null && Number(source.floatingButtonTop) >= 0 && Number(source.floatingButtonTop) <= 1 ? Number(source.floatingButtonTop) : null,
      debugNotices: source.debugNotices === true,
      errorNotices: source.errorNotices === true,
      debugCategories: Object.fromEntries(["takeover", "playback", "download", "buffer", "settings", "other"].map(key => [key, source.debugCategories?.[key] !== false])),
      concurrency: allowed.includes(requested) ? requested : 8,
      // 自动线程数: the downloader picks the thread count itself, between 8 and 32, and
      // `concurrency` above is only what the viewer set by hand. Off unless asked for.
      autoConcurrency: source.autoConcurrency === true,
      minChunkBytes: 64 * 1024,
      firstByteTimeoutMs: 5500,
      stallTimeoutMs: 4000,
      attemptTimeoutMs: 15000,
      hedgeDelayMs: 900,
      bufferAheadSeconds: 45
    };
  }

  root.__BILI_RANGE_CORE__ = Object.freeze({
    concatChunks,
    isBilibiliMediaUrl,
    normalizeCdnHost,
    normalizeSettings,
    parseByteRange,
    parseContentRange,
    parseRangeHeader,
    splitRange
  });
})(globalThis);

(function (root, factory) {
  const core = factory();
  if (typeof module === 'object' && module.exports) module.exports = core;
  else root.YTRCore = core;
})(globalThis, function () {
  'use strict';

  function readVarint(bytes, offset) {
    let result = 0n;
    for (let index = 0; index < 10; index++) {
      if (offset >= bytes.length) throw new Error('truncated varint');
      const byte = bytes[offset++];
      if (index === 9 && byte > 1) throw new Error('invalid uint64');
      result |= BigInt(byte & 127) << BigInt(index * 7);
      if (!(byte & 128)) return { value: result, end: offset };
    }
    throw new Error('invalid varint');
  }
  function varint(value) {
    let rest = BigInt(value);
    const out = [];
    do { out.push(Number(rest & 127n) | (rest > 127n ? 128 : 0)); rest >>= 7n; } while (rest);
    return Uint8Array.from(out);
  }
  function fields(bytes) {
    const out = [];
    for (let cursor = 0; cursor < bytes.length;) {
      const start = cursor, tag = readVarint(bytes, cursor);
      if (tag.value > 0xffffffffn || tag.value < 8n) throw new Error('invalid field tag');
      const id = Number(tag.value >> 3n), wire = Number(tag.value & 7n);
      cursor = tag.end;
      let payloadStart = cursor;
      if (wire === 0) cursor = readVarint(bytes, cursor).end;
      else if (wire === 1) cursor += 8;
      else if (wire === 5) cursor += 4;
      else if (wire === 2) {
        const length = readVarint(bytes, cursor);
        if (length.value > BigInt(bytes.length)) throw new Error('invalid field length');
        payloadStart = length.end;
        cursor = payloadStart + Number(length.value);
      } else throw new Error('unsupported wire type');
      if (cursor > bytes.length) throw new Error('truncated field');
      out.push({ id, wire, start, payloadStart, end: cursor });
    }
    return out;
  }
  function concat(chunks) {
    const output = new Uint8Array(chunks.reduce((total, chunk) => total + chunk.length, 0));
    let cursor = 0;
    for (const chunk of chunks) { output.set(chunk, cursor); cursor += chunk.length; }
    return output;
  }
  function bytesOf(body) {
    if (Object.prototype.toString.call(body) === '[object ArrayBuffer]') return new Uint8Array(body);
    if (ArrayBuffer.isView(body)) return new Uint8Array(body.buffer, body.byteOffset, body.byteLength);
    return null;
  }
  function patchSabr(body, actualRate, factor) {
    const bytes = bytesOf(body);
    if (!bytes || !Number.isFinite(actualRate) || actualRate <= 0 || ![1, 2].includes(factor)) return null;
    try {
      const rootFields = fields(bytes);
      const states = rootFields.filter(field => field.id === 1 && field.wire === 2);
      if (states.length !== 1 || !rootFields.some(f => f.id === 5 && f.wire === 2 && f.end > f.payloadStart) || !rootFields.some(f => [16, 17].includes(f.id) && f.wire === 2)) return null;
      const state = states[0], abr = bytes.subarray(state.payloadStart, state.end);
      const stateFields = fields(abr), rates = stateFields.filter(f => f.id === 35);
      // Refuse an unexpected schema instead of guessing how to rewrite it.
      if (rates.length > 1 || (rates.length && rates[0].wire !== 5) || !stateFields.some(f => f.id === 28 && f.wire === 0)) return null;
      const rateField = rates[0];
      const before = rateField ? new DataView(abr.buffer, abr.byteOffset + rateField.payloadStart, 4).getFloat32(0, true) : 1;
      if (!Number.isFinite(before) || before <= 0) return null;
      const after = Math.fround(Math.max(before, actualRate) * factor);
      if (!Number.isFinite(after) || after === before) return { bytes, before, after, changed: false };
      const value = new Uint8Array(4);
      new DataView(value.buffer).setFloat32(0, after, true);
      const replacement = concat([varint((35 << 3) | 5), value]);
      const nextState = rateField ? concat([abr.subarray(0, rateField.start), replacement, abr.subarray(rateField.end)]) : concat([abr, replacement]);
      const next = concat([bytes.subarray(0, state.start), varint(10), varint(nextState.length), nextState, bytes.subarray(state.end)]);
      return { bytes: next, before, after, changed: true };
    } catch { return null; }
  }

  return Object.freeze({ fields, varint, concat, bytesOf, patchSabr });
});

// YouTube-specific boundary. Scheduling, retries, pooling and UI belong to BTR.
(function (root) {
  'use strict';
  const btr = root.__BILI_RANGE_CORE__;
  const normalize = input => {
    const settings = btr.normalizeSettings(input);
    return { ...settings, liveEnabled: false, takeover: 'compat', customHosts: [], floatingButton: input?.floatingButton === true };
  };
  function mediaURL(value) {
    try {
      const url = new URL(value, root.location.href);
      return url.protocol === 'https:' && /(?:^|\.)googlevideo\.com$/i.test(url.hostname) && url.pathname === '/videoplayback' ? url : null;
    } catch { return null; }
  }
  root.__BILI_RANGE_CORE__ = Object.freeze({ ...btr, normalizeSettings: normalize, isBilibiliMediaUrl: value => !!mediaURL(value), normalizeCdnHost: () => '' });
  function rangePlan(value, method, headers) {
    const url = mediaURL(value);
    if (!url || method !== 'GET' || ['sabr', 'ump', 'srfvp'].some(key => url.searchParams.get(key) === '1') || url.searchParams.get('source') === 'yt_live_broadcast') return null;
    const mime = url.searchParams.get('mime') || '';
    if (!/^(?:video|audio)\/(?:mp4|webm)$/.test(mime)) return null;
    if ((url.searchParams.get('sparams') || '').split(',').includes('range')) return null;
    const query = url.searchParams.get('range'), header = headers.get('range');
    if (query !== null && header !== null) return null;
    const range = query !== null ? btr.parseByteRange(query) : btr.parseRangeHeader(header);
    if (!range || !Number.isSafeInteger(range.length) || range.length > 16 * 1024 * 1024) return null;
    const total = Number(url.searchParams.get('clen'));
    if (query !== null && (!Number.isSafeInteger(total) || total <= range.end)) return null;
    return { url: url.href, range, track: { kind: mime.startsWith('audio/') ? 'audio' : 'video', representation: { baseUrl: url.href, mimeType: mime } } };
  }
  function pieceFetcher(nativeFetch) {
    return async (value, init) => {
      const url = new URL(value), range = btr.parseRangeHeader(new Headers(init.headers).get('range'));
      if (url.searchParams.has('range')) url.searchParams.set('range', `${range.start}-${range.end}`);
      const response = await nativeFetch(url.href, init);
      if (response.status !== 200 || !url.searchParams.has('range')) return response;
      const total = Number(url.searchParams.get('clen'));
      const existing = response.headers.get('content-range'), parsed = btr.parseContentRange(existing);
      if (existing && (!parsed || parsed.start !== range.start || parsed.end !== range.end || parsed.total !== total)) throw Error('YouTube query Range 回应不符');
      if (!Number.isSafeInteger(total) || total <= range.end || /yt-ump/i.test(response.headers.get('content-type') || '')) throw Error('不是可转换的 YouTube 媒体 Range');
      const length = response.headers.get('content-length');
      if (length !== null && Number(length) !== range.length) throw Error('YouTube query Range 长度不符');
      const headers = new Headers(response.headers);
      headers.set('content-range', `bytes ${range.start}-${range.end}/${total}`);
      // BTR still checks every received byte count; hidden CDN headers cannot prove offset.
      if (!response.body) throw Error('YouTube Range 没有回应内容');
      let received = 0;
      const bounded = response.body.pipeThrough(new TransformStream({
        transform(chunk, controller) {
          received += chunk.byteLength;
          if (received > range.length) throw Error('YouTube query Range 超出请求长度');
          controller.enqueue(chunk);
        },
        flush() { if (received !== range.length) throw Error('YouTube query Range 长度不足'); }
      }));
      return new Response(bounded, { status: 206, statusText: 'Partial Content', headers });
    };
  }
  root.__YTR_SITE__ = Object.freeze({ mediaURL, rangePlan, pieceFetcher });
})(globalThis);

(function installCdnResolver(root) {
  "use strict";

  const core = root.__BILI_RANGE_CORE__;
  if (!core) return;

  const MAINLAND_HOSTS = Object.freeze([]);
  const OVERSEAS_HOSTS = Object.freeze([]);

  const GLOBAL_HOSTS = Object.freeze([
    ...OVERSEAS_HOSTS,
    ...MAINLAND_HOSTS
  ]);

  function isAkamaiUrl(value) {
    try { return new URL(value).hostname.toLowerCase().endsWith(".akamaized.net"); }
    catch (_error) { return false; }
  }

  function safeMediaUrl(value) {
    try {
      const url = new URL(String(value));
      return core.isBilibiliMediaUrl(url.href) ? url.href : null;
    } catch (_error) {
      return null;
    }
  }

  function swapOrdinaryHost(rawUrl, targetHost, allowAkamai = false) {
    if (!allowAkamai && isAkamaiUrl(rawUrl)) return null;
    const host = String(targetHost || "").toLowerCase();
    if (core.normalizeCdnHost(host) !== host) return null;
    try {
      const url = new URL(rawUrl);
      // Assigning url.host alone keeps a non-standard port, such as a peer CDN's :4483.
      url.hostname = host;
      url.port = "";
      return url.href;
    } catch (_error) {
      return null;
    }
  }

  // The custom mode uses only the servers picked in the settings. Without any, it works like
  // the mainland mode.
  function customServers(mode, customHosts) {
    return mode === "custom" && Array.isArray(customHosts) ? customHosts.map(core.normalizeCdnHost).filter(Boolean) : [];
  }

  function representationUrls(representation) {
    const backup = representation?.backupUrl || representation?.backup_url || [];
    return [representation?.baseUrl || representation?.base_url, ...backup]
      .map(safeMediaUrl).filter(Boolean).filter((url, index, all) => all.indexOf(url) === index);
  }

  function hostOf(value) {
    try { return new URL(value).hostname.toLowerCase(); }
    catch (_error) { return ""; }
  }

  // The signed address without its node: the same address can be asked of any node.
  function addressOf(value) {
    try {
      const url = new URL(value);
      return url.pathname + url.search;
    } catch (_error) {
      return "";
    }
  }

  // A CDN node that twice fails without sending a single byte is skipped for the
  // rest of the current video. The owner resets the list when the video changes.
  //
  // HTTP 4xx means the node answered and refused the signed address, and either side can be
  // at fault: a node may lack the file, or Bilibili may have handed out an address that every
  // node refuses. What has delivered data decides it. Refused by a node that serves other
  // addresses, the address is dropped; refused where other nodes serve it, the node is.
  // With neither known yet, the reply counts against nobody until one of them delivers.
  function createBanList(options = {}) {
    const limit = Math.max(1, Math.trunc(Number(options.limit)) || 2);
    const emptyReplies = new Map();
    const goodNodes = new Set();
    const goodAddresses = new Set();
    const reported = new Set();
    let banned = new Set();

    function judge(url, error) {
      const strikes = new Map();
      for (const [key, count] of emptyReplies) {
        const [node, address, refused] = key.split("\n");
        // A node that serves other addresses and refuses one that other nodes serve loses only
        // that pair; it is often the fastest node for the addresses it does serve.
        const blamed = !refused ? `node:${node}`
          : goodNodes.has(node) ? (goodAddresses.has(address) ? `pair:${node} ${address}` : `address:${address}`)
            : goodAddresses.has(address) ? `node:${node}` : "";
        if (blamed) strikes.set(blamed, (strikes.get(blamed) || 0) + count);
      }
      banned = new Set([...strikes].filter(([, count]) => count >= limit).map(([key]) => key));
      let added = false;
      for (const key of banned) {
        if (reported.has(key)) continue;
        reported.add(key);
        added = true;
        const isNode = key.startsWith("node:");
        try { options.onBan?.(isNode ? key.slice(5) : hostOf(url), strikes.get(key), error, isNode ? "node" : "address"); } catch (_error) {}
      }
      return added;
    }

    return Object.freeze({
      record(url, receivedBytes, error) {
        if (error?.name === "AbortError" || Number(receivedBytes) > 0) return false;
        const node = hostOf(url);
        if (!node) return false;
        const status = Number(error?.status) || 0;
        const key = `${node}\n${addressOf(url)}\n${status >= 400 && status < 500 ? "refused" : ""}`;
        emptyReplies.set(key, (emptyReplies.get(key) || 0) + 1);
        return judge(url, error);
      },
      success(url) {
        const node = hostOf(url);
        const address = addressOf(url);
        if (!node || (goodNodes.has(node) && goodAddresses.has(address))) return;
        goodNodes.add(node);
        goodAddresses.add(address);
        judge(url, null);
      },
      allows: (url) => !banned.has(`node:${hostOf(url)}`) && !banned.has(`address:${addressOf(url)}`) && !banned.has(`pair:${hostOf(url)} ${addressOf(url)}`),
      allowsNode: (url) => !banned.has(`node:${hostOf(url)}`),
      allowsAddress: (url) => !banned.has(`address:${addressOf(url)}`),
      hosts: () => [...banned].filter((key) => key.startsWith("node:")).map((key) => key.slice(5)),
      reset() {
        emptyReplies.clear();
        goodNodes.clear();
        goodAddresses.clear();
        reported.clear();
        banned = new Set();
      }
    });
  }

  // How long a measured speed counts. A node in use is measured again with every segment; one
  // that was left out for being slow goes back to the untested ones after this, and gets
  // another try through the exploration slot.
  const MEASUREMENT_TTL_MS = 90000;

  function createResolver(representation, getMode, bans = null, getCustomHosts = null) {
    const health = new Map();
    // What is known about a node's speed, per node and file, without the query. An address
    // with a fresh signature is the same route, so it starts with what its predecessor
    // measured. Failures are not kept here: those belong to the address they happened on.
    const routes = new Map();
    const routeKeys = new Map();
    const routeOf = (url) => {
      let key = routeKeys.get(url);
      if (!key) {
        try {
          const parsed = new URL(url);
          key = `${parsed.host}${parsed.pathname}`;
        } catch (_error) { key = String(url); }
        if (routeKeys.size > 512) routeKeys.clear();
        routeKeys.set(url, key);
      }
      return key;
    };
    const measurement = (url) => routes.get(routeOf(url)) || null;
    // Only a transfer long enough to measure a speed renews it. The short tail of a resumed
    // piece proves the node works, and must not keep an old speed alive for ever.
    const measuredNow = (url, now = Date.now()) => {
      const item = measurement(url);
      return Boolean(item?.lastMeasuredAt) && now - item.lastMeasuredAt < MEASUREMENT_TTL_MS;
    };
    const bySpeed = (a, b) => {
      const am = measurement(a) || {};
      const bm = measurement(b) || {};
      return Number(Boolean(bm.lastSuccessAt)) - Number(Boolean(am.lastSuccessAt)) || (bm.bps || 0) - (am.bps || 0);
    };
    let cursor = 0;
    let mediaRangeCount = 0;
    let rangeCursor = 0;

    function allUrls() {
      return representationUrls(representation, getMode?.(), getCustomHosts?.() || []);
    }

    // Banned nodes are left out. If every node is banned, keep using them rather
    // than leaving the video with no download address at all.
    function unbanned(list) {
      if (!bans) return list;
      const allowed = list.filter(bans.allows);
      return allowed.length ? allowed : list;
    }

    function urls() {
      return unbanned(allUrls());
    }

    function ordered(pieceIndex = 0, exclude = new Set()) {
      const now = Date.now();
      const candidates = urls().filter((url) => !exclude.has(url));
      const available = candidates.filter((url) => (health.get(url)?.blockedUntil || 0) <= now);
      const pool = available.length ? available : candidates;
      if (!pool.length) return [];
      const offset = (cursor + pieceIndex) % pool.length;
      const rotated = pool.slice(offset).concat(pool.slice(0, offset));
      cursor = (cursor + 1) % pool.length;
      return rotated;
    }

    function rangeCandidates() {
      const now = Date.now();
      const pool = urls()
        .filter((url) => (health.get(url)?.blockedUntil || 0) <= now)
        .sort(bySpeed);
      if (!pool.length) return urls();
      const firstRange = mediaRangeCount === 0;
      const width = Math.min(firstRange ? pool.length : 6, pool.length);
      let selected;
      const warmupRanges = getMode?.() === "mainland" ? 1 : 4;
      if (mediaRangeCount < warmupRanges) {
        selected = pool.slice(0, width);
        rangeCursor = width % pool.length;
      } else {
        // After the warm-up the measured nodes carry the segments in speed order; the
        // downloader gives the fast ones the larger share. One other node rides along per
        // segment: one that never answered, or one whose measurement has gone stale because
        // it was too slow to be used. Routes change, so a slow node is not slow for good.
        // While fewer nodes are measured than a segment uses, the free places go to the others
        // as well: the downloader gives an unmeasured node only a trial piece or two, so
        // finding the good nodes quickly costs little.
        const measured = pool.filter((url) => measuredNow(url, now));
        const rest = pool.filter((url) => !measuredNow(url, now));
        const places = Math.min(rest.length, Math.max(1, width - measured.length));
        const explore = Array.from({ length: places }, (_item, index) => rest[(rangeCursor + index) % rest.length]);
        rangeCursor = (rangeCursor + places) % Math.max(1, pool.length);
        selected = [...measured.slice(0, width - explore.length), ...explore];
        for (const url of pool) {
          if (selected.length >= Math.min(3, pool.length)) break;
          if (!selected.includes(url)) selected.push(url);
        }
      }
      mediaRangeCount += 1;
      return selected;
    }

    function startupCandidates() {
      const now = Date.now();
      const primary = representation?.baseUrl || representation?.base_url;
      const backup = representation?.backupUrl || representation?.backup_url || representation?.backup_url_list || [];
      // The first request also races the addresses Bilibili handed out, except in the custom
      // mode, which keeps to the picked servers.
      const originals = customServers(getMode?.(), getCustomHosts?.()).length ? [] : [primary, ...(Array.isArray(backup) ? backup : [])]
        .map(safeMediaUrl)
        .filter(Boolean);
      const candidates = unbanned([...originals, ...allUrls()]
        .filter((url, index, all) => all.indexOf(url) === index))
        .filter((url) => (health.get(url)?.blockedUntil || 0) <= now);
      return candidates.slice(0, 8);
    }

    function rescueCandidates() {
      const now = Date.now();
      return urls()
        .filter((url) => (health.get(url)?.blockedUntil || 0) <= now)
        .sort(bySpeed);
    }

    function success(url, bps) {
      bans?.success?.(url);
      const old = measurement(url) || {};
      const now = Date.now();
      const measured = bps > 0;
      health.set(url, { failures: 0, blockedUntil: 0, lastSuccessAt: now });
      routes.set(routeOf(url), {
        lastSuccessAt: now,
        // No speed comes with a transfer too short to measure one; the last one stays, and
        // keeps its age.
        lastMeasuredAt: measured ? now : old.lastMeasuredAt || 0,
        bps: !measured ? old.bps || 0 : old.bps ? old.bps * 0.65 + bps * 0.35 : bps
      });
    }

    // The speed of a transfer that was cut off before its end. It says how fast the node is
    // and nothing more: the address has not proven itself, and earlier failures stay.
    function sample(url, bps) {
      if (!(bps > 0)) return;
      const old = measurement(url) || {};
      routes.set(routeOf(url), {
        lastSuccessAt: old.lastSuccessAt || 0,
        lastMeasuredAt: Date.now(),
        bps: old.bps ? old.bps * 0.65 + bps * 0.35 : bps
      });
    }

    function failure(url, error, receivedBytes = 0) {
      if (error?.name === "AbortError") return;
      bans?.record(url, receivedBytes, error);
      const old = health.get(url) || {};
      const failures = (old.failures || 0) + 1;
      health.set(url, {
        ...old,
        failures,
        blockedUntil: Date.now() + Math.min(60000, 3000 * (2 ** Math.min(failures, 4)))
      });
    }

    function status() {
      const now = Date.now();
      // A refused address says nothing about its node, so it is left out of the node list.
      const all = allUrls();
      const usable = bans?.allowsAddress ? all.filter(bans.allowsAddress) : all;
      return (usable.length ? usable : all).map((url) => {
        const item = health.get(url) || {};
        const nodeBanned = bans && !(bans.allowsNode ? bans.allowsNode(url) : bans.allows(url));
        return {
          host: new URL(url).hostname,
          state: nodeBanned ? "banned" : (item.blockedUntil || 0) > now ? "blocked" : measurement(url)?.lastSuccessAt ? "healthy" : "untested",
          bps: measurement(url)?.bps || 0
        };
      });
    }

    const allows = (url) => !bans || bans.allows(url);
    // The measured download speed of an address, for weighting piece assignments. 0 when
    // there is none or it has gone stale.
    const speed = (url) => (measuredNow(url) ? measurement(url)?.bps || 0 : 0);
    return Object.freeze({ allows, failure, ordered, rangeCandidates, rescueCandidates, sample, speed, startupCandidates, status, success, urls });
  }

  root.__BILI_CDN_RESOLVER_FACTORY__ = Object.freeze({
    GLOBAL_HOSTS,
    MAINLAND_HOSTS,
    OVERSEAS_HOSTS,
    createBanList,
    createResolver,
    isAkamaiUrl,
    representationUrls,
    swapOrdinaryHost
  });
})(globalThis);

(function installIdmDownloader(root) {
  "use strict";

  const core = root.__BILI_RANGE_CORE__;
  if (!core) return;

  const PIECE_ROUNDS = 3;
  const PIECE_RETRY_WINDOW_MS = 25000;
  // Below this a resumed request saves less than its own round trip costs.
  const RESUME_MIN_BYTES = 32 * 1024;
  // Hedging a piece with a playback deadline (see hedgeDue): a first copy projected to finish
  // this long before the deadline gets no copy yet; one receiving at least HEDGE_PACE of the
  // usual connection speed is on pace; a copy's node measured HEDGE_FASTER times faster than the
  // first copy is receiving is worth a copy anyway.
  const HEDGE_SLACK_MS = 1500;
  const HEDGE_PACE = 0.6;
  const HEDGE_FASTER = 1.5;
  // Queue classes, served in this order: the startup probe and init/index, then startup
  // pieces, then everything else. A class never waits behind a lower one.
  const QUEUE_CRITICAL = 0, QUEUE_STARTUP = 1, QUEUE_ORDINARY = 2;
  // Priority an ordinary request with a playback deadline gains per millisecond of waiting:
  // 20 (a hedge copy's boost) in 0.9 s.
  const QUEUE_AGING_PER_MS = 20 / 900;
  // A shorter transfer is mostly round trip. The tail of a resumed piece can be a few KiB,
  // and counting it would mark down the very node that came to the rescue.
  const SPEED_SAMPLE_MIN_BYTES = 48 * 1024;

  function abortError(reason) {
    if (reason instanceof Error || reason instanceof DOMException) return reason;
    return new DOMException("播放器任务已取消", "AbortError");
  }

  class Semaphore {
    constructor(limit) {
      this.limit = limit;
      this.active = 0;
      this.queue = [];
      this.sequence = 0;
    }

    setLimit(limit) {
      this.limit = Math.max(1, Math.min(512, Math.trunc(limit) || 1));
      this.drain();
    }

    drain() {
      try { this.drainQueue(); } finally { this.onChange?.(this.active, this.limit, this.queue.length); }
    }

    drainQueue() {
      while (this.active < this.limit && this.queue.length) {
        const now = performance.now();
        const urgency = entry => {
          // Read again at every pass: the player's deadline moves with the playhead and the
          // playback rate, and a queued piece may have become due while it waited.
          const deadlineAt = entry.deadline ? entry.deadline() : entry.deadlineAt;
          if (!Number.isFinite(deadlineAt)) return 0;
          const remaining = deadlineAt - now;
          if (remaining <= 0) return 12;
          if (remaining <= 750) return 9;
          if (remaining <= 2000) return 6;
          return 0;
        };
        // A bounded, recomputed boost prevents overdue primaries from sitting behind
        // prefetch work without turning the queue back into strict deadline ordering. A
        // request with a deadline also gains priority while it waits, so a piece queued long
        // ago is not passed over again and again by newer ones of a slightly higher priority;
        // requests without one (compatibility mode, the desktop client) keep the fixed order.
        // Sorting inside the class keeps the startup probe, init and index, and then the
        // startup pieces, ahead of ordinary media whatever the boosts add up to.
        const rank = entry => entry.priority + urgency(entry)
          + (entry.ages ? (now - entry.queuedAt) * QUEUE_AGING_PER_MS : 0);
        this.queue.sort((a, b) => a.queueClass - b.queueClass || rank(b) - rank(a)
          || a.sequence - b.sequence);
        const entry = this.queue.shift();
        entry.signal?.removeEventListener("abort", entry.cancel);
        if (entry.signal?.aborted) {
          entry.reject(abortError(entry.signal.reason));
          continue;
        }
        this.active += 1;
        entry.resolve(() => {
          if (entry.released) return;
          entry.released = true;
          this.active = Math.max(0, this.active - 1);
          this.drain();
        });
      }
    }

    // deadline: a function giving the clock time playback needs this request, or null; the
    // fixed deadlineAt is what callers without one pass.
    acquire(signal, priority = 0, deadlineAt = Infinity, queueClass = QUEUE_CRITICAL, ages = false, deadline = null) {
      if (signal?.aborted) return Promise.reject(abortError(signal.reason));
      return new Promise((resolve, reject) => {
        const entry = {
          reject,
          resolve,
          signal,
          released: false,
          priority: Number(priority) || 0,
          deadlineAt: Number.isFinite(deadlineAt) ? deadlineAt : Infinity,
          deadline,
          queueClass,
          ages,
          queuedAt: performance.now(),
          sequence: this.sequence++
        };
        entry.cancel = () => {
          const index = this.queue.indexOf(entry);
          if (index < 0) return;
          this.queue.splice(index, 1);
          signal.removeEventListener("abort", entry.cancel);
          reject(abortError(signal.reason));
        };
        signal?.addEventListener("abort", entry.cancel, { once: true });
        this.queue.push(entry);
        this.drain();
        this.onChange?.(this.active, this.limit, this.queue.length);
      });
    }
  }

  // 自动线程数. One controller for the whole page: the thread count starts at 8 and climbs a
  // ladder towards 32 on every sign that the download is not keeping up with playback
  // (the player stalls; a low buffer stops growing while bytes keep arriving; a
  // connection waits too long for its first byte while every slot is busy). Every step up
  // is a trial: ten seconds later the bytes per second must have grown, otherwise the
  // step is taken back to where it started and that level rests for a while — more
  // connections that bring nothing only add risk. A server refusing the load (412, 429)
  // steps it back too, and nothing climbs past a refused level until it has rested. The
  // level is kept across videos on the same page; a new page starts at 8 again.
  //
  // Each start (a new video, a seek outside the buffer) opens with at least 16 threads: the
  // first seconds are when a slow node turns into a spinning wheel. Once the buffer is well
  // ahead, the count steps back down to the level the page had before. A sign of not keeping
  // up meanwhile climbs as usual and ends the start there; so does half a minute without
  // catching up. From then on the rules above carry on.
  const AUTO_LADDER = Object.freeze([8, 12, 16, 24, 32]);
  const AUTO_STARTUP_LEVEL = 2;
  const AUTO_STARTUP_COMFORT_SECONDS = 15;
  const AUTO_STARTUP_MAX_MS = 30000;
  const AUTO_STEP_COOLDOWN_MS = 2500;
  const AUTO_TRIAL_MS = 10000;
  const AUTO_WINDOW_MS = 5000;
  const AUTO_BUCKET_MS = 250;
  const AUTO_REST_MS = 90000;
  const AUTO_PUSHBACK_REST_MS = 180000;
  const AUTO_LOW_BUFFER_SECONDS = 6;
  const AUTO_PRESSURE_MS = 1000;
  const AUTO_ACTIVITY_MS = 1500;

  function createAutoConcurrency({ now = () => performance.now() } = {}) {
    const listeners = new Set();
    const state = {
      level: 0, changedAt: 0, reason: "起步", steps: 0, trial: null,
      // level index -> { until, hard }: hard rests (refusals) also cap every level above.
      resting: new Map(),
      buckets: [], lastActivityAt: -Infinity,
      // Time the connections spent saturated: intervals of { from, to } within the window.
      saturated: false, saturatedSince: 0, saturatedSpans: [],
      aheadSamples: [], pressureSince: 0,
      // The start of a session while it runs above the page's own level: { base, until }.
      startup: null
    };
    const threads = () => AUTO_LADDER[state.level];

    function pruneBuckets(at) {
      while (state.buckets.length && at - state.buckets[0].at > AUTO_WINDOW_MS) state.buckets.shift();
    }

    // Bytes per second over the window, from completed pieces only: a hedge copy that lost
    // its race is not delivery.
    function throughput(at = now()) {
      pruneBuckets(at);
      if (!state.buckets.length) return 0;
      const bytes = state.buckets.reduce((sum, item) => sum + item.bytes, 0);
      // Over the time between the first and the last delivery in the window: an idle tail
      // (nothing wanted) is not slowness.
      return bytes * 1000 / Math.max(1000, state.buckets.at(-1).at - state.buckets[0].at + AUTO_BUCKET_MS);
    }

    // The share of the window during which every slot was busy and pieces were queued.
    function saturation(at = now()) {
      const from = at - AUTO_WINDOW_MS;
      state.saturatedSpans = state.saturatedSpans.filter((span) => span.to > from);
      let busy = state.saturatedSpans.reduce((sum, span) => sum + Math.max(0, span.to - Math.max(span.from, from)), 0);
      if (state.saturated) busy += Math.max(0, at - Math.max(state.saturatedSince, from));
      return Math.min(1, busy / AUTO_WINDOW_MS);
    }

    function resting(level, at) {
      const rest = state.resting.get(level);
      if (!rest) return null;
      if (rest.until <= at) { state.resting.delete(level); return null; }
      return rest;
    }

    function setLevel(level, reason, trial) {
      const previous = threads();
      const at = now();
      state.level = level;
      state.changedAt = at;
      state.reason = reason;
      state.steps += 1;
      state.trial = trial || null;
      state.pressureSince = 0;
      for (const listener of listeners) {
        try { listener({ threads: threads(), previous, reason }); } catch (_error) {}
      }
    }

    // Up one level. A level resting after a refusal caps the climb; one resting after a
    // fruitless trial is skipped only by a strong signal (a stall), not by pressure.
    function stepUp(reason, strong) {
      const at = now();
      if (at - state.changedAt < AUTO_STEP_COOLDOWN_MS) return false;
      if (resting(state.level, at)?.hard) return false;
      let next = state.level + 1;
      while (next < AUTO_LADDER.length) {
        const rest = resting(next, at);
        if (!rest) break;
        if (rest.hard || !strong) return false;
        next += 1;
      }
      if (next >= AUTO_LADDER.length) return false;
      setLevel(next, reason, { from: state.level, level: next, at, baseline: throughput(at), stalled: false });
      // Not keeping up even with the start's threads: the start ends at this level.
      state.startup = null;
      return true;
    }

    // How high a start may go: up to 16 threads, but not onto or past a level the server
    // refused (a fruitless trial does not hold it back; the start comes down on its own).
    function startupLevel(at) {
      if (resting(state.level, at)?.hard) return state.level;
      let level = state.level;
      while (level < AUTO_STARTUP_LEVEL && !resting(level + 1, at)?.hard) level += 1;
      return level;
    }

    function stepDown(target, restLevel, reason, restMs, hard) {
      state.resting.set(restLevel, { until: now() + restMs, hard });
      if (target >= state.level) return false;
      setLevel(target, reason, null);
      return true;
    }

    // A step up has had its time: did the extra connections deliver? Only judged when the
    // connections were busy meanwhile; an idle download (buffer full) proves nothing, and
    // so does a stall in between. Without any gain the step goes back to where it started.
    function judgeTrial(at) {
      const trial = state.trial;
      if (!trial || at - trial.at < AUTO_TRIAL_MS) return;
      state.trial = null;
      if (trial.stalled || saturation(at) < 0.6 || trial.baseline <= 0) return;
      if (throughput(at) < trial.baseline) {
        stepDown(trial.from, trial.level, `${AUTO_LADDER[trial.level]} 线程没有比 ${AUTO_LADDER[trial.from]} 线程更快`, AUTO_REST_MS, false);
      }
    }

    return Object.freeze({
      ladder: AUTO_LADDER,
      threads,
      subscribe(listener) { listeners.add(listener); return () => listeners.delete(listener); },
      // A piece arrived whole.
      delivered(bytes, at = now()) {
        const last = state.buckets.at(-1);
        if (last && at - last.at < AUTO_BUCKET_MS) last.bytes += bytes;
        else state.buckets.push({ at, bytes });
        pruneBuckets(at);
        judgeTrial(at);
      },
      // Bytes are flowing on some connection right now.
      activity(at = now()) {
        state.lastActivityAt = at;
      },
      // The connections' state whenever it changes.
      demand(active, limit, queued, at = now()) {
        const saturated = active >= limit && queued > 0;
        if (saturated === state.saturated) return;
        if (state.saturated) state.saturatedSpans.push({ from: state.saturatedSince, to: at });
        state.saturated = saturated;
        state.saturatedSince = at;
        saturation(at);
      },
      // The player stalled: more threads at once.
      stall(reason = "播放卡了一下") {
        if (state.trial) state.trial.stalled = true;
        return stepUp(reason, true);
      },
      // The buffer ahead of the playhead, a few times a second while playing. A low buffer
      // that has not grown over the last second although bytes keep arriving, for a whole
      // second, means the connections are too few.
      buffer(ahead, playing, at = now()) {
        state.aheadSamples.push({ at, ahead });
        while (state.aheadSamples.length && at - state.aheadSamples[0].at > AUTO_PRESSURE_MS + AUTO_BUCKET_MS) state.aheadSamples.shift();
        // The start: once well ahead, one step back down per cooldown towards the page's level.
        const start = state.startup;
        if (start && at >= start.until) state.startup = null;
        else if (start && ahead >= AUTO_STARTUP_COMFORT_SECONDS && at - state.changedAt >= AUTO_STEP_COOLDOWN_MS) {
          if (state.level > start.base) setLevel(state.level - 1, `开头已经跟上，线程数降到 ${AUTO_LADDER[state.level - 1]}`, null);
          if (state.level <= start.base) state.startup = null;
        }
        const earlier = state.aheadSamples.find((item) => at - item.at >= AUTO_PRESSURE_MS);
        const downloading = at - state.lastActivityAt < AUTO_ACTIVITY_MS;
        const pressed = playing && downloading && ahead < AUTO_LOW_BUFFER_SECONDS && earlier && ahead <= earlier.ahead + 0.05;
        if (!pressed) { state.pressureSince = 0; return false; }
        if (!state.pressureSince) { state.pressureSince = at; return false; }
        if (at - state.pressureSince < AUTO_PRESSURE_MS) return false;
        state.pressureSince = 0;
        return stepUp("缓冲跟不上播放", false);
      },
      // A connection waited too long for its first byte while every slot was busy.
      slow() {
        return saturation() >= 0.6 ? stepUp("连接排队等太久", false) : false;
      },
      // The server refused the load: back one level, and nothing climbs past this one for
      // a while.
      pushback(status) {
        return stepDown(Math.max(0, state.level - 1), state.level, `服务器返回 ${status}`, AUTO_PUSHBACK_REST_MS, true);
      },
      // A new playback session: what the buffer did before means nothing now, and the start
      // runs with more threads. A session that begins while another one's start is still
      // running keeps the page's own level to come back to.
      newSession() {
        const at = now();
        state.aheadSamples.length = 0;
        state.pressureSince = 0;
        state.trial = null;
        state.buckets.length = 0;
        state.saturatedSpans.length = 0;
        if (state.saturated) state.saturatedSince = at;
        const base = state.startup ? state.startup.base : state.level;
        const target = startupLevel(at);
        if (target > state.level) setLevel(target, `开头先用 ${AUTO_LADDER[target]} 线程`, null);
        state.startup = state.level > base ? { base, until: at + AUTO_STARTUP_MAX_MS } : null;
      },
      status() {
        const at = now();
        return {
          threads: threads(), level: state.level, reason: state.reason, steps: state.steps, changedAt: state.changedAt,
          throughputBps: Math.round(throughput(at)), saturation: Math.round(saturation(at) * 100) / 100,
          buckets: state.buckets.length, activityAgeMs: Math.round(at - state.lastActivityAt),
          resting: [...state.resting.entries()].filter(([, rest]) => rest.until > at).map(([level, rest]) => ({ threads: AUTO_LADDER[level], hard: rest.hard, forMs: Math.round(rest.until - at) })),
          trial: state.trial ? { from: AUTO_LADDER[state.trial.from], level: AUTO_LADDER[state.trial.level], ageMs: Math.round(at - state.trial.at), baselineBps: Math.round(state.trial.baseline), stalled: state.trial.stalled } : null,
          startup: state.startup ? { base: AUTO_LADDER[state.startup.base], forMs: Math.round(state.startup.until - at) } : null
        };
      },
      reset() {
        state.level = 0; state.changedAt = 0; state.reason = "起步"; state.steps = 0; state.trial = null;
        state.resting.clear(); state.buckets.length = 0; state.lastActivityAt = -Infinity;
        state.saturated = false; state.saturatedSince = 0; state.saturatedSpans.length = 0;
        state.aheadSamples.length = 0; state.pressureSince = 0; state.startup = null;
      }
    });
  }
  const autoConcurrency = createAutoConcurrency();
  // Every downloader on the page follows the controller's count at once.
  const autoFollowers = new Set();
  autoConcurrency.subscribe(() => {
    for (const ref of autoFollowers) {
      const follow = ref.deref();
      if (follow) follow(); else autoFollowers.delete(ref);
    }
  });

  function createDownloader(options) {
    const nativeFetch = options.nativeFetch || root.fetch.bind(root);
    const getSettings = options.getSettings;
    const onTransfer = typeof options.onTransfer === "function" ? options.onTransfer : () => null;
    // The page replaces its settings object when something changes, so the reference
    // tells whether the previous normalization is still valid.
    let rawSettings = null;
    let normalizedSettings = null;
    let autoView = null;
    function config() {
      const raw = getSettings();
      if (raw !== rawSettings || !normalizedSettings) {
        rawSettings = raw;
        normalizedSettings = core.normalizeSettings(raw);
        autoView = null;
      }
      if (!normalizedSettings.autoConcurrency) return normalizedSettings;
      // In the automatic mode the thread count is the controller's, everything else the viewer's.
      const threads = autoConcurrency.threads();
      if (!autoView || autoView.concurrency !== threads) autoView = { ...normalizedSettings, concurrency: threads };
      return autoView;
    }
    const semaphore = new Semaphore(config().concurrency);
    const applySettings = () => semaphore.setLimit(config().concurrency);
    autoFollowers.add(new WeakRef(applySettings));
    semaphore.onChange = (active, limit, queued) => { if (config().autoConcurrency) autoConcurrency.demand(active, limit, queued); };

    // What one connection typically delivers here and how long a sub-chunk typically
    // takes. Sub-chunk sizing and the hedge delay follow these measurements.
    const meter = { connectionBps: 0, pieceMs: 0 };
    function recordMeter(bytes, elapsedMs) {
      if (bytes < SPEED_SAMPLE_MIN_BYTES || elapsedMs <= 0) return;
      const bps = bytes * 1000 / elapsedMs;
      meter.connectionBps = meter.connectionBps ? meter.connectionBps * 0.7 + bps * 0.3 : bps;
      meter.pieceMs = meter.pieceMs ? meter.pieceMs * 0.7 + elapsedMs * 0.3 : elapsedMs;
    }

    // A sub-chunk should keep its connection busy for a good part of a second, otherwise
    // request round trips dominate on high-latency routes. 64 KiB stays the floor while
    // the speed is still unknown, and a range still splits into at least one piece per
    // node: the total bandwidth only grows by spreading over hosts, and the hedges
    // against a stalling one need more than a single request to work with.
    function adaptiveMinChunk(settings, rangeLength, pieceLimit, hostCount = 4) {
      if (!meter.connectionBps) return settings.minChunkBytes;
      const target = Math.floor(meter.connectionBps * 0.6 / (64 * 1024)) * 64 * 1024;
      const spread = Math.ceil(rangeLength / Math.max(1, Math.min(Math.max(4, hostCount), pieceLimit)));
      return Math.max(settings.minChunkBytes, Math.min(1024 * 1024, target, spread));
    }

    // A second copy starts once a piece takes clearly longer than pieces have been
    // taking, instead of always waiting the full fixed delay.
    function hedgeDelayMs(settings) {
      return meter.pieceMs
        ? Math.max(250, Math.min(settings.hedgeDelayMs, Math.round(meter.pieceMs * 1.5)))
        : settings.hedgeDelayMs;
    }

    // Whether the second copy of a piece with a playback deadline should start now. Checked
    // every 50 ms once the first copy holds a connection (a copy of a request still queued
    // would only queue as well, and with its higher priority take the connection meant for
    // it). first: the first copy (when it started, bytes received, bytes asked for); the delay
    // counts from its start. copyBps: the measured speed of the copy's node, 0 when unknown.
    // - No data yet, or nothing new for a whole delay (stopped): copy.
    // - A deadline it meets with time to spare at its speed so far: no copy yet, the bandwidth
    //   goes to pieces needed sooner.
    // - The copy's node known to be clearly faster: copy.
    // - Slower than connections usually are: copy.
    // - On pace: a copy on a node known to be no faster only takes the next piece's connection
    //   and bandwidth; one on a node not measured yet is tried, as the chance of a faster one.
    //   A piece that will miss its deadline even so may spend one of the range's rescue slots
    //   on that node anyway: its measurement can be stale (a node that was slow a minute ago
    //   may have recovered), and waiting for the request to time out costs far more.
    function hedgeDue(first, delayMs, deadlineAt, copyBps, rescue) {
      const now = performance.now(), ran = now - first.startedAt;
      const got = first.recorder.bytes;
      if (got !== first.seenBytes) {
        first.seenBytes = got;
        first.seenAt = now;
      }
      if (ran < delayMs) return false;
      if (!got || now - first.seenAt >= delayMs) return true;
      const rate = got * 1000 / ran;
      if (now + Math.max(0, first.length - got) * 1000 / rate <= deadlineAt - HEDGE_SLACK_MS) return false;
      if (copyBps > rate * HEDGE_FASTER) return true;
      if (!(meter.connectionBps > 0) || rate < meter.connectionBps * HEDGE_PACE) return true;
      if (!(copyBps > 0)) return true;
      return now + Math.max(0, first.length - got) * 1000 / rate > deadlineAt
        && Boolean(rescue?.claimStale?.());
    }

    // When playback needs a range, as a clock time; Infinity when the caller did not say.
    // options.deadlineAt is that time, options.deadlineMs the time left; either can be a
    // function, read again at every check, so a new playback rate or position also moves the
    // deadline of pieces already on their way.
    function deadlineOf(options) {
      const read = (value, relative) => {
        const ms = Number(value);
        if (value == null || !Number.isFinite(ms)) return Infinity;
        return relative ? performance.now() + Math.max(0, ms) : ms;
      };
      const live = (value, relative) => () => {
        try { return read(value(), relative); } catch (_error) { return Infinity; }
      };
      if (typeof options.deadlineAt === "function") return live(options.deadlineAt, false);
      if (options.deadlineAt != null && Number.isFinite(Number(options.deadlineAt))) {
        const fixed = Number(options.deadlineAt);
        return () => fixed;
      }
      if (typeof options.deadlineMs === "function") return live(options.deadlineMs, true);
      const fixed = read(options.deadlineMs, true);
      return () => fixed;
    }

    // Only measured per-request progress can spend this bounded rescue budget. The second
    // budget is for pieces that will miss their deadline while their copy's node is measured
    // as no faster: that measurement can be stale, and a bounded number of such copies per
    // range is far cheaper than waiting for a timeout.
    function createEarlyHedge(limit) {
      return {
        progressRemaining: Math.max(0, limit),
        claimProgress() {
          if (this.progressRemaining <= 0) return false;
          this.progressRemaining -= 1;
          return true;
        },
        // At least one per range, even where no connection is held back (a single-piece
        // download): one request is much cheaper than waiting out a timeout.
        staleRemaining: Math.max(1, limit),
        claimStale() {
          if (this.staleRemaining <= 0) return false;
          this.staleRemaining -= 1;
          return true;
        }
      };
    }

    async function readBody(response, controller, transferId, settings, received, report = onTransfer) {
      if (!response.body?.getReader) {
        const bytes = new Uint8Array(await response.arrayBuffer());
        received.bytes += bytes.byteLength;
        received.chunks?.push(bytes);
        if (settings.autoConcurrency) autoConcurrency.activity();
        report({ phase: "progress", id: transferId, bytes: bytes.byteLength });
        return bytes;
      }
      const reader = response.body.getReader();
      // Do not rely on fetch implementations to unblock read() after abort. A
      // pending reader must release its concurrency slot before a quality change.
      const cancelReader = () => { reader.cancel(controller.signal.reason).catch(() => {}); };
      controller.signal.addEventListener("abort", cancelReader, { once: true });
      if (controller.signal.aborted) cancelReader();
      const chunks = [];
      let total = 0;
      let stallTimer = null;
      const armStall = () => {
        clearTimeout(stallTimer);
        stallTimer = setTimeout(() => controller.abort(new DOMException("CDN 子块停止传输", "TimeoutError")), settings.stallTimeoutMs);
      };
      armStall();
      try {
        while (true) {
          const { done, value } = await reader.read();
          if (controller.signal.aborted) throw abortError(controller.signal.reason);
          if (done) break;
          armStall();
          const chunk = value instanceof Uint8Array ? value : new Uint8Array(value);
          chunks.push(chunk);
          total += chunk.byteLength;
          received.bytes += chunk.byteLength;
          // The recorder keeps what a failed attempt already received, so a retry or a
          // hedge copy can ask only for the missing tail.
          received.chunks?.push(chunk);
          if (settings.autoConcurrency) autoConcurrency.activity();
          report({ phase: "progress", id: transferId, bytes: chunk.byteLength });
        }
      } finally {
        clearTimeout(stallTimer);
        controller.signal.removeEventListener("abort", cancelReader);
        reader.releaseLock?.();
      }
      const bytes = new Uint8Array(total);
      let offset = 0;
      for (const chunk of chunks) {
        bytes.set(chunk, offset);
        offset += chunk.byteLength;
      }
      return bytes;
    }

    // begin: called once the request has its connection slot, and returns what to ask for.
    // A copy that waited in the queue resumes from what the first copy has received by then,
    // not from what it had when the copy was queued.
    async function attempt(piece, url, signal, kind, resolver, priority = 0, begin = null,
      deadline = null, observeProgress = null, queueClass = QUEUE_CRITICAL) {
      const settings = config();
      const deadlineAt = deadline ? deadline() : Infinity;
      const release = await semaphore.acquire(signal, priority, deadlineAt, queueClass,
        queueClass === QUEUE_ORDINARY && Number.isFinite(deadlineAt), deadline);
      let received = { bytes: 0, chunks: [] };
      if (begin) {
        try {
          const plan = begin();
          piece = plan.part;
          received = plan.recorder;
        } catch (error) {
          release();
          throw error;
        }
      }
      const controller = new AbortController();
      const cancel = () => controller.abort(abortError(signal?.reason));
      if (signal?.aborted) cancel();
      else signal?.addEventListener("abort", cancel, { once: true });
      const firstByteTimer = setTimeout(() => controller.abort(new DOMException("CDN 首字节超时", "TimeoutError")), settings.firstByteTimeoutMs);
      const totalTimer = setTimeout(() => controller.abort(new DOMException("CDN 子块总耗时超限", "TimeoutError")), settings.attemptTimeoutMs);
      const startedAt = performance.now();
      const report = event => {
        const elapsedMs = Math.max(1, performance.now() - startedAt);
        const bps = received.bytes * 1000 / elapsedMs;
        const remaining = Math.max(0, piece.length - received.bytes);
        const payload = { ...event, receivedBytes: received.bytes, totalBytes: piece.length,
          bps, etaMs: bps > 0 ? Math.round(remaining * 1000 / bps) : null };
        observeProgress?.({ ...payload, elapsedMs });
        return onTransfer(payload);
      };
      const transferId = report({ phase: "start", kind, totalBytes: piece.length, url,
        deadlineAt: Number.isFinite(deadlineAt) ? deadlineAt : null });
      try {
        const response = await nativeFetch(url, {
          method: "GET",
          headers: { Range: `bytes=${piece.start}-${piece.end}` },
          credentials: "omit",
          cache: "no-store",
          mode: "cors",
          referrer: root.location?.href,
          referrerPolicy: "strict-origin-when-cross-origin",
          priority: priority >= 100 ? "high" : "auto",
          signal: controller.signal
        });
        clearTimeout(firstByteTimer);
        const contentRange = core.parseContentRange(response.headers.get("content-range"));
        if (response.status !== 206 || !contentRange || contentRange.start !== piece.start || contentRange.end !== piece.end) {
          // The status tells a refused signed address (4xx) apart from a node that is down.
          throw Object.assign(new Error(`Range 校验失败：HTTP ${response.status}`), { status: response.status });
        }
        const bytes = await readBody(response, controller, transferId, settings, received, report);
        if (bytes.byteLength !== piece.length) throw new Error(`子块长度不符：${bytes.byteLength}/${piece.length}`);
        const elapsedMs = Math.max(1, performance.now() - startedAt);
        recordMeter(bytes.byteLength, elapsedMs);
        // The node answered either way; only a large enough transfer says how fast it is.
        resolver.success(url, bytes.byteLength >= SPEED_SAMPLE_MIN_BYTES ? bytes.byteLength * 1000 / elapsedMs : 0);
        report({ phase: "done", id: transferId });
        return { bytes, total: contentRange.total, url };
      } catch (error) {
        const canceled = error?.name === "AbortError";
        // A copy that lost the race was cut off, not broken, and what it had received by then
        // is a measurement of its node. Without it a slow node is never measured at all: its
        // pieces are always finished by a faster copy first, and an unmeasured node only ever
        // gets trial pieces.
        if (canceled && received.bytes >= SPEED_SAMPLE_MIN_BYTES && typeof resolver.sample === "function") {
          resolver.sample(url, received.bytes * 1000 / Math.max(1, performance.now() - startedAt));
        }
        // Received bytes tell a dead node (0 KiB) apart from a transfer that stalled midway.
        resolver.failure(url, error, received.bytes);
        if (settings.autoConcurrency) {
          if (error?.status === 412 || error?.status === 429) autoConcurrency.pushback(error.status);
          else if (!canceled && error?.name === "TimeoutError" && received.bytes === 0) autoConcurrency.slow();
        }
        report({ phase: canceled ? "cancel" : "error", id: transferId, error });
        throw error;
      } finally {
        clearTimeout(firstByteTimer);
        clearTimeout(totalTimer);
        // Invalid headers can reject before readBody obtains a reader. Stop that
        // response too, otherwise it keeps downloading after releasing the slot.
        controller.abort();
        signal?.removeEventListener("abort", cancel);
        release();
      }
    }

    function pause(delayMs, signal) {
      return new Promise((resolve, reject) => {
        const timer = setTimeout(done, delayMs);
        function done() {
          signal?.removeEventListener("abort", canceled);
          resolve();
        }
        function canceled() {
          clearTimeout(timer);
          reject(abortError(signal.reason));
        }
        if (signal?.aborted) canceled();
        else signal?.addEventListener("abort", canceled, { once: true });
      });
    }

    function pieceCandidates(piece, resolver, preferredUrls, round) {
      const preferred = Array.isArray(preferredUrls) ? preferredUrls : [];
      // The first preferred address is the node this piece was assigned to by speed;
      // only a retry round moves past it.
      const preferredOffset = preferred.length ? round % preferred.length : 0;
      const rotatedPreferred = preferred.slice(preferredOffset).concat(preferred.slice(0, preferredOffset));
      const rescue = (typeof resolver.rescueCandidates === "function" ? resolver.rescueCandidates() : resolver.ordered(piece.index))
        .filter((url) => !rotatedPreferred.includes(url));
      if (typeof resolver.speed === "function") {
        // The copies after the first go to the fastest known nodes, wherever they were
        // listed: a hedge that lands on the slowest node saves nothing.
        const rest = [...rotatedPreferred.slice(1), ...rescue]
          .sort((left, right) => resolver.speed(right) - resolver.speed(left));
        const candidates = rotatedPreferred.length ? [rotatedPreferred[0], ...rest] : rest;
        for (const url of resolver.ordered(piece.index)) {
          if (!candidates.includes(url)) candidates.push(url);
        }
        return candidates;
      }
      const candidates = [];
      const width = Math.max(rotatedPreferred.length, rescue.length);
      for (let index = 0; index < width; index += 1) {
        if (rotatedPreferred[index]) candidates.push(rotatedPreferred[index]);
        if (rescue[index]) candidates.push(rescue[index]);
      }
      for (const url of resolver.ordered(piece.index)) {
        if (!candidates.includes(url)) candidates.push(url);
      }
      return candidates;
    }

    async function downloadPiece(piece, resolver, signal, kind, preferredUrls, startupMode = false, priority = 0,
      deadline = null, earlyHedge = null) {
      const hasDeadline = Boolean(deadline) && Number.isFinite(deadline());
      const deadlineNow = () => (deadline ? deadline() : Infinity);
      const settings = config();
      const allowed = (url) => typeof resolver.allows !== "function" || resolver.allows(url);
      const startup = startupMode === true || startupMode === "probe";
      const probe = startupMode === "probe";
      const startedAt = performance.now();
      let lastError = null;

      // The longest contiguous run of bytes fetched from the front of this piece so far.
      // A retry or a hedge copy asks only for what is still missing and splices the two
      // halves, instead of downloading the whole piece again. Every kept byte came out
      // of a response whose 206 Content-Range was verified against this piece.
      let prefix = null;
      const keepProgress = (base, recorder) => {
        const bytes = (base?.bytes || 0) + recorder.bytes;
        if (bytes > (prefix?.bytes || 0) && bytes < piece.length) {
          prefix = { bytes, chunks: base ? [...base.chunks, ...recorder.chunks] : recorder.chunks.slice() };
        }
      };
      const liveProgress = (context) => {
        if (!context) return null;
        const chunks = context.recorder.chunks.slice();
        let bytes = context.base?.bytes || 0;
        for (const chunk of chunks) bytes += chunk.byteLength;
        return { bytes, chunks: context.base ? [...context.base.chunks, ...chunks] : chunks };
      };

      // Failing a piece ends acceleration for the whole video, and the list can be as short as
      // one working address. One slow reply must not decide that, so the list is walked again
      // after a pause; node health and bans have changed by then, so it is rebuilt each time.
      for (let round = 0; round < PIECE_ROUNDS; round += 1) {
        if (round) {
          if (performance.now() - startedAt > PIECE_RETRY_WINDOW_MS) break;
          await pause(Math.min(2000, 500 * (2 ** (round - 1))), signal);
        }
        const candidates = pieceCandidates(piece, resolver, preferredUrls, round);
        const limit = Math.min(8, candidates.length);
        const batchWidth = probe ? limit : 2;
        const tried = new Set();
        while (tried.size < limit) {
          if (signal?.aborted) throw abortError(signal.reason);
          // A node banned while this piece was waiting is skipped, unless only banned nodes are left.
          const untried = candidates.filter((url) => !tried.has(url));
          const open = untried.filter(allowed);
          const pair = (open.length ? open : untried).slice(0, batchWidth);
          if (!pair.length) break;
          pair.forEach((url) => tried.add(url));
          const controllers = pair.map(() => new AbortController());
          const cancelAll = () => controllers.forEach((controller) => controller.abort(abortError(signal?.reason)));
          if (signal?.aborted) cancelAll();
          else signal?.addEventListener("abort", cancelAll, { once: true });
          // A first copy that is refused at once (HTTP 403) should not leave the piece idle
          // for the rest of the hedge delay.
          let firstFailed = () => {};
          const firstFailure = new Promise((resolve) => { firstFailed = resolve; });
          let firstStartedAt = 0, deadlineDeficitSamples = 0, firstBecameStraggler = () => {};
          const firstStraggler = new Promise((resolve) => { firstBecameStraggler = resolve; });
          const observeFirst = event => {
            if (!hasDeadline || event.phase !== "progress" || !Number.isFinite(event.etaMs)) return;
            const deadlineAt = deadlineNow();
            const missesDeadline = Number.isFinite(deadlineAt)
              && event.etaMs >= Math.max(0, deadlineAt - performance.now());
            const slowerThanPeers = meter.connectionBps > 0 && event.bps < meter.connectionBps * 0.5
              && event.etaMs >= 500;
            const remainingToDeadline = deadlineAt - performance.now();
            deadlineDeficitSamples = Number.isFinite(deadlineAt)
              && event.etaMs - remainingToDeadline >= 250
              ? deadlineDeficitSamples + 1
              : 0;
            // A clearly slow node is rescued immediately. If the whole route is slow,
            // two consecutive deficit samples may spend the same one-per-range budget.
            if (Number.isFinite(deadlineAt)
              && ((missesDeadline && slowerThanPeers) || deadlineDeficitSamples >= 2)) {
              firstBecameStraggler();
            }
          };
          const contexts = [];
          const attempts = pair.map((url, pairIndex) => (async () => {
            if (pairIndex) await new Promise((resolve, reject) => {
              let timer = null, settled = false, earlyClaimed = false;
              const finish = (operation) => {
                if (settled) return;
                settled = true;
                if (timer) clearTimeout(timer);
                controllers[pairIndex].signal.removeEventListener("abort", canceled);
                operation();
              };
              const measured = hedgeDelayMs(settings);
              const delay = probe ? 0 : startup
                ? Math.min(hasDeadline ? 200 : 250, measured)
                : measured;
              const copyBps = () => (typeof resolver.speed === "function" ? resolver.speed(url) || 0 : 0);
              // A playback-deadline request decides once its first copy has a connection (see
              // hedgeDue); one without a deadline (compatibility mode, the desktop client)
              // keeps main's delay from the moment the piece asked, queue time included.
              const check = () => {
                if (settled) return;
                if (contexts[0] && hedgeDue(contexts[0], delay, deadlineNow(), copyBps(), earlyHedge)) return finish(resolve);
                timer = setTimeout(check, 50);
              };
              if (hasDeadline && !probe) timer = setTimeout(check, 0);
              else timer = setTimeout(() => finish(resolve), delay);
              firstStraggler.then(() => {
                if (settled || probe || earlyClaimed || !earlyHedge?.claimProgress?.()) return;
                earlyClaimed = true;
                if (timer) clearTimeout(timer);
                const grace = Math.max(0, 250 - (performance.now() - firstStartedAt));
                timer = setTimeout(() => finish(resolve), grace);
              });
              firstFailure.then(() => finish(resolve));
              const canceled = () => {
                finish(() => reject(abortError(controllers[pairIndex].signal.reason)));
              };
              if (controllers[pairIndex].signal.aborted) canceled();
              else controllers[pairIndex].signal.addEventListener("abort", canceled, { once: true });
            });
            // Resume from the longest prefix known when the request really starts: an earlier
            // failed attempt, or what the still-running first copy has received by then.
            let base = null;
            const recorder = { bytes: 0, chunks: [] };
            const begin = () => {
              if (!pairIndex) firstStartedAt = performance.now();
              base = prefix && prefix.bytes >= RESUME_MIN_BYTES ? prefix : null;
              if (pairIndex) {
                const live = liveProgress(contexts[0]);
                if (live && live.bytes >= RESUME_MIN_BYTES && live.bytes > (base?.bytes || 0)) base = live;
              }
              if (base && base.bytes >= piece.length) base = null;
              const startedAt = performance.now();
              contexts[pairIndex] = { base, recorder, startedAt, seenBytes: 0, seenAt: startedAt, length: piece.length - (base?.bytes || 0) };
              return {
                recorder,
                part: base
                  ? { index: piece.index, start: piece.start + base.bytes, end: piece.end, length: piece.length - base.bytes }
                  : piece
              };
            };
            try {
              const result = await attempt(piece, url, controllers[pairIndex].signal, kind, resolver,
                priority + (pairIndex ? 20 : 0), begin, deadline, pairIndex ? null : observeFirst,
                probe ? QUEUE_CRITICAL : startup ? QUEUE_STARTUP : QUEUE_ORDINARY);
              return base
                ? { bytes: core.concatChunks([...base.chunks, result.bytes], piece.length), total: result.total, url: result.url }
                : result;
            } catch (error) {
              keepProgress(base, recorder);
              if (!pairIndex) firstFailed();
              throw error;
            }
          })());
          try {
            const winner = await Promise.any(attempts);
            controllers.forEach((controller) => {
              if (!controller.signal.aborted) controller.abort(new DOMException("并发副本已取消", "AbortError"));
            });
            if (settings.autoConcurrency) autoConcurrency.delivered(piece.length);
            return winner;
          } catch (aggregate) {
            lastError = aggregate?.errors?.at?.(-1) || aggregate;
            if (signal?.aborted) throw abortError(signal.reason);
          } finally {
            signal?.removeEventListener("abort", cancelAll);
          }
        }
      }
      throw lastError || new Error("没有可用 CDN");
    }

    async function delayedAttempt(piece, url, delayMs, signal, kind, resolver, controller, priority = 0) {
      if (delayMs > 0) {
        await new Promise((resolve, reject) => {
          const timer = setTimeout(resolve, delayMs);
          const canceled = () => {
            clearTimeout(timer);
            reject(abortError(controller.signal.reason));
          };
          if (controller.signal.aborted) canceled();
          else controller.signal.addEventListener("abort", canceled, { once: true });
        });
      }
      if (signal?.aborted) throw abortError(signal.reason);
      return attempt(piece, url, controller.signal, kind, resolver, priority);
    }

    async function startupAttempt(piece, candidates, resolver, options) {
      const controllers = candidates.map(() => new AbortController());
      const cancelAll = () => controllers.forEach((controller) => {
        if (!controller.signal.aborted) controller.abort(abortError(options.signal?.reason));
      });
      if (options.signal?.aborted) cancelAll();
      else options.signal?.addEventListener("abort", cancelAll, { once: true });
      try {
        let winner;
        try {
          winner = await Promise.any(candidates.map((url, index) => delayedAttempt(
            piece,
            url,
            index === 0 ? 0 : index === 1 ? 120 : 300,
            options.signal,
            options.kind || "meta",
            resolver,
            controllers[index],
            220
          )));
        } catch (aggregate) {
          if (options.signal?.aborted) throw abortError(options.signal.reason);
          throw aggregate?.errors?.at?.(-1) || aggregate;
        }
        controllers.forEach((controller) => {
          if (!controller.signal.aborted) controller.abort(new DOMException("并发副本已取消", "AbortError"));
        });
        return winner;
      } finally {
        options.signal?.removeEventListener("abort", cancelAll);
      }
    }

    // Which address each piece tries first. The fastest node gets the most pieces, and a node
    // measured at under a twelfth of the best is left out entirely: a piece it starts has to
    // be rescued anyway. Its measurement goes stale after a while, and the resolver's
    // exploration slot then gives it, like any untested node, another try.
    let assignTurn = 0;
    // Trials are counted per resolver: the video and the audio track take turns on this
    // downloader, and one shared count could leave a track without a trial for good.
    const trialStates = new WeakMap();
    function assignPrimaries(urls, resolver, count) {
      if (!urls.length || count <= 0) return [];
      if (urls.length === 1) return new Array(count).fill(urls[0]);
      // Each range opens one node further on, so ranges in flight together do not all
      // send their first pieces to the same node.
      const turn = assignTurn;
      assignTurn = (assignTurn + 1) % 4096;
      const measure = typeof resolver.speed === "function" ? (url) => Math.max(0, Number(resolver.speed(url)) || 0) : () => 0;
      let known = urls.map(measure);
      const positive = known.filter((value) => value > 0);
      if (!positive.length) return Array.from({ length: count }, (_ignored, index) => urls[(index + turn) % urls.length]);
      const top = Math.max(...known);
      const eligible = urls.filter((_url, index) => !known[index] || known[index] >= top / 12);
      if (eligible.length && eligible.length < urls.length) {
        urls = eligible;
        known = urls.map(measure);
      }
      // A node without a measurement is a trial. It gets a piece or two from the end of the
      // range, which are needed last and may take longest, enough to measure it and cheap
      // when it turns out to be slow. With very few pieces there is none to spare.
      const unknown = urls.filter((_url, index) => !known[index]);
      let trials = Math.min(unknown.length * 2, Math.floor(count / 4));
      let trialState = trialStates.get(resolver);
      if (!trialState) trialStates.set(resolver, trialState = { waited: 0, cursor: 0 });
      // Small segments never have a piece to spare, and a node left out for being slow would
      // stay unmeasured for good. Every fourth such range gives up its last piece for a trial.
      if (!trials && unknown.length && count >= 2) {
        trialState.waited += 1;
        if (trialState.waited >= 4) trials = 1;
      }
      if (trials) trialState.waited = 0;
      if (unknown.length) {
        urls = urls.filter((_url, index) => known[index]);
        known = urls.map(measure);
        count -= trials;
      }
      const weights = known.map((value) => Math.max(value, top * 0.05));
      const total = weights.reduce((sum, value) => sum + value, 0);
      // Handed out in turns (smooth weighted round-robin), not in one block per node. The
      // pieces with the lowest numbers get the free connections first, and the player has
      // several segments in flight: with blocks, every segment's first pieces went to the
      // same node and the others sat idle.
      const primaries = [];
      const credit = weights.map(() => 0);
      const order = urls.map((_url, index) => (index + turn) % urls.length);
      for (let index = 0; index < count; index += 1) {
        let best = order[0];
        for (const urlIndex of order) {
          credit[urlIndex] += weights[urlIndex];
          if (credit[urlIndex] > credit[best]) best = urlIndex;
        }
        credit[best] -= total;
        primaries.push(urls[best]);
      }
      for (let index = 0; index < trials; index += 1) primaries.push(unknown[(index + trialState.cursor) % unknown.length]);
      trialState.cursor = (trialState.cursor + trials) % 4096;
      return primaries;
    }

    function preferredFor(primary, urls) {
      return primary ? [primary, ...urls.filter((url) => url !== primary)] : urls;
    }

    async function downloadStartupRange(range, resolver, options) {
      semaphore.setLimit(config().concurrency);
      const piece = { index: 0, start: range.start, end: range.end, length: range.length };
      const startedAt = performance.now();
      let lastError = null;
      // The addresses that just failed are backing off by the next round, so each round
      // moves on to the next three.
      for (let round = 0; round < PIECE_ROUNDS; round += 1) {
        if (round) {
          if (performance.now() - startedAt > PIECE_RETRY_WINDOW_MS) break;
          await pause(Math.min(2000, 500 * (2 ** (round - 1))), options.signal);
        }
        let candidates = (typeof resolver.startupCandidates === "function" ? resolver.startupCandidates() : resolver.urls())
          .filter((url, index, all) => all.indexOf(url) === index)
          .slice(0, 3);
        if (!candidates.length && round) candidates = resolver.ordered(round).slice(0, 3);
        if (!candidates.length) break;
        try {
          const winner = await startupAttempt(piece, candidates, resolver, options);
          return {
            bytes: winner.bytes,
            pieceCount: 1,
            total: winner.total || null,
            hosts: [new URL(winner.url).hostname]
          };
        } catch (error) {
          if (options.signal?.aborted) throw abortError(options.signal.reason);
          lastError = error;
        }
      }
      throw lastError || new Error("没有可用 CDN");
    }

    async function downloadStartupMediaRange(range, resolver, options, settings) {
      const effectiveConcurrency = settings.concurrency;
      semaphore.setLimit(effectiveConcurrency);
      const candidateUrls = (typeof resolver.rangeCandidates === "function" ? resolver.rangeCandidates() : resolver.urls())
        .filter((url, index, all) => all.indexOf(url) === index);
      const headLength = Math.min(range.length, Math.max(64 * 1024, settings.minChunkBytes));
      const head = {
        index: 0,
        start: range.start,
        end: range.start + headLength - 1,
        length: headLength
      };
      const headResult = await downloadPiece(
        head,
        resolver,
        options.signal,
        options.kind || "media",
        candidateUrls,
        "probe",
        220,
        options.deadline
      );
      await options.onOrderedChunk(headResult.bytes, head, headResult.total);
      if (head.end >= range.end) {
        options.onStartupScheduled?.();
        return {
          bytes: null,
          byteLength: range.length,
          pieceCount: 1,
          streamed: true,
          total: headResult.total || null,
          hosts: [new URL(headResult.url).hostname]
        };
      }

      const rescueReserve = Math.max(1, Math.min(16, Math.ceil(effectiveConcurrency / 8)));
      const mediaBudget = Math.max(1, effectiveConcurrency - rescueReserve);
      const audioBudget = Math.max(1, Math.min(mediaBudget, Math.ceil(effectiveConcurrency / 8)));
      const pieceBudget = options.kind === "audio"
        ? audioBudget
        : Math.max(1, mediaBudget - audioBudget);
      const pieces = core.splitRange(
        head.end + 1,
        range.end,
        pieceBudget,
        adaptiveMinChunk(settings, range.end - head.end, pieceBudget, candidateUrls.length)
      ).map((piece, index) => ({ ...piece, index: index + 1 }));
      const ordered = new Array(pieces.length);
      let nextOrderedIndex = 0;
      let flushOperation = Promise.resolve();
      const flushOrdered = () => {
        flushOperation = flushOperation.then(async () => {
          while (ordered[nextOrderedIndex]) {
            const item = ordered[nextOrderedIndex];
            ordered[nextOrderedIndex] = null;
            await options.onOrderedChunk(item.bytes, pieces[nextOrderedIndex], item.total);
            nextOrderedIndex += 1;
          }
        });
        return flushOperation;
      };
      // The probe measured at least its own winner, so the pieces spread over the nodes by
      // speed at once; the proven address stays each piece's first fallback. Only addresses
      // that have delivered carry the first segment: a node whose probe never finished would
      // otherwise get a share of it and hold up the start. The others stay available for
      // rescue, and later ranges try them.
      const measured = typeof resolver.speed === "function" ? (url) => resolver.speed(url) > 0 : () => false;
      const provenUrls = candidateUrls.filter((url) => url === headResult.url || measured(url));
      const primaries = assignPrimaries(provenUrls.length ? provenUrls : [headResult.url], resolver, pieces.length);
      const earlyHedge = createEarlyHedge(rescueReserve);
      const pendingPieces = pieces.map(async (piece, orderedIndex) => {
        const result = await downloadPiece(
          piece,
          resolver,
          options.signal,
          options.kind || "media",
          preferredFor(primaries[orderedIndex], [headResult.url, ...candidateUrls.filter((url) => url !== headResult.url)]),
          true,
          120 - Math.min(30, piece.index),
          options.deadline,
          earlyHedge
        );
        ordered[orderedIndex] = result;
        await flushOrdered();
        return result;
      });
      options.onStartupScheduled?.();
      const results = await Promise.all(pendingPieces);
      await flushOperation;
      const totals = [headResult, ...results].map((item) => item.total).filter(Number.isSafeInteger);
      if (totals.length && totals.some((value) => value !== totals[0])) throw new Error("不同 CDN 返回的文件总长度不一致");
      return {
        bytes: null,
        byteLength: range.length,
        pieceCount: pieces.length + 1,
        streamed: true,
        total: totals[0] || null,
        hosts: [...new Set([headResult, ...results].map((item) => new URL(item.url).hostname))]
      };
    }

    async function downloadRange(range, resolver, options = {}) {
      const settings = config();
      if (options.kind === "meta") return downloadStartupRange(range, resolver, options);
      // One deadline for the whole range, resolved at its boundary: every piece, including work
      // scheduled after the startup probe, refers to the same playback instant.
      const deadline = deadlineOf(options);
      const parallel = options.parallel !== false;
      if (options.startup === true && parallel && typeof options.onOrderedChunk === "function") {
        return downloadStartupMediaRange(range, resolver, { ...options, deadline }, settings);
      }
      const preferredUrls = parallel && typeof resolver.rangeCandidates === "function"
        ? resolver.rangeCandidates()
        : resolver.urls();
      const globalConcurrency = parallel ? settings.concurrency : 1;
      const requestedConcurrency = Number.isFinite(Number(options.maxConcurrency))
        ? Math.max(1, Math.trunc(Number(options.maxConcurrency)))
        : globalConcurrency;
      const effectiveConcurrency = parallel ? Math.min(globalConcurrency, requestedConcurrency) : 1;
      // Fewer primary pieces than slots is not a hard-reserved connection: it gives a
      // stalled piece's hedge/retry room to start immediately while the other primaries run.
      semaphore.setLimit(globalConcurrency);
      const basePriority = Number.isFinite(Number(options.priority)) ? Number(options.priority) : 50;
      const rescueReserve = parallel && effectiveConcurrency >= 8
        ? Math.min(8, Math.max(1, Math.ceil(effectiveConcurrency / 8)))
        : 0;
      const pieceConcurrency = options.startup === true
        ? Math.max(1, Math.min(22, effectiveConcurrency))
        : Math.max(1, effectiveConcurrency - rescueReserve);
      const pieces = core.splitRange(
        range.start,
        range.end,
        pieceConcurrency,
        parallel ? adaptiveMinChunk(settings, range.length, pieceConcurrency, preferredUrls.length) : Number.MAX_SAFE_INTEGER
      );
      const primaries = parallel ? assignPrimaries(preferredUrls, resolver, pieces.length) : [];
      const earlyHedge = createEarlyHedge(rescueReserve);
      const progressive = typeof options.onOrderedChunk === "function";
      const ordered = new Array(pieces.length);
      let nextOrderedIndex = 0;
      let flushOperation = Promise.resolve();
      const flushOrdered = () => {
        flushOperation = flushOperation.then(async () => {
          while (ordered[nextOrderedIndex]) {
            const item = ordered[nextOrderedIndex];
            ordered[nextOrderedIndex] = null;
            await options.onOrderedChunk(item.bytes, pieces[nextOrderedIndex], item.total);
            nextOrderedIndex += 1;
          }
        });
        return flushOperation;
      };
      const results = await Promise.all(pieces.map(async (piece) => {
        const result = await downloadPiece(
          piece,
          resolver,
          options.signal,
          options.kind || "media",
          preferredFor(primaries[piece.index], preferredUrls),
          options.startup === true,
          basePriority - Math.min(20, piece.index),
          deadline,
          earlyHedge
        );
        if (progressive) {
          ordered[piece.index] = result;
          await flushOrdered();
        }
        return result;
      }));
      if (progressive) await flushOperation;
      const totals = results.map((item) => item.total).filter(Number.isSafeInteger);
      if (totals.length && totals.some((value) => value !== totals[0])) throw new Error("不同 CDN 返回的文件总长度不一致");
      return {
        bytes: progressive ? null : core.concatChunks(results.map((item) => item.bytes), range.length),
        byteLength: range.length,
        pieceCount: pieces.length,
        streamed: progressive,
        total: totals[0] || null,
        hosts: [...new Set(results.map((item) => new URL(item.url).hostname))]
      };
    }

    return Object.freeze({ downloadRange, applySettings, getConcurrency: () => semaphore.limit });
  }

  root.__BILI_IDM_DOWNLOADER_FACTORY__ = Object.freeze({ createDownloader, createAutoConcurrency, autoConcurrency });
})(globalThis);

(function(root) {
"use strict";
const core = root.__BILI_RANGE_CORE__;
let active = null, passthroughFetch = root.fetch.bind(root);
  // Only bounded, ordinary media GETs are replaced. Authentication, conditional
  // requests, open-ended ranges, sync XHR and unknown files retain native behavior.
  function planRequest(url, method, headers, credentials) {
    if (!active || active.disposed || !active.settings().enabled || credentials === "include") return null;
    if ([...headers.keys()].some(name => !["range", "accept"].includes(name))) return null;
    const plan = root.__YTR_SITE__.rangePlan(url, method, headers);
    return plan ? { owner: active, ...plan } : null;
  }

  // Both loaders use one downloader, with the existing CDN policy, retries,
  // thread budget and transfer statistics. FetchLoader can swallow reader errors:
  // finish and validate the range before resolving fetch, so failure rejects the
  // request instead of becoming an invisible error in a partially delivered body.
  async function download(plan, signal, progress = () => {}) {
    const { owner, range, track } = plan;
    if (signal?.aborted) throw signal.reason;
    if (owner.disposed) throw new DOMException("加速任务已停止", "AbortError");
    const controller = new AbortController();
    const cancel = () => controller.abort(signal.reason);
    signal?.addEventListener("abort", cancel, { once: true });
    owner.jobs.add(controller);
    let received = 0, total = null;
    const chunks = [];
    try {
      const result = await owner.downloader.downloadRange(range, owner.resolver(plan.url, track), {
        signal: controller.signal, parallel: true, startup: true, kind: track.kind,
        onOrderedChunk(bytes, piece, fileTotal) {
          if (controller.signal.aborted) throw controller.signal.reason;
          if (piece.start !== range.start + received || bytes.byteLength !== piece.length
            || !Number.isSafeInteger(fileTotal) || fileTotal <= range.end
            || (total !== null && total !== fileTotal)) throw new Error("媒体 Range 校验失败");
          total = fileTotal;
          chunks.push(bytes);
          received += bytes.byteLength;
          progress(received, total);
        }
      });
      if (controller.signal.aborted) throw controller.signal.reason;
      if (received !== range.length || result.total !== total) throw new Error("媒体 Range 长度不符");
      const bytes = core.concatChunks(chunks, received);
      owner.delivered(track, result);
      return { bytes, headers: new Headers({
        "Content-Type": track.representation.mimeType || track.representation.mime_type || `${track.kind}/mp4`,
        "Content-Length": String(range.length), "Content-Range": `bytes ${range.start}-${range.end}/${total}`,
        "Accept-Ranges": "bytes"
      }) };
    } catch (error) {
      if (!controller.signal.aborted && !owner.disposed) owner.failed(error);
      throw controller.signal.aborted ? controller.signal.reason : error;
    } finally {
      controller.abort();
      signal?.removeEventListener("abort", cancel);
      owner.jobs.delete(controller);
    }
  }

  function responseURL(response, url) {
    const clone = response.clone.bind(response);
    Object.defineProperties(response, {
      url: { value: url },
      clone: { value: () => responseURL(clone(), url) }
    });
    return response;
  }

  function interceptedFetch(input, init) {
    const url = input instanceof Request ? input.url : String(input);
    const method = String(init?.method || (input instanceof Request ? input.method : "GET")).toUpperCase();
    if (!active || method !== "GET" || !core.isBilibiliMediaUrl(url)) return passthroughFetch(input, init);
    let request;
    try { request = new Request(input instanceof Request ? input : new URL(String(input), root.location.href), init); }
    catch (_error) { return passthroughFetch(input, init); }
    const plan = request.mode === "no-cors" || request.integrity ? null
      : planRequest(request.url, request.method, request.headers, request.credentials);
    if (!plan) return passthroughFetch(input, init);
    return download(plan, request.signal).then(({ bytes, headers }) => {
      if (request.signal.aborted) throw request.signal.reason;
      return responseURL(new Response(bytes, { status: 206, statusText: "Partial Content", headers }), request.url);
    }).catch(error => { if (request.signal.aborted || error?.name === "AbortError") throw error; return passthroughFetch(input, init); });
  }

  // Preserve the actual XMLHttpRequest object, event handlers and prototype. Only
  // eligible arraybuffer requests receive a synthetic response. Calling open()
  // again restores all native response accessors before the object is reused.
  const proto = root.XMLHttpRequest.prototype;
  // Taken when the interception is installed, so anything already wrapping fetch or
  // XMLHttpRequest (the playurl reader of page-hook.js) stays in the chain.
  let nativeOpen, nativeSend, nativeAbort, nativeSetHeader, nativeGetHeader, nativeGetHeaders;
  const requests = new WeakMap();
  const fields = ["readyState", "status", "statusText", "response", "responseText", "responseURL"];
  function emit(xhr, type, progress) {
    xhr.dispatchEvent(progress ? new ProgressEvent(type, progress) : new Event(type));
  }
  function restore(xhr, entry) {
    if (!entry?.synthetic) return;
    for (const key of fields) {
      const descriptor = entry.descriptors[key];
      if (descriptor) Object.defineProperty(xhr, key, descriptor);
      else delete xhr[key];
    }
    entry.synthetic = false;
  }
  function isCurrent(xhr, entry) { return requests.get(xhr) === entry && entry.sending; }
  function finish(xhr, entry, type) {
    if (!isCurrent(xhr, entry)) return;
    clearTimeout(entry.timer);
    entry.sending = false;
    entry.state = 4;
    emit(xhr, "readystatechange");
    if (requests.get(xhr) !== entry || entry.state !== 4) return;
    const progress = { lengthComputable: type === "load", loaded: entry.body?.byteLength || 0, total: entry.body?.byteLength || 0 };
    emit(xhr, type, progress);
    if (requests.get(xhr) === entry) emit(xhr, "loadend", progress);
  }
  const patchedOpen = function (method, url, async = true, ...rest) {
    const previous = requests.get(this);
    requests.delete(this);
    if (previous) {
      previous.sending = false;
      clearTimeout(previous.timer);
      previous.controller?.abort();
      restore(this, previous);
    }
    const result = nativeOpen.call(this, method, url, async, ...rest);
    requests.set(this, { method: String(method).toUpperCase(), url: new URL(String(url), root.location.href).href,
      async: async !== false, headers: new Headers(), authenticated: rest.some(value => value != null), sending: false, synthetic: false });
    return result;
  };
  const patchedSetRequestHeader = function (name, value) {
    const entry = requests.get(this);
    if (entry?.synthetic) throw new DOMException("Call open() before sending again", "InvalidStateError");
    const result = nativeSetHeader.call(this, name, value);
    entry?.headers.append(name, value);
    return result;
  };
  const patchedGetResponseHeader = function (name) {
    const entry = requests.get(this);
    return entry?.synthetic ? (entry.state >= 2 ? entry.responseHeaders.get(name) : null) : nativeGetHeader.call(this, name);
  };
  const patchedGetAllResponseHeaders = function () {
    const entry = requests.get(this);
    return entry?.synthetic ? (entry.state >= 2 ? [...entry.responseHeaders].map(([key, value]) => `${key}: ${value}\r\n`).join("") : "") : nativeGetHeaders.call(this);
  };
  const patchedAbort = function () {
    const entry = requests.get(this);
    if (!entry?.synthetic) return nativeAbort.call(this);
    entry.status = 0; entry.statusText = ""; entry.responseUrl = ""; entry.body = null; entry.responseHeaders = new Headers();
    if (entry.sending) {
      entry.controller.abort();
      finish(this, entry, "abort");
    }
    if (requests.get(this) === entry && !entry.sending) entry.state = 0;
  };
  const patchedSend = function (body) {
    const entry = requests.get(this);
    if (entry?.synthetic) throw new DOMException("Call open() before sending again", "InvalidStateError");
    if (this.readyState !== 1) return nativeSend.call(this, body);
    const plan = entry?.async && !entry.authenticated && body == null && this.responseType === "arraybuffer"
      ? planRequest(entry.url, entry.method, entry.headers, this.withCredentials ? "include" : "same-origin") : null;
    if (!plan) return nativeSend.call(this, body);
    entry.sending = true; entry.synthetic = true; entry.state = 1;
    entry.status = 0; entry.statusText = ""; entry.body = null; entry.responseUrl = "";
    entry.responseHeaders = new Headers(); entry.controller = new AbortController();
    entry.descriptors = Object.fromEntries(fields.map(key => [key, Object.getOwnPropertyDescriptor(this, key)]));
    Object.defineProperties(this, {
      readyState: { configurable: true, get: () => entry.state },
      status: { configurable: true, get: () => entry.status },
      statusText: { configurable: true, get: () => entry.statusText },
      response: { configurable: true, get: () => entry.state === 4 ? entry.body : null },
      responseText: { configurable: true, get() { throw new DOMException("arraybuffer response", "InvalidStateError"); } },
      responseURL: { configurable: true, get: () => entry.responseUrl }
    });
    if (this.timeout > 0) entry.timer = setTimeout(() => {
      if (!isCurrent(this, entry)) return;
      entry.controller.abort();
      entry.status = 0; entry.statusText = ""; entry.responseUrl = ""; entry.responseHeaders = new Headers();
      finish(this, entry, "timeout");
    }, this.timeout);
    emit(this, "loadstart", { lengthComputable: false, loaded: 0, total: 0 });
    if (!isCurrent(this, entry)) return;
    entry.loaded = 0;
    const reportProgress = (received, total) => {
      if (!isCurrent(this, entry)) return;
      if (entry.state === 1) {
        entry.status = 206; entry.statusText = "Partial Content"; entry.responseUrl = entry.url;
        entry.responseHeaders = new Headers({ "content-range": `bytes ${plan.range.start}-${plan.range.end}/${total}`, "content-length": String(plan.range.length), "content-type": plan.track.representation.mimeType || plan.track.representation.mime_type || `${plan.track.kind}/mp4` });
        entry.state = 2; emit(this, "readystatechange");
      }
      if (!isCurrent(this, entry) || received <= entry.loaded) return;
      entry.loaded = received;
      entry.state = 3; emit(this, "readystatechange");
      if (isCurrent(this, entry)) emit(this, "progress", { lengthComputable: true, loaded: received, total: plan.range.length });
    };
    download(plan, entry.controller.signal, reportProgress).then(result => {
      if (!isCurrent(this, entry)) return;
      entry.responseHeaders = result.headers; entry.responseUrl = entry.url;
      entry.body = result.bytes.buffer;
      finish(this, entry, "load");
    }).catch(() => {
      if (!isCurrent(this, entry)) return;
      entry.status = 0; entry.statusText = ""; entry.responseUrl = ""; entry.body = null; entry.responseHeaders = new Headers();
      finish(this, entry, "error");
    });
  };

  // Only a player of this mode installs the interception, and what is in place then keeps
  // working under it. The other mode never sees any of this.
  let intercepting = false;
  function installInterception() {
    if (intercepting) return;
    intercepting = true;
    passthroughFetch = root.fetch.bind(root);
    nativeOpen = proto.open;
    nativeSend = proto.send;
    nativeAbort = proto.abort;
    nativeSetHeader = proto.setRequestHeader;
    nativeGetHeader = proto.getResponseHeader;
    nativeGetHeaders = proto.getAllResponseHeaders;
    root.fetch = interceptedFetch;
    proto.open = patchedOpen;
    proto.setRequestHeader = patchedSetRequestHeader;
    proto.getResponseHeader = patchedGetResponseHeader;
    proto.getAllResponseHeaders = patchedGetAllResponseHeaders;
    proto.abort = patchedAbort;
    proto.send = patchedSend;
  }


root.__YTR_RANGE_TRANSPORT__ = Object.freeze({ attach(owner) { active = owner; installInterception(); }, detach(owner) { if (active === owner) active = null; } });
})(globalThis);
(function installRuntimeNotices(root) {
  "use strict";

  const CHANNEL = "__YOUTUBE_RANGE_ACCELERATOR_V2__";
  const EVENT_NAMES = ["playing", "pause", "waiting", "stalled", "seeking", "seeked", "ended", "error", "emptied", "loadedmetadata", "canplay", "ratechange"];
  const EVENT_LABELS = { playing: "视频开始播放了", pause: "视频已暂停", waiting: "正在缓冲，请稍等", stalled: "暂时没收到视频数据，还在等待", seeking: "正在跳到你选择的位置", seeked: "已经跳到你选择的位置", ended: "视频播放完了", error: "视频播放出错了", emptied: "旧视频已清空，准备加载新视频", loadedmetadata: "已经读到视频信息", canplay: "视频已经可以播放了", ratechange: "播放速度已改变" };
  let settings = {};
  let attachment = null;
  let controller = null;
  let heartbeat = null;
  let flushTimer = null;
  let sequence = 0;
  let lastTime = 0;
  let lastProgress = -Infinity;
  let lastReportedPlaying = null;
  const pending = new Map();

  function post(type, payload) {
    root.postMessage({ channel: CHANNEL, type, payload }, "*");
  }

  // Signed media URLs and tokens are not useful in an on-screen log.
  function clean(value) {
    return String(value ?? "").replace(/https?:\/\/[^\s]+/gi, (url) => {
      try { return new URL(url).hostname; } catch (_error) { return "[URL]"; }
    }).replace(/[\u00b7\u2022\u2027\u2219\u22c5]+/g, "，").slice(0, 320);
  }

  function flush() {
    flushTimer = null;
    const entries = Array.from(pending.values()).filter(entry => allowed(entry.level, entry.category));
    if (entries.length) post("debug-notices", entries);
    pending.clear();
  }

  function allowed(level, category = "other") {
    return settings.enabled && (level === "error" ? settings.errorNotices : settings.debugNotices && settings.debugCategories?.[category] !== false);
  }

  function log(title, detail = "", level = "info", group = "", route = attachment?.route || "", category = "other") {
    category = ["takeover", "playback", "download", "buffer", "settings", "other"].includes(category) ? category : "other";
    if (!allowed(level, category)) return;
    // Coalesce high-frequency events before publishing a snapshot. The view
    // always creates a new bubble and never edits an already visible message.
    const key = group ? `${route}:${category}:${group}` : `event-${++sequence}`;
    const previous = pending.get(key);
    const entry = { key, title: clean(title), detail: clean(detail), route: clean(route), category, level: ["success", "error"].includes(level) ? level : "info", at: Date.now(), count: (previous?.count || 0) + 1 };
    pending.delete(key);
    pending.set(key, entry);
    if (pending.size > 48) {
      const ordinary = [...pending].find(([, item]) => item.level !== "error");
      pending.delete(ordinary ? ordinary[0] : pending.keys().next().value);
    }
    if (!flushTimer) flushTimer = setTimeout(flush, 180);
  }

  function current() {
    return attachment && attachment.video?.isConnected && attachment.isCurrent();
  }

  function sample(force = false) {
    if (!allowed("info", "playback")) return;
    const video = attachment?.video;
    const valid = Boolean(current());
    const now = performance.now();
    const time = Number(video?.currentTime) || 0;
    if (valid && !video.paused && !video.seeking && !video.ended && time > lastTime + 0.001) lastProgress = now;
    lastTime = time;
    const playing = valid && !video.paused && !video.ended && !video.seeking && !video.error && video.readyState >= 2 && now - lastProgress < 1800;
    if (force || playing !== lastReportedPlaying) {
      if (valid && playing !== lastReportedPlaying) log(playing ? "画面正在正常播放" : "加速已接管，正在等视频播放", `当前播放到 ${time.toFixed(2)} 秒。`, playing ? "success" : "info", "", attachment?.route || "", "playback");
      lastReportedPlaying = playing;
    }
    // Heartbeats let the isolated UI expire status if the page hook disappears.
    post("playback-notice", { attached: valid, playing, route: valid ? attachment.route : "", session: attachment?.session || 0 });
  }

  function stopWatch() {
    controller?.abort();
    controller = null;
    clearInterval(heartbeat);
    heartbeat = null;
    lastReportedPlaying = null;
    lastProgress = -Infinity;
  }

  function watch() {
    stopWatch();
    if (!settings.enabled || !(settings.debugNotices || settings.errorNotices) || !attachment) return;
    const captured = attachment;
    const video = captured.video;
    controller = new AbortController();
    lastTime = Number(video.currentTime) || 0;
    for (const name of EVENT_NAMES) {
      const category = ["waiting", "stalled", "seeking", "seeked"].includes(name) ? "buffer" : "playback";
      if (!allowed(name === "error" ? "error" : "info", category)) continue;
      video.addEventListener(name, () => {
        if (attachment !== captured || !current()) return;
        if (name === "playing") lastProgress = performance.now();
        else if (["pause", "waiting", "stalled", "seeking", "ended", "error", "emptied"].includes(name)) {
          lastProgress = -Infinity;
          lastTime = Number(video.currentTime) || 0;
        }
        const errorReason = { 1: "视频加载被中断了", 2: "视频数据没能下载下来", 3: "浏览器没能解码这个视频", 4: "浏览器不支持这个视频格式" }[video.error?.code] || "播放器没有给出具体原因";
        const detail = `当前播放到 ${Number(video.currentTime).toFixed(2)} 秒。${name === "error" ? `\n${errorReason}。\n${video.error?.message || ""}` : ""}`;
        const level = name === "error" ? "error" : ["playing", "seeked", "ended", "loadedmetadata", "canplay"].includes(name) ? "success" : "info";
        log(EVENT_LABELS[name], detail, level, "", captured.route, category);
        sample(true);
      }, { signal: controller.signal });
    }
    if (allowed("info", "playback")) {
      video.addEventListener("timeupdate", () => sample(), { signal: controller.signal });
      heartbeat = setInterval(sample, 500);
      sample(true);
    }
  }

  root.__BTR_RUNTIME_NOTICES__ = Object.freeze({
    log,
    configure(next) {
      const changed = settings.enabled !== next.enabled || settings.debugNotices !== next.debugNotices || settings.errorNotices !== (next.errorNotices === true)
        || ["playback", "buffer"].some(category => (settings.debugCategories?.[category] !== false) !== (next.debugCategories?.[category] !== false));
      const wasDebug = settings.enabled && settings.debugNotices;
      settings = { enabled: next.enabled !== false, debugNotices: next.debugNotices === true, errorNotices: next.errorNotices === true, debugCategories: { ...next.debugCategories } };
      for (const [key, entry] of pending) if (!allowed(entry.level, entry.category)) pending.delete(key);
      if (!pending.size) {
        clearTimeout(flushTimer);
        flushTimer = null;
      }
      if (!wasDebug && settings.enabled && settings.debugNotices) log("调试提示已打开", "接下来会显示你勾选的运行消息。", "success", "", "", "settings");
      if (changed) watch();
    },
    attach(video, route, session, isCurrent) {
      attachment = { video, route, session, isCurrent };
      log("视频已接管", "继续使用 YouTube 播放器，由 BTR 下载核心处理可接管请求。", "success", "", route, "takeover");
      watch();
    },
    detach(reason = "已停止接管这个视频") {
      if (attachment) log(reason, "", "info", "", attachment.route, "takeover");
      stopWatch();
      attachment = null;
      if (settings.debugNotices) post("playback-notice", { attached: false, playing: false, route: "", session: 0 });
    }
  });
})(globalThis);

// The settings panel. It runs in the bilibili page and opens from the button in the page's
// corner, the userscript manager's menu, or "自定义" in the player's gear menu. Settings are
// read and saved through bridge.js; storage-shim.js keeps them in the script manager's
// storage.
(function installSettingsPanel(root) {
  "use strict";

  if (root.__BTR_SETTINGS_PANEL__) return;
  const core = root.__BILI_RANGE_CORE__;
  const cdn = root.__BILI_CDN_RESOLVER_FACTORY__;
  if (!core || !cdn) return;

  const CHANNEL = "__YOUTUBE_RANGE_ACCELERATOR_V2__";
  const HOST_ID = "__bilibili_thread_ripper_settings__";
  const DIALOG_ID = "__bilibili_thread_ripper_settings_dialog__";
  const LAUNCHER_ID = "__bilibili_thread_ripper_launcher__";
  const THREAD_OPTIONS = [4, 8, 16, 32, 64, 128];
  const MAX_CUSTOM_HOSTS = 32;
  const HOST_GROUPS = [["大陆节点", cdn.MAINLAND_HOSTS], ["海外节点", cdn.OVERSEAS_HOSTS]];
  const PROJECT_URL = "https://github.com/MrTangLuyao/Bilibili-thread-ripper";
  // GitHub's mark.
  const GITHUB_ICON = `<svg viewBox="0 0 16 16" aria-hidden="true"><path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path></svg>`;
  const KNOWN_HOSTS = HOST_GROUPS.flatMap(([, hosts]) => hosts);

  const PANEL_HTML = `
    <main>
      <header>
        <div class="logo" aria-hidden="true">Y</div>
        <div class="title">
          <h1>线程撕裂者</h1>
          <a id="github-link" class="github-link" href="${PROJECT_URL}" target="_blank" rel="noopener noreferrer" title="在 GitHub 上查看项目" aria-label="在 GitHub 上查看项目">${GITHUB_ICON}</a>
        </div>
        <label class="switch" title="启用或停用">
          <input id="enabled" type="checkbox">
          <span></span>
        </label>
      </header>

      <section class="mode-select" aria-label="YouTube 调度模式">
        <label><input type="radio" name="mode" value="mainland"><span>原生调度</span></label>
        <label><input type="radio" name="mode" value="overseas"><span>实际倍速</span></label>
        <label><input type="radio" name="mode" value="custom"><span>额外预取</span></label>
      </section>

      <section id="custom-hosts" class="custom-hosts" aria-label="自定义服务器" hidden>
        <div class="custom-head"><span>自定义服务器</span><b id="custom-count">0</b></div>
        <p id="custom-empty" class="custom-note">还没选服务器，暂时按大陆 CDN 下载。</p>
        <div id="known-hosts"></div>
        <fieldset class="host-group">
          <legend>手动添加</legend>
          <div id="manual-hosts" class="manual-hosts"></div>
          <form id="host-form" class="host-form">
            <input id="host-input" type="text" placeholder="例如 upos-sz-mirrorali.bilivideo.com" spellcheck="false" autocomplete="off" aria-label="服务器地址">
            <button type="submit">添加</button>
          </form>
          <p id="host-error" class="host-error" role="alert"></p>
        </fieldset>
        <p class="custom-note">只能填 B 站的视频服务器（bilivideo.com、akamaized.net 等），视频的下载地址不会发给别的网站。</p>
      </section>

      <section class="takeover-select" aria-label="接管方式">
        <label><input type="radio" name="takeover" value="full" disabled><span>全接管（未接入）</span></label>
        <label><input type="radio" name="takeover" value="compat"><span>兼容模式</span></label>
      </section>
      <p class="takeover-note">兼容模式：保留 YouTube 播放器，由 BTR 下载核心处理可接管的 Range。<br>额外预取：SABR 回报两倍需求，效果尚待实测。</p>

      <section class="controls">
        <div class="control-title">
          <label for="concurrency">线程加载数</label>
          <output id="thread-value" for="concurrency">8</output>
        </div>
        <div class="auto-row">
          <label for="auto-concurrency">自动线程数<small>BTR将智能选择需要的线程数。</small></label>
          <label class="switch"><input id="auto-concurrency" type="checkbox" aria-label="自动线程数"><span></span></label>
        </div>
        <div class="slider">
          <div id="slider-fill" class="slider-fill" aria-hidden="true"></div>
          <input id="concurrency" type="range" min="0" max="5" step="1" value="1" aria-label="线程加载数" aria-valuetext="8">
        </div>
        <div class="scale" aria-hidden="true">
          <span>4</span><span>8</span><span>16</span><span>32</span><span>64</span><span>128</span>
        </div>
      </section>

      <section class="notice-controls" aria-label="提示设置">
        <div class="notice-row"><label for="live-enabled">直播加速（未接入）</label><label class="switch"><input id="live-enabled" type="checkbox" disabled aria-label="直播加速（未接入）"><span></span></label></div>
        <div class="notice-row"><label for="error-notices">显示错误</label><label class="switch"><input id="error-notices" type="checkbox" aria-label="显示错误"><span></span></label></div>
        <div class="notice-row"><label for="debug-notices">Debug 模式</label><label class="switch"><input id="debug-notices" type="checkbox" aria-label="Debug 模式"><span></span></label></div>
        <div class="notice-row"><label for="floating-button">悬浮按钮</label><label class="switch"><input id="floating-button" type="checkbox" aria-label="悬浮按钮"><span></span></label></div>
        <fieldset id="debug-filters" class="debug-filters" hidden>
          <legend>显示哪些 Debug 消息</legend>
          <div class="debug-filter-actions"><button id="debug-select-all" type="button">全选</button><button id="debug-select-none" type="button">全不选</button></div>
          <div class="debug-filter-options">
            <label><input type="checkbox" data-debug-category="takeover">接管与切换</label>
            <label><input type="checkbox" data-debug-category="playback">播放与暂停</label>
            <label><input type="checkbox" data-debug-category="download">下载线程</label>
            <label><input type="checkbox" data-debug-category="buffer">缓冲与跳转</label>
            <label><input type="checkbox" data-debug-category="settings">设置变化</label>
            <label><input type="checkbox" data-debug-category="other">其他日志</label>
          </div>
          <div class="debug-copy">
            <button id="debug-copy" type="button">复制诊断信息</button>
            <span id="debug-copy-status" class="debug-copy-status" role="status"></span>
          </div>
          <p class="debug-copy-note">反馈问题时点一下，把复制下来的内容贴到 issue 里。里面没有 Cookie、账号信息和视频的下载地址。</p>
          <textarea id="debug-copy-text" class="debug-copy-text" readonly hidden aria-label="诊断信息"></textarea>
        </fieldset>
      </section>

      <section class="current-threads" aria-live="polite">
        <span>目前总线程</span>
        <b id="active-count">0</b>
      </section>
    </main>`;

  const PANEL_CSS = `
    * { box-sizing: border-box; }
    .btr-backdrop { position: fixed; inset: 0; background: rgba(0, 0, 0, .35); }
    .btr-popup { position: fixed; top: 72px; right: 24px; width: 320px; max-width: calc(100vw - 32px); max-height: calc(100vh - 96px); overflow: auto; border: 1px solid #30343d; border-radius: 12px; box-shadow: 0 12px 40px rgba(0, 0, 0, .45); color-scheme: dark; font-family: Inter, "PingFang SC", "Microsoft YaHei", system-ui, sans-serif; background: #17191f; color: #f5f7fb; font-size: 14px; line-height: normal; text-align: left; }
    main { padding: 18px 16px; }
    header { display: grid; grid-template-columns: 42px 1fr auto; align-items: center; gap: 11px; margin-bottom: 22px; }
    .logo { display: grid; place-items: center; width: 42px; height: 42px; border-radius: 8px; color: #fff; font-size: 23px; font-weight: 800; background: #fb7299; }
    h1 { margin: 0; font-size: 17px; letter-spacing: .2px; }
    .title { display: flex; align-items: center; gap: 8px; min-width: 0; }
    .github-link { display: grid; flex: none; place-items: center; width: 26px; height: 26px; border-radius: 6px; color: #949baa; transition: color 160ms ease, background 160ms ease; }
    .github-link:hover { color: #fff; background: #292d35; }
    .github-link:focus-visible { outline: 2px solid #fff; outline-offset: 2px; }
    .github-link svg { width: 18px; height: 18px; }
    .switch { position: relative; width: 42px; height: 24px; }
    .switch input { position: absolute; inset: 0; z-index: 1; width: 100%; height: 100%; margin: 0; opacity: 0; cursor: pointer; }
    .switch span { position: absolute; inset: 0; border-radius: 999px; background: #313a4c; cursor: pointer; transition: 160ms ease; }
    .switch span::after { content: ""; position: absolute; top: 3px; left: 3px; width: 18px; height: 18px; border-radius: 50%; background: #fff; transition: 160ms ease; }
    .switch input:checked + span { background: #fb7299; }
    .switch input:checked + span::after { transform: translateX(18px); }
    .switch input:focus-visible + span { outline: 2px solid #fff; outline-offset: 3px; }
    .mode-select { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1px; margin-bottom: 12px; overflow: hidden; border: 1px solid #30343d; border-radius: 8px; background: #30343d; }
    .mode-select label { position: relative; }
    .mode-select input { position: absolute; opacity: 0; }
    .mode-select span { display: block; padding: 10px 6px; color: #949baa; background: #20232a; font-size: 12px; text-align: center; cursor: pointer; }
    .mode-select input:checked + span { color: #fff; background: #fb7299; }
    .mode-select input:focus-visible + span { outline: 2px solid #fff; outline-offset: -3px; }
    .takeover-select { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1px; margin-bottom: 8px; overflow: hidden; border: 1px solid #30343d; border-radius: 8px; background: #30343d; }
    .takeover-select label { position: relative; }
    .takeover-select input { position: absolute; opacity: 0; }
    .takeover-select span { display: block; padding: 10px 6px; color: #949baa; background: #20232a; font-size: 12px; text-align: center; cursor: pointer; }
    .takeover-select input:checked + span { color: #fff; background: #fb7299; }
    .takeover-select input:focus-visible + span { outline: 2px solid #fff; outline-offset: -3px; }
    .takeover-note { margin: 0 0 12px; padding: 0 2px; color: #7f8797; font-size: 11px; line-height: 1.6; }
    .custom-hosts { margin-bottom: 12px; padding: 14px 16px; border: 1px solid #30343d; border-radius: 8px; background: #20232a; }
    .custom-hosts[hidden] { display: none; }
    .custom-head { display: flex; align-items: center; justify-content: space-between; color: #c9ced9; font-size: 13px; }
    .custom-head b { min-width: 28px; padding: 2px 8px; border-radius: 5px; background: #fb7299; color: #fff; font-size: 12px; text-align: center; }
    .custom-note { margin: 8px 0 0; color: #7f8797; font-size: 11px; line-height: 1.6; }
    .custom-note[hidden] { display: none; }
    .host-group { min-width: 0; margin: 12px 0 0; padding: 10px 0 0; border: 0; border-top: 1px solid #343943; }
    .host-group legend { padding: 0 0 4px; color: #c9ced9; font-size: 12px; }
    .host-option { display: flex; align-items: center; gap: 7px; margin-top: 7px; color: #c9ced9; font-size: 11px; overflow-wrap: anywhere; cursor: pointer; }
    .host-option input { flex: none; width: 14px; height: 14px; margin: 0; accent-color: #fb7299; cursor: pointer; }
    .manual-host { display: flex; align-items: center; justify-content: space-between; gap: 8px; margin-top: 7px; color: #c9ced9; font-size: 11px; overflow-wrap: anywhere; }
    .manual-host button { flex: none; width: 22px; height: 22px; padding: 0; border: 1px solid #444b57; border-radius: 4px; background: #292d35; color: #d9dee8; font: inherit; line-height: 20px; cursor: pointer; }
    .host-form { display: flex; gap: 6px; margin-top: 10px; }
    .host-form input { flex: 1; min-width: 0; padding: 6px 8px; border: 1px solid #444b57; border-radius: 5px; background: #17191f; color: #f5f7fb; font: inherit; font-size: 12px; }
    .host-form button { flex: none; padding: 6px 10px; border: 0; border-radius: 5px; background: #fb7299; color: #fff; font: inherit; font-size: 12px; cursor: pointer; }
    .host-error { min-height: 0; margin: 6px 0 0; color: #f28b85; font-size: 11px; }
    .host-error:empty { display: none; }
    .host-form input:focus-visible, .host-form button:focus-visible, .manual-host button:focus-visible, .host-option input:focus-visible { outline: 2px solid #fff; outline-offset: 2px; }
    .controls { padding: 16px; border: 1px solid #30343d; border-radius: 8px; background: #20232a; }
    .control-title { display: flex; align-items: center; justify-content: space-between; margin-bottom: 14px; }
    .control-title label { color: #c9ced9; font-size: 13px; }
    .auto-row { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin-bottom: 14px; }
    .auto-row > label:first-child { display: flex; flex-direction: column; gap: 2px; color: #c9ced9; font-size: 13px; }
    .auto-row small { color: #8a93a6; font-size: 11px; }
    .controls.auto .slider, .controls.auto .scale { opacity: 0.4; pointer-events: none; }
    output { min-width: 42px; padding: 4px 8px; border-radius: 5px; color: #fff; background: #fb7299; font-size: 13px; font-weight: 700; text-align: center; }
    .slider { position: relative; width: 100%; height: 18px; border-radius: 9px; background: #3a3e47; }
    .slider-fill { position: absolute; top: 0; bottom: 0; left: 0; width: 60%; border-radius: 9px; background: #fb7299; pointer-events: none; }
    input[type="range"] { position: absolute; inset: 0; width: 100%; height: 18px; margin: 0; appearance: none; -webkit-appearance: none; border: 0; outline: 0; background: transparent; cursor: pointer; }
    input[type="range"]::-webkit-slider-runnable-track { height: 18px; background: transparent; }
    input[type="range"]::-webkit-slider-thumb { width: 24px; height: 24px; margin-top: -3px; appearance: none; -webkit-appearance: none; border: 2px solid #fff; border-radius: 50%; background: #fff; }
    input[type="range"]:focus-visible::-webkit-slider-thumb { border-color: #fb7299; }
    .scale { display: flex; justify-content: space-between; margin-top: 5px; color: #7f8797; font-size: 10px; }
    .scale span { width: 24px; text-align: center; }
    .scale span:first-child { text-align: left; }
    .scale span:last-child { text-align: right; }
    .notice-controls { margin-top: 12px; padding: 14px 16px; border: 1px solid #30343d; border-radius: 8px; background: #20232a; }
    .notice-row { display: flex; align-items: center; justify-content: space-between; gap: 12px; color: #c9ced9; font-size: 13px; }
    .notice-row .switch { flex: none; }
    .notice-row + .notice-row { margin-top: 14px; }
    .debug-filters { min-width: 0; margin: 16px 0 0; padding: 12px 0 0; border: 0; border-top: 1px solid #343943; }
    .debug-filters[hidden] { display: none; }
    .debug-filters legend { padding: 0 0 4px; color: #c9ced9; font-size: 12px; }
    .debug-filter-actions { display: flex; gap: 8px; margin-bottom: 12px; }
    .debug-filter-actions button { padding: 4px 8px; border: 1px solid #444b57; border-radius: 4px; background: #292d35; color: #d9dee8; font: inherit; font-size: 11px; cursor: pointer; }
    .debug-filter-actions button:hover, .manual-host button:hover { border-color: #fb7299; }
    .debug-filter-options { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px 8px; }
    .debug-filter-options label { display: flex; align-items: center; gap: 7px; color: #c9ced9; font-size: 12px; cursor: pointer; }
    .debug-filter-options input { flex: none; width: 15px; height: 15px; margin: 0; accent-color: #fb7299; cursor: pointer; }
    .debug-filter-actions button:focus-visible, .debug-filter-options input:focus-visible { outline: 2px solid #fff; outline-offset: 3px; }
    .debug-copy { display: flex; align-items: center; gap: 10px; margin-top: 16px; }
    .debug-copy button { padding: 6px 12px; border: 1px solid #fb7299; border-radius: 6px; background: #292d35; color: #fff; font: inherit; font-size: 12px; cursor: pointer; }
    .debug-copy button:hover { background: #fb7299; }
    .debug-copy button:focus-visible { outline: 2px solid #fff; outline-offset: 3px; }
    .debug-copy-status { color: #9fd9a8; font-size: 12px; }
    .debug-copy-status.failed { color: #f28b85; }
    .debug-copy-note { margin: 8px 0 0; color: #949baa; font-size: 11px; line-height: 1.5; }
    .debug-copy-text { width: 100%; height: 120px; margin-top: 8px; padding: 6px; border: 1px solid #444b57; border-radius: 6px; background: #20232a; color: #d9dee8; font: 11px/1.4 Consolas, monospace; resize: vertical; }
    .debug-copy-text[hidden] { display: none; }
    .current-threads { display: flex; align-items: center; justify-content: space-between; margin-top: 12px; padding: 16px; border: 1px solid #30343d; border-radius: 8px; background: #20232a; color: #c9ced9; font-size: 13px; }
    .current-threads b { color: #fff; font-size: 20px; font-variant-numeric: tabular-nums; }
    .btr-close { position: sticky; bottom: 12px; display: block; width: calc(100% - 32px); margin: 0 16px 16px; padding: 8px; border: 1px solid #444b57; border-radius: 6px; background: #292d35; color: #d9dee8; font: inherit; font-size: 13px; cursor: pointer; box-shadow: 0 -6px 12px #17191f; }
    .btr-close:hover { border-color: #fb7299; }
    .btr-close:focus-visible { outline: 2px solid #fff; outline-offset: 2px; }
  `;

  const LAUNCHER_CSS = `
    .btr-launcher { position: fixed; right: 76px; bottom: 116px; display: grid; place-items: center; width: 44px; height: 44px; padding: 0; border: 0; border-radius: 50%; background: #fb7299; color: #fff; font: 700 13px/1 Inter, "PingFang SC", "Microsoft YaHei", system-ui, sans-serif; letter-spacing: .3px; cursor: grab; opacity: .6; touch-action: none; box-shadow: 0 4px 14px rgba(0, 0, 0, .25); transition: opacity 160ms ease, transform 160ms ease, left 180ms ease, right 180ms ease; }
    .btr-launcher:hover, .btr-launcher:focus-visible { opacity: 1; transform: scale(1.06); }
    .btr-launcher:focus-visible { outline: 2px solid #fff; outline-offset: 2px; }
    .btr-launcher.dragging { cursor: grabbing; opacity: 1; transform: scale(1.1); transition: opacity 160ms ease, transform 160ms ease; }
    @media (max-width: 700px) { .btr-launcher { width: 40px; height: 40px; font-size: 12px; } }
  `;

  let current = null;
  // bridge.js sends the stored settings when they load or change, and the page its stats.
  let latestSettings = null;
  // The debug notices shown on this page, newest last, for the diagnostic copy.
  const noticeHistory = [];

  // Everything needed to look into a report, as text to paste into an issue. The page's own
  // reports already leave out download addresses and account data; any address that is left
  // is cut down to its host and path, so no signature or token goes along.
  function diagnostics() {
    const safely = (read) => { try { return read(); } catch (error) { return `读取失败：${String(error?.message || error)}`; } };
    const parse = (text) => { try { return JSON.parse(text); } catch (_error) { return text; } };
    const sections = [
      ["环境", {
        BTR: "2026.10.1.1",
        脚本管理器: document.documentElement?.getAttribute("data-ytr-userscript-manager") || "未知",
        浏览器: navigator.userAgent,
        页面: `${location.origin}${location.pathname}`,
        时间: new Date().toISOString(),
        语言: navigator.language,
        窗口: `${root.innerWidth}x${root.innerHeight}`
      }],
      ["设置", latestSettings || "设置还没加载"]
    ];
    const video = root.__biliThreadRipperDebug;
    if (typeof video?.report === "function") sections.push(["视频接管", safely(() => parse(video.report()))]);
    const auto = root.__BILI_IDM_DOWNLOADER_FACTORY__?.autoConcurrency;
    if (typeof auto?.status === "function") sections.push(["自动线程数", safely(() => auto.status())]);
    // The live player often sits in a live.bilibili.com iframe, where its module runs.
    const liveModules = [root, ...[...document.querySelectorAll("iframe")].map((frame) => safely(() => frame.contentWindow))]
      .map((view) => safely(() => view?.__biliThreadRipperLiveDebug)).filter((api) => api && typeof api.getStats === "function");
    liveModules.forEach((api, index) => sections.push([liveModules.length > 1 ? `直播模块 ${index + 1}` : "直播模块", safely(() => ({ stats: api.getStats(), context: api.getContext?.() }))]));
    sections.push(["最近的 Debug 提示", noticeHistory.length
      ? noticeHistory.map((item) => `${new Date(item.at).toISOString().slice(11, 19)} [${item.level}/${item.category}] ${item.title}${item.count > 1 ? ` ×${item.count}` : ""}${item.detail ? ` — ${item.detail}` : ""}`).join("\n")
      : "（还没有。打开 Debug 模式以后显示过的提示才会记在这里）"]);
    const text = sections.map(([title, value]) => `## ${title}\n${typeof value === "string" ? value : JSON.stringify(value, null, 1)}`).join("\n\n");
    return text.replace(/(https?:\/\/[^\s"'?#]+)[?#][^\s"']*/gi, "$1");
  }
  let latestStats = null;
  const post = (type, payload) => root.postMessage({ channel: CHANNEL, type, payload }, "*");

  function open() {
    if (current) return;
    // A modal <dialog> sits in the browser's top layer and is the only interactive part of
    // the page while it is open. A plain fixed layer can end up under the page's own
    // top-layer elements, or inside a part of the page made inert, and then clicks on it
    // land on whatever is beneath (issue #8).
    const dialog = document.createElement("dialog");
    dialog.id = DIALOG_ID;
    dialog.style.cssText = "all:initial!important;display:block!important;position:fixed!important;inset:0!important;width:100%!important;height:100%!important;max-width:none!important;max-height:none!important;margin:0!important;padding:0!important;border:0!important;background:transparent!important;overflow:visible!important;z-index:2147483646!important;";
    const dialogStyle = document.createElement("style");
    dialogStyle.textContent = `#${DIALOG_ID}::backdrop{background:transparent}`;
    const host = document.createElement("div");
    host.id = HOST_ID;
    host.style.cssText = "all:initial!important;position:fixed!important;inset:0!important;";
    dialog.append(dialogStyle, host);
    const shadow = host.attachShadow({ mode: "open" });
    const style = document.createElement("style");
    style.textContent = PANEL_CSS;
    const backdrop = document.createElement("div");
    backdrop.className = "btr-backdrop";
    const panel = document.createElement("div");
    panel.className = "btr-popup";
    panel.setAttribute("role", "dialog");
    panel.setAttribute("aria-label", "线程撕裂者设置");
    panel.tabIndex = -1;
    panel.innerHTML = PANEL_HTML;
    const closeButton = document.createElement("button");
    closeButton.type = "button";
    closeButton.className = "btr-close";
    closeButton.textContent = "关闭";
    panel.append(closeButton);
    shadow.append(style, backdrop, panel);

    const $ = (id) => shadow.getElementById(id);
    const enabled = $("enabled");
    const concurrency = $("concurrency");
    const autoConcurrency = $("auto-concurrency");
    const threadValue = $("thread-value");
    const sliderFill = $("slider-fill");
    const errorNotices = $("error-notices");
    const debugNotices = $("debug-notices");
    const liveEnabled = $("live-enabled");
    const floatingButton = $("floating-button");
    const debugFilters = $("debug-filters");
    const debugCategoryInputs = [...shadow.querySelectorAll("[data-debug-category]")];
    const customSection = $("custom-hosts");
    const hostInput = $("host-input");
    const hostError = $("host-error");
    const activeCount = $("active-count");
    let customHosts = [];

    const save = (update) => post("settings-update", update);

    function setSlider(threads) {
      const index = THREAD_OPTIONS.indexOf(Number(threads));
      const safe = index < 0 ? 1 : index;
      concurrency.value = String(safe);
      threadValue.value = String(THREAD_OPTIONS[safe]);
      concurrency.setAttribute("aria-valuetext", String(THREAD_OPTIONS[safe]));
      sliderFill.style.width = `${safe / (THREAD_OPTIONS.length - 1) * 100}%`;
    }

    function setMode(mode) {
      for (const radio of shadow.querySelectorAll('input[name="mode"]')) radio.checked = radio.value === mode;
      customSection.hidden = true;
    }

    function renderHosts() {
      $("custom-count").textContent = String(customHosts.length);
      $("custom-empty").hidden = customHosts.length > 0;
      const known = $("known-hosts");
      known.replaceChildren(...HOST_GROUPS.map(([title, hosts]) => {
        const group = document.createElement("fieldset");
        group.className = "host-group";
        const legend = document.createElement("legend");
        legend.textContent = title;
        group.append(legend, ...hosts.map((value) => {
          const label = document.createElement("label");
          label.className = "host-option";
          const input = document.createElement("input");
          input.type = "checkbox";
          input.value = value;
          input.checked = customHosts.includes(value);
          const text = document.createElement("span");
          text.textContent = value;
          label.append(input, text);
          return label;
        }));
        return group;
      }));
      $("manual-hosts").replaceChildren(...customHosts.filter((value) => !KNOWN_HOSTS.includes(value)).map((value) => {
        const row = document.createElement("div");
        row.className = "manual-host";
        const text = document.createElement("span");
        text.textContent = value;
        const remove = document.createElement("button");
        remove.type = "button";
        remove.dataset.remove = value;
        remove.textContent = "×";
        remove.setAttribute("aria-label", `删除 ${value}`);
        row.append(text, remove);
        return row;
      }));
    }

    function setCustomHosts(next) {
      customHosts = next;
      renderHosts();
      save({ customHosts });
    }

    function render(settings) {
      enabled.checked = settings.enabled;
      for (const radio of shadow.querySelectorAll('input[name="takeover"]')) radio.checked = radio.value === settings.takeover;
      setSlider(settings.concurrency);
      autoConcurrency.checked = settings.autoConcurrency === true;
      concurrency.disabled = autoConcurrency.checked;
      concurrency.closest(".controls").classList.toggle("auto", autoConcurrency.checked);
      setMode(settings.mode);
      customHosts = settings.customHosts;
      renderHosts();
      liveEnabled.checked = settings.liveEnabled !== false;
      floatingButton.checked = settings.floatingButton !== false;
      errorNotices.checked = settings.errorNotices;
      debugNotices.checked = settings.debugNotices;
      debugFilters.hidden = !settings.debugNotices;
      for (const input of debugCategoryInputs) input.checked = settings.debugCategories[input.dataset.debugCategory] !== false;
    }

    const saveDebugCategories = () => save({ debugCategories: Object.fromEntries(debugCategoryInputs.map((input) => [input.dataset.debugCategory, input.checked])) });
    enabled.addEventListener("change", () => save({ enabled: enabled.checked }));
    liveEnabled.addEventListener("change", () => save({ liveEnabled: liveEnabled.checked }));
    floatingButton.addEventListener("change", () => save({ floatingButton: floatingButton.checked }));
    concurrency.addEventListener("input", () => {
      const threads = THREAD_OPTIONS[Number(concurrency.value)];
      setSlider(threads);
      save({ concurrency: threads });
    });
    autoConcurrency.addEventListener("change", () => save({ autoConcurrency: autoConcurrency.checked }));
    for (const radio of shadow.querySelectorAll('input[name="mode"]')) {
      radio.addEventListener("change", () => {
        if (!radio.checked) return;
        setMode(radio.value);
        save({ mode: radio.value });
      });
    }
    for (const radio of shadow.querySelectorAll('input[name="takeover"]')) {
      radio.addEventListener("change", () => { if (radio.checked) save({ takeover: radio.value }); });
    }
    $("known-hosts").addEventListener("change", (event) => {
      const input = event.target;
      if (!(input instanceof HTMLInputElement) || !KNOWN_HOSTS.includes(input.value)) return;
      if (input.checked && customHosts.length >= MAX_CUSTOM_HOSTS) {
        input.checked = false;
        hostError.textContent = `最多选 ${MAX_CUSTOM_HOSTS} 个服务器。`;
        return;
      }
      hostError.textContent = "";
      setCustomHosts(input.checked ? [...customHosts.filter((value) => value !== input.value), input.value] : customHosts.filter((value) => value !== input.value));
    });
    $("manual-hosts").addEventListener("click", (event) => {
      const value = event.target instanceof HTMLElement ? event.target.dataset.remove : "";
      if (value) setCustomHosts(customHosts.filter((item) => item !== value));
    });
    $("host-form").addEventListener("submit", (event) => {
      event.preventDefault();
      const value = core.normalizeCdnHost(hostInput.value);
      if (!value) hostError.textContent = "这不是 B 站的视频服务器地址。";
      else if (customHosts.includes(value)) hostError.textContent = "这个服务器已经在列表里了。";
      else if (customHosts.length >= MAX_CUSTOM_HOSTS) hostError.textContent = `最多选 ${MAX_CUSTOM_HOSTS} 个服务器。`;
      else {
        hostError.textContent = "";
        hostInput.value = "";
        setCustomHosts([...customHosts, value]);
      }
    });
    errorNotices.addEventListener("change", () => save({ errorNotices: errorNotices.checked }));
    debugNotices.addEventListener("change", () => {
      debugFilters.hidden = !debugNotices.checked;
      save({ debugNotices: debugNotices.checked });
    });
    for (const input of debugCategoryInputs) input.addEventListener("change", saveDebugCategories);
    $("debug-select-all").addEventListener("click", () => { for (const input of debugCategoryInputs) input.checked = true; saveDebugCategories(); });
    $("debug-select-none").addEventListener("click", () => { for (const input of debugCategoryInputs) input.checked = false; saveDebugCategories(); });
    const copyStatus = $("debug-copy-status");
    const copyText = $("debug-copy-text");
    let copyStatusTimer = null;
    $("debug-copy").addEventListener("click", async () => {
      const text = diagnostics();
      let copied = false;
      try { await navigator.clipboard.writeText(text); copied = true; } catch (_error) {}
      if (!copied) {
        // Without the clipboard API (or its permission): select the text for the viewer.
        copyText.hidden = false;
        copyText.value = text;
        copyText.focus();
        copyText.select();
        try { copied = document.execCommand("copy"); } catch (_error) {}
      }
      copyStatus.classList.toggle("failed", !copied);
      copyStatus.textContent = copied ? "已复制" : "没能自动复制，请手动复制下面的内容";
      clearTimeout(copyStatusTimer);
      if (copied) copyStatusTimer = setTimeout(() => { copyStatus.textContent = ""; }, 2500);
    });

    // Keys typed into the panel belong to it. The shadow root hides the input from the page,
    // so the player's shortcuts (space, F, arrows) would otherwise react to them.
    const keepKeys = (event) => { if (event.key !== "Escape") event.stopPropagation(); };
    for (const type of ["keydown", "keyup", "keypress"]) panel.addEventListener(type, keepKeys);

    // The live thread count: asking for stats makes the page send fresh ones.
    const refresh = () => {
      activeCount.textContent = String(Math.max(0, Math.trunc(Number(latestStats?.activeThreads) || 0)));
      post("get-stats");
    };
    const timer = setInterval(refresh, 400);
    const onKey = (event) => { if (event.key === "Escape") close(); };
    const close = () => {
      if (current?.host !== host) return;
      current = null;
      clearInterval(timer);
      launcher?.apply();
      document.removeEventListener("keydown", onKey, true);
      dialog.remove();
    };
    // Changes made elsewhere (the gear menu, another tab) arrive as new settings.
    current = { host, close, render };
    launcher?.apply();
    backdrop.addEventListener("click", close);
    closeButton.addEventListener("click", close);
    document.addEventListener("keydown", onKey, true);
    // Esc on a modal dialog closes it natively; clean up the same way as the button.
    dialog.addEventListener("cancel", (event) => { event.preventDefault(); close(); });
    (document.body || document.documentElement).append(dialog);
    try { dialog.showModal(); }
    catch (_error) { dialog.setAttribute("open", ""); }
    render(latestSettings || core.normalizeSettings({}));
    post("get-settings");
    refresh();
    panel.focus();
  }

  const toggle = () => (current ? current.close() : open());

  // The button in the corner of every bilibili page. The userscript manager's menu is not
  // obvious (and on the home page people do not find it at all), so the panel needs a way in
  // that is always visible.
  // It hides while the video is fullscreen and while the panel itself is open.
  const launcher = (() => {
    if (root.top !== root) return null;
    const MARGIN = 12;
    // How far a press has to travel before it counts as dragging rather than a click.
    const DRAG_SLOP = 4;
    // Let go this close to the left or right edge and it snaps flush to it; let go anywhere
    // else and it simply stays where it was put.
    const SNAP_MS = 72;
    let host = null;
    let button = null;
    let wanted = false;
    // Where the viewer left it, as shares of the window: 0 means stuck to the left edge, 1 to
    // the right edge, anything between is a free spot. null: never moved.
    let leftRatio = null;
    let topRatio = null;
    let dragging = null;

    // Bilibili fills the screen in two ways: the browser fullscreen API, and its own 网页全屏,
    // which only resizes the player inside the page. Rather than follow Bilibili class names,
    // this asks the picture itself: a video that covers the window is a video being watched
    // full screen, whichever way it got there.
    const fullscreen = () => {
      if (document.fullscreenElement || document.webkitFullscreenElement || document.webkitIsFullScreen) return true;
      const width = root.innerWidth, height = root.innerHeight;
      if (!width || !height) return false;
      for (const video of document.querySelectorAll("video")) {
        const box = video.getBoundingClientRect();
        if (box.width >= width * 0.92 && box.height >= height * 0.92) return true;
      }
      return false;
    };

    const clamp = (value, low, high) => Math.min(Math.max(value, low), high);

    // Puts it back where it was left. Without a saved spot it sits where it always did: to the
    // left of Bilibili's own column of round buttons, near the bottom.
    function place() {
      if (!button) return;
      const size = button.offsetHeight || 44;
      const width = root.innerWidth || 0, height = root.innerHeight || 0;
      if (leftRatio === null || topRatio === null) {
        button.style.top = `${Math.round(Math.max(MARGIN, height - size - 116))}px`;
        button.style.right = "76px";
        button.style.left = "auto";
        button.style.bottom = "auto";
        return;
      }
      button.style.top = `${Math.round(clamp(topRatio * height, MARGIN, Math.max(MARGIN, height - size - MARGIN)))}px`;
      button.style.bottom = "auto";
      if (leftRatio >= 1) {
        button.style.right = `${MARGIN}px`;
        button.style.left = "auto";
        return;
      }
      button.style.left = `${Math.round(clamp(leftRatio * width, MARGIN, Math.max(MARGIN, width - size - MARGIN)))}px`;
      button.style.right = "auto";
    }

    function startDrag(event) {
      if (event.button !== undefined && event.button !== 0) return;
      const box = button.getBoundingClientRect();
      dragging = {
        pointerId: event.pointerId,
        grabX: event.clientX - box.left,
        grabY: event.clientY - box.top,
        fromX: event.clientX,
        fromY: event.clientY,
        moved: false
      };
      try { button.setPointerCapture(event.pointerId); } catch (_error) {}
    }

    function moveDrag(event) {
      if (!dragging || event.pointerId !== dragging.pointerId) return;
      if (!dragging.moved && Math.hypot(event.clientX - dragging.fromX, event.clientY - dragging.fromY) < DRAG_SLOP) return;
      dragging.moved = true;
      button.classList.add("dragging");
      const size = button.offsetHeight || 44;
      const width = root.innerWidth, height = root.innerHeight;
      // Kept as numbers: where it lands is decided from these, not from a fresh layout
      // read, which the browser is free to postpone until the pointer is already up.
      dragging.left = Math.round(clamp(event.clientX - dragging.grabX, MARGIN, width - size - MARGIN));
      dragging.top = Math.round(clamp(event.clientY - dragging.grabY, MARGIN, height - size - MARGIN));
      dragging.size = size;
      button.style.left = `${dragging.left}px`;
      button.style.top = `${dragging.top}px`;
      button.style.right = "auto";
      event.preventDefault();
    }

    function endDrag(event) {
      if (!dragging || event.pointerId !== dragging.pointerId) return;
      const { moved, left = 0, top = 0, size = 44 } = dragging;
      try { button.releasePointerCapture(dragging.pointerId); } catch (_error) {}
      dragging = null;
      button.classList.remove("dragging");
      if (!moved) return;
      // Dropped within reach of the left or right edge: snap flush to it, and remember the
      // edge rather than the pixel, so it stays there whatever the window size. Dropped
      // anywhere else: it stays exactly where it was put.
      const width = root.innerWidth || 1;
      if (left <= SNAP_MS) leftRatio = 0;
      else if (left + size >= width - SNAP_MS) leftRatio = 1;
      else leftRatio = clamp(left / width, 0, 1);
      topRatio = clamp(top / (root.innerHeight || 1), 0, 1);
      place();
      post("settings-update", { floatingButtonLeft: leftRatio, floatingButtonTop: topRatio });
    }

    function mount() {
      if (host?.isConnected) return;
      host = document.createElement("div");
      host.id = LAUNCHER_ID;
      host.style.cssText = "all:initial!important;position:fixed!important;right:0!important;bottom:0!important;width:0!important;height:0!important;z-index:2147483645!important;";
      const shadow = host.attachShadow({ mode: "open" });
      const style = document.createElement("style");
      style.textContent = LAUNCHER_CSS;
      button = document.createElement("button");
      button.type = "button";
      button.className = "btr-launcher";
      button.title = "线程撕裂者设置（可以拖动）";
      button.setAttribute("aria-label", "线程撕裂者设置");
      button.textContent = "YTR";
      button.addEventListener("click", (event) => {
        event.preventDefault();
        event.stopPropagation();
        // A drag that ended on the button itself must not also open the panel.
        if (button.dataset.dragged === "true") {
          button.dataset.dragged = "";
          return;
        }
        toggle();
      });
      button.addEventListener("pointerdown", startDrag);
      button.addEventListener("pointermove", moveDrag);
      for (const type of ["pointerup", "pointercancel"]) {
        button.addEventListener(type, (event) => {
          const moved = Boolean(dragging?.moved);
          endDrag(event);
          if (moved) button.dataset.dragged = "true";
        });
      }
      shadow.append(style, button);
      (document.body || document.documentElement).append(host);
      place();
    }

    function apply() {
      const show = wanted && !fullscreen() && !current;
      if (!show) {
        host?.remove();
        return;
      }
      mount();
      // Bilibili replaces large parts of the page when you navigate; put it back if it went.
      if (!host.isConnected) (document.body || document.documentElement).append(host);
      if (!dragging) place();
    }

    const update = (settings) => {
      wanted = settings?.floatingButton !== false;
      // null (never dragged) must stay null: Number(null) is 0, which would pin it to a corner.
      const ratio = (value) => (value != null && Number(value) >= 0 && Number(value) <= 1 ? Number(value) : null);
      leftRatio = ratio(settings?.floatingButtonLeft);
      topRatio = ratio(settings?.floatingButtonTop);
      apply();
    };
    for (const type of ["fullscreenchange", "webkitfullscreenchange"]) document.addEventListener(type, apply, true);
    root.addEventListener("resize", apply);
    // A page that swaps its body (the SPA navigations) drops the button with it.
    setInterval(apply, 2000);
    if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", apply, { once: true });
    // The button is on by default, so it is there before the stored settings arrive.
    apply();
    return { update, apply };
  })();

  root.addEventListener("message", (event) => {
    if (event.source !== root || event.data?.channel !== CHANNEL) return;
    if (event.data.type === "settings") {
      latestSettings = core.normalizeSettings(event.data.payload);
      launcher?.update(latestSettings);
      current?.render(latestSettings);
    } else if (event.data.type === "stats") {
      latestStats = event.data.payload;
    } else if (event.data.type === "debug-notices") {
      for (const item of [].concat(event.data.payload || [])) {
        noticeHistory.push({ at: Number(item?.at) || Date.now(), level: String(item?.level || "info"), category: String(item?.category || "other"), title: String(item?.title || ""), detail: String(item?.detail || ""), count: Number(item?.count) || 1 });
        if (noticeHistory.length > 100) noticeHistory.shift();
      }
    } else if (event.data.type === "open-settings" && root.top === root) {
      // "自定义" in the gear menu.
      open();
    }
  });
  // The userscript manager's menu entry.
  document.addEventListener("ytr-userscript-open-settings", () => { if (root.top === root) toggle(); });

  root.__BTR_SETTINGS_PANEL__ = Object.freeze({ open, close: () => current?.close(), toggle, isOpen: () => Boolean(current) });
})(globalThis);

(function installNotificationView(root) {
  "use strict";

  const ID = "__btr_notification_stack__";
  const MAX_CARDS = 6;
  const MAX_ERROR_CARDS = 3;
  const LIFETIME = 6500;
  const ERROR_LIFETIME = 20000;
  const ENTER_MS = 600;
  const MOVE_MS = 560;
  const EXIT_MS = 480;
  const EASING = "cubic-bezier(.2,.75,.25,1)";
  const reducedMotion = root.matchMedia("(prefers-reduced-motion: reduce)");
  const cards = new Set();
  const leaving = new Set();
  let settings = {};
  let host = null;
  let stack = null;
  let normalLayer = null;
  let errorLayer = null;
  let idleCard = null;
  let playback = null;
  let receivedAt = 0;
  let lastMode = "";
  let sequence = 0;
  let timer = null;

  function plainText(value, limit = 320) {
    return String(value ?? "").replace(/[\u00b7\u2022\u2027\u2219\u22c5]+/g, "，").slice(0, limit);
  }

  function categoryOf(entry) {
    return ["takeover", "playback", "download", "buffer", "settings", "other"].includes(entry?.category) ? entry.category : "other";
  }

  function allCards() {
    return [...cards, ...leaving].sort((a, b) => b.id - a.id);
  }

  function moveUp(card, target) {
    if (Number.isFinite(card.y) && target >= card.y - .5) return;
    const current = Number.isFinite(card.y) ? card.wrapper.getBoundingClientRect().top - stack.getBoundingClientRect().top : target;
    // Never reverse an interrupted animation, even when a newer layout request
    // arrives before the previous upward movement has finished.
    target = Math.min(target, current);
    card.motion?.cancel();
    card.y = target;
    card.wrapper.style.transform = `translateY(${target}px)`;
    if (!reducedMotion.matches && current - target > .5) {
      card.motion = card.wrapper.animate([{ transform: `translateY(${current}px)` }, { transform: `translateY(${target}px)` }], { duration: MOVE_MS, easing: EASING });
    }
  }

  function packUpwards() {
    if (!stack) return;
    const ordered = allCards();
    for (const card of ordered) card.height = card.wrapper.offsetHeight;
    const errors = ordered.filter(card => card.isError).reverse();
    // Red messages occupy a protected lane at the top of the notification
    // column. Ordinary traffic cannot evict them or push them offscreen.
    let top = Math.max(2, stack.clientHeight - 560);
    for (const card of errors) {
      moveUp(card, Math.min(card.y, top));
      top = card.y + card.height + 8;
    }
    const boundary = errors.length ? top : 0;
    normalLayer.style.clipPath = `inset(${Math.max(0, boundary)}px 0 0 0)`;
    let bottom = stack.clientHeight - 2;
    for (const card of ordered.filter(card => !card.isError)) {
      moveUp(card, Math.min(card.y, bottom - card.height));
      bottom = card.y - 8;
      if (card.y < boundary) {
        // Once clipped out, do not reveal an old message again when an error
        // expires and the protected area becomes smaller.
        retire(card);
        card.wrapper.style.visibility = "hidden";
      }
    }
  }

  function positionStack() {
    if (!host) return;
    const errorNotice = document.getElementById("__bilibili_thread_ripper_error_notice__");
    const fullscreen = document.fullscreenElement;
    const errorVisible = errorNotice?.getClientRects().length && (!fullscreen || fullscreen.contains(errorNotice));
    const bottom = errorVisible ? Math.max(14, innerHeight - errorNotice.getBoundingClientRect().top + 8) : 14;
    const height = `${Math.max(0, innerHeight - bottom - 14)}px`;
    if (host.style.height === height) return;
    host.style.setProperty("height", height, "important");
    // A cleared error or taller viewport may offer more space below. Existing
    // messages keep their positions; only newly created messages use that space.
    trimErrors();
    packUpwards();
  }

  function mount() {
    if (!host) {
      host = document.createElement("div");
      host.id = ID;
      host.style.cssText = "all:initial!important;position:fixed!important;left:14px!important;top:14px!important;width:min(280px,calc(100vw - 28px))!important;z-index:2147483647!important;pointer-events:none!important;";
      const shadow = host.attachShadow({ mode: "open" });
      const style = document.createElement("style");
      style.textContent = `
        :host{color-scheme:dark}
        .stack{position:absolute;inset:0;overflow:hidden}
        .layer{position:absolute;inset:0}
        .errors{z-index:1}
        .entry{position:absolute;top:0;left:2px;right:2px;min-width:0}
        .bubble{--edge:#a5913a;--accent:#f0d66b;box-sizing:border-box;display:block;width:100%;margin:0;padding:7px 9px;border:1px solid var(--edge);border-radius:5px;background:rgba(8,8,10,.78);box-shadow:inset 0 1px 0 #ffffff12,1px 1px 2px #0007;color:#f2f2ee;font:700 13px/1.35 Tahoma,"Microsoft YaHei",sans-serif;white-space:pre-wrap;overflow-wrap:anywhere;text-align:left;text-shadow:1px 1px 0 #0009}
        .bubble[data-level="success"]{--edge:#518346;--accent:#a2d983}
        .bubble[data-level="error"]{--edge:#a44949;--accent:#f28b85}
        .debug{cursor:pointer;pointer-events:auto;appearance:none}
        .debug:focus-visible{outline:2px solid #fff;outline-offset:-3px}
        .leaving{pointer-events:none}
        .heading{display:block;font-weight:700;color:var(--accent)}
        .detail{display:block;margin-top:3px}
        .meta{display:block;margin-top:5px;font-size:10px;line-height:1.3;color:#c4c4bc;font-weight:400}
      `;
      stack = document.createElement("div");
      stack.className = "stack";
      normalLayer = document.createElement("div");
      normalLayer.className = "layer normal";
      errorLayer = document.createElement("div");
      errorLayer.className = "layer errors";
      stack.append(normalLayer, errorLayer);
      shadow.append(style, stack);
    }
    const fullscreen = document.fullscreenElement;
    const parent = fullscreen && fullscreen.tagName !== "VIDEO" ? fullscreen : document.documentElement;
    if (parent && host.parentNode !== parent) parent.append(host);
    positionStack();
    if (!timer) timer = setInterval(tick, 250);
  }

  function createCard(entry, kind) {
    const id = ++sequence;
    const wrapper = document.createElement("div");
    wrapper.className = "entry";
    wrapper.dataset.id = String(id);
    const node = document.createElement(kind === "debug" ? "button" : "div");
    node.className = `bubble ${kind}`;
    node.dataset.level = ["success", "error"].includes(entry.level) ? entry.level : "info";
    if (kind === "debug") {
      node.type = "button";
      node.setAttribute("aria-label", "关闭这条 Debug 提示");
    } else node.setAttribute("role", "status");
    const heading = document.createElement("span");
    heading.className = "heading";
    heading.textContent = entry.level === "error" && !settings.debugNotices ? "BTR 提示" : "BTR Debug";
    const detail = document.createElement("span");
    detail.className = "detail";
    detail.textContent = [plainText(entry.title, 80), plainText(entry.detail)].filter(Boolean).join("\n");
    node.append(heading, detail);
    if (kind === "debug") {
      const meta = document.createElement("span");
      meta.className = "meta";
      const route = plainText(entry.route, 100);
      const part = /^(.*):p(\d+)$/.exec(route);
      const videoLabel = part ? `视频 ${part[1]}，第 ${part[2]} P` : route;
      const count = Math.max(1, Math.min(10000, Number(entry.count) || 1));
      meta.textContent = [`时间 ${new Date().toLocaleTimeString("zh-CN", { hour12: false })}`, videoLabel, count > 1 ? `本条包含 ${count} 条同类记录` : ""].filter(Boolean).join("\n");
      node.append(meta);
    }
    wrapper.append(node);
    const isError = entry.level === "error";
    const card = { id, kind, isError, category: kind === "mode" && !entry.category ? "mode" : categoryOf(entry), wrapper, node, y: Infinity, height: 0, expires: Date.now() + (isError ? ERROR_LIFETIME : LIFETIME), fade: null, motion: null };
    if (kind === "debug") node.addEventListener("click", () => retire(card));
    return card;
  }

  function appendCards(entries, kind = "debug") {
    mount();
    if (idleCard) { idleCard.expires = Date.now() + LIFETIME; idleCard = null; }
    const added = entries.map(entry => createCard(entry, kind));
    for (const card of added) {
      cards.add(card);
      (card.isError ? errorLayer : normalLayer).append(card.wrapper);
    }
    trimErrors();
    packUpwards();
    for (const card of added) if (cards.has(card) && !reducedMotion.matches) {
      card.fade = card.node.animate([{ opacity: 0, transform: "translateX(-32px)" }, { opacity: 1, transform: "translateX(0)" }], { duration: ENTER_MS, easing: EASING });
    }
    const ordinary = [...cards].filter(card => !card.isError);
    while (ordinary.length > MAX_CARDS) retire(ordinary.shift());
    return added.at(-1);
  }

  function trimErrors() {
    if (!stack) return;
    const errors = allCards().filter(card => card.isError).reverse();
    const available = Math.min(560, stack.clientHeight) - 4;
    let occupied = errors.reduce((sum, card) => sum + card.wrapper.offsetHeight + 8, 0);
    // Bounded even for a burst of large errors or a very short viewport.
    // Keep the most recent errors when the protected lane is full.
    while (errors.length > MAX_ERROR_CARDS || (errors.length > 1 && occupied > available)) {
      const card = errors.shift();
      occupied -= card.wrapper.offsetHeight + 8;
      retire(card);
      finishLeaving(card);
    }
  }

  function finishLeaving(card) {
    if (!leaving.delete(card)) return;
    clearTimeout(card.exitTimer);
    card.fade?.cancel();
    card.motion?.cancel();
    card.wrapper.remove();
    // Absolute positions intentionally leave a gap. Removing a bubble must not
    // pull older bubbles down to refill a bottom-aligned flex layout.
  }

  function retire(card) {
    if (!cards.delete(card)) return;
    if (idleCard === card) idleCard = null;
    const opacity = getComputedStyle(card.node).opacity;
    const transform = getComputedStyle(card.node).transform;
    card.fade?.cancel();
    card.node.classList.add("leaving");
    card.node.disabled = true;
    leaving.add(card);
    if (reducedMotion.matches) { finishLeaving(card); return; }
    card.fade = card.node.animate([{ opacity, transform }, { opacity: 0, transform: "translateX(-28px)" }], { duration: EXIT_MS, easing: "ease-in", fill: "forwards" });
    card.fade.finished.then(() => finishLeaving(card), () => {});
    // Hidden/background tabs may suspend animation completion callbacks.
    card.exitTimer = setTimeout(() => finishLeaving(card), EXIT_MS + 80);
    const sameLevel = [...leaving].filter(item => item.isError === card.isError);
    while (sameLevel.length > (card.isError ? MAX_ERROR_CARDS : MAX_CARDS)) finishLeaving(sameLevel.shift());
  }

  function reset() {
    for (const card of allCards()) { clearTimeout(card.exitTimer); card.fade?.cancel(); card.motion?.cancel(); }
    cards.clear();
    leaving.clear();
    host?.remove();
    host = stack = normalLayer = errorLayer = idleCard = playback = null;
    lastMode = "";
    clearInterval(timer);
    timer = null;
  }

  function syncMode() {
    if (!settings.debugNotices) {
      if (!cards.size && !leaving.size) reset();
      return;
    }
    mount();
    const fresh = settings.debugCategories?.playback !== false && playback?.attached && Date.now() - receivedAt < 2500;
    const detail = !settings.enabled ? "视频加速目前已关闭。" : fresh ? (playback.playing ? "加速已接管，视频正在播放。" : "加速已接管，视频还没播放。\n如果视频正在播放，请刷新网页。") : "有新的运行消息时，会显示在这里。";
    const signature = `${fresh ? `${playback.route}:${playback.session}` : ""}\n${detail}`;
    if (signature === lastMode && (cards.size || leaving.size)) return;
    lastMode = signature;
    // Status changes create a new immutable snapshot too. When the stack is
    // empty, create a fresh idle card; never bring an old card back down.
    idleCard = appendCards([{ title: "Debug 模式已开启", detail, category: fresh ? "playback" : undefined, level: settings.enabled && (!fresh || playback.playing) ? "success" : "info" }], "mode");
    idleCard.expires = Infinity;
  }

  function tick() {
    positionStack();
    for (const card of cards) if (card.expires <= Date.now()) retire(card);
    packUpwards();
    syncMode();
  }

  root.__BTR_NOTIFICATION_VIEW__ = Object.freeze({
    configure(next) {
      if (settings.enabled !== next.enabled || settings.debugNotices !== next.debugNotices) playback = null;
      settings = { enabled: next.enabled !== false, debugNotices: next.debugNotices === true, errorNotices: next.errorNotices === true, debugCategories: { ...next.debugCategories } };
      if (!settings.debugNotices) lastMode = "";
      for (const card of cards) {
        const debugAllowed = settings.debugNotices && settings.debugCategories[card.category] !== false;
        const keep = card.kind === "mode" ? debugAllowed : settings.enabled && (card.isError ? settings.errorNotices : debugAllowed);
        if (!keep) retire(card);
      }
      syncMode();
    },
    playback(next) {
      if (!settings.enabled || !settings.debugNotices || settings.debugCategories.playback === false) return;
      playback = { attached: next?.attached === true, playing: next?.playing === true, route: String(next?.route || "").slice(0, 100), session: Number(next?.session) || 0 };
      receivedAt = Date.now();
      syncMode();
    },
    logs(entries) {
      if (!settings.enabled || !Array.isArray(entries)) return;
      const allowed = entries.filter(entry => entry && typeof entry === "object" && (entry.level === "error" ? settings.errorNotices : settings.debugNotices && settings.debugCategories[categoryOf(entry)] !== false));
      const selected = new Set([
        ...allowed.filter(entry => entry.level === "error").slice(-MAX_ERROR_CARDS),
        ...allowed.filter(entry => entry.level !== "error").slice(-MAX_CARDS)
      ]);
      const snapshots = allowed.filter(entry => selected.has(entry));
      if (snapshots.length) appendCards(snapshots);
    }
  });
  document.addEventListener("DOMContentLoaded", () => { if (settings.debugNotices) syncMode(); }, { once: true });
  document.addEventListener("fullscreenchange", () => { if (host) mount(); });
  root.addEventListener("resize", () => { positionStack(); packUpwards(); });
  reducedMotion.addEventListener("change", () => {
    if (!reducedMotion.matches) return;
    for (const card of allCards()) { card.fade?.cancel(); card.motion?.cancel(); }
    for (const card of [...leaving]) finishLeaving(card);
  });
})(globalThis);

(function installBridge() {
  "use strict";

  const CHANNEL = "__YOUTUBE_RANGE_ACCELERATOR_V2__";
  const VERSION = "2026.10.1.1";
  const notices = globalThis.__BTR_NOTIFICATION_VIEW__;
  const ERROR_NOTICE_ID = "__bilibili_thread_ripper_error_notice__";
  const ERROR_NOTICE_STYLE_ID = "__bilibili_thread_ripper_error_notice_style__";
  const THREAD_OPTIONS = Object.freeze([4, 8, 16, 32, 64, 128]);
  const DEFAULTS = { enabled: true, liveEnabled: false, concurrency: 8, autoConcurrency: true, takeover: "compat", mode: "mainland", customHosts: [], floatingButton: false, floatingButtonLeft: null, floatingButtonTop: null, debugNotices: false, errorNotices: false, debugCategories: {} };
  // Settings of the old ArtPlayer version, of the removed compatibility modes, and the flag
  // of the first-run guide that 0.9.4.2 removed.
  const RETIRED_KEYS = ["statusNotice", "compatibilityMode", "volume", "danmaku", "danmakuFontSize", "subtitleLanguage", "subtitleLastLanguage", "btrOnboardingRevision"];
  let latestSettings = { ...DEFAULTS };
  let latestStats = null;
  let loaded = false;
  let errorNoticeMotion = null;

  // The page checks each custom server again with the full rules before using it; here it
  // only has to look like a host name.
  function normalizeStoredSettings(input) {
    const threads = Math.trunc(Number(input?.concurrency));
    return {
      enabled: input?.enabled !== false,
      liveEnabled: false,
      concurrency: THREAD_OPTIONS.includes(threads) ? threads : 8,
      autoConcurrency: input?.autoConcurrency !== false,
      takeover: "compat",
      mode: ["overseas", "custom"].includes(input?.mode) ? input.mode : "mainland",
      customHosts: (Array.isArray(input?.customHosts) ? input.customHosts : [])
        .map((host) => String(host).trim().toLowerCase())
        .filter((host, index, all) => /^[a-z\d](?:[a-z\d.-]{0,251}[a-z\d])?$/.test(host) && all.indexOf(host) === index)
        .slice(0, 32),
      floatingButton: input?.floatingButton === true,
      floatingButtonLeft: input?.floatingButtonLeft != null && Number(input.floatingButtonLeft) >= 0 && Number(input.floatingButtonLeft) <= 1 ? Number(input.floatingButtonLeft) : null,
      floatingButtonTop: input?.floatingButtonTop != null && Number(input.floatingButtonTop) >= 0 && Number(input.floatingButtonTop) <= 1 ? Number(input.floatingButtonTop) : null,
      debugNotices: input?.debugNotices === true,
      errorNotices: input?.errorNotices === true,
      debugCategories: Object.fromEntries(["takeover", "playback", "download", "buffer", "settings", "other"].map(key => [key, input?.debugCategories?.[key] !== false]))
    };
  }

  function postSettings() {
    window.postMessage({ channel: CHANNEL, type: "settings", payload: latestSettings }, "*");
  }

  function normalizeTakeoverError(input) {
    if (!input || typeof input !== "object") return null;
    const at = Math.max(0, Number(input.at) || 0);
    const retryCount = Math.max(0, Math.min(999, Math.trunc(Number(input.retryCount) || 0)));
    const message = String(input.message || "接管失败").replace(/[\u00b7\u2022\u2027\u2219\u22c5]+/g, "，").slice(0, 500);
    return {
      id: String(input.id || `${at}:${message}`).slice(0, 160),
      at,
      route: String(input.route || "").slice(0, 180),
      stage: String(input.stage || "unknown").slice(0, 80),
      message,
      retryCount
    };
  }

  function removeTakeoverErrorNotice() {
    const notice = document.getElementById(ERROR_NOTICE_ID);
    if (!notice) { document.getElementById(ERROR_NOTICE_STYLE_ID)?.remove(); return; }
    if (notice.dataset.leaving === "true") return;
    const finish = () => {
      notice.remove();
      document.getElementById(ERROR_NOTICE_STYLE_ID)?.remove();
      errorNoticeMotion = null;
    };
    const opacity = getComputedStyle(notice).opacity;
    const transform = getComputedStyle(notice).transform;
    errorNoticeMotion?.cancel();
    if (matchMedia("(prefers-reduced-motion: reduce)").matches || latestSettings.enabled === false) { finish(); return; }
    notice.dataset.leaving = "true";
    notice.style.setProperty("pointer-events", "none", "important");
    errorNoticeMotion = notice.animate([{ opacity, transform }, { opacity: 0, transform: "translateX(-28px)" }], { duration: 480, easing: "ease-in", fill: "forwards" });
    errorNoticeMotion.finished.then(finish, () => {});
  }

  function formatErrorTime(timestamp) {
    if (!Number.isFinite(timestamp) || timestamp <= 0) return "未知";
    try {
      return new Date(timestamp).toLocaleString("zh-CN", { hour12: false });
    } catch (_error) {
      return new Date(timestamp).toISOString();
    }
  }

  function syncTakeoverErrorNotice() {
    const error = latestStats?.takeoverError;
    if (!loaded || latestSettings.enabled === false || latestSettings.errorNotices !== true || !error || ["ready", "disabled"].includes(latestStats?.playerState)) {
      removeTakeoverErrorNotice();
      return;
    }
    if (window.top !== window) return;
    const mount = document.body || document.documentElement;
    if (!mount) {
      document.addEventListener("DOMContentLoaded", syncTakeoverErrorNotice, { once: true });
      return;
    }

    if (!document.getElementById(ERROR_NOTICE_STYLE_ID)) {
      const style = document.createElement("style");
      style.id = ERROR_NOTICE_STYLE_ID;
      style.textContent = `
        #${ERROR_NOTICE_ID}{position:fixed!important;left:14px!important;bottom:14px!important;z-index:2147483646!important;width:min(280px,calc(100vw - 28px))!important;max-height:65vh!important;overflow:auto!important;box-sizing:border-box!important;border:1px solid #a44949!important;border-radius:5px!important;background:rgba(8,8,10,.78)!important;color:#f2f2ee!important;font-family:Tahoma,"Microsoft YaHei",sans-serif!important;text-shadow:1px 1px 0 #0009!important;box-shadow:inset 0 1px 0 #ffffff12,1px 1px 2px #0007!important}
        #${ERROR_NOTICE_ID} *{box-sizing:border-box!important}
        #${ERROR_NOTICE_ID} .btr-error-summary{padding:7px 9px!important}
        #${ERROR_NOTICE_ID} .btr-error-title{margin:0!important;color:#f28b85!important;font-size:13px!important;font-weight:700!important;line-height:18px!important}
        #${ERROR_NOTICE_ID} .btr-error-description{margin:3px 0 0!important;font-size:13px!important;line-height:18px!important;font-weight:700!important}
        #${ERROR_NOTICE_ID} .btr-error-toggle{display:inline-block!important;margin:3px 0 0!important;padding:0!important;border:0!important;background:transparent!important;color:#f28b85!important;font:400 12px/18px Tahoma,"Microsoft YaHei",sans-serif!important;text-align:left!important;cursor:pointer!important}
        #${ERROR_NOTICE_ID} .btr-error-toggle:hover{text-decoration:underline!important}
        #${ERROR_NOTICE_ID} .btr-error-toggle:focus-visible,#${ERROR_NOTICE_ID} .btr-error-retry:focus-visible{outline:2px solid #00aeec!important;outline-offset:2px!important}
        #${ERROR_NOTICE_ID} .btr-error-details{display:none!important;padding:0 15px 14px!important;border-top:1px solid #2f3136!important}
        #${ERROR_NOTICE_ID}[data-expanded="true"] .btr-error-details{display:block!important}
        #${ERROR_NOTICE_ID} .btr-error-log{margin:11px 0 12px!important;padding:10px!important;border:0!important;border-radius:4px!important;background:#222328!important;color:#c9ccd0!important;font:12px/1.6 Consolas,"Microsoft YaHei",monospace!important;white-space:pre-wrap!important;overflow-wrap:anywhere!important;user-select:text!important}
        #${ERROR_NOTICE_ID} .btr-error-retry{height:30px!important;margin:0!important;padding:0 13px!important;border:1px solid #a44949!important;border-radius:3px!important;background:#713b3b!important;color:#fff!important;font:700 12px/28px Tahoma,"Microsoft YaHei",sans-serif!important;cursor:pointer!important}
        #${ERROR_NOTICE_ID} .btr-error-retry:hover{background:#8a4545!important}
        #${ERROR_NOTICE_ID} .btr-error-retry:disabled{background:#6b4b55!important;color:#d8c5cb!important;cursor:default!important}
      `;
      (document.head || document.documentElement).append(style);
    }

    let notice = document.getElementById(ERROR_NOTICE_ID);
    if (!notice) {
      notice = document.createElement("section");
      notice.id = ERROR_NOTICE_ID;
      notice.dataset.expanded = "false";
      notice.setAttribute("role", "alert");
      notice.setAttribute("aria-live", "assertive");
      notice.setAttribute("aria-atomic", "true");

      const summary = document.createElement("div");
      summary.className = "btr-error-summary";
      const title = document.createElement("p");
      title.className = "btr-error-title";
      title.textContent = "BTR 提示";
      const description = document.createElement("p");
      description.className = "btr-error-description";
      description.textContent = "没能接管这个视频。";
      const toggle = document.createElement("button");
      toggle.type = "button";
      toggle.className = "btr-error-toggle";
      toggle.textContent = "检查错误日志";
      toggle.setAttribute("aria-expanded", "false");
      summary.append(title, description, toggle);

      const details = document.createElement("div");
      details.className = "btr-error-details";
      const log = document.createElement("pre");
      log.className = "btr-error-log";
      const retry = document.createElement("button");
      retry.type = "button";
      retry.className = "btr-error-retry";
      retry.textContent = "重新接管";
      details.append(log, retry);
      notice.append(summary, details);

      toggle.addEventListener("click", () => {
        const expanded = notice.dataset.expanded !== "true";
        notice.dataset.expanded = String(expanded);
        toggle.setAttribute("aria-expanded", String(expanded));
      });
      retry.addEventListener("click", () => {
        retry.disabled = true;
        retry.textContent = "正在重新接管…";
        window.postMessage({ channel: CHANNEL, type: "retry-takeover" }, "*");
        setTimeout(() => {
          if (!retry.isConnected) return;
          retry.disabled = false;
          retry.textContent = "重新接管";
        }, 1800);
      });
      mount.append(notice);
      if (!matchMedia("(prefers-reduced-motion: reduce)").matches) errorNoticeMotion = notice.animate([{ opacity: 0, transform: "translateX(-32px)" }, { opacity: 1, transform: "translateX(0)" }], { duration: 600, easing: "cubic-bezier(.2,.75,.25,1)" });
    }

    if (notice.dataset.leaving === "true") {
      errorNoticeMotion?.cancel();
      errorNoticeMotion = null;
      delete notice.dataset.leaving;
      notice.style.removeProperty("pointer-events");
    }
    notice.dataset.errorId = error.id;
    const log = notice.querySelector(".btr-error-log");
    if (log) {
      log.textContent = [
        `当前 URL：${String(location.href).slice(0, 2048)}`,
        `时间：${formatErrorTime(error.at)}`,
        `阶段：${error.stage || "unknown"}`,
        `路由：${error.route || "未知"}`,
        `错误：${error.message}`,
        `重试次数：${error.retryCount}`
      ].join("\n");
    }
  }

  chrome.storage.sync.get(null, (stored) => {
    latestSettings = normalizeStoredSettings({ ...DEFAULTS, ...stored });
    const retired = RETIRED_KEYS.filter((key) => Object.prototype.hasOwnProperty.call(stored, key));
    if (retired.length) chrome.storage.sync.remove(retired);
    const changed = Object.keys(DEFAULTS).filter((key) => JSON.stringify(stored[key]) !== JSON.stringify(latestSettings[key]));
    if (changed.length) chrome.storage.sync.set(Object.fromEntries(changed.map((key) => [key, latestSettings[key]])));
    loaded = true;
    notices?.configure(latestSettings);
    syncTakeoverErrorNotice();
    postSettings();
  });

  chrome.storage.onChanged.addListener((changes, areaName) => {
    if (areaName !== "sync") return;
    for (const key of Object.keys(DEFAULTS)) {
      if (changes[key]) latestSettings[key] = changes[key].newValue;
    }
    latestSettings = normalizeStoredSettings(latestSettings);
    loaded = true;
    notices?.configure(latestSettings);
    syncTakeoverErrorNotice();
    postSettings();
  });

  window.addEventListener("message", (event) => {
    if (event.source !== window || event.data?.channel !== CHANNEL) return;
    if (event.data.type === "playback-notice") {
      notices?.playback(event.data.payload);
      return;
    }
    if (event.data.type === "debug-notices") {
      notices?.logs(event.data.payload);
      return;
    }
    // The settings panel and the player's gear menu save through here.
    if (event.data.type === "get-settings") {
      if (loaded) postSettings();
      return;
    }
    if (event.data.type === "settings-update") {
      const input = event.data.payload;
      if (!input || typeof input !== "object") return;
      const keys = Object.keys(DEFAULTS).filter((key) => Object.prototype.hasOwnProperty.call(input, key));
      if (!keys.length) return;
      const next = normalizeStoredSettings({ ...latestSettings, ...Object.fromEntries(keys.map((key) => [key, input[key]])) });
      chrome.storage.sync.set(Object.fromEntries(keys.map((key) => [key, next[key]])));
      return;
    }
    if (event.data.type !== "stats") return;
    const input = event.data.payload;
    if (!input || typeof input !== "object") return;
    latestStats = {
      version: String(input.version || ""),
      architecture: String(input.architecture || ""),
      mode: ["overseas", "custom"].includes(input.mode) ? input.mode : "mainland",
      playerState: String(input.playerState || "waiting").slice(0, 32),
      quality: String(input.quality || "").slice(0, 24),
      bufferedAhead: Math.max(0, Number(input.bufferedAhead) || 0),
      acceleratedRequests: Math.max(0, Number(input.acceleratedRequests) || 0),
      acceleratedBytes: Math.max(0, Number(input.acceleratedBytes) || 0),
      parallelSubrequests: Math.max(0, Number(input.parallelSubrequests) || 0),
      activeThreads: Math.max(0, Number(input.activeThreads) || 0),
      totalSpeedBps: Math.max(0, Number(input.totalSpeedBps) || 0),
      discoveredCdns: Math.max(0, Number(input.discoveredCdns) || 0),
      healthyCdns: Math.max(0, Number(input.healthyCdns) || 0),
      blockedCdns: Math.max(0, Number(input.blockedCdns) || 0),
      lastHost: String(input.lastHost || "").slice(0, 120),
      lastError: String(input.lastError || "").replace(/[·•‧∙⋅]+/g, "，").slice(0, 180),
      takeoverError: normalizeTakeoverError(input.takeoverError),
      cdnHosts: Array.isArray(input.cdnHosts) ? input.cdnHosts.slice(0, 32).map((item) => ({
        host: String(item?.host || "").slice(0, 120),
        state: ["healthy", "blocked", "banned", "untested"].includes(item?.state) ? item.state : "untested"
      })) : [],
      threadSpeeds: Array.isArray(input.threadSpeeds) ? input.threadSpeeds.slice(0, 512).map((item) => ({
        id: Number(item?.id) || 0,
        label: String(item?.label || "").slice(0, 12),
        kind: ["video", "audio", "meta"].includes(item?.kind) ? item.kind : "video",
        loaded: Math.max(0, Number(item?.loaded) || 0),
        totalBytes: Math.max(0, Number(item?.totalBytes) || 0),
        bps: Math.max(0, Number(item?.bps) || 0),
        state: ["active", "done", "error"].includes(item?.state) ? item.state : "active",
        host: String(item?.host || "").slice(0, 120)
      })) : []
    };
    syncTakeoverErrorNotice();
  });
})();

// Glue only: the visible interface and range engine are the upstream BTR modules.
(function (root) {
  'use strict';
  const CHANNEL = '__YOUTUBE_RANGE_ACCELERATOR_V2__';
  const core = root.__BILI_RANGE_CORE__, site = root.__YTR_SITE__, sabr = root.YTRCore;
  const factory = root.__BILI_IDM_DOWNLOADER_FACTORY__;
  const cdn = root.__BILI_CDN_RESOLVER_FACTORY__, notices = root.__BTR_RUNTIME_NOTICES__;
  let settings = core.normalizeSettings({ autoConcurrency: true, floatingButton: false, takeover: 'compat' });
  const nativeFetch = root.fetch.bind(root), nativeSend = root.XMLHttpRequest.prototype.send;
  const nativeOpen = root.XMLHttpRequest.prototype.open, postRequests = new WeakMap();
  const jobs = new Set(), transfers = new Map(), resolvers = new Map();
  const counts = { ranges: 0, bytes: 0, pieces: 0, failures: 0, sabrRecognized: 0, sabrPatched: 0, postUnrecognized: 0 };
  let transferSequence = 0, attachedVideo = null, publishTimer = null, videoSession = 0;
  const video = () => document.querySelector('video.html5-main-video') || document.querySelector('video');
  function ahead() {
    const target = video();
    if (!target) return 0;
    for (let i = 0; i < target.buffered.length; i++) if (target.buffered.start(i) <= target.currentTime && target.buffered.end(i) > target.currentTime) return target.buffered.end(i) - target.currentTime;
    return 0;
  }
  function state() {
    const target = video(), list = [...transfers.values()], active = list.filter(item => item.state === 'active');
    return {
      version: '2026.10.1.1', architecture: 'btr-native-range-youtube-adapter', mode: settings.mode,
      playerState: !settings.enabled ? 'disabled' : target?.error ? 'error' : target?.readyState >= 3 ? 'ready' : 'waiting',
      quality: target?.videoHeight ? `${target.videoHeight}p` : '原生画质', bufferedAhead: ahead(),
      acceleratedRequests: counts.ranges, acceleratedBytes: counts.bytes, parallelSubrequests: counts.pieces,
      activeThreads: active.length, totalSpeedBps: active.reduce((sum, item) => sum + item.bps, 0),
      threadSpeeds: list, youtube: { ...counts },
      cdnHosts: [...resolvers.values()].flatMap(resolver => resolver.status()),
      settings: { ...settings }, actualRate: target?.playbackRate || 1
    };
  }
  function publish() { publishTimer = null; root.postMessage({ channel: CHANNEL, type: 'stats', payload: state() }, '*'); }
  function schedule() { publishTimer ??= setTimeout(publish, 120); }
  function onTransfer(event) {
    if (event.phase === 'start') {
      const id = ++transferSequence;
      transfers.set(id, { id, kind: event.kind, label: event.kind === 'audio' ? '音频' : '视频', host: new URL(event.url).hostname, loaded: 0, totalBytes: event.totalBytes, state: 'active', bps: 0 });
      schedule(); return id;
    }
    const item = transfers.get(event.id);
    if (!item) return event.id;
    if (event.phase === 'progress') { item.loaded += event.bytes || 0; item.bps = event.bps || 0; }
    else { item.state = event.phase === 'done' ? 'done' : 'error'; item.bps = 0; }
    if (transfers.size > 512) for (const [id, value] of transfers) { if (value.state !== 'active') transfers.delete(id); if (transfers.size <= 512) break; }
    schedule(); return event.id;
  }
  const downloader = factory.createDownloader({ getSettings: () => settings, nativeFetch: site.pieceFetcher(nativeFetch), onTransfer });
  const owner = {
    disposed: false, jobs, settings: () => settings, downloader,
    resolver(url, track) {
      const parsed = new URL(url); parsed.searchParams.delete('range');
      const key = parsed.href;
      if (!resolvers.has(key)) {
        if (resolvers.size >= 64) resolvers.delete(resolvers.keys().next().value);
        resolvers.set(key, cdn.createResolver(track.representation, () => 'mainland'));
      }
      return resolvers.get(key);
    },
    delivered(track, result) {
      counts.ranges++; counts.bytes += result.byteLength; counts.pieces += result.pieceCount;
      notices.log('媒体分段下载好了', `${result.byteLength} bytes / ${result.pieceCount} 段`, 'success', '', '', 'download'); schedule();
    },
    failed(error) { counts.failures++; notices.log('媒体分段下载失败', String(error.message || error), 'error', '', '', 'download'); schedule(); }
  };
  function patch(body) {
    const target = video();
    if (!settings.enabled || settings.mode === 'mainland' || !target) return null;
    const result = sabr.patchSabr(body, target.playbackRate, settings.mode === 'custom' ? 2 : 1);
    if (!result) { counts.postUnrecognized++; return null; }
    counts.sabrRecognized++;
    if (!result.changed) return null;
    counts.sabrPatched++; schedule(); return result.bytes;
  }
  root.fetch = async function (input, init) {
    const url = typeof input === 'string' ? input : input instanceof URL ? input.href : input?.url;
    if (!settings.enabled || !site.mediaURL(url) || String(init?.method || input?.method || 'GET').toUpperCase() !== 'POST') return nativeFetch(input, init);
    let replacement = null;
    try {
      let body = init && Object.hasOwn(init, 'body') ? init.body : undefined;
      if (body === undefined && typeof input?.clone === 'function') body = await input.clone().arrayBuffer();
      if (body && typeof body.arrayBuffer === 'function') body = await body.arrayBuffer();
      replacement = patch(body);
    } catch { counts.postUnrecognized++; }
    return nativeFetch(input, replacement ? { ...init, body: replacement } : init);
  };
  const proto = root.XMLHttpRequest.prototype;
  proto.open = function (method, url, async = true, ...rest) {
    const result = nativeOpen.call(this, method, url, async, ...rest);
    postRequests.set(this, { method: String(method).toUpperCase(), url: String(url), async: async !== false });
    return result;
  };
  proto.send = function (body) {
    const request = postRequests.get(this);
    const replacement = request?.async && request.method === 'POST' && site.mediaURL(request.url) ? patch(body) : null;
    return nativeSend.call(this, replacement || body);
  };
  root.__YTR_RANGE_TRANSPORT__.attach(owner);
  function attachVideo() {
    const target = video();
    if (target === attachedVideo) return;
    for (const job of jobs) job.abort();
    notices.detach(); attachedVideo = target;
    if (!target) return;
    videoSession++;
    const session = videoSession;
    notices.attach(target, root.location.pathname, session, () => target === attachedVideo && session === videoSession && settings.enabled);
    for (const type of ['timeupdate', 'progress', 'ratechange', 'playing']) target.addEventListener(type, () => {
      if (attachedVideo !== target) return;
      if (settings.enabled && settings.autoConcurrency) factory.autoConcurrency.buffer(ahead() / (target.playbackRate || 1), !target.paused);
      schedule();
    });
    target.addEventListener('waiting', () => { if (target === attachedVideo && settings.enabled && settings.autoConcurrency) factory.autoConcurrency.stall(); });
    target.addEventListener('seeking', () => { if (target === attachedVideo) for (const job of jobs) job.abort(); });
  }
  new MutationObserver(attachVideo).observe(document, { childList: true, subtree: true });
  root.addEventListener('message', event => {
    if (event.source !== root || event.data?.channel !== CHANNEL) return;
    if (event.data.type === 'settings') {
      settings = core.normalizeSettings(event.data.payload); downloader.applySettings(); notices.configure(settings);
      if (!settings.enabled) for (const job of jobs) job.abort();
      publish();
    } else if (event.data.type === 'get-stats') publish();
  });
  root.__biliThreadRipperDebug = Object.freeze({ report: () => JSON.stringify(state()) });
  root.__YTR_EXPERIMENT_V2__ = Object.freeze({ snapshot: state });
  attachVideo(); publish();
})(globalThis);

}
// Runs wherever the userscript manager puts the script. The accelerator itself has to run in
// the bilibili page, so pageCode is started there. The manager's menu only sends a page
// event that opens the settings panel.
//
// pageCode is called directly only when this script already runs as a page script (window
// is the page's own). Otherwise it is injected as a script element: with any @grant,
// Tampermonkey and Violentmonkey both wrap window in a sandbox that keeps globals to the
// script, and in Violentmonkey's "content" mode (the one the header asks for) even
// unsafeWindow is the content script's global rather than the page's.
const LOADED = "data-ytr-userscript";
const pageWindow = typeof unsafeWindow !== "undefined" && unsafeWindow ? unsafeWindow : window;

// Which manager runs the script, its version and injection mode, for the diagnostic report
// (Tampermonkey and Violentmonkey both describe themselves in GM_info).
const MANAGER_MARK = "data-ytr-userscript-manager";
function describeManager() {
  try {
    const info = typeof GM_info === "object" && GM_info ? GM_info : null;
    return info ? [info.scriptHandler, info.version, info.injectInto].filter(Boolean).map(String).join(" ").slice(0, 80) : "";
  } catch (_error) { return ""; }
}

// The settings live in the manager's storage, which every bilibili subdomain shares; this
// site's localStorage is separate on each one, so a setting changed on space.bilibili.com
// never reached the video pages. Only this side of the script can use the manager's storage:
// the page code (storage-shim.js) asks for it with events carrying JSON text. The first time,
// what this subdomain's localStorage held is taken over; it stays there too.
const STORAGE_MARK = "data-ytr-userscript-storage";
const manager = typeof GM !== "undefined" && typeof GM?.getValue === "function" && typeof GM?.setValue === "function" ? GM : null;
const managerReportsChanges = typeof GM_addValueChangeListener === "function";

function answerPage(type, message) {
  document.dispatchEvent(new CustomEvent(type, { detail: JSON.stringify(message) }));
}

function serveStorage() {
  const read = async (area) => {
    const stored = await manager.getValue(area);
    if (typeof stored === "string") return stored;
    let earlier = null;
    try { earlier = localStorage.getItem(`YTR_Userscript.${area}`); } catch (_error) {}
    if (earlier) await manager.setValue(area, earlier);
    return earlier || "{}";
  };
  // One request at a time: a change reads what is stored and writes it back.
  let queue = Promise.resolve();
  document.addEventListener("ytr-userscript-storage-request", (event) => {
    let request = null;
    try { request = JSON.parse(event.detail); } catch (_error) { return; }
    if (!request || !["sync", "local"].includes(request.area)) return;
    queue = queue.then(async () => {
      let value = {};
      try { value = JSON.parse(await read(request.area)) || {}; } catch (_error) {}
      if (request.op === "set") Object.assign(value, request.items);
      else if (request.op === "remove") for (const key of [].concat(request.keys)) delete value[key];
      if (request.op === "set" || request.op === "remove") await manager.setValue(request.area, JSON.stringify(value));
      answerPage("ytr-userscript-storage-reply", { id: request.id, value });
    }).catch((error) => answerPage("ytr-userscript-storage-reply", { id: request.id, error: String(error?.message || error) }));
  });
  if (managerReportsChanges) {
    for (const area of ["sync", "local"]) {
      GM_addValueChangeListener(area, (_name, _oldValue, value, remote) => {
        if (remote) answerPage("ytr-userscript-storage-change", { area, value: typeof value === "string" ? value : "{}" });
      });
    }
  }
}
if (manager) serveStorage();

function injected() {
  return document.documentElement?.hasAttribute(LOADED) === true;
}

function inject() {
  const source = `(${pageCode})();`;
  // Prefer the manager's own injection, which also works on pages with a strict CSP.
  if (typeof GM_addElement === "function") {
    try { GM_addElement(document.documentElement, "script", { textContent: source })?.remove?.(); }
    catch (_error) {}
  }
  if (injected()) return;
  const script = document.createElement("script");
  script.textContent = source;
  document.documentElement.append(script);
  script.remove();
  if (!injected()) console.error("BTR: 无法在页面里启动线程撕裂者");
}

// The page code reads this mark once, when it starts, to know whether its settings go
// through the manager ("live": the manager also reports other tabs' changes).
function start() {
  if (manager) document.documentElement.setAttribute(STORAGE_MARK, managerReportsChanges ? "manager live" : "manager");
  const described = describeManager();
  if (described) document.documentElement.setAttribute(MANAGER_MARK, described);
  if (pageWindow === window) pageCode();
  else inject();
}

if (document.documentElement) start();
else {
  const observer = new MutationObserver(() => {
    if (!document.documentElement) return;
    observer.disconnect();
    start();
  });
  observer.observe(document, { childList: true });
}

// The script now runs in live-site iframes too; the manager menu entry stays one per tab.
let topLevelFrame = true;
try { topLevelFrame = window.self === window.top; } catch (_error) {}
if (typeof GM_registerMenuCommand === "function" && topLevelFrame) {
  GM_registerMenuCommand("线程撕裂者设置", () => document.dispatchEvent(new CustomEvent("ytr-userscript-open-settings")));
}

})();
