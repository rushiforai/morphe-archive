window.__require = function t(r, e, o) {
function i(n, s) {
if (!e[n]) {
if (!r[n]) {
var a = n.split("/");
a = a[a.length - 1];
if (!r[a]) {
var f = "function" == typeof __require && __require;
if (!s && f) return f(a, !0);
if (c) return c(a, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = a;
}
var u = e[n] = {
exports: {}
};
r[n][0].call(u.exports, function(t) {
return i(r[n][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[n].exports;
}
for (var c = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorFIxIOSBlockLimitClassicsTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "345deGuGK5AppW/z9rL1VXu", "CTRefactorFIxIOSBlockLimitClassicsTrait");
var o, i = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), c = this && this.__decorate || function(t, r, e, o) {
var i, c = arguments.length, n = c < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (n = (c < 3 ? i(n) : c > 3 ? i(r, e, n) : i(r, e)) || n);
return c > 3 && n && Object.defineProperty(r, e, n), n;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFIxIOSBlockLimitClassicsTrait = void 0;
var n = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isCTRefactorBlockLimitClassicsTraitFlushLimitAlgoth = function(t) {
var r = t.args[0];
r && Array.isArray(r) && r.push(hs.OFFER_TYPE.ALGO_HORIZONTAL_3_8);
};
return c([ classId("CTRefactorFIxIOSBlockLimitClassicsTrait") ], r);
}(Trait);
e.CTRefactorFIxIOSBlockLimitClassicsTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFIxIOSBlockLimitClassicsTrait" ]);
//# sourceMappingURL=index.js.map
