window.__require = function t(e, i, r) {
function o(s, l) {
if (!i[s]) {
if (!e[s]) {
var n = s.split("/");
n = n[n.length - 1];
if (!e[n]) {
var d = "function" == typeof __require && __require;
if (!l && d) return d(n, !0);
if (a) return a(n, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = n;
}
var u = i[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return o(e[s][1][t] || t);
}, u, u.exports, t, e, i, r);
}
return i[s].exports;
}
for (var a = "function" == typeof __require && __require, s = 0; s < r.length; s++) o(r[s]);
return o;
}({
ReturnUserAbilityStrategyTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "0438ekBc0dDF4n3I9dJbRX6", "ReturnUserAbilityStrategyTrait");
var r, o = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
r(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), a = this && this.__decorate || function(t, e, i, r) {
var o, a = arguments.length, s = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, i, r); else for (var l = t.length - 1; l >= 0; l--) (o = t[l]) && (s = (a < 3 ? o(s) : a > 3 ? o(e, i, s) : o(e, i)) || s);
return a > 3 && s && Object.defineProperty(e, i, s), s;
}, s = this && this.__read || function(t, e) {
var i = "function" == typeof Symbol && t[Symbol.iterator];
if (!i) return t;
var r, o, a = i.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = a.next()).done; ) s.push(r.value);
} catch (t) {
o = {
error: t
};
} finally {
try {
r && !r.done && (i = a.return) && i.call(a);
} finally {
if (o) throw o.error;
}
}
return s;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(s(arguments[e]));
return t;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ReturnUserAbilityStrategyTrait = void 0;
var n = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isReturnUserCached = null;
e._todayTier = null;
return e;
}
Object.defineProperty(e.prototype, "_isReturnUser", {
get: function() {
var t, e;
if (1 === this.experimentTargetUserTypeCode) {
null === this._isReturnUserCached && (this._isReturnUserCached = !0);
return !0;
}
var i = null !== (e = null === (t = hs.deviceInfo.data) || void 0 === t ? void 0 : t.distinct_id) && void 0 !== e ? e : "DC05765F-5E8E-4B11-8D2A-96D9A8110B65_982";
null === this._isReturnUserCached && (this._isReturnUserCached = /_\d+$/.test(i));
return this._isReturnUserCached;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "experimentTargetUserTypeCode", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.experimentTargetUserTypeCode) && void 0 !== e ? e : 2;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "highAbilityAvgScoreThreshold", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.highAbilityAvgScoreThreshold) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.highAbilityDailyAvgScore) && void 0 !== r ? r : 12e3;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "midAbilityAvgScoreLowerBound", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.midAbilityAvgScoreLowerBound) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.midAbilityDailyAvgScore) && void 0 !== r ? r : 6e3;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "highAbilityMaxComboThreshold", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.highAbilityMaxComboThreshold) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.highAbilityMaxCombo) && void 0 !== r ? r : 8;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "midAbilityMaxComboThreshold", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.midAbilityMaxComboThreshold) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.midAbilityMaxCombo) && void 0 !== r ? r : 4;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "highAbilityAvgPlaceDurationThreshold", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.highAbilityAvgPlaceDurationThreshold) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.highAbilityAvgBlockTime) && void 0 !== r ? r : 20;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "midAbilityAvgPlaceDurationThreshold", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.midAbilityAvgPlaceDurationThreshold) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.midAbilityAvgBlockTime) && void 0 !== r ? r : 35;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "highAbilityFirstDeadPuzzleAdvanceTime", {
get: function() {
var t, e, i, r, o, a;
return null !== (a = null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.highAbilityFirstDeadPuzzleAdvanceTime) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.highAbilityDeathPuzzleAdvanceTime) && void 0 !== r ? r : null === (o = this.props) || void 0 === o ? void 0 : o.highAbilityFirstDeadPuzzleAdvanceSec) && void 0 !== a ? a : 45;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "hardPuzzleReplaceProbability", {
get: function() {
var t, e, i, r;
return null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.hardPuzzleReplaceProbability) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.difficultPuzzleReplaceProb) && void 0 !== r ? r : 50;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "subsequentPuzzleIntervalIncrement", {
get: function() {
var t, e, i, r, o, a;
return null !== (a = null !== (r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.subsequentPuzzleIntervalIncrement) && void 0 !== e ? e : null === (i = this.props) || void 0 === i ? void 0 : i.puzzleIntervalIncrement) && void 0 !== r ? r : null === (o = this.props) || void 0 === o ? void 0 : o.puzzleIntervalIncreaseSec) && void 0 !== a ? a : 10;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "clearBoardPlusAdvanceTime", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.clearBoardPlusAdvanceTime;
return "number" == typeof e && Number.isFinite(e) ? e : this.highAbilityFirstDeadPuzzleAdvanceTime;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "lowAbilityFillClearProtectEnable", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.lowAbilityFillClearProtectEnable;
return void 0 === e || 1 === e;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "lowAbilityProtectBeforeRecordBreakFlag", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.lowAbilityProtectBeforeRecordBreakFlag;
return void 0 === e || 1 === e;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
},
enumerable: !1,
configurable: !0
});
e.prototype.onActive = function(t) {
hs.tp.isClassGame_ProxyOnGameStart(t) ? this.handleOnGameStart(t) : hs.tp.isClassGameDataClear_Disk_ProxyOnClearClassDist(t) ? this.handleOnClearClassDist() : hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoardFinal(t) ? this.handleProduceDefaultBoardFinal(t) : hs.tp.isIsPuzzleTimeTraitDynamicAdjustDieDefaultTime(t) ? this.handleAdjustPuzzleTime(t) : hs.tp.isIsPuzzleTimeTraitDynamicAdjustPuzzleTimeFirst(t) ? this.handleAdjustPuzzleTimeOther() : hs.tp.isClearBoardPlusTraitGetTriggerTime(t) ? this.handleAdjustClearBoardPlusTriggerTime(t) : hs.tp.isClassAlgorithmStrategyIOS_Replace_ProxyPreprocessingDiffAlgorithm(t) ? this.handlePreprocessingDiffAlgorithm() : hs.tp.isClassAlgorithmStrategyIOS_Replace_ProxyPreprocessingAlgorithm(t) && this.handlePreprocessingAlgorithm();
};
e.prototype.handleOnGameStart = function(t) {
var e, i, r;
if (this._isReturnUser) {
if (!hs.classGuideInfo.isFinishedGuide) {
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
var o = this.cloneEmptyBoard();
hs.storage.setItem("classFaceBlocks", o);
hs.storage.setItem("classInitialFaceBlocks", o);
hs.storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
}
var a = this.readStorage(), s = this.getTodayDateString(), l = null === (e = t.args) || void 0 === e ? void 0 : e[0], n = !0 === (null === (i = null == l ? void 0 : l.data) || void 0 === i ? void 0 : i.newGame);
if ((null === (r = a.todayTier) || void 0 === r ? void 0 : r.date) !== s) {
this.ensureTodayTierCalculated(a, s);
this.hasResumeBoard() && this.applyEmptyBoardToResume();
a.emptyBoardPending = !!n;
} else {
this.hydrateTodayTier(a, s);
"unknown" === this._todayTier && this.hasResumeBoard() && this.applyEmptyBoardToResume();
a.emptyBoardPending = !1;
}
this.writeStorage(a);
}
};
e.prototype.handleOnClearClassDist = function() {
var t, e, i, r, o, a;
if (this._isReturnUser) {
var s = null !== (t = hs.classScoreInfo.score) && void 0 !== t ? t : 0, l = null !== (e = hs.classGameInfo.roundNum) && void 0 !== e ? e : 0, n = null !== (i = hs.classGameInfo.gameTime) && void 0 !== i ? i : 0, d = null !== (a = null === (o = null === (r = hs.classDataStatisticsInfo) || void 0 === r ? void 0 : r.dataStatisticsInfo) || void 0 === o ? void 0 : o.comboMaxNum) && void 0 !== a ? a : 0, u = this.readStorage(), h = this.getTodayDateString();
hs.classScoreInfo.recordHigh && (u.todayBreakRecord = {
date: h,
broken: !0
});
if (s <= 0 && l <= 0) this.writeStorage(u); else {
this.archiveStaleTodayStatsIfNeeded(u, h);
u.todayStats.totalScore += s;
u.todayStats.gameCount += 1;
u.todayStats.maxCombo = Math.max(u.todayStats.maxCombo, d);
u.todayStats.totalGameTime += n;
u.todayStats.totalRounds += l;
this.writeStorage(u);
}
}
};
e.prototype.handleProduceDefaultBoardFinal = function(t) {
if (this._isReturnUser && !hs.classGuideInfo.show && hs.classGuideInfo.isFinishedGuide) {
var e = hs.isSameDay(hs.gameInfo.firstEntryTime, Date.now()), i = this.readStorage();
if (i.emptyBoardPending || e) {
t.args[0] = hs.boardInfo.NULL;
t.returnState = !0;
i.emptyBoardPending = !1;
this.writeStorage(i);
}
}
};
e.prototype.handleAdjustPuzzleTime = function(t) {
var e;
if (this._isReturnUser) {
this.ensureTodayTierLoaded();
if ("high" === this._todayTier && !0 === (null === (e = t.target.state) || void 0 === e ? void 0 : e.isHardFirst) && hs.classGuideInfo.isFinishedGuide) {
var i = t.args[0];
if ("number" == typeof i && Number.isFinite(i)) {
var r = this.highAbilityFirstDeadPuzzleAdvanceTime, o = Math.max(1, i - r);
t.returnValue = o;
}
}
}
};
e.prototype.handleAdjustClearBoardPlusTriggerTime = function(t) {
var e;
if (this._isReturnUser) {
this.ensureTodayTierLoaded();
if ("high" === this._todayTier && hs.classGuideInfo.isFinishedGuide) {
var i = this.clearBoardPlusAdvanceTime;
if (!(i <= 0)) {
var r = "number" == typeof t.returnValue && Number.isFinite(t.returnValue) ? t.returnValue : void 0, o = TRAIT("ClearBoardPlusTrait"), a = null === (e = null == o ? void 0 : o.props) || void 0 === e ? void 0 : e.time, s = null != r ? r : "number" == typeof a && Number.isFinite(a) ? a : 45, l = Math.max(1, s + i);
t.returnValue = l;
}
}
}
};
e.prototype.handleAdjustPuzzleTimeOther = function() {
if (this._isReturnUser) {
this.ensureTodayTierLoaded();
if ("high" === this._todayTier) {
var t = this.subsequentPuzzleIntervalIncrement;
if (!(t <= 0)) {
var e = TRAIT("IsPuzzleTimeTrait");
if ((null == e ? void 0 : e.active) && e.state) {
var i = e.state.puzzleTimeOther;
"number" != typeof i || !Number.isFinite(i) || i <= 0 || e.setState({
puzzleTimeOther: i + t
});
}
}
}
}
};
e.prototype.handlePreprocessingDiffAlgorithm = function() {
if (this._isReturnUser) {
this.ensureTodayTierLoaded();
if ("unknown" !== this._todayTier && null !== this._todayTier) {
var t = this.readStorage(), e = this.getTodayDateString();
"high" !== this._todayTier ? "mid" === this._todayTier && this.isUnderRecordBreakRestriction(t, e) && this.stripDifficultyFromAllLists(!0) : this.applyHighAbilityDifficultyReplace();
}
}
};
e.prototype.handlePreprocessingAlgorithm = function() {
if (this._isReturnUser && this.lowAbilityFillClearProtectEnable && this.lowAbilityProtectBeforeRecordBreakFlag) {
this.ensureTodayTierLoaded();
if ("low" === this._todayTier) {
var t = this.readStorage(), e = this.getTodayDateString();
if (this.isUnderRecordBreakRestriction(t, e)) {
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
hs.algorithmStrategyInfo.setAlgorithmPriorityList([ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ]);
hs.algorithmStrategyInfo.setAlgorithmList([ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ]);
hs.algorithmStrategyInfo.setAlgorithmFailList([ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.SUI_JI_WU_SI ]);
}
}
}
};
e.prototype.applyHighAbilityDifficultyReplace = function() {
var t = hs.algorithmStrategyInfo.algorithmList;
if (Array.isArray(t) && !(t.length <= 0) && t.some(function(t) {
return hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY);
}) && !(100 * Math.random() >= this.hardPuzzleReplaceProbability)) {
hs.algorithmStrategyInfo.setAlgorithmList(l([ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ], t));
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
}
};
e.prototype.stripDifficultyFromAllLists = function(t) {
var e = this.stripDifficultyFromList(hs.algorithmStrategyInfo.algorithmPriorityList);
e && hs.algorithmStrategyInfo.setAlgorithmPriorityList(e);
var i = this.stripDifficultyFromList(hs.algorithmStrategyInfo.algorithmList, t);
i && hs.algorithmStrategyInfo.setAlgorithmList(i);
var r = this.stripDifficultyFromList(hs.algorithmStrategyInfo.algorithmFailList);
r && hs.algorithmStrategyInfo.setAlgorithmFailList(r);
};
e.prototype.stripDifficultyFromList = function(t, e) {
void 0 === e && (e = !1);
if (!Array.isArray(t) || t.length <= 0) return null;
var i = t.concat(), r = i.filter(function(t) {
return !hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY);
});
if (r.length === i.length) return null;
e && r.length < 1 && r.push(hs.OFFER_TYPE.SUI_JI_WU_SI);
return r;
};
e.prototype.isUnderRecordBreakRestriction = function(t, e) {
var i;
return !((null === (i = t.todayBreakRecord) || void 0 === i ? void 0 : i.date) === e && t.todayBreakRecord.broken || hs.classScoreInfo.recordHigh);
};
e.prototype.hydrateTodayTier = function(t, e) {
var i;
(null === (i = t.todayTier) || void 0 === i ? void 0 : i.date) === e && (this._todayTier = t.todayTier.tier);
};
e.prototype.ensureTodayTierCalculated = function(t, e) {
var i;
if ((null === (i = t.todayTier) || void 0 === i ? void 0 : i.date) !== e) {
this.archiveStaleTodayStatsIfNeeded(t, e);
var r = this.calculateTier(t.prevDaySnapshot);
t.todayTier = {
date: e,
tier: r
};
this._todayTier = r;
} else this._todayTier = t.todayTier.tier;
};
e.prototype.archiveStaleTodayStatsIfNeeded = function(t, e) {
if (null === t.todayStats || t.todayStats.date !== e) {
if (null !== t.todayStats) {
var i = t.todayStats, r = i.gameCount > 0 ? Math.floor(i.totalScore / i.gameCount) : 0, o = i.totalRounds > 0 ? Math.floor(i.totalGameTime / i.totalRounds) : 0;
t.prevDaySnapshot = {
date: i.date,
avgScore: r,
maxCombo: i.maxCombo,
avgTimePerRound: o
};
}
t.todayStats = {
date: e,
totalScore: 0,
gameCount: 0,
maxCombo: 0,
totalGameTime: 0,
totalRounds: 0
};
}
};
e.prototype.hasResumeBoard = function() {
var t, e = !0 === hs.storage.getItem("classGameInProcess", !1), i = null !== (t = hs.classScoreInfo.score) && void 0 !== t ? t : 0, r = hs.storage.getItem("classFaceBlocks", hs.boardInfo.NULL), o = hs.boardInfo.isNullBoard(r);
return e || i > 0 || !o;
};
e.prototype.applyEmptyBoardToResume = function() {
var t = this.cloneEmptyBoard();
hs.storage.setItem("classFaceBlocks", t);
hs.storage.setItem("classInitialFaceBlocks", t);
var e = Cinst(hs.Board);
e && cc.isValid(e.node) && e.setState({
boards: t
});
var i = TRAIT("HighWeightBoardAroundBlinkTrait");
(null == i ? void 0 : i.active) && i.judgeWeight();
};
e.prototype.cloneEmptyBoard = function() {
return hs.boardInfo.NULL.map(function(t) {
return t.slice();
});
};
e.prototype.ensureTodayTierLoaded = function() {
if (null === this._todayTier) {
var t = this.readStorage();
this.hydrateTodayTier(t, this.getTodayDateString());
}
};
e.prototype.calculateTier = function(t) {
if (!t) return "unknown";
var e = t.avgScore, i = t.maxCombo, r = t.avgTimePerRound / 1e3;
return e >= this.highAbilityAvgScoreThreshold && i >= this.highAbilityMaxComboThreshold && r <= this.highAbilityAvgPlaceDurationThreshold ? "high" : e >= this.midAbilityAvgScoreLowerBound && i >= this.midAbilityMaxComboThreshold && r <= this.midAbilityAvgPlaceDurationThreshold ? "mid" : "low";
};
e.prototype.getTodayDateString = function() {
var t = new Date();
return t.getFullYear() + "_" + (t.getMonth() + 1) + "_" + t.getDate();
};
e.prototype.readStorage = function() {
return hs.storage.getItem("ReturnUserAbilityStrategyTrait_T", {
todayStats: null,
prevDaySnapshot: null,
todayTier: null,
todayBreakRecord: null,
emptyBoardPending: !1
});
};
e.prototype.writeStorage = function(t) {
hs.storage.setItem("ReturnUserAbilityStrategyTrait_T", t);
};
return a([ classId("ReturnUserAbilityStrategyTrait") ], e);
}(Trait);
i.ReturnUserAbilityStrategyTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "ReturnUserAbilityStrategyTrait" ]);
//# sourceMappingURL=index.js.map
