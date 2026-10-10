window.__require = function t(e, r, o) {
function a(n, l) {
if (!r[n]) {
if (!e[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!e[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var h = r[n] = {
exports: {}
};
e[n][0].call(h.exports, function(t) {
return a(e[n][1][t] || t);
}, h, h.exports, t, e, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorIsIncreaseEnjoyCollectionTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "77eabmVeFtKuqdvYAK1sxkw", "CTRefactorIsIncreaseEnjoyCollectionTrait");
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
r.CTRefactorIsIncreaseEnjoyCollectionTrait = void 0;
var l = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.DISABLE_FOLLOWING_POST_TAGS = [ "updateFirstBottomOfferList", "updateBottomOfferStartList" ];
return e;
}
e.prototype.onAlgorithmStrategyPositionAdjust = function() {
if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.ELIMINTE_PLEASURE) return {
data: hs.AlgorithmStrategyPositionType.LEFT,
returnState: !0
};
};
e.prototype.onAlgorithmStrategyCollectionAdjust = function() {
var t, e;
if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.ELIMINTE_PLEASURE) {
var r = 0, o = 0, a = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections, i = hs.chapterCollectInfo.collectRemainCollectItems;
try {
for (var l = n(a), s = l.next(); !s.done; s = l.next()) {
var c = s.value, h = i[c.Key];
if (0 != h) {
if (o < h) {
r = c.Key;
o = h;
}
0;
} else 0;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
s && !s.done && (e = l.return) && e.call(l);
} finally {
if (t) throw t.error;
}
}
if (r < 100) return;
var f = [], u = !1, p = hs.chapterAlgorithmInfo.blockIdList;
if (!Array.isArray(p)) return;
for (var g = 0; g < p.length; g++) {
var E = p[g];
if (hs.algorithmName.algoActualName[g] == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ELIMINTE_PLEASURE]) {
var d = hs.AlgorithmPosType[E];
if (d) {
for (var I = {}, v = 0; v < d.length; v++) I[v] = {
Key: r,
pos: v
};
u = !0;
f.push(I);
} else f.push({});
} else f.push({});
}
if (u) {
var T = [].concat(f), _ = TRAIT("CTRefactorIsOpenCollectLevelOfferNormalAndGemTrait");
(null == _ ? void 0 : _.active) && _.recordIncreaseEnjoyCollection();
return {
data: T,
disableTraits: [ "CTRefactorTravelHappyOverTrait", "CTRefactorCollectIncreaseTrait", "CTRefactorMultiElementCollectTrait", "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait", "CTRefactorMultiElementCollect_TravelConfigLayerTrait", "CTRefactorCollectionOriginTrait" ]
};
}
}
};
e.prototype.isOriginRevive = function() {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
return t === hs.ChapterAlgorithmSourceType.TravelRevive || t === hs.ChapterAlgorithmSourceType.TravelReviveTrait;
};
e.prototype.isHappyOver = function() {
return "CTRefactorTravelHappyOverTrait" === hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
};
e.prototype.isSpecialAlgo = function(t) {
if (t.algorithmList.length > 0) {
var e = t.algorithmList[t.algorithmList.length - 1].algorithmId;
if (t.sdk.actualAlgorithmId == hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI || t.sdk.actualAlgorithmId == hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA || "fallback" == t.sdk.algorithmListSource && hs.isValueInEnum(e, hs.OFFER_TYPE_DIFFICULTY)) return !0;
}
return !1;
};
e.prototype.isScoreLevel = function() {
return 0 == hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.Way;
};
e.prototype.isIngoreAlgo = function(t) {
var e;
return !![ hs.OFFER_TYPE.KUN_NAN_TI ].includes(hs.algorithmName.algoActualId) || !(null === (e = null == t ? void 0 : t.algorithmList) || void 0 === e || !e.some(function(t) {
return t.algorithmId == hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE;
}));
};
e.prototype.isFindPileUpPos = function() {
return -1 == this.findPileUpPos();
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
this._lastPostprocessFlow = t;
return buildLazyConditionContext({
handleNewBottomAlgo: function() {
return ASContext(e.handleNewBottomAlgo(), "是否需要处理新底算法");
},
isOriginRevive: function() {
return ASContext(e.isOriginRevive(t), "是否来自复活算法");
},
isHappyOver: function() {
return ASContext(e.isHappyOver(t), "是否来自消除爽算法");
},
isSpecialAlgo: function() {
return ASContext(e.isSpecialAlgo(t), "特殊题型不触发");
},
isScoreLevel: function() {
return ASContext(e.isScoreLevel(t), "是否是分数关");
},
isIngoreAlgo: function() {
return ASContext(e.isIngoreAlgo(t), " 是否是忽略的算法");
},
isFindPileUpPos: function() {
return ASContext(e.isFindPileUpPos(t), " 是否可以凑堆的点");
}
});
};
e.prototype.resetExpectedAlgoIdIfNeeded = function() {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE, this);
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "handleNewBottomAlgo",
operator: "=",
value: !0
}, {
fact: "isOriginRevive",
operator: "=",
value: !1
}, {
fact: "isHappyOver",
operator: "=",
value: !1
}, {
fact: "isSpecialAlgo",
operator: "=",
value: !1
}, {
fact: "isScoreLevel",
operator: "=",
value: !1
}, {
fact: "isIngoreAlgo",
operator: "=",
value: !1
}, {
fact: "isFindPileUpPos",
operator: "=",
value: !1
} ]
},
event: {
type: "resetExpectedAlgoIdIfNeeded"
},
flow: "flow1"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS ]
} ]
};
};
e.prototype.canCollect = function(t) {
return t > 100 && t < 1e3;
};
e.prototype.findPileUpPos = function() {
for (var t = hs.boardInfo.faceBlocks, e = [ 0, 0, 0, 0, 0, 0, 0, 0 ], r = [ 0, 0, 0, 0, 0, 0, 0, 0 ], o = {}, a = 0; a < 8; a++) {
for (var i = -1, n = 0; n < 8; n++) if (t[a][n] < 0) {
if (-1 != i) {
i = -1;
break;
}
i = n;
} else this.canCollect(t[a][n]) && e[a]++;
-1 != i && e[a] >= 3 && (o[h = 8 * a + i] ? o[h] += e[a] : o[h] = e[a]);
}
for (n = 0; n < 8; n++) {
var l = -1;
for (a = 0; a < 8; a++) if (t[a][n] < 0) {
if (-1 != l) {
l = -1;
break;
}
l = a;
} else this.canCollect(t[a][n]) && r[n]++;
-1 != l && r[n] >= 3 && (o[h = 8 * l + n] ? o[h] += r[n] : o[h] = r[n]);
}
var s = -Infinity, c = -1;
for (var h in o) if (o[h] > s) {
s = o[h];
c = parseInt(h, 10);
} else o[h] == s && Math.random() > .5 && (c = parseInt(h, 10));
return c;
};
e.prototype.handleNewBottomAlgo = function() {
return !0;
};
e.prototype.checkAlgorithm = function(t) {
var e, r;
if (!(hs.algorithmName.algoActualName || [])[0].includes(hs.ALGO_NAME_TYPE.NAME_REVIVE) && "CTRefactorTravelHappyOverTrait" != hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2) {
var o = hs.algorithmStrategyInfo.algorithmList[hs.algorithmStrategyInfo.algorithmList.length - 1];
if (!(hs.algorithmName.algoActualId == hs.OFFER_TYPE.KUN_NAN_TI || hs.algorithmName.algoActualId == hs.OFFER_TYPE.ALGO_FILL_MORE_AREA || "fallback" === (null === (r = null === (e = this._lastPostprocessFlow) || void 0 === e ? void 0 : e.sdk) || void 0 === r ? void 0 : r.algorithmListSource) && hs.isValueInEnum(o, hs.OFFER_TYPE_DIFFICULTY) || 0 == hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.Way || [ hs.OFFER_TYPE.KUN_NAN_TI ].includes(hs.algorithmName.algoActualId) || -1 == this.findPileUpPos() || hs.algorithmStrategyInfo.algorithmList.includes(hs.OFFER_TYPE.ELIMINTE_PLEASURE))) {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ChapterAlgorithmSourceType.TravelTrait);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE, this);
t.args[0] = [ hs.OFFER_TYPE.ELIMINTE_PLEASURE ];
t.returnState = !0;
}
}
};
return i([ classId("CTRefactorIsIncreaseEnjoyCollectionTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorIsIncreaseEnjoyCollectionTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsIncreaseEnjoyCollectionTrait" ]);
//# sourceMappingURL=index.js.map
