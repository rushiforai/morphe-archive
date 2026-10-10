window.__require = function t(e, o, r) {
function a(s, n) {
if (!o[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var f = o[s] = {
exports: {}
};
e[s][0].call(f.exports, function(t) {
return a(e[s][1][t] || t);
}, f, f.exports, t, e, o, r);
}
return o[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < r.length; s++) a(r[s]);
return a;
}({
CTRefactorModelControlDieBoardTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "27acbKepdhFHoq0TtngOlFm", "CTRefactorModelControlDieBoardTrait");
var r, a = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), i = this && this.__decorate || function(t, e, o, r) {
var a, i = arguments.length, s = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, o, r); else for (var n = t.length - 1; n >= 0; n--) (a = t[n]) && (s = (i < 3 ? a(s) : i > 3 ? a(e, o, s) : a(e, o)) || s);
return i > 3 && s && Object.defineProperty(e, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorModelControlDieBoardTrait = void 0;
var s = {
spaceGameNum: 0,
successGameNum: -1,
todayGameNum: 0,
enterRoundNum: 0
}, n = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._reqModeIng = !1;
e._originalPuzzleTimeFirst = null;
return e;
}
e.prototype.onCreate = function() {
this.checkIsTodayAndData();
};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
if ("preprocessing_PuzzleTime" === t) {
this.checkIsTodayAndData();
this.handlePuzzleTimeReset(!0, !1);
}
};
e.prototype.isClassAlgorithmLifeCycle_GameEnd_ProxyOnGameEnd = function() {
this.gameEnd(!1);
};
e.prototype.isClassAlgorithmLifeCycle_Replay_ProxyOnGameReplay = function() {
this.gameEnd(!0);
};
e.prototype.isCTRefactorIsPuzzleTimeTraitFirstPuzzleTimeCall = function() {
var t = TRAIT("CTRefactorIsPuzzleTimeTrait");
(null == t ? void 0 : t.active) && this.enterFirstDiff(t.state.puzzleTimeFirst);
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.handlePuzzleTimeReset(!1, !0);
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
canEnter100Diff: function() {
return ASContext(t.canEnter100Diff(), "是否可以进入100%难题");
},
puzzle100TraitIsActive: function() {
var t, e;
return ASContext(null !== (e = null === (t = TRAIT("CTRefactorPuzzle100Trait")) || void 0 === t ? void 0 : t.active) && void 0 !== e && e, "100%难题是否激活");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
Puzzle100: [ {
conditions: {
and: [ {
fact: "puzzle100TraitIsActive",
operator: "=",
value: !0
}, {
fact: "canEnter100Diff",
operator: "=",
value: !0
} ]
},
event: {
type: "setHard100Status",
args: [ hs.Hard100Status.open ]
},
flow: "openFlow"
}, {
conditions: {
and: [ {
fact: "puzzle100TraitIsActive",
operator: "=",
value: !0
} ]
},
event: {
type: "setHard100Status",
args: [ hs.Hard100Status.default ]
},
flow: "defaultFlow"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
Puzzle100: {
openFlow: [],
defaultFlow: []
}
}
};
};
e.prototype.setHard100Status = function(t) {
var e = TRAIT("CTRefactorPuzzle100Trait");
(null == e ? void 0 : e.active) && e.setState({
hard100Status: t
});
t === hs.Hard100Status.open && this.recordEnter100Round();
};
e.prototype.checkIsTodayAndData = function(t) {
void 0 === t && (t = !1);
var e = this.getLocalData(), o = hs.storage.getItem("classGameNum", 0);
if (this.isToday()) {
if ("number" == typeof e.modeV && -1 != e.modeV) return;
} else {
var r = {
today: Date.now(),
modeV: -1,
firstGameNum: -1,
firstPassTime: 0,
first: Object.assign({}, s),
hundred: Object.assign({}, s)
}, a = Date.now() - this.iosGameStartTime;
t && (r.firstPassTime = a);
r.first.successGameNum = o;
r.firstGameNum = o;
e.hundred.successGameNum = o;
hs.storage.setItem("DieBoardData", r);
}
this.reqMode();
};
e.prototype.getLocalData = function() {
var t = hs.storage.getItem("DieBoardData", null);
if (!t || "object" != typeof t || !(null == t ? void 0 : t.hundred)) {
t = {
today: 0,
modeV: -1,
firstPassTime: 0,
firstGameNum: -1,
first: Object.assign({}, s),
hundred: Object.assign({}, s)
};
hs.storage.setItem("DieBoardData", t);
}
return t;
};
e.prototype.isToday = function() {
var t = this.getLocalData();
return 0 == this.getDaysApart(Date.now(), t.today);
};
e.prototype.getDaysApart = function(t, e) {
var o = new Date(t), r = new Date(e);
o.setHours(0, 0, 0, 0);
r.setHours(0, 0, 0, 0);
return (o.getTime() - r.getTime()) / 864e5;
};
e.prototype.reqMode = function() {
var t = this;
if (!this._reqModeIng) {
this._reqModeIng = !0;
var e = "https://hella-game-gateway-server.afafb.com/v1/get_score?uid=" + hs.traitServerRequestInfo.uid;
hs.HGetScore.get_score(e, {
os: "ios"
}).then(function(e) {
t._reqModeIng = !1;
if (e) {
var o = t.getLocalData();
o.modeV = e.wb_ratio;
o.today = Date.now();
hs.storage.setItem("DieBoardData", o);
}
});
}
};
e.prototype.isEnterCondition100 = function() {
var t = this.getLocalData();
return this.isToday() && t.modeV < .6 && t.modeV >= 0 && hs.classGameInfo.gameNum > t.hundred.successGameNum + t.hundred.spaceGameNum && t.hundred.todayGameNum < 2;
};
e.prototype.canEnter100Diff = function() {
return !!this.isEnterCondition100() && Date.now() - hs.classDataStatisticsTimeInfo.iosGameStartTime > 562e3;
};
e.prototype.recordEnter100Round = function() {
var t = this.getLocalData();
t.hundred.enterRoundNum = hs.classGameInfo.roundNum;
hs.storage.setItem("DieBoardData", t);
};
e.prototype.isConditionFirst = function() {
var t = this.getLocalData();
return this.isToday() && t.modeV < .6 && t.modeV >= 0 && t.firstPassTime < 6e4 && t.firstPassTime > 0 && hs.classGameInfo.gameNum > t.firstGameNum && hs.classGameInfo.gameNum > t.first.successGameNum + t.first.spaceGameNum && t.first.todayGameNum < 2;
};
e.prototype.getFirstDiffTime = function() {
return 180;
};
e.prototype.handlePuzzleTimeReset = function(t, e) {
if (!this.needSkipHandlePuzzleTimeReset()) {
var o = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == o ? void 0 : o.active) {
var r = o.state.puzzleTimeFirst;
!t && this._originalPuzzleTimeFirst || (this._originalPuzzleTimeFirst = r);
this.isConditionFirst() ? o.state.puzzleTimeFirst = this.getFirstDiffTime() : e && this._originalPuzzleTimeFirst && this.resetDiff();
}
}
};
e.prototype.needSkipHandlePuzzleTimeReset = function() {
return !1;
};
e.prototype.resetDiff = function() {
var t = TRAIT("CTRefactorIsPuzzleTimeTrait");
(null == t ? void 0 : t.active) && (t.state.puzzleTimeFirst = this._originalPuzzleTimeFirst);
};
e.prototype.enterFirstDiff = function(t) {
if (this.isConditionFirst() && t == this.getFirstDiffTime()) {
var e = this.getLocalData();
e.first.spaceGameNum = 3;
e.first.todayGameNum++;
e.first.successGameNum = hs.classGameInfo.gameNum;
hs.storage.setItem("DieBoardData", e);
}
};
e.prototype.gameEnd = function(t) {
if (this.isToday()) {
var e = this.getLocalData();
if (!t && this.isEnterCondition100() && e.hundred.enterRoundNum === hs.classGameInfo.roundNum) {
e.hundred.successGameNum = hs.classGameInfo.gameNum;
e.hundred.todayGameNum++;
e.hundred.spaceGameNum = 3;
}
e.hundred.enterRoundNum = 0;
if (e.firstGameNum == hs.classGameInfo.gameNum) {
var o = Date.now() - hs.classDataStatisticsTimeInfo.iosGameStartTime;
e.firstPassTime = o;
}
hs.storage.setItem("DieBoardData", e);
}
this.checkIsTodayAndData(!0);
};
Object.defineProperty(e.prototype, "iosGameStartTime", {
get: function() {
return hs.storage.getItem("iosGameStartTime", 0);
},
enumerable: !1,
configurable: !0
});
return i([ classId("CTRefactorModelControlDieBoardTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorModelControlDieBoardTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorModelControlDieBoardTrait" ]);
//# sourceMappingURL=index.js.map
