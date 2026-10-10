window.__require = function t(o, e, r) {
function n(s, a) {
if (!e[s]) {
if (!o[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!o[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var f = e[s] = {
exports: {}
};
o[s][0].call(f.exports, function(t) {
return n(o[s][1][t] || t);
}, f, f.exports, t, o, e, r);
}
return e[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < r.length; s++) n(r[s]);
return n;
}({
CTRefactorBottomCanUsedWhitelistTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "dd80eJGAt5MY7xep3jEH2sF", "CTRefactorBottomCanUsedWhitelistTrait");
var r, n = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), i = this && this.__decorate || function(t, o, e, r) {
var n, i = arguments.length, s = i < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, o, e, r); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(o, e, s) : n(o, e)) || s);
return i > 3 && s && Object.defineProperty(o, e, s), s;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorBottomCanUsedWhitelistTrait = void 0;
var s = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isFirstRoundCannotRunBottom: function() {
return ASContext(t.isFirstRound(), "首轮，updateBottomOfferList 穿参为 false");
}
});
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isFirstRoundCannotRunBottom",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableBottomWhenFirstRound"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
disableBottomWhenFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
o.prototype.isFirstRound = function() {
return 1 === hs.storage.getItem("classRoundNum", 0);
};
return i([ classId("CTRefactorBottomCanUsedWhitelistTrait") ], o);
}(Trait);
e.CTRefactorBottomCanUsedWhitelistTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBottomCanUsedWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
