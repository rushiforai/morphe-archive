window.__require = function e(t, r, o) {
function n(c, i) {
if (!r[c]) {
if (!t[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!t[f]) {
var p = "function" == typeof __require && __require;
if (!i && p) return p(f, !0);
if (a) return a(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
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
for (var a = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorLaneSchemeBeforeTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "c9d0eHyo7RsfY6fChssPU5f", "CTRefactorLaneSchemeBeforeTrait");
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
}), a = this && this.__decorate || function(e, t, r, o) {
var n, a = arguments.length, c = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var i = e.length - 1; i >= 0; i--) (n = e[i]) && (c = (a < 3 ? n(c) : a > 3 ? n(t, r, c) : n(t, r)) || c);
return a > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLaneSchemeBeforeTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.data = function() {
return {
compareScore: 3e3
};
};
t.prototype.onPreprocessConditionOperators = function() {
return {
compareScore: function(e, t) {
return e >= t && {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSRandomRefactoredInfo.laneRandom()
}
};
}
};
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
compareScore: function() {
return ASContext(e.state.compareScore, "泳道前置比较分数");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
LaneScheme: [ {
conditions: {
and: [ {
fact: "classScore",
operator: "compareScore",
value: {
fact: "compareScore"
}
} ]
},
event: {
type: "laneSchemeBeforeCallBack"
},
flow: "laneSchemeBefore"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
LaneScheme: {
laneSchemeBefore: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.compareScore.data.algorithmId"
} ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
t.prototype.laneSchemeBeforeCallBack = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.LaneScheme);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
return a([ classId("CTRefactorLaneSchemeBeforeTrait"), classMethodWatch() ], t);
}(Trait);
r.CTRefactorLaneSchemeBeforeTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLaneSchemeBeforeTrait" ]);
//# sourceMappingURL=index.js.map
