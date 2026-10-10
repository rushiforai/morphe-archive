window.__require = function e(t, r, o) {
function i(n, a) {
if (!r[n]) {
if (!t[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!t[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var p = r[n] = {
exports: {}
};
t[n][0].call(p.exports, function(e) {
return i(t[n][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
AddRecoveryClassTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "3c6daPQbftGPqNLgvJs3xLf", "AddRecoveryClassTrait");
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
}), s = this && this.__decorate || function(e, t, r, o) {
var i, s = arguments.length, n = s < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var a = e.length - 1; a >= 0; a--) (i = e[a]) && (n = (s < 3 ? i(n) : s > 3 ? i(t, r, n) : i(t, r)) || n);
return s > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryClassTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isFirstEnterClass = void 0;
t.storageKey = "AddRecoveryClassTrait_isFirstEnterClass";
return t;
}
t.prototype.onCreate = function() {
this.loadData();
};
t.prototype.loadData = function() {
this.isFirstEnterClass = hs.storage.getItem(this.storageKey, !0);
};
t.prototype.setData = function() {
hs.storage.setItem(this.storageKey, this.isFirstEnterClass);
};
t.prototype.isClassGame_ProxyOnClassGameShow = function() {
if (this.isFirstEnterClass) {
this.isFirstEnterClass = !1;
this.setData();
if (this.props.traitName) {
var e = TRAIT("RestoreDataProviderTrait");
if (!(null == e ? void 0 : e.active)) return;
if (!e.isRestoredTrue(this.props.traitName)) return;
}
this.executeRestore();
}
};
t.prototype.recoveryHighScore = function() {
var e, t = TRAIT("RestoreEndlessHighScoreTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
t.prototype.recoveryMoSaicPeriod = function() {
var e, t = TRAIT("RestoreChapterPeriodsTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
t.prototype.recoveryChapterProgress = function() {
var e, t = TRAIT("RestoreChapterProgressTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
t.prototype.executeRestore = function() {
this.recoveryHighScore();
this.recoveryMoSaicPeriod();
this.recoveryChapterProgress();
};
return s([ classId("AddRecoveryClassTrait") ], t);
}(Trait);
r.AddRecoveryClassTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryClassTrait" ]);
//# sourceMappingURL=index.js.map
