window.__require = function t(e, r, i) {
function o(s, n) {
if (!r[s]) {
if (!e[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!e[l]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var u = r[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return o(e[s][1][t] || t);
}, u, u.exports, t, e, r, i);
}
return r[s].exports;
}
for (var a = "function" == typeof __require && __require, s = 0; s < i.length; s++) o(i[s]);
return o;
}({
MaturityDevelopmentV2Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "98488gToAVMVIqa3aAPV2BX", "MaturityDevelopmentV2Trait");
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
}), s = this && this.__assign || function() {
return (s = Object.assign || function(t) {
for (var e, r = 1, i = arguments.length; r < i; r++) {
e = arguments[r];
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
}
return t;
}).apply(this, arguments);
}, n = this && this.__decorate || function(t, e, r, i) {
var o, a = arguments.length, s = a < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, i); else for (var n = t.length - 1; n >= 0; n--) (o = t[n]) && (s = (a < 3 ? o(s) : a > 3 ? o(e, r, s) : o(e, r)) || s);
return a > 3 && s && Object.defineProperty(e, r, s), s;
}, l = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, r = e && t[e], i = 0;
if (r) return r.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && i >= t.length && (t = void 0);
return {
value: t && t[i++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, c = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var i, o, a = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(i = a.next()).done; ) s.push(i.value);
} catch (t) {
o = {
error: t
};
} finally {
try {
i && !i.done && (r = a.return) && r.call(a);
} finally {
if (o) throw o.error;
}
}
return s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.MaturityDevelopmentV2Trait = void 0;
(function(t) {
t[t.Low = 1] = "Low";
t[t.High = 2] = "High";
t[t.LowNot = 3] = "LowNot";
t[t.HighNot = 4] = "HighNot";
t[t.FirstHigh = 5] = "FirstHigh";
t[t.MAX = 6] = "MAX";
})(o || (o = {}));
var u = "session", h = [ [ 0, 3, 60 ], [ 4, 12, 68 ], [ 13, 99999, 65 ] ], y = [ [ 0, 3, 60 ], [ 4, 12, 68 ], [ 13, 99999, 65 ] ], d = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._sessionCachedScore = null;
e._sessionCachedHabitScore = null;
e._sessionCachedSkillScore = null;
e._sessionCachedAdScore = null;
e._sessionReported = !1;
e._maturityAdSceneData = {};
e._storageCache = null;
e._rewardDisplayed = !1;
e._effectiveType = u;
e._effectiveLowMaturity = h;
e._effectiveHighMaturity = y;
return e;
}
r = e;
e.prototype.clamp = function(t, e, r) {
return Math.min(r, Math.max(e, t));
};
e.prototype.defaultStorage = function() {
return {
firstLoginEntryTimeByDay: {},
firstRoundGameNumByDay: {},
recentSamples: [],
dailySamples: [],
yDailySamples: [],
rewardShows: 0,
rewardSuccess: 0,
interstitialShows: 0,
interstitialComplete: 0,
yRewardShows: 0,
yRewardSuccess: 0,
yInterstitialShows: 0,
yInterstitialComplete: 0,
dailySamplesYmd: "",
lastDailyReportYmd: "",
dataVersion: 0,
cacheDataVersion: -1,
cachedTotalScore: 0,
cachedDailyTotalScore: 0,
cachedDailyHabitScore: 0,
cachedDailySkillScore: 0,
cachedDailyAdScore: 0
};
};
e.prototype.ymdOffset = function(t) {
var e = new Date();
e.setHours(0, 0, 0, 0);
0 !== t && e.setDate(e.getDate() + t);
return hs.getTodayDateStr(e.getTime());
};
e.prototype.recordFirstLoginEntryTimeOfDay = function(t) {
var e, r, i = t.firstLoginEntryTimeByDay && "object" == typeof t.firstLoginEntryTimeByDay ? t.firstLoginEntryTimeByDay : {}, o = this.ymdOffset(0), a = s({}, i);
if (!(o in a)) {
var n = hs.storage.getItem("entryTime", 0) || Date.now();
a[o] = n;
}
var u = this.ymdOffset(-8), h = {};
try {
for (var y = l(Object.entries(a)), d = y.next(); !d.done; d = y.next()) {
var p = c(d.value, 2), f = p[0], m = p[1];
f >= u && "number" == typeof m && Number.isFinite(m) && (h[f] = m);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
d && !d.done && (r = y.return) && r.call(y);
} finally {
if (e) throw e.error;
}
}
return s(s({}, t), {
firstLoginEntryTimeByDay: h
});
};
e.prototype.dailyGameCountOf = function(t) {
if (!t) return 0;
var e = t.count;
return "number" == typeof e && Number.isFinite(e) ? Math.max(0, e) : 0;
};
e.prototype.recordFirstRoundGameNumSnapshotForDay = function(t) {
var e, r, i = this.ymdOffset(0), o = t.firstRoundGameNumByDay && "object" == typeof t.firstRoundGameNumByDay ? t.firstRoundGameNumByDay : {}, a = s({}, o), n = a[i];
a[i] = {
count: this.dailyGameCountOf(n) + 1,
atMs: Date.now()
};
var u = this.ymdOffset(-7), h = {};
try {
for (var y = l(Object.entries(a)), d = y.next(); !d.done; d = y.next()) {
var p = c(d.value, 2), f = p[0], m = p[1];
f >= u && f <= i && m && (h[f] = m);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
d && !d.done && (r = y.return) && r.call(y);
} finally {
if (e) throw e.error;
}
}
return s(s({}, t), {
firstRoundGameNumByDay: h
});
};
e.prototype.countLoginDaysLast7ExcludeToday = function(t) {
var e, r, i = this.ymdOffset(-7), o = this.ymdOffset(-1), a = t.firstLoginEntryTimeByDay || {}, s = 0;
try {
for (var n = l(Object.keys(a)), c = n.next(); !c.done; c = n.next()) {
var u = c.value;
u >= i && u <= o && (s += 1);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
c && !c.done && (r = n.return) && r.call(n);
} finally {
if (e) throw e.error;
}
}
return s;
};
e.prototype.ymdDiffDays = function(t, e) {
var r = t.split("-").map(Number), i = e.split("-").map(Number);
if (3 !== r.length || 3 !== i.length || r.some(function(t) {
return !Number.isFinite(t);
}) || i.some(function(t) {
return !Number.isFinite(t);
})) return NaN;
var o = new Date(r[0], r[1] - 1, r[2]).setHours(0, 0, 0, 0), a = new Date(i[0], i[1] - 1, i[2]).setHours(0, 0, 0, 0);
return Math.round((a - o) / 864e5);
};
e.prototype.maxConsecutiveLoginDaysLast7ExcludeToday = function(t) {
var e = this.ymdOffset(-7), r = this.ymdOffset(-1), i = Object.keys(t.firstLoginEntryTimeByDay || {}).filter(function(t) {
return t >= e && t <= r;
}).sort();
if (0 === i.length) return 0;
for (var o = 1, a = 1, s = 1; s < i.length; s++) if (1 === this.ymdDiffDays(i[s - 1], i[s])) {
a += 1;
o = Math.max(o, a);
} else a = 1;
return o;
};
e.prototype.recencyDaysSinceLastLoginFrom = function(t) {
var e = this.ymdOffset(0), r = this.ymdOffset(-1), i = Object.keys(t.firstLoginEntryTimeByDay || {}).filter(function(t) {
return t !== e;
}).sort();
if (0 === i.length) return 7;
var o = i[i.length - 1], a = this.ymdDiffDays(o, r);
return Number.isFinite(a) ? Math.min(7, Math.max(0, a)) : 7;
};
e.prototype.gamesLast7FromSnapshot = function(t, e) {
var r, i;
void 0 === e && (e = !1);
var o = t.firstRoundGameNumByDay || {}, a = this.ymdOffset(e ? -7 : -6), s = this.ymdOffset(e ? -1 : 0), n = 0;
try {
for (var u = l(Object.entries(o)), h = u.next(); !h.done; h = u.next()) {
var y = c(h.value, 2), d = y[0], p = y[1];
d >= a && d <= s && (n += this.dailyGameCountOf(p));
}
} catch (t) {
r = {
error: t
};
} finally {
try {
h && !h.done && (i = u.return) && i.call(u);
} finally {
if (r) throw r.error;
}
}
return n;
};
e.prototype.intensityBucket = function(t) {
return t <= 1 ? 0 : t <= 6 ? 1 : t <= 19 ? 2 : t <= 53 ? 3 : t <= 147 ? 4 : 5;
};
e.prototype.score14FrequencyFromLoginDayCount = function(t) {
return 7 === t ? 100 : this.clamp(13.5 * t + 1.2, 0, 100);
};
e.prototype.score15EngagementFromConsecutiveLoginDays = function(t) {
return 7 === t ? 100 : this.clamp(-.79 * t * t + 18.1 * t + 5.13, 0, 100);
};
e.prototype.score16RecencyFromLoginGapDays = function(t) {
return t <= 0 ? 100 : this.clamp(87.35 * Math.exp(-.47 * t) + 9.69, 0, 100);
};
e.prototype.score17IntensityFromBucket = function(t) {
return 5 === t ? 100 : this.clamp(-1.66 * t * t + 27.18 * t + 6.19, 0, 100);
};
e.prototype.habitTotal60 = function(t, e) {
void 0 === e && (e = "session");
var r = this.countLoginDaysLast7ExcludeToday(t), i = this.maxConsecutiveLoginDaysLast7ExcludeToday(t), o = this.recencyDaysSinceLastLoginFrom(t), a = this.intensityBucket(this.gamesLast7FromSnapshot(t, "daily" === e));
return this.score14FrequencyFromLoginDayCount(r) / 100 * 15 + this.score15EngagementFromConsecutiveLoginDays(i) / 100 * 15 + this.score16RecencyFromLoginGapDays(o) / 100 * 15 + this.score17IntensityFromBucket(a) / 100 * 15;
};
e.prototype.lookupTableRounded = function(t, e) {
if (0 === e.length) return 0;
for (var r = Math.round(t), i = e[0], o = Math.abs(e[0].x - r), a = 1; a < e.length; a++) {
var s = Math.abs(e[a].x - r);
if (s < o) {
o = s;
i = e[a];
}
}
return i.y;
};
e.prototype.score21EndlessAvgScore = function(t) {
var e = 1e3 * Math.round(t / 1e3);
return this.clamp(this.lookupTableRounded(e, [ {
x: 11e3,
y: 60
}, {
x: 12e3,
y: 72
}, {
x: 13e3,
y: 81.6
}, {
x: 14e3,
y: 89.6
}, {
x: 15e3,
y: 95.2
}, {
x: 16e3,
y: 98.4
}, {
x: 17e3,
y: 100
}, {
x: 18e3,
y: 99.2
}, {
x: 19e3,
y: 96.4
}, {
x: 2e4,
y: 91.6
}, {
x: 21e3,
y: 84.8
}, {
x: 22e3,
y: 75.6
} ]), 0, 100);
};
e.prototype.score22PuzzleClearsAvg = function(t) {
return this.clamp(this.lookupTableRounded(t, [ {
x: 0,
y: 60
}, {
x: 1,
y: 100
}, {
x: 2,
y: 84.4
}, {
x: 3,
y: 75.6
}, {
x: 4,
y: 69.2
}, {
x: 5,
y: 64
}, {
x: 7,
y: 60
} ]), 0, 100);
};
e.prototype.score23ComboMaxAvg = function(t) {
return this.clamp(this.lookupTableRounded(t, [ {
x: 9,
y: 60
}, {
x: 10,
y: 73.2
}, {
x: 11,
y: 84
}, {
x: 12,
y: 92
}, {
x: 13,
y: 97.2
}, {
x: 14,
y: 100
}, {
x: 15,
y: 100
}, {
x: 16,
y: 97.6
}, {
x: 17,
y: 92.4
}, {
x: 18,
y: 84.4
}, {
x: 19,
y: 74
}, {
x: 20,
y: 61.2
} ]), 0, 100);
};
e.prototype.score24ClearScreenAvg = function(t) {
return this.clamp(this.lookupTableRounded(t, [ {
x: 1,
y: 65.6
}, {
x: 2,
y: 83.2
}, {
x: 3,
y: 94.8
}, {
x: 4,
y: 100
}, {
x: 5,
y: 99.2
}, {
x: 6,
y: 92.4
}, {
x: 7,
y: 79.2
}, {
x: 9,
y: 60
} ]), 0, 100);
};
e.prototype.skillTotal20 = function(t) {
var e = t.length, r = function(r) {
return e > 0 ? t.reduce(function(t, e) {
return t + r(e);
}, 0) / e : 0;
};
return this.score21EndlessAvgScore(r(function(t) {
return t.score;
})) / 100 * 5 + this.score22PuzzleClearsAvg(Math.round(r(function(t) {
return t.puzzleClears;
}))) / 100 * 5 + this.score23ComboMaxAvg(Math.round(r(function(t) {
return t.comboMax;
}))) / 100 * 5 + this.score24ClearScreenAvg(Math.round(r(function(t) {
return t.clearScreens;
}))) / 100 * 5;
};
e.prototype.score31RewardAdFromRate = function(t, e) {
if (t <= 0) return 60;
var r = this.clamp(e / t, 0, 1), i = Math.log;
return t <= 5 ? this.clamp(60 + 2.857 * (1.65 * i(r + 2e-4) + 100 - 86), 0, 100) : t <= 10 ? this.clamp(60 + 2.857 * (3.4 * i(r + .1084) + 99.65 - 86), 0, 100) : this.clamp(60 + 2.857 * (2.16 * i(r + .111) + 99.77 - 86), 0, 100);
};
e.prototype.score32InterstitialFromRate = function(t, e) {
if (t <= 0) return 60;
var r = this.clamp(e / t, 0, 1), i = Math.log;
return t <= 10 ? this.clamp(60 + 2.667 * (108.45 * r * r * r - 142.58 * r * r + 33.56 * r + 12.85), 0, 100) : t <= 20 ? this.clamp(60 + 2.667 * (1.68 * i(Math.max(1 - r - .07, 1e-4)) + 100.12 - 85), 0, 100) : this.clamp(60 + 2.667 * (.4 * i(Math.max(1 - r - .06, 1e-4)) + 100.02 - 85), 0, 100);
};
e.prototype.adTotal20ForSession = function(t) {
return this.score31RewardAdFromRate(t.rewardShows + t.yRewardShows, t.rewardSuccess + t.yRewardSuccess) / 100 * 10 + this.score32InterstitialFromRate(t.interstitialShows + t.yInterstitialShows, t.interstitialComplete + t.yInterstitialComplete) / 100 * 10;
};
e.prototype.adTotal20ForDaily = function(t) {
return this.score31RewardAdFromRate(t.yRewardShows, t.yRewardSuccess) / 100 * 10 + this.score32InterstitialFromRate(t.yInterstitialShows, t.yInterstitialComplete) / 100 * 10;
};
e.prototype.onActive = function(t) {
if (hs.tp.isLaunchStartEnter(t)) {
var e = this.ymdOffset(0), r = this.load();
if (!(e in (r.firstLoginEntryTimeByDay || {}))) {
r = this.recordFirstLoginEntryTimeOfDay(r);
this.bumpDataVersion(r);
this.save(r);
}
}
if (hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(t)) {
this.recordGameSkill();
this.recordGameNumForDay();
}
if (hs.tp.isClassGame_ProxyOnGameStart(t) || hs.tp.isChapterGame_ProxyOnGameStart(t)) {
this._maturityAdSceneData = {};
this.emitMaturityInternal("game", void 0, void 0, !0);
if (!this._sessionReported) {
this._sessionReported = !0;
this.emitMaturityInternal("session", void 0, void 0, !0);
}
var i = this.load();
if (i.lastDailyReportYmd !== this.ymdOffset(0)) {
i.lastDailyReportYmd = this.ymdOffset(0);
this.save(i);
this.emitMaturityInternal("daily", void 0, void 0, !0);
}
var o = this._maturityAdSceneData, a = {};
o.game && (a.maturity_triger_game = o.game);
o.session && (a.maturity_triger_session = o.session);
o.daily && (a.maturity_triger_day = o.daily);
Object.keys(a).length > 0 && hs.NativeAdvertisementScene.openAdvertisementSceneForRN(hs.AdvertisementScenePeriod.maturity, "", a);
}
(hs.tp.isClassGame_Replay_ProxyOnGameReplay(t) || hs.tp.isChapterGame_ProxyOnGameEndData(t)) && this.recordGameNumForDay();
(hs.tp.isClassAdvertisement_RewardProxyShowFullSuccess(t) || hs.tp.isChapterAdvertisement_RewardProxyShowFullSuccess(t)) && this.onRewardShown();
(hs.tp.isClassAdvertisement_RewardProxyOnRewardOver(t) || hs.tp.isChapterAdvertisement_RewardProxyOnRewardOver(t)) && this.onRewardOverCallback(t);
(hs.tp.isAdvertisement_FullScene_ProxyShowFullSuccess(t) || hs.tp.isClassAdvertisement_FullScreenProxyShowFullSuccess(t) || hs.tp.isChapterAdvertisement_FullScreenProxyShowFullSuccess(t)) && this.onInterstitialShown();
(hs.tp.isAdvertisement_FullScene_ProxyAdvertisementCallBack(t) || hs.tp.isClassAdvertisement_FullScreenProxyAdvertisementCallBack(t)) && this.onInterstitialCallback(t);
hs.tp.isChapterAdvertisement_FullScreenProxyAdvertisementCallBack(t) && this.onChapterInterstitialCallback(t);
};
e.prototype.isNetworkConnected = function() {
return cc.sys.getNetworkType() !== cc.sys.NetworkType.NONE;
};
e.prototype.onRewardShown = function() {
if (this.isNetworkConnected()) {
this._rewardDisplayed = !0;
this.bumpAdRewardShow();
}
};
e.prototype.onRewardOverCallback = function(t) {
var e, r = null === (e = t.args) || void 0 === e ? void 0 : e[0];
this._rewardDisplayed && r === hs.AdvertiseCallBackState.Advertise_Success && this.bumpAdRewardSuccess();
this._rewardDisplayed = !1;
};
e.prototype.onInterstitialShown = function() {
this.isNetworkConnected() && this.bumpInterstitialShow();
};
e.prototype.onInterstitialCallback = function(t) {
var e;
this.recordInterstitialComplete(null === (e = t.args) || void 0 === e ? void 0 : e[1]);
};
e.prototype.onChapterInterstitialCallback = function(t) {
var e;
this.recordInterstitialComplete(null === (e = t.args) || void 0 === e ? void 0 : e[0]);
};
e.prototype.recordInterstitialComplete = function(t) {
t === hs.AdvertiseCallBackState.Advertise_Success && this.bumpInterstitialComplete();
};
e.prototype.load = function() {
null === this._storageCache && (this._storageCache = hs.storage.getItem(r.STORAGE_KEY, this.defaultStorage()));
var t = this.rolloverDayIfNeeded(this._storageCache);
if (t !== this._storageCache) {
this._storageCache = t;
this.clearSessionCachedScores();
hs.storage.setItem(r.STORAGE_KEY, t);
}
return this._storageCache;
};
e.prototype.save = function(t) {
this._storageCache = t;
hs.storage.setItem(r.STORAGE_KEY, t);
};
e.prototype.rolloverDayIfNeeded = function(t) {
var e = this.ymdOffset(0);
if (t.dailySamplesYmd === e) return t;
var r = this.ymdOffset(-1), i = t.dailySamplesYmd === r;
return s(s({}, t), {
dailySamplesYmd: e,
yDailySamples: i && t.dailySamples || [],
dailySamples: [],
yRewardShows: i ? t.rewardShows : 0,
yRewardSuccess: i ? t.rewardSuccess : 0,
yInterstitialShows: i ? t.interstitialShows : 0,
yInterstitialComplete: i ? t.interstitialComplete : 0,
rewardShows: 0,
rewardSuccess: 0,
interstitialShows: 0,
interstitialComplete: 0
});
};
e.prototype.bumpDataVersion = function(t) {
t.dataVersion = (t.dataVersion || 0) + 1;
};
e.prototype.recordGameSkill = function() {
var t, e, r, i, o, a;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var s = this.load(), n = null === (t = hs.classDataStatisticsInfo) || void 0 === t ? void 0 : t.dataStatisticsInfo, l = {
dayYmd: this.ymdOffset(0),
score: null !== (r = null === (e = hs.scoreInfo) || void 0 === e ? void 0 : e.score) && void 0 !== r ? r : 0,
puzzleClears: null !== (i = null == n ? void 0 : n.eliminate3) && void 0 !== i ? i : 0,
comboMax: null !== (o = null == n ? void 0 : n.comboMaxNum) && void 0 !== o ? o : 0,
clearScreens: null !== (a = null == n ? void 0 : n.eliminateAll) && void 0 !== a ? a : 0
};
s.dailySamples = (s.dailySamples || []).concat(l);
var c = (s.recentSamples || []).concat(l);
s.recentSamples = c.length > 10 ? c.slice(-10) : c;
this.bumpDataVersion(s);
this.save(s);
}
};
e.prototype.recordGameNumForDay = function() {
var t = this.load();
t = this.recordFirstRoundGameNumSnapshotForDay(t);
this.bumpDataVersion(t);
this.save(t);
};
e.prototype.bumpAdRewardShow = function() {
var t = this.load();
t.rewardShows += 1;
this.bumpDataVersion(t);
this.save(t);
};
e.prototype.bumpAdRewardSuccess = function() {
var t = this.load();
t.rewardSuccess += 1;
this.bumpDataVersion(t);
this.save(t);
};
e.prototype.bumpInterstitialShow = function() {
var t = this.load();
t.interstitialShows += 1;
this.bumpDataVersion(t);
this.save(t);
};
e.prototype.bumpInterstitialComplete = function() {
var t = this.load();
t.interstitialComplete += 1;
this.bumpDataVersion(t);
this.save(t);
};
Object.defineProperty(e.prototype, "type", {
get: function() {
return this._effectiveType;
},
enumerable: !1,
configurable: !0
});
e.prototype.setEffective = function(t, e, r) {
this._effectiveType = "session" === t || "game" === t || "daily" === t ? t : u;
this._effectiveLowMaturity = Array.isArray(e) && e.length > 0 ? e : h;
this._effectiveHighMaturity = Array.isArray(r) && r.length > 0 ? r : y;
};
e.prototype.emitMaturity = function(t, e, r) {
void 0 === t && (t = u);
void 0 === e && (e = h);
void 0 === r && (r = y);
return this.emitMaturityInternal(t, e, r, !1);
};
e.prototype.emitMaturityInternal = function(t, e, r, i) {
void 0 === t && (t = u);
void 0 === e && (e = h);
void 0 === r && (r = y);
void 0 === i && (i = !1);
this.setEffective(t, e, r);
var o = this.type, a = this.load();
if (!i && this.hasCachedScore(a, o)) return this.readCachedScore(a, o);
var s = this.computeTotal(a, i);
this.writeCachedScore(a, o, s);
return s;
};
e.prototype.hasCachedScore = function(t, e) {
return "session" === e ? null !== this._sessionCachedScore : "daily" === e ? t.cachedDailyTotalScore > 0 : t.cachedTotalScore > 0;
};
e.prototype.readCachedScore = function(t, e) {
var r;
return "session" === e ? null !== (r = this._sessionCachedScore) && void 0 !== r ? r : 0 : "daily" === e ? t.cachedDailyTotalScore : t.cachedTotalScore;
};
e.prototype.clearSessionCachedScores = function() {
this._sessionCachedScore = null;
this._sessionCachedHabitScore = null;
this._sessionCachedSkillScore = null;
this._sessionCachedAdScore = null;
};
e.prototype.writeCachedScore = function(t, e, r) {
if ("session" !== e) if ("daily" !== e) {
t.cachedTotalScore = r;
hs.maturityInfo.setGameScore(r);
t.cacheDataVersion = t.dataVersion || 0;
this.save(t);
} else {
t.cachedDailyTotalScore = r;
hs.maturityInfo.setDailyScore(r);
this.save(t);
} else {
this._sessionCachedScore = r;
hs.maturityInfo.setSessionScore(r);
}
};
e.prototype.computeTotal = function(t, e) {
void 0 === e && (e = !1);
var r = this.getHabitScore(t), i = this.getSkillScore(t), o = this.getAdScore(t), a = Math.round(100 * this.clamp(r + i + o, 0, 100)) / 100;
if ("session" === this.type) {
this._sessionCachedHabitScore = r;
this._sessionCachedSkillScore = i;
this._sessionCachedAdScore = o;
hs.storage.setItem("maturityDevelopmentTrait_v2_session", {
total: a,
habit: r,
skill: i,
ad: o
});
}
if ("daily" === this.type) {
t.cachedDailyHabitScore = r;
t.cachedDailySkillScore = i;
t.cachedDailyAdScore = o;
}
if (e) {
this.reportMaturityDot(a, r, i, o);
this._maturityAdSceneData[this.type] = {
total_score: a,
habit_score: r,
skill_score: i,
ad_score: o,
trigger_timing: "game" === this.type ? 1 : "daily" === this.type ? 2 : 3,
install_day: hs.getDiffDays(hs.gameInfo.firstEntryTime, Date.now())
};
}
return a;
};
e.prototype.getHabitScore = function(t, e) {
var r = t || this.load();
return Math.round(100 * this.habitTotal60(r, null != e ? e : this.type)) / 100;
};
e.prototype.getSkillScore = function(t, e) {
var r = t || this.load(), i = "daily" === (null != e ? e : this.type) ? r.yDailySamples || [] : r.recentSamples || [];
return Math.round(100 * this.skillTotal20(i)) / 100;
};
e.prototype.getAdScore = function(t, e) {
var r = t || this.load(), i = "daily" === (null != e ? e : this.type) ? this.adTotal20ForDaily(r) : this.adTotal20ForSession(r);
return Math.round(100 * i) / 100;
};
e.prototype.getCachedHabitScore = function(t, e) {
var r = t || this.load(), i = null != e ? e : u;
if ("game" === i) return this.getHabitScore(r, "game");
var o = this.readCachedHabitScore(r, i);
return null !== o ? o : this.getHabitScore(r, i);
};
e.prototype.getCachedSkillScore = function(t, e) {
var r = t || this.load(), i = null != e ? e : u;
if ("game" === i) return this.getSkillScore(r, "game");
var o = this.readCachedSkillScore(r, i);
return null !== o ? o : this.getSkillScore(r, i);
};
e.prototype.getCachedAdScore = function(t, e) {
var r = t || this.load(), i = null != e ? e : u;
if ("game" === i) return this.getAdScore(r, "game");
var o = this.readCachedAdScore(r, i);
return null !== o ? o : this.getAdScore(r, i);
};
e.prototype.readCachedHabitScore = function(t, e) {
var r;
return "session" === e ? this._sessionCachedHabitScore : "daily" === e && null !== (r = t.cachedDailyHabitScore) && void 0 !== r ? r : null;
};
e.prototype.readCachedSkillScore = function(t, e) {
var r;
return "session" === e ? this._sessionCachedSkillScore : "daily" === e && null !== (r = t.cachedDailySkillScore) && void 0 !== r ? r : null;
};
e.prototype.readCachedAdScore = function(t, e) {
var r;
return "session" === e ? this._sessionCachedAdScore : "daily" === e && null !== (r = t.cachedDailyAdScore) && void 0 !== r ? r : null;
};
e.prototype.maturityThreshold = function(t) {
var e, r, i = t ? this._effectiveLowMaturity : this._effectiveHighMaturity, o = Math.max(0, hs.getDiffDays(hs.gameInfo.firstEntryTime, Date.now()));
try {
for (var a = l(i), s = a.next(); !s.done; s = a.next()) {
var n = s.value;
if (Array.isArray(n) && 3 === n.length && o >= n[0] && o <= n[1]) return n[2];
if (Array.isArray(n) && 2 === n.length && o >= n[0]) return n[1];
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (r = a.return) && r.call(a);
} finally {
if (e) throw e.error;
}
}
return 65;
};
e.prototype.isLowMaturity = function(t, e) {
void 0 === t && (t = u);
void 0 === e && (e = h);
return this.emitMaturity(t, e, y) < this.maturityThreshold(!0);
};
e.prototype.isHighMaturity = function(t, e) {
void 0 === t && (t = u);
void 0 === e && (e = y);
return this.emitMaturity(t, h, e) >= this.maturityThreshold(!1);
};
e.prototype.reportMaturityDot = function(t, e, i, o) {
var a, s, n;
n = "game" === this.type ? 1 : "daily" === this.type ? 2 : 3;
var l = function(t) {
return Math.round(10 * t) / 10;
}, c = {
total_score: l(t),
habit_score: l(e),
skill_score: l(i),
ad_score: l(o),
trigger_timing: n,
game_id: String(null !== (s = null === (a = hs.gameInfo) || void 0 === a ? void 0 : a.gameNum) && void 0 !== s ? s : 0)
};
DS(r.MATURITY_DOT_EVENT, c);
};
e.prototype.isMaturityMatch = function(t, e, r, i) {
var o, a, s = !1;
try {
for (var n = l(t), c = n.next(); !c.done; c = n.next()) {
var u = c.value;
s || (s = this._isMaturityMatch(u, e, r, i));
}
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (a = n.return) && a.call(n);
} finally {
if (o) throw o.error;
}
}
return s;
};
e.prototype._isMaturityMatch = function(t, e, r) {
var i = e;
switch (t) {
case o.Low:
return this.isLowMaturity(i, r);

case o.High:
return this.isHighMaturity(i, r);

case o.LowNot:
return !this.isLowMaturity(i, r);

case o.HighNot:
return !this.isHighMaturity(i, r);

case o.FirstHigh:
if (this.hasHighMaturityGet) return !0;
if (this.isHighMaturity(i, r)) {
this.hasHighMaturityGet = !0;
return !0;
}
}
return !1;
};
Object.defineProperty(e.prototype, "hasHighMaturityGet", {
get: function() {
return hs.storage.getItem("ZX205_MaturityDevelopmentV2HasHighMaturityGet", !1);
},
set: function(t) {
hs.storage.setItem("ZX205_MaturityDevelopmentV2HasHighMaturityGet", t);
},
enumerable: !1,
configurable: !0
});
e.prototype.getActiveDaysLast7 = function() {
return this.countLoginDaysLast7ExcludeToday(this.load());
};
var r;
e.STORAGE_KEY = "maturityDevelopmentTrait_v2";
e.MATURITY_DOT_EVENT = "g_game_user_maturity_requestresult";
return r = n([ classId("MaturityDevelopmentV2Trait"), classMethodWatch() ], e);
}(Trait);
r.MaturityDevelopmentV2Trait = d;
cc._RF.pop();
}, {} ]
}, {}, [ "MaturityDevelopmentV2Trait" ]);
//# sourceMappingURL=index.js.map
