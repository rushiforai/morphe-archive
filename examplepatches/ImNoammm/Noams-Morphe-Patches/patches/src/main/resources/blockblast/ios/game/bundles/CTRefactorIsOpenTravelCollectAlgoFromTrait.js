window.__require = function e(t, r, o) {
function a(n, l) {
if (!r[n]) {
if (!t[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!t[s]) {
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
t[n][0].call(h.exports, function(e) {
return a(t[n][1][e] || e);
}, h, h.exports, e, t, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorIsOpenTravelCollectAlgoFromTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "b752fg4B+dIzKiewGBuf45b", "CTRefactorIsOpenTravelCollectAlgoFromTrait");
var o, a, i = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), n = this && this.__decorate || function(e, t, r, o) {
var a, i = arguments.length, n = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var l = e.length - 1; l >= 0; l--) (a = e[l]) && (n = (i < 3 ? a(n) : i > 3 ? a(t, r, n) : a(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
}, l = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], o = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && o >= e.length && (e = void 0);
return {
value: e && e[o++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorIsOpenTravelCollectAlgoFromTrait = void 0;
(function(e) {
e[e.Default = 0] = "Default";
e[e.ZhiJue = 1] = "ZhiJue";
e[e.KunNan = 2] = "KunNan";
})(a || (a = {}));
var s = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.lastProcess = 0;
t.random = 0;
t.algoType = a.Default;
return t;
}
t.prototype.checkIsCollectionStage = function() {
var e = storage.getItem("chapterCondition");
return !!e && e.Way === hs.ChapterType.collect;
};
t.prototype.checkNeed = function() {
if (this.lastProcess < .5) return !1;
0 === this.random && (this.random = Math.random());
return this.random < this.lastProcess;
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isNeedTrigger: function() {
return ASContext(e.checkIsCollectionStage() && e.checkNeed(), "是否满足收集关 + 进度条件");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
preprocessingAlgorithm: [ {
conditions: {
fact: "isNeedTrigger",
operator: "=",
value: !0
},
platform: "gp",
gameMode: "journey",
event: {
type: "registerAlgorithmNameMappings"
},
flow: "injectAlgo"
} ],
conditionAlgorithm: [ {
conditions: {
fact: "isNeedTrigger",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
event: {
type: "registerAlgorithmNameMappings"
},
flow: "injectAlgo"
} ]
};
};
t.prototype.registerAlgorithmNameMappings = function() {
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == e ? void 0 : e.active) {
e.addAlgorithmNameMapping(hs.OFFER_TYPE.KUN_NAN_TI, "CTRefactorIsOpenTravelCollectAlgoFromTrait", hs.OFFER_TYPE.KUN_NAN_TI);
e.addAlgorithmNameMapping(hs.OFFER_TYPE.ZHI_JUE_NAN_TI, "CTRefactorIsOpenTravelCollectAlgoFromTrait", null, null, hs.OFFER_TYPE.ZHI_JUE_NAN_TI);
e.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorIsOpenTravelCollectAlgoFromTrait", hs.OFFER_TYPE.SUI_JI_WU_SI);
}
};
t.prototype.onPreprocessActions = function() {
return {
preprocessingAlgorithm: {
injectAlgo: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ [ hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI, hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ] ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
},
conditionAlgorithm: {
injectAlgo: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ [ hs.OFFER_TYPE_DIFFICULTY.ZHI_JUE_NAN_TI, hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI, hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ] ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
};
};
t.prototype.onAlgorithmStrategyCollectionAdjust = function() {
if (this.checkIsCollectionStage() && this.checkNeed()) {
this.determineAlgoType();
if (!(this.algoType <= a.Default)) {
var e = this.getTargetCollection();
if (0 !== e.length) {
var t = hs.chapterAlgorithmInfo.blockIdList;
if (Array.isArray(t) && 0 !== t.length) {
var r = [];
if (this.algoType === a.ZhiJue) for (var o = 0; o < 3; o++) {
var i = {};
if (s = e.length > o ? hs.AlgorithmPosType[t[o]] : void 0) for (var n = 0; n < s.length; n++) i[n] = {
Key: e[o],
pos: n
};
r.push(i);
} else if (this.algoType === a.KunNan) {
var l = Math.floor(3 * Math.random());
for (o = 0; o < 3; o++) {
var s;
i = {};
if (s = l === o ? hs.AlgorithmPosType[t[o]] : void 0) for (n = 0; n < s.length; n++) i[n] = {
Key: e[0],
pos: n
};
r.push(i);
}
}
return {
data: r,
disableTraits: [ "CTRefactorIsIncreaseEnjoyCollectionTrait", "CTRefactorTravelHappyOverTrait", "CTRefactorCollectIncreaseTrait", "CTRefactorMultiElementCollectTrait", "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait", "CTRefactorMultiElementCollect_TravelConfigLayerTrait", "CTRefactorCollectionOriginTrait" ]
};
}
}
}
}
};
t.prototype.determineAlgoType = function() {
var e = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ZHI_JUE_NAN_TI], t = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.KUN_NAN_TI], r = hs.algorithmName.algoActualName;
Array.isArray(r) && 0 !== r.length ? -1 !== r.indexOf(e) ? this.algoType = a.ZhiJue : -1 !== r.indexOf(t) ? this.algoType = a.KunNan : this.algoType = a.Default : this.algoType = a.Default;
};
t.prototype.getTargetCollection = function() {
var e, t, r, o = [];
if (this.algoType === a.Default) return o;
var i = null === (r = hs.chapterConfigInfo.getChapterCurData()) || void 0 === r ? void 0 : r.Condition.RequiredCollections;
if (!i) return o;
var n = [], s = storage.getItem("chapterCollectRemainCollectItems", {});
try {
for (var c = l(i), h = c.next(); !h.done; h = c.next()) {
var p = h.value;
s[p.Key] > 0 && n.push({
key: p.Key,
value: s[p.Key]
});
}
} catch (t) {
e = {
error: t
};
} finally {
try {
h && !h.done && (t = c.return) && t.call(c);
} finally {
if (e) throw e.error;
}
}
if (0 === n.length) return o;
n.sort(function(e, t) {
return t.value - e.value;
});
for (var f = 0; f < n.length; f++) o.push(n[f].key);
if (1 === n.length) {
o.push(n[0].key);
o.push(n[0].key);
}
return o;
};
t.prototype.isCTRefactorTravelReplacementBlockTraitCheckIsMask = function(e) {
this.onCheckIsMask(e);
};
t.prototype.isChapterAlgorithmLifeCycle_GameEnd_ProxyOnGameEnd = function() {
this.checkIsCollectionStage() && this.onGameEnd();
};
t.prototype.isChapterAlgorithmLifeCycle_Replay_ProxyOnReplayGame = function() {
this.checkIsCollectionStage() && this.clear();
};
t.prototype.isCTRefactorTravelReplacementBlockTraitCheckIsReplace = function() {
this.onCheckIsReplace();
};
t.prototype.onCheckIsMask = function(e) {
this.checkIsCollectionStage() && this.algoType !== a.Default && (e.returnValue = !0);
};
t.prototype.onGameEnd = function() {
this.clear();
hs.gameOverGameInfo.isChapterWin || (this.lastProcess = Math.min(Math.max(0, hs.chapterConfigInfo.getChapterProgress()), 1));
};
t.prototype.onCheckIsReplace = function() {
if (this.checkIsCollectionStage()) {
var e = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ZHI_JUE_NAN_TI], t = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.KUN_NAN_TI];
-1 !== hs.algorithmName.algoActualName.indexOf(e) ? this.algoType = a.ZhiJue : -1 !== hs.algorithmName.algoActualName.indexOf(t) ? this.algoType = a.KunNan : this.algoType = a.Default;
}
};
t.prototype.clear = function() {
this.lastProcess = 0;
this.algoType = a.Default;
this.random = 0;
};
return n([ classId("CTRefactorIsOpenTravelCollectAlgoFromTrait") ], t);
}(Trait);
r.CTRefactorIsOpenTravelCollectAlgoFromTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsOpenTravelCollectAlgoFromTrait" ]);
//# sourceMappingURL=index.js.map
