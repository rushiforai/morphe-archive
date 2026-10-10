window.__require = function e(t, r, o) {
function n(i, a) {
if (!r[i]) {
if (!t[i]) {
var p = i.split("/");
p = p[p.length - 1];
if (!t[p]) {
var f = "function" == typeof __require && __require;
if (!a && f) return f(p, !0);
if (c) return c(p, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = p;
}
var u = r[i] = {
exports: {}
};
t[i][0].call(u.exports, function(e) {
return n(t[i][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[i].exports;
}
for (var c = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorExpendBoardScoreTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "c6d7eP0WptMLbjh9aPZx7Lm", "CTRefactorExpendBoardScoreTrait");
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
}), c = this && this.__decorate || function(e, t, r, o) {
var n, c = arguments.length, i = c < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, o); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (i = (c < 3 ? n(i) : c > 3 ? n(t, r, i) : n(t, r)) || i);
return c > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorExpendBoardScoreTrait = void 0;
var i = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.injectBoardScore = function() {
var e, t = TRAIT("CTRefactorLaneSchemeTrait");
if (null == t ? void 0 : t.active) {
var r, o = null === (e = this.props) || void 0 === e ? void 0 : e.range;
r = o ? 720 + 720 * hs.randomFloat(o[0], o[1]) : 720 + 720 * this.props.per;
t.setState({
boardScore: r
});
}
};
t.prototype.onAlgorithmStrategyGameInit = function(e) {
"preprocessing_LaneScheme" === e && this.injectBoardScore();
};
return c([ classId("CTRefactorExpendBoardScoreTrait") ], t);
}(Trait);
r.CTRefactorExpendBoardScoreTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorExpendBoardScoreTrait" ]);
//# sourceMappingURL=index.js.map
