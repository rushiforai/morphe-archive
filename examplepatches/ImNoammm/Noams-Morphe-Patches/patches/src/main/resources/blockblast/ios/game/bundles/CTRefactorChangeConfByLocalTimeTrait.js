window.__require = function e(t, r, o) {
function i(s, n) {
if (!r[s]) {
if (!t[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!t[l]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var f = r[s] = {
exports: {}
};
t[s][0].call(f.exports, function(e) {
return i(t[s][1][e] || e);
}, f, f.exports, e, t, r, o);
}
return r[s].exports;
}
for (var a = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
CTRefactorChangeConfByLocalTimeTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "d4a35LhYcVEO6mSSfaIcQiW", "CTRefactorChangeConfByLocalTimeTrait");
var o, i, a = this && this.__extends || (o = function(e, t) {
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
}), s = this && this.__decorate || function(e, t, r, o) {
var i, a = arguments.length, s = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, o); else for (var n = e.length - 1; n >= 0; n--) (i = e[n]) && (s = (a < 3 ? i(s) : a > 3 ? i(t, r, s) : i(t, r)) || s);
return a > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorChangeConfByLocalTimeTrait = r.CTRefactorLocalTimeScoreTier = void 0;
(function(e) {
e[e.lessThan1000 = 0] = "lessThan1000";
e[e.lessThan3000 = 1] = "lessThan3000";
e[e.moreThan3000 = 2] = "moreThan3000";
})(i = r.CTRefactorLocalTimeScoreTier || (r.CTRefactorLocalTimeScoreTier = {}));
var n = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isWithinTimePeriodByLocalDayTime = !1;
t.offerNewBlockHardModelState = !1;
t.isPassFirstDiff = !1;
t.puzzleTimeFirst = null;
t.puzzleTimeOther = null;
t.curTimePeriodState = -1;
return t;
}
t.prototype.isClassAlgorithmLifeCycle_GameStart_ProxyNewGameInit = function() {
this.recordGameTimePeriodState();
this.initGameStartStateByLocalDayTime(!0);
};
t.prototype.onAlgorithmStrategyGameInit = function() {
-1 === this.curTimePeriodState && this.recordGameTimePeriodState();
this.initGameStartStateByLocalDayTime(!1);
if (this.isMeetTheConditionByLocalDayTime()) {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == e ? void 0 : e.active) {
this.initPuzzleTime();
e.state.puzzleTimeFirst = this.puzzleTimeFirst;
e.state.puzzleTimeOther = this.puzzleTimeOther;
this.isPassFirstDiff = !1;
this.offerNewBlockHardModelState = !1;
return this.disablePuzzleBeforeAfterTiming();
}
}
this.isPassFirstDiff = !1;
this.offerNewBlockHardModelState = !1;
};
t.prototype.disablePuzzleBeforeAfterTiming = function() {
return {
disableTraits: [ "CTRefactorPuzzleBeforeTimingTrait", "CTRefactorPuzzleAfterTimingTrait" ]
};
};
t.prototype.registerNameMappingByCurrentTier = function(e) {
this.registerAlgorithmNameMappingByTier(this.getCurrentScoreTier(), e);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
t.prototype.registerNameMappingDayForceFirst = function(e) {
this.registerNameMappingByCurrentTier(e);
var t = hs.ClassAlgorithmSourceType.PuzzleTimeFirst;
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(t);
};
t.prototype.registerNameMappingDayForceOther = function(e) {
this.registerNameMappingByCurrentTier(e);
var t = hs.ClassAlgorithmSourceType.PuzzleTimeOther;
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(t);
};
t.prototype.registerAlgorithmNameMappingByTier = function(e, t) {
var r = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == r ? void 0 : r.active) {
var o = "CTRefactorChangeConfByLocalTimeTrait";
if (e !== i.lessThan1000) if (e !== i.lessThan3000) {
t.algo.forEach(function(e) {
hs.isValueInEnum(e, hs.OFFER_TYPE_DIFFICULTY) && r.addAlgorithmNameMapping(e, o, hs.OFFER_TYPE.KUN_NAN_TI, "困难难题,困难难题,困难难题", hs.OFFER_TYPE.KUN_NAN_TI);
});
t.fail.forEach(function(e) {
r.addAlgorithmNameMapping(e, o, hs.OFFER_TYPE.KUN_NAN_TI, null, hs.OFFER_TYPE.KUN_NAN_TI);
});
} else {
t.algo.forEach(function(e) {
hs.isValueInEnum(e, hs.OFFER_TYPE_DIFFICULTY) && r.addAlgorithmNameMapping(e, o, hs.OFFER_TYPE.ZHI_JUE_NAN_TI, "直觉难题,直觉难题,直觉难题", hs.OFFER_TYPE.ZHI_JUE_NAN_TI);
});
t.fail.forEach(function(e) {
r.addAlgorithmNameMapping(e, o, hs.OFFER_TYPE.ZHI_JUE_NAN_TI, null, hs.OFFER_TYPE.ZHI_JUE_NAN_TI);
});
} else t.algo.forEach(function(e) {
r.addAlgorithmNameMapping(e, o, null, null, hs.OFFER_TYPE.SUI_JI_WU_SI);
});
}
};
t.prototype.getCurrentScoreTier = function() {
var e = hs.scoreInfo.highRecordScore;
return (e = this.getHighRecordScore(e)) < 1e3 ? i.lessThan1000 : e < 3e3 ? i.lessThan3000 : i.moreThan3000;
};
t.prototype.getTierAlgoData = function(e) {
return e === i.lessThan1000 ? {
algo: hs.algorithmStrategyIOSRandomRefactoredInfo.offerBitRandomNoDieBit(),
fail: []
} : e === i.lessThan3000 ? {
algo: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceLess3000ScoreBitZhiJueNanTi(),
fail: hs.algorithmStrategyIOSShangRefactoredInfo.getDayNightLess3000ToNoBitShangZeng3({
isDown: !0
})
} : e === i.moreThan3000 ? {
algo: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceMore3000ScoreVeryDifficulty(),
fail: hs.algorithmStrategyIOSShangRefactoredInfo.getDayNightMore3000ToNoBitShangZeng3({
isDown: !0
})
} : null;
};
t.prototype.enterDiff100ByLocalDayTime = function() {
var e = hs.scoreInfo.highRecordScore;
return (e = this.getHighRecordScore(e)) > 1e3 && e < 3e3 ? {
algo: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceLess3000ScoreBitZhiJueNanTi(),
fail: hs.algorithmStrategyIOSShangRefactoredInfo.getDayNightLess3000ToNoBitShangZeng3({
isDown: !0
})
} : e > 3e3 ? {
algo: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceMore3000ScoreVeryDifficulty(),
fail: hs.algorithmStrategyIOSShangRefactoredInfo.getDayNightMore3000ToNoBitShangZeng3({
isDown: !0
})
} : {
algo: [],
fail: []
};
};
t.prototype.initPuzzleTime = function() {
this.puzzleTimeFirst = hs.randomInt(150, 180);
this.puzzleTimeOther = hs.randomInt(45, 75);
};
t.prototype.isMeetTheConditionByLocalDayTime = function() {
return !0 === this.isWithinTimePeriodByLocalDayTime;
};
t.prototype.initGameStartStateByLocalDayTime = function(e) {
this.isWithinTimePeriodByLocalDayTime = !1;
var t = new Date();
if (e) this.checkIfWithinTimePeriod(t, 5, 19) && (this.isWithinTimePeriodByLocalDayTime = !0); else {
var r = this.getGameTimePeriodState();
null === r ? this.checkIfWithinTimePeriod(t, 5, 19) && (this.isWithinTimePeriodByLocalDayTime = !0) : r > 0 && (this.isWithinTimePeriodByLocalDayTime = !0);
}
};
t.prototype.recordGameTimePeriodState = function() {
var e, t = new Date();
e = this.checkIfWithinTimePeriod(t, 5, 19) ? 1 : 0;
this.curTimePeriodState = e;
};
t.prototype.getGameTimePeriodState = function() {
return this.curTimePeriodState || null;
};
t.prototype.checkIfWithinTimePeriod = function(e, t, r) {
var o = e.getHours();
return o >= t && o < r;
};
t.prototype.getCurTimePeriodState = function() {
return this.curTimePeriodState;
};
t.prototype.checkIsPassfirstDiff = function() {
return this.isPassFirstDiff;
};
t.prototype.getOfferNewBlockHardModelState = function() {
return this.offerNewBlockHardModelState;
};
t.prototype.getHighRecordScore = function(e) {
return e;
};
t.prototype.markExemptionSuccess = function() {
this.isPassFirstDiff = !0;
this.offerNewBlockHardModelState = !1;
};
t.prototype.onPreprocessConditionContext = function() {
var e, t, r = this, o = TRAIT("CTRefactorIsPuzzleTimeTrait"), i = null === (t = null === (e = null == o ? void 0 : o.state) || void 0 === e ? void 0 : e.isHardFirst) || void 0 === t || t, a = this.getCurrentScoreTier();
return buildLazyConditionContext({
isWithinDayTime: function() {
return ASContext(r.isMeetTheConditionByLocalDayTime(), "是否在白天时间段");
},
isHardFirst: function() {
return ASContext(i, "是否是首次定时难题（来自CTRefactorIsPuzzleTimeTrait，用于区分PuzzleTimeFirst/Other源）");
},
offerNewBlockHardModelState: function() {
return ASContext(r.getOfferNewBlockHardModelState(), "困难题失败强制继续出题");
},
isPassFirstDiff: function() {
return ASContext(r.isPassFirstDiff, "首次困难题是否通过");
},
scoreTier: function() {
return ASContext(a, "高分分档(0:<1000, 1:<3000, 2:else)");
},
enterDiff100Data: function() {
return ASContext(r.enterDiff100ByLocalDayTime(), "dayForce兜底算法数据");
},
hasEnterDiff100Data: function() {
var e, t, o;
return ASContext((null !== (o = null === (t = null === (e = r.enterDiff100ByLocalDayTime()) || void 0 === e ? void 0 : e.algo) || void 0 === t ? void 0 : t.length) && void 0 !== o ? o : 0) > 0, "dayForce是否有可写算法");
}
});
};
t.prototype.onPreprocessConditionOperators = function() {
var e = this;
return {
resolveTierAlgo: function(t, r) {
if (t !== r) return !1;
var o = e.getTierAlgoData(r);
return !!o && {
status: !0,
data: o
};
},
resolveTierAboveLess1000: function(t) {
if (t === i.lessThan1000) return !1;
var r = e.getTierAlgoData(t);
return !!r && {
status: !0,
data: r
};
}
};
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
BeforePuzzleTime: [ {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "offerNewBlockHardModelState",
operator: "=",
value: !0
}, {
fact: "isPassFirstDiff",
operator: "=",
value: !1
}, {
fact: "hasEnterDiff100Data",
operator: "=",
value: !0
} ]
},
event: {
type: "registerNameMappingDayForceFirst",
args: [ {
fact: "enterDiff100Data"
} ]
},
platform: "ios",
flow: "dayForceFirst"
}, {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "offerNewBlockHardModelState",
operator: "=",
value: !0
}, {
fact: "isPassFirstDiff",
operator: "=",
value: !0
}, {
fact: "hasEnterDiff100Data",
operator: "=",
value: !0
} ]
},
event: {
type: "registerNameMappingDayForceOther",
args: [ {
fact: "enterDiff100Data"
} ]
},
platform: "ios",
flow: "dayForceOther"
} ],
PuzzleTimeFirst: [ {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "isHardFirst",
operator: "=",
value: !0
}, {
fact: "scoreTier",
operator: "resolveTierAlgo",
value: i.lessThan1000
} ]
},
event: {
type: "registerNameMappingByCurrentTier",
args: [ {
fact: "operator.resolveTierAlgo.data"
} ]
},
platform: "ios",
flow: "dayNormalFirstLess1000"
}, {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "isHardFirst",
operator: "=",
value: !0
}, {
fact: "scoreTier",
operator: "resolveTierAboveLess1000"
} ]
},
event: {
type: "registerNameMappingByCurrentTier",
args: [ {
fact: "operator.resolveTierAboveLess1000.data"
} ]
},
platform: "ios",
flow: "dayNormalFirstAbove1000"
} ],
PuzzleTimeOther: [ {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "isHardFirst",
operator: "=",
value: !1
}, {
fact: "scoreTier",
operator: "resolveTierAlgo",
value: i.lessThan1000
} ]
},
event: {
type: "registerNameMappingByCurrentTier",
args: [ {
fact: "operator.resolveTierAlgo.data"
} ]
},
platform: "ios",
flow: "dayNormalOtherLess1000"
}, {
conditions: {
and: [ {
fact: "isWithinDayTime",
operator: "=",
value: !0
}, {
fact: "isHardFirst",
operator: "=",
value: !1
}, {
fact: "scoreTier",
operator: "resolveTierAboveLess1000"
} ]
},
event: {
type: "registerNameMappingByCurrentTier",
args: [ {
fact: "operator.resolveTierAboveLess1000.data"
} ]
},
platform: "ios",
flow: "dayNormalOtherAbove1000"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
BeforePuzzleTime: {
dayForceFirst: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "enterDiff100Data.algo"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.PuzzleTimeFirst
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "enterDiff100Data.fail"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.PuzzleTimeFirst
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ],
dayForceOther: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "enterDiff100Data.algo"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.PuzzleTimeOther
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "enterDiff100Data.fail"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.PuzzleTimeOther
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
},
PuzzleTimeFirst: {
dayNormalFirstLess1000: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAlgo.data.algo"
} ]
} ],
dayNormalFirstAbove1000: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAboveLess1000.data.algo"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAboveLess1000.data.fail"
} ]
} ]
},
PuzzleTimeOther: {
dayNormalOtherLess1000: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAlgo.data.algo"
} ]
} ],
dayNormalOtherAbove1000: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAboveLess1000.data.algo"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTierAboveLess1000.data.fail"
} ]
} ]
}
}
};
};
t.prototype.onAlgorithmStrategyPreprocessComplete = function() {
if (hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2 === this.traitName) {
var e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
if (e === hs.ClassAlgorithmSourceType.PuzzleTimeFirst || e === hs.ClassAlgorithmSourceType.PuzzleTimeOther) {
var t = hs.scoreInfo.highRecordScore;
if ((t = this.getHighRecordScore(t)) < 1e3) {
this.isPassFirstDiff = !0;
this.offerNewBlockHardModelState = !1;
var r = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == r ? void 0 : r.active) {
e === hs.ClassAlgorithmSourceType.PuzzleTimeFirst && (r.state.isHardFirst = !1);
r.state.initTime = Date.now();
r.resetInitTime();
}
} else {
var o = hs.classAlgorithmName.algoActualId;
if (hs.classAlgorithmStrategyIOSDealConditionInfo.isPuzzleDiffStrategy(o)) {
this.isPassFirstDiff = !0;
this.offerNewBlockHardModelState = !1;
} else this.offerNewBlockHardModelState = !0;
}
}
}
};
s([ hs.storageProperty({
key: "CTRefactorChangeConfByLocalTimeTraitKey"
}) ], t.prototype, "curTimePeriodState", void 0);
return s([ classId("CTRefactorChangeConfByLocalTimeTrait"), classMethodWatch() ], t);
}(Trait);
r.CTRefactorChangeConfByLocalTimeTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorChangeConfByLocalTimeTrait" ]);
//# sourceMappingURL=index.js.map
