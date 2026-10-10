window.__require = function e(t, r, o) {
function n(i, c) {
if (!r[i]) {
if (!t[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!t[s]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var p = r[i] = {
exports: {}
};
t[i][0].call(p.exports, function(e) {
return n(t[i][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorExceedScoreTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "91607XffItM9rXggrSGZkR1", "CTRefactorExceedScoreTrait");
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
var n, a = arguments.length, i = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (n = e[c]) && (i = (a < 3 ? n(i) : a > 3 ? n(t, r, i) : n(t, r)) || i);
return a > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorExceedScoreTrait = void 0;
var i = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.data = function() {
return {
randomScore: 0
};
};
t.prototype.updateAlgorithmList = function(e) {
return e;
};
Object.defineProperty(t.prototype, "start", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ExceedScoreTrait", "start", this.props, 3e3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "end", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ExceedScoreTrait", "end", this.props, 5e3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "wayIdArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ExceedScoreTrait", "wayIdArr", this.props, [ 7 ]);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "randomArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ExceedScoreTrait", "randomArr", this.props, [ 1 ]);
},
enumerable: !1,
configurable: !0
});
t.prototype.resolveGPAlgorithmList = function() {
for (var e = Math.random(), t = 0, r = 0, o = 0, n = this.randomArr.length; o < n; o++) if (e < (r += this.randomArr[o])) {
t = this.wayIdArr[o];
break;
}
return [ t ];
};
t.prototype.resolveIOSAlgorithmList = function() {
var e = this.props, t = e.fillParam, r = e.randomParam, o = e.offerBlockId;
return t && r ? 100 * Math.random() >> 0 >= 10 * t ? hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit() : this.updateAlgorithmList(hs.algorithmStrategyIOSRandomRefactoredInfo.laneRandom()) : o ? this.updateAlgorithmList([ hs.OFFER_TYPE.SUI_JI_WU_SI ]) : this.updateAlgorithmList(hs.algorithmStrategyIOSRandomRefactoredInfo.laneRandom());
};
t.prototype.resolveAlgorithmList = function() {
return this.resolveIOSAlgorithmList();
};
t.prototype.onAlgorithmStrategyGameInit = function(e) {
if ("preprocessing_LaneScheme" === e) {
this.state.randomScore = Math.floor(Math.random() * (this.end - this.start)) + this.start;
var t = TRAIT("CTRefactorLaneSchemeBeforeTrait");
(null == t ? void 0 : t.active) && t.setState({
compareScore: this.state.randomScore
});
}
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
currentScore: function() {
return ASContext(hs.classScoreInfo.score, "当前分数");
},
randomScore: function() {
return ASContext(e.state.randomScore, "随机阈值分数");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
LaneScheme: [ {
conditions: {
and: [ {
fact: "currentScore",
operator: "greaterThan",
value: {
fact: "randomScore"
}
} ]
},
event: {
type: "markExceedScoreSource"
},
flow: "exceedScore"
} ]
}
};
};
t.prototype.markExceedScoreSource = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.LaneScheme);
};
t.prototype.onPreprocessConditionOperators = function() {
var e = this;
return {
greaterThan: function(t, r) {
return t >= r && {
status: !0,
data: {
algorithmId: e.resolveAlgorithmList()
}
};
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
LaneScheme: {
exceedScore: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.greaterThan.data.algorithmId"
} ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
return a([ classId("CTRefactorExceedScoreTrait"), classMethodWatch() ], t);
}(Trait);
r.CTRefactorExceedScoreTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorExceedScoreTrait" ]);
//# sourceMappingURL=index.js.map
