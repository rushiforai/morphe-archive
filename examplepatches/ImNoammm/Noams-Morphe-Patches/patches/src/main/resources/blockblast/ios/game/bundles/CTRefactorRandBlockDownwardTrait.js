window.__require = function t(r, e, o) {
function n(a, c) {
if (!e[a]) {
if (!r[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!r[f]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var u = e[a] = {
exports: {}
};
r[a][0].call(u.exports, function(t) {
return n(r[a][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorRandBlockDownwardTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "4478a9NV2hGPaNHYmcwlajX", "CTRefactorRandBlockDownwardTrait");
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
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRandBlockDownwardTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: !0,
platform: "all",
flow: "disableRemoveAll23"
} ];
};
r.prototype.onSDKArgsActions = function() {
return {
disableRemoveAll23: function() {
return {
disableTraits: [ "CTRefactorRemoveAll23LimitRandomSmallTrait" ]
};
}
};
};
return i([ classId("CTRefactorRandBlockDownwardTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorRandBlockDownwardTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownwardTrait" ]);
//# sourceMappingURL=index.js.map
