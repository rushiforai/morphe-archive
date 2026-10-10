window.__require = function t(r, e, n) {
function o(c, u) {
if (!e[c]) {
if (!r[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!r[a]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var p = e[c] = {
exports: {}
};
r[c][0].call(p.exports, function(t) {
return o(r[c][1][t] || t);
}, p, p.exports, t, r, e, n);
}
return e[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < n.length; c++) o(n[c]);
return o;
}({
LaunchBrandAdSkipTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "85ec0MOzWVHDYe9mEf8/D4G", "LaunchBrandAdSkipTrait");
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
var o, i = arguments.length, c = i < 3 ? r : null === n ? n = Object.getOwnPropertyDescriptor(r, e) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, n); else for (var u = t.length - 1; u >= 0; u--) (o = t[u]) && (c = (i < 3 ? o(c) : i > 3 ? o(r, e, c) : o(r, e)) || c);
return i > 3 && c && Object.defineProperty(r, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.LaunchBrandAdSkipTrait = void 0;
var c = function(t) {
o(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
return i([ classId("LaunchBrandAdSkipTrait") ], r);
}(Trait);
e.LaunchBrandAdSkipTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "LaunchBrandAdSkipTrait" ]);
//# sourceMappingURL=index.js.map
