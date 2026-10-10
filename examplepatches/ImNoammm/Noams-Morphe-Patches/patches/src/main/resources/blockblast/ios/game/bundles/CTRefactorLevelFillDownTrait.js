window.__require = function t(e, r, o) {
function n(c, l) {
if (!r[c]) {
if (!e[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!e[f]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var a = r[c] = {
exports: {}
};
e[c][0].call(a.exports, function(t) {
return n(e[c][1][t] || t);
}, a, a.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorLevelFillDownTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "f0f78KRIjJEcYKWgbxWqUEb", "CTRefactorLevelFillDownTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLevelFillDownTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onPreprocessConditions = function() {
return {
conditionAlgorithm: [ {
conditions: !0,
flow: "levelFillDownInsert",
platform: "ios",
gameMode: "journey"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
conditionAlgorithm: {
levelFillDownInsert: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "insertAfter",
args: [ hs.OFFER_TYPE_BLANK.TRAVEL_FILL_FUNCTION_BIT, hs.OFFER_TYPE_BASE.IOS_SUI_JI_WU_SI ]
} ]
}
};
};
return i([ classId("CTRefactorLevelFillDownTrait") ], e);
}(Trait);
r.CTRefactorLevelFillDownTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLevelFillDownTrait" ]);
//# sourceMappingURL=index.js.map
