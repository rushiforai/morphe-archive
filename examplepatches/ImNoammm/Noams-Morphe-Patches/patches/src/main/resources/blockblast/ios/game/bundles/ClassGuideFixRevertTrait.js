window.__require = function t(e, r, i) {
function n(u, s) {
if (!r[u]) {
if (!e[u]) {
var c = u.split("/");
c = c[c.length - 1];
if (!e[c]) {
var a = "function" == typeof __require && __require;
if (!s && a) return a(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = c;
}
var f = r[u] = {
exports: {}
};
e[u][0].call(f.exports, function(t) {
return n(e[u][1][t] || t);
}, f, f.exports, t, e, r, i);
}
return r[u].exports;
}
for (var o = "function" == typeof __require && __require, u = 0; u < i.length; u++) n(i[u]);
return n;
}({
ClassGuideFixRevertTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "0c386iDkyxJ65dIOkDmZgRu", "ClassGuideFixRevertTrait");
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
var n, o = arguments.length, u = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (u = (o < 3 ? n(u) : o > 3 ? n(e, r, u) : n(e, r)) || u);
return o > 3 && u && Object.defineProperty(e, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClassGuideFixRevertTrait = void 0;
var u = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isClassGuideStopGuideTween(t)) {
t.replace = !0;
t.returnState = !0;
}
if (hs.tp.isClassGuideSetMoveContainerNodeStatus(t)) {
var e = t.args[0], r = t.args[1], i = t.args[2];
if (!e || !cc.isValid(e)) return;
e.stopAllActions();
e.opacity = 255;
e.x = r;
e.y = i;
t.replace = !0;
t.returnState = !0;
}
};
return o([ classId("ClassGuideFixRevertTrait") ], e);
}(Trait);
r.ClassGuideFixRevertTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "ClassGuideFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
