window.__require = function t(e, r, o) {
function a(i, s) {
if (!r[i]) {
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
var c = r[i] = {
exports: {}
};
e[i][0].call(c.exports, function(t) {
return a(e[i][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
CTRefactorAddSpaceAdd4Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6dd49Jnl4dMCZgkTakqf1P4", "CTRefactorAddSpaceAdd4Trait");
var o, a = this && this.__extends || (o = function(t, e) {
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
var a, n = arguments.length, i = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, r, i) : a(e, r)) || i);
return n > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAddSpaceAdd4Trait = void 0;
var i = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.LOG_TAG = "[AddSpaceAdd4Trait]";
return e;
}
Object.defineProperty(e.prototype, "replaceTarget", {
get: function() {
return hs.OFFER_TYPE.SHANG_ZENG_4_IOS;
},
enumerable: !1,
configurable: !0
});
e.prototype.onPreprocessConditionContext = function(t) {
var e, r, o, a = (null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : []).map(function(t) {
return t.algorithmId;
}), n = (null !== (r = null == t ? void 0 : t.algorithmFallbackList) && void 0 !== r ? r : []).map(function(t) {
return t.algorithmId;
}), i = (null !== (o = null == t ? void 0 : t.algorithmPostList) && void 0 !== o ? o : []).map(function(t) {
return t.algorithmId;
}), s = a.includes(hs.OFFER_TYPE.SHANG_ZENG_3) || n.includes(hs.OFFER_TYPE.SHANG_ZENG_3) || i.includes(hs.OFFER_TYPE.SHANG_ZENG_3);
return buildLazyConditionContext({
isFindShangZeng: function() {
return ASContext(s, "算法列表是否包含熵增3");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
shangZheng: [ {
conditions: {
fact: "isFindShangZeng",
operator: "=",
value: !0
},
flow: "replaceShangZeng3",
platform: "gp",
gameMode: "class"
}, {
conditions: {
fact: "isFindShangZeng",
operator: "=",
value: !0
},
flow: "replaceShangZeng3",
platform: "gp",
gameMode: "journey"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
shangZheng: {
replaceShangZeng3: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, this.replaceTarget ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, this.replaceTarget ]
}, {
operator: "AlgorithmStrategyAlgorithmPostListPatchOperator",
type: "replace",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3, this.replaceTarget ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ hs.OFFER_TYPE.SUI_JI_WU_SI ]
} ]
}
};
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
var e = t.args[0], r = storage.getItem("classRoundNum", 0) - storage.getItem("classReviveNum", 0);
if (hs.gameInfo.gameMode == hs.GameMode.Class && r <= 10) return e;
var o = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 != e.indexOf(o) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, o, hs.OFFER_TYPE.SHANG_ZENG_4_IOS));
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceChapter = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass(t);
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
var e = t.args[0], r = storage.getItem("classRoundNum", 0) - storage.getItem("classReviveNum", 0);
if (hs.gameInfo.gameMode == hs.GameMode.Class && r <= 10) return e;
var o = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 != e.indexOf(o) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, o, hs.OFFER_TYPE.SHANG_ZENG_4_IOS));
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
return n([ classId("CTRefactorAddSpaceAdd4Trait") ], e);
}(Trait);
r.CTRefactorAddSpaceAdd4Trait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAddSpaceAdd4Trait" ]);
//# sourceMappingURL=index.js.map
