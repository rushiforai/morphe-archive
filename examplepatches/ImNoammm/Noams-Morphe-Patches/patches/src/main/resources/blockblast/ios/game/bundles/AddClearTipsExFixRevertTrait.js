window.__require = function t(e, r, i) {
function n(c, u) {
if (!r[c]) {
if (!e[c]) {
var p = c.split("/");
p = p[p.length - 1];
if (!e[p]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(p, !0);
if (o) return o(p, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = p;
}
var f = r[c] = {
exports: {}
};
e[c][0].call(f.exports, function(t) {
return n(e[c][1][t] || t);
}, f, f.exports, t, e, r, i);
}
return r[c].exports;
}
for (var o = "function" == typeof __require && __require, c = 0; c < i.length; c++) n(i[c]);
return n;
}({
AddClearTipsExFixRevertTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "99589/kZmpDcZLWmvs9keBu", "AddClearTipsExFixRevertTrait");
var i, n = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
i(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, i) {
var n, o = arguments.length, c = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, i); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (c = (o < 3 ? n(c) : o > 3 ? n(e, r, c) : n(e, r)) || c);
return o > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddClearTipsExFixRevertTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isAddClearTipsExTraitUseOldLogic(t)) {
t.returnValue = !0;
t.returnState = !0;
}
};
return o([ classId("AddClearTipsExFixRevertTrait") ], e);
}(Trait);
r.AddClearTipsExFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "AddClearTipsExFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
