window.__require = function t(e, o, r) {
function i(l, u) {
if (!o[l]) {
if (!e[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!e[a]) {
var c = "function" == typeof __require && __require;
if (!u && c) return c(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var s = o[l] = {
exports: {}
};
e[l][0].call(s.exports, function(t) {
return i(e[l][1][t] || t);
}, s, s.exports, t, e, o, r);
}
return o[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < r.length; l++) i(r[l]);
return i;
}({
CTRefactorMultiPathPuzzleByScoreTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "54e29PpVy9OXJGd0zoZ8a1L", "CTRefactorMultiPathPuzzleByScoreTrait");
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
var i, n = arguments.length, l = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, o, r); else for (var u = t.length - 1; u >= 0; u--) (i = t[u]) && (l = (n < 3 ? i(l) : n > 3 ? i(e, o, l) : i(e, o)) || l);
return n > 3 && l && Object.defineProperty(e, o, l), l;
}, l = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, o = e && t[e], r = 0;
if (o) return o.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && r >= t.length && (t = void 0);
return {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorMultiPathPuzzleByScoreTrait = void 0;
var u = hs.OFFER_TYPE.MORE_LIVE_WAY_HARD_TUNE, a = hs.OFFER_ALGORITHM_SDK_TYPE[u], c = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
o = e;
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
},
enumerable: !1,
configurable: !0
});
e.prototype.onPreprocessConditionContext = function(t) {
var e, o = this, r = null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : [], i = r.map(function(t) {
return t.algorithmId;
});
return buildLazyConditionContext({
shouldInsertMultiPath: function() {
return ASContext(o.evaluateShouldInsertMultiPath(r), "是否插入多活路难题调参（仅常规列表）");
},
multiPathAnchorAlgoId: function() {
return ASContext(o.findFirstHardOrDieAlgoId(i), "锚点算法ID（常规列表中首个难题/怼死类）");
}
});
};
e.prototype.fixTraitSource = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
e.prototype.onPreprocessConditions = function() {
return {
preprocessingAlgorithm: [ {
conditions: {
fact: "shouldInsertMultiPath",
operator: "=",
value: !0
},
event: {
type: "fixTraitSource"
},
flow: "insertMultiPathByScore",
platform: "ios",
gameMode: "class"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
preprocessingAlgorithm: {
insertMultiPathByScore: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "insertBefore",
args: [ {
fact: "multiPathAnchorAlgoId"
}, u ]
} ]
}
};
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
if (t && e.SDK_ALGO_TYPE === a) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(u, this);
}
};
e.prototype.resolveMinAlivePathCount = function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.minAlivePathCount;
return "number" == typeof e && Number.isFinite(e) ? e : 2;
};
e.prototype.resolveAlivePathWeight = function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.alivePathWeight;
return "number" == typeof e && Number.isFinite(e) ? e : 8;
};
e.prototype.resolveAreaSumWeight = function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.areaSumWeight;
return "number" == typeof e && Number.isFinite(e) ? e : 2;
};
e.prototype.resolveQualifiedPoolTopK = function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.qualifiedPoolTopK;
return "number" == typeof e && Number.isFinite(e) ? e : 1;
};
Object.defineProperty(e.prototype, "multiPathOfferType", {
get: function() {
return u;
},
enumerable: !1,
configurable: !0
});
e.prototype.buildSdkExtraSnapshot = function() {
return {
minAlivePathCount: this.resolveMinAlivePathCount(),
alivePathWeight: this.resolveAlivePathWeight(),
areaSumWeight: this.resolveAreaSumWeight(),
qualifiedPoolTopK: this.resolveQualifiedPoolTopK()
};
};
e.prototype.evaluateShouldInsertMultiPath = function(t) {
if (!Array.isArray(t) || 0 === t.length) return !1;
if (t.some(function(t) {
return t.algorithmId === u;
})) return !1;
var e = hs.scoreInfo.highScore || 0, r = hs.scoreInfo.score || 0, i = o.calculateReplaceProbability(r, e);
if (i <= 0) return !1;
if (!(Math.random() <= i)) return !1;
var n = t.map(function(t) {
return t.algorithmId;
});
return !n.includes(u) && null != this.findFirstHardOrDieAlgoId(n);
};
e.prototype.findFirstHardOrDieAlgoId = function(t) {
var e, o;
try {
for (var r = l(t), i = r.next(); !i.done; i = r.next()) {
var n = i.value;
if (hs.isValueInEnum(n, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(n, hs.OFFER_TYPE_DIE)) return n;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (e) throw e.error;
}
}
return null;
};
e.calculateReplaceProbability = function(t, e) {
return e < 15e3 ? t <= 4e3 ? 1 : t > 4e3 && t <= 8e3 ? .66 : 0 : e >= 15e3 && e <= 25e3 ? t <= 4e3 ? .75 : t > 4e3 && t <= 8e3 ? .5 : 0 : e > 25e3 && t <= 8e3 ? .5 : 0;
};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
return buildLazyConditionContext({
isMultiPathByScoreAlgo: function() {
return ASContext((null == o ? void 0 : o.algorithmId) === u, "本轮实际算法为多活路难题调参（对齐 1.0 algoActualId）");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isMultiPathByScoreAlgo",
operator: "=",
value: !0
},
flow: "injectMultiPathByScoreSdkArgs",
platform: "ios",
gameMode: "class"
} ];
};
e.prototype.onSDKArgsActions = function(t) {
return {
injectMultiPathByScoreSdkArgs: function() {
var e, o, r, i, n, l;
return {
limitSmallRandomWeight: {
isLimitBlockIdArr: null !== (o = null === (e = t.limitSmallRandomWeight) || void 0 === e ? void 0 : e.isLimitBlockIdArr) && void 0 !== o && o,
isLimitCopyBlockIdArr: null !== (i = null === (r = t.limitSmallRandomWeight) || void 0 === r ? void 0 : r.isLimitCopyBlockIdArr) && void 0 !== i && i,
isUseCopyBlock: null === (l = null === (n = t.limitSmallRandomWeight) || void 0 === n ? void 0 : n.isUseCopyBlock) || void 0 === l || l,
copyFilterBlocks: []
}
};
}
};
};
var o;
return o = n([ classId("CTRefactorMultiPathPuzzleByScoreTrait") ], e);
}(Trait);
o.CTRefactorMultiPathPuzzleByScoreTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMultiPathPuzzleByScoreTrait" ]);
//# sourceMappingURL=index.js.map
