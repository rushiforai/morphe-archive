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
var p = r[s] = {
exports: {}
};
t[s][0].call(p.exports, function(e) {
return i(t[s][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
AddRecoveryMoSaicTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "355c4yVNspHVrqWRildbfBq", "AddRecoveryMoSaicTrait");
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
r.AddRecoveryMoSaicTrait = void 0;
var s = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isFirstEnter = void 0;
t.storageKey = "AddRecoveryMoSaicTrait_isFirstEnter";
return t;
}
t.prototype.onCreate = function() {
this.loadData();
};
t.prototype.loadData = function() {
this.isFirstEnter = hs.storage.getItem(this.storageKey, !0);
return this.isFirstEnter;
};
t.prototype.saveData = function() {
hs.storage.setItem(this.storageKey, this.isFirstEnter);
};
t.prototype.isHomePageSectionChapterBtnDefaultOnClick = function() {
if (this.isNeedRestore() && this.isFirstEnter) {
this.isFirstEnter = !1;
this.saveData();
this.executeRestore();
}
};
t.prototype.isNeedRestore = function() {
var e = TRAIT("RestoreDataProviderTrait");
return !(null == e || !e.active || !e.isNeedRestore());
};
t.prototype.executeRestore = function() {
this.recoveryMoSaicPeriod();
this.recoveryChapterProgress();
this.recoveryChapterCountdown();
};
t.prototype.recoveryMoSaicPeriod = function() {
var e, t = TRAIT("RestoreChapterPeriodsTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
t.prototype.recoveryChapterProgress = function() {
var e, t = TRAIT("RestoreChapterProgressTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
t.prototype.recoveryChapterCountdown = function() {
var e, t = TRAIT("RestoreChapterCountdownTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
return n([ classId("AddRecoveryMoSaicTrait") ], t);
}(Trait);
r.AddRecoveryMoSaicTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryMoSaicTrait" ]);
//# sourceMappingURL=index.js.map
