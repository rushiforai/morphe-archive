window.__require = function t(e, r, o) {
function n(a, c) {
if (!r[a]) {
if (!e[a]) {
var p = a.split("/");
p = p[p.length - 1];
if (!e[p]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(p, !0);
if (i) return i(p, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = p;
}
var u = r[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return n(e[a][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorBaseplateLaneTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "e5041gH729PwIrKsYZ2BSi9", "CTRefactorBaseplateLaneTrait");
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
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorBaseplateLaneTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.injectWeightRatioArr = function() {
var t = TRAIT("CTRefactorLaneSchemeTrait");
(null == t ? void 0 : t.active) && t.setState({
weightRatioArr: this.props.sections
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
LaneScheme: [ {
conditions: !0,
event: {
type: "injectWeightRatioArr"
}
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {};
};
return i([ classId("CTRefactorBaseplateLaneTrait") ], e);
}(Trait);
r.CTRefactorBaseplateLaneTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBaseplateLaneTrait" ]);
//# sourceMappingURL=index.js.map
