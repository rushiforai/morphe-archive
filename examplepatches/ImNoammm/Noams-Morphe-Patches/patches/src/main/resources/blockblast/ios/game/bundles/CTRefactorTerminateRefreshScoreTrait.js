window.__require = function t(e, r, o) {
function a(s, i) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!i && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var l = r[s] = {
exports: {}
};
e[s][0].call(l.exports, function(t) {
return a(e[s][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) a(o[s]);
return a;
}({
CTRefactorTerminateRefreshScoreTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "dc78bF3ophBeLfQgefmJ9v2", "CTRefactorTerminateRefreshScoreTrait");
var o, a = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__decorate || function(t, e, r, o) {
var a, n = arguments.length, s = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var i = t.length - 1; i >= 0; i--) (a = t[i]) && (s = (n < 3 ? a(s) : n > 3 ? a(e, r, s) : a(e, r)) || s);
return n > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(a, n) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
n(t);
}
}
function i(t) {
try {
c(o.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, i);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, i = this && this.__generator || function(t, e) {
var r, o, a, n, s = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return n = {
next: i(0),
throw: i(1),
return: i(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function i(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (a = 2 & n[0] ? o.return : n[0] ? o.throw || ((a = o.return) && a.call(o), 
0) : o.next) && !(a = a.call(o, n[1])).done) return a;
(o = 0, a) && (n = [ 2 & n[0], a.value ]);
switch (n[0]) {
case 0:
case 1:
a = n;
break;

case 4:
s.label++;
return {
value: n[1],
done: !1
};

case 5:
s.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(a = s.trys, a = a.length > 0 && a[a.length - 1]) && (6 === n[0] || 2 === n[0])) {
s = 0;
continue;
}
if (3 === n[0] && (!a || n[1] > a[0] && n[1] < a[3])) {
s.label = n[1];
break;
}
if (6 === n[0] && s.label < a[1]) {
s.label = a[1];
a = n;
break;
}
if (a && s.label < a[2]) {
s.label = a[2];
s.ops.push(n);
break;
}
a[2] && s.ops.pop();
s.trys.pop();
continue;
}
n = e.call(t, s);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = a = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
}, c = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, a, n = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = n.next()).done; ) s.push(o.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (a) throw a.error;
}
}
return s;
}, u = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(c(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorTerminateRefreshScoreTrait = void 0;
var l = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.usePosTypeConf = {
default: 0,
bottom: 1
};
return e;
}
e.prototype.classCheckCanOut = function() {
var t, e = storage.getItem("classTerminateRefreshScoreData", null);
return !!e && !((t = new p(e, this.props)).length < 4) && t.checkData();
};
e.prototype.chapterCheckCanOut = function() {
var t, e = storage.getItem("chapterTerminateRefreshScoreData", null);
return !!e && !((t = new p(e, this.props)).length < 4) && t.checkData();
};
Object.defineProperty(e.prototype, "usePosTypes", {
get: function() {
var t;
return (null === (t = this.props) || void 0 === t ? void 0 : t.use_pos_type) || this.usePosTypeConf.default;
},
enumerable: !1,
configurable: !0
});
e.prototype.updateAlgorithmType = function(t) {
return t;
};
e.prototype.canExecuteClassTerminatePriority = function(t) {
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
var e = this.getCurrentSource(t);
if (null == e) return !0;
var r = [ hs.ClassAlgorithmSourceType.AlgoGuide, hs.ClassAlgorithmSourceType.AlgoRevive, hs.ClassAlgorithmSourceType.AlgoReviveTrait ];
r.push(hs.ClassAlgorithmSourceType.AlgoFirstRound, hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom);
return !r.includes(e);
};
e.prototype.getCurrentSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
};
e.prototype.isClassGameDataClear_Disk_ProxyResetAlgorithmData = function() {
storage.setItem("classTerminateRefreshScoreData", null);
};
e.prototype.isChapterGameDataClear_Disk_ProxyResetAlgorithm = function() {
storage.setItem("chapterTerminateRefreshScoreData", null);
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
return s(this, void 0, Promise, function() {
var e;
return i(this, function(r) {
switch (r.label) {
case 0:
return [ 4, this.handleTerminateRefreshScoreOnPostComplete(t) ];

case 1:
r.sent();
e = hs.algorithmInfo.blockIdList;
if (!Array.isArray(e) || 3 !== e.length) return [ 2 ];
if (hs.gameInfo.gameMode === hs.GameMode.Chapter) {
this.recordChapterBlockIds(e);
return [ 2 ];
}
this.recordClassBlockIds(e);
return [ 2 ];
}
});
});
};
e.prototype.handleTerminateRefreshScoreOnPostComplete = function() {
return s(this, void 0, Promise, function() {
return i(this, function(t) {
switch (t.label) {
case 0:
return [ 2 ];

case 1:
t.sent();
return [ 2 ];
}
});
});
};
e.prototype.recordClassBlockIds = function(t) {
1 == storage.getItem("classRoundNum", 0) && storage.setItem("classTerminateRefreshScoreDataTimes", 0);
var e, r = storage.getItem("classTerminateRefreshScoreData", null);
(e = new p(r || void 0, this.props)).push(u(t));
storage.setItem("classTerminateRefreshScoreData", e);
};
e.prototype.recordChapterBlockIds = function(t) {
1 == storage.getItem("chapterRoundNum", 0) && storage.setItem("chapterTerminateRefreshScoreDataTimes", 0);
var e, r = storage.getItem("chapterTerminateRefreshScoreData", null);
(e = new p(r || void 0, this.props)).push(u(t));
storage.setItem("chapterTerminateRefreshScoreData", e);
};
e.prototype.classTerminateSuccess = function() {
var t = storage.getItem("classTerminateRefreshScoreDataTimes", 0);
storage.setItem("classTerminateRefreshScoreDataTimes", t + 1);
};
e.prototype.chapterTerminateSuccess = function() {
var t = storage.getItem("chapterTerminateRefreshScoreDataTimes", 0);
storage.setItem("chapterTerminateRefreshScoreDataTimes", t + 1);
};
e.prototype.classTerminateBottomSuccess = function() {
var t = storage.getItem("classTerminateRefreshScoreDataTimes", 0);
storage.setItem("classTerminateRefreshScoreDataTimes", t + 1);
};
e.prototype.chapterTerminateBottomSuccess = function() {
var t = storage.getItem("chapterTerminateRefreshScoreDataTimes", 0);
storage.setItem("chapterTerminateRefreshScoreDataTimes", t + 1);
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
classAlgorithmOperate: function() {
return !(!t.classCheckCanOut() || t.usePosTypes == t.usePosTypeConf.bottom) && {
status: !0,
data: {
algorithmIds: u([ hs.OFFER_TYPE.CLASSTERMINATE_CYCLE ], hs.algorithmStrategyIOSRandomRefactoredInfo.offerNoBitRandomNoDieClass())
}
};
},
chapterAlgorithmOperate: function() {
if (t.chapterCheckCanOut() && t.usePosTypes != t.usePosTypeConf.bottom) {
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == e ? void 0 : e.active) {
e.addAlgorithmNameMapping(hs.OFFER_TYPE.CHAPTERTERMINATE_CYCLE, "CTRefactorTerminateRefreshScoreTrait", null, null, hs.OFFER_TYPE.CHAPTERTERMINATE_CYCLE);
e.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorTerminateRefreshScoreTrait", null, null, hs.OFFER_TYPE.SUI_JI_WU_SI);
}
return {
status: !0,
data: {
algorithmIds: u([ hs.OFFER_TYPE.CHAPTERTERMINATE_CYCLE ], hs.algorithmStrategyIOSRandomRefactoredInfo.offerNoBitRandomNoDieChapter())
}
};
}
return !1;
}
};
};
e.prototype.onPreprocessConditionContext = function(t) {
var e = this, r = storage.getItem("classTerminateRefreshScoreData", null), o = 0, a = !1;
if (r) {
var n = new p(r, this.props);
(o = n.length) >= 4 && (a = n.checkData());
}
var s = hs.gameInfo.gameMode === hs.GameMode.Chapter ? storage.getItem("chapterTerminateRefreshScoreData", null) : null, i = 0, c = !1;
if (s) {
n = new p(s, this.props);
(i = n.length) >= 4 && (c = n.checkData());
}
return buildLazyConditionContext({
isDefaultPosType: function() {
return ASContext(e.usePosTypes === e.usePosTypeConf.default, "use_pos_type为默认模式(非兜底)");
},
canExecuteClassTerminatePriority: function() {
return ASContext(e.canExecuteClassTerminatePriority(t), "无尽模式允许走Priority终止刷分(非首局/引导/复活等)");
},
hasClassData: function() {
return ASContext(!!r, "无尽模式有历史出块数据");
},
classDataEnough: function() {
return ASContext(o >= 4, "无尽模式出块数据足够(>=4轮)");
},
classHasRepeatCycle: function() {
return ASContext(a, "无尽模式检测到重复出块循环");
},
usePosTypes: function() {
return ASContext(e.usePosTypes, "use_pos_type");
},
classTerminateAlgoId: function() {
return ASContext(e.updateAlgorithmType(hs.OFFER_TYPE_BASE.CLASSTERMINATE_CYCLE), "终止刷分循环算法ID（经 updateAlgorithmType 钩子）");
},
hasChapterData: function() {
return ASContext(!!s, "旅行模式有历史出块数据");
},
chapterDataEnough: function() {
return ASContext(i >= 4, "旅行模式出块数据足够(>=4轮)");
},
chapterHasRepeatCycle: function() {
return ASContext(c, "旅行模式检测到重复出块循环");
},
chapterTerminateAlgoId: function() {
return ASContext(e.updateAlgorithmType(hs.OFFER_TYPE_BASE.CHAPTERTERMINATE_CYCLE), "旅行终止刷分循环算法ID（经 updateAlgorithmType 钩子）");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoTrait: [ {
conditions: {
and: [ {
fact: "isDefaultPosType",
operator: "=",
value: !0
}, {
fact: "hasClassData",
operator: "=",
value: !0
}, {
fact: "classDataEnough",
operator: "=",
value: !0
}, {
fact: "classHasRepeatCycle",
operator: "=",
value: !0
} ]
},
event: {
type: "classTerminateSuccess"
},
flow: "classTerminate",
platform: "gp",
gameMode: "class"
} ],
TravelTrait: [ {
conditions: {
and: [ {
fact: "isDefaultPosType",
operator: "=",
value: !0
}, {
fact: "hasChapterData",
operator: "=",
value: !0
}, {
fact: "chapterDataEnough",
operator: "=",
value: !0
}, {
fact: "chapterHasRepeatCycle",
operator: "=",
value: !0
} ]
},
event: {
type: "chapterTerminateSuccess"
},
flow: "chapterTerminate",
platform: "gp"
} ]
},
priority: [ {
conditions: {
and: [ {
fact: "canExecuteClassTerminatePriority",
operator: "=",
value: !0
}, {
fact: "usePosTypes",
operator: "classAlgorithmOperate",
value: !0
} ]
},
event: {
type: "classTerminateSuccess"
},
flow: "classTerminateIOS",
platform: "ios",
gameMode: "class"
}, {
conditions: {
and: [ {
fact: "usePosTypes",
operator: "chapterAlgorithmOperate",
value: !0
} ]
},
event: {
type: "chapterTerminateSuccess"
},
flow: "chapterTerminateIOS",
platform: "ios",
gameMode: "journey"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoTrait: {
classTerminate: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "classTerminateAlgoId"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
},
TravelTrait: {
chapterTerminate: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "chapterTerminateAlgoId"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
},
priority: {
classTerminateIOS: [ {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "unshift",
args: [ {
fact: "operator.classAlgorithmOperate.data.algorithmIds"
} ]
} ],
chapterTerminateIOS: [ {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "unshift",
args: [ {
fact: "operator.chapterAlgorithmOperate.data.algorithmIds"
} ]
} ]
}
};
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(e.canRunAfterOffer(t), "是否可运行 After 后置段");
},
isBottomPosType: function() {
return ASContext(e.usePosTypes === e.usePosTypeConf.bottom, "use_pos_type为兜底模式");
},
classCanOut: function() {
return ASContext(e.classCheckCanOut(), "无尽模式检测到重复出块循环");
},
classTerminateAlgoId: function() {
return ASContext(e.updateAlgorithmType(hs.OFFER_TYPE_BASE.CLASSTERMINATE_CYCLE), "终止刷分循环算法ID（经 updateAlgorithmType 钩子）");
},
chapterCanOut: function() {
return ASContext(e.chapterCheckCanOut(), "旅行模式检测到重复出块循环");
},
chapterTerminateAlgoId: function() {
return ASContext(e.updateAlgorithmType(hs.OFFER_TYPE_BASE.CHAPTERTERMINATE_CYCLE), "旅行终止刷分循环算法ID（经 updateAlgorithmType 钩子）");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "isBottomPosType",
operator: "=",
value: !0
}, {
fact: "classCanOut",
operator: "=",
value: !0
} ]
},
event: {
type: "classTerminateBottomSuccess"
},
flow: "classTerminateBottom",
gameMode: "class"
}, {
conditions: {
and: [ {
fact: "isBottomPosType",
operator: "=",
value: !0
}, {
fact: "chapterCanOut",
operator: "=",
value: !0
} ]
},
event: {
type: "chapterTerminateBottomSuccess"
},
flow: "chapterTerminateBottom",
gameMode: "journey"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
classTerminateBottom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "classTerminateAlgoId"
} ]
} ],
chapterTerminateBottom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "chapterTerminateAlgoId"
} ]
} ]
};
};
e.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
return n([ classId("CTRefactorTerminateRefreshScoreTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorTerminateRefreshScoreTrait = l;
var p = function() {
function t(t, e) {
var r;
this.stack = [];
this.maxSize = 10;
this.consecutiveRoundLimit = 5;
this.props = e;
var o = this.latestRound, a = this.consecutiveRound;
if (t) {
this.stack = null !== (r = t.stack) && void 0 !== r ? r : [];
"number" == typeof o ? this.maxSize = Math.max(10, Math.floor(o)) : "number" == typeof t.maxSize && (this.maxSize = Math.max(10, Math.floor(t.maxSize)));
} else {
this.stack = [];
this.maxSize = Math.max(10, Math.floor(o) || 10);
}
this.consecutiveRoundLimit = Math.max(2, Math.floor("number" == typeof a ? a : 5));
}
Object.defineProperty(t.prototype, "latestRound", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("TerminateRefreshScoreTrait", "latestRound", this.props, 10);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "consecutiveRound", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("TerminateRefreshScoreTrait", "consecutiveRound", this.props, 5);
},
enumerable: !1,
configurable: !0
});
t.prototype.push = function(t) {
this.stack.push(t);
this.stack.length > this.maxSize && this.stack.shift();
};
Object.defineProperty(t.prototype, "length", {
get: function() {
return this.stack.length;
},
enumerable: !1,
configurable: !0
});
t.prototype.checkDataNew = function() {
for (var t = 2; t <= this.consecutiveRoundLimit; t++) {
var e = 2 * t;
if (!(this.stack.length < e)) {
var r = this.getLastN(e), o = c(this.splitArrayEvenly(r), 2), a = o[0], n = o[1];
if (this.checkSame(a, n)) return !0;
}
}
return !1;
};
t.prototype.checkData = function() {
var t = hs.traitConfigSafePropsInfo.getSafePropValueByKey("TerminateRefreshScoreTrait", "latestRound", this.props, null), e = hs.traitConfigSafePropsInfo.getSafePropValueByKey("TerminateRefreshScoreTrait", "consecutiveRound", this.props, null);
if ("number" == typeof t && "number" == typeof e) return this.checkDataNew();
if (this.stack.length >= 4) {
var r = this.getLastN(4), o = c(this.splitArrayEvenly(r), 2), a = o[0], n = o[1];
if (this.checkSame(a, n)) return !0;
}
if (this.stack.length >= 6) {
r = this.getLastN(6);
var s = c(this.splitArrayEvenly(r), 2);
a = s[0], n = s[1];
if (this.checkSame(a, n)) return !0;
}
if (this.stack.length >= 8) {
r = this.getLastN(8);
var i = c(this.splitArrayEvenly(r), 2);
a = i[0], n = i[1];
if (this.checkSame(a, n)) return !0;
}
if (this.stack.length >= 10) {
r = this.getLastN(10);
var u = c(this.splitArrayEvenly(r), 2);
a = u[0], n = u[1];
if (this.checkSame(a, n)) return !0;
}
return !1;
};
t.prototype.splitArrayEvenly = function(t) {
var e = Math.floor(t.length / 2);
return [ t.slice(0, e), t.slice(e) ];
};
t.prototype.checkSame = function(t, e) {
for (var r = 0; r < t.length; r++) {
var o = t[r], a = e[r];
if (!this.areArraysEqual(o, a)) return !1;
}
return !0;
};
t.prototype.areArraysEqual = function(t, e) {
if (t.length !== e.length) return !1;
for (var r = t.slice().sort(function(t, e) {
return t - e;
}), o = e.slice().sort(function(t, e) {
return t - e;
}), a = 0; a < r.length; a++) if (r[a] !== o[a]) return !1;
return !0;
};
t.prototype.getLastN = function(t) {
var e = Math.min(t, this.stack.length);
return this.stack.slice(-e);
};
t.prototype.pop = function() {
return this.stack.pop();
};
t.prototype.peek = function() {
return this.stack[this.stack.length - 1];
};
t.prototype.getAll = function() {
return this.stack;
};
return t;
}();
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTerminateRefreshScoreTrait" ]);
//# sourceMappingURL=index.js.map
