window.__require = function e(t, n, r) {
function i(c, p) {
if (!n[c]) {
if (!t[c]) {
var u = c.split("/");
u = u[u.length - 1];
if (!t[u]) {
var a = "function" == typeof __require && __require;
if (!p && a) return a(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = u;
}
var f = n[c] = {
exports: {}
};
t[c][0].call(f.exports, function(e) {
return i(t[c][1][e] || e);
}, f, f.exports, e, t, n, r);
}
return n[c].exports;
}
for (var o = "function" == typeof __require && __require, c = 0; c < r.length; c++) i(r[c]);
return i;
}({
IsOpenChangeSkinFixTrait: [ function(e, t, n) {
"use strict";
cc._RF.push(t, "26f43mUEqBB4oIO78ziKQDx", "IsOpenChangeSkinFixTrait");
var r, i = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n]);
})(e, t);
}, function(e, t) {
r(e, t);
function n() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n());
}), o = this && this.__decorate || function(e, t, n, r) {
var i, o = arguments.length, c = o < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, n) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, n, r); else for (var p = e.length - 1; p >= 0; p--) (i = e[p]) && (c = (o < 3 ? i(c) : o > 3 ? i(t, n, c) : i(t, n)) || c);
return o > 3 && c && Object.defineProperty(t, n, c), c;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.IsOpenChangeSkinFixTrait = void 0;
var c = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
if (hs.tp.isIsOpenChangeSkinTraitOnFixTraitModify(e)) {
e.returnValue = !1;
e.replace = !0;
}
};
return o([ classId("IsOpenChangeSkinFixTrait") ], t);
}(Trait);
n.IsOpenChangeSkinFixTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "IsOpenChangeSkinFixTrait" ]);
//# sourceMappingURL=index.js.map
