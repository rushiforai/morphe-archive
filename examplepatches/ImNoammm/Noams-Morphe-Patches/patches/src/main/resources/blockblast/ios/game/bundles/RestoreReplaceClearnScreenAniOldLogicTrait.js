window.__require = function e(t, r, n) {
function o(c, a) {
if (!r[c]) {
if (!t[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!t[l]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var p = r[c] = {
exports: {}
};
t[c][0].call(p.exports, function(e) {
return o(t[c][1][e] || e);
}, p, p.exports, e, t, r, n);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < n.length; c++) o(n[c]);
return o;
}({
RestoreReplaceClearnScreenAniOldLogicTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "c15baJ0su1MqbDzNpKUVxPB", "RestoreReplaceClearnScreenAniOldLogicTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, n); else for (var a = e.length - 1; a >= 0; a--) (o = e[a]) && (c = (i < 3 ? o(c) : i > 3 ? o(t, r, c) : o(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreReplaceClearnScreenAniOldLogicTrait = void 0;
var c = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
hs.tp.isReplaceClearnScreenAniTraitIsReuseOptimizeEnable(e) && (e.returnValue = !1);
};
return i([ classId("RestoreReplaceClearnScreenAniOldLogicTrait") ], t);
}(Trait);
r.RestoreReplaceClearnScreenAniOldLogicTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreReplaceClearnScreenAniOldLogicTrait" ]);
//# sourceMappingURL=index.js.map
