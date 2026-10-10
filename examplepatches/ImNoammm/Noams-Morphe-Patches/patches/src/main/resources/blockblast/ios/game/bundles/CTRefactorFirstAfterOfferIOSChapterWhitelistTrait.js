window.__require = function t(r, e, o) {
function n(f, s) {
if (!e[f]) {
if (!r[f]) {
var u = f.split("/");
u = u[u.length - 1];
if (!r[u]) {
var a = "function" == typeof __require && __require;
if (!s && a) return a(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = u;
}
var c = e[f] = {
exports: {}
};
r[f][0].call(c.exports, function(t) {
return n(r[f][1][t] || t);
}, c, c.exports, t, r, e, o);
}
return e[f].exports;
}
for (var i = "function" == typeof __require && __require, f = 0; f < o.length; f++) n(o[f]);
return n;
}({
CTRefactorFirstAfterOfferIOSChapterWhitelistTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "009b6583M5CzqpdCZPBjUg8", "CTRefactorFirstAfterOfferIOSChapterWhitelistTrait");
var o, n = this && this.__extends || (o = function(t, r) {
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
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, f = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (f = (i < 3 ? n(f) : i > 3 ? n(r, e, f) : n(r, e)) || f);
return i > 3 && f && Object.defineProperty(r, e, f), f;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFirstAfterOfferIOSChapterWhitelistTrait = void 0;
var f = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isFirstRoundCannotRunAfterOffer: function() {
return ASContext(t.isFirstRound(), "首轮，updateAfterOfferList 穿参为 false");
}
});
};
r.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isFirstRoundCannotRunAfterOffer",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
flow: "disableAfterOfferWhenFirstRound"
} ];
};
r.prototype.onPostprocessActions = function() {
return {
disableAfterOfferWhenFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
r.prototype.isFirstRound = function() {
return 1 === hs.storage.getItem("chapterRoundNum", 0);
};
return i([ classId("CTRefactorFirstAfterOfferIOSChapterWhitelistTrait") ], r);
}(Trait);
e.CTRefactorFirstAfterOfferIOSChapterWhitelistTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstAfterOfferIOSChapterWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
