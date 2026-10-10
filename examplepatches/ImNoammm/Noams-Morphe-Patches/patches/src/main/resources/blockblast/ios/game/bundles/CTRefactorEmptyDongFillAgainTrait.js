window.__require = function t(e, r, o) {
function i(a, c) {
if (!r[a]) {
if (!e[a]) {
var p = a.split("/");
p = p[p.length - 1];
if (!e[p]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(p, !0);
if (n) return n(p, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = p;
}
var s = r[a] = {
exports: {}
};
e[a][0].call(s.exports, function(t) {
return i(e[a][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
CTRefactorEmptyDongFillAgainTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "ee6d4DTaoNDe5hCm2Jz+8BI", "CTRefactorEmptyDongFillAgainTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorEmptyDongFillAgainTrait = void 0;
var a = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
r = e;
e.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
if (this.isWeightExceedLimit()) {
var e = t.args[0], r = hs.algorithmStrategyLogic.replaceAlgorithmType(e, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.EMPTYDONGFILL);
t.args[0] = r;
}
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isWeightExceedLimit: function() {
return ASContext(t.isWeightExceedLimit(), "盘面权重>280");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
blankAlgorithm: [ {
conditions: {
fact: "isWeightExceedLimit",
operator: "=",
value: !0
},
platform: "gp",
flow: "gpFlow"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
blankAlgorithm: {
gpFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.IOS_EMPTYDONGFILL ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.IOS_EMPTYDONGFILL ]
}, {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.IOS_EMPTYDONGFILL ]
} ]
}
};
};
Object.defineProperty(e.prototype, "currentWeight", {
get: function() {
return hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks);
},
enumerable: !1,
configurable: !0
});
e.prototype.isWeightExceedLimit = function() {
return this.currentWeight > r.WEIGHT_LIMIT;
};
var r;
e.WEIGHT_LIMIT = 280;
return r = n([ classId("CTRefactorEmptyDongFillAgainTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorEmptyDongFillAgainTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorEmptyDongFillAgainTrait" ]);
//# sourceMappingURL=index.js.map
