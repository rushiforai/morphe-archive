window.__require = function t(e, r, o) {
function i(n, s) {
if (!r[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var l = r[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return i(e[n][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorFixIosNewAlgorithmStrategyTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "57c24G+UDZOJ4ywZRbVBjSh", "CTRefactorFixIosNewAlgorithmStrategyTrait");
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
}), a = this && this.__decorate || function(t, e, r, o) {
var i, a = arguments.length, n = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, r, n) : i(e, r)) || n);
return a > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFixIosNewAlgorithmStrategyTrait = void 0;
var n = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.handleCTRefactorAlgoFillSortEdgeIOSTraitUpdateReplace = function(t) {
if (t.args[0] && this.increaseIsValid()) {
t.args[0] = !1;
t.returnValue = !1;
t.replace = !0;
}
};
e.prototype.isCTRefactorAlgoFillSortEdgeIOSTraitUpdateReplace = function(t) {
this.handleCTRefactorAlgoFillSortEdgeIOSTraitUpdateReplace(t);
};
e.prototype.isAlgoFillSortEdgeIOSAdjustParamsTraitUpdateReplace = function(t) {
this.handleCTRefactorAlgoFillSortEdgeIOSTraitUpdateReplace(t);
};
e.prototype.isCTRefactorInterestCurveOfferTraitUpdateUse = function(t) {
t.args[0] = !0;
};
e.prototype.isInterestCurveOfferAdjustParamsTraitUpdateUse = function(t) {
t.args[0] = !0;
};
e.prototype.isCTRefactorFirstRoundBlockTraitUseTrigger = function(t) {
t.args[1] = !0;
};
e.prototype.isFirstRoundBlockAdjustParamsTraitUseTrigger = function(t) {
t.args[1] = !0;
};
e.prototype.isCTRefactorFirstRoundBlockTraitUpdateRoundId = function(t) {
t.args[0] = this.getCurrentRoundNum();
};
e.prototype.isFirstRoundBlockAdjustParamsTraitUpdateRoundId = function(t) {
t.args[0] = this.getCurrentRoundNum();
};
e.prototype.increaseIsValid = function() {
var t = this.getActiveAlgorithmIds(), e = hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_RANDOM;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var r = TRAIT("CTRefactorAlgorithmIncreaseVariance_classTrait");
if (null == r ? void 0 : r.active) return t.includes(e);
}
if (hs.gameInfo.gameMode === hs.GameMode.Chapter) {
var o = TRAIT("CTRefactorAlgorithmIncreaseVariance_journeyTrait");
if (null == o ? void 0 : o.active) return t.includes(e);
}
var i = TRAIT("AlgorithmIncreaseVarianceTrait");
return !(null == i || !i.active) && t.includes(e);
};
e.prototype.getActiveAlgorithmIds = function() {
var t = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList;
return t && t.length > 0 ? t.map(function(t) {
return t.algorithmId;
}) : [];
};
e.prototype.getCurrentRoundNum = function() {
return hs.gameInfo.gameMode === hs.GameMode.Chapter ? storage.getItem("chapterRoundNum", 0) : hs.gameInfo.gameMode === hs.GameMode.Class ? storage.getItem("classRoundNum", 0) : 0;
};
return a([ classId("CTRefactorFixIosNewAlgorithmStrategyTrait") ], e);
}(Trait);
r.CTRefactorFixIosNewAlgorithmStrategyTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFixIosNewAlgorithmStrategyTrait" ]);
//# sourceMappingURL=index.js.map
