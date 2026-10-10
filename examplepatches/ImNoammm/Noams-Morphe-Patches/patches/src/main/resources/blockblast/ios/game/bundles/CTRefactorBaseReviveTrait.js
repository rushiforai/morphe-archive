window.__require = function e(t, r, o) {
function n(c, f) {
if (!r[c]) {
if (!t[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!t[a]) {
var s = "function" == typeof __require && __require;
if (!f && s) return s(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var u = r[c] = {
exports: {}
};
t[c][0].call(u.exports, function(e) {
return n(t[c][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorBaseReviveTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "bff08R+IJpEDq8XAfKKEcMH", "CTRefactorBaseReviveTrait");
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
}), i = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, c = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var f = e.length - 1; f >= 0; f--) (n = e[f]) && (c = (i < 3 ? n(c) : i > 3 ? n(t, r, c) : n(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorBaseReviveTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoRevive: [ {
conditions: !0,
flow: "flow1"
} ],
TravelRevive: [ {
conditions: !0,
flow: "flow2"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoRevive: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.REVIVE ]
} ]
},
TravelRevive: {
flow2: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.REVIVE ]
} ]
}
}
};
};
return i([ classId("CTRefactorBaseReviveTrait") ], t);
}(Trait);
r.CTRefactorBaseReviveTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBaseReviveTrait" ]);
//# sourceMappingURL=index.js.map
