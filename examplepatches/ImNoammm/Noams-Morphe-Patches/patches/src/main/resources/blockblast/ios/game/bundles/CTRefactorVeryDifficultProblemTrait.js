window.__require = function t(r, e, i) {
function o(n, f) {
if (!e[n]) {
if (!r[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!r[c]) {
var s = "function" == typeof __require && __require;
if (!f && s) return s(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var _ = e[n] = {
exports: {}
};
r[n][0].call(_.exports, function(t) {
return o(r[n][1][t] || t);
}, _, _.exports, t, r, e, i);
}
return e[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < i.length; n++) o(i[n]);
return o;
}({
CTRefactorVeryDifficultProblemTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "8c5d2qRP3tOYpShfTucXy5q", "CTRefactorVeryDifficultProblemTrait");
var i, o = this && this.__extends || (i = function(t, r) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
i(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), a = this && this.__decorate || function(t, r, e, i) {
var o, a = arguments.length, n = a < 3 ? r : null === i ? i = Object.getOwnPropertyDescriptor(r, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, r, e, i); else for (var f = t.length - 1; f >= 0; f--) (o = t[f]) && (n = (a < 3 ? o(n) : a > 3 ? o(r, e, n) : o(r, e)) || n);
return a > 3 && n && Object.defineProperty(r, e, n), n;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorVeryDifficultProblemTrait = void 0;
var n = function(t) {
o(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLess3000ScoreBitZhiJueNanTi = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.ZHI_JUE_NAN_TI ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceBitKunNanNanti = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4 ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoMore3000ScoreBitVeryDifficulty = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.VERY_KUN_NAN_TI_1 ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoReplaceClassDifficultyOptimise = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.IOS_KUN_NAN_OPTIMIZE ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceNoBitKunNanNanti = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4 ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceBitZhiJueNanTi = function(t) {
var r = t.args[0];
this.addNameMapping();
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.ZHI_JUE_NAN_TI ], hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoDiffDownOffer = function(t) {
var r = t.args[0];
r || (r = []);
this.addNameMapping();
r.push(hs.OFFER_TYPE.VERY_DIFFICULT_HARD);
t.args[0] = r;
};
r.prototype.addNameMapping = function() {
var t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == t ? void 0 : t.active) && t.addAlgorithmNameMapping(hs.OFFER_TYPE.VERY_DIFFICULT_HARD, "CTRefactorVeryDifficultProblemTrait", null, "极其困难难题,极其困难难题,极其困难难题");
};
return a([ classId("CTRefactorVeryDifficultProblemTrait") ], r);
}(Trait);
e.CTRefactorVeryDifficultProblemTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorVeryDifficultProblemTrait" ]);
//# sourceMappingURL=index.js.map
