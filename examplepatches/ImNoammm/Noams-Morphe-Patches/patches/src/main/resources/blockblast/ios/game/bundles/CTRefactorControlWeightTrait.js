window.__require = function t(r, e, o) {
function n(a, c) {
if (!e[a]) {
if (!r[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!r[s]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var l = e[a] = {
exports: {}
};
r[a][0].call(l.exports, function(t) {
return n(r[a][1][t] || t);
}, l, l.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorControlWeightTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "77147OdIBhBT7sj9QLlCNK9", "CTRefactorControlWeightTrait");
var o, n = this && this.__extends || (o = function(t, r) {
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
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorControlWeightTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.Min_W = 370;
r.Min_Min_W = 100;
r.Max_W = 450;
return r;
}
r.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
currentScore: function() {
return ASContext(hs.scoreInfo.score, "当前分数");
},
compareScore: function() {
return ASContext(t.getCompareScore(), "随机分数阈值");
},
isLaneScheme: function() {
return ASContext(t.isLaneSchemeSource(), "是否为泳道源");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
postPreprocessing: [ {
conditions: {
and: [ {
fact: "isLaneScheme",
operator: "=",
value: !0
}, {
fact: "currentScore",
operator: ">=",
value: {
fact: "compareScore"
}
}, {
fact: "currentScore",
operator: "controlWeightTrigger"
} ]
},
flow: "controlWeight",
platform: "ios"
} ]
};
};
r.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
controlWeightTrigger: function() {
return t.getTriggerResult();
}
};
};
r.prototype.onPreprocessActions = function() {
return {
postPreprocessing: {
controlWeight: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ {
fact: "operator.controlWeightTrigger.data.algorithmList"
} ]
} ]
}
};
};
r.prototype.getCompareScore = function() {
var t, r, e = 3e3, o = TRAIT("ExceedScoreAdjustParamsTrait") || TRAIT("CTRefactorExceedScoreTrait");
(null == o ? void 0 : o.active) && (e = (null === (t = o.state) || void 0 === t ? void 0 : t.randomScore) ? null === (r = o.state) || void 0 === r ? void 0 : r.randomScore : e);
return e;
};
r.prototype.isLaneSchemeSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.LaneScheme;
};
r.prototype.getTriggerResult = function() {
var t = new hs.BinaryBoard();
t.convertToBinaryBoard(hs.boardInfo.faceBlocks);
var r, e = t.getWeightValueObj();
if (e >= this.Min_W && e <= this.Max_W || e <= this.Min_Min_W) r = this.getAlgorithmList([]); else {
r = this.getAlgorithmList([ hs.OFFER_TYPE_BASE.ALGO_SCORE ]);
this.addAlgorithmNameMapping();
}
return !(r.length <= 0) && {
status: !0,
data: {
algorithmList: r
}
};
};
r.prototype.addAlgorithmNameMapping = function() {
var t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == t ? void 0 : t.active) && t.addAlgorithmNameMapping(hs.OFFER_TYPE_BASE.ALGO_SCORE, "CTRefactorControlWeightTrait", null, null, hs.OFFER_TYPE_BASE.ALGO_SCORE);
};
r.prototype.getAlgorithmList = function(t) {
return t;
};
return i([ classId("CTRefactorControlWeightTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorControlWeightTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorControlWeightTrait" ]);
//# sourceMappingURL=index.js.map
