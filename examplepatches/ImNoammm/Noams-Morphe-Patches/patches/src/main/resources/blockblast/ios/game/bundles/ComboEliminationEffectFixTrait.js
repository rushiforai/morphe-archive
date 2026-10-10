window.__require = function t(e, r, o) {
function i(f, c) {
if (!r[f]) {
if (!e[f]) {
var u = f.split("/");
u = u[u.length - 1];
if (!e[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = u;
}
var p = r[f] = {
exports: {}
};
e[f][0].call(p.exports, function(t) {
return i(e[f][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[f].exports;
}
for (var n = "function" == typeof __require && __require, f = 0; f < o.length; f++) i(o[f]);
return i;
}({
ComboEliminationEffectFixTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "cef59M2QORO9bg70Nj3kGdw", "ComboEliminationEffectFixTrait");
var o, i = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, f = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (f = (n < 3 ? i(f) : n > 3 ? i(e, r, f) : i(e, r)) || f);
return n > 3 && f && Object.defineProperty(e, r, f), f;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ComboEliminationEffectFixTrait = void 0;
var f = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isComboEliminationEffectTraitOnFixTraitModify(t)) {
t.returnValue = !1;
t.replace = !0;
}
};
return n([ classId("ComboEliminationEffectFixTrait") ], e);
}(Trait);
r.ComboEliminationEffectFixTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "ComboEliminationEffectFixTrait" ]);
//# sourceMappingURL=index.js.map
