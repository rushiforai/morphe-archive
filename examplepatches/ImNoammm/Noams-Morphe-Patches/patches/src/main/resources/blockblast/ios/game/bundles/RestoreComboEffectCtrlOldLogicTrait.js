window.__require = function t(e, r, o) {
function n(c, f) {
if (!r[c]) {
if (!e[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!f && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var a = r[c] = {
exports: {}
};
e[c][0].call(a.exports, function(t) {
return n(e[c][1][t] || t);
}, a, a.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
RestoreComboEffectCtrlOldLogicTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "35aa6YNxl5E2L9B9doNcofx", "RestoreComboEffectCtrlOldLogicTrait");
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
var n, i = arguments.length, c = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var f = t.length - 1; f >= 0; f--) (n = t[f]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreComboEffectCtrlOldLogicTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
hs.tp.isComboEffectCtrlTraitIsPreloadComboGradDragonBonesEnable(t) && (t.returnValue = !1);
};
return i([ classId("RestoreComboEffectCtrlOldLogicTrait") ], e);
}(Trait);
r.RestoreComboEffectCtrlOldLogicTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreComboEffectCtrlOldLogicTrait" ]);
//# sourceMappingURL=index.js.map
