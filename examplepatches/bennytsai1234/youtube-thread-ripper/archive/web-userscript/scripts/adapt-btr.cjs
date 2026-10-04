// Minimal, reviewable site adaptations. Upstream files remain unchanged in vendor/btr.
const fs = require('node:fs');
const path = require('node:path');
const root = path.resolve(__dirname, '..');
function source(file) { return fs.readFileSync(path.join(root, 'vendor/btr', file), 'utf8'); }
function replace(text, from, to) {
  if (!text.includes(from)) throw Error(`Upstream anchor changed: ${from.slice(0, 90)}`);
  return text.replace(from, to);
}
function section(text, from, until, replacement) {
  const start = text.indexOf(from), end = text.indexOf(until, start);
  if (start < 0 || end < 0) throw Error(`Upstream section changed: ${from}`);
  return text.slice(0, start) + replacement + text.slice(end);
}
function adapted(file) {
  let text = source(file);
  if (file.endsWith('/cdn-resolver.js')) {
    text = section(text, '  const MAINLAND_HOSTS =', '  const GLOBAL_HOSTS =', '  const MAINLAND_HOSTS = Object.freeze([]);\n  const OVERSEAS_HOSTS = Object.freeze([]);\n\n');
    text = section(text, '  function representationUrls(', '  function hostOf(', `  function representationUrls(representation) {
    const backup = representation?.backupUrl || representation?.backup_url || [];
    return [representation?.baseUrl || representation?.base_url, ...backup]
      .map(safeMediaUrl).filter(Boolean).filter((url, index, all) => all.indexOf(url) === index);
  }

`);
  }
  if (file.endsWith('/settings-panel.js')) {
    text = replace(text, '<div class="logo" aria-hidden="true">B</div>', '<div class="logo" aria-hidden="true">Y</div>');
    text = replace(text, 'aria-label="CDN 模式"', 'aria-label="YouTube 调度模式"');
    text = replace(text, '<span>大陆</span>', '<span>原生调度</span>');
    text = replace(text, '<span>海外</span>', '<span>实际倍速</span>');
    text = replace(text, '<span>自定义</span>', '<span>额外预取</span>');
    text = replace(text, 'value="full"><span>全接管</span>', 'value="full" disabled><span>全接管（未接入）</span>');
    text = replace(text, 'Safari 用户建议使用兼容模式。<br>全接管：视频由插件自己来放，下载和缓冲都由插件安排，速度最快。<br>兼容模式：当遇到播放问题或设置不生效时，尝试使用兼容模式。', '兼容模式：保留 YouTube 播放器，由 BTR 下载核心处理可接管的 Range。<br>额外预取：SABR 回报两倍需求，效果尚待实测。');
    text = text.replaceAll('直播加速（实验性）', '直播加速（未接入）');
    text = replace(text, 'id="live-enabled" type="checkbox"', 'id="live-enabled" type="checkbox" disabled');
    text = replace(text, 'customSection.hidden = mode !== "custom";', 'customSection.hidden = true;');
    text = replace(text, 'let wanted = true;', 'let wanted = false;');
    text = replace(text, 'button.textContent = "BTR";', 'button.textContent = "YTR";');
    // Styles, modal/shadow DOM, slider, switches, dragging, shortcuts and notices unchanged.
  }
  if (file.endsWith('/bridge.js')) {
    text = replace(text, 'liveEnabled: true, concurrency: 8', 'liveEnabled: false, concurrency: 8');
    text = replace(text, 'takeover: "full", mode:', 'takeover: "compat", mode:');
    text = replace(text, 'floatingButton: true,', 'floatingButton: false,');
    text = replace(text, 'liveEnabled: input?.liveEnabled !== false,', 'liveEnabled: false,');
    text = replace(text, 'takeover: input?.takeover === "compat" ? "compat" : "full",', 'takeover: "compat",');
    text = replace(text, 'floatingButton: input?.floatingButton !== false,', 'floatingButton: input?.floatingButton === true,');
  }
  if (file.endsWith('/runtime-notices.js')) text = replace(text, '继续使用 B 站播放器，由多线程下载加速。', '继续使用 YouTube 播放器，由 BTR 下载核心处理可接管请求。');
  // Own storage/event namespace: a BTR script and this fork never share settings.
  text = text.replaceAll('BTR_Userscript.', 'YTR_Userscript.').replaceAll('data-btr-userscript', 'data-ytr-userscript').replaceAll('btr-userscript-', 'ytr-userscript-').replaceAll('__BILI_RANGE_ACCELERATOR_V1__', '__YOUTUBE_RANGE_ACCELERATOR_V2__');
  return text;
}
function transport() {
  let text = source('src/native-range-transport.js');
  const start = text.indexOf('  // Only bounded, ordinary media GETs');
  const end = text.indexOf('  function createNativePlayer(options)');
  if (start < 0 || end < 0) throw Error('Upstream transport anchors changed');
  text = text.slice(start, end);
  text = section(text, '  function planRequest(', '  // Both loaders use one downloader', `  function planRequest(url, method, headers, credentials) {
    if (!active || active.disposed || !active.settings().enabled || credentials === "include") return null;
    if ([...headers.keys()].some(name => !["range", "accept"].includes(name))) return null;
    const plan = root.__YTR_SITE__.rangePlan(url, method, headers);
    return plan ? { owner: active, ...plan } : null;
  }

`);
  text = replace(text, 'request.url);\n    });', 'request.url);\n    }).catch(error => { if (request.signal.aborted || error?.name === "AbortError") throw error; return passthroughFetch(input, init); });');
  return `(function(root) {\n"use strict";\nconst core = root.__BILI_RANGE_CORE__;\nlet active = null, passthroughFetch = root.fetch.bind(root);\n${text}\nroot.__YTR_RANGE_TRANSPORT__ = Object.freeze({ attach(owner) { active = owner; installInterception(); }, detach(owner) { if (active === owner) active = null; } });\n})(globalThis);`;
}
module.exports = { source, adapted, transport };
