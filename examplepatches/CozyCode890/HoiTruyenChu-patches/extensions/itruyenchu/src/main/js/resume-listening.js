// java: app/hoitruyenchu/extension/itruyenchu/patches/resume/ResumeListeningPatch.java
(function () {
  var TAG = '[HTC-Resume] ';
  var KEY = 'htc_listen_pos';
  function log(m) { try { var s0 = globalThis.__htcS; if (s0 && s0.debug === false) return; console.log(TAG + m); } catch (e) {} }
  function S(k, d) { try { var s0 = globalThis.__htcS; var v = s0 ? s0[k] : undefined; return v === undefined || v === null ? d : v; } catch (e) { return d; } }
  try {
    var g = typeof globalThis !== 'undefined' ? globalThis : this;
    if (typeof g.__r !== 'function') { log('no __r'); return; }
    var V = g.__htcR('voice') && g.__htcR('voice').useTTSVoiceStore;
    var JSX = g.__htcR('jsx');
    var React = g.__htcR('react');
    if (!V || typeof V.getState !== 'function' || typeof V.subscribe !== 'function'
        || typeof V.getState().setActiveLine !== 'function') { log('voice store not found'); return; }
    if (!JSX || typeof JSX.jsx !== 'function' || typeof JSX.jsxs !== 'function'
        || !React || typeof React.useRef !== 'function') { log('react not found'); return; }
    var storage = null;
    try { storage = V.persist.getOptions().storage; } catch (e) {}

    var saved = {};
    var loaded = null;   // chapter shown by the reader {slug, n}
    var lastSlug = null; // bookSlug of the reader's elements
    var saveTimer = null;

    if (storage) {
      try {
        var r = storage.getItem(KEY);
        var apply = function (v) { if (v && typeof v === 'object') { for (var k in v) { if (!saved[k]) saved[k] = v[k]; } } };
        if (r && typeof r.then === 'function') r.then(apply, function () {}); else apply(r);
      } catch (e) { log('load failed ' + e); }
    }

    function persist() {
      if (!storage || saveTimer) return;
      saveTimer = setTimeout(function () {
        saveTimer = null;
        try {
          var keys = Object.keys(saved);
          if (keys.length > 300) {
            keys.sort(function (a, b) { return saved[a].t - saved[b].t; });
            for (var i = 0; i < keys.length - 300; i++) delete saved[keys[i]];
          }
          var p = storage.setItem(KEY, saved);
          if (p && typeof p.then === 'function') p.then(null, function () {});
        } catch (e) { log('save failed ' + e); }
      }, 1500);
    }

    // Which chapter the reader shows: ReadEngine {content, chapterNumber, ...} renders with new
    // content (per mounted reader). The book: bookSlug of ReadEngine (2.1.0) or of the reader's
    // header / voice bar, created just before it (3.0.0).
    // For the mini player: the chapter shown, and the line it reached while the reader was closed.
    g.__htcChapter = function () { return loaded; };
    g.__htcSaveListen = function (slug, n, line) {
      try {
        if (!slug || !(n > 0) || !(line >= 0)) return;
        saved[slug] = { c: n, l: line, t: Date.now() };
        persist();
      } catch (e) {}
    };

    function chapterShown(slug, n) {
      try {
        if (!slug || !(n > 0)) return;
        loaded = { slug: slug, n: n };
        // Opened from the mini player: highlight its line, and play if it was playing.
        var req = g.__htcResumeRequest;
        if (req && req.slug === slug && req.n === n && Date.now() - req.t < 60000) {
          g.__htcResumeRequest = null;
          if (req.line >= 0) { show(slug, n, req.line, !!req.play); return; }
        }
        if (!S('resume.enabled', true)) return;
        var p = saved[slug];
        if (p && p.c === n && p.l > 0) restore(slug, n, p.l);
      } catch (e) { log('chapter failed ' + e); }
    }
    var engine = null;
    function wrapEngine(orig) {
      var ReadEngine = function (props) {
        var last = React.useRef(null);
        try {
          if (props && typeof props.content === 'string' && props.content && last.current !== props.content) {
            last.current = props.content;
            var slug = typeof props.bookSlug === 'string' && props.bookSlug ? props.bookSlug : lastSlug;
            var n = Number(props.chapterNumber);
            // After the render: the reader's own state updates (active line -1) come first.
            setTimeout(function () { chapterShown(slug, n); }, 0);
          }
        } catch (e) {}
        return orig.apply(this, arguments);
      };
      for (var k in orig) { if (k.indexOf('__htc') === 0) ReadEngine[k] = orig[k]; }
      ReadEngine.__htcResume = true;
      ReadEngine.__htcResumeOrig = orig;
      log('reader hooked');
      return ReadEngine;
    }
    function wrapJsx(orig) {
      return function (type, props) {
        try {
          if (props && typeof props === 'object' && typeof props.bookSlug === 'string' && props.bookSlug) lastSlug = props.bookSlug;
          if (typeof type === 'function' && type.name === 'ReadEngine' && !type.__htcResume) {
            if (!engine || engine.__htcResumeOrig !== type) engine = wrapEngine(type);
            var a = Array.prototype.slice.call(arguments);
            a[0] = engine;
            return orig.apply(this, a);
          }
        } catch (e) {}
        return orig.apply(this, arguments);
      };
    }
    var jsx = wrapJsx(JSX.jsx), jsxs = wrapJsx(JSX.jsxs);
    JSX.jsx = jsx;
    JSX.jsxs = jsxs;
    if (JSX.jsx !== jsx) { log('jsx not writable'); return; }

    // Settings: "highlight" (mark the line, play continues from it), "play" (and play), "ask".
    function restore(slug, n, line) {
      var mode = S('resume.mode', 'highlight');
      show(slug, n, line, mode === 'play');
      if (mode !== 'ask') return;
      // The line is marked like the default; the question only decides whether to play now.
      setTimeout(function () {
        try {
          if (!loaded || loaded.slug !== slug || loaded.n !== n || V.getState().activeLine !== line) return;
          var RN = g.__htcR('rn');
          RN.Alert.alert('Nghe ti\u1ebfp?', 'Nghe ti\u1ebfp t\u1eeb d\u00f2ng ' + (line + 1) + '?', [
            { text: 'T\u1eeb \u0111\u1ea7u ch\u01b0\u01a1ng', onPress: function () { try { V.getState().setActiveLine(0); } catch (e) {} } },
            { text: 'Nghe ti\u1ebfp', onPress: function () { playWhenReady(slug, n, line); } }
          ], { cancelable: true });
        } catch (e) { log('ask failed ' + e); }
      }, 1200);
    }

    function playWhenReady(slug, n, line) {
      var tries = 0;
      var tick = function () {
        try {
          var bar = g.__htcBar;
          var cur = V.getState();
          if (!loaded || loaded.slug !== slug || loaded.n !== n) return;
          if (bar && bar.ready() && cur.activeLine === line) {
            if (!bar.playing()) { log('playing from line ' + line); bar.press(); }
            return;
          }
          if (++tries < 30) setTimeout(tick, 200);
          else log('voice bar not ready, not playing');
        } catch (e) { log('play failed ' + e); }
      };
      setTimeout(tick, 200);
    }

    function show(slug, n, line, play) {
      log('restore ' + slug + ' ch ' + n + ' line ' + line + (play ? ' and play' : ''));
      var s = V.getState();
      var wasPlaying = s.autoPlay === true;
      // No auto play of the new text: the user presses play to continue from the line.
      if (wasPlaying) s.setAutoPlay(false);
      // Closing the bar stops any speech still going on and resets the play button.
      if (wasPlaying && s.isVoiceBarOpen) s.setIsVoiceBarOpen(false);
      setTimeout(function () {
        try { if (!V.getState().isVoiceBarOpen) V.getState().setIsVoiceBarOpen(true); } catch (e) {}
      }, wasPlaying ? 200 : 0);
      // Highlight once the lines are laid out, so that the reader also scrolls to it.
      setTimeout(function () {
        try {
          var cur = V.getState();
          if (loaded && loaded.slug === slug && loaded.n === n && cur.activeLine <= 0 && cur.autoPlay !== true) {
            cur.setActiveLine(line);
            if (play) playWhenReady(slug, n, line);
          }
        } catch (e) { log('highlight failed ' + e); }
      }, 900);
    }

    V.subscribe(function (s, prev) {
      try {
        if (!S('resume.enabled', true)) return;
        if (prev && s.activeLine !== prev.activeLine && s.activeLine > 0 && loaded) {
          saved[loaded.slug] = { c: loaded.n, l: s.activeLine, t: Date.now() };
          persist();
        }
      } catch (e) { log('listener failed ' + e); }
    });
    log('ready');
  } catch (e) {
    log('init failed ' + e);
  }
})();
