window.__require = function t(e, r, n) {
function o(s, c) {
if (!r[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var f = r[s] = {
exports: {}
};
e[s][0].call(f.exports, function(t) {
return o(e[s][1][t] || t);
}, f, f.exports, t, e, r, n);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < n.length; s++) o(n[s]);
return o;
}({
ClassGuideMaskSyncOldTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "fa752RQo5NFDozLO/gYWMc/", "ClassGuideMaskSyncOldTrait");
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
var o, i = arguments.length, s = i < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, n); else for (var c = t.length - 1; c >= 0; c--) (o = t[c]) && (s = (i < 3 ? o(s) : i > 3 ? o(e, r, s) : o(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClassGuideMaskSyncOldTrait = void 0;
var s = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
hs.tp.isClassGuide_ProxyIsShowDarkMask(t) && hs.classGuideInfo.step >= 2 && (t.returnValue = !1);
};
return i([ classId("ClassGuideMaskSyncOldTrait") ], e);
}(Trait);
r.ClassGuideMaskSyncOldTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "ClassGuideMaskSyncOldTrait" ]);
//# sourceMappingURL=index.js.map
