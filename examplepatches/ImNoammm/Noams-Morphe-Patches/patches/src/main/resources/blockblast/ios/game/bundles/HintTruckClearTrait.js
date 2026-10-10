window.__require = function e(r, t, o) {
function n(c, s) {
if (!t[c]) {
if (!r[c]) {
var i = c.split("/");
i = i[i.length - 1];
if (!r[i]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(i, !0);
if (a) return a(i, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = i;
}
var u = t[c] = {
exports: {}
};
r[c][0].call(u.exports, function(e) {
return n(r[c][1][e] || e);
}, u, u.exports, e, r, t, o);
}
return t[c].exports;
}
for (var a = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
HintTruckClearTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "6284atudP5Mk5JEidA/Vkol", "HintTruckClearTrait");
var o, n = this && this.__extends || (o = function(e, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
o(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), a = this && this.__decorate || function(e, r, t, o) {
var n, a = arguments.length, c = a < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, r, t, o); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (c = (a < 3 ? n(c) : a > 3 ? n(r, t, c) : n(r, t)) || c);
return a > 3 && c && Object.defineProperty(r, t, c), c;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.HintTruckClearTrait = void 0;
var c = function(e) {
n(r, e);
function r() {
var r = null !== e && e.apply(this, arguments) || this;
r._extraTexture = null;
return r;
}
r.prototype.preLoadRes = function() {
var e = this;
hs.ResLoader.loadBundle("HintTruckClearTrait", function(r) {
r || hs.ResLoader.loadByBundle("HintTruckClearTrait", "textures/game_cube_extra", cc.SpriteFrame, function(r, t) {
r || (e._extraTexture = t);
});
});
};
r.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Proxy",
methodName: "onClassGameShow"
}, {
className: "ClassBlocksProducer_Proxy",
methodName: "onGenerateEnd"
}, {
className: "ChapterBlocksProducer_Proxy",
methodName: "onGenerateEnd"
}, {
className: "BlocksProducerTouch",
methodName: "onTouchEndShowBlockColor"
}, {
className: "ChapterGame_Proxy",
methodName: "onChapterGameShow"
} ];
};
r.prototype.onActive = function(e) {
if (hs.gameInfo.gameMode === hs.GameMode.Class || hs.gameInfo.gameMode === hs.GameMode.Chapter) {
(hs.tp.isClassGame_ProxyOnClassGameShow(e) || hs.tp.isChapterGame_ProxyOnChapterGameShow(e)) && this.preLoadRes();
(hs.tp.isClassBlocksProducer_ProxyOnGenerateEnd(e) || hs.tp.isChapterBlocksProducer_ProxyOnGenerateEnd(e)) && this.onBlocksGenerateEnd();
hs.tp.isBlocksProducerTouchOnTouchEndShowBlockColor(e) && this.onBlocksGenerateEnd();
}
};
r.prototype.onBlocksGenerateEnd = function() {
if (this._extraTexture) if (hs.classGuideInfo.step < 3) ; else {
var e = Cinst(hs.BlocksProducer);
if (e && e.blocksContainer) {
var r = hs.boardInfo.faceBlocks;
if (r && 0 !== r.length) {
var t = hs.blocksProducerInfo.producerBlocks;
if (t && 0 !== t.length) for (var o = e.blocksContainer.children, n = 0; n < o.length; n++) {
var a = o[n].getComponent(hs.BlocksProducerItem);
if (a) {
var c = a.state.id;
if (-1 !== c) {
var s = this.canMakeBigEliminate(c, r);
this.replaceBlockTexture(a, s);
}
}
}
}
}
}
};
r.prototype.canMakeBigEliminate = function(e, r) {
var t = new hs.BinaryBoard();
t.convertToBinaryBoard(r);
t.record();
var o = t.getCanPutPoss(e);
if (0 === o.length) return !1;
for (var n = 0; n < o.length; n++) {
var a = o[n];
t.revert();
t.putBlock(e, a);
if (t.getClearCount() >= 3) return !0;
}
return !1;
};
r.prototype.replaceBlockTexture = function(e, r) {
if (e.caches && 0 !== e.caches.length) for (var t = 0; t < e.caches.length; t++) {
var o = e.caches[t];
if (o && 0 !== o.opacity) {
var n = o.getComponent(hs.Block);
n && n.block && (n.state.color > 100 || (r ? n.block.spriteFrame = this._extraTexture : n.switchBlockColorSprite(n.state.color, !1)));
}
}
};
return a([ classId("HintTruckClearTrait") ], r);
}(Trait);
t.HintTruckClearTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "HintTruckClearTrait" ]);
//# sourceMappingURL=index.js.map
