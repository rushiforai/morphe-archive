window.__require = function t(e, r, o) {
function i(a, f) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!f && l) return l(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var h = r[a] = {
exports: {}
};
e[a][0].call(h.exports, function(t) {
return i(e[a][1][t] || t);
}, h, h.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
CTRefactorDifficultDownStrategyTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "cc4827mjNdMwI3lPf9ncXzX", "CTRefactorDifficultDownStrategyTrait");
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var f = t.length - 1; f >= 0; f--) (i = t[f]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, i, n = r.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = n.next()).done; ) a.push(o.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (i) throw i.error;
}
}
return a;
}, f = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(a(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorDifficultDownStrategyTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
if (t && e.SDK_ALGO_TYPE === hs.OFFER_ALGORITHM_SDK_TYPE[hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN]) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.ALGO_DIFFICULT_DOWN, this);
}
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
var e = t.args[0];
hs.algorithmStrategyLogic.insertArrayAlgorithms(e, [ hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT ], this.getAlgorithmList([ hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN ]));
t.args[0] = e;
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
e.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoPuzzleFailTimingBase = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.handleAlgorithmStrategyIOSDifficultRefactoredInfoDownOffer = function(t) {
var e = t.args[0];
e || (e = []);
e.push.apply(e, f(this.getAlgorithmList([ hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN ])));
t.args[0] = e;
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoDownOffer = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDownOffer(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoDifficultDownOffer = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDownOffer(t);
};
e.prototype.getAlgorithmList = function(t) {
return t;
};
return n([ classId("CTRefactorDifficultDownStrategyTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorDifficultDownStrategyTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorDifficultDownStrategyTrait" ]);
//# sourceMappingURL=index.js.map
