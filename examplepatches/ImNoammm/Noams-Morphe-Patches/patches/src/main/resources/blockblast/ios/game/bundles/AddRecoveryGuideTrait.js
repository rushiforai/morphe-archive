window.__require = function e(t, r, o) {
function i(c, u) {
if (!r[c]) {
if (!t[c]) {
var s = c.split("/");
s = s[s.length - 1];
if (!t[s]) {
var p = "function" == typeof __require && __require;
if (!u && p) return p(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = s;
}
var a = r[c] = {
exports: {}
};
t[c][0].call(a.exports, function(e) {
return i(t[c][1][e] || e);
}, a, a.exports, e, t, r, o);
}
return r[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < o.length; c++) i(o[c]);
return i;
}({
AddRecoveryGuideTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "8a1a9ZQpBNA0JMRVm+L6zZT", "AddRecoveryGuideTrait");
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
var i, n = arguments.length, c = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var u = e.length - 1; u >= 0; u--) (i = e[u]) && (c = (n < 3 ? i(c) : n > 3 ? i(t, r, c) : i(t, r)) || c);
return n > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryGuideTrait = void 0;
var c = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.isClassGuide_ProxyOnGuideChangeTrait = function() {
this.onGuideChange();
};
t.prototype.onGuideChange = function() {
var e = hs.classGuideInfo;
e.step === e.totalStep && this.executeRestore();
};
t.prototype.executeRestore = function() {
if (this.props.onlyHighScore) this.recoveryHighScore(); else {
this.recoveryHighScore();
this.recoveryMoSaicPeriod();
this.recoveryChapterProgress();
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
return n([ classId("AddRecoveryGuideTrait") ], t);
}(Trait);
r.AddRecoveryGuideTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryGuideTrait" ]);
//# sourceMappingURL=index.js.map
