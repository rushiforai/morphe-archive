window.__require = function t(e, r, o) {
function n(c, a) {
if (!r[c]) {
if (!e[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!e[f]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var p = r[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return n(e[c][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorLevelExpAlgorithmTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "c8b89M5qSlE3LXc0glc9xMK", "CTRefactorLevelExpAlgorithmTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLevelExpAlgorithmTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
TravelTrait: [ {
conditions: !0,
flow: "flow1"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
TravelTrait: {
flow1: [ {
operator: "AlgorithmStrategyDisableOperator",
type: "disable",
args: [ "CTRefactorBaseChapterTrait" ]
} ]
}
}
};
};
return i([ classId("CTRefactorLevelExpAlgorithmTrait") ], e);
}(Trait);
r.CTRefactorLevelExpAlgorithmTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLevelExpAlgorithmTrait" ]);
//# sourceMappingURL=index.js.map
