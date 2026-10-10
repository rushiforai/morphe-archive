window.__require = function t(e, o, r) {
function i(a, u) {
if (!o[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var _ = "function" == typeof __require && __require;
if (!u && _) return _(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var f = o[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return i(e[a][1][t] || t);
}, f, f.exports, t, e, o, r);
}
return o[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < r.length; a++) i(r[a]);
return i;
}({
CTRefactor$633_f_LightGBMFeature20Trait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "3a0693nz8dJ+ZZyqhHEXCI0", "CTRefactor$633_f_LightGBMFeature20Trait");
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
var i, n = arguments.length, a = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var u = t.length - 1; u >= 0; u--) (i = t[u]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, o, a) : i(e, o)) || a);
return n > 3 && a && Object.defineProperty(e, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactor$633_f_LightGBMFeature20Trait = void 0;
var a = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isRunId9 = !1;
e._gameNum = 0;
e._roundNum = 0;
return e;
}
e.prototype.isGBM_Light_ProxyOnInitComplete = function() {
hs.gbmChurnRateInfo.reqChurnRateData(!1);
};
e.prototype.isCTRefactorChurnRateTraitReplaceFillSortEdgeTraitForceReplaceAlgorithm = function() {
var t = storage.getItem("classGameNum", 0), e = storage.getItem("classRoundNum", 0);
this._gameNum = t;
this._roundNum = e <= 0 ? 0 : e;
};
e.prototype.isCTRefactorAlgoFillSortEdgeIOSTraitUpdateBottomAlgoList = function(t) {
this._isRunId9 = t.args[0];
};
e.prototype.isAlgoFillSortEdgeIOSAdjustParamsTraitUpdateBottomAlgoList = function(t) {
this._isRunId9 = t.args[0];
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this.isBottomOfferTiming(t), o = this.canOutFill();
if (e && o) {
var r = TRAIT("RobotModelEventDataTrait");
(null == r ? void 0 : r.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: this.id,
model_output: {
offeType: hs.OFFER_TYPE.ALGO_QUICK
}
}));
}
return buildLazyConditionContext({
isBottomOfferTiming: function() {
return ASContext(e, "是否底部兜底时机");
},
shouldOutFill: function() {
return ASContext(o, "LightGBM 流失概率干预策略-v2.0 触发条件");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBottomOfferTiming",
operator: "=",
value: !0
}, {
fact: "shouldOutFill",
operator: "=",
value: !0
} ]
},
flow: "outFill",
platform: "ios",
gameMode: "class"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
outFill: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BLANK.ALGO_QUICK ]
} ]
};
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
if (t && e.SDK_ALGO_TYPE === hs.OFFER_ALGORITHM_SDK_TYPE[hs.OFFER_TYPE.ALGO_QUICK]) {
var o = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == o ? void 0 : o.active) {
o.addAlgorithmNameMapping(hs.OFFER_TYPE_BLANK.ALGO_QUICK, "CTRefactor$633_f_LightGBMFeature20Trait", hs.OFFER_TYPE_BLANK.ALGO_QUICK, null, hs.OFFER_TYPE_BLANK.ALGO_QUICK);
o.updateAlgorithmIOSSuccessExpectedId(hs.OFFER_TYPE_BLANK.ALGO_QUICK);
}
var r = TRAIT("RobotModelEventDataTrait");
(null == r ? void 0 : r.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Get_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {
offeType: hs.OFFER_TYPE.ALGO_QUICK
},
feature_id: this.id
}));
}
};
e.prototype.canOutFill = function() {
if (!hs.gbmChurnRateInfo.churnRateInfo) {
this._isRunId9 = !1;
return !1;
}
var t = storage.getItem("classGameNum", 0), e = storage.getItem("classRoundNum", 0);
e < 0 && (e = 0);
if (this._isRunId9 && t === this._gameNum && e === this._roundNum) {
this._isRunId9 = !1;
return !1;
}
this._isRunId9 = !1;
var o = hs.gbmChurnRateInfo.churnRateInfo.rec_rp_prob_v_2_0;
return !!o && (!!hs.algorithmName.algoActualName.join(",").includes("全组合填空消除") && Math.random() <= o);
};
e.prototype.isBottomOfferTiming = function() {
return !(1 === storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
return n([ classId("CTRefactor$633_f_LightGBMFeature20Trait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactor$633_f_LightGBMFeature20Trait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$633_f_LightGBMFeature20Trait" ]);
//# sourceMappingURL=index.js.map
