window.__require = function e(t, i, o) {
function s(n, u) {
if (!i[n]) {
if (!t[n]) {
var a = n.split("/");
a = a[a.length - 1];
if (!t[a]) {
var p = "function" == typeof __require && __require;
if (!u && p) return p(a, !0);
if (r) return r(a, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = a;
}
var d = i[n] = {
exports: {}
};
t[n][0].call(d.exports, function(e) {
return s(t[n][1][e] || e);
}, d, d.exports, e, t, i, o);
}
return i[n].exports;
}
for (var r = "function" == typeof __require && __require, n = 0; n < o.length; n++) s(o[n]);
return s;
}({
SixStepNewbieGuideTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "d0c88MSS6pINaY2FxaVaNNl", "SixStepNewbieGuideTrait");
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
}), r = this && this.__decorate || function(e, t, i, o) {
var s, r = arguments.length, n = r < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, i, o); else for (var u = e.length - 1; u >= 0; u--) (s = e[u]) && (n = (r < 3 ? s(n) : r > 3 ? s(t, i, n) : s(t, i)) || n);
return r > 3 && n && Object.defineProperty(t, i, n), n;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.SixStepNewbieGuideTrait = void 0;
var n = [ [ [ 2, 3 ], [ 3, 3 ], [ 4, 3 ] ], [ [ 4, 2 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ] ], [ [ 4, 5 ], [ 5, 4 ], [ 5, 5 ], [ 5, 6 ] ], [ [ 3, 3 ], [ 3, 4 ], [ 4, 3 ], [ 4, 4 ] ], [ [ 7, 1 ], [ 7, 2 ], [ 7, 3 ], [ 7, 4 ], [ 7, 5 ] ] ], u = function(e) {
s(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._guideStep = 0;
t._guideSteps = [ {
save_arr: [ [ -1, -1, -1, 5, -1, -1, -1, -1 ], [ -1, -1, -1, 4, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, 7, -1, -1, -1, -1 ], [ -1, -1, -1, 1, -1, -1, -1, -1 ], [ -1, -1, -1, 3, -1, -1, -1, -1 ] ],
producerBlocks: [ -1, 4, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 0,
y: -548.75
}, {
x: -53,
y: 180.25
} ]
}, {
save_arr: [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ 5, 4, -1, 2, 6, 7, 1, 3 ], [ 5, 4, -1, -1, -1, 7, 1, 3 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ -1, 8, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 10,
highScore: 10,
move: [ {
x: 53,
y: -548.75
}, {
x: -53,
y: 19.75
} ]
}, {
save_arr: [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ 5, 4, 2, 6, 7, -1, 1, 3 ], [ 5, 4, 2, 6, -1, -1, -1, 7 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ -1, 10, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 20,
highScore: 20,
move: [ {
x: 53,
y: -653.75
}, {
x: 159,
y: 19.75
} ]
}, {
save_arr: [ [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 2, 2, -1, -1, -1 ], [ 5, 5, 2, -1, -1, 2, 5, 5 ], [ 5, 5, 2, -1, -1, 2, 5, 5 ], [ -1, -1, -1, 2, 2, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ] ],
producerBlocks: [ -1, 9, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 30,
highScore: 30,
move: [ {
x: 0,
y: -553.75
}, {
x: 0,
y: 126.25
} ]
}, {
save_arr: [ [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, 5, 4, 2, 6, 7, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ -1, 11, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 40,
highScore: 40,
move: [ {
x: 53,
y: -653.75
}, {
x: -53,
y: -245.75
} ]
}, {
save_arr: [ [ 5, 4, 2, 6, 7, -1, -1, -1 ], [ 5, 4, 2, 6, 7, 1, 3, -1 ], [ 5, 4, 2, 6, 7, 1, 3, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ],
producerBlocks: [ -1, 12, -1 ],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 50,
highScore: 50,
move: [ {
x: 53,
y: -653.75
}, {
x: 265,
y: 390.25
} ]
} ];
return t;
}
t.prototype.onCreate = function() {
this.loadLocalStorage();
};
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e) && this.handleTraitConfigInitComplete();
hs.tp.isClassBlocksProducer_ProxyOnInit(e) && this.handleBlocksProducerInit();
hs.tp.isClassBlocksProducer_ProxyOnTouchEndDelay(e) && this.handleBlocksProducerTouchEndDelay(e);
hs.tp.isClassGuide_ProxyRenderGuideState(e) && this.handleRenderGuideState(e);
hs.tp.isClassGuide_ProxyGuideEndDot(e) && this.handleGuideEndDot(e);
hs.tp.isClassGuide_ProxyOnGuideChangeTrait(e) && this.handleGuideChangeTrait(e);
hs.tp.isClassGuide_ProxyOnTouchStart(e) && this.handleGuideTouchStart();
(hs.tp.isClassTopInfo_ProxyModifyScoreInGuide(e) || hs.tp.isClassTopInfoModifyScoreInGuide(e)) && this.handleModifyScoreInGuide(e);
hs.tp.isBlocksProducerTouchInterceptTouchEnd(e) && this.handleInterceptTouchEnd(e);
hs.tp.isClassGuide_ProxyOnAnyTouchEnd(e) && this.handleGuideAnyTouchEnd(e);
};
t.prototype.loadLocalStorage = function() {
var e = hs.storage.getItem("SixStepNewbieGuideData", {
guideStep: 0
});
this._guideStep = e.guideStep;
};
t.prototype.saveLocalStorage = function() {
hs.storage.setItem("SixStepNewbieGuideData", {
guideStep: this._guideStep
});
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
Object.defineProperty(t.prototype, "guideStepCount", {
get: function() {
return Math.min(6, this._guideSteps.length);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "isGuideFinished", {
get: function() {
return this.guideStep >= this.guideStepCount || hs.classGuideInfo.isFinishedGuide;
},
enumerable: !1,
configurable: !0
});
t.prototype.handleTraitConfigInitComplete = function() {
this.isGuideFinished || this.setupGuideConfig();
};
t.prototype.handleBlocksProducerInit = function() {
if (!this.isGuideFinished) {
this.setupGuideConfig();
this.applyGuideStepConfigsToSteps(this.guideStep);
}
};
t.prototype.handleBlocksProducerTouchEndDelay = function(e) {
if (!this.isGuideFinished && hs.classGuideInfo.show && e.args[0].state) {
var t = this.getActiveClassGuideStep(this.guideStep), i = t - 1;
this.applyGuideStepConfigsToClassSteps(this.guideStep, t);
this.saveGuideStepConfigOverrides(this.guideStep, t);
hs.storage.setItem("classGuideStep", i);
}
};
t.prototype.handleRenderGuideState = function(e) {
if (!this.isGuideFinished) {
this.applyGuideStepConfigsToSteps(this.guideStep);
var t = this.syncClassGuideStep();
e.args[0].step = t;
if (!1 !== e.args[0].showHand) {
e.args[0].showHand = !0;
e.args[0].showDarkMask = !0;
}
e.returnState = !0;
}
};
t.prototype.handleGuideTouchStart = function() {
this.isGuideFinished || this.syncClassGuideStep();
};
t.prototype.handleGuideAnyTouchEnd = function(e) {
!this.isGuideFinished && hs.classGuideInfo.show && (e.replace = !0);
};
t.prototype.handleGuideEndDot = function(e) {
if (!this.isGuideFinished && e.args[0].state.clearProducer) {
this.guideStep = this.guideStep + 1;
this.applyGuideStepConfigsToSteps(this.guideStep);
this.syncClassGuideStep();
}
};
t.prototype.handleGuideChangeTrait = function(e) {
this.isGuideFinished || this.guideStep < this.guideStepCount - 1 && (e.replace = !0);
};
t.prototype.handleModifyScoreInGuide = function(e) {
if (!this.isGuideFinished) {
e.replace = !0;
e.returnValue = e.args[0];
}
};
t.prototype.handleInterceptTouchEnd = function(e) {
if (this.shouldLimitGuidePlacement()) {
var t = e.target;
if (1 === t._selectIndex) {
var i = t._showShaders;
if (t._canSnap && i && 0 !== Object.keys(i).length) {
var o = n[this.guideStep];
o && (this.isValidGuidePosition(i, o) || this.resetBlockToHand(t, e));
} else this.restoreCurrentGuideHand();
} else this.resetBlockToHand(t, e);
}
};
t.prototype.shouldLimitGuidePlacement = function() {
return !this.isGuideFinished && this.guideStep < 5;
};
t.prototype.isValidGuidePosition = function(e, t) {
var i = function(i) {
var o = function(e) {
if (!t.some(function(t) {
return t[0] === +i && t[1] === +e;
})) return {
value: !1
};
};
for (var s in e[i]) {
var r = o(s);
if ("object" == typeof r) return r;
}
};
for (var o in e) {
var s = i(o);
if ("object" == typeof s) return s.value;
}
return !0;
};
t.prototype.resetBlockToHand = function(e, t) {
e.resetLastBlocks();
e.backBlocks();
e._hideShadersNodes(0);
e.resetTouchData();
e._selectItem = null;
e._selectIndex = -1;
e._lastSelectItem = null;
e._lastSelectIndex = -1;
t.replace = !0;
t.returnState = !0;
t.returnValue = !0;
this.restoreCurrentGuideHand();
};
t.prototype.restoreCurrentGuideHand = function() {
var e = this.getStepConfig(this.guideStep), t = Cinst(hs.ClassGuide);
e && t && t.setState({
step: this.syncClassGuideStep(),
showDarkMask: !0,
showHand: !0,
color: e.color
});
};
t.prototype.setupGuideConfig = function() {
this.applyGuideStepConfigsToSteps(this.guideStep);
this.syncClassGuideStep();
};
t.prototype.applyGuideStepConfigsToSteps = function(e) {
var t = this.getStepConfig(e);
if (t) {
var i = this.getActiveClassGuideStep(e);
this.applyGuideStepConfigsToClassSteps(e, i);
hs.storage.setItem("classFaceBlocks", t.save_arr);
hs.storage.setItem("classProducerBlocks", t.producerBlocks);
this.saveGuideStepConfigOverrides(e, i);
}
};
t.prototype.applyGuideStepConfigsToClassSteps = function(e, t) {
for (var i = hs.classGuideInfo.steps, o = 0; o <= 2; o++) {
var s = this.getStepConfigByClassStep(e, t, o);
s && this.applyConfigToStep(i, o, s);
}
};
t.prototype.applyConfigToStep = function(e, t, i) {
var o = e[t];
o && Object.assign(o, {
save_arr: i.save_arr,
producerBlocks: i.producerBlocks,
blocksColors: i.blocksColors,
color: i.color,
currentScore: i.currentScore,
highScore: i.highScore,
move: i.move
});
};
t.prototype.saveGuideStepConfigOverrides = function(e, t) {
void 0 === t && (t = this.getActiveClassGuideStep(e));
var i = t, o = this.getStepConfigByClassStep(e, i, 0), s = this.getStepConfigByClassStep(e, i, 1), r = this.getStepConfigByClassStep(e, i, 2);
o && hs.storage.setItem("guideStepConfigOverride_0", o);
s && hs.storage.setItem("guideStepConfigOverride_1", s);
r && hs.storage.setItem("guideStepConfigOverride_2", r);
};
t.prototype.syncClassGuideStep = function() {
var e = this.getActiveClassGuideStep(this.guideStep);
hs.storage.getItem("classGuideStep", 0) !== e && hs.storage.setItem("classGuideStep", e);
return e;
};
t.prototype.getClassGuideStep = function(e) {
return e - this.getGuideWindowStartStep(e);
};
t.prototype.getGuideWindowStartStep = function(e) {
var t = Math.max(this.guideStepCount - 3, 0);
return Math.min(e, t);
};
t.prototype.getActiveClassGuideStep = function(e) {
return this.getClassGuideStep(e);
};
t.prototype.getStepConfigByClassStep = function(e, t, i) {
var o = e + (i - t);
return o < 0 || o >= this.guideStepCount ? this.getStepConfig(e) : this.getStepConfig(o);
};
t.prototype.getStepConfig = function(e) {
return this._guideSteps[e];
};
return r([ classId("SixStepNewbieGuideTrait") ], t);
}(Trait);
i.SixStepNewbieGuideTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "SixStepNewbieGuideTrait" ]);
//# sourceMappingURL=index.js.map
