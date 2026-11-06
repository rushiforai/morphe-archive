/*
 * TizenTube MOD - userscript injected by the "Inject Adblocker Userscript" patch.
 *
 * Runs inside the YouTube TV web app (youtube.com/tv) loaded by Cobalt.
 * The injector re-runs this file several times while the app starts (the first documents are
 * discarded by navigations), so every module guards itself with a window flag.
 *
 * Modules:
 *  1. Ad blocker    - removes ad data from InnerTube responses before the app reads them.
 *  2. Sponsored     - removes promoted tiles and the home masthead from feeds and search.
 *  3. Speed keeper  - keeps the playback speed you picked across videos and app restarts.
 *
 * Plain ES5 on purpose: runs on every Cobalt build.
 */
(function () {
  'use strict';

  if (window.__tizenTubeMod) return;
  window.__tizenTubeMod = true;

  var TAG = '[TizenTube MOD] ';

  /* ------------------------------------------------------------------ */
  /* 1 + 2. Ad blocker and sponsored content                             */
  /* ------------------------------------------------------------------ */

  // Ad data at the top level of a player response.
  var AD_KEYS = [
    'adPlacements',
    'playerAds',
    'adSlots',
    'adBreakHeartbeatParams',
    'adBreakServiceMetadata',
    'importantAdBreak'
  ];

  // Promoted items inside feed / search / watch-next lists.
  var SPONSORED_RENDERERS = [
    'adSlotRenderer',
    'promotedVideoRenderer',
    'promotedSparklesWebRenderer',
    'tvMastheadRenderer',
    'statementBannerRenderer'
  ];

  var MAX_DEPTH = 24;

  function isObject(value) {
    return value !== null && typeof value === 'object';
  }

  function removeAdKeys(response) {
    if (!isObject(response)) return;
    for (var i = 0; i < AD_KEYS.length; i++) {
      if (AD_KEYS[i] in response) {
        try { delete response[AD_KEYS[i]]; } catch (e) { /* frozen object */ }
      }
    }
  }

  function isSponsored(item) {
    if (!isObject(item)) return false;
    for (var i = 0; i < SPONSORED_RENDERERS.length; i++) {
      if (item[SPONSORED_RENDERERS[i]]) return true;
    }
    return false;
  }

  // Walks the response (bounded depth) and drops sponsored items from every array.
  function removeSponsored(node, depth) {
    if (!isObject(node) || depth > MAX_DEPTH) return;

    if (Array.isArray(node)) {
      for (var i = node.length - 1; i >= 0; i--) {
        if (isSponsored(node[i])) node.splice(i, 1);
        else removeSponsored(node[i], depth + 1);
      }
      return;
    }

    for (var key in node) {
      if (Object.prototype.hasOwnProperty.call(node, key)) removeSponsored(node[key], depth + 1);
    }
  }

  // Entry point for every parsed JSON value. Only InnerTube-shaped objects are touched.
  function clean(data) {
    if (!isObject(data)) return data;
    try {
      if (data.responseContext || data.playerResponse || data.playabilityStatus) {
        removeAdKeys(data);
        removeAdKeys(data.playerResponse);
        removeSponsored(data.contents, 0);
        removeSponsored(data.onResponseReceivedActions, 0);
        removeSponsored(data.onResponseReceivedCommands, 0);
      }
    } catch (e) { /* never break the app */ }
    return data;
  }

  function isInnerTube(url) {
    url = String(url || '');
    return url.indexOf('/youtubei/') !== -1 || url.indexOf('get_midroll_info') !== -1;
  }

  // Hook: JSON.parse - main path, the TV app parses XHR responseText with it.
  var nativeParse = JSON.parse;
  JSON.parse = function () {
    return clean(nativeParse.apply(this, arguments));
  };

  // Hook: fetch - rewrites the body of InnerTube responses.
  var nativeFetch = window.fetch;
  if (typeof nativeFetch === 'function' && typeof Response === 'function') {
    window.fetch = function () {
      return nativeFetch.apply(this, arguments).then(function (response) {
        if (!response || !isInnerTube(response.url)) return response;
        return response.clone().text().then(function (text) {
          try {
            return new Response(JSON.stringify(clean(nativeParse(text))), {
              status: response.status,
              statusText: response.statusText,
              headers: response.headers
            });
          } catch (e) {
            return response;
          }
        }, function () { return response; });
      });
    };
  }

  // Hook: XHR with responseType 'json' (bypasses JSON.parse).
  try {
    var xhrResponse = Object.getOwnPropertyDescriptor(XMLHttpRequest.prototype, 'response');
    if (xhrResponse && xhrResponse.get && xhrResponse.configurable) {
      Object.defineProperty(XMLHttpRequest.prototype, 'response', {
        configurable: true,
        enumerable: xhrResponse.enumerable,
        get: function () {
          var value = xhrResponse.get.call(this);
          return this.responseType === 'json' ? clean(value) : value;
        }
      });
    }
  } catch (e) { /* engine without configurable XHR getters */ }

  console.log(TAG + 'ad blocker active');

  /* ------------------------------------------------------------------ */
  /* 3. Speed keeper                                                     */
  /* ------------------------------------------------------------------ */
  //
  // TizenTube saves the chosen speed in localStorage['ytaf-configuration'].videoSpeed and applies
  // it on 'canplay', but the player resets the rate to 1x right after. This module re-applies the
  // saved speed a few times after each load, corrects any later drift, and saves speeds picked
  // from YouTube's own speed menu (which TizenTube does not record).
  //
  // A rate change counts as the user's choice only while the speed menu is on screen; player
  // resets happen with the menu closed. 1x is never saved, so a reset can never overwrite a choice.

  var CONFIG_KEY = 'ytaf-configuration';
  var SPEED_MIN = 0.1;
  var SPEED_MAX = 5;
  var EPSILON = 0.001;
  var settleUntil = 0; // While > now, rate changes are our own and are ignored.

  function readConfig() {
    try { return nativeParse(window.localStorage[CONFIG_KEY] || '{}') || {}; } catch (e) { return {}; }
  }

  function savedSpeed() {
    var speed = parseFloat(readConfig().videoSpeed);
    return isFinite(speed) && speed >= SPEED_MIN && speed <= SPEED_MAX ? speed : 1;
  }

  function saveSpeed(speed) {
    try {
      var config = readConfig();
      config.videoSpeed = speed;
      window.localStorage[CONFIG_KEY] = JSON.stringify(config);
    } catch (e) { /* storage unavailable */ }
  }

  function applySpeed(speed) {
    var video = document.querySelector('video');
    if (video && Math.abs(video.playbackRate - speed) > EPSILON) {
      try { video.playbackRate = speed; } catch (e) { /* not ready */ }
    }
  }

  function enforceAfterLoad() {
    var speed = savedSpeed();
    settleUntil = Date.now() + 1500;
    // Several attempts: the player's own reset lands shortly after 'canplay'.
    setTimeout(function () { applySpeed(speed); }, 0);
    setTimeout(function () { applySpeed(speed); }, 250);
    setTimeout(function () { applySpeed(speed); }, 1000);
  }

  // The speed menu lists several "1.25x"-style labels; its title is also checked.
  function speedMenuOpen() {
    try {
      var text = document.body ? document.body.textContent : '';
      if (!text) return false;
      if (text.indexOf('Playback speed') !== -1 || text.indexOf('Vitesse de lecture') !== -1) return true;
      var labels = text.match(/\d\.\d{1,2}x/g);
      return !!(labels && labels.length >= 4);
    } catch (e) {
      return false;
    }
  }

  // Capture phase on document: catches media events of any <video>, current or future.
  document.addEventListener('canplay', enforceAfterLoad, true);
  document.addEventListener('loadeddata', enforceAfterLoad, true);

  document.addEventListener('ratechange', function (event) {
    var video = event.target;
    if (!video || video.tagName !== 'VIDEO' || Date.now() < settleUntil) return;

    var speed = video.playbackRate;
    if (!isFinite(speed) || speed < SPEED_MIN || speed > SPEED_MAX) return;
    if (Math.abs(speed - 1) < EPSILON) return;             // never save 1x
    if (Math.abs(speed - savedSpeed()) < EPSILON) return;  // nothing new
    if (!speedMenuOpen()) return;                          // player reset, not the user

    saveSpeed(speed);
    console.log(TAG + 'speed saved: ' + speed);
  }, true);

  // Late resets: re-apply every 2 s if the rate drifted.
  setInterval(function () {
    if (Date.now() >= settleUntil) applySpeed(savedSpeed());
  }, 2000);
})();
