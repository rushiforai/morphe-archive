window.__require = function e(t, i, o) {
function s(d, r) {
if (!i[d]) {
if (!t[d]) {
var a = d.split("/");
a = a[a.length - 1];
if (!t[a]) {
var u = "function" == typeof __require && __require;
if (!r && u) return u(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + d + "'");
}
d = a;
}
var l = i[d] = {
exports: {}
};
t[d][0].call(l.exports, function(e) {
return s(t[d][1][e] || e);
}, l, l.exports, e, t, i, o);
}
return i[d].exports;
}
for (var n = "function" == typeof __require && __require, d = 0; d < o.length; d++) s(o[d]);
return s;
}({
LittleManNewbieGuideTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "454b6i8Y8JBFpSAni08ZaD9", "LittleManNewbieGuideTrait");
var o, s = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
})(e, t);
}, function(e, t) {
o(e, t);
function i() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i());
}), n = this && this.__decorate || function(e, t, i, o) {
var s, n = arguments.length, d = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) d = Reflect.decorate(e, t, i, o); else for (var r = e.length - 1; r >= 0; r--) (s = e[r]) && (d = (n < 3 ? s(d) : n > 3 ? s(t, i, d) : s(t, i)) || d);
return n > 3 && d && Object.defineProperty(t, i, d), d;
}, d = this && this.__awaiter || function(e, t, i, o) {
return new (i || (i = Promise))(function(s, n) {
function d(e) {
try {
a(o.next(e));
} catch (e) {
n(e);
}
}
function r(e) {
try {
a(o.throw(e));
} catch (e) {
n(e);
}
}
function a(e) {
e.done ? s(e.value) : (t = e.value, t instanceof i ? t : new i(function(e) {
e(t);
})).then(d, r);
var t;
}
a((o = o.apply(e, t || [])).next());
});
}, r = this && this.__generator || function(e, t) {
var i, o, s, n, d = {
label: 0,
sent: function() {
if (1 & s[0]) throw s[1];
return s[1];
},
trys: [],
ops: []
};
return n = {
next: r(0),
throw: r(1),
return: r(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function r(e) {
return function(t) {
return a([ e, t ]);
};
}
function a(n) {
if (i) throw new TypeError("Generator is already executing.");
for (;d; ) try {
if (i = 1, o && (s = 2 & n[0] ? o.return : n[0] ? o.throw || ((s = o.return) && s.call(o), 
0) : o.next) && !(s = s.call(o, n[1])).done) return s;
(o = 0, s) && (n = [ 2 & n[0], s.value ]);
switch (n[0]) {
case 0:
case 1:
s = n;
break;

case 4:
d.label++;
return {
value: n[1],
done: !1
};

case 5:
d.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = d.ops.pop();
d.trys.pop();
continue;

default:
if (!(s = d.trys, s = s.length > 0 && s[s.length - 1]) && (6 === n[0] || 2 === n[0])) {
d = 0;
continue;
}
if (3 === n[0] && (!s || n[1] > s[0] && n[1] < s[3])) {
d.label = n[1];
break;
}
if (6 === n[0] && d.label < s[1]) {
d.label = s[1];
s = n;
break;
}
if (s && d.label < s[2]) {
d.label = s[2];
d.ops.push(n);
break;
}
s[2] && d.ops.pop();
d.trys.pop();
continue;
}
n = t.call(e, d);
} catch (e) {
n = [ 6, e ];
o = 0;
} finally {
i = s = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
}, a = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, i = t && e[t], o = 0;
if (i) return i.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && o >= e.length && (e = void 0);
return {
value: e && e[o++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.LittleManNewbieGuideTrait = void 0;
var u = [ "usr_data_guide_1_start", "usr_data_guide_1_end", "usr_data_guide_2_start", "usr_data_guide_2_end", "usr_data_guide_3_start", "usr_data_guide_3_end" ], l = function(e) {
s(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._skeletonData = null;
t._preloadPromise = null;
t._guideNode = null;
t._hasPlayedOut = !1;
t._isPlaying = !1;
t._hasTouchStarted = !1;
t._showToken = 0;
t._disabled = !1;
t._placedCount = 0;
t._sentGuideDots = new Set();
t._shouldBlockNextProducerUpdate = !1;
return t;
}
Object.defineProperty(t.prototype, "plan", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.plan) && void 0 !== t ? t : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "animSuffix", {
get: function() {
return 0 === this.plan ? 2 : 1 === this.plan ? 1 : this.plan + 1;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "inAnim", {
get: function() {
return "in_" + this.animSuffix;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "initAnim", {
get: function() {
return "init" + this.animSuffix;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "outAnim", {
get: function() {
return "out" + this.animSuffix;
},
enumerable: !1,
configurable: !0
});
t.prototype.onCreate = function() {
this.debugLog("onCreate preload start", {
plan: this.plan,
animSuffix: this.animSuffix
});
this.preloadResources();
this.restorePlacedCount();
this.restoreFinishedGuideState();
};
t.prototype.onActive = function(e) {
hs.tp.isClassGuide_ProxyInitTraits(e) && this.overrideGuideSteps();
hs.tp.isClassBlocksProducer_ProxyOnInit(e) && this.overrideGuideSteps();
if (hs.tp.isClassBoard_ProxyOnBoardInit(e)) {
this.clearBoardCacheForGuide();
this.overrideGuideSteps();
}
hs.tp.isClassGuideGetProducerBlockID(e) && this.handleGetProducerBlockID(e);
hs.tp.isClassGuide_ProxyGuideShow(e) && this.handleGuideShow(e);
hs.tp.isClassGuide_ProxyRenderGuideState(e) && this.handleRenderGuideState(e);
hs.tp.isClassGuide_ProxyGuideEndDot(e) && this.handleGuideEndDot(e);
hs.tp.isClassGuide_ProxyOnGuideChangeTrait(e) && this.handleGuideChangeTrait(e);
hs.tp.isClassBlocksProducer_ProxyRequestBlocksProducer(e) && this.handleRequestBlocksProducer(e);
hs.tp.isClassBlocksProducer_ProxyBeforeBlocksProducerUpdate(e) && this.handleBeforeBlocksProducerUpdate(e);
hs.tp.isClassBlocksProducer_BlocksProducerValidate_ProxyOnBoardSplashAnimationEnd(e) && this.handleBoardSplashAnimationEnd();
hs.tp.isClassBlocksProducer_ProxyOnTouchStart(e) && this.handleTouchStart();
hs.tp.isBlocksProducerPlayBlockAppearAnimation(e) && this.handleDisableBlockAppearAnimation(e);
hs.tp.isBlocksProducerShowShaderAnim(e) && this.handleDisableShowShaderAnim(e);
hs.tp.isClassGuide_ProxyOnBlockProducerItemOpen(e) && this.handleBlockProducerItemOpen(e);
};
t.prototype.restorePlacedCount = function() {
this._placedCount = hs.storage.getItem("classGuidePlacedCount", 0);
this.debugLog("restorePlacedCount", {
placedCount: this._placedCount
});
};
t.prototype.restoreFinishedGuideState = function() {
if (!(this._placedCount < 2) && !0 !== hs.storage.getItem("isFinishedGuide", !1)) {
hs.storage.setItem("isFinishedGuide", !0);
this.debugLog("restoreFinishedGuideState: isFinishedGuide set to true");
}
};
t.prototype.handleBoardSplashAnimationEnd = function() {
var e, t = this.isNewbieGuideRound();
this.debugLog("onBoardSplashAnimationEnd hook", {
isNewbieGuideRound: t,
classGuideStep: hs.storage.getItem("classGuideStep", 0),
isFinishedGuide: hs.storage.getItem("isFinishedGuide", !1),
classGuideShow: null === (e = hs.classGuideInfo) || void 0 === e ? void 0 : e.show,
placedCount: this._placedCount
});
if (this.isGuideCompleted()) {
this.debugLog("onBoardSplashAnimationEnd skip: guide completed");
this._showToken++;
this.destroyGuideNode();
} else if (t) {
if (this.hasPlacedAnyBlock()) {
this.debugLog("onBoardSplashAnimationEnd skip: already placed block, no tips replay");
this._showToken++;
this.destroyGuideNode();
return;
}
this._disabled = !1;
this._hasTouchStarted = !1;
this._showToken++;
this.showGuideAnim(this._showToken);
}
};
t.prototype.handleTouchStart = function() {
this._hasTouchStarted = !0;
this.debugLog("onTouchStart hook");
this.playOutAnim();
};
t.prototype.handleDisableBlockAppearAnimation = function(e) {
var t, i;
if (this.isNewbieGuideRound()) {
var o = null === (t = e.args) || void 0 === t ? void 0 : t[0], s = null === (i = e.args) || void 0 === i ? void 0 : i[2];
if (cc.isValid(o)) {
cc.Tween.stopAllByTarget(o);
o.scale = hs.BlocksProducer.OpBlockScale;
o.opacity = 255;
}
e.replace = !0;
this.debugLog("handleDisableBlockAppearAnimation: 禁用出块动效");
null == s || s();
}
};
t.prototype.handleDisableShowShaderAnim = function(e) {
if (this.isNewbieGuideRound()) {
e.replace = !0;
this.debugLog("handleDisableShowShaderAnim: 禁用出块 Shader 特效");
}
};
t.prototype.handleBlockProducerItemOpen = function(e) {
var t, i, o = hs.classGuideInfo;
if (o.step === o.totalStep && this.isGuideCompleted()) {
var s = Cinst(hs.BlocksProducer), n = null == s ? void 0 : s.guideEffectContainer;
cc.isValid(n) && n.removeAllChildren();
for (var d = cc.director.getScene(), r = d ? d.getComponentsInChildren(hs.BlocksProducerItem) : [], a = 0; a < r.length; a++) {
var u = null !== (i = null === (t = r[a]) || void 0 === t ? void 0 : t.node) && void 0 !== i ? i : null;
cc.isValid(u) && cc.Tween.stopAllByTarget(u);
}
e.replace = !0;
this.debugLog("handleBlockProducerItemOpen: 引导结束跳过原版 opacity=255，避免块残留");
}
};
t.prototype.handleGetProducerBlockID = function(e) {
var t;
if (this.isNewbieGuideRound()) if (this.isGuideCompleted()) this.debugLog("handleGetProducerBlockID skip: guide completed"); else {
var i = null === (t = hs.blocksProducerInfo) || void 0 === t ? void 0 : t.producerBlocks;
if (29 === (null == i ? void 0 : i[2])) {
e.replace = !0;
e.returnValue = 29;
this.debugLog("handleGetProducerBlockID replace right block", {
producerBlocks: i
});
}
}
};
t.prototype.handleGuideEndDot = function(e) {
if (this.isNewbieGuideRound()) if (this.isGuideCompleted()) this.debugLog("handleGuideEndDot skip: guide already completed"); else {
this._placedCount++;
hs.storage.setItem("classGuidePlacedCount", this._placedCount);
this.debugLog("handleGuideEndDot: block placed", {
placedCount: this._placedCount
});
e.replace = !0;
this._placedCount >= 2 && this.completeGuide();
}
};
t.prototype.handleGuideShow = function(e) {
if (this.isNewbieGuideRound() && this.hasPlacedAnyBlock()) {
e.replace = !0;
this._showToken++;
this.destroyGuideNode();
this.debugLog("handleGuideShow: placed block, skip guide UI", {
placedCount: this._placedCount
});
}
};
t.prototype.handleRenderGuideState = function(e) {
var t;
if (this.isNewbieGuideRound() && this.hasPlacedAnyBlock()) {
var i = null === (t = e.args) || void 0 === t ? void 0 : t[0];
if (i) {
i.showHand = !1;
this.debugLog("handleRenderGuideState: placed block, hide hand", {
placedCount: this._placedCount
});
}
}
};
t.prototype.handleRequestBlocksProducer = function() {
if (this.isNewbieGuideRound() && this.isGuideCompleted()) {
this._shouldBlockNextProducerUpdate = !0;
this.debugLog("handleRequestBlocksProducer: guide completed, will block next beforeBlocksProducerUpdate");
}
};
t.prototype.handleBeforeBlocksProducerUpdate = function(e) {
var t, i;
if (this._shouldBlockNextProducerUpdate) {
this._shouldBlockNextProducerUpdate = !1;
var o = null === (t = e.args) || void 0 === t ? void 0 : t[0], s = null === (i = e.args) || void 0 === i ? void 0 : i[1];
if (o) for (var n = 0; n < o.length; n++) o[n] = -1;
if (s) for (n = 0; n < s.length; n++) s[n] = -1;
this.debugLog("handleBeforeBlocksProducerUpdate: cleared producerBlocks and colors");
}
};
t.prototype.handleGuideChangeTrait = function(e) {
if (this.isNewbieGuideRound() && this.hasPlacedAnyBlock()) {
e.replace = !0;
this.debugLog("handleGuideChangeTrait: placed block, keep hand hidden", {
placedCount: this._placedCount
});
}
};
t.prototype.clearBoardCacheForGuide = function() {
if (this.isNewbieGuideRound()) if (this._placedCount > 0) this.debugLog("clearBoardCacheForGuide skip: blocks already placed, preserve board"); else {
hs.storage.setItem("classFaceBlocks", 0);
this.debugLog("clearBoardCacheForGuide: cleared classFaceBlocks storage");
}
};
t.prototype.overrideGuideSteps = function() {
if (hs.classGuideInfo.show) {
for (var e = [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, 5, 4, 2, 6, 7, 1, -1 ], [ -1, 5, 4, 2, 6, 7, 1, -1 ], [ -1, -1, 4, 2, 6, 7, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ], t = [ {
x: 280,
y: -553.75
}, {
x: 318,
y: 73.25
} ], i = hs.classGuideInfo.steps, o = 0; o < i.length; o++) i[o] && Object.assign(i[o], {
save_arr: e,
producerBlocks: [ 42, -1, 29 ],
blocksColors: [ 4, 1, 4 ],
move: t
});
this.debugLog("overrideGuideSteps done", {
plan: this.plan
});
}
};
t.prototype.completeGuide = function() {
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
hs.EventManager.dispatchModuleEvent(new hs.E_ClassGuide_Change());
hs.EventManager.dispatchModuleEvent(new hs.E_Activity_ClassGuide_Change());
this._shouldBlockNextProducerUpdate = !1;
this.debugLog("completeGuide: guide marked as finished", {
placedCount: this._placedCount
});
this.sendAllGuideDots();
};
t.prototype.sendAllGuideDots = function() {
var e, t;
try {
for (var i = a(u), o = i.next(); !o.done; o = i.next()) {
var s = o.value;
this.sendGuideDot(s);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
o && !o.done && (t = i.return) && t.call(i);
} finally {
if (e) throw e.error;
}
}
};
t.prototype.sendGuideDot = function(e) {
if (this._sentGuideDots.has(e)) this.debugLog("sendGuideDot skip: already sent", {
key: e
}); else {
this._sentGuideDots.add(e);
DS(e);
this.debugLog("sendGuideDot: sent", {
key: e
});
}
};
t.prototype.onDisable = function() {
this.debugLog("onDisable destroy guide node");
this._disabled = !0;
this._showToken++;
this.destroyGuideNode();
};
t.prototype.preloadResources = function() {
var e = this;
if (this._skeletonData && cc.isValid(this._skeletonData)) {
this.debugLog("preload skip, skeletonData ready");
return Promise.resolve(!0);
}
if (this._preloadPromise) {
this.debugLog("preload reuse pending promise");
return this._preloadPromise;
}
this.debugLog("preload request", {
bundle: "LittleManNewbieGuideTrait",
url: "animation/gameplay_popup"
});
this._preloadPromise = hs.ResLoader.asyncLoadByBundle("LittleManNewbieGuideTrait", "animation/gameplay_popup", sp.SkeletonData).then(function(t) {
if (t && cc.isValid(t)) {
e._skeletonData = t;
e.debugLog("preload success");
return !0;
}
e.debugLog("preload failed: invalid skeletonData", t);
e._preloadPromise = null;
return !1;
}).catch(function(t) {
e.debugLog("preload catch error", t);
e._preloadPromise = null;
return !1;
});
return this._preloadPromise;
};
t.prototype.showGuideAnim = function(e) {
return d(this, void 0, Promise, function() {
var t, i, o, s;
return r(this, function(n) {
switch (n.label) {
case 0:
this.debugLog("showGuideAnim start", {
isPlaying: this._isPlaying,
hasTouchStarted: this._hasTouchStarted,
guideNodeValid: Boolean(this._guideNode && cc.isValid(this._guideNode)),
inAnim: this.inAnim,
initAnim: this.initAnim,
outAnim: this.outAnim
});
if (!this.isShowRequestValid(e)) {
this.debugLog("showGuideAnim skip: request invalid before preload");
return [ 2 ];
}
if (this._isPlaying) {
this.debugLog("showGuideAnim skip: already playing");
return [ 2 ];
}
return [ 4, this.preloadResources() ];

case 1:
t = n.sent();
if (!this.isShowRequestValid(e)) {
this.debugLog("showGuideAnim skip after preload: request expired");
return [ 2 ];
}
if (!t || !this._skeletonData || !cc.isValid(this._skeletonData)) {
this.debugLog("showGuideAnim skip: resource not ready", {
ready: t,
hasSkeletonData: Boolean(this._skeletonData)
});
return [ 2 ];
}
if (!(i = hs.effectLayer) || !cc.isValid(i)) {
this.debugLog("showGuideAnim skip: effectLayer invalid", {
hasEffectLayer: Boolean(i)
});
return [ 2 ];
}
this.destroyGuideNode();
o = new cc.Node("LittleManNewbieGuide");
(s = o.addComponent(sp.Skeleton)).skeletonData = this._skeletonData;
s.premultipliedAlpha = !1;
this.positionAtTopCenter(o, i);
if (!this.isShowRequestValid(e) || !cc.isValid(i) || !cc.isValid(o)) {
this.debugLog("showGuideAnim skip before addChild: request expired");
cc.isValid(o) && o.destroy();
return [ 2 ];
}
i.addChild(o);
this._guideNode = o;
this._hasPlayedOut = !1;
this._isPlaying = !0;
this.debugLog("showGuideAnim play", {
nodePosition: {
x: o.x,
y: o.y
},
parentName: i.name,
childCount: i.childrenCount,
inAnim: this.inAnim,
initAnim: this.initAnim
});
s.setAnimation(0, this.inAnim, !1);
s.addAnimation(0, this.initAnim, !0, 0);
return [ 2 ];
}
});
});
};
t.prototype.isNewbieGuideRound = function() {
var e, t;
return (null === (e = hs.gameInfo) || void 0 === e ? void 0 : e.gameMode) === hs.GameMode.Class && !0 !== hs.storage.getItem("isFinishedGuide", !1) && !0 === (null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.show);
};
t.prototype.isGuideCompleted = function() {
return this._placedCount >= 2;
};
t.prototype.hasPlacedAnyBlock = function() {
return this._placedCount > 0;
};
t.prototype.isShowRequestValid = function(e) {
return !this._disabled && !this._hasTouchStarted && e === this._showToken;
};
t.prototype.positionAtTopCenter = function(e, t) {
var i = cc.view.getVisibleSize(), o = cc.v3(i.width / 2, i.height, 0), s = t.convertToNodeSpaceAR(o);
e.setPosition(s.x + -255, s.y + -400, 0);
this.debugLog("positionAtTopCenter", {
visibleSize: {
width: i.width,
height: i.height
},
worldPos: {
x: o.x,
y: o.y
},
localPos: {
x: s.x,
y: s.y
},
offset: {
x: -255,
y: -400
},
finalPos: {
x: e.x,
y: e.y
}
});
};
t.prototype.playOutAnim = function() {
var e = this;
this.debugLog("playOutAnim start", {
hasGuideNode: Boolean(this._guideNode),
guideNodeValid: Boolean(this._guideNode && cc.isValid(this._guideNode)),
hasTouchStarted: this._hasTouchStarted,
hasPlayedOut: this._hasPlayedOut,
outAnim: this.outAnim
});
if (this._guideNode && cc.isValid(this._guideNode) && !this._hasPlayedOut) {
this._hasPlayedOut = !0;
var t = this._guideNode.getComponent(sp.Skeleton);
if (t && cc.isValid(t)) {
t.setCompleteListener(function() {
e.debugLog("out animation complete, destroy node");
e.destroyGuideNode();
});
t.clearTracks();
t.setAnimation(0, this.outAnim, !1);
this.debugLog("playOutAnim play", {
outAnim: this.outAnim
});
} else {
this.debugLog("playOutAnim no valid skeleton, destroy node");
this.destroyGuideNode();
}
} else this.debugLog("playOutAnim skip");
};
t.prototype.destroyGuideNode = function() {
if (this._guideNode && cc.isValid(this._guideNode)) {
this.debugLog("destroyGuideNode", {
nodeName: this._guideNode.name
});
var e = this._guideNode.getComponent(sp.Skeleton);
if (e && cc.isValid(e)) {
e.setCompleteListener(null);
e.clearTracks();
}
this._guideNode.destroy();
}
this._guideNode = null;
this._isPlaying = !1;
};
t.prototype.debugLog = function() {};
return n([ classId("LittleManNewbieGuideTrait") ], t);
}(Trait);
i.LittleManNewbieGuideTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "LittleManNewbieGuideTrait" ]);
//# sourceMappingURL=index.js.map
