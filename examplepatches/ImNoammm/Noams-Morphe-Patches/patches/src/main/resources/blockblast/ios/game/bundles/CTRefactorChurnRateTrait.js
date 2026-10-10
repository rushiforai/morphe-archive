window.__require = function t(e, r, a) {
function n(i, s) {
if (!r[i]) {
if (!e[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var h = r[i] = {
exports: {}
};
e[i][0].call(h.exports, function(t) {
return n(e[i][1][t] || t);
}, h, h.exports, t, e, r, a);
}
return r[i].exports;
}
for (var o = "function" == typeof __require && __require, i = 0; i < a.length; i++) n(a[i]);
return n;
}({
CTRefactorChurnRateTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "1e2b1IqPExEaKIEIz0w7CXe", "CTRefactorChurnRateTrait");
var a, n = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, a) {
var n, o = arguments.length, i = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (i = (o < 3 ? n(i) : o > 3 ? n(e, r, i) : n(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorChurnRateTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorAlgoFillSortEdgeIOSTraitForceReplaceAlgorithm = function(t) {
this.handleForceReplaceAlgorithm(t);
};
e.prototype.isClassGameOver_GameEnd_ProxyOnGameEnd = function() {
this.handleResetData();
};
e.prototype.isClassGame_Replay_ProxyOnGameReplay = function() {
this.handleResetData();
};
e.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
this.handleAlgorithmIosTiankongReplace(t);
};
e.prototype.isCTRefactorPuzzleFailBaseplateTraitUpdatePuzzleFailPuzzleHard = function(t) {
this.handlePuzzleHardReplace(t);
};
e.prototype.isCTRefactorPuzzleFailBaseplateAdjustParamsTraitUpdatePuzzleFailPuzzleHard = function(t) {
this.handlePuzzleHardReplace(t);
};
e.prototype.isGBM_Light_ProxyOnInitComplete = function() {
this.handleGbmInitComplete();
};
e.prototype.isIosActive = function() {
return !0;
};
e.prototype.handleForceReplaceAlgorithm = function(t) {
if (this.isIosActive() && this.canReplaceAlgorithm()) {
t.args[0] = !0;
this.replaceFillSortEdgeTraitForceReplaceAlgorithm();
}
};
e.prototype.handleResetData = function() {
this.isIosActive() && this.resetData();
};
e.prototype.handleAlgorithmIosTiankongReplace = function(t) {
this.isIosActive() && this.startAlgorithmIosTiankongReplace(t);
};
e.prototype.handlePuzzleHardReplace = function(t) {
if (this.isIosActive()) {
var e = this.startAlgorithmHardReplace(t.args[0], t.args[1]);
if (e) {
t.returnValue = e;
t.replace = !0;
}
}
};
e.prototype.handleGbmInitComplete = function() {
this.isIosActive() && (!this.getChurnParam().isValid || this.isAfterBeijingTime() && hs.gbmChurnRateInfo.checkCanReqGBMData()) && hs.gbmChurnRateInfo.reqChurnRateData();
};
e.prototype.replaceFillSortEdgeTraitForceReplaceAlgorithm = function() {};
e.prototype.startAlgorithmHardReplace = function(t, e) {
var r = hs.OFFER_TYPE;
if (this.checkRunType6(!0)) {
(null == (a = TRAIT("RobotModelEventDataTrait")) ? void 0 : a.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: this.id,
model_output: {
offerType: r.HEJI_ALGORITHMENTROPY
}
}));
return {
normalList: [ r.HEJI_ALGORITHMENTROPY ],
failList: null != e ? e : []
};
}
if (this.isCanOfferWay5()) {
var a;
(null == (a = TRAIT("RobotModelEventDataTrait")) ? void 0 : a.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: this.id,
model_output: {
offerType: r.VERY_KUN_NAN_TI_1
}
}));
return {
normalList: [ r.VERY_KUN_NAN_TI_1 ],
failList: null != e ? e : []
};
}
return null;
};
e.prototype.startAlgorithmIosTiankongReplace = function(t) {
if (this.checkRunType6(!1)) {
var e = null == t ? void 0 : t.args[0];
if (e) {
var r = hs.algorithmStrategyLogic.insertAlgorithms(e, [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ], hs.OFFER_TYPE.SHANG_ZENG_3);
t.args[0] = r;
var a = TRAIT("RobotModelEventDataTrait");
(null == a ? void 0 : a.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: this.id,
model_output: {
offerType: hs.OFFER_TYPE.SHANG_ZENG_3
}
}));
}
}
};
e.prototype.isCanOfferWay5 = function() {
if (5 != this.props.way) return !1;
var t = hs.gbmChurnRateInfo.churnDiffTimes, e = 1 - Math.exp(-.11 * (t + 3));
return Math.random() < e;
};
e.prototype.getChurnParam = function() {
var t, e, r, a, n, o, i;
1 == this.props.way ? i = null === (t = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === t ? void 0 : t.id9_replace_probability : 2 == this.props.way ? i = null === (e = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === e ? void 0 : e.inter_ad_show_probability : 3 == this.props.way ? i = null === (r = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === r ? void 0 : r.first_knnt_add_time : 4 == this.props.way ? i = null === (a = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === a ? void 0 : a.subsequent_knnt_add_time : 5 == this.props.way ? i = null === (n = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === n ? void 0 : n.first_knnt_add_time_1 : (6 == this.props.way || 7 == this.props.way || 8 == this.props.way) && (i = null === (o = hs.gbmChurnRateInfo.churnRateInfo) || void 0 === o ? void 0 : o.remain_probability);
return {
churnParam: i,
isValid: "number" == typeof i
};
};
e.prototype.canReplaceAlgorithm = function() {
if (1 == this.props.way) {
var t = this.getChurnParam(), e = t.churnParam;
if (t.isValid) {
var r = hs.algorithmName.algoActualName, a = hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId], n = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait");
if (null == n ? void 0 : n.active) {
(o = -1 !== ("" + a).indexOf("熵增") || r.find(function(t) {
return -1 !== (t + "").indexOf("熵增");
})) || (o = ("" + a).includes("难题降级策略") || r.find(function(t) {
return (t + "").includes("难题降级策略");
}));
if (!o) return !1;
} else {
var o;
if (!(o = r.find(function(t) {
return -1 !== (t + "").indexOf("熵增");
}) || r.find(function(t) {
return (t + "").includes("难题降级策略");
}))) return !1;
}
return Math.random() < e;
}
}
return !1;
};
e.prototype.getRunWayTime = function() {
var t = this.getChurnParam(), e = t.churnParam;
return t.isValid ? e : 0;
};
e.prototype.checkRunType6 = function(t) {
if (6 != this.props.way) return !1;
var e = this.getRunWayTime();
return e > 0 && Math.random() < e && (!!t || Math.random() < .5);
};
e.prototype.isAfterBeijingTime = function() {
var t = new Date(), e = t.getTimezoneOffset(), r = t.getTime() + 6e4 * e, a = new Date(r + 288e5), n = a.getHours(), o = a.getMinutes();
return n > 12 || 12 == n && o >= 30;
};
e.prototype.resetData = function() {
hs.gbmChurnRateInfo.setChurnDiffTimes(0);
};
return o([ classId("CTRefactorChurnRateTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorChurnRateTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorChurnRateTrait" ]);
//# sourceMappingURL=index.js.map
