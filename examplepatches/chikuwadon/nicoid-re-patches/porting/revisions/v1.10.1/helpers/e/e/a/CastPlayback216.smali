.class public final Le/e/a/CastPlayback216;
.super Ljava/lang/Object;
.source "CastPlayback216.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static message(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 5

    .line 7
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 8
    const-string v1, "type"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_70

    .line 9
    :try_start_d
    const-string v1, "loadurl"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 10
    const-string v1, "http"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_70

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_70

    invoke-virtual {p0}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_70

    invoke-virtual {p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_70

    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_70

    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v1, "/cast/[a-f0-9-]{36}/[0-9]+\\.m3u8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_70

    .line 11
    const-string p0, "Cast: enabling receiver fMP4 compatibility"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "(function (message) {\n  \'use strict\';\n  if (!message || message.type !== 0 || !/\\.m3u8(?:[?#]|$)/i.test(message.loadurl || \'\')) return message;\n  var w = window, state = w.__nicoidReCast216;\n  if (state) return message;\n  if (!w.video || typeof w.loadcomp !== \'function\' || typeof w.allreset !== \'function\') return message;\n  state = w.__nicoidReCast216 = { generation: 0, player: null, ready: null, active: false };\n  var legacyLoad = w.loadcomp, legacyReset = w.allreset;\n  function report(phase, code) {\n    try {\n      if (w.messageBus && w.senderid) w.messageBus.send(w.senderid, JSON.stringify({\n        type: 1, videoid: w.videoid || \'\', mpisplay: !w.video.paused,\n        iscomment: !!w.iscomment, mpposition: Math.round((w.video.currentTime || 0) * 1000),\n        playerState: phase, errorCode: typeof code === \'number\' && isFinite(code) ? code : 0\n      }));\n    } catch (ignored) {}\n  }\n  function stop() {\n    ++state.generation;\n    var player = state.player; state.player = null; state.active = false;\n    if (player) try { player.unload(); } catch (ignored) {}\n  }\n  function fail(code) {\n    report(\'COMPAT_ERROR\', code);\n    try { w.loopswitch(false); w.loading.style.display = \'none\'; w.videomessage.style.display = \'block\'; w.setmessage(\'\u6620\u50cf\u3092\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\uff08Cast: \' + code + \'\uff09\'); } catch (ignored) {}\n  }\n  function api() { return w.cast && w.cast.player && w.cast.player.api; }\n  function sdk() {\n    if (api() && api().Player && api().CreateHlsStreamingProtocol) return Promise.resolve(api());\n    if (state.ready) return state.ready;\n    state.ready = new Promise(function (resolve, reject) {\n      var script = document.createElement(\'script\'), finished = false;\n      function finish(code) {\n        if (finished) return; finished = true; clearTimeout(timer);\n        script.onload = script.onerror = null;\n        if (code) { state.ready = null; if (script.parentNode) script.parentNode.removeChild(script); reject(code); }\n        else resolve(api());\n      }\n      var timer = setTimeout(function () { finish(9101); }, 15000);\n      script.src = \'https://www.gstatic.com/cast/sdk/libs/mediaplayer/1.0.0/media_player.js\';\n      script.async = true;\n      script.onload = function () { finish(api() && api().Player && api().CreateHlsStreamingProtocol ? 0 : 9103); };\n      script.onerror = function () { finish(9102); };\n      document.head.appendChild(script);\n    });\n    return state.ready;\n  }\n  w.allreset = function () { stop(); return legacyReset.apply(this, arguments); };\n  w.loadcomp = function (text) {\n    if (!/\\.m3u8(?:[?#]|$)/i.test(w.videosrcurl || \'\')) { stop(); return legacyLoad.apply(this, arguments); }\n    stop(); state.active = true;\n    var token = state.generation, url = w.videosrcurl;\n    try { var list = JSON.parse(text || \'[]\'); w.commentlist = Array.isArray(list) ? list : []; }\n    catch (ignored) { w.commentlist = []; report(\'COMPAT_COMMENT_FORMAT\', 9104); }\n    report(\'COMPAT_SDK_LOADING\', 0);\n    sdk().then(function (playerApi) {\n      if (token !== state.generation || url !== w.videosrcurl) return;\n      var host = new playerApi.Host({ mediaElement: w.video, url: url });\n      host.onError = function (code) { if (token === state.generation) fail(typeof code === \'number\' ? code : 9199); };\n      var protocol = playerApi.CreateHlsStreamingProtocol(host, playerApi.HlsSegmentFormat.FMP4, playerApi.HlsVideoSegmentFormat.FMP4);\n      var player = state.player = new playerApi.Player(host);\n      w.video.autoplay = true;\n      player.load(protocol, 0);\n      if (w.iscomhide) { w.iscomment = false; w.iscomctrl = true; w.loopswitch(false); w.textPaint.clearRect(0, 0, w.vw, w.vh); }\n      else { w.iscomctrl = false; w.iscomment = true; w.loopswitch(true); }\n      report(\'COMPAT_MANIFEST_LOADING\', 0);\n    }).catch(function (code) { if (token === state.generation) fail(typeof code === \'number\' ? code : 9199); });\n  };\n  w.video.addEventListener(\'playing\', function () { if (state.active && state.player) report(\'COMPAT_PLAYING\', 0); });\n  w.video.addEventListener(\'error\', function () { if (state.active && w.video.error) report(\'COMPAT_ERROR\', 9200 + w.video.error.code); });\n  w.addEventListener(\'unload\', stop);\n  return message;\n})\n("

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\u2028"

    const-string v2, "\\u2028"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u2029"

    const-string v3, "\\u2029"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_6f} :catch_70

    return-object p0

    :catch_70
    :cond_70
    return-object v0
.end method
