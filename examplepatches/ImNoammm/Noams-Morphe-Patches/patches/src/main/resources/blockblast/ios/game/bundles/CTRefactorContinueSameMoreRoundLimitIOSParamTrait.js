window.__require = function t(e, r, o) {
function n(a, u) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var p = r[a] = {
exports: {}
};
e[a][0].call(p.exports, function(t) {
return n(e[a][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorContinueSameMoreRoundLimitIOSParamTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "2997c1kXvBAlLKeOTSrhM26", "CTRefactorContinueSameMoreRoundLimitIOSParamTrait");
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
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorContinueSameMoreRoundLimitIOSParamTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorContinueSameMoreRoundLimitIOSFollowUpTraitPrepareFollowUp = function() {
var t = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
(null == t ? void 0 : t.active) && t.setState({
round: this.props.round
});
var e = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSTrait");
(null == e ? void 0 : e.active) && e.setState({
round: this.props.round
});
};
return i([ classId("CTRefactorContinueSameMoreRoundLimitIOSParamTrait") ], e);
}(Trait);
r.CTRefactorContinueSameMoreRoundLimitIOSParamTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueSameMoreRoundLimitIOSParamTrait" ]);
//# sourceMappingURL=index.js.map
