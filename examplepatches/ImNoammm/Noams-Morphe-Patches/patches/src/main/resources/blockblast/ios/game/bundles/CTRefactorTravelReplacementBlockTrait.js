window.__require = function t(e, o, r) {
function n(i, a) {
if (!o[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(l, !0);
if (c) return c(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var p = o[i] = {
exports: {}
};
e[i][0].call(p.exports, function(t) {
return n(e[i][1][t] || t);
}, p, p.exports, t, e, o, r);
}
return o[i].exports;
}
for (var c = "function" == typeof __require && __require, i = 0; i < r.length; i++) n(r[i]);
return n;
}({
CTRefactorTravelReplacementBlockTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "f4751/ThHNHHpAnlrK+DnsQ", "CTRefactorTravelReplacementBlockTrait");
var r, n = this && this.__extends || (r = function(t, e) {
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
}), c = this && this.__decorate || function(t, e, o, r) {
var n, c = arguments.length, i = c < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (i = (c < 3 ? n(i) : c > 3 ? n(e, o, i) : n(e, o)) || i);
return c > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorTravelReplacementBlockTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.checkNeedReplace = function() {
if (1 !== storage.getItem("chapterRoundNum", 0)) return !1;
if (hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ChapterAlgorithmSourceType.TravelRevive) return !1;
this.checkIsReplace();
return !this.checkIsMask();
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
isNeedReplace: function() {
return ASContext(e.checkNeedReplace(t), "首轮+非复活源+未被 checkIsMask 屏蔽");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isNeedReplace",
operator: "=",
value: !0
},
flow: "replaceBlock"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
replaceBlock: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.TRAVEL_ADD_RANDOM ]
} ]
};
};
e.prototype.checkIsMask = function() {
return !1;
};
e.prototype.checkIsReplace = function() {};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
return buildLazyConditionContext({
isTravelAddRandom: function() {
return ASContext((null == o ? void 0 : o.algorithmId) === hs.OFFER_TYPE_BASE.TRAVEL_ADD_RANDOM, "是否旅行随机增益算法（TRAVEL_ADD_RANDOM）");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isTravelAddRandom",
operator: "=",
value: !0
},
flow: "injectBlock"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
injectBlock: function() {
return {
blockIds: hs.algorithmInfo.blockIdList,
blockNames: hs.algorithmName.algoActualName,
blockPoses: hs.algorithmInfo.blockPosList
};
}
};
};
return c([ classId("CTRefactorTravelReplacementBlockTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorTravelReplacementBlockTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTravelReplacementBlockTrait" ]);
//# sourceMappingURL=index.js.map
