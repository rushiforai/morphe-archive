window.__require = function t(e, o, r) {
function a(i, s) {
if (!o[i]) {
if (!e[i]) {
var g = i.split("/");
g = g[g.length - 1];
if (!e[g]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(g, !0);
if (n) return n(g, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = g;
}
var c = o[i] = {
exports: {}
};
e[i][0].call(c.exports, function(t) {
return a(e[i][1][t] || t);
}, c, c.exports, t, e, o, r);
}
return o[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < r.length; i++) a(r[i]);
return a;
}({
CTRefactorAddSpaceAdd4_classTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "f0f47SwyPNInZD7SjN9hg0s", "CTRefactorAddSpaceAdd4_classTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, o, i) : a(e, o)) || i);
return n > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorAddSpaceAdd4_classTrait = void 0;
var i = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
var e = t.args[0], o = storage.getItem("classRoundNum", 0) - storage.getItem("classReviveNum", 0);
if (hs.gameInfo.gameMode == hs.GameMode.Class && o <= 10) return e;
var r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 != e.indexOf(r) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, r, hs.OFFER_TYPE.SHANG_ZENG_4_IOS));
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
var e = t.args[0], o = storage.getItem("classRoundNum", 0) - storage.getItem("classReviveNum", 0);
if (hs.gameInfo.gameMode == hs.GameMode.Class && o <= 10) return e;
var r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 != e.indexOf(r) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, r, hs.OFFER_TYPE.SHANG_ZENG_4_IOS));
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
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetInterestCurveDifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.onPreprocessConditionContext = function(t) {
var e, o, r, a = (null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : []).map(function(t) {
return t.algorithmId;
}), n = (null !== (o = null == t ? void 0 : t.algorithmFallbackList) && void 0 !== o ? o : []).map(function(t) {
return t.algorithmId;
}), i = (null !== (r = null == t ? void 0 : t.algorithmPostList) && void 0 !== r ? r : []).map(function(t) {
return t.algorithmId;
}), s = this.hasShangZeng3(a) || this.hasShangZeng3(n) || this.hasShangZeng3(i);
return buildLazyConditionContext({
isFindShangZeng3: function() {
return ASContext(s, "算法列表/降级列表/成功后列表任一包含熵增3");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
shangZheng: [ {
conditions: {
fact: "isFindShangZeng3",
operator: "=",
value: !0
},
flow: "replaceShangZeng3",
platform: "gp",
gameMode: "class"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
shangZheng: {
replaceShangZeng3: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, hs.OFFER_TYPE.SHANG_ZENG_4_IOS ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, hs.OFFER_TYPE.SHANG_ZENG_4_IOS ]
}, {
operator: "AlgorithmStrategyAlgorithmPostListPatchOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, hs.OFFER_TYPE.SHANG_ZENG_4_IOS ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ hs.OFFER_TYPE.SUI_JI_WU_SI ]
} ]
}
};
};
e.prototype.hasShangZeng3 = function(t) {
return t.includes(hs.OFFER_TYPE.SHANG_ZENG_3);
};
return n([ classId("CTRefactorAddSpaceAdd4_classTrait") ], e);
}(Trait);
o.CTRefactorAddSpaceAdd4_classTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAddSpaceAdd4_classTrait" ]);
//# sourceMappingURL=index.js.map
