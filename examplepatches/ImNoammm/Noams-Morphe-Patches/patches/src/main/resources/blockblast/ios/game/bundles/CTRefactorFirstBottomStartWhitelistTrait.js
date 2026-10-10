window.__require = function t(r, o, e) {
function n(a, s) {
if (!o[a]) {
if (!r[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!r[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = o[a] = {
exports: {}
};
r[a][0].call(f.exports, function(t) {
return n(r[a][1][t] || t);
}, f, f.exports, t, r, o, e);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < e.length; a++) n(e[a]);
return n;
}({
CTRefactorFirstBottomStartWhitelistTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "cf1865kmDxIJZjecmCr5S45", "CTRefactorFirstBottomStartWhitelistTrait");
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
}), i = this && this.__decorate || function(t, r, o, e) {
var n, i = arguments.length, a = i < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, o, e); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, o, a) : n(r, o)) || a);
return i > 3 && a && Object.defineProperty(r, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorFirstBottomStartWhitelistTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
cannotRunBottomOfferStart: function() {
return ASContext(t.cannotRunBottomOfferStart(), "首轮且 AlgoFirstRound，updateBottomOfferStartList 穿参为 false");
}
});
};
r.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "cannotRunBottomOfferStart",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableBottomStartWhenFirstAlgoFirstRound"
} ];
};
r.prototype.onPostprocessActions = function() {
return {
disableBottomStartWhenFirstAlgoFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
r.prototype.cannotRunBottomOfferStart = function() {
var t = hs.storage.getItem("classRoundNum", 0), r = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
return 1 === t && r === hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
return i([ classId("CTRefactorFirstBottomStartWhitelistTrait") ], r);
}(Trait);
o.CTRefactorFirstBottomStartWhitelistTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstBottomStartWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
