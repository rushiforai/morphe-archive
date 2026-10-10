window.__require = function e(t, r, i) {
function o(s, n) {
if (!r[s]) {
if (!t[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!t[u]) {
var l = "function" == typeof __require && __require;
if (!n && l) return l(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var c = r[s] = {
exports: {}
};
t[s][0].call(c.exports, function(e) {
return o(t[s][1][e] || e);
}, c, c.exports, e, t, r, i);
}
return r[s].exports;
}
for (var a = "function" == typeof __require && __require, s = 0; s < i.length; s++) o(i[s]);
return o;
}({
RestoreDataProviderTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "e5ea6HTdBhH/LIHSlWPCWWx", "RestoreDataProviderTrait");
var i, o = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
i(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), a = this && this.__decorate || function(e, t, r, i) {
var o, a = arguments.length, s = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, i); else for (var n = e.length - 1; n >= 0; n--) (o = e[n]) && (s = (a < 3 ? o(s) : a > 3 ? o(t, r, s) : o(t, r)) || s);
return a > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreDataProviderTrait = void 0;
var s = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._data = null;
t._requesting = !1;
t._isReinstallUser = null;
t.storageKey = "RestoreDataProviderTraitData";
t.gmDistinctIdKey = "RestoreDataProviderTrait_gmDistinctId";
return t;
}
r = t;
Object.defineProperty(t.prototype, "unknownRegionEnabled", {
get: function() {
return hs.storage.getItem("restoreUnknownRegion", -1);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "sensitiveRegion", {
get: function() {
return hs.storage.getItem("restoreEensitiveRegion", -2);
},
enumerable: !1,
configurable: !0
});
t.prototype.onCreate = function() {
this.addGm();
this.judgeReinstallUser();
var e = this.loadData();
e ? this._data = e : this.requestData();
};
t.prototype.addGm = function() {};
t.prototype.judgeReinstallUser = function() {
var e = this.getDistinctId(), t = hs.deviceInfo.deviceId;
cc.sys.isNative;
this._isReinstallUser = !(!e || !t) && e !== t;
};
t.prototype.getDistinctId = function() {
var e, t = hs.storage.getItem(this.gmDistinctIdKey, null);
if (t && "" !== t) return t;
var r = null === (e = hs.deviceInfo.data) || void 0 === e ? void 0 : e.distinct_id;
cc.sys.isNative;
return r;
};
t.prototype.loadData = function() {
return hs.storage.getItem(this.storageKey, null);
};
t.prototype.setData = function(e) {
hs.storage.setItem(this.storageKey, e);
};
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Proxy",
methodName: "onClassGameShow"
} ];
};
t.prototype.onActive = function(e) {
hs.tp.isClassGame_ProxyOnClassGameShow(e);
if (hs.tp.isLaunch_ProxyDelayEnterGameTime(e) && this.props.delay && this.props.delay > 0 && this.isNeedRestore() && !this.isDataReady()) {
e.returnValue = this.props.delay;
e.returnState = !0;
}
};
t.prototype.executeRestore = function() {
var e, t, r, i = TRAIT("RestoreEndlessHighScoreTrait");
(null == i ? void 0 : i.active) && !(null === (e = i.props) || void 0 === e ? void 0 : e.isAlert) && i.executeRestore();
var o = TRAIT("RestoreChapterPeriodsTrait");
(null == o ? void 0 : o.active) && !(null === (t = o.props) || void 0 === t ? void 0 : t.isAlert) && o.executeRestore();
var a = TRAIT("RestoreChapterProgressTrait");
(null == a ? void 0 : a.active) && !(null === (r = a.props) || void 0 === r ? void 0 : r.isAlert) && a.executeRestore();
var s = TRAIT("RestoreChapterCountdownTrait");
(null == s ? void 0 : s.active) && s.executeRestore();
var n = TRAIT("RestoreEndlessGameCountTrait");
(null == n ? void 0 : n.active) && n.executeRestore();
var u = TRAIT("RestoreBlockClickOrderDataTrait");
(null == u ? void 0 : u.active) && u.executeRestore();
var l = TRAIT("RestoreLoginDaysTrait");
(null == l ? void 0 : l.active) && l.executeRestore();
};
t.prototype.getSensitiveRegion = function() {
if (-2 === this.sensitiveRegion) if (hs.NativeSudokuIPAUtils.checkAppFuncSupport("7.0.6")) {
var e = hs.NativePlatformIOS.getSensitiveRegion(), t = 0;
if (e && "object" == typeof e) {
var r = e.data;
if (r && "object" == typeof r) {
var i = r.type, o = "number" == typeof i ? i : Number(i);
1 === o ? t = 1 : 2 === o && (t = 2);
}
} else t = -1;
hs.storage.setItem("restoreEensitiveRegion", t);
} else hs.storage.setItem("restoreEensitiveRegion", -1);
return this.sensitiveRegion;
};
t.prototype.isReinstallUser = function() {
return this._isReinstallUser;
};
t.prototype.isPrivacySensitiveArea = function() {
cc.sys.isNative;
if (-1 === this.getSensitiveRegion()) {
if (-1 == this.unknownRegionEnabled) {
var e = Math.random();
hs.storage.setItem("restoreUnknownRegion", e < .3 ? 0 : 1);
}
return 0 === this.unknownRegionEnabled;
}
return 0 !== this.getSensitiveRegion();
};
t.prototype.isNeedRestore = function() {
return !0 === this.isReinstallUser() && !this.isPrivacySensitiveArea();
};
t.prototype.isDataReady = function() {
return null !== this._data;
};
t.prototype.getRestoreData = function() {
return this._data;
};
t.prototype.isRestored = function(e) {
return void 0 !== hs.storage.getItem(r.FLAGS_KEY, {})[e];
};
t.prototype.isRestoredTrue = function(e) {
return !0 === hs.storage.getItem(r.FLAGS_KEY, {})[e];
};
t.prototype.markRestored = function(e, t) {
var i = hs.storage.getItem(r.FLAGS_KEY, {});
i[e] = t;
hs.storage.setItem(r.FLAGS_KEY, i);
this.tryReportRestoreExecuteResult();
};
t.prototype.tryReportRestoreExecuteResult = function() {
var e;
if (!hs.storage.getItem(r.REPORTED_KEY, !1)) {
var t = hs.traitConfigInfo.traitsClassNameMap, i = r.REPORT_ITEMS.filter(function(e) {
return t[e.traitName];
});
if (0 !== i.length) {
var o = hs.storage.getItem(r.FLAGS_KEY, {});
if (i.every(function(e) {
return void 0 !== o[e.traitName];
})) {
var a = i.filter(function(e) {
return !0 === o[e.traitName];
}).map(function(e) {
return e.dataType;
});
DS("g_game_restore_execute_requestresult", {
result: a.length > 0 ? 1 : 0,
plan_type: !0 === (null === (e = TRAIT("RestoreConfirmPopupTrait")) || void 0 === e ? void 0 : e.active) ? 2 : 1,
data_type: a
});
hs.storage.setItem(r.REPORTED_KEY, !0);
}
}
}
};
t.prototype.reportRestoreDataRequestResult = function(e) {
var t = null !== e && Object.keys(e).length > 0, r = "";
if (null !== e) try {
r = JSON.stringify(e);
} catch (e) {
DS("g_game_restore_data_requestresult", {
has_data: 0,
restore_data: ""
});
return;
}
DS("g_game_restore_data_requestresult", {
has_data: t ? 1 : 0,
restore_data: r
});
};
t.prototype.requestData = function() {
if (!this._requesting && null === this._data) {
var e = this.getDistinctId();
if (this.isNeedRestore()) {
this._requesting = !0;
this.doRequest(e);
}
}
};
t.prototype.doRequest = function(e) {
var t = this, r = this.props.onlineUrl;
if (r) {
var i = r.indexOf("?") >= 0 ? "&" : "?", o = "" + r + i + "distinct_id=" + encodeURIComponent(e);
hs.HReinstallRestore.requestRestoreData(o).then(function(e) {
t._requesting = !1;
var r = t.parseRestoreResponse(e);
if (r && 0 !== Object.keys(r).length) {
t._data = t.preProcessData(r);
t.setData(t._data);
t.onRecvDataSucc();
t.reportRestoreDataRequestResult(r);
} else t.reportRestoreDataRequestResult(null);
}).catch(function() {
t._requesting = !1;
t.reportRestoreDataRequestResult(null);
});
} else {
this._requesting = !1;
this.reportRestoreDataRequestResult(null);
}
};
t.prototype.onRecvDataSucc = function() {};
t.prototype.preProcessData = function(e) {
var t, r;
if (e.chapterNum && e.chapterNum >= 96) {
e.chapterNum = 0;
if (e.chapterPeriodsIndex) {
var i = e.chapterPeriodsIndex + 1;
delete e.lastTravelEndTime;
i > ((null === (r = (t = hs.themeInfo).getEffectiveThemeCount) || void 0 === r ? void 0 : r.call(t)) || hs.themeInfo.getThemeConfig().length || 1) && (i = 1);
e.chapterPeriodsIndex = i;
} else e.chapterPeriodsIndex = 2;
}
return e;
};
t.prototype.parseRestoreResponse = function(e) {
var t;
try {
var r = "string" == typeof e ? JSON.parse(e) : e;
if (!r || "object" != typeof r) return null;
var i = r;
if (0 !== i.code) return null;
var o = null === (t = i.data) || void 0 === t ? void 0 : t.fields;
if (!o || "object" != typeof o) return null;
var a = {}, s = function(e) {
var t = o[e];
if (null != t && "" !== t) {
var r = Number(t);
isNaN(r) || (a[e] = r);
}
}, n = function(e) {
var t = o[e];
if ("string" == typeof t && "" !== t) {
var r = t.split(",").map(function(e) {
return Number(e.trim());
}).filter(function(e) {
return !isNaN(e);
});
r.length > 0 && (a[e] = r);
}
};
s("classHighScore");
s("chapterPeriodsIndex");
s("chapterNum");
s("chapterPeriodsBeginTime");
s("classGameNum");
s("classGameNumNoRefresh");
s("login_days");
s("lastTravelEndTime");
n("showTimes");
n("completeTimes");
(function() {
var e = o.behavior;
if ("string" == typeof e && "" !== e) try {
var t = JSON.parse(e);
Array.isArray(t) && (a.behavior = t);
} catch (e) {}
})();
return a;
} catch (e) {
return null;
}
};
var r;
t.FLAGS_KEY = "restoreExecutedFlags";
t.REPORTED_KEY = "restoreExecuteRequestResultReported";
t.REPORT_ITEMS = [ {
traitName: "RestoreEndlessHighScoreTrait",
dataType: "max_score"
}, {
traitName: "RestoreChapterPeriodsTrait",
dataType: "travel_id"
}, {
traitName: "RestoreChapterProgressTrait",
dataType: "travel_level"
}, {
traitName: "RestoreChapterCountdownTrait",
dataType: "travel_time"
}, {
traitName: "RestoreGMMClusterDataTrait",
dataType: "maitong_user_similarity"
}, {
traitName: "RestoreAdSensitivityDataTrait",
dataType: "maitong_inter_ad_uplift"
}, {
traitName: "RestoreBlockClickOrderDataTrait",
dataType: "block_click_order"
}, {
traitName: "RestoreHardQuestionDataTrait",
dataType: "hard_question"
}, {
traitName: "RestoreEndlessGameCountTrait",
dataType: "game_num"
}, {
traitName: "RestoreLoginDaysTrait",
dataType: "login_days"
} ];
return r = a([ classId("RestoreDataProviderTrait"), classMethodWatch() ], t);
}(Trait);
r.RestoreDataProviderTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreDataProviderTrait" ]);
//# sourceMappingURL=index.js.map
