window.__require = function e(t, r, n) {
function i(a, f) {
if (!r[a]) {
if (!t[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!t[l]) {
var c = "function" == typeof __require && __require;
if (!f && c) return c(l, !0);
if (o) return o(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var u = r[a] = {
exports: {}
};
t[a][0].call(u.exports, function(e) {
return i(t[a][1][e] || e);
}, u, u.exports, e, t, r, n);
}
return r[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < n.length; a++) i(n[a]);
return i;
}({
ClearInitPanelEffectFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "b7845zrsYlBl7bELx34WTC9", "ClearInitPanelEffectFixRevertTrait");
var n, i = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), o = this && this.__decorate || function(e, t, r, n) {
var i, o = arguments.length, a = o < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, n); else for (var f = e.length - 1; f >= 0; f--) (i = e[f]) && (a = (o < 3 ? i(a) : o > 3 ? i(t, r, a) : i(t, r)) || a);
return o > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClearInitPanelEffectFixRevertTrait = void 0;
var a = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
if (hs.tp.isClassBoardClearInitPanelItemPoolIsEnabled(e)) {
e.returnValue = !1;
e.returnState = !0;
}
if (hs.tp.isClearInitPanelEffectTraitClearEffect(e) && this.memLeakFixEnabled()) {
var t = e.args[0];
cc.isValid(t) && t.removeFromParent(!0);
e.replace = !0;
e.returnState = !0;
}
};
t.prototype.memLeakFixEnabled = function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.memLeakFixEnabled) && void 0 !== t && t;
};
return o([ classId("ClearInitPanelEffectFixRevertTrait") ], t);
}(Trait);
r.ClearInitPanelEffectFixRevertTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "ClearInitPanelEffectFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
