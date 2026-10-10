window.__require = function t(e, r, o) {
function n(a, c) {
if (!r[a]) {
if (!e[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!e[f]) {
var p = "function" == typeof __require && __require;
if (!c && p) return p(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var s = r[a] = {
exports: {}
};
e[a][0].call(s.exports, function(t) {
return n(e[a][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorRatioDownTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "f7e8dnAsaJMPZ5fanuMnQ4f", "CTRefactorRatioDownTrait");
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
r.CTRefactorRatioDownTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorLaneSchemeTraitChangeGetWeightValue = function(t) {
this.handleChangeGetWeightValue(t);
};
e.prototype.isCTRefactorLaneSchemeTraitChangeTargetScore = function(t) {
this.handleChangeTargetScore(t);
};
e.prototype.handleChangeGetWeightValue = function(t) {
t.args[1] && (t.args[0] = this.props.ratio);
};
e.prototype.handleChangeTargetScore = function(t) {
t.args[0] = this.props.score;
};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
if ("preprocessing_LaneScheme" === t) {
var e = TRAIT("CTRefactorLaneSchemeTrait");
(null == e ? void 0 : e.active) && e.setState({
ratioDownObj: {
ratioDown: !0,
color: this.props.color,
score: this.props.score,
ratio: this.props.ratio
}
});
}
};
return i([ classId("CTRefactorRatioDownTrait") ], e);
}(Trait);
r.CTRefactorRatioDownTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRatioDownTrait" ]);
//# sourceMappingURL=index.js.map
