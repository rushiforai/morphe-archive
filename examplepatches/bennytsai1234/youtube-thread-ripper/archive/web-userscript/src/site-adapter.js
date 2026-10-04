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
