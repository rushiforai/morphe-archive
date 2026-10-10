window.__require = function e(t, a, r) {
function i(s, n) {
if (!a[s]) {
if (!t[s]) {
var d = s.split("/");
d = d[d.length - 1];
if (!t[d]) {
var h = "function" == typeof __require && __require;
if (!n && h) return h(d, !0);
if (o) return o(d, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = d;
}
var l = a[s] = {
exports: {}
};
t[s][0].call(l.exports, function(e) {
return i(t[s][1][e] || e);
}, l, l.exports, e, t, a, r);
}
return a[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < r.length; s++) i(r[s]);
return i;
}({
ChurnPredictionTier1PeriodResetInfo: [ function(e, t, a) {
"use strict";
cc._RF.push(t, "9c6f1suOkVMfY6QsfKjxNXm", "ChurnPredictionTier1PeriodResetInfo");
Object.defineProperty(a, "__esModule", {
value: !0
});
a.churnPredictionTier1PeriodResetInfo = void 0;
var r = function() {
function e() {}
e.prototype.dispatchPeriodReset = function() {
hs.EventManager.dispatchModuleEvent(new hs.E_ChapterConfig_PeriodReset());
};
return e;
}();
a.churnPredictionTier1PeriodResetInfo = new r();
cc._RF.pop();
}, {} ],
Churn_prediction_tier_1Trait: [ function(e, t, a) {
"use strict";
cc._RF.push(t, "083458yl+9Jo7pKvEGgKA2W", "Churn_prediction_tier_1Trait");
var r, i = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
})(e, t);
}, function(e, t) {
r(e, t);
function a() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a());
}), o = this && this.__assign || function() {
return (o = Object.assign || function(e) {
for (var t, a = 1, r = arguments.length; a < r; a++) {
t = arguments[a];
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
}
return e;
}).apply(this, arguments);
}, s = this && this.__decorate || function(e, t, a, r) {
var i, o = arguments.length, s = o < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, a) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, a, r); else for (var n = e.length - 1; n >= 0; n--) (i = e[n]) && (s = (o < 3 ? i(s) : o > 3 ? i(t, a, s) : i(t, a)) || s);
return o > 3 && s && Object.defineProperty(t, a, s), s;
};
Object.defineProperty(a, "__esModule", {
value: !0
});
a.Churn_prediction_tier_1Trait = void 0;
var n = e("../vo/ChurnPredictionTier1PeriodResetInfo"), d = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._storageData = null;
t._ourDeathRequest = !1;
return t;
}
t.prototype._tryUpdateLowActivityCache = function() {
var e = TRAIT("NewNextDayLowActivityTrait");
if ((null == e ? void 0 : e.active) && e.isPredicted()) {
var t = this._getData(), a = Date.now(), r = e.isLowActivityUser();
if (0 !== (t.predictTodayTime > 0 ? hs.getDiffDays(a, t.predictTodayTime) : -1)) {
t.predictTodayTime = a;
t.predictTodayIsLow = r;
this._saveData(t);
} else if (t.predictTodayIsLow !== r) {
t.predictTodayIsLow = r;
this._saveData(t);
}
}
};
t.prototype._isEligibleNextDayLowActivity = function() {
var e = this._getData();
return !(e.predictYesterdayTime <= 0) && (1 === hs.getDiffDays(Date.now(), e.predictYesterdayTime) && e.predictYesterdayIsLow);
};
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Proxy",
methodName: "onGameStart"
}, {
className: "ChapterGame_Proxy",
methodName: "onGameStart"
}, {
className: "ClassGameOver_GameEnd_Proxy",
methodName: "onGameEnd"
} ];
};
t.prototype.onActive = function(e) {
hs.tp.isLaunchChangeLaunchScene(e) && this._handleLandingPage(e);
hs.tp.isChapterConfig_ProxyIsExistNextPeriods(e) && this._handleColdStartIsExistNextPeriods(e);
hs.tp.isChapterGame_Ready_ProxyOnChapterGameReadyComplete(e) && this._handleColdStartPeriodResetBeforeChapterReady();
hs.tp.isClassGame_ProxyOnGameStart(e) && this._handleClassGameStart(e);
hs.tp.isChapterGame_ProxyOnGameStart(e) && this._markTodayPlayedChapter();
hs.tp.isClassAlgorithmStrategyIOS_Priority_ProxyOnAlgorithmStrategyPriority(e) && this._handleTriggerDeathPuzzle(e);
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerAfterOfferAlgo(e);
if (hs.tpManual.isClassAlgorithmBottomSequenceInfoOnDisableAfterAlgo(e)) {
var t = this._getData();
t.deathCausedByUs && !t.reviveInvalidated && hs.algorithmName.algoActualIdByPos == hs.OFFER_TYPE.ZHI_SI_TI && hs.algorithmBottomSequenceInfo.setIsTriggerAfterAlgo(!1);
}
hs.tp.isAlgorithmProcessInfoTriggerAlgorithmResult(e) && hs.gameInfo.gameMode === hs.GameMode.Class && this._handleAlgorithmResult();
hs.tp.isClassRevive_ProxyReviveSuccessPostProcessing(e) && this._handleReviveSuccess();
hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(e) && this._handleClassGameEnd();
};
t.prototype._handleLandingPage = function(e) {
var t;
this._checkDayBoundary();
var a = this._getTodayString(), r = this._getData();
if (r.lastColdStartLandingDate !== a) {
r.lastColdStartLandingDate = a;
this._saveData(r);
if (this._isEligibleNextDayLowActivity()) {
var i = !1;
if (r.yesterdayPlayedChapter && !r.yesterdayPlayedClass) i = !0; else {
var o = null !== (t = this.props.landingPageProb) && void 0 !== t ? t : .5;
i = Math.random() < o;
}
if (i) {
if (!hs.launchInfo.openChapterModule()) return;
r.coldStartJumpChapterPending = !0;
this._saveData(r);
e.args[0] = "chapter";
e.returnState = !0;
}
}
}
};
t.prototype._handleColdStartIsExistNextPeriods = function(e) {
var t = this._getData();
if (!0 === t.coldStartJumpChapterPending) if (e.returnState) {
t.coldStartJumpChapterPending = !1;
this._saveData(t);
} else if (hs.homePageInfo.checkNeedGoNextPeriods()) {
var a = hs.storage.getItem("chapterPeriodsIndex", 1);
t.coldStartJumpChapterPending = !1;
t.coldStartPeriodResetPending = !0;
t.coldStartPeriodResetPendingStage = a + 1;
this._saveData(t);
hs.storage.setItem("chapterPeriodsShowTime", Date.now());
hs.storage.setItem("needGoNextPeriods", !0);
e.returnState = !0;
e.returnValue = !0;
} else {
t.coldStartJumpChapterPending = !1;
this._saveData(t);
}
};
t.prototype._handleColdStartPeriodResetBeforeChapterReady = function() {
var e = this._getData();
if (e.coldStartPeriodResetPending) {
var t = hs.storage.getItem("chapterPeriodsIndex", 1), a = e.coldStartPeriodResetPendingStage;
e.coldStartPeriodResetPending = !1;
e.coldStartPeriodResetPendingStage = 0;
this._saveData(e);
t === a && hs.homePageInfo.needClearData && n.churnPredictionTier1PeriodResetInfo.dispatchPeriodReset();
}
};
t.prototype._handleClassGameStart = function(e) {
var t, a, r;
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var i = this._getData(), o = e.args[0], s = null !== (a = null === (t = null == o ? void 0 : o.data) || void 0 === t ? void 0 : t.newGame) && void 0 !== a && a;
i.todayPlayedClass = !0;
if (s) {
if (0 === i.todayNewGameCount) {
i.todayNewGameCount = 1;
i.firstGameIsResidual = !1;
i.firstGameStrategyApplies = !1;
} else i.todayNewGameCount++;
this._initGameDeathState(i);
} else if (0 === i.todayNewGameCount) {
i.todayNewGameCount = 1;
i.firstGameIsResidual = !0;
var n = hs.scoreInfo.score, d = hs.scoreInfo.highRecordScore, h = null !== (r = this.props.residualScoreRatio) && void 0 !== r ? r : .15;
i.firstGameStrategyApplies = d > 0 && n / d <= h;
this._initGameDeathState(i);
}
this._saveData(i);
};
t.prototype._initGameDeathState = function(e) {
var t, a, r, i, o, s;
e.deathTriggered = !1;
e.deathAttempting = !1;
e.reviveInvalidated = !1;
e.deathCausedByUs = !1;
if (this._isEligibleNextDayLowActivity()) {
var n = null !== (t = this.props.deathTimeStart) && void 0 !== t ? t : 30, d = null !== (a = this.props.deathTimeEnd) && void 0 !== a ? a : 60;
e.deathTriggerTimeSec = n + Math.random() * (d - n);
if (hs.scoreInfo.highRecordScore <= (null !== (r = this.props.highScoreThreshold) && void 0 !== r ? r : 4e4)) e.deathTriggered = !0; else {
var h = e.todayNewGameCount;
if (h > (null !== (i = this.props.maxDeathGameNum) && void 0 !== i ? i : 3)) e.deathTriggered = !0; else if (1 !== h || !e.firstGameIsResidual || e.firstGameStrategyApplies) {
var l = 1 === h ? null !== (o = this.props.firstGameDeathProb) && void 0 !== o ? o : 1 : null !== (s = this.props.laterGameDeathProb) && void 0 !== s ? s : .5;
Math.random() >= l && (e.deathTriggered = !0);
} else e.deathTriggered = !0;
}
} else e.deathTriggered = !0;
};
t.prototype._handleTriggerDeathPuzzle = function(e) {
var t;
this._ourDeathRequest = !1;
var a = this._getData();
if (!(a.deathTriggered || a.reviveInvalidated || hs.classGameInfo.roundNum <= 1)) {
var r = hs.classTimerInfo.spendTime / 1e3;
if (!(r < a.deathTriggerTimeSec)) if (r > (null !== (t = this.props.deathTimeEnd) && void 0 !== t ? t : 60)) {
a.deathTriggered = !0;
this._saveData(a);
} else {
this._ourDeathRequest = !0;
a.deathAttempting = !0;
this._saveData(a);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.Priority);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
hs.algorithmStrategyInfo.setAlgorithmPriorityList([ hs.OFFER_TYPE.ZHI_SI_TI ]);
e.returnState = !0;
}
}
};
t.prototype._handleAlgorithmResult = function() {
var e = this._getData();
if (e.deathAttempting) {
var t = hs.classAlgorithmName.algoActualId === hs.OFFER_TYPE.ZHI_SI_TI && this._ourDeathRequest;
this._ourDeathRequest;
e.deathAttempting = !1;
this._ourDeathRequest = !1;
if (t) {
e.deathTriggered = !0;
e.deathCausedByUs = !0;
}
this._saveData(e);
}
};
t.prototype._handleReviveSuccess = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var e = this._getData();
if (e.deathCausedByUs) {
e.reviveInvalidated = !0;
e.deathTriggered = !0;
this._saveData(e);
}
}
};
t.prototype._handleClassGameEnd = function() {
var e = this._getData();
e.deathAttempting = !1;
this._saveData(e);
};
t.prototype._markTodayPlayedChapter = function() {
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var e = this._getData();
e.todayPlayedChapter = !0;
this._saveData(e);
};
t.prototype._checkDayBoundary = function() {
var e = this._getData(), t = this._getTodayString();
if (e.lastRecordDate !== t) {
e.yesterdayPlayedClass = e.todayPlayedClass;
e.yesterdayPlayedChapter = e.todayPlayedChapter;
var a = Date.now(), r = e.predictTodayTime > 0 ? hs.getDiffDays(a, e.predictTodayTime) : -1;
if (1 === r) {
e.predictYesterdayTime = e.predictTodayTime;
e.predictYesterdayIsLow = e.predictTodayIsLow;
} else if (0 !== r) {
e.predictYesterdayTime = 0;
e.predictYesterdayIsLow = !1;
}
e.todayPlayedClass = !1;
e.todayPlayedChapter = !1;
e.todayNewGameCount = 0;
e.deathTriggered = !1;
e.deathAttempting = !1;
e.deathTriggerTimeSec = 0;
e.firstGameIsResidual = !1;
e.firstGameStrategyApplies = !1;
e.reviveInvalidated = !1;
e.deathCausedByUs = !1;
e.lastRecordDate = t;
this._saveData(e);
}
};
t.prototype._getTodayString = function() {
var e = new Date();
return e.getFullYear() + "-" + (e.getMonth() + 1) + "-" + e.getDate();
};
t.prototype._getData = function() {
if (!this._storageData) {
var e = {
lastRecordDate: "",
todayNewGameCount: 0,
yesterdayPlayedClass: !1,
yesterdayPlayedChapter: !1,
todayPlayedClass: !1,
todayPlayedChapter: !1,
deathTriggerTimeSec: 0,
deathTriggered: !1,
deathAttempting: !1,
firstGameIsResidual: !1,
firstGameStrategyApplies: !1,
reviveInvalidated: !1,
deathCausedByUs: !1,
predictTodayTime: 0,
predictTodayIsLow: !1,
predictYesterdayTime: 0,
predictYesterdayIsLow: !1,
lastColdStartLandingDate: "",
coldStartJumpChapterPending: !1,
coldStartPeriodResetPending: !1,
coldStartPeriodResetPendingStage: 0
}, t = hs.storage.getItem("Churn_prediction_tier_1Trait_Data", e);
this._storageData = o(o({}, e), t);
}
return this._storageData;
};
t.prototype._saveData = function(e) {
this._storageData = e;
hs.storage.setItem("Churn_prediction_tier_1Trait_Data", e);
};
s([ hs.Algorithm() ], t.prototype, "onActive", null);
return s([ classId("Churn_prediction_tier_1Trait") ], t);
}(Trait);
a.Churn_prediction_tier_1Trait = d;
cc._RF.pop();
}, {
"../vo/ChurnPredictionTier1PeriodResetInfo": "ChurnPredictionTier1PeriodResetInfo"
} ]
}, {}, [ "Churn_prediction_tier_1Trait", "ChurnPredictionTier1PeriodResetInfo" ]);
//# sourceMappingURL=index.js.map
