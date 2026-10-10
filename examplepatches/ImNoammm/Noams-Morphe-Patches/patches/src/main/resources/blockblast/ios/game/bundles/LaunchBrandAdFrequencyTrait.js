window.__require = function e(t, r, n) {
function o(a, c) {
if (!r[a]) {
if (!t[a]) {
var i = a.split("/");
i = i[i.length - 1];
if (!t[i]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(i, !0);
if (u) return u(i, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = i;
}
var s = r[a] = {
exports: {}
};
t[a][0].call(s.exports, function(e) {
return o(t[a][1][e] || e);
}, s, s.exports, e, t, r, n);
}
return r[a].exports;
}
for (var u = "function" == typeof __require && __require, a = 0; a < n.length; a++) o(n[a]);
return o;
}({
LaunchBrandAdFrequencyTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "28318Uvr6ZJfrPkZaDu7TO5", "LaunchBrandAdFrequencyTrait");
var n, o = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), u = this && this.__decorate || function(e, t, r, n) {
var o, u = arguments.length, a = u < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, n); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (a = (u < 3 ? o(a) : u > 3 ? o(t, r, a) : o(t, r)) || a);
return u > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.LaunchBrandAdFrequencyTrait = void 0;
var a = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
if (hs.tp.isLaunchBrandAdDisplayTraitCheckFrequency(e)) {
e.replace = !0;
this.getTodayShowCount() >= (Number(this.props.showTimes) || 3) ? e.returnValue = !1 : e.returnValue = !0;
}
if (hs.tp.isLaunchBrandAd2DisplayTraitCheckFrequency(e)) {
e.replace = !0;
this.getTodayShowCount2() >= (Number(this.props.showTimes) || 3) ? e.returnValue = !1 : e.returnValue = !0;
}
};
t.prototype.getTodayShowCount = function() {
try {
var e = hs.storage.getItem("LaunchBrandAd_NextConfig", null);
if (!e || !e.frequency) return 0;
var t = Date.now(), r = e.frequency.lastShowDate || 0;
if (!hs.isSameDay(r, t)) {
e.frequency.todayCount;
e.frequency.todayCount = 0;
e.frequency.lastShowDate = t;
try {
hs.storage.setItem("LaunchBrandAd_NextConfig", e);
} catch (e) {}
}
return e.frequency.todayCount || 0;
} catch (e) {
return 0;
}
};
t.prototype.getTodayShowCount2 = function() {
try {
var e = hs.storage.getItem("LaunchBrandAd_NextConfig_2", null);
if (!e || !e.frequency) return 0;
var t = Date.now(), r = e.frequency.lastShowDate || 0;
if (!hs.isSameDay(r, t)) {
e.frequency.todayCount;
e.frequency.todayCount = 0;
e.frequency.lastShowDate = t;
try {
hs.storage.setItem("LaunchBrandAd_NextConfig_2", e);
} catch (e) {}
}
return e.frequency.todayCount || 0;
} catch (e) {
return 0;
}
};
return u([ classId("LaunchBrandAdFrequencyTrait") ], t);
}(Trait);
r.LaunchBrandAdFrequencyTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "LaunchBrandAdFrequencyTrait" ]);
//# sourceMappingURL=index.js.map
