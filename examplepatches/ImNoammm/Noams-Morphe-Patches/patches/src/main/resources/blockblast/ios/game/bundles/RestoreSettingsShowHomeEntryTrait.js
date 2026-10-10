window.__require = function t(e, r, o) {
function n(s, a) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var f = r[s] = {
exports: {}
};
e[s][0].call(f.exports, function(t) {
return n(e[s][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
RestoreSettingsShowHomeEntryTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "cde81LndCBEBoHr1VY0jzki", "RestoreSettingsShowHomeEntryTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreSettingsShowHomeEntryTrait = void 0;
var s = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onCreate = function() {};
e.prototype.onActive = function(t) {
if (hs.tp.isClassGame_ProxyOnGameStart(t)) {
var e = TRAIT("RestoreDataProviderTrait");
if (!(null == e ? void 0 : e.active)) return;
if (!e.isNeedRestore()) return;
if (e.isRestored(this.traitName)) return;
var r = hs.storage.getItem("restoreExecutedFlags", {});
if (Object.values(r).some(function(t) {
return !1 === t;
})) {
e.markRestored(this.traitName, !0);
return;
}
hs.launchInfo.setForceOpenChapter(!0);
hs.storage.setItem("isShowChapterRedPoint", 1);
hs.storage.setItem("intoModeChoice", !0);
e.markRestored(this.traitName, !0);
}
};
return i([ classId("RestoreSettingsShowHomeEntryTrait") ], e);
}(Trait);
r.RestoreSettingsShowHomeEntryTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreSettingsShowHomeEntryTrait" ]);
//# sourceMappingURL=index.js.map
