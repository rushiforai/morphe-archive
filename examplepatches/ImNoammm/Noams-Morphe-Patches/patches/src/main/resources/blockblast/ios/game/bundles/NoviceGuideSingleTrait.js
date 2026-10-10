window.__require = function e(t, i, o) {
function r(n, a) {
if (!i[n]) {
if (!t[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!t[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var d = i[n] = {
exports: {}
};
t[n][0].call(d.exports, function(e) {
return r(t[n][1][e] || e);
}, d, d.exports, e, t, i, o);
}
return i[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) r(o[n]);
return r;
}({
NoviceGuideSingleTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "938b8fNOpdAJZMVBfYzHb7a", "NoviceGuideSingleTrait");
var o, r = this && this.__extends || (o = function(e, t) {
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
}), s = this && this.__decorate || function(e, t, i, o) {
var r, s = arguments.length, n = s < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, i, o); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (n = (s < 3 ? r(n) : s > 3 ? r(t, i, n) : r(t, i)) || n);
return s > 3 && n && Object.defineProperty(t, i, n), n;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.NoviceGuideSingleTrait = void 0;
var n = function(e) {
r(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.TRAIT_NAME = "NoviceGuideSingleTrait";
t.GUIDE_BLOCK_INDEX = [ 1, 2, 0 ];
t.TARGET_POSITIONS = [ [ [ 6, 1 ], [ 7, 0 ], [ 7, 1 ], [ 7, 2 ] ], [ [ 0, 5 ], [ 0, 6 ], [ 0, 7 ], [ 1, 7 ], [ 2, 7 ] ], [ [ 0, 0 ], [ 0, 1 ], [ 0, 2 ], [ 1, 0 ], [ 1, 1 ], [ 1, 2 ], [ 2, 0 ], [ 2, 1 ], [ 2, 2 ] ] ];
t._newSteps = [ {
save_arr: [ [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, 5, 5, -1 ], [ -1, -1, -1, 2, 2, 2, 2, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, -1, 2, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ 13, 10, 12 ],
blocksColors: [ 4, 4, 4 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 53,
y: -653.75
}, {
x: -265,
y: -191.75
} ]
}, {
save_arr: [ [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, 5, 5, -1 ], [ -1, -1, -1, 2, 2, 2, 2, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 4, 2, -1, -1, -1, -1, -1 ], [ 4, 4, 4, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ 13, -1, 12 ],
blocksColors: [ 4, 4, 4 ],
color: 4,
currentScore: 10,
highScore: 10,
move: [ {
x: 265,
y: -653.75
}, {
x: 265,
y: 391.25
} ]
}, {
save_arr: [ [ -1, -1, -1, 5, 5, 4, 4, 4 ], [ -1, -1, -1, 5, 5, 5, 5, 4 ], [ -1, -1, -1, 2, 2, 2, 2, 4 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 5, 2, -1, -1, -1, -1, -1 ], [ 5, 4, 2, -1, -1, -1, -1, -1 ], [ 4, 4, 4, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ 13, -1, -1 ],
blocksColors: [ 4, 4, 4 ],
color: 4,
currentScore: 20,
highScore: 20,
move: [ {
x: -265,
y: -653.75
}, {
x: -265,
y: 391.25
} ]
} ];
t._guideStep = 0;
return t;
}
t.prototype.onCreate = function() {
this.getLocalStorage();
};
t.prototype.getLocalStorage = function() {
var e = hs.storage.getItem("NoviceGuideSingleData", {
guideStep: 0
});
this._guideStep = e.guideStep;
};
Object.defineProperty(t.prototype, "guideStep", {
get: function() {
return this._guideStep;
},
set: function(e) {
this._guideStep = e;
this.saveLocalStorage();
},
enumerable: !1,
configurable: !0
});
t.prototype.saveLocalStorage = function() {
hs.storage.setItem("NoviceGuideSingleData", {
guideStep: this._guideStep
});
};
t.prototype.saveClassGuideStep = function() {
hs.storage.setItem("classGuideStep", this.guideStep);
};
t.prototype.isFinishedGuide = function() {
var e = hs.classGuideInfo.step;
if (e > 2) {
this.guideStep = e;
return !0;
}
return this.guideStep > 2;
};
t.prototype.setupGuideConfig = function() {
if (!this.isFinishedGuide()) {
this.applyGuideStepConfigs();
var e = this._newSteps[0], t = this._newSteps[1], i = this._newSteps[2];
if (e && t && i) {
hs.storage.setItem("guideStepConfigOverride_0", e);
hs.storage.setItem("guideStepConfigOverride_1", t);
hs.storage.setItem("guideStepConfigOverride_2", i);
}
}
};
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e) && this.handleTraitConfigInitComplete(e);
hs.tp.isClassBlocksProducer_ProxyOnInit(e) && this.handleBlocksProducerInit(e);
hs.tp.isClassGuide_ProxyRenderGuideState(e) && this.handleRenderGuideState(e);
hs.tp.isClassGuide_ProxyGuideEndDot(e) && this.handleGuideEndDot(e);
hs.tp.isClassBoard_ProxyOnBoardRender(e) && this.handleBoardRender(e);
hs.tp.isClassGuideGetProducerBlockID(e) && this.handleGetProducerBlockID(e);
hs.tp.isClassGuideAddChildToThisNode(e) && this.handleAddChildToThisNode(e);
hs.tp.isBlocksProducerTouchChangeTouchBox(e) && this.handleChangeTouchBox(e);
hs.tp.isBlocksProducerTouchInterceptTouchEnd(e) && this.handleInterceptTouchEnd(e);
hs.tp.isClassGuide_ProxyOnGuideChangeTrait(e) && this.handleGuideChangeTrait(e);
(hs.tp.isClassTopInfo_ProxyModifyScoreInGuide(e) || hs.tp.isClassTopInfoModifyScoreInGuide(e)) && this.handleModifyScoreInGuide(e);
};
t.prototype.handleModifyScoreInGuide = function(e) {
if (!this.isFinishedGuide()) {
e.replace = !0;
e.returnValue = e.args[0];
}
};
t.prototype.handleGuideChangeTrait = function(e) {
this.isFinishedGuide() || 2 === this.guideStep && (e.replace = !0);
};
t.prototype.handleTraitConfigInitComplete = function() {
this.setupGuideConfig();
};
t.prototype.handleGetProducerBlockID = function(e) {
if (!this.isFinishedGuide()) {
var t = this.guideStep, i = this.GUIDE_BLOCK_INDEX[t];
if (void 0 !== i) {
var o = this._newSteps[t];
if (o && void 0 !== o.producerBlocks[i] && -1 !== o.producerBlocks[i]) {
var r = o.producerBlocks[i];
e.replace = !0;
e.returnValue = r;
}
}
}
};
t.prototype.handleBlocksProducerInit = function() {
if (!this.isFinishedGuide()) {
this.setupGuideConfig();
var e = this.guideStep;
this.applyGuideStepConfigsToSteps(e);
}
};
t.prototype.handleRenderGuideState = function(e) {
if (!this.isFinishedGuide()) {
this.applyGuideStepConfigsToSteps(this.guideStep);
this.saveClassGuideStep();
e.args[0].step = this.guideStep;
if (!1 !== e.args[0].showHand) {
e.args[0].showHand = !0;
e.args[0].showDarkMask = !0;
}
}
};
t.prototype.applyGuideStepConfigs = function() {
var e, t = null === (e = hs.classGuideInfo) || void 0 === e ? void 0 : e.steps;
if (t) for (var i = 0; i < t.length; i++) {
var o = t[i];
if (o) {
var r = this._newSteps[i];
r && Object.assign(o, {
save_arr: r.save_arr,
producerBlocks: r.producerBlocks,
blocksColors: r.blocksColors,
color: r.color,
currentScore: r.currentScore,
highScore: r.highScore,
move: r.move
});
}
}
};
t.prototype.applyGuideStepConfigsToSteps = function(e) {
var t, i = null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.steps;
if (i) {
var o = this._newSteps[e];
if (o) {
var r = i[e];
if (r) {
Object.assign(r, {
save_arr: o.save_arr,
producerBlocks: o.producerBlocks,
blocksColors: o.blocksColors,
color: o.color,
currentScore: o.currentScore,
highScore: o.highScore,
move: o.move
});
hs.storage.setItem("classFaceBlocks", o.save_arr);
hs.storage.setItem("classProducerBlocks", o.producerBlocks);
}
}
}
};
t.prototype.handleGuideEndDot = function() {
if (!this.isFinishedGuide()) {
this.guideStep = this.guideStep + 1;
this.applyGuideStepConfigsToSteps(this.guideStep);
this.saveClassGuideStep();
if (this.guideStep <= 2) {
var e = Cinst(hs.ClassGuide);
e && e.setState({
step: this.guideStep,
showDarkMask: !0,
showHand: !0
});
}
}
};
t.prototype.handleBoardRender = function(e) {
if (!this.isFinishedGuide()) {
var t = this._newSteps[this.guideStep].save_arr, i = e.args[0].boards;
if (!this.isBoardMatch(i, t)) {
e.args[0].boards = t;
hs.storage.setItem("classFaceBlocks", t);
}
}
};
t.prototype.isBoardMatch = function(e, t) {
if (!e || !t) return !1;
if (e.length !== t.length) return !1;
for (var i = 0; i < e.length; i++) {
if (!e[i] || !t[i] || e[i].length !== t[i].length) return !1;
for (var o = 0; o < e[i].length; o++) if (e[i][o] !== t[i][o]) return !1;
}
return !0;
};
t.prototype.handleAddChildToThisNode = function() {
if (!this.isFinishedGuide()) {
var e = Cinst(hs.ClassGuide);
if (e) {
var t = e.blockList;
if (t && 0 !== t.length) {
var i = this.guideStep, o = this.GUIDE_BLOCK_INDEX[i], r = this._newSteps[i];
if (r && void 0 !== o) {
var s = r.producerBlocks[o];
if (-1 !== s && void 0 !== s) {
var n = hs.blockPosInfo[s - 1];
if (n) {
for (var a = 0, c = 0; c < n.length; c++) for (var u = 0; u < n[c].length; u++) 1 === n[c][u] && a++;
var d = function(e) {
var i = t[e];
if (i) {
i.active = !0;
i.opacity = 255;
setTimeoutSafe(function() {
i && cc.isValid(i) && (i.active = !1);
setTimeoutSafe(function() {
i && cc.isValid(i) && (i.active = !0);
}, 0);
}, 100);
}
};
for (c = 0; c < a && c < t.length; c++) d(c);
}
}
}
}
}
}
};
t.prototype.handleChangeTouchBox = function(e) {
if (!this.isFinishedGuide() && e.args[2] !== this.GUIDE_BLOCK_INDEX[this.guideStep]) {
e.replace = !0;
e.returnValue = cc.rect(0, 0, 0, 0);
}
};
t.prototype.handleInterceptTouchEnd = function(e) {
if (!this.isFinishedGuide()) {
this.saveClassGuideStep();
var t = e.target;
if (t._selectIndex === this.GUIDE_BLOCK_INDEX[this.guideStep]) {
var i = t._showShaders;
if (t._canSnap && i && 0 !== Object.keys(i).length) {
var o = this.TARGET_POSITIONS[this.guideStep];
if (o) {
var r = !0, s = function(e) {
var t = function(t) {
if (!o.some(function(i) {
return i[0] === +e && i[1] === +t;
})) {
r = !1;
return "break";
}
};
for (var s in i[e]) if ("break" === t(s)) break;
if (!r) return "break";
};
for (var n in i) if ("break" === s(n)) break;
r || this.resetBlockToHand(t, e);
}
}
} else this.resetBlockToHand(t, e);
}
};
t.prototype.resetBlockToHand = function(e, t) {
"function" == typeof e.resetLastBlocks && e.resetLastBlocks();
e.backBlocks();
"function" == typeof e._hideShadersNodes && e._hideShadersNodes(0);
"function" == typeof e.resetTouchData && e.resetTouchData();
e._selectItem = null;
e._selectIndex = -1;
e._lastSelectItem = null;
e._lastSelectIndex = -1;
hs.EventManager.dispatchModuleEvent(new hs.E_BlocksProducer_AnyTouchEnd());
t.replace = !0;
t.returnState = !0;
t.returnValue = !0;
};
return s([ classId("NoviceGuideSingleTrait") ], t);
}(Trait);
i.NoviceGuideSingleTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "NoviceGuideSingleTrait" ]);
//# sourceMappingURL=index.js.map
