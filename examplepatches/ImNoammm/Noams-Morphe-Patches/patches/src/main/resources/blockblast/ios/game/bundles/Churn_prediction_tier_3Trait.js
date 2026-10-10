window.__require = function t(e, a, r) {
function i(o, l) {
if (!a[o]) {
if (!e[o]) {
var h = o.split("/");
h = h[h.length - 1];
if (!e[h]) {
var n = "function" == typeof __require && __require;
if (!l && n) return n(h, !0);
if (s) return s(h, !0);
throw new Error("Cannot find module '" + o + "'");
}
o = h;
}
var d = a[o] = {
exports: {}
};
e[o][0].call(d.exports, function(t) {
return i(e[o][1][t] || t);
}, d, d.exports, t, e, a, r);
}
return a[o].exports;
}
for (var s = "function" == typeof __require && __require, o = 0; o < r.length; o++) i(r[o]);
return i;
}({
Churn_prediction_tier_3Trait: [ function(t, e, a) {
"use strict";
cc._RF.push(e, "1c232XV/3VHHLdmkSyQrxxa", "Churn_prediction_tier_3Trait");
var r, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var a in e) Object.prototype.hasOwnProperty.call(e, a) && (t[a] = e[a]);
})(t, e);
}, function(t, e) {
r(t, e);
function a() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (a.prototype = e.prototype, new a());
}), s = this && this.__assign || function() {
return (s = Object.assign || function(t) {
for (var e, a = 1, r = arguments.length; a < r; a++) {
e = arguments[a];
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
}
return t;
}).apply(this, arguments);
}, o = this && this.__decorate || function(t, e, a, r) {
var i, s = arguments.length, o = s < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, a) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(t, e, a, r); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (o = (s < 3 ? i(o) : s > 3 ? i(e, a, o) : i(e, a)) || o);
return s > 3 && o && Object.defineProperty(e, a, o), o;
};
Object.defineProperty(a, "__esModule", {
value: !0
});
a.Churn_prediction_tier_3Trait = void 0;
var l = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._storageData = null;
e._ourDeathRequest = !1;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
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
e.prototype._tryUpdateLowActivityCache = function() {
var t = TRAIT("NewNextDayLowActivityTrait");
if ((null == t ? void 0 : t.active) && t.isPredicted()) {
var e = this._getData(), a = Date.now(), r = t.isLowActivityUser();
if (0 !== (e.predictTodayTime > 0 ? hs.getDiffDays(a, e.predictTodayTime) : -1)) {
e.predictTodayTime = a;
e.predictTodayIsLow = r;
this._saveData(e);
} else if (e.predictTodayIsLow !== r) {
e.predictTodayIsLow = r;
this._saveData(e);
}
}
};
e.prototype._isEligibleNextDayLowActivity = function() {
var t = this._getData();
return !(t.predictYesterdayTime <= 0) && (1 === hs.getDiffDays(Date.now(), t.predictYesterdayTime) && t.predictYesterdayIsLow);
};
e.prototype._isClassStrategyActive = function() {
var t;
if (!this._isEligibleNextDayLowActivity()) return !1;
var e = this._getData(), a = null !== (t = this.props.maxGameNum) && void 0 !== t ? t : 3;
return !(e.todayClassGameCount > a) && !e.reviveInvalidated;
};
e.prototype._isChapterStrategyActive = function() {
var t;
if (!this._isEligibleNextDayLowActivity()) return !1;
var e = this._getData(), a = null !== (t = this.props.maxGameNum) && void 0 !== t ? t : 3;
return !(e.todayChapterGameCount > a);
};
e.prototype.onActive = function(t) {
hs.tp.isClassGame_ProxyOnGameStart(t) && this._handleClassGameStart(t);
hs.tp.isChapterGame_ProxyOnGameStart(t) && this._handleChapterGameStart(t);
hs.tp.isClassAlgorithmStrategyIOS_Priority_ProxyOnAlgorithmStrategyPriority(t) && this._handleTriggerDeathPuzzle(t);
hs.tp.isAlgorithmProcessInfoTriggerAlgorithmResult(t) && hs.gameInfo.gameMode === hs.GameMode.Class && this._handleAlgorithmResult();
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerAfterOfferAlgo(t);
if (hs.tpManual.isClassAlgorithmBottomSequenceInfoOnDisableAfterAlgo(t)) {
var e = this._getData();
e.deathCausedByUs && !e.reviveInvalidated && hs.algorithmName.algoActualIdByPos == hs.OFFER_TYPE.ZHI_SI_TI && hs.algorithmBottomSequenceInfo.setIsTriggerAfterAlgo(!1);
}
hs.tpManual.isChapterAlgorithmBottomSequenceInfoTriggerBottomOfferAlgo(t) && this._handleChapterBlankReplace();
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerBottomOfferAlgo(t) && this._handleClassBottomSequence();
hs.tp.isClassRevive_ProxyReviveSuccessPostProcessing(t) && this._handleReviveSuccess();
hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(t) && this._handleClassGameEnd();
};
e.prototype._handleClassGameStart = function(t) {
var e, a;
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var r = this._getData(), i = t.args[0], s = !1;
if (null !== (a = null === (e = null == i ? void 0 : i.data) || void 0 === e ? void 0 : e.newGame) && void 0 !== a && a) {
r.todayClassGameCount++;
this._markFirstClassGameResidual(r, !1);
s = !0;
} else if (!r.todayPlayedClass) {
r.todayClassGameCount++;
this._markFirstClassGameResidual(r, !0);
s = !0;
}
r.todayPlayedClass = !0;
s && this._initClassGameState(r);
this._saveData(r);
};
e.prototype._handleChapterGameStart = function(t) {
var e, a;
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var r = this._getData(), i = t.args[0];
null !== (a = null === (e = null == i ? void 0 : i.data) || void 0 === e ? void 0 : e.newGame) && void 0 !== a && a ? r.todayChapterGameCount++ : r.todayPlayedChapter || r.todayChapterGameCount++;
r.todayPlayedChapter = !0;
this._saveData(r);
};
e.prototype._markFirstClassGameResidual = function(t, e) {
var a;
if (1 === t.todayClassGameCount) {
t.firstClassGameIsResidual = e;
if (e) {
var r = hs.scoreInfo.score, i = hs.scoreInfo.highRecordScore, s = null !== (a = this.props.residualScoreRatio) && void 0 !== a ? a : .15;
t.firstClassGameStrategyApplies = i > 0 && r / i <= s;
} else t.firstClassGameStrategyApplies = !1;
}
};
e.prototype._initClassGameState = function(t) {
var e, a, r, i, s, o;
t.deathTriggered = !1;
t.deathAttempting = !1;
t.deathFallbackToFill = !1;
t.reviveInvalidated = !1;
t.deathCausedByUs = !1;
t.deathTriggerTimeSec = 0;
if (this._isEligibleNextDayLowActivity()) if (hs.scoreInfo.highRecordScore <= (null !== (e = this.props.highScoreThreshold) && void 0 !== e ? e : 4e4)) t.deathTriggered = !0; else {
var l = t.todayClassGameCount;
if (l > (null !== (a = this.props.maxGameNum) && void 0 !== a ? a : 3)) t.deathTriggered = !0; else if (1 !== l || !t.firstClassGameIsResidual || t.firstClassGameStrategyApplies) {
var h = null !== (r = this.props.deathTimeStart) && void 0 !== r ? r : 30, n = null !== (i = this.props.deathTimeEnd) && void 0 !== i ? i : 60;
t.deathTriggerTimeSec = h + Math.random() * (n - h);
var d = 1 === l ? null !== (s = this.props.firstGameDeathProb) && void 0 !== s ? s : 1 : null !== (o = this.props.laterGameDeathProb) && void 0 !== o ? o : .5;
if (Math.random() < d) ; else {
t.deathTriggered = !0;
l >= 2 && (t.deathFallbackToFill = !0);
}
} else t.deathTriggered = !0;
} else t.deathTriggered = !0;
};
e.prototype._handleTriggerDeathPuzzle = function(t) {
var e;
this._ourDeathRequest = !1;
var a = this._getData();
if (!(a.deathTriggered || a.reviveInvalidated || hs.classGameInfo.roundNum <= 1)) {
var r = hs.classTimerInfo.spendTime / 1e3;
if (!(r < a.deathTriggerTimeSec)) if (r > (null !== (e = this.props.deathTimeEnd) && void 0 !== e ? e : 60)) {
a.deathTriggered = !0;
this._saveData(a);
} else {
this._ourDeathRequest = !0;
a.deathAttempting = !0;
this._saveData(a);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.Priority);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
hs.algorithmStrategyInfo.setAlgorithmPriorityList([ hs.OFFER_TYPE.ZHI_SI_TI ]);
t.returnState = !0;
}
}
};
e.prototype._handleAlgorithmResult = function() {
var t = this._getData();
if (t.deathAttempting) {
var e = hs.classAlgorithmName.algoActualId === hs.OFFER_TYPE.ZHI_SI_TI && this._ourDeathRequest;
t.deathAttempting = !1;
this._ourDeathRequest = !1;
if (e) {
t.deathTriggered = !0;
t.deathCausedByUs = !0;
}
this._saveData(t);
}
};
e.prototype._handleChapterBlankReplace = function() {
var t;
if (hs.gameInfo.gameMode === hs.GameMode.Chapter && this._isChapterStrategyActive() && "填空消除" === hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId]) {
var e = null !== (t = this.props.chapterFillProb) && void 0 !== t ? t : 1;
Math.random() >= e || hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.ALGO_FILL_MORE_AREA ]);
}
};
e.prototype._handleClassBottomSequence = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class && this._isClassStrategyActive()) if (this._getData().deathFallbackToFill) hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.ALGO_FILL_MORE_AREA ]); else if (hs.algorithmStrategyInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.LaneScheme) {
var t = hs.algorithmName.algoActualName;
Array.isArray(t) && 0 !== t.length && t.some(function(t) {
return "随机" === t || "随机无死亡" === t;
}) && hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.ALGO_FILL_MORE_AREA ]);
}
};
e.prototype._handleReviveSuccess = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var t = this._getData();
if (t.deathCausedByUs) {
t.reviveInvalidated = !0;
t.deathTriggered = !0;
t.deathFallbackToFill = !1;
this._saveData(t);
}
}
};
e.prototype._handleClassGameEnd = function() {
var t = this._getData();
t.deathAttempting = !1;
this._saveData(t);
};
e.prototype._checkDayBoundary = function() {
var t = this._getData(), e = this._getTodayString();
if (t.lastRecordDate !== e) {
t.yesterdayPlayedClass = t.todayPlayedClass;
t.yesterdayPlayedChapter = t.todayPlayedChapter;
var a = Date.now(), r = t.predictTodayTime > 0 ? hs.getDiffDays(a, t.predictTodayTime) : -1;
if (1 === r) {
t.predictYesterdayTime = t.predictTodayTime;
t.predictYesterdayIsLow = t.predictTodayIsLow;
} else if (0 !== r) {
t.predictYesterdayTime = 0;
t.predictYesterdayIsLow = !1;
}
t.todayPlayedClass = !1;
t.todayPlayedChapter = !1;
t.todayClassGameCount = 0;
t.todayChapterGameCount = 0;
t.firstClassGameIsResidual = !1;
t.firstClassGameStrategyApplies = !1;
t.deathTriggered = !1;
t.deathAttempting = !1;
t.deathTriggerTimeSec = 0;
t.deathFallbackToFill = !1;
t.reviveInvalidated = !1;
t.deathCausedByUs = !1;
t.lastRecordDate = e;
this._saveData(t);
}
};
e.prototype._getTodayString = function() {
var t = new Date();
return t.getFullYear() + "-" + (t.getMonth() + 1) + "-" + t.getDate();
};
e.prototype._getData = function() {
if (!this._storageData) {
var t = {
lastRecordDate: "",
todayClassGameCount: 0,
todayChapterGameCount: 0,
yesterdayPlayedClass: !1,
yesterdayPlayedChapter: !1,
todayPlayedClass: !1,
todayPlayedChapter: !1,
firstClassGameIsResidual: !1,
firstClassGameStrategyApplies: !1,
deathTriggerTimeSec: 0,
deathTriggered: !1,
deathAttempting: !1,
deathFallbackToFill: !1,
reviveInvalidated: !1,
deathCausedByUs: !1,
predictTodayTime: 0,
predictTodayIsLow: !1,
predictYesterdayTime: 0,
predictYesterdayIsLow: !1
}, e = hs.storage.getItem("Churn_prediction_tier_3Trait_Data", t);
this._storageData = s(s({}, t), e);
}
return this._storageData;
};
e.prototype._saveData = function(t) {
this._storageData = t;
hs.storage.setItem("Churn_prediction_tier_3Trait_Data", t);
};
o([ hs.Algorithm() ], e.prototype, "onActive", null);
return o([ classId("Churn_prediction_tier_3Trait") ], e);
}(Trait);
a.Churn_prediction_tier_3Trait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "Churn_prediction_tier_3Trait" ]);
//# sourceMappingURL=index.js.map
