// java: app/hoitruyenchu/extension/itruyenchu/patches/speed/RememberSpeedPatch.java
(function () {
  var TAG = '[HTC-Speed] ';
  function log(m) { try { var s0 = globalThis.__htcS; if (s0 && s0.debug === false) return; console.log(TAG + m); } catch (e) {} }
  function S(k, d) { try { var s0 = globalThis.__htcS; var v = s0 ? s0[k] : undefined; return v === undefined || v === null ? d : v; } catch (e) { return d; } }
  try {
    var g = typeof globalThis !== 'undefined' ? globalThis : this;
    if (typeof g.__r !== 'function') { log('no __r'); return; }
    var M = g.__htcR('voice');
    var V = M && M.useTTSVoiceStore;
    if (!V || typeof V.getState !== 'function' || typeof V.getState().setSpeed !== 'function'
        || !V.persist) { log('voice store not found'); return; }
    var done = false;
    function restore() {
      if (done) return;
      done = true;
      if (!S('speed.enabled', true)) { log('turned off in the settings'); return; }
      try {
        var s = V.getState();
        var saved = s.spead;
        if (typeof saved !== 'number' || !(saved >= 0.1 && saved <= 4)) { log('no old saved speed, speed ' + s.speed); return; }
        if (saved === s.speed) { log('speed ' + saved); return; }
        s.setSpeed(saved);
        log('speed restored ' + saved);
      } catch (e) { log('restore failed ' + e); }
    }
    var hydrated = false;
    try { hydrated = typeof V.persist.hasHydrated !== 'function' || V.persist.hasHydrated(); } catch (e) {}
    if (hydrated) restore();
    else if (typeof V.persist.onFinishHydration === 'function') {
      var unsub = V.persist.onFinishHydration(function () {
        restore();
        try { if (typeof unsub === 'function') unsub(); } catch (e) {}
      });
      // Hydration may end between the check and the subscription.
      try { if (V.persist.hasHydrated()) restore(); } catch (e) {}
    } else log('no onFinishHydration');

    // Speed menu of the voice bar. App 3.0.0 SpeedControl {visible, currentSpeed, onSelect, onClose}:
    // Modal > TouchableOpacity(overlay, onPress onClose) > View(speedModal) > one TouchableOpacity per
    // speed (key = speed, onPress onSelect(speed) + onClose(), child Text [speed.toFixed(2), 'x']).
    // Setting speed.menu: "youtube" the View is replaced by a YouTube-like panel (big speed, - slider +,
    // quick choice buttons); "list" the app's list (+ the quick choices when speed.extraLevels) with the
    // panel's controls above it. Range and steps: speed.min / speed.max / speed.step (hundredths).
    var JSX = g.__htcR('jsx');
    var RN = g.__htcR('rn');
    var React = g.__htcR('react');
    if (!JSX || typeof JSX.jsx !== 'function' || typeof JSX.jsxs !== 'function' || !RN || !RN.View
        || !React || typeof React.useState !== 'function' || !RN.PanResponder) {
      log('jsx not found, no speed menu'); return;
    }
    var jsx0 = JSX.jsx, jsxs0 = JSX.jsxs;
    var View = RN.View, Text = RN.Text, Touch = RN.TouchableOpacity;
    var storage = null;
    try { storage = V.persist.getOptions().storage; } catch (e) {}

    function round2(v) { return Math.round(v * 100) / 100; }
    function range() {
      var min = Number(S('speed.min', 50)) / 100, max = Number(S('speed.max', 250)) / 100;
      var step = Number(S('speed.step', 5)) / 100;
      if (!(min >= 0.1)) min = 0.1;
      if (!(max > min)) max = Math.max(min + 0.5, 2.5);
      if (max > 4) max = 4;
      if (!(step >= 0.01)) step = 0.05;
      return { min: round2(min), max: round2(max), step: round2(step) };
    }
    function clampSpeed(v, r) {
      var n = Math.round((v - r.min) / r.step);
      var out = round2(r.min + n * r.step);
      if (out < r.min) out = r.min;
      if (out > r.max) out = r.max;
      return out;
    }

    var recent = [];
    if (storage) {
      try {
        var rr = storage.getItem('htc_recent_speeds');
        var take = function (v) { if (v && typeof v.length === 'number') recent = v.slice(0, 6); };
        if (rr && typeof rr.then === 'function') rr.then(take, function () {}); else take(rr);
      } catch (e) {}
    }
    function remember(v) {
      try {
        var out = [v];
        for (var i = 0; i < recent.length && out.length < 6; i++) if (recent[i] !== v) out.push(recent[i]);
        recent = out;
        if (storage) { var p = storage.setItem('htc_recent_speeds', recent); if (p && p.then) p.then(null, function () {}); }
      } catch (e) {}
    }

    // Quick choices (setting speed.chipsMode): "auto" every speed.chipStep from min to max, "custom"
    // the list speed.chips, "recent" 1.0 + the last speeds used. Always contains 1.0 when in range.
    function chips(r) {
      var mode = S('speed.chipsMode', 'auto'), out = [], seen = {}, i, v;
      function add(x) {
        x = round2(Number(x));
        if (!(x >= 0.1) || x < r.min - 0.001 || x > r.max + 0.001 || seen[x.toFixed(2)]) return;
        seen[x.toFixed(2)] = true;
        out.push(x);
      }
      if (mode === 'custom') {
        var parts = String(S('speed.chips', '')).split(/[,;\s]+/);
        for (i = 0; i < parts.length; i++) if (parts[i]) add(parseFloat(parts[i].replace(',', '.')));
      } else if (mode === 'recent') {
        add(1);
        for (i = 0; i < recent.length; i++) add(recent[i]);
      } else {
        var cs = Number(S('speed.chipStep', 25)) / 100;
        if (!(cs >= 0.05)) cs = 0.25;
        for (v = r.min; v <= r.max + 0.001 && out.length < 40; v = round2(v + cs)) add(v);
      }
      add(1);
      out.sort(function (a, b) { return a - b; });
      return out;
    }

    function vibrate() { try { if (RN.Vibration) RN.Vibration.vibrate(12); } catch (e) {} }

    // Estimated time left in the chapter at speed v (lines of the reader, chars/s measured by Java).
    function remaining(v) {
      try {
        var info = typeof g.__htcReaderLines === 'function' ? g.__htcReaderLines() : null;
        if (!info || !info.texts || !info.texts.length) return null;
        var chars = 0;
        for (var i = Math.max(0, info.active); i < info.texts.length; i++) chars += info.texts[i] ? String(info.texts[i]).length : 0;
        var cps = Number(g.__htcCps) > 0 ? Number(g.__htcCps) : 14;
        var sec = chars / (cps * v);
        if (!(sec > 0)) return null;
        var min = Math.round(sec / 60);
        return 'Còn ~' + (min < 1 ? '< 1' : min) + ' phút ở ' + v.toFixed(2) + 'x';
      } catch (e) { return null; }
    }

    var ACCENT = '#f0a93b';
    var PANEL = { paddingHorizontal: 16, paddingTop: 18, paddingBottom: 14 };
    var BIG = { color: '#ffffff', fontSize: 30, fontWeight: '700', textAlign: 'center' };
    var SMALL = { color: 'rgba(255,255,255,0.6)', fontSize: 13, textAlign: 'center', marginTop: 2 };
    var ROW = { flexDirection: 'row', alignItems: 'center', marginTop: 14 };
    var ROUND = { width: 44, height: 44, borderRadius: 22, backgroundColor: 'rgba(255,255,255,0.12)',
      alignItems: 'center', justifyContent: 'center' };
    var ROUND_TEXT = { color: '#ffffff', fontSize: 26, lineHeight: 30, fontWeight: '400' };
    var TRACK_BOX = { flex: 1, height: 44, justifyContent: 'center', marginHorizontal: 12 };
    var TRACK = { height: 4, borderRadius: 2, backgroundColor: 'rgba(255,255,255,0.25)' };
    var CHIP = { paddingHorizontal: 16, paddingVertical: 10, borderRadius: 20, marginRight: 8,
      backgroundColor: 'rgba(255,255,255,0.12)', minWidth: 58, alignItems: 'center' };
    var CHIP_ON = { backgroundColor: '#ffffff' };
    var CHIP_TEXT = { color: '#ffffff', fontSize: 15, fontWeight: '500' };
    var CHIP_TEXT_ON = { color: '#111111' };
    var NORMAL = { color: 'rgba(255,255,255,0.6)', fontSize: 11, marginTop: 4, textAlign: 'center' };
    var RESET = { position: 'absolute', right: 0, top: 4, paddingHorizontal: 10, paddingVertical: 6,
      borderRadius: 14, backgroundColor: 'rgba(255,255,255,0.12)' };

    // Slider: track + filled part + thumb, dragged with a PanResponder. Calls onMove(v) while
    // dragging and onCommit(v) when released. Snaps to marks (1.0x, quick choices) when near.
    function Slider(props) {
      var r = props.range;
      var widthRef = React.useRef(0);
      var startX = React.useRef(0);
      var last = React.useRef(props.value);
      var snapped = React.useRef(null);
      var cb = React.useRef(props);
      cb.current = props;
      var valueAt = function (x) {
        var w = widthRef.current;
        if (!(w > 0)) return last.current;
        var f = Math.max(0, Math.min(1, x / w));
        var v = clampSpeed(r.min + f * (r.max - r.min), r);
        if (S('speed.snap', true)) {
          var marks = cb.current.marks || [], near = null, tol = Math.max(r.step * 0.9, (r.max - r.min) * 0.025);
          for (var i = 0; i < marks.length; i++) if (Math.abs(marks[i] - v) <= tol) { near = marks[i]; break; }
          if (near !== null) {
            if (snapped.current !== near) vibrate();
            snapped.current = near;
            v = near;
          } else snapped.current = null;
        }
        return v;
      };
      var responder = React.useMemo(function () {
        return RN.PanResponder.create({
          onStartShouldSetPanResponder: function () { return true; },
          onMoveShouldSetPanResponder: function () { return true; },
          onPanResponderTerminationRequest: function () { return false; },
          onPanResponderGrant: function (e) {
            startX.current = e.nativeEvent.locationX;
            last.current = valueAt(startX.current);
            cb.current.onMove(last.current);
          },
          onPanResponderMove: function (e, gs) {
            var v = valueAt(startX.current + gs.dx);
            if (v !== last.current) { last.current = v; cb.current.onMove(v); }
          },
          onPanResponderRelease: function () { cb.current.onCommit(last.current); },
          onPanResponderTerminate: function () { cb.current.onCommit(last.current); }
        });
      }, []);
      var w = widthRef.current;
      var f = (props.value - r.min) / (r.max - r.min);
      if (!(f >= 0)) f = 0;
      if (f > 1) f = 1;
      var thumbLeft = w > 0 ? f * w - 10 : 0;
      var children = [
        jsx0(View, { pointerEvents: 'none', style: TRACK }, 't'),
        jsx0(View, { pointerEvents: 'none', style: [TRACK, { position: 'absolute', left: 0, width: w > 0 ? f * w : 0, backgroundColor: '#ffffff' }] }, 'f'),
        jsx0(View, { pointerEvents: 'none', style: { position: 'absolute', left: thumbLeft, width: 20, height: 20, borderRadius: 10, backgroundColor: '#ffffff' } }, 'k')
      ];
      var forceState = React.useState(0);
      return jsxs0(View, assignAll(responder.panHandlers, {
        style: TRACK_BOX,
        onLayout: function (e) {
          try { var nw = e.nativeEvent.layout.width; if (nw > 0 && nw !== widthRef.current) { widthRef.current = nw; forceState[1](function (n) { return n + 1; }); } } catch (x) {}
        },
        children: children
      }));
    }

    function assignAll(a, b) {
      var out = {}, k;
      for (k in a) out[k] = a[k];
      for (k in b) out[k] = b[k];
      return out;
    }

    // Long press on - / + keeps stepping.
    function StepButton(props) {
      var timer = React.useRef(null);
      var stop = function () { if (timer.current) { clearInterval(timer.current); timer.current = null; } };
      React.useEffect(function () { return stop; }, []);
      return jsx0(Touch, {
        style: ROUND,
        onPress: function () { props.onStep(); props.onCommit(); },
        onLongPress: function () { stop(); timer.current = setInterval(function () { props.onStep(); }, 120); },
        onPressOut: function () { if (timer.current) { stop(); props.onCommit(); } },
        accessibilityLabel: props.label,
        children: jsx0(Text, { style: ROUND_TEXT, children: props.text })
      });
    }

    // The panel. props: {speed, onSelect, style (speedModal), list (app items, "list" mode)}.
    function SpeedPanel(props) {
      var r = range();
      var st = React.useState(clampSpeed(Number(props.speed) || 1, r));
      var value = st[0], setValue = st[1];
      var valueRef = React.useRef(value);
      valueRef.current = value;
      var marks = chips(r);
      var commit = function (v) {
        v = clampSpeed(v, r);
        setValue(v);
        if (Math.abs(v - Number(props.speed)) < 0.001) return;
        log('speed ' + v);
        remember(v);
        try { if (typeof props.onSelect === 'function') props.onSelect(v); } catch (e) { log('select failed ' + e); }
      };
      var step = function (dir) {
        var v = clampSpeed(valueRef.current + dir * r.step, r);
        valueRef.current = v;
        setValue(v);
      };
      var header = [jsx0(Text, { style: BIG, children: value.toFixed(2) + 'x' }, 'big')];
      if (S('speed.resetButton', false) && Math.abs(value - 1) > 0.001) {
        header.push(jsx0(Touch, { style: RESET, onPress: function () { commit(1); },
          children: jsx0(Text, { style: { color: '#ffffff', fontSize: 13 }, children: '1.0x' }) }, 'reset'));
      }
      var kids = [jsxs0(View, { children: header }, 'head')];
      if (S('speed.remaining', false)) {
        var left = remaining(value);
        if (left) kids.push(jsx0(Text, { style: SMALL, children: left }, 'left'));
      }
      kids.push(jsxs0(View, { style: ROW, children: [
        jsx0(StepButton, { text: '−', label: 'Giảm tốc độ', onStep: function () { step(-1); },
          onCommit: function () { commit(valueRef.current); } }, 'minus'),
        jsx0(Slider, { range: r, value: value, marks: marks, onMove: function (v) { setValue(v); },
          onCommit: function (v) { commit(v); } }, 'slider'),
        jsx0(StepButton, { text: '+', label: 'Tăng tốc độ', onStep: function () { step(1); },
          onCommit: function () { commit(valueRef.current); } }, 'plus')
      ] }, 'row'));
      if (props.list) {
        kids.push(jsx0(View, { style: { height: 12 } }, 'gap'));
        kids.push(props.list);
      } else {
        var chipEls = [];
        for (var i = 0; i < marks.length; i++) {
          (function (v) {
            var on = Math.abs(v - value) < 0.001;
            var inner = [jsx0(Text, { style: [CHIP_TEXT, on && CHIP_TEXT_ON], children: v === 1 ? '1.0' : String(v) }, 'v')];
            chipEls.push(jsxs0(View, { style: { alignItems: 'center' }, children: [
              jsx0(Touch, { style: [CHIP, on && CHIP_ON], onPress: function () { commit(v); }, children: inner[0] }, 'c'),
              v === 1 ? jsx0(Text, { style: NORMAL, children: 'Bình thường' }, 'n') : jsx0(View, { style: { height: 17 } }, 'n')
            ] }, String(v)));
          })(marks[i]);
        }
        kids.push(jsx0(RN.ScrollView, {
          horizontal: true, showsHorizontalScrollIndicator: false, style: { marginTop: 16 },
          contentContainerStyle: { paddingRight: 8 }, keyboardShouldPersistTaps: 'handled',
          children: jsxs0(View, { style: { flexDirection: 'row' }, children: chipEls })
        }, 'chips'));
      }
      // Touches on the panel must not reach the overlay behind it (which closes the menu).
      return jsxs0(View, {
        style: [props.style, PANEL, { alignSelf: 'stretch' }],
        onStartShouldSetResponder: function () { return true; },
        children: kids
      });
    }

    // Also used by the mini player (player script).
    g.__htcSpeedPanel = SpeedPanel;

    var picker = null;   // props of the SpeedControl rendering, null outside
    function wrapPicker(orig) {
      var SpeedControl = function (props) {
        var saved = picker;
        picker = props || null;
        try { return orig.apply(this, arguments); } finally { picker = saved; }
      };
      SpeedControl.__htcSpeed = true;
      SpeedControl.__htcOrig = orig;
      return SpeedControl;
    }
    var wrapped = null;
    var lastActive = null;  // style of the selected item, kept for when an extra speed is selected

    // The app's items, plus the quick choices ("list" mode with speed.extraLevels).
    function items(children, withExtra) {
      if (!picker || !children || typeof children.length !== 'number' || children.length < 2) return null;
      var first = children[0];
      if (!first || !first.props || typeof first.props.onPress !== 'function' || first.key == null) return null;
      var have = {}, activeStyle = null, baseStyle = null, textStyle = null, i;
      for (i = 0; i < children.length; i++) {
        var c = children[i];
        var v = c && c.key != null ? parseFloat(c.key) : NaN;
        if (isNaN(v)) return null;
        have[v.toFixed(2)] = true;
        var st = c.props && c.props.style;
        if (st && typeof st.length === 'number') { baseStyle = st[0]; if (st[1]) activeStyle = st[1]; }
        var t = c.props && c.props.children;
        if (t && t.props) textStyle = t.props.style;
      }
      var current = Number(picker.currentSpeed);
      var out = [];
      for (i = 0; i < children.length; i++) out.push({ v: parseFloat(children[i].key), el: children[i] });
      if (withExtra) {
        var add = chips(range());
        if (current > 0 && !have[current.toFixed(2)]) add.push(current);
        var onSelect = picker.onSelect, onClose = picker.onClose;
        if (activeStyle) lastActive = activeStyle;
        else activeStyle = lastActive || { backgroundColor: 'rgba(255,255,255,0.1)', borderRadius: 12 };
        for (i = 0; i < add.length; i++) {
          var sp = add[i];
          if (have[sp.toFixed(2)]) continue;
          have[sp.toFixed(2)] = true;
          (function (speed) {
            var label = jsxs0(Text, { style: textStyle, children: [speed.toFixed(2), 'x'] });
            var el = jsx0(Touch, {
              style: [baseStyle, speed === current && activeStyle],
              // Like the app's items: onSelect(speed) then onClose().
              onPress: function () {
                remember(speed);
                try { if (typeof onSelect === 'function') onSelect(speed); } catch (e) { log('select failed ' + e); }
                try { if (typeof onClose === 'function') onClose(); } catch (e) {}
              },
              children: label
            }, String(speed));
            out.push({ v: speed, el: el });
          })(sp);
        }
      }
      out.sort(function (a, b) { return a.v - b.v; });
      var result = [];
      for (i = 0; i < out.length; i++) result.push(out[i].el);
      return result;
    }

    function wrapJsx(orig) {
      return function (type, props) {
        try {
          if (type && typeof type === 'object' && typeof type.type === 'function'
              && type.type.name === 'SpeedControl' && !type.type.__htcSpeed) {
            // memo(SpeedControl): wrap the inner function once, in place.
            type.type = wrapPicker(type.type);
            log('speed picker hooked (memo)');
          }
          if (typeof type === 'function' && type.name === 'SpeedControl' && !type.__htcSpeed) {
            if (!wrapped || wrapped.__htcOrig !== type) { wrapped = wrapPicker(type); log('speed picker hooked'); }
            var a = Array.prototype.slice.call(arguments);
            a[0] = wrapped;
            return orig.apply(this, a);
          }
          if (picker && type === RN.View && props && S('speed.enabled', true)) {
            var menu = S('speed.menu', 'youtube');
            var list = items(props.children, menu === 'list' && S('speed.extraLevels', true));
            if (list) {
              var p = picker;
              if (menu === 'list') {
                var flat = RN.StyleSheet.flatten(props.style) || {};
                var listStyle = { flexDirection: flat.flexDirection, flexWrap: flat.flexWrap,
                  justifyContent: flat.justifyContent, alignItems: flat.alignItems, gap: flat.gap };
                var listEl = jsx0(View, { style: listStyle, children: list }, 'list');
                return jsx0(SpeedPanel, { speed: p.currentSpeed, onSelect: p.onSelect, style: props.style, list: listEl });
              }
              return jsx0(SpeedPanel, { speed: p.currentSpeed, onSelect: p.onSelect, style: props.style });
            }
          }
        } catch (e) { log('picker failed ' + e); }
        return orig.apply(this, arguments);
      };
    }
    var jsx = wrapJsx(jsx0), jsxs = wrapJsx(jsxs0);
    JSX.jsx = jsx;
    JSX.jsxs = jsxs;
    log('ready');
  } catch (e) { log('error ' + e); }
})();
