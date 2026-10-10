window.__require = function e(r, t, o) {
function a(i, l) {
if (!t[i]) {
if (!r[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!r[u]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var f = t[i] = {
exports: {}
};
r[i][0].call(f.exports, function(e) {
return a(r[i][1][e] || e);
}, f, f.exports, e, r, t, o);
}
return t[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
CTRefactorClearBoardPlusTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "43a95w5U4FOFq07jPNfHnQJ", "CTRefactorClearBoardPlusTrait");
var o, a = this && this.__extends || (o = function(e, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
o(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), n = this && this.__decorate || function(e, r, t, o) {
var a, n = arguments.length, i = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, r, t, o); else for (var l = e.length - 1; l >= 0; l--) (a = e[l]) && (i = (n < 3 ? a(i) : n > 3 ? a(r, t, i) : a(r, t)) || i);
return n > 3 && i && Object.defineProperty(r, t, i), i;
}, i = this && this.__values || function(e) {
var r = "function" == typeof Symbol && Symbol.iterator, t = r && e[r], o = 0;
if (t) return t.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && o >= e.length && (e = void 0);
return {
value: e && e[o++],
done: !e
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, l = this && this.__read || function(e, r) {
var t = "function" == typeof Symbol && e[Symbol.iterator];
if (!t) return e;
var o, a, n = t.call(e), i = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = n.next()).done; ) i.push(o.value);
} catch (e) {
a = {
error: e
};
} finally {
try {
o && !o.done && (t = n.return) && t.call(n);
} finally {
if (a) throw a.error;
}
}
return i;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.CTRefactorClearBoardPlusTrait = void 0;
var u = function(e) {
a(r, e);
function r() {
var r = null !== e && e.apply(this, arguments) || this;
r.changeTime = 0;
r.oneRoundClearBoardNum = 0;
r.oneRandomTime = 0;
return r;
}
r.prototype.data = function() {
return {
clearBoardNum: 0
};
};
r.prototype.isClassGameDataClear_Disk_ProxyResetAlgorithmData = function() {
storage.setItem("classClearBoardNum", 0);
};
r.prototype.isClassDataStatistics_ProxyOnClearScreen = function() {
this.state.clearBoardNum++;
this.oneRoundClearBoardNum++;
storage.setItem("classClearBoardNum", this.state.clearBoardNum);
storage.setItem("clearBoardPlus_triggerData", {
oneRoundClearBoardNum: this.oneRoundClearBoardNum,
oneRandomTime: this.oneRandomTime
});
};
r.prototype.onAlgorithmStrategySessionInit = function() {};
r.prototype.onAlgorithmStrategyRoundInit = function() {
this.state.clearBoardNum = storage.getItem("classClearBoardNum", 0);
};
r.prototype.onAlgorithmStrategyGameNewInit = function(e) {
if ("default" === e) {
this.oneRoundClearBoardNum = 0;
this.oneRandomTime = 0;
storage.setItem("clearBoardPlus_triggerData", {
oneRoundClearBoardNum: this.oneRoundClearBoardNum,
oneRandomTime: this.oneRandomTime
});
}
};
r.prototype.onAlgorithmStrategyGameInit = function(e) {
if ("default" == e) {
var r = storage.getItem("clearBoardPlus_triggerData", {
oneRoundClearBoardNum: 0,
oneRandomTime: 0
});
this.oneRoundClearBoardNum = r.oneRoundClearBoardNum;
this.oneRandomTime = r.oneRandomTime;
} else "preprocessing_OtherTrait" == e && (this.state.clearBoardNum = storage.getItem("classClearBoardNum", 0));
};
Object.defineProperty(r.prototype, "firstAlgoId", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "firstAlgoId", this.props, null);
},
enumerable: !1,
configurable: !0
});
r.prototype.puzzleTimeData = function() {
var e;
return null !== (e = this.state.puzzleTimeOverride) && void 0 !== e ? e : null;
};
r.prototype.getClearScreenTime = function() {
return this.changeTime;
};
r.prototype.getOriginalPuzzleTimeFirst = function() {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
return (null == e ? void 0 : e.active) ? e.state.puzzleTimeFirst : 0;
};
r.prototype.checkTrigger = function() {
var e, r;
if (!this.triggerType) {
this.changeTime = this.getPropTimeSafe();
return !0;
}
var t = hs.classGameInfo.roundNum, o = this.triggerRoundNum;
if (!o) return !1;
var a = !1;
try {
for (var n = i(o), u = n.next(); !u.done; u = n.next()) {
var s = u.value;
if (s) {
var f = l(s, 2), p = f[0], c = f[1];
if (null != p && null != c && t >= p && (.1 === c || t <= c)) {
a = !0;
break;
}
}
}
} catch (r) {
e = {
error: r
};
} finally {
try {
u && !u.done && (r = n.return) && r.call(n);
} finally {
if (e) throw e.error;
}
}
if (!a) return !1;
this.changeTime = this.getChangeTime();
return !!this.changeTime;
};
r.prototype.findTimeInRanges = function(e, r) {
var t, o;
if (!e) return null;
try {
for (var a = i(e), n = a.next(); !n.done; n = a.next()) {
var u = n.value;
if (u) {
var s = l(u, 3), f = s[0], p = s[1], c = s[2];
if (null != f && null != p && null != c && r >= f && (.1 === p || r <= p)) return c;
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
n && !n.done && (o = a.return) && o.call(a);
} finally {
if (t) throw t.error;
}
}
return null;
};
r.prototype.getChangeTime = function() {
switch (this.triggerType) {
case 3:
return this.findTimeInRanges(this.clearSceneNum, this.oneRoundClearBoardNum, "triggerType=3 清屏次数");

case 2:
return this.findTimeInRanges(this.gameNum, hs.classGameInfo.gameNum - hs.classDataStatisticsInfo.todayGameNum + 1, "triggerType=2 当日对局次数");

case 1:
return this.findTimeInRanges(this.scoreAry, hs.classScoreInfo.highScore, "triggerType=1 最高分");

case 4:
if (!this.randomTime) return null;
var e = l(this.randomTime, 2), r = e[0], t = e[1];
if (null == r || null == t) return null;
if (this.oneRandomTime) return this.oneRandomTime;
this.oneRandomTime = Math.floor(Math.random() * (t - r + 1)) + r;
storage.setItem("clearBoardPlus_triggerData", {
oneRoundClearBoardNum: this.oneRoundClearBoardNum,
oneRandomTime: this.oneRandomTime
});
return this.oneRandomTime;

default:
return null;
}
};
Object.defineProperty(r.prototype, "clearSceneNum", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "clearSceneNum", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "randomTime", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "randomTime", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "gameNum", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "gameNum", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "scoreAry", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "scoreAry", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "timeSafe", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "time", this.props, 45);
},
enumerable: !1,
configurable: !0
});
r.prototype.getPropTimeSafe = function() {
return this.timeSafe;
};
Object.defineProperty(r.prototype, "triggerRoundNum", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "triggerRoundNum", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "triggerType", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ClearBoardPlusTrait", "triggerType", this.props, null);
},
enumerable: !1,
configurable: !0
});
r.prototype.getTriggerTime = function() {
return this.props.time;
};
r.prototype.updateIsOfferClear = function(e) {
var r;
return null !== (r = this.state.isOfferClearOverride) && void 0 !== r ? r : e;
};
r.prototype.updateClearScreenTime = function(e) {
var r;
return null !== (r = this.state.clearScreenTimeOverride) && void 0 !== r ? r : e;
};
r.prototype.updateNowTime = function(e) {
var r;
return null !== (r = this.state.nowTimeOverride) && void 0 !== r ? r : e;
};
r.prototype.triggerOfferClear = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == e ? void 0 : e.active) && e.addAlgorithmNameMapping(hs.OFFER_TYPE.CLEAR_BOARD, "CTRefactorClearBoardPlusTrait", null, null, hs.OFFER_TYPE.CLEAR_BOARD);
this.onTriggerOfferClear();
};
r.prototype.computeGPClearBoardTrigger = function() {
if (!this.checkTrigger()) return !1;
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (!(null == e ? void 0 : e.active) || !e.state.isHardFirst) return !1;
var r = this.getClearScreenTime(), t = this.getOriginalPuzzleTimeFirst();
r = this.updateClearScreenTime(r);
var o = (new Date().getTime() - e.state.initTime) / 1e3;
o = this.updateNowTime(o);
var a = t - r, n = e.state.puzzleTimeFirst;
return o >= a && o < n;
};
r.prototype.computeIOSClearBoardTrigger = function() {
var e = this.puzzleTimeData();
if (!e) return !1;
if (e.isHardFirst) {
var r = (new Date().getTime() - e.initTime) / 1e3, t = (r = this.updateNowTimeIos(r)) >= e.puzzleTimeFirst - this.getTriggerTime() && r < e.puzzleTimeFirst;
return this.updateIsOfferClear(t);
}
return !1;
};
r.prototype.onPreprocessConditionOperators = function() {
var e = this;
return {
iosClearBoardFallbackList: function(r) {
return !!r && {
status: !0,
data: {
fallbackIds: e.setAlgorithmFailList(hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit())
}
};
}
};
};
r.prototype.setAlgorithmFailList = function(e) {
return e;
};
r.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isPuzzleNoneSource: function() {
return ASContext(hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.PuzzleNone, "一级出题源是否为 PuzzleNone（对齐老非 PuzzleNone 则打断）");
},
isGPClearBoardTrigger: function() {
return ASContext(!1, "GP清屏plus是否触发");
},
isIOSClearBoardTrigger: function() {
var r;
r = e.computeIOSClearBoardTrigger();
return ASContext(r, "iOS清屏plus是否触发");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
mutex: {
BeforePuzzleTime: [ {
conditions: {
and: [ {
fact: "isPuzzleNoneSource",
operator: "=",
value: !0
}, {
fact: "isGPClearBoardTrigger",
operator: "=",
value: !0
} ]
},
event: {
type: "triggerOfferClear"
},
flow: "gpClear",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "isPuzzleNoneSource",
operator: "=",
value: !0
}, {
fact: "isIOSClearBoardTrigger",
operator: "iosClearBoardFallbackList",
value: !0
} ]
},
event: {
type: "triggerOfferClear"
},
flow: "iosClear",
platform: "ios"
} ]
}
};
};
r.prototype.onPreprocessActions = function() {
return {
mutex: {
BeforePuzzleTime: {
gpClear: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.CLEAR_BOARD ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ [ hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ] ]
} ],
iosClear: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.CLEAR_BOARD ],
dynamicSource: hs.ClassAlgorithmSourceType.BeforePuzzleTime
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.iosClearBoardFallbackList.data.fallbackIds"
} ]
} ]
}
}
};
};
r.prototype.onSDKArgsConditionContext = function(e, r, t) {
return buildLazyConditionContext({
isClearBoard: function() {
return ASContext((null == t ? void 0 : t.algorithmId) === hs.OFFER_TYPE_BASE.CLEAR_BOARD, "是否清屏算法");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isClearBoard",
operator: "=",
value: !0
},
platform: "ios",
flow: "injectSupport3"
} ];
};
r.prototype.onSDKArgsActions = function() {
var e = this;
return {
injectSupport3: function() {
var r, t;
return {
extra: {
traits: {
support3: null !== (t = null === (r = e.props) || void 0 === r ? void 0 : r.support3) && void 0 !== t && t
}
}
};
}
};
};
r.prototype.onTriggerOfferClear = function() {};
r.prototype.updateNowTimeIos = function(e) {
return e;
};
return n([ classId("CTRefactorClearBoardPlusTrait"), classMethodWatch() ], r);
}(Trait);
t.CTRefactorClearBoardPlusTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorClearBoardPlusTrait" ]);
//# sourceMappingURL=index.js.map
