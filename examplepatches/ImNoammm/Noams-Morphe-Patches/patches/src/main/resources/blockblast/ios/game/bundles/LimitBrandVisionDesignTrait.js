window.__require = function e(t, r, i) {
function n(s, a) {
if (!r[s]) {
if (!t[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!t[u]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var h = r[s] = {
exports: {}
};
t[s][0].call(h.exports, function(e) {
return n(t[s][1][e] || e);
}, h, h.exports, e, t, r, i);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < i.length; s++) n(i[s]);
return n;
}({
LimitBrandVisionDesignTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "ce6110F2oNPlIaHiwteyYFS", "LimitBrandVisionDesignTrait");
var i, n, o = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
i(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), s = this && this.__decorate || function(e, t, r, i) {
var n, o = arguments.length, s = o < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, i); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (s = (o < 3 ? n(s) : o > 3 ? n(t, r, s) : n(t, r)) || s);
return o > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.LimitBrandVisionDesignTrait = void 0;
(function(e) {
e[e.Online = 0] = "Online";
e[e.Offline = 1] = "Offline";
e[e.Weak = 2] = "Weak";
})(n || (n = {}));
var a = [ 20, 50, 80 ], u = {
recentGames: [],
type3Active: !1,
type3Expired: !1,
currentClassGame: null,
currentChapterGame: null
}, l = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._gameStarted = !1;
t._nodeHasNetwork = [];
t._triggeredPercents = [];
t._startHighScore = 0;
t._gmGameNetKind = null;
return t;
}
r = t;
t.prototype.onCreate = function() {
this.ensureStorage();
};
t.prototype.isClassGame_ProxyOnGameStart = function(e) {
this.onGameStart(e);
};
t.prototype.isChapterGame_ProxyOnGameStart = function(e) {
this.onGameStart(e);
};
t.prototype.isClassAdvertisement_FullScreenProxyShowFullScreenAdvertisement = function() {
this.sampleNetworkNode("插屏展示");
};
t.prototype.isChapterAdvertisement_FullScreenProxyShowFullScreenAdvertisement = function() {
this.sampleNetworkNode("插屏展示");
};
t.prototype.isClassAdvertisement_RewardProxyShowRewardVideo = function() {
this.sampleNetworkNode("激励展示");
};
t.prototype.isChapterAdvertisement_RewardProxyShowRewardVideo = function() {
this.sampleNetworkNode("激励展示");
};
t.prototype.isClassScore_ProxyUpdateScoreEnd = function() {
this.trySampleProgressPercents();
};
t.prototype.isChapterScore_ProxyTotalScoreDeltaOnce = function() {
this.trySampleProgressPercents();
};
t.prototype.isChapterCollect_ProxyOnTouchEnd = function() {
this.trySampleProgressPercents();
};
t.prototype.isClassWin_ProxyOpenUI = function() {
this.onGameSettle();
};
t.prototype.isClassFail_ProxyOpenUI = function() {
this.onGameSettle();
};
t.prototype.isChapterWin_ProxyOpenUI = function() {
this.onGameSettle();
};
t.prototype.isChapterFail_ProxyOpenUI = function() {
this.onGameSettle();
};
t.prototype.isBrandVisionDesignTraitCheckLoadingLimitActive = function(e) {
var t;
if (((null === (t = this.props) || void 0 === t ? void 0 : t.noSignal) || -1) == hs.NoSignalType.Loading && !this.isLimitActive()) {
e.returnState = !0;
e.returnValue = !1;
}
};
t.prototype.isBrandVisionDesignTraitCheckHomePageLimitActive = function(e) {
var t;
if (((null === (t = this.props) || void 0 === t ? void 0 : t.noSignal) || -1) == hs.NoSignalType.HomePage && !this.isLimitActive()) {
e.returnState = !0;
e.returnValue = !1;
}
};
t.prototype.isBrandVisionDesignTraitCheckEnterGameIngLimitActive = function(e) {
var t;
if (((null === (t = this.props) || void 0 === t ? void 0 : t.noSignal) || -1) != hs.NoSignalType.EnterGameIng) return !0;
if (!this.isLimitActive()) {
e.returnState = !0;
e.returnValue = !1;
}
};
t.prototype.isLimitActive = function() {
var e = this.getLimitType(), t = this.getStorage().recentGames;
return 2 === e ? !(t.length < 1) && t[t.length - 1] === n.Offline : (3 !== e || !this.getStorage().type3Expired) && !(t.length < 3) && t.slice(-3).every(function(e) {
return e === n.Offline;
});
};
t.prototype.getLimitType = function() {
var e, t = null === (e = this.props) || void 0 === e ? void 0 : e.limitType;
return 2 === t || 3 === t ? t : 1;
};
t.prototype.shouldSkipGameNetRecord = function() {
return 3 === this.getLimitType() && this.getStorage().type3Expired;
};
t.prototype.onGameStart = function(e) {
this.shouldSkipGameNetRecord() || (this.shouldResumeLeftoverGame(e) ? this.resumeLeftoverGame() : this.beginNewGame());
};
t.prototype.onGameSettle = function() {
if (this.shouldSkipGameNetRecord()) {
this.clearCurrentGame();
this.consumeGmGameNetKind();
} else {
var e = this.getCurrentGameNum(), t = !this._gameStarted && (this.restoreCurrentGameFromStorage(e - 1) || this.restoreCurrentGameFromStorage(e));
if (!this._gameStarted && !t) {
if (1 != e && 0 != e) return;
this._gameStarted = !0;
this.sampleNetworkNode("开局", !0);
}
this._gameStarted = !0;
this.sampleNetworkNode("结算");
var r = this.classifyCurrentGame();
this.pushRecentGame(r);
this.clearCurrentGame();
this.consumeGmGameNetKind();
}
};
t.prototype.shouldResumeLeftoverGame = function(e) {
var t, r, i;
return !this.isNewbieGuideGame() && !0 !== (null === (i = null === (r = null === (t = null == e ? void 0 : e.args) || void 0 === t ? void 0 : t[0]) || void 0 === r ? void 0 : r.data) || void 0 === i ? void 0 : i.newGame) && !!this.hasPersistedCurrentGame() && !this.isPostGuideFreshStart();
};
t.prototype.isNewbieGuideGame = function() {
var e, t;
return hs.gameInfo.gameMode === hs.GameMode.Class && (!!(null === (e = hs.classGuideInfo) || void 0 === e ? void 0 : e.show) || !0 !== (null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.isFinishedGuide));
};
t.prototype.isPostGuideFreshStart = function() {
var e, t, r, i, n, o;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
if (!0 !== (null === (e = hs.classGuideInfo) || void 0 === e ? void 0 : e.isFinishedGuide) || (null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.show)) return !1;
var s = !0 === hs.storage.getItem("classGameInProcess", !1), a = null !== (i = null === (r = hs.classScoreInfo) || void 0 === r ? void 0 : r.score) && void 0 !== i ? i : 0, u = !!(null === (o = null === (n = hs.boardInfo) || void 0 === n ? void 0 : n.isNullBoard) || void 0 === o ? void 0 : o.call(n));
return !s && 0 === a && u;
};
t.prototype.beginNewGame = function() {
this._gameStarted = !0;
this._nodeHasNetwork = [];
this._triggeredPercents = [];
this._startHighScore = this.snapshotStartHighScore();
this.sampleNetworkNode("开局");
};
t.prototype.resumeLeftoverGame = function() {
var e = this.restoreCurrentGameFromStorage();
this._gameStarted = !0;
if (!e) {
this._nodeHasNetwork = [];
this._triggeredPercents = [];
this._startHighScore = this.snapshotStartHighScore();
}
this.persistCurrentGame();
};
t.prototype.sampleNetworkNode = function(e, t) {
if (this._gameStarted && !this.shouldSkipGameNetRecord()) {
var r = null != t ? t : this.hasNetwork();
this._nodeHasNetwork.push(r);
this.persistCurrentGame();
}
};
t.prototype.trySampleProgressPercents = function() {
if (this._gameStarted) {
var e = this.getProgressPercent();
if (!(e < 0)) for (var t = 0; t < a.length; t++) {
var r = a[t];
if (!(this._triggeredPercents.indexOf(r) >= 0 || e < r)) {
this._triggeredPercents.push(r);
var i = hs.gameInfo.gameMode === hs.GameMode.Chapter ? "关卡" : "无尽";
this.sampleNetworkNode(i + " 进度" + r + "%");
}
}
}
};
t.prototype.getProgressPercent = function() {
var e, t, r, i, n, o, s, a;
if (hs.gameInfo.gameMode === hs.GameMode.Chapter) {
var u = null !== (o = null !== (r = null === (t = null === (e = hs.chapterConfigInfo) || void 0 === e ? void 0 : e.getChapterProgressFix) || void 0 === t ? void 0 : t.call(e)) && void 0 !== r ? r : null === (n = null === (i = hs.chapterConfigInfo) || void 0 === i ? void 0 : i.getChapterProgress) || void 0 === n ? void 0 : n.call(i)) && void 0 !== o ? o : 0;
return Number.isFinite(u) ? 100 * u : -1;
}
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var l = this._startHighScore;
if (!Number.isFinite(l) || l <= 0) return -1;
var h = null !== (a = null === (s = hs.classScoreInfo) || void 0 === s ? void 0 : s.score) && void 0 !== a ? a : 0;
return Number.isFinite(h) ? h / l * 100 : -1;
}
return -1;
};
t.prototype.snapshotStartHighScore = function() {
var e, t;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return 0;
var r = null !== (t = null === (e = hs.classScoreInfo) || void 0 === e ? void 0 : e.highScore) && void 0 !== t ? t : 0;
return Number.isFinite(r) && r > 0 ? r : 0;
};
t.prototype.hasNetwork = function() {
return this._gmGameNetKind === n.Online || this._gmGameNetKind !== n.Offline && (this._gmGameNetKind === n.Weak ? 0 === this._nodeHasNetwork.length : !!hs.NativeNetwork.getNetWorkState());
};
t.prototype.classifyCurrentGame = function() {
if (null !== this._gmGameNetKind) return this._gmGameNetKind;
var e = this._nodeHasNetwork;
if (0 === e.length) return n.Online;
var t = e.some(function(e) {
return e;
}), r = e.some(function(e) {
return !e;
});
return t && r ? n.Weak : r ? n.Offline : n.Online;
};
t.prototype.getCurrentGameNum = function(e) {
var t, r, i, n;
void 0 === e && (e = "");
var o = -1;
hs.gameInfo.gameMode === hs.GameMode.Chapter ? o = null !== (r = null === (t = hs.chapterGameInfo) || void 0 === t ? void 0 : t.gameNum) && void 0 !== r ? r : -1 : hs.gameInfo.gameMode === hs.GameMode.Class && (o = null !== (n = null === (i = hs.classGameInfo) || void 0 === i ? void 0 : i.gameNum) && void 0 !== n ? n : -1);
-1 == o || "插屏展示" !== e && "结算" !== e || (o -= 1);
return o;
};
t.prototype.getPersistedCurrentGame = function() {
var e = this.getStorage();
return hs.gameInfo.gameMode === hs.GameMode.Chapter ? e.currentChapterGame : e.currentClassGame;
};
t.prototype.hasPersistedCurrentGame = function() {
var e = this.getPersistedCurrentGame(), t = this.getCurrentGameNum();
return !!e && e.gameNum === t && t >= 0;
};
t.prototype.persistCurrentGame = function() {
var e = this.getCurrentGameNum();
if (!(e < 0)) {
var t = this.getStorage(), r = {
gameNum: e,
nodeHasNetwork: this._nodeHasNetwork.slice(),
triggeredPercents: this._triggeredPercents.slice(),
startHighScore: this._startHighScore
};
hs.gameInfo.gameMode === hs.GameMode.Chapter ? t.currentChapterGame = r : t.currentClassGame = r;
this.setStorage(t);
}
};
t.prototype.restoreCurrentGameFromStorage = function(e) {
var t;
void 0 === e && (e = this.getCurrentGameNum());
if (!this.hasPersistedCurrentGame()) return !1;
var r = this.getPersistedCurrentGame();
if (!r || r.gameNum !== e) return !1;
this._nodeHasNetwork = r.nodeHasNetwork.slice();
this._triggeredPercents = r.triggeredPercents.slice();
this._startHighScore = null !== (t = r.startHighScore) && void 0 !== t ? t : 0;
return !0;
};
t.prototype.clearCurrentGame = function() {
this._gameStarted = !1;
this._nodeHasNetwork = [];
this._triggeredPercents = [];
this._startHighScore = 0;
var e = this.getStorage();
hs.gameInfo.gameMode === hs.GameMode.Chapter ? e.currentChapterGame = null : e.currentClassGame = null;
this.setStorage(e);
};
t.prototype.pushRecentGame = function(e) {
var t = this.getStorage();
t.recentGames.push(e);
t.recentGames.length > 3 && (t.recentGames = t.recentGames.slice(-3));
if (t.type3Expired) t.type3Active = !1; else if (e === n.Weak) {
if (t.type3Active) {
t.type3Expired = !0;
t.type3Active = !1;
}
} else {
var r = t.recentGames.slice(-3);
r.length >= 3 && r.every(function(e) {
return e === n.Offline;
}) && (t.type3Active = !0);
}
this.setStorage(t);
};
t.prototype.formatGameNetKind = function(e) {
return e === n.Offline ? "无网局" : e === n.Weak ? "弱网局" : "有网局";
};
t.prototype.consumeGmGameNetKind = function() {
null !== this._gmGameNetKind && (this._gmGameNetKind = null);
};
t.prototype.registerGMTool = function() {
var e = this;
if (!r._didRegisterGMTool) {
r._didRegisterGMTool = !0;
var t = {
title: "无网限制-设置本局网络",
argName: "1/0/2/c",
explainStr: "设置本局网络分类，本局结算入队后自动失效。\n0=有网局\n1=无网局\n2=弱网局\nc=清除\n不传参数=查看当前覆盖与近局记录",
action: function(t) {
e.handleGmCommand(t);
}
};
hs.classGmCfgMenuTrait.push(t);
hs.chapterGmCfgMenuTrait.push(t);
}
};
t.prototype.handleGmCommand = function(e) {
var t = (null != e ? e : "").trim();
if (t) if ("c" !== t.toLowerCase()) {
var r = {
1: n.Offline,
0: n.Online,
2: n.Weak
}[t];
void 0 !== r && (this._gmGameNetKind = r);
} else this._gmGameNetKind = null;
};
t.prototype.ensureStorage = function() {
this.getStorage();
};
t.prototype.getStorage = function() {
var e = hs.storage.getItem("LimitBrandVisionDesignTrait_T", u);
return {
recentGames: Array.isArray(null == e ? void 0 : e.recentGames) ? e.recentGames.filter(function(e) {
return e === n.Online || e === n.Offline || e === n.Weak;
}) : [],
type3Active: !!(null == e ? void 0 : e.type3Active),
type3Expired: !!(null == e ? void 0 : e.type3Expired),
currentClassGame: this.parseCurrentGame(null == e ? void 0 : e.currentClassGame),
currentChapterGame: this.parseCurrentGame(null == e ? void 0 : e.currentChapterGame)
};
};
t.prototype.setStorage = function(e) {
hs.storage.setItem("LimitBrandVisionDesignTrait_T", {
recentGames: e.recentGames.slice(-3),
type3Active: !!e.type3Active,
type3Expired: !!e.type3Expired,
currentClassGame: e.currentClassGame,
currentChapterGame: e.currentChapterGame
});
};
t.prototype.parseCurrentGame = function(e) {
if (!e || "object" != typeof e) return null;
var t = e, r = Number(t.gameNum);
if (!Number.isFinite(r) || r < 0) return null;
var i = Array.isArray(t.nodeHasNetwork) ? t.nodeHasNetwork.map(function(e) {
return !!e;
}) : [], n = Array.isArray(t.triggeredPercents) ? t.triggeredPercents.filter(function(e) {
return "number" == typeof e && Number.isFinite(e);
}) : [], o = Number(t.startHighScore);
return {
gameNum: r,
nodeHasNetwork: i,
triggeredPercents: n,
startHighScore: Number.isFinite(o) && o > 0 ? o : 0
};
};
var r;
t._didRegisterGMTool = !1;
return r = s([ classId("LimitBrandVisionDesignTrait") ], t);
}(Trait);
r.LimitBrandVisionDesignTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "LimitBrandVisionDesignTrait" ]);
//# sourceMappingURL=index.js.map
