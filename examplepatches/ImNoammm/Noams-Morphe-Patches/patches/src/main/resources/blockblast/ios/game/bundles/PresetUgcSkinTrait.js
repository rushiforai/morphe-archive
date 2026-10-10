window.__require = function t(e, r, n) {
function o(c, u) {
if (!r[c]) {
if (!e[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!e[f]) {
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
e[c][0].call(s.exports, function(t) {
return o(e[c][1][t] || t);
}, s, s.exports, t, e, r, n);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < n.length; c++) o(n[c]);
return o;
}({
PresetUgcSkinTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "d0423B41Q9K2IQEA2gI3eta", "PresetUgcSkinTrait");
var n, o = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, n) {
var o, i = arguments.length, c = i < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, n); else for (var u = t.length - 1; u >= 0; u--) (o = t[u]) && (c = (i < 3 ? o(c) : i > 3 ? o(e, r, c) : o(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PresetUgcSkinTrait = void 0;
var c = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function() {};
e.prototype.getPresetSkinIds = function() {
var t = this.props.num;
return 3 === t ? [ 1003, 1024, 1038 ] : 5 === t ? [ 1003, 1024, 1038, 1009, 1018 ] : [];
};
return i([ classId("PresetUgcSkinTrait") ], e);
}(Trait);
r.PresetUgcSkinTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "PresetUgcSkinTrait" ]);
//# sourceMappingURL=index.js.map
