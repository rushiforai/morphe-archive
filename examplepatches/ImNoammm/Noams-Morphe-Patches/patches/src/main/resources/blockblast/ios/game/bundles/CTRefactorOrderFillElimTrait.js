window.__require = function t(r, o, e) {
function i(a, n) {
if (!o[a]) {
if (!r[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!r[s]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(s, !0);
if (l) return l(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var h = o[a] = {
exports: {}
};
r[a][0].call(h.exports, function(t) {
return i(r[a][1][t] || t);
}, h, h.exports, t, r, o, e);
}
return o[a].exports;
}
for (var l = "function" == typeof __require && __require, a = 0; a < e.length; a++) i(e[a]);
return i;
}({
CTRefactorOrderFillElimTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "7e8f9oLHC0+T1prfI2eDxor", "CTRefactorOrderFillElimTrait");
var e, i = this && this.__extends || (e = function(t, r) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
})(t, r);
}, function(t, r) {
e(t, r);
function o() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (o.prototype = r.prototype, new o());
}), l = this && this.__decorate || function(t, r, o, e) {
var i, l = arguments.length, a = l < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, o, e); else for (var n = t.length - 1; n >= 0; n--) (i = t[n]) && (a = (l < 3 ? i(a) : l > 3 ? i(r, o, a) : i(r, o)) || a);
return l > 3 && a && Object.defineProperty(r, o, a), a;
}, a = this && this.__read || function(t, r) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var e, i, l = o.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(e = l.next()).done; ) a.push(e.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
e && !e.done && (o = l.return) && o.call(l);
} finally {
if (i) throw i.error;
}
}
return a;
}, n = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(a(arguments[r]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorOrderFillElimTrait = void 0;
var s = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onAlgorithmStrategySDKComplete = function(t, r) {
var o;
if (t && (null !== (o = r.actualAlgorithmId) && void 0 !== o ? o : r.algorithmId) === hs.OFFER_TYPE_BLANK.ORDER_FILL_ELIM) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.ORDER_FILL_ELIM, this);
}
};
r.prototype.onPreprocessConditionContext = function(t) {
return buildLazyConditionContext({
orderFillElimFlow: function() {
return ASContext(t, "秩序填空消除 flow 快照");
}
});
};
r.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
resolveOrderFillElimBlank: function(r) {
return t.resolveOrderFillElim(r);
}
};
};
r.prototype.onPreprocessConditions = function() {
return {
blankAlgorithm: [ {
conditions: {
fact: "orderFillElimFlow",
operator: "resolveOrderFillElimBlank",
value: !0
},
flow: "orderFillElimBlankFlow",
platform: "gp",
gameMode: "class"
} ]
};
};
r.prototype.onPreprocessActions = function() {
return {
blankAlgorithm: {
orderFillElimBlankFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveOrderFillElimBlank.data.algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveOrderFillElimBlank.data.fallbackList"
} ]
} ]
}
};
};
r.prototype.resolveOrderFillElim = function(t) {
var r, o, e, i, l = null !== (o = null === (r = this.state) || void 0 === r ? void 0 : r.shouldTreatMergeFillAsFill) && void 0 !== o && o, a = this.collectAlgorithmIds(null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList), n = this.collectAlgorithmIds(null !== (i = null == t ? void 0 : t.algorithmFallbackList) && void 0 !== i ? i : as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList), s = this.isSupportAlgos(a, n, l) && this.isSupportFrom();
this.readMatchCondtionTrait(s);
if (!s) return {
status: !1
};
if (!this.shouldReplaceByPercent()) return {
status: !1
};
var c = l ? [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.ALGO_MIX_TKXC ] : [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ];
return {
status: !0,
data: {
algorithmList: hs.algorithmStrategyLogic.insertAlgorithms(a, c, hs.OFFER_TYPE.ORDER_FILL_ELIM),
fallbackList: hs.algorithmStrategyLogic.insertAlgorithms(n, c, hs.OFFER_TYPE.ORDER_FILL_ELIM)
}
};
};
r.prototype.readMatchCondtionTrait = function() {};
r.prototype.isSupportAlgos = function(t, r, o) {
void 0 === o && (o = !1);
var e = n(t, r), i = o ? [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.ALGO_MIX_TKXC ] : [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ];
return hs.algorithmStrategyLogic.haveAlgorithms(e, i);
};
r.prototype.isSupportFrom = function() {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1, r = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
return t === hs.ClassAlgorithmSourceType.LaneScheme || [ "ClearBoardPlusTrait", "CTRefactorClearBoardPlusTrait", "InterestCurveOfferTrait", "CTRefactorInterestCurveOfferTrait", "InterestCurveOfferAdjustParamsTrait", "CTRefactorInterestCurveOfferAdjustParamsTrait" ].includes(r);
};
r.prototype.shouldReplaceByPercent = function() {
var t, r;
return 100 * Math.random() < (null !== (r = null === (t = this.props) || void 0 === t ? void 0 : t.percent) && void 0 !== r ? r : 50);
};
r.prototype.collectAlgorithmIds = function(t) {
return t ? t.map(function(t) {
return t.algorithmId;
}) : [];
};
r.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
var r, o, e, i, l = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
(null == l ? void 0 : l.active) && l.setState({
isTrigger: !1
});
var a = t.args[0], n = 100 * Math.random(), s = null !== (o = null === (r = this.props) || void 0 === r ? void 0 : r.percent) && void 0 !== o ? o : 50, c = null !== (i = null === (e = this.state) || void 0 === e ? void 0 : e.shouldTreatMergeFillAsFill) && void 0 !== i && i;
if (n < s && this.isSupportIosAlgos(a, c)) {
var h = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
(null == h ? void 0 : h.active) && h.setState({
isTrigger: !0
});
var u = hs.algorithmStrategyIOSBlankRefactoredInfo.offer(), p = c ? [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.ALGO_MIX_TKXC ] : [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ], g = hs.algorithmStrategyLogic.replaceAlgorithms(a, p, hs.OFFER_TYPE.ORDER_FILL_ELIM);
t.args[0] = hs.algorithmStrategyLogic.insertAlgorithmsAfter(g, [ hs.OFFER_TYPE.ORDER_FILL_ELIM ], u[0]);
}
};
r.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoChapterReplaceTravelTianKongXiaoChu = function(t) {
var r, o, e, i = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
(null == i ? void 0 : i.active) && i.setState({
isTrigger: !1
});
var l = t.args[0], a = 100 * Math.random(), n = null !== (o = null === (r = this.props) || void 0 === r ? void 0 : r.percent) && void 0 !== o ? o : 50, s = null === (e = this.props) || void 0 === e ? void 0 : e.isNew;
if (a < n && s && hs.gameInfo.gameMode == hs.GameMode.Chapter) {
var c = [ hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT ], h = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
(null == h ? void 0 : h.active) && h.setState({
isTrigger: !0
});
var u = hs.algorithmStrategyLogic.insertAlgorithms(l, c, hs.OFFER_TYPE.ORDER_FILL_ELIM);
t.args[0] = u;
}
};
r.prototype.isSupportIosAlgos = function(t, r) {
void 0 === r && (r = !1);
var o = n(t, this.collectAlgorithmIds(as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList), this.collectAlgorithmIds(as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList)), e = r ? [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.ALGO_MIX_TKXC ] : [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ];
return hs.algorithmStrategyLogic.haveAlgorithms(o, e);
};
return l([ classId("CTRefactorOrderFillElimTrait") ], r);
}(Trait);
o.CTRefactorOrderFillElimTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorOrderFillElimTrait" ]);
//# sourceMappingURL=index.js.map
