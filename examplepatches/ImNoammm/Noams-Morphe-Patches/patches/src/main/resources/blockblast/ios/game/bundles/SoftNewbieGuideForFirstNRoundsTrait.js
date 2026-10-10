window.__require = function t(e, o, r) {
function s(a, n) {
if (!o[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!n && l) return l(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var d = o[a] = {
exports: {}
};
e[a][0].call(d.exports, function(t) {
return s(e[a][1][t] || t);
}, d, d.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) s(r[a]);
return s;
}({
SoftNewbieGuideForFirstNRoundsTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "ccaddzicmZEQrGeXTMIb4FK", "SoftNewbieGuideForFirstNRoundsTrait");
var r, s = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__assign || function() {
return (i = Object.assign || function(t) {
for (var e, o = 1, r = arguments.length; o < r; o++) {
e = arguments[o];
for (var s in e) Object.prototype.hasOwnProperty.call(e, s) && (t[s] = e[s]);
}
return t;
}).apply(this, arguments);
}, a = this && this.__decorate || function(t, e, o, r) {
var s, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var n = t.length - 1; n >= 0; n--) (s = t[n]) && (a = (i < 3 ? s(a) : i > 3 ? s(e, o, a) : s(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
}, n = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, s, i = o.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
s = {
error: t
};
} finally {
try {
r && !r.done && (o = i.return) && o.call(i);
} finally {
if (s) throw s.error;
}
}
return a;
}, u = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(n(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.SoftNewbieGuideForFirstNRoundsTrait = void 0;
var l = "softNewbieGuideForFirstNRoundsData", d = 3, h = 0, c = [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ 1, 1, 1, 1, 1, 1, 1, -1 ], [ 1, 1, 1, 1, 1, 1, 1, -1 ], [ 1, 1, 1, 1, 1, 1, 1, -1 ], [ 1, 1, 1, 1, 1, 1, 1, -1 ], [ -1, 1, 1, 1, 1, 1, 1, 1 ], [ -1, 1, 1, 1, 1, 1, 1, 1 ], [ -1, -1, -1, 1, 1, 1, 1, 1 ] ], p = [ 23, 7, 17 ], g = [ 2, 3, 4, 5, 7, 9, 11, 17, 22, 35, 36 ], m = function(t) {
s(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.DEFAULT_STORAGE_DATA = {
consumedRoundCount: 0,
activeGameNum: -1,
activeRoundNum: -1,
activeRoundCounted: !1,
completed: !1,
initialBoardApplied: !1,
n: d,
plan: h
};
return e;
}
e.prototype.onActive = function(t) {
hs.tp.isClassGame_ProxyOnGameStart(t) && this.skipNewUserGuide();
hs.tp.isClassAlgorithmLifeCycle_GameStart_ProxyNewGameInit(t) && this.onNewGameInit();
hs.tp.isFirstEightGamesFixedBoardTraitShouldUseFixedBoard(t) && this.onFirstEightGamesFixedBoardShouldUseFixedBoard(t);
hs.tp.isFirstEightGamesFixedBoardTraitSetFristProducerBlocks(t) && this.onFirstEightGamesFixedBoardSetFirstProducerBlocks(t);
hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoard(t) && this.onProduceDefaultBoard(t);
hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoardFinal(t) && this.onProduceDefaultBoard(t);
hs.tp.isClassBlocksProducer_ProxyRequestBlocksProducer(t) && this.onRequestBlocksProducer(t);
hs.tp.isClassBlocksProducer_BlocksProducerValidate_ProxyOnBoardSplashAnimationEnd(t) && this.onBoardSplashAnimationEnd();
hs.tp.isClassAlgorithmStrategy_Condition_ProxyOnAlgorithmStrategyCondition(t) && this.onAlgorithmStrategyCondition(t);
hs.tp.isAlgorithmProcessInfoHandleArgs(t) && this.onAlgorithmHandleArgs(t);
hs.tp.isAlgorithmBottomInfoModifyFinalBlock(t) && this.onModifyFinalBlock();
hs.tp.isClassBlocksProducer_ProxyOnGenerateEnd(t) && this.onGenerateEnd();
hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(t) && this.onGameEnd();
};
e.prototype.skipNewUserGuide = function() {
if (this.isClassMode() && !hs.classGuideInfo.isFinishedGuide) {
this.sendGuideDots();
hs.storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classScore", 0);
hs.storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
hs.EventManager.dispatchModuleEvent(new hs.E_ClassGuide_Change());
hs.EventManager.dispatchModuleEvent(new hs.E_Activity_ClassGuide_Change());
var t = this.ensureData();
this.shouldUsePlan0FirstRoundBoard(t) ? this.applyPlan0FirstRoundBoard("skipNewUserGuide") : this.shouldUseEmptyFirstRoundBoard(t) && this.applyEmptyFirstRoundBoard("skipNewUserGuide");
this.debugLog("已去掉首轮新手引导，直接进入软引导流程", this.getDebugState(t));
}
};
e.prototype.sendGuideDots = function() {
var t = this;
hs.classGuideInfo.steps.forEach(function(e, o) {
t.sendDot(e.dotStart, "guide_" + (o + 1) + "_start");
t.sendDot(e.dotEnd, "guide_" + (o + 1) + "_end");
});
};
e.prototype.sendDot = function(t, e) {
if (t) try {
DS(t);
this.debugLog("上报新手引导埋点 " + e + ": " + t);
} catch (t) {}
};
e.prototype.onNewGameInit = function() {
this.ensureData();
};
e.prototype.onFirstEightGamesFixedBoardShouldUseFixedBoard = function(t) {
if (this.shouldDisableFirstEightGamesFixedBoard()) {
t.returnValue = !1;
t.returnState = !0;
this.debugLog("保护未结束，禁用前8局固定盘面特性", this.getDebugState());
}
};
e.prototype.onFirstEightGamesFixedBoardSetFirstProducerBlocks = function(t) {
if (this.shouldDisableFirstEightGamesFixedBlocks()) {
t.returnState = !0;
t.replace = !0;
this.debugLog("保护未结束，阻止前8局固定首轮出块写入", this.getDebugState());
}
};
e.prototype.onProduceDefaultBoard = function(t) {
if (this.isClassMode()) {
var e = this.ensureData();
if (this.shouldProtect(e) && !e.initialBoardApplied) if (this.shouldUsePlan0FirstRoundBoard(e)) {
t.args[0] = this.applyPlan0FirstRoundBoard(t.methodName);
t.returnState = !0;
if (hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoardFinal(t)) {
e.initialBoardApplied = !0;
this.saveData(e);
}
this.debugLog("plan0 首轮覆盖为固定盘面", i(i({}, this.getDebugState(e)), {
methodName: t.methodName,
board: t.args[0]
}));
} else if (1 === e.plan || 2 === e.plan) {
t.args[0] = this.applyEmptyFirstRoundBoard(t.methodName);
t.returnState = !0;
if (hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoardFinal(t)) {
e.initialBoardApplied = !0;
this.saveData(e);
}
this.debugLog("plan1/2 首次保护流程覆盖为空盘面", this.getDebugState(e));
}
}
};
e.prototype.onRequestBlocksProducer = function(t) {
var e = this.ensureActiveRoundToken();
if (this.shouldProtect(e)) {
var o = t.args[0];
if ((null == o ? void 0 : o.strategyState) === hs.ALGO_STRATEGY_TYPE.GUIDE) {
o.strategyState = hs.ALGO_STRATEGY_TYPE.DEFAULT;
o.needAlgorithmStrategyRequest = !0;
this.debugLog("保护轮出题从 GUIDE 切换为 DEFAULT", this.getDebugState(e));
}
}
};
e.prototype.onBoardSplashAnimationEnd = function() {
var t = this.ensureActiveRoundToken();
if (this.shouldUsePlan0FirstRoundBlocks(t)) {
hs.storage.setItem("classProducerBlocks", u(p));
this.debugLog("plan0 首轮写入固定出块", i(i({}, this.getDebugState(t)), {
producerBlocks: p
}));
}
};
e.prototype.onAlgorithmStrategyCondition = function() {
var t = this.ensureActiveRoundToken();
this.shouldProtect(t) && this.debugLog("保护轮保留底板算法，仅筛选出块池", this.getDebugState(t));
};
e.prototype.onAlgorithmHandleArgs = function(t) {
var e = this.ensureActiveRoundToken();
if (this.shouldProtect(e)) {
var o = t.args[1];
if (t.args[2] !== hs.algorithmSource.FAIL) {
this.prependAlgorithmToFailList(o);
var r = t.args[0], s = this.getAllowedBlockIds(e), a = this.getBlockedBlockIds(s);
this.applyAllowedBlockPool(r, s, a);
this.debugLog("保护轮注入出块池筛选", i(i({}, this.getDebugState(e)), {
algorithm: o,
allowedBlockIds: s,
blockedBlockIds: a,
failList: hs.algorithmStrategyInfo.algorithmFailList
}));
} else this.debugLog("保护轮降级策略跳过块池筛选", this.getDebugState(e));
}
};
e.prototype.onGenerateEnd = function() {
this.consumeActiveRound("onGenerateEnd");
};
e.prototype.onModifyFinalBlock = function() {
var t = this.ensureActiveRoundToken();
if (this.shouldProtect(t)) {
var e = hs.algorithmInfo.blockIdList;
if (Array.isArray(e) && 3 === e.length) {
var o = this.getAllowedBlockIds(t), r = new Set(o);
if (e.some(function(t) {
return !r.has(t);
})) {
var s = hs.algorithmName.algoActualId, a = hs.algorithmName.algoActualIdByPos, n = u(hs.algorithmName.algoActualName), l = u(hs.algorithmName.algoActualChangeName);
if (hs.algorithmProcessInfo.algorithmSdkCall(hs.OFFER_TYPE.SUI_JI, hs.algorithmSource.CUSTOMIZE)) {
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
this.debugLog("兜底重新出题替换非允许池块", i(i({}, this.getDebugState(t)), {
original: e,
replaced: hs.algorithmInfo.blockIdList,
allowedBlockIds: o
}));
} else {
hs.algorithmName.setAlgoActualId(s);
hs.algorithmName.setAlgoActualIdByPos(a);
hs.algorithmName.setAlgoActualName(n);
hs.algorithmName.setAlgoActualChangeName(l);
this.debugLog("兜底重新出题失败，保留原出块", i(i({}, this.getDebugState(t)), {
original: e,
allowedBlockIds: o
}));
}
}
} else this.debugLog("兜底跳过：当前出块数量不为3", i(i({}, this.getDebugState(t)), {
blockIdList: e
}));
}
};
e.prototype.onGameEnd = function() {
this.consumeActiveRound("onGameEnd");
};
e.prototype.ensureData = function() {
if (!this.isClassMode()) return this.getData();
var t = this.getData();
t.n = this.roundCount;
t.plan = this.plan;
t.completed = t.consumedRoundCount >= t.n;
this.saveData(t);
return t;
};
e.prototype.ensureActiveRoundToken = function() {
var t = this.ensureData();
if (!this.shouldProtect(t)) return t;
if (t.activeGameNum === hs.classGameInfo.gameNum && t.activeRoundNum === hs.classGameInfo.roundNum) return t;
t.activeGameNum = hs.classGameInfo.gameNum;
t.activeRoundNum = hs.classGameInfo.roundNum;
t.activeRoundCounted = !1;
this.saveData(t);
this.debugLog("创建保护轮 token", this.getDebugState(t));
return t;
};
e.prototype.consumeActiveRound = function(t) {
var e = this.ensureData();
if (this.shouldProtect(e) && !e.activeRoundCounted && e.activeGameNum === hs.classGameInfo.gameNum && e.activeRoundNum === hs.classGameInfo.roundNum) {
e.consumedRoundCount += 1;
e.activeRoundCounted = !0;
e.completed = e.consumedRoundCount >= e.n;
this.saveData(e);
this.debugLog("消费一轮软新手保护", i(i({}, this.getDebugState(e)), {
reason: t
}));
}
};
e.prototype.shouldProtect = function(t) {
void 0 === t && (t = this.getData());
return !(!this.isClassMode() || t.completed) && t.consumedRoundCount < t.n;
};
e.prototype.isClassMode = function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
};
e.prototype.shouldDisableFirstEightGamesFixedBoard = function() {
var t = this.ensureData();
return this.shouldProtect(t);
};
e.prototype.shouldDisableFirstEightGamesFixedBlocks = function() {
var t = this.ensureData();
return this.shouldProtect(t);
};
e.prototype.shouldUsePlan0FirstRoundBoard = function(t) {
return t.plan === h && 0 === t.consumedRoundCount;
};
e.prototype.applyPlan0FirstRoundBoard = function(t) {
var e = this.getPlan0FirstRoundBoard();
hs.storage.setItem("classFaceBlocks", e);
hs.storage.setItem("classInitialFaceBlocks", e);
this.debugLog("plan0 首轮写入固定盘面", i(i({}, this.getDebugState()), {
reason: t,
board: e
}));
return e;
};
e.prototype.getPlan0FirstRoundBoard = function() {
return c.map(function(t) {
return u(t);
});
};
e.prototype.shouldUseEmptyFirstRoundBoard = function(t) {
return (1 === t.plan || 2 === t.plan) && 0 === t.consumedRoundCount;
};
e.prototype.applyEmptyFirstRoundBoard = function(t) {
var e = hs.boardInfo.NULL;
hs.storage.setItem("classFaceBlocks", e);
hs.storage.setItem("classInitialFaceBlocks", e);
this.debugLog("plan1/2 首轮写入空盘面", i(i({}, this.getDebugState()), {
reason: t,
board: e
}));
return e;
};
e.prototype.shouldUsePlan0FirstRoundBlocks = function(t) {
return this.shouldUsePlan0FirstRoundBoard(t) && 0 === t.activeRoundNum;
};
e.prototype.getAllowedBlockIds = function(t) {
return this.shouldUsePlan0FirstRoundBlocks(t) ? u(p) : 2 === t.plan ? this.getSmallOrRegularBlockIds() : u(g);
};
e.prototype.getSmallOrRegularBlockIds = function() {
for (var t = u(g), e = 1; e <= 42; e++) hs.BinaryClip.countBlockCells(e) <= 3 && !t.includes(e) && t.push(e);
return t;
};
e.prototype.getBlockedBlockIds = function(t) {
for (var e = new Set(t), o = [], r = 1; r <= 42; r++) e.has(r) || o.push(r);
return o;
};
e.prototype.applyAllowedBlockPool = function(t, e, o) {
(!Array.isArray(t.blocksGroup) || t.blocksGroup.length < 2) && (t.blocksGroup = [ [], [] ]);
t.blocksGroup[0] = u(e);
t.blocksGroup[1] = u(e);
t.addBlocks = Array.isArray(t.addBlocks) ? t.addBlocks.filter(function(t) {
return e.includes(t);
}) : [];
t.filterBlocks = this.mergeUniqueBlockIds(Array.isArray(t.filterBlocks) ? t.filterBlocks : [], o);
t.filterWeightBlocks = this.mergeUniqueBlockIds(Array.isArray(t.filterWeightBlocks) ? t.filterWeightBlocks : [], o);
t.extra || (t.extra = {});
t.extra.feature || (t.extra.feature = {});
t.extra.jsonData || (t.extra.jsonData = {});
t.extra.feature.override = u(e);
t.extra.jsonData.softNewbieGuideForFirstNRounds = {
gameNum: hs.classGameInfo.gameNum,
roundNum: hs.classGameInfo.roundNum,
plan: this.plan,
n: this.roundCount,
allowedBlockIds: e
};
};
e.prototype.mergeUniqueBlockIds = function(t, e) {
var o = u(t);
e.forEach(function(t) {
o.includes(t) || o.push(t);
});
return o;
};
e.prototype.prependAlgorithmToFailList = function(t) {
if (Number.isFinite(t) && !(t < 0)) {
var e = Array.isArray(hs.algorithmStrategyInfo.algorithmFailList) ? hs.algorithmStrategyInfo.algorithmFailList : [], o = u([ t ], e.filter(function(e) {
return e !== t;
}));
hs.algorithmStrategyInfo.setAlgorithmFailList(o);
}
};
e.prototype.getData = function() {
var t = hs.storage.getItem(l, this.DEFAULT_STORAGE_DATA);
if ("object" != typeof t || null === t) return i({}, this.DEFAULT_STORAGE_DATA);
var e = this.getValidNonNegativeNumber(t.consumedRoundCount, 0), o = this.getValidPositiveNumber(t.n, this.roundCount), r = this.getValidPlan(t.plan);
return {
consumedRoundCount: e,
activeGameNum: this.getValidNumber(t.activeGameNum, -1),
activeRoundNum: this.getValidNumber(t.activeRoundNum, -1),
activeRoundCounted: !0 === t.activeRoundCounted,
completed: !0 === t.completed || e >= o,
initialBoardApplied: !0 === t.initialBoardApplied,
n: o,
plan: r
};
};
e.prototype.saveData = function(t) {
hs.storage.setItem(l, i({}, t));
};
Object.defineProperty(e.prototype, "roundCount", {
get: function() {
return this.getValidPositiveNumber(this.props.n, d);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "plan", {
get: function() {
return this.getValidPlan(this.props.plan);
},
enumerable: !1,
configurable: !0
});
e.prototype.getValidPositiveNumber = function(t, e) {
var o = Number(t);
return Number.isFinite(o) && o > 0 ? Math.floor(o) : e;
};
e.prototype.getValidNonNegativeNumber = function(t, e) {
var o = Number(t);
return Number.isFinite(o) && o >= 0 ? Math.floor(o) : e;
};
e.prototype.getValidNumber = function(t, e) {
var o = Number(t);
return Number.isFinite(o) ? o : e;
};
e.prototype.getValidPlan = function(t) {
var e = Number(t);
return 1 === e || 2 === e ? e : h;
};
e.prototype.getDebugState = function(t) {
void 0 === t && (t = this.getData());
return {
gameNum: hs.classGameInfo.gameNum,
roundNum: hs.classGameInfo.roundNum,
plan: t.plan,
n: t.n,
consumedRoundCount: t.consumedRoundCount,
activeGameNum: t.activeGameNum,
activeRoundNum: t.activeRoundNum,
activeRoundCounted: t.activeRoundCounted,
completed: t.completed,
initialBoardApplied: t.initialBoardApplied
};
};
e.prototype.debugLog = function() {};
a([ hs.Algorithm() ], e.prototype, "onActive", null);
return a([ classId("SoftNewbieGuideForFirstNRoundsTrait") ], e);
}(Trait);
o.SoftNewbieGuideForFirstNRoundsTrait = m;
cc._RF.pop();
}, {} ]
}, {}, [ "SoftNewbieGuideForFirstNRoundsTrait" ]);
//# sourceMappingURL=index.js.map
