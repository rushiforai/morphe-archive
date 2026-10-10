window.__require = function e(t, o, r) {
function i(n, a) {
if (!o[n]) {
if (!t[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!t[c]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var v = o[n] = {
exports: {}
};
t[n][0].call(v.exports, function(e) {
return i(t[n][1][e] || e);
}, v, v.exports, e, t, o, r);
}
return o[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < r.length; n++) i(r[n]);
return i;
}({
CTRefactorReviveBlockAlertTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "2efa1G9wXBD44GeXXGfZlWM", "CTRefactorReviveBlockAlertTrait");
var r, i = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
r(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), s = this && this.__decorate || function(e, t, o, r) {
var i, s = arguments.length, n = s < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, o, r); else for (var a = e.length - 1; a >= 0; a--) (i = e[a]) && (n = (s < 3 ? i(n) : s > 3 ? i(t, o, n) : i(t, o)) || n);
return s > 3 && n && Object.defineProperty(t, o, n), n;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorReviveBlockAlertTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._blockPrefab = null;
t._reviveIds_class = null;
t._reviveIds_chapter = null;
t._isShowing = !1;
return t;
}
t.prototype.onCreate = function() {
this.preLoadRes();
};
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return !!hs.gameInfo.isGreaterThan14Day;
},
enumerable: !1,
configurable: !0
});
t.prototype.isRevive_ProxyOpenUI = function(e) {
var t = TRAIT("ReviveCountdownTrait");
if ((!t || !t.active) && this.hasLoadRes() && !this._isShowing) {
e.args[1] = hs.PrefabConfig.ReviveBlockAlert;
this._isShowing = !0;
}
};
t.prototype.isRevive_ProxyUpdateUI = function(e) {
this._isShowing && this.reviveUpdateUI(e);
};
t.prototype.isClassBlocksProducer_ProxyRequestBlocksProducer = function(e) {
if (this._reviveIds_class && e.args[0].strategyState == hs.ALGO_STRATEGY_TYPE.REVIVE) {
e.args[0].needAlgorithmStrategyRequest = !1;
this._reviveIds_class = null;
as.AlgorithmStrategyAlgoActualNamePatch.patch([ "复活", "复活", "复活" ], this);
}
};
t.prototype.isChapterBlocksProducer_ProxyRequestBlocksProducer = function(e) {
if (this._reviveIds_chapter && e.args[0].strategyState == hs.ALGO_STRATEGY_TYPE.REVIVE) {
e.args[0].ignoreAlgorithmStrategyRequest = !0;
this._reviveIds_chapter = null;
as.AlgorithmStrategyAlgoActualNamePatch.patch([ "复活", "复活", "复活" ], this);
}
};
t.prototype.isClassRevive_ProxyOnClick_ok = function() {
this._isShowing = !1;
};
t.prototype.isChapterRevive_ProxyOnClick_ok = function() {
this._isShowing = !1;
};
t.prototype.isClassRevive_ProxyOnClick_close = function() {
this._isShowing = !1;
};
t.prototype.isChapterRevive_ProxyOnClick_close = function() {
this._isShowing = !1;
};
t.prototype.isClassGameOver_GameEndPre_ProxyIsCanShowSplash = function(e) {
e.disable([ "CTReviveTimeOutSkipSplashTrait" ]);
var t = Cinst(hs.ReviveBlockAlertComponent);
t && t.closeButtonClicked && (e.returnValue = !1);
};
t.prototype.isAlgorithmStrategyLogicNeedCheckSameBlock = function(e) {
hs.algorithmName.algoActualId == hs.OFFER_TYPE.REVIVE && (e.returnValue = !1);
};
t.prototype.isRevive_ProxyOnClickClose = function(e) {
Cinst(hs.ReviveBlockAlertComponent) && (e.replace = !0);
};
t.prototype.isClassRevive_ProxyOnRevive_SuccessPlayAudio = function(e) {
Cinst(hs.ReviveBlockAlertComponent) && (e.replace = !0);
};
t.prototype.isChapterRevive_ProxyOnRevive_SuccessPlayAudio = function(e) {
Cinst(hs.ReviveBlockAlertComponent) && (e.args[0] = !0);
};
t.prototype.isRevive_ProxyOnGameReady = function() {
var e = Cinst(hs.ReviveBlockAlertComponent);
e && (e.closeButtonClicked = !1);
};
t.prototype.onAlgorithmStrategySessionInit = function() {
var e = TRAIT("CTRefactorNewLifeBlockCtrlTrait");
(null == e ? void 0 : e.active) && e.setState({
isTrigger: !0
});
};
t.prototype.reviveUpdateUI = function(e) {
var t = this;
hs.algorithmIOSReviveInfo.setAlgorithmReviveTriat(!0);
hs.EventManager.dispatchModuleEventAsync(new hs.E_AlgorithmStrategy_Run({
type: hs.ALGO_STRATEGY_TYPE.REVIVE
})).then(function() {
hs.gameInfo.gameType == hs.GameType.Class ? t._reviveIds_class = hs.algorithmInfo.blockIdList : hs.gameInfo.gameType == hs.GameType.Chapter && (t._reviveIds_chapter = hs.algorithmInfo.blockIdList);
if (e.args[1] === hs.PrefabConfig.ReviveBlockAlert) {
var o = Cinst(hs.ReviveBlockAlertComponent);
if (o) if (hs.gameInfo.gameType == hs.GameType.Class) {
var r = storage.getItem("classColorLists", [ 1, 4, 2 ]);
o.setState({
producerBlocks: t._reviveIds_class,
colors: r
});
} else if (hs.gameInfo.gameType == hs.GameType.Chapter) {
r = storage.getItem("chapterColorLists", []);
o.setState({
producerBlocks: t._reviveIds_chapter,
colors: r
});
}
}
});
e.args[1] === hs.PrefabConfig.ReviveBlockAlert && (e.replace = !0);
};
t.prototype.hasLoadRes = function() {
return cc.isValid(this._blockPrefab);
};
t.prototype.preLoadRes = function() {
var e = this;
cc.isValid(this._blockPrefab) || hs.ResLoader.loadByBundle(hs.PrefabConfig.ReviveBlockAlert.bundleName, hs.PrefabConfig.ReviveBlockAlert.url, cc.Prefab, function(t, o) {
t || (e._blockPrefab = o);
});
};
return s([ classId("CTRefactorReviveBlockAlertTrait") ], t);
}(Trait);
o.CTRefactorReviveBlockAlertTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorReviveBlockAlertTrait" ]);
//# sourceMappingURL=index.js.map
