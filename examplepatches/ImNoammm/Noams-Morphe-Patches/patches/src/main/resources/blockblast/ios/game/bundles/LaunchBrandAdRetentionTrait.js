window.__require = function t(e, n, r) {
function i(a, c) {
if (!n[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var p = n[a] = {
exports: {}
};
e[a][0].call(p.exports, function(t) {
return i(e[a][1][t] || t);
}, p, p.exports, t, e, n, r);
}
return n[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < r.length; a++) i(r[a]);
return i;
}({
LaunchBrandAdRetentionTrait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "1ce83EOLK9F25k4MfO5ZFNf", "LaunchBrandAdRetentionTrait");
var r, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
r(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), o = this && this.__decorate || function(t, e, n, r) {
var i, o = arguments.length, a = o < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, n) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, r); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (o < 3 ? i(a) : o > 3 ? i(e, n, a) : i(e, n)) || a);
return o > 3 && a && Object.defineProperty(e, n, a), a;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.LaunchBrandAdRetentionTrait = void 0;
var a = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isLaunchBrandAdDisplayTraitCheckRetention(t) || hs.tp.isLaunchBrandAd2DisplayTraitCheckRetention(t)) {
t.replace = !0;
this.getRetentionDays() < (Number(this.props.retentionDays) || 30) ? t.returnValue = !1 : t.returnValue = !0;
}
};
e.prototype.getRetentionDays = function() {
var t = new Date().getTime(), e = hs.gameInfo.installTime;
if (!Number.isFinite(e) || e <= 0 || e > t) return 1;
var n = Math.ceil((t - e) / 864e5);
return !Number.isFinite(n) || n <= 0 || n > 3650 ? 1 : n;
};
return o([ classId("LaunchBrandAdRetentionTrait") ], e);
}(Trait);
n.LaunchBrandAdRetentionTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "LaunchBrandAdRetentionTrait" ]);
//# sourceMappingURL=index.js.map
