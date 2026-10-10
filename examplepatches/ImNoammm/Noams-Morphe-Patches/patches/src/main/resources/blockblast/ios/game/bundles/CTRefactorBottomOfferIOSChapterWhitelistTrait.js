window.__require = function t(e, o, r) {
function n(f, u) {
if (!o[f]) {
if (!e[f]) {
var s = f.split("/");
s = s[s.length - 1];
if (!e[s]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = s;
}
var c = o[f] = {
exports: {}
};
e[f][0].call(c.exports, function(t) {
return n(e[f][1][t] || t);
}, c, c.exports, t, e, o, r);
}
return o[f].exports;
}
for (var i = "function" == typeof __require && __require, f = 0; f < r.length; f++) n(r[f]);
return n;
}({
CTRefactorBottomOfferIOSChapterWhitelistTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "bbc163yZdtFMJpk6uHDNfC1", "CTRefactorBottomOfferIOSChapterWhitelistTrait");
var r, n = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, f = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(t, e, o, r); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (f = (i < 3 ? n(f) : i > 3 ? n(e, o, f) : n(e, o)) || f);
return i > 3 && f && Object.defineProperty(e, o, f), f;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorBottomOfferIOSChapterWhitelistTrait = void 0;
var f = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isFirstRoundCannotRunBottom: function() {
return ASContext(t.isFirstRound(), "首轮，updateBottomOfferList 穿参为 false");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isFirstRoundCannotRunBottom",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
flow: "disableBottomWhenFirstRound"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
disableBottomWhenFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
e.prototype.isFirstRound = function() {
return 1 === hs.storage.getItem("chapterRoundNum", 0);
};
return i([ classId("CTRefactorBottomOfferIOSChapterWhitelistTrait") ], e);
}(Trait);
o.CTRefactorBottomOfferIOSChapterWhitelistTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBottomOfferIOSChapterWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
