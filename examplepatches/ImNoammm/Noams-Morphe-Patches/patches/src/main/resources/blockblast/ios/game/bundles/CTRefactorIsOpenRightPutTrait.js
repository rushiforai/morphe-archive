window.__require = function t(e, r, o) {
function i(n, s) {
if (!r[n]) {
if (!e[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var c = r[n] = {
exports: {}
};
e[n][0].call(c.exports, function(t) {
return i(e[n][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorIsOpenRightPutTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "5cb3azeiUdJtJsXmRcvneQ6", "CTRefactorIsOpenRightPutTrait");
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
}), a = this && this.__decorate || function(t, e, r, o) {
var i, a = arguments.length, n = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, r, n) : i(e, r)) || n);
return a > 3 && n && Object.defineProperty(e, r, n), n;
}, n = this && this.__values || function(t) {
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
r.CTRefactorIsOpenRightPutTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.putData = [];
e.isRightPut = !1;
e._rightPutEmitter = new hs.Emitter();
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "GameDataClear_Disk_Proxy",
methodName: "resetBoardEffectData"
}, {
className: "BoardEffect_Proxy",
methodName: "onTouchEnd"
}, {
className: "Encourage_Proxy",
methodName: "onEncourageEffectsPlay"
} ];
};
e.prototype.data = function() {
return {
lastPerfectGameMode: null,
lastPerfectGameNum: 0,
lastPerfectRound: 0
};
};
Object.defineProperty(e.prototype, "addAlgoArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("IsOpenRightPutTrait", "addAlgoArr", this.props, []);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "deleteAlgoArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("IsOpenRightPutTrait", "deleteAlgoArr", this.props, []);
},
enumerable: !1,
configurable: !0
});
e.prototype.isGameDataClear_Disk_ProxyResetBoardEffectData = function() {
this.resetData();
};
e.prototype.isBoardEffect_ProxyOnTouchEnd = function(t) {
var e = t.args[0].state, r = e.touchBlockId, o = e.putPos;
this.checkBlock(r, this.getDstMovePos(o));
};
e.prototype.isEncourage_ProxyOnEncourageEffectsPlay = function(t) {
this.isRightPut && (t.args[2] = 1e3);
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
this.saveBlock(t);
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
e.prototype.getDstMovePos = function(t) {
var e, r, o = 8, i = 8;
try {
for (var a = n(t), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
l.x < o && (o = l.x);
l.y < i && (i = l.y);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (r = a.return) && r.call(a);
} finally {
if (e) throw e.error;
}
}
return new cc.Vec2(i, o);
};
e.prototype.resetData = function() {
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.getDefaultPutData());
};
e.prototype.saveBlock = function(t) {
var e, r, o, i, a, n, s, l, u, c, h;
this.isRightPut = !1;
if (!(hs.storage.getItem("classRoundNum", 0) < 1 && hs.gameInfo.gameMode == hs.GameMode.Class)) {
this.putData = this.getDefaultPutData();
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
var f = this.getActualId(t);
if (this.shouldRecordPutData(f)) {
if ((!hs.checkExcludeRightPut.has(f) && !this.isInDeleteAlgoArr(f) || this.isInAddAlgoArr(f)) && (!(f == hs.OFFER_TYPE.SI_WANG && 4e3 == hs.algorithmName.algoExpectedId || this.isInDeleteAlgoArr(f)) || this.isInAddAlgoArr(f))) {
var d = null !== (r = null === (e = t.sdk) || void 0 === e ? void 0 : e.blockIds) && void 0 !== r ? r : [], p = null !== (i = null === (o = t.sdk) || void 0 === o ? void 0 : o.blockNames) && void 0 !== i ? i : [], g = null !== (n = null === (a = t.sdk) || void 0 === a ? void 0 : a.blockPoses) && void 0 !== n ? n : [];
if (3 == d.length && 3 == g.length) if (hs.isValueInEnum(f, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(f, hs.OFFER_TYPE_DIE)) {
for (var P = 0; P < 3; P++) {
this.putData[P].id = 0;
this.putData[P].row = 0;
this.putData[P].col = 0;
this.putData[P].check = 1;
this.putData[P].isRight = 0;
}
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
} else if (3 == p.length) {
for (P = 0; P < 3; P++) {
var y = p[P];
if ("随机" != y && "随机无死" != y && "" != y) {
this.putData[P].id = null !== (s = d[P]) && void 0 !== s ? s : 0;
this.putData[P].row = null !== (u = null === (l = g[P]) || void 0 === l ? void 0 : l.row) && void 0 !== u ? u : 0;
this.putData[P].col = null !== (h = null === (c = g[P]) || void 0 === c ? void 0 : c.col) && void 0 !== h ? h : 0;
this.putData[P].check = 1;
this.putData[P].isRight = 0;
}
}
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
}
}
} else hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
}
};
e.prototype.checkBlock = function(t, e) {
var r, o, i, a, s, l, u, c;
this.putData = hs.boardEffectInfo.getBlockPutData("BlockPutData");
var h = !1;
try {
for (var f = n(this.putData), d = f.next(); !d.done; d = f.next()) if (1 == (m = d.value).check) {
h = !0;
break;
}
} catch (t) {
r = {
error: t
};
} finally {
try {
d && !d.done && (o = f.return) && o.call(f);
} finally {
if (r) throw r.error;
}
}
if (0 != h) {
try {
for (var p = n(this.putData), g = p.next(); !g.done; g = p.next()) if ((m = g.value).id == t && m.row == e.y && m.col == e.x && 1 == m.check && 0 == m.isRight) {
m.isRight = 1;
break;
}
} catch (t) {
i = {
error: t
};
} finally {
try {
g && !g.done && (a = p.return) && a.call(p);
} finally {
if (i) throw i.error;
}
}
hs.boardEffectInfo.setBlockPutData("BlockPutData", this.putData);
if (3 == hs.blocksProducerInfo.producerBlocks.filter(function(t) {
return -1 === t;
}).length) {
var P = this.getActualId();
if (hs.isValueInEnum(P, hs.OFFER_TYPE_BLANK)) {
if ((hs.checkExcludeRightPut.has(P) || this.isInDeleteAlgoArr(P)) && !this.isInAddAlgoArr(P)) return;
try {
for (var y = n(this.putData), E = y.next(); !E.done; E = y.next()) if (1 == (m = E.value).check && 0 == m.isRight) return;
} catch (t) {
s = {
error: t
};
} finally {
try {
E && !E.done && (l = y.return) && l.call(y);
} finally {
if (s) throw s.error;
}
}
} else if (hs.isValueInEnum(P, hs.OFFER_TYPE_DIFFICULTY)) {
if ((hs.checkExcludeRightPut.has(P) || this.isInDeleteAlgoArr(P)) && !this.isInAddAlgoArr(P)) return;
if ((P == hs.OFFER_TYPE.SI_WANG && 4e3 == hs.algorithmName.algoExpectedId || this.isInDeleteAlgoArr(P)) && !this.isInAddAlgoArr(P)) return;
} else if (hs.isValueInEnum(P, hs.OFFER_TYPE_DIE)) ; else {
if (!this.isInAddAlgoArr(P)) return;
if (hs.isValueInEnum(P, hs.OFFER_TYPE_DIFFICULTY)) ; else try {
for (var I = n(this.putData), v = I.next(); !v.done; v = I.next()) {
var m;
if (1 == (m = v.value).check && 0 == m.isRight) return;
}
} catch (t) {
u = {
error: t
};
} finally {
try {
v && !v.done && (c = I.return) && c.call(I);
} finally {
if (u) throw u.error;
}
}
}
this.isRightPut = !0;
this.setLastPerfectRecord();
this._rightPutEmitter.fire({
isPrefect: !0
});
this.playPerfect();
}
}
};
e.prototype.playPerfect = function() {
this.playPerfectEffect();
};
e.prototype.playPerfectEffect = function() {
cc.loader.loadRes(hs.PrefabConfig.RightPutPerfect.url, function(t, e) {
if (t) ; else {
var r = cc.instantiate(e);
r.x = cc.winSize.width / 2;
r.y = cc.winSize.height / 2 + 100;
if (cc.isValid(hs.gameEffectLayer)) {
hs.gameEffectLayer.addChild(r, 100);
r.getComponent(dragonBones.ArmatureDisplay).addEventListener(dragonBones.EventObject.COMPLETE, function() {
cc.isValid(r) && r.destroy();
}, null);
hs.audioInfo.play(hs.AudioConfig.putRightPerfect);
}
}
});
};
e.prototype.isInAddAlgoArr = function(t) {
var e;
return (null !== (e = this.addAlgoArr) && void 0 !== e ? e : []).includes(t);
};
e.prototype.isInDeleteAlgoArr = function(t) {
var e;
return (null !== (e = this.deleteAlgoArr) && void 0 !== e ? e : []).includes(t);
};
e.prototype.getReportIsRightPut = function() {
return this.isRightPut;
};
e.prototype.setLastPerfectRecord = function() {
this.setState({
lastPerfectGameMode: hs.gameInfo.gameMode,
lastPerfectGameNum: hs.gameInfo.gameNum,
lastPerfectRound: hs.gameInfo.roundNum
});
};
Object.defineProperty(e.prototype, "rightPutEmitter", {
get: function() {
return this._rightPutEmitter;
},
enumerable: !1,
configurable: !0
});
e.prototype.shouldRecordPutData = function(t) {
return hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(t, hs.OFFER_TYPE_BLANK) || hs.isValueInEnum(t, hs.OFFER_TYPE_DIE) || this.isInAddAlgoArr(t);
};
e.prototype.getActualId = function(t) {
var e;
if (void 0 !== (null === (e = null == t ? void 0 : t.sdk) || void 0 === e ? void 0 : e.actualAlgorithmId)) return t.sdk.actualAlgorithmId;
if (this.useFinalAlgoId) return hs.algorithmName.algoActualIdByPos;
var r = hs.algorithmName.algoActualIdByPos;
return r !== hs.OFFER_TYPE.NONE ? r : hs.algorithmName.algoActualId;
};
Object.defineProperty(e.prototype, "useFinalAlgoId", {
get: function() {
var t;
return null !== (t = this.props.useFinalAlgoId) && void 0 !== t && t;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !1;
},
enumerable: !1,
configurable: !0
});
return a([ classId("CTRefactorIsOpenRightPutTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorIsOpenRightPutTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsOpenRightPutTrait" ]);
//# sourceMappingURL=index.js.map
