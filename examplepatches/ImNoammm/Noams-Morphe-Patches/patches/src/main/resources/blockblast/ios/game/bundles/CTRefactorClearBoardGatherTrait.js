window.__require = function t(r, e, o) {
function a(n, s) {
if (!e[n]) {
if (!r[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!r[l]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var p = e[n] = {
exports: {}
};
r[n][0].call(p.exports, function(t) {
return a(r[n][1][t] || t);
}, p, p.exports, t, r, e, o);
}
return e[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorClearBoardGatherTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "da484Uy+SRAnpEPrKhZt2+V", "CTRefactorClearBoardGatherTrait");
var o, a = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), i = this && this.__decorate || function(t, r, e, o) {
var a, i = arguments.length, n = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (n = (i < 3 ? a(n) : i > 3 ? a(r, e, n) : a(r, e)) || n);
return i > 3 && n && Object.defineProperty(r, e, n), n;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorClearBoardGatherTrait = void 0;
var n = function(t) {
a(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
var r = t.args[0];
if (this.isSupportIosAlgos(r) && this.isBeforePuzzleTimeFirst()) {
var e = hs.algorithmStrategyLogic.replaceAlgorithmType(r, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.ALGO_CLEAR_BOARD_GATHER);
e = hs.algorithmStrategyLogic.insertArrayAlgorithmsAfter(e, [ hs.OFFER_TYPE.ALGO_CLEAR_BOARD_GATHER ], hs.algorithmStrategyIOSBlankRefactoredInfo.offer());
t.args[0] = e;
}
};
r.prototype.onAlgorithmStrategySDKComplete = function(t, r) {
this.applyClearBoardGatherExpectedIdPatch(t, r);
};
r.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isSupportFrom: function() {
return ASContext(t.isSupportFrom(), "来源为泳道出题或清盘Plus/兴趣曲线");
},
isBeforePuzzleTimeFirst: function() {
return ASContext(t.isBeforePuzzleTimeFirst(), "首次定时难题前time秒内");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
blankAlgorithm: [ {
conditions: {
and: [ {
fact: "isSupportFrom",
operator: "=",
value: !0
}, {
fact: "isBeforePuzzleTimeFirst",
operator: "=",
value: !0
} ]
},
platform: "gp",
flow: "gpFlow"
} ]
};
};
r.prototype.onPreprocessActions = function() {
return {
blankAlgorithm: {
gpFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "insertBefore",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.ALGO_CLEAR_BOARD_GATHER ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "insertBefore",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.ALGO_CLEAR_BOARD_GATHER ]
}, {
operator: "AlgorithmStrategyAlgorithmPostListPatchOperator",
type: "insertBefore",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.ALGO_CLEAR_BOARD_GATHER ]
} ]
}
};
};
r.prototype.isSupportIosAlgos = function(t) {
return hs.algorithmStrategyLogic.haveAlgorithms(t, [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ]);
};
r.prototype.isSupportFrom = function() {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1, r = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
return t === hs.ClassAlgorithmSourceType.LaneScheme || [ "ClearBoardPlusTrait", "CTRefactorClearBoardPlusTrait", "InterestCurveOfferTrait", "CTRefactorInterestCurveOfferTrait", "InterestCurveOfferAdjustParamsTrait", "CTRefactorInterestCurveOfferAdjustParamsTrait" ].includes(r);
};
r.prototype.isBeforePuzzleTimeFirst = function() {
var t = TRAIT("CTRefactorIsPuzzleTimeTrait");
if ((null == t ? void 0 : t.active) && t.state.isHardFirst) {
var r = (new Date().getTime() - t.state.initTime) / 1e3;
return r >= t.state.puzzleTimeFirst - this.props.time && r < t.state.puzzleTimeFirst;
}
return !1;
};
r.prototype.applyClearBoardGatherExpectedIdPatch = function(t, r) {
if (t && r.SDK_ALGO_TYPE === hs.OFFER_ALGORITHM_SDK_TYPE[hs.OFFER_TYPE.ALGO_CLEAR_BOARD_GATHER]) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.ALGO_CLEAR_BOARD_GATHER, this);
}
};
return i([ classId("CTRefactorClearBoardGatherTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorClearBoardGatherTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorClearBoardGatherTrait" ]);
//# sourceMappingURL=index.js.map
