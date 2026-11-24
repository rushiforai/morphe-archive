// java: app/hoitruyenchu/extension/itruyenchu/patches/media/VoiceBarScript.java
(function () {
  var TAG = '[HTC-VoiceBar] ';
  function log(m) { try { var s0 = globalThis.__htcS; if (s0 && s0.debug === false) return; console.log(TAG + m); } catch (e) {} }
  function S(k, d) { try { var s0 = globalThis.__htcS; var v = s0 ? s0[k] : undefined; return v === undefined || v === null ? d : v; } catch (e) { return d; } }
  try {
    var g = typeof globalThis !== 'undefined' ? globalThis : this;
    if (typeof g.__r !== 'function') { log('no __r'); return; }
    var JSX = g.__htcR('jsx');
    var React = g.__htcR('react');
    var RN = g.__htcR('rn');
    var VM = g.__htcR('voice');
    var V = VM && VM.useTTSVoiceStore;
    if (!JSX || typeof JSX.jsx !== 'function' || typeof JSX.jsxs !== 'function'
        || !React || typeof React.useEffect !== 'function'
        || !RN || !RN.DeviceEventEmitter || typeof RN.DeviceEventEmitter.addListener !== 'function'
        || !V || typeof V.getState !== 'function') { log('modules not found'); return; }
    var storage = null;
    try { storage = V.persist.getOptions().storage; } catch (e) {}

    var icons = null;   // lucide icons, loaded with the voice bar module
    var depth = 0;      // > 0 while a voice bar renders
    var mounted = 0;    // voice bars mounted
    var bar = { play: null, playing: false, next: null };
    var reader = null;  // {onPrev, n} of the reader screen

    function stopSpeech() {
      try {
        var S = g.__htcR('speech');
        if (S && typeof S.stop === 'function') {
          var p = S.stop();
          if (p && typeof p.then === 'function') p.then(null, function () {});
        }
      } catch (e) { log('stop failed ' + e); }
    }

    function openBar() {
      try { var s = V.getState(); if (!s.isVoiceBarOpen) s.setIsVoiceBarOpen(true); } catch (e) {}
    }

    // Like the next button of the voice bar (handleNext): stop, keep playing, change chapter.
    function goPrev() {
      var r = reader;
      if (mounted <= 0 || !r || typeof r.onPrev !== 'function' || !(r.n > 1)) return false;
      log('previous chapter ' + (r.n - 1));
      stopSpeech();
      try { V.getState().setAutoPlay(true); } catch (e) {}
      r.onPrev();
      return true;
    }

    function goNext() {
      if (mounted <= 0 || typeof bar.next !== 'function') return false;
      log('next chapter');
      bar.next();
      return true;
    }

    // Widget next / previous set to move lines: like tapping that line (stop, mark, play again).
    function moveLines(delta) {
      if (mounted <= 0 || typeof bar.play !== 'function') return false;
      var s = V.getState();
      var target = Math.max(0, (s.activeLine > 0 ? s.activeLine : 0) + delta);
      log('move ' + delta + ' lines to ' + target);
      if (target === s.activeLine) return true;
      s.setActiveLine(target);
      if (!bar.playing) return true;
      bar.play();
      var tries = 0;
      var again = function () {
        try {
          if (!bar.playing && typeof bar.play === 'function') {
            if (V.getState().activeLine !== target) V.getState().setActiveLine(target);
            bar.play();
            return;
          }
          if (++tries < 20) setTimeout(again, 100);
        } catch (e) { log('move failed ' + e); }
      };
      setTimeout(again, 100);
      return true;
    }

    // Used by the mini player while the reader is under another screen.
    g.__htcBarCtl = { next: goNext, prev: goPrev };

    function onPrevPressed() {
      try { if (!goPrev()) log('no previous chapter'); } catch (e) { log('prev failed ' + e); }
    }

    function wrapVoiceBar(memo) {
      var orig = memo.type;
      var VoiceBar = function (props) {
        React.useEffect(function () {
          mounted++;
          return function () {
            mounted--;
            if (mounted <= 0) { mounted = 0; bar.play = null; bar.next = null; bar.playing = false; }
          };
        }, []);
        depth++;
        try { return orig.apply(this, arguments); } finally { depth--; }
      };
      // Keep the marks of other scripts wrapping the voice bar too (tap to seek), so nobody wraps twice.
      for (var k in orig) { if (k.indexOf('__htc') === 0) VoiceBar[k] = orig[k]; }
      VoiceBar.__htc = true;
      memo.type = VoiceBar;
      try { icons = g.__htcR('icons'); } catch (e) { icons = null; }
      log('voice bar hooked' + (icons ? '' : ' (no icons)'));
    }

    function assign(src, extra) {
      var out = {}, k;
      for (k in src) out[k] = src[k];
      for (k in extra) out[k] = extra[k];
      return out;
    }

    // Returns new props for the element, or null to keep them.
    function inspect(type, props) {
      if (type && typeof type === 'object' && type.type && typeof type.type === 'function'
          && type.type.name === 'VoiceBar' && !type.type.__htc) {
        wrapVoiceBar(type);
      }
      if (!props || typeof props !== 'object') return null;
      if (typeof props.onPrev === 'function' && typeof props.onNext === 'function'
          && props.chapterNumber != null) {
        reader = { onPrev: props.onPrev, n: Number(props.chapterNumber) };
      }
      if (depth > 0 && icons) {
        var child = props.children;
        var ct = child && typeof child === 'object' ? child.type : null;
        if (ct) {
          if (ct === icons.SkipBack) {
            if (typeof props.onPress !== 'function' && S('media.enabled', true)) return assign(props, { onPress: onPrevPressed });
          } else if (ct === icons.SkipForward) {
            if (typeof props.onPress === 'function') bar.next = props.onPress;
          } else if (ct === icons.Play || ct === icons.Pause) {
            if (typeof props.onPress === 'function') {
              bar.play = props.onPress;
              bar.playing = ct === icons.Pause;
            }
          }
        }
      }
      return null;
    }

    function wrapJsx(orig) {
      return function (type, props) {
        var p = null;
        try { p = inspect(type, props); } catch (e) {}
        if (!p) return orig.apply(this, arguments);
        var args = Array.prototype.slice.call(arguments);
        args[1] = p;
        return orig.apply(this, args);
      };
    }
    var jsx = wrapJsx(JSX.jsx);
    var jsxs = wrapJsx(JSX.jsxs);
    JSX.jsx = jsx;
    JSX.jsxs = jsxs;
    if (JSX.jsx !== jsx) { log('jsx not writable'); return; }

    // Media widget / lock screen / headset buttons, sent by TtsMediaSession.
    function handle(cmd) {
      if (mounted <= 0) return false;
      if (cmd === 'play') {
        if (typeof bar.play !== 'function') return false;
        openBar();
        if (!bar.playing) { bar.play(); return true; }
        // The bar still shows "playing" but the reading stopped: stop and start again.
        bar.play();
        setTimeout(function () {
          try { if (!bar.playing && typeof bar.play === 'function') bar.play(); } catch (e) { log('restart failed ' + e); }
        }, 400);
        return true;
      }
      if (cmd === 'pause') {
        if (!bar.playing || typeof bar.play !== 'function') return false;
        bar.play();
        return true;
      }
      if (cmd === 'next') return goNext();
      if (cmd === 'prev') return goPrev();
      if (cmd.indexOf('line') === 0) {
        var delta = parseInt(cmd.substring(4), 10);
        return delta ? moveLines(delta) : false;
      }
      return false;
    }

    function ack(id, ok) {
      if (!storage || !id) return;
      try {
        var p = storage.setItem('htc_media_ack', { id: id, ok: ok, t: Date.now() });
        if (p && typeof p.then === 'function') p.then(null, function () {});
      } catch (e) { log('ack failed ' + e); }
    }

    RN.DeviceEventEmitter.addListener('htcMediaCommand', function (msg) {
      // The mini player reads (the reader is closed): it answers.
      try { if (mounted <= 0 && typeof g.__htcPlayerActive === 'function' && g.__htcPlayerActive()) return; } catch (e) {}
      var s = String(msg);
      var i = s.indexOf('#');
      var cmd = i >= 0 ? s.substring(0, i) : s;
      var id = i >= 0 ? parseInt(s.substring(i + 1), 10) : 0;
      var ok = false;
      try { ok = handle(cmd) === true; } catch (e) { log(cmd + ' failed ' + e); }
      log(cmd + (ok ? ' done' : ' not handled'));
      ack(id, ok);
    });
    log('ready');
  } catch (e) {
    log('init failed ' + e);
  }
})();
