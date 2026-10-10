window.__require = function t(e, a, r) {
function o(n, s) {
if (!a[n]) {
if (!e[n]) {
var d = n.split("/");
d = d[d.length - 1];
if (!e[d]) {
var h = "function" == typeof __require && __require;
if (!s && h) return h(d, !0);
if (i) return i(d, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = d;
}
var l = a[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return o(e[n][1][t] || t);
}, l, l.exports, t, e, a, r);
}
return a[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < r.length; n++) o(r[n]);
return o;
}({
ChurnPredictionTier2PeriodResetInfo: [ function(t, e, a) {
"use strict";
cc._RF.push(e, "2e8b5yffTRPY5uAHE0OX2py", "ChurnPredictionTier2PeriodResetInfo");
Object.defineProperty(a, "__esModule", {
value: !0
});
a.churnPredictionTier2PeriodResetInfo = void 0;
var r = function() {
function t() {}
t.prototype.dispatchPeriodReset = function() {
hs.EventManager.dispatchModuleEvent(new hs.E_ChapterConfig_PeriodReset());
};
return t;
}();
a.churnPredictionTier2PeriodResetInfo = new r();
cc._RF.pop();
}, {} ],
Churn_prediction_tier_2Trait: [ function(t, e, a) {
"use strict";
cc._RF.push(e, "b9b9dtTVjVK2b0ixk3Ub4sS", "Churn_prediction_tier_2Trait");
var r, o = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__assign || function() {
return (i = Object.assign || function(t) {
for (var e, a = 1, r = arguments.length; a < r; a++) {
e = arguments[a];
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
}
return t;
}).apply(this, arguments);
}, n = this && this.__decorate || function(t, e, a, r) {
var o, i = arguments.length, n = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, a) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, a, r); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (n = (i < 3 ? o(n) : i > 3 ? o(e, a, n) : o(e, a)) || n);
return i > 3 && n && Object.defineProperty(e, a, n), n;
};
Object.defineProperty(a, "__esModule", {
value: !0
});
a.Churn_prediction_tier_2Trait = void 0;
var s = t("../vo/ChurnPredictionTier2PeriodResetInfo"), d = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._storageData = null;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Proxy",
methodName: "onGameStart"
}, {
className: "ChapterGame_Proxy",
methodName: "onGameStart"
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
e.prototype._isAlgorithmStrategyActive = function() {
var t;
if (!this._isEligibleNextDayLowActivity()) return !1;
var e = this._getData(), a = null !== (t = this.props.maxFillGameNum) && void 0 !== t ? t : 3;
return !(e.todayTotalGameCount > a);
};
e.prototype.onActive = function(t) {
hs.tp.isLaunchChangeLaunchScene(t) && this._handleLandingPage(t);
hs.tp.isChapterConfig_ProxyIsExistNextPeriods(t) && this._handleColdStartIsExistNextPeriods(t);
hs.tp.isChapterGame_Ready_ProxyOnChapterGameReadyComplete(t) && this._handleColdStartPeriodResetBeforeChapterReady();
hs.tp.isClassGame_ProxyOnGameStart(t) && this._handleClassGameStart(t);
hs.tp.isChapterGame_ProxyOnGameStart(t) && this._handleChapterGameStart(t);
hs.tpManual.isChapterAlgorithmBottomSequenceInfoTriggerBottomOfferAlgo(t) && this._handleChapterBlankReplace();
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerBottomOfferAlgo(t) && this._handleClassBottomSequence();
};
e.prototype._handleLandingPage = function(t) {
var e;
this._checkDayBoundary();
var a = this._getTodayString(), r = this._getData();
if (r.lastColdStartLandingDate !== a) {
r.lastColdStartLandingDate = a;
this._saveData(r);
if (this._isEligibleNextDayLowActivity()) {
var o = !1;
if (r.yesterdayPlayedChapter && !r.yesterdayPlayedClass) o = !0; else {
var i = null !== (e = this.props.landingPageProb) && void 0 !== e ? e : .5;
o = Math.random() < i;
}
if (o) {
if (!hs.launchInfo.openChapterModule()) return;
r.coldStartJumpChapterPending = !0;
this._saveData(r);
t.args[0] = "chapter";
t.returnState = !0;
}
}
}
};
e.prototype._handleColdStartIsExistNextPeriods = function(t) {
var e = this._getData();
if (!0 === e.coldStartJumpChapterPending) if (t.returnState) {
e.coldStartJumpChapterPending = !1;
this._saveData(e);
} else if (hs.homePageInfo.checkNeedGoNextPeriods()) {
var a = hs.storage.getItem("chapterPeriodsIndex", 1);
e.coldStartJumpChapterPending = !1;
e.coldStartPeriodResetPending = !0;
e.coldStartPeriodResetPendingStage = a + 1;
this._saveData(e);
hs.storage.setItem("chapterPeriodsShowTime", Date.now());
hs.storage.setItem("needGoNextPeriods", !0);
t.returnState = !0;
t.returnValue = !0;
} else {
e.coldStartJumpChapterPending = !1;
this._saveData(e);
}
};
e.prototype._handleColdStartPeriodResetBeforeChapterReady = function() {
var t = this._getData();
if (t.coldStartPeriodResetPending) {
var e = hs.storage.getItem("chapterPeriodsIndex", 1), a = t.coldStartPeriodResetPendingStage;
t.coldStartPeriodResetPending = !1;
t.coldStartPeriodResetPendingStage = 0;
this._saveData(t);
e === a && hs.homePageInfo.needClearData && s.churnPredictionTier2PeriodResetInfo.dispatchPeriodReset();
}
};
e.prototype._handleClassGameStart = function(t) {
var e, a;
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var r = this._getData(), o = t.args[0], i = null !== (a = null === (e = null == o ? void 0 : o.data) || void 0 === e ? void 0 : e.newGame) && void 0 !== a && a, n = i || !r.todayPlayedClass;
i || r.todayPlayedClass;
if (n) {
r.todayTotalGameCount++;
r.todayClassGameCount++;
}
r.todayPlayedClass = !0;
this._saveData(r);
};
e.prototype._handleChapterGameStart = function(t) {
var e, a;
this._checkDayBoundary();
this._tryUpdateLowActivityCache();
var r = this._getData(), o = t.args[0];
null !== (a = null === (e = null == o ? void 0 : o.data) || void 0 === e ? void 0 : e.newGame) && void 0 !== a && a ? r.todayTotalGameCount++ : r.todayPlayedChapter || r.todayTotalGameCount++;
r.todayPlayedChapter = !0;
this._saveData(r);
};
e.prototype._handleChapterBlankReplace = function() {
var t;
if (hs.gameInfo.gameMode === hs.GameMode.Chapter && this._isAlgorithmStrategyActive() && "填空消除" === hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId]) {
var e = null !== (t = this.props.chapterFillProb) && void 0 !== t ? t : 1;
Math.random() >= e || hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.ALGO_FILL_MORE_AREA ]);
}
};
e.prototype._handleClassBottomSequence = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class && this._isAlgorithmStrategyActive() && this._isClassWithinWorkTime()) {
var t = hs.algorithmName.algoActualName;
Array.isArray(t) && 0 !== t.length && t.some(function(t) {
return "随机" === t || "随机无死亡" === t;
}) && hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.ALGO_FILL_MORE_AREA ]);
}
};
e.prototype._isClassWithinWorkTime = function() {
var t, e = this._getData().todayClassGameCount;
if (e <= 0) return !1;
var a = (null !== (t = this.props.classWorkTimes) && void 0 !== t ? t : [])[e - 1], r = null != a ? a : 60;
return !(hs.storage.getItem("classSpendTime", 0) > 1e3 * r);
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
t.todayTotalGameCount = 0;
t.todayClassGameCount = 0;
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
todayTotalGameCount: 0,
todayClassGameCount: 0,
yesterdayPlayedClass: !1,
yesterdayPlayedChapter: !1,
todayPlayedClass: !1,
todayPlayedChapter: !1,
predictTodayTime: 0,
predictTodayIsLow: !1,
predictYesterdayTime: 0,
predictYesterdayIsLow: !1,
lastColdStartLandingDate: "",
coldStartJumpChapterPending: !1,
coldStartPeriodResetPending: !1,
coldStartPeriodResetPendingStage: 0
}, e = hs.storage.getItem("Churn_prediction_tier_2Trait_Data", t);
this._storageData = i(i({}, t), e);
}
return this._storageData;
};
e.prototype._saveData = function(t) {
this._storageData = t;
hs.storage.setItem("Churn_prediction_tier_2Trait_Data", t);
};
n([ hs.Algorithm() ], e.prototype, "onActive", null);
return n([ classId("Churn_prediction_tier_2Trait") ], e);
}(Trait);
a.Churn_prediction_tier_2Trait = d;
cc._RF.pop();
}, {
"../vo/ChurnPredictionTier2PeriodResetInfo": "ChurnPredictionTier2PeriodResetInfo"
} ]
}, {}, [ "Churn_prediction_tier_2Trait", "ChurnPredictionTier2PeriodResetInfo" ]);
//# sourceMappingURL=index.js.map
