window.__require = function e(t, o, n) {
function a(r, s) {
if (!o[r]) {
if (!t[r]) {
var m = r.split("/");
m = m[m.length - 1];
if (!t[m]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(m, !0);
if (i) return i(m, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = m;
}
var d = o[r] = {
exports: {}
};
t[r][0].call(d.exports, function(e) {
return a(t[r][1][e] || e);
}, d, d.exports, e, t, o, n);
}
return o[r].exports;
}
for (var i = "function" == typeof __require && __require, r = 0; r < n.length; r++) a(n[r]);
return a;
}({
CommonGameListConsts: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "dd61auMUFtHQ77nh6CVEBiU", "CommonGameListConsts");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.DEFAULT_ATOM_GAMES = o.DEFAULT_SAND_BUNDLE_VERSION_RELEASE = o.DEFAULT_SAND_BUNDLE_VERSION_DEBUG = o.DEFAULT_GAME_BUNDLE_REMOTE = o.DEFAULT_GAME_BUNDLE_VERSION = o.DEFAULT_GAME_CONFIG = void 0;
var n = e("./CommonGameListTypes");
o.DEFAULT_GAME_CONFIG = {
gl_blockslide: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_watersort: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_oneline: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_mahjong: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_onet: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_fruit: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_tictactoe: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_sudoku: {
type: n.CommonGameListTypes.GameType.LEGACY,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
G2: {
type: n.CommonGameListTypes.GameType.ATOM,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
G3: {
type: n.CommonGameListTypes.GameType.ATOM,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
G5: {
type: n.CommonGameListTypes.GameType.ATOM,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
},
gl_sand: {
type: n.CommonGameListTypes.GameType.SAND,
trigger: n.CommonGameListTypes.DownloadTrigger.DEFAULT
}
};
o.DEFAULT_GAME_BUNDLE_VERSION = {};
o.DEFAULT_GAME_BUNDLE_REMOTE = {};
o.DEFAULT_SAND_BUNDLE_VERSION_DEBUG = {
board_pattern: "6cd2b",
hsgame: "9721d",
sand_audio: "2b6ba",
sand_prefab: "988fd",
sandcrush: "473ca",
sand_zip: "8eca8",
sandgm: "8dacb"
};
o.DEFAULT_SAND_BUNDLE_VERSION_RELEASE = {
board_pattern: "b721f",
hsgame: "12fca",
sand_audio: "c57b2",
sand_prefab: "3feb4",
sandcrush: "69588",
sand_zip: "eb15c",
sandgm: "8dacb"
};
o.DEFAULT_ATOM_GAMES = {
G2: {
worldId: "G2_FBase_World",
downloadId: "G2_FPreLoad_World"
},
G3: {
worldId: "G3_FHome_WorldAtom",
downloadId: "G3_FDownLoad_World"
},
G5: {
worldId: "G5_FBase_WorldAtom",
downloadId: "G5_FPreDownload_World"
}
};
cc._RF.pop();
}, {
"./CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloaderAtom: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "9118epvbL1PzpUklVOEMr1t", "CommonGameListDownloaderAtom");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListDownloaderAtom = void 0;
var n = e("../CommonGameListTypes"), a = function() {
function e() {
this._pendingInfos = new Map();
this._downloadQueue = [];
}
e.prototype.checkGameDownloadState = function(e) {
var t, o = null === (t = e.atom) || void 0 === t ? void 0 : t.downloadId;
this._pendingInfos.set(o, e);
hs.atomOriginalInfo.checkWorldBundlesDownloaded(o);
return !1;
};
e.prototype.init = function(e) {
var t = this;
this._downloader = e;
hs.atomOriginalInfo.downloadEmitter.event(function(e) {
var o;
if (t._downloader) {
var a = t._pendingInfos.get(e.worldId);
if (a && (null === (o = a.atom) || void 0 === o ? void 0 : o.downloadId) === e.worldId) {
var i;
if (e.error) {
i = n.CommonGameListTypes.DownloadState.FAIL;
t.onGameDownloadFinish(e.worldId);
} else if (e.isDone) {
i = n.CommonGameListTypes.DownloadState.SUCCESS;
t._pendingInfos.delete(e.worldId);
t.onGameDownloadFinish(e.worldId);
} else i = n.CommonGameListTypes.DownloadState.PENDING;
t._downloader.loadEmitter.fire({
gameName: a.gameName,
state: i,
progress: e.progress
});
}
}
});
};
e.prototype.clear = function() {
this._downloader = void 0;
this._pendingInfos.clear();
this._downloadQueue.length = 0;
};
e.prototype.startDownload = function(e) {
this._downloader.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.PENDING,
progress: 0
});
this._downloadQueue.push(e);
this._downloadQueue.length > 1 || this.realDownload();
};
e.prototype.onGameDownloadFinish = function(e) {
this._downloadQueue = this._downloadQueue.filter(function(t) {
var o;
return (null === (o = t.atom) || void 0 === o ? void 0 : o.downloadId) !== e;
});
this.realDownload();
};
e.prototype.realDownload = function() {
var e, t = this._downloadQueue[0];
if (t) {
var o = null === (e = t.atom) || void 0 === e ? void 0 : e.downloadId;
this._pendingInfos.set(o, t);
hs.atomOriginalInfo.markWorldDownloadOnly(o);
hs.atomOriginalInfo.createWorld(o);
}
};
return e;
}();
o.CommonGameListDownloaderAtom = a;
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloaderChapter: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "fa3d2ElSZVEmIwrQBnHzbLy", "CommonGameListDownloaderChapter");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListDownloaderChapter = void 0;
var n = e("../CommonGameListTypes"), a = function() {
function e() {}
e.prototype.init = function(e) {
this._downloader = e;
};
e.prototype.clear = function() {
this._downloader = void 0;
};
e.prototype.startDownload = function(e) {
var t, o = this;
if (this.isChapterNeedDownload()) {
var a = new hs.E_ChapterConfig_Load(function(t) {
var a;
null === (a = o._downloader) || void 0 === a || a.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.PENDING,
finish: t.loadedCount,
total: t.totalCount
});
}, function() {
var t;
hs.EventManager.dispatchModuleEvent(new hs.E_Tip_Show({
label: "Loading failed, please check the network and try again."
}));
null === (t = o._downloader) || void 0 === t || t.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.FAIL
});
});
hs.EventManager.dispatchModuleEventAsync(a).then(function() {
var t;
null === (t = o._downloader) || void 0 === t || t.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.SUCCESS,
finish: 1,
total: 1,
progress: 1
});
}).catch(function() {
var t;
hs.EventManager.dispatchModuleEvent(new hs.E_Tip_Show({
label: "Loading failed, please check the network and try again."
}));
null === (t = o._downloader) || void 0 === t || t.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.FAIL
});
});
} else null === (t = this._downloader) || void 0 === t || t.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.SUCCESS,
finish: 1,
total: 1,
progress: 1
});
};
e.prototype.checkGameDownloadState = function() {
return !this.isChapterNeedDownload();
};
e.prototype.isChapterNeedDownload = function() {
var e, t, o;
if (0 === (null !== (o = null === (t = null === (e = hs.chapterConfigInfo) || void 0 === e ? void 0 : e.chapterDatasCfg) || void 0 === t ? void 0 : t.length) && void 0 !== o ? o : 0)) return !1;
hs.chapterConfigInfo.isThroughAll;
return hs.themeInfo.remoteLoadBefore;
};
return e;
}();
o.CommonGameListDownloaderChapter = a;
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloaderDT: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "f684ek4LnVPgLI/P2/C2zOE", "CommonGameListDownloaderDT");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListDownloaderDT = void 0;
var n = e("../CommonGameListTypes"), a = function() {
function e() {}
e.prototype.init = function(e) {
this._downloader = e;
};
e.prototype.clear = function() {
var e, t;
null === (t = null === (e = this.getDoubleTileTrait()) || void 0 === e ? void 0 : e.clearDoubleTileCommonGameDownload) || void 0 === t || t.call(e);
this._downloader = void 0;
};
e.prototype.checkGameDownloadState = function(e) {
var t, o, n;
return null !== (n = null === (o = null === (t = this.getDoubleTileTrait()) || void 0 === t ? void 0 : t.checkDoubleTileCommonGameDownloadState) || void 0 === o ? void 0 : o.call(t, e)) && void 0 !== n && n;
};
e.prototype.startDownload = function(e) {
var t, o = this.getDoubleTileTrait();
(null == o ? void 0 : o.startDoubleTileCommonGameDownload) && this._downloader ? o.startDoubleTileCommonGameDownload(e, this._downloader) : null === (t = this._downloader) || void 0 === t || t.loadEmitter.fire({
gameName: e.gameName,
state: n.CommonGameListTypes.DownloadState.FAIL,
finish: 0,
total: 1
});
};
e.prototype.getDoubleTileTrait = function() {
var e = TRAIT("MahjongMoreGameEntryTrait");
return !0 !== (null == e ? void 0 : e.active) ? null : e;
};
return e;
}();
o.CommonGameListDownloaderDT = a;
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloaderLegacy: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "7a89cxX4ydEaJYdWAxr5GPp", "CommonGameListDownloaderLegacy");
var n = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(a, i) {
function r(e) {
try {
m(n.next(e));
} catch (e) {
i(e);
}
}
function s(e) {
try {
m(n.throw(e));
} catch (e) {
i(e);
}
}
function m(e) {
e.done ? a(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(r, s);
var t;
}
m((n = n.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var o, n, a, i, r = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(e) {
return function(t) {
return m([ e, t ]);
};
}
function m(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (o = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, i[1])).done) return a;
(n = 0, a) && (i = [ 2 & i[0], a.value ]);
switch (i[0]) {
case 0:
case 1:
a = i;
break;

case 4:
r.label++;
return {
value: i[1],
done: !1
};

case 5:
r.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(a = r.trys, a = a.length > 0 && a[a.length - 1]) && (6 === i[0] || 2 === i[0])) {
r = 0;
continue;
}
if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
r.label = i[1];
break;
}
if (6 === i[0] && r.label < a[1]) {
r.label = a[1];
a = i;
break;
}
if (a && r.label < a[2]) {
r.label = a[2];
r.ops.push(i);
break;
}
a[2] && r.ops.pop();
r.trys.pop();
continue;
}
i = t.call(e, r);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = a = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListDownloaderLegacy = void 0;
var i = e("../CommonGameListTypes"), r = function() {
function e() {
this._downloadingSet = new Set();
this._timeoutMap = new Map();
this._pollTimerMap = new Map();
}
e.prototype.checkGameDownloadState = function(e) {
return !!this.isLocalGame(e.gameName) || this.isBundleLoadComplete(e.gameName);
};
e.prototype.init = function(e) {
this._downloader = e;
cc.systemEvent.on(hs.GameLobbyEmitEventType.MINIGAME_PRELOAD, this.onMiniGamePreload, this);
this.loadMinigameJson();
};
e.prototype.clear = function() {
cc.systemEvent.off(hs.GameLobbyEmitEventType.MINIGAME_PRELOAD, this.onMiniGamePreload, this);
this._timeoutMap.forEach(function(e) {
return clearTimeout(e);
});
this._timeoutMap.clear();
this._pollTimerMap.forEach(function(e) {
return clearTimeout(e);
});
this._pollTimerMap.clear();
this._downloadingSet.clear();
this._downloader = void 0;
};
e.prototype.startDownload = function(e) {
if (this._downloadingSet.has(e.gameName)) ; else {
this._downloadingSet.add(e.gameName);
this.doDownload(e);
}
};
e.prototype.loadMinigameJson = function() {
return n(this, void 0, void 0, function() {
var e;
return a(this, function(t) {
switch (t.label) {
case 0:
return hs.envInfo.isProd ? [ 3, 2 ] : [ 4, hs.gameLobbyBundleVersInfo.getBundleVers() ];

case 1:
e = t.sent();
hs.ResLoader.addBundleVers(e);
t.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.isLocalGame = function(t) {
return e.LOCAL_GAMES.has(t);
};
e.prototype.doDownload = function(e) {
var t = this, o = e.gameName;
if (this.isLocalGame(o)) this.fireDownloadState(o, i.CommonGameListTypes.DownloadState.SUCCESS); else if (this.isBundleLoadComplete(o)) this.fireDownloadState(o, i.CommonGameListTypes.DownloadState.SUCCESS); else if (cc.sys.getNetworkType() !== cc.sys.NetworkType.NONE) {
this.setupTimeout(o);
this.isBundleLoadComplete(hs.GameLobbyBundleName.GL_HALL) ? hs.gameLobby_DataInfo.preLoadMiniGameByBundleName(o, null, function() {
t.fireDownloadState(o, i.CommonGameListTypes.DownloadState.SUCCESS);
}, function() {
t.fireDownloadState(o, i.CommonGameListTypes.DownloadState.FAIL);
}) : hs.gameLobby_DataInfo.preLoadMiniGameByBundleName(hs.GameLobbyBundleName.GL_HALL, null, function() {
hs.gameLobby_DataInfo.preLoadMiniGameByBundleName(o, null, function() {
t.fireDownloadState(o, i.CommonGameListTypes.DownloadState.SUCCESS);
}, function() {
t.fireDownloadState(o, i.CommonGameListTypes.DownloadState.FAIL);
});
}, function() {
t.fireDownloadState(o, i.CommonGameListTypes.DownloadState.FAIL);
});
} else this.fireDownloadState(o, i.CommonGameListTypes.DownloadState.FAIL);
};
e.prototype.setupTimeout = function(t) {
var o = this, n = setTimeoutSafe(function() {
o._downloadingSet.has(t) && o.fireDownloadState(t, i.CommonGameListTypes.DownloadState.FAIL);
}, e.DOWNLOAD_TIMEOUT);
this._timeoutMap.set(t, n);
this.setupPollCheck(t);
};
e.prototype.setupPollCheck = function(t) {
var o = this, n = function() {
o._downloadingSet.has(t) && (o.isBundleLoadComplete(t) ? o.fireDownloadState(t, i.CommonGameListTypes.DownloadState.SUCCESS) : o._pollTimerMap.set(t, setTimeoutSafe(n, e.POLL_INTERVAL)));
};
this._pollTimerMap.set(t, setTimeoutSafe(n, e.POLL_INTERVAL));
};
e.prototype.isBundleLoadComplete = function(e) {
if (!hs.gameLobbyInfo.isRemote(e)) return hs.gameLobbyBundleVersionInfo.checkBundleIsNew(e);
var t = cc.assetManager.downloader.bundleVers[e], o = t ? "" + t : null;
if (!o) return !1;
var n = hs.gameLobbyBundleVersionInfo.getBundleVersionByBundleName(e), a = hs.storage.getItem(e + "minigame_loadCompolete", "");
return n === o && a === o;
};
e.prototype.clearTimeout = function(e) {
var t = this._timeoutMap.get(e);
if (t) {
clearTimeout(t);
this._timeoutMap.delete(e);
}
this.clearPollTimer(e);
};
e.prototype.clearPollTimer = function(e) {
var t = this._pollTimerMap.get(e);
if (t) {
clearTimeout(t);
this._pollTimerMap.delete(e);
}
};
e.prototype.fireDownloadState = function(e, t) {
if (this._downloadingSet.has(e)) {
this._downloadingSet.delete(e);
this.clearTimeout(e);
this._downloader && this._downloader.loadEmitter.fire({
gameName: e,
state: t,
finish: t === i.CommonGameListTypes.DownloadState.SUCCESS ? 1 : 0,
total: 1
});
}
};
e.prototype.onMiniGamePreload = function(e) {
var t, o, n, a, r;
if (this._downloader) {
var s = null === (t = null == e ? void 0 : e.data) || void 0 === t ? void 0 : t.bundleName;
if (s && this._downloader.loadHistory.get(s)) {
var m = null !== (n = null === (o = null == e ? void 0 : e.data) || void 0 === o ? void 0 : o.finish) && void 0 !== n ? n : 0, l = null !== (r = null === (a = null == e ? void 0 : e.data) || void 0 === a ? void 0 : a.total) && void 0 !== r ? r : 0, d = i.CommonGameListTypes.DownloadState.PENDING, u = !1;
switch (e.eventType) {
case hs.GameLobbyEmitEventType.MINIGAME_PROGRESS:
if (!this._downloadingSet.has(s)) return;
d = i.CommonGameListTypes.DownloadState.PENDING;
break;

case hs.GameLobbyEmitEventType.MINIGAME_LOAD_COMPOLETE:
d = i.CommonGameListTypes.DownloadState.SUCCESS;
u = !0;
break;

case hs.GameLobbyEmitEventType.MINIGAME_LOAD_ERROR:
d = i.CommonGameListTypes.DownloadState.FAIL;
u = !0;
break;

default:
return;
}
u ? this.fireDownloadState(s, d) : this._downloader.loadEmitter.fire({
gameName: s,
state: d,
finish: m,
total: l
});
}
}
};
e.DOWNLOAD_TIMEOUT = 6e4;
e.POLL_INTERVAL = 3e3;
e.LOCAL_GAMES = new Set([ hs.GameLobbyBundleName.GL_BLOCK_SLIDE ]);
return e;
}();
o.CommonGameListDownloaderLegacy = r;
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloaderSand: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "58910IDmOpAJrAcCTNoxeJO", "CommonGameListDownloaderSand");
var n = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(a, i) {
function r(e) {
try {
m(n.next(e));
} catch (e) {
i(e);
}
}
function s(e) {
try {
m(n.throw(e));
} catch (e) {
i(e);
}
}
function m(e) {
e.done ? a(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(r, s);
var t;
}
m((n = n.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var o, n, a, i, r = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(e) {
return function(t) {
return m([ e, t ]);
};
}
function m(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (o = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, i[1])).done) return a;
(n = 0, a) && (i = [ 2 & i[0], a.value ]);
switch (i[0]) {
case 0:
case 1:
a = i;
break;

case 4:
r.label++;
return {
value: i[1],
done: !1
};

case 5:
r.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(a = r.trys, a = a.length > 0 && a[a.length - 1]) && (6 === i[0] || 2 === i[0])) {
r = 0;
continue;
}
if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
r.label = i[1];
break;
}
if (6 === i[0] && r.label < a[1]) {
r.label = a[1];
a = i;
break;
}
if (a && r.label < a[2]) {
r.label = a[2];
r.ops.push(i);
break;
}
a[2] && r.ops.pop();
r.trys.pop();
continue;
}
i = t.call(e, r);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = a = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, i = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, o = t && e[t], n = 0;
if (o) return o.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && n >= e.length && (e = void 0);
return {
value: e && e[n++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListDownloaderSand = void 0;
var r = e("../CommonGameListTypes"), s = function() {
function e() {
this._isDownloading = !1;
}
e.prototype.checkGameDownloadState = function() {
if (hs.sandInfo.isLocalMode()) return !0;
var e = this.loadLocalBundleVersions();
hs.sandResLoadInfo.setResMd5(e);
return hs.sandInfo.getDownloaded(hs.sandResLoadInfo.resMd5Str);
};
e.prototype.init = function(e) {
this._downloader = e;
};
e.prototype.clear = function() {
this._downloader = void 0;
this._isDownloading = !1;
};
e.prototype._fireDownloadState = function(e, t, o, n) {
this._downloader && this._downloader.loadEmitter.fire({
gameName: e,
state: t,
finish: o,
total: n
});
};
e.prototype.loadLocalBundleVersions = function() {
return hs.sandResLoadInfo.loadLocalBundleVersions();
};
e.prototype.startDownload = function(e) {
this._isDownloading || this._doDownload(e);
};
e.prototype._loadAllAssetsConcurrent = function(t, o) {
return new Promise(function(n) {
var a = [];
t.getDirWithPath("", null, a);
if (a && 0 !== a.length) for (var i = a.length, r = 0, s = 0, m = !1, l = function() {
if (!m) if (s >= i) r >= i && n(!0); else {
var e = s++;
t.preload(a[e], void 0, function(e) {
if (!m) if (e) {
m = !0;
n(!1);
} else {
r++;
null == o || o(r, i);
l();
}
});
}
}, d = Math.min(e.CONCURRENCY, i), u = 0; u < d; u++) l(); else n(!0);
});
};
e.prototype._doDownload = function(e) {
return n(this, void 0, void 0, function() {
var t, o, n, i, s, m, l, d, u, c, p = this;
return a(this, function(h) {
switch (h.label) {
case 0:
t = e.gameName;
o = this.loadLocalBundleVersions();
hs.ResLoader.addBundleVers(o);
hs.sandResLoadInfo.setResMd5(o);
n = hs.sandInfo.getBundles();
i = n.length;
s = hs.sandInfo.getDownloaded(hs.sandResLoadInfo.resMd5Str);
m = hs.sandInfo.isLocalMode();
if (!s && !m) return [ 3, 8 ];
h.label = 1;

case 1:
h.trys.push([ 1, 6, , 7 ]);
c = 0;
h.label = 2;

case 2:
if (!(c < i)) return [ 3, 5 ];
l = n[c];
return [ 4, hs.sandResLoadInfo.sandLoadBundle(l.name) ];

case 3:
if (!h.sent()) {
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.FAIL, c, i);
return [ 2 ];
}
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.PENDING, c + 1, i);
h.label = 4;

case 4:
c++;
return [ 3, 2 ];

case 5:
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.SUCCESS, i, i);
return [ 3, 7 ];

case 6:
h.sent();
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.FAIL, 0, i);
return [ 3, 7 ];

case 7:
return [ 2 ];

case 8:
if (cc.sys.getNetworkType() === cc.sys.NetworkType.NONE) {
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.FAIL, 0, i);
return [ 2 ];
}
if (hs.sandResLoadInfo.isLoading) {
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.FAIL, 0, i);
return [ 2 ];
}
this._isDownloading = !0;
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.PENDING, 0, i);
h.label = 9;

case 9:
h.trys.push([ 9, 14, , 15 ]);
d = function(e) {
var o, s, m, l, d;
return a(this, function(a) {
switch (a.label) {
case 0:
o = n[e];
return [ 4, hs.sandResLoadInfo.sandLoadBundle(o.name) ];

case 1:
if (!(s = a.sent())) throw new Error(o.name + " bundle load failed");
m = e;
return [ 4, u._loadAllAssetsConcurrent(s, function(e, o) {
var n, a = (m + e / o) / i;
null === (n = p._downloader) || void 0 === n || n.loadEmitter.fire({
gameName: t,
state: r.CommonGameListTypes.DownloadState.PENDING,
progress: a
});
}) ];

case 2:
l = a.sent();
return s.name != hs.SandBundleNames.SANDCRUSH ? [ 3, 5 ] : (d = l) ? [ 4, u._preloadScene(s) ] : [ 3, 4 ];

case 3:
d = a.sent();
a.label = 4;

case 4:
l = d;
a.label = 5;

case 5:
if (!l) throw new Error(o.name + " assets load failed");
return [ 2 ];
}
});
};
u = this;
c = 0;
h.label = 10;

case 10:
return c < i ? [ 5, d(c) ] : [ 3, 13 ];

case 11:
h.sent();
h.label = 12;

case 12:
c++;
return [ 3, 10 ];

case 13:
hs.sandInfo.setDownloadedMd5Str(hs.sandResLoadInfo.resMd5Str);
this._isDownloading = !1;
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.SUCCESS, i, i);
return [ 3, 15 ];

case 14:
h.sent();
this._isDownloading = !1;
this._fireDownloadState(t, r.CommonGameListTypes.DownloadState.FAIL, 0, i);
return [ 3, 15 ];

case 15:
return [ 2 ];
}
});
});
};
e.prototype._preloadScene = function(t) {
return n(this, void 0, void 0, function() {
var o, n, r, s, m, l, d, u, c;
return a(this, function(p) {
switch (p.label) {
case 0:
o = e.PRELOAD_SCENE_TIMEOUT;
n = !0;
r = function(e) {
var i;
return a(this, function(a) {
switch (a.label) {
case 0:
return (i = n) ? [ 4, new Promise(function(n) {
var a = !1, i = setTimeout(function() {
if (!a) {
a = !0;
n(!1);
}
}, o);
t.preloadScene(e, function(e) {
if (!a) {
a = !0;
clearTimeout(i);
n(!e);
}
});
}) ] : [ 3, 2 ];

case 1:
i = a.sent();
a.label = 2;

case 2:
n = i;
return [ 2 ];
}
});
};
p.label = 1;

case 1:
p.trys.push([ 1, 6, 7, 8 ]);
s = i(e.PRELOAD_SCENE), m = s.next();
p.label = 2;

case 2:
if (m.done) return [ 3, 5 ];
l = m.value;
return [ 5, r(l) ];

case 3:
p.sent();
p.label = 4;

case 4:
m = s.next();
return [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
d = p.sent();
u = {
error: d
};
return [ 3, 8 ];

case 7:
try {
m && !m.done && (c = s.return) && c.call(s);
} finally {
if (u) throw u.error;
}
return [ 7 ];

case 8:
return [ 2, n ];
}
});
});
};
e.CONCURRENCY = 10;
e.PRELOAD_SCENE_TIMEOUT = 3e4;
e.PRELOAD_SCENE = [ "sand", "start" ];
return e;
}();
o.CommonGameListDownloaderSand = s;
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes"
} ],
CommonGameListDownloader: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "8787dCxCptLI5/JK2s5QxU5", "CommonGameListDownloader");
var n = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.commonGameListDownloader = o.CommonGameListDownloader = void 0;
var a = e("./CommonGameListDownloaderAtom"), i = e("./CommonGameListDownloaderLegacy"), r = e("./CommonGameListDownloaderSand"), s = e("../CommonGameListTypes"), m = e("./CommonGameListDownloaderChapter"), l = e("./CommonGameListDownloaderDT"), d = function() {
function e() {
this._downloaderMap = new Map();
this._loadEmitter = new hs.Emitter();
this.loadHistory = new Map();
}
e.prototype.init = function(e) {
var t = this;
this._loadEmitter.event(e);
this._downloaderMap.set(s.CommonGameListTypes.GameType.LEGACY, new i.CommonGameListDownloaderLegacy());
this._downloaderMap.set(s.CommonGameListTypes.GameType.SAND, new r.CommonGameListDownloaderSand());
this._downloaderMap.set(s.CommonGameListTypes.GameType.ATOM, new a.CommonGameListDownloaderAtom());
this._downloaderMap.set(s.CommonGameListTypes.GameType.CHAPTER, new m.CommonGameListDownloaderChapter());
this.isDoubleTileEnabled() && this._downloaderMap.set(s.CommonGameListTypes.GameType.DOUBLE_TILE, new l.CommonGameListDownloaderDT());
this._downloaderMap.forEach(function(e) {
return e.init(t);
});
};
e.prototype.clear = function() {
this._downloaderMap.forEach(function(e) {
return e.clear();
});
this._downloaderMap.clear();
this.loadHistory.clear();
this._loadEmitter.dispose();
};
e.prototype.startDownload = function(e) {
var t;
if (e.download !== s.CommonGameListTypes.DownloadState.SUCCESS && e.download !== s.CommonGameListTypes.DownloadState.PENDING) {
this.loadHistory.set(e.gameName, e);
this._loadEmitter.fire({
gameName: e.gameName,
state: s.CommonGameListTypes.DownloadState.PENDING
});
null === (t = this.getDownloader(e.type)) || void 0 === t || t.startDownload(e);
var o = hs.atomengine4Info.getCommonGameTrackParams(e);
o && DS("g_setup_event", {
game_type: o.game_type,
game_subtype: o.game_subtype,
step: "下载开始"
});
}
};
e.prototype.checkGameDownloadState = function(e) {
var t, o;
return null !== (o = null === (t = this.getDownloader(e.type)) || void 0 === t ? void 0 : t.checkGameDownloadState(e)) && void 0 !== o && o;
};
e.prototype.getDownloader = function(e) {
return this._downloaderMap.get(e);
};
e.prototype.isDoubleTileEnabled = function() {
var e, t;
return !!(null === (t = null === (e = hs.traitConfigInfo) || void 0 === e ? void 0 : e.traitsClassNameMap) || void 0 === t ? void 0 : t.MahjongMoreGameEntryTrait);
};
Object.defineProperty(e.prototype, "loadEmitter", {
get: function() {
return this._loadEmitter;
},
enumerable: !1,
configurable: !0
});
return n([ classId("CommonGameListDownloader"), classMethodWatch() ], e);
}();
o.CommonGameListDownloader = d;
o.commonGameListDownloader = new d();
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes",
"./CommonGameListDownloaderAtom": "CommonGameListDownloaderAtom",
"./CommonGameListDownloaderChapter": "CommonGameListDownloaderChapter",
"./CommonGameListDownloaderDT": "CommonGameListDownloaderDT",
"./CommonGameListDownloaderLegacy": "CommonGameListDownloaderLegacy",
"./CommonGameListDownloaderSand": "CommonGameListDownloaderSand"
} ],
CommonGameListEntryAtom: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "c5ec9DPwsNIu7AoK5p/lPDR", "CommonGameListEntryAtom");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntryAtom = void 0;
var r = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.init = function(t) {
e.prototype.init.call(this, t);
hs.atomOriginalInfo.destroyEmitter.event(this.onDestroy, this);
};
t.prototype.onDestroy = function(e) {
var t;
if (this.pendingInfo && e === (null === (t = this.pendingInfo.atom) || void 0 === t ? void 0 : t.worldId)) {
hs.atomengine4Info.showOtherUI(hs.AtomOriginalWorldId);
this.recoverPage();
}
};
t.prototype.recoverPage = function() {
hs.UI.activeState(hs.PrefabConfig.ClassGame.url) ? hs.UI.show(hs.PrefabConfig.GLHallMoreGamesPopupView, hs.gameAlertLayer) : hs.EventManager.dispatchModuleEvent(new hs.E_HomePage_Recover());
};
t.prototype.hidePage = function() {
var e = hs.UI.activeState(hs.PrefabConfig.GLHallMoreGamesPopupView.url);
if (!hs.UI.activeState(hs.PrefabConfig.ClassGame.url)) {
var t = e ? hs.HomePageSnapshotType.HOME_PAGE | hs.HomePageSnapshotType.MORE_GAME_POPUP_VIEW : hs.HomePageSnapshotType.HOME_PAGE;
hs.homePageInfo.setGameListSnapshot(t);
hs.UI.hideUI(hs.homePageInfo.homeConfig);
}
e && hs.UI.hideUI(hs.PrefabConfig.GLHallMoreGamesPopupView);
};
t.prototype.onEnter = function(e) {
var t;
this.pendingInfo = e;
hs.atomOriginalInfo.createWorld(null === (t = e.atom) || void 0 === t ? void 0 : t.worldId);
hs.atomengine4Info.hideOtherUI();
this.hidePage();
};
t.BGM_FADE_OUT_DURATION = 200;
t.BGM_FADE_OUT_TICK = 40;
return i([ classId("CommonGameListEntryAtom"), classMethodWatch() ], t);
}(e("./CommonGameListEntryBase").CommonGameListEntryBase);
o.CommonGameListEntryAtom = r;
cc._RF.pop();
}, {
"./CommonGameListEntryBase": "CommonGameListEntryBase"
} ],
CommonGameListEntryBase: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "157b8FGsj1OnKrZ7S59C/04", "CommonGameListEntryBase");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntryBase = void 0;
var n = function() {
function e() {}
Object.defineProperty(e.prototype, "entry", {
get: function() {
return this._entry;
},
enumerable: !1,
configurable: !0
});
e.prototype.init = function(e) {
this._entry = e;
};
e.prototype.clear = function() {
this._entry = void 0;
};
return e;
}();
o.CommonGameListEntryBase = n;
cc._RF.pop();
}, {} ],
CommonGameListEntryChapter: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "c118fKuHllDU6HrmiqvJpYj", "CommonGameListEntryChapter");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(a, i) {
function r(e) {
try {
m(n.next(e));
} catch (e) {
i(e);
}
}
function s(e) {
try {
m(n.throw(e));
} catch (e) {
i(e);
}
}
function m(e) {
e.done ? a(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(r, s);
var t;
}
m((n = n.apply(e, t || [])).next());
});
}, r = this && this.__generator || function(e, t) {
var o, n, a, i, r = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(e) {
return function(t) {
return m([ e, t ]);
};
}
function m(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (o = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, i[1])).done) return a;
(n = 0, a) && (i = [ 2 & i[0], a.value ]);
switch (i[0]) {
case 0:
case 1:
a = i;
break;

case 4:
r.label++;
return {
value: i[1],
done: !1
};

case 5:
r.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(a = r.trys, a = a.length > 0 && a[a.length - 1]) && (6 === i[0] || 2 === i[0])) {
r = 0;
continue;
}
if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
r.label = i[1];
break;
}
if (6 === i[0] && r.label < a[1]) {
r.label = a[1];
a = i;
break;
}
if (a && r.label < a[2]) {
r.label = a[2];
r.ops.push(i);
break;
}
a[2] && r.ops.pop();
r.trys.pop();
continue;
}
i = t.call(e, r);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = a = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntryChapter = void 0;
var s = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._loadingNode = null;
t._maskNode = null;
t._loadingAnim = null;
t._loadingTimer = null;
return t;
}
t.prototype.init = function(t) {
e.prototype.init.call(this, t);
};
t.prototype.onSceneChanged = function() {
this.hideLoadingUI();
hs.UI.hideUI(hs.PrefabConfig.GLHallMoreGamesPopupView);
};
t.prototype.onEnter = function(e) {
return i(this, void 0, Promise, function() {
var t;
return r(this, function(o) {
switch (o.label) {
case 0:
return (t = e.gameName) ? [ 4, this.showLoadingUI() ] : [ 2 ];

case 1:
o.sent();
try {
if (!hs.homePageInfo.isInHomePage) {
this.backToHomeAndEnterChapter(t);
return [ 2 ];
}
this.doEnterChapter(t);
} catch (e) {
this.hideLoadingUI();
}
return [ 2 ];
}
});
});
};
t.prototype.backToHomeAndEnterChapter = function(e) {
hs.EventManager.dispatchModuleEvent(new hs.E_Setup_Click(hs.enSetupIosKeys.ios_home));
this.doEnterChapter(e);
};
t.prototype.doEnterChapter = function() {
hs.homePageInfo.setGameListSnapshot(hs.HomePageSnapshotType.HOME_PAGE);
hs.homePageInfo.checkNeedGoNextPeriods();
hs.EventManager.dispatchModuleEvent(new hs.E_HomePage_Game(hs.GameType.Chapter));
DC("ui_theme_icon_click", {
icon_type: "2"
});
};
t.prototype.showLoadingUI = function() {
return i(this, void 0, Promise, function() {
var e, t, o, n;
return r(this, function(a) {
switch (a.label) {
case 0:
this.clearLoadingTimer();
if (cc.isValid(this._loadingNode)) {
this._loadingNode.active = !0;
this._loadingNode.setSiblingIndex(this._loadingNode.parent.childrenCount);
cc.isValid(this._maskNode) && (this._maskNode.active = !0);
if (cc.isValid(this._loadingAnim)) {
this._loadingAnim.node.active = !0;
this._loadingAnim.playAnimation("loading_ani", 0);
}
this.startLoadingTimer();
return [ 2 ];
}
return [ 4, hs.ResLoader.asyncLoad(hs.PrefabConfig.HomePageMoreGameLoading.url, cc.Prefab) ];

case 1:
if (!(e = a.sent())) return [ 2 ];
this._loadingNode = cc.instantiate(e);
this._loadingNode.addComponent(cc.BlockInputEvents);
(t = this._loadingNode.addComponent(cc.Widget)).isAlignTop = !0;
t.isAlignBottom = !0;
t.isAlignLeft = !0;
t.isAlignRight = !0;
t.top = 0;
t.bottom = 0;
t.left = 0;
t.right = 0;
hs.alertLayer.addChild(this._loadingNode);
this._maskNode = this._loadingNode.getChildByName("mask");
o = this._loadingNode.getChildByName("loading");
cc.isValid(o) && (this._loadingAnim = o.getComponent(dragonBones.ArmatureDisplay));
n = this._loadingNode.getChildByName("nonet");
cc.isValid(n) && (n.active = !1);
this._loadingNode.active = !0;
cc.isValid(this._maskNode) && (this._maskNode.active = !0);
if (cc.isValid(this._loadingAnim)) {
this._loadingAnim.node.active = !0;
this._loadingAnim.playAnimation("loading_ani", 0);
}
this.startLoadingTimer();
return [ 2 ];
}
});
});
};
t.prototype.hideLoadingUI = function() {
this.clearLoadingTimer();
cc.isValid(this._loadingNode) && this._loadingNode.destroy();
this._loadingNode = null;
this._maskNode = null;
this._loadingAnim = null;
};
t.prototype.startLoadingTimer = function() {
var e = this;
this._loadingTimer = setTimeout(function() {
e._loadingTimer = null;
e.hideLoadingUI();
}, 15e3);
};
t.prototype.clearLoadingTimer = function() {
if (null !== this._loadingTimer) {
clearTimeout(this._loadingTimer);
this._loadingTimer = null;
}
};
return t;
}(e("./CommonGameListEntryBase").CommonGameListEntryBase);
o.CommonGameListEntryChapter = s;
cc._RF.pop();
}, {
"./CommonGameListEntryBase": "CommonGameListEntryBase"
} ],
CommonGameListEntryDT: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "60d01fUI+5L94l39RpZm33D", "CommonGameListEntryDT");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(a, i) {
function r(e) {
try {
m(n.next(e));
} catch (e) {
i(e);
}
}
function s(e) {
try {
m(n.throw(e));
} catch (e) {
i(e);
}
}
function m(e) {
e.done ? a(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(r, s);
var t;
}
m((n = n.apply(e, t || [])).next());
});
}, r = this && this.__generator || function(e, t) {
var o, n, a, i, r = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(e) {
return function(t) {
return m([ e, t ]);
};
}
function m(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (o = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, i[1])).done) return a;
(n = 0, a) && (i = [ 2 & i[0], a.value ]);
switch (i[0]) {
case 0:
case 1:
a = i;
break;

case 4:
r.label++;
return {
value: i[1],
done: !1
};

case 5:
r.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(a = r.trys, a = a.length > 0 && a[a.length - 1]) && (6 === i[0] || 2 === i[0])) {
r = 0;
continue;
}
if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
r.label = i[1];
break;
}
if (6 === i[0] && r.label < a[1]) {
r.label = a[1];
a = i;
break;
}
if (a && r.label < a[2]) {
r.label = a[2];
r.ops.push(i);
break;
}
a[2] && r.ops.pop();
r.trys.pop();
continue;
}
i = t.call(e, r);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = a = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntryDT = void 0;
var s = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onEnter = function(e) {
var t, o;
return i(this, void 0, Promise, function() {
return r(this, function(n) {
switch (n.label) {
case 0:
return [ 4, null === (o = null === (t = this.getDoubleTileTrait()) || void 0 === t ? void 0 : t.enterDoubleTileFromCommonGameList) || void 0 === o ? void 0 : o.call(t, e, this.entry) ];

case 1:
n.sent();
return [ 2 ];
}
});
});
};
t.prototype.clear = function() {
var t, o;
e.prototype.clear.call(this);
null === (o = null === (t = this.getDoubleTileTrait()) || void 0 === t ? void 0 : t.clearDoubleTileCommonGameEntry) || void 0 === o || o.call(t);
};
t.prototype.getDoubleTileTrait = function() {
var e = TRAIT("MahjongMoreGameEntryTrait");
return !0 !== (null == e ? void 0 : e.active) ? null : e;
};
return t;
}(e("./CommonGameListEntryBase").CommonGameListEntryBase);
o.CommonGameListEntryDT = s;
cc._RF.pop();
}, {
"./CommonGameListEntryBase": "CommonGameListEntryBase"
} ],
CommonGameListEntryLegacy: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "23f75Eb4xhHD5VUgNi7Awc4", "CommonGameListEntryLegacy");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
});
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntryLegacy = void 0;
var i = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onEnter = function(e) {
var t = e.gameName;
if (t) {
if (hs.homePageInfo.isInHomePage) {
var o = hs.homePageMiniGameInfo.dcMiniGameIconType[t];
o && DC("ui_theme_icon_click", {
icon_type: o
});
}
hs.homePageInfo.isInHomePage && hs.homePageInfo.setGameListSnapshot(hs.homePageInfo.gameListSnapshot | hs.HomePageSnapshotType.HOME_PAGE);
hs.EventManager.dispatchModuleEvent(new hs.E_GameLobby_OpenMiniGame({
bundleName: t
}));
}
};
return t;
}(e("./CommonGameListEntryBase").CommonGameListEntryBase);
o.CommonGameListEntryLegacy = i;
cc._RF.pop();
}, {
"./CommonGameListEntryBase": "CommonGameListEntryBase"
} ],
CommonGameListEntrySand: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "e001dzHxpxJ2a0iOjDwtTGN", "CommonGameListEntrySand");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
}, r = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(a, i) {
function r(e) {
try {
m(n.next(e));
} catch (e) {
i(e);
}
}
function s(e) {
try {
m(n.throw(e));
} catch (e) {
i(e);
}
}
function m(e) {
e.done ? a(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(r, s);
var t;
}
m((n = n.apply(e, t || [])).next());
});
}, s = this && this.__generator || function(e, t) {
var o, n, a, i, r = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(e) {
return function(t) {
return m([ e, t ]);
};
}
function m(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (o = 1, n && (a = 2 & i[0] ? n.return : i[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, i[1])).done) return a;
(n = 0, a) && (i = [ 2 & i[0], a.value ]);
switch (i[0]) {
case 0:
case 1:
a = i;
break;

case 4:
r.label++;
return {
value: i[1],
done: !1
};

case 5:
r.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(a = r.trys, a = a.length > 0 && a[a.length - 1]) && (6 === i[0] || 2 === i[0])) {
r = 0;
continue;
}
if (3 === i[0] && (!a || i[1] > a[0] && i[1] < a[3])) {
r.label = i[1];
break;
}
if (6 === i[0] && r.label < a[1]) {
r.label = a[1];
a = i;
break;
}
if (a && r.label < a[2]) {
r.label = a[2];
r.ops.push(i);
break;
}
a[2] && r.ops.pop();
r.trys.pop();
continue;
}
i = t.call(e, r);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = a = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, m = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, o = t && e[t], n = 0;
if (o) return o.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && n >= e.length && (e = void 0);
return {
value: e && e[n++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListEntrySand = void 0;
var l = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._mainCanvasFitHeight = !1;
t._mainCanvasFitWidth = !1;
t._preSpeed = 1;
t._loadingNode = null;
t._maskNode = null;
t._loadingAnim = null;
return t;
}
t.prototype.onEnter = function(e) {
return r(this, void 0, Promise, function() {
var t, o, n, a, i, r, l, d, u, c;
return s(this, function(s) {
switch (s.label) {
case 0:
if (!(t = e.gameName)) return [ 2 ];
hs.homePageInfo.isInHomePage && (o = hs.homePageMiniGameInfo.dcMiniGameIconType[t]) && DC("ui_theme_icon_click", {
icon_type: o
});
hs.homePageInfo.setGameListSnapshot(hs.HomePageSnapshotType.HOME_PAGE);
DC("ui_theme_sand_click", {
name: "ui_theme_sand_click"
});
return [ 4, this.showLoadingUI() ];

case 1:
s.sent();
s.label = 2;

case 2:
s.trys.push([ 2, 11, , 12 ]);
n = hs.sandResLoadInfo.loadLocalBundleVersions();
hs.ResLoader.addBundleVers(n);
hs.sandResLoadInfo.setResMd5(n);
a = hs.sandInfo.getBundles();
s.label = 3;

case 3:
s.trys.push([ 3, 8, 9, 10 ]);
i = m(a), r = i.next();
s.label = 4;

case 4:
if (r.done) return [ 3, 7 ];
l = r.value;
return [ 4, hs.sandResLoadInfo.sandLoadBundle(l.name) ];

case 5:
if (!s.sent()) {
this.showFailedUI();
this.entry.entryEmitter.fire({
gameName: t
});
return [ 2 ];
}
s.label = 6;

case 6:
r = i.next();
return [ 3, 4 ];

case 7:
return [ 3, 10 ];

case 8:
d = s.sent();
u = {
error: d
};
return [ 3, 10 ];

case 9:
try {
r && !r.done && (c = i.return) && c.call(i);
} finally {
if (u) throw u.error;
}
return [ 7 ];

case 10:
this.hideLoadingUI();
this.enterSandGame();
this.entry.entryEmitter.fire({
gameName: t
});
return [ 3, 12 ];

case 11:
s.sent();
this.showFailedUI();
this.entry.entryEmitter.fire({
gameName: t
});
return [ 3, 12 ];

case 12:
return [ 2 ];
}
});
});
};
t.prototype.showLoadingUI = function() {
return r(this, void 0, Promise, function() {
var e, t, o, n;
return s(this, function(a) {
switch (a.label) {
case 0:
if (cc.isValid(this._loadingNode)) {
this._loadingNode.active = !0;
this._loadingNode.setSiblingIndex(this._loadingNode.parent.childrenCount);
cc.isValid(this._maskNode) && (this._maskNode.active = !0);
if (cc.isValid(this._loadingAnim)) {
this._loadingAnim.node.active = !0;
this._loadingAnim.playAnimation("loading_ani", 0);
}
return [ 2 ];
}
return [ 4, hs.ResLoader.asyncLoad(hs.PrefabConfig.HomePageMoreGameLoading.url, cc.Prefab) ];

case 1:
if (!(e = a.sent())) return [ 2 ];
this._loadingNode = cc.instantiate(e);
this._loadingNode.addComponent(cc.BlockInputEvents);
(t = this._loadingNode.addComponent(cc.Widget)).isAlignTop = !0;
t.isAlignBottom = !0;
t.isAlignLeft = !0;
t.isAlignRight = !0;
t.top = 0;
t.bottom = 0;
t.left = 0;
t.right = 0;
hs.alertLayer.addChild(this._loadingNode);
this._maskNode = this._loadingNode.getChildByName("mask");
o = this._loadingNode.getChildByName("loading");
cc.isValid(o) && (this._loadingAnim = o.getComponent(dragonBones.ArmatureDisplay));
n = this._loadingNode.getChildByName("nonet");
cc.isValid(n) && (n.active = !1);
this._loadingNode.active = !0;
cc.isValid(this._maskNode) && (this._maskNode.active = !0);
if (cc.isValid(this._loadingAnim)) {
this._loadingAnim.node.active = !0;
this._loadingAnim.playAnimation("loading_ani", 0);
}
return [ 2 ];
}
});
});
};
t.prototype.hideLoadingUI = function() {
cc.isValid(this._loadingNode) && this._loadingNode.destroy();
this._loadingNode = null;
this._maskNode = null;
this._loadingAnim = null;
};
t.prototype.showFailedUI = function() {
var e = this;
if (cc.isValid(this._loadingAnim)) {
this._loadingAnim.node.active = !0;
this._loadingAnim.playAnimation("loading_ani_Failed", 1);
this._loadingAnim.once(dragonBones.EventObject.COMPLETE, function() {
e.hideLoadingUI();
}, this);
} else this.hideLoadingUI();
};
t.prototype.enterSandGame = function() {
var e = this;
this._mainCanvasFitHeight = cc.Canvas.instance.fitHeight;
this._mainCanvasFitWidth = cc.Canvas.instance.fitWidth;
hs.sandInfo.setIsFirstPlay(!1);
var t = window._kspeed, o = cc.director._kSpeed;
this._preSpeed = t > o ? t : o;
hs.SandBridge.initHsGameEnvironment();
hs.SandBridge.initSandEnvironment();
window.sand.BBA_SandSetup_exitGame = function() {
e.exitSandGame();
};
hs.scene.switch(hs.SandSceneNames.SAND, function() {
hs.homePageInfo.setGameListSnapshot(hs.homePageInfo.gameListSnapshot | hs.HomePageSnapshotType.MORE_GAME_POPUP_VIEW);
hs.UI.activeState(hs.PrefabConfig.ClassGame.url) && hs.UI.hideUI(hs.PrefabConfig.ClassGame);
hs.sandInfo.setIsInSandGame(!0);
hs.NativeGameMode.callNativeGameMode(hs.GameType.StarMiniGame);
});
cc.systemEvent.on(cc.SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this);
};
t.prototype.exitSandGame = function() {
var e = this;
hs.sandInfo.setIsInSandGame(!1);
cc.systemEvent.off(cc.SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this);
hs.scene.switch(hs.SandSceneNames.MAIN, function() {
cc.Canvas.instance.fitHeight = e._mainCanvasFitHeight;
cc.Canvas.instance.fitWidth = e._mainCanvasFitWidth;
e.recoverHomePage();
});
this._preSpeed > 1 && (cc.director._kSpeed = this._preSpeed);
};
t.prototype.recoverHomePage = function() {
hs.EventManager.dispatchModuleEvent(new hs.E_HomePage_Recover());
};
t.prototype.onKeyDown = function(e) {
e.keyCode === cc.macro.KEY.back && hs.backSpaceInfo.backExitSand() && this.exitSandGame();
};
return i([ classId("CommonGameListEntrySand"), classMethodWatch() ], t);
}(e("./CommonGameListEntryBase").CommonGameListEntryBase);
o.CommonGameListEntrySand = l;
cc._RF.pop();
}, {
"./CommonGameListEntryBase": "CommonGameListEntryBase"
} ],
CommonGameListEntry: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "1c5f77y2JBLPa0AjM3L7KJm", "CommonGameListEntry");
var n = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.commonGameListEntry = o.CommonGameListEntry = void 0;
var a = e("../CommonGameListTypes"), i = e("./CommonGameListEntryAtom"), r = e("./CommonGameListEntryChapter"), s = e("./CommonGameListEntryDT"), m = e("./CommonGameListEntryLegacy"), l = e("./CommonGameListEntrySand"), d = function() {
function e() {
this._entryMap = new Map();
this._entryEmitter = new hs.Emitter();
}
Object.defineProperty(e.prototype, "entryEmitter", {
get: function() {
return this._entryEmitter;
},
enumerable: !1,
configurable: !0
});
e.prototype.init = function(e) {
var t = this;
this._entryEmitter.event(e);
this._entryMap.set(a.CommonGameListTypes.GameType.LEGACY, new m.CommonGameListEntryLegacy());
this._entryMap.set(a.CommonGameListTypes.GameType.SAND, new l.CommonGameListEntrySand());
this._entryMap.set(a.CommonGameListTypes.GameType.ATOM, new i.CommonGameListEntryAtom());
this._entryMap.set(a.CommonGameListTypes.GameType.CHAPTER, new r.CommonGameListEntryChapter());
this.isDoubleTileEnabled() && this._entryMap.set(a.CommonGameListTypes.GameType.DOUBLE_TILE, new s.CommonGameListEntryDT());
this._entryMap.forEach(function(e) {
return e.init(t);
});
};
e.prototype.clear = function() {
this._entryMap.forEach(function(e) {
return e.clear();
});
this._entryMap.clear();
this._entryEmitter.dispose();
};
e.prototype.enterGame = function(e) {
var t = this.getEntry(e.type);
t && Promise.resolve(t.onEnter(e)).catch(function() {});
};
e.prototype.handleChapterSceneChanged = function() {
var e = this._entryMap.get(a.CommonGameListTypes.GameType.CHAPTER);
e && e instanceof r.CommonGameListEntryChapter && e.onSceneChanged();
};
e.prototype.getEntry = function(e) {
return this._entryMap.get(e);
};
e.prototype.isDoubleTileEnabled = function() {
var e, t;
return !!(null === (t = null === (e = hs.traitConfigInfo) || void 0 === e ? void 0 : e.traitsClassNameMap) || void 0 === t ? void 0 : t.MahjongMoreGameEntryTrait);
};
return n([ classId("CommonGameListEntry"), classMethodWatch() ], e);
}();
o.CommonGameListEntry = d;
o.commonGameListEntry = new d();
cc._RF.pop();
}, {
"../CommonGameListTypes": "CommonGameListTypes",
"./CommonGameListEntryAtom": "CommonGameListEntryAtom",
"./CommonGameListEntryChapter": "CommonGameListEntryChapter",
"./CommonGameListEntryDT": "CommonGameListEntryDT",
"./CommonGameListEntryLegacy": "CommonGameListEntryLegacy",
"./CommonGameListEntrySand": "CommonGameListEntrySand"
} ],
CommonGameListGames: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "13992kK8KlCZa0y2n+XcuiL", "CommonGameListGames");
var n = this && this.__assign || function() {
return (n = Object.assign || function(e) {
for (var t, o = 1, n = arguments.length; o < n; o++) {
t = arguments[o];
for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
}
return e;
}).apply(this, arguments);
}, a = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
}, i = this && this.__read || function(e, t) {
var o = "function" == typeof Symbol && e[Symbol.iterator];
if (!o) return e;
var n, a, i = o.call(e), r = [];
try {
for (;(void 0 === t || t-- > 0) && !(n = i.next()).done; ) r.push(n.value);
} catch (e) {
a = {
error: e
};
} finally {
try {
n && !n.done && (o = i.return) && o.call(i);
} finally {
if (a) throw a.error;
}
}
return r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.commonGameListGames = void 0;
var r = e("./CommonGameListConsts"), s = e("./CommonGameListTypes"), m = e("./downloader/CommonGameListDownloader"), l = 6048e5, d = function() {
function e() {
this.newDayMS = l;
}
t = e;
e.prototype.setNewDays = function(e) {
void 0 === e && (e = 7);
e || (e = 7);
e < 0 && (e = 0);
this.newDayMS = 864e5 * e;
};
e.prototype.getNewDayMS = function() {
return this.newDayMS;
};
e.prototype.storeConfig = function(e) {
var o = this, n = this.innerGetGameInfoList(), a = this.innerGetHitGameTimestamps();
n = n.filter(function(t) {
return t.type === s.CommonGameListTypes.GameType.CHAPTER || e.some(function(e) {
return e.gameName === t.gameName;
});
});
e.forEach(function(e, t) {
if (!n.some(function(t) {
return t.gameName === e.gameName;
})) {
var i = o.getInitialGameInfo(e);
i && n.push(i);
a[e.gameName] = i ? i.timestamp : Date.now();
a[e.gameName] += 1e3 * t;
}
});
hs.storage.setItem(t.STORAGE_KEY_HIT_GAMES, a);
Object.entries(r.DEFAULT_GAME_BUNDLE_VERSION).forEach(function(e) {
var t = i(e, 2), n = t[0], a = t[1];
o.setGameBundleVersion(n, a);
});
this.fixGameInfo(n);
this.storeGameInfoList(n);
};
e.prototype.removeChapterFromStorage = function() {
var e = this.innerGetGameInfoList(), t = e.filter(function(e) {
return e.type !== s.CommonGameListTypes.GameType.CHAPTER;
});
if (t.length === e.length) return !1;
this.storeGameInfoList(t);
return !0;
};
e.prototype.getGameInfoList = function() {
var e = this;
return Object.freeze(this.innerGetGameInfoList().filter(function(t) {
return !e.isGameExpired(t);
}));
};
e.prototype.storeGameInfoList = function(e) {
hs.storage.setItem(t.STORAGE_KEY, e);
};
e.prototype.innerGetGameInfoList = function() {
return hs.storage.getItem(t.STORAGE_KEY, []);
};
e.prototype.innerGetHitGameTimestamps = function() {
return hs.storage.getItem(t.STORAGE_KEY_HIT_GAMES, {});
};
e.prototype.getHitGameTimestamp = function(e) {
var t;
return null !== (t = this.innerGetHitGameTimestamps()[e]) && void 0 !== t ? t : Date.now();
};
e.prototype.updateClickCount = function(e, t) {
var o = this.innerGetGameInfoList();
o.forEach(function(o) {
if (o.gameName === e) {
o.clickCount = Math.floor(t);
o.lastClickTime = Date.now();
}
});
this.storeGameInfoList(o);
};
e.prototype.updateManualDownload = function(e, t) {
var o = this.innerGetGameInfoList();
o.forEach(function(o) {
o.gameName === e && (o.isManualDownload = t);
});
this.storeGameInfoList(o);
};
e.prototype.updateGameDownloadState = function(e, t) {
var o = this.innerGetGameInfoList();
o.forEach(function(o) {
if (o.gameName === e) {
if (o.download === s.CommonGameListTypes.DownloadState.SUCCESS && t !== s.CommonGameListTypes.DownloadState.SUCCESS) return;
o.download = t;
}
});
this.storeGameInfoList(o);
};
e.prototype.getInitialGameInfo = function(e) {
var t;
if (!r.DEFAULT_GAME_CONFIG[e.gameName]) return null;
var o = null !== (t = r.DEFAULT_GAME_CONFIG[e.gameName]) && void 0 !== t ? t : {}, a = "gl_blockslide" === e.gameName ? s.CommonGameListTypes.DownloadState.SUCCESS : s.CommonGameListTypes.DownloadState.NONE, i = o.trigger == s.CommonGameListTypes.DownloadTrigger.CLICK, m = !0 === e.played ? .1 : 0, l = !0 === e.played ? Date.now() : 0;
return n(n(n({
clickCount: m,
lastClickTime: l
}, o), e), {
download: a,
timestamp: Date.now(),
atom: this.getAtomConfig(e.gameName),
isManualDownload: i
});
};
e.prototype.getAtomConfig = function(e) {
return r.DEFAULT_ATOM_GAMES[e];
};
e.prototype.isGameExpired = function(e) {
return !(e.duringTime < 0) && e.timestamp + 864e5 * e.duringTime < Date.now();
};
e.prototype.setGameBundleVersion = function(e, t) {
var o;
hs.ResLoader.addBundleVers(((o = {})[e] = t, o));
};
e.prototype.fixGameInfo = function(e) {
e.forEach(function(e) {
e.type !== s.CommonGameListTypes.GameType.ATOM ? e.download = e.download === s.CommonGameListTypes.DownloadState.SUCCESS && m.commonGameListDownloader.checkGameDownloadState(e) ? s.CommonGameListTypes.DownloadState.SUCCESS : s.CommonGameListTypes.DownloadState.NONE : m.commonGameListDownloader.checkGameDownloadState(e);
});
};
e.prototype.getNewPlayedStorage = function() {
return hs.storage.getItem(t.STORAGE_KEY_NEW_PLAYED, {
lockedNewGameName: null,
lockedNewTime: 0,
lastPlayedGameName: void 0
});
};
e.prototype.saveNewPlayedStorage = function(e) {
hs.storage.setItem(t.STORAGE_KEY_NEW_PLAYED, e);
};
e.prototype.syncGameInfoList = function(e) {
var t = this.innerGetGameInfoList();
e.forEach(function(e) {
var o = t.findIndex(function(t) {
return t.gameName === e.gameName;
});
o >= 0 ? t[o] = e : t.push(e);
});
this.storeGameInfoList(t);
};
e.prototype.isNewGameCandidate = function(e) {
return !0 !== e.played && Date.now() - e.timestamp <= this.newDayMS;
};
e.prototype.isPlayedGameCandidate = function(e) {
return !0 === e.played || !this.isNewGameCandidate(e);
};
e.prototype.getNewGameCandidates = function() {
var e = this;
return this.getGameInfoList().filter(function(t) {
return e.isNewGameCandidate(t);
}).sort(function(e, t) {
return e.timestamp - t.timestamp;
});
};
e.prototype.getPlayedGameCandidates = function() {
var e = this, t = this.getGameInfoList().filter(function(t) {
return e.isPlayedGameCandidate(t);
}), o = [];
t.forEach(function(e) {
var t;
if ((null !== (t = e.clickCount) && void 0 !== t ? t : 0) <= 0) {
e.clickCount = .1;
e.lastClickTime = Date.now();
o.push(e);
}
});
o.length > 0 && this.syncGameInfoList(o);
return this.sortPlayedGameCandidates(t);
};
e.prototype.sortPlayedGameCandidates = function(e) {
return e.sort(function(e, t) {
var o, n;
return (null !== (o = t.clickCount) && void 0 !== o ? o : 0) - (null !== (n = e.clickCount) && void 0 !== n ? n : 0);
});
};
e.prototype.isLockedNewGameValid = function(e, t) {
if (null === e) return !1;
if (Date.now() - t > this.newDayMS) return !1;
var o = this.getGameInfoList().find(function(t) {
return t.gameName === e;
});
return !!o && this.isNewGameCandidate(o);
};
var t;
e.STORAGE_KEY = "CommonGameListGames_InfoList";
e.STORAGE_KEY_NEW_PLAYED = "CommonGameListGames_NewPlayed";
e.STORAGE_KEY_HIT_GAMES = "CommonGameListGames_HITTED";
return t = a([ classId("CommonGameListGames"), classMethodWatch() ], e);
}();
o.commonGameListGames = new d();
cc._RF.pop();
}, {
"./CommonGameListConsts": "CommonGameListConsts",
"./CommonGameListTypes": "CommonGameListTypes",
"./downloader/CommonGameListDownloader": "CommonGameListDownloader"
} ],
CommonGameListTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "82f0bhjmbZNhL7e7QL2wa9I", "CommonGameListTrait");
var n, a = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__assign || function() {
return (i = Object.assign || function(e) {
for (var t, o = 1, n = arguments.length; o < n; o++) {
t = arguments[o];
for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
}
return e;
}).apply(this, arguments);
}, r = this && this.__decorate || function(e, t, o, n) {
var a, i = arguments.length, r = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, n); else for (var s = e.length - 1; s >= 0; s--) (a = e[s]) && (r = (i < 3 ? a(r) : i > 3 ? a(t, o, r) : a(t, o)) || r);
return i > 3 && r && Object.defineProperty(t, o, r), r;
}, s = this && this.__rest || function(e, t) {
var o = {};
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && t.indexOf(n) < 0 && (o[n] = e[n]);
if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
var a = 0;
for (n = Object.getOwnPropertySymbols(e); a < n.length; a++) t.indexOf(n[a]) < 0 && Object.prototype.propertyIsEnumerable.call(e, n[a]) && (o[n[a]] = e[n[a]]);
}
return o;
}, m = this && this.__read || function(e, t) {
var o = "function" == typeof Symbol && e[Symbol.iterator];
if (!o) return e;
var n, a, i = o.call(e), r = [];
try {
for (;(void 0 === t || t-- > 0) && !(n = i.next()).done; ) r.push(n.value);
} catch (e) {
a = {
error: e
};
} finally {
try {
n && !n.done && (o = i.return) && o.call(i);
} finally {
if (a) throw a.error;
}
}
return r;
}, l = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(m(arguments[t]));
return e;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListTrait = void 0;
var d = e("./entry/CommonGameListEntry"), u = e("./CommonGameListConsts"), c = e("./downloader/CommonGameListDownloader"), p = e("./CommonGameListGames"), h = e("./CommonGameListTypes"), f = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._inited = !1;
t.retryCountMap = new Map();
return t;
}
t.prototype.onCreate = function() {
var e = this;
setTimeout(function() {
e._initData();
}, 1);
};
t.prototype._initData = function() {
var e, t = this;
if (!this._inited) try {
var o = null === (e = hs.traitConfigInfo.traitsClassNameMap.CommonGameListDependenciesTrait) || void 0 === e ? void 0 : e.id, n = storage.getItem("CommonGameListTrait_CommonGameListDependenciesTrait", -1);
if (-1 === n || o !== n) {
storage.setItem("CommonGameListTrait_CommonGameListDependenciesTrait", o);
storage.remove("CommonGameListGames_NewPlayed");
var a = p.commonGameListGames.getGameInfoList().filter(function(e) {
return e.type !== h.CommonGameListTypes.GameType.CHAPTER;
});
p.commonGameListGames.storeGameInfoList(a);
}
p.commonGameListGames.setNewDays(this.props.newDays);
c.commonGameListDownloader.init(this.onGameLoadStateChange.bind(this));
p.commonGameListGames.storeConfig(this.props.config.games);
d.commonGameListEntry.init(this.onEntryStateChange.bind(this));
this.restoreOutputFromStorage();
this.getFilterResult();
this.state.entryEmitter.event(this.onHandleGameEntry.bind(this));
setTimeout(function() {
t.checkDefaultDownload();
}, 2e4);
this._inited = !0;
} catch (e) {}
};
t.prototype.checkGameDownloadState = function(e) {
return c.commonGameListDownloader.checkGameDownloadState(e);
};
t.prototype.data = function() {
return {
input: {
shouldPutChapterInGameList: !1,
isNewGameRequired: !1,
isPlayedGameRequired: !1
},
output: {
isChapterInList: !1,
newGames: [],
playedGames: [],
randomGames: [],
newPlayed: {
newGame: null,
playedGame: null
}
},
updateEmitter: new hs.Emitter(),
entryEmitter: new hs.Emitter()
};
};
t.prototype.onEntryStateChange = function() {};
Object.defineProperty(t.prototype, "list", {
get: function() {
return l(p.commonGameListGames.getGameInfoList());
},
enumerable: !1,
configurable: !0
});
t.prototype.isDownloadEnabled = function() {
return !0;
};
t.prototype.clickTheGame = function(e) {
var t, o = this.getGameInfo(e);
if (o) {
var n = (null !== (t = o.clickCount) && void 0 !== t ? t : 0) + 1, a = Date.now();
p.commonGameListGames.updateClickCount(e, n);
this.updateGameInfoInOutput(e, {
clickCount: Math.floor(n),
lastClickTime: a
});
this.updatePlayedGameState();
this.updateTheClickedGameClickInfo(e, Math.floor(n), a);
this.onFinishClickGame(e, Math.floor(n));
}
};
t.prototype.onFinishClickGame = function() {};
t.prototype.onHandleGameEntry = function(e) {
var t = e.gameName, o = this.getGameInfo(t);
if (o) {
this.clickTheGame(t);
var n = o.download;
if (n !== h.CommonGameListTypes.DownloadState.SUCCESS) {
p.commonGameListGames.updateManualDownload(t, !0);
this.updateGameInfoInOutput(t, {
isManualDownload: !0
});
}
n == h.CommonGameListTypes.DownloadState.NONE || n == h.CommonGameListTypes.DownloadState.FAIL ? this.isDownloadEnabled() && c.commonGameListDownloader.startDownload(o) : n == h.CommonGameListTypes.DownloadState.PENDING ? this.isDownloadEnabled() : n == h.CommonGameListTypes.DownloadState.SUCCESS && d.commonGameListEntry.enterGame(o);
}
};
t.prototype.updateTheClickedGameClickInfo = function(e, t, o) {
var n, a, i, r, s, m;
if (e && t && o) {
if ((null === (n = this.state.output.newPlayed.playedGame) || void 0 === n ? void 0 : n.gameName) === e) {
this.state.output.newPlayed.playedGame.clickCount = t;
this.state.output.newPlayed.playedGame.lastClickTime = o;
}
if ((null === (a = this.state.output.newPlayed.newGame) || void 0 === a ? void 0 : a.gameName) === e) {
this.state.output.newPlayed.newGame.clickCount = t;
this.state.output.newPlayed.newGame.lastClickTime = o;
}
if ((null === (r = null === (i = this.state.output.newPlayedFallback) || void 0 === i ? void 0 : i.playedGame) || void 0 === r ? void 0 : r.gameName) === e) {
this.state.output.newPlayedFallback.playedGame.clickCount = t;
this.state.output.newPlayedFallback.playedGame.lastClickTime = o;
}
if ((null === (m = null === (s = this.state.output.newPlayedFallback) || void 0 === s ? void 0 : s.newGame) || void 0 === m ? void 0 : m.gameName) === e) {
this.state.output.newPlayedFallback.newGame.clickCount = t;
this.state.output.newPlayedFallback.newGame.lastClickTime = o;
}
}
};
t.prototype.onDisable = function() {
var e, t;
c.commonGameListDownloader.clear();
null === (e = this.state.updateEmitter) || void 0 === e || e.dispose();
d.commonGameListEntry.clear();
null === (t = this.state.entryEmitter) || void 0 === t || t.dispose();
};
t.prototype.setState = function(t) {
this._initData();
t.input && e.prototype.setState.call(this, {
input: t.input
});
this.getFilterResult();
};
t.prototype.onActive = function(e) {
if (hs.tp.isGameLobbyInfoIsRemote(e) || hs.tp.isGameLobbyBundleVersionInfoCheckBundleIsNew(e)) {
var t = e.args[0];
this.getIsRemote(t) && (e.returnState = !0);
}
if (hs.tp.isSandResLoadInfoLoadLocalBundleVersions(e)) {
e.replace = !0;
e.returnValue = u.DEFAULT_SAND_BUNDLE_VERSION_RELEASE;
}
hs.tp.isScene_ProxyOnSceneChange(e) && e.args[0].gameMode === hs.GameMode.Chapter && d.commonGameListEntry.handleChapterSceneChanged();
};
t.prototype.getDownloadGap = function() {
return 1e4;
};
t.prototype.getMaxRetryCount = function() {
return 3;
};
t.prototype.getGameInfo = function(e) {
var t;
return null === (t = this.list) || void 0 === t ? void 0 : t.find(function(t) {
return t.gameName === e;
});
};
t.prototype.getGameList = function() {
return this.deepFreeze(l(p.commonGameListGames.getGameInfoList()));
};
t.prototype.deepFreeze = function(e) {
var t = this;
Object.freeze(e);
Object.values(e).forEach(function(e) {
e && "object" == typeof e && t.deepFreeze(e);
});
return e;
};
t.prototype.getIsRemote = function(e) {
return !!u.DEFAULT_GAME_BUNDLE_REMOTE[e];
};
t.prototype.onGameLoadStateChange = function(e) {
var t, o;
if (e.gameName && (e.state !== h.CommonGameListTypes.DownloadState.SUCCESS || (null === (t = this.getGameInfo(e.gameName)) || void 0 === t ? void 0 : t.download) != h.CommonGameListTypes.DownloadState.SUCCESS || !(e.progress < 1 || e.finish < e.total || !e.total && !e.finish))) {
this.updateGameInfoInOutput(e.gameName, {
download: e.state
});
p.commonGameListGames.updateGameDownloadState(e.gameName, e.state);
null === (o = this.state.updateEmitter) || void 0 === o || o.fire(e);
this.afterLoadStateChange(e);
var n = null;
e.state === h.CommonGameListTypes.DownloadState.SUCCESS ? n = "下载完成" : e.state === h.CommonGameListTypes.DownloadState.FAIL && (n = "下载失败");
if (n) {
var a = this.getGameInfo(e.gameName), i = hs.atomengine4Info.getCommonGameTrackParams(a);
i && DS("g_setup_event", {
game_type: i.game_type,
game_subtype: i.game_subtype,
step: n
});
}
}
};
t.prototype.afterLoadStateChange = function(e) {
switch (e.state) {
case h.CommonGameListTypes.DownloadState.SUCCESS:
this.handleDownloadSuccess(e);
break;

case h.CommonGameListTypes.DownloadState.FAIL:
this.handleDownloadFail(e);
}
};
t.prototype.handleDownloadSuccess = function(e) {
var t = this;
this.retryCountMap.delete(e.gameName);
setTimeout(function() {
t.checkDefaultDownload();
}, this.getDownloadGap());
};
t.prototype.handleDownloadFail = function(e) {
var t, o = (null !== (t = this.retryCountMap.get(e.gameName)) && void 0 !== t ? t : 0) + 1;
this.retryCountMap.set(e.gameName, o);
Math.max(this.getMaxRetryCount() - o, 0);
this.checkDefaultDownload();
};
t.prototype.canRetryDownload = function(e) {
var t;
return (null !== (t = this.retryCountMap.get(e)) && void 0 !== t ? t : 0) <= this.getMaxRetryCount();
};
t.prototype.filterDefaultDownloadCandidates = function(e) {
return e;
};
t.prototype.checkDefaultDownload = function() {
var e = this, t = this.list;
if (!t.some(function(e) {
return e.download === h.CommonGameListTypes.DownloadState.PENDING;
})) {
t = t.sort(function(e, t) {
return e.timestamp - t.timestamp;
}).filter(function(t) {
return t.download === h.CommonGameListTypes.DownloadState.NONE || t.download === h.CommonGameListTypes.DownloadState.FAIL && e.canRetryDownload(t.gameName);
});
var o = (t = this.filterDefaultDownloadCandidates(t)).find(function(e) {
return e.download === h.CommonGameListTypes.DownloadState.FAIL;
});
o || (o = t.find(function(e) {
return e.trigger === h.CommonGameListTypes.DownloadTrigger.DEFAULT;
}));
o && c.commonGameListDownloader.startDownload(o);
}
};
t.prototype.restoreOutputFromStorage = function() {
var e, t, o = p.commonGameListGames.getNewPlayedStorage(), n = p.commonGameListGames.getGameInfoList(), a = o.lockedNewGameName, i = o.lockedNewTime, r = o.lastPlayedGameName, s = i > 0 && Date.now() - i > p.commonGameListGames.getNewDayMS() || !a || null === (e = n.find(function(e) {
return e.gameName === a;
})) || void 0 === e ? null : e, m = r && null !== (t = n.find(function(e) {
return e.gameName === r;
})) && void 0 !== t ? t : null;
(s || m) && (this.state.output.newPlayed = {
newGame: s,
playedGame: m
});
};
t.prototype.computeNewPlayed = function() {
var e, t = this.computeNewGame();
return {
newGame: t,
playedGame: this.computePlayedGame(null !== (e = null == t ? void 0 : t.gameName) && void 0 !== e ? e : null)
};
};
t.prototype.computeNewGame = function() {
var e, t = this, o = p.commonGameListGames.getNewPlayedStorage(), n = o.lockedNewGameName, a = o.lockedNewTime;
if (p.commonGameListGames.isLockedNewGameValid(n, a)) {
var i = p.commonGameListGames.getGameInfoList().find(function(e) {
return e.gameName === n;
});
return null != i ? i : null;
}
var r = null === (e = p.commonGameListGames.getNewGameCandidates()) || void 0 === e ? void 0 : e.filter(function(e) {
return t.isNewGameUnlocked(e);
});
if (0 === (null == r ? void 0 : r.length)) {
this.saveNewGameLock(null);
return null;
}
var s = r[0];
this.saveNewGameLock(s.gameName);
return s;
};
t.prototype.computePlayedGame = function(e) {
var t = p.commonGameListGames.getPlayedGameCandidates();
null !== e && (t = t.filter(function(t) {
return t.gameName !== e;
}));
return 0 === t.length ? null : t[0];
};
t.prototype.savePlayedGame = function(e) {
var t, o = p.commonGameListGames.getNewPlayedStorage();
p.commonGameListGames.saveNewPlayedStorage(i(i({}, o), {
lastPlayedGameName: null !== (t = null == e ? void 0 : e.gameName) && void 0 !== t ? t : null
}));
};
t.prototype.saveNewGameLock = function(e) {
var t = p.commonGameListGames.getNewPlayedStorage();
p.commonGameListGames.saveNewPlayedStorage(i(i({}, t), {
lockedNewGameName: e,
lockedNewTime: null !== e ? Date.now() : 0
}));
};
t.prototype.updatePlayedGameState = function() {
var e, t, o, n, a, i, r = this, s = null === (e = this.state.output) || void 0 === e ? void 0 : e.newPlayed;
if (s) {
var m = null !== (o = null === (t = s.newGame) || void 0 === t ? void 0 : t.gameName) && void 0 !== o ? o : null, l = null === (n = s.playedGame) || void 0 === n ? void 0 : n.gameName, d = this.computePlayedGame(m);
if (d) {
if (l !== (null == d ? void 0 : d.gameName) && d.gameName == (null === (i = null === (a = this.state.output.playedGames) || void 0 === a ? void 0 : a[0]) || void 0 === i ? void 0 : i.gameName)) {
s.playedGame = d;
d && this.savePlayedGame(d);
}
p.commonGameListGames.getGameInfoList().forEach(function(e) {
r.updateGameInfoInOutput(e.gameName, {
clickCount: e.clickCount,
lastClickTime: e.lastClickTime
});
});
} else {
s.playedGame = null;
this.savePlayedGame(null);
}
}
};
t.prototype.updateGameInfoInOutput = function(e, t) {
var o, n, a, i, r, s, m, l = function(o) {
(null == o ? void 0 : o.gameName) === e && Object.assign(o, t);
};
null === (o = this.state.output.newGames) || void 0 === o || o.forEach(function(e) {
return l(e);
});
null === (n = this.state.output.playedGames) || void 0 === n || n.forEach(function(e) {
return l(e);
});
null === (a = this.state.output.randomGames) || void 0 === a || a.forEach(function(e) {
return l(e);
});
l(null === (i = this.state.output.newPlayed) || void 0 === i ? void 0 : i.newGame);
l(null === (r = this.state.output.newPlayed) || void 0 === r ? void 0 : r.playedGame);
l(null === (s = this.state.output.newPlayedFallback) || void 0 === s ? void 0 : s.newGame);
l(null === (m = this.state.output.newPlayedFallback) || void 0 === m ? void 0 : m.playedGame);
};
t.prototype.mergeOutput = function(e) {
var t = this.state.output;
this.mergeGameArray(t.newGames, e.newGames);
this.mergeGameArray(t.playedGames, e.playedGames);
this.mergeGameArray(t.randomGames, e.randomGames);
if (t.newPlayed) {
t.newPlayed.newGame = e.newPlayed.newGame;
t.newPlayed.playedGame = e.newPlayed.playedGame;
} else t.newPlayed = e.newPlayed;
if (e.newPlayedFallback) if (t.newPlayedFallback) {
t.newPlayedFallback.newGame = e.newPlayedFallback.newGame;
t.newPlayedFallback.playedGame = e.newPlayedFallback.playedGame;
} else t.newPlayedFallback = e.newPlayedFallback; else t.newPlayedFallback = void 0;
t.isChapterInList = e.isChapterInList;
};
t.prototype.mergeGameArray = function(e, t) {
if (e && t) {
var o = new Map();
e.forEach(function(e) {
return o.set(e.gameName, e);
});
var n = t.map(function(e) {
var t = o.get(e.gameName);
if (!t) return e;
var n = e.atom, a = s(e, [ "atom" ]);
Object.assign(t, a);
n ? t.atom ? Object.assign(t.atom, n) : t.atom = n : t.atom = void 0;
return t;
});
e.length = 0;
e.push.apply(e, l(n));
}
};
t.prototype.getRawGameList = function() {
return l(p.commonGameListGames.getGameInfoList());
};
t.prototype.executeFilters = function(e) {
return e;
};
t.prototype.isChapterInList = function() {
return !1;
};
t.prototype.checkChapterInList = function() {
this.state.output.isChapterInList = this.isChapterInList();
return this.state.output.isChapterInList;
};
t.prototype.removeChapterFromGameListIfNeitherConditionMet = function() {
var e;
if (!(null !== (e = this.state.input) && void 0 !== e && e.shouldPutChapterInGameList || this.checkChapterInList())) {
p.commonGameListGames.removeChapterFromStorage();
this.clearChapterFromNewPlayedStateAndStorage();
}
};
t.prototype.clearChapterFromNewPlayedStateAndStorage = function() {
var e, t, o = p.commonGameListGames.getNewPlayedStorage(), n = o.lockedNewGameName, a = o.lockedNewTime, r = o.lastPlayedGameName, s = function(e) {
return !!e && (e.type === h.CommonGameListTypes.GameType.CHAPTER || "chapter" === e.gameName);
}, m = null === (e = this.state.output) || void 0 === e ? void 0 : e.newPlayed;
if (m) {
if (s(m.newGame)) {
m.newGame = null;
n = null;
a = 0;
}
if (s(m.playedGame)) {
m.playedGame = null;
r = void 0;
}
}
if ("chapter" === n) {
n = null;
a = 0;
}
"chapter" === r && (r = void 0);
var l = null === (t = this.state.output) || void 0 === t ? void 0 : t.newPlayedFallback;
if (l) {
s(l.newGame) && (l.newGame = null);
s(l.playedGame) && (l.playedGame = null);
l.newGame || l.playedGame || (this.state.output.newPlayedFallback = void 0);
}
n === o.lockedNewGameName && a === o.lockedNewTime && r === o.lastPlayedGameName || p.commonGameListGames.saveNewPlayedStorage(i(i({}, o), {
lockedNewGameName: n,
lockedNewTime: a,
lastPlayedGameName: r
}));
};
t.prototype.getChapterDefaultDownloadState = function() {
var e, t, o;
if (0 === (null !== (o = null === (t = null === (e = hs.chapterConfigInfo) || void 0 === e ? void 0 : e.chapterDatasCfg) || void 0 === t ? void 0 : t.length) && void 0 !== o ? o : 0)) return h.CommonGameListTypes.DownloadState.SUCCESS;
hs.chapterConfigInfo.isThroughAll;
return hs.themeInfo.remoteLoadBefore ? h.CommonGameListTypes.DownloadState.NONE : h.CommonGameListTypes.DownloadState.SUCCESS;
};
t.prototype.createChapterGameInfo = function() {
return {
gameName: "chapter",
timestamp: Date.now(),
type: h.CommonGameListTypes.GameType.CHAPTER,
trigger: h.CommonGameListTypes.DownloadTrigger.CLICK,
download: this.getChapterDefaultDownloadState(),
clickCount: 0,
lastClickTime: 0,
atom: null,
duringTime: -1,
isManualDownload: !0
};
};
t.prototype.applyNewGameFallback = function(e, t) {
var o, n, a, i = this;
if (null === (o = this.state.input) || void 0 === o ? void 0 : o.isNewGameRequired) {
var r = e.newPlayed.newGame, s = (null == r ? void 0 : r.type) === h.CommonGameListTypes.GameType.CHAPTER;
if (!r || s) {
var m = e.newPlayed.playedGame, l = !(null === (n = this.state.input) || void 0 === n ? void 0 : n.shouldPutChapterInGameList) && !this.checkChapterInList(), d = null !== (a = e.playedGames.find(function(e) {
return e.gameName !== (null == m ? void 0 : m.gameName) && !0 !== e.played;
})) && void 0 !== a ? a : null, u = null;
if (s) {
if (!d) return;
u = d;
} else if (d) u = d; else if (l || (null == m ? void 0 : m.type) === h.CommonGameListTypes.GameType.CHAPTER) {
var c = t.filter(function(e) {
return e.type !== h.CommonGameListTypes.GameType.CHAPTER && !0 !== e.played && e.gameName !== (null == m ? void 0 : m.gameName);
});
c = c.filter(function(e) {
return i.isNewGameUnlocked(e);
});
e.newGames.length || (c = this.state.input.shouldPutChapterInGameList ? t.filter(function(e) {
return e.gameName !== (null == m ? void 0 : m.gameName);
}) : t.filter(function(e) {
return e.type !== h.CommonGameListTypes.GameType.CHAPTER && e.gameName !== (null == m ? void 0 : m.gameName);
}));
c.length > 0 && (u = c[Math.floor(Math.random() * c.length)]);
} else u = this.createChapterGameInfo();
e.newPlayedFallback = {
newGame: u,
playedGame: m
};
}
}
};
t.prototype.applyPlayedGameFallback = function(e) {
var t, o;
if ((null === (t = this.state.input) || void 0 === t ? void 0 : t.isPlayedGameRequired) && !e.newPlayed.playedGame) {
var n = e.newPlayed.newGame, a = !(null === (o = this.state.input) || void 0 === o ? void 0 : o.shouldPutChapterInGameList) && !this.checkChapterInList(), i = null, r = n;
if (a) {
var s = e.newGames.find(function(e) {
return e.gameName !== (null == n ? void 0 : n.gameName);
});
if (s) i = s; else {
var m = e.playedGames.filter(function(e) {
return e.type !== h.CommonGameListTypes.GameType.CHAPTER && e.gameName !== (null == n ? void 0 : n.gameName);
});
m.length > 0 && (i = m[Math.floor(Math.random() * m.length)]);
}
} else i = this.createChapterGameInfo();
e.newPlayedFallback = {
newGame: r,
playedGame: i
};
}
};
t.prototype.applyChapterToGameList = function(e) {
var t, o;
if (((null === (t = this.state.input) || void 0 === t ? void 0 : t.shouldPutChapterInGameList) || this.checkChapterInList()) && !e.playedGames.find(function(e) {
return e.type === h.CommonGameListTypes.GameType.CHAPTER;
})) {
var n = p.commonGameListGames.getGameInfoList().find(function(e) {
return e.type === h.CommonGameListTypes.GameType.CHAPTER;
}), a = !n || (null !== (o = n.clickCount) && void 0 !== o ? o : 0) <= 0, i = this.createChapterGameInfo();
i.played = !0;
if (a) {
var r = e.playedGames.reduce(function(e, t) {
var o;
return Math.max(e, null !== (o = t.clickCount) && void 0 !== o ? o : 0);
}, 0);
i.clickCount = r + .1;
e.playedGames.unshift(i);
} else e.playedGames.push(i);
}
};
t.prototype.fixPlayedGameBySort = function(e) {
var t, o;
if (e.newPlayed && e.playedGames && e.playedGames.length > 0) {
var n = e.playedGames.filter(function(t) {
var o;
return t.gameName !== (null === (o = e.newPlayed.newGame) || void 0 === o ? void 0 : o.gameName);
}), a = null !== (t = n[0]) && void 0 !== t ? t : null;
null != a && a.gameName != (null === (o = e.newPlayed.playedGame) || void 0 === o ? void 0 : o.gameName) && (e.newPlayed.playedGame = a);
}
};
t.prototype.syncNewPlayedClickInfo = function(e, t) {
if (t && e && 0 !== e.length) {
var o = e.filter(function(e) {
return e.gameName === (null == t ? void 0 : t.gameName);
});
if (o && o[0]) {
var n = o[0], a = n.lastClickTime, i = n.clickCount;
t.clickCount = i;
t.lastClickTime = a;
}
}
};
t.prototype.isNewGameUnlocked = function() {
return !0;
};
t.prototype.getFilterResult = function() {
var e, t, o, n, a, i, r, s, m, d, u, c;
this.removeChapterFromGameListIfNeitherConditionMet();
var h = this.getRawGameList(), f = [], y = [];
h.forEach(function(e) {
var t = p.commonGameListGames.isNewGameCandidate(e), o = p.commonGameListGames.isPlayedGameCandidate(e);
t ? f.push(e) : o && y.push(e);
});
f.sort(function(e, t) {
return e.timestamp - t.timestamp;
});
y = p.commonGameListGames.sortPlayedGameCandidates(y);
var G = null === (e = this.state.output) || void 0 === e ? void 0 : e.newPlayed;
if (G) {
if (!G.newGame) {
G.newGame = this.computeNewGame();
this.saveNewGameLock(null === (t = G.newGame) || void 0 === t ? void 0 : t.gameName);
}
if (!G.playedGame) {
var w = null === (o = G.newGame) || void 0 === o ? void 0 : o.gameName, L = y.filter(function(e) {
return e.gameName !== w;
});
G.playedGame = null !== (n = L[0]) && void 0 !== n ? n : this.computePlayedGame(null != w ? w : null);
this.savePlayedGame(G.playedGame);
}
} else {
G = this.computeNewPlayed();
this.saveNewGameLock(null === (a = G.newGame) || void 0 === a ? void 0 : a.gameName);
this.savePlayedGame(G.playedGame);
}
var g = {
newGames: f,
playedGames: y,
randomGames: [],
newPlayed: G
}, C = null === (i = g.newPlayed.playedGame) || void 0 === i ? void 0 : i.gameName, v = null === (r = g.newPlayed.newGame) || void 0 === r ? void 0 : r.gameName;
this.applyChapterToGameList(g);
this.fixPlayedGameBySort(g);
var _ = [].concat(g.playedGames, g.newGames);
this.syncNewPlayedClickInfo(_, this.state.output.newPlayed.playedGame);
this.syncNewPlayedClickInfo(_, this.state.output.newPlayed.newGame);
this.syncNewPlayedClickInfo(_, null === (s = this.state.output.newPlayedFallback) || void 0 === s ? void 0 : s.playedGame);
this.syncNewPlayedClickInfo(_, null === (m = this.state.output.newPlayedFallback) || void 0 === m ? void 0 : m.newGame);
var E = this.executeFilters(g);
this.applyNewGameFallback(E, h);
this.applyPlayedGameFallback(E, h);
if (E.newPlayedFallback) {
!E.newPlayed.newGame && E.newPlayedFallback.newGame && (E.newPlayed.newGame = E.newPlayedFallback.newGame);
!E.newPlayed.playedGame && E.newPlayedFallback.playedGame && (E.newPlayed.playedGame = E.newPlayedFallback.playedGame);
}
var T = null === (d = E.newPlayed.playedGame) || void 0 === d ? void 0 : d.gameName, D = null === (u = E.newPlayed.newGame) || void 0 === u ? void 0 : u.gameName;
C !== T && null != T && this.savePlayedGame(E.newPlayed.playedGame);
v !== D && null != D && this.saveNewGameLock(null === (c = E.newPlayed.newGame) || void 0 === c ? void 0 : c.gameName);
this.onGetFilterResultFinish(E);
E.isChapterInList = this.state.output.isChapterInList;
this.mergeOutput(E);
var S = new Map(h.map(function(e) {
return [ e.gameName, e ];
})), N = l(E.newGames, E.playedGames).filter(function(e) {
var t = S.get(e.gameName);
return !t || JSON.stringify(t) !== JSON.stringify(e);
});
N.length > 0 && p.commonGameListGames.syncGameInfoList(N);
return E;
};
t.prototype.onGetFilterResultFinish = function() {};
t.prototype.isNewTag = function(e) {
var t;
return e && (null !== (t = e.clickCount) && void 0 !== t ? t : 0) <= 0;
};
t.prototype.getRemainingTime = function(e) {
if (-1 === e.duringTime) return null;
var t = e.timestamp + 864e5 * e.duringTime, o = Math.max(0, t - Date.now());
return o >= 1728e5 ? null : {
day: Math.floor(o / 864e5),
hour: Math.floor(o % 864e5 / 36e5),
minute: Math.floor(o % 36e5 / 6e4)
};
};
return r([ classId("CommonGameListTrait"), classMethodWatch() ], t);
}(Trait);
o.CommonGameListTrait = f;
cc._RF.pop();
}, {
"./CommonGameListConsts": "CommonGameListConsts",
"./CommonGameListGames": "CommonGameListGames",
"./CommonGameListTypes": "CommonGameListTypes",
"./downloader/CommonGameListDownloader": "CommonGameListDownloader",
"./entry/CommonGameListEntry": "CommonGameListEntry"
} ],
CommonGameListTypes: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "7ea7dJOacZOqqeTr+vnO/1x", "CommonGameListTypes");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListTypes = void 0;
(function(e) {
(function(e) {
e[e.LEGACY = 1] = "LEGACY";
e[e.SAND = 2] = "SAND";
e[e.ATOM = 3] = "ATOM";
e[e.CHAPTER = 5] = "CHAPTER";
e[e.DOUBLE_TILE = 6] = "DOUBLE_TILE";
})(e.GameType || (e.GameType = {}));
(function(e) {
e[e.NONE = 0] = "NONE";
e[e.PENDING = 1] = "PENDING";
e[e.SUCCESS = 2] = "SUCCESS";
e[e.FAIL = 3] = "FAIL";
})(e.DownloadState || (e.DownloadState = {}));
(function(e) {
e[e.DEFAULT = 1] = "DEFAULT";
e[e.CLICK = 2] = "CLICK";
})(e.DownloadTrigger || (e.DownloadTrigger = {}));
(function(e) {
e[e.DOWNLOAD_ONLY = 1] = "DOWNLOAD_ONLY";
})(e.EntryState || (e.EntryState = {}));
(function(e) {
e.ALL = "all";
e.NEW = "new";
e.PLAYED = "played";
e.PERSISTENT = "persistent";
e.TIME_LIMITED = "timeLimited";
e.SPECIFIED = "specified";
})(e.FilterType || (e.FilterType = {}));
(function(e) {
e.NONE = "none";
e.RANDOM = "random";
e.HIT_TIME_ASC = "hitTimeAsc";
e.HIT_TIME_DESC = "hitTimeDesc";
e.CLICK_RATE_ASC = "clickRateAsc";
e.CLICK_RATE_DESC = "clickRateDesc";
e.RETENTION_ORDER = "retentionOrder";
})(e.SortType || (e.SortType = {}));
})(o.CommonGameListTypes || (o.CommonGameListTypes = {}));
cc._RF.pop();
}, {} ]
}, {}, [ "CommonGameListConsts", "CommonGameListGames", "CommonGameListTrait", "CommonGameListTypes", "CommonGameListDownloader", "CommonGameListDownloaderAtom", "CommonGameListDownloaderChapter", "CommonGameListDownloaderDT", "CommonGameListDownloaderLegacy", "CommonGameListDownloaderSand", "CommonGameListEntry", "CommonGameListEntryAtom", "CommonGameListEntryBase", "CommonGameListEntryChapter", "CommonGameListEntryDT", "CommonGameListEntryLegacy", "CommonGameListEntrySand" ]);
//# sourceMappingURL=index.js.map
