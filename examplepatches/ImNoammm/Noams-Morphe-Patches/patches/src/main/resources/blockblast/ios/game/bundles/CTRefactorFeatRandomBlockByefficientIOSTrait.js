window.__require = function t(e, o, r) {
function i(n, c) {
if (!o[n]) {
if (!e[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!e[s]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var l = o[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return i(e[n][1][t] || t);
}, l, l.exports, t, e, o, r);
}
return o[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < r.length; n++) i(r[n]);
return i;
}({
CTRefactorFeatRandomBlockByefficientIOSTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "ee6f25a6F5A9Zek29Miprsv", "CTRefactorFeatRandomBlockByefficientIOSTrait");
var r, i, a = this && this.__extends || (r = function(t, e) {
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
var i, a = arguments.length, n = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, o, r); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, o, n) : i(e, o)) || n);
return a > 3 && n && Object.defineProperty(e, o, n), n;
}, c = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, i, a = o.call(t), n = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = a.next()).done; ) n.push(r.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
r && !r.done && (o = a.return) && o.call(a);
} finally {
if (i) throw i.error;
}
}
return n;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(c(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorFeatRandomBlockByefficientIOSTrait = void 0;
(function(t) {
t[t.ParamDefault = 0] = "ParamDefault";
t[t.Param1 = 1] = "Param1";
t[t.Param2 = 2] = "Param2";
})(i || (i = {}));
var f = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.LOG_TAG = "[CTRefactorFeatRandomBlockByefficientIOSTrait]";
e._activeMinTime = 18e4;
e._activeMaxTime = 3e5;
e._activeBeforeTime = -1;
e._everyTime = 0;
return e;
}
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
e.prototype.data = function() {
return {
dot: {
rec_strategy_cnt: this.getOfferTimes(),
hard_cnt: this.getOfferHardTimes(),
rec_strategy_time: this.getRandomTime()
}
};
};
e.prototype.isClassAlgorithmLifeCycle_GameStart_ProxyOnGameStart = function() {
this._everyTime = Date.now();
};
e.prototype.isClassAlgorithmLifeCycle_GameOver_ProxyUpdateGameOverPostDataClear = function(t) {
hs.storage.setItem("FeatRandomBlockByefficientGameTime", 0);
this._everyTime = 0;
if (!t.args[0]) {
this._activeBeforeTime = -1;
this.clearTimeData();
}
this.resetDotData();
};
e.prototype.isChapterAlgorithmLifeCycle_GameEnd_ProxyUpdateGameOverPostDataCleared = function() {
this.resetDotData();
};
e.prototype.isCTRefactorFinalBlockCheckIOSTraitSaveReplaceStep1 = function(t) {
var e = this.getRandIndexArr();
null !== e && e.length <= 3 && (t.args[1] = hs.OFFER_TYPE.RANDOM_BLOCK_BOTTOM);
};
e.prototype.isCTRefactorFinalBlockCheckIOSTraitSaveReplaceStep2 = function(t) {
this.shouldSkipSameBlockFix() && (t.args[2] = !1);
};
e.prototype.isCTRefactorFinalBlockCheckIOSTraitSaveReplaceFinalStep = function(t) {
var e = hs.algorithmInfo.blockIdList;
if (e && 0 === e.length) {
var o = this.getRandIndexArr();
if (null === o) return;
o.length <= 3 && (t.args[1] = hs.OFFER_TYPE.RANDOM_BLOCK_BOTTOM);
}
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
var t = hs.storage.getItem("FeatRandomBlockByefficientGameTime", 0);
t += Date.now() - this._everyTime;
this._everyTime = Date.now();
hs.storage.setItem("FeatRandomBlockByefficientGameTime", t);
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
t && e.algorithmId === hs.OFFER_TYPE_BASE.RANDOM_BLOCK_BOTTOM && this.checkOfferHardTimes(hs.algorithmInfo.blockIdList);
};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
return buildLazyConditionContext({
isRandomBlockBottom: function() {
return ASContext((null == o ? void 0 : o.algorithmId) === hs.OFFER_TYPE_BASE.RANDOM_BLOCK_BOTTOM, "当前算法为 RANDOM_BLOCK_BOTTOM");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isRandomBlockBottom",
operator: "=",
value: !0
} ]
},
platform: "ios",
gameMode: "class",
flow: "injectRandomBlockBottomArgs"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = this;
return {
injectRandomBlockBottomArgs: function() {
var e, o, r, i, a = s(null !== (e = hs.algorithmInfo.blockIdList) && void 0 !== e ? e : []), n = s(null !== (o = hs.algorithmName.algoActualName) && void 0 !== o ? o : []), c = (null !== (r = hs.algorithmInfo.blockPosList) && void 0 !== r ? r : []).map(function(t) {
var e, o;
return {
row: null !== (e = null == t ? void 0 : t.row) && void 0 !== e ? e : -1,
col: null !== (o = null == t ? void 0 : t.col) && void 0 !== o ? o : -1
};
});
return 2 === (null === (i = t.props) || void 0 === i ? void 0 : i.param) ? {
blockIds: a,
blockNames: n,
blockPoses: c,
extra: {
traits: {
efficient: !0
}
}
} : {
blockIds: a,
blockNames: n,
blockPoses: c
};
}
};
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this, o = this.isFirstBottomOfferTiming(t);
return buildLazyConditionContext({
canUseRandomBlockBottom: function() {
return ASContext(e.canUseRandomBlockBottom() && o, "后置阶段的放置效率出随机是否可触发");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canUseRandomBlockBottom",
operator: "=",
value: !0
} ]
},
platform: "ios",
gameMode: "class",
flow: "randomBlockBottom"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
randomBlockBottom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.RANDOM_BLOCK_BOTTOM ]
} ]
};
};
e.prototype.shouldSkipSameBlockFix = function() {
return this.isContainRandom();
};
e.prototype.isContainRandom = function() {
return hs.algorithmName.algoActualName.filter(function(t) {
return "随机" === t;
}).length > 0;
};
e.prototype.isFirstBottomOfferTiming = function() {
var t = hs.storage.getItem("classRoundNum", 0), e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
return 1 === t && e === hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.canUseRandomBlockBottom = function() {
var t = this.getRandIndexArr();
return null !== t && t.length <= 3;
};
e.prototype.getRandIndexArr = function() {
var t, e;
if (this._activeBeforeTime <= 0) {
this._activeBeforeTime = Math.floor(Math.random() * (this._activeMaxTime - this._activeMinTime + 1) + this._activeMinTime);
this.updateRandomTimeDot(this._activeBeforeTime);
this.saveTimeData(this._activeBeforeTime);
}
if (hs.storage.getItem("FeatRandomBlockByefficientGameTime", 0) >= this._activeBeforeTime && ((null === (t = this.props) || void 0 === t ? void 0 : t.param) === i.Param1 || (null === (e = this.props) || void 0 === e ? void 0 : e.param) === i.Param2)) return null;
if (-64 === hs.boardInfo.faceBlocks.reduce(function(t, e) {
return t.concat(e);
}).reduce(function(t, e) {
return t + e;
})) return null;
for (var o = [], r = 0; r < hs.algorithmName.algoActualName.length; r++) "随机" === hs.algorithmName.algoActualName[r] && o.push(r);
return o.length <= 0 ? null : o;
};
e.prototype.checkOfferHardTimes = function(t) {
if (hs.binarySupport.hasLiveWay(hs.boardInfo.faceBlocks, t)) {
var e = this.getData();
null == e && (e = {
offerTimes: 0,
offerHardTimes: 0
});
e.offerTimes = (e.offerTimes || 0) + 1;
var o = new hs.BinaryBoard();
o.convertToBinaryBoard(hs.boardInfo.faceBlocks);
for (var r = 0; r < t.length; r++) if (!o.canPut(t[r])) {
e.offerHardTimes = (e.offerHardTimes || 0) + 1;
break;
}
this.updateOfferDot(e);
this.saveData(e);
}
};
e.prototype.updateOfferDot = function(t) {
var e, o;
this.setState({
dot: {
rec_strategy_cnt: t.offerTimes,
hard_cnt: t.offerHardTimes,
rec_strategy_time: null !== (o = null === (e = this.state.dot) || void 0 === e ? void 0 : e.rec_strategy_time) && void 0 !== o ? o : this.getRandomTime()
}
});
};
e.prototype.updateRandomTimeDot = function(t) {
var e, o, r, i;
this.setState({
dot: {
rec_strategy_cnt: null !== (o = null === (e = this.state.dot) || void 0 === e ? void 0 : e.rec_strategy_cnt) && void 0 !== o ? o : this.getOfferTimes(),
hard_cnt: null !== (i = null === (r = this.state.dot) || void 0 === r ? void 0 : r.hard_cnt) && void 0 !== i ? i : this.getOfferHardTimes(),
rec_strategy_time: t
}
});
};
e.prototype.resetDotData = function() {
this.clearData();
this.setState({
dot: {
rec_strategy_cnt: 0,
hard_cnt: 0,
rec_strategy_time: 0
}
});
};
e.prototype.getOfferTimes = function() {
var t = this.getData();
return t && t.offerTimes || 0;
};
e.prototype.getOfferHardTimes = function() {
var t = this.getData();
return t && t.offerHardTimes || 0;
};
e.prototype.getRandomTime = function() {
var t = this.getTimeData();
return -1 === t ? -1 : t / 1e3;
};
e.prototype.saveData = function(t) {
t && hs.storage.setItem("featrandomblockbyefficient", t);
};
e.prototype.getData = function() {
return hs.storage.getItem("featrandomblockbyefficient", null);
};
e.prototype.clearData = function() {
hs.storage.remove("featrandomblockbyefficient");
};
e.prototype.saveTimeData = function(t) {
hs.storage.setItem("featrandomblockbyefficient_time", t);
};
e.prototype.getTimeData = function() {
var t = hs.storage.getItem("featrandomblockbyefficient_time", null);
return null != t ? t : this._activeBeforeTime;
};
e.prototype.clearTimeData = function() {
hs.storage.remove("featrandomblockbyefficient_time");
};
return n([ classId("CTRefactorFeatRandomBlockByefficientIOSTrait") ], e);
}(Trait);
o.CTRefactorFeatRandomBlockByefficientIOSTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFeatRandomBlockByefficientIOSTrait" ]);
//# sourceMappingURL=index.js.map
