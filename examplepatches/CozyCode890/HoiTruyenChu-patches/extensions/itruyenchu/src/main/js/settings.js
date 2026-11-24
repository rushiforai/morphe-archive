// java: app/hoitruyenchu/extension/itruyenchu/patches/shared/SettingsScript.java
(function () {
  var TAG = '[HTC-Settings] ';
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
        || !RN || !RN.DeviceEventEmitter || !RN.View || !RN.Text || !RN.TouchableOpacity
        || !V || typeof V.getState !== 'function') { log('modules not found'); return; }
    var storage = null;
    try { storage = V.persist.getOptions().storage; } catch (e) {}
    var jsx0 = JSX.jsx, jsxs0 = JSX.jsxs;
    var View = RN.View, Text = RN.Text, Touch = RN.TouchableOpacity;
    var icons = null;
    function loadIcons() { if (!icons) { try { icons = g.__htcR('icons'); } catch (e) { icons = null; } } return icons; }

    // ---- Java <-> JS
    function cmd(name, data) {
      if (!storage) { log('no storage for ' + name); return; }
      try {
        var p = storage.setItem('htc_cmd', { cmd: name, data: data === undefined ? null : data, t: Date.now() });
        if (p && typeof p.then === 'function') p.then(null, function () {});
      } catch (e) { log('command failed ' + e); }
    }
    g.__htcCmd = cmd;
    if (!g.__htcSL) g.__htcSL = [];
    RN.DeviceEventEmitter.addListener('htcSettingsChanged', function (json) {
      try {
        g.__htcS = JSON.parse(String(json));
        var l = g.__htcSL.slice();
        for (var i = 0; i < l.length; i++) { try { l[i](g.__htcS); } catch (e) {} }
        notify();
        log('settings updated');
      } catch (e) { log('bad settings ' + e); }
    });

    // ---- Voice bar play button
    var depth = 0, mounted = 0;
    var bar = { play: null, playing: false };
    g.__htcBar = {
      ready: function () { return mounted > 0 && typeof bar.play === 'function'; },
      playing: function () { return mounted > 0 && bar.playing; },
      press: function () { if (mounted > 0 && typeof bar.play === 'function') { bar.play(); return true; } return false; }
    };
    function wrapVoiceBar(memo) {
      var orig = memo.type;
      var VoiceBar = function (props) {
        React.useEffect(function () {
          mounted++;
          return function () { mounted--; if (mounted <= 0) { mounted = 0; bar.play = null; bar.playing = false; } };
        }, []);
        depth++;
        try { return orig.apply(this, arguments); } finally { depth--; }
      };
      for (var k in orig) { if (k.indexOf('__htc') === 0) VoiceBar[k] = orig[k]; }
      VoiceBar.__htcCore = true;
      memo.type = VoiceBar;
      loadIcons();
      log('voice bar hooked');
    }

    var lastPause = 0;
    var sleep = { option: 'off', endAt: 0, chapters: 0 };
    var listeners = [];
    function notify() {
      var l = listeners.slice();
      for (var i = 0; i < l.length; i++) { try { l[i](); } catch (e) {} }
    }
    RN.DeviceEventEmitter.addListener('htcCommand', function (json) {
      try {
        var c = JSON.parse(String(json));
        if (c.cmd === 'pause') {
          if (c.id && c.id === lastPause) return;
          lastPause = c.id;
          if (mounted > 0 && bar.playing && typeof bar.play === 'function') { log('pause (' + (c.sleep ? 'sleep timer' : 'system') + ')'); bar.play(); }
        } else if (c.cmd === 'sleep') {
          sleep = { option: c.option || 'off', endAt: c.endAt || 0, chapters: c.chapters || 0 };
          notify();
        } else if (c.cmd === 'speed') {
          var v = Number(c.value);
          if (v >= 0.1 && v <= 4 && typeof V.getState().setSpeed === 'function') { V.getState().setSpeed(v); log('speed ' + v); }
        }
      } catch (e) { log('command failed ' + e); }
    });

    // ---- Sleep timer button (background reading patch), next to the speed button
    function sleepLabel() {
      var o = sleep.option;
      if (!o || o === 'off') return null;
      if (o.charAt(0) === 'm') {
        var left = Math.max(1, Math.ceil((sleep.endAt - Date.now()) / 60000));
        return left + "'";
      }
      return Math.max(1, sleep.chapters) + ' ch';
    }
    function SleepButton(props) {
      var st = React.useState(0);
      var setTick = st[1];
      React.useEffect(function () {
        var fn = function () { setTick(function (n) { return n + 1; }); };
        listeners.push(fn);
        var timer = setInterval(fn, 30000);
        return function () {
          clearInterval(timer);
          var i = listeners.indexOf(fn);
          if (i >= 0) listeners.splice(i, 1);
        };
      }, []);
      if (!S('applied.bg', false) || !S('bg.enabled', true) || !S('bg.sleepButton', true)) return null;
      var ic = loadIcons();
      var Icon = ic && (ic.Moon || ic.Timer || ic.AlarmClock || ic.Clock);
      var label = sleepLabel();
      var color = props.color || '#888888';
      var active = label ? '#f5a524' : color;
      var children = [];
      if (Icon) children.push(jsx0(Icon, { size: label ? 16 : 18, color: active }, 'i'));
      else children.push(jsx0(Text, { style: { color: active, fontSize: 14 }, children: 'Zz' }, 'i'));
      if (label) children.push(jsx0(Text, { numberOfLines: 1, style: { color: active, fontSize: 10, fontWeight: '700', marginTop: 1 }, children: label }, 't'));
      return jsxs0(Touch, {
        onPress: function () { cmd('sleep'); },
        hitSlop: 8,
        accessibilityLabel: 'H\u1eb9n gi\u1edd t\u1eaft',
        style: { alignItems: 'center', justifyContent: 'center', minWidth: 30, marginLeft: 6, paddingVertical: 2 },
        children: children
      });
    }
    g.__htcSleepButton = SleepButton;
    // The speed button: TouchableOpacity > Text [speed.toFixed(..), 'x'].
    function speedButtonColor(props) {
      var t = props && props.children;
      if (!t || t.type !== Text || !t.props) return null;
      var c = t.props.children;
      if (!c || typeof c.length !== 'number' || c[c.length - 1] !== 'x') return null;
      var style = t.props.style;
      var flat = null;
      try { flat = RN.StyleSheet.flatten(style); } catch (e) {}
      return (flat && flat.color) || '#888888';
    }

    // ---- Entry points of the settings screen
    var ROW_LABEL = 'C\u00e0i \u0111\u1eb7t HoiTruyenChu';
    function openSettings() { log('open settings'); cmd('open'); }
    function settingsIcon() {
      var ic = loadIcons();
      var Icon = ic && (ic.Settings || ic.Settings2 || ic.Cog || ic.Wrench);
      return Icon ? jsx0(Icon, {}) : null;
    }
    // Account tab: a View whose children are Rows, one of them "Đồng Bộ Truyện".
    function accountChildren(children) {
      if (!children || typeof children.length !== 'number') return null;
      var row = null;
      for (var i = 0; i < children.length; i++) {
        var c = children[i];
        if (!c || !c.props) continue;
        if (c.key === 'htc-settings') return null;
        if (c.props.label === '\u0110\u1ed3ng B\u1ed9 Truy\u1ec7n' && typeof c.type === 'function') row = c;
      }
      if (!row) return null;
      var out = Array.prototype.slice.call(children);
      out.push(jsx0(row.type, { icon: settingsIcon(), label: ROW_LABEL, onPress: openSettings, last: true }, 'htc-settings'));
      return out;
    }
    // Login screen (logged out): a link after "Quên mật khẩu?".
    function loginChildren(children) {
      if (!children || typeof children.length !== 'number') return null;
      var forgot = null, at = -1;
      for (var i = 0; i < children.length; i++) {
        var c = children[i];
        if (!c || !c.props) continue;
        if (c.key === 'htc-settings') return null;
        var t = c.props.children;
        if (t && t.props && t.props.children === 'Qu\u00ean m\u1eadt kh\u1ea9u?') { forgot = t; at = i; }
      }
      if (!forgot) return null;
      var out = Array.prototype.slice.call(children);
      out.splice(at + 1, 0, jsx0(Touch, {
        onPress: openSettings,
        style: { alignSelf: 'center', marginTop: 18, padding: 8 },
        children: jsx0(Text, { style: [forgot.props.style, { textDecorationLine: 'underline' }], children: ROW_LABEL })
      }, 'htc-settings'));
      return out;
    }

    // ---- Screen shown (navigation state) and the layer above the whole app (floating settings
    // button, mini player of other scripts: g.__htcOverlays = [component, ...]).
    var route = { name: '', path: [], params: null };
    var navRef = null;
    if (!g.__htcOverlays) g.__htcOverlays = [];
    g.__htcRoute = function () { return route; };
    g.__htcNav = function () { return navRef && navRef.current ? navRef.current : null; };
    g.__htcNotify = function () { notify(); };
    function focusedPath(state) {
      var names = [];
      for (var i = 0; state && state.routes && i < 10; i++) {
        var r = state.routes[typeof state.index === 'number' ? state.index : state.routes.length - 1];
        if (!r) break;
        names.push(r.name);
        state = r.state;
      }
      return names;
    }
    function onNavState(state) {
      try {
        var path = focusedPath(state);
        if (!path.length) return;
        var name = path[path.length - 1];
        if (name !== route.name) log('screen ' + path.join(' / '));
        route = { name: name, path: path, params: null };
        try {
          var cur = navRef && navRef.current && navRef.current.getCurrentRoute ? navRef.current.getCurrentRoute() : null;
          if (cur) route.params = cur.params || null;
        } catch (e) {}
        notify();
      } catch (e) { log('route failed ' + e); }
    }
    function isNavContainer(type) {
      return !!type && typeof type === 'object' && typeof type.render === 'function'
          && (type.render.name === 'NavigationContainerInner' || type.displayName === 'NavigationContainer');
    }
    function navProps(props) {
      var extra = { __htcNav: true };
      var prevChange = props.onStateChange, prevReady = props.onReady;
      if (props.ref && typeof props.ref === 'object') navRef = props.ref;
      else if (!props.ref) { navRef = React.createRef(); extra.ref = navRef; }
      extra.onStateChange = function (state) {
        onNavState(state);
        if (typeof prevChange === 'function') return prevChange.apply(this, arguments);
        return undefined;
      };
      extra.onReady = function () {
        try { if (navRef && navRef.current && navRef.current.getRootState) onNavState(navRef.current.getRootState()); } catch (e) {}
        if (typeof prevReady === 'function') return prevReady.apply(this, arguments);
        return undefined;
      };
      return assign(props, extra);
    }

    // Which screens show the settings button (setting gear.screens): "reader", "tabs" (the main
    // tabs), "home", "all".
    function isReaderRoute(name) { return /read/i.test(name || ''); }
    function isHomeRoute(name) { return /^(home|explore|discover)/i.test(name || ''); }
    function isTabRoute(r) {
      if (isReaderRoute(r.name)) return false;
      return r.path.length > 1 || /^(home|explore|discover|library|bookshelf|history|account|profile)/i.test(r.name || '');
    }
    function gearShown() {
      if (!S('gear.enabled', true)) return false;
      var where = S('gear.screens', 'reader');
      if (where === 'all') return !!route.name;
      if (where === 'reader') return isReaderRoute(route.name);
      if (where === 'home') return isHomeRoute(route.name);
      return isTabRoute(route);
    }

    // Red dot: a newer release of the patches on GitHub (checked once per app start).
    var update = { checked: false, newer: false };
    function newerThan(a, b) {
      var x = String(a || '').replace(/^v/, '').split('.'), y = String(b || '').split('.');
      for (var i = 0; i < 3; i++) {
        var p = parseInt(x[i] || '0', 10) || 0, q = parseInt(y[i] || '0', 10) || 0;
        if (p !== q) return p > q;
      }
      return false;
    }
    function checkUpdate() {
      if (update.checked || typeof fetch !== 'function') return;
      update.checked = true;
      var mine = S('patches.version', '');
      if (!mine) return;
      setTimeout(function () {
        try {
          fetch('https://api.github.com/repos/CozyCode890/HoiTruyenChu-patches/releases/latest',
              { headers: { Accept: 'application/vnd.github+json' } })
            .then(function (r) { return r.ok ? r.json() : null; })
            .then(function (j) {
              if (j && j.tag_name && newerThan(j.tag_name, mine)) { update.newer = true; log('update available ' + j.tag_name); notify(); }
            }, function () {});
        } catch (e) {}
      }, 8000);
    }

    function useTick() {
      var st = React.useState(0);
      var setTick = st[1];
      React.useEffect(function () {
        var fn = function () { setTick(function (n) { return (n + 1) % 1000000; }); };
        listeners.push(fn);
        return function () { var i = listeners.indexOf(fn); if (i >= 0) listeners.splice(i, 1); };
      }, []);
    }

    function Gear() {
      useTick();
      if (!gearShown()) return null;
      checkUpdate();
      var ic = loadIcons();
      var Icon = ic && (ic.Settings || ic.Settings2 || ic.Cog);
      var top = (RN.StatusBar && RN.StatusBar.currentHeight ? RN.StatusBar.currentHeight : 24) + 8;
      var kids = [Icon ? jsx0(Icon, { size: 20, color: '#ffffff' }, 'i') : jsx0(Text, { style: { color: '#fff', fontSize: 18 }, children: '\u2699' }, 'i')];
      if (update.newer) {
        kids.push(jsx0(View, { pointerEvents: 'none', style: { position: 'absolute', top: 6, right: 6, width: 9, height: 9,
          borderRadius: 5, backgroundColor: '#ef4444', borderWidth: 1, borderColor: '#ffffff' } }, 'dot'));
      }
      return jsxs0(Touch, {
        onPress: openSettings,
        hitSlop: 6,
        accessibilityLabel: ROW_LABEL,
        style: { position: 'absolute', top: top, right: 12, width: 40, height: 40, borderRadius: 20,
          backgroundColor: 'rgba(0,0,0,0.45)', alignItems: 'center', justifyContent: 'center', elevation: 8, zIndex: 1000 },
        children: kids
      });
    }

    function RootLayer() {
      useTick();
      var kids = [];
      var list = g.__htcOverlays || [];
      for (var i = 0; i < list.length; i++) if (typeof list[i] === 'function') kids.push(jsx0(list[i], {}, 'o' + i));
      kids.push(jsx0(Gear, {}, 'gear'));
      return jsxs0(View, { pointerEvents: 'box-none', style: { position: 'absolute', left: 0, top: 0, right: 0, bottom: 0 }, children: kids });
    }

    function assign(src, extra) {
      var out = {}, k;
      for (k in src) out[k] = src[k];
      for (k in extra) out[k] = extra[k];
      return out;
    }

    // Returns {props, wrapColor} to change the element, or null.
    function inspect(type, props) {
      if (type && typeof type === 'object' && type.type && typeof type.type === 'function'
          && type.type.name === 'VoiceBar' && !type.type.__htcCore) {
        wrapVoiceBar(type);
        return null;
      }
      if (!props || typeof props !== 'object') return null;
      if (isNavContainer(type) && !props.__htcNav) return { props: navProps(props), wrapRoot: true };
      if (depth > 0 && type === Touch && icons) {
        var child = props.children;
        var ct = child && typeof child === 'object' ? child.type : null;
        if (ct && (ct === icons.Play || ct === icons.Pause) && typeof props.onPress === 'function') {
          bar.play = props.onPress;
          bar.playing = ct === icons.Pause;
          return null;
        }
        var color = speedButtonColor(props);
        if (color) return { props: null, wrapColor: color };
        return null;
      }
      if ((type === View || type === RN.ScrollView) && props.children && typeof props.children.length === 'number') {
        var list = accountChildren(props.children) || loginChildren(props.children);
        if (list) return { props: assign(props, { children: list }) };
      }
      return null;
    }

    function wrapJsx(orig) {
      return function (type, props) {
        var r = null;
        try { r = inspect(type, props); } catch (e) { log('inspect failed ' + e); }
        if (!r) return orig.apply(this, arguments);
        var args = Array.prototype.slice.call(arguments);
        if (r.wrapRoot) {
          args[1] = r.props;
          var nav = orig.apply(this, args);
          try {
            return jsxs0(View, { style: { flex: 1 }, children: [nav, jsx0(RootLayer, {}, 'htc-root')] });
          } catch (e) { log('root layer failed ' + e); return nav; }
        }
        if (r.props) { args[1] = r.props; return jsxs0.apply(this, args); }
        var el = orig.apply(this, args);
        if (r.wrapColor) {
          try {
            return jsxs0(View, { style: { flexDirection: 'row', alignItems: 'center' },
              children: [el, jsx0(SleepButton, { color: r.wrapColor }, 'htc-sleep')] });
          } catch (e) { log('sleep button failed ' + e); }
        }
        return el;
      };
    }
    var jsx = wrapJsx(jsx0), jsxs = wrapJsx(jsxs0);
    JSX.jsx = jsx;
    JSX.jsxs = jsxs;
    if (JSX.jsx !== jsx) { log('jsx not writable'); return; }
    cmd('sleepState');
    log('ready');
  } catch (e) {
    log('init failed ' + e);
  }
})();
