window.__require = function t(e, r, o) {
function n(i, c) {
if (!r[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var p = "function" == typeof __require && __require;
if (!c && p) return p(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var s = r[i] = {
exports: {}
};
e[i][0].call(s.exports, function(t) {
return n(e[i][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorAddSpaceAdd4_journeyTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "47460bDG89OvozZkUq18HbD", "CTRefactorAddSpaceAdd4_journeyTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var n, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, r, i) : n(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAddSpaceAdd4_journeyTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "replaceTarget", {
get: function() {
return hs.OFFER_TYPE.SHANG_ZENG_4_IOS;
},
enumerable: !1,
configurable: !0
});
e.prototype.onPreprocessConditionContext = function(t) {
var e, r, o, n = (null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : []).map(function(t) {
return t.algorithmId;
}), a = (null !== (r = null == t ? void 0 : t.algorithmFallbackList) && void 0 !== r ? r : []).map(function(t) {
return t.algorithmId;
}), i = (null !== (o = null == t ? void 0 : t.algorithmPostList) && void 0 !== o ? o : []).map(function(t) {
return t.algorithmId;
}), c = n.includes(hs.OFFER_TYPE.SHANG_ZENG_3) || a.includes(hs.OFFER_TYPE.SHANG_ZENG_3) || i.includes(hs.OFFER_TYPE.SHANG_ZENG_3);
return buildLazyConditionContext({
isFindShangZeng: function() {
return ASContext(c, "算法列表/降级列表/成功后列表任一包含熵增3");
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
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceChapter = function(t) {
var e = t.args[0], r = storage.getItem("classRoundNum", 0) - storage.getItem("classReviveNum", 0);
if (hs.gameInfo.gameMode == hs.GameMode.Class && r <= 10) return e;
var o = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
-1 != e.indexOf(o) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(e, o, hs.OFFER_TYPE.SHANG_ZENG_4_IOS));
};
return a([ classId("CTRefactorAddSpaceAdd4_journeyTrait") ], e);
}(Trait);
r.CTRefactorAddSpaceAdd4_journeyTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAddSpaceAdd4_journeyTrait" ]);
//# sourceMappingURL=index.js.map
