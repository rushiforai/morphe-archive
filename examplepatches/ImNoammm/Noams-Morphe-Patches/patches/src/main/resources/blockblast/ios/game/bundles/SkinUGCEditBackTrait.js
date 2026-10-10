window.__require = function t(e, r, n) {
function i(c, u) {
if (!r[c]) {
if (!e[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!e[a]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(a, !0);
if (o) return o(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var p = r[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return i(e[c][1][t] || t);
}, p, p.exports, t, e, r, n);
}
return r[c].exports;
}
for (var o = "function" == typeof __require && __require, c = 0; c < n.length; c++) i(n[c]);
return i;
}({
SkinUGCEditBackTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "a0eacyIeadCOI9LrIjiUtms", "SkinUGCEditBackTrait");
var n, i = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var i, o = arguments.length, c = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, n); else for (var u = t.length - 1; u >= 0; u--) (i = t[u]) && (c = (o < 3 ? i(c) : o > 3 ? i(e, r, c) : i(e, r)) || c);
return o > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.SkinUGCEditBackTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function() {};
return o([ classId("SkinUGCEditBackTrait") ], e);
}(Trait);
r.SkinUGCEditBackTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "SkinUGCEditBackTrait" ]);
//# sourceMappingURL=index.js.map
