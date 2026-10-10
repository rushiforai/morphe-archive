window.__require = function t(e, r, o) {
function n(a, l) {
if (!r[a]) {
if (!e[a]) {
var p = a.split("/");
p = p[p.length - 1];
if (!e[p]) {
var f = "function" == typeof __require && __require;
if (!l && f) return f(p, !0);
if (i) return i(p, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = p;
}
var s = r[a] = {
exports: {}
};
e[a][0].call(s.exports, function(t) {
return n(e[a][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorTravelHappyOverTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "84dc4vbvvdO2b4zcXtPH/Y9", "CTRefactorTravelHappyOverTrait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__values || function(t) {
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
}, l = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, i = r.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, p = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(l(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorTravelHappyOverTrait = void 0;
var f = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._hardIdList = [ hs.OFFER_TYPE.HEJI_KUN_NAN_TI, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPY, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPYMORECLEAR, hs.OFFER_TYPE.HEJI_KUN_NAN_TI, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD1, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD2 ];
e._hardIdListSinglePool = [ hs.OFFER_TYPE.HEJI_KUN_NAN_TI, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPY, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPYMORECLEAR, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD1, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD2 ];
e._algorithmFailList = [ hs.OFFER_TYPE.SHANG_ZENG_3, hs.OFFER_TYPE.SUI_JI_WU_SI ];
e._currentAlgorithmList = [];
e._hasOfferStepSnapshot = !1;
e._offerStepSnapshot = !1;
return e;
}
r = e;
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return this.levelCondition();
},
enumerable: !1,
configurable: !0
});
e.prototype.levelCondition = function() {
return !0;
};
Object.defineProperty(e.prototype, "algorithmStrategy", {
get: function() {
return hs.algorithmStrategy;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "progress", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("TravelHappyOverTrait", "progress", this.props, 1);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "propRate", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("TravelHappyOverTrait", "rate", this.props, 1);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "minLevelId", {
get: function() {
var t;
return null !== (t = this.props.minLevelId) && void 0 !== t ? t : 49;
},
enumerable: !1,
configurable: !0
});
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.resetOfferStepSnapshot();
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isOfferStep: function() {
return ASContext(t.getOfferStepSnapshot(), "是否达到终局爽触发条件");
},
algorithmList: function() {
return ASContext(t._currentAlgorithmList, "终局爽 normal 算法列表");
},
algorithmFailList: function() {
return ASContext(t._algorithmFailList, "终局爽 fallback 算法列表");
}
});
};
e.prototype.onTravelHappyOverTriggered = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ChapterAlgorithmSourceType.TravelTrait);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
TravelTrait: [ {
conditions: {
and: [ {
fact: "isOfferStep",
operator: "=",
value: !0
} ]
},
event: {
type: "onTravelHappyOverTriggered"
},
flow: "travelHappyOver"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
TravelTrait: {
travelHappyOver: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "algorithmFailList"
} ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
e.prototype.onAlgorithmStrategyCollectionAdjust = function() {
var t, e;
if (this.getOfferStepSnapshot()) {
var r = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections, o = hs.chapterCollectInfo.collectRemainCollectItems, n = [], i = [];
try {
for (var l = a(r), f = l.next(); !f.done; f = l.next()) {
var s = f.value, c = o[s.Key];
if (0 !== c) {
n.push(s.Key);
i.push(c);
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
f && !f.done && (e = l.return) && e.call(l);
} finally {
if (t) throw t.error;
}
}
var h = hs.chapterAlgorithmInfo.blockIdList;
if (Array.isArray(h) && 0 !== h.length) {
for (var u = [], y = 0; y < 3; y++) {
var v = Math.max.apply(Math, p(i)), d = i.indexOf(v);
if (d < 0 || i[d] <= 0) u.push(this.getEmptyBlockCollectionInfo(y, r, o)); else {
var T = hs.AlgorithmPosType[h[y]];
if (T) {
i[d] -= T.length;
for (var _ = {}, g = 0; g < T.length; g++) _[g] = {
Key: n[d],
pos: g
};
u.push(_);
} else u.push(this.getEmptyBlockCollectionInfo(y, r, o));
}
}
var m = TRAIT("CTRefactorIsOpenCollectLevelOfferNormalAndGemTrait");
(null == m ? void 0 : m.active) && m.recordTravelHappyOver();
return {
data: u,
disableTraits: [ "CTRefactorCollectIncreaseTrait", "CTRefactorMultiElementCollectTrait", "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait", "CTRefactorMultiElementCollect_TravelConfigLayerTrait", "CTRefactorCollectionOriginTrait" ]
};
}
}
};
e.prototype.getHardIdByRandomHard = function() {
return this.shuffleArray(p(this._hardIdList));
};
e.prototype.isOfferStep = function() {
return this.getOfferStepSnapshot();
};
e.prototype.getOfferStepSnapshot = function() {
if (!this._hasOfferStepSnapshot) {
this._hasOfferStepSnapshot = !0;
this._offerStepSnapshot = this.snapshotOfferStep();
}
return this._offerStepSnapshot;
};
e.prototype.snapshotOfferStep = function() {
this._currentAlgorithmList = [];
if (!this.calcOfferStepHit()) return !1;
this._currentAlgorithmList = this.isLevelEndOptimizeEnabled() ? this.getHardIdByRandomSingle() : this.getHardIdByRandomHard();
this.setNormalAlgorithmTimeout(r.NORMAL_LIST_TIMEOUT);
return !0;
};
e.prototype.calcOfferStepHit = function() {
var t, e;
if (hs.gameInfo.gameMode !== hs.GameMode.Chapter) return !1;
if (this.isUnable()) return !1;
if (!this.isProbabilityHit()) return !1;
var r = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections, o = 1 - this.progress, n = 0;
try {
for (var i = a(r), l = i.next(); !l.done; l = i.next()) {
var p = l.value, f = p.Value * o;
hs.chapterCollectInfo.getRemainCollectNum(p.Key) <= f && n++;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
l && !l.done && (e = i.return) && e.call(i);
} finally {
if (t) throw t.error;
}
}
return n !== r.length && n > 0;
};
e.prototype.resetOfferStepSnapshot = function() {
this._hasOfferStepSnapshot = !1;
this._offerStepSnapshot = !1;
this._currentAlgorithmList = [];
this.setNormalAlgorithmTimeout(NaN);
};
e.prototype.setNormalAlgorithmTimeout = function(t) {
this.algorithmStrategy.updateContext({
timeout: {
preprocess_normalAlgorithm_sdk: t
}
});
};
e.prototype.isUnable = function() {
var t = TRAIT("$31873_f_HappyOverLimitTrait");
if (!0 !== (null == t ? void 0 : t.active)) return !1;
var e = (hs.chapterGameInfo.chapterNum + 1) % 10;
return !(e > 1 && e % 2 == 1);
};
e.prototype.isProbabilityHit = function() {
var t = Math.random(), e = this.propRate;
return 1 === e || t <= e;
};
e.prototype.getHardIdByRandomSingle = function() {
var t = Math.floor(Math.random() * this._hardIdListSinglePool.length);
return [ this._hardIdListSinglePool[t] ];
};
e.prototype.isLevelEndOptimizeEnabled = function() {
return hs.chapterGameInfo.chapterNum >= this.minLevelId;
};
e.prototype.getEmptyBlockCollectionInfo = function(t, e, r) {
var o, n;
if (!this.isLevelEndOptimizeEnabled()) return {};
var i = [];
try {
for (var l = a(e), p = l.next(); !p.done; p = l.next()) {
var f = p.value;
r[f.Key] > 0 && i.push(f.Key);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
p && !p.done && (n = l.return) && n.call(l);
} finally {
if (o) throw o.error;
}
}
if (0 === i.length) return {};
var s = hs.AlgorithmPosType[hs.chapterAlgorithmInfo.blockIdList[t]];
if (!s || 0 === s.length) return {};
for (var c = i[Math.floor(Math.random() * i.length)], h = {}, u = 0; u < s.length; u++) h[u] = {
Key: c,
pos: u
};
return h;
};
e.prototype.isTravelHappyOverNormalItem = function(t) {
return !!t && -1 !== this._hardIdListSinglePool.indexOf(t.algorithmId);
};
e.prototype.shuffleArray = function(t) {
for (var e = t.length - 1; e > 0; e--) {
var r = Math.floor(Math.random() * (e + 1)), o = t[e];
t[e] = t[r];
t[r] = o;
}
return t;
};
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
var o = this;
return buildLazyConditionContext({
isTravelHappyOverNormal: function() {
return ASContext(o.isTravelHappyOverNormalItem(r), "是否终局爽 normal 阶段 SDK 请求");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isTravelHappyOverNormal",
operator: "=",
value: !0
} ]
},
gameMode: "journey",
flow: "limitTime"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
limitTime: function() {
return {
limitSmall: hs.scoreInfo.score >= 2e3
};
}
};
};
var r;
e.NORMAL_LIST_TIMEOUT = 50;
return r = i([ classId("CTRefactorTravelHappyOverTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorTravelHappyOverTrait = f;
cc._RF.pop();
}, {} ],
CTRefactorTravelHappyOver_levelCondition_Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "ca43etpzy9B36hO3+Dude9d", "CTRefactorTravelHappyOver_levelCondition_Trait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorTravelHappyOver_levelCondition_Trait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.levelCondition = function() {
var t, e = this.props, r = null !== (t = null == e ? void 0 : e.minLevelId) && void 0 !== t ? t : 0;
return hs.chapterGameInfo.chapterNum >= r;
};
return i([ classId("CTRefactorTravelHappyOverTrait", "levelCondition") ], e);
}(t("./CTRefactorTravelHappyOverTrait").CTRefactorTravelHappyOverTrait);
r.CTRefactorTravelHappyOver_levelCondition_Trait = a;
cc._RF.pop();
}, {
"./CTRefactorTravelHappyOverTrait": "CTRefactorTravelHappyOverTrait"
} ]
}, {}, [ "CTRefactorTravelHappyOverTrait", "CTRefactorTravelHappyOver_levelCondition_Trait" ]);
//# sourceMappingURL=index.js.map
