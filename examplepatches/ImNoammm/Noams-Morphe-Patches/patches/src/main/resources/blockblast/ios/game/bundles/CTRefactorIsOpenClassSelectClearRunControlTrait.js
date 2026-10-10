window.__require = function t(e, r, o) {
function n(i, l) {
if (!r[i]) {
if (!e[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!e[s]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var c = r[i] = {
exports: {}
};
e[i][0].call(c.exports, function(t) {
return n(e[i][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorIsOpenClassSelectClearRunControlTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "3b305mobUpNh71Cfqz0Doeu", "CTRefactorIsOpenClassSelectClearRunControlTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var n, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, r, i) : n(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
}, i = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, a = r.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = a.next()).done; ) i.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = a.return) && r.call(a);
} finally {
if (n) throw n.error;
}
}
return i;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(i(arguments[e]));
return t;
}, s = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, r = e && t[e], o = 0;
if (r) return r.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorIsOpenClassSelectClearRunControlTrait = void 0;
var u = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.lastBlockIds = [];
return e;
}
e.prototype.isClassBoard_ProxyOnClearScreen = function() {
this.handleGpClearScreen();
};
e.prototype.isClassBoardSplashAnimation_ProxyTriggerClearScreen = function() {
this.handleIosTriggerClearScreen();
};
e.prototype.handleGpClearScreen = function() {};
e.prototype.handleIosTriggerClearScreen = function() {
hs.classGuideInfo.isFinishedGuide && this.increaseClearNumber();
};
e.prototype.increaseClearNumber = function() {
var t = this.clearNumber;
storage.setItem("ClassSelectClearRunControlKey", t + 1);
};
e.prototype.onAlgorithmStrategyGameNewInit = function() {
storage.setItem("ClassSelectClearRunControlKey", 0);
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
var t = hs.algorithmInfo.blockIdList;
if (Array.isArray(t)) {
hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.HISTORY_CLEAR_BOARD];
storage.setItem("ClassSelectClearRunControOldRoundBlocks", t);
}
};
e.prototype.onPostSdkResult = function(t, e) {
var r, o;
if ((null === (r = t.sdk) || void 0 === r ? void 0 : r.SDK_SUCCESS) && e === this.traitName) {
var n = null === (o = t.sdk) || void 0 === o ? void 0 : o.blockIds;
if (n && Array.isArray(n) && 0 !== n.length) {
var a = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.HISTORY_CLEAR_BOARD];
if (hs.algorithmName.algoActualName.includes(a)) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.HISTORY_CLEAR_BOARD, this);
this.saveHistoryClearGameNum();
}
}
}
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(e.canRunAfterOffer(t), "是否可运行 After 后置段");
},
canUseHistoryClearBoard: function() {
return ASContext(e.canUseHistoryClearBoardAlgorithm(), "历史盘面清屏算法条件满足");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canUseHistoryClearBoard",
operator: "=",
value: !0
} ]
},
flow: "historyClearBoard"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
historyClearBoard: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.HISTORY_CLEAR_BOARD ]
} ]
};
};
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
return buildLazyConditionContext({
isHistoryClearBoard: function() {
return ASContext((null == r ? void 0 : r.algorithmId) === hs.OFFER_TYPE_BASE.HISTORY_CLEAR_BOARD, "是否历史盘面清屏算法");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isHistoryClearBoard",
operator: "=",
value: !0
},
flow: "setBlockIds"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = l(this.oldBlockList);
return {
setBlockIds: function() {
return {
extra: {
traits: {
blockIds: t
}
}
};
}
};
};
Object.defineProperty(e.prototype, "oldBlockList", {
get: function() {
return storage.getItem("ClassSelectClearRunControOldRoundBlocks", []);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "historyClearGameNum", {
get: function() {
return storage.getItem("ClassSelectClearRunKey", {
gameNum: -1,
roundNum: -1
});
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "clearNumber", {
get: function() {
return storage.getItem("ClassSelectClearRunControlKey", 0);
},
enumerable: !1,
configurable: !0
});
e.prototype.saveHistoryClearGameNum = function() {
var t = hs.classGameInfo, e = t.roundNum, r = t.gameNum;
storage.setItem("ClassSelectClearRunKey", {
roundNum: e,
gameNum: r
});
};
e.prototype.canRunAfterOffer = function() {
return !(1 === storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.getAvoidAlgoList = function(t) {
return t;
};
e.prototype.traitIgnoreHistoryClearBoardAlgorithm = function() {
return !1;
};
e.prototype.canUseHistoryClearBoardAlgorithm = function() {
var t, e;
if (this.traitIgnoreHistoryClearBoardAlgorithm()) return !1;
var r = hs.algorithmName.algoActualName[0];
if ("string" == typeof r && r.length > 0) {
var o = this.getAvoidAlgoList([]);
if (Array.isArray(o) && o.length > 0) try {
for (var n = s(o), a = n.next(); !a.done; a = n.next()) {
var i = a.value;
if (r.includes(i)) return !1;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = n.return) && e.call(n);
} finally {
if (t) throw t.error;
}
}
}
var l = hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks), u = hs.classGameInfo, c = u.roundNum, f = u.gameNum;
if (l > 400) return !1;
if (c - 1 < 5) return !1;
if (this.clearNumber > 3) return !1;
var p = this.historyClearGameNum;
return !p || -1 === p.gameNum && -1 === p.roundNum || f !== p.gameNum || c !== p.roundNum + 1;
};
return a([ classId("CTRefactorIsOpenClassSelectClearRunControlTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorIsOpenClassSelectClearRunControlTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsOpenClassSelectClearRunControlTrait" ]);
//# sourceMappingURL=index.js.map
