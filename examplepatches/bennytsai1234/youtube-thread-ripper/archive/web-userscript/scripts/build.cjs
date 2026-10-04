const fs = require('node:fs');
const path = require('node:path');
const { adapted, transport } = require('./adapt-btr.cjs');
const root = path.resolve(__dirname, '..');
const version = '2026.10.1.1';
const metadata = `// ==UserScript==
// @name         YouTube Thread Ripper 實驗版
// @namespace    local.youtube-thread-ripper
// @version      ${version}
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
`;
const own = file => fs.readFileSync(path.join(root, file), 'utf8');
const files = [
  adapted('user_scripts/adapter/storage-shim.js'),
  adapted('src/range-core.js'), own('src/core.js'), own('src/site-adapter.js'),
  adapted('src/cdn-resolver.js'), adapted('src/idm-downloader.js'), transport(),
  adapted('src/runtime-notices.js'), adapted('src/settings-panel.js'),
  adapted('src/notification-view.js'), adapted('src/bridge.js'), own('src/runtime.js')
];
let text = `${metadata}\n/*\n${own('NOTICE')}\n*/\n(function() {\n"use strict";\nfunction pageCode() {\n"use strict";\nif (window.top !== window) return;\nif (document.documentElement?.hasAttribute("data-ytr-userscript")) return;\ndocument.documentElement?.setAttribute("data-ytr-userscript", "");\n${files.join('\n')}\n}\n${adapted('user_scripts/adapter/loader.js')}\n})();\n`;
text = text.replaceAll('__BTR_VERSION__', version).replace(/\r\n/g, '\n');
fs.mkdirSync(path.join(root, 'dist'), { recursive: true });
fs.writeFileSync(path.join(root, 'dist/youtube-thread-ripper.user.js'), text, 'utf8');
console.log(`Built BTR-based fork ${version}, ${Buffer.byteLength(text)} bytes`);
