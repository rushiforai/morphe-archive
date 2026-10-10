window.__require = function t(e, r, o) {
function a(l, p) {
if (!r[l]) {
if (!e[l]) {
var n = l.split("/");
n = n[n.length - 1];
if (!e[n]) {
var f = "function" == typeof __require && __require;
if (!p && f) return f(n, !0);
if (i) return i(n, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = n;
}
var c = r[l] = {
exports: {}
};
e[l][0].call(c.exports, function(t) {
return a(e[l][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < o.length; l++) a(o[l]);
return a;
}({
CTRefactorLevelLoopTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "5ead0JU+i1MW6sIjO8CY9Fd", "CTRefactorLevelLoopTrait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var a, i = arguments.length, l = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, o); else for (var p = t.length - 1; p >= 0; p--) (a = t[p]) && (l = (i < 3 ? a(l) : i > 3 ? a(e, r, l) : a(e, r)) || l);
return i > 3 && l && Object.defineProperty(e, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLevelLoopTrait = void 0;
var l = {
start: [ 2 ],
range: [ 1 ],
length: 3
}, p = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.initialized = !1;
e.randomNum = 0;
return e;
}
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.randomNum = Math.floor(10 * Math.random());
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
var e = hs.algorithmName.algoActualId;
if (hs.isValueInEnum(e, hs.OFFER_TYPE_DIFFICULTY)) {
var r = this.resolveTravelStage2HardSource(t), o = hs.ChapterAlgorithmSourceType.TravelStage2_hard;
hs.chapterAlgorithmStrategyGameInfo.getOfferNewBlockHardState();
r === o && hs.chapterAlgorithmStrategyGameInfo.setOfferNewBlockHardState(!1);
}
};
e.prototype.resolveTravelStage2HardSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
};
Object.defineProperty(e.prototype, "levelLoopParam", {
get: function() {
var t = this.propLength, e = this.propStart, r = this.propRange, o = this.propNovice, a = this.propSimple_difficult;
return null === t || null === e || null === r ? l : {
start: e,
range: r,
length: t,
novice: o,
simple_difficult: a
};
},
enumerable: !1,
configurable: !0
});
e.prototype.getChapterDifficulty = function(t) {
var e = this.levelLoopParam, r = t % e.length, o = hs.CHAPTER_DIFF_TYPE.SIMPLE;
e.start.includes(r) ? o = hs.CHAPTER_DIFF_TYPE.DIFFICULT : e.range.includes(r) ? o = hs.CHAPTER_DIFF_TYPE.MEDIUM : e.simple_difficult && e.simple_difficult.includes(r) ? o = hs.CHAPTER_DIFF_TYPE.SIMPLE_DIFFICULT : e.novice && e.novice.includes(r) && (o = hs.CHAPTER_DIFF_TYPE.NOVICE);
return o;
};
e.prototype.logLevelLoopDifficulty = function() {};
e.prototype.getDifficultyName = function(t) {
return t == hs.CHAPTER_DIFF_TYPE.DIFFICULT ? "困难" : t == hs.CHAPTER_DIFF_TYPE.MEDIUM ? "中等" : "简单";
};
Object.defineProperty(e.prototype, "propStart", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelLoopTrait", "start", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "propRange", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelLoopTrait", "range", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "propLength", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelLoopTrait", "length", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "propNovice", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelLoopTrait", "novice", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "propSimple_difficult", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelLoopTrait", "simple_difficult", this.props, null);
},
enumerable: !1,
configurable: !0
});
e.prototype.onPreprocessConditionContext = function() {
var t = this, e = hs.chapterDifficultyInfo.getChapterDifficultyByChapterNum(hs.chapterGameInfo.chapterNum), r = TRAIT("CTRefactorChapterAlgoStrategyTrait");
return buildLazyConditionContext({
isChapterDifficulty: function() {
return ASContext(hs.chapterDifficultyInfo.isChapterDifficulty(e), "是否困难关");
},
isChapterMedium: function() {
return ASContext(hs.chapterDifficultyInfo.isChapterMedium(e), "是否中等关");
},
randomNum: function() {
return ASContext(t.randomNum, "随机数0-9");
},
chapterFirstHardStateLevelloop: function() {
return ASContext(storage.getItem("chapterFirstHardState_levelloop"), "首次困难状态-关卡循环");
},
chapterRatioStage1: function() {
var t, e, o;
return ASContext(null !== (o = null === (e = null === (t = null == r ? void 0 : r.state) || void 0 === t ? void 0 : t.ratioArr) || void 0 === e ? void 0 : e[0]) && void 0 !== o ? o : .5, "旅行第一段阈值");
},
chapterRatioStage2: function() {
var t, e, o;
return ASContext(null !== (o = null === (e = null === (t = null == r ? void 0 : r.state) || void 0 === t ? void 0 : t.ratioArr) || void 0 === e ? void 0 : e[1]) && void 0 !== o ? o : .75, "旅行第二段阈值");
},
chapterIsOpenLevelHelp: function() {
var t, e;
return ASContext(null !== (e = null === (t = null == r ? void 0 : r.state) || void 0 === t ? void 0 : t.isOpenLevelHelp) && void 0 !== e && e, "旅行帮扶开关");
},
isAlgo: function() {
return ASContext(!0, "ios出题列表");
},
iosAlgorithmList: function() {
return ASContext(!0, "ios出题列表");
}
});
};
e.prototype.getOfferType = function() {
return hs.algorithmStrategyLogic.getShangZengAndSuiJi();
};
e.prototype.offerTravelSuiJi = function() {
return [ hs.OFFER_TYPE.SUI_JI_TRAVEL ];
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
randomAlgo: function() {
return {
status: !0,
data: {
algorithmId: t.getOfferType()
}
};
},
setIosAlgorithmList: function(t, e) {
if ("Stage2DifficultIos" == e) return {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSRandomRefactoredInfo.offerTravelSuiJi()
}
};
if ("Stage2NormalIos" == e) return {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSBlankRefactoredInfo.offerBitTravelTianKongXiaoChu()
}
};
if ("Stage2HardDifficultIos" == e) {
var r = hs.chapterDifficultyInfo.getChapterDifficultyByChapterNum(hs.chapterGameInfo.chapterNum);
return hs.chapterDifficultyInfo.isChapterMedium(r) ? Math.floor(10 * Math.random()) < 5 ? {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSRandomRefactoredInfo.offerTravelSuiJi()
}
} : {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit()
}
} : hs.chapterDifficultyInfo.isChapterDifficulty(r) ? hs.chapterAlgorithmStrategyGameInfo.getOfferNewBlockHardState() ? {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSDifficultRefactoredInfo.diffDownOffer([], "CTRefactorLevelLoopTrait", hs.OFFER_TYPE.KUN_NAN_TI)
}
} : {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSRandomRefactoredInfo.offerTravelSuiJi()
}
} : {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSBlankRefactoredInfo.offerBitTravelTianKongXiaoChu()
}
};
}
}
};
};
e.prototype.onLevelLoopSourceLevel2 = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel2(this.traitName);
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
TravelStage2_simple: [ {
conditions: {
and: [ {
fact: "chapterIsOpenLevelHelp",
operator: "=",
value: !0
}, {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !0
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2SimpleDifficult",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterIsOpenLevelHelp",
operator: "=",
value: !0
}, {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !1
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2SimpleNormal",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterIsOpenLevelHelp",
operator: "=",
value: !0
}, {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !1
}, {
fact: "iosAlgorithmList",
operator: "setIosAlgorithmList",
value: "Stage2NormalIos"
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2SimpleNormalIos",
platform: "ios"
}, {
conditions: {
and: [ {
fact: "chapterIsOpenLevelHelp",
operator: "=",
value: !0
}, {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !0
}, {
fact: "iosAlgorithmList",
operator: "setIosAlgorithmList",
value: "Stage2DifficultIos"
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2DifficultlIos",
platform: "ios"
} ],
TravelStage2_hard: [ {
conditions: {
and: [ {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterMedium",
operator: "=",
value: !0
}, {
fact: "isAlgo",
operator: "randomAlgo",
value: !0
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2HardMedium",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !0
}, {
fact: "chapterFirstHardStateLevelloop",
operator: "=",
value: !1
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2HardDifficultFirst",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !0
}, {
fact: "chapterFirstHardStateLevelloop",
operator: "!=",
value: !1
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2HardDifficultNotFirst",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "isChapterDifficulty",
operator: "=",
value: !1
}, {
fact: "isChapterMedium",
operator: "=",
value: !1
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2HardSimple",
platform: "gp"
}, {
conditions: {
and: [ {
fact: "chapterIsOpenLevelHelp",
operator: "=",
value: !1
}, {
fact: "chapterRatio",
operator: ">",
value: {
fact: "chapterRatioStage1"
}
}, {
fact: "chapterRatio",
operator: "<=",
value: {
fact: "chapterRatioStage2"
}
}, {
fact: "iosAlgorithmList",
operator: "setIosAlgorithmList",
value: "Stage2HardDifficultIos"
} ]
},
event: {
type: "onLevelLoopSourceLevel2"
},
flow: "stage2HardDifficultlIos",
platform: "ios"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
TravelStage2_simple: {
stage2SimpleDifficult: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI ]
} ],
stage2SimpleNormal: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BLANK.TRAVEL_TIAN_KONG_XIAO_CHU ]
} ],
stage2SimpleNormalIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.setIosAlgorithmList.data.algorithmId"
} ]
} ],
stage2DifficultlIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.setIosAlgorithmList.data.algorithmId"
} ]
} ]
},
TravelStage2_hard: {
stage2HardMedium: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.randomAlgo.data.algorithmId"
} ]
} ],
stage2HardDifficultFirst: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI ]
} ],
stage2HardDifficultNotFirst: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI ]
} ],
stage2HardSimple: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BLANK.TRAVEL_TIAN_KONG_XIAO_CHU ]
} ],
stage2HardDifficultlIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.setIosAlgorithmList.data.algorithmId"
} ]
} ]
}
}
};
};
e.prototype.isChapterDifficultyStrategy_ProxyDetermineDifficulty = function(t) {
var e = t.args[0], r = this.getChapterDifficulty(e);
t.replace = !0;
t.returnValue = r;
};
return i([ classId("CTRefactorLevelLoopTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorLevelLoopTrait = p;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLevelLoopTrait" ]);
//# sourceMappingURL=index.js.map
