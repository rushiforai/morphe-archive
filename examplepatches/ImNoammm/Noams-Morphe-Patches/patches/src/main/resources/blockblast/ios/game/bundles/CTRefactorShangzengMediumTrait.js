window.__require = function t(e, r, o) {
function n(i, g) {
if (!r[i]) {
if (!e[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!e[s]) {
var h = "function" == typeof __require && __require;
if (!g && h) return h(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var f = r[i] = {
exports: {}
};
e[i][0].call(f.exports, function(t) {
return n(e[i][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorShangzengMediumTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "9d6a74iO09MjpWhfjxviy1K", "CTRefactorShangzengMediumTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var g = t.length - 1; g >= 0; g--) (n = t[g]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, r, i) : n(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorShangzengMediumTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
var e = t.args[0], r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
if (-1 != e.indexOf(r)) {
var o = this.getShangZengMediumAlgo(t);
if (o === hs.OFFER_TYPE.HIGH_NEAR) {
t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], o);
t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], hs.OFFER_TYPE.SHANG_ZEND_MEDIUM);
} else t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], o);
}
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceClass = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplaceChapter = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplaceClass(t);
};
e.prototype.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
var e = t.args[0], r = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
if (-1 != e.indexOf(r)) {
var o = this.getShangZengMediumAlgo(t);
if (o === hs.OFFER_TYPE.HIGH_NEAR) {
t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], o);
t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], hs.OFFER_TYPE.SHANG_ZEND_MEDIUM);
} else t.args[0] = hs.algorithmStrategyLogic.insertAlgorithms(e, [ r ], o);
}
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetDayNightLess3000DifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetInterestCurveDifClassToNoBitShangZeng3 = function(t) {
this.handleAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3(t);
};
e.prototype.getShangZengMediumAlgo = function() {
return hs.OFFER_TYPE.SHANG_ZEND_MEDIUM;
};
return a([ classId("CTRefactorShangzengMediumTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorShangzengMediumTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorShangzengMediumTrait" ]);
//# sourceMappingURL=index.js.map
