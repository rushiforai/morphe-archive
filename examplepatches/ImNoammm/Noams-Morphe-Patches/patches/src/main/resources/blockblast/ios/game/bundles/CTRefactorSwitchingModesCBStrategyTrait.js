window.__require = function t(e, o, r) {
function n(a, s) {
if (!o[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var l = o[a] = {
exports: {}
};
e[a][0].call(l.exports, function(t) {
return n(e[a][1][t] || t);
}, l, l.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
CTRefactorSwitchingModesCBStrategyTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "42138M2vw5GOarkX6BM+BG7", "CTRefactorSwitchingModesCBStrategyTrait");
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
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, o, a) : n(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorSwitchingModesCBStrategyTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.handleClassGame_ProxyOnClassGameShow = function() {
this.isChangeMode = !1;
this.lastGameMode || (this.lastGameMode = hs.gameInfo.gameMode);
if (hs.gameInfo.gameMode !== this.lastGameMode) {
this.lastGameMode = hs.gameInfo.gameMode;
this.isChangeMode = !0;
}
this.enterGameTime = new Date().getTime();
};
e.prototype.isClassGame_ProxyOnClassGameShow = function(t) {
this.handleClassGame_ProxyOnClassGameShow(t);
};
e.prototype.isChapterGame_ProxyOnChapterGameShow = function(t) {
this.handleClassGame_ProxyOnClassGameShow(t);
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
isSwitchingModeActiveGP: function() {
return ASContext(e.isUseAlgoGP(), "GP-切换模式且在时间窗口内且当前出的是难题");
},
canRunAfterOfferIOS: function() {
return ASContext(e.canRunAfterOffer(t), "iOS 是否可运行 After 后置段");
},
isSwitchingModeActiveIOS: function() {
return ASContext(e.isUseAlgoIOS(), "iOS-切换模式且在时间窗口内且当前出的是难题");
}
});
};
e.prototype.onPostprocessConditionOperators = function() {
return {
iosRandomNoDieAlgo: function(t) {
return !!t && {
status: !0,
data: {
algoList: hs.algorithmStrategyIOSRandomRefactoredInfo.offerBitRandomNoDieBit()
}
};
}
};
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isSwitchingModeActiveGP",
operator: "=",
value: !0
},
event: {
type: "triggerSwitchingModeSuccess"
},
flow: "switchToRandomGP",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "canRunAfterOfferIOS",
operator: "=",
value: !0
}, {
fact: "isSwitchingModeActiveIOS",
operator: "iosRandomNoDieAlgo",
value: !0
} ]
},
event: {
type: "triggerSwitchingModeSuccess"
},
flow: "switchToRandomIOS",
platform: "ios"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
switchToRandomGP: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ]
} ],
switchToRandomIOS: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.iosRandomNoDieAlgo.data.algoList"
} ]
} ]
};
};
e.prototype.triggerSwitchingModeSuccess = function() {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, this);
};
e.prototype.canRunAfterOffer = function() {
return !(1 === storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.isUseAlgoGP = function() {
var t, e, o, r;
if (!this.isChangeMode) return !1;
var n = storage.getItem("classEntryTime", Date.now());
hs.gameInfo.gameMode === hs.GameMode.Chapter && (n = storage.getItem("chapterEntryTime", Date.now()));
if (Date.now() - n >= 6e4) return !1;
var i = hs.algorithmName.algoActualName, a = i.every(function(t) {
return t.includes("困难难题");
}), s = i.every(function(t) {
return t.includes("死亡难题");
}), c = i.every(function(t) {
return t.includes("直觉难题");
}), u = null === (t = i[0]) || void 0 === t ? void 0 : t.includes("难题矩阵"), l = null === (e = i[0]) || void 0 === e ? void 0 : e.includes("极其困难难题"), f = (null !== (r = null === (o = i[0]) || void 0 === o ? void 0 : o.indexOf("难题")) && void 0 !== r ? r : -1) >= 0;
return !!(a || s || c || u || l || f);
};
e.prototype.isUseAlgoIOS = function() {
var t, e, o, r;
if (!this.isChangeMode) return !1;
if (Date.now() - this.enterGameTime >= 1e3 * (null !== (t = this.props.time) && void 0 !== t ? t : 60)) return !1;
var n = hs.algorithmName.algoActualName, i = n.every(function(t) {
return "困难难题" === t;
}), a = n.every(function(t) {
return "死亡难题" === t;
}), s = n.every(function(t) {
return "直觉难题" === t;
}), c = null === (e = n[0]) || void 0 === e ? void 0 : e.includes("难题矩阵"), u = null === (o = n[0]) || void 0 === o ? void 0 : o.includes("极其困难难题"), l = null === (r = n[0]) || void 0 === r ? void 0 : r.includes("多活路难题");
return !!(i || a || s || c || u || l);
};
e.prototype.setEnterGameTime = function(t) {
this.enterGameTime = t;
};
e.prototype.getEnterGameTime = function() {
return this.enterGameTime;
};
return i([ classId("CTRefactorSwitchingModesCBStrategyTrait") ], e);
}(Trait);
o.CTRefactorSwitchingModesCBStrategyTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorSwitchingModesCBStrategyTrait" ]);
//# sourceMappingURL=index.js.map
