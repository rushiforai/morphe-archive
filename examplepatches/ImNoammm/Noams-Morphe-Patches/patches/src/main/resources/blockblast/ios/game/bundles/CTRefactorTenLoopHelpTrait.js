window.__require = function t(e, r, o) {
function n(c, f) {
if (!r[c]) {
if (!e[c]) {
var p = c.split("/");
p = p[p.length - 1];
if (!e[p]) {
var a = "function" == typeof __require && __require;
if (!f && a) return a(p, !0);
if (i) return i(p, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = p;
}
var u = r[c] = {
exports: {}
};
e[c][0].call(u.exports, function(t) {
return n(e[c][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorTenLoopHelpTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "5b60dfwui1N87VIZdZURzOo", "CTRefactorTenLoopHelpTrait");
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
r.CTRefactorTenLoopHelpTrait = void 0;
var c = [ {
tryTimes: [ 2, 2, 2, 2, 3, 2, 2, 2, 5, 2, 2, 2, 2, 2, 4, 2, 2, 2, 6, 2, 3, 3, 3, 3, 5, 3, 3, 3, 7, 3, 3, 3, 3, 3, 5, 3, 3, 3, 8, 3, 3, 3, 3, 3, 5, 3, 3, 3, 8, 3, 3, 3, 3, 3, 5, 3, 3, 3, 8, 3, 5, 5, 5, 5, 12, 5, 5, 5, 15, 5, 5, 5, 5, 5, 12, 5, 5, 5, 15, 5, 5, 5, 5, 5, 12, 5, 5, 5, 15, 5, 5, 5, 15, 15, 15, 3 ],
id: 1
} ], f = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorChapterAlgoStrategyTraitUpdateTryTimesConfig = function(t) {
t.args && t.args.length > 0 && (t.args[0] = c);
};
return i([ classId("CTRefactorTenLoopHelpTrait") ], e);
}(Trait);
r.CTRefactorTenLoopHelpTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTenLoopHelpTrait" ]);
//# sourceMappingURL=index.js.map
