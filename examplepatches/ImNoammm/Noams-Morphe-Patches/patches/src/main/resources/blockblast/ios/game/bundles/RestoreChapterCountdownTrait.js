window.__require = function e(t, r, o) {
function i(a, s) {
if (!r[a]) {
if (!t[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!t[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var p = r[a] = {
exports: {}
};
t[a][0].call(p.exports, function(e) {
return i(t[a][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
RestoreChapterCountdownTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "9d823yuJWtKUau/92hwRgvr", "RestoreChapterCountdownTrait");
var o, i = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), n = this && this.__decorate || function(e, t, r, o) {
var i, n = arguments.length, a = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var s = e.length - 1; s >= 0; s--) (i = e[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(t, r, a) : i(t, r)) || a);
return n > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreChapterCountdownTrait = void 0;
var a = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.onActive = function() {};
t.prototype.executeRestore = function() {
var e = TRAIT("RestoreDataProviderTrait");
if ((null == e ? void 0 : e.active) && e.isNeedRestore() && !e.isRestored(this.traitName)) {
var t = e.getRestoreData();
if (t) {
var r = null == t ? void 0 : t.chapterPeriodsBeginTime;
if (null != r) {
var o = null == t ? void 0 : t.lastTravelEndTime, i = new Date().getTime();
o && o > r && (i -= o - r);
hs.storage.getItem("chapterPeriodsBeginTime", 0), hs.storage.getItem("chapterPeriodsShowTime", 0);
hs.storage.setItem("chapterPeriodsBeginTime", i);
hs.storage.setItem("chapterPeriodsShowTime", i);
hs.storage.setItem("isShowChapterRedPoint", 2);
hs.storage.setItem("isEnterChapterList", !0);
e.markRestored(this.traitName, !0);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
}
};
return n([ classId("RestoreChapterCountdownTrait") ], t);
}(Trait);
r.RestoreChapterCountdownTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreChapterCountdownTrait" ]);
//# sourceMappingURL=index.js.map
