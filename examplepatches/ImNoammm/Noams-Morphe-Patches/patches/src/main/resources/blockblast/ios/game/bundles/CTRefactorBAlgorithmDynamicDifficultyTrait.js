window.__require = function t(e, o, i) {
function r(n, s) {
if (!o[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var f = o[n] = {
exports: {}
};
e[n][0].call(f.exports, function(t) {
return r(e[n][1][t] || t);
}, f, f.exports, t, e, o, i);
}
return o[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < i.length; n++) r(i[n]);
return r;
}({
CTRefactorBAlgorithmDynamicDifficultyTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "6e2d5qDnE9LGIeiPY4cW0+a", "CTRefactorBAlgorithmDynamicDifficultyTrait");
var i, r = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
i(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), a = this && this.__decorate || function(t, e, o, i) {
var r, a = arguments.length, n = a < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, o, i); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (n = (a < 3 ? r(n) : a > 3 ? r(e, o, n) : r(e, o)) || n);
return a > 3 && n && Object.defineProperty(e, o, n), n;
};
this && this.__read;
this && this.__spread;
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorBAlgorithmDynamicDifficultyTrait = void 0;
var n = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.tag = "【算法】交叉动态难度";
e.bl_dy_diff_ios_class_key = "BAlgorithmDynamicDifficultyIOSRoundClass";
e.bl_dy_diff_ios_chapter_key = "BAlgorithmDynamicDifficultyIOSRoundChapter";
return e;
}
e.prototype.onAlgorithmStrategyGameNewInit = function() {
this.clearIosRound();
};
e.prototype.onPreprocessConditionContext = function(t) {
var e = this;
this._flow = t;
return buildLazyConditionContext({
isDynamicDifficultyUnlocked: function() {
return ASContext(e.isUnlocked(), "交叉动态难度是否解锁");
},
isDynamicDifficultyVaild: function() {
return ASContext(e.checkVaildByFlow(t), "交叉动态难度是否满足替换条件");
},
dynamicDifficultyCount: function() {
return ASContext(e.getDynamicDifficultyCount(), "交叉动态难度剩余替换次数");
}
});
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
handleDynamicDifficultyReplacement: function(e) {
if (e <= 0) return !1;
var o = t.handleDynamicDifficultyReplacement();
return !!o && {
status: !0,
data: o
};
}
};
};
e.prototype.onPreprocessConditions = function() {
return {
baseAfter: [ {
conditions: {
and: [ {
fact: "isDynamicDifficultyUnlocked",
operator: "=",
value: !0
}, {
fact: "isDynamicDifficultyVaild",
operator: "=",
value: !0
}, {
fact: "dynamicDifficultyCount",
operator: "handleDynamicDifficultyReplacement",
value: !0
} ]
},
platform: "gp",
flow: "dynamicDifficultyFlow"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
baseAfter: {
dynamicDifficultyFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.handleDynamicDifficultyReplacement.data.algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.handleDynamicDifficultyReplacement.data.fallbackList"
} ]
} ]
}
};
};
e.prototype.getDynamicDifficultyCount = function() {
return hs.gameInfo.gameMode === hs.GameMode.Class ? storage.getItem("bAlgorithmDynamicDifficulty_classCount", 0) || 0 : hs.gameInfo.gameMode === hs.GameMode.Chapter && storage.getItem("bAlgorithmDynamicDifficulty_chapterCount", 0) || 0;
};
e.prototype.checkVaildByFlow = function(t) {
var e;
if (!this.isUnlocked()) return !1;
var o = (null !== (e = null == t ? void 0 : t.algorithmList) && void 0 !== e ? e : []).map(function(t) {
return t.algorithmId;
}), i = [ hs.OFFER_TYPE.HEJI_KUN_NAN_TI, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPY, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPYMORECLEAR, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD1, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD2 ];
return ("CTRefactorTravelHappyOverTrait" !== hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2 || !o.some(function(t) {
return -1 !== i.indexOf(t);
})) && !!this.isHardExpected(o);
};
e.prototype.handleDynamicDifficultyReplacement = function() {
var t, e;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
t = "bAlgorithmDynamicDifficulty_classCount";
e = this.classAlgo;
} else {
if (hs.gameInfo.gameMode !== hs.GameMode.Chapter) return null;
t = "bAlgorithmDynamicDifficulty_chapterCount";
e = this.chapterAlgo;
}
var o = storage.getItem(t, 0) || 0;
if (o <= 0) return null;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(e, this);
storage.setItem(t, o - 1);
return {
algorithmList: [ e ],
fallbackList: [ hs.OFFER_TYPE.SUI_JI_WU_SI ]
};
};
Object.defineProperty(e.prototype, "unlockLevel", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "unlockLevel", this.props, 1);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "classOrigin", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "classOrigin", this.props, []);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "chapterOrigin", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "chapterOrigin", this.props, []);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "classMax", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "classMax", this.props, 3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "chapterMax", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "chapterMax", this.props, 3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "classAlgo", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "classAlgo", this.props, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "chapterAlgo", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BAlgorithmDynamicDifficultyTrait", "chapterAlgo", this.props, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU);
},
enumerable: !1,
configurable: !0
});
e.prototype.log = function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
};
e.prototype.isUnlocked = function() {
return storage.getItem("chapterGameNum", 0) >= this.unlockLevel;
};
e.prototype.isHardExpected = function(t) {
if (!Array.isArray(t)) return !1;
var e;
hs.gameInfo.gameMode === hs.GameMode.Class ? e = this.classOrigin : hs.gameInfo.gameMode === hs.GameMode.Chapter && (e = this.chapterOrigin);
return e && e.length > 0 ? t.some(function(t) {
return e.includes(t);
}) : t.some(function(t) {
return hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY) || t === hs.OFFER_TYPE.SI_WANG || t === hs.OFFER_TYPE.ZHI_SI_TI;
});
};
e.prototype.isClassAlgorithmLifeCycle_GameStart_ProxyNewGameInit = function() {
this.clearIosRound();
};
e.prototype.isChapterAlgorithmLifeCycle_GameStart_ProxyNewGameInit = function() {
this.clearIosRound();
};
e.prototype.isClassGame_ProxyNewGameInit = function() {
this.clearIosRound();
};
e.prototype.isClassGameOver_GameEnd_ProxyOnGameEnd = function() {
this.handleClassGameEnd();
};
e.prototype.isChapterGameOver_GameEnd_ProxyOnGameOver = function(t) {
this.handleChapterGameOver(t);
};
e.prototype.isClassGame_Replay_ProxyOnGameReplay = function() {
this.handleClassGameReplay();
};
e.prototype.isChapterGame_Replay_ProxyOnGameReplay = function() {
this.handleChapterGameReplay();
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoMore3000ScoreBitVeryDifficulty = function(t) {
this.handleIosDifficultyReplace(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLess3000ScoreBitZhiJueNanTi = function(t) {
this.handleIosDifficultyReplace(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoReplaceClassDifficultyOptimise = function(t) {
this.handleIosDifficultyReplace(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoDiffDownOffer = function(t) {
this.handleIosDifficultyReplace(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceBitKunNanNanti = function(t) {
this.handleIosDifficultyReplace(t);
};
e.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceBitZhiJueNanTi = function(t) {
this.handleIosZhiJueDifficultyReplace(t);
};
e.prototype.increaseCount = function(t, e) {
var o = storage.getItem(t, 0) || 0, i = Math.min(o + 1, e);
storage.setItem(t, i);
};
e.prototype.handleClassGameEnd = function() {
this.isUnlocked() && this.increaseCount("bAlgorithmDynamicDifficulty_chapterCount", this.chapterMax, "无尽失败 → 旅行计数 =");
};
e.prototype.handleChapterGameOver = function(t) {
this.isUnlocked() && 0 == t.args[1] && this.increaseCount("bAlgorithmDynamicDifficulty_classCount", this.classMax, "旅行失败 → 无尽计数 =");
};
e.prototype.handleClassGameReplay = function() {
this.isUnlocked() && this.increaseCount("bAlgorithmDynamicDifficulty_chapterCount", this.chapterMax, "无尽重玩 → 旅行计数 =");
};
e.prototype.handleChapterGameReplay = function() {
this.isUnlocked() && this.increaseCount("bAlgorithmDynamicDifficulty_classCount", this.classMax, "旅行重玩 → 无尽计数 =");
};
e.prototype.handleIosDifficultyReplace = function(t) {
this.handleIosDifficultyReplaceByMode(t, !1);
};
e.prototype.handleIosZhiJueDifficultyReplace = function(t) {
this.handleIosDifficultyReplaceByMode(t, !0);
};
e.prototype.handleIosDifficultyReplaceByMode = function(t, e) {
if (this.isUnlocked()) {
var o = t.args[0];
this.checkIosVaild(o) && (hs.gameInfo.gameMode === hs.GameMode.Class ? this.applyIosDifficultyReplace(t, "bAlgorithmDynamicDifficulty_classCount", "无尽难题 → 替换为填空, 计数-1 =", e) : hs.gameInfo.gameMode === hs.GameMode.Chapter && this.applyIosDifficultyReplace(t, "bAlgorithmDynamicDifficulty_chapterCount", "旅行难题 → 替换为填空, 计数-1 =", e));
}
};
e.prototype.applyIosDifficultyReplace = function(t, e, o, i) {
var r = storage.getItem(e, 0) || 0;
if (!(r <= 0)) {
var a = t.args[0], n = this.getIosFillAlgoList();
if (!(n.length <= 0)) {
t.args[0] = i ? n.concat(a) : n;
if (this.iosRoundCanDes()) {
this.recordIosRound();
storage.setItem(e, r - 1);
}
}
}
};
e.prototype.getIosFillAlgoList = function() {
if (hs.gameInfo.gameMode == hs.GameMode.Class) return hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit();
var t = hs.algorithmStrategyIOSBlankRefactoredInfo.offerBitTravelTianKongXiaoChu(), e = hs.algorithmStrategyIOSRandomRefactoredInfo.offerTravelSuiJi();
return t.concat(e);
};
e.prototype.recordIosRound = function() {
if (hs.gameInfo.gameMode == hs.GameMode.Class) {
var t = storage.getItem("classRoundNum", 0);
storage.setItem(this.bl_dy_diff_ios_class_key, t);
} else if (hs.gameInfo.gameMode == hs.GameMode.Chapter) {
t = storage.getItem("chapterRoundNum", 0);
storage.setItem(this.bl_dy_diff_ios_chapter_key, t);
}
};
e.prototype.clearIosRound = function() {
hs.gameInfo.gameMode === hs.GameMode.Class ? storage.setItem(this.bl_dy_diff_ios_class_key, -1) : hs.gameInfo.gameMode === hs.GameMode.Chapter && storage.setItem(this.bl_dy_diff_ios_chapter_key, -1);
};
e.prototype.iosRoundCanDes = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var t = storage.getItem(this.bl_dy_diff_ios_class_key, -1);
return storage.getItem("classRoundNum", 0) != t;
}
return hs.gameInfo.gameMode !== hs.GameMode.Chapter || storage.getItem("chapterRoundNum", 0) != storage.getItem(this.bl_dy_diff_ios_chapter_key, -1);
};
e.prototype.checkIosVaild = function(t) {
return !!this.isUnlocked() && (!!this.isLevelLoopSource() || !!this.isHardExpected(t));
};
e.prototype.isLevelLoopSource = function() {
return hs.gameInfo.gameMode === hs.GameMode.Chapter && "CTRefactorLevelLoopTrait" === hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
};
e.prototype.checkVaild = function() {
if (!this.isUnlocked()) return !1;
var t = hs.algorithmStrategyInfo.algorithmList || [], e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2;
return this.checkVaildByAlgorithmInfo(t, e);
};
e.prototype.checkVaildByAlgorithmInfo = function(t, e) {
var o = [ hs.OFFER_TYPE.HEJI_KUN_NAN_TI, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPY, hs.OFFER_TYPE.HEJI_ALGORITHMENTROPYMORECLEAR, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD1, hs.OFFER_TYPE.HEJI_ALGODIFFSPREAD2 ];
return ("CTRefactorTravelHappyOverTrait" !== e || !t.some(function(t) {
return -1 !== o.indexOf(t);
})) && !!this.isHardExpected(t);
};
return a([ classId("CTRefactorBAlgorithmDynamicDifficultyTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorBAlgorithmDynamicDifficultyTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBAlgorithmDynamicDifficultyTrait" ]);
//# sourceMappingURL=index.js.map
