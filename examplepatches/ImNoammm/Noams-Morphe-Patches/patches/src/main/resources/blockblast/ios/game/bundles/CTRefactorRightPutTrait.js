window.__require = function t(e, o, r) {
function a(n, s) {
if (!o[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var h = o[n] = {
exports: {}
};
e[n][0].call(h.exports, function(t) {
return a(e[n][1][t] || t);
}, h, h.exports, t, e, o, r);
}
return o[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < r.length; n++) a(r[n]);
return a;
}({
CTRefactorRightPutTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "80cc1F8LrROl7M2PA0ZuYVo", "CTRefactorRightPutTrait");
var r, a = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, o, r) {
var a, i = arguments.length, n = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, o, n) : a(e, o)) || n);
return i > 3 && n && Object.defineProperty(e, o, n), n;
}, n = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, o = e && t[e], r = 0;
if (o) return o.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && r >= t.length && (t = void 0);
return {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorRightPutTrait = void 0;
var s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.putData = [];
e.reportData = null;
e.isHard = !1;
e.isRightPut = !1;
e.coldStartClearOnce = !1;
e.isSaveAllPutDataWithoutFilter = !1;
e.RIGHT_PUT_OFFER_TYPES = [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.KUN_NAN_TI, hs.OFFER_TYPE.ZHI_JUE_NAN_TI, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.ALGO_QUICK, hs.OFFER_TYPE.IOS_FILL_BLANK_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_NOT_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_NOT_BIT_REVERSE, hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING, hs.OFFER_TYPE.FEAT_PERFECT_TRANSLATE, hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT, hs.OFFER_TYPE.TRAVEL_ADD_RANDOM, hs.OFFER_TYPE.ALGO_REMOTE_23, hs.OFFER_TYPE.EMPTYDONGFILL ];
e.HARD_OFFER_TYPES = [ hs.OFFER_TYPE.KUN_NAN_TI, hs.OFFER_TYPE.ZHI_JUE_NAN_TI, hs.OFFER_TYPE.SI_WANG, hs.OFFER_TYPE.IOS_KUN_NAN_OPTIMIZE, hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4 ];
return e;
}
e.prototype.addCheckOfferTypeToOtherTypes = function(t) {
var e, o;
null !== (e = this.RIGHT_PUT_OFFER_TYPES) && void 0 !== e && e.includes(t) || null === (o = this.RIGHT_PUT_OFFER_TYPES) || void 0 === o || o.push(t);
};
e.prototype.isGameDataClear_Disk_ProxyResetBoardEffectData = function() {
this.resetData();
};
e.prototype.handleClassGame_ProxyOnIntoGame = function() {
this.coldStartClearOnce || this.resetData();
this.coldStartClearOnce = !0;
this.initReportData();
};
e.prototype.isClassGame_ProxyOnIntoGame = function(t) {
this.handleClassGame_ProxyOnIntoGame(t);
};
e.prototype.isChapterGame_ProxyOnChapterGameShow = function(t) {
this.handleClassGame_ProxyOnIntoGame(t);
};
e.prototype.isBoardEffect_ProxyOnTouchEnd = function(t) {
var e = t.args[0].state, o = e.touchBlockId, r = e.putPos;
this.checkBlock(o, this.getDstMovePos(r));
};
e.prototype.isEncourage_ProxyOnEncourageEffectsPlay = function(t) {
if (this.isRightPut) {
t.args[2] = 1e3;
t.args[2] = 0;
}
};
e.prototype.isClassScore_ProxyComputeScoreAddOption = function(t) {
var e, o = null === (e = this.props) || void 0 === e ? void 0 : e.scoreMultiple;
if (o && !(o <= 1)) {
var r = t.args[1].state, a = r.putPos, i = r.touchBlockId;
if (this.isOneBlockPutOnTheRightPosition(a, i)) {
var n = t.args[0], s = n.baseScore, c = Math.ceil(s * (o - 1));
n.baseScore += c;
var u = storage.getItem("classScore", 0);
storage.setItem("classScore", u + c);
}
}
};
e.prototype.isClassScoreInfoGetEliminateScore = function(t) {
var e, o = null === (e = this.props) || void 0 === e ? void 0 : e.scoreMultiple;
if (o && !(o <= 1)) {
var r = t.args[2];
if (r) {
var a = t.args[3].state, i = a.putPos, n = a.touchBlockId;
if (this.isOneBlockPutOnTheRightPosition(i, n)) {
var s = r * o;
t.args[2] = s;
}
}
}
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
this.saveBlock();
};
e.prototype.getDstMovePos = function(t) {
var e, o, r = 8, a = 8;
try {
for (var i = n(t), s = i.next(); !s.done; s = i.next()) {
var c = s.value;
c.x < r && (r = c.x);
c.y < a && (a = c.y);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (o = i.return) && o.call(i);
} finally {
if (e) throw e.error;
}
}
return new cc.Vec2(a, r);
};
e.prototype.resetData = function() {
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.getDefaultPutData());
};
e.prototype.getDefaultPutData = function() {
return [ {
id: 0,
row: 0,
col: 0,
check: 0,
isRight: 0
}, {
id: 0,
row: 0,
col: 0,
check: 0,
isRight: 0
}, {
id: 0,
row: 0,
col: 0,
check: 0,
isRight: 0
} ];
};
e.prototype.saveBlock = function() {
var t, e, o, r, a, i, n, s;
this.isRightPut = !1;
var c = hs.algorithmName.algoActualIdByPos, u = null !== (t = hs.algorithmInfo.blockIdList) && void 0 !== t ? t : [], h = null !== (e = hs.algorithmName.algoActualChangeName) && void 0 !== e ? e : [], l = null !== (o = hs.algorithmInfo.blockPosList) && void 0 !== o ? o : [];
this.isHard = this.HARD_OFFER_TYPES.includes(c);
this.putData = this.getDefaultPutData();
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
var f = !1;
[ hs.OFFER_TYPE.RANDOM_BLOCK_BOTTOM, hs.OFFER_TYPE.REPLACE_ROUNDLIMIT ].includes(c) && hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId] == hs.ALGO_NAME_TYPE.NAME_BLANK && (f = !0);
f = this.isChangeRightPut(f);
if (this.RIGHT_PUT_OFFER_TYPES.includes(c) || this.isSaveAllPutDataWithoutFilter || f) {
if (3 != u.length || 3 != l.length || 3 != h.length) return;
for (var p = 0; p < 3; p++) {
this.putData[p].id = null !== (r = u[p]) && void 0 !== r ? r : 0;
this.putData[p].row = null !== (i = null === (a = l[p]) || void 0 === a ? void 0 : a.row) && void 0 !== i ? i : 0;
this.putData[p].col = null !== (s = null === (n = l[p]) || void 0 === n ? void 0 : n.col) && void 0 !== s ? s : 0;
this.putData[p].check = 1;
this.putData[p].isRight = 0;
}
}
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
};
e.prototype.isChangeRightPut = function(t) {
return t;
};
e.prototype.checkBlock = function(t, e) {
var o, r;
this.putData = hs.boardEffectInfo.getBlockPutData("BlockPutData");
try {
for (var a = n(this.putData), i = a.next(); !i.done; i = a.next()) {
var s = i.value;
if (s.id == t && s.row == e.y && s.col == e.x && 1 == s.check && 0 == s.isRight) {
s.isRight = 1;
break;
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
i && !i.done && (r = a.return) && r.call(a);
} finally {
if (o) throw o.error;
}
}
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
if (3 == hs.blocksProducerInfo.producerBlocks.filter(function(t) {
return -1 === t;
}).length && (this.putData.every(function(t) {
return 1 === t.isRight && 1 === t.check;
}) || this.isHard)) {
this.isRightPut = !0;
this.setReportDataOnRightPut();
this.showPerfectEffectAndAudio();
}
};
e.prototype.showPerfectEffectAndAudio = function() {
this.setLastPerfectRecord();
this.playPerfectEffect();
};
e.prototype.playPerfectEffect = function() {
hs.ResLoader.load(hs.PrefabConfig.RightPutPerfect.url, cc.Prefab, function(t, e) {
if (t) ; else if (null === cc || void 0 === cc ? void 0 : cc.winSize) {
var o = cc.instantiate(e);
o.x = cc.winSize.width / 2;
o.y = cc.winSize.height / 2 + 100;
if (cc.isValid(hs.gameEffectLayer)) {
hs.gameEffectLayer.addChild(o, 100);
o.getComponent(dragonBones.ArmatureDisplay).addEventListener(dragonBones.EventObject.COMPLETE, function() {
cc.isValid(o) && o.destroy();
}, null);
hs.audioInfo.play(hs.AudioConfig.putRightPerfect);
}
}
});
};
e.prototype.initReportData = function() {
this.reportData = this.getReportData();
if (this.reportData.gameNum != hs.gameInfo.gameNum) {
this.reportData.gameNum = hs.gameInfo.gameNum;
this.reportData.putNum = 0;
this.saveReportData(this.reportData);
}
};
e.prototype.getReportData = function() {
return storage.getItem("RightPutData", {
gameNum: -1,
putNum: 0
});
};
e.prototype.saveReportData = function(t) {
storage.setItem("RightPutData", t);
};
e.prototype.setReportDataOnRightPut = function() {
if (this.reportData) {
this.reportData.putNum++;
this.saveReportData(this.reportData);
}
};
e.prototype.getReportIsRightPut = function() {
return this.isRightPut;
};
e.prototype.getReportPutNum = function() {
var t, e;
return null !== (e = null === (t = this.reportData) || void 0 === t ? void 0 : t.putNum) && void 0 !== e ? e : 0;
};
e.prototype.isOneBlockPutOnTheRightPosition = function(t, e) {
var o, r, a = this.getDstMovePos(t);
try {
for (var i = n(this.putData), s = i.next(); !s.done; s = i.next()) {
var c = s.value;
if (c.id == e && c.row == a.y && c.col == a.x && 1 == c.check) return !0;
}
} catch (t) {
o = {
error: t
};
} finally {
try {
s && !s.done && (r = i.return) && r.call(i);
} finally {
if (o) throw o.error;
}
}
return !1;
};
e.prototype.setLastPerfectRecord = function() {
this.setState({
lastPerfectGameMode: hs.gameInfo.gameMode,
lastPerfectGameNum: hs.gameInfo.gameNum,
lastPerfectRound: hs.gameInfo.roundNum
});
};
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
return i([ classId("CTRefactorRightPutTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorRightPutTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRightPutTrait" ]);
//# sourceMappingURL=index.js.map
