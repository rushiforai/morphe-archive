window.__require = function e(t, r, i) {
function n(a, p) {
if (!r[a]) {
if (!t[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!t[c]) {
var u = "function" == typeof __require && __require;
if (!p && u) return u(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = r[a] = {
exports: {}
};
t[a][0].call(f.exports, function(e) {
return n(t[a][1][e] || e);
}, f, f.exports, e, t, r, i);
}
return r[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < i.length; a++) n(i[a]);
return n;
}({
ClearBoardHeartRippleAniFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "7078dftPqNORYz2MpcpHLKB", "ClearBoardHeartRippleAniFixRevertTrait");
var i, n = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
i(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), o = this && this.__decorate || function(e, t, r, i) {
var n, o = arguments.length, a = o < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, i); else for (var p = e.length - 1; p >= 0; p--) (n = e[p]) && (a = (o < 3 ? n(a) : o > 3 ? n(t, r, a) : n(t, r)) || a);
return o > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClearBoardHeartRippleAniFixRevertTrait = void 0;
var a = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
hs.tp.isClearBoardHeartRippleAniTraitIsReuseEffectNode(e) && (e.returnValue = !1);
};
return o([ classId("ClearBoardHeartRippleAniFixRevertTrait") ], t);
}(Trait);
r.ClearBoardHeartRippleAniFixRevertTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "ClearBoardHeartRippleAniFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
