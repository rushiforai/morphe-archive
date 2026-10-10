window.__require = function i(t, e, a) {
function r(c, s) {
if (!e[c]) {
if (!t[c]) {
var n = c.split("/");
n = n[n.length - 1];
if (!t[n]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(n, !0);
if (o) return o(n, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = n;
}
var d = e[c] = {
exports: {}
};
t[c][0].call(d.exports, function(i) {
return r(t[c][1][i] || i);
}, d, d.exports, i, t, e, a);
}
return e[c].exports;
}
for (var o = "function" == typeof __require && __require, c = 0; c < a.length; c++) r(a[c]);
return r;
}({
AddUploadPicDrawCallTrait: [ function(i, t, e) {
"use strict";
cc._RF.push(t, "921f2R6hA9PoJ1X08ufdSEz", "AddUploadPicDrawCallTrait");
var a, r = this && this.__extends || (a = function(i, t) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(i, t) {
i.__proto__ = t;
} || function(i, t) {
for (var e in t) Object.prototype.hasOwnProperty.call(t, e) && (i[e] = t[e]);
})(i, t);
}, function(i, t) {
a(i, t);
function e() {
this.constructor = i;
}
i.prototype = null === t ? Object.create(t) : (e.prototype = t.prototype, new e());
}), o = this && this.__decorate || function(i, t, e, a) {
var r, o = arguments.length, c = o < 3 ? t : null === a ? a = Object.getOwnPropertyDescriptor(t, e) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(i, t, e, a); else for (var s = i.length - 1; s >= 0; s--) (r = i[s]) && (c = (o < 3 ? r(c) : o > 3 ? r(t, e, c) : r(t, e)) || c);
return o > 3 && c && Object.defineProperty(t, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.AddUploadPicDrawCallTrait = void 0;
var c = function(i) {
r(t, i);
function t() {
var t = null !== i && i.apply(this, arguments) || this;
t.shadowLayer = null;
t.shadowKuangLayer = null;
t.filterLayer = null;
t.filterKuangLayer = null;
t.touchLayer = null;
t.touchKuangLayer = null;
t._reusableVec2 = cc.v2();
return t;
}
t.prototype.onCreate = function() {
this.filterLayer = new cc.Node("filterLayer");
this.filterLayer.setPosition(0, 5);
this.filterLayer.anchorX = .5;
this.filterLayer.anchorY = .5;
this.filterLayer.width = 848;
this.filterLayer.height = 848;
this.filterKuangLayer = cc.instantiate(this.filterLayer);
this.filterKuangLayer.name = "kuangLayer";
this.shadowLayer = cc.instantiate(this.filterLayer);
this.shadowLayer.name = "shadowLayer";
this.shadowKuangLayer = cc.instantiate(this.shadowLayer);
this.shadowKuangLayer.name = "shadowKuangLayer";
this.touchLayer = cc.instantiate(this.filterLayer);
this.touchLayer.name = "touchLayer";
this.touchLayer.setPosition(0, 0);
this.touchLayer.width = 896;
this.touchLayer.height = 334;
this.touchKuangLayer = cc.instantiate(this.touchLayer);
this.touchKuangLayer.name = "touchKuangLayer";
};
t.prototype.onActive = function(i) {
if (hs.tp.isBoardSetBoardBg(i)) {
var t = Cinst(hs.Board);
if (t) {
var e = t.node.getChildByName("shadowLayer");
if (!cc.isValid(e)) {
t.node.insertChild(this.shadowLayer, t.blockShaders.getSiblingIndex() + 1);
t.node.insertChild(this.shadowKuangLayer, this.shadowLayer.getSiblingIndex() + 1);
t.node.insertChild(this.filterLayer, t.blocks.getSiblingIndex() + 1);
t.node.insertChild(this.filterKuangLayer, this.filterLayer.getSiblingIndex() + 1);
}
this.boardUpdate();
}
}
hs.tp.isAddUploadPicTraitGetFilterBlock(i) && this.getFilterBlock(i);
hs.tp.isAddUploadPicSnapTraitGetFilterBlock(i) && this.getFilterBlock(i);
hs.tp.isAddUploadPicTraitBindFilterBlock(i) && this.bindFilterBlock(i);
if (hs.tp.isBlocksProducerTouchOnBoardBlockPlaced(i)) {
if (!this.isTrigger()) return;
var a = i.args[0];
this.filterOpacity(a, 255);
}
if (hs.tp.isBlocksProducer_ProxyOnTouchEnd(i)) {
if (!this.isTrigger()) return;
var r = i.args[0].state.eliminates;
for (var o in r) for (var c in r[o]) {
var s = r[o][c];
this.filterOpacity(s, 0);
}
}
hs.tp.isBlocksProducerTouchAfterTouchStart(i) && this.selectTouchStart(i);
if (hs.tp.isBlocksProducerTouchChangeSelectItemPos(i)) {
if (!this.isTrigger()) return;
this.selectItemPos(i);
}
if (hs.tp.isBlocksProducerTouchChangeShaderBlock(i)) {
if (!this.isTrigger()) return;
var n = i.args[0], l = i.args[3];
a = n.node;
if (cc.isValid(a)) {
var d = a.AddUploadPicBlock;
if (cc.isValid(d)) {
d.opacity = this.shaderBlockOpacity(l);
var h = d.kuang;
cc.isValid(h) && (h.opacity = d.opacity);
}
}
}
if (hs.tp.isBlocksProducerRender(i)) {
var p = Cinst(hs.BlocksProducer);
if (cc.isValid(p)) {
e = p.node.getChildByName("touchLayer");
if (!cc.isValid(e)) {
p.node.insertChild(this.touchLayer, p.node.getChildByName("blocksContainer").getSiblingIndex() + 1);
p.node.insertChild(this.touchKuangLayer, this.touchLayer.getSiblingIndex() + 1);
}
}
}
if (hs.tp.isAddUploadPicTraitShaderBlockOpacity(i)) {
if (!this.isTrigger()) return;
n = i.args[0];
var u = i.args[1];
if (cc.isValid(n)) {
d = n.AddUploadPicBlock;
if (cc.isValid(d)) {
d.opacity = n.opacity;
h = d.kuang;
if (cc.isValid(h)) {
h.opacity = d.opacity;
h.color = cc.Color.fromHEX(new cc.Color(), u);
}
}
}
}
if (hs.tp.isBlocksProduceEnhanceSnapInfoChangeShaderBlock(i)) {
if (!this.isTrigger()) return;
this.changeShaderBlock(i);
}
if (hs.tp.isAddUploadPicTraitShowBlock(i)) {
d = i.args[0];
var f = i.args[1], y = d.kuang;
cc.isValid(y) && (y.active = f);
}
if (hs.tp.isBlocksProducerTouchResetBlocksOriPos(i)) {
var g = i.args[0];
if (cc.isValid(g)) for (var v = 0; v < g.children.length; v++) {
var P = g.children[v];
if (cc.isValid(P)) {
d = P.AddUploadPicBlock;
if (cc.isValid(d)) {
d.active = !1;
y = d.kuang;
cc.isValid(y) && (y.active = !1);
}
}
}
}
if (hs.tp.isAddUploadPicTraitFilterBlockActive(i)) for (f = i.args[0], v = 0; v < this.shadowKuangLayer.children.length; v++) {
P = this.shadowKuangLayer.children[v];
cc.isValid(P) && (P.active = f);
}
hs.tp.isAddUploadPicTraitLoadRefreshScreenName(i) && (i.returnValue = "prefabs/AddUploadPicRefreshScreenDc");
if (hs.tp.isAddUploadPicTraitGetRefreshScreenComp(i)) {
s = i.args[0];
i.returnValue = s.getComponent("AddUploadPicRefreshScreenDc");
}
hs.tp.isAddUploadPicTraitGetRefreshScreenName(i) && (i.returnValue = "AddUploadPicRefreshScreenDc");
if (hs.tp.isAddUploadPicAlphaTraitBlockAlpha(i)) {
i.replace = !0;
i.returnState = !0;
a = i.args[0];
var k = i.args[1];
cc.isValid(a) && 0 != a.opacity && this.filterOpacity(a, k);
}
};
t.prototype.selectTouchStart = function(i) {
if (this.isTrigger()) {
var t = i.target, e = Reflect.get(t, "_selectItem");
if (cc.isValid(e)) for (var a = 0; a < e.children.length; a++) {
var r = e.children[a];
if (cc.isValid(r) && r.opacity > 0) {
var o = r.AddUploadPicBlock;
if (cc.isValid(o)) {
o.opacity = 255;
var c = r.convertToWorldSpaceAR(cc.v2(0, 0)), s = this.touchLayer.convertToNodeSpaceAR(c);
o.setPosition(s);
var n = o.kuang;
cc.isValid(n) && n.setPosition(s);
}
}
}
}
};
t.prototype.bindFilterBlock = function(i) {
var t = i.args[0], e = i.args[1], a = i.args[2];
if ("" != a && cc.isValid(t) && cc.isValid(e)) {
i.replace = !0;
if ("AddUploadPicBlock" == a) {
e.parent = this.filterLayer;
e.opacity = t.opacity;
var r = t.convertToWorldSpaceAR(cc.v2(0, 0)), o = t.parent.convertToNodeSpaceAR(r);
e.setPosition(o);
(c = e.getChildByName("kuang")).parent = this.filterKuangLayer;
c.setPosition(o);
c.opacity = t.opacity;
e.kuang = c;
} else if ("AddUploadPicShadow" == a) {
e.parent = this.shadowLayer;
e.opacity = 0;
r = t.convertToWorldSpaceAR(cc.v2(0, 0)), o = t.parent.convertToNodeSpaceAR(r);
e.setPosition(o);
(c = e.getChildByName("kuang")).parent = this.shadowKuangLayer;
c.setPosition(o);
c.opacity = t.opacity;
e.kuang = c;
} else if ("AddUploadPicBlockTouch" == a) {
if (cc.isValid(this.touchLayer)) {
e.parent = this.touchLayer;
var c;
r = t.convertToWorldSpaceAR(cc.v2(0, 0)), o = this.touchLayer.convertToNodeSpaceAR(r);
e.setPosition(o);
(c = e.getChildByName("kuang")).parent = this.touchKuangLayer;
c.setPosition(o);
e.kuang = c;
}
e.opacity = 0;
}
t.AddUploadPicBlock = e;
e.block = t;
}
};
t.prototype.selectItemPos = function(i) {
var t = i.args[0];
if (cc.isValid(t)) {
this._reusableVec2.x = 0;
this._reusableVec2.y = 0;
for (var e = t.convertToWorldSpaceAR(this._reusableVec2), a = this.touchLayer.convertToNodeSpaceAR(e), r = this.currAlpha(255), o = 0; o < t.children.length; o++) {
var c = t.children[o];
if (0 !== c.opacity) {
var s = c.AddUploadPicBlock;
if (cc.isValid(s)) {
var n = a.x + c.x, l = a.y + c.y;
s.opacity = r;
s.setPosition(n, l);
var d = s.kuang;
cc.isValid(d) && d.setPosition(n, l);
}
}
}
this.afterSelectItemPos(t);
}
};
t.prototype.afterSelectItemPos = function() {};
t.prototype.currAlpha = function(i) {
return i;
};
t.prototype.changeShaderBlock = function(i) {
var t = i.args[0];
if (cc.isValid(t)) {
var e = t.AddUploadPicBlock;
if (cc.isValid(e)) {
var a = t.opacity;
e.opacity = this.shaderBlockOpacity(a);
var r = e.kuang;
cc.isValid(r) && (r.opacity = e.opacity);
}
}
};
t.prototype.shaderBlockOpacity = function(i) {
if (0 == i) return i;
var t = TRAIT("AddUploadPicTrait");
return (null == t ? void 0 : t.active) && 1 != t.getShadow() ? 255 : 100;
};
t.prototype.getFilterBlock = function(i) {
var t = i.args[0];
if (t) {
var e = t.AddUploadPicBlock;
if (cc.isValid(e)) {
i.replace = !0;
i.returnValue = e;
}
}
};
t.prototype.filterOpacity = function(i, t) {
if (cc.isValid(i)) {
var e = i.AddUploadPicBlock;
if (cc.isValid(e)) {
e.opacity = t;
var a = e.kuang;
cc.isValid(a) && (a.opacity = t);
}
}
};
t.prototype.boardUpdate = function() {
for (var i = hs.boardRendererInfo.blocks, t = 0; t < hs.ROW; t++) for (var e = 0; e < hs.COL; e++) {
var a = i[t][e];
if (cc.isValid(a)) {
var r = a.AddUploadPicBlock;
if (cc.isValid(r)) {
r.opacity = a.opacity;
var o = r.kuang;
cc.isValid(o) && (o.opacity = a.opacity);
}
}
}
this.boardOpacity();
};
t.prototype.boardOpacity = function() {};
t.prototype.isTrigger = function() {
return hs.gameInfo.gameMode == hs.GameMode.Class;
};
t.prototype.isAddUploadPicTrigger = function() {
var i = TRAIT("AddUploadPicTrait");
return !(null == i || !i.active) && -1 != i.bgId;
};
return o([ classId("AddUploadPicDrawCallTrait"), classMethodWatch() ], t);
}(Trait);
e.AddUploadPicDrawCallTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "AddUploadPicDrawCallTrait" ]);
//# sourceMappingURL=index.js.map
