window.__require = function t(e, r, i) {
function o(l, s) {
if (!r[l]) {
if (!e[l]) {
var n = l.split("/");
n = n[n.length - 1];
if (!e[n]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(n, !0);
if (a) return a(n, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = n;
}
var T = r[l] = {
exports: {}
};
e[l][0].call(T.exports, function(t) {
return o(e[l][1][t] || t);
}, T, T.exports, t, e, r, i);
}
return r[l].exports;
}
for (var a = "function" == typeof __require && __require, l = 0; l < i.length; l++) o(i[l]);
return o;
}({
CTRefactorIsPuzzleTimeTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "91979NSVPhElK5OnphDZpOm", "CTRefactorIsPuzzleTimeTrait");
var i, o, a = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
i(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), l = this && this.__decorate || function(t, e, r, i) {
var o, a = arguments.length, l = a < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, i); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (l = (a < 3 ? o(l) : a > 3 ? o(e, r, l) : o(e, r)) || l);
return a > 3 && l && Object.defineProperty(e, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorIsPuzzleTimeTrait = r.CTRefactorIsPuzzleTimeStatus = void 0;
(function(t) {
t[t.default = 0] = "default";
t[t.open = 1] = "open";
t[t.close = 2] = "close";
})(o = r.CTRefactorIsPuzzleTimeStatus || (r.CTRefactorIsPuzzleTimeStatus = {}));
var s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isPuzzleTimeHandled = !1;
e.newRoundDiffTime = 0;
e.shouldTriggerFirst = !1;
e.shouldTriggerOther = !1;
e._isNoResultPuzzleTimeTrigger = !1;
return e;
}
r = e;
e.prototype.data = function() {
return {
puzzleTimeFirst: 0,
puzzleTimeOther: 0,
initTime: 0,
isHardFirst: !0,
firstAlgoId: hs.OFFER_TYPE.KUN_NAN_TI,
otherAlgoId: hs.OFFER_TYPE.KUN_NAN_TI,
puzzleTimeStatus: o.default
};
};
e.prototype.isCTRefactorClearBoardPlusTraitPuzzleTimeData = function(t) {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
(null == e ? void 0 : e.active) && (t.returnValue = {
isHardFirst: this.state.isHardFirst,
initTime: e.state.initTime,
puzzleTimeFirst: e.state.puzzleTimeFirst
});
};
e.isPuzzleRelatedTraitSource = function(t) {
return "CTRefactorPuzzleConditionDiffTrait" === t || "PuzzleConditionDiffTrait" === t || "DurationPreAlgoToOhterAlgoTrait" === t || "CTRefactorPuzzleConditionDiffExperimentTrait" === t || "PuzzleConditionDiffExperimentTrait" === t || "CTRefactorClassReplacePuzzleTimeTrait" === t || "ClassReplacePuzzleTimeTrait" === t || "PuzzleTimeRandomTrait" === t || "CTRefactorPuzzleTimeRandomTrait" === t;
};
e.isPuzzleRelatedIOSTraitSource = function(t) {
return "CTRefactorPuzzleConditionDiffExperimentTrait" === t || "PuzzleConditionDiffExperimentTrait" === t || "CTRefactorClassReplacePuzzleTimeTrait" === t || "ClassReplacePuzzleTimeTrait" === t || "PuzzleTimeRandomTrait" === t || "CTRefactorPuzzleTimeRandomTrait" === t;
};
e.prototype.strageOverResetState = function() {
this.isPuzzleTimeHandled = !1;
this.newRoundDiffTime = 0;
this.shouldTriggerFirst = !1;
this.shouldTriggerOther = !1;
this._isNoResultPuzzleTimeTrigger = !1;
};
e.prototype.onAlgorithmStrategyPreprocessComplete = function(t) {
var e, i, o, a;
this.strageOverResetState();
if (null === (e = t.sdk) || void 0 === e ? void 0 : e.SDK_SUCCESS) {
var l = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1, s = null === (i = t.sdk) || void 0 === i ? void 0 : i.actualAlgorithmId, n = (null === (o = t.sdk) || void 0 === o || o.traitSource, 
null === (a = t.sdk) || void 0 === a ? void 0 : a.algorithmListSource), u = null != s && hs.isValueInEnum(s, hs.OFFER_TYPE_DIFFICULTY), T = r.isPuzzleRelatedIOSTraitSource(hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2);
if (u || T && "normal" == n || this.isPuzzleSuccessByTrait()) {
if (l == hs.ClassAlgorithmSourceType.PuzzleTimeFirst) {
this.state.isHardFirst = !1;
this.state.initTime = Date.now();
this.resetInitTime();
} else if (l == hs.ClassAlgorithmSourceType.PuzzleTimeOther) {
this.state.initTime = Date.now();
this.resetInitTime();
}
this.returnPuzzleTimeTriggerSuccess(!0, l);
} else this.returnPuzzleTimeTriggerSuccess(!1, l);
}
};
e.prototype.resetInitTime = function() {};
e.prototype.logPuzzleTimeEvalForDebug = function() {};
e.prototype.puzzleTimeFirstNoTrigger = function() {
this.resultPuzzleTime();
this._isNoResultPuzzleTimeTrigger = !0;
};
e.prototype.puzzleTimeOtherNoTrigger = function() {
this._isNoResultPuzzleTimeTrigger || this.resultPuzzleTime();
};
e.prototype.firstPuzzleTimeCall = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.PuzzleTimeFirst);
this.resultPuzzleTime(hs.ClassAlgorithmSourceType.PuzzleTimeFirst);
};
e.prototype.otherPuzzleTimeCall = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.PuzzleTimeOther);
this.resultPuzzleTime(hs.ClassAlgorithmSourceType.PuzzleTimeOther);
};
e.prototype.resultPuzzleTime = function() {};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
"preprocessing_PuzzleTime" === t && this.initPuzzleTime();
};
e.prototype.initPuzzleTime = function() {
this.strageOverResetState();
var t = hs.randomInt(120, 180), e = TRAIT("CTRefactorIsPuzzleTimeTrait");
(null == e ? void 0 : e.active) && (e.state.puzzleTimeFirst = t);
var r;
r = hs.randomInt(60, 120);
if (null == e ? void 0 : e.active) {
e.state.puzzleTimeOther = r;
var i = Date.now();
e.state.initTime = i;
}
this.state.isHardFirst = !0;
this.state.puzzleTimeStatus = o.default;
this.dynamicAdjustPuzzleTimeFirst();
this.afterRetPuzzleTime();
};
e.prototype.handlePuzzleTimeAlgo = function() {
if (!this.isPuzzleTimeHandled) {
this.isPuzzleTimeHandled = !0;
var t = this.dynamicAdjustInitTime(this.state.initTime), e = (new Date().getTime() - t) / 1e3;
this.newRoundDiffTime = this.updateDiffTime(e);
var r = this.state.isHardFirst ? this.state.puzzleTimeFirst : this.state.puzzleTimeOther;
r = this.dynamicAdjustDieDefaultTime(r);
this.shouldTriggerFirst = this.checkFirstHardTriggerCondition(this.newRoundDiffTime, r);
this.shouldTriggerOther = this.checkOtherHardTriggerCondition();
}
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
this.logPuzzleTimeEvalForDebug();
this.handlePuzzleTimeAlgo();
return buildLazyConditionContext({
isHardFirstContext: function() {
return ASContext(t.state.isHardFirst, "是否是困难难题");
},
firstAlgoIdContext: function() {
return ASContext(t.state.firstAlgoId, "定时难题首次出题算法ID");
},
otherAlgoIdContext: function() {
return ASContext(t.state.otherAlgoId, "定时难题后续出题算法ID");
},
puzzleTimeStatusContext: function() {
return ASContext(t.state.puzzleTimeStatus, "定时难题状态");
},
difftimeContext: function() {
return ASContext(t.newRoundDiffTime, "定时难题时间差");
},
shouldTriggerFirst: function() {
return ASContext(t.shouldTriggerFirst, "是否触发首次定时难题");
},
shouldTriggerOther: function() {
return ASContext(t.shouldTriggerOther, "是否触发后续定时难题");
},
puzzleTimeFirst: function() {
return ASContext(t.state.puzzleTimeFirst, "定时难题首次出题时间");
},
puzzleTimeOther: function() {
return ASContext(t.state.puzzleTimeOther, "定时难题后续出题时间");
}
});
};
e.prototype.dynamicAdjustDieDefaultTime = function(t) {
return t;
};
e.prototype.checkFirstHardTriggerCondition = function(t, e) {
return t >= e;
};
e.prototype.onPreprocessConditionOperators = function() {
return {
resolvePuzzleTimeAlgo: function() {
return {
status: !0,
data: {
algo: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceDifficultyOptimise(),
fail: hs.algorithmStrategyIOSRandomRefactoredInfo.puzzleFailTiming({
isDown: !0
}).filter(function(t) {
return t != hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
})
}
};
}
};
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
PuzzleTimeFirst: [ {
conditions: {
or: [ {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !0
}, {
fact: "difftimeContext",
operator: ">=",
value: {
fact: "puzzleTimeFirst"
}
}, {
fact: "puzzleTimeStatusContext",
operator: "=",
value: o.default
} ]
}, {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !0
}, {
fact: "puzzleTimeStatusContext",
operator: "=",
value: o.open
} ]
} ]
},
event: {
type: "firstPuzzleTimeCall"
},
platform: "gp",
flow: "flow1"
}, {
conditions: {
and: [ {
or: [ {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !0
}, {
fact: "shouldTriggerFirst",
operator: "=",
value: !0
}, {
fact: "puzzleTimeStatusContext",
operator: "=",
value: o.default
} ]
}, {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !0
}, {
fact: "puzzleTimeStatusContext",
operator: "=",
value: o.open
} ]
} ]
}, {
fact: "isHardFirstContext",
operator: "resolvePuzzleTimeAlgo",
value: !0
} ]
},
event: {
type: "firstPuzzleTimeCall"
},
platform: "ios",
flow: "iosFlow1"
}, {
conditions: !0,
event: {
type: "puzzleTimeFirstNoTrigger"
},
flow: "flowFirstFalse"
} ],
PuzzleTimeOther: [ {
conditions: {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !1
}, {
fact: "shouldTriggerOther",
operator: "=",
value: !0
}, {
fact: "difftimeContext",
operator: ">=",
value: {
fact: "puzzleTimeOther"
}
} ]
},
event: {
type: "otherPuzzleTimeCall"
},
platform: "gp",
flow: "flow2"
}, {
conditions: {
and: [ {
fact: "isHardFirstContext",
operator: "=",
value: !1
}, {
fact: "shouldTriggerOther",
operator: "=",
value: !0
}, {
fact: "difftimeContext",
operator: ">=",
value: {
fact: "puzzleTimeOther"
}
}, {
fact: "isHardFirstContext",
operator: "resolvePuzzleTimeAlgo",
value: !0
} ]
},
event: {
type: "otherPuzzleTimeCall"
},
platform: "ios",
flow: "iosFlow2"
}, {
conditions: !0,
event: {
type: "puzzleTimeOtherNoTrigger"
},
flow: "flowOtherFalse"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
var t, e;
return {
mutex: {
PuzzleTimeFirst: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ null !== (t = this.state.firstAlgoId) && void 0 !== t ? t : hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI ]
} ],
iosFlow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.resolvePuzzleTimeAlgo.data.algo"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolvePuzzleTimeAlgo.data.fail"
} ]
} ],
flowFirstFalse: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
},
PuzzleTimeOther: {
flow2: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ null !== (e = this.state.otherAlgoId) && void 0 !== e ? e : hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI ]
} ],
iosFlow2: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.resolvePuzzleTimeAlgo.data.algo"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolvePuzzleTimeAlgo.data.fail"
} ]
} ],
flowOtherFalse: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
e.prototype.afterRetPuzzleTime = function() {};
e.prototype.checkOtherHardTriggerCondition = function() {
return !0;
};
e.prototype.dynamicAdjustInitTime = function() {
return this.state.initTime;
};
e.prototype.dynamicAdjustPuzzleTimeFirst = function() {};
e.prototype.isPuzzleSuccessByTrait = function() {
return !1;
};
e.prototype.returnPuzzleTimeTriggerSuccess = function() {};
e.prototype.updateDiffTime = function(t) {
return t;
};
var r;
return r = l([ classId("CTRefactorIsPuzzleTimeTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorIsPuzzleTimeTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsPuzzleTimeTrait" ]);
//# sourceMappingURL=index.js.map
