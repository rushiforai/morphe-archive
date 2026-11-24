// java: app/hoitruyenchu/extension/itruyenchu/patches/player/MiniPlayerPatch.java
(function () {
  var TAG = '[HTC-Player] ';
  function log(m) { try { var s0 = globalThis.__htcS; if (s0 && s0.debug === false) return; console.log(TAG + m); } catch (e) {} }
  function S(k, d) { try { var s0 = globalThis.__htcS; var v = s0 ? s0[k] : undefined; return v === undefined || v === null ? d : v; } catch (e) { return d; } }
  try {
    var g = typeof globalThis !== 'undefined' ? globalThis : this;
    if (typeof g.__r !== 'function') { log('no __r'); return; }
    if (!g.__htcApp || !g.__htcApp.m || !g.__htcApp.m.text) { log('app version not supported'); return; }
    var JSX = g.__htcR('jsx');
    var React = g.__htcR('react');
    var RN = g.__htcR('rn');
    var VM = g.__htcR('voice');
    var V = VM && VM.useTTSVoiceStore;
    var Speech = g.__htcR('speech');
    var TextM = g.__htcR('text');
    var Replace = g.__htcR('replace');
    if (!JSX || typeof JSX.jsx !== 'function' || !React || typeof React.useState !== 'function' || !RN || !RN.View
        || !V || typeof V.getState !== 'function' || !Speech || typeof Speech.speak !== 'function'
        || !TextM || typeof TextM.parseLines !== 'function') { log('modules not found'); return; }
    var jsx0 = JSX.jsx, jsxs0 = JSX.jsxs;
    var View = RN.View, Text = RN.Text, Touch = RN.TouchableOpacity, Image = RN.Image;
    var icons = null;
    function loadIcons() { if (!icons) { try { icons = g.__htcR('icons'); } catch (e) { icons = null; } } return icons; }

    // ---- What the reader is playing (voice bar props) and the player state.
    // mode "off": nothing; "proxy": the reader still exists under another screen (its voice bar
    // reads, the mini player presses its buttons); "own": the reader is gone, this script reads.
    var P = { mode: 'off', slug: '', bookTitle: '', chapterTitle: '', n: 0, lines: [], line: 0,
      playing: false, dismissed: false, book: null, loading: false };
    var bar = { mounted: 0, props: null, playing: false, lastLine: -1, lastLineAt: 0 };
    var listeners = [];
    function notify() {
      var copy = listeners.slice();
      for (var i = 0; i < copy.length; i++) { try { copy[i](); } catch (e) {} }
    }
    g.__htcPlayerActive = function () { return P.mode === 'own'; };

    function route() { try { return typeof g.__htcRoute === 'function' ? g.__htcRoute() : null; } catch (e) { return null; } }
    function inReader() { var r = route(); return !!(r && /read/i.test(r.name || '')); }
    function chapter() { try { return typeof g.__htcChapter === 'function' ? g.__htcChapter() : null; } catch (e) { return null; } }

    function linesOf(text) {
      try {
        var rules = null;
        try { rules = Replace.useMagicReplaceStore.getState().rules; } catch (e) {}
        var t = Replace && typeof Replace.applyReplaceRules === 'function' ? Replace.applyReplaceRules(String(text || ''), rules) : String(text || '');
        var out = TextM.parseLines(t);
        return out && typeof out.length === 'number' ? out : [];
      } catch (e) { log('lines failed ' + e); return []; }
    }
    function speakable(s) { return /[0-9A-Za-zÀ-ỹ]/.test(String(s || '')); }
    // "Chương 12: Tên", or "Chương 12" when the title is empty / "-" (no real title).
    function chapterLabel(n, title) {
      var t = String(title || '').trim();
      if (/^ch(?:ươ|uo)ng\s*\d+/i.test(t)) {
        var m = /^ch(?:ươ|uo)ng\s*\d+\s*[:.\-]?\s*(.*)$/i.exec(t);
        t = m ? m[1].trim() : '';
      }
      if (!t || /^[-–—.:]+$/.test(t)) return n > 0 ? 'Chương ' + n : '';
      return n > 0 ? 'Chương ' + n + ': ' + t : t;
    }
    function chapterTitleOf(lines, n) {
      for (var i = 0; i < Math.min(3, lines.length); i++) {
        var m = /^\s*ch(?:ươ|uo)ng\s*\d+\s*[:.\-]?\s*(.*)$/i.exec(String(lines[i]));
        if (m) return chapterLabel(n, m[1]);
      }
      return 'Chương ' + n;
    }

    // ---- Lock screen / notification while this script reads: a silent looping player like the
    // voice bar's (expo-audio), whose media session TtsMediaSession turns into the reading.
    var audio = null;
    function audioStart() {
      try {
        if (audio) return;
        var A = g.__htcR('audio');
        var src = g.__htcR('silence');
        if (src && typeof src === 'object' && src.default !== undefined) src = src.default;
        if (!A || typeof A.createAudioPlayer !== 'function' || src === null || src === undefined) { log('no audio player'); return; }
        try {
          if (typeof A.setAudioModeAsync === 'function') {
            var pm = A.setAudioModeAsync({ playsInSilentMode: true, shouldPlayInBackground: true, interruptionMode: 'doNotMix' });
            if (pm && pm.then) pm.then(null, function () {});
          }
        } catch (e) {}
        audio = A.createAudioPlayer(src);
        audio.loop = true;
        audio.volume = 0;
        audioMeta();
      } catch (e) { log('audio failed ' + e); audio = null; }
    }
    function audioMeta() {
      try {
        if (!audio || typeof audio.setActiveForLockScreen !== 'function') return;
        var B = g.__htcR('banner');
        var art = B && typeof B.getSmallBannerURL === 'function' ? B.getSmallBannerURL(P.slug) : undefined;
        audio.setActiveForLockScreen(true, { albumTitle: P.bookTitle, title: P.chapterTitle, artworkUrl: art });
      } catch (e) { log('lock screen failed ' + e); }
    }
    function audioPlaying(on) {
      try { if (audio) { if (on) audio.play(); else audio.pause(); } } catch (e) {}
    }
    function audioStop() {
      try {
        if (!audio) return;
        try { if (typeof audio.setActiveForLockScreen === 'function') audio.setActiveForLockScreen(false); } catch (e) {}
        try { audio.pause(); } catch (e) {}
        try { if (typeof audio.remove === 'function') audio.remove(); else if (typeof audio.release === 'function') audio.release(); } catch (e) {}
      } finally { audio = null; }
    }

    // ---- Reading done by this script ("own" mode)
    var token = 0;
    function stopSpeech() {
      try { var p = Speech.stop(); if (p && p.then) p.then(null, function () {}); } catch (e) {}
    }
    function saveListen() {
      try { if (typeof g.__htcSaveListen === 'function') g.__htcSaveListen(P.slug, P.n, P.line); } catch (e) {}
    }
    function speakLine(i, t) {
      if (t !== token || P.mode !== 'own' || !P.playing) return;
      if (i >= P.lines.length) {
        // Like the voice bar: "Hết chương", then the next chapter.
        Speech.speak('Hết chương', { rate: rate(), language: 'vi-VN',
          onDone: function () { if (t === token) nextChapter(true); },
          onError: function () { if (t === token) nextChapter(true); } });
        return;
      }
      if (!speakable(P.lines[i])) { speakLine(i + 1, t); return; }
      P.line = i;
      saveListen();
      notify();
      Speech.speak(String(P.lines[i]), { rate: rate(), language: 'vi-VN',
        onDone: function () { speakLine(i + 1, t); },
        onError: function () { speakLine(i + 1, t); } });
    }
    function rate() { try { var s = V.getState(); var r = Number(s.speed); return r > 0 ? r : 1; } catch (e) { return 1; } }

    function play() {
      if (P.mode !== 'own') return;
      if (P.playing) return;
      P.playing = true;
      token++;
      audioStart();
      audioPlaying(true);
      log('play from line ' + P.line);
      notify();
      speakLine(P.line, token);
    }
    function pause() {
      if (P.mode !== 'own' || !P.playing) return;
      P.playing = false;
      token++;
      stopSpeech();
      audioPlaying(false);
      log('pause at line ' + P.line);
      notify();
    }
    function stopOwn(keepBar) {
      if (P.mode !== 'own') return;
      token++;
      if (P.playing) stopSpeech();
      P.playing = false;
      audioStop();
      P.mode = keepBar ? P.mode : 'off';
      if (!keepBar) log('stopped');
      notify();
    }

    function getBook(slug) {
      // Book info of the reader's last addRecentRead (slug, title, totalChapter = chapters, categories).
      if (P.book && P.book.slug === slug) return P.book;
      return null;
    }

    function nextChapter(play0) { return loadChapter(P.n + 1, play0); }
    function prevChapter() { return loadChapter(P.n - 1, P.playing); }

    function loadChapter(n, play0) {
      if (P.mode !== 'own' || P.loading) return false;
      var book = getBook(P.slug);
      if (!(n >= 1) || (book && book.totalChapter > 0 && n > book.totalChapter)) {
        log('no chapter ' + n);
        pause();
        P.line = Math.max(0, P.lines.length - 1);
        notify();
        return false;
      }
      var API = g.__htcR('chapters');
      if (!API || typeof API.getChapterContent !== 'function') { log('no chapter api'); pause(); return false; }
      var auth = null;
      try { auth = g.__htcR('auth').useAuthStore.getState(); } catch (e) {}
      var tokenStr = auth && auth.accessToken ? auth.accessToken : undefined;
      var vip = false;
      try { vip = !!(auth && typeof auth.isVip === 'function' && auth.isVip()); } catch (e) {}
      token++;
      if (P.playing) stopSpeech();
      P.loading = true;
      notify();
      log('loading chapter ' + n);
      var t = token;
      var p;
      try { p = API.getChapterContent(P.slug, n, vip, tokenStr); } catch (e) { p = null; }
      if (!p || typeof p.then !== 'function') { P.loading = false; pause(); return false; }
      p.then(function (res) {
        P.loading = false;
        if (t !== token || P.mode !== 'own') return;
        var content = res && res.content;
        if (!content) { log('chapter ' + n + ' empty'); pause(); notify(); return; }
        P.n = n;
        P.lines = linesOf(content);
        P.line = 0;
        P.chapterTitle = chapterTitleOf(P.lines, n);
        record();
        audioMeta();
        notify();
        if (res.isPreview) log('chapter ' + n + ' is a preview');
        if (play0) { P.playing = false; play(); }
      }, function (e) {
        P.loading = false;
        log('chapter ' + n + ' failed ' + e);
        if (t === token) pause();
        notify();
      });
      return true;
    }

    // Reading history like the reader: addRecentRead({slug, totalChapter, title, categories, currentChapter, chapterTitle}).
    var addRecent = null;
    function record() {
      try {
        var book = getBook(P.slug);
        if (!book || typeof addRecent !== 'function') return;
        addRecent({ slug: book.slug, totalChapter: book.totalChapter, title: book.title,
          categories: book.categories || [], currentChapter: P.n, chapterTitle: P.chapterTitle });
      } catch (e) { log('history failed ' + e); }
    }
    try {
      var R = g.__htcR('read').useReadStore;
      var wrapAdd = function (fn) {
        if (typeof fn !== 'function' || fn.__htcPlayer) return fn;
        var w = function (entry) {
          try { if (entry && entry.slug) P.book = { slug: entry.slug, totalChapter: entry.totalChapter, title: entry.title, categories: entry.categories }; } catch (e) {}
          return fn.apply(this, arguments);
        };
        w.__htcPlayer = true;
        addRecent = fn;
        return w;
      };
      var st0 = R.getState();
      if (typeof st0.addRecentRead === 'function') R.setState({ addRecentRead: wrapAdd(st0.addRecentRead) });
      R.subscribe(function (s) {
        try { if (s.addRecentRead && !s.addRecentRead.__htcPlayer) R.setState({ addRecentRead: wrapAdd(s.addRecentRead) }); } catch (e) {}
      });
    } catch (e) { log('read store not found ' + e); }

    // ---- Leaving the reader while it reads
    function startOwn(from) {
      var mode = S('player.onLeave', 'continue');
      if (!S('player.enabled', true) || mode === 'stop') return;
      var props = from.props || {};
      var lines = linesOf(props.text);
      if (!lines.length) return;
      var ch = chapter();
      P.mode = 'own';
      P.dismissed = false;
      P.slug = props.bookSlug || (ch && ch.slug) || P.slug;
      P.bookTitle = props.bookTitle || '';
      P.n = ch && ch.slug === P.slug ? ch.n : P.n;
      P.chapterTitle = chapterLabel(P.n, props.chapterTitle);
      P.lines = lines;
      P.line = Math.max(0, Math.min(lines.length - 1, from.line));
      P.playing = false;
      log('reader closed while reading: ' + P.slug + ' ch ' + P.n + ' line ' + P.line + ' (' + mode + ')');
      notify();
      if (mode === 'continue') { play(); return; }
      if (mode === 'ask') {
        audioStart();
        audioPlaying(false);
        RN.Alert.alert('Tiếp tục nghe?', P.bookTitle + ' · ' + P.chapterTitle, [
          { text: 'Dừng', style: 'cancel', onPress: function () { stopOwn(false); } },
          { text: 'Nghe tiếp', onPress: function () { play(); } }
        ], { cancelable: true, onDismiss: function () { stopOwn(false); } });
        return;
      }
      // "pause": the bar stays, play goes on from the word.
      audioStart();
      audioPlaying(false);
    }

    function onBarMounted() {
      if (P.mode !== 'own') return;
      // The reader is open again (opened by hand, not from the mini player): it reads now.
      log('reader opened, mini player stops');
      stopOwn(false);
    }

    function onBarUnmounted(snapshot) {
      if (!snapshot.playing) return;
      // After the voice bar's own clean-up (it stops the speech: Java keeps the word reached).
      setTimeout(function () {
        try {
          if (bar.mounted > 0 || inReader()) return;
          startOwn(snapshot);
        } catch (e) { log('leave failed ' + e); }
      }, 350);
    }

    function wrapVoiceBar(memo) {
      var orig = memo.type;
      var VoiceBar = function (props) {
        var ref = React.useRef(null);
        ref.current = props;
        React.useEffect(function () {
          bar.mounted++;
          onBarMounted();
          notify();
          return function () {
            bar.mounted = Math.max(0, bar.mounted - 1);
            var snap = { props: ref.current, playing: bar.playing, line: bar.lastLine };
            bar.playing = false;
            notify();
            onBarUnmounted(snap);
          };
        }, []);
        bar.props = props;
        return orig.apply(this, arguments);
      };
      for (var k in orig) { if (k.indexOf('__htc') === 0) VoiceBar[k] = orig[k]; }
      VoiceBar.__htcPlayer = true;
      memo.type = VoiceBar;
      log('voice bar hooked');
    }

    // Is the voice bar reading: its play button (lucide Play / Pause), like the other scripts.
    var barDepth = 0;
    function wrapJsx(orig) {
      return function (type, props) {
        try {
          if (type && typeof type === 'object' && type.type && typeof type.type === 'function'
              && type.type.name === 'VoiceBar' && !type.type.__htcPlayer) {
            wrapVoiceBar(type);
          }
        } catch (e) {}
        return orig.apply(this, arguments);
      };
    }
    JSX.jsx = wrapJsx(JSX.jsx);
    JSX.jsxs = wrapJsx(JSX.jsxs);

    // Playing state of the voice bar and the line it reads.
    setInterval(function () {
      try {
        var b = g.__htcBar;
        var playing = !!(b && b.playing && b.playing());
        if (playing !== bar.playing) { bar.playing = playing; notify(); }
      } catch (e) {}
    }, 500);
    V.subscribe(function (s, prev) {
      try {
        if (bar.mounted > 0 && s.activeLine >= 0) { bar.lastLine = s.activeLine; bar.lastLineAt = Date.now(); }
        if (prev && s.speed !== prev.speed && P.mode === 'own' && P.playing) {
          // A new speed while this script reads: go on from the word at the new speed.
          token++;
          stopSpeech();
          var t = token;
          setTimeout(function () { if (t === token) speakLine(P.line, t); }, 150);
        }
      } catch (e) {}
    });

    // ---- Commands: media widget / lock screen (htcMediaCommand) and Java's "pause" (headphones,
    // sleep timer, call) while this script reads.
    function ack(id, ok) {
      try {
        var storage = V.persist.getOptions().storage;
        var p = storage.setItem('htc_media_ack', { id: id, ok: ok, t: Date.now() });
        if (p && p.then) p.then(null, function () {});
      } catch (e) {}
    }
    RN.DeviceEventEmitter.addListener('htcMediaCommand', function (msg) {
      if (P.mode !== 'own' || bar.mounted > 0) return;
      var s = String(msg), i = s.indexOf('#');
      var cmd = i >= 0 ? s.substring(0, i) : s;
      var id = i >= 0 ? parseInt(s.substring(i + 1), 10) : 0;
      var ok = true;
      try {
        if (cmd === 'play') play();
        else if (cmd === 'pause') pause();
        else if (cmd === 'next') ok = nextChapter(P.playing);
        else if (cmd === 'prev') ok = prevChapter();
        else if (cmd.indexOf('line') === 0) {
          var d = parseInt(cmd.substring(4), 10) || 0;
          var was = P.playing;
          pause();
          P.line = Math.max(0, Math.min(P.lines.length - 1, P.line + d));
          if (typeof g.__htcCmd === 'function') g.__htcCmd('wordAt', { text: String(P.lines[P.line] || ''), pos: 0 });
          if (was) setTimeout(play, 150); else notify();
        } else ok = false;
      } catch (e) { ok = false; }
      log(cmd + (ok ? ' done' : ' not handled'));
      ack(id, ok);
    });
    RN.DeviceEventEmitter.addListener('htcCommand', function (json) {
      try {
        var c = JSON.parse(String(json));
        if (c.cmd === 'pause' && P.mode === 'own' && P.playing && bar.mounted <= 0) { log('pause (' + (c.sleep ? 'sleep timer' : 'system') + ')'); pause(); }
      } catch (e) {}
    });

    // ---- Opening the reader from the mini player
    function openReader() {
      try {
        var nav = typeof g.__htcNav === 'function' ? g.__htcNav() : null;
        if (!nav) { log('no navigation'); return; }
        if (P.mode === 'proxy' || (bar.mounted > 0 && P.mode !== 'own')) {
          // The reader is still in the stack: go back to it.
          nav.navigate('ReaderScreen');
          return;
        }
        if (P.mode !== 'own') return;
        var was = P.playing;
        token++;
        if (P.playing) stopSpeech();
        P.playing = false;
        audioStop();
        g.__htcResumeRequest = { slug: P.slug, n: P.n, line: P.line, play: was, t: Date.now() };
        P.mode = 'off';
        notify();
        log('open reader ' + P.slug + ' ch ' + P.n + ' line ' + P.line);
        nav.navigate('ReaderScreen', { bookSlug: P.slug, chapterNumber: P.n });
      } catch (e) { log('open failed ' + e); }
    }

    // ---- UI
    var TAB_SCREENS = /^(home|history|account|profile|library|bookshelf|explore|discover)/i;
    var BAR = { position: 'absolute', left: 8, right: 8, flexDirection: 'row', alignItems: 'center',
      backgroundColor: '#15181d', borderRadius: 16, paddingRight: 6, paddingLeft: 6, paddingVertical: 6,
      elevation: 12, borderWidth: 1, borderColor: 'rgba(255,255,255,0.08)', overflow: 'hidden' };
    var COVER = { width: 52, height: 68, borderRadius: 8, backgroundColor: '#2a2f37' };
    var TITLE = { color: '#ffffff', fontSize: 13, fontWeight: '600' };
    var SUB = { color: 'rgba(255,255,255,0.6)', fontSize: 12 };
    var BTN = { width: 40, height: 40, alignItems: 'center', justifyContent: 'center' };
    var PLAY = { width: 44, height: 44, borderRadius: 22, backgroundColor: '#ffffff', alignItems: 'center', justifyContent: 'center', marginHorizontal: 2 };
    var SPEED = { paddingHorizontal: 8, height: 30, borderRadius: 8, backgroundColor: 'rgba(255,255,255,0.12)', alignItems: 'center', justifyContent: 'center', marginRight: 2 };

    function iconEl(name, color, size) {
      var ic = loadIcons();
      var I = ic && ic[name];
      return I ? jsx0(I, { size: size || 22, color: color || '#ffffff' }) : jsx0(Text, { style: { color: color || '#fff' }, children: name.charAt(0) });
    }

    function MiniPlayer() {
      var st = React.useState(0);
      var setTick = st[1];
      var sp = React.useState(false);
      var speedOpen = sp[0], setSpeedOpen = sp[1];
      React.useEffect(function () {
        var fn = function () { setTick(function (n) { return (n + 1) % 1000000; }); };
        listeners.push(fn);
        var sub = null;
        try { sub = V.subscribe(fn); } catch (e) {}
        return function () {
          var i = listeners.indexOf(fn);
          if (i >= 0) listeners.splice(i, 1);
          if (typeof sub === 'function') sub();
        };
      }, []);
      if (!S('player.enabled', true)) return null;
      var r = route();
      if (!r || !r.name || /read/i.test(r.name)) return null;
      var proxy = P.mode !== 'own' && bar.mounted > 0 && bar.playing && !P.dismissed;
      if (P.mode !== 'own' && !proxy) return null;
      var info = proxy ? {
        slug: bar.props && bar.props.bookSlug, bookTitle: bar.props && bar.props.bookTitle,
        chapterTitle: chapterLabel((chapter() || {}).n || 0, bar.props && bar.props.chapterTitle), playing: bar.playing, line: bar.lastLine,
        total: 0
      } : { slug: P.slug, bookTitle: P.bookTitle, chapterTitle: P.chapterTitle, playing: P.playing, line: P.line, total: P.lines.length };
      var tabs = TAB_SCREENS.test(r.name);
      var bottom = tabs ? 70 : 10;
      var B = g.__htcR('banner');
      var art = null;
      try { art = B && info.slug ? B.getSmallBannerURL(info.slug) : null; } catch (e) {}
      var speed = Number(V.getState().speed) || 1;

      function onPlay() {
        if (proxy) { var b = g.__htcBar; if (b && b.press) b.press(); return; }
        if (P.playing) pause(); else play();
      }
      function onNext() {
        if (proxy) { var c = g.__htcBarCtl; if (c && c.next) c.next(); return; }
        nextChapter(P.playing);
      }
      function onPrev() {
        if (proxy) { var c = g.__htcBarCtl; if (c && c.prev) c.prev(); return; }
        prevChapter();
      }
      function onClose() {
        if (proxy) {
          var b = g.__htcBar;
          if (b && b.playing && b.playing() && b.press) b.press();
          P.dismissed = true;
          notify();
          return;
        }
        stopOwn(false);
      }

      var left = [];
      left.push(art ? jsx0(Image, { source: { uri: art }, style: COVER, resizeMode: 'cover' }, 'cover')
                    : jsx0(View, { style: COVER }, 'cover'));
      var texts = jsxs0(View, { style: { flex: 1, marginLeft: 10, justifyContent: 'center' }, children: [
        jsx0(Text, { numberOfLines: 1, style: TITLE, children: info.bookTitle || '' }, 't'),
        jsx0(Text, { numberOfLines: 1, style: SUB, children: (P.loading && !proxy ? 'Đang tải chương… ' : '') + (info.chapterTitle || '') }, 's')
      ] }, 'texts');
      var Sleep = g.__htcSleepButton;
      var controls = [
        jsx0(Touch, { style: SPEED, onPress: function () { setSpeedOpen(true); }, children: jsx0(Text, { style: { color: '#fff', fontSize: 12 }, children: speed.toFixed(2) + 'x' }) }, 'speed'),
        typeof Sleep === 'function' ? jsx0(Sleep, { color: '#bbbbbb' }, 'sleep') : null,
        jsx0(Touch, { style: BTN, onPress: onPrev, accessibilityLabel: 'Chương trước', children: iconEl('SkipBack', '#ffffff', 20) }, 'prev'),
        jsx0(Touch, { style: PLAY, onPress: onPlay, accessibilityLabel: info.playing ? 'Tạm dừng' : 'Phát', children: iconEl(info.playing ? 'Pause' : 'Play', '#111111', 22) }, 'play'),
        jsx0(Touch, { style: BTN, onPress: onNext, accessibilityLabel: 'Chương sau', children: iconEl('SkipForward', '#ffffff', 20) }, 'next'),
        jsx0(Touch, { style: BTN, onPress: onClose, accessibilityLabel: 'Đóng', children: iconEl('X', '#bbbbbb', 20) }, 'close')
      ];
      var right = jsxs0(View, { style: { flex: 1, marginLeft: 10 }, children: [
        jsx0(Touch, { onPress: openReader, activeOpacity: 0.7, children: texts }, 'info'),
        jsxs0(View, { style: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginTop: 4 }, children: controls }, 'ctl')
      ] }, 'right');
      var kids = [
        jsx0(Touch, { onPress: openReader, activeOpacity: 0.8, children: left[0] }, 'coverBtn'),
        right
      ];
      if (info.total > 0) {
        var f = Math.max(0, Math.min(1, (info.line + 1) / info.total));
        kids.push(jsx0(View, { pointerEvents: 'none', style: { position: 'absolute', left: 0, bottom: 0, height: 2, width: (f * 100) + '%', backgroundColor: '#f0a93b' } }, 'progress'));
      }
      var Panel = g.__htcSpeedPanel;
      if (speedOpen && typeof Panel === 'function') {
        kids.push(jsx0(RN.Modal, { visible: true, transparent: true, animationType: 'fade', onRequestClose: function () { setSpeedOpen(false); },
          children: jsx0(Touch, { activeOpacity: 1, onPress: function () { setSpeedOpen(false); },
            style: { flex: 1, backgroundColor: 'rgba(0,0,0,0.55)', justifyContent: 'flex-end', padding: 12 },
            children: jsx0(Panel, { speed: speed, onSelect: function (v) { try { V.getState().setSpeed(v); } catch (e) {} },
              style: { backgroundColor: '#15181d', borderRadius: 16 } }) }) }, 'speedModal'));
      }
      return jsxs0(View, { style: [BAR, { bottom: bottom }], children: kids });
    }
    if (!g.__htcOverlays) g.__htcOverlays = [];
    g.__htcOverlays.push(MiniPlayer);
    if (typeof g.__htcNotify === 'function') g.__htcNotify();
    log('ready');
  } catch (e) {
    log('init failed ' + e);
  }
})();
