// java: app/hoitruyenchu/extension/itruyenchu/patches/taptoseek/TapToSeekPatch.java
(function () {
  var TAG = '[HTC-TapSeek] ';
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
        || !React || typeof React.useState !== 'function' || typeof React.useEffect !== 'function'
        || !RN || !RN.Text || !RN.View || !RN.ScrollView || !RN.Pressable || !RN.Animated
        || typeof V !== 'function' || typeof V.getState !== 'function' || typeof V.subscribe !== 'function'
        || typeof V.getState().setActiveLine !== 'function') { log('modules not found'); return; }
    var Text = RN.Text;
    var View = RN.View;
    var ScrollView = RN.ScrollView;
    var Pressable = RN.Pressable;
    var AnimatedView = RN.Animated.View;

    // The reader scrolls the line being read to 100 px below the top of the screen.
    var TOP_GAP = 100;
    var WRAP_STYLE = { flexGrow: 1, flexShrink: 1 };
    var BUTTON_STYLE = {
      position: 'absolute', alignSelf: 'center', flexDirection: 'row', alignItems: 'center',
      paddingHorizontal: 16, paddingVertical: 9, borderRadius: 20,
      backgroundColor: '#3b4049', borderWidth: 1, borderColor: 'rgba(255,255,255,0.35)', elevation: 6
    };
    var BUTTON_TEXT_STYLE = { color: '#ffffff', fontSize: 14, fontWeight: '600' };

    var jsx0 = JSX.jsx;
    var jsxs0 = JSX.jsxs;
    var icons = null;         // lucide icons, loaded with the voice bar
    var barDepth = 0;         // > 0 while the voice bar renders
    var barMounted = 0;
    var barHeight = 0;
    var bar = { play: null, playing: false };
    var pending = null;       // {target, started}: reading stopped by a tap, to start again from target
    var restarting = 0;       // time play was pressed again after a tap, until the bar shows "pause"
    var queued = null;        // line tapped while restarting, done once the reading runs
    var queuedPos = -1;
    var contentDepth = 0;     // > 0 while ReadContent renders
    var lineIndex = -1;       // line number while a Line component (app 3.0.0) renders
    // App 3.0.0's voice bar reads the text after the "Thay the" rules, like the reader shows it.
    var voiceReplaced = !!(g.__htcApp && g.__htcApp.voiceReplaced);
    var readContent = null;   // our wrapper of ReadContent
    var rawText = null;       // chapter text given to the reader (read by the voice bar)
    var shownText = null;     // text shown by ReadContent (with the "Thay the" rules applied)
    var scrollRef = null;
    var positions = [];       // y of the shown lines (onLayout of the reader), by shown index
    var heights = [];         // height of the shown lines
    var textLayouts = [];     // onTextLayout lines of the shown lines (tap on a word)
    var lineTexts = [];       // text of the shown lines (app 3.0.0 Line components)
    var viewHeight = 0;       // height of the reader's ScrollView
    var contentTop = 0;       // y of ReadContent in the scrolled content
    var scrollY = 0;          // its scroll position
    var detached = false;     // the user scrolled by hand: the reader does not follow the voice
    var listeners = [];
    var notifyTimer = null;
    var map = null;           // shown index -> voice line index, when they differ
    var inv = null;           // voice line index -> shown index
    var mapRaw = null;
    var mapShown = null;
    var activeStyle = null;

    function assign(src, extra) {
      var out = {}, k;
      for (k in src) out[k] = src[k];
      for (k in extra) out[k] = extra[k];
      return out;
    }

    function splitLines(t) {
      var out = [], parts = String(t).split(/\r?\n+/);
      for (var i = 0; i < parts.length; i++) {
        var s = parts[i].trim();
        if (s) out.push(s);
      }
      return out;
    }

    // The voice bar reads the original text, the reader shows it after the "Thay the" rules.
    // A rule can remove a whole line, then the line numbers differ: match them by content.
    function updateMap() {
      if (rawText === mapRaw && shownText === mapShown) return;
      mapRaw = rawText;
      mapShown = shownText;
      map = null;
      inv = null;
      if (typeof rawText !== 'string' || typeof shownText !== 'string' || rawText === shownText) return;
      var raw = splitLines(rawText);
      var shown = splitLines(shownText);
      if (raw.length === shown.length) return;
      try {
        var M = g.__htcR('replace');
        var rules = M.useMagicReplaceStore.getState().rules;
        var keep = [];
        for (var j = 0; j < raw.length; j++) {
          if (String(M.applyReplaceRules(raw[j], rules)).trim()) keep.push(j);
        }
        if (keep.length !== shown.length) {
          log('line map failed ' + raw.length + '/' + shown.length + '/' + keep.length);
          return;
        }
        map = keep;
        inv = {};
        for (var i = 0; i < keep.length; i++) inv[keep[i]] = i;
        log('line map ' + raw.length + ' -> ' + shown.length);
      } catch (e) { log('line map error ' + e); }
    }

    function toVoice(i) { return map ? map[i] : i; }
    function toShown(j) {
      if (!map) return j;
      var i = inv[j];
      return i === undefined ? -1 : i;
    }

    function notify() {
      if (notifyTimer) return;
      notifyTimer = setTimeout(function () {
        notifyTimer = null;
        var copy = listeners.slice();
        for (var i = 0; i < copy.length; i++) { try { copy[i](); } catch (e) {} }
      }, 0);
    }

    function setDetached(v) {
      if (detached === v) return;
      detached = v;
      if (!v && typeof cancelAutoReturn === 'function') cancelAutoReturn();
      log(v ? 'following stopped (scrolled by hand)' : 'following again');
      notify();
    }

    // Automatic scroll of the reader to the line being read: scrollTo({y, animated: true}).
    function isFollowScroll(a) {
      return !!a && typeof a === 'object' && a.animated === true && typeof a.y === 'number' && a.x === undefined;
    }

    // Where the reader scrolls to show shown line i (setting tap.followPosition): "top" like the app
    // (100 px below the top), "middle", "bottom" (just above the voice bar), "page" (only when the
    // line is about to leave the screen, then it goes to the top). null = do not scroll.
    function followTarget(i, force) {
      var y = positions[i];
      if (typeof y !== 'number') return null;
      var mode = S('tap.enabled', true) ? S('tap.followPosition', 'bottom') : 'top';
      var h = heights[i] > 0 ? heights[i] : 0;
      var cover = barHeight > 0 ? barHeight : 90;
      var visible = viewHeight > 0 ? viewHeight - cover : 0;
      // Like the app: 100 (its own number, it ignores what is above the lines).
      if (mode === 'top' || !(visible > 200) || !(h > 0) || h > visible - 60) return Math.max(0, y - TOP_GAP);
      y += contentTop;
      if (mode === 'middle') return Math.max(0, Math.round(y + h / 2 - visible / 2));
      if (mode === 'bottom') return Math.max(0, Math.round(y + h - visible + 24));
      // "page"
      if (!force && y >= scrollY + 16 && y + h <= scrollY + visible - 8) return null;
      return Math.max(0, y - 24);
    }

    function patchScroll(inst) {
      if (!inst || typeof inst.scrollTo !== 'function' || inst.scrollTo === inst.__htcTapScroll) return;
      var orig = inst.scrollTo;
      var patched = function (a) {
        try {
          if (isFollowScroll(a)) {
            if (detached) return undefined;
            var i = toShown(V.getState().activeLine);
            if (typeof positions[i] === 'number') {
              var y = followTarget(i, false);
              if (y === null) return undefined;
              return orig.call(this, { y: y, animated: true });
            }
          }
        } catch (e) {}
        return orig.apply(this, arguments);
      };
      inst.__htcTapScroll = patched;
      inst.__htcTapOrig = orig;
      inst.scrollTo = patched;
    }

    function startPending() {
      var p = pending;
      pending = null;
      if (!p) return;
      p.started = true;
      try {
        var s = V.getState();
        if (barMounted <= 0 || typeof bar.play !== 'function' || bar.playing || !s.isVoiceBarOpen) {
          log('restart skipped');
          return;
        }
        if (s.activeLine !== p.target) s.setActiveLine(p.target);
        log('reading from line ' + p.target);
        wordHint(p.target, typeof p.pos === 'number' ? p.pos : -1, false);
        restarting = Date.now();
        bar.play();
      } catch (e) { log('restart failed ' + e); }
    }

    // The voice bar was just opened by a tap: press play once it is there.
    function playOnceOpen(target) {
      var tries = 0;
      var tick = function () {
        try {
          var s = V.getState();
          if (!s.isVoiceBarOpen) return;
          if (barMounted > 0 && typeof bar.play === 'function') {
            if (bar.playing) return;
            if (s.activeLine !== target) s.setActiveLine(target);
            restarting = Date.now();
            bar.play();
            return;
          }
          if (++tries < 25) setTimeout(tick, 120);
        } catch (e) { log('play failed ' + e); }
      };
      setTimeout(tick, 150);
    }

    // Gesture of the settings: "tap", "double" (two taps within 350 ms) or "long" (onLongPress).
    // Lines get both handlers and the setting is read when pressed (app 3.0.0's lines are memo
    // components that do not render again when a setting changes).
    // Tapping a word (setting word.tap): "line" the line is read from its start; "word" from the
    // tapped word; "hold" a tap reads from the line start, a long press from the word.
    var lastTap = { i: -1, t: 0 };
    function onLineShortPress(index, e) {
      if (S('tap.gesture', 'tap') === 'long') return;
      onLinePress(index, wordPos(index, e, false));
    }
    function onLineLongPress(index, e) {
      if (S('tap.gesture', 'tap') !== 'long') {
        var hold = S('word.tap', 'line') === 'hold' && S('word.enabled', true) && S('tap.gesture', 'tap') === 'tap';
        if (hold) { if (S('tap.enabled', true)) onLineTap(index, wordPos(index, e, true)); return; }
        onLinePress(index, wordPos(index, e, false));
        return;
      }
      if (S('tap.enabled', true)) onLineTap(index, wordPos(index, e, false));
    }
    function onLinePress(index, pos) {
      if (!S('tap.enabled', true)) return;
      if (S('tap.gesture', 'tap') !== 'double') { onLineTap(index, pos); return; }
      var now = Date.now();
      if (lastTap.i === index && now - lastTap.t < 350) { lastTap.i = -1; onLineTap(index, pos); return; }
      lastTap = { i: index, t: now };
    }

    // Character of shown line index under the finger (onTextLayout lines + touch position, the
    // place inside a visual line is estimated from its width), at a word start; -1 = line start.
    function wordPos(index, e, hold) {
      try {
        if (!S('word.enabled', true)) return -1;
        var mode = S('word.tap', 'line');
        if (mode === 'line') return -1;
        if (mode === 'hold' && !hold && S('tap.gesture', 'tap') === 'tap') return -1;
        var lines = textLayouts[index];
        var text = lineTexts[index];
        var ne = e && e.nativeEvent;
        if (!lines || !lines.length || typeof text !== 'string' || !ne) return -1;
        var x = ne.locationX, y = ne.locationY, acc = 0;
        for (var i = 0; i < lines.length; i++) {
          var l = lines[i];
          var len = String(l.text || '').length;
          if (y < l.y + l.height || i === lines.length - 1) {
            var frac = l.width > 0 ? (x - l.x) / l.width : 0;
            if (frac < 0) frac = 0;
            if (frac > 1) frac = 1;
            var p = Math.min(text.length, acc + Math.floor(frac * len));
            while (p > 0 && !/\s/.test(text.charAt(p - 1))) p--;
            return p;
          }
          acc += len;
        }
      } catch (x2) { log('word position failed ' + x2); }
      return -1;
    }

    // The next start of the line (voice index) at pos: "hint" for the line played right now, "keep"
    // for a line played later (marked). pos < 0: from the line start.
    function wordHint(target, pos, keep) {
      try {
        if (typeof g.__htcCmd !== 'function' || !S('word.enabled', true)) return;
        var text = lineTexts[toShown(target)];
        if (typeof text !== 'string' || !text) return;
        g.__htcCmd('wordAt', { text: text, pos: pos > 0 ? pos : 0, keep: !!keep });
        if (pos > 0) log('line ' + target + ' from character ' + pos);
      } catch (e) { log('hint failed ' + e); }
    }

    var autoTimer = null;
    function cancelAutoReturn() { if (autoTimer) { clearTimeout(autoTimer); autoTimer = null; } }
    function scheduleAutoReturn() {
      cancelAutoReturn();
      var sec = Number(S('tap.autoReturn', 0));
      if (!(sec > 0) || !detached) return;
      autoTimer = setTimeout(function () {
        autoTimer = null;
        try { if (detached && V.getState().isVoiceBarOpen) { log('auto return after ' + sec + ' s'); returnToLine(); } } catch (e) {}
      }, sec * 1000);
    }

    function onLineTap(index, pos) {
      try {
        if (typeof pos !== 'number') pos = -1;
        var target = toVoice(index);
        if (typeof target !== 'number' || target < 0) return;
        var s = V.getState();
        if (!s.isVoiceBarOpen) {
          // Reading with the eyes. Settings: "mark" open the bar and mark the line, no sound;
          // "play" and start reading from it; "nothing".
          var mode = S('tap.closedBar', 'mark');
          if (mode === 'nothing') return;
          log('line ' + target + ' marked, voice bar opened' + (mode === 'play' ? ', playing' : ''));
          pending = null;
          setDetached(false);
          if (typeof s.setIsVoiceBarOpen === 'function') s.setIsVoiceBarOpen(true);
          V.getState().setActiveLine(target);
          wordHint(target, pos, mode !== 'play');
          if (mode === 'play') playOnceOpen(target);
          return;
        }
        var current = target === s.activeLine;
        // Settings, while reading: the line being read tapped "nothing" / "pause" / "restart";
        // another line "jump" / "mark" (stop, highlight it) / "nothing".
        var how = current ? S('tap.currentLine', 'nothing') : S('tap.otherLine', 'jump');
        if (pending) {
          // Stopped by the previous tap, about to read again from pending.target (= activeLine).
          if (how === 'nothing') { log('line ' + target + ' ignored while restarting'); return; }
          if (how === 'pause' || how === 'mark') {
            pending = null;
            setDetached(false);
            if (!current) s.setActiveLine(target);
            wordHint(target, pos, true);
            log('restart cancelled, line ' + target + ' marked');
            return;
          }
          // The last tapped line wins.
          pending.target = target;
          pending.pos = pos;
          setDetached(false);
          if (s.activeLine !== target) s.setActiveLine(target);
          return;
        }
        if (restarting && !bar.playing && Date.now() - restarting < 3000) {
          // Play was just pressed again (the voices are being checked): handled once the reading runs.
          queued = target;
          queuedPos = pos;
          setDetached(false);
          return;
        }
        var reading = barMounted > 0 && bar.playing && typeof bar.play === 'function';
        if (!reading && current) {
          // Stopped, the highlighted line tapped: with "pause" it is read again from its start.
          if (S('tap.currentLine', 'nothing') === 'pause' && barMounted > 0 && typeof bar.play === 'function') {
            log('reading again from line ' + target);
            setDetached(false);
            // From the tapped word, or where the line was paused (kept by Java).
            if (pos > 0) wordHint(target, pos, false);
            restarting = Date.now();
            bar.play();
          } else {
            log('line ' + target + ' is the current line');
          }
          return;
        }
        if (reading && how === 'nothing') { log('line ' + target + ' ignored while reading'); return; }
        setDetached(false);
        if (reading && (how === 'pause' || how === 'mark')) {
          // Stop (play button); the highlight stays on / moves to the tapped line, play reads from it.
          log(how === 'pause' ? 'paused at line ' + target : 'stopped, line ' + target + ' marked');
          if (!current) s.setActiveLine(target);
          bar.play();
          // Marked line: play starts from the tapped word / its start. The paused line goes on
          // where it stopped (kept by Java) unless a word was tapped.
          if (!current || pos > 0) setTimeout(function () { wordHint(target, pos, true); }, 300);
          return;
        }
        if (reading) {
          // "jump" or "restart": stop (play button), then start again from the line once
          // the bar shows "play".
          log((current ? 'reading again line ' : 'jump to line ') + target);
          var p = { target: target, started: false, pos: pos };
          pending = p;
          s.setActiveLine(target);
          bar.play();
          setTimeout(function () {
            if (pending === p && !p.started) { log('restart after timeout'); startPending(); }
          }, 1500);
        } else {
          // Stopped: only move the highlight, play starts from it.
          log('line ' + target + ' marked');
          s.setActiveLine(target);
          wordHint(target, pos, true);
        }
      } catch (e) { log('tap failed ' + e); }
    }

    function returnToLine() {
      try {
        setDetached(false);
        var inst = scrollRef && scrollRef.current;
        var i = toShown(V.getState().activeLine);
        var y = followTarget(i, true);
        if (inst && typeof inst.scrollTo === 'function' && typeof y === 'number') {
          (inst.__htcTapOrig || inst.scrollTo).call(inst, { y: y, animated: true });
        } else {
          log('no position for line ' + i);
        }
      } catch (e) { log('return failed ' + e); }
    }

    function ReturnButton() {
      var state = React.useState(0);
      var setTick = state[1];
      React.useEffect(function () {
        var fn = function () { setTick(function (n) { return n + 1; }); };
        listeners.push(fn);
        return function () {
          var i = listeners.indexOf(fn);
          if (i >= 0) listeners.splice(i, 1);
        };
      }, []);
      var open = V(function (s) { return s.isVoiceBarOpen; });
      var line = V(function (s) { return s.activeLine; });
      if (!detached || !open || !(line >= 0) || !S('tap.returnButton', true)) return null;
      var children = [];
      var Icon = icons && (icons.LocateFixed || icons.Locate);
      if (Icon) {
        children.push(jsx0(Icon, { size: 16, color: '#ffffff' }, 'icon'));
        children.push(jsx0(View, { style: { width: 6 } }, 'gap'));
      }
      children.push(jsx0(Text, { style: BUTTON_TEXT_STYLE, children: 'V\u1ec1 d\u00f2ng \u0111ang \u0111\u1ecdc' }, 'text'));
      return jsxs0(Pressable, {
        onPress: returnToLine,
        hitSlop: 8,
        accessibilityRole: 'button',
        style: assign(BUTTON_STYLE, { bottom: (barHeight > 0 ? barHeight : 80) + 12 }),
        children: children
      });
    }

    function onContent(props) {
      if (props.content !== shownText) {
        shownText = props.content;
        positions = [];
        heights = [];
        textLayouts = [];
        lineTexts = [];
        pending = null;
        restarting = 0;
        queued = null;
        setDetached(false);
      }
      scrollRef = props.scrollRef || null;
      updateMap();
      patchScroll(scrollRef && scrollRef.current);
    }

    function wrapReadContent(orig) {
      var ReadContent = function (props) {
        try { if (props) onContent(props); } catch (e) { log('content failed ' + e); }
        contentDepth++;
        var el;
        try { el = orig.apply(this, arguments); } finally { contentDepth--; }
        // The lines' onLayout y is inside ReadContent: where ReadContent is in the scrolled content
        // (title, buttons above it) is needed to place a line on the screen.
        try {
          if (el && el.props && typeof React.cloneElement === 'function') {
            var prev = el.props.onLayout;
            el = React.cloneElement(el, { onLayout: function (e) {
              try { var y = e.nativeEvent.layout.y; if (typeof y === 'number') contentTop = y; } catch (x) {}
              if (typeof prev === 'function') return prev.apply(this, arguments);
              return undefined;
            } });
          }
        } catch (e) { log('content layout failed ' + e); }
        return el;
      };
      ReadContent.__htcTap = true;
      ReadContent.__htcOrig = orig;
      log('reader hooked');
      return ReadContent;
    }

    // ---- Word highlight (setting word.karaoke), from the "htcWord" events of TtsController:
    // {s, e, k}: the word being spoken is text[s, e) of the line whose key (length:Java hashCode of
    // the trimmed text) is k.
    var word = { k: '', s: 0, e: 0 };
    var wordSubs = [];
    var lineActive = false;   // the Line rendering is the line being read
    var WORD_BOLD = { backgroundColor: 'rgba(0,0,0,0.30)' };
    var WORD_UNDER = { textDecorationLine: 'underline' };
    function lineKey(t) {
      var s0 = String(t).trim(), h = 0;
      for (var i = 0; i < s0.length; i++) h = (Math.imul(31, h) + s0.charCodeAt(i)) | 0;
      return s0.length + ':' + h;
    }
    function dimColor(style) {
      var c = null;
      try {
        var list = style && typeof style.length === 'number' ? style : [style];
        for (var i = 0; i < list.length; i++) if (list[i] && list[i].color) c = list[i].color;
      } catch (e) {}
      var r = 128, gg = 128, b = 128, m;
      c = String(c || '').trim().toLowerCase();
      if ((m = /^#([0-9a-f]{3})$/.exec(c))) {
        r = parseInt(m[1][0] + m[1][0], 16); gg = parseInt(m[1][1] + m[1][1], 16); b = parseInt(m[1][2] + m[1][2], 16);
      } else if ((m = /^#([0-9a-f]{6})/.exec(c))) {
        r = parseInt(m[1].substr(0, 2), 16); gg = parseInt(m[1].substr(2, 2), 16); b = parseInt(m[1].substr(4, 2), 16);
      } else if ((m = /^rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/.exec(c))) {
        r = +m[1]; gg = +m[2]; b = +m[3];
      } else if (c === 'white') { r = gg = b = 255; } else if (c === 'black') { r = gg = b = 0; }
      return 'rgba(' + r + ',' + gg + ',' + b + ',0.45)';
    }
    function karaoke(text, style) {
      var mode = S('word.karaoke', 'off');
      if (mode === 'off' || !S('word.enabled', true) || !word.k || word.k !== lineKey(text)) return null;
      var s0 = Math.max(0, Math.min(text.length, word.s)), e0 = Math.max(s0, Math.min(text.length, word.e));
      if (e0 <= s0) { e0 = s0; while (e0 < text.length && !/\s/.test(text.charAt(e0))) e0++; }
      var before = text.substring(0, s0), w = text.substring(s0, e0), after = text.substring(e0);
      if (mode === 'dim') return [before, w, jsx0(Text, { style: { color: dimColor(style) }, children: after }, 'htc-a')];
      return [before, jsx0(Text, { style: mode === 'underline' ? WORD_UNDER : WORD_BOLD, children: w }, 'htc-w'), after];
    }
    RN.DeviceEventEmitter.addListener('htcWord', function (msg) {
      try {
        var o = JSON.parse(String(msg));
        word = { k: String(o.k), s: Number(o.s) || 0, e: Number(o.e) || 0 };
        if (Number(o.c) > 0) g.__htcCps = Number(o.c);
        var copy = wordSubs.slice();
        for (var i = 0; i < copy.length; i++) { try { copy[i](); } catch (e) {} }
      } catch (e) {}
    });

    // App 3.0.0: memo(Line) renders one line of ReadContent, {index, text, textStyle, activeStyle,
    // onLineLayout} -> <Text onLayout style>. The wrapper tells that Text which line it is.
    function wrapLine(memo) {
      var orig = memo.type;
      var Line = function (props) {
        // The line being read renders again for every word the engine reports (word highlight).
        var active = !!(props && props.activeStyle);
        var tick = React.useState(0);
        var setTick = tick[1];
        React.useEffect(function () {
          if (!active) return undefined;
          var fn = function () { setTick(function (n) { return (n + 1) % 1000000; }); };
          wordSubs.push(fn);
          return function () {
            var i = wordSubs.indexOf(fn);
            if (i >= 0) wordSubs.splice(i, 1);
          };
        }, [active]);
        var saved = lineIndex, savedActive = lineActive;
        lineIndex = props && typeof props.index === 'number' ? props.index : -1;
        lineActive = active;
        if (lineIndex >= 0 && typeof props.text === 'string') lineTexts[lineIndex] = props.text;
        try { return orig.apply(this, arguments); } finally { lineIndex = saved; lineActive = savedActive; }
      };
      for (var k in orig) { if (k.indexOf('__htc') === 0) Line[k] = orig[k]; }
      Line.__htcTap = true;
      memo.type = Line;
      log('reader lines hooked');
    }

    function wrapVoiceBar(memo) {
      var orig = memo.type;
      var VoiceBar = function (props) {
        React.useEffect(function () {
          barMounted++;
          return function () {
            barMounted--;
            if (barMounted <= 0) { barMounted = 0; bar.play = null; bar.playing = false; pending = null; }
          };
        }, []);
        barDepth++;
        try { return orig.apply(this, arguments); } finally { barDepth--; }
      };
      for (var k in orig) { if (k.indexOf('__htc') === 0) VoiceBar[k] = orig[k]; }
      VoiceBar.__htcTap = true;
      memo.type = VoiceBar;
      try { icons = g.__htcR('icons'); } catch (e) { icons = null; }
      log('voice bar hooked' + (icons ? '' : ' (no icons)'));
    }

    // One line: <Text key={index} onLayout? style={[line, active && highlight]}> rendered by ReadContent
    // (2.1.0), or the Text of a Line component (3.0.0).
    function lineProps(props, index, active) {
      var extra = {};
      if (S('tap.enabled', true)) {
        extra.onPress = function (e) { onLineShortPress(index, e); };
        extra.onLongPress = function (e) { onLineLongPress(index, e); };
      }
      if (typeof props.children === 'string') lineTexts[index] = props.children;
      var onLayout = props.onLayout;
      if (typeof onLayout === 'function') {
        extra.onLayout = function (e) {
          try {
            positions[index] = e.nativeEvent.layout.y;
            heights[index] = e.nativeEvent.layout.height;
          } catch (x) {}
          return onLayout.apply(this, arguments);
        };
      }
      var onTextLayout = props.onTextLayout;
      extra.onTextLayout = function (e) {
        try { textLayouts[index] = e.nativeEvent.lines; } catch (x) {}
        if (typeof onTextLayout === 'function') return onTextLayout.apply(this, arguments);
        return undefined;
      };
      if (active && typeof props.children === 'string') {
        var spans = karaoke(props.children, props.style);
        if (spans) extra.children = spans;
      }
      if (map) {
        // The reader highlights the shown line with the number of the voice line: fix it.
        var style = props.style;
        if (style && typeof style.length === 'number' && style.length === 2) {
          if (style[1]) activeStyle = style[1];
          var on = index === toShown(V.getState().activeLine);
          if (!!style[1] !== on && (!on || activeStyle)) extra.style = [style[0], on ? activeStyle : false];
        }
      }
      return assign(props, extra);
    }

    function isReaderScroll(props) {
      var c = props.children;
      if (!readContent || !c || typeof c.length !== 'number') return false;
      for (var i = 0; i < c.length; i++) {
        if (c[i] && c[i].type === readContent) return true;
      }
      return false;
    }

    function dragHandler(orig) {
      return function () {
        try { cancelAutoReturn(); if (V.getState().isVoiceBarOpen) setDetached(true); } catch (e) {}
        if (typeof orig === 'function') return orig.apply(this, arguments);
        return undefined;
      };
    }

    function dragEndHandler(orig) {
      return function () {
        try { scheduleAutoReturn(); } catch (e) {}
        if (typeof orig === 'function') return orig.apply(this, arguments);
        return undefined;
      };
    }

    // Room after the last line, so that the line being read can go above the voice bar (or to the
    // middle) also at the end of what the reader has rendered so far.
    function contentStyle(orig) {
      try {
        var cover = barHeight > 0 ? barHeight : 90;
        var extra = cover + 32;
        if (S('tap.followPosition', 'bottom') === 'middle' && viewHeight > 0) extra = Math.max(extra, Math.round((viewHeight - cover) / 2) + cover);
        var flat = orig ? RN.StyleSheet.flatten(orig) : null;
        var base = flat && typeof flat.paddingBottom === 'number' ? flat.paddingBottom : 0;
        return [orig, { paddingBottom: base + extra }];
      } catch (e) { return orig; }
    }

    function viewLayoutHandler(orig) {
      return function (e) {
        try { var h = e.nativeEvent.layout.height; if (h > 0) viewHeight = h; } catch (x) {}
        if (typeof orig === 'function') return orig.apply(this, arguments);
        return undefined;
      };
    }

    function scrollHandler(orig) {
      return function (e) {
        try { scrollY = e.nativeEvent.contentOffset.y; } catch (x) {}
        if (typeof orig === 'function') return orig.apply(this, arguments);
        return undefined;
      };
    }

    function barLayoutHandler(orig) {
      return function (e) {
        try {
          var h = e.nativeEvent.layout.height;
          if (h > 0 && h !== barHeight) { barHeight = h; notify(); }
        } catch (x) {}
        if (typeof orig === 'function') return orig.apply(this, arguments);
        return undefined;
      };
    }

    // Returns {type, props, wrap} to change the element, or null to keep it.
    function inspect(type, props, key) {
      if (!type) return null;
      if (typeof type === 'object' && type.type && typeof type.type === 'function'
          && type.type.name === 'VoiceBar' && !type.type.__htcTap) {
        wrapVoiceBar(type);
        return null;
      }
      if (typeof type === 'function') {
        if (type.name === 'ReadEngine') {
          if (!voiceReplaced && props && typeof props.content === 'string') rawText = props.content;
          return null;
        }
        if (type.name === 'ReadContent' && !type.__htcTap) {
          if (!readContent || readContent.__htcOrig !== type) readContent = wrapReadContent(type);
          return { type: readContent, props: props };
        }
      }
      if (contentDepth > 0 && typeof type === 'object' && typeof type.type === 'function'
          && type.type.name === 'Line' && !type.type.__htcTap) {
        wrapLine(type);
        return null;
      }
      if (!props || typeof props !== 'object') return null;
      if (type === ScrollView && !S('tap.enabled', true)) return null;
      if (type === Text) {
        if (contentDepth > 0 && typeof key === 'number') return { type: type, props: lineProps(props, key, false) };
        if (lineIndex >= 0) return { type: type, props: lineProps(props, lineIndex, lineActive) };
        return null;
      }
      if (type === ScrollView) {
        if (isReaderScroll(props)) {
          return { type: type, props: assign(props, { onScrollBeginDrag: dragHandler(props.onScrollBeginDrag),
            onScrollEndDrag: dragEndHandler(props.onScrollEndDrag),
            onLayout: viewLayoutHandler(props.onLayout),
            onScroll: scrollHandler(props.onScroll),
            contentContainerStyle: contentStyle(props.contentContainerStyle),
            scrollEventThrottle: props.scrollEventThrottle || 100 }), wrap: true };
        }
        return null;
      }
      if (barDepth > 0) {
        if (icons && typeof props.onPress === 'function') {
          var child = props.children;
          var ct = child && typeof child === 'object' ? child.type : null;
          if (ct && (ct === icons.Play || ct === icons.Pause)) {
            bar.play = props.onPress;
            bar.playing = ct === icons.Pause;
            if (pending && !pending.started && !bar.playing) {
              pending.started = true;
              setTimeout(startPending, 0);
            }
            if (bar.playing && restarting) {
              restarting = 0;
              if (queued !== null) {
                var q = queued, qp = queuedPos;
                queued = null;
                setTimeout(function () { onLineTap(toShown(q), qp); }, 0);
              }
            }
          }
        } else if (type === AnimatedView) {
          // Root of the voice bar: style [barContainer, {transform: [{translateY}]}].
          var st = props.style;
          if (st && typeof st.length === 'number' && st.length === 2 && st[1] && st[1].transform) {
            return { type: type, props: assign(props, { onLayout: barLayoutHandler(props.onLayout) }) };
          }
        }
      }
      return null;
    }

    function wrapJsx(orig) {
      return function (type, props, key) {
        var r = null;
        try { r = inspect(type, props, key); } catch (e) { log('inspect failed ' + e); }
        if (!r) return orig.apply(this, arguments);
        var args = Array.prototype.slice.call(arguments);
        args[0] = r.type;
        args[1] = r.props;
        var el = orig.apply(this, args);
        if (r.wrap) {
          try {
            return jsxs0(View, { style: WRAP_STYLE, children: [el, jsx0(ReturnButton, {}, 'htc-return')] });
          } catch (e) { log('wrap failed ' + e); }
        }
        return el;
      };
    }

    // For the speed menu (time left in the chapter): lines of the reader and the line being read.
    g.__htcReaderLines = function () {
      try { return { texts: lineTexts, active: toShown(V.getState().activeLine) }; } catch (e) { return null; }
    };

    var jsx = wrapJsx(jsx0);
    var jsxs = wrapJsx(jsxs0);
    JSX.jsx = jsx;
    JSX.jsxs = jsxs;
    if (JSX.jsx !== jsx) { log('jsx not writable'); return; }

    V.subscribe(function (s, prev) {
      try {
        if (prev && prev.isVoiceBarOpen && !s.isVoiceBarOpen) {
          pending = null;
          restarting = 0;
          queued = null;
          setDetached(false);
        }
      } catch (e) {}
    });
    log('ready');
  } catch (e) {
    log('init failed ' + e);
  }
})();
