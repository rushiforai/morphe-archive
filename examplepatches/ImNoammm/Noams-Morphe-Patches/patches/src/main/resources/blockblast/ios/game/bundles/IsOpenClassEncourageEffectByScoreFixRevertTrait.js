window.__require = function e(t, r, n) {
function o(i, f) {
if (!r[i]) {
if (!t[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!t[u]) {
var s = "function" == typeof __require && __require;
if (!f && s) return s(u, !0);
if (c) return c(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var a = r[i] = {
exports: {}
};
t[i][0].call(a.exports, function(e) {
return o(t[i][1][e] || e);
}, a, a.exports, e, t, r, n);
}
return r[i].exports;
}
for (var c = "function" == typeof __require && __require, i = 0; i < n.length; i++) o(n[i]);
return o;
}({
IsOpenClassEncourageEffectByScoreFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "8974ewTviBISItCt/rM37+h", "IsOpenClassEncourageEffectByScoreFixRevertTrait");
var n, o = this && this.__extends || (n = function(e, t) {
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
}), c = this && this.__decorate || function(e, t, r, n) {
var o, c = arguments.length, i = c < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, n); else for (var f = e.length - 1; f >= 0; f--) (o = e[f]) && (i = (c < 3 ? o(i) : c > 3 ? o(t, r, i) : o(t, r)) || i);
return c > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.IsOpenClassEncourageEffectByScoreFixRevertTrait = void 0;
var i = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
if (hs.tp.isIsOpenClassEncourageEffectByScoreTraitOnFixRevertModify(e)) {
e.returnValue = !1;
e.returnState = !0;
}
};
return c([ classId("IsOpenClassEncourageEffectByScoreFixRevertTrait") ], t);
}(Trait);
r.IsOpenClassEncourageEffectByScoreFixRevertTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "IsOpenClassEncourageEffectByScoreFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
