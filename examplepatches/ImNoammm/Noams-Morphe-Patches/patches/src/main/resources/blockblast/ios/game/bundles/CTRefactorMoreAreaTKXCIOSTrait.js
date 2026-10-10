window.__require = function t(e, o, r) {
function a(n, s) {
if (!o[n]) {
if (!e[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!e[l]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var h = o[n] = {
exports: {}
};
e[n][0].call(h.exports, function(t) {
return a(e[n][1][t] || t);
}, h, h.exports, t, e, o, r);
}
return o[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < r.length; n++) a(r[n]);
return a;
}({
CTRefactorMoreAreaTKXCIOSTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "12af5aEqWBDyrMHptW9S4t+", "CTRefactorMoreAreaTKXCIOSTrait");
var r, a = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, o, r) {
var a, i = arguments.length, n = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, o, n) : a(e, o)) || n);
return i > 3 && n && Object.defineProperty(e, o, n), n;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorMoreAreaTKXCIOSTrait = void 0;
var n = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isShieldMore = !1;
e._didReplaceTravel = !1;
e.continuousThreshold = 4;
e.param3_round2Score_newPlayer_ios = [ 34.91, 108.92, 265.88, 512.36, 834.12, 1234.56, 1677.07, 2150.8, 2623.19, 3099.34, 3578.94, 4064.67, 4559.07, 5063.42, 5576.58, 6095.54, 6619.13, 7150.06, 7686.08, 8226.93, 8773.83, 9319.64, 9871, 10423.46, 10983.02, 11545.54, 12118.68, 12690.71, 13266.62, 13846.8, 14425.53, 15011.57, 15598.49, 16184.65, 16778.77, 17368.84, 17950.64, 18528.19, 19103.94, 19688.28, 20259.94, 20826.51, 21392.6, 21965.48, 22527.73, 23072.45, 23612.42, 24161.91, 24674.42, 25194.54, 25709.81, 26241.21, 26759.16, 27269.14, 27770.74, 28258.67, 28745.35, 29233.4, 29714.57, 30197.85, 30673.13, 31175.21, 31673.38, 32161.29, 32635.73, 33191.61, 33678.63, 34166.77, 34593.24, 35024.23, 35501.71, 35984.37, 36462.59, 36948.68, 37449.97, 37918.46, 38380.01, 38892.42, 39385.63, 39821.64, 40275.26, 40717.59, 41228.68, 41681.15, 42072.59, 42482.84, 42927.73, 43322.63, 43731.11, 44235.86, 44619.06, 45115.85, 45543.01, 46079.33, 46614.1, 47076.98, 47617.75, 48071.62, 48473.28, 48977.22 ];
e.param3_round2Score_active_ios = [ 32.07, 110.82, 271.81, 525.88, 859.33, 1282.24, 1763.45, 2289.75, 2835.37, 3391.07, 3960.19, 4534.27, 5116.46, 5696.56, 6283.53, 6870.42, 7454.06, 8036.99, 8616.72, 9196.58, 9781.7, 10370.41, 10955.06, 11539.62, 12136.91, 12735.26, 13315.11, 13876.67, 14438.61, 14999.19, 15558.8, 16100.1, 16638.06, 17161.9, 17697.49, 18194.59, 18672.02, 19145.66, 19599.47, 20069.26, 20502.72, 20924.52, 21339.63, 21750.68, 22126.99, 22507.93, 22851.35, 23272.79, 23662.39, 24008.5, 24338.64, 24700.84, 25032.04, 25357.61, 25678.42, 26034.67, 26413.99, 26741.87, 27088.09, 27481.01, 27808, 28214.88, 28575.77, 28862.81, 29206.7, 29545.83, 29879.57, 30299.24, 30614.24, 31005.9, 31345.18, 31709.14, 32074.8, 32465.93, 32796.16, 33123.91, 33539.33, 33948.34, 34353.52, 34711.97, 35157.11, 35507.24, 35805.45, 36081.07, 36547.88, 36817.46, 37162.8, 37500.33, 37760.37, 38041.47, 38467.39, 38714.32, 39516.52, 39728.01, 39524.61, 39894.02, 40229.53, 40591.53, 40981.35, 41452.47 ];
return e;
}
e.prototype.isCTRefactorContinueSameMoreRoundLimitIOSTraitUpdateReplaceCheck = function(t) {
hs.algorithmName.algoActualName.every(function(t) {
return t === hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_FILL_MORE_AREA];
}) && (t.args[0] = !1);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
var e, o;
if (hs.gameInfo.gameMode === hs.GameMode.Class && t.args[1] && (null === (e = t.args[1]) || void 0 === e ? void 0 : e.isDown)) {
var r = null !== (o = t.args[0]) && void 0 !== o ? o : [];
this.replaceAlgorithmAlgo(r);
t.args[0] = r;
}
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoOfferClass = function(t) {
var e, o;
if (hs.gameInfo.gameMode === hs.GameMode.Class && t.args[1] && (null === (e = t.args[1]) || void 0 === e ? void 0 : e.isDown)) {
var r = null !== (o = t.args[0]) && void 0 !== o ? o : [];
this.replaceAlgorithmAlgo(r);
t.args[0] = r;
}
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
var e = t.args[1];
if (e && e.isDown && this.calculateTriggerContinuousTimes()) {
var o = t.args[0], r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 !== o.indexOf(r) && (t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(o, [ r ], hs.OFFER_TYPE.ALGO_FILL_MORE_AREA));
}
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetDayNightLess3000DifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetDayNightMore3000DifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoPuzzleFailTimingBase = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isCTRefactorClearBoardPlusTraitSetAlgorithmFailList = function(t) {
this.replaceAlgorithmAlgo(t.args[0]);
};
e.prototype.isClassAlgorithmLifeCycle_GameEnd_ProxyOnGameEnd = function() {
hs.storage.setItem("MoreAreaTKXC", 0);
};
e.prototype.isClassAlgorithmLifeCycle_Replay_ProxyOnGameReplay = function() {
hs.storage.setItem("MoreAreaTKXC", 0);
};
e.prototype.onPreprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
shouldInsertMoreArea: function() {
return ASContext(e.conditionReplace(t), "大面积填空是否满足插入条件");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
conditionAlgorithm: [ {
conditions: {
fact: "shouldInsertMoreArea",
operator: "=",
value: !0
},
flow: "insertMoreAreaFlow",
platform: "ios"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
conditionAlgorithm: {
insertMoreAreaFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA ]
} ]
}
};
};
e.prototype.onAlgorithmStrategySDKItemBefore = function(t, e, o) {
if (hs.gameInfo.gameMode === hs.GameMode.Class && t.algorithmId === hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA) {
var r = this.updateAlgoRun();
this.replaceAlgorithmAlgoTrigger();
if (!r) {
this.fallbackExpectedIdOnSkip(t, e, o);
return {
isRun: !1
};
}
var a = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == a ? void 0 : a.active) && a.addAlgorithmNameMapping(hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA, this.traitName, hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA);
}
};
e.prototype.onPostprocessConditionContext = function() {
var t = this, e = 1 !== hs.storage.getItem("chapterRoundNum", 0);
this._didReplaceTravel = e && this.__is_replaceTravel();
return buildLazyConditionContext({
shouldReplaceTravel: function() {
return ASContext(t._didReplaceTravel, "旅行兜底：非首轮且预期为填空消除且 50% 命中，替换为大面积填空");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunJourneyNonFirstRoundPostprocess",
operator: "=",
value: !0
}, {
fact: "shouldReplaceTravel",
operator: "=",
value: !0
} ]
},
flow: "replaceTravel",
platform: "ios",
gameMode: "journey"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
replaceTravel: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA_IOS_TRAVEL ]
} ]
};
};
e.prototype.onPostSdkResult = function() {};
e.prototype.updateAlgoRun = function() {
this.startRunAlgorithmParam3Add();
return !(hs.storage.getItem("MoreAreaTKXC", 0) < this.continuousThreshold);
};
e.prototype.checkIsVailid = function() {
if (3 === this.props.offerType) {
this.calculateTriggerContinuousTimes();
return hs.storage.getItem("MoreAreaTKXC", 0) >= this.continuousThreshold;
}
return !1;
};
e.prototype.conditionReplace = function(t) {
return hs.gameInfo.gameMode === hs.GameMode.Class && !this.isShieldMore && !!this.isLaneSchemeSource(t) && this.calculateTriggerContinuousTimes();
};
e.prototype.isLaneSchemeSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.LaneScheme;
};
e.prototype.calculateTriggerContinuousTimes = function() {
if (3 === this.props.offerType) {
var t = hs.storage.getItem("classRoundNum", 0) - 1, e = this.props.roundScore;
(!e || e.length < 100) && (e = 1 === this.props.gameWayType ? this.param3_round2Score_active_ios : this.param3_round2Score_newPlayer_ios);
if (t > e.length) {
hs.storage.setItem("MoreAreaTKXC", 0);
return !1;
}
return !0;
}
return !1;
};
e.prototype.startRunAlgorithmParam3Add = function() {
var t, e = hs.storage.getItem("classRoundNum", 0) - 1, o = hs.scoreInfo.score || 0, r = e > 0 ? e - 1 : 0, a = this.props.roundScore;
(!a || a.length < 100) && (a = 1 === this.props.gameWayType ? this.param3_round2Score_active_ios : this.param3_round2Score_newPlayer_ios);
var i = null !== (t = a[r]) && void 0 !== t ? t : 0, n = hs.storage.getItem("MoreAreaTKXC", 0);
o < i ? n++ : n = 0;
hs.storage.setItem("MoreAreaTKXC", n);
};
e.prototype.replaceAlgorithmAlgo = function(t) {
3 === this.props.offerType && this.calculateTriggerContinuousTimes() && t.unshift(hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA);
};
e.prototype.replaceAlgorithmAlgoTrigger = function() {};
e.prototype.fallbackExpectedIdOnSkip = function(t, e, o) {
var r, a, i, n, s = hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA;
if (hs.algorithmName.algoExpectedId === s) {
var l, c = t.algorithmListSource, h = (l = "priority" === c ? null !== (r = o.algorithmPriorityList) && void 0 !== r ? r : as.AlgorithmStrategyAlgorithmPriorityListPatch.algorithmPriorityList : "fallback" === c || "fallback" === e ? null !== (a = o.algorithmFallbackList) && void 0 !== a ? a : as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList : null !== (i = o.algorithmList) && void 0 !== i ? i : as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList).findIndex(function(t) {
return t.algorithmId === s;
}), g = null === (n = l[h + 1]) || void 0 === n ? void 0 : n.algorithmId;
"number" == typeof g && g >= 0 && as.AlgorithmStrategyAlgoExpectedIdPatch.patch(g, this);
}
};
e.prototype.__is_replaceTravel = function() {
return (1 === this.props.k2 || 3 === this.props.offerType) && "填空消除" === hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId] && Math.random() < .5;
};
return i([ classId("CTRefactorMoreAreaTKXCIOSTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorMoreAreaTKXCIOSTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMoreAreaTKXCIOSTrait" ]);
//# sourceMappingURL=index.js.map
