window.__require = function t(e, r, a) {
function i(h, s) {
if (!r[h]) {
if (!e[h]) {
var n = h.split("/");
n = n[n.length - 1];
if (!e[n]) {
var f = "function" == typeof __require && __require;
if (!s && f) return f(n, !0);
if (o) return o(n, !0);
throw new Error("Cannot find module '" + h + "'");
}
h = n;
}
var p = r[h] = {
exports: {}
};
e[h][0].call(p.exports, function(t) {
return i(e[h][1][t] || t);
}, p, p.exports, t, e, r, a);
}
return r[h].exports;
}
for (var o = "function" == typeof __require && __require, h = 0; h < a.length; h++) i(a[h]);
return i;
}({
JourneyHelperTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "b86e2WHrUBEf4Gx/rcYlWQB", "JourneyHelperTrait");
var a, i, o = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), h = this && this.__decorate || function(t, e, r, a) {
var i, o = arguments.length, h = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) h = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (h = (o < 3 ? i(h) : o > 3 ? i(e, r, h) : i(e, r)) || h);
return o > 3 && h && Object.defineProperty(e, r, h), h;
}, s = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var a, i, o = r.call(t), h = [];
try {
for (;(void 0 === e || e-- > 0) && !(a = o.next()).done; ) h.push(a.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
a && !a.done && (r = o.return) && r.call(o);
} finally {
if (i) throw i.error;
}
}
return h;
}, n = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(s(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.JourneyHelperTrait = void 0;
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.HARD = 1] = "HARD";
t[t.EASY = 2] = "EASY";
})(i || (i = {}));
var f = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.mData = null;
e.day = 0;
e.help = !1;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ChapterAlgorithmLifeCycle_GameStart_Proxy",
methodName: "onGameStart"
}, {
className: "ChapterAlgorithmLifeCycle_Revive_Proxy",
methodName: "onReviveShow"
} ];
};
e.prototype.onActive = function(t) {
hs.tp.isChapterAlgorithmLifeCycle_GameStart_ProxyOnGameStart(t) && this.init();
hs.tp.isChapterAlgorithmLifeCycle_Revive_ProxyOnReviveShow(t) && this.revive();
if (hs.tp.isChapterAlgorithmStrategyIOS_Priority_ProxyOnTriggerPriority(t) && this.triggerHard()) {
var e = hs.algorithmStrategyInfo.algorithmPriorityList, r = hs.algorithmStrategyIOSDifficultInfo.diffDownOffer([]);
e.push.apply(e, n([ hs.OFFER_TYPE.HIGH_NEAR ], r));
hs.algorithmStrategyInfo.setAlgorithmPriorityList(e);
t.replace = !0;
t.returnState = !0;
}
if (hs.tp.isChapterAlgoStrategyTraitHelpStage2(t)) {
var a = hs.chapterDifficultyInfo.chapterDifficultyList.get(hs.chapterGameInfo.chapterNum);
hs.chapterDifficultyInfo.isChapterDifficulty(a) && this.offerEasy();
}
if (hs.tp.isChapterAlgoStrategyTraitNoHelpStage2(t)) {
a = hs.chapterDifficultyInfo.chapterDifficultyList.get(hs.chapterGameInfo.chapterNum);
hs.chapterDifficultyInfo.isChapterMedium(a) ? this.offerEasy() : hs.chapterDifficultyInfo.isChapterDifficulty(a) && (hs.chapterAlgorithmStrategyGameInfo.getOfferNewBlockHardState() ? this.offerEasy(!0) : this.offerEasy());
}
};
e.prototype.init = function() {
this.mData = this.getData();
var t = this.changeTravel();
t = this.changeDay() || t;
(t = this.changeGame() || t) && storage.setItem("JourneyHelper", this.mData);
var e = storage.getItem("chapterPeriodsBeginTime", 0);
this.day = Math.ceil((new Date().getTime() - e) / 864e5);
var r = 15 * (this.day - 1), a = this.mData.chapterId + 1;
this.help = a > 5 && a <= r;
};
e.prototype.getData = function() {
var t = storage.getItem("JourneyHelper", null);
if (!t) {
var e = {
gameNum: -1,
travelId: -1,
chapterId: -1,
todayPass: 0,
session: 0,
tryTimes: 0,
highNear: !1,
revived: !1,
todayChapterCount: 0
};
storage.setItem("JourneyHelper", e);
return e;
}
void 0 === t.todayChapterCount && (t.todayChapterCount = 0);
return t;
};
e.prototype.changeTravel = function() {
if (this.mData.travelId != hs.chapterGameInfo.stage) {
this.mData.travelId = hs.chapterGameInfo.stage;
this.mData.gameNum = -1;
this.mData.chapterId = -1;
this.mData.todayPass = 0;
this.mData.session = Date.now();
this.mData.tryTimes = 0;
this.mData.highNear = !1;
this.mData.revived = !1;
this.mData.todayChapterCount = 0;
return !0;
}
return !1;
};
e.prototype.changeDay = function() {
var t = this.mData.session, e = new Date().getTime(), r = new Date(e).setHours(0, 0, 0, 0);
if (t < r || t > r + 864e5) {
this.mData.session = e;
this.mData.todayPass = 0;
this.mData.highNear = !1;
this.mData.todayChapterCount = 0;
return !0;
}
return !1;
};
e.prototype.changeGame = function() {
if (this.mData.gameNum != hs.chapterGameInfo.gameNum) {
this.updateChapter();
this.mData.revived = !1;
this.mData.gameNum = hs.chapterGameInfo.gameNum;
return !0;
}
return !1;
};
e.prototype.updateChapter = function() {
if (this.mData.chapterId == hs.chapterGameInfo.chapterNum) {
this.mData.todayPass = 0;
this.mData.tryTimes++;
this.mData.highNear && this.mData.tryTimes > 1 && (this.mData.highNear = !1);
} else {
1 === this.mData.tryTimes && (this.mData.todayPass += 1);
this.mData.tryTimes = 1;
this.mData.chapterId = hs.chapterGameInfo.chapterNum;
this.mData.todayChapterCount++;
this.mData.todayPass >= 3 && (this.mData.highNear = !0);
}
};
e.prototype.revive = function() {
if (this.mData) {
this.mData.revived = !0;
storage.setItem("JourneyHelper", this.mData);
}
};
e.prototype.triggerHard = function() {
if (!this.mData) return !1;
var t = hs.chapterConfigInfo.getChapterProgress();
return hs.gameInfo.gameMode === hs.GameMode.Chapter && this.mData.highNear && !this.mData.revived && t > .7;
};
e.prototype.offerEasy = function(t) {
void 0 === t && (t = !1);
if (this.triggerHelp(t)) {
var e = hs.algorithmStrategyInfo.algorithmList;
e.unshift(hs.OFFER_TYPE.ALGO_QUICK);
hs.algorithmStrategyInfo.setAlgorithmList(e);
}
};
e.prototype.offerEasyGP = function(t) {
void 0 === t && (t = !1);
if (this.triggerHelp(t)) {
var e = hs.algorithmStrategyInfo.algorithmList;
e.unshift(hs.OFFER_TYPE.ALGO_QUICK);
hs.algorithmStrategyInfo.setAlgorithmList(e);
}
};
e.prototype.triggerHelp = function(t) {
if (!this.mData) return !1;
var e = hs.gameInfo.gameMode === hs.GameMode.Chapter && this.help;
if (e && t) {
var r = hs.chapterDifficultyInfo.chapterDifficultyList.get(hs.chapterGameInfo.chapterNum);
hs.chapterDifficultyInfo.isChapterDifficulty(r) && 1 === this.mData.tryTimes && (e = !1);
}
return e;
};
e.prototype.isCurrentAlgoHardProblem = function() {
var t, e, r, a = null === (t = hs.algorithmName) || void 0 === t ? void 0 : t.algoExpectedId;
if (a && a !== hs.OFFER_TYPE.NONE) return hs.isValueInEnum(a, hs.OFFER_TYPE_DIFFICULTY);
var i = null === (e = hs.algorithmName) || void 0 === e ? void 0 : e.algoActualId;
return !(!i || i === hs.OFFER_TYPE.NONE) && ((null === (r = hs.OFFER_TYPE_STRINGS) || void 0 === r ? void 0 : r[i]) || "").includes("难题");
};
return h([ classId("JourneyHelperTrait") ], e);
}(Trait);
r.JourneyHelperTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "JourneyHelperTrait" ]);
//# sourceMappingURL=index.js.map
