window.__require = function t(r, o, e) {
function n(a, s) {
if (!o[a]) {
if (!r[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!r[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var p = o[a] = {
exports: {}
};
r[a][0].call(p.exports, function(t) {
return n(r[a][1][t] || t);
}, p, p.exports, t, r, o, e);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < e.length; a++) n(e[a]);
return n;
}({
CTRefactorFirstBottomStartIOSChapterWhitelistTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "d19dbQ/w6pOfosztMelS8ix", "CTRefactorFirstBottomStartIOSChapterWhitelistTrait");
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
o.CTRefactorFirstBottomStartIOSChapterWhitelistTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isFirstRoundCannotRunBottomStart: function() {
return ASContext(t.isFirstRound(), "首轮，updateBottomOfferStartList 穿参为 false");
}
});
};
r.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isFirstRoundCannotRunBottomStart",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
flow: "disableBottomStartWhenFirstRound"
} ];
};
r.prototype.onPostprocessActions = function() {
return {
disableBottomStartWhenFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
r.prototype.isFirstRound = function() {
return 1 === hs.storage.getItem("chapterRoundNum", 0);
};
return i([ classId("CTRefactorFirstBottomStartIOSChapterWhitelistTrait") ], r);
}(Trait);
o.CTRefactorFirstBottomStartIOSChapterWhitelistTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstBottomStartIOSChapterWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
