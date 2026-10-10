window.__require = function t(r, o, e) {
function i(n, l) {
if (!o[n]) {
if (!r[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!r[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var u = o[n] = {
exports: {}
};
r[n][0].call(u.exports, function(t) {
return i(r[n][1][t] || t);
}, u, u.exports, t, r, o, e);
}
return o[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < e.length; n++) i(e[n]);
return i;
}({
CTRefactorPuzzleFailTimingTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "0c101ad4ZhGDrsHeiicORTf", "CTRefactorPuzzleFailTimingTrait");
var e, i, a = this && this.__extends || (e = function(t, r) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
})(t, r);
}, function(t, r) {
e(t, r);
function o() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (o.prototype = r.prototype, new o());
}), n = this && this.__assign || function() {
return (n = Object.assign || function(t) {
for (var r, o = 1, e = arguments.length; o < e; o++) {
r = arguments[o];
for (var i in r) Object.prototype.hasOwnProperty.call(r, i) && (t[i] = r[i]);
}
return t;
}).apply(this, arguments);
}, l = this && this.__decorate || function(t, r, o, e) {
var i, a = arguments.length, n = a < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, r, o, e); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (n = (a < 3 ? i(n) : a > 3 ? i(r, o, n) : i(r, o)) || n);
return a > 3 && n && Object.defineProperty(r, o, n), n;
}, s = this && this.__read || function(t, r) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var e, i, a = o.call(t), n = [];
try {
for (;(void 0 === r || r-- > 0) && !(e = a.next()).done; ) n.push(e.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
e && !e.done && (o = a.return) && o.call(a);
} finally {
if (i) throw i.error;
}
}
return n;
}, c = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(s(arguments[r]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorPuzzleFailTimingTrait = void 0;
(function(t) {
t[t.EntropyAdd3 = 1001] = "EntropyAdd3";
t[t.RandomNoDead = 1005] = "RandomNoDead";
t[t.EntropyAdd3Random = 1007] = "EntropyAdd3Random";
})(i || (i = {}));
var u = function(t) {
a(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.getHighRecordScore = function(t) {
return t;
};
r.prototype.onPreprocessConditionContext = function(t) {
var r = this;
return buildLazyConditionContext({
isNotPuzzle100Source: function() {
return ASContext(hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.Puzzle100, "当前一级出题源不是困难100%");
},
hasDifficulty: function() {
return ASContext(r.hasDifficultyInList(t), "当前算法列表是否含难题");
}
});
};
r.prototype.onPreprocessConditionOperators = function() {
return {
resolveFallbackAlgos: function() {
var t = this.computeFallbackAlgos();
return {
status: null != t && t.length > 0,
data: {
algos: t
}
};
}.bind(this)
};
};
r.prototype.onPreprocessConditions = function() {
var t = {
and: [ {
fact: "isNotPuzzle100Source",
operator: "=",
value: !0
}, {
fact: "hasDifficulty",
operator: "=",
value: !0
}, {
fact: "hasDifficulty",
operator: "resolveFallbackAlgos",
value: !0
} ]
};
return {
mutex: {
PuzzleTimeFirst: [ {
conditions: t,
platform: "ios",
flow: "addFallback"
} ],
PuzzleTimeOther: [ {
conditions: t,
platform: "ios",
flow: "addFallback"
} ],
LaneScheme: [ {
conditions: t,
platform: "ios",
flow: "addFallback"
} ]
}
};
};
r.prototype.onPreprocessActions = function() {
var t = [ {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ {
fact: "operator.resolveFallbackAlgos.data.algos"
} ]
} ];
return {
mutex: {
PuzzleTimeFirst: {
addFallback: t
},
PuzzleTimeOther: {
addFallback: t
},
LaneScheme: {
addFallback: t
}
}
};
};
r.prototype.isPuzzle100Hard = function() {
var t, r = TRAIT("CTRefactorPuzzle100Trait");
return !!((null == r ? void 0 : r.active) && (null === (t = r.state) || void 0 === t ? void 0 : t.isHard));
};
r.prototype.hasDifficultyInList = function(t) {
return !(null == t || !t.algorithmList || 0 === t.algorithmList.length) && t.algorithmList.some(function(t) {
return hs.isValueInEnum(t.algorithmId, hs.OFFER_TYPE_DIFFICULTY);
});
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoPuzzleFailTiming = function() {
var t, r = this, o = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList;
if (o.some(function(t) {
return hs.isValueInEnum(t.algorithmId, hs.OFFER_TYPE_DIFFICULTY);
})) {
var e = this.computeFallbackAlgos();
if (null != e && e.length > 0) {
var i = as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList, a = null !== (t = i[0]) && void 0 !== t ? t : o[0];
if (!a) return;
var l = c(i, e.map(function(t) {
return n(n({}, a), {
algorithmId: t,
traitSource: r.traitName
});
}));
as.AlgorithmStrategyAlgorithmFallbackListPatch.patch(l, this);
}
}
};
r.prototype.computeFallbackAlgos = function() {
for (var t = this.getHighRecordScore(hs.scoreInfo.highRecordScore), r = this.props.scores[this.props.scores.length - 1], o = 0; o < this.props.scores.length; o++) if (t <= this.props.scores[o] || t > r) {
var e = void 0;
if (this.props.algos[o] === i.EntropyAdd3) e = hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit({
isDown: !0
}); else if (this.props.algos[o] === i.RandomNoDead) {
e = hs.algorithmStrategyIOSRandomRefactoredInfo.offerBitRandomNoDieBit();
var a = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == a ? void 0 : a.active) && a.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorPuzzleFailTimingTrait", hs.OFFER_TYPE.SUI_JI_WU_SI, void 0, hs.OFFER_TYPE.SUI_JI_WU_SI);
} else {
if (this.props.algos[o] !== i.EntropyAdd3Random) break;
e = this.offerNoBitRandomShang();
}
return e;
}
return null;
};
r.prototype.offerNoBitRandomShang = function() {
if (Math.random() < .5) {
var t = hs.algorithmStrategyIOSRandomRefactoredInfo.offerNoBitRandomNoDie(), r = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == r ? void 0 : r.active) && r.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorPuzzleFailTimingTrait", hs.OFFER_TYPE.SUI_JI_WU_SI, void 0, hs.OFFER_TYPE.SUI_JI_WU_SI);
return t;
}
return hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit({
isDown: !0
});
};
return l([ classId("CTRefactorPuzzleFailTimingTrait"), classMethodWatch() ], r);
}(Trait);
o.CTRefactorPuzzleFailTimingTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleFailTimingTrait" ]);
//# sourceMappingURL=index.js.map
