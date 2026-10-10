window.__require = function t(r, e, o) {
function i(f, s) {
if (!e[f]) {
if (!r[f]) {
var c = f.split("/");
c = c[c.length - 1];
if (!r[c]) {
var a = "function" == typeof __require && __require;
if (!s && a) return a(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = c;
}
var u = e[f] = {
exports: {}
};
r[f][0].call(u.exports, function(t) {
return i(r[f][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[f].exports;
}
for (var n = "function" == typeof __require && __require, f = 0; f < o.length; f++) i(o[f]);
return i;
}({
CTRefactorFirstRoundSpiceOfferTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "9d764fV+vNHLYM18Fvkbdpf", "CTRefactorFirstRoundSpiceOfferTrait");
var o, i = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), n = this && this.__decorate || function(t, r, e, o) {
var i, n = arguments.length, f = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (f = (n < 3 ? i(f) : n > 3 ? i(r, e, f) : i(r, e)) || f);
return n > 3 && f && Object.defineProperty(r, e, f), f;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFirstRoundSpiceOfferTrait = void 0;
var f = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(r.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
r.prototype.isCTRefactorFinalModifyBlockIOSTraitCheckGuaranteedBlock = function(t) {
var r, e = t.args[0];
(null === (r = null == e ? void 0 : e.sdk) || void 0 === r ? void 0 : r.actualAlgorithmId) === hs.OFFER_TYPE_BLANK.ALGO_FILL_REPEAT && (t.args[1] = !0);
};
r.prototype.isCTRefactorFinalBlockCheckTraitCheckGuaranteedBlock = function() {};
r.prototype.isCTRefactorFinalBlockCheckIOSTraitSaveReplaceStep2 = function(t) {
hs.algorithmName.algoActualId === hs.OFFER_TYPE.ALGO_FILL_REPEAT && (t.args[2] = !1);
};
r.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isFirstRoundSpiceOfferHit: function() {
return ASContext(t.isFirstRoundSpiceOfferHit(), "无尽首轮趣味性是否命中");
},
isFirstRoundSpiceOfferHitGP: function() {
return ASContext(t.isFirstRoundSpiceOfferHitGP(), "无尽首轮趣味性是否命中(gp)");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoFirstRound: [ {
conditions: {
fact: "isFirstRoundSpiceOfferHit",
operator: "=",
value: !0
},
event: {
type: "triggerFirstRoundSpiceOffer"
},
flow: "firstRoundSpiceOffer",
platform: "ios",
gameMode: "class"
} ],
AlgoTrait: [ {
conditions: {
fact: "isFirstRoundSpiceOfferHitGP",
operator: "=",
value: !0
},
event: {
type: "triggerFirstRoundSpiceOfferGP"
},
flow: "firstRoundSpiceOfferGP",
platform: "gp",
gameMode: "class"
} ]
}
};
};
r.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoFirstRound: {
firstRoundSpiceOffer: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ hs.OFFER_TYPE_BLANK.ALGO_FILL_REPEAT ]
} ]
},
AlgoTrait: {
firstRoundSpiceOfferGP: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ hs.OFFER_TYPE_BLANK.ALGO_FILL_REPEAT ]
} ]
}
}
};
};
r.prototype.updateProbability = function(t) {
return t;
};
r.prototype.onTriggered = function() {};
r.prototype.skipTrait = function() {
return !1;
};
r.prototype.triggerFirstRoundSpiceOffer = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoFirstRound);
this.onTriggered();
};
r.prototype.triggerFirstRoundSpiceOfferGP = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoFirstRound);
this.onTriggered();
};
r.prototype.onAlgorithmStrategySDKBefore = function() {
var t = this;
if (hs.gameInfo.gameMode === hs.GameMode.Class && 1 === hs.classGameInfo.roundNum && as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList.some(function(r) {
return r.traitSource === t.traitName && r.algorithmId === hs.OFFER_TYPE_BLANK.ALGO_FILL_REPEAT;
})) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.SUI_JI, this);
}
};
r.prototype.isFirstRoundSpiceOfferHit = function() {
return this.isFirstRoundSpiceOfferHitForPlatform("ios");
};
r.prototype.isFirstRoundSpiceOfferHitGP = function() {
return this.isFirstRoundSpiceOfferHitForPlatform("gp");
};
r.prototype.isFirstRoundSpiceOfferHitForPlatform = function(t) {
if ("gp" === t) return !1;
if (1 !== hs.classGameInfo.roundNum) return !1;
if ("ios" === t && this.skipTrait()) return !1;
if (Math.random() > this.updateProbability(.8)) return !1;
var r = new hs.BinaryBoard();
r.convertToBinaryBoard(hs.boardInfo.faceBlocks);
return r.isEmpty();
};
return n([ classId("CTRefactorFirstRoundSpiceOfferTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorFirstRoundSpiceOfferTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstRoundSpiceOfferTrait" ]);
//# sourceMappingURL=index.js.map
