window.__require = function e(t, r, o) {
function i(s, c) {
if (!r[s]) {
if (!t[s]) {
var a = s.split("/");
a = a[a.length - 1];
if (!t[a]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = a;
}
var f = r[s] = {
exports: {}
};
t[s][0].call(f.exports, function(e) {
return i(t[s][1][e] || e);
}, f, f.exports, e, t, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
RestoreEndlessHighScoreTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "84983J2JyhHwoo8nmo1ojgu", "RestoreEndlessHighScoreTrait");
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
var i, n = arguments.length, s = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (s = (n < 3 ? i(s) : n > 3 ? i(t, r, s) : i(t, r)) || s);
return n > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreEndlessHighScoreTrait = void 0;
var s = function(e) {
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
var r = null == t ? void 0 : t.classHighScore;
if ("number" == typeof r && Number.isFinite(r)) {
if (r > hs.storage.getItem("classHighScore", 0)) {
hs.storage.setItem("classHighScore", r);
var o = Cinst(hs.ClassTopInfo);
o && o.setHighScoreLabelWithoutAnimation(r);
}
e.markRestored(this.traitName, !0);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
}
};
return n([ classId("RestoreEndlessHighScoreTrait") ], t);
}(Trait);
r.RestoreEndlessHighScoreTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreEndlessHighScoreTrait" ]);
//# sourceMappingURL=index.js.map
