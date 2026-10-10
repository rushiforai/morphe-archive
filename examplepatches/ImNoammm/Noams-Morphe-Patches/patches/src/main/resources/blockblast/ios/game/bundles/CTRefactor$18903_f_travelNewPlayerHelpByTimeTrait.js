window.__require = function t(e, r, a) {
function o(n, s) {
if (!r[n]) {
if (!e[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!e[l]) {
var p = "function" == typeof __require && __require;
if (!s && p) return p(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var c = r[n] = {
exports: {}
};
e[n][0].call(c.exports, function(t) {
return o(e[n][1][t] || t);
}, c, c.exports, t, e, r, a);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < a.length; n++) o(a[n]);
return o;
}({
CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "ca1c8olJhZHjbjm5UCKOYdV", "CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait");
var a, o = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, a) {
var o, i = arguments.length, n = i < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (n = (i < 3 ? o(n) : i > 3 ? o(e, r, n) : o(e, r)) || n);
return i > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait = void 0;
var n = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.algoId = -1;
return e;
}
e.prototype.data = function() {
return {
chapter: 0,
chapterFailMap: new Map(storage.getItem("travelNewPlayerHelpByTime", []))
};
};
e.prototype.isTrigger = function() {
var t = storage.getItem("chapterPeriodsBeginTime", 0);
if (Date.now() - t <= 0) return !1;
var e = Math.ceil((Date.now() - t) / 864e5);
if (e > 2) return !1;
var r = e <= 1 ? 2 : 5;
return !(this.getFailTimes(this.state.chapter) < r) && (hs.algorithmName.algoActualName.every(function(t) {
return t === hs.ALGO_NAME_TYPE.NAME_KUN_NAN_TI;
}) || hs.algorithmName.algoActualName.every(function(t) {
return t === hs.ALGO_NAME_TYPE.NAME_DIFFICULTY;
}));
};
e.prototype.isTravelTraitCondition = function() {
var t = TRAIT("CTRefactorTravelDifficultWithDayAndLevelTrait");
return !((null == t ? void 0 : t.active) && t.hasDifficultDelta(hs.chapterGameInfo.chapterNum));
};
e.prototype.updateAlgoId = function() {
var t, e;
this.algoId = -1;
if (this.state.chapter <= 30) {
this.algoId = hs.OFFER_TYPE.SUI_JI_WU_SI;
null === (t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait")) || void 0 === t || t.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait", null, null, hs.OFFER_TYPE.SUI_JI_WU_SI);
} else if (this.state.chapter <= 96) {
this.algoId = hs.OFFER_TYPE.SI_WANG;
null === (e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait")) || void 0 === e || e.addAlgorithmNameMapping(hs.OFFER_TYPE.SI_WANG, "CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait", null, null, hs.OFFER_TYPE.SI_WANG);
}
};
e.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
resolvedHelpAlgo: function() {
if (!t.isTrigger()) return ASContext(-1, "帮扶未触发");
if (!t.isTravelTraitCondition()) return ASContext(-1, "《根据旅行剩余天数增加难度》屏蔽本特性");
t.updateAlgoId();
return ASContext(t.algoId, "帮扶替换算法ID");
}
});
};
e.prototype.onPostprocessConditionOperators = function() {
return {
postOperator: function(t) {
return {
status: -1 !== t,
data: {
algorithmId: t
}
};
}
};
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunJourneyNonFirstRoundPostprocess",
operator: "=",
value: !0
}, {
fact: "resolvedHelpAlgo",
operator: "postOperator",
value: !0
} ]
},
flow: "flow1",
platform: "ios",
gameMode: "journey"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.postOperator.data.algorithmId"
} ]
} ]
};
};
e.prototype.isChapterAlgorithmLifeCycle_GameStart_ProxyOnGameStart = function() {
this.state.chapterFailMap = new Map(storage.getItem("travelNewPlayerHelpByTime", []));
this.state.chapter = hs.chapterGameInfo.chapterNum + 1;
};
e.prototype.isChapterAlgorithmLifeCycle_GameEnd_ProxyOnGameEnd = function() {
hs.gameOverGameInfo.isChapterWin || this.setFailData();
};
e.prototype.isCTRefactorChapterAlgoStrategyTraitUpdateLevelHelpState = function(t) {
this.isNoOtherHelp() && (t.args[0] = !1);
};
e.prototype.isNoOtherHelp = function() {
var t = storage.getItem("chapterPeriodsBeginTime", 0);
return !(Date.now() - t <= 0) && Math.ceil((Date.now() - t) / 864e5) <= 2;
};
e.prototype.getFailTimes = function(t) {
return this.state.chapterFailMap.has(t) ? this.state.chapterFailMap.get(t) : 0;
};
e.prototype.setFailData = function() {
var t = storage.getItem("chapterPeriodsBeginTime", 0);
if (!(Date.now() - t <= 0 || Math.ceil((Date.now() - t) / 864e5) > 2)) {
this.state.chapterFailMap.has(this.state.chapter) ? this.state.chapterFailMap.set(this.state.chapter, this.getFailTimes(this.state.chapter) + 1) : this.state.chapterFailMap.set(this.state.chapter, 1);
storage.setItem("travelNewPlayerHelpByTime", Array.from(this.state.chapterFailMap.entries()));
}
};
return i([ classId("CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait") ], e);
}(Trait);
r.CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$18903_f_travelNewPlayerHelpByTimeTrait" ]);
//# sourceMappingURL=index.js.map
