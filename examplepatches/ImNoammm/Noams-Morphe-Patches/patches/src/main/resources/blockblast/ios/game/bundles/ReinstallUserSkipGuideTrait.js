window.__require = function e(t, i, o) {
function n(s, a) {
if (!i[s]) {
if (!t[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!t[u]) {
var d = "function" == typeof __require && __require;
if (!a && d) return d(u, !0);
if (r) return r(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var l = i[s] = {
exports: {}
};
t[s][0].call(l.exports, function(e) {
return n(t[s][1][e] || e);
}, l, l.exports, e, t, i, o);
}
return i[s].exports;
}
for (var r = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
ReinstallUserQBlockNewGuideHandler: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "e663fgAwxBLpYumxkxO40zS", "ReinstallUserQBlockNewGuideHandler");
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ReinstallUserQBlockNewGuideHandler = void 0;
var o = function() {
function e() {
this.TAG = "[ReinstallUserQBlockNewGuideHandler]";
this.guideStep0Config = {
save_arr: e.SAVE_ARRAY[0],
producerBlocks: e.OPERA_ARRAY[0],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 53,
y: -653.75
}, {
x: -53,
y: 126.75
} ]
};
this.guideStep1Config = {
save_arr: e.SAVE_ARRAY[1],
producerBlocks: e.OPERA_ARRAY[1],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 53,
y: -548.75
}, {
x: -53,
y: 19.75
} ]
};
}
e.prototype.canHandle = function() {
return hs.classGuideInfo.step <= 2 && this.qblockGuideStep <= 2;
};
e.prototype.handleTraitConfigInitComplete = function() {
this.qblockGuideStep;
this.applyGuideStepConfigs();
};
e.prototype.handleRenderGuideState = function(e) {
var t = this.qblockGuideStep;
2 === t && (e.args[0].showHand = !0);
this.applyGuideStepConfigsToSteps(t);
hs.storage.setItem("classGuideStep", t);
e.args[0].step = t;
e.returnState = !0;
};
e.prototype.handleGuideEndDot = function() {
this.incrementGuideStep(this.qblockGuideStep);
};
e.prototype.handleGuideChangeTrait = function(e) {
this.preventHideHandInThirdStep(e, this.qblockGuideStep);
};
e.prototype.handleModifyScoreInGuide = function(e) {
this.modifyScoreInGuide(e, this.qblockGuideStep);
};
e.prototype.handleSetScoreLabel = function(e) {
this.setScoreLabel(e, this.qblockGuideStep);
};
e.prototype.handleBoardInit = function() {
var e = this.qblockGuideStep;
this.applyGuideStepConfigsToSteps(e);
hs.storage.setItem("classGuideStep", e);
};
e.prototype.handleInterceptTouchEnd = function(e) {
var t = this.qblockGuideStep;
if (!(t >= 2)) {
var i = e.target;
if ((null == i ? void 0 : i.canSnap) && !this.isCurrentGuidePlacementValid(i.showShaders, t)) {
this.resetBlockToHand(i);
this.restoreGuideDisplay(t);
e.returnState = !0;
e.returnValue = !0;
}
}
};
Object.defineProperty(e.prototype, "qblockGuideStep", {
get: function() {
return hs.storage.getItem("QBlockNewGuideStep", 0);
},
enumerable: !1,
configurable: !0
});
e.prototype.setQBlockGuideStep = function(e) {
hs.storage.setItem("QBlockNewGuideStep", e);
};
e.prototype.incrementGuideStep = function(e) {
if (!(e >= 2)) {
var t = e + 1;
this.setQBlockGuideStep(t);
hs.storage.setItem("classFaceBlocks", [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ]);
}
};
e.prototype.preventHideHandInThirdStep = function(e, t) {
2 === t && (e.replace = !0);
};
e.prototype.modifyScoreInGuide = function(e, t) {
if (0 === t) {
e.replace = !0;
e.returnState = !0;
e.returnValue = 0;
hs.storage.setItem("classScore", 0);
}
if (1 === t) {
e.replace = !0;
e.returnState = !0;
e.returnValue = 10;
hs.storage.setItem("classScore", 10);
}
};
e.prototype.setScoreLabel = function(e, t) {
0 === t && (e.args[0] = 0);
1 === t && (e.args[0] = 10);
};
e.prototype.isCurrentGuidePlacementValid = function(t, i) {
var o = e.TARGET_POSITIONS[i];
if (!o) return !0;
if (this.getShowShaderPositionCount(t) !== o.length) return !1;
var n = function(e) {
var i = function(t) {
if (!o.some(function(i) {
return i[0] === Number(e) && i[1] === Number(t);
})) return {
value: !1
};
};
for (var n in t[e]) {
var r = i(n);
if ("object" == typeof r) return r;
}
};
for (var r in t) {
var s = n(r);
if ("object" == typeof s) return s.value;
}
return !0;
};
e.prototype.getShowShaderPositionCount = function(e) {
var t = 0;
for (var i in e) t += Object.keys(e[i]).length;
return t;
};
e.prototype.resetBlockToHand = function(e) {
e.resetLastBlocks();
e.backBlocks();
e.hideShadersNodes(0);
e.resetTouchData();
e.resetLastData();
};
e.prototype.restoreGuideDisplay = function(e) {
if (hs.classGuideInfo.show) {
hs.storage.setItem("classGuideStep", e);
var t = Cinst(hs.ClassGuide);
t && t.setState({
step: e,
showDarkMask: !0,
showHand: !0
});
}
};
e.prototype.applyGuideStepConfigs = function() {
hs.storage.setItem("guideStepConfigOverride_0", this.guideStep0Config);
hs.storage.setItem("guideStepConfigOverride_1", this.guideStep1Config);
};
e.prototype.applyGuideStepConfigsToSteps = function(e) {
var t, i = null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.steps;
if (i) {
if (0 === e && i[0]) {
this.applyConfigToStep(i[0], this.guideStep0Config, 0);
this.refreshBoardAndBlocks(e);
}
if (1 === e && i[1]) {
this.applyConfigToStep(i[1], this.guideStep1Config, 1);
this.refreshBoardAndBlocks(e);
}
}
};
e.prototype.refreshBoardAndBlocks = function(e) {
var t = 0 === e ? this.guideStep0Config : 1 === e ? this.guideStep1Config : null;
if (t) {
hs.storage.setItem("classFaceBlocks", t.save_arr);
hs.storage.setItem("classProducerBlocks", t.producerBlocks);
}
};
e.prototype.applyConfigToStep = function(e, t) {
e.save_arr = t.save_arr.map(function(e) {
return e.slice();
});
e.producerBlocks = t.producerBlocks.slice();
e.blocksColors = t.blocksColors.slice();
e.color = t.color;
e.currentScore = t.currentScore;
e.highScore = t.highScore;
e.move = t.move.map(function(e) {
return {
x: e.x,
y: e.y
};
});
};
e.OPERA_ARRAY = [ [ -1, 2, -1 ], [ -1, 8, -1 ] ];
e.TARGET_POSITIONS = [ [ [ 3, 3 ], [ 4, 3 ] ], [ [ 4, 2 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ] ] ];
e.SAVE_ARRAY = [ [ [ -1, -1, -1, 5, -1, -1, -1, -1 ], [ -1, -1, -1, 4, -1, -1, -1, -1 ], [ -1, -1, -1, 2, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, 7, -1, -1, -1, -1 ], [ -1, -1, -1, 1, -1, -1, -1, -1 ], [ -1, -1, -1, 3, -1, -1, -1, -1 ] ], [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ 5, 4, -1, 2, 6, 7, 1, 3 ], [ 5, 4, -1, -1, -1, 7, 1, 3 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ] ];
return e;
}();
i.ReinstallUserQBlockNewGuideHandler = o;
cc._RF.pop();
}, {} ],
ReinstallUserSkipGuideTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "505166RzVJKRK8J3MCz2PEv", "ReinstallUserSkipGuideTrait");
var o, n = this && this.__extends || (o = function(e, t) {
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
var n, r = arguments.length, s = r < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, i, o); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (s = (r < 3 ? n(s) : r > 3 ? n(t, i, s) : n(t, i)) || s);
return r > 3 && s && Object.defineProperty(t, i, s), s;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ReinstallUserSkipGuideTrait = void 0;
var s = e("./ReinstallUserQBlockNewGuideHandler"), a = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.TAG = "[ReinstallUserSkipGuideTrait]";
t._qBlockNewGuideHandler = new s.ReinstallUserQBlockNewGuideHandler();
t._firstRoundGenerateEndTime = 0;
return t;
}
Object.defineProperty(t.prototype, "newUserRangeDays", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.newUserRangeDays) && void 0 !== t ? t : 14;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "pureNewUserGuideMode", {
get: function() {
var e;
return (null === (e = this.props) || void 0 === e ? void 0 : e.pureNewUserGuideMode) || 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "reinstallFirstLaunchLanding", {
get: function() {
var e;
return (null === (e = this.props) || void 0 === e ? void 0 : e.reinstallFirstLaunchLanding) || 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "reinstallUserPlanMode", {
get: function() {
var e;
return (null === (e = this.props) || void 0 === e ? void 0 : e.reinstallUserPlanMode) || 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "isAdjustInitTime", {
get: function() {
var e;
return (null === (e = this.props) || void 0 === e ? void 0 : e.isAdjustInitTime) || !1;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
if (hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e)) {
this.handleFirstLaunchLanding();
this.handleQBlockNewGuideTraitConfigInitComplete();
}
hs.tp.isClassGame_ProxyOnGameStart(e) && this.handleClassGameGameInit();
hs.tp.isUserAgeSurveyAgeNodeComponentOnAgeButtonClick(e) && this.handleUserAgeSurveyAgeButtonClick(e);
hs.tp.isClassBlocksProducer_ProxyOnGenerateEnd(e) && this.recordFirstRoundGenerateEndTime();
hs.tp.isIsPuzzleTimeTraitDynamicAdjustInitTime(e) && this.dynamicAdjustInitTime(e);
hs.tp.isPuzzle100TraitDynamicAdjustInitTime(e) && this.dynamicAdjustInitTime(e);
hs.tp.isClassGuide_ProxyRenderGuideState(e) && this.handleQBlockNewGuideRenderGuideState(e);
hs.tp.isClassGuide_ProxyGuideEndDot(e) && this.handleQBlockNewGuideEndDot();
hs.tp.isClassGuide_ProxyOnGuideChangeTrait(e) && this.handleQBlockNewGuideChangeTrait(e);
(hs.tp.isClassTopInfo_ProxyModifyScoreInGuide(e) || hs.tp.isClassTopInfoModifyScoreInGuide(e)) && this.handleQBlockNewGuideModifyScoreInGuide(e);
hs.tp.isClassTopInfoSetScoreLabel(e) && this.handleQBlockNewGuideSetScoreLabel(e);
hs.tp.isBlocksProducerTouchInterceptTouchEnd(e) && this.handleQBlockNewGuideInterceptTouchEnd(e);
hs.tp.isClassBoard_ProxyOnBoardInit(e) && this.handleQBlockNewGuideBoardInit();
};
t.prototype.handleFirstLaunchLanding = function() {
if (this.shouldEnterHomePageOnFirstLaunch()) {
hs.storage.setItem("intoModeChoice", !0);
this.finishClassGuide();
}
};
t.prototype.shouldEnablePureNewGuideEnhanceTraits = function() {
return 1 === this.pureNewUserGuideMode && this.isPureNewUserGuideAvailable();
};
t.prototype.isPureNewUserGuideAvailable = function() {
return !hs.classGuideInfo.isFinishedGuide && this.isInNewUserRange() && !this.isReturningUser();
};
t.prototype.shouldUseQBlockNewGuideHandler = function() {
return this.shouldEnablePureNewGuideEnhanceTraits() && this._qBlockNewGuideHandler.canHandle();
};
t.prototype.handleQBlockNewGuideTraitConfigInitComplete = function() {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleTraitConfigInitComplete();
};
t.prototype.handleQBlockNewGuideRenderGuideState = function(e) {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleRenderGuideState(e);
};
t.prototype.handleQBlockNewGuideEndDot = function() {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleGuideEndDot();
};
t.prototype.handleQBlockNewGuideChangeTrait = function(e) {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleGuideChangeTrait(e);
};
t.prototype.handleQBlockNewGuideModifyScoreInGuide = function(e) {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleModifyScoreInGuide(e);
};
t.prototype.handleQBlockNewGuideSetScoreLabel = function(e) {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleSetScoreLabel(e);
};
t.prototype.handleQBlockNewGuideBoardInit = function() {
this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleBoardInit();
};
t.prototype.handleQBlockNewGuideInterceptTouchEnd = function(e) {
this.isClassGameMode() && this.shouldUseQBlockNewGuideHandler() && this._qBlockNewGuideHandler.handleInterceptTouchEnd(e);
};
t.prototype.handleClassGameGameInit = function() {
this._firstRoundGenerateEndTime = 0;
this.shouldSkipGuide() && this.finishClassGuide();
};
t.prototype.handleUserAgeSurveyAgeButtonClick = function() {
this.shouldSkipGuideUser() && this.markClassGuideFinished();
};
t.prototype.recordFirstRoundGenerateEndTime = function() {
!this.shouldAdjustInitTime() || 1 !== hs.classGameInfo.roundNum || this._firstRoundGenerateEndTime > 0 || (this._firstRoundGenerateEndTime = Date.now());
};
t.prototype.dynamicAdjustInitTime = function(e) {
if (this.shouldAdjustInitTime()) {
var t = e.args[0];
this._firstRoundGenerateEndTime > 0 && this._firstRoundGenerateEndTime !== t && (e.returnValue = this._firstRoundGenerateEndTime);
}
};
t.prototype.shouldSkipGuide = function() {
return !hs.classGuideInfo.isFinishedGuide && 0 === this.reinstallUserPlanMode && this.isInNewUserRange() && this.isReturningUser();
};
t.prototype.shouldSkipGuideUser = function() {
return 0 === this.reinstallUserPlanMode && this.isInNewUserRange() && this.isReturningUser();
};
t.prototype.shouldEnterHomePageOnFirstLaunch = function() {
return !hs.classGuideInfo.isFinishedGuide && 1 === this.reinstallFirstLaunchLanding && this.shouldSkipGuide();
};
t.prototype.shouldAdjustInitTime = function() {
return this.isAdjustInitTime && this.isClassGameMode() && this.isInNewUserRange() && 0 === hs.classGameInfo.gameNum;
};
t.prototype.isClassGameMode = function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
};
t.prototype.finishClassGuide = function() {
this.guideStartDot();
this.markClassGuideFinished();
this.guideEndDot();
};
t.prototype.markClassGuideFinished = function() {
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classInitialFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classScore", 0);
};
t.prototype.guideStartDot = function() {
var e;
try {
DS(null === (e = hs.classGuideInfo.steps[2]) || void 0 === e ? void 0 : e.dotStart);
} catch (e) {}
};
t.prototype.guideEndDot = function() {
var e;
try {
DS(null === (e = hs.classGuideInfo.steps[2]) || void 0 === e ? void 0 : e.dotEnd);
} catch (e) {}
};
t.prototype.isInNewUserRange = function() {
var e = this.newUserRangeDays, t = hs.gameInfo.installTime || hs.gameInfo.firstEntryTime;
if (!t || t <= 0) return !hs.gameInfo.isP5ActiveUsers;
var i = (Date.now() - t) / 864e5;
return i >= 0 && i <= e;
};
t.prototype.isReturningUser = function() {
var e, t = null === (e = hs.deviceInfo.data) || void 0 === e ? void 0 : e.distinct_id;
return !!t && /_\d+$/.test(t);
};
return r([ classId("ReinstallUserSkipGuideTrait") ], t);
}(Trait);
i.ReinstallUserSkipGuideTrait = a;
cc._RF.pop();
}, {
"./ReinstallUserQBlockNewGuideHandler": "ReinstallUserQBlockNewGuideHandler"
} ]
}, {}, [ "ReinstallUserQBlockNewGuideHandler", "ReinstallUserSkipGuideTrait" ]);
//# sourceMappingURL=index.js.map
