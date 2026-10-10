window.__require = function e(t, o, r) {
function s(i, n) {
if (!o[i]) {
if (!t[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!t[l]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var u = o[i] = {
exports: {}
};
t[i][0].call(u.exports, function(e) {
return s(t[i][1][e] || e);
}, u, u.exports, e, t, o, r);
}
return o[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < r.length; i++) s(r[i]);
return s;
}({
CTRefactorFirstRoundBlockTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "649d4mnfF1El7ivxl33TblO", "CTRefactorFirstRoundBlockTrait");
var r, s, a = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
r(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__decorate || function(e, t, o, r) {
var s, a = arguments.length, i = a < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, o, r); else for (var n = e.length - 1; n >= 0; n--) (s = e[n]) && (i = (a < 3 ? s(i) : a > 3 ? s(t, o, i) : s(t, o)) || i);
return a > 3 && i && Object.defineProperty(t, o, i), i;
}, n = this && this.__read || function(e, t) {
var o = "function" == typeof Symbol && e[Symbol.iterator];
if (!o) return e;
var r, s, a = o.call(e), i = [];
try {
for (;(void 0 === t || t-- > 0) && !(r = a.next()).done; ) i.push(r.value);
} catch (e) {
s = {
error: e
};
} finally {
try {
r && !r.done && (o = a.return) && o.call(a);
} finally {
if (s) throw s.error;
}
}
return i;
}, l = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(n(arguments[t]));
return e;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorFirstRoundBlockTrait = void 0;
(function(e) {
e[e.default = 0] = "default";
e[e.new_one = 1] = "new_one";
})(s || (s = {}));
var c = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.lastGameMode = null;
t.stepBlock = [];
t.stepBlockWayName = "";
t.stepBlockWay = [];
t.isTrigger = !1;
t.triggerStep = 0;
t.firstRoundMutexConsumed = !1;
t.localGameData = {
firstRoundClassicTimes: 0,
firstRoundBlockClassicTimeCD: 0,
firstRoundTravelTimes: 0,
firstRoundBlockTravelTimeCD: 0
};
return t;
}
t.prototype.onCreate = function() {
var e, t;
this.featureType = null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.type) && void 0 !== t ? t : s.default;
};
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Replay_Proxy",
methodName: "onGameReplay"
}, {
className: "ChapterGame_Replay_Proxy",
methodName: "onGameReplay"
} ];
};
t.prototype.isClassGame_Replay_ProxyOnGameReplay = function() {
this.resetFirstRoundClassicTimes();
};
t.prototype.isChapterGame_Replay_ProxyOnGameReplay = function() {
this.resetFirstRoundChapterTimes();
};
t.prototype.isClassGameOver_GameEnd_ProxyOnGameEnd = function() {
this.resetFirstRoundClassicTimes();
};
t.prototype.isChapterGameOver_GameEnd_ProxyOnGameOver = function() {
this.resetFirstRoundChapterTimes();
};
t.prototype.isJewelGame_ProxyOnJewelGameStart = function() {
this.lastGameMode = hs.GameMode.Jewel;
};
t.prototype.isClassGame_ProxyOnClassGameShow = function() {
this.isTrigger = !1;
this.triggerStep = 0;
this.firstRoundMutexConsumed = !1;
if (this.lastGameMode !== hs.GameMode.Class) {
this.lastGameMode = hs.GameMode.Class;
if (this.shouldRegenerateBlocks()) {
this.saveCurrentBlocksInfo();
storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
this.isTrigger = !0;
this.triggerStep = 1;
}
}
};
t.prototype.isChapterGame_ProxyOnChapterGameShow = function() {
this.isTrigger = !1;
this.triggerStep = 0;
this.firstRoundMutexConsumed = !1;
if (this.lastGameMode !== hs.GameMode.Chapter) {
this.lastGameMode = hs.GameMode.Chapter;
if (this.shouldRegenerateBlocks()) {
this.saveCurrentBlocksInfo();
storage.setItem("chapterProducerBlocks", [ -1, -1, -1 ]);
this.isTrigger = !0;
this.triggerStep = 1;
}
}
};
t.prototype.isClassBlocksProducer_Round_ProxyOnAlgorithmStrategyRequest = function(e) {
var t = this.useTrigger(this.isOurTraitRound(), !1);
this.startReplace(e, t);
};
t.prototype.isChapterBlocksProducer_Round_ProxyOnAlgorithmStrategyRequest = function(e) {
var t = this.useTrigger(this.isOurTraitRound(), !1);
this.startReplace(e, t);
};
t.prototype.isAlgorithmStrategyLogicIsAlgorithmSendEndEvent = function(e) {
this.isOurTraitRound() && (e.args[0] = !1);
};
t.prototype.onPreprocessConditionOperators = function() {
var e = this;
return {
classFirstRoundCheck: function(e) {
return !(!e || hs.gameInfo.gameMode !== hs.GameMode.Class) && {
status: !0,
data: {
algorithmIds: hs.algorithmStrategyIOSBlankRefactoredInfo.offer().concat([ hs.OFFER_TYPE.SUI_JI_WU_SI ])
}
};
},
chapterFirstRoundCheck: function(t) {
return !(!t || hs.gameInfo.gameMode !== hs.GameMode.Chapter) && {
status: !0,
data: {
algorithmIds: e.getChapterOfferType().concat([ hs.OFFER_TYPE.SUI_JI_WU_SI ])
}
};
}
};
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isClassTriggered: function() {
return ASContext(e.isTrigger, "本局无尽刚进入且检测到上次未完成盘面 → 触发 NoReplaceBottom 出题");
},
isChapterTriggered: function() {
return ASContext(e.isTrigger, "本关旅行刚进入且检测到上次未完成盘面 → 触发 NoReplaceBottom 出题");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoTrait: [ {
conditions: {
fact: "isClassTriggered",
operator: "classFirstRoundCheck",
value: !0
},
event: {
type: "markClassFirstRoundConsumed"
},
flow: "classFirstRound",
platform: "ios"
} ],
AlgoNoReplaceBottom: [ {
conditions: {
fact: "isChapterTriggered",
operator: "chapterFirstRoundCheck",
value: !0
},
event: {
type: "markChapterFirstRoundConsumed"
},
flow: "chapterFirstRound",
platform: "ios"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoTrait: {
classFirstRound: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.classFirstRoundCheck.data.algorithmIds"
} ],
dynamicSource: hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
},
AlgoNoReplaceBottom: {
chapterFirstRound: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.chapterFirstRoundCheck.data.algorithmIds"
} ]
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
}
}
};
};
t.prototype.markClassFirstRoundConsumed = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
this.isTrigger = !1;
this.firstRoundMutexConsumed = !0;
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == e ? void 0 : e.active) {
e.addAlgorithmNameMapping(hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, "CTRefactorFirstRoundBlockTrait", hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU);
e.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorFirstRoundBlockTrait", hs.OFFER_TYPE.SUI_JI_WU_SI);
}
this.recordCheckUse(!0);
};
t.prototype.markChapterFirstRoundConsumed = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ChapterAlgorithmSourceType.AlgoNoReplaceBottom);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
this.isTrigger = !1;
this.firstRoundMutexConsumed = !0;
};
t.prototype.onAlgorithmStrategySDKResultMutate = function(e) {
var t;
if (this.checkIsNeedChangeResult()) {
var o = null !== (t = null == e ? void 0 : e.blockNames) && void 0 !== t ? t : [];
if ("填空消除" !== o[0] && "填空消除" !== o[1] && "填空消除" !== o[2]) {
e.blockIds = [];
e.blockNames = [];
e.blockPoses = [];
}
this.triggerStep = 2;
}
};
t.prototype.onAlgorithmStrategySDKComplete = function(e, t) {
if (this.isOurTraitRound(t)) if (e) {
if (this.checkStep(this.triggerStep)) {
var o = null == t ? void 0 : t.blockIds;
if (Array.isArray(o) && 3 === o.length) {
var r = null == t ? void 0 : t.blockNames, s = l(r || hs.algorithmName.algoActualName), a = hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoActualId];
this.updateFeatureUsageData();
this.collectAndSendGameStats(hs.gameInfo.gameMode, s, a, l(o));
this.triggerStep = 0;
this.firstRoundMutexConsumed = !1;
}
}
} else this.firstRoundMutexConsumed = !1;
};
t.prototype.checkIsNeedChangeResult = function() {
return !1;
};
t.prototype.checkStep = function() {
return !0;
};
t.prototype.getChapterOfferType = function() {
return hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
};
t.prototype.recordCheckUse = function() {};
t.prototype.useTrigger = function(e, t) {
return t ? this.isTrigger : e;
};
t.prototype.startReplace = function(e, t) {
if (t) {
e.replace = !0;
e.returnState = !0;
}
};
t.prototype.updateRoundId = function(e) {
return e;
};
t.prototype.getTriggerStep = function() {
return this.triggerStep;
};
t.prototype.isFirstRoundMutexConsumed = function() {
return this.firstRoundMutexConsumed;
};
t.prototype.isOurTraitRound = function(e) {
return this.firstRoundMutexConsumed || (null == e ? void 0 : e.traitSource) === this.traitName;
};
t.prototype.shouldRegenerateBlocks = function() {
if (!1 === storage.getItem("isFinishedGuide", !1)) return !1;
var e = hs.blocksProducerInfo, t = e.producerBlocks;
return !e.isNullProducerBlocks && ((-1 === t[0] || -1 === t[1] || -1 === t[2]) && !!this.isFeatureAvailable());
};
t.prototype.saveCurrentBlocksInfo = function() {
this.stepBlock.length = 0;
this.stepBlockWay.length = 0;
this.stepBlockWayName = hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId];
for (var e = hs.blocksProducerInfo.producerBlocks, t = 0; t < 3; t++) if (-1 !== e[t]) {
this.stepBlock.push(e[t]);
this.stepBlockWay.push(hs.algorithmName.algoActualName[t]);
}
};
t.prototype.collectAndSendGameStats = function(e, t, o, r) {
var s = 0, a = 0, i = null, n = null, l = null, c = 0, u = 0, h = 0, p = 0, d = 0;
if (e === hs.GameMode.Class) {
h = storage.getItem("classScore", 0);
a = this.localGameData.firstRoundClassicTimes;
l = h / (u = storage.getItem("classHighScore", 0));
p = storage.getItem("classGameNum", 0);
d = storage.getItem("classRoundNum", 0);
} else if (e === hs.GameMode.Chapter) {
s = 2;
a = this.localGameData.firstRoundTravelTimes;
var m = storage.getItem("chapterPeriodsIndex", 1), f = storage.getItem("chapterNum", 0), g = storage.getItem("chapterCondition");
i = m;
n = f + 1;
p = storage.getItem("chapterGameNum", 0);
d = storage.getItem("chapterRoundNum", 0);
if (g && g.Way !== hs.ChapterType.score) {
c = 2;
h = 0;
for (var y = 0; y < g.RequiredCollections.length; y++) {
c && (h += g.RequiredCollections[y].Value);
u += g.RequiredCollections[y].Value;
}
l = (u - h) / u;
} else if (g) {
c = 1;
l = h / (u = g.RequiredScore);
}
}
var R = new Date(), C = hs.deepCopy(hs.boardInfo.faceBlocks), T = hs.BinaryBoard.getWeightValue(), _ = o, v = hs.blocksProducerInfo.producerBlocks, k = {
event_datetime: R.toLocaleString(),
game_type: s,
game_id: p,
travelid: i,
Travellevelid: n,
travel_type: c,
round_id: d,
block_index_id: this.stepBlock.length,
trytimes: a,
block_list_before_1: this.stepBlock[0],
block_list_before_2: this.stepBlock[1],
matrix: C,
weight: T,
score: h,
target: u,
process: l,
rec_strategy_before: this.stepBlockWayName,
rec_strategy_fact_before: [ this.stepBlockWay[0], this.stepBlockWay[1] ],
rec_strategy: _,
rec_strategy_fact: [ t[0], t[1], t[2] ],
block_list: [ v[0], v[1], v[2] ]
};
k.block_list = r;
k.round_id = this.updateRoundId(d - 1);
DS("usr_data_back_again", k);
};
t.prototype.isFeatureAvailable = function() {
switch (this.featureType) {
case s.default:
return this.isWithinUsageLimit();

case s.new_one:
return this.checkCooldownTime();

default:
return this.isWithinUsageLimit();
}
};
t.prototype.isWithinUsageLimit = function() {
if (this.lastGameMode === hs.GameMode.Class) {
if (this.localGameData.firstRoundClassicTimes >= this.props.count) return !1;
} else if (this.lastGameMode === hs.GameMode.Chapter && this.localGameData.firstRoundTravelTimes >= this.props.count) return !1;
return !0;
};
t.prototype.checkCooldownTime = function() {
var e, t = 0;
this.lastGameMode === hs.GameMode.Class ? t = this.localGameData.firstRoundBlockClassicTimeCD : this.lastGameMode === hs.GameMode.Chapter && (t = this.localGameData.firstRoundBlockTravelTimeCD);
var o = new Date().getTime() / 1e3;
return !(t + 60 * (null !== (e = this.props.time) && void 0 !== e ? e : 0) > o) && this.isWithinUsageLimit();
};
t.prototype.updateFeatureUsageData = function() {
switch (this.featureType) {
case s.new_one:
if (this.lastGameMode === hs.GameMode.Class) {
this.localGameData.firstRoundBlockClassicTimeCD = new Date().getTime() / 1e3;
this.localGameData.firstRoundClassicTimes++;
} else if (this.lastGameMode === hs.GameMode.Chapter) {
this.localGameData.firstRoundBlockTravelTimeCD = new Date().getTime() / 1e3;
this.localGameData.firstRoundTravelTimes++;
}
break;

case s.default:
this.lastGameMode === hs.GameMode.Class ? this.localGameData.firstRoundClassicTimes++ : this.lastGameMode === hs.GameMode.Chapter && this.localGameData.firstRoundTravelTimes++;
}
};
t.prototype.resetFirstRoundClassicTimes = function() {
switch (this.featureType) {
case s.default:
case s.new_one:
this.localGameData.firstRoundClassicTimes = 0;
}
};
t.prototype.resetFirstRoundChapterTimes = function() {
switch (this.featureType) {
case s.default:
case s.new_one:
this.localGameData.firstRoundTravelTimes = 0;
}
};
i([ hs.storageProperty({
key: "FirstRoundBlockTraitKey"
}) ], t.prototype, "localGameData", void 0);
return i([ classId("CTRefactorFirstRoundBlockTrait"), classMethodWatch() ], t);
}(Trait);
o.CTRefactorFirstRoundBlockTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstRoundBlockTrait" ]);
//# sourceMappingURL=index.js.map
