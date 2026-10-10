window.__require = function t(r, e, o) {
function n(c, a) {
if (!e[c]) {
if (!r[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!r[f]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var d = e[c] = {
exports: {}
};
r[c][0].call(d.exports, function(t) {
return n(r[c][1][t] || t);
}, d, d.exports, t, r, e, o);
}
return e[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorRandBlockDownwardOverrideTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "7ffabFfxFhDO6y1jxnNM1ML", "CTRefactorRandBlockDownwardOverrideTrait");
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
var n, i = arguments.length, c = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(r, e, c) : n(r, e)) || c);
return i > 3 && c && Object.defineProperty(r, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRandBlockDownwardOverrideTrait = void 0;
var c = [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 23, 24, 29, 33, 35, 36, 42 ], a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onSDKArgsConditionContext = function() {
return buildLazyConditionContext({
hostActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorRandBlockDownwardTrait")) || void 0 === t ? void 0 : t.active, "主特性 RandBlockDownward 已激活");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "hostActive",
operator: "=",
value: !0
},
platform: "all",
flow: "applyOverride"
} ];
};
r.prototype.onSDKArgsActions = function() {
return {
applyOverride: function() {
return {
extra: {
traits: {
override: c
}
}
};
}
};
};
return i([ classId("CTRefactorRandBlockDownwardOverrideTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorRandBlockDownwardOverrideTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownwardOverrideTrait" ]);
//# sourceMappingURL=index.js.map
