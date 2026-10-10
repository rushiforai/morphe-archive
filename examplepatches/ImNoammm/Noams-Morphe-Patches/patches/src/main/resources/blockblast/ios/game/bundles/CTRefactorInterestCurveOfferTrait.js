window.__require = function t(e, r, o) {
function a(s, n) {
if (!r[s]) {
if (!e[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!e[l]) {
var f = "function" == typeof __require && __require;
if (!n && f) return f(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var u = r[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return a(e[s][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) a(o[s]);
return a;
}({
CTRefactorInterestCurveOfferTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "9cf9eE/ZLZA6Lg5q4a7BtYC", "CTRefactorInterestCurveOfferTrait");
var o, a, i, s = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__decorate || function(t, e, r, o) {
var a, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var n = t.length - 1; n >= 0; n--) (a = t[n]) && (s = (i < 3 ? a(s) : i > 3 ? a(e, r, s) : a(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, l = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, a, i = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) s.push(o.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (a) throw a.error;
}
}
return s;
}, f = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(l(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorInterestCurveOfferTrait = void 0;
(function(t) {
t[t.None = 0] = "None";
t[t.From30To24 = 1] = "From30To24";
t[t.From24To30 = 2] = "From24To30";
})(a || (a = {}));
(function(t) {
t[t.Basic = 0] = "Basic";
t[t.Param1 = 1] = "Param1";
t[t.Param2 = 2] = "Param2";
})(i || (i = {}));
var u = function(t) {
s(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._coldStart = hs.gameInfo.entryTime;
e._playNum = 0;
e._tempData = {
noWipe: 0,
interestValues: [],
downStep: 0,
totalStep: 0,
isTrough: !1,
isLowTrigger: !1,
enterTimeDiff: !1,
diffDown: !1,
valleyRate: 0,
thirdPartState: a.None,
offered: !1,
lastOffered: [],
simpleCD: 0,
useSimple: !1
};
e._params = {
enable_game_cnt: 3,
enable_trough_ratio: .3,
init_interest_point: 0,
weight_clear_cnt: .5,
max_round_weight_clear: 30,
min_weight_clear: .3,
weight_combo_cnt: .1,
weight_clear_screen: 3,
weight_no_clear: .2,
trough_block_cnt: 9,
trough_decrease_ratio: .7
};
e._preprocessOfferResult = null;
e._postprocessOfferResult = null;
e._preprocessOfferResolved = !1;
e._postprocessOfferResolved = !1;
return e;
}
e.prototype.onAlgorithmStrategyGameInit = function() {
this.initData();
this._preprocessOfferResult = null;
this._postprocessOfferResult = null;
this._preprocessOfferResolved = !1;
this._postprocessOfferResolved = !1;
this._preprocessCanTryBeforePuzzleTime = void 0;
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.resetDiff();
this._preprocessOfferResult = null;
this._postprocessOfferResult = null;
this._preprocessOfferResolved = !1;
this._postprocessOfferResolved = !1;
this._preprocessCanTryBeforePuzzleTime = void 0;
};
e.prototype.onAlgorithmStrategySDKBetween = function(t) {
this.isPuzzleTimeFlow(t) && (t.process !== as.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_FAIL && t.process !== as.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_FAIL || this.isReady() && (this._tempData.diffDown = !0));
};
e.prototype.onPreprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
canTryInterestCurveOfferBeforePuzzleTime: function() {
return ASContext(e.peekPreprocessCanTryBeforePuzzleTime(), "兴趣曲线是否可在定时难题前抢跑");
},
currentSource: function() {
return ASContext(e.getCurrentSource(t), "当前算法列表主来源");
}
});
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
interestCurvePreprocessOfferWithFallback: function(e) {
if (!e) return !1;
var r = t.resolvePreprocessOfferResult();
return !(!r || r.fallbackIds.length <= 0) && {
status: !0,
data: r
};
},
interestCurvePreprocessOfferWithoutFallback: function(e) {
if (!e) return !1;
var r = t.resolvePreprocessOfferResult();
return !(!r || r.fallbackIds.length > 0) && {
status: !0,
data: r
};
}
};
};
e.prototype.fixTraitSource = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
BeforePuzzleTime: [ {
conditions: {
fact: "canTryInterestCurveOfferBeforePuzzleTime",
operator: "interestCurvePreprocessOfferWithFallback",
value: !0
},
event: {
type: "fixTraitSource"
},
platform: "all",
flow: "beforePuzzleTimeWithFallback"
}, {
conditions: {
fact: "canTryInterestCurveOfferBeforePuzzleTime",
operator: "interestCurvePreprocessOfferWithoutFallback",
value: !0
},
event: {
type: "fixTraitSource"
},
platform: "all",
flow: "beforePuzzleTimeWithoutFallback"
} ]
},
postPreprocessing: [ {
conditions: {
or: [ {
fact: "currentSource",
operator: "=",
value: hs.ClassAlgorithmSourceType.PuzzleTimeFirst
}, {
fact: "currentSource",
operator: "=",
value: hs.ClassAlgorithmSourceType.PuzzleTimeOther
} ]
},
event: {
type: "enterDiff"
},
platform: "all"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
BeforePuzzleTime: {
beforePuzzleTimeWithFallback: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ {
fact: "operator.interestCurvePreprocessOfferWithFallback.data.algorithmIds"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.AlgoTrait
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.interestCurvePreprocessOfferWithFallback.data.fallbackIds"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.AlgoTrait
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ],
beforePuzzleTimeWithoutFallback: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ {
fact: "operator.interestCurvePreprocessOfferWithoutFallback.data.algorithmIds"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.AlgoTrait
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this.canRunAfterOffer(t), r = e && null != this.resolvePostprocessOfferResult();
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(e, "是否可运行 After 后置段");
},
canTryInterestCurveOfferAfter: function() {
return ASContext(r, "兴趣曲线是否可在后处理阶段覆盖算法");
}
});
};
e.prototype.onPostprocessConditionOperators = function() {
var t = this;
return {
interestCurvePostprocessOfferWithFallback: function(e) {
if (!e) return !1;
var r = t.resolvePostprocessOfferResult();
return !(!r || r.fallbackIds.length <= 0) && {
status: !0,
data: r
};
},
interestCurvePostprocessOfferWithoutFallback: function(e) {
if (!e) return !1;
var r = t.resolvePostprocessOfferResult();
return !(!r || r.fallbackIds.length > 0) && {
status: !0,
data: r
};
}
};
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "canTryInterestCurveOfferAfter",
operator: "interestCurvePostprocessOfferWithFallback",
value: !0
} ]
},
platform: "all",
flow: "afterOfferWithFallback"
}, {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "canTryInterestCurveOfferAfter",
operator: "interestCurvePostprocessOfferWithoutFallback",
value: !0
} ]
},
platform: "all",
flow: "afterOfferWithoutFallback"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
afterOfferWithFallback: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.interestCurvePostprocessOfferWithFallback.data.algorithmIds"
} ]
} ],
afterOfferWithoutFallback: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.interestCurvePostprocessOfferWithoutFallback.data.algorithmIds"
} ]
} ]
};
};
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
return buildLazyConditionContext({
isMatrixHard: function() {
return ASContext((null == r ? void 0 : r.algorithmId) === hs.OFFER_TYPE_DIFFICULTY.JU_ZHENG_NAN_TI, "是否矩阵难题算法");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isMatrixHard",
operator: "=",
value: !0
},
platform: "all",
flow: "injectDiffMatrixAlgorithm"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
injectDiffMatrixAlgorithm: function() {
return {
extra: {
traits: {
diffMatrixAlgorithm: {
notSingleBlockClean: !0,
finalPut: 1,
timeout: 1
}
}
}
};
}
};
};
e.prototype.peekPreprocessCanTryBeforePuzzleTime = function() {
void 0 === this._preprocessCanTryBeforePuzzleTime && (this._preprocessCanTryBeforePuzzleTime = this.isReady() && this.isTrigger(!0));
return this._preprocessCanTryBeforePuzzleTime;
};
e.prototype.resolvePreprocessOfferResult = function() {
if (this._preprocessOfferResolved) return this._preprocessOfferResult;
this._preprocessOfferResolved = !0;
this._preprocessOfferResult = this.peekPreprocessCanTryBeforePuzzleTime() ? this.buildOfferResult() : null;
return this._preprocessOfferResult;
};
e.prototype.resolvePostprocessOfferResult = function() {
if (this._postprocessOfferResolved) return this._postprocessOfferResult;
this._postprocessOfferResolved = !0;
this._postprocessOfferResult = this.updateUse(!1) && this.isTrigger() ? this.buildOfferResult() : null;
return this._postprocessOfferResult;
};
e.prototype.buildOfferResult = function() {
var t = this.executeAlgorithm();
return !t || t.length <= 0 ? null : {
algorithmIds: t,
fallbackIds: this.buildFallbackIds(t)
};
};
e.prototype.buildFallbackIds = function(t) {
return t.some(function(t) {
return t === hs.OFFER_TYPE.JU_ZHENG_NAN_TI || t === hs.OFFER_TYPE.VERY_DIFFICULT_HARD || t === hs.OFFER_TYPE.SIMPLE_ZHIJUE;
}) ? hs.algorithmStrategyIOSShangRefactoredInfo.getInterestCurveToNoBitShangZeng3({
isDown: !0
}) : [];
};
e.prototype.patchDifficultyExpectedId = function() {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI, this);
};
e.prototype.isPuzzleTimeFlow = function(t) {
var e = this.getCurrentSource(t);
return e === hs.ClassAlgorithmSourceType.PuzzleTimeFirst || e === hs.ClassAlgorithmSourceType.PuzzleTimeOther;
};
e.prototype.getCurrentSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
};
e.prototype.data = function() {
return hs.storage.getItem("classInterestCurveOffer", {
gameNum: -1,
coldTime: -1
});
};
e.prototype.onCreate = function() {
this.updateParams();
};
e.prototype.updateUse = function(t) {
return !t || this.isReady();
};
e.prototype.updateParams = function() {
var t, e, r, o, a, i, s, n, l, f, u, h;
if (null === (t = this.props) || void 0 === t ? void 0 : t.params) try {
var p = "string" == typeof this.props.params ? JSON.parse(this.props.params) : this.props.params;
this._params.enable_game_cnt = null !== (e = null == p ? void 0 : p.enable_game_cnt) && void 0 !== e ? e : this._params.enable_game_cnt;
this._params.enable_trough_ratio = null !== (r = null == p ? void 0 : p.enable_trough_ratio) && void 0 !== r ? r : this._params.enable_trough_ratio;
this._params.init_interest_point = null !== (o = null == p ? void 0 : p.init_interest_point) && void 0 !== o ? o : this._params.init_interest_point;
this._params.weight_clear_cnt = null !== (a = null == p ? void 0 : p.weight_clear_cnt) && void 0 !== a ? a : this._params.weight_clear_cnt;
this._params.max_round_weight_clear = null !== (i = null == p ? void 0 : p.max_round_weight_clear) && void 0 !== i ? i : this._params.max_round_weight_clear;
this._params.min_weight_clear = null !== (s = null == p ? void 0 : p.min_weight_clear) && void 0 !== s ? s : this._params.min_weight_clear;
this._params.weight_combo_cnt = null !== (n = null == p ? void 0 : p.weight_combo_cnt) && void 0 !== n ? n : this._params.weight_combo_cnt;
this._params.weight_clear_screen = null !== (l = null == p ? void 0 : p.weight_clear_screen) && void 0 !== l ? l : this._params.weight_clear_screen;
this._params.weight_no_clear = null !== (f = null == p ? void 0 : p.weight_no_clear) && void 0 !== f ? f : this._params.weight_no_clear;
this._params.trough_block_cnt = null !== (u = null == p ? void 0 : p.trough_block_cnt) && void 0 !== u ? u : this._params.trough_block_cnt;
this._params.trough_decrease_ratio = null !== (h = null == p ? void 0 : p.trough_decrease_ratio) && void 0 !== h ? h : this._params.trough_decrease_ratio;
} catch (t) {}
};
e.prototype.isClear = function() {
var t = !0, e = hs.boardInfo.faceBlocks;
t: for (var r = 0; r < 8; r++) for (var o = 0; o < 8; o++) if (-1 != e[r][o]) {
t = !1;
break t;
}
return t;
};
e.prototype.recordInterest = function(t) {
var e = t;
this._tempData.noWipe = e > 0 ? 0 : this._tempData.noWipe + 1;
var r = hs.classGameInfo.roundNum, o = hs.classDataStatisticsInfo.dataStatisticsInfo.comboTouchNum < 0 ? 0 : hs.classDataStatisticsInfo.dataStatisticsInfo.comboTouchNum, a = this.isClear() ? 1 : 0, s = this._params.weight_clear_cnt * Math.max(1 - r / this._params.max_round_weight_clear, this._params.min_weight_clear) * e + this._params.weight_combo_cnt * o + this._params.weight_clear_screen * a - this._params.weight_no_clear * this._tempData.noWipe, n = (this._tempData.interestValues.length > 0 ? this._tempData.interestValues[this._tempData.interestValues.length - 1] : this._params.init_interest_point) + s;
this._tempData.totalStep++;
this.saveInterest(n);
n < Math.max.apply(Math, f(this._tempData.interestValues)) * this._params.trough_decrease_ratio && this._tempData.downStep++;
this._tempData.valleyRate = this._tempData.downStep / this._tempData.totalStep;
this._tempData.valleyRate >= this.enableTroughRatio() ? this._tempData.isTrough = !0 : this.getAlgoType() == i.Param2 && this._tempData.valleyRate < .05 && hs.classGameInfo.roundNum >= 30 && (this._tempData.isLowTrigger = !0);
return n;
};
e.prototype.saveInterest = function(t) {
this._tempData.interestValues.push(t);
var e = this._params.trough_block_cnt;
this._tempData.interestValues.length > e && this._tempData.interestValues.shift();
};
e.prototype.isReady = function() {
return this.state.coldTime == this._coldStart && !(this._playNum > this._params.enable_game_cnt);
};
e.prototype.isTrigger = function(t) {
void 0 === t && (t = !1);
var e = this.getAlgoType();
if (e == i.Basic) return this._tempData.isTrough;
if (e == i.Param1) {
if (this._tempData.offered) return !1;
if (!(null == (o = TRAIT("CTRefactorPuzzle100Trait")) ? void 0 : o.active)) return !1;
var r = (Date.now() - o.state.initTime) / 1e3;
return !!(t && !o.state.isHard && r < 220 && this._tempData.isTrough) || !o.state.isHard && r > 220 && (this._tempData.isTrough || this._tempData.thirdPartState != a.None);
}
if (e == i.Param2) {
if (this._tempData.offered) return !1;
var o;
if (!(null == (o = TRAIT("CTRefactorPuzzle100Trait")) ? void 0 : o.active)) return !1;
r = (Date.now() - o.state.initTime) / 1e3;
return !!(t && !o.state.isHard && r < 220 && (this._tempData.isTrough || this._tempData.isLowTrigger)) || !o.state.isHard && r > 220 && (this._tempData.isTrough || this._tempData.thirdPartState != a.None || this._tempData.isLowTrigger);
}
return !1;
};
e.prototype.initData = function() {
this._tempData.useSimple = !1;
this._tempData.enterTimeDiff = !1;
this._tempData.diffDown = !1;
this._tempData.thirdPartState = a.None;
this._tempData.lastOffered = [];
if (this.state.gameNum != hs.classGameInfo.gameNum) {
this.state.coldTime = this._coldStart;
this.state.gameNum = hs.classGameInfo.gameNum;
this._playNum++;
this._tempData.totalStep = 0;
this._tempData.downStep = 0;
this._tempData.noWipe = 0;
this._tempData.interestValues = [];
hs.storage.setItem("classInterestCurveOffer", this.state);
}
};
e.prototype.enterDiff = function() {
this._tempData.enterTimeDiff = !0;
};
e.prototype.resetDiff = function() {
this._tempData.enterTimeDiff = !1;
this._tempData.diffDown = !1;
this._tempData.offered = !1;
this._tempData.lastOffered = hs.algorithmName.algoActualName.concat();
};
e.prototype.getAlgoType = function() {
var t;
return null !== (t = this.props.algo) && void 0 !== t ? t : i.Basic;
};
e.prototype.executeAlgorithm = function() {
var t = this.getAlgoType();
return t == i.Param1 ? this.algo1() : t == i.Param2 ? this.algo2() : this.algo0();
};
e.prototype.algo0 = function() {
var t, e;
this._tempData.isTrough = !1;
if (this._tempData.enterTimeDiff && !this._tempData.diffDown) return [];
var r = null !== (e = null === (t = hs.algorithmName.algoActualName) || void 0 === t ? void 0 : t[0]) && void 0 !== e ? e : "";
return "填空消除" == r || "清盘算法plus" == r || "指标组合出块" == r ? [] : hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
};
e.prototype.algo1 = function() {
var t, e;
this._tempData.isTrough = !1;
var r = TRAIT("CTRefactorPuzzle100Trait"), o = null !== (e = null === (t = null == r ? void 0 : r.state) || void 0 === t ? void 0 : t.initTime) && void 0 !== e ? e : 0, i = (Date.now() - o) / 1e3;
if (i < this.timeRangeStart()) return hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
if (i >= this.timeRangeStart() && i < 220) {
if ((f = Math.floor(100 * Math.random())) < 30 && !this._tempData.lastOffered.some(function(t) {
return t.includes("难题矩阵_");
})) {
this.patchDifficultyExpectedId();
return [ hs.OFFER_TYPE.JU_ZHENG_NAN_TI ];
}
return hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
}
if (i >= 220) {
var s = this.enableTroughRatio(), n = this.enableTroughRatioLower();
if (this._tempData.valleyRate >= s) {
this._tempData.thirdPartState = a.From30To24;
return hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
}
if (this._tempData.valleyRate <= n) {
this._tempData.thirdPartState = a.From24To30;
var l = this.getWeightValue(), f = Math.floor(100 * Math.random());
if (l < 310) return f < 70 ? hs.algorithmStrategyIOSShangRefactoredInfo.getInterestCurveToNoBitShangZeng3({
isDown: !1
}) : hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
if (l >= 310 && l < 430) {
this.patchDifficultyExpectedId();
return [ hs.OFFER_TYPE.VERY_DIFFICULT_HARD ];
}
return [ hs.OFFER_TYPE.ALL_COMBINATION_ID9 ];
}
}
return [];
};
e.prototype.timeRangeStart = function() {
return 180;
};
e.prototype.enableTroughRatio = function() {
return this._params.enable_trough_ratio;
};
e.prototype.enableTroughRatioLower = function() {
return .24;
};
e.prototype.algo2 = function() {
var t, e;
if (this._tempData.isTrough) return this.algo1();
if (this._tempData.isLowTrigger) {
this._tempData.isLowTrigger = !1;
var r = TRAIT("CTRefactorPuzzle100Trait"), o = null !== (e = null === (t = null == r ? void 0 : r.state) || void 0 === t ? void 0 : t.initTime) && void 0 !== e ? e : 0, a = Date.now(), i = (a - o) / 1e3;
if (i < this.timeRangeStart()) {
if (this._tempData.simpleCD - a <= 0) return this.offerSimple();
} else {
if (i >= this.timeRangeStart() && i < 220) {
if ((n = Math.floor(100 * Math.random())) < 30 && !this._tempData.lastOffered.some(function(t) {
return t.includes("难题矩阵_");
})) {
this.patchDifficultyExpectedId();
return [ hs.OFFER_TYPE.JU_ZHENG_NAN_TI ];
}
return hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
}
if (i >= 220) {
var s = this.getWeightValue(), n = Math.floor(100 * Math.random());
if (s < 310) return n < 70 ? hs.algorithmStrategyIOSShangRefactoredInfo.getInterestCurveToNoBitShangZeng3({
isDown: !1
}) : hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
if (s >= 310 && s < 430) {
this.patchDifficultyExpectedId();
return [ hs.OFFER_TYPE.VERY_DIFFICULT_HARD ];
}
return [ hs.OFFER_TYPE.ALL_COMBINATION_ID9 ];
}
}
}
return [];
};
e.prototype.offerSimple = function() {
this._tempData.useSimple = !0;
this._tempData.useSimple = !1;
this.patchDifficultyExpectedId();
return [ hs.OFFER_TYPE.SIMPLE_ZHIJUE ];
};
e.prototype.getWeightValue = function() {
var t = new hs.BinaryBoard();
t.convertToBinaryBoard(hs.boardInfo.faceBlocks);
return t.getWeightValueObj();
};
e.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
return n([ classId("CTRefactorInterestCurveOfferTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorInterestCurveOfferTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorInterestCurveOfferTrait" ]);
//# sourceMappingURL=index.js.map
