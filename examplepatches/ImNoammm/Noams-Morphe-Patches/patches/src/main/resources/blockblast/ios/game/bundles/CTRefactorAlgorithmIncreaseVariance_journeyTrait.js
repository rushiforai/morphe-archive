window.__require = function t(r, e, o) {
function n(a, _) {
if (!e[a]) {
if (!r[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!r[c]) {
var s = "function" == typeof __require && __require;
if (!_ && s) return s(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var p = e[a] = {
exports: {}
};
r[a][0].call(p.exports, function(t) {
return n(r[a][1][t] || t);
}, p, p.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorAlgorithmIncreaseVariance_journeyTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "a62afGgWLVJ1J8J6U8f4HUI", "CTRefactorAlgorithmIncreaseVariance_journeyTrait");
var o, n = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var _ = t.length - 1; _ >= 0; _--) (n = t[_]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorAlgorithmIncreaseVariance_journeyTrait = void 0;
var a = [ hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.BIT_KUN_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_OPTIMIZE, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_HARD_LEVEL_4, hs.OFFER_TYPE_DIFFICULTY.IOS_KUN_NAN_BIT, hs.OFFER_TYPE_DIFFICULTY.IOS_ZHI_JUE_BIT ], _ = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isBeforeChapterLimit = function() {
return storage.getItem("chapterNum", 0) < 13;
};
r.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isBeforeChapterLimit: function() {
return ASContext(t.isBeforeChapterLimit(), "是否在 13 关前");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
baseAfter: [ {
conditions: {
fact: "isBeforeChapterLimit",
operator: "=",
value: !0
},
platform: "ios",
flow: "replaceRandom"
} ]
};
};
r.prototype.onPreprocessActions = function() {
return {
baseAfter: {
replaceRandom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
}, {
operator: "AlgorithmStrategyAlgorithmPostListPatchOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, hs.OFFER_TYPE_BASE.ALGORITHM_INCREASE_VARIANCE_RANDOM ]
} ]
}
};
};
r.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceChapter = function(t) {
if (storage.getItem("chapterNum", 0) < 13) {
var r = t.args[0];
hs.algorithmStrategyLogic.haveAlgorithms(r, [ hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT ]) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(t.args[0], hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT, hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_ADD3));
}
};
r.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoOfferBitRandomNoDieChapter = function(t) {
this.replaceRandomNoDieChapter(t);
};
r.prototype.replaceRandomNoDieChapter = function(t) {
if (!(storage.getItem("chapterNum", 0) >= 13)) {
var r = t.args[0];
Array.isArray(r) && hs.algorithmStrategyLogic.haveAlgorithms(r, [ hs.OFFER_TYPE.SUI_JI_WU_SI ]) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(r, hs.OFFER_TYPE.SUI_JI_WU_SI, hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_RANDOM));
}
};
r.prototype.isBeforeOrEqualChapterLimit = function() {
return storage.getItem("chapterNum", 0) <= 13;
};
r.prototype.onSDKArgsConditionContext = function(t, r, e) {
var o = this;
return buildLazyConditionContext({
isBeforeOrEqualChapterLimit: function() {
return ASContext(o.isBeforeOrEqualChapterLimit(), "是否小于等于 13 关");
},
isSupportVarianceAlgo: function() {
return ASContext(!!e && a.includes(e.algorithmId), "是否支持方差拉大的算法");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBeforeOrEqualChapterLimit",
operator: "=",
value: !0
}, {
fact: "isSupportVarianceAlgo",
operator: "=",
value: !0
} ]
},
platform: "ios",
gameMode: "journey",
flow: "injectVariance"
} ];
};
r.prototype.onSDKArgsActions = function() {
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
return i([ classId("CTRefactorAlgorithmIncreaseVariance_journeyTrait") ], r);
}(Trait);
e.CTRefactorAlgorithmIncreaseVariance_journeyTrait = _;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgorithmIncreaseVariance_journeyTrait" ]);
//# sourceMappingURL=index.js.map
