window.__require = function t(e, r, i) {
function o(a, s) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = r[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return o(e[a][1][t] || t);
}, f, f.exports, t, e, r, i);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < i.length; a++) o(i[a]);
return o;
}({
RestoreAdSensitivityDataTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "02b462+nglLh6TkwEzxwmVc", "RestoreAdSensitivityDataTrait");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
i(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__assign || function() {
return (n = Object.assign || function(t) {
for (var e, r = 1, i = arguments.length; r < i; r++) {
e = arguments[r];
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
}
return t;
}).apply(this, arguments);
}, a = this && this.__decorate || function(t, e, r, i) {
var o, n = arguments.length, a = n < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, i); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (a = (n < 3 ? o(a) : n > 3 ? o(e, r, a) : o(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreAdSensitivityDataTrait = void 0;
var s = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
r = e;
e.prototype.registerTraitEventsMethods = function() {
return [];
};
e.prototype.onActive = function() {};
e.prototype.onCreate = function() {};
e.prototype.executeRestore = function() {
var t = TRAIT("RestoreDataProviderTrait");
if ((null == t ? void 0 : t.active) && t.isNeedRestore() && !t.isRestored(this.traitName)) {
var e = hs.storage.getItem(r.STORAGE_KEY);
if (e) {
hs.storage.setItem(r.STORAGE_KEY, n(n({}, e), {
lastRequestDate: ""
}));
t.markRestored(this.traitName, !0);
} else t.markRestored(this.traitName, !1);
}
};
e.prototype.clearTodayRequestMark = function() {
var t = hs.storage.getItem(r.STORAGE_KEY);
t && hs.storage.setItem(r.STORAGE_KEY, n(n({}, t), {
lastRequestDate: ""
}));
};
var r;
e.STORAGE_KEY = "InterstitialSensitivityStrategieV1Trait_Data";
return r = a([ classId("RestoreAdSensitivityDataTrait") ], e);
}(Trait);
r.RestoreAdSensitivityDataTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreAdSensitivityDataTrait" ]);
//# sourceMappingURL=index.js.map
