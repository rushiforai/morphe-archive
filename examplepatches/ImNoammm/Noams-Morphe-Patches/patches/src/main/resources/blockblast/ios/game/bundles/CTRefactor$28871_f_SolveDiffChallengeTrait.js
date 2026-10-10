window.__require = function e(t, o, r) {
function n(i, l) {
if (!o[i]) {
if (!t[i]) {
var f = i.split("/");
f = f[f.length - 1];
if (!t[f]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(f, !0);
if (a) return a(f, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = f;
}
var c = o[i] = {
exports: {}
};
t[i][0].call(c.exports, function(e) {
return n(t[i][1][e] || e);
}, c, c.exports, e, t, o, r);
}
return o[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < r.length; i++) n(r[i]);
return n;
}({
CTRefactor$28871_f_SolveDiffChallengeTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "56faetZ1WhKjrr7WKAgv701", "CTRefactor$28871_f_SolveDiffChallengeTrait");
var r, n = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
r(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), a = this && this.__decorate || function(e, t, o, r) {
var n, a = arguments.length, i = a < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, o, r); else for (var l = e.length - 1; l >= 0; l--) (n = e[l]) && (i = (a < 3 ? n(i) : a > 3 ? n(t, o, i) : n(t, o)) || i);
return a > 3 && i && Object.defineProperty(t, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactor$28871_f_SolveDiffChallengeTrait = void 0;
var i = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.isClassAlgorithmLifeCycle_GameOver_ProxyUpdateGameOverPreDataClear = function(e) {
e.args[0] || this.httpRequest();
};
t.prototype.isClassAlgorithmLifeCycle_TouchEnd_ProxyOnTouchEndDelay = function(e) {
e.args[0].state.clearProducer && this.isDiff() && hs.classSolveDiffChallengeIOSInfo.updateDiffSolveCount(1);
};
t.prototype.onAlgorithmStrategyPostprocessComplete = function(e) {
this.isReviveSource(e) || this.isDiff() && hs.classSolveDiffChallengeIOSInfo.updateDiffTotalCount(1);
};
t.prototype.isReviveSource = function() {
var e = hs.ClassAlgorithmSourceType.AlgoRevive;
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === e;
};
t.prototype.onPostprocessConditionContext = function(e) {
var t = this, o = !1, r = null, n = function() {
if (!o) {
o = !0;
(r = t.offerReplacementAlgorithm()) && r.length > 0 && t.addAlgorithmNameMappingToNameInfo(hs.OFFER_TYPE.VERY_DIFFICULT_HARD, null, null, hs.OFFER_TYPE.KUN_NAN_TI);
}
return r;
};
return buildLazyConditionContext({
canRunBottomOfferStart: function() {
return ASContext(t.canRunBottomOfferStart(e), "是否可运行底部起始兜底段");
},
hasReplaceAlgo: function() {
var e, t;
return ASContext((null !== (t = null === (e = n()) || void 0 === e ? void 0 : e.length) && void 0 !== t ? t : 0) > 0, "能力分层挑战替换算法条件满足");
},
algoList: function() {
return ASContext(n(), "能力分层挑战替换算法列表");
}
});
};
t.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunBottomOfferStart",
operator: "=",
value: !0
}, {
fact: "hasReplaceAlgo",
operator: "=",
value: !0
} ]
},
flow: "solveDiffReplace",
gameMode: "class"
} ];
};
t.prototype.onPostprocessActions = function() {
return {
solveDiffReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "algoList"
} ]
} ]
};
};
t.prototype.canRunBottomOfferStart = function() {
return !(1 === storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
t.prototype.isDiff = function() {
return !!(hs.algorithmName.algoActualName && hs.algorithmName.algoActualName.length > 0 && hs.algorithmName.algoActualName.every(function(e) {
return -1 !== e.indexOf("难题") && "难题降级策略" !== e;
}));
};
t.prototype.offerReplacementAlgorithm = function() {
var e, t = hs.classSolveDiffChallengeIOSInfo.getDataInfo();
if (!t || !1 === (null == t ? void 0 : t.isValid)) return null;
if (Math.random() > t.rate) return null;
var o = hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks);
if (this.checkWeight(o, t)) return null;
var r = hs.classGameInfo.roundNum - 1;
if (r < t.apply_round_start || r > t.apply_round_end) return null;
var n = hs.classSolveDiffChallengeIOSInfo.getAlgorithmStrategy(t.origin_rec);
if (!n) return null;
if (!hs.algorithmName.algoActualName.some(function(e) {
return e.includes(n.str);
})) return null;
var a = hs.classSolveDiffChallengeIOSInfo.getAlgorithmStrategy(t.replace_rec);
if (!a) return null;
10 === t.replace_rec && (null === (e = null == a ? void 0 : a.algorithmId) || void 0 === e ? void 0 : e.length) > 0 && this.addAlgorithmNameMappingToNameInfo(hs.OFFER_TYPE.KUN_NAN_TI, null, "困难难题,困难难题,困难难题");
return a.algorithmId;
};
t.prototype.addAlgorithmNameMappingToNameInfo = function(e, t, o, r) {
var n = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == n ? void 0 : n.active) && n.addAlgorithmNameMapping(e, "CTRefactor$28871_f_SolveDiffChallengeTrait", t, o, r);
};
t.prototype.checkWeight = function() {
return !1;
};
t.prototype.httpRequest = function() {
var e, t;
this._parameter = (null === (e = this.props) || void 0 === e ? void 0 : e.parameter) || "ios_solve_diff_challenge_1_1";
var o = (null === (t = hs.deviceInfo.data) || void 0 === t ? void 0 : t.distinct_id) || "0003C628-2BD8-46C3-8B58-DE117C897D1E";
hs.classSolveDiffChallengeIOSInfo.initTimeInfo();
var r = hs.classSolveDiffChallengeIOSInfo.timeInfo;
if (r && !r.isRequest) {
var n = hs.classSolveDiffChallengeIOSInfo.diffInfo;
if (!n || n.diffTotalNum < 50) ; else {
var a = this, i = {
key: o,
req_type: this._parameter,
diff_cnt: n.diffTotalNum,
diff_pass_cnt: n.diffSolveNum,
platform: "ios"
};
hs.HUserAbilityLayer.request("https://ai-robot-hub.afafb.com/infer/v1/block_user_ability_layer", i).then(function(e) {
var t, o = null === (t = e[a._parameter]) || void 0 === t ? void 0 : t.rec_config;
if (o) {
hs.classSolveDiffChallengeIOSInfo.initDataInfo(o[0], !0);
hs.classSolveDiffChallengeIOSInfo.updateIsRequest(!0);
} else {
hs.classSolveDiffChallengeIOSInfo.initDataInfo({}, !1);
hs.classSolveDiffChallengeIOSInfo.updateIsRequest(!0);
}
}).catch(function() {});
}
}
};
return a([ classId("CTRefactor$28871_f_SolveDiffChallengeTrait"), classMethodWatch() ], t);
}(Trait);
o.CTRefactor$28871_f_SolveDiffChallengeTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$28871_f_SolveDiffChallengeTrait" ]);
//# sourceMappingURL=index.js.map
