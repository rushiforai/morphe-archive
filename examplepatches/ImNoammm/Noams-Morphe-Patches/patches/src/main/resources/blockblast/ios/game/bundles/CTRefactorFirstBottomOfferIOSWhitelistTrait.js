window.__require = function t(e, o, r) {
function i(l, n) {
if (!o[l]) {
if (!e[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!e[a]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(a, !0);
if (s) return s(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var u = o[l] = {
exports: {}
};
e[l][0].call(u.exports, function(t) {
return i(e[l][1][t] || t);
}, u, u.exports, t, e, o, r);
}
return o[l].exports;
}
for (var s = "function" == typeof __require && __require, l = 0; l < r.length; l++) i(r[l]);
return i;
}({
CTRefactorFirstBottomOfferIOSWhitelistTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "9634a9iV/NPXZf0DATXsefS", "CTRefactorFirstBottomOfferIOSWhitelistTrait");
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
}), s = this && this.__decorate || function(t, e, o, r) {
var i, s = arguments.length, l = s < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, o, r); else for (var n = t.length - 1; n >= 0; n--) (i = t[n]) && (l = (s < 3 ? i(l) : s > 3 ? i(e, o, l) : i(e, o)) || l);
return s > 3 && l && Object.defineProperty(e, o, l), l;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorFirstBottomOfferIOSWhitelistTrait = void 0;
var l = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
isFirstRound: function() {
return ASContext(e.isFirstRound(t), "是否首轮,首轮禁用后置特性");
},
isShieldBottomIOSLevel: function() {
return ASContext(e.isShieldBottomIOSLevel(), "是否shield,所有的兜底逻辑");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isShieldBottomIOSLevel",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableAfterShieldBottomIOSLevel"
}, {
conditions: {
fact: "isFirstRound",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableAfterFirstBottomWhitelist"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
disableAfterShieldBottomIOSLevel: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
}, {
operator: "AlgorithmStrategyDisableOperator",
type: "disablePostRestTags",
args: []
} ],
disableAfterFirstBottomWhitelist: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
e.prototype.isFirstRound = function() {
var t = hs.storage.getItem("classRoundNum", 0), e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
return 1 === t && e == hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.isShieldBottomIOSLevel = function() {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1, e = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait");
if (null == e ? void 0 : e.active) {
if (t == hs.ChapterAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.MergeBlocksAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.MergeBlocksAlgorithmSourceType.AlgoRevive || t == hs.MergeBlocksAlgorithmSourceType.AlgoReviveTrait || t == hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.ClassAlgorithmSourceType.AlgoRevive || t == hs.ClassAlgorithmSourceType.AlgoReviveTrait) return !0;
} else if (t == hs.ChapterAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.MergeBlocksAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.MergeBlocksAlgorithmSourceType.AlgoRevive || t == hs.MergeBlocksAlgorithmSourceType.AlgoReviveTrait || t == hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom || t == hs.ClassAlgorithmSourceType.AlgoRevive || t == hs.ClassAlgorithmSourceType.AlgoReviveTrait) return !0;
return !1;
};
return s([ classId("CTRefactorFirstBottomOfferIOSWhitelistTrait") ], e);
}(Trait);
o.CTRefactorFirstBottomOfferIOSWhitelistTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstBottomOfferIOSWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
