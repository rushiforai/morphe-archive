window.__require = function t(e, o, r) {
function n(i, s) {
if (!o[i]) {
if (!e[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var h = o[i] = {
exports: {}
};
e[i][0].call(h.exports, function(t) {
return n(e[i][1][t] || t);
}, h, h.exports, t, e, o, r);
}
return o[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < r.length; i++) n(r[i]);
return n;
}({
CTRefactorOpenChangeContinueHardTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "e3f1ed7wSlFkZZD9lNy2aQT", "CTRefactorOpenChangeContinueHardTrait");
var r, n = this && this.__extends || (r = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, o, r) {
var n, a = arguments.length, i = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, o, i) : n(e, o)) || i);
return a > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorOpenChangeContinueHardTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isTkXiaoChuSuccess = !1;
return e;
}
Object.defineProperty(e.prototype, "consecutiveTimes", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("OpenChangeContinueHardTrait", "consecutiveTimes", this.props, 2);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "replaceAlgorithm", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("OpenChangeContinueHardTrait", "replaceAlgorithm", this.props, hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU);
},
enumerable: !1,
configurable: !0
});
e.prototype.loadState = function() {
return hs.storage.getItem("OpenChangeContinueHardTraitState", {}) || {};
};
e.prototype.saveState = function(t) {
hs.storage.setItem("OpenChangeContinueHardTraitState", t);
};
e.prototype.isCountReached = function() {
return (this.loadState().hardSuccessContinueNum || 0) == this.consecutiveTimes;
};
e.prototype.isCountExceeded = function() {
return (this.loadState().hardSuccessContinueNum || 0) == this.consecutiveTimes + 1;
};
e.prototype.isCurrentAlgoRandomOrShang3 = function() {
var t = hs.algorithmName.algoActualName;
return t.every(function(t) {
return t == hs.ALGO_NAME_TYPE.NAME_RANDOM;
}) || t.every(function(t) {
return t == hs.ALGO_NAME_TYPE.NAME_SHANG3;
});
};
e.prototype.onAlgorithmStrategyGameNewInit = function() {
if (hs.gameInfo.gameMode == hs.GameMode.Class) {
var t = hs.storage.getItem("classGameNum", 0), e = this.loadState();
e.gameNum = t;
e.lastRoundNum = null;
e.hardSuccessContinueNum = 0;
this.saveState(e);
}
};
e.prototype.onAlgorithmStrategySDKComplete = function(t) {
if (hs.gameInfo.gameMode == hs.GameMode.Class && t) {
var e = hs.storage.getItem("classGameNum", 0), o = hs.storage.getItem("classRoundNum", 0), r = this.loadState(), n = !1;
if (r.gameNum != e) {
r.gameNum = e;
r.lastRoundNum = null;
r.hardSuccessContinueNum = 0;
n = !0;
}
if (r.lastRoundNum != o && hs.isValueInEnum(hs.algorithmName.algoActualId, hs.OFFER_TYPE_DIFFICULTY)) {
r.hardSuccessContinueNum = (r.hardSuccessContinueNum || 0) + 1;
r.lastRoundNum = o;
n = !0;
}
n && this.saveState(r);
}
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
if (hs.gameInfo.gameMode == hs.GameMode.Class) {
var t = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT];
hs.algorithmName.algoActualName.some(function(t) {
return "旅行小保底" === t;
}) && as.AlgorithmStrategyAlgoActualNamePatch.patch([ t, t, t ], this);
if (this.isTkXiaoChuSuccess) {
this.isTkXiaoChuSuccess = !1;
hs.algorithmName.algoActualId == hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT && as.AlgorithmStrategyAlgoActualNamePatch.patch([ t, t, t ], this);
}
}
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
if (hs.gameInfo.gameMode != hs.GameMode.Class) return buildLazyConditionContext({});
var o = this.isCountReached(), r = this.isCountExceeded(), n = this.isCurrentAlgoRandomOrShang3(), a = o && n || r, i = a ? hs.algorithmStrategyIOSBlankRefactoredInfo.offerBitTravelTianKongXiaoChu() : [];
if (a) {
var s;
(s = this.loadState()).hardSuccessContinueNum = 0;
this.saveState(s);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, this);
this.isTkXiaoChuSuccess = !0;
}
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(e.canRunAfterOffer(t), "是否可运行 After 后置段");
},
isCountReached: function() {
return ASContext(o, "连续难题次数==阈值N");
},
isCountExceeded: function() {
return ASContext(r, "连续难题次数==N+1（兜底）");
},
isAlgoRandomOrShang3: function() {
return ASContext(n, "当前算法全部为随机或上3");
},
replaceAlgo: function() {
return ASContext(i, "替换算法ID");
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
fact: "isCountReached",
operator: "=",
value: !0
}, {
fact: "isAlgoRandomOrShang3",
operator: "=",
value: !0
} ]
},
gameMode: "class",
flow: "replaceWithTravel"
}, {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "isCountExceeded",
operator: "=",
value: !0
} ]
},
gameMode: "class",
flow: "replaceWithTravel"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
replaceWithTravel: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "replaceAlgo"
} ]
} ]
};
};
e.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.TAG = "[CTRefactorOpenChangeContinueHardTrait][连续难题替换]";
return a([ classId("CTRefactorOpenChangeContinueHardTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorOpenChangeContinueHardTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorOpenChangeContinueHardTrait" ]);
//# sourceMappingURL=index.js.map
