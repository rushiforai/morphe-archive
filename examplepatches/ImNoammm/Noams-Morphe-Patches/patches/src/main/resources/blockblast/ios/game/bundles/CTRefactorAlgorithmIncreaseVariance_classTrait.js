window.__require = function t(e, r, o) {
function n(i, s) {
if (!r[i]) {
if (!e[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var _ = r[i] = {
exports: {}
};
e[i][0].call(_.exports, function(t) {
return n(e[i][1][t] || t);
}, _, _.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorAlgorithmIncreaseVariance_classTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "ac4ab7/Kq1G858kbjXkOy60", "CTRefactorAlgorithmIncreaseVariance_classTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var n, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, r, i) : n(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
}, i = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, a = r.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = a.next()).done; ) i.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = a.return) && r.call(a);
} finally {
if (n) throw n.error;
}
}
return i;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(i(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAlgorithmIncreaseVariance_classTrait = void 0;
var c = [ hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.BIT_KUN_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_OPTIMIZE, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_HARD_LEVEL_4, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_BIT, hs.OFFER_TYPE_DIFFICULTY.IOS_ZHI_JUE_BIT ], l = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
this.handleShangReplaceClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
this.handleReplace100DifClass(t);
};
e.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoOfferBitRandomNoDieClass = function(t) {
this.handleRandomNoDieClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetDayNightLess3000DifClassToNoBitShangZeng3 = function(t) {
this.handleRandomNoDieClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetDayNightMore3000DifClassToNoBitShangZeng3 = function(t) {
this.handleRandomNoDieClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetInterestCurveDifClassToNoBitShangZeng3 = function(t) {
this.handleRandomNoDieClass(t);
};
e.prototype.isBefore10000Score = function() {
return storage.getItem("classScore", 0) < 1e4;
};
e.prototype.replaceShangZeng3 = function(t) {
if (this.isBefore10000Score()) {
var e = t.args[0], r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
hs.algorithmStrategyLogic.haveAlgorithms(e, [ r ]) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, r, hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_ADD3));
}
};
e.prototype.handleShangReplaceClass = function(t) {
this.replaceShangZeng3(t);
};
e.prototype.handleReplace100DifClass = function(t) {
this.replaceShangZeng3(t);
};
e.prototype.handleRandomNoDieClass = function(t) {
if (this.isBefore10000Score()) {
var e = t.args[0];
hs.algorithmStrategyLogic.haveAlgorithms(e, [ hs.OFFER_TYPE.IOS_SUI_JI_WU_SI ]) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, hs.OFFER_TYPE.IOS_SUI_JI_WU_SI, hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_RANDOM));
}
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
increaseVarianceRandomTrigger: function() {
return t.getIncreaseVarianceRandomTriggerResult();
}
};
};
e.prototype.onPreprocessConditionContext = function() {
return buildLazyConditionContext({
currentScore: function() {
return ASContext(storage.getItem("classScore", 0), "当前无尽分数");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
baseAfter: [ {
conditions: {
fact: "currentScore",
operator: "increaseVarianceRandomTrigger"
},
flow: "increaseVarianceRandom",
platform: "ios",
gameMode: hs.GameMode.Class
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
baseAfter: {
increaseVarianceRandom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.IOS_SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.IOS_SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
}, {
operator: "AlgorithmStrategyAlgorithmPostListPatchOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.IOS_SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
} ]
}
};
};
e.prototype.getIncreaseVarianceRandomTriggerResult = function() {
return !(storage.getItem("classScore", 0) >= 1e4) && !!s(as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList.map(function(t) {
return t.algorithmId;
}), as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList.map(function(t) {
return t.algorithmId;
}), as.AlgorithmStrategyAlgorithmPostListPatch.algorithmPostList.map(function(t) {
return t.algorithmId;
})).includes(hs.OFFER_TYPE_BASE.IOS_SUI_JI_WU_SI);
};
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
var o = this;
return buildLazyConditionContext({
isBefore10000Score: function() {
return ASContext(o.isBefore10000Score(), "是否 10000 分前");
},
isSupportVarianceAlgo: function() {
return ASContext(!!r && c.includes(r.algorithmId), "是否支持方差拉大的算法");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBefore10000Score",
operator: "=",
value: !0
}, {
fact: "isSupportVarianceAlgo",
operator: "=",
value: !0
} ]
},
platform: "ios",
gameMode: "class",
flow: "injectVariance"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
injectVariance: function() {
return {
extra: {
traits: {
variance: !0
}
}
};
}
};
};
return a([ classId("CTRefactorAlgorithmIncreaseVariance_classTrait") ], e);
}(Trait);
r.CTRefactorAlgorithmIncreaseVariance_classTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgorithmIncreaseVariance_classTrait" ]);
//# sourceMappingURL=index.js.map
