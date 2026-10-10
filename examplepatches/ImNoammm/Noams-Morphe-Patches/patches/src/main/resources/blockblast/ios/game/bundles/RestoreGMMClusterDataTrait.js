window.__require = function t(e, r, o) {
function i(a, s) {
if (!r[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var c = r[a] = {
exports: {}
};
e[a][0].call(c.exports, function(t) {
return i(e[a][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
RestoreGMMClusterDataTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "2b1c8fNkExA1J8kK+IPdWR5", "RestoreGMMClusterDataTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreGMMClusterDataTrait = void 0;
var a = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
r = e;
e.prototype.registerTraitEventsMethods = function() {
return [];
};
e.prototype.onCreate = function() {};
e.prototype.onActive = function() {};
e.prototype.executeRestore = function() {
var t, e, o, i = TRAIT("RestoreDataProviderTrait");
if ((null == i ? void 0 : i.active) && i.isNeedRestore() && !i.isRestored(this.traitName)) {
var n = i.getRestoreData(), a = null !== (t = null == n ? void 0 : n.showTimes) && void 0 !== t ? t : [], s = null !== (e = null == n ? void 0 : n.completeTimes) && void 0 !== e ? e : [];
if (0 != a.length || 0 != s.length) {
i.markRestored(this.traitName, !0);
hs.storage.setItem(r.STORAGE_KEY, {
showTimes: a,
completeTimes: s,
extraReviveCount: null
});
var u = TRAIT("GMMClusterOptStrategy4Trait");
(null == u ? void 0 : u.active) && (null === (o = null == u ? void 0 : u.loadData) || void 0 === o || o.call(u));
} else i.markRestored(this.traitName, !1);
}
};
var r;
e.STORAGE_KEY = "classGMMClusterOptStrategy4TraitData";
return r = n([ classId("RestoreGMMClusterDataTrait") ], e);
}(Trait);
r.RestoreGMMClusterDataTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreGMMClusterDataTrait" ]);
//# sourceMappingURL=index.js.map
