// Roku Channel (Android TV): drop the ad schedule from playback responses.
// The app inserts ads on the client from the adPolicy in /api/v3/playback.
// The app's own ad-free shape is { noAds: true, adBreaks: [] }.
(function () {
  if (window.__msNoAds) return;
  window.__msNoAds = true;
  var PLAYBACK = /\/api\/v\d+\/playback(\?|$)/;

  function strip(text) {
    try {
      var d = JSON.parse(text);
      if (!d || typeof d !== 'object' || !d.adPolicy) return text;
      d.adPolicy = { noAds: true, adBreaks: [] };
      if (d.playbackMedia) d.playbackMedia.adBreaks = [];
      window.__msNoAdsHits = (window.__msNoAdsHits || 0) + 1;
      return JSON.stringify(d);
    } catch (e) {
      return text;
    }
  }

  var origFetch = window.fetch;
  if (origFetch) {
    window.fetch = function (input, init) {
      var url = typeof input === 'string' ? input : (input && input.url) || '';
      var p = origFetch.apply(this, arguments);
      if (!PLAYBACK.test(url)) return p;
      return p.then(function (res) {
        return res.clone().text().then(function (t) {
          return new Response(strip(t), { status: res.status, statusText: res.statusText, headers: res.headers });
        }, function () { return res; });
      });
    };
  }

  var XHR = window.XMLHttpRequest.prototype;
  var origOpen = XHR.open;
  XHR.open = function (method, url) {
    this.__msPlayback = PLAYBACK.test(String(url));
    return origOpen.apply(this, arguments);
  };
  ['responseText', 'response'].forEach(function (prop) {
    var desc = Object.getOwnPropertyDescriptor(XHR, prop);
    if (!desc || !desc.get) return;
    Object.defineProperty(XHR, prop, {
      configurable: true,
      get: function () {
        var v = desc.get.call(this);
        if (!this.__msPlayback || this.readyState !== 4) return v;
        if (typeof v === 'string') return strip(v);
        if (v && typeof v === 'object' && v.adPolicy) return JSON.parse(strip(JSON.stringify(v)));
        return v;
      },
    });
  });
})();
