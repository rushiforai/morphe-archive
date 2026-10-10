window.__require = function t(o, e, r) {
function n(a, u) {
if (!e[a]) {
if (!o[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!o[s]) {
var l = "function" == typeof __require && __require;
if (!u && l) return l(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var c = e[a] = {
exports: {}
};
o[a][0].call(c.exports, function(t) {
return n(o[a][1][t] || t);
}, c, c.exports, t, o, e, r);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
CTRefactorContinueSameMoreRoundLimitIOSBottomTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "02bfbb7B35Ob6mijNVcPRYM", "CTRefactorContinueSameMoreRoundLimitIOSBottomTrait");
var r, n = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), i = this && this.__decorate || function(t, o, e, r) {
var n, i = arguments.length, a = i < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, r); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(o, e, a) : n(o, e)) || a);
return i > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorContinueSameMoreRoundLimitIOSBottomTrait = void 0;
var a = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onPostprocessConditionContext = function(t) {
var o = this, e = this.getBottomAlgoList(t);
return buildLazyConditionContext({
isBottomOfferTiming: function() {
return ASContext(o.isBottomOfferTiming() && (null == e ? void 0 : e.length) > 0, "是否底部兜底时机");
}
});
};
o.prototype.onPostprocessConditionOperators = function() {
return {
continueSameBottomAlgoList: function(t) {
if (!t) return !1;
var o = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSTrait");
return !(null == o || !o.active) && !!o.onBottomOfferBefore() && {
status: !0,
data: {
algoList: [ hs.algorithmName.algoActualId ]
}
};
}
};
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBottomOfferTiming",
operator: "continueSameBottomAlgoList",
value: !0
} ]
},
flow: "replaceContinueSameBottomAlgo",
platform: "ios"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
replaceContinueSameBottomAlgo: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.continueSameBottomAlgoList.data.algoList"
} ]
} ]
};
};
o.prototype.isBottomOfferTiming = function() {
return 1 !== hs.storage.getItem("classRoundNum", 0);
};
o.prototype.getBottomAlgoList = function(t) {
var o, e, r, n;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return [];
if ((null === (e = null === (o = null == t ? void 0 : t.sdk) || void 0 === o ? void 0 : o.blockIds) || void 0 === e ? void 0 : e.length) < 3) return [];
var i = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
if (!(null == i ? void 0 : i.active) || i.state.isTrigger) return [];
var a = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSTrait");
if (!(null == a ? void 0 : a.active)) return [];
a.state.isDealID70 = !1;
var u = null !== (n = null === (r = null == t ? void 0 : t.sdk) || void 0 === r ? void 0 : r.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch) && void 0 !== n ? n : hs.algorithmName.algoActualId;
if ((u === hs.OFFER_TYPE.ALL_COMBINATION_ID70 || u == hs.OFFER_TYPE.ALL_COMBINATION_ID9) && a.comparePreOut().length >= 2) {
var s = hs.algorithmDataStatistics.algorithmDataStatistics;
s.length >= 1 && s[s.length - 1].blocksList, s.length >= 2 && s[s.length - 2].blocksList;
2 == a.state.round || a.state.round;
a.state.isContinumID70Use = !0;
return [ u ];
}
return [];
};
return i([ classId("CTRefactorContinueSameMoreRoundLimitIOSBottomTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorContinueSameMoreRoundLimitIOSBottomTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueSameMoreRoundLimitIOSBottomTrait" ]);
//# sourceMappingURL=index.js.map
