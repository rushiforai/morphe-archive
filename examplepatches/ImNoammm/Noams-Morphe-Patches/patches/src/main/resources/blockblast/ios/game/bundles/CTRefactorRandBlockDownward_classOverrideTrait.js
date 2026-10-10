window.__require = function r(t, e, o) {
function n(a, c) {
if (!e[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var u = e[a] = {
exports: {}
};
t[a][0].call(u.exports, function(r) {
return n(t[a][1][r] || r);
}, u, u.exports, r, t, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorRandBlockDownward_classOverrideTrait: [ function(r, t, e) {
"use strict";
cc._RF.push(t, "668f2T5NuVNX4ec2WmO9k0v", "CTRefactorRandBlockDownward_classOverrideTrait");
var o, n = this && this.__extends || (o = function(r, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(r, t) {
r.__proto__ = t;
} || function(r, t) {
for (var e in t) Object.prototype.hasOwnProperty.call(t, e) && (r[e] = t[e]);
})(r, t);
}, function(r, t) {
o(r, t);
function e() {
this.constructor = r;
}
r.prototype = null === t ? Object.create(t) : (e.prototype = t.prototype, new e());
}), i = this && this.__decorate || function(r, t, e, o) {
var n, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(r, t, e, o); else for (var c = r.length - 1; c >= 0; c--) (n = r[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, e, a) : n(t, e)) || a);
return i > 3 && a && Object.defineProperty(t, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRandBlockDownward_classOverrideTrait = void 0;
var a = [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 23, 24, 29, 33, 35, 36, 42 ], c = function(r) {
n(t, r);
function t() {
return null !== r && r.apply(this, arguments) || this;
}
t.prototype.onSDKArgsConditionContext = function() {
return buildLazyConditionContext({
isClassLayer: function() {
var r = TRAIT("CTRefactorRandBlockDownward_classTrait");
return (null == r ? void 0 : r.active) ? ASContext(r.isClassLayer(), "是否进入无尽模式") : ASContext(!1, "主特性未激活");
}
});
};
t.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isClassLayer",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "applyOverride"
} ];
};
t.prototype.onSDKArgsActions = function() {
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
return i([ classId("CTRefactorRandBlockDownward_classOverrideTrait"), classMethodWatch() ], t);
}(Trait);
e.CTRefactorRandBlockDownward_classOverrideTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownward_classOverrideTrait" ]);
//# sourceMappingURL=index.js.map
