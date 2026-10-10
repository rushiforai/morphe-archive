window.__require = function e(t, o, i) {
function n(r, s) {
if (!o[r]) {
if (!t[r]) {
var c = r.split("/");
c = c[c.length - 1];
if (!t[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = c;
}
var d = o[r] = {
exports: {}
};
t[r][0].call(d.exports, function(e) {
return n(t[r][1][e] || e);
}, d, d.exports, e, t, o, i);
}
return o[r].exports;
}
for (var a = "function" == typeof __require && __require, r = 0; r < i.length; r++) n(i[r]);
return n;
}({
CommonGameListUI2Item: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "5e6e9uLfBlIG4yAubdAMYBI", "CommonGameListUI2Item");
var i, n = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), a = this && this.__decorate || function(e, t, o, i) {
var n, a = arguments.length, r = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, i); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (r = (a < 3 ? n(r) : a > 3 ? n(t, o, r) : n(t, o)) || r);
return a > 3 && r && Object.defineProperty(t, o, r), r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var r = e("./CommonGameListUI2Types"), s = cc._decorator, c = s.ccclass, l = s.property, d = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.keepTimeNode = null;
t.keepTimeLabel = null;
t.progress = null;
t.newNode = null;
t._bg = null;
t._countdownRemaining = 0;
t._countdownTimer = null;
t._onLoadStateChange = null;
t._hasReportShow = !1;
t._hasEntryExposed = !1;
t._lastReportGameName = null;
return t;
}
o = t;
t.prototype._registerLoadStateListener = function() {
var e = this;
if (!this._onLoadStateChange && this.state.updateEmitter && this.state.info && this.state.info.download !== r.common_game.DownloadState.SUCCESS) {
this._onLoadStateChange = function(t) {
var o, i, n;
if ((null === (i = null === (o = e.state) || void 0 === o ? void 0 : o.info) || void 0 === i ? void 0 : i.gameName) === t.gameName) {
var a = null !== (n = t.progress) && void 0 !== n ? n : t.total > 0 ? t.finish / t.total : 0;
t.state === r.common_game.DownloadState.SUCCESS && (a = 1);
e.onDownloadStateChange(t);
e._updateProgress(a);
}
};
this.state.updateEmitter.event(this._onLoadStateChange);
}
};
t.prototype.setState = function(t, o, i) {
e.prototype.setState.call(this, t, o, i);
this._registerLoadStateListener();
};
t.prototype.onItemDataBound = function() {};
t.prototype._ensureRefs = function() {
var e, t, o, i;
if (!this._bg) {
var n = null === (e = this.node.getChildByName("nodeRoot")) || void 0 === e ? void 0 : e.getChildByName("bg");
n && (this._bg = n.getComponent(cc.Sprite));
}
this.keepTimeNode || (this.keepTimeNode = null === (t = this.node.getChildByName("nodeRoot")) || void 0 === t ? void 0 : t.getChildByName("keepTimeNode"));
if (!this.keepTimeLabel && this.keepTimeNode) {
var a = this.keepTimeNode.getChildByName("keepTimeLabel");
a && (this.keepTimeLabel = a.getComponent(cc.Label));
}
this.newNode || (this.newNode = null === (o = this.node.getChildByName("nodeRoot")) || void 0 === o ? void 0 : o.getChildByName("nodeRed"));
if (!this.progress) {
var r = null === (i = this.node.getChildByName("nodeRoot")) || void 0 === i ? void 0 : i.getChildByName("loading");
r && (this.progress = r.getComponent(cc.Mask));
}
};
t.prototype.render = function() {
var e, t, i, n, a;
this._ensureRefs();
var s = this.state.info;
if (s && this._lastReportGameName !== s.gameName) {
this._hasReportShow = !1;
this._hasEntryExposed = !1;
this._lastReportGameName = s.gameName;
}
if (s && !this._hasEntryExposed) {
this._hasEntryExposed = !0;
this.onEntryExposed(s);
}
if (s && !this._hasReportShow) {
var c = s.timestamp + 864e5 * s.duringTime, l = (Math.max(0, c - Date.now()), hs.atomengine4Info.getCommonGameTrackParams(s));
if (l) {
this._hasReportShow = !0;
this.state.shouldReportShow && !this.state.shouldReportShow(s.gameName, 2) || DS("ui_theme_adventure_show", {
game_type: l.game_type,
game_subtype: l.game_subtype,
button_position: 2,
is_download_complete: s.download === r.common_game.DownloadState.SUCCESS ? 1 : 0
});
}
}
this.loadBg();
var d = this.isNewTag(s);
cc.isValid(this.newNode) && (this.newNode.active = d);
if (d) {
cc.isValid(this.keepTimeNode) && (this.keepTimeNode.active = !1);
this._stopCountdown();
} else this._updateKeepTime();
if (this.progress && this.progress.node) if ((null === (e = this.state.info) || void 0 === e ? void 0 : e.download) === r.common_game.DownloadState.SUCCESS) this.progress.node.active = !1; else if ((null === (t = this.state.info) || void 0 === t ? void 0 : t.isManualDownload) && (null === (i = this.state.info) || void 0 === i ? void 0 : i.download) === r.common_game.DownloadState.PENDING) {
this.progress.node.active = !0;
this._updateProgress(null !== (a = o._lastProgress[null === (n = this.state.info) || void 0 === n ? void 0 : n.gameName]) && void 0 !== a ? a : 0);
} else this.progress.node.active = !1;
!d && cc.isValid(this.newNode) && this.notNewTag(s, this.newNode);
this.onItemDataBound();
};
t.prototype.onEntryExposed = function() {};
t.prototype.notNewTag = function() {};
t.prototype.loadBg = function() {
var e = (this.state.entryAssets || [])[0];
e && cc.isValid(this._bg) && (this._bg.spriteFrame = e);
};
t.prototype._updateKeepTime = function() {
this._stopCountdown();
if (this.keepTimeNode && this.keepTimeLabel) {
var e = this.state.info;
if (!e || e.duringTime < 0) this.keepTimeNode.active = !1; else {
var t = e.timestamp + 864e5 * e.duringTime - Date.now();
if (t <= 0) this.keepTimeNode.active = !1; else {
this._countdownRemaining = Math.floor(t / 1e3);
this.keepTimeNode.active = !0;
this._refreshCountdownLabel();
this._countdownRemaining > 0 && this._scheduleNextTick();
}
}
}
};
t.prototype._refreshCountdownLabel = function() {
cc.isValid(this.keepTimeLabel) && (this.keepTimeLabel.string = this._formatCountdownTime(this._countdownRemaining));
};
t.prototype.isNewTag = function(e) {
var t;
return e && (null !== (t = e.clickCount) && void 0 !== t ? t : 0) <= 0;
};
t.prototype._formatCountdownTime = function(e) {
var t = e, o = Math.floor(t / 86400);
t -= 86400 * o;
var i = Math.floor(t / 3600);
t -= 3600 * i;
var n = Math.floor(t / 60), a = t -= 60 * n;
return o > 0 ? o + "d" + i + "h" : i > 0 ? i + "h" + Math.floor(e % 3600 / 60) + "m" : n + "m" + a + "s";
};
t.prototype._scheduleNextTick = function() {
var e = this;
this._countdownTimer = setTimeoutSafe(function() {
if (cc.isValid(e.node)) {
e._countdownRemaining--;
e._refreshCountdownLabel();
if (e._countdownRemaining <= 0) {
e._countdownTimer = null;
cc.isValid(e.keepTimeNode) && (e.keepTimeNode.active = !1);
} else e._scheduleNextTick();
} else e._stopCountdown();
}, 1e3);
};
t.prototype._stopCountdown = function() {
if (null !== this._countdownTimer) {
clearTimeout(this._countdownTimer);
this._countdownTimer = null;
}
};
t.prototype.onDisable = function() {
this._stopCountdown();
this._hasReportShow = !1;
this._lastReportGameName = null;
};
t.prototype.onDestroy = function() {
this._stopCountdown();
};
t.prototype._updateProgress = function(e) {
this.setDownloadProgress(e);
};
t.prototype.onDownloadStateChange = function() {};
t.prototype.setDownloadProgress = function(e) {
var t;
if (this.progress && (null === (t = this.state.info) || void 0 === t ? void 0 : t.isManualDownload) && !(e < o._lastProgress[this.state.info.gameName])) {
o._lastProgress[this.state.info.gameName] = e;
this.progress.node.active = e < 1;
this.progress.node.width = 800 * (1 - e);
}
};
t.prototype.onClick = function() {
var e;
this.newNode && cc.isValid(this.newNode) && (this.newNode.active = !1);
null === (e = this.state.entryEmitter) || void 0 === e || e.fire({
gameName: this.state.info.gameName
});
if (this.state.entryEmitter) {
var t = this.state.info;
if (t) {
var o = hs.atomengine4Info.getCommonGameTrackParams(t);
o && DS("ui_theme_adventure_click", {
game_type: o.game_type,
game_subtype: o.game_subtype,
button_position: 2,
is_download_complete: 2 === t.download ? 1 : 0,
resource_version: this.getClickResourceVersion(t)
});
}
this.otherTraitNotice();
}
};
t.prototype.otherTraitNotice = function() {};
t.prototype.getClickResourceVersion = function(e) {
if ("DT" !== (null == e ? void 0 : e.gameName)) return "";
var t = TRAIT("MahjongMoreGameEntryTrait");
return (null == t ? void 0 : t.active) && "function" == typeof t.getDoubleTileCommonGameVersion && t.getDoubleTileCommonGameVersion() || "";
};
var o;
t._lastProgress = {};
a([ l(cc.Node) ], t.prototype, "keepTimeNode", void 0);
a([ l(cc.Label) ], t.prototype, "keepTimeLabel", void 0);
a([ l(cc.Mask) ], t.prototype, "progress", void 0);
a([ l(cc.Node) ], t.prototype, "newNode", void 0);
return o = a([ classId("CommonGameListUI2Item"), c, classMethodWatch() ], t);
}(hs.Component);
o.default = d;
cc._RF.pop();
}, {
"./CommonGameListUI2Types": "CommonGameListUI2Types"
} ],
CommonGameListUI2Trait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "88e49fm1P5PBKHHPRRowvSr", "CommonGameListUI2Trait");
var i, n = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), a = this && this.__decorate || function(e, t, o, i) {
var n, a = arguments.length, r = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, i); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (r = (a < 3 ? n(r) : a > 3 ? n(t, o, r) : n(t, o)) || r);
return a > 3 && r && Object.defineProperty(t, o, r), r;
}, r = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, o = t && e[t], i = 0;
if (o) return o.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && i >= e.length && (e = void 0);
return {
value: e && e[i++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, s = this && this.__read || function(e, t) {
var o = "function" == typeof Symbol && e[Symbol.iterator];
if (!o) return e;
var i, n, a = o.call(e), r = [];
try {
for (;(void 0 === t || t-- > 0) && !(i = a.next()).done; ) r.push(i.value);
} catch (e) {
n = {
error: e
};
} finally {
try {
i && !i.done && (o = a.return) && o.call(a);
} finally {
if (n) throw n.error;
}
}
return r;
}, c = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(s(arguments[t]));
return e;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListUI2Trait = o.IMAGE_NAME_TO_GAME = o.TIPS_PREFAB_URL = o.UI2_OWNER_KEY = o.UI2_PREFAB_URL = o.SEPARATOR_PREFAB_URL = o.ITEM_PREFAB_URL = void 0;
var l = e("./CommonGameListUI2Item");
o.ITEM_PREFAB_URL = "prefabs/CommonGameListUI2Item";
o.SEPARATOR_PREFAB_URL = "prefabs/split_line";
o.UI2_PREFAB_URL = "prefabs/CommonGameListUI2";
o.UI2_OWNER_KEY = "__ui2_owner__";
o.TIPS_PREFAB_URL = "prefabs/tips";
o.IMAGE_NAME_TO_GAME = {
adventure: "chapter",
blockSlide: "gl_blockslide",
waterSort: "gl_watersort",
oneLine: "gl_oneline",
mahjong: "gl_mahjong",
onet: "gl_onet",
fruitMerge: "gl_fruit",
ticTacToe: "gl_tictactoe",
sudoku: "gl_sudoku",
2248: "G5",
arrows: "G3",
sandCrush: "gl_sand",
blast_Io: "G2"
};
var d = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._itemPrefab = null;
t._separatorPrefab = null;
t._innerGameSFMap = new Map();
t._itemList = [];
t._ui2Prefab = null;
t._ui2Node = null;
t._contentGuardOff = null;
t._tipsPrefab = null;
t._tipsNode = null;
t._minRemainingTime = null;
t._isRendering = !1;
t._assetsLoaded = !1;
t._assetsLoadPromise = null;
t._reportedShowKeys = new Set();
t._shouldReportShow = function(e, o) {
if (!e) return !1;
var i = o + ":" + e;
if (t._reportedShowKeys.has(i)) return !1;
t._reportedShowKeys.add(i);
return !0;
};
return t;
}
i = t;
t.prototype.onCreate = function() {
var e = this;
this._loadAllAssets().then(function(t) {
if (t) {
var o = TRAIT("CommonGameListDependenciesTrait");
o && o.active && o.setState({
traitId: e.id
});
}
});
};
t.prototype.onActive = function(e) {
hs.tp.isGameLobbyGLHallMoreGamesPopupViewAddSkinBg(e) && this._onAddSkinBg(e);
hs.tp.isGameLobbyGLHallMoreGamesPopupViewOnShow(e) && this._onPopupShowOrRefresh(e, !0);
hs.tp.isGameLobbyGLHallMoreGamesPopupViewRefreshGameList(e) && this._onPopupShowOrRefresh(e, !1);
};
t.prototype._onAddSkinBg = function(e) {
this._isUIReady() && (e.replace = !0);
};
t.prototype._onPopupShowOrRefresh = function(e, t) {
if (this._isUIReady()) {
t && this._resetPopupShowReports();
var o = TRAIT("CommonGameListTrait");
e.replace = !0;
o.setState({});
this._onPopupShow(e, o);
}
};
t.prototype.checkUIReady = function() {
return this._isUIReady();
};
t.prototype._isUIReady = function() {
var e = TRAIT("CommonGameListTrait"), t = TRAIT("CommonGameListDependenciesTrait");
return (null == e ? void 0 : e.active) && e.state.output && t && t.active && t.state.uiReady;
};
t.prototype._resetPopupShowReports = function() {
this._reportedShowKeys.clear();
};
t.prototype._onPopupShow = function(e, t) {
var o = this, i = e.target, n = i.nodeScrollView, a = i.nodeBg;
if (cc.isValid(n)) {
var r = n.getComponent(cc.ScrollView);
if (r && !this._isRendering) {
this._isRendering = !0;
if (this._assetsLoaded && cc.isValid(this._itemPrefab)) {
this._doRender(a, n, r, t);
this._isRendering = !1;
} else this._loadAllAssets().then(function(e) {
if (e && cc.isValid(n) && cc.isValid(a) && cc.isValid(r)) if (cc.isValid(o._itemPrefab)) {
o._doRender(a, n, r, t);
o._isRendering = !1;
} else o._isRendering = !1; else o._isRendering = !1;
});
}
}
};
t.prototype._doRender = function(e, t, o, i) {
var n;
if ((null == i ? void 0 : i.active) && (null === (n = i.state) || void 0 === n ? void 0 : n.output)) {
i.setState({
input: i.state.input
});
this._applyFullScreenUI(e, t);
this._renderList(o, i);
this._guardContent(o.content);
this._showTips(t);
t.active = !0;
hs.storage.setItem("isShow_GLHallMoreGamesPopupView", 1);
this.afterRender(t);
}
};
t.prototype.afterRender = function() {};
t.prototype._guardContent = function(e) {
if (this._contentGuardOff) {
this._contentGuardOff();
this._contentGuardOff = null;
}
if (cc.isValid(e)) {
var t = function(e) {
return e.getComponent(l.default) || e[o.UI2_OWNER_KEY];
}, i = function() {
if (cc.isValid(e)) for (var o = e.children, i = o.length - 1; i >= 0; i--) {
var n = o[i];
if (!t(n)) {
n.removeFromParent();
n.destroy();
}
}
};
i();
var n = function() {
i();
};
e.on(cc.Node.EventType.CHILD_ADDED, n);
this._contentGuardOff = function() {
e.off(cc.Node.EventType.CHILD_ADDED, n);
};
}
};
t.prototype.matchList = function(e, t) {
e.removeFromParent(!1);
var o = t.getChildByName("list_container");
if (!o) {
(o = new cc.Node()).name = "list_container";
t.addChild(o);
var i = o.getComponent(cc.Widget) || o.addComponent(cc.Widget);
i.left = 0;
i.isAlignLeft = !0;
i.right = 0;
i.isAlignRight = !0;
i.top = 270;
i.isAlignTop = !0;
i.bottom = 160;
i.isAlignBottom = !0;
i.updateAlignment();
}
o.addChild(e);
var n = e.getComponent(cc.Widget) || e.addComponent(cc.Widget);
n.left = 0;
n.isAlignLeft = !0;
n.right = 0;
n.isAlignRight = !0;
n.top = 0;
n.isAlignTop = !0;
n.bottom = 0;
n.isAlignBottom = !0;
n.updateAlignment();
var a = e.getChildByName("view");
if (a) {
var r = a.getComponent(cc.Widget) || a.addComponent(cc.Widget);
r.left = 0;
r.isAlignLeft = !0;
r.right = 0;
r.isAlignRight = !0;
r.top = 0;
r.isAlignTop = !0;
r.bottom = 0;
r.isAlignBottom = !0;
r.updateAlignment();
}
};
t.prototype._applyFullScreenUI = function(e, t) {
if (cc.isValid(this._ui2Node)) {
this._ui2Node.active = !0;
e.active = !1;
} else if (cc.isValid(this._ui2Prefab) && cc.isValid(e)) {
var o = e.parent;
if (cc.isValid(o)) {
var i = cc.instantiate(this._ui2Prefab), n = i.getChildByName("New ScrollView");
n && n.destroy();
var a = i.getChildByName("midContainer");
a && a.destroy();
o.addChild(i);
i.setSiblingIndex(e.getSiblingIndex());
this.matchList(t, i);
var r = i.getChildByName("topContainer");
if (r) {
var s = r.getChildByName("backBtn");
if (s) {
var c = s.getComponent(cc.Button);
c && (c.clickEvents = []);
s.on("click", function() {
if (cc.isValid(o)) {
var e = o.getComponent("GameLobbyGLHallMoreGamesPopupView");
e && "function" == typeof e.onClickedClose && e.onClickedClose();
}
});
}
}
e.active = !1;
this._ui2Node = i;
}
}
};
t.prototype._renderList = function(e, t) {
var i, n = this;
if (this._contentGuardOff) {
this._contentGuardOff();
this._contentGuardOff = null;
}
var a = e.content;
if (cc.isValid(a)) {
this._setupLayout(a);
for (var r = t.state.output || {
newGames: [],
playedGames: [],
randomGames: []
}, s = r.newGames, c = r.playedGames, d = r.randomGames, m = [], u = [], p = a.children, f = p.length - 1; f >= 0; f--) {
var _ = p[f];
_.removeFromParent(!1);
_.getComponent(l.default) ? m.push(_) : "separator" === _.name && _[o.UI2_OWNER_KEY] ? u.push(_) : _.destroy();
}
this._itemList = [];
var h = new Set(), g = 0, y = 0, v = function(e) {
if (!h.has(e.gameName)) {
var o = n._getEntryAssets(e.gameName);
if (o[0]) {
h.add(e.gameName);
var i;
if (g < m.length) {
i = m[g];
g++;
} else i = cc.instantiate(n._itemPrefab);
i.active = !0;
a.addChild(i);
var r = i.getComponent(l.default);
r || (r = i.addComponent(l.default));
i.name = e.gameName;
i.off("click", n._onClickItem, n);
i.on("click", n._onClickItem, n);
r.setState({
info: e,
selected: !1,
entryAssets: o,
updateEmitter: t.state.updateEmitter,
entryEmitter: t.state.entryEmitter,
shouldReportShow: n._shouldReportShow
});
n._itemList.push(r);
}
}
};
(s || []).forEach(function(e) {
return v(e);
});
var L = (c || []).filter(function(e) {
return !h.has(e.gameName);
});
if (L.length > 0) {
(function() {
var e;
if (y < u.length) {
e = u[y];
y++;
} else e = n._makeSeparator();
e.active = !0;
a.addChild(e);
})();
var C = !1, T = L.find(function(e) {
return "chapter" === e.gameName;
});
T && (C = (null !== (i = null == T ? void 0 : T.clickCount) && void 0 !== i ? i : 0) < 1);
C && v(T);
L.forEach(function(e) {
C && "chapter" === e.gameName || v(e);
});
} else d && d.length > 0 && d.forEach(function(e) {
return v(e);
});
var R = m.length;
for (f = g; f < R; f++) m[f].destroy();
var w = u.length;
for (f = y; f < w; f++) u[f].destroy();
this.addCustomEntrances(a, o.UI2_OWNER_KEY);
}
};
t.prototype.addCustomEntrances = function() {};
t.prototype._setupLayout = function(e) {
var t = e.getComponent(cc.Layout);
t || (t = e.addComponent(cc.Layout));
t.type = cc.Layout.Type.VERTICAL;
t.resizeMode = cc.Layout.ResizeMode.CONTAINER;
t.paddingTop = 94;
t.paddingBottom = 168;
t.spacingY = 48;
};
t.prototype._loadAllAssets = function() {
var e = this;
if (this._assetsLoaded) return Promise.resolve(!0);
if (this._assetsLoadPromise) return this._assetsLoadPromise;
this._assetsLoadPromise = new Promise(function(t) {
hs.ResLoader.asyncLoadBundle(e.traitName).then(function(i) {
if (i) {
var n = 0, a = function() {
if (++n >= 5) {
e._assetsLoaded = cc.isValid(e._itemPrefab);
e._assetsLoaded || (e._assetsLoadPromise = null);
t(e._assetsLoaded);
}
};
i.loadDir("image", cc.SpriteFrame, function(i, n) {
var s, c;
if (i) return t(!1);
try {
for (var l = r(n), d = l.next(); !d.done; d = l.next()) {
var m = d.value;
if (cc.isValid(m)) {
var u = m.name;
if (u.startsWith("btn_") && u.endsWith("_big")) {
var p = u.slice(4, u.length - 4), f = o.IMAGE_NAME_TO_GAME[p];
if (f) {
var _ = e._innerGameSFMap.get(f) || [];
_[0] = m;
e._innerGameSFMap.set(f, _);
}
}
}
}
} catch (e) {
s = {
error: e
};
} finally {
try {
d && !d.done && (c = l.return) && c.call(l);
} finally {
if (s) throw s.error;
}
}
a();
});
i.load(o.ITEM_PREFAB_URL, cc.Prefab, function(o, i) {
if (o || !cc.isValid(i)) return t(!1);
e._itemPrefab = i;
a();
});
i.load(o.SEPARATOR_PREFAB_URL, cc.Prefab, function(o, i) {
if (o || !cc.isValid(i)) return t(!1);
e._separatorPrefab = i;
a();
});
i.load(o.UI2_PREFAB_URL, cc.Prefab, function(o, i) {
if (o || !cc.isValid(i)) return t(!1);
e._ui2Prefab = i;
a();
});
i.load(o.TIPS_PREFAB_URL, cc.Prefab, function(o, i) {
if (o || !cc.isValid(i)) return t(!1);
e._tipsPrefab = i;
a();
});
} else {
e._assetsLoadPromise = null;
t(!1);
}
}).catch(function() {
e._assetsLoadPromise = null;
t(!1);
});
});
return this._assetsLoadPromise;
};
t.prototype._getEntryAssets = function(e) {
return this._innerGameSFMap.get(e) || [];
};
t.prototype._makeSeparator = function() {
var e;
if (cc.isValid(this._separatorPrefab)) e = cc.instantiate(this._separatorPrefab); else {
(e = new cc.Node()).height = 36;
var t = e.addComponent(cc.Label);
t.string = "Played";
t.fontSize = 26;
t.horizontalAlign = cc.Label.HorizontalAlign.LEFT;
e.color = new cc.Color(180, 180, 180, 200);
}
e.name = "separator";
e[o.UI2_OWNER_KEY] = !0;
return e;
};
t.prototype._onClickItem = function(e) {
var t = (e instanceof cc.Node ? e : e.node).getComponent(l.default);
t && this._handleGameEntry(t);
};
t.prototype._handleGameEntry = function(e) {
var t;
if (null === (t = e.state) || void 0 === t ? void 0 : t.info) {
for (var o = this._itemList.length, i = 0; i < o; i++) this._itemList[i].setState({
selected: this._itemList[i] === e
});
e.onClick();
}
};
t.prototype._showTips = function(e) {
var t = this;
if (cc.isValid(e) && cc.isValid(e.parent) && this._checkTipsShow()) {
var i = e.parent;
if (cc.isValid(this._tipsNode)) {
if (this._tipsNode.parent !== i) {
this._tipsNode.removeFromParent(!1);
i.addChild(this._tipsNode);
}
this._setTipsLabelTime(this._tipsNode);
this._playTipsTween(this._tipsNode);
} else {
var n = this.traitName, a = function(e) {
if (cc.isValid(e) && cc.isValid(i)) {
t._tipsNode = cc.instantiate(e);
i.addChild(t._tipsNode);
t._setTipsLabelTime(t._tipsNode);
t._playTipsTween(t._tipsNode);
}
};
cc.isValid(this._tipsPrefab) ? a(this._tipsPrefab) : hs.ResLoader.loadByBundle(n, o.TIPS_PREFAB_URL, cc.Prefab, function(e, o) {
if (!e && cc.isValid(o)) {
t._tipsPrefab = o;
a(o);
}
});
}
}
};
t.prototype._setTipsLabelTime = function(e) {
if (cc.isValid(e)) {
var t = e.getChildByName("label_time"), o = null == t ? void 0 : t.getComponent(cc.Label);
cc.isValid(o) && (this._minRemainingTime ? o.string = this._minRemainingTime.day + " d " + this._minRemainingTime.hour + "h " + this._minRemainingTime.minute + " min " : o.string = "");
}
};
t.prototype._playTipsTween = function(e) {
if (cc.isValid(e)) {
e.stopAllActions();
e.active = !0;
e.opacity = 255;
cc.tween(e).delay(.6).to(.2, {
opacity: 0
}).call(function() {
cc.isValid(e) && (e.active = !1);
}).start();
}
};
t.prototype._checkTipsShow = function() {
if (i._hasShownTipsInSession) return !1;
var e = this._getGameInfoList(), t = this._getMinRemainingTime(e);
if (!t) {
this._minRemainingTime = null;
return !1;
}
t.day < 2 && (this._minRemainingTime = t);
i._hasShownTipsInSession = !0;
return !0;
};
t.prototype._getGameInfoList = function() {
var e = TRAIT("CommonGameListTrait");
if (!(null == e ? void 0 : e.active) || !e.state.output) return [];
var t = e.state.output.newGames || [], o = e.state.output.playedGames || [], i = c(t, o);
if (i.length > 0) return i;
var n = e.state.output.randomGames || [];
return n.length > 0 ? n : [];
};
t.prototype._getMinRemainingTime = function(e) {
var t, o;
if (!Array.isArray(e) || 0 === e.length) return null;
var i = null, n = Number.MAX_SAFE_INTEGER;
try {
for (var a = r(e), s = a.next(); !s.done; s = a.next()) {
var c = s.value, l = this._getRemainingTime(c);
if (l) {
var d = 1440 * l.day + 60 * l.hour + l.minute;
if (!(d <= 0) && d < n) {
n = d;
i = l;
}
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
s && !s.done && (o = a.return) && o.call(a);
} finally {
if (t) throw t.error;
}
}
return i;
};
t.prototype._getRemainingTime = function(e) {
if (-1 === e.duringTime) return null;
var t = e.timestamp + 864e5 * e.duringTime, o = Math.max(0, t - Date.now());
return o >= 1728e5 ? null : {
day: Math.floor(o / 864e5),
hour: Math.floor(o % 864e5 / 36e5),
minute: Math.floor(o % 36e5 / 6e4)
};
};
var i;
t._hasShownTipsInSession = !1;
a([ hs.throttle(300) ], t.prototype, "_onClickItem", null);
return i = a([ classId("CommonGameListUI2Trait"), classMethodWatch() ], t);
}(Trait);
o.CommonGameListUI2Trait = d;
cc._RF.pop();
}, {
"./CommonGameListUI2Item": "CommonGameListUI2Item"
} ],
CommonGameListUI2Types: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "2f178d8GoJMN6VWVlKiZPp2", "CommonGameListUI2Types");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.common_game = void 0;
(function(e) {
e.DownloadState = {
NONE: 0,
PENDING: 1,
SUCCESS: 2,
FAIL: 3
};
e.DownloadStateName = {
0: "NONE",
1: "PENDING",
2: "SUCCESS",
3: "FAIL"
};
e.EntryState = {
DOWNLOAD_ONLY: 1,
CANCEL: 2,
AUTO: 3
};
})(o.common_game || (o.common_game = {}));
cc._RF.pop();
}, {} ],
CommonGameListUI2_ExIOS_Trait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "09fd558S5BGk5mXNq8FbneK", "CommonGameListUI2_ExIOS_Trait");
var i, n = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), a = this && this.__decorate || function(e, t, o, i) {
var n, a = arguments.length, r = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, i); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (r = (a < 3 ? n(r) : a > 3 ? n(t, o, r) : n(t, o)) || r);
return a > 3 && r && Object.defineProperty(t, o, r), r;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListUI2_ExIOS_Trait = void 0;
var r = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {
var e = TRAIT("CommonGameListDependenciesTrait");
e && e.active && e.setState({
traitId: this.id
});
};
return a([ classId("CommonGameListUI2Trait", "ExIOS"), classMethodWatch() ], t);
}(e("./CommonGameListUI2_Ex_Trait").CommonGameListUI2_Ex_Trait);
o.CommonGameListUI2_ExIOS_Trait = r;
cc._RF.pop();
}, {
"./CommonGameListUI2_Ex_Trait": "CommonGameListUI2_Ex_Trait"
} ],
CommonGameListUI2_Ex_Trait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "e0ce3UPEdBFGqltl4nsXLwS", "CommonGameListUI2_Ex_Trait");
var i, n = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), a = this && this.__decorate || function(e, t, o, i) {
var n, a = arguments.length, r = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, o, i); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (r = (a < 3 ? n(r) : a > 3 ? n(t, o, r) : n(t, o)) || r);
return a > 3 && r && Object.defineProperty(t, o, r), r;
}, r = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, o = t && e[t], i = 0;
if (o) return o.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && i >= e.length && (e = void 0);
return {
value: e && e[i++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListUI2_Ex_Trait = void 0;
var s = e("./CommonGameListUI2Item"), c = e("./CommonGameListUI2Trait"), l = {};
Object.keys(c.IMAGE_NAME_TO_GAME).forEach(function(e) {
l[c.IMAGE_NAME_TO_GAME[e]] = e;
});
var d = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._hasLoadedSuccessfullyBefore = !0;
return t;
}
t.prototype._loadAllAssets = function() {
var e = this;
if (this._assetsLoaded) return Promise.resolve(!0);
if (this._assetsLoadPromise) return this._assetsLoadPromise;
Date.now();
this._assetsLoadPromise = new Promise(function(t) {
var o = function() {
e._assetsLoaded = !1;
e._assetsLoadPromise = null;
t(!1);
};
hs.ResLoader.asyncLoadBundle(e.traitName).then(function(i) {
if (i) {
var n = 0, a = (e._hasLoadedSuccessfullyBefore, function() {
if (++n >= 5) {
e._assetsLoaded = cc.isValid(e._itemPrefab);
e._assetsLoaded || (e._assetsLoadPromise = null);
Date.now();
e._hasLoadedSuccessfullyBefore || (e._hasLoadedSuccessfullyBefore = !0);
t(e._assetsLoaded);
}
});
e._hasLoadedSuccessfullyBefore ? i.load("plist/texture", cc.SpriteAtlas, function(t, i) {
if (t || !cc.isValid(i)) return o();
Object.keys(c.IMAGE_NAME_TO_GAME).forEach(function(t) {
var o = "blast_Io" === t ? "blast.Io" : t, n = i.getSpriteFrame("txt_" + o + "_big") || i.getSpriteFrame("txt_" + o) || i.getSpriteFrame("btn_" + t + "_big");
if (cc.isValid(n)) {
var a = c.IMAGE_NAME_TO_GAME[t], r = e._innerGameSFMap.get(a) || [];
r[0] = null;
r[1] = n;
e._innerGameSFMap.set(a, r);
}
});
a();
}) : i.loadDir("image", cc.SpriteFrame, function(t, i) {
var n, s;
if (t) return o();
try {
for (var l = r(i), d = l.next(); !d.done; d = l.next()) {
var m = d.value;
if (cc.isValid(m)) {
var u = m.name;
if (u.startsWith("btn_") && u.endsWith("_big")) {
var p = u.slice(4, u.length - 4), f = c.IMAGE_NAME_TO_GAME[p];
if (f) {
var _ = e._innerGameSFMap.get(f) || [];
_[0] = m;
e._innerGameSFMap.set(f, _);
}
}
}
}
} catch (e) {
n = {
error: e
};
} finally {
try {
d && !d.done && (s = l.return) && s.call(l);
} finally {
if (n) throw n.error;
}
}
a();
});
i.load(c.ITEM_PREFAB_URL, cc.Prefab, function(t, i) {
if (t || !cc.isValid(i)) return o();
e._itemPrefab = i;
a();
});
i.load(c.SEPARATOR_PREFAB_URL, cc.Prefab, function(t, i) {
if (t || !cc.isValid(i)) return o();
e._separatorPrefab = i;
a();
});
i.load(c.UI2_PREFAB_URL, cc.Prefab, function(t, i) {
if (t || !cc.isValid(i)) return o();
e._ui2Prefab = i;
a();
});
i.load(c.TIPS_PREFAB_URL, cc.Prefab, function(t, i) {
if (t || !cc.isValid(i)) return o();
e._tipsPrefab = i;
a();
});
} else {
e._assetsLoadPromise = null;
o();
}
}).catch(function() {
o();
});
});
return this._assetsLoadPromise;
};
t.prototype._renderList = function(e, t) {
var o, i = this;
if (this._contentGuardOff) {
this._contentGuardOff();
this._contentGuardOff = null;
}
var n = e.content;
if (cc.isValid(n)) {
this._setupLayout(n);
for (var a = t.state.output || {
newGames: [],
playedGames: [],
randomGames: []
}, r = a.newGames, l = a.playedGames, d = a.randomGames, m = [], u = [], p = n.children, f = p.length - 1; f >= 0; f--) {
var _ = p[f];
_.removeFromParent(!1);
_.getComponent(s.default) ? m.push(_) : "separator" === _.name && _[c.UI2_OWNER_KEY] ? u.push(_) : _.destroy();
}
this._itemList = [];
var h = new Set(), g = 0, y = 0, v = function(e) {
if (!h.has(e.gameName)) {
var o = i._getEntryAssets(e.gameName);
if (o[0] || o[1]) {
h.add(e.gameName);
var a;
if (g < m.length) {
a = m[g];
g++;
} else a = cc.instantiate(i._itemPrefab);
a.active = !0;
n.addChild(a);
var r = a.getComponent(s.default);
r || (r = a.addComponent(s.default));
a.name = e.gameName;
a.off("click", i._onClickItem, i);
a.on("click", i._onClickItem, i);
r.setState({
info: e,
selected: !1,
entryAssets: o,
updateEmitter: t.state.updateEmitter,
entryEmitter: t.state.entryEmitter,
shouldReportShow: i._shouldReportShow
});
!o[0] && o[1] && i.refreshItemBg(a, e.gameName, o[1]);
i._itemList.push(r);
}
}
};
(r || []).forEach(function(e) {
return v(e);
});
var L = (l || []).filter(function(e) {
return !h.has(e.gameName);
});
if (L.length > 0) {
(function() {
var e;
if (y < u.length) {
e = u[y];
y++;
} else e = i._makeSeparator();
e.active = !0;
n.addChild(e);
})();
var C = !1, T = L.find(function(e) {
return "chapter" === e.gameName;
});
T && (C = (null !== (o = null == T ? void 0 : T.clickCount) && void 0 !== o ? o : 0) < 1);
C && v(T);
L.forEach(function(e) {
C && "chapter" === e.gameName || v(e);
});
} else d && d.length > 0 && d.forEach(function(e) {
return v(e);
});
var R = m.length;
for (f = g; f < R; f++) m[f].destroy();
var w = u.length;
for (f = y; f < w; f++) u[f].destroy();
this.addCustomEntrances(n, c.UI2_OWNER_KEY);
}
};
t.prototype.refreshItemBg = function(e, t, o) {
var i, n = l[t], a = null === (i = e.getChildByName("nodeRoot")) || void 0 === i ? void 0 : i.getChildByName("bg");
if (a) {
var r = a.getComponent(cc.Sprite);
if (r) {
r.spriteFrame = null;
var s = a.getChildByName("game_name") || new cc.Node("game_name");
s.parent != a && (s.parent = a);
s.active = !0;
(s.getComponent(cc.Sprite) || s.addComponent(cc.Sprite)).spriteFrame = o;
var c = s.getComponent(cc.Widget) || s.addComponent(cc.Widget);
c.right = 66;
c.isAlignRight = !0;
c.top = 74;
c.isAlignTop = !0;
c.updateAlignment();
hs.ResLoader.asyncLoadByBundle(this.traitName, "image/btn_" + n + "_big", cc.SpriteFrame).then(function(o) {
if (o && cc.isValid(e) && e.name === t && cc.isValid(r)) {
r.spriteFrame = o;
cc.isValid(s) && (s.active = !1);
}
});
}
}
};
Object.defineProperty(t.prototype, "shouldWaitForResourcesLoadedBeforeActivation", {
get: function() {
return !1;
},
enumerable: !1,
configurable: !0
});
a([ hs.storageProperty({
key: "CommonGameListUI2_Ex_Trait_hasLoadedSuccessfullyBefore"
}) ], t.prototype, "_hasLoadedSuccessfullyBefore", void 0);
return a([ classId("CommonGameListUI2Trait", "Ex"), classMethodWatch() ], t);
}(c.CommonGameListUI2Trait);
o.CommonGameListUI2_Ex_Trait = d;
cc._RF.pop();
}, {
"./CommonGameListUI2Item": "CommonGameListUI2Item",
"./CommonGameListUI2Trait": "CommonGameListUI2Trait"
} ]
}, {}, [ "CommonGameListUI2Item", "CommonGameListUI2Trait", "CommonGameListUI2Types", "CommonGameListUI2_ExIOS_Trait", "CommonGameListUI2_Ex_Trait" ]);
//# sourceMappingURL=index.js.map
