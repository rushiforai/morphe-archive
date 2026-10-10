window.__require = function e(t, r, n) {
function c(i, f) {
if (!r[i]) {
if (!t[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!t[u]) {
var a = "function" == typeof __require && __require;
if (!f && a) return a(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var p = r[i] = {
exports: {}
};
t[i][0].call(p.exports, function(e) {
return c(t[i][1][e] || e);
}, p, p.exports, e, t, r, n);
}
return r[i].exports;
}
for (var o = "function" == typeof __require && __require, i = 0; i < n.length; i++) c(n[i]);
return c;
}({
PrefectPlaceEffectFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "58933jJ3KdIQKGt8pkBQuwc", "PrefectPlaceEffectFixRevertTrait");
var n, c = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), o = this && this.__decorate || function(e, t, r, n) {
var c, o = arguments.length, i = o < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, n); else for (var f = e.length - 1; f >= 0; f--) (c = e[f]) && (i = (o < 3 ? c(i) : o > 3 ? c(t, r, i) : c(t, r)) || i);
return o > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PrefectPlaceEffectFixRevertTrait = void 0;
var i = function(e) {
c(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
hs.tp.isPrefectPlaceEffectTraitIsOptimization(e) && (e.returnValue = !1);
};
return o([ classId("PrefectPlaceEffectFixRevertTrait") ], t);
}(Trait);
r.PrefectPlaceEffectFixRevertTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "PrefectPlaceEffectFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
