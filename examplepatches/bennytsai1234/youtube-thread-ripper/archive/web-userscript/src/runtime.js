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
      version: '__BTR_VERSION__', architecture: 'btr-native-range-youtube-adapter', mode: settings.mode,
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
