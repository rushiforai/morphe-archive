window.__require = function t(e, r, n) {
function o(a, c) {
if (!r[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var u = r[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return o(e[a][1][t] || t);
}, u, u.exports, t, e, r, n);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < n.length; a++) o(n[a]);
return o;
}({
RoyalMatchClassLevelTransitionFixRevertTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6a653AtQpNMs4ZWQjssftac", "RoyalMatchClassLevelTransitionFixRevertTrait");
var n, o = this && this.__extends || (n = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, n) {
var o, i = arguments.length, a = i < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, n); else for (var c = t.length - 1; c >= 0; c--) (o = t[c]) && (a = (i < 3 ? o(a) : i > 3 ? o(e, r, a) : o(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RoyalMatchClassLevelTransitionFixRevertTrait = void 0;
var a = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function() {};
return i([ classId("RoyalMatchClassLevelTransitionFixRevertTrait") ], e);
}(Trait);
r.RoyalMatchClassLevelTransitionFixRevertTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "RoyalMatchClassLevelTransitionFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
