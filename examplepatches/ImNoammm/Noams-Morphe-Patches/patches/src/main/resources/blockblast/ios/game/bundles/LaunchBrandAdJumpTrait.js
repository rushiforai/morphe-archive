window.__require = function t(r, e, n) {
function o(u, c) {
if (!e[u]) {
if (!r[u]) {
var a = u.split("/");
a = a[a.length - 1];
if (!r[a]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = a;
}
var p = e[u] = {
exports: {}
};
r[u][0].call(p.exports, function(t) {
return o(r[u][1][t] || t);
}, p, p.exports, t, r, e, n);
}
return e[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < n.length; u++) o(n[u]);
return o;
}({
LaunchBrandAdJumpTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "655fdXxQiBKOr/bZWbTnipx", "LaunchBrandAdJumpTrait");
var n, o = this && this.__extends || (n = function(t, r) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
n(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), i = this && this.__decorate || function(t, r, e, n) {
var o, i = arguments.length, u = i < 3 ? r : null === n ? n = Object.getOwnPropertyDescriptor(r, e) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, r, e, n); else for (var c = t.length - 1; c >= 0; c--) (o = t[c]) && (u = (i < 3 ? o(u) : i > 3 ? o(r, e, u) : o(r, e)) || u);
return i > 3 && u && Object.defineProperty(r, e, u), u;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.LaunchBrandAdJumpTrait = void 0;
var u = function(t) {
o(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
return i([ classId("LaunchBrandAdJumpTrait") ], r);
}(Trait);
e.LaunchBrandAdJumpTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "LaunchBrandAdJumpTrait" ]);
//# sourceMappingURL=index.js.map
