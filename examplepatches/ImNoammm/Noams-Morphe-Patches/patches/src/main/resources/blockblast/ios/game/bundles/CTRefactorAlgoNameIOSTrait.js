window.__require = function t(e, o, a) {
function r(h, i) {
if (!o[h]) {
if (!e[h]) {
var l = h.split("/");
l = l[l.length - 1];
if (!e[l]) {
var E = "function" == typeof __require && __require;
if (!i && E) return E(l, !0);
if (s) return s(l, !0);
throw new Error("Cannot find module '" + h + "'");
}
h = l;
}
var c = o[h] = {
exports: {}
};
e[h][0].call(c.exports, function(t) {
return r(e[h][1][t] || t);
}, c, c.exports, t, e, o, a);
}
return o[h].exports;
}
for (var s = "function" == typeof __require && __require, h = 0; h < a.length; h++) r(a[h]);
return r;
}({
CTRefactorAlgoNameIOSTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "636e03uvNpEzLXEsd2vU5A2", "CTRefactorAlgoNameIOSTrait");
var a, r = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
a(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), s = this && this.__decorate || function(t, e, o, a) {
var r, s = arguments.length, h = s < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, o) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) h = Reflect.decorate(t, e, o, a); else for (var i = t.length - 1; i >= 0; i--) (r = t[i]) && (h = (s < 3 ? r(h) : s > 3 ? r(e, o, h) : r(e, o)) || h);
return s > 3 && h && Object.defineProperty(e, o, h), h;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorAlgoNameIOSTrait = void 0;
var h = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.TERMINATE_ALGORITHMS = [ hs.OFFER_TYPE_BASE.CLASSTERMINATE_CYCLE, hs.OFFER_TYPE_BASE.CHAPTERTERMINATE_CYCLE ];
e.PRIORITY_ALGORITHMS = [ {
type: hs.OFFER_TYPE_BLANK.ALGO_MIX_TKXC,
name: "混合填空2"
}, {
type: hs.OFFER_TYPE_BLANK.ALGO_QUICK,
name: "快速填空"
}, {
type: hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA,
name: "大面积填空"
}, {
type: hs.OFFER_TYPE_BASE.CLEAR_BOARD,
name: "清屏算法plus"
}, {
type: hs.OFFER_TYPE_DIFFICULTY.SIMPLE_ZHIJUE,
name: "简单直觉题"
}, {
type: hs.OFFER_TYPE_BASE.CLASSTERMINATE_CYCLE,
name: "终止刷分"
}, {
type: hs.OFFER_TYPE_BASE.CHAPTERTERMINATE_CYCLE,
name: "终止刷分"
}, {
type: hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE,
name: "消除爽"
}, {
type: hs.OFFER_TYPE_BASE.ALGO_SCORE,
name: "分数算法"
} ];
e.ALGORITHM_MAPPINGS = [];
e.lastAlgoExpectedId = hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU;
return e;
}
e.prototype.data = function() {
return {
flow: null,
algoExpectedId: hs.OFFER_TYPE_BASE.NONE
};
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.state.algoExpectedId = hs.OFFER_TYPE_BASE.NONE;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
};
e.prototype.onAlgorithmStrategyAlgorithmListChanged = function(t, e, o) {
if ("preprocess" == t) {
var a = o.filter(function(t) {
return "priority" !== t.algorithmListSource && t.dynamicSource !== hs.ClassAlgorithmSourceType.Priority && t.dynamicSource !== hs.ChapterAlgorithmSourceType.Priority;
});
if (a.length > 0 && this.state.algoExpectedId == hs.OFFER_TYPE_BASE.NONE) {
if (hs.gameInfo.gameMode == hs.GameMode.Class) {
var r = a.some(function(t) {
return t.source == hs.ClassAlgorithmSourceType.AlgoRevive || t.source == hs.ClassAlgorithmSourceType.AlgoReviveTrait;
});
this.state.algoExpectedId = r ? this.lastAlgoExpectedId : a[0].algorithmId;
} else if (hs.gameInfo.gameMode == hs.GameMode.Chapter) {
r = a.some(function(t) {
return t.source == hs.ChapterAlgorithmSourceType.TravelRevive || t.source == hs.ChapterAlgorithmSourceType.TravelReviveTrait;
});
var s = a.some(function(t) {
return t.source == hs.ChapterAlgorithmSourceType.TravelStage1 || t.source == hs.ChapterAlgorithmSourceType.TravelStage2_simple || t.source == hs.ChapterAlgorithmSourceType.TravelStage2_hard || t.source == hs.ChapterAlgorithmSourceType.TravelStage3;
});
a.some(function(t) {
return "CTRefactorRatioAdjustTrait" == t.traitSource;
}) && s ? this.state.algoExpectedId = a[0].algorithmId : r ? 1 == hs.algorithmIOSReviveInfo.algorithmReviveTriat ? this.state.algoExpectedId = this.lastAlgoExpectedId : this.state.algoExpectedId = hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU : this.state.algoExpectedId = a[0].algorithmId;
}
this.onDealCommon();
}
this.onDealTrait(a);
}
};
e.prototype.onAlgorithmStrategySDKBefore = function() {
this.lastAlgoExpectedId = this.state.algoExpectedId;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(this.state.algoExpectedId, this);
};
e.prototype.onAlgorithmStrategySDKBetween = function(t) {
this.handleAlgorithmDowngrade(t, hs.OFFER_TYPE_BASE.CLEAR_BOARD, "清屏plus");
this.handleAlgorithmDowngrade(t, hs.OFFER_TYPE_BASE.ELIMINTE_PLEASURE, "消除爽");
};
e.prototype.onAfterOfferBefore = function() {};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
t.sdk && this.onDealSuccessTraitBefore(t);
};
e.prototype.handleAlgorithmDowngrade = function(t, e) {
var o, a, r = 3 != (null !== (a = null === (o = t.sdk) || void 0 === o ? void 0 : o.blockIds) && void 0 !== a ? a : []).length, s = storage.getItem("classAlgoExpectedId", hs.OFFER_TYPE.NONE);
if (s == e && r) {
var h = t.algorithmFallbackList;
if (h.length > 0) {
this.lastAlgoExpectedId = s;
h.length > 0 ? this.state.algoExpectedId = h[0].algorithmId : this.state.algoExpectedId = hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU;
}
this.lastAlgoExpectedId = this.state.algoExpectedId;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(this.state.algoExpectedId, this);
}
};
e.prototype.onDealSuccessTraitBefore = function() {
hs.gameInfo.gameMode == hs.GameMode.Class ? this.isTerminateAlgorithm(hs.algorithmName.algoExpectedId) && this.isTerminateAlgorithm(hs.algorithmName.algoExpectedId) && as.AlgorithmStrategyAlgoActualNamePatch.patch([ "终止刷分", "终止刷分", "终止刷分" ], this) : this.isTerminateAlgorithm(hs.algorithmName.algoExpectedId) && this.isTerminateAlgorithm(hs.algorithmName.algoExpectedId) && ("随机无死亡" == hs.algorithmName.algoActualName[0] ? as.AlgorithmStrategyAlgoActualNamePatch.patch([ "随机无死亡", "随机无死亡", "随机无死亡" ], this) : as.AlgorithmStrategyAlgoActualNamePatch.patch([ "终止刷分", "终止刷分", "终止刷分" ], this));
if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.LINK_SMALL_BORDER) {
this.lastAlgoExpectedId = hs.OFFER_TYPE_DIFFICULTY.LINK_SMALL_BORDER;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_DIFFICULTY.LINK_SMALL_BORDER, this);
} else if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.ALGO_FILL_MORE_AREA) {
this.lastAlgoExpectedId = hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.ALGO_FILL_MORE_AREA, this);
} else if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.ALGO_DIFFICULT_DOWN, this);
} else if (hs.algorithmName.algoExpectedId == hs.OFFER_TYPE.ZHI_SI_TI || hs.algorithmName.algoActualId == hs.OFFER_TYPE.ZHI_SI_TI) {
this.lastAlgoExpectedId = hs.OFFER_TYPE_DIE.ZHI_SI_TI;
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_DIE.ZHI_SI_TI, this);
}
};
e.prototype.isTerminateAlgorithm = function(t) {
return this.TERMINATE_ALGORITHMS.includes(t);
};
e.prototype.onDealCommon = function() {
var t = this, e = this.ALGORITHM_MAPPINGS.find(function(e) {
return e.from === t.state.algoExpectedId;
});
e && (this.state.algoExpectedId = e.to);
};
e.prototype.onDealTrait = function(t) {
if (t.length > 0 && this.state.algoExpectedId != hs.OFFER_TYPE_BASE.NONE) {
var e = t[0].algorithmId, o = this.PRIORITY_ALGORITHMS.find(function(t) {
return t.type === e;
});
o && (this.state.algoExpectedId = o.type);
}
};
return s([ classId("CTRefactorAlgoNameIOSTrait") ], e);
}(Trait);
o.CTRefactorAlgoNameIOSTrait = h;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgoNameIOSTrait" ]);
//# sourceMappingURL=index.js.map
