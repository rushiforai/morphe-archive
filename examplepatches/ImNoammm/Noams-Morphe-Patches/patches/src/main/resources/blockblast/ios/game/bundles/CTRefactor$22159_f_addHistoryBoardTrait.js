window.__require = function t(o, e, r) {
function n(i, c) {
if (!e[i]) {
if (!o[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!o[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var f = e[i] = {
exports: {}
};
o[i][0].call(f.exports, function(t) {
return n(o[i][1][t] || t);
}, f, f.exports, t, o, e, r);
}
return e[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < r.length; i++) n(r[i]);
return n;
}({
CTRefactor$22159_f_addHistoryBoardTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "6646dY+Hp9P0L6Sny0CShBH", "CTRefactor$22159_f_addHistoryBoardTrait");
var r, n, a = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), i = this && this.__decorate || function(t, o, e, r) {
var n, a = arguments.length, i = a < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, o, e, r); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (a < 3 ? n(i) : a > 3 ? n(o, e, i) : n(o, e)) || i);
return a > 3 && i && Object.defineProperty(o, e, i), i;
}, c = this && this.__values || function(t) {
var o = "function" == typeof Symbol && Symbol.iterator, e = o && t[o], r = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && r >= t.length && (t = void 0);
return {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(o ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactor$22159_f_addHistoryBoardTrait = void 0;
(function(t) {
t[t.None = 0] = "None";
t[t.LR = 1] = "LR";
t[t.UD = 2] = "UD";
})(n || (n = {}));
var s = function(t) {
a(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o._json = null;
return o;
}
o.prototype.onCreate = function() {
this.loadJsonAsset();
};
o.prototype.isClassBoardEffect_ProxyOnTouchEnd = function(t) {
var o = t.args[0].state, e = o.canEliminate, r = o.continuousEliminateTimes;
this.checkAndPlay(e, r);
};
o.prototype.isClassGame_ProxyNewGameInit = function() {
storage.setItem("classHistoryBoardData", {
triggerRound: -1
});
};
o.prototype.isCTRefactorFinalBlockCheckIOSTraitOnSaveBottomhistoryBlock = function(t) {
this.onSaveBottomhistoryBlock(t);
};
o.prototype.onAlgorithmStrategySDKComplete = function(t) {
if (t && hs.algorithmName.algoActualName.some(function(t) {
return t === hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_HISTORY_BOARD];
})) {
hs.storage.setItem("classHistoryBoardData", {
triggerRound: hs.classGameInfo.roundNum
});
var o = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_HISTORY_BOARD];
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.ALGO_HISTORY_BOARD, this);
as.AlgorithmStrategyAlgoActualNamePatch.patch([ o, o, o ], this);
}
};
o.prototype.onSaveBottomhistoryBlock = function(t) {
this.checkTrigger() && (t.args[1] = hs.OFFER_TYPE.ALGO_HISTORY_BOARD);
};
o.prototype.checkTrigger = function() {
var t, o, e, r, n = hs.algorithmName.algoActualName, a = hs.algorithmName.algoExpectedId, i = !0;
try {
t: for (var s = c([ "清盘plus算法", "历史盘面清屏算法", "聚拢算法", "清盘算法plus" ]), l = s.next(); !l.done; l = s.next()) {
var f = l.value;
if (f === hs.OFFER_TYPE_STRINGS[a]) {
i = !1;
break t;
}
try {
for (var u = (e = void 0, c(n)), d = u.next(); !d.done; d = u.next()) if (d.value === f) {
i = !1;
break t;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
d && !d.done && (r = u.return) && r.call(u);
} finally {
if (e) throw e.error;
}
}
}
} catch (o) {
t = {
error: o
};
} finally {
try {
l && !l.done && (o = s.return) && o.call(s);
} finally {
if (t) throw t.error;
}
}
var h = hs.classGameInfo.roundNum;
h < 1 && (i = !1);
h - hs.storage.getItem("classHistoryBoardData", {
triggerRound: -1
}).triggerRound <= 1 && (i = !1);
hs.classDataStatisticsInfo.dataStatisticsInfo.comboTouchNum >= 5 && (i = !1);
var y = this.boardToStr();
this._json && this._json[y] || (i = !1);
return i;
};
o.prototype.boardToStr = function() {
for (var t = "", o = "", e = hs.boardInfo.faceBlocks, r = 0; r < 8; r++) {
o = "";
for (var n = 0; n < 8; n++) {
var a = e[r][n];
o += a = -1 === a ? 0 : 1;
}
t += Number("0b" + o).toString();
7 !== r && (t += "-");
}
return t;
};
o.prototype.checkAndPlay = function(t, o) {
var e = this;
if (!(o - 1 >= 5 && t)) {
var r = this.getType();
if (r !== n.None) {
this.playLine(r);
this.playColor(r);
setTimeoutSafe(function() {
return e.playHeart();
}, 300);
}
}
};
o.prototype.getType = function() {
var t = hs.boardInfo.faceBlocks, o = new hs.BinaryBoard();
o.convertToBinaryBoard(t);
o.record();
return o.isEmpty() ? n.None : o.isSymmetric() ? n.LR : this.isUpDownSymmetric(t) ? n.UD : n.None;
};
o.prototype.isUpDownSymmetric = function(t) {
for (var o = 0; o < 4; o++) for (var e = 7 - o, r = 0; r < 8; r++) if (t[o][r] * t[e][r] < 0) return !1;
return !0;
};
o.prototype.loadJsonAsset = function() {
var t = this;
hs.ResLoader.loadByBundle("Remote_22159", "board", cc.JsonAsset, function(o, e) {
o || e && e.json && (t._json = e.json);
});
};
o.prototype.playLine = function(t) {
var o = this;
hs.ResLoader.loadByBundle("Remote_22159", "prefab/lineAnim", cc.Prefab, function(e, r) {
if (e) ; else {
var a = o.getEffectLayer();
if (r && a && cc.isValid(a)) {
var i = cc.instantiate(r);
i.parent = a;
i.setPosition(cc.v2(a.width / 2, a.height / 2 + 125));
t === n.UD && (i.angle = 90);
var c = i.getComponent(dragonBones.ArmatureDisplay);
c.timeScale = 1;
c.once(dragonBones.EventObject.COMPLETE, function() {
cc.isValid(i) && i.destroy();
});
}
}
});
};
o.prototype.playHeart = function() {
var t = this;
hs.ResLoader.loadByBundle("Remote_22159", "prefab/heartAnim", cc.Prefab, function(o, e) {
if (o) ; else {
var r = t.getEffectLayer();
if (e && r && cc.isValid(r)) {
var n = cc.instantiate(e);
n.parent = r;
n.setPosition(cc.v2(r.width / 2, r.height / 2 + 125));
var a = n.getComponent(dragonBones.ArmatureDisplay);
a.timeScale = 1;
a.once(dragonBones.EventObject.COMPLETE, function() {
cc.isValid(n) && n.destroy();
});
}
}
});
};
o.prototype.getSymColor = function() {
var t = [ [ 5, 7 ], [ 3, 2 ], [ 6, 4 ], [ 7, 5 ], [ 2, 3 ], [ 4, 6 ] ];
return t[Math.floor(Math.random() * t.length)];
};
o.prototype.getBlockColor = function(t, o, e) {
var r = this.getRowColByNode(t);
return r ? o === n.LR ? r.col < 4 ? e[0] : e[1] : r.row < 4 ? e[0] : e[1] : null;
};
o.prototype.setBlockNode = function(t, o, e, r) {
var n = this.getRowColByNode(t);
if (n) {
r[n.row][n.col] = o;
t.opacity = 255;
setTimeoutSafe(function() {
if (t && cc.isValid(t)) {
var e = t.getComponent(hs.Block);
if (e && cc.isValid(e.node)) {
t.scale = .8;
e.setState({
color: o,
sourceColor: o,
initSurfaceDark: !1
});
cc.tween(t).to(.167, {
scale: 1
}).start();
}
}
}, 66.7 * e);
}
};
o.prototype.setBlockNode_iOS = function(t, o) {
if (t && cc.isValid(t) && this.getRowColByNode(t)) {
t.opacity = 255;
setTimeoutSafe(function() {
if (t && cc.isValid(t)) {
var o = t.getComponent(hs.Block);
if (o && cc.isValid(o.node)) {
t.scale = .8;
cc.tween(t).to(.167, {
scale: 1
}).start();
}
}
}, 66.7 * o);
}
};
o.prototype.playColor = function(t) {
var o, e;
try {
var r = [];
if (t === n.LR) for (var a = 7; a >= 0; a--) {
for (var i = [], s = 0; s < 8; s++) (p = this.getBlockNodeByRowCol(a, s)) && i.push(p);
r.push(i);
} else if (t === n.UD) for (s = 0; s < 8; s++) {
var l = [];
for (a = 0; a < 8; a++) (p = this.getBlockNodeByRowCol(a, s)) && l.push(p);
r.push(l);
}
for (var f = this.getSymColor(), u = hs.boardInfo.faceBlocks, d = 0; d < r.length; d++) try {
for (var h = (o = void 0, c(r[d])), y = h.next(); !y.done; y = h.next()) {
var p = y.value;
if (cc.isValid(p)) {
var v = this.getBlockColor(p, t, f);
null !== v && hs.skinInfo.currentSkinId === hs.skinInfo.originSkinId ? this.setBlockNode(p, v, d, u) : this.setBlockNode_iOS(p, d, u);
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
y && !y.done && (e = h.return) && e.call(h);
} finally {
if (o) throw o.error;
}
}
hs.storage.setItem("classFaceBlocks", u);
} catch (t) {}
};
o.prototype.getBlockNodeByRowCol = function(t, o) {
var e, r = (null === (e = hs.boardRendererInfo.blocks[t]) || void 0 === e ? void 0 : e[o]) || null;
return r && cc.isValid(r) ? -1 === hs.boardInfo.faceBlocks[t][o] ? null : 255 !== r.opacity ? null : r : null;
};
o.prototype.getRowColByNode = function(t) {
for (var o, e = hs.boardRendererInfo.blocks, r = 0; r < 8; r++) for (var n = 0; n < 8; n++) if ((null === (o = e[r]) || void 0 === o ? void 0 : o[n]) === t) return {
row: r,
col: n
};
return null;
};
o.prototype.getEffectLayer = function() {
return hs.effectLayer ? hs.effectLayer : cc.find("Canvas/effectLayer") || cc.find("Canvas/gameEffectLayer") || cc.Canvas.instance.node;
};
return i([ classId("CTRefactor$22159_f_addHistoryBoardTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactor$22159_f_addHistoryBoardTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$22159_f_addHistoryBoardTrait" ]);
//# sourceMappingURL=index.js.map
