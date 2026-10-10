window.__require = function t(r, o, e) {
function n(i, l) {
if (!o[i]) {
if (!r[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!r[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var f = o[i] = {
exports: {}
};
r[i][0].call(f.exports, function(t) {
return n(r[i][1][t] || t);
}, f, f.exports, t, r, o, e);
}
return o[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < e.length; i++) n(e[i]);
return n;
}({
CTRefactorDifficultDownStrategy_classTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "f3a8cLRe05PkZwGLY5aGzx/", "CTRefactorDifficultDownStrategy_classTrait");
var e, n = this && this.__extends || (e = function(t, r) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
})(t, r);
}, function(t, r) {
e(t, r);
function o() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (o.prototype = r.prototype, new o());
}), a = this && this.__decorate || function(t, r, o, e) {
var n, a = arguments.length, i = a < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, r, o, e); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (i = (a < 3 ? n(i) : a > 3 ? n(r, o, i) : n(r, o)) || i);
return a > 3 && i && Object.defineProperty(r, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorDifficultDownStrategy_classTrait = void 0;
var i = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isAlgorithmStrategyIOSShangRefactoredInfoGetInterestCurveDifClassToNoBitShangZeng3 = function(t) {
var r, o = null === (r = t.args) || void 0 === r ? void 0 : r[1];
(null == o ? void 0 : o.isDown) && this.insertDifficultDownBeforeEntropy3(t);
};
r.prototype.insertDifficultDownBeforeEntropy3 = function(t) {
var r = t.args[0];
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT ], hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN);
t.args[0] = r;
};
r.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
shouldAppendEntropy3Fallback: function() {
return t.shouldAppendEntropy3Fallback();
},
shouldInjectDifficultDownOnHardTail: function() {
return t.shouldInjectDifficultDownOnHardTail();
}
};
};
r.prototype.onPreprocessConditions = function() {
return {
base: [ {
conditions: {
fact: "operator.shouldAppendEntropy3Fallback",
operator: "=",
value: !0
},
flow: "appendEntropy3Fallback",
platform: "all",
gameMode: "class"
} ],
baseAfter: [ {
conditions: {
fact: "operator.shouldInjectDifficultDownOnHardTail",
operator: "=",
value: !0
},
flow: "injectDifficultDownOnHardTail",
platform: "all",
gameMode: "class"
} ]
};
};
r.prototype.onPreprocessActions = function() {
return {
base: {
appendEntropy3Fallback: [ {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ hs.OFFER_TYPE.SHANG_ZENG_3 ]
} ]
},
baseAfter: {
injectDifficultDownOnHardTail: [ {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "unshift",
args: [ hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN ]
} ]
}
};
};
r.prototype.shouldAppendEntropy3Fallback = function() {
var t;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
var r = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList;
if (as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList.length > 0 || 0 === r.length) return !1;
var o = null === (t = r[r.length - 1]) || void 0 === t ? void 0 : t.algorithmId;
return null != o && (hs.isValueInEnum(o, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(o, hs.OFFER_TYPE_DIE));
};
r.prototype.shouldInjectDifficultDownOnHardTail = function() {
var t;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
var r = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList;
if (0 === r.length) return !1;
var o = null === (t = r[r.length - 1]) || void 0 === t ? void 0 : t.algorithmId;
return null != o && hs.isValueInEnum(o, hs.OFFER_TYPE_DIFFICULTY);
};
r.TAG = "[CTRefactorDifficultDownStrategy_classTrait]";
return a([ classId("CTRefactorDifficultDownStrategy_classTrait"), classMethodWatch() ], r);
}(Trait);
o.CTRefactorDifficultDownStrategy_classTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorDifficultDownStrategy_classTrait" ]);
//# sourceMappingURL=index.js.map
