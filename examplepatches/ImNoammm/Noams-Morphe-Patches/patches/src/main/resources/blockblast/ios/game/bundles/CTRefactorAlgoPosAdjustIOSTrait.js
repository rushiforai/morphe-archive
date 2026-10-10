window.__require = function s(o, t, e) {
function _(a, c) {
if (!t[a]) {
if (!o[a]) {
var I = a.split("/");
I = I[I.length - 1];
if (!o[I]) {
var L = "function" == typeof __require && __require;
if (!c && L) return L(I, !0);
if (r) return r(I, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = I;
}
var i = t[a] = {
exports: {}
};
o[a][0].call(i.exports, function(s) {
return _(o[a][1][s] || s);
}, i, i.exports, s, o, t, e);
}
return t[a].exports;
}
for (var r = "function" == typeof __require && __require, a = 0; a < e.length; a++) _(e[a]);
return _;
}({
CTRefactorAlgoPosAdjustIOSTrait: [ function(s, o, t) {
"use strict";
cc._RF.push(o, "2d060WYRANNcr+HD4MRfAc4", "CTRefactorAlgoPosAdjustIOSTrait");
var e, _ = this && this.__extends || (e = function(s, o) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(s, o) {
s.__proto__ = o;
} || function(s, o) {
for (var t in o) Object.prototype.hasOwnProperty.call(o, t) && (s[t] = o[t]);
})(s, o);
}, function(s, o) {
e(s, o);
function t() {
this.constructor = s;
}
s.prototype = null === o ? Object.create(o) : (t.prototype = o.prototype, new t());
}), r = this && this.__decorate || function(s, o, t, e) {
var _, r = arguments.length, a = r < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, t) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(s, o, t, e); else for (var c = s.length - 1; c >= 0; c--) (_ = s[c]) && (a = (r < 3 ? _(a) : r > 3 ? _(o, t, a) : _(o, t)) || a);
return r > 3 && a && Object.defineProperty(o, t, a), a;
}, a = this && this.__read || function(s, o) {
var t = "function" == typeof Symbol && s[Symbol.iterator];
if (!t) return s;
var e, _, r = t.call(s), a = [];
try {
for (;(void 0 === o || o-- > 0) && !(e = r.next()).done; ) a.push(e.value);
} catch (s) {
_ = {
error: s
};
} finally {
try {
e && !e.done && (t = r.return) && t.call(r);
} finally {
if (_) throw _.error;
}
}
return a;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.CTRefactorAlgoPosAdjustIOSTrait = void 0;
var c = function(s) {
_(o, s);
function o() {
return null !== s && s.apply(this, arguments) || this;
}
o.prototype.onAlgorithmStrategySDKComplete = function(s, o) {
s && Array.isArray(o.blockIds) && 3 === o.blockIds.length && (hs.gameInfo.gameMode == hs.GameMode.Class ? this.onClassBlocksPosInfo() : hs.gameInfo.gameMode == hs.GameMode.Chapter && this.onChapterBlocksPosInfo());
};
o.prototype.onClassBlocksPosInfo = function() {
var s = hs.OFFER_TYPE, o = hs.algorithmStrategyBlocksPosRefactoredInfo;
switch (hs.algorithmName.algoActualIdByPos) {
case s.IOS_FILL_BLANK_BIT:
case s.TIAN_KONG_XIAO_CHU:
case s.IOS_FILL_BLANK_NOT_BIT_REVERSE:
case s.ALL_COMBINATION_ID9:
case s.TRAVEL_FILL_FUNCTION_BIT:
case s.IOS_EMPTYDONGFILL:
case s.ORDER_FILL_ELIM:
case s.PRIORITY_BLOCK:
case s.ALGO_OPTIMAL_FILL_MAX_HOLE:
case s.ALGO_NEAR_THICKNESS_BLOCK_FILLING:
case s.ALGO_NEAR_THICKNESS_BLOCK_FILLING_IOS:
case s.ALGO_CLEAR_BOARD_GATHER:
case s.ALGO_FILL_AVG_NEAR_THICKNESS:
case s.ALGO_BLOCKWALL_PRIORITY:
case s.ALGO_EDGETICHNESSSHAPE_FIRST:
case s.ALGO_THICKNESS_AVERAGE:
case s.ALGO_MULIT_CLEAR_PLUS:
case s.BLIND_AREA_FILL_HARD:
case s.ALGO_SL_DIF:
o.adjustBlocksPosList(hs.operaPosMiddle);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RIGHT_LEFT);
break;

case s.ALGO_REMOTE_23:
var t = TRAIT("FixIosNewAlgorithmStrategy2Trait");
if (null == t ? void 0 : t.active) {
o.adjustBlocksPosList(hs.operaPosMiddle);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RIGHT_LEFT);
}
break;

case s.ALGO_DIFFICULT_DOWN:
o.adjustBlocksPosList(hs.operaPosMiddleLeft);
o.setBlocksPosList(hs.OPERA_POS_TYPE.LEFT);
break;

case s.IOS_FILL_BLANK_NOT_BIT:
case s.IOS_ZHI_JUE_NOT_BIT:
case s.IOS_KUN_NAN_OPTIMIZE:
case s.TIAN_KONG_XIAO_CHU_NO_BIT:
var e = hs.algorithmInfo.blockIdList.slice(), _ = hs.blockInfo.sortIdBlock(e.slice()).map(function(s) {
return e.indexOf(s);
});
o.adjustBlocksPosList(_);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RANDOM);
break;

case s.ALGO_SMALL_BLOCK_AFILL:
o.adjustBlocksPosList(hs.operaPosRightLeft);
o.setBlocksPosList(hs.OPERA_POS_TYPE.MIDDLE_LEFT);
break;

case s.ALGO_UPGRADE_FILL:
var r = hs.algorithmInfo.blockIdList;
if (3 === r.length) {
var c = r[1], I = r[2], L = a(hs.blockInfo.sortIdBlock([ c, I ]), 1)[0] === c ? 1 : 2;
o.adjustBlocksPosList([ 0, L, 3 - L ]);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RANDOM);
}
}
};
o.prototype.onChapterBlocksPosInfo = function() {
var s = hs.OFFER_TYPE, o = hs.algorithmStrategyBlocksPosRefactoredInfo;
switch (hs.algorithmName.algoActualIdByPos) {
case s.IOS_FILL_BLANK_BIT:
case s.TIAN_KONG_XIAO_CHU:
case s.IOS_FILL_BLANK_NOT_BIT_REVERSE:
case s.ALL_COMBINATION_ID9:
case s.TRAVEL_FILL_FUNCTION_BIT:
case s.IOS_EMPTYDONGFILL:
case s.ORDER_FILL_ELIM:
case s.ALGO_NEAR_THICKNESS_BLOCK_FILLING:
case s.ALGO_NEAR_THICKNESS_BLOCK_FILLING_IOS:
o.adjustBlocksPosList(hs.operaPosMiddle);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RIGHT_LEFT);
break;

case s.ALGO_DIFFICULT_DOWN:
o.adjustBlocksPosList(hs.operaPosMiddleLeft);
o.setBlocksPosList(hs.OPERA_POS_TYPE.LEFT);
break;

case s.IOS_FILL_BLANK_NOT_BIT:
case s.IOS_ZHI_JUE_NOT_BIT:
case s.IOS_KUN_NAN_OPTIMIZE:
case s.TIAN_KONG_XIAO_CHU_NO_BIT:
case s.TRAVEL_TIAN_KONG_XIAO_CHU:
var t = hs.algorithmInfo.blockIdList.slice(), e = hs.blockInfo.sortIdBlock(t.slice()).map(function(s) {
return t.indexOf(s);
});
o.adjustBlocksPosList(e);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RANDOM);
break;

case s.ALGO_UPGRADE_FILL:
var _ = hs.algorithmInfo.blockIdList;
if (3 === _.length) {
var r = _[1], c = _[2], I = a(hs.blockInfo.sortIdBlock([ r, c ]), 1)[0] === r ? 1 : 2;
o.adjustBlocksPosList([ 0, I, 3 - I ]);
o.setBlocksPosList(hs.OPERA_POS_TYPE.RANDOM);
}
}
};
return r([ classId("CTRefactorAlgoPosAdjustIOSTrait") ], o);
}(Trait);
t.CTRefactorAlgoPosAdjustIOSTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgoPosAdjustIOSTrait" ]);
//# sourceMappingURL=index.js.map
