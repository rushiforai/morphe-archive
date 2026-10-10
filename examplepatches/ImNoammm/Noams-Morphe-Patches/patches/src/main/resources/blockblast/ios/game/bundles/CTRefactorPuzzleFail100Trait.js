window.__require = function t(e, r, o) {
function n(a, l) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = r[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return n(e[a][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorPuzzleFail100Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "5f01c78bs5HsZdx/rhZXtzo", "CTRefactorPuzzleFail100Trait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzleFail100Trait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onPreprocessConditionContext = function() {
return buildLazyConditionContext({
isPuzzle100Source: function() {
return ASContext(hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.Puzzle100, "当前一级出题源是否为困难100%");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
Puzzle100: [ {
conditions: {
and: [ {
fact: "isPuzzle100Source",
operator: "=",
value: !0
} ]
},
platform: "gp",
flow: "flow1"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
var t;
return {
mutex: {
Puzzle100: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ null !== (t = this.props.algo) && void 0 !== t ? t : hs.OFFER_TYPE_SHANG.SHANG_ZENG_3 ]
} ]
}
}
};
};
e.prototype.isAlgorithmStrategyIOSShangRefactoredInfoReplace100DifClassToNoBitShangZeng3 = function(t) {
if (hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.Puzzle100) {
var e = t.args[0], r = void 0;
this.props.algo === hs.IOSAlgorithmEnum.EntropyAdd3 && (r = hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit({
isDown: !0
}));
if (!r) return;
var o = e.concat(r);
t.args[0] = o;
}
};
return i([ classId("CTRefactorPuzzleFail100Trait") ], e);
}(Trait);
r.CTRefactorPuzzleFail100Trait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleFail100Trait" ]);
//# sourceMappingURL=index.js.map
