const vm = require('node:vm');
const fs = require('node:fs');
const path = require('node:path');
const { adapted, transport } = require('../scripts/adapt-btr.cjs');
const root = path.resolve(__dirname, '..');
function setup(fetcher = async () => new Response('native')) {
  const calls = [], nativeXHR = [], listeners = new Map();
  const target = new EventTarget();
  Object.assign(target, { playbackRate: 3, currentTime: 10, paused: false, seeking: false, buffered: { length: 1, start: () => 0, end: () => 70 }, readyState: 4, videoHeight: 2160 });
  class XHR extends EventTarget {
    constructor() { super(); this._readyState = 0; this.responseType = ''; this.withCredentials = false; this.timeout = 0; }
    get readyState() { return this._readyState; }
    get response() { return 'native'; }
    get responseText() { return 'native'; }
    get responseURL() { return 'native'; }
    get status() { return 200; }
    get statusText() { return 'OK'; }
    open(...args) { this._readyState = 1; nativeXHR.push(['open', ...args]); this.dispatchEvent(new Event('readystatechange')); }
    send(body) { nativeXHR.push(['send', body]); }
    abort() { this._readyState = 0; }
    setRequestHeader() {}
    getResponseHeader() { return null; }
    getAllResponseHeaders() { return ''; }
  }
  const context = vm.createContext({
    console, performance, URL, Request, Response, Headers, Uint8Array, ArrayBuffer, DataView, AbortController, DOMException, Event, WeakRef, TransformStream,
    ProgressEvent: class extends Event { constructor(type, init) { super(type); Object.assign(this, init); } },
    XMLHttpRequest: XHR, setTimeout, clearTimeout, queueMicrotask,
    fetch: (...args) => { calls.push(args); return fetcher(...args); },
    location: { href: 'https://www.youtube.com/watch?v=test', pathname: '/watch' },
    document: { querySelector: () => target }, MutationObserver: class { observe() {} },
    addEventListener: (type, callback) => { if (!listeners.has(type)) listeners.set(type, []); listeners.get(type).push(callback); },
    __BTR_RUNTIME_NOTICES__: { log() {}, attach() {}, detach() {}, configure() {} }
  });
  vm.runInContext('window = self = top = globalThis; postMessage = () => {};', context);
  function run(text) { return vm.runInContext(text, context); }
  run(adapted('src/range-core.js'));
  run(fs.readFileSync(path.join(root, 'src/core.js'), 'utf8'));
  run(fs.readFileSync(path.join(root, 'src/site-adapter.js'), 'utf8'));
  run(adapted('src/cdn-resolver.js'));
  run(adapted('src/idm-downloader.js'));
  run(transport());
  run(fs.readFileSync(path.join(root, 'src/runtime.js'), 'utf8'));
  const global = run('globalThis');
  function settings(value) { for (const callback of listeners.get('message') || []) callback({ source: global, data: { channel: '__YOUTUBE_RANGE_ACCELERATOR_V2__', type: 'settings', payload: value } }); }
  settings({ autoConcurrency: false, concurrency: 8, mode: 'mainland', floatingButton: false });
  return { page: global, calls, nativeXHR, target, settings, run };
}
module.exports = { setup };
