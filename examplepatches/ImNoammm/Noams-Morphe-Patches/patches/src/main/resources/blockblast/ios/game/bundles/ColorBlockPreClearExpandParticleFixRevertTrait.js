window.__require = function e(r, t, o) {
function n(c, a) {
if (!t[c]) {
if (!r[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!r[l]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var p = t[c] = {
exports: {}
};
r[c][0].call(p.exports, function(e) {
return n(r[c][1][e] || e);
}, p, p.exports, e, r, t, o);
}
return t[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
ColorBlockPreClearExpandParticleFixRevertTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "40e1dx+UwpIm7k8VYsNsSuP", "ColorBlockPreClearExpandParticleFixRevertTrait");
var o, n = this && this.__extends || (o = function(e, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
o(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), i = this && this.__decorate || function(e, r, t, o) {
var n, i = arguments.length, c = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, r, t, o); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(r, t, c) : n(r, t)) || c);
return i > 3 && c && Object.defineProperty(r, t, c), c;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.ColorBlockPreClearExpandParticleFixRevertTrait = void 0;
var c = function(e) {
n(r, e);
function r() {
return null !== e && e.apply(this, arguments) || this;
}
r.prototype.onActive = function(e) {
if (hs.tp.isColorBlockPreClearExpandParticleTraitGetIsUseNewArt(e)) {
e.returnValue = !1;
e.returnState = !0;
}
};
return i([ classId("ColorBlockPreClearExpandParticleFixRevertTrait") ], r);
}(Trait);
t.ColorBlockPreClearExpandParticleFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ColorBlockPreClearExpandParticleFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
