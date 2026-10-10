window.__require = function t(e, r, o) {
function a(s, l) {
if (!r[s]) {
if (!e[s]) {
var n = s.split("/");
n = n[n.length - 1];
if (!e[n]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(n, !0);
if (i) return i(n, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = n;
}
var h = r[s] = {
exports: {}
};
e[s][0].call(h.exports, function(t) {
return a(e[s][1][t] || t);
}, h, h.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) a(o[s]);
return a;
}({
ColdStartClearBoardTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "e0f9ai3xtXk86KxwNno96a1", "ColdStartClearBoardTrait");
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
var a, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (s = (i < 3 ? a(s) : i > 3 ? a(e, r, s) : a(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, a, i = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) s.push(o.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (a) throw a.error;
}
}
return s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ColdStartClearBoardTrait = void 0;
var l = t("../../../../../scripts/modules/algorithm/type/AlgorithmType"), n = t("../../../../../scripts/modules/algorithmStrategy/config/AlgorithmStrategyConfig"), u = t("../../../../../scripts/modules/algorithmStrategy/type/AlgorithmStrategyType"), h = t("../../../../../scripts/modules/algorithmStrategy/vo/AlgorithmStrategyBlocksPosInfo"), f = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.coldStart = Date.now();
e.offerResult = null;
e.boardColor = -1;
e.featureData = null;
e.originalBoard = null;
e.shouldCallAlgorithm = !1;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassDefaultBoard_Proxy",
methodName: "onProduceClassDefaultBoard"
}, {
className: "ClassDefaultBoard_Proxy",
methodName: "produceDefaultBoard"
}, {
className: "ClassAlgorithmStrategyIOS_Deal_Proxy",
methodName: "triggerFirstRoundTrait"
}, {
className: "ClassAlgorithmStrategy_Deal_Proxy",
methodName: "triggerSpecialTrait"
}, {
className: "AlgorithmProcessInfo",
methodName: "triggerAlgorithmResult"
}, {
className: "ClassBlockOutStrategy_Proxy",
methodName: "modifyBlockOutResult"
}, {
className: "ClassScore_Proxy",
methodName: "isUnlockClearScreenEffect"
}, {
className: "ClassBoardSplashAnimation_Proxy",
methodName: "isUnlockClearScreenEffect"
} ];
};
e.prototype.onActive = function(t) {
if (this.isTrigger()) {
if (hs.tp.isClassDefaultBoard_ProxyOnProduceClassDefaultBoard(t)) {
if (this.isForbidenByOtherTrait()) return;
this.onGameStart(t);
}
hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoard(t) && this.onProduceDefaultBoard(t);
hs.tp.isClassAlgorithmStrategyIOS_Deal_ProxyTriggerFirstRoundTrait(t) && this.onTriggerFirstRoundTrait(t);
hs.tp.isAlgorithmProcessInfoTriggerAlgorithmResult(t) && this.onTriggerAlgorithmResult(t);
if (hs.tp.isClassBlockOutStrategy_ProxyModifyBlockOutResult(t)) {
if (!this.updateModifyBlockOutResult(!0)) return;
this.onModifyBlockOutResult(t);
}
hs.tp.isClassScore_ProxyIsUnlockClearScreenEffect(t) && this.onUnlockClearScreenEffect(t);
hs.tp.isClassBoardSplashAnimation_ProxyIsUnlockClearScreenEffect(t) && this.onUnlockClearScreenEffect(t);
}
};
e.prototype.isTrigger = function() {
return !0;
};
e.prototype.onGameStart = function(t) {
this.shouldCallAlgorithm = !1;
this.originalBoard = null;
this.offerResult = null;
t.args[0].data.newGame && (hs.storage.getItem("classGuideStep", 0) < 3 || this.init());
};
e.prototype.init = function() {
this.featureData = this.getData();
this.reset();
var t = hs.classGameInfo.gameNum;
if (this.featureData.gameNum !== t) {
this.featureData.gameNum = t;
this.featureData.trigger = !1;
this.saveData(this.featureData);
this.checkShouldTrigger() && (this.shouldCallAlgorithm = !0);
}
};
e.prototype.reset = function() {
if (this.featureData) {
var t = this.featureData.coldStartTime, e = hs.classGameInfo.gameNum;
if (this.isSameDay(t, this.coldStart)) {
if (this.featureData.triggerNum < 3 && this.featureData.triggerGameNum > 0 && this.featureData.triggerGameNum < e) {
this.featureData.triggerGameNum;
this.featureData.triggerGameNum = this.getTriggerGameNum(this.featureData.triggerNum);
this.saveData(this.featureData);
}
} else {
this.featureData.coldStartTime = this.coldStart;
this.featureData.triggerNum = 0;
this.featureData.triggerGameNum = this.getTriggerGameNum(0);
this.featureData.trigger = !1;
this.saveData(this.featureData);
}
}
};
e.prototype.checkShouldTrigger = function() {
return !!this.featureData && this.featureData.gameNum === this.featureData.triggerGameNum && !this.featureData.trigger;
};
e.prototype.isOffered = function() {
return !!this.featureData && this.featureData.trigger && null !== this.offerResult && 3 === this.offerResult.ids.length;
};
e.prototype.onProduceDefaultBoard = function(t) {
if (this.shouldCallAlgorithm) {
var e = t.args[0];
this.originalBoard = JSON.parse(JSON.stringify(e));
this.isNeedUpdateBoardInfo(!0) && (t.args[0] = hs.boardInfo.NULL);
}
};
e.prototype.onTriggerFirstRoundTrait = function(t) {
if (this.shouldCallAlgorithm && this.updateContinuesSetAlgorithm(!0)) if (hs.storage.getItem("DailyFirstManualBoardApplied", !1)) this.shouldCallAlgorithm = !1; else {
var e = TRAIT("InitBoardTimingAdjTrait");
if ((null == e ? void 0 : e.active) && hs.storage.getItem("InitBoardTimingAdjUseEmptyBoard", !1)) {
this.shouldCallAlgorithm = !1;
return;
}
hs.algorithmStrategyInfo.setAlgorithmList([ l.OFFER_TYPE.COLD_START_CLEAR_BOARD ]);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoTrait);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel2(this.traitName);
t.returnState = !0;
}
};
e.prototype.onTriggerAlgorithmResult = function(t) {
if (this.shouldCallAlgorithm) {
var e = t.args[0];
(null == e ? void 0 : e.algoType) === hs.OFFER_ALGORITHM_SDK_TYPE[l.OFFER_TYPE.COLD_START_CLEAR_BOARD] ? this.handleAlgorithmSuccess(e) : this.handleAlgorithmFail();
}
};
e.prototype.handleAlgorithmSuccess = function(t) {
var e, r, o, a;
if (hs.storage.getItem("DailyFirstManualBoardApplied", !1)) this.shouldCallAlgorithm = !1; else {
var i = null !== (r = null === (e = t.extra) || void 0 === e ? void 0 : e.board) && void 0 !== r ? r : null === (a = null === (o = t.extra) || void 0 === o ? void 0 : o.selectComExtra) || void 0 === a ? void 0 : a.board;
if (i && Array.isArray(i) && 8 === i.length) {
this.offerResult = {
ids: t.blockIds || [],
poss: (t.blockPoses || []).map(function(t) {
return {
x: t.row,
y: t.col
};
}),
names: t.blockNames || []
};
this.getOfferBoard(i);
this.boardColor = this.extractBoardColor(i);
if (this.isNeedUpdateBoardInfo(!0)) {
this.updateBoardInfo(i);
this.updateFeatureDataUsed();
this.shouldCallAlgorithm = !1;
this.algorithmSuccessComplete();
}
} else this.handleAlgorithmFail();
}
};
e.prototype.algorithmSuccessComplete = function() {};
e.prototype.handleAlgorithmFail = function() {
if (hs.storage.getItem("DailyFirstManualBoardApplied", !1)) {
this.shouldCallAlgorithm = !1;
this.originalBoard = null;
} else if (this.originalBoard) {
if (this.isNeedUpdateBoardInfo(!0)) {
this.shouldCallAlgorithm = !1;
this.originalBoard = null;
}
} else this.shouldCallAlgorithm = !1;
};
e.prototype.extractBoardColor = function(t) {
for (var e = 0; e < t.length; e++) for (var r = 0; r < t[e].length; r++) {
var o = t[e][r];
if (o > 0 && o <= 7) return o;
}
return -1;
};
e.prototype.onModifyBlockOutResult = function() {
this.isOffered() && 1 === hs.classGameInfo.roundNum && this.offerResult && 3 === this.offerResult.ids.length && this.updateAlgorithmSuccess();
};
e.prototype.onUnlockClearScreenEffect = function(t) {
var e = hs.classGameInfo.roundNum;
if (this.isOffered() && 1 === e) {
t.returnValue = !0;
t.returnState = !0;
}
};
e.prototype.changeBlockColor = function(t) {
var e = this;
if (-1 !== this.boardColor) for (var r = [ 1, 2, 3, 4, 5, 6, 7 ], o = 0; o < t.length; o++) if (t[o] === this.boardColor) {
var a = r.filter(function(t) {
return t !== e.boardColor;
});
t[o] = a[Math.floor(Math.random() * a.length)];
}
};
e.prototype.getTriggerGameNum = function(t) {
var e, r = hs.classGameInfo.gameNum, o = hs.classGameInfo.roundNum, a = this.props, i = null !== (e = null == a ? void 0 : a.rounds) && void 0 !== e ? e : [ [ 1, 1 ], [ 1, 3 ], [ 3, 5 ] ];
if (t >= 0 && t < i.length) {
var l = s(i[t], 2), n = l[0], u = l[1], h = Math.floor(Math.random() * (u - n + 1)) + n;
return 0 === t && 0 === o ? r + h - 1 : r + h;
}
return -1;
};
e.prototype.isSameDay = function(t, e) {
if (t <= 0 || e <= 0) return !1;
var r = new Date(t), o = new Date(e);
return r.getFullYear() === o.getFullYear() && r.getMonth() === o.getMonth() && r.getDate() === o.getDate();
};
e.prototype.getData = function() {
var t = hs.storage.getItem("ColdStartClearBoard", null);
if (t) return t;
var e = {
gameNum: -1,
triggerGameNum: 0,
coldStartTime: 0,
triggerNum: 0,
trigger: !1
};
this.saveData(e);
return e;
};
e.prototype.saveData = function(t) {
hs.storage.setItem("ColdStartClearBoard", t);
};
e.prototype.isForbidenByOtherTrait = function() {
return !1;
};
e.prototype.updateBoardInfo = function(t) {
hs.storage.setItem("classFaceBlocks", t);
hs.storage.setItem("classInitialFaceBlocks", t);
hs.EventManager.dispatchModuleEvent(new hs.E_Board_GmRender(t));
};
e.prototype.isNeedUpdateBoardInfo = function(t) {
return t;
};
e.prototype.getOfferResult = function() {
return this.offerResult;
};
e.prototype.setOfferResult = function(t) {
this.offerResult = t;
};
e.prototype.setShouldCallAlgorithm = function(t) {
this.shouldCallAlgorithm = t;
};
e.prototype.startHandleBoard = function() {};
e.prototype.updateModifyBlockOutResult = function(t) {
return t;
};
e.prototype.updateAlgorithmSuccess = function() {
if (this.offerResult) {
hs.algorithmInfo.setBlockIdList(this.offerResult.ids);
3 === this.offerResult.poss.length && hs.algorithmInfo.setBlockPosList(this.offerResult.poss.map(function(t) {
return {
row: t.x,
col: t.y
};
}));
this.adjustBlocksPosMiddle();
}
};
e.prototype.adjustBlocksPosMiddle = function() {
h.algorithmStrategyBlocksPosInfo.adjustBlocksPosList(n.operaPosMiddle);
h.algorithmStrategyBlocksPosInfo.setBlocksPosList(u.OPERA_POS_TYPE.MIDDLE);
};
e.prototype.getOfferBoard = function(t) {
return t;
};
e.prototype.updateContinuesSetAlgorithm = function(t) {
return t;
};
e.prototype.updateFeatureDataUsed = function() {
if (this.featureData) {
this.featureData.trigger = !0;
this.featureData.triggerNum += 1;
this.featureData.triggerGameNum = this.getTriggerGameNum(this.featureData.triggerNum);
this.saveData(this.featureData);
}
};
e.prototype.getFeatureData = function() {
return this.featureData;
};
return i([ classId("ColdStartClearBoardTrait"), classMethodWatch() ], e);
}(Trait);
r.ColdStartClearBoardTrait = f;
cc._RF.pop();
}, {
"../../../../../scripts/modules/algorithm/type/AlgorithmType": void 0,
"../../../../../scripts/modules/algorithmStrategy/config/AlgorithmStrategyConfig": void 0,
"../../../../../scripts/modules/algorithmStrategy/type/AlgorithmStrategyType": void 0,
"../../../../../scripts/modules/algorithmStrategy/vo/AlgorithmStrategyBlocksPosInfo": void 0
} ]
}, {}, [ "ColdStartClearBoardTrait" ]);
//# sourceMappingURL=index.js.map
