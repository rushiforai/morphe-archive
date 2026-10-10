window.__require = function e(t, r, o) {
function i(f, c) {
if (!r[f]) {
if (!t[f]) {
var u = f.split("/");
u = u[u.length - 1];
if (!t[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = u;
}
var l = r[f] = {
exports: {}
};
t[f][0].call(l.exports, function(e) {
return i(t[f][1][e] || e);
}, l, l.exports, e, t, r, o);
}
return r[f].exports;
}
for (var n = "function" == typeof __require && __require, f = 0; f < o.length; f++) i(o[f]);
return i;
}({
TheMoreEliminateTheMoreGoodEffectFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "10981mQQGJJP7ylINQYYNlR", "TheMoreEliminateTheMoreGoodEffectFixRevertTrait");
var o, i = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), n = this && this.__decorate || function(e, t, r, o) {
var i, n = arguments.length, f = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (f = (n < 3 ? i(f) : n > 3 ? i(t, r, f) : i(t, r)) || f);
return n > 3 && f && Object.defineProperty(t, r, f), f;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.TheMoreEliminateTheMoreGoodEffectFixRevertTrait = void 0;
var f = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
hs.tp.isTheMoreEliminateTheMoreGoodEffectTraitGetAnimationReuse(e) && (e.returnValue = !1);
};
return n([ classId("TheMoreEliminateTheMoreGoodEffectFixRevertTrait") ], t);
}(Trait);
r.TheMoreEliminateTheMoreGoodEffectFixRevertTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "TheMoreEliminateTheMoreGoodEffectFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
