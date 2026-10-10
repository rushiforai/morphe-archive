window.__require = function e(t, i, r) {
function n(o, a) {
if (!i[o]) {
if (!t[o]) {
var l = o.split("/");
l = l[l.length - 1];
if (!t[l]) {
var d = "function" == typeof __require && __require;
if (!a && d) return d(l, !0);
if (s) return s(l, !0);
throw new Error("Cannot find module '" + o + "'");
}
o = l;
}
var c = i[o] = {
exports: {}
};
t[o][0].call(c.exports, function(e) {
return n(t[o][1][e] || e);
}, c, c.exports, e, t, i, r);
}
return i[o].exports;
}
for (var s = "function" == typeof __require && __require, o = 0; o < r.length; o++) n(r[o]);
return n;
}({
NewGuideBoardArrangeTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "3b40388JQRJBIznrZJHyIve", "NewGuideBoardArrangeTrait");
var r, n = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
})(e, t);
}, function(e, t) {
r(e, t);
function i() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i());
}), s = this && this.__decorate || function(e, t, i, r) {
var n, s = arguments.length, o = s < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(e, t, i, r); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (o = (s < 3 ? n(o) : s > 3 ? n(t, i, o) : n(t, i)) || o);
return s > 3 && o && Object.defineProperty(t, i, o), o;
}, o = this && this.__awaiter || function(e, t, i, r) {
return new (i || (i = Promise))(function(n, s) {
function o(e) {
try {
l(r.next(e));
} catch (e) {
s(e);
}
}
function a(e) {
try {
l(r.throw(e));
} catch (e) {
s(e);
}
}
function l(e) {
e.done ? n(e.value) : (t = e.value, t instanceof i ? t : new i(function(e) {
e(t);
})).then(o, a);
var t;
}
l((r = r.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var i, r, n, s, o = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return s = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
return this;
}), s;
function a(e) {
return function(t) {
return l([ e, t ]);
};
}
function l(s) {
if (i) throw new TypeError("Generator is already executing.");
for (;o; ) try {
if (i = 1, r && (n = 2 & s[0] ? r.return : s[0] ? r.throw || ((n = r.return) && n.call(r), 
0) : r.next) && !(n = n.call(r, s[1])).done) return n;
(r = 0, n) && (s = [ 2 & s[0], n.value ]);
switch (s[0]) {
case 0:
case 1:
n = s;
break;

case 4:
o.label++;
return {
value: s[1],
done: !1
};

case 5:
o.label++;
r = s[1];
s = [ 0 ];
continue;

case 7:
s = o.ops.pop();
o.trys.pop();
continue;

default:
if (!(n = o.trys, n = n.length > 0 && n[n.length - 1]) && (6 === s[0] || 2 === s[0])) {
o = 0;
continue;
}
if (3 === s[0] && (!n || s[1] > n[0] && s[1] < n[3])) {
o.label = s[1];
break;
}
if (6 === s[0] && o.label < n[1]) {
o.label = n[1];
n = s;
break;
}
if (n && o.label < n[2]) {
o.label = n[2];
o.ops.push(s);
break;
}
n[2] && o.ops.pop();
o.trys.pop();
continue;
}
s = t.call(e, o);
} catch (e) {
s = [ 6, e ];
r = 0;
} finally {
i = n = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}
}, l = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, i = t && e[t], r = 0;
if (i) return i.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && r >= e.length && (e = void 0);
return {
value: e && e[r++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, d = this && this.__read || function(e, t) {
var i = "function" == typeof Symbol && e[Symbol.iterator];
if (!i) return e;
var r, n, s = i.call(e), o = [];
try {
for (;(void 0 === t || t-- > 0) && !(r = s.next()).done; ) o.push(r.value);
} catch (e) {
n = {
error: e
};
} finally {
try {
r && !r.done && (i = s.return) && i.call(s);
} finally {
if (n) throw n.error;
}
}
return o;
}, c = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(d(arguments[t]));
return e;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.NewGuideBoardArrangeTrait = void 0;
var u = [ -1, 13, -1 ], h = [ 1, 7, 1 ], f = [ {
x: 53,
y: -653.75
}, {
x: -265,
y: -138.75
} ], p = [ 11, 22, 13 ], k = [ 2, 2, 2 ], S = [ {
x: 53,
y: -653.75
}, {
x: 371,
y: 179.25
} ], y = [ -1, 13, -1 ], g = [ 1, 3, 1 ], v = [ 9, 42, 29 ], m = [ 3, 3, 3 ], b = [ {
x: 53,
y: -653.75
}, {
x: -318,
y: 73.25
} ], I = [ -1, 16, -1 ], B = [ 1, 2, 1 ], G = [ {
x: 53,
y: -653.75
}, {
x: 0,
y: -138.75
} ], C = [ 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 2, 2, 2, 2, -1, -1, -1, 2, 2, 2, 2, 2, -1, -1, -1, 2, 2, 2, 2, 2 ], P = [ 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ], _ = [ 5, 4, 2, -1, -1, -1, -1, -1, 5, 4, 2, -1, -1, -1, -1, -1, 5, 4, 2, -1, -1, -1, -1, -1, 5, 4, 2, -1, -1, -1, -1, -1, 5, 4, 2, -1, -1, -1, -1, -1, -1, -1, -1, 6, 6, 6, 6, 6, -1, -1, -1, 7, 7, 7, 7, 7, -1, -1, -1, 1, 1, 1, 1, 1 ], x = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 4, 2, 6, 7, 1, -1, -1, 5, 4, 2, 6, 7, 1, -1, -1, -1, 4, 2, 6, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ], w = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 5, 4, 2, -1, 6, 7, 1, 3, 5, 4, 2, -1, -1, 7, 1, 3, 5, 4, 2, 6, -1, 7, 1, 3 ], R = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._skinResPreloadStarted = !1;
t._hasPlayerInteracted = !1;
t._guideEnded = !1;
t._skinBoardCleaned = !1;
return t;
}
t.prototype.onActive = function(e) {
hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e) && this.handleGuideConfigInit();
hs.tp.isClassGuide_ProxyRenderGuideState(e) && this.handleRenderGuideState(e);
hs.tp.isClassBlocksProducer_ProxyBeforeBlocksProducerUpdate(e) && this.handleBeforeBlocksProducerUpdate(e);
hs.tp.isClassBlocksProducer_ProxyAfterBlocksProducerUpdate(e) && this.handleAfterBlocksProducerUpdate(e);
hs.tp.isClassBlocksProducer_ProxyGuideRequestBlocksProducer(e) && this.handleGuideRequestBlocksProducer(e);
hs.tp.isBoardOnBoardRenderOver(e) && this.handleBoardRenderOver(e);
hs.tp.isBoardSplashAnimationDoAnimation(e) && this.handleBoardSplashAnimation(e);
hs.tp.isSkinInfoSkipFinishGuide(e) && this.handleSkipFinishGuide(e);
hs.tp.isSkinTraitInfoGetTraitSkinId(e) && this.handleGetTraitSkinId(e);
hs.tp.isSkin_ProxyOnSkinUpdate(e) && this.handleSkinUpdate(e);
hs.tp.isSkinTraitInfoChangeSkinComplete(e) && this.handleChangeSkinComplete(e);
hs.tp.isClassSkin_ProxyUpdateSkinGameBg(e) && this.handleClassSkinUpdateSkinGameBg(e);
hs.tp.isSkinGameBgComponentSetGameBg(e) && this.handleSkinGameBgComponentSetGameBg(e);
hs.tp.isClassGuide_ProxyGuideEndDot(e) && this.handleGuideEndDot(e);
hs.tp.isClassGuide_ProxyOnAnyTouchEnd(e) && this.handleAnyTouchEnd(e);
hs.tp.isClassGuide_ProxyOnTouchEnd(e) && this.handleBlockPlaced(e);
hs.tp.isClassGuideLoadBlockSpriteFrame(e) && this.handleClassGuideLoadBlockSpriteFrame(e);
hs.tp.isNewPlayerGuideSkipTraitDoShowUI(e) && this.handleDoShowUI(e);
};
t.prototype.handleGuideConfigInit = function() {
if (!hs.classGuideInfo.isFinishedGuide) if (hs.classGuideInfo.step >= hs.classGuideInfo.totalStep) ; else {
var e = "guideStepInteracted_" + hs.classGuideInfo.step;
if (storage.getItem(e, !1)) storage.setItem("classGuideStep", hs.classGuideInfo.totalStep); else {
this.applyGuideConfig();
this.tryUseSkinPhaseOne();
}
}
};
t.prototype.handleRenderGuideState = function(e) {
var t, i;
if (!hs.classGuideInfo.isFinishedGuide) {
this.applyGuideConfig();
this.tryUseSkinPhaseOne();
if (this._hasPlayerInteracted) {
var r = Cinst(hs.ClassGuide);
r && r.setState({
step: this.guideStep,
showHand: !1,
showDarkMask: !1
});
e.replace = !0;
e.returnState = !0;
} else {
var n = Cinst(hs.ClassGuide);
if (n) {
var s = 200;
2 !== this.traitType && 4 !== this.traitType || (s = 400);
var o = e.args[0], a = null === (t = null == o ? void 0 : o.showDarkMask) || void 0 === t || t, l = null === (i = null == o ? void 0 : o.showHand) || void 0 === i || i;
n.setState({
step: this.guideStep,
showDarkMask: a,
showHand: l,
color: this.guideColor,
speed: s
});
this.fixGuideLayerOrder(n);
e.replace = !0;
e.returnState = !0;
}
}
}
};
t.prototype.handleGuideRequestBlocksProducer = function() {};
t.prototype.fixGuideLayerOrder = function(e) {
var t = e.node;
if (cc.isValid(t)) {
var i = t.parent;
if (cc.isValid(i)) {
var r = Cinst(hs.ClassGame);
if (r && cc.isValid(r.blocksProducerContainer)) {
var n = r.blocksProducerContainer.getSiblingIndex();
i.getSiblingIndex() < n && i.setSiblingIndex(n);
}
}
e.moveContainer && cc.isValid(e.moveContainer) && e.moveContainer.setSiblingIndex(t.childrenCount - 1);
e.blocks && cc.isValid(e.blocks) && e.blocks.setSiblingIndex(0);
}
};
t.prototype.handleSkipFinishGuide = function(e) {
if (this.shouldRefreshSkin) {
e.returnValue = !0;
e.replace = !0;
}
};
t.prototype.handleGetTraitSkinId = function(e) {
if (this.shouldRefreshSkin) {
e.returnValue = Number(this.targetSkinId);
e.replace = !0;
e.returnState = !0;
}
};
t.prototype.handleSkinUpdate = function(e) {
if (this.shouldUseSkinPhaseOne) {
var t = e.args[0];
if (t && t.skinId !== this.targetSkinId) {
t.skinId = this.targetSkinId;
this.revertSkinSequenceIndex();
}
} else if (1 === this.traitType && this._guideEnded && !this._skinBoardCleaned) {
this._skinBoardCleaned = !0;
this.cleanupSkinBoard();
}
};
t.prototype.revertSkinSequenceIndex = function() {
var e = storage.getItem("CleanSceneUseSequenceSkin_index", 0);
if (e > 0) {
storage.setItem("CleanSceneUseSequenceSkin_index", e - 1);
var t = Cinst("CleanSceneUseSequenceSkinTrait");
t && void 0 !== t.skinIndex && (t.skinIndex = e - 1);
}
};
t.prototype.handleChangeSkinComplete = function() {
return o(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.refreshSkinGameBgWithRetry() ];

case 1:
e.sent();
return [ 4, this.refreshSkinBoardAndBlocksWithRetry() ];

case 2:
e.sent();
return [ 2 ];
}
});
});
};
t.prototype.handleAfterBlocksProducerUpdate = function() {
return o(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.refreshSkinBlocksWithRetry() ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
t.prototype.handleBoardRenderOver = function() {
return o(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.refreshSkinBoardAndBlocksWithRetry() ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
t.prototype.handleClassSkinUpdateSkinGameBg = function(e) {
return o(this, void 0, Promise, function() {
var t;
return a(this, function(i) {
switch (i.label) {
case 0:
if (!this.shouldUseSkinPhaseOne) return [ 2 ];
t = e.args[0];
return [ 4, this.refreshSkinGameBg(t) ];

case 1:
if (i.sent()) {
e.replace = !0;
e.returnState = !0;
}
return [ 2 ];
}
});
});
};
t.prototype.handleSkinGameBgComponentSetGameBg = function(e) {
if (this.shouldUseSkinPhaseOne) {
this.fitGameBgNode(e.args[0]);
this.fitGameBgNode(e.args[1]);
}
};
t.prototype.handleClassGuideLoadBlockSpriteFrame = function(e) {
return o(this, void 0, Promise, function() {
var t, i, r;
return a(this, function(n) {
switch (n.label) {
case 0:
if (!this.shouldUseSkinPhaseOne) return [ 2 ];
t = e.args[0];
i = e.args[1];
if (!t || !cc.isValid(t.node) || i <= 0 || i > 100) return [ 2 ];
e.replace = !0;
return [ 4, this.resolveGuideBlockSpriteFrame(this.targetSkinId, i) ];

case 1:
if ((r = n.sent()) && cc.isValid(t.node)) {
t.spriteFrame = r;
return [ 2 ];
}
e.originalCaller();
return [ 2 ];
}
});
});
};
t.prototype.handleDoShowUI = function(e) {
this._hasPlayerInteracted && (e.replace = !0);
};
t.prototype.tryUseSkinPhaseOne = function() {
return o(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return this.shouldUseSkinPhaseOne && this.targetSkinId && hs.skinInfo.currentSkinId !== this.targetSkinId ? [ 4, hs.nextFrame() ] : [ 2 ];

case 1:
e.sent();
if (!this.shouldUseSkinPhaseOne) return [ 2 ];
this.preloadSkinRes();
return [ 4, this.setSkinInfo(this.targetSkinId) ];

case 2:
if (!e.sent()) return [ 2 ];
this.preloadRealSkin();
return hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 4 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ];

case 3:
e.sent();
e.label = 4;

case 4:
hs.skinTraitInfo.changeSkin(this.targetSkinId);
return [ 4, this.refreshSkinBoardAndBlocksWithRetry() ];

case 5:
e.sent();
return [ 4, this.refreshSkinBlocksWithRetry() ];

case 6:
e.sent();
return [ 2 ];
}
});
});
};
t.prototype.preloadRealSkin = function() {
return o(this, void 0, Promise, function() {
var e, t;
return a(this, function(i) {
switch (i.label) {
case 0:
e = -1;
hs.skinUseSequenceInfo.skinPool.length > 0 ? e = hs.skinUseSequenceInfo.getSkinNextId() : hs.skinRandomInfo.randomSkinPool.length > 0 && (t = hs.skinRandomInfo.getRandomSkin()) && t[0] && (e = t[0].ID);
return e > 0 ? [ 4, this.setSkinInfo("" + e) ] : [ 3, 2 ];

case 1:
i.sent();
i.label = 2;

case 2:
return [ 2 ];
}
});
});
};
t.prototype.preloadSkinRes = function() {
if (!this._skinResPreloadStarted && !hs.skinLoadInfo.skinResLoadedBarrier.isOpen) {
this._skinResPreloadStarted = !0;
hs.skinLoadInfo.loadSkinRes();
}
};
t.prototype.refreshSkinBoardAndBlocksWithRetry = function() {
return o(this, void 0, Promise, function() {
var e, t, i;
return a(this, function(r) {
switch (r.label) {
case 0:
if (!this.shouldRefreshSkin) return [ 2 ];
e = 0;
r.label = 1;

case 1:
return e < 6 ? [ 4, hs.nextFrame() ] : [ 3, 6 ];

case 2:
r.sent();
return this.shouldRefreshSkin ? [ 4, this.refreshSkinBoard() ] : [ 2 ];

case 3:
t = r.sent();
return [ 4, this.refreshSkinBlocks() ];

case 4:
i = r.sent();
if (t && i) return [ 2 ];
r.label = 5;

case 5:
e++;
return [ 3, 1 ];

case 6:
return [ 2 ];
}
});
});
};
t.prototype.refreshSkinBlocksWithRetry = function() {
return o(this, void 0, Promise, function() {
var e;
return a(this, function(t) {
switch (t.label) {
case 0:
if (!this.shouldRefreshSkin) return [ 2 ];
e = 0;
t.label = 1;

case 1:
return e < 6 ? [ 4, hs.nextFrame() ] : [ 3, 5 ];

case 2:
t.sent();
return this.shouldRefreshSkin ? [ 4, this.refreshSkinBlocks() ] : [ 2 ];

case 3:
if (t.sent()) return [ 2 ];
t.label = 4;

case 4:
e++;
return [ 3, 1 ];

case 5:
return [ 2 ];
}
});
});
};
t.prototype.refreshSkinBoard = function() {
var e;
return o(this, void 0, Promise, function() {
var t, i, r, n, s, o, l, d, c;
return a(this, function(a) {
switch (a.label) {
case 0:
return this.shouldRefreshSkin && (t = Cinst(hs.Board)) && cc.isValid(t.boardGrid) ? [ 4, this.setSkinInfo(this.targetSkinId) ] : [ 2, !1 ];

case 1:
return a.sent() && cc.isValid(t) && cc.isValid(t.boardGrid) ? hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 3 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ] : [ 2, !1 ];

case 2:
a.sent();
if (!cc.isValid(t) || !cc.isValid(t.boardGrid)) return [ 2, !1 ];
a.label = 3;

case 3:
if (!(i = (null === (e = hs.skinInfo.getSkinInfoBySkinId(this.targetSkinId)) || void 0 === e || e.board_bg, 
hs.skinInfo.boardSkinInfo))) return [ 2, !1 ];
if (hs.skinLoadInfo.skinResList.board.asset) return [ 3, 5 ];
r = hs.skinLoadInfo.skinResList.board;
return [ 4, hs.ResLoader.asyncLoad("prefabs/skin/board/SkinBoardPrefab", cc.Prefab) ];

case 4:
r.asset = a.sent();
a.label = 5;

case 5:
if (!(n = hs.skinLoadInfo.skinResList.board.asset)) return [ 2, !1 ];
s = t.boardGrid;
if (!(o = s.getChildByName("SkinBoardGuide"))) {
(o = cc.instantiate(n)).name = "SkinBoardGuide";
s.addChild(o);
o.x = 0;
o.y = 0;
o.zIndex = -100;
}
o.active = !0;
(l = s.getComponent(cc.Sprite)) && (l.enabled = !1);
(d = o.getComponent(hs.SkinBoardComponent)) && ((c = hs.skinAtlas.getBoardInfoSpriteFrame(this.targetSkinId, i.board_bg.color.colorParam)) ? d.setState({
colorData: null,
spriteFrame: c
}, !0) : d.setState({
colorData: i,
spriteFrame: null
}, !0));
hs.skinAtlas.createBoardAtlas(o);
return [ 2, !0 ];
}
});
});
};
t.prototype.refreshSkinBlocks = function() {
return o(this, void 0, Promise, function() {
var e, t, i, r, n, s, o, d, c, u, h, f, p, k, S, y, g;
return a(this, function(a) {
switch (a.label) {
case 0:
return this.shouldRefreshSkin ? [ 4, this.setSkinInfo(this.targetSkinId) ] : [ 2, !1 ];

case 1:
return a.sent() ? hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 3 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ] : [ 2, !1 ];

case 2:
a.sent();
a.label = 3;

case 3:
hs.skinInfo.upDataBlockColorValueMap();
hs.skinAtlas.createBlockAtlas();
e = !1;
if ((t = Cinst(hs.BlocksProducer)) && cc.isValid(t.blocksContainer)) try {
for (i = l(t.blocksContainer.children), r = i.next(); !r.done; r = i.next()) {
n = r.value;
if (cc.isValid(n)) try {
for (s = (k = void 0, l(n.children)), o = s.next(); !o.done; o = s.next()) {
h = o.value;
e = this.refreshBlockNode(h) || e;
}
} catch (e) {
k = {
error: e
};
} finally {
try {
o && !o.done && (S = s.return) && S.call(s);
} finally {
if (k) throw k.error;
}
}
}
} catch (e) {
f = {
error: e
};
} finally {
try {
r && !r.done && (p = i.return) && p.call(i);
} finally {
if (f) throw f.error;
}
}
if ((d = Cinst(hs.Board)) && cc.isValid(d.blocks)) try {
for (c = l(d.blocks.children), u = c.next(); !u.done; u = c.next()) {
h = u.value;
e = this.refreshBlockNode(h) || e;
}
} catch (e) {
y = {
error: e
};
} finally {
try {
u && !u.done && (g = c.return) && g.call(c);
} finally {
if (y) throw y.error;
}
}
return [ 2, e ];
}
});
});
};
t.prototype.refreshBlockNode = function(e) {
if (!cc.isValid(e) || 255 !== e.opacity) return !1;
var t = e.getComponent(hs.Block);
if (!t || !t.state) return !1;
t.setState({
color: t.state.color,
sourceColor: t.state.sourceColor
});
return !0;
};
t.prototype.refreshSkinGameBgWithRetry = function() {
return o(this, void 0, Promise, function() {
var e;
return a(this, function(t) {
switch (t.label) {
case 0:
if (!this.shouldRefreshSkin) return [ 2 ];
e = 0;
t.label = 1;

case 1:
return e < 6 ? [ 4, hs.nextFrame() ] : [ 3, 5 ];

case 2:
t.sent();
return this.shouldRefreshSkin ? [ 4, this.refreshSkinGameBg() ] : [ 2 ];

case 3:
if (t.sent()) return [ 2 ];
t.label = 4;

case 4:
e++;
return [ 3, 1 ];

case 5:
return [ 2 ];
}
});
});
};
t.prototype.refreshSkinGameBg = function(e) {
var t, i;
return o(this, void 0, Promise, function() {
var r, n, s, o, l, d, c, u;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!this.shouldRefreshSkin) return [ 2, !1 ];
r = e || (null === (t = Cinst(hs.ClassGame)) || void 0 === t ? void 0 : t.bgContainer);
return cc.isValid(r) ? [ 4, this.setSkinInfo(this.targetSkinId) ] : [ 2, !1 ];

case 1:
if (!a.sent()) return [ 2, !1 ];
if (!cc.isValid(r)) return [ 2, !1 ];
if (!(n = (null === (i = hs.skinInfo.getSkinInfoBySkinId(this.targetSkinId)) || void 0 === i ? void 0 : i.game_bg) || hs.skinInfo.gameBgSkinInfo)) return [ 2, !1 ];
if (hs.skinLoadInfo.skinResList.gameBg.asset) return [ 3, 3 ];
s = hs.skinLoadInfo.skinResList.gameBg;
return [ 4, hs.ResLoader.asyncLoad("prefabs/skin/GameBg/SkinGameBgPrefab", cc.Prefab) ];

case 2:
s.asset = a.sent();
a.label = 3;

case 3:
if (!(o = hs.skinLoadInfo.skinResList.gameBg.asset)) return [ 2, !1 ];
if (!(l = r.getChildByName("SkinGameBg"))) {
(l = cc.instantiate(o)).name = "SkinGameBg";
r.addChild(l);
}
this.fitGameBgNode(l);
(d = r.getComponent(cc.Sprite)) && (d.enabled = !1);
(c = l.getComponent(hs.SkinGameBgComponent)) && ((u = hs.skinAtlas.getBgSpriteFrame(this.targetSkinId, n.color.colorParam)) ? c.setState({
colorData: null,
spriteFrame: u
}, !0) : c.setState({
colorData: n,
spriteFrame: null
}, !0));
hs.skinAtlas.createBgAtlas(l);
return [ 2, !0 ];
}
});
});
};
t.prototype.fitGameBgNode = function(e) {
if (cc.isValid(e)) {
e.active = !0;
e.opacity = 255;
e.x = 0;
e.y = 0;
e.width = cc.winSize.width;
e.height = cc.winSize.height;
}
};
t.prototype.setSkinInfo = function(e) {
return o(this, void 0, Promise, function() {
var t;
return a(this, function(i) {
switch (i.label) {
case 0:
return !e || hs.skinInfo.hasSkin(e) ? [ 2, !0 ] : [ 4, hs.ResLoader.asyncLoad("configs/skin/default/skin_" + e, cc.JsonAsset) ];

case 1:
t = i.sent();
if (!cc.isValid(t) || !t.json) return [ 2, !1 ];
hs.skinInfo.setSkinMap(e, t.json);
return [ 2, !0 ];
}
});
});
};
t.prototype.resolveGuideBlockSpriteFrame = function(e, t) {
return o(this, void 0, Promise, function() {
var i, r;
return a(this, function(n) {
switch (n.label) {
case 0:
return [ 4, this.setSkinInfo(e) ];

case 1:
return n.sent() && (i = this.getSkinCenterColorParam(e, t)) ? hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 3 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ] : [ 2, null ];

case 2:
n.sent();
n.label = 3;

case 3:
hs.skinInfo.currentSkinId !== e && hs.skinInfo.setCurrentSkinIdTemporary(e);
return (r = hs.skinAtlas.getBlockSpriteFrame(i, t)) ? [ 3, 5 ] : [ 4, hs.skinAtlas.createBlockAtlas() ];

case 4:
n.sent();
r = hs.skinAtlas.getBlockSpriteFrame(i, t);
n.label = 5;

case 5:
return [ 2, null != r ? r : null ];
}
});
});
};
t.prototype.getSkinCenterColorParam = function(e, t) {
var i, r, n, s = hs.skinInfo.getSkinInfoBySkinId(e);
if (!s) return "";
var o = s["block" + t];
return null !== (n = null === (r = null === (i = null == o ? void 0 : o.colorList) || void 0 === i ? void 0 : i[4]) || void 0 === r ? void 0 : r.colorParam) && void 0 !== n ? n : "";
};
t.prototype.handleBlockPlaced = function() {
if (!this._hasPlayerInteracted && !hs.classGuideInfo.isFinishedGuide && hs.classGuideInfo.step === this.guideStep) {
this._hasPlayerInteracted = !0;
storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
storage.setItem("guideStepInteracted_" + this.guideStep, !0);
}
};
t.prototype.handleGuideEndDot = function(e) {
var t;
if (!hs.classGuideInfo.isFinishedGuide && !this._guideEnded) if (this._hasPlayerInteracted) {
e.replace = !0;
DS(null === (t = hs.classGuideInfo.steps[this.guideStep]) || void 0 === t ? void 0 : t.dotEnd);
this.endGuide();
} else e.replace = !0;
};
t.prototype.handleAnyTouchEnd = function(e) {
hs.classGuideInfo.isFinishedGuide || this._guideEnded || hs.classGuideInfo.step === this.guideStep && this._hasPlayerInteracted && (e.replace = !0);
};
t.prototype.endGuide = function() {
storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
this._guideEnded = !0;
1 === this.traitType && this.skipSameSkinInSequence();
var e = Cinst(hs.ClassGuide);
e && e.setState({
showHand: !1,
showDarkMask: !1
});
var t = Cinst(hs.ClassTopInfo);
t && t.updateSetBtnState && t.updateSetBtnState();
};
t.prototype.skipSameSkinInSequence = function() {
var e = hs.skinInfo.currentSkinId, t = hs.skinUseSequenceInfo.skinPool;
if (t && 0 !== t.length) {
var i = storage.getItem("CleanSceneUseSequenceSkin_index", 0);
(i < 0 || i >= t.length) && (i = 0);
if ("" + t[i].ID === e) {
(i += 1) >= t.length && (i = 0);
storage.setItem("CleanSceneUseSequenceSkin_index", i);
var r = Cinst("CleanSceneUseSequenceSkinTrait");
r && void 0 !== r.skinIndex && (r.skinIndex = i);
}
}
};
t.prototype.cleanupSkinBoard = function() {
var e = Cinst(hs.Board);
if (e && cc.isValid(e.boardGrid)) {
var t = e.boardGrid.getChildByName("SkinBoardGuide");
cc.isValid(t) && t.destroy();
var i = e.boardGrid.getComponent(cc.Sprite);
i && (i.enabled = !0);
}
};
t.prototype.handleBeforeBlocksProducerUpdate = function(e) {
if (hs.classGuideInfo.step === this.guideStep) {
var t = e.args[0], i = e.args[1], r = this.blockList, n = this.colorList;
storage.setItem("classProducerBlocks", r);
storage.setItem("classColorLists", n);
Array.isArray(t) && t.splice.apply(t, c([ 0, t.length ], r));
Array.isArray(i) && i.splice.apply(i, c([ 0, i.length ], n));
e.returnState = !0;
}
};
t.prototype.handleBoardSplashAnimation = function() {};
t.prototype.applyGuideConfig = function() {
var e = hs.classGuideInfo.steps, t = Math.max(0, Math.min(this.guideStep, e.length - 1)), i = e[t];
if (i) {
var r = this.board, n = this.blockList, s = this.colorList;
storage.getItem("classGuideStep", 0) <= t && storage.setItem("classGuideStep", t);
storage.setItem("classFaceBlocks", r);
storage.setItem("classProducerBlocks", n);
storage.setItem("classColorLists", s);
Object.assign(i, {
save_arr: r,
producerBlocks: n,
blocksColors: s,
color: this.guideColor,
move: this.move
});
}
};
Object.defineProperty(t.prototype, "board", {
get: function() {
var e;
if (this.isValidBoard(null === (e = this.props) || void 0 === e ? void 0 : e.board)) return this.props.board.map(function(e) {
return e.slice();
});
for (var t = this.boardData, i = [], r = 0; r < 8; r++) i.push(t.slice(8 * r, 8 * (r + 1)));
return i;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "boardData", {
get: function() {
var e, t = null === (e = this.props) || void 0 === e ? void 0 : e.boardData;
return Array.isArray(t) && 64 === t.length ? t : 2 === this.traitType ? P : 3 === this.traitType ? _ : 4 === this.traitType ? x : 5 === this.traitType ? w : C;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "blockList", {
get: function() {
var e, t = null === (e = this.props) || void 0 === e ? void 0 : e.blockList;
return Array.isArray(t) && t.length > 0 ? t.slice() : 2 === this.traitType ? p.slice() : 3 === this.traitType ? y.slice() : 4 === this.traitType ? v.slice() : 5 === this.traitType ? I.slice() : u.slice();
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "colorList", {
get: function() {
var e, t = null === (e = this.props) || void 0 === e ? void 0 : e.colorList;
return Array.isArray(t) && t.length > 0 ? t.slice() : 2 === this.traitType ? k.slice() : 3 === this.traitType ? g.slice() : 4 === this.traitType ? m.slice() : 5 === this.traitType ? B.slice() : h.slice();
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "guideColor", {
get: function() {
var e;
if ("number" == typeof (null === (e = this.props) || void 0 === e ? void 0 : e.guideColor)) return this.props.guideColor;
var t = this.colorList[1];
return "number" == typeof t ? t : h[1];
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "guideStep", {
get: function() {
var e;
return "number" == typeof (null === (e = this.props) || void 0 === e ? void 0 : e.guideStep) ? this.props.guideStep : 2;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "traitType", {
get: function() {
var e;
return "number" == typeof (null === (e = this.props) || void 0 === e ? void 0 : e.traitTyp) ? this.props.traitTyp : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "shouldUseSkinPhaseOne", {
get: function() {
return 1 === this.traitType && !hs.classGuideInfo.isFinishedGuide && !this._guideEnded;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "shouldRefreshSkin", {
get: function() {
return 1 === this.traitType && !this._skinBoardCleaned;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "targetSkinId", {
get: function() {
var e, t;
return "" + (null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.targetSkinId) && void 0 !== t ? t : "1001");
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "move", {
get: function() {
var e, t = null === (e = this.props) || void 0 === e ? void 0 : e.move;
return Array.isArray(t) && t.length >= 2 ? t.map(function(e) {
return {
x: e.x,
y: e.y
};
}) : 2 === this.traitType ? S.map(function(e) {
return {
x: e.x,
y: e.y
};
}) : 4 === this.traitType ? b.map(function(e) {
return {
x: e.x,
y: e.y
};
}) : 5 === this.traitType ? G.map(function(e) {
return {
x: e.x,
y: e.y
};
}) : f.map(function(e) {
return {
x: e.x,
y: e.y
};
});
},
enumerable: !1,
configurable: !0
});
t.prototype.isValidBoard = function(e) {
return Array.isArray(e) && 8 === e.length && e.every(function(e) {
return Array.isArray(e) && 8 === e.length;
});
};
return s([ classId("NewGuideBoardArrangeTrait") ], t);
}(Trait);
i.NewGuideBoardArrangeTrait = R;
cc._RF.pop();
}, {} ]
}, {}, [ "NewGuideBoardArrangeTrait" ]);
//# sourceMappingURL=index.js.map
