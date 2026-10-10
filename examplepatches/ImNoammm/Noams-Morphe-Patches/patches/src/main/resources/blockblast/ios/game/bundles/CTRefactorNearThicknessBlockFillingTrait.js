window.__require = function t(r, e, o) {
function i(c, s) {
if (!e[c]) {
if (!r[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!r[a]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var _ = e[c] = {
exports: {}
};
r[c][0].call(_.exports, function(t) {
return i(r[c][1][t] || t);
}, _, _.exports, t, r, e, o);
}
return e[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < o.length; c++) i(o[c]);
return i;
}({
CTRefactorNearThicknessBlockFillingTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "8ec49uQSPVLHqdR8NVQWkFL", "CTRefactorNearThicknessBlockFillingTrait");
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
}), n = this && this.__decorate || function(t, r, e, o) {
var i, n = arguments.length, c = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (c = (n < 3 ? i(c) : n > 3 ? i(r, e, c) : i(r, e)) || c);
return n > 3 && c && Object.defineProperty(r, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorNearThicknessBlockFillingTrait = void 0;
var c = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPreprocessConditions = function() {
return {
blankAlgorithm: [ {
conditions: !0,
flow: "iosFlow",
platform: "ios"
} ]
};
};
r.prototype.onPreprocessActions = function() {
return {
blankAlgorithm: {
iosFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BLANK.IOS_FILL_BLANK_BIT ], hs.OFFER_TYPE_BLANK.ALGO_NEAR_THICKNESS_BLOCK_FILLING ]
} ]
}
};
};
r.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoOfferClass = function(t) {
var r = [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.IOS_FILL_BLANK_BIT ], e = t.args[0] || [];
hs.algorithmStrategyLogic.haveAlgorithms(e, r) && (t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithms(e, r, hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING));
};
return n([ classId("CTRefactorNearThicknessBlockFillingTrait") ], r);
}(Trait);
e.CTRefactorNearThicknessBlockFillingTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorNearThicknessBlockFillingTrait" ]);
//# sourceMappingURL=index.js.map
