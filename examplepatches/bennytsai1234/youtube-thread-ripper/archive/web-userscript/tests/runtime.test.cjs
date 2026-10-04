const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const crypto = require('node:crypto');
const path = require('node:path');
const { adapted, source } = require('../scripts/adapt-btr.cjs');
const { setup } = require('./harness.cjs');
const root = path.resolve(__dirname, '..');
const sample = Uint8Array.from(Buffer.from(fs.readFileSync(__dirname + '/fixtures/sabr-request.hex', 'utf8').trim(), 'hex'));
const sabrURL = 'https://rr1.example.googlevideo.com/videoplayback?sabr=1';
const mediaURL = 'https://rr1.example.googlevideo.com/videoplayback?mime=video%2Fwebm&clen=600000&range=100-524387';
const media = Uint8Array.from({ length: 600000 }, (_, i) => (i * 31) % 251);
function server(status = 206) {
  return async (input, init) => {
    const url = new URL(input);
    const [start, end] = url.searchParams.get('range').split('-').map(Number);
    await new Promise(resolve => setImmediate(resolve));
    return new Response(media.slice(start, end + 1), { status, headers: { 'content-type': 'video/webm', 'content-length': String(end - start + 1), ...(status === 206 ? { 'content-range': `bytes ${start}-${end}/600000` } : {}) } });
  };
}
test('11 vendored BTR files are the pinned original source (LF only)', () => {
  const manifest = JSON.parse(fs.readFileSync(path.join(root, 'vendor/btr/manifest.json')));
  assert.equal(manifest.commit, 'e64553b1ea911946387a1cf14992ac3fc008e07d');
  for (const [file, digest] of Object.entries(manifest.files)) {
    const bytes = fs.readFileSync(path.join(root, 'vendor/btr', file));
    assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'), digest);
    assert.ok(!bytes.includes(13));
  }
});
test('panel CSS, slider, dialog, drag and notification/downloader code come from BTR', () => {
  const original = source('src/settings-panel.js'), port = adapted('src/settings-panel.js');
  const css = text => text.slice(text.indexOf('  const PANEL_CSS ='), text.indexOf('  // bridge.js sends'));
  assert.equal(css(port), css(original));
  assert.ok(port.includes('dialog.showModal()')); assert.ok(port.includes('function startDrag(event)'));
  assert.equal(adapted('src/idm-downloader.js'), source('src/idm-downloader.js'));
  assert.equal(adapted('src/notification-view.js'), source('src/notification-view.js'));
});
test('SABR default leaves exact body untouched; optional original-style mode enables prefetch', async () => {
  const { page, calls, settings, target } = setup();
  const init = { method: 'POST', body: sample };
  await page.fetch(sabrURL, init); assert.equal(calls[0][1], init);
  settings({ autoConcurrency: false, concurrency: 8, mode: 'custom' });
  await page.fetch(sabrURL, init);
  assert.equal(Buffer.from(calls[1][1].body).toString('hex'), Buffer.from(sample).toString('hex').replace('9d0200004040', '9d020000c040'));
  assert.equal(target.playbackRate, 3);
  assert.equal(page.__YTR_EXPERIMENT_V2__.snapshot().youtube.sabrPatched, 1);
});
test('XHR SABR body changes through the BTR native XHR chain without synthesizing POST events', () => {
  const { page, nativeXHR, settings } = setup(); settings({ mode: 'custom', autoConcurrency: false, concurrency: 8 });
  const xhr = new page.XMLHttpRequest(); xhr.open('POST', sabrURL); xhr.send(sample);
  assert.equal(Buffer.from(nativeXHR.at(-1)[1]).toString('hex'), Buffer.from(sample).toString('hex').replace('9d0200004040', '9d020000c040'));
  assert.equal(Object.hasOwn(xhr, 'response'), false);
});
test('fetch Request POST retains readable original body; SABR errors are never resent', async () => {
  const { page, calls, settings } = setup(async () => { throw Error('network'); }); settings({ mode: 'custom', autoConcurrency: false, concurrency: 8 });
  const request = new Request(sabrURL, { method: 'POST', body: sample });
  await assert.rejects(page.fetch(request), /network/);
  assert.equal(request.bodyUsed, false); assert.equal(calls.length, 1);
});
test('the actual BTR downloader/transport delivers exact media bytes via fetch', async () => {
  const { page, calls } = setup(server());
  const response = await page.fetch(mediaURL);
  assert.equal(response.url, mediaURL); assert.equal(response.clone().url, mediaURL);
  assert.deepEqual(new Uint8Array(await response.arrayBuffer()), media.slice(100, 524388));
  assert.ok(calls.length > 1);
  const state = page.__YTR_EXPERIMENT_V2__.snapshot();
  assert.equal(state.youtube.ranges, 1); assert.ok(state.youtube.pieces > 1);
});
test('YouTube query-range 200 convention is adapted before BTR byte validation', async () => {
  const { page } = setup(server(200));
  const response = await page.fetch(mediaURL);
  assert.deepEqual(new Uint8Array(await response.arrayBuffer()), media.slice(100, 524388));
  assert.equal(response.status, 206);
});
test('BTR synthetic XHR delivers arraybuffer/readystate events, then open restores native accessors', async () => {
  const { page, nativeXHR } = setup(server());
  const xhr = new page.XMLHttpRequest(), states = [], events = [];
  xhr.addEventListener('readystatechange', () => states.push(xhr.readyState));
  for (const name of ['loadstart', 'progress', 'load', 'error', 'loadend']) xhr.addEventListener(name, () => events.push(name));
  const done = new Promise((resolve, reject) => { xhr.addEventListener('load', resolve); xhr.addEventListener('error', reject); });
  xhr.open('GET', mediaURL); xhr.responseType = 'arraybuffer'; xhr.send(); await done;
  assert.deepEqual(new Uint8Array(xhr.response), media.slice(100, 524388));
  assert.equal(xhr.status, 206); assert.ok(states.includes(2)); assert.ok(states.includes(3)); assert.equal(states.at(-1), 4);
  assert.ok(events.includes('loadstart')); assert.ok(events.includes('progress')); assert.ok(events.includes('loadend'));
  assert.equal(nativeXHR.filter(row => row[0] === 'send').length, 0);
  xhr.open('POST', sabrURL); assert.equal(Object.hasOwn(xhr, 'response'), false); assert.equal(xhr.response, 'native');
});
test('unsupported hosts, UMP, signed ranges, unknown lengths and sync XHR remain native', async () => {
  const { page, calls, nativeXHR } = setup();
  for (const url of [mediaURL + '&ump=1', mediaURL + '&sparams=range', mediaURL.replace('&clen=600000', ''), mediaURL.replace('googlevideo.com', 'googlevideo.com.attacker.test')]) {
    await page.fetch(url); assert.equal(calls.at(-1)[0], url);
  }
  const xhr = new page.XMLHttpRequest(); xhr.open('GET', mediaURL, false); xhr.responseType = 'arraybuffer'; xhr.send();
  assert.equal(nativeXHR.at(-1)[0], 'send');
});
test('disable toggle passes media through immediately and never alters actual playback rate', async () => {
  const { page, calls, settings, target } = setup(); settings({ enabled: false, mode: 'custom', autoConcurrency: false });
  const init = { method: 'POST', body: sample };
  await page.fetch(sabrURL, init); assert.equal(calls[0][1], init);
  await page.fetch(mediaURL); assert.equal(calls[1][0], mediaURL);
  assert.equal(target.playbackRate, 3); assert.equal(page.__YTR_EXPERIMENT_V2__.snapshot().settings.floatingButton, false);
});
test('abort does not fall back and rejects already-aborted range work without network calls', async () => {
  const { page, calls } = setup(); const controller = new AbortController(); controller.abort();
  await assert.rejects(page.fetch(mediaURL, { signal: controller.signal }), e => e.name === 'AbortError');
  assert.equal(calls.length, 0);
});

test('seeking cancels an active BTR download without resending the original GET', async () => {
  let started;
  const ready = new Promise(resolve => { started = resolve; });
  const { page, calls, target } = setup((url, init) => new Promise((resolve, reject) => {
    init.signal.addEventListener('abort', () => reject(new DOMException('cancelled', 'AbortError')), { once: true });
    started();
  }));
  const pending = page.fetch(mediaURL);
  const rejected = assert.rejects(pending, error => error.name === 'AbortError');
  await ready;
  target.dispatchEvent(new Event('seeking'));
  await rejected;
  assert.equal(calls.length, 1);
});

test('query-range 200 adapter rejects oversized, short and wrong-offset bodies', async () => {
  const { page } = setup();
  const url = mediaURL.replace('100-524387', '100-103');
  const init = { headers: { range: 'bytes=100-103' } };
  for (const length of [3, 5]) {
    const fetcher = page.__YTR_SITE__.pieceFetcher(async () => new Response(new Uint8Array(length)));
    const response = await fetcher(url, init);
    await assert.rejects(response.arrayBuffer(), /长度/);
  }
  const fetcher = page.__YTR_SITE__.pieceFetcher(async () => new Response(new Uint8Array(4), {
    headers: { 'content-range': 'bytes 0-3/600000' }
  }));
  await assert.rejects(fetcher(url, init), /回应不符/);
});
