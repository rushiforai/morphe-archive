package dev.brave.extension.media;

import dev.brave.extension.core.JsInjectionHub;

public final class MediaSnifferJs {
    private MediaSnifferJs() {}

    public static final String SNIFFER_SCRIPT =
        "(function() {\n" +
        "  if (window.__brave_sniffer_installed__) {\n" +
        "    try { if (window.__brave_scan_media__) window.__brave_scan_media__(); } catch(e) {}\n" +
        "    return;\n" +
        "  }\n" +
        "  window.__brave_sniffer_installed__ = true;\n" +
        "  var BRIDGE_TOKEN = '" + JsInjectionHub.BRIDGE_TOKEN_PLACEHOLDER + "';\n" +
        "  var MAX_TEXT_SCAN_LEN = 1048576;\n" +
        "  try { console.log('[BraveSniffer] Universal media sniffer active on: ' + window.location.href); } catch(e) {}\n" +
        "\n" +
        "  var MAX_REPORTED_KEYS = 800;\n" +
        "  var MAX_PENDING_MEDIA = 150;\n" +
        "  var MAX_PENDING_IFRAMES = 50;\n" +
        "  var pendingQueue = [];\n" +
        "  var pendingIframeQueue = [];\n" +
        "  var reportedUrls = new Set();\n" +
        "  var reportedMeta = new Set();\n" +
        "  var scannedScripts = (typeof WeakMap !== 'undefined') ? new WeakMap() : null;\n" +
        "  var observedRoots = (typeof WeakSet !== 'undefined') ? new WeakSet() : null;\n" +
        "  var queueOverflowed = false;\n" +
        "  var mediaCategoryFull = false;\n" +
        "  var imageCategoryFull = false;\n" +
        "  var lastHref = window.location.href;\n" +
        "\n" +
        "  function markBoundedKey(set, key) {\n" +
        "    if (!set || !key) return;\n" +
        "    if (set.has(key)) {\n" +
        "      set.delete(key);\n" +
        "      set.add(key);\n" +
        "      return;\n" +
        "    }\n" +
        "    while (set.size >= MAX_REPORTED_KEYS) {\n" +
        "      var oldest = set.values().next().value;\n" +
        "      if (oldest === undefined) break;\n" +
        "      set.delete(oldest);\n" +
        "    }\n" +
        "    set.add(key);\n" +
        "  }\n" +
        "\n" +
        "  function isCategoryFullForType(type) {\n" +
        "    var isImg = (type === 'IMAGE');\n" +
        "    if (isImg && imageCategoryFull) return true;\n" +
        "    if (!isImg && mediaCategoryFull) return true;\n" +
        "    if (window.BraveMediaBridge && window.BraveMediaBridge.isCategoryFull) {\n" +
        "      try {\n" +
        "        var full = !!window.BraveMediaBridge.isCategoryFull(BRIDGE_TOKEN, isImg ? 'IMAGE' : 'VIDEO');\n" +
        "        if (full) {\n" +
        "          if (isImg) imageCategoryFull = true;\n" +
        "          else mediaCategoryFull = true;\n" +
        "        }\n" +
        "        return full;\n" +
        "      } catch(e) {}\n" +
        "    }\n" +
        "    return false;\n" +
        "  }\n" +
        "\n" +
        "  function checkUrlChange() {\n" +
        "    var cur = window.location.href;\n" +
        "    if (cur && cur !== lastHref) {\n" +
        "      lastHref = cur;\n" +
        "      reportedUrls.clear();\n" +
        "      reportedMeta.clear();\n" +
        "      pendingQueue.length = 0;\n" +
        "      pendingIframeQueue.length = 0;\n" +
        "      queueOverflowed = false;\n" +
        "      mediaCategoryFull = false;\n" +
        "      imageCategoryFull = false;\n" +
        "      try {\n" +
        "        if (window.BraveMediaBridge && window.BraveMediaBridge.onPageUrlChanged) {\n" +
        "          window.BraveMediaBridge.onPageUrlChanged(BRIDGE_TOKEN, cur);\n" +
        "        }\n" +
        "      } catch(e) {}\n" +
        "      return true;\n" +
        "    }\n" +
        "    return false;\n" +
        "  }\n" +
        "\n" +
        "  try {\n" +
        "    var origPushState = history.pushState;\n" +
        "    if (origPushState) {\n" +
        "      history.pushState = function() {\n" +
        "        var r = origPushState.apply(this, arguments);\n" +
        "        if (checkUrlChange()) {\n" +
        "          setTimeout(function() { try { scanDom(); flushQueue(); } catch(e) {} }, 200);\n" +
        "        }\n" +
        "        return r;\n" +
        "      };\n" +
        "    }\n" +
        "    var origReplaceState = history.replaceState;\n" +
        "    if (origReplaceState) {\n" +
        "      history.replaceState = function() {\n" +
        "        var r = origReplaceState.apply(this, arguments);\n" +
        "        if (checkUrlChange()) {\n" +
        "          setTimeout(function() { try { scanDom(); flushQueue(); } catch(e) {} }, 200);\n" +
        "        }\n" +
        "        return r;\n" +
        "      };\n" +
        "    }\n" +
        "    window.addEventListener('popstate', function() {\n" +
        "      if (checkUrlChange()) {\n" +
        "        setTimeout(function() { try { scanDom(); flushQueue(); } catch(e) {} }, 200);\n" +
        "      }\n" +
        "    });\n" +
        "  } catch(e) {}\n" +
        "\n" +
        "  function toAbsolute(url) {\n" +
        "    try {\n" +
        "      return new URL(url, window.location.href).href;\n" +
        "    } catch(e) {\n" +
        "      return url;\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function flushQueue() {\n" +
        "    if (!window.BraveMediaBridge) return;\n" +
        "    while (pendingQueue.length > 0) {\n" +
        "      var item = pendingQueue.shift();\n" +
        "      try {\n" +
        "        window.BraveMediaBridge.onMediaFound(BRIDGE_TOKEN, JSON.stringify(item));\n" +
        "      } catch(e) {}\n" +
        "    }\n" +
        "    while (pendingIframeQueue.length > 0) {\n" +
        "      var ifr = pendingIframeQueue.shift();\n" +
        "      try {\n" +
        "        if (window.BraveMediaBridge.onIframeDetected) {\n" +
        "          window.BraveMediaBridge.onIframeDetected(BRIDGE_TOKEN, ifr.url, ifr.referer);\n" +
        "        }\n" +
        "      } catch(e) {}\n" +
        "    }\n" +
        "    if (queueOverflowed) {\n" +
        "      queueOverflowed = false;\n" +
        "      setTimeout(function() { try { scanDom(); flushQueue(); } catch(e) {} }, 50);\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function report(url, type, mime, title, width, height, size, dur, thumb, quality) {\n" +
        "    var absUrl = toAbsolute(url);\n" +
        "    if (!absUrl) return false;\n" +
        "    var lower = absUrl.toLowerCase();\n" +
        "    if (!lower.startsWith('http://') && !lower.startsWith('https://')) return false;\n" +
        "    if (isCategoryFullForType(type)) return false;\n" +
        "\n" +
        "    if (type !== 'IMAGE' && lower.indexOf('.m3u8') === -1 && lower.indexOf('.mpd') === -1) {\n" +
        "      if (lower.indexOf('.ts?') !== -1 || lower.endsWith('.ts') || lower.indexOf('.m4s') !== -1) return false;\n" +
        "    }\n" +
        "\n" +
        "    var absThumb = thumb ? toAbsolute(thumb) : '';\n" +
        "\n" +
        "    var payload = {\n" +
        "      url: absUrl,\n" +
        "      type: type,\n" +
        "      mimeType: mime || '',\n" +
        "      title: title || document.title || 'Media',\n" +
        "      width: width || 0,\n" +
        "      height: height || 0,\n" +
        "      size: size || 0,\n" +
        "      duration: dur || 0,\n" +
        "      thumbnail: absThumb || (type === 'IMAGE' ? absUrl : ''),\n" +
        "      quality: quality || '',\n" +
        "      cookie: document.cookie || '',\n" +
        "      referer: window.location.href,\n" +
        "      userAgent: navigator.userAgent\n" +
        "    };\n" +
        "\n" +
        "    if (window.BraveMediaBridge) {\n" +
        "      flushQueue();\n" +
        "      try {\n" +
        "        window.BraveMediaBridge.onMediaFound(BRIDGE_TOKEN, JSON.stringify(payload));\n" +
        "        return true;\n" +
        "      } catch(e) { return false; }\n" +
        "    } else {\n" +
        "      if (pendingQueue.length < MAX_PENDING_MEDIA) {\n" +
        "        pendingQueue.push(payload);\n" +
        "        return true;\n" +
        "      }\n" +
        "      queueOverflowed = true;\n" +
        "      return false;\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function checkAndReport(url, type, mime, title, w, h, s, d, thumb, quality) {\n" +
        "    if (!url) return;\n" +
        "    var absUrl = toAbsolute(url);\n" +
        "    if (!absUrl) return;\n" +
        "    if (absUrl.indexOf('google-analytics') !== -1 || absUrl.indexOf('/telemetry') !== -1) return;\n" +
        "    if (isCategoryFullForType(type)) return;\n" +
        "    var urlKey = type + '|' + absUrl;\n" +
        "    var metaKey = urlKey + '|' + (thumb || '') + '|' + (quality || '');\n" +
        "    if (reportedUrls.has(urlKey)) {\n" +
        "      if ((thumb || quality) && !reportedMeta.has(metaKey)) {\n" +
        "        if (report(absUrl, type, mime, title, w, h, s, d, thumb, quality)) {\n" +
        "          markBoundedKey(reportedMeta, metaKey);\n" +
        "        }\n" +
        "      }\n" +
        "      return;\n" +
        "    }\n" +
        "    if (report(absUrl, type, mime, title, w, h, s, d, thumb, quality)) {\n" +
        "      markBoundedKey(reportedUrls, urlKey);\n" +
        "      if (thumb || quality) markBoundedKey(reportedMeta, metaKey);\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function inspectUrl(rawUrl, contentType, thumb, quality) {\n" +
        "    if (!rawUrl || typeof rawUrl !== 'string') return;\n" +
        "    rawUrl = rawUrl.replace(/\\\\u0026/g, '&').replace(/\\\\\\//g, '/');\n" +
        "    var lower = rawUrl.toLowerCase();\n" +
        "    if (lower.indexOf('googlevideo.com/videoplayback') !== -1 && lower.indexOf('sabr=1') !== -1) return;\n" +
        "    var ct = (contentType || '').toLowerCase();\n" +
        "    if (lower.indexOf('.m3u8') !== -1 || ct.indexOf('mpegurl') !== -1 || lower.indexOf('/hls/') !== -1 || lower.indexOf('master.m3u8') !== -1 || lower.indexOf('playlist.m3u8') !== -1) {\n" +
        "      checkAndReport(rawUrl, 'HLS_STREAM', ct, '', 0, 0, 0, 0, thumb, quality);\n" +
        "    } else if (lower.indexOf('.mpd') !== -1 || ct.indexOf('dash+xml') !== -1 || lower.indexOf('/dash/') !== -1) {\n" +
        "      checkAndReport(rawUrl, 'DASH_STREAM', ct, '', 0, 0, 0, 0, thumb, quality);\n" +
        "    } else if (ct.startsWith('video/') || /\\.(?:mp4|webm|m4v|mov|mkv|avi|flv|f4v|3gp|3g2|ogv|wmv|mpg|mpeg|gifv)(?:[?#]|$)/i.test(lower) || lower.indexOf('videoplayback') !== -1) {\n" +
        "      checkAndReport(rawUrl, 'VIDEO', ct, '', 0, 0, 0, 0, thumb, quality);\n" +
        "    } else if (ct.startsWith('audio/') || /\\.(?:mp3|m4a|aac|ogg|opus|flac|wav|weba)(?:[?#]|$)/i.test(lower)) {\n" +
        "      checkAndReport(rawUrl, 'AUDIO', ct, '', 0, 0, 0, 0, thumb, quality);\n" +
        "    } else if (ct === 'image/gif' || /\\.gif(?:[?#]|$)/i.test(lower)) {\n" +
        "      if (lower.indexOf('pixel') === -1 && lower.indexOf('beacon') === -1 && lower.indexOf('spacer') === -1 && lower.indexOf('analytics') === -1) {\n" +
        "        checkAndReport(rawUrl, 'VIDEO', 'image/gif', '', 0, 0, 0, 0, rawUrl, 'GIF');\n" +
        "        checkAndReport(rawUrl, 'IMAGE', 'image/gif', '', 0, 0, 0, 0, rawUrl, '');\n" +
        "      }\n" +
        "    } else if (ct.startsWith('image/') || /\\.(?:jpg|jpeg|jfif|pjpeg|png|webp|avif|bmp|heic|heif|ico|tif|tiff)(?:[?#]|$)/i.test(lower)) {\n" +
        "      if (lower.indexOf('avatar') === -1 && lower.indexOf('logo') === -1 && lower.indexOf('icon') === -1 && lower.indexOf('favicon') === -1) {\n" +
        "        checkAndReport(rawUrl, 'IMAGE', ct, '', 0, 0, 0, 0, rawUrl, '');\n" +
        "      }\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function inspectIframe(iframeSrc) {\n" +
        "    if (!iframeSrc || typeof iframeSrc !== 'string') return;\n" +
        "    var abs = toAbsolute(iframeSrc);\n" +
        "    if (!abs || reportedUrls.has('iframe:' + abs)) return;\n" +
        "    var lower = abs.toLowerCase();\n" +
        "    if (!lower.startsWith('http://') && !lower.startsWith('https://')) return;\n" +
        "    if (lower.indexOf('google') !== -1 || lower.indexOf('doubleclick') !== -1 || lower.indexOf('facebook') !== -1) return;\n" +
        "    if (isCategoryFullForType('VIDEO')) return;\n" +
        "    if (window.BraveMediaBridge && window.BraveMediaBridge.onIframeDetected) {\n" +
        "      flushQueue();\n" +
        "      try {\n" +
        "        window.BraveMediaBridge.onIframeDetected(BRIDGE_TOKEN, abs, window.location.href);\n" +
        "        markBoundedKey(reportedUrls, 'iframe:' + abs);\n" +
        "      } catch(e) {}\n" +
        "    } else {\n" +
        "      if (pendingIframeQueue.length < MAX_PENDING_IFRAMES) {\n" +
        "        pendingIframeQueue.push({ url: abs, referer: window.location.href });\n" +
        "        markBoundedKey(reportedUrls, 'iframe:' + abs);\n" +
        "      } else {\n" +
        "        queueOverflowed = true;\n" +
        "      }\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function isPlaceholderSrc(val) {\n" +
        "    if (!val || typeof val !== 'string') return true;\n" +
        "    var s = val.trim().toLowerCase();\n" +
        "    if (!s || s.startsWith('data:') || s.startsWith('blob:') || s.startsWith('about:')) return true;\n" +
        "    if (!s.startsWith('http://') && !s.startsWith('https://') && s.indexOf('/') !== 0) return true;\n" +
        "    if (/(?:^|[\\/._-])(1x1|blank|spacer|placeholder|loading)\\b/i.test(s)) return true;\n" +
        "    return false;\n" +
        "  }\n" +
        "\n" +
        "  function inspectImage(img) {\n" +
        "    if (!img) return;\n" +
        "    try {\n" +
        "      var candidates = [];\n" +
        "      if (img.getAttribute) {\n" +
        "        var ds = img.getAttribute('data-src');\n" +
        "        var dor = img.getAttribute('data-original');\n" +
        "        var dlz = img.getAttribute('data-lazy-src');\n" +
        "        if (ds) candidates.push(ds);\n" +
        "        if (dor) candidates.push(dor);\n" +
        "        if (dlz) candidates.push(dlz);\n" +
        "      }\n" +
        "      if (img.currentSrc) candidates.push(img.currentSrc);\n" +
        "      if (img.src) candidates.push(img.src);\n" +
        "      if (img.getAttribute) {\n" +
        "        var rawSrcAttr = img.getAttribute('src');\n" +
        "        if (rawSrcAttr) candidates.push(rawSrcAttr);\n" +
        "      }\n" +
        "      var src = '';\n" +
        "      for (var ci = 0; ci < candidates.length; ci++) {\n" +
        "        var cand = candidates[ci];\n" +
        "        if (!cand) continue;\n" +
        "        var absCand = toAbsolute(cand);\n" +
        "        if (!isPlaceholderSrc(absCand)) {\n" +
        "          src = absCand;\n" +
        "          break;\n" +
        "        }\n" +
        "      }\n" +
        "      var abs = src ? toAbsolute(src) : '';\n" +
        "      if (abs) {\n" +
        "        var lower = abs.toLowerCase();\n" +
        "        if (lower.startsWith('http://') || lower.startsWith('https://')) {\n" +
        "          if (lower.indexOf('.svg') === -1\n" +
        "              && lower.indexOf('google-analytics') === -1 && lower.indexOf('doubleclick') === -1\n" +
        "              && lower.indexOf('/avatar') === -1 && lower.indexOf('avatar.') === -1\n" +
        "              && lower.indexOf('logo-') === -1 && lower.indexOf('/logo.') === -1 && lower.indexOf('/logos/') === -1\n" +
        "              && lower.indexOf('/icon') === -1 && lower.indexOf('emoji') === -1) {\n" +
        "            var activeUrl = toAbsolute(img.currentSrc || img.src || '');\n" +
        "            var loadedMatchesSrc = (activeUrl === abs);\n" +
        "            var w = loadedMatchesSrc ? (img.naturalWidth || img.width || 0) : (parseInt(img.getAttribute && img.getAttribute('width') || '0', 10) || 0);\n" +
        "            var h = loadedMatchesSrc ? (img.naturalHeight || img.height || 0) : (parseInt(img.getAttribute && img.getAttribute('height') || '0', 10) || 0);\n" +
        "            if (!(w > 0 && w < 120 && h > 0 && h < 120)) {\n" +
        "              var isGif = /\\.gif(?:[?#]|$)/i.test(lower);\n" +
        "              var isImgExt = /\\.(?:jpg|jpeg|jfif|pjpeg|png|webp|gif|avif|bmp|heic|heif|tif|tiff)(?:[?#]|$)/i.test(lower);\n" +
        "              if (isImgExt || (w >= 250 && h >= 250)) {\n" +
        "                var alt = img.getAttribute ? (img.getAttribute('alt') || img.getAttribute('title') || '') : '';\n" +
        "                checkAndReport(abs, 'IMAGE', isGif ? 'image/gif' : '', alt, w, h, 0, 0, abs, '');\n" +
        "                if (isGif && (w === 0 || w >= 150)) {\n" +
        "                  checkAndReport(abs, 'VIDEO', 'image/gif', alt, w, h, 0, 0, abs, 'GIF');\n" +
        "                }\n" +
        "              }\n" +
        "            }\n" +
        "          }\n" +
        "        }\n" +
        "      }\n" +
        "      var srcset = (img.getAttribute ? (img.getAttribute('data-srcset') || img.getAttribute('srcset')) : '') || img.srcset || '';\n" +
        "      if (srcset) {\n" +
        "        var parts = srcset.split(',');\n" +
        "        var bestPart = parts[parts.length - 1];\n" +
        "        if (bestPart) {\n" +
        "          var bestUrl = bestPart.trim().split(/\\s+/)[0];\n" +
        "          if (bestUrl && bestUrl !== src) {\n" +
        "            var absBest = toAbsolute(bestUrl);\n" +
        "            if (absBest && absBest !== abs && !isPlaceholderSrc(absBest)) {\n" +
        "              var sw = img.naturalWidth || img.width || 0;\n" +
        "              var sh = img.naturalHeight || img.height || 0;\n" +
        "              checkAndReport(absBest, 'IMAGE', '', '', sw, sh, 0, 0, absBest, '');\n" +
        "            }\n" +
        "          }\n" +
        "        }\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }\n" +
        "\n" +
        "  function scanObjectForStreams(obj, depth) {\n" +
        "    if (!obj || (depth || 0) > 4) return;\n" +
        "    if (typeof obj === 'string') {\n" +
        "      if (obj.startsWith('http://') || obj.startsWith('https://')) inspectUrl(obj, '', '', '');\n" +
        "      return;\n" +
        "    }\n" +
        "    if (Array.isArray(obj)) {\n" +
        "      for (var i = 0; i < obj.length; i++) scanObjectForStreams(obj[i], (depth || 0) + 1);\n" +
        "      return;\n" +
        "    }\n" +
        "    if (typeof obj === 'object') {\n" +
        "      var thumb = obj.thumbnail || obj.poster || '';\n" +
        "      var quality = obj.quality || obj.label || obj.res || '';\n" +
        "      for (var k in obj) {\n" +
        "        if (Object.prototype.hasOwnProperty.call(obj, k)) {\n" +
        "          var val = obj[k];\n" +
        "          var kl = k.toLowerCase();\n" +
        "          if (kl.indexOf('url') !== -1 || kl.indexOf('stream') !== -1 || kl.indexOf('file') !== -1 || kl.indexOf('src') !== -1 || kl.indexOf('video') !== -1 || kl.indexOf('media') !== -1 || kl.indexOf('source') !== -1 || kl === 'manifest' || kl === 'hls' || kl === 'dash') {\n" +
        "            if (typeof val === 'string') {\n" +
        "              inspectUrl(val, '', thumb, quality);\n" +
        "            } else {\n" +
        "              scanObjectForStreams(val, (depth || 0) + 1);\n" +
        "            }\n" +
        "          } else if (typeof val === 'object') {\n" +
        "            scanObjectForStreams(val, (depth || 0) + 1);\n" +
        "          }\n" +
        "        }\n" +
        "      }\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function inspectResponseText(txt, ct, url) {\n" +
        "    if (!txt || txt.length > MAX_TEXT_SCAN_LEN) return;\n" +
        "    if (txt.indexOf('.m3u8') !== -1 || txt.indexOf('.mpd') !== -1 || txt.indexOf('.mp4') !== -1 || txt.indexOf('videoplayback') !== -1) {\n" +
        "      var matches = txt.match(/https?:\\/\\/[^\\s\"'<>]+?\\.(?:m3u8|mp4|mpd|webm)[^\\s\"'<>]*/g);\n" +
        "      if (matches) {\n" +
        "        for (var m = 0; m < matches.length; m++) inspectUrl(matches[m], '', '', '');\n" +
        "      }\n" +
        "      var escMatches = txt.match(/https?:\\\\\\/\\\\\\/[^\\s\"'<>]+?\\.(?:m3u8|mp4|mpd|webm)[^\\s\"'<>]*/g);\n" +
        "      if (escMatches) {\n" +
        "        for (var e = 0; e < escMatches.length; e++) {\n" +
        "          inspectUrl(escMatches[e].replace(/\\\\\\//g, '/'), '', '', '');\n" +
        "        }\n" +
        "      }\n" +
        "    }\n" +
        "    if (ct.indexOf('json') !== -1 || (url && (url.indexOf('/api/') !== -1 || url.indexOf('player') !== -1))) {\n" +
        "      try {\n" +
        "        var json = JSON.parse(txt);\n" +
        "        scanObjectForStreams(json, 0);\n" +
        "      } catch(e) {}\n" +
        "    }\n" +
        "  }\n" +
        "\n" +
        "  function isInspectableTextType(ct, url) {\n" +
        "    var lowerCt = (ct || '').toLowerCase();\n" +
        "    if (lowerCt.startsWith('video/') || lowerCt.startsWith('audio/') || lowerCt.startsWith('image/') || lowerCt.indexOf('octet-stream') !== -1) {\n" +
        "      return false;\n" +
        "    }\n" +
        "    return lowerCt.indexOf('json') !== -1 || lowerCt.indexOf('text') !== -1 || lowerCt.indexOf('javascript') !== -1\n" +
        "      || lowerCt.indexOf('mpegurl') !== -1 || (url && (url.indexOf('/api/') !== -1 || url.indexOf('/stream') !== -1 || url.indexOf('player') !== -1));\n" +
        "  }\n" +
        "\n" +
        "  // 1. Hook window.fetch with Content-Length & MIME bounds\n" +
        "  var origFetch = window.fetch;\n" +
        "  if (origFetch) {\n" +
        "    window.fetch = function() {\n" +
        "      var args = arguments;\n" +
        "      var rawUrl = '';\n" +
        "      if (typeof args[0] === 'string') rawUrl = args[0];\n" +
        "      else if (args[0] && args[0].url) rawUrl = args[0].url;\n" +
        "      else if (args[0] && args[0].href) rawUrl = args[0].href;\n" +
        "\n" +
        "      if (rawUrl) inspectUrl(rawUrl, '', '', '');\n" +
        "\n" +
        "      return origFetch.apply(this, args).then(function(res) {\n" +
        "        try {\n" +
        "          var resUrl = res.url || rawUrl;\n" +
        "          var ct = '';\n" +
        "          var cl = 0;\n" +
        "          try {\n" +
        "            ct = res.headers.get('content-type') || '';\n" +
        "            cl = parseInt(res.headers.get('content-length') || '0', 10) || 0;\n" +
        "          } catch(e) {}\n" +
        "          inspectUrl(resUrl, ct, '', '');\n" +
        "\n" +
        "          if ((cl === 0 || cl <= MAX_TEXT_SCAN_LEN) && isInspectableTextType(ct, resUrl)) {\n" +
        "            try {\n" +
        "              var cloned = res.clone();\n" +
        "              if (cloned.body && typeof cloned.body.getReader === 'function' && typeof TextDecoder !== 'undefined') {\n" +
        "                (function(rUrl, rCt, cRes) {\n" +
        "                  var reader = cRes.body.getReader();\n" +
        "                  var decoder = new TextDecoder('utf-8', { fatal: false });\n" +
        "                  var totalBytes = 0;\n" +
        "                  var chunks = '';\n" +
        "                  function pump() {\n" +
        "                    return reader.read().then(function(step) {\n" +
        "                      if (step.done) {\n" +
        "                        chunks += decoder.decode();\n" +
        "                        inspectResponseText(chunks, rCt, rUrl);\n" +
        "                        return;\n" +
        "                      }\n" +
        "                      var val = step.value;\n" +
        "                      totalBytes += (val ? val.byteLength : 0);\n" +
        "                      if (totalBytes > MAX_TEXT_SCAN_LEN) {\n" +
        "                        try { reader.cancel(); } catch(e) {}\n" +
        "                        return;\n" +
        "                      }\n" +
        "                      chunks += decoder.decode(val, { stream: true });\n" +
        "                      return pump();\n" +
        "                    });\n" +
        "                  }\n" +
        "                  pump().catch(function(){});\n" +
        "                })(resUrl, ct, cloned);\n" +
        "              } else if (cl > 0 && cl <= MAX_TEXT_SCAN_LEN) {\n" +
        "                cloned.text().then(function(txt) {\n" +
        "                  inspectResponseText(txt, ct, resUrl);\n" +
        "                }).catch(function(){});\n" +
        "              }\n" +
        "            } catch(e) {}\n" +
        "          }\n" +
        "        } catch(e) {}\n" +
        "        return res;\n" +
        "      });\n" +
        "    };\n" +
        "  }\n" +
        "\n" +
        "  // 2. Hook XMLHttpRequest (supports responseType = '', 'text', and 'json')\n" +
        "  var origOpen = XMLHttpRequest.prototype.open;\n" +
        "  var origSend = XMLHttpRequest.prototype.send;\n" +
        "  XMLHttpRequest.prototype.open = function(method, url) {\n" +
        "    this.__xhr_url = (url && url.href) ? url.href : String(url);\n" +
        "    if (this.__xhr_url) inspectUrl(this.__xhr_url, '', '', '');\n" +
        "    return origOpen.apply(this, arguments);\n" +
        "  };\n" +
        "  XMLHttpRequest.prototype.send = function() {\n" +
        "    var xhr = this;\n" +
        "    if (!xhr.__sniffer_hooked__) {\n" +
        "      xhr.__sniffer_hooked__ = true;\n" +
        "      xhr.addEventListener('load', function() {\n" +
        "        try {\n" +
        "          var u = xhr.responseURL || xhr.__xhr_url;\n" +
        "          var ct = '';\n" +
        "          try { ct = xhr.getResponseHeader('Content-Type') || ''; } catch(e) {}\n" +
        "          inspectUrl(u, ct, '', '');\n" +
        "          var rt = xhr.responseType || '';\n" +
        "          if (rt === 'json') {\n" +
        "            if (xhr.response) scanObjectForStreams(xhr.response, 0);\n" +
        "          } else if (rt === '' || rt === 'text') {\n" +
        "            if (isInspectableTextType(ct, u)) {\n" +
        "              inspectResponseText(xhr.responseText, ct, u);\n" +
        "            }\n" +
        "          }\n" +
        "        } catch(e) {}\n" +
        "      });\n" +
        "    }\n" +
        "    return origSend.apply(this, arguments);\n" +
        "  };\n" +
        "\n" +
        "  // 3. Hook HTMLMediaElement.prototype.src setter\n" +
        "  try {\n" +
        "    var desc = Object.getOwnPropertyDescriptor(HTMLMediaElement.prototype, 'src');\n" +
        "    if (desc && desc.set) {\n" +
        "      var origSet = desc.set;\n" +
        "      Object.defineProperty(HTMLMediaElement.prototype, 'src', {\n" +
        "        set: function(val) {\n" +
        "          try {\n" +
        "            if (val && typeof val === 'string' && !val.startsWith('blob:')) {\n" +
        "              var poster = this.poster || this.getAttribute('data-poster') || this.getAttribute('poster') || '';\n" +
        "              inspectUrl(val, '', poster, '');\n" +
        "            }\n" +
        "          } catch(e) {}\n" +
        "          return origSet.call(this, val);\n" +
        "        },\n" +
        "        get: desc.get,\n" +
        "        configurable: true\n" +
        "      });\n" +
        "    }\n" +
        "  } catch(e) {}\n" +
        "\n" +
        "  // 4. Hook HTMLIFrameElement.prototype.src setter\n" +
        "  try {\n" +
        "    var iframeDesc = Object.getOwnPropertyDescriptor(HTMLIFrameElement.prototype, 'src');\n" +
        "    if (iframeDesc && iframeDesc.set) {\n" +
        "      var origIframeSet = iframeDesc.set;\n" +
        "      Object.defineProperty(HTMLIFrameElement.prototype, 'src', {\n" +
        "        set: function(val) {\n" +
        "          try { inspectIframe(val); } catch(e) {}\n" +
        "          return origIframeSet.call(this, val);\n" +
        "        },\n" +
        "        get: iframeDesc.get,\n" +
        "        configurable: true\n" +
        "      });\n" +
        "    }\n" +
        "  } catch(e) {}\n" +
        "\n" +
        "  // 5. Incremental Element & Document Scanner\n" +
        "  function scanMediaElement(v) {\n" +
        "    if (!v) return;\n" +
        "    try {\n" +
        "      var poster = v.poster || (v.getAttribute && (v.getAttribute('data-poster') || v.getAttribute('poster'))) || '';\n" +
        "      var vsrc = v.currentSrc || v.src || (v.getAttribute && (v.getAttribute('src') || v.getAttribute('data-src')));\n" +
        "      if (vsrc && !vsrc.startsWith('blob:')) inspectUrl(vsrc, '', poster, '');\n" +
        "      if (v.querySelectorAll) {\n" +
        "        var sources = v.querySelectorAll('source');\n" +
        "        for (var j = 0; j < sources.length; j++) {\n" +
        "          var s = sources[j].src || sources[j].getAttribute('src') || sources[j].getAttribute('data-src');\n" +
        "          var t = sources[j].type || sources[j].getAttribute('type') || '';\n" +
        "          var q = sources[j].getAttribute('res') || sources[j].getAttribute('label') || '';\n" +
        "          if (s) inspectUrl(s, t, poster, q);\n" +
        "        }\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }\n" +
        "\n" +
        "  function hashScriptText(s) {\n" +
        "    var h1 = 0x811c9dc5 | 0;\n" +
        "    var h2 = 0x9e3779b9 | 0;\n" +
        "    for (var i = 0; i < s.length; i++) {\n" +
        "      var c = s.charCodeAt(i);\n" +
        "      h1 = Math.imul(h1 ^ c, 0x01000193);\n" +
        "      h2 = Math.imul(h2 ^ (c + i), 0x85ebca6b);\n" +
        "    }\n" +
        "    return s.length + ':' + (h1 >>> 0) + ':' + (h2 >>> 0);\n" +
        "  }\n" +
        "\n" +
        "  function scanScriptElement(sc) {\n" +
        "    if (!sc) return;\n" +
        "    try {\n" +
        "      var stxt = sc.textContent;\n" +
        "      if (!stxt || stxt.length < 20 || stxt.length > MAX_TEXT_SCAN_LEN) return;\n" +
        "      var sig = hashScriptText(stxt);\n" +
        "      if (scannedScripts) {\n" +
        "        if (scannedScripts.get(sc) === sig) return;\n" +
        "        scannedScripts.set(sc, sig);\n" +
        "      }\n" +
        "      if (stxt.indexOf('.m3u8') !== -1 || stxt.indexOf('.mpd') !== -1 || stxt.indexOf('.mp4') !== -1 || stxt.indexOf('master') !== -1) {\n" +
        "        var smatches = stxt.match(/https?:\\/\\/[^\\s\"'<>]+?\\.(?:m3u8|mp4|mpd|webm)[^\\s\"'<>]*/g);\n" +
        "        if (smatches) {\n" +
        "          for (var sm = 0; sm < smatches.length; sm++) inspectUrl(smatches[sm], '', '', '');\n" +
        "        }\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }\n" +
        "\n" +
        "  // Note: Traverses open Shadow DOM roots (and newly created roots wrapped below);\n" +
        "  // closed Shadow DOM roots created before injection cannot be reached from page context.\n" +
        "  function scanNodeSubtree(root) {\n" +
        "    if (!root || (root.nodeType !== 1 && root.nodeType !== 9 && root.nodeType !== 11)) return;\n" +
        "    if (root.nodeType === 11) observeRoot(root);\n" +
        "    if (root.nodeType === 1) {\n" +
        "      var tag = root.tagName;\n" +
        "      if (tag === 'VIDEO' || tag === 'AUDIO') scanMediaElement(root);\n" +
        "      else if (tag === 'IMG') inspectImage(root);\n" +
        "      else if (tag === 'IFRAME') {\n" +
        "        var isrc = root.src || root.getAttribute('src') || root.getAttribute('data-src');\n" +
        "        if (isrc) inspectIframe(isrc);\n" +
        "      } else if (tag === 'SCRIPT') {\n" +
        "        scanScriptElement(root);\n" +
        "      } else if (tag === 'SOURCE') {\n" +
        "        if (root.parentElement && (root.parentElement.tagName === 'VIDEO' || root.parentElement.tagName === 'AUDIO')) {\n" +
        "          scanMediaElement(root.parentElement);\n" +
        "        }\n" +
        "      }\n" +
        "      if (root.shadowRoot) scanNodeSubtree(root.shadowRoot);\n" +
        "    }\n" +
        "    if (!root.querySelectorAll) return;\n" +
        "    try {\n" +
        "      var videos = root.querySelectorAll('video, audio');\n" +
        "      for (var i = 0; i < videos.length; i++) scanMediaElement(videos[i]);\n" +
        "    } catch(e) {}\n" +
        "    try {\n" +
        "      var imgs = root.querySelectorAll('img');\n" +
        "      for (var ii = 0; ii < imgs.length; ii++) inspectImage(imgs[ii]);\n" +
        "      var picSources = root.querySelectorAll('picture source');\n" +
        "      for (var pi = 0; pi < picSources.length; pi++) {\n" +
        "        var ss = picSources[pi].srcset || picSources[pi].getAttribute('srcset');\n" +
        "        if (ss) {\n" +
        "          var parts = ss.split(',');\n" +
        "          for (var sp = 0; sp < parts.length; sp++) {\n" +
        "            var itemUrl = parts[sp].trim().split(' ')[0];\n" +
        "            if (itemUrl) {\n" +
        "              inspectImage({ src: itemUrl, naturalWidth: 0, naturalHeight: 0, getAttribute: function() { return ''; } });\n" +
        "            }\n" +
        "          }\n" +
        "        }\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "    try {\n" +
        "      var iframes = root.querySelectorAll('iframe');\n" +
        "      for (var k = 0; k < iframes.length; k++) {\n" +
        "        try {\n" +
        "          var fDoc = iframes[k].contentDocument || (iframes[k].contentWindow && iframes[k].contentWindow.document);\n" +
        "          if (fDoc) scanNodeSubtree(fDoc);\n" +
        "        } catch(e) {}\n" +
        "        try {\n" +
        "          var fsrc = iframes[k].src || iframes[k].getAttribute('src') || iframes[k].getAttribute('data-src');\n" +
        "          if (fsrc) inspectIframe(fsrc);\n" +
        "        } catch(e) {}\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "    try {\n" +
        "      var scripts = root.querySelectorAll('script');\n" +
        "      for (var si = 0; si < scripts.length; si++) scanScriptElement(scripts[si]);\n" +
        "    } catch(e) {}\n" +
        "    try {\n" +
        "      var allEls = root.querySelectorAll('*');\n" +
        "      for (var ai = 0; ai < allEls.length; ai++) {\n" +
        "        if (allEls[ai].shadowRoot) scanNodeSubtree(allEls[ai].shadowRoot);\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }\n" +
        "\n" +
        "  function scanGlobals() {\n" +
        "    try {\n" +
        "      if (window.ytInitialPlayerResponse && window.ytInitialPlayerResponse.streamingData) {\n" +
        "        var ytResp = window.ytInitialPlayerResponse;\n" +
        "        var sd = ytResp.streamingData;\n" +
        "        var ytTitle = (ytResp.videoDetails && ytResp.videoDetails.title) ? ytResp.videoDetails.title : (document.title || 'YouTube Video');\n" +
        "        var ytThumb = '';\n" +
        "        try {\n" +
        "          var thumbs = ytResp.videoDetails && ytResp.videoDetails.thumbnail && ytResp.videoDetails.thumbnail.thumbnails;\n" +
        "          if (thumbs && thumbs.length > 0) ytThumb = thumbs[thumbs.length - 1].url || '';\n" +
        "        } catch(e) {}\n" +
        "        if (sd.hlsManifestUrl) {\n" +
        "          checkAndReport(sd.hlsManifestUrl, 'HLS_STREAM', 'application/x-mpegurl', ytTitle, 0, 0, 0, 0, ytThumb, 'HLS');\n" +
        "        }\n" +
        "      }\n" +
        "      if (window.mediaDefinitions) scanObjectForStreams(window.mediaDefinitions, 0);\n" +
        "      if (window.hls && window.hls.url) inspectUrl(window.hls.url, '', '', '');\n" +
        "      if (typeof window.jwplayer === 'function') {\n" +
        "        try {\n" +
        "          var jw = window.jwplayer();\n" +
        "          if (jw && typeof jw.getPlaylist === 'function') {\n" +
        "            var pl = jw.getPlaylist();\n" +
        "            if (pl) scanObjectForStreams(pl, 0);\n" +
        "          }\n" +
        "        } catch(e) {}\n" +
        "      }\n" +
        "      if (window.videojs && typeof window.videojs.getAllPlayers === 'function') {\n" +
        "        try {\n" +
        "          var vjsList = window.videojs.getAllPlayers();\n" +
        "          for (var vp = 0; vp < vjsList.length; vp++) {\n" +
        "            var s = vjsList[vp].currentSrc();\n" +
        "            if (s) inspectUrl(s, '', '', '');\n" +
        "          }\n" +
        "        } catch(e) {}\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }\n" +
        "\n" +
        "  function scanDom() {\n" +
        "    checkUrlChange();\n" +
        "    scanNodeSubtree(document);\n" +
        "    scanGlobals();\n" +
        "  }\n" +
        "\n" +
        "  window.__brave_scan_media__ = function() {\n" +
        "    try { scanDom(); flushQueue(); } catch(e) {}\n" +
        "  };\n" +
        "\n" +
        "  // 6. Incremental MutationObserver (processes added/mutated elements, script text changes, and Shadow DOM)\n" +
        "  var dirtyNodes = new Set();\n" +
        "  var debounceTimer = null;\n" +
        "  var OBSERVER_OPTS = {\n" +
        "    childList: true,\n" +
        "    subtree: true,\n" +
        "    characterData: true,\n" +
        "    attributes: true,\n" +
        "    attributeFilter: ['src', 'srcset', 'data-src', 'data-original', 'data-lazy-src', 'data-srcset']\n" +
        "  };\n" +
        "  var observer = new MutationObserver(function(mutations) {\n" +
        "    for (var i = 0; i < mutations.length; i++) {\n" +
        "      var m = mutations[i];\n" +
        "      if (m.type === 'attributes' && m.target && m.target.nodeType === 1) {\n" +
        "        dirtyNodes.add(m.target);\n" +
        "      } else if (m.type === 'characterData' && m.target && m.target.parentElement && m.target.parentElement.tagName === 'SCRIPT') {\n" +
        "        dirtyNodes.add(m.target.parentElement);\n" +
        "      } else if (m.addedNodes) {\n" +
        "        for (var j = 0; j < m.addedNodes.length; j++) {\n" +
        "          var added = m.addedNodes[j];\n" +
        "          if (added.nodeType === 1) {\n" +
        "            dirtyNodes.add(added);\n" +
        "          } else if (added.nodeType === 3 && added.parentElement && added.parentElement.tagName === 'SCRIPT') {\n" +
        "            dirtyNodes.add(added.parentElement);\n" +
        "          }\n" +
        "        }\n" +
        "      }\n" +
        "    }\n" +
        "    if (dirtyNodes.size === 0) return;\n" +
        "    if (debounceTimer) clearTimeout(debounceTimer);\n" +
        "    debounceTimer = setTimeout(function() {\n" +
        "      var batch = Array.from(dirtyNodes);\n" +
        "      dirtyNodes.clear();\n" +
        "      for (var b = 0; b < batch.length; b++) {\n" +
        "        try { scanNodeSubtree(batch[b]); } catch(e) {}\n" +
        "      }\n" +
        "      flushQueue();\n" +
        "    }, 250);\n" +
        "  });\n" +
        "  function observeRoot(rootNode) {\n" +
        "    if (!rootNode || !observer) return;\n" +
        "    if (observedRoots) {\n" +
        "      if (observedRoots.has(rootNode)) return;\n" +
        "      observedRoots.add(rootNode);\n" +
        "    }\n" +
        "    try { observer.observe(rootNode, OBSERVER_OPTS); } catch(e) {}\n" +
        "  }\n" +
        "  function attachObserver() {\n" +
        "    var rootNode = document.documentElement || document.body;\n" +
        "    if (rootNode) {\n" +
        "      observeRoot(rootNode);\n" +
        "    } else {\n" +
        "      document.addEventListener('DOMContentLoaded', function() {\n" +
        "        if (document.documentElement) observeRoot(document.documentElement);\n" +
        "      });\n" +
        "    }\n" +
        "  }\n" +
        "  attachObserver();\n" +
        "  try {\n" +
        "    var origSniffAttachShadow = Element.prototype.attachShadow;\n" +
        "    if (origSniffAttachShadow) {\n" +
        "      Element.prototype.attachShadow = function() {\n" +
        "        var sr = origSniffAttachShadow.apply(this, arguments);\n" +
        "        if (sr) {\n" +
        "          observeRoot(sr);\n" +
        "          setTimeout(function() { try { scanNodeSubtree(sr); flushQueue(); } catch(e) {} }, 50);\n" +
        "        }\n" +
        "        return sr;\n" +
        "      };\n" +
        "    }\n" +
        "  } catch(e) {}\n" +
        "\n" +
        "  // Lightweight SPA URL-change watcher (does NOT rescan DOM unless URL changed)\n" +
        "  setInterval(function() {\n" +
        "    try {\n" +
        "      if (checkUrlChange()) {\n" +
        "        scanDom();\n" +
        "        flushQueue();\n" +
        "      }\n" +
        "    } catch(e) {}\n" +
        "  }, 2000);\n" +
        "\n" +
        "  window.addEventListener('load', function() {\n" +
        "    try { scanDom(); flushQueue(); } catch(e) {}\n" +
        "  });\n" +
        "\n" +
        "  scanDom();\n" +
        "  try { inspectUrl(window.location.href, '', '', ''); } catch(e) {}\n" +
        "  flushQueue();\n" +
        "})();\n";
}
