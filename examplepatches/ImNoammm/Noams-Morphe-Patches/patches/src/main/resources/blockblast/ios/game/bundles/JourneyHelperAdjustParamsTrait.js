window.__require = function t(e, r, a) {
function i(s, n) {
if (!r[s]) {
if (!e[s]) {
var h = s.split("/");
h = h[h.length - 1];
if (!e[h]) {
var u = "function" == typeof __require && __require;
if (!n && u) return u(h, !0);
if (o) return o(h, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = h;
}
var p = r[s] = {
exports: {}
};
e[s][0].call(p.exports, function(t) {
return i(e[s][1][t] || t);
}, p, p.exports, t, e, r, a);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < a.length; s++) i(a[s]);
return i;
}({
JourneyHelperAdjustParamsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "532e55xZwBJ7rlqGsvZDqHo", "JourneyHelperAdjustParamsTrait");
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
}), s = this && this.__decorate || function(t, e, r, a) {
var i, o = arguments.length, s = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, a); else for (var n = t.length - 1; n >= 0; n--) (i = t[n]) && (s = (o < 3 ? i(s) : o > 3 ? i(e, r, s) : i(e, r)) || s);
return o > 3 && s && Object.defineProperty(e, r, s), s;
}, n = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var a, i, o = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(a = o.next()).done; ) s.push(a.value);
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
return s;
}, h = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(n(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.JourneyHelperAdjustParamsTrait = void 0;
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.HARD = 1] = "HARD";
t[t.EASY = 2] = "EASY";
})(i || (i = {}));
var u = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.mData = null;
e.day = 0;
e.help = !1;
return e;
}
Object.defineProperty(e.prototype, "levelNum", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.levelNum;
return "number" == typeof e && e > 0 ? e : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "calcMul", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.calcMul;
return "number" == typeof e && e > 0 ? e : 15;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "winStreak", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.winStreak;
return "number" == typeof e && e > 0 ? e : 3;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "process", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.process;
return "number" == typeof e && e >= 0 && e <= 1 ? e : .7;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "toAlgo", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.toAlgo;
return "number" == typeof e && hs.isValueInEnum(e, hs.OFFER_TYPE) ? e : hs.OFFER_TYPE.ALGO_QUICK;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "downAlgo", {
get: function() {
var t, e = null === (t = this.props) || void 0 === t ? void 0 : t.downAlgo;
return "number" == typeof e && hs.isValueInEnum(e, hs.OFFER_TYPE) ? e : hs.OFFER_TYPE.HIGH_NEAR;
},
enumerable: !1,
configurable: !0
});
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
e.push.apply(e, h([ this.downAlgo ], r));
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
(t = this.changeGame() || t) && storage.setItem("JourneyHelperAdjustParams", this.mData);
var e = storage.getItem("chapterPeriodsBeginTime", 0);
this.day = Math.ceil((new Date().getTime() - e) / 864e5);
var r = (this.day - 1) * this.calcMul, a = this.mData.chapterId + 1;
this.help = a > this.levelNum && a <= r;
};
e.prototype.getData = function() {
var t = storage.getItem("JourneyHelperAdjustParams", null);
if (!t) {
var e = {
gameNum: -1,
travelId: -1,
chapterId: -1,
todayPass: 0,
session: 0,
tryTimes: 0,
highNear: !1,
revived: !1
};
storage.setItem("JourneyHelperAdjustParams", e);
return e;
}
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
this.mData.todayPass >= this.winStreak && (this.mData.highNear = !0);
}
};
e.prototype.revive = function() {
if (this.mData) {
this.mData.revived = !0;
storage.setItem("JourneyHelperAdjustParams", this.mData);
}
};
e.prototype.triggerHard = function() {
if (!this.mData) return !1;
var t = hs.chapterConfigInfo.getChapterProgress();
return hs.gameInfo.gameMode === hs.GameMode.Chapter && this.mData.highNear && !this.mData.revived && t > this.process;
};
e.prototype.offerEasy = function(t) {
void 0 === t && (t = !1);
if (this.triggerHelp(t)) {
var e = hs.algorithmStrategyInfo.algorithmList;
e.unshift(this.toAlgo);
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
return s([ classId("JourneyHelperAdjustParamsTrait") ], e);
}(Trait);
r.JourneyHelperAdjustParamsTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "JourneyHelperAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
