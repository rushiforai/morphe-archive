window.__require = function t(e, r, n) {
function o(c, f) {
if (!r[c]) {
if (!e[c]) {
var u = c.split("/");
u = u[u.length - 1];
if (!e[u]) {
var p = "function" == typeof __require && __require;
if (!f && p) return p(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = u;
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
IsOpenRainbowPutBlocksEffectFixRevertTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "37ddaOAdPxCJ5mTY8F33lOB", "IsOpenRainbowPutBlocksEffectFixRevertTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, n); else for (var f = t.length - 1; f >= 0; f--) (o = t[f]) && (c = (i < 3 ? o(c) : i > 3 ? o(e, r, c) : o(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.IsOpenRainbowPutBlocksEffectFixRevertTrait = void 0;
var c = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function() {};
return i([ classId("IsOpenRainbowPutBlocksEffectFixRevertTrait") ], e);
}(Trait);
r.IsOpenRainbowPutBlocksEffectFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "IsOpenRainbowPutBlocksEffectFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
