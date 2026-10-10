window.__require = function t(e, i, a) {
function s(o, n) {
if (!i[o]) {
if (!e[o]) {
var u = o.split("/");
u = u[u.length - 1];
if (!e[u]) {
var h = "function" == typeof __require && __require;
if (!n && h) return h(u, !0);
if (r) return r(u, !0);
throw new Error("Cannot find module '" + o + "'");
}
o = u;
}
var l = i[o] = {
exports: {}
};
e[o][0].call(l.exports, function(t) {
return s(e[o][1][t] || t);
}, l, l.exports, t, e, i, a);
}
return i[o].exports;
}
for (var r = "function" == typeof __require && __require, o = 0; o < a.length; o++) s(a[o]);
return s;
}({
$35882_f_ReviveCountFromTimeExBySessionTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "fd379+nMI9KkKYecU2hVrsB", "$35882_f_ReviveCountFromTimeExBySessionTrait");
var a, s = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
a(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), r = this && this.__assign || function() {
return (r = Object.assign || function(t) {
for (var e, i = 1, a = arguments.length; i < a; i++) {
e = arguments[i];
for (var s in e) Object.prototype.hasOwnProperty.call(e, s) && (t[s] = e[s]);
}
return t;
}).apply(this, arguments);
}, o = this && this.__decorate || function(t, e, i, a) {
var s, r = arguments.length, o = r < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, i) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(t, e, i, a); else for (var n = t.length - 1; n >= 0; n--) (s = t[n]) && (o = (r < 3 ? s(o) : r > 3 ? s(e, i, o) : s(e, i)) || o);
return r > 3 && o && Object.defineProperty(e, i, o), o;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.$35882_f_ReviveCountFromTimeExBySessionTrait = void 0;
var n = "ReviveCountFromTimeExBySession_v2", u = function(t) {
s(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isRequseted = !1;
return e;
}
e.prototype.data = function() {
var t, e, i = storage.getItem("$35882_f_ReviveCountFromTimeExBySessionTraitData", {});
i && "object" == typeof i || (i = {});
i.mab_id = (null === (e = null === (t = this.props) || void 0 === t ? void 0 : t.mab_id) || void 0 === e ? void 0 : e.toString()) || "35882";
return i;
};
e.prototype.onEnable = function() {
hs.traitExternalConfigInfo.isActiveSync(n) && (this.state.mab_id = "30759v2");
};
e.prototype.onCreate = function() {
var t = this;
hs.onNativeReponse("onAppKillProcessCallBack", function() {
t.onAppKillProcessCallBack();
});
};
e.prototype.onActive = function(t) {
if (hs.tp.isMABGameLifecycleHandlerTraitOnClassNewGame(t) || hs.tp.isMABGameLifecycleHandlerTraitOnChapterNewGame(t)) {
var e = t.args[0];
this.onNewGame(e);
}
if (hs.tp.isMABGameLifecycleHandlerTraitOnClassGameEnd(t)) {
e = t.args[0];
var i = t.args[1];
this.onGameEnd(e, i);
}
if (hs.tp.isMABGameLifecycleHandlerTraitOnClassReplay(t)) {
e = t.args[0];
this.onClassReplay(e);
}
hs.tp.isClassRevive_ProxyChangeLastReviveResult(t) && (t.args[0] || this.getCanTriggerRevive() && (t.args[0] = !0));
};
e.prototype.onNewGame = function(t) {
this.isRequseted || this.reportData(!1, {});
if (t) {
if (!this.isRequseted) {
this.isRequseted = !0;
var e = this.getContext();
this.loadSeverData(!1, 1, e);
this.resetSessionData();
this.reportExposureData({});
}
if (this.state.isTrigger) {
this.setCanReport(!0);
this.state.isTriggerRevive = !1;
this.saveData();
}
}
};
e.prototype.onGameEnd = function(t, e) {
this.state.lastGameTotalTime = (this.state.lastGameTotalTime || 0) + ((null == e ? void 0 : e.RealTime) || 0);
this.state.lastGameNum = (this.state.lastGameNum || 0) + 1;
if (t) {
this.state.achieveCordTimes || (this.state.achieveCordTimes = []);
this.state.realTimeArr || (this.state.realTimeArr = []);
this.state.achieveCordTimes.push(hs.classScoreInfo.recordHigh);
this.state.realTimeArr.push((null == e ? void 0 : e.RealTime) || 0);
this.state.achieveCordTimes.length > 5 && this.state.achieveCordTimes.shift();
this.state.realTimeArr.length > 5 && this.state.realTimeArr.shift();
if (this.state.isTrigger) {
this.state.isTrigger = !1;
this.saveData();
} else {
this.state.isTrigger = !0;
this.saveData();
}
} else this.saveData();
};
e.prototype.onClassReplay = function(t) {
if (t) if (this.state.isTrigger) {
this.state.isTrigger = !1;
this.saveData();
} else {
this.state.isTrigger = !0;
this.saveData();
}
};
e.prototype.resetSessionData = function() {
this.state.isExposuretReport = !1;
this.state.lastGameNum = 0;
this.state.lastGameTotalTime = 0;
this.state.lastSessionIncome = 0;
void 0 === this.state.isTrigger && (this.state.isTrigger = !0);
this.saveData();
};
e.prototype.onAppKillProcessCallBack = function() {
var t, e, i, a, s = hs.NativePlatformIOS.getColdSessionAdRevenue();
try {
if (s) {
var r = JSON.parse(s);
if (r) {
var o = null !== (e = null === (t = null == r ? void 0 : r.revenue) || void 0 === t ? void 0 : t.insert) && void 0 !== e ? e : 0, n = null !== (a = null === (i = null == r ? void 0 : r.revenue) || void 0 === i ? void 0 : i.reward) && void 0 !== a ? a : 0;
this.state.lastSessionIncome = o + n;
} else this.state.lastSessionIncome = 0;
} else this.state.lastSessionIncome = 0;
} catch (t) {}
this.saveData();
};
e.prototype.updateSessionIncome = function() {
var t, e;
try {
if (!hs.NativeSudokuIPAUtils.checkAppFuncSupport(hs.E_APP_FUNC_VERSION.COLD_START_AD_REVENUE_VERSION)) return;
var i = hs.NativeAppCenterInterface.getColdSessionAdRevenue();
if (i) {
var a = JSON.parse(i);
if (a) {
var s = null !== (t = null == a ? void 0 : a.insert) && void 0 !== t ? t : 0, r = null !== (e = null == a ? void 0 : a.reward) && void 0 !== e ? e : 0;
this.state.lastSessionIncome = s + r;
this.saveData();
}
}
} catch (t) {}
};
e.prototype.setCanReport = function(t) {
this.state.canReport = t;
this.saveData();
};
e.prototype.reportData = function(t, e) {
try {
if (!this.validateReportPreconditions(t)) return;
t ? this.reportExposureData(e) : this.reportResultData(e);
} catch (t) {}
};
e.prototype.reportExposureData = function(t) {
if (this.state.isExposuretReport) ; else {
this.state.endTime = new Date().getTime();
if (hs.traitExternalConfigInfo.isActiveSync(n)) {
this.state.gameId = null;
this.state.gameType = null;
}
var e = this.getGameId(t), i = this.getGameType(t), a = this.buildBaseReportData(e, 1, i);
this.state.isExposuretReport = !0;
this.state.gameId = e;
this.state.gameType = i;
var s = this.buildExposureReportData(a, t);
this.saveData();
this.sendReportData(s);
}
};
e.prototype.reportResultData = function(t) {
var e = this.getGameId(t), i = this.getGameType(t), a = this.buildBaseReportData(e, 2, i), s = this.buildResultReportData(a, t);
this.sendReportData(s);
this.state.canReport = !1;
this.state.gameType = null;
this.saveData();
};
e.prototype.buildBaseReportData = function(t, e, i) {
return {
mab_id: this.state.mab_id,
arm_id: this.state.armId,
game_id: t,
game_type: i,
report_type: e
};
};
e.prototype.buildExposureReportData = function(t) {
return r({}, t);
};
e.prototype.buildResultReportData = function(t) {
var e = r({}, t);
e.result = this.state.lastGameNum || 0;
e.result2 = this.state.lastGameTotalTime || 0;
e.result3 = this.state.lastSessionIncome;
this.addCustomResultData(e);
return e;
};
e.prototype.addCustomResultData = function(t) {
t.context = JSON.stringify(this.getContext());
};
e.prototype.sendReportData = function(t) {
DS("game_classic_multi_armed_bandit_v2_success", t);
};
e.prototype.validateReportPreconditions = function(t) {
var e;
return !!this.state.mab_id && (!!(t || (null === (e = this.state) || void 0 === e ? void 0 : e.isExposuretReport)) && !!this.checkCanReport());
};
e.prototype.checkCanReport = function() {
return !!this.state.canReport;
};
e.prototype.checkIsTrigger = function() {
return !(!this.state || !this.state.armId || "0" === this.state.armId);
};
e.prototype.getGameId = function(t) {
return void 0 === this.state.gameId || null === this.state.gameId ? (null == t ? void 0 : t.gameId) || hs.gameInfo.gameNum : this.state.gameId;
};
e.prototype.getGameType = function() {
return void 0 === this.state.gameType || null === this.state.gameType ? hs.gameInfo.gameType === hs.GameType.Class ? 0 : 2 : this.state.gameType;
};
e.prototype.loadSeverData = function(t, e, i) {
var a, s, o, n = this;
void 0 === t && (t = !1);
void 0 === e && (e = 3);
void 0 === i && (i = null);
var u, h = (null === (s = null === (a = hs.deviceInfo) || void 0 === a ? void 0 : a.data) || void 0 === s ? void 0 : s.distinct_id) || "0003C628-2BD8-46C3-8B58-DE117C897D1E";
u = "https://hella-game-gateway-server.afafb.com/v1/multi_armed_bandit?uid=" + h;
"ios";
var l = (null === (o = this.state) || void 0 === o ? void 0 : o.requsetTimes) || 1, p = i || this.state.context;
hs.http.requestAsync(u, r({
uid: h,
os: "ios",
exp_id: this.state.mab_id,
is_initial: !(l > e)
}, p), {
type: hs.HttpType.POST
}).then(function(e) {
try {
var i = "string" == typeof e ? JSON.parse(e) : e;
t ? n.state.nextGameArmId = (null == i ? void 0 : i.arm_id) || "0" : n.state.armId = (null == i ? void 0 : i.arm_id) || "0";
n.state.requsetTimes = l + 1;
n.saveData();
} catch (t) {}
}).catch(function() {});
};
e.prototype.getContext = function() {
var t = {};
this.addCountryData(t);
this.addLifeReportData(t);
this.addHisMaxScoreData(t);
this.addGameRealTimeData(t);
this.addAchieveCordTimesData(t);
return t;
};
e.prototype.addCountryData = function(t) {
var e, i = null === (e = hs.deviceInfo.data) || void 0 === e ? void 0 : e.country;
t.feature_country_usa = "US" === i ? 1 : 0;
t.feature_country_idn = "ID" === i ? 1 : 0;
t.feature_country_gbr = "GB" === i ? 1 : 0;
t.feature_country_jpn = "JP" === i ? 1 : 0;
t.feature_country_deu = "DE" === i ? 1 : 0;
t.feature_country_rus = "RU" === i ? 1 : 0;
};
e.prototype.addLifeReportData = function(t) {
var e = this.getLifeTime();
t.feature_retention_days_14 = e < 15 ? 1 : 0;
t.feature_retention_days_30 = e >= 15 && e < 31 ? 1 : 0;
t.feature_retention_days_90 = e >= 31 && e < 91 ? 1 : 0;
t.feature_retention_days_180 = e >= 91 && e <= 180 ? 1 : 0;
};
e.prototype.getLifeTime = function() {
var t = new Date().getTime(), e = hs.gameInfo.installTime;
return Math.ceil((t - e) / 864e5);
};
e.prototype.addHisMaxScoreData = function(t) {
var e = hs.classScoreInfo.highScore;
t.feature_his_max_score_2w = e <= 2e4 ? 1 : 0;
t.feature_his_max_score_5w = e > 2e4 && e <= 5e4 ? 1 : 0;
t.feature_his_max_score_10w = e > 5e4 && e <= 1e5 ? 1 : 0;
};
e.prototype.addGameRealTimeData = function(t) {
if (this.state.realTimeArr && 0 !== this.state.realTimeArr.length) {
var e = this.state.realTimeArr.reduce(function(t, e) {
return t + e;
}, 0) / this.state.realTimeArr.length;
t.feature_last_time_180 = e >= 0 && e < 150 ? 1 : 0;
t.feature_last_time_210 = e >= 150 && e < 210 ? 1 : 0;
t.feature_last_time_270 = e >= 210 && e < 270 ? 1 : 0;
t.feature_last_time_330 = e >= 270 && e < 330 ? 1 : 0;
} else {
t.feature_last_time_180 = 0;
t.feature_last_time_210 = 0;
t.feature_last_time_270 = 0;
t.feature_last_time_330 = 0;
}
};
e.prototype.addAchieveCordTimesData = function(t) {
if (this.state.achieveCordTimes) {
var e = this.state.achieveCordTimes.filter(Boolean).length;
t.feature_break_his_score_0 = 0 === e ? 1 : 0;
t.feature_break_his_score_1 = 1 === e ? 1 : 0;
t.feature_break_his_score_2 = e >= 2 && e <= 3 ? 1 : 0;
} else {
t.feature_break_his_score_0 = 0;
t.feature_break_his_score_1 = 0;
t.feature_break_his_score_2 = 0;
}
};
e.prototype.getRealTime = function() {
var t = 0, e = hs.classTimerInfo.spendTime;
e && (t = Number(e) / 1e3 >> 0);
return t;
};
e.prototype.getRequiredSecondsForArm = function(t) {
var e;
return null !== (e = {
1: 60,
2: 120,
3: 180,
4: 240,
5: 300,
6: 360,
7: 420,
8: 480
}[t]) && void 0 !== e ? e : Infinity;
};
e.prototype.getCanTriggerRevive = function() {
if (!this.state.isTrigger) return !1;
if (!this.checkIsTrigger()) return !1;
if (this.state.isTriggerRevive) return !1;
if (this.state.armId) {
var t = this.getRealTime(), e = this.getRequiredSecondsForArm(this.state.armId);
if (Infinity === e) return !1;
if (t >= e) {
this.state.isTriggerRevive = !0;
this.saveData();
return !0;
}
return !1;
}
return !1;
};
e.prototype.saveData = function() {
storage.setItem("$35882_f_ReviveCountFromTimeExBySessionTraitData", this.state);
};
return o([ classId("$35882_f_ReviveCountFromTimeExBySessionTrait") ], e);
}(Trait);
i.$35882_f_ReviveCountFromTimeExBySessionTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "$35882_f_ReviveCountFromTimeExBySessionTrait" ]);
//# sourceMappingURL=index.js.map
