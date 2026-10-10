window.__require = function t(r, e, o) {
function n(s, f) {
if (!e[s]) {
if (!r[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!r[u]) {
var c = "function" == typeof __require && __require;
if (!f && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var a = e[s] = {
exports: {}
};
r[s][0].call(a.exports, function(t) {
return n(r[s][1][t] || t);
}, a, a.exports, t, r, e, o);
}
return e[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
CTRefactorFirstBottomOfferIOSChapterWhitelistTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "d37536ddqlOeJ3cmz3bwc5m", "CTRefactorFirstBottomOfferIOSChapterWhitelistTrait");
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
var n, i = arguments.length, s = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, r, e, o); else for (var f = t.length - 1; f >= 0; f--) (n = t[f]) && (s = (i < 3 ? n(s) : i > 3 ? n(r, e, s) : n(r, e)) || s);
return i > 3 && s && Object.defineProperty(r, e, s), s;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFirstBottomOfferIOSChapterWhitelistTrait = void 0;
var s = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isNotFirstRound: function() {
return ASContext(!t.isFirstRound(), "非首轮，updateFirstBottomOfferList 应为空");
}
});
};
r.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isNotFirstRound",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
flow: "disableFirstBottomWhenNotFirstRound"
} ];
};
r.prototype.onPostprocessActions = function() {
return {
disableFirstBottomWhenNotFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
r.prototype.isFirstRound = function() {
return 1 === hs.storage.getItem("chapterRoundNum", 0);
};
return i([ classId("CTRefactorFirstBottomOfferIOSChapterWhitelistTrait") ], r);
}(Trait);
e.CTRefactorFirstBottomOfferIOSChapterWhitelistTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstBottomOfferIOSChapterWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
