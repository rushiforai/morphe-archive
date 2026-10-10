window.__require = function t(e, r, o) {
function i(n, c) {
if (!r[n]) {
if (!e[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!e[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var u = r[n] = {
exports: {}
};
e[n][0].call(u.exports, function(t) {
return i(e[n][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorAlgorithmStrategyDealTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "59f31/mRnZBDYEAx1Vto3XY", "CTRefactorAlgorithmStrategyDealTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var i, a = arguments.length, n = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, r, n) : i(e, r)) || n);
return a > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAlgorithmStrategyDealTrait = void 0;
var n = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
isUpdateData: !0
};
};
e.prototype.updateAlgorithmDataStatistics = function() {
var t = {
blocksList: hs.algorithmInfo.blockIdList
}, e = hs.algorithmDataStatistics.algorithmDataStatistics;
e.length >= 5 && e.shift();
e.push(t);
hs.algorithmDataStatistics.setAlgorithmDataStatistics(e);
as.AlgorithmStrategyAlgoBlockIdListPatch.patch([], this);
as.AlgorithmStrategyAlgoActualNamePatch.patch([], this);
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isUpdateData: function() {
return ASContext(t.state.isUpdateData, "是否更新出题统计数据");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
deal: [ {
conditions: {
fact: "isUpdateData",
operator: "=",
value: !0
},
event: {
type: "updateAlgorithmDataStatistics"
}
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {};
};
return a([ classId("CTRefactorAlgorithmStrategyDealTrait") ], e);
}(Trait);
r.CTRefactorAlgorithmStrategyDealTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgorithmStrategyDealTrait" ]);
//# sourceMappingURL=index.js.map
