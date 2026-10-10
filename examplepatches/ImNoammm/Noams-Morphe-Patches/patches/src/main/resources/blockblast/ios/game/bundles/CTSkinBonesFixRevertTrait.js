window.__require = function e(t, r, n) {
function o(c, u) {
if (!r[c]) {
if (!t[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!t[f]) {
var p = "function" == typeof __require && __require;
if (!u && p) return p(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var s = r[c] = {
exports: {}
};
t[c][0].call(s.exports, function(e) {
return o(t[c][1][e] || e);
}, s, s.exports, e, t, r, n);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < n.length; c++) o(n[c]);
return o;
}({
CTSkinBonesFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "e1b30MDXrNE1oYr7X888dBS", "CTSkinBonesFixRevertTrait");
var n, o = this && this.__extends || (n = function(e, t) {
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
}), i = this && this.__decorate || function(e, t, r, n) {
var o, i = arguments.length, c = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, n); else for (var u = e.length - 1; u >= 0; u--) (o = e[u]) && (c = (i < 3 ? o(c) : i > 3 ? o(t, r, c) : o(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTSkinBonesFixRevertTrait = void 0;
var c = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
hs.tp.isCTSkinBonesTraitGetIsOpenTpPerformance(e) && (e.returnValue = !1);
};
return i([ classId("CTSkinBonesFixRevertTrait") ], t);
}(Trait);
r.CTSkinBonesFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTSkinBonesFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
