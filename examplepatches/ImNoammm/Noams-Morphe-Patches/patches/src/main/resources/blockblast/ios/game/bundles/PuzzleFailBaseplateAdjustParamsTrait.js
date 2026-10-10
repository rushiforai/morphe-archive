window.__require = function t(e, r, a) {
function i(l, s) {
if (!r[l]) {
if (!e[l]) {
var n = l.split("/");
n = n[n.length - 1];
if (!e[n]) {
var h = "function" == typeof __require && __require;
if (!s && h) return h(n, !0);
if (o) return o(n, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = n;
}
var u = r[l] = {
exports: {}
};
e[l][0].call(u.exports, function(t) {
return i(e[l][1][t] || t);
}, u, u.exports, t, e, r, a);
}
return r[l].exports;
}
for (var o = "function" == typeof __require && __require, l = 0; l < a.length; l++) i(a[l]);
return i;
}({
PuzzleFailBaseplateAdjustParamsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "75cf5bc/vZNQ5K1HSrCPrpy", "PuzzleFailBaseplateAdjustParamsTrait");
var a, i = this && this.__extends || (a = function(t, e) {
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
}), o = this && this.__decorate || function(t, e, r, a) {
var i, o = arguments.length, l = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (l = (o < 3 ? i(l) : o > 3 ? i(e, r, l) : i(e, r)) || l);
return o > 3 && l && Object.defineProperty(e, r, l), l;
}, l = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var a, i, o = r.call(t), l = [];
try {
for (;(void 0 === e || e-- > 0) && !(a = o.next()).done; ) l.push(a.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
a && !a.done && (r = o.return) && r.call(o);
} finally {
if (i) throw i.error;
}
}
return l;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(l(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PuzzleFailBaseplateAdjustParamsTrait = void 0;
var n = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isClassAlgorithmStrategyIOS_Deal_ProxyPostPreprocessing(t)) {
t.disable([ "PuzzleFailBaseplateTrait" ]);
this.triggerPuzzleFailBaseplate();
}
};
e.prototype.triggerPuzzleFailBaseplate = function() {
var t, e;
if (hs.algorithmStrategyInfo.algorithmSourceLevel1 != hs.ClassAlgorithmSourceType.Puzzle100 && hs.algorithmStrategyInfo.algorithmSourceLevel1 != hs.ClassAlgorithmSourceType.PuzzleTimeFirst && hs.algorithmStrategyInfo.algorithmSourceLevel1 != hs.ClassAlgorithmSourceType.PuzzleTimeOther && (hs.algorithmStrategyInfo.algorithmSourceLevel1 != hs.ClassAlgorithmSourceType.AlgoTrait || "InterestCurveOfferTrait" != hs.algorithmStrategyInfo.algorithmSourceLevel2 && "InterestCurveOfferAdjustParamsTrait" != hs.algorithmStrategyInfo.algorithmSourceLevel2)) {
var r = !1;
s(hs.algorithmStrategyInfo.algorithmList).forEach(function(t) {
hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY) && (r = !0);
});
if (r) {
for (var a = this.props, i = a.algos, o = a.scores, l = hs.scoreInfo.highRecordScore, n = 0; n < o.length; n++) if (l <= o[n] || l > o[o.length - 1]) {
if (this.newType && hs.isValueInEnum(i[n], hs.OFFER_TYPE)) {
hs.algorithmStrategyInfo.setAlgorithmList(this.updateIOSAlgoIdList(i[n]));
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(i[n], "PuzzleFailBaseplateAdjustParamsTrait", i[n]);
} else if (i[n] == hs.IOSAlgorithmEnum.PuzzleHard) {
hs.algorithmStrategyInfo.setAlgorithmList(hs.algorithmStrategyIOSDifficultInfo.laneBitKunNanNanti());
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4, "PuzzleFailBaseplateAdjustParamsTrait", hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4);
} else if (i[n] == hs.IOSAlgorithmEnum.PuzzleIntuition) {
hs.algorithmStrategyInfo.setAlgorithmList(hs.algorithmStrategyIOSDifficultInfo.laneBitZhiJueNanTi());
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.ZHI_JUE_NAN_TI, "PuzzleFailBaseplateAdjustParamsTrait", hs.OFFER_TYPE.ZHI_JUE_NAN_TI);
} else if (i[n] == hs.IOSAlgorithmEnum.RandomNoDead) {
hs.algorithmStrategyInfo.setAlgorithmList(hs.algorithmStrategyIOSRandomInfo.offerBitRandomNoDieBit());
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.IOS_SUI_JI_WU_SI, "PuzzleFailBaseplateAdjustParamsTrait", hs.OFFER_TYPE.IOS_SUI_JI_WU_SI);
}
break;
}
if ((null === (t = TRAIT("PuzzleFailTimingTrait")) || void 0 === t ? void 0 : t.active) || (null === (e = TRAIT("PuzzleFailTimingAdjustParamsTrait")) || void 0 === e ? void 0 : e.active)) hs.algorithmStrategyIOSDifficultInfo.puzzleFailTiming(); else {
var h = hs.algorithmStrategyIOSShangInfo.get100DifClassToNoBitShangZeng3({
isDown: !0
}), u = hs.algorithmStrategyInfo.algorithmFailList.concat(h);
hs.algorithmStrategyInfo.setAlgorithmFailList(u);
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT, "PuzzleFailBaseplateAdjustParamsTrait", hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT);
}
}
}
};
e.prototype.updateIOSAlgoIdList = function(t) {
switch (t) {
case hs.OFFER_TYPE.IOS_SUI_JI_WU_SI:
case hs.OFFER_TYPE.SUI_JI_WU_SI:
return hs.algorithmStrategyIOSRandomInfo.offerBitRandomNoDieBit();

case hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT:
return hs.algorithmStrategyIOSShangInfo.offerShangZeng3();

case hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU:
return hs.algorithmStrategyIOSBlankInfo.offer();

case hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT:
return hs.algorithmStrategyIOSBlankInfo.offerNoBit();

case hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT:
return hs.algorithmStrategyIOSBlankInfo.offerBitTravelTianKongXiaoChu();

case hs.OFFER_TYPE.KUN_NAN_NAN_TI:
case hs.OFFER_TYPE.KUN_NAN_TI:
return hs.algorithmStrategyIOSDifficultInfo.offerBitKunNanNanTi();

case hs.OFFER_TYPE.IOS_ZHI_JUE_BIT:
return hs.algorithmStrategyIOSDifficultInfo.offerBitZhiJueNanTi();

case hs.OFFER_TYPE.SUI_JI:
return hs.algorithmStrategyIOSRandomInfo.offerRandom();

case hs.OFFER_TYPE.IOS_ZHI_JUE_NOT_BIT:
return hs.algorithmStrategyIOSDifficultInfo.offerNoBitZhiJueNanTi();

case hs.OFFER_TYPE.VERY_DIFFICULT_HARD:
return hs.algorithmStrategyIOSDifficultInfo.offerBitJiJiKunNanNanTi();
}
return [ t ];
};
e.prototype.updatePuzzleFailPuzzleHard = function(t, e) {
hs.algorithmStrategyInfo.setAlgorithmList(t);
hs.algorithmStrategyInfo.setAlgorithmFailList(e);
};
Object.defineProperty(e.prototype, "newType", {
get: function() {
var t, e;
return 1 === (null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.newType) && void 0 !== e ? e : 0);
},
enumerable: !1,
configurable: !0
});
o([ hs.Algorithm() ], e.prototype, "onActive", null);
return o([ classId("PuzzleFailBaseplateAdjustParamsTrait"), classMethodWatch() ], e);
}(Trait);
r.PuzzleFailBaseplateAdjustParamsTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "PuzzleFailBaseplateAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
