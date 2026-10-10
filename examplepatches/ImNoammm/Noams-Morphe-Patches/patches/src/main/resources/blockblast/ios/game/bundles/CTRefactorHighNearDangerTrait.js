window.__require = function e(t, r, a) {
function o(n, s) {
if (!r[n]) {
if (!t[n]) {
var h = n.split("/");
h = h[h.length - 1];
if (!t[h]) {
var g = "function" == typeof __require && __require;
if (!s && g) return g(h, !0);
if (i) return i(h, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = h;
}
var l = r[n] = {
exports: {}
};
t[n][0].call(l.exports, function(e) {
return o(t[n][1][e] || e);
}, l, l.exports, e, t, r, a);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < a.length; n++) o(a[n]);
return o;
}({
CTRefactorHighNearDangerTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "ca905x6baVNSLLYeovW3wUT", "CTRefactorHighNearDangerTrait");
var a, o = this && this.__extends || (a = function(e, t) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
a(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, a) {
var o, i = arguments.length, n = i < 3 ? t : null === a ? a = Object.getOwnPropertyDescriptor(t, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, a); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (n = (i < 3 ? o(n) : i > 3 ? o(t, r, n) : o(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorHighNearDangerTrait = void 0;
var n = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.curRoundNum = -1;
t._historyHighScore = 1e4;
t._maxTigger = 3;
return t;
}
t.prototype.onCreate = function() {
var e, t, r, a;
this._historyHighScore = null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.history_highest) && void 0 !== t ? t : 1e4;
this._maxTigger = null !== (a = null === (r = this.props) || void 0 === r ? void 0 : r.maxTigger) && void 0 !== a ? a : 3;
};
t.prototype.onAlgorithmStrategyPreprocessComplete = function() {
this.handleBlockOutResult();
};
t.prototype.isClassAlgorithmLifeCycle_GameStart_ProxyNewGameInit = function() {
var e = hs.classAlgorithmStrategyIOSHighNearDangerInfo.highNearDanger;
e.timesGnum = 0;
e.succRound = -20;
e.gnum = hs.classGameInfo.gameNum;
this.curRoundNum = -1;
hs.classAlgorithmStrategyIOSHighNearDangerInfo.setHighNearDanger(e);
};
t.prototype.isAlgorithmStrategyIOSShangRefactoredInfoOfferClass = function(e) {
this.handleAlgorithmStrategyShangZengReplace(e);
};
t.prototype.isCTRefactorShangzengMediumTraitGetShangZengMediumAlgo = function(e) {
e.returnValue = this.handleAlgorithmStrategyShangZengMediumReplace();
};
t.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(e) {
this.handleAlgorithmStrategyTianKongReplace(e);
};
t.prototype.isClassAlgorithmLifeCycle_GameOver_ProxyUpdateGameOverPreDataClear = function(e) {
this.curRoundNum = hs.classGameInfo.roundNum;
e.args[0] && this.handleGameOverSettlementReplay(!0);
};
t.prototype.isClassAlgorithmLifeCycle_GameOverShow_ProxyOnClassOverShow = function() {
this.handleGameOverSettlementByClassOverShow();
};
t.prototype.handleAlgorithmStrategyTianKongReplace = function(e) {
if (this.isTrigger() && hs.classAlgorithmStrategyIOSHighNearDangerInfo.isThree()) {
var t = e.args[0];
if (t.includes(hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT)) {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
e.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(t, [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ], hs.OFFER_TYPE.HIGH_NEAR);
var r = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == r ? void 0 : r.active) && r.addAlgorithmNameMapping(hs.OFFER_TYPE.HIGH_NEAR, this.traitName, null, null, hs.OFFER_TYPE.HIGH_NEAR);
}
}
};
t.prototype.handleAlgorithmStrategyShangZengReplace = function(e) {
if (this.isTrigger() && hs.classAlgorithmStrategyIOSHighNearDangerInfo.isThree()) {
var t = e.args[0];
if (t.includes(hs.OFFER_TYPE.SHANG_ZENG_3)) {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
e.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(t, [ hs.OFFER_TYPE.SHANG_ZENG_3 ], hs.OFFER_TYPE.HIGH_NEAR);
var r = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == r ? void 0 : r.active) && r.addAlgorithmNameMapping(hs.OFFER_TYPE.HIGH_NEAR, this.traitName, null, null, hs.OFFER_TYPE.HIGH_NEAR);
}
}
};
t.prototype.handleAlgorithmStrategyShangZengMediumReplace = function() {
if (!this.isTrigger() || !hs.classAlgorithmStrategyIOSHighNearDangerInfo.isThree()) return hs.OFFER_TYPE.SHANG_ZEND_MEDIUM;
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
(null == e ? void 0 : e.active) && e.addAlgorithmNameMapping(hs.OFFER_TYPE.HIGH_NEAR, this.traitName, null, null, hs.OFFER_TYPE.HIGH_NEAR);
return hs.OFFER_TYPE.HIGH_NEAR;
};
t.prototype.handleNormalAlgorithmStrategyPriority = function() {};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isHighNearDangerPriority: function() {
return ASContext(2 === hs.classGameInfo.roundNum && e.isTrigger(), "高贴边陷阱题第二轮最高优先级");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
priority: [ {
conditions: {
fact: "isHighNearDangerPriority",
operator: "=",
value: !0
},
event: {
type: "triggerHighNearDangerPrioritySuccess"
},
flow: "highNearDangerPriorityFlow",
platform: "ios"
} ]
};
};
t.prototype.onPreprocessActions = function() {
return {
priority: {
highNearDangerPriorityFlow: [ {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.HIGH_NEAR ]
} ]
}
};
};
t.prototype.triggerHighNearDangerPrioritySuccess = function() {
this.handleNormalAlgorithmStrategyPriority();
};
t.prototype.handleBlockOutResult = function() {
if (hs.algorithmName.algoActualName.some(function(e) {
return e === hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.HIGH_NEAR];
})) {
var e = hs.classAlgorithmStrategyIOSHighNearDangerInfo.highNearDanger;
e.timesGnum++;
e.succRound = hs.classGameInfo.roundNum;
e.gnum = hs.classGameInfo.gameNum;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.HIGH_NEAR, this);
hs.classAlgorithmStrategyIOSHighNearDangerInfo.setHighNearDanger(e);
}
};
t.prototype.handleGameOverSettlementByClassOverShow = function() {
var e = hs.classAlgorithmStrategyIOSHighNearDangerInfo.highNearDanger;
this.handleLimitedMode(e, !1);
};
t.prototype.handleGameOverSettlementReplay = function(e) {
var t = hs.classAlgorithmStrategyIOSHighNearDangerInfo.highNearDanger;
this.handleLimitedMode(t, e);
};
t.prototype.handleLimitedMode = function(e, t) {
if (e.succRound !== this.curRoundNum || t) {
if (e.succRound > 1) if (t) {
e.validGNum = hs.classGameInfo.gameNum + 1;
hs.classAlgorithmStrategyIOSHighNearDangerInfo.setHighNearDanger(e);
} else {
e.validGNum = hs.classGameInfo.gameNum + 1 - 1;
hs.classAlgorithmStrategyIOSHighNearDangerInfo.setHighNearDanger(e);
}
} else {
e.dieGnum = hs.classGameInfo.gameNum;
e.validGNum = hs.classGameInfo.gameNum + 5 - 1;
hs.classAlgorithmStrategyIOSHighNearDangerInfo.setHighNearDanger(e);
}
};
t.prototype.isTrigger = function() {
var e = hs.classAlgorithmStrategyIOSHighNearDangerInfo.highNearDanger;
return !(hs.scoreInfo.highRecordScore < this._historyHighScore) && (!(e.validGNum >= hs.classGameInfo.gameNum) && !(e.timesGnum >= this._maxTigger && e.gnum === hs.classGameInfo.gameNum));
};
return i([ classId("CTRefactorHighNearDangerTrait") ], t);
}(Trait);
r.CTRefactorHighNearDangerTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorHighNearDangerTrait" ]);
//# sourceMappingURL=index.js.map
