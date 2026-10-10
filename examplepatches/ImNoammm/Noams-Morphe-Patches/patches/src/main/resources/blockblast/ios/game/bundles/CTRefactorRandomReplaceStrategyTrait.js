window.__require = function t(e, o, r) {
function a(i, l) {
if (!o[i]) {
if (!e[i]) {
var p = i.split("/");
p = p[p.length - 1];
if (!e[p]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(p, !0);
if (n) return n(p, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = p;
}
var s = o[i] = {
exports: {}
};
e[i][0].call(s.exports, function(t) {
return a(e[i][1][t] || t);
}, s, s.exports, t, e, o, r);
}
return o[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < r.length; i++) a(r[i]);
return a;
}({
CTRefactorRandomReplaceStrategyTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "8cc9f3EyP5Fzp0HS/wcNvRg", "CTRefactorRandomReplaceStrategyTrait");
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
}), n = this && this.__decorate || function(t, e, o, r) {
var a, n = arguments.length, i = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, o, i) : a(e, o)) || i);
return n > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorRandomReplaceStrategyTrait = void 0;
var i = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.SOURCE_ALGORITHM_TYPES = [ hs.OFFER_TYPE.SUI_JI, hs.OFFER_TYPE.SUI_JI_WU_SI ];
return e;
}
e.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoLaneRandomClass = function(t) {
this.handleIosLaneRandomClass(t);
};
e.prototype.onPreprocessConditionContext = function(t) {
return buildLazyConditionContext({
randomReplaceFlow: function() {
return ASContext(t, "随机替换策略 flow 快照");
}
});
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
resolveRandomReplace: function(e) {
return t.resolveRandomReplace(e);
}
};
};
e.prototype.onPreprocessConditions = function() {
return {
baseAfter: [ {
conditions: {
fact: "randomReplaceFlow",
operator: "resolveRandomReplace",
value: !0
},
flow: "replaceRandom",
platform: "gp",
event: {
type: "onRandomReplaceApplied",
args: [ {
fact: "operator.resolveRandomReplace.data.expectedAlgorithmId"
} ]
}
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
baseAfter: {
replaceRandom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveRandomReplace.data.algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveRandomReplace.data.algorithmFallbackList"
} ]
} ]
}
};
};
e.prototype.onRandomReplaceApplied = function(t) {
null != t && as.AlgorithmStrategyAlgoExpectedIdPatch.patch(t, this);
};
e.prototype.resolveRandomReplace = function(t) {
var e = this.collectAlgorithmIds(null == t ? void 0 : t.algorithmList), o = this.collectAlgorithmIds(null == t ? void 0 : t.algorithmFallbackList), r = hs.algorithmStrategyLogic.haveAlgorithms(e, this.SOURCE_ALGORITHM_TYPES), a = hs.algorithmStrategyLogic.haveAlgorithms(o, this.SOURCE_ALGORITHM_TYPES);
if (!r && !a) return {
status: !1
};
var n = this.replaceListWithOneRandom(e, r);
return {
status: !0,
data: {
algorithmList: n,
algorithmFallbackList: this.replaceListWithOneRandom(o, a),
expectedAlgorithmId: n[0]
}
};
};
e.prototype.replaceListWithOneRandom = function(t, e) {
return e ? hs.algorithmStrategyLogic.replaceAlgorithms(t, this.SOURCE_ALGORITHM_TYPES, this.getOfferType()) : t;
};
e.prototype.collectAlgorithmIds = function(t) {
return t ? t.map(function(t) {
return t.algorithmId;
}) : [];
};
e.prototype.handleIosLaneRandomClass = function(t) {
t.args[1] && t.args[1].lane && this.setAlgorithmListIOS(t);
};
e.prototype.setAlgorithmListIOS = function(t) {
var e, o = Math.random(), r = .33;
(null === (e = this.props) || void 0 === e ? void 0 : e.proportion) && this.props.proportion.length > 1 && (r = this.props.proportion[0] / (this.props.proportion[0] + this.props.proportion[1]));
if (o <= r) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, this);
t.args[0] = hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
} else {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_SHANG.SHANG_ZENG_3, this);
t.args[0] = hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit();
}
};
e.prototype.getOfferType = function() {
return hs.algorithmStrategyLogic.getTianKongAndShangZeng();
};
return n([ classId("CTRefactorRandomReplaceStrategyTrait") ], e);
}(Trait);
o.CTRefactorRandomReplaceStrategyTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandomReplaceStrategyTrait" ]);
//# sourceMappingURL=index.js.map
