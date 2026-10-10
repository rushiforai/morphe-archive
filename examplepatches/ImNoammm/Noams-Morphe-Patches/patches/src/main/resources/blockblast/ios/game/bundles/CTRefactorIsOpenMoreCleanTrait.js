window.__require = function t(e, o, r) {
function i(s, a) {
if (!o[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var h = o[s] = {
exports: {}
};
e[s][0].call(h.exports, function(t) {
return i(e[s][1][t] || t);
}, h, h.exports, t, e, o, r);
}
return o[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < r.length; s++) i(r[s]);
return i;
}({
CTRefactorIsOpenMoreCleanTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "f6c9eOhW31PpMjSHg+aSzxt", "CTRefactorIsOpenMoreCleanTrait");
var r, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), n = this && this.__decorate || function(t, e, o, r) {
var i, n = arguments.length, s = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, o, r); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (s = (n < 3 ? i(s) : n > 3 ? i(e, o, s) : i(e, o)) || s);
return n > 3 && s && Object.defineProperty(e, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorIsOpenMoreCleanTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.canUse = !0;
e.hasInitLocalData = !1;
e.isCurRoundDuoXiaoActive = !1;
return e;
}
e.prototype.data = function() {
return {
curRoundOfferSuccess: !1,
moreCleanSuccess: !1,
triggerCount: 0,
scoreRecord: []
};
};
e.prototype.onCreate = function() {
this.initLocalRecord();
};
e.prototype.getOverScoreRecordMaxCount = function() {
return 10;
};
e.prototype.getTriggerCountMax = function() {
return 5;
};
e.prototype.getEffectiveRoundLimit = function() {
return 5;
};
e.prototype.getLimitHighScore = function() {
return 3e3;
};
e.prototype.getLimitBoardWeight = function() {
return 300;
};
e.prototype.getScoreRateCondition1 = function() {
return .8;
};
e.prototype.getScoreRateCondition2 = function() {
return .9;
};
e.prototype.getScoreRateCondition3 = function() {
return 1;
};
e.prototype.getMultiEliminateMinClearNum = function() {
return 3;
};
e.prototype.initLocalRecord = function() {
if (!this.hasInitLocalData) {
try {
var t = storage.getItem("IsOpenMoreCleanTraitData", null);
if (t) {
var e = JSON.parse(t);
this.state.curRoundOfferSuccess = e.curRoundOfferSuccess;
this.state.moreCleanSuccess = e.moreCleanSuccess;
this.state.triggerCount = e.triggerCount;
this.state.scoreRecord = e.scoreRecord;
} else {
var o = cc.sys.localStorage.getItem("endless_more_clean_block");
if (o) {
e = JSON.parse(o);
this.state.curRoundOfferSuccess = e.curRoundOfferSuccess;
this.state.moreCleanSuccess = e.moreCleanSuccess;
this.state.triggerCount = e.triggerCount;
this.state.scoreRecord = e.scoreRecord;
} else {
this.state.curRoundOfferSuccess = !1;
this.state.moreCleanSuccess = !1;
this.state.triggerCount = 0;
this.state.scoreRecord = [];
}
this.save();
}
} catch (t) {
this.canUse = !1;
}
this.hasInitLocalData = !0;
}
};
e.prototype.save = function() {
storage.setItem("IsOpenMoreCleanTraitData", JSON.stringify(this.state));
};
e.prototype.resetRecord = function() {
this.state.curRoundOfferSuccess = !1;
this.state.moreCleanSuccess = !1;
this.state.triggerCount = 0;
};
e.prototype.onTouchEndBlocksProducer = function(t) {
var e, o;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var r = (null === (o = null === (e = t.args[0]) || void 0 === e ? void 0 : e.state) || void 0 === o ? void 0 : o.eliminateCount) || 0;
this.onClear(r);
}
};
e.prototype.saveLocalRecord = function() {
this.resetRecord();
var t = hs.scoreInfo.score, e = hs.scoreInfo.highRecordScore, o = Date.now();
this.state.scoreRecord.push({
time: o,
score: t,
highRecord: e
});
for (var r = 0; r < this.state.scoreRecord.length; r++) {
var i = this.state.scoreRecord[r];
if (!this.isSameDay(i.time, o)) {
this.state.scoreRecord.splice(r, 1);
r--;
}
}
var n = this.getOverScoreRecordMaxCount();
this.state.scoreRecord.length > n && this.state.scoreRecord.splice(0, this.state.scoreRecord.length - n);
this.save();
};
e.prototype.onAllClearPanel = function() {
this.state.triggerCount = this.getTriggerCountMax() + 1;
this.save();
};
e.prototype.isUsedAndSuccess = function() {
return this.isCurRoundDuoXiaoActive;
};
e.prototype.onDuoXiaoOfferSuccess = function() {
this.state.curRoundOfferSuccess = !0;
this.state.moreCleanSuccess && this.state.triggerCount++;
this.save();
};
e.prototype.otherTraitCanNotUse = function() {
return !1;
};
e.prototype.getNextTurnModel = function() {
this.isCurRoundDuoXiaoActive = !1;
this.state.curRoundOfferSuccess = !1;
if (this.otherTraitCanNotUse()) return hs.OFFER_TYPE.NONE;
var t = this.getEffectiveRoundLimit();
if (hs.classGameInfo.roundNum <= t) return hs.OFFER_TYPE.NONE;
var e = this.getTriggerCountMax();
if (this.state.moreCleanSuccess) {
this.isCurRoundDuoXiaoActive = !0;
return this.state.triggerCount <= e ? hs.OFFER_TYPE_BASE.DUO_XIAO : hs.OFFER_TYPE.NONE;
}
var o = hs.scoreInfo.highRecordScore, r = hs.scoreInfo.score, i = hs.BinaryBoard.getWeightValue(), n = r / o, s = this.getLimitHighScore(), a = this.getLimitBoardWeight();
if (o <= s) {
if (this.checkWeight(i, a)) {
this.isCurRoundDuoXiaoActive = !0;
return hs.OFFER_TYPE_BASE.DUO_XIAO;
}
return hs.OFFER_TYPE.NONE;
}
for (var c = !1, u = this.state.scoreRecord.length - 1; u >= 0; u--) {
var h = this.state.scoreRecord[u];
if (h.score >= h.highRecord) {
c = !0;
break;
}
}
var l = this.getScoreRateCondition1(), f = this.getScoreRateCondition2(), p = this.getScoreRateCondition3();
if (c) {
if (n <= l) {
if (this.checkWeight(i, a)) {
this.isCurRoundDuoXiaoActive = !0;
return hs.OFFER_TYPE_BASE.DUO_XIAO;
}
return hs.OFFER_TYPE.NONE;
}
return n >= p ? hs.OFFER_TYPE.NONE : n >= f ? this.isChangeDifficulty() : hs.OFFER_TYPE.NONE;
}
if (this.checkWeight(i, a)) {
this.isCurRoundDuoXiaoActive = !0;
return hs.OFFER_TYPE_BASE.DUO_XIAO;
}
return hs.OFFER_TYPE.NONE;
};
e.prototype.onClear = function(t) {
if (this.state.curRoundOfferSuccess) {
var e = new hs.BinaryBoard();
e.convertToBinaryBoard(hs.classBoardInfo.faceBlocks);
e.canClearBlockArr(!0);
var o = 0 == e.getEdgeGameNum();
if (t >= this.getMultiEliminateMinClearNum() || o) {
this.state.moreCleanSuccess = !0;
o && this.onAllClearPanel();
this.save();
}
}
};
e.prototype.isSameDay = function(t, e) {
if (t - e > 864e5) return !1;
var o = new Date(t), r = new Date(e);
return o.getDay() === r.getDay();
};
e.prototype.checkWeight = function(t, e) {
return t >= e;
};
e.prototype.isChangeDifficulty = function(t) {
void 0 === t && (t = hs.OFFER_TYPE.NONE);
return t && t != hs.OFFER_TYPE.NONE ? t : hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI;
};
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassDataStatistics_Dot_Proxy",
methodName: "onGameEnd"
}, {
className: "ClassGame_Replay_Proxy",
methodName: "onGameReplay"
} ];
};
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !!this.canUse;
},
enumerable: !1,
configurable: !0
});
e.prototype.isClassDataStatistics_Dot_ProxyOnGameEnd = function() {
this.saveLocalRecord();
};
e.prototype.isClassGame_Replay_ProxyOnGameReplay = function() {
this.resetRecord();
};
e.prototype.isBlocksProducer_ProxyOnTouchEnd = function(t) {
this.onTouchEndBlocksProducer(t);
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.isCurRoundDuoXiaoActive = !1;
this.state.curRoundOfferSuccess = !1;
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
var o;
if (this.canUse && t && (null !== (o = e.actualAlgorithmId) && void 0 !== o ? o : e.algorithmId) === hs.OFFER_TYPE_BASE.DUO_XIAO) {
var r = e.SDK_Extra, i = null == r ? void 0 : r.TkxcMoreClean;
i && i.isClearBoard && this.onAllClearPanel();
}
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
this.canUse && hs.algorithmName.algoActualId === hs.OFFER_TYPE.DUO_XIAO && this.onDuoXiaoOfferSuccess();
};
e.prototype.onPreprocessConditionContext = function() {
var t = this, e = !1, o = hs.OFFER_TYPE.NONE, r = "下次出块算法类型";
return buildLazyConditionContext({
nextOfferType: function() {
if (!e) {
if (t.canUse) {
o = t.getNextTurnModel();
r = "下次出块算法类型";
} else {
o = hs.OFFER_TYPE.NONE;
r = "下次出块算法类型（特性不可用）";
}
e = !0;
}
return ASContext(o, r);
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoTrait: [ {
conditions: {
fact: "nextOfferType",
operator: "=",
value: hs.OFFER_TYPE_BASE.DUO_XIAO
},
event: {
type: "markAlgoTraitSource"
},
flow: "duoXiao"
}, {
conditions: {
fact: "nextOfferType",
operator: "=",
value: hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI
},
event: {
type: "markAlgoTraitSource"
},
flow: "zhiJueNanTi"
} ]
}
};
};
e.prototype.markAlgoTraitSource = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoTrait: {
duoXiao: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.DUO_XIAO ]
} ],
zhiJueNanTi: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI ]
} ]
}
}
};
};
e.prototype.onSDKArgsConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
hasDuoXiao: function() {
var o;
if (!e.canUse) return ASContext(!1, "算法列表中是否包含多消算法");
var r = null !== (o = null == t ? void 0 : t.algorithmList) && void 0 !== o ? o : [];
return ASContext(r.some(function(t) {
return t.algorithmId === hs.OFFER_TYPE_BASE.DUO_XIAO;
}), "算法列表中是否包含多消算法");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "hasDuoXiao",
operator: "=",
value: !0
},
flow: "duoXiaoArgs"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = this;
return {
duoXiaoArgs: function() {
return {
extra: {
traits: {
TkxcMoreClean: {
isMoreClean: !t.state.moreCleanSuccess
}
}
}
};
}
};
};
return n([ classId("CTRefactorIsOpenMoreCleanTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorIsOpenMoreCleanTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsOpenMoreCleanTrait" ]);
//# sourceMappingURL=index.js.map
