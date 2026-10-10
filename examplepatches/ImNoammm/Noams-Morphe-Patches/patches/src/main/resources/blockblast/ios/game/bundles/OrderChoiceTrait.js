window.__require = function t(e, r, o) {
function i(n, a) {
if (!r[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var h = "function" == typeof __require && __require;
if (!a && h) return h(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var l = r[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return i(e[n][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
OrderChoiceTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6c96deiObFJhKIjO6DzwqZr", "OrderChoiceTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), s = this && this.__decorate || function(t, e, r, o) {
var i, s = arguments.length, n = s < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (n = (s < 3 ? i(n) : s > 3 ? i(e, r, n) : i(e, r)) || n);
return s > 3 && n && Object.defineProperty(e, r, n), n;
}, n = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, i, s = r.call(t), n = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = s.next()).done; ) n.push(o.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
o && !o.done && (r = s.return) && r.call(s);
} finally {
if (i) throw i.error;
}
}
return n;
}, a = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(n(arguments[e]));
return t;
}, c = this && this.__values || function(t) {
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
r.OrderChoiceTrait = void 0;
var h = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isReplaceSuc = !1;
e._isFromMyself = !1;
e._isInPercent = !1;
e._successCount = -1;
e.LOCALSTORAGE_KEY = "orderDecision_successCount";
e._isNextReplace = !1;
e._step2Ratio = 0;
return e;
}
e.prototype.onActive = function(t) {
var e;
(hs.tp.isClassAlgorithmLifeCycle_GameStart_ProxyOnGameStart(t) || hs.tp.isClassAlgorithmStrategyIOS_Deal_ProxyResetAlgorithmData(t)) && this.isOpenReplaceStep3() && this.initReplaceStep3();
hs.tp.isClassAlgorithmLifeCycle_Revive_ProxyOnRevive_Success(t) && this.isOpenReplaceStep3() && this.resetReplaceStep3();
if (hs.tp.isAlgorithmStrategyIOSRandomInfoLaneRandomClass(t) && t.args[1] && t.args[1].lane && this.changeSuijiRandomLane()) {
t.args[0] = [ hs.OFFER_TYPE.ORDER_CHIOCE ];
this.setOfferState();
t.returnState = !0;
}
if (hs.tp.isAlgorithmStrategyIOSShangInfoReplaceClass(t) && hs.gameInfo.gameMode === hs.GameMode.Class && this.isReplace()) {
var r = t.args[0], o = hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT;
if (hs.algorithmStrategyLogic.haveAlgorithms(r, [ o ])) {
t.args[0] = hs.algorithmStrategyLogic.replaceAlgorithmType(r, o, hs.OFFER_TYPE.ORDER_CHIOCE);
this.setOfferState();
}
}
if ((hs.tp.isAlgorithmStrategyIOSShangInfoReplace100DifClassToNoBitShangZeng3(t) || hs.tp.isAlgorithmStrategyIOSShangInfoGetDayNightLess3000DifClassToNoBitShangZeng3(t) || hs.tp.isAlgorithmStrategyIOSShangInfoGetDayNightMore3000DifClassToNoBitShangZeng3(t) || hs.tp.isAlgorithmStrategyIOSRandomInfoPuzzleFailTimingBase(t)) && hs.gameInfo.gameMode === hs.GameMode.Class && this.isReplace()) {
r = t.args[0];
hs.algorithmStrategyLogic.insertAlgorithms(r, [ hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT ], hs.OFFER_TYPE.ORDER_CHIOCE);
this.setOfferState();
t.args[0] = r;
}
if (hs.tp.isClassAlgorithmStrategyIOS_Priority_ProxyOnAlgorithmStrategyPriority(t) && this.isNextReplace()) {
var i = hs.algorithmStrategyInfo.algorithmPriorityList, s = this.nextOffer();
i.push.apply(i, a(s));
hs.algorithmStrategyInfo.setAlgorithmPriorityList(i);
}
if (hs.tp.isClassAlgorithmLifeCycle_TouchEnd_ProxyOnTouchEnd(t)) {
var n = null === (e = t.args[0]) || void 0 === e ? void 0 : e.state, c = n.touchBlockId, h = n.putPos;
this.isOpenReplaceStep3() && this.getMinEdgesPos(c, h);
}
};
e.prototype.isNextReplace = function() {
this._isNextReplace = !1;
var t = hs.storage.getItem("isNextReplace", {
gameId: 0,
isNextReplace: !1
});
t.gameId == hs.gameInfo.gameNum && t.isNextReplace && (this._isNextReplace = !0);
return this._isNextReplace;
};
e.prototype.setOfferState = function() {
this._isNextReplace = !0;
this.isReplaceSuc = !0;
hs.algorithmStrategyIOSSameMoreRoundInfo.setIsTrigger(!0);
};
e.prototype.nextOffer = function() {
this._isNextReplace = !1;
var t = {
gameId: hs.gameInfo.gameNum,
isNextReplace: !1
};
hs.storage.setItem("isNextReplace", t);
if (this.replaceStep3()) {
this._isFromMyself = !0;
return this.addBlock();
}
var e = new hs.BinaryBoard();
e.convertToBinaryBoard(hs.boardInfo.faceBlocks);
e.record();
if (this.getRatio(e) >= this._step2Ratio) {
this._isFromMyself = !0;
return hs.algorithmStrategyIOSBlankInfo.offerNoBit();
}
this._isFromMyself = !0;
return this.changeNextOfferFail();
};
e.prototype.changeNextOfferFail = function(t) {
void 0 === t && (t = !1);
return t ? [] : hs.algorithmStrategyIOSShangInfo.dealShangZeng3();
};
e.prototype.isReplace = function(t) {
var e, r;
void 0 === t && (t = 0);
this.isReplaceSuc = !1;
hs.algorithmStrategyIOSSameMoreRoundInfo.setIsTrigger(!1);
if (this._isFromMyself) {
this._isFromMyself = !1;
return !1;
}
var o = (null === (e = this.props) || void 0 === e ? void 0 : e.percent) || 50;
t > 0 && (o = t);
0 === (null === (r = this.props) || void 0 === r ? void 0 : r.percent) && (o = 0);
var i = 100 * Math.random();
this._isInPercent = i < o;
return this._isInPercent;
};
e.prototype.changeSuijiRandomLane = function(t) {
void 0 === t && (t = !0);
return !!t;
};
e.prototype.getRatio = function(t) {
var e = t.getEdgeGameNum();
return (64 - t.getEmptyNumObj()) / e;
};
e.prototype.replaceStep3 = function() {
var t;
return (null === (t = this.props) || void 0 === t ? void 0 : t.replaceStep3) || !1;
};
e.prototype.isOpenReplaceStep3 = function() {
return this.isReplaceSuc && this.replaceStep3();
};
e.prototype.initReplaceStep3 = function() {
this.isNewRound() && this.setSuccessCount(0);
};
e.prototype.resetReplaceStep3 = function() {
this.setSuccessCount(0);
};
e.prototype.isNewRound = function() {
var t = hs.blocksProducerInfo.producerBlocks;
return !t || 0 === t.length || !!t.every(function(t) {
return -1 === t;
}) || t.every(function(t) {
return -1 !== t;
});
};
e.prototype.getSuccessCount = function() {
-1 == this._successCount && (this._successCount = hs.storage.getItem(this.LOCALSTORAGE_KEY, 0));
return this._successCount;
};
e.prototype.setSuccessCount = function(t) {
if (t != this._successCount) {
this._successCount = t;
hs.storage.setItem(this.LOCALSTORAGE_KEY, t);
}
};
e.prototype.isSuccess = function() {
return this.getSuccessCount() >= 2;
};
e.prototype.addBlock = function() {
return this.isSuccess() ? hs.algorithmStrategyIOSBlankInfo.offerNoBit() : hs.algorithmStrategyIOSShangInfo.dealShangZeng3();
};
e.prototype.getMinEdgesPos = function(t, e) {
var r, o, i, s, n = new hs.BinaryBoard();
n.convertToBinaryBoard(hs.boardInfo.faceBlocks);
n.record();
var a = n.getCanPutPoss(t), h = Infinity, l = [];
try {
for (var u = c(a), p = u.next(); !p.done; p = u.next()) {
var f = p.value, g = n.clone();
g.putBlock(t, f);
var y = g.getEdgeGameNum();
if (y < h) {
h = y;
l = [ f ];
} else y === h && l.push(f);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
p && !p.done && (o = u.return) && o.call(u);
} finally {
if (r) throw r.error;
}
}
for (var S = [], d = 0; d < e.length; d++) {
var _ = this.changePosTpBinPos(e[d].y, e[d].x, t);
-1 == _.indexOf(-1) && S.push(cc.v2(_[0], _[1]));
}
S.sort(function(t, e) {
return t.x == e.x ? t.y - e.y : t.x - e.x;
});
n.putBlock(t, S[0]);
n.record();
var m = {
success: !1,
x: 0,
y: 0
};
try {
for (var v = c(l), O = v.next(); !O.done; O = v.next()) {
var R = O.value;
if (R.equals(S[0])) {
m.success = !0;
m.x = R.x;
m.y = R.y;
}
}
} catch (t) {
i = {
error: t
};
} finally {
try {
O && !O.done && (s = v.return) && s.call(v);
} finally {
if (i) throw i.error;
}
}
m.success && this.setSuccessCount(this.getSuccessCount() + 1);
return l;
};
e.prototype.changePosTpBinPos = function(t, e, r) {
var o = hs.BlockShapeMap[r];
if (!o) return [ t, e ];
for (var i = 0; i < o.shape.length; i++) {
var s = o.shape[i].toString(2).padStart(o.width, "0").indexOf("1");
if (-1 !== s) return [ t - s, e ];
}
return [ t, e ];
};
s([ hs.Algorithm() ], e.prototype, "onActive", null);
return s([ classId("OrderChoiceTrait"), classMethodWatch() ], e);
}(Trait);
r.OrderChoiceTrait = h;
cc._RF.pop();
}, {} ]
}, {}, [ "OrderChoiceTrait" ]);
//# sourceMappingURL=index.js.map
