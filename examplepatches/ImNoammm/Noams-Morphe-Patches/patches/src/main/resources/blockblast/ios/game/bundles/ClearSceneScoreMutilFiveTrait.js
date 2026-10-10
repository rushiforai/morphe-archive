window.__require = function e(t, r, o) {
function n(c, u) {
if (!r[c]) {
if (!t[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!t[l]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var f = r[c] = {
exports: {}
};
t[c][0].call(f.exports, function(e) {
return n(t[c][1][e] || e);
}, f, f.exports, e, t, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
ClearSceneScoreMutilFiveTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "31ddczj9L5GvpN+Cint9ohJ", "ClearSceneScoreMutilFiveTrait");
var o, n = this && this.__extends || (o = function(e, t) {
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
}), i = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, c = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var u = e.length - 1; u >= 0; u--) (n = e[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(t, r, c) : n(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClearSceneScoreMutilFiveTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
var t;
if (hs.tp.isClassScoreInfoGetClearScreenScore(e)) {
e.returnValue = 300 * (null !== (t = this.props.radio) && void 0 !== t ? t : 5);
e.replace = !0;
}
};
return i([ classId("ClearSceneScoreMutilFiveTrait") ], t);
}(Trait);
r.ClearSceneScoreMutilFiveTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ClearSceneScoreMutilFiveTrait" ]);
//# sourceMappingURL=index.js.map
