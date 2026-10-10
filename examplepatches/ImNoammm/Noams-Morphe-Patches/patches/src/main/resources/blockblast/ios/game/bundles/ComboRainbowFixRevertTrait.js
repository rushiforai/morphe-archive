window.__require = function t(e, r, o) {
function n(c, u) {
if (!r[c]) {
if (!e[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!e[a]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var p = r[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return n(e[c][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
ComboRainbowFixRevertTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "641c20l6xdFRaziZhFcifOG", "ComboRainbowFixRevertTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, c = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ComboRainbowFixRevertTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isComboRainbowTraitUseOldLogic(t)) {
t.returnValue = !0;
t.returnState = !0;
}
};
return i([ classId("ComboRainbowFixRevertTrait") ], e);
}(Trait);
r.ComboRainbowFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ComboRainbowFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
