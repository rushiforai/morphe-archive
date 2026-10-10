window.__require = function t(e, r, o) {
function a(n, l) {
if (!r[n]) {
if (!e[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!e[u]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var c = r[n] = {
exports: {}
};
e[n][0].call(c.exports, function(t) {
return a(e[n][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorPuzzleFailBaseplateTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "9fdb9OrXAZG3aCWZGe1NMKA", "CTRefactorPuzzleFailBaseplateTrait");
var o, a = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var a, i = arguments.length, n = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, r, n) : a(e, r)) || n);
return i > 3 && n && Object.defineProperty(e, r, n), n;
}, n = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, r = e && t[e], o = 0;
if (r) return r.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzleFailBaseplateTrait = void 0;
var l = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorLaneSchemeTraitShouldUseDifficultyAlgorithmWithBaseplateTrait = function(t) {
t.returnValue = !0;
};
e.prototype.isSourceSkip = function() {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1, e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
return t === hs.ClassAlgorithmSourceType.Puzzle100 || t === hs.ClassAlgorithmSourceType.PuzzleTimeFirst || t === hs.ClassAlgorithmSourceType.PuzzleTimeOther || t === hs.ClassAlgorithmSourceType.AlgoTrait && ("InterestCurveOfferTrait" === e || "CTRefactorInterestCurveOfferTrait" === e || "InterestCurveOfferAdjustParamsTrait" === e);
};
e.prototype.hasHard = function(t) {
var e, r, o = null == t ? void 0 : t.algorithmList;
if (!o || 0 === o.length) return !1;
try {
for (var a = n(o), i = a.next(); !i.done; i = a.next()) {
var l = i.value;
if (hs.isValueInEnum(l.algorithmId, hs.OFFER_TYPE_DIFFICULTY)) return !0;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (r = a.return) && r.call(a);
} finally {
if (e) throw e.error;
}
}
return !1;
};
e.prototype.getHighRecordScore = function(t) {
return t;
};
e.prototype.computeReplaceAlgorithms = function() {
for (var t = this.props, e = t.algos, r = t.scores, o = this.getHighRecordScore(hs.scoreInfo.highRecordScore), a = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait"), i = 0; i < r.length; i++) if (o <= r[i] || o > r[r.length - 1]) {
if (e[i] === hs.IOSAlgorithmEnum.PuzzleHard) {
(null == a ? void 0 : a.active) && a.addAlgorithmNameMapping(hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4, "CTRefactorPuzzleFailBaseplateTrait", hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4);
return hs.algorithmStrategyIOSDifficultRefactoredInfo.laneBitKunNanNanti();
}
if (e[i] === hs.IOSAlgorithmEnum.PuzzleIntuition) {
(null == a ? void 0 : a.active) && a.addAlgorithmNameMapping(hs.OFFER_TYPE.ZHI_JUE_NAN_TI, "CTRefactorPuzzleFailBaseplateTrait", hs.OFFER_TYPE.ZHI_JUE_NAN_TI);
return hs.algorithmStrategyIOSDifficultRefactoredInfo.laneBitZhiJueNanTi();
}
if (e[i] === hs.IOSAlgorithmEnum.RandomNoDead) {
(null == a ? void 0 : a.active) && a.addAlgorithmNameMapping(hs.OFFER_TYPE.IOS_SUI_JI_WU_SI, "CTRefactorPuzzleFailBaseplateTrait", hs.OFFER_TYPE.IOS_SUI_JI_WU_SI);
return hs.algorithmStrategyIOSRandomRefactoredInfo.offerBitRandomNoDieBit();
}
return null;
}
return null;
};
e.prototype.isFailTimingActive = function() {
var t;
return !!(null === (t = TRAIT("CTRefactorPuzzleFailTimingTrait")) || void 0 === t ? void 0 : t.active);
};
e.prototype.onPreprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
isSourceSkip: function() {
return ASContext(e.isSourceSkip(t), "当前算法源属于不替换的源");
},
hasHard: function() {
return ASContext(e.hasHard(t), "algorithmList 是否含困难难题");
}
});
};
e.prototype.onPreprocessConditionOperators = function() {
return {
buildReplacement: function() {
var t = this.computeReplaceAlgorithms();
if (!t || 0 === t.length) return !1;
var e = [];
if (this.isFailTimingActive()) hs.algorithmStrategyIOSDifficultRefactoredInfo.puzzleFailTiming(); else {
e = hs.algorithmStrategyIOSShangRefactoredInfo.get100DifClassToNoBitShangZeng3({
isDown: !0
});
var r = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == r ? void 0 : r.active) && r.addAlgorithmNameMapping(hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT, "CTRefactorPuzzleFailBaseplateTrait", hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT);
}
return {
status: !0,
data: {
algorithmList: t,
fallbackAppend: e
}
};
}.bind(this)
};
};
e.prototype.onPreprocessConditions = function() {
return {
postPreprocessing: [ {
conditions: {
and: [ {
fact: "isSourceSkip",
operator: "=",
value: !1
}, {
fact: "hasHard",
operator: "=",
value: !0
}, {
fact: "hasHard",
operator: "buildReplacement",
value: !0
} ]
},
platform: "ios",
flow: "replace"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
postPreprocessing: {
replace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.buildReplacement.data.algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ {
fact: "operator.buildReplacement.data.fallbackAppend"
} ]
} ]
}
};
};
e.prototype.updatePuzzleFailPuzzleHard = function(t, e) {
return {
normalList: t,
failList: e
};
};
return i([ classId("CTRefactorPuzzleFailBaseplateTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorPuzzleFailBaseplateTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleFailBaseplateTrait" ]);
//# sourceMappingURL=index.js.map
