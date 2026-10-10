window.__require = function r(e, t, o) {
function n(a, c) {
if (!t[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var p = t[a] = {
exports: {}
};
e[a][0].call(p.exports, function(r) {
return n(e[a][1][r] || r);
}, p, p.exports, r, e, t, o);
}
return t[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorRandBlockDownward_journeyOverrideTrait: [ function(r, e, t) {
"use strict";
cc._RF.push(e, "05b3bWlZ/pMVqSeG8SYigYK", "CTRefactorRandBlockDownward_journeyOverrideTrait");
var o, n = this && this.__extends || (o = function(r, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(r, e) {
r.__proto__ = e;
} || function(r, e) {
for (var t in e) Object.prototype.hasOwnProperty.call(e, t) && (r[t] = e[t]);
})(r, e);
}, function(r, e) {
o(r, e);
function t() {
this.constructor = r;
}
r.prototype = null === e ? Object.create(e) : (t.prototype = e.prototype, new t());
}), i = this && this.__decorate || function(r, e, t, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(r, e, t, o); else for (var c = r.length - 1; c >= 0; c--) (n = r[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, t, a) : n(e, t)) || a);
return i > 3 && a && Object.defineProperty(e, t, a), a;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.CTRefactorRandBlockDownward_journeyOverrideTrait = void 0;
var a = [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 23, 24, 29, 33, 35, 36, 42 ], c = function(r) {
n(e, r);
function e() {
return null !== r && r.apply(this, arguments) || this;
}
e.prototype.onSDKArgsConditionContext = function() {
return buildLazyConditionContext({
isJourneyLayer: function() {
var r = TRAIT("CTRefactorRandBlockDownward_journeyTrait");
return (null == r ? void 0 : r.active) ? ASContext(r.isJourneyLayer(), "是否进入旅行模式") : ASContext(!1, "主特性未激活");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isJourneyLayer",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
flow: "applyOverride"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
applyOverride: function() {
return {
extra: {
traits: {
override: a
}
}
};
}
};
};
return i([ classId("CTRefactorRandBlockDownward_journeyOverrideTrait") ], e);
}(Trait);
t.CTRefactorRandBlockDownward_journeyOverrideTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownward_journeyOverrideTrait" ]);
//# sourceMappingURL=index.js.map
