window.__require = function e(t, r, o) {
function n(a, i) {
if (!r[a]) {
if (!t[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!t[u]) {
var c = "function" == typeof __require && __require;
if (!i && c) return c(u, !0);
if (s) return s(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var l = r[a] = {
exports: {}
};
t[a][0].call(l.exports, function(e) {
return n(t[a][1][e] || e);
}, l, l.exports, e, t, r, o);
}
return r[a].exports;
}
for (var s = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
RestoreEndlessGameCountTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "bd4e2l9zfREvKzTfub+fFIH", "RestoreEndlessGameCountTrait");
var o, n = this && this.__extends || (o = function(e, t) {
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
}), s = this && this.__decorate || function(e, t, r, o) {
var n, s = arguments.length, a = s < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var i = e.length - 1; i >= 0; i--) (n = e[i]) && (a = (s < 3 ? n(a) : s > 3 ? n(t, r, a) : n(t, r)) || a);
return s > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreEndlessGameCountTrait = void 0;
var a = function(e) {
n(t, e);
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
var r = null == t ? void 0 : t.classGameNum, o = null == t ? void 0 : t.classGameNumNoRefresh;
if (null != r || null != o) {
if (null != r) {
var n = hs.storage.getItem("classGameNum", 0);
hs.storage.setItem("classGameNum", Math.max(n, r));
}
if (null != o) {
var s = hs.storage.getItem("classGameNumNoRefresh", 0);
hs.storage.setItem("classGameNumNoRefresh", Math.max(s, o));
}
e.markRestored(this.traitName, !0);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
}
};
return s([ classId("RestoreEndlessGameCountTrait") ], t);
}(Trait);
r.RestoreEndlessGameCountTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreEndlessGameCountTrait" ]);
//# sourceMappingURL=index.js.map
