window.__require = function e(o, t, r) {
function s(l, n) {
if (!t[l]) {
if (!o[l]) {
var u = l.split("/");
u = u[u.length - 1];
if (!o[u]) {
var a = "function" == typeof __require && __require;
if (!n && a) return a(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = u;
}
var d = t[l] = {
exports: {}
};
o[l][0].call(d.exports, function(e) {
return s(o[l][1][e] || e);
}, d, d.exports, e, o, t, r);
}
return t[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < r.length; l++) s(r[l]);
return s;
}({
TileExplorerGuideAlignmentTrait: [ function(e, o, t) {
"use strict";
cc._RF.push(o, "f12c6XoumFHaI0gluqAni9F", "TileExplorerGuideAlignmentTrait");
var r, s = this && this.__extends || (r = function(e, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, o) {
e.__proto__ = o;
} || function(e, o) {
for (var t in o) Object.prototype.hasOwnProperty.call(o, t) && (e[t] = o[t]);
})(e, o);
}, function(e, o) {
r(e, o);
function t() {
this.constructor = e;
}
e.prototype = null === o ? Object.create(o) : (t.prototype = o.prototype, new t());
}), i = this && this.__assign || function() {
return (i = Object.assign || function(e) {
for (var o, t = 1, r = arguments.length; t < r; t++) {
o = arguments[t];
for (var s in o) Object.prototype.hasOwnProperty.call(o, s) && (e[s] = o[s]);
}
return e;
}).apply(this, arguments);
}, l = this && this.__decorate || function(e, o, t, r) {
var s, i = arguments.length, l = i < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, t) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(e, o, t, r); else for (var n = e.length - 1; n >= 0; n--) (s = e[n]) && (l = (i < 3 ? s(l) : i > 3 ? s(o, t, l) : s(o, t)) || l);
return i > 3 && l && Object.defineProperty(o, t, l), l;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.TileExplorerGuideAlignmentTrait = void 0;
var n = [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ 3, 3, 3, -1, -1, 3, 3, 3 ], [ 3, 3, 3, -1, -1, 3, 3, 3 ], [ 3, 3, 3, -1, -1, 3, 3, 3 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ], u = [ -1, 36, -1 ], a = [ 3, 3, 3 ], d = [ [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ 7, 7, 7, -1, -1, 7, 7, 7 ], [ 7, 7, 7, -1, -1, 7, 7, 7 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ] ], c = [ -1, 9, -1 ], p = [ 7, 7, 7 ], h = [ [ 2, 3 ], [ 2, 4 ], [ 3, 3 ], [ 3, 4 ], [ 4, 3 ], [ 4, 4 ] ], f = [ [ 3, 3 ], [ 3, 4 ], [ 4, 3 ], [ 4, 4 ] ], m = function(e) {
s(o, e);
function o() {
var o = null !== e && e.apply(this, arguments) || this;
o._classAutoEndTriggered = !1;
o._isExecutingClassAutoEnd = !1;
o._postGuideAutoEndReadyGameNum = -1;
o._postGuideSecondOfferResult = null;
o._postGuideSecondBoard = null;
return o;
}
o.prototype.onActive = function(e) {
var o, t;
if (hs.tp.isClassGuide_ProxyIsShowHand(e)) {
e.replace = !0;
e.returnState = !0;
e.returnValue = !1;
}
if (hs.tp.isClassGuide_ProxyGetIsShowHand(e)) {
e.replace = !0;
e.returnState = !0;
e.returnValue = !1;
}
if (hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e)) {
this.applyRecordedGuideFinishedState();
if (hs.classGuideInfo.isFinishedGuide) return;
storage.setItem("classGuideStep", 2);
storage.setItem("classFaceBlocks", this.getTileExplorerBoardData());
storage.setItem("classProducerBlocks", this.getTileExplorerProducerBlocks());
}
if (hs.tp.isClassGuide_ProxyRenderGuideState(e)) {
var r = Cinst(hs.ClassGuide);
if (r) {
var s = this.getTileExplorerBlocksColors();
r.setState({
step: 2,
showDarkMask: !0,
showHand: !1,
color: null !== (o = s[1]) && void 0 !== o ? o : 1
});
e.replace = !0;
e.returnState = !0;
}
}
if (hs.tp.isClassBlocksProducer_ProxyBeforeBlocksProducerUpdate(e)) {
if (2 === hs.classGuideInfo.step) {
s = this.getTileExplorerBlocksColors();
storage.setItem("classColorLists", s);
e.args[1] = s;
e.returnState = !0;
}
if (this.shouldHandlePostGuideFirstGame()) {
this.ensurePostGuideFirstGameAutoEndReady();
this.shouldSyncPostGuideFirstGameInitialProducerBlocks() && this.applyPostGuideFirstGameBlocksAndColors(e);
}
this.shouldSyncPostGuideSecondGameProducerBlocks() && this.applyPostGuideSecondGameBlocks(e);
}
if (hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoardFinal(e) && this.shouldHandlePostGuideFirstGame()) {
this.ensurePostGuideFirstGameAutoEndReady();
var i = this.getTileExplorerSecondLevelBoardData();
e.args[0] = i;
e.returnState = !0;
}
if (hs.tp.isClassBlocksProducer_BlocksProducerValidate_ProxyOnBoardSplashAnimationEnd(e) && this.shouldHandlePostGuideFirstGame()) {
this.ensurePostGuideFirstGameAutoEndReady();
this.shouldSyncPostGuideFirstGameInitialProducerBlocks() && this.preparePostGuideFirstGameBlocksAndColors();
}
if (hs.tp.isClassBlocksProducer_BlocksProducerValidate_ProxySetRecordOperationColor(e) && this.shouldSyncPostGuideFirstGameInitialProducerBlocks()) {
this.ensurePostGuideFirstGameAutoEndReady();
e.returnState = !0;
e.replace = !0;
}
if (hs.tp.isClassBlocksProducer_BlocksProducerValidate_ProxyChangeGuideStepBlockColor(e) && 2 === (null === (t = e.args) || void 0 === t ? void 0 : t[1])) {
s = this.getTileExplorerBlocksColors();
e.returnValue = s;
e.returnState = !0;
e.replace = !0;
}
hs.tp.isClassBlocksProducer_ProxyOnTouchEndDelay(e) && this.handleClassBlocksProducerTouchEndDelay(e);
if (hs.tp.isUserAgeSurveyTraitShouldSetGuideBoardCache(e) && this.props.isCoverUserAgeSurveyBoard) {
storage.setItem("classGuideStep", 2);
e.returnState = !0;
e.returnValue = !1;
e.replace = !0;
}
if (hs.tp.isClassGameOver_GameEndPre_ProxyIsCanShowSplash(e) && this._isExecutingClassAutoEnd) {
e.returnState = !0;
e.returnValue = !1;
e.replace = !0;
}
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerBottomOfferAlgo(e) && this.handlePostGuideSecondGameBottomOfferAlgorithm(e);
if (hs.tp.isAlgorithmProcessInfoTriggerAlgorithmResult(e)) {
if (hs.gameInfo.gameMode != hs.GameMode.Class) return;
this.handlePostGuideSecondGameAlgorithmResult(e);
}
if (hs.tp.isClassBlocksProducer_ProxyUpdateItemsColors(e)) if (this.isTileExplorerGuideRound()) {
if (l = this.getTileExplorerFirstProducerBlockItemColors()) {
e.args[0] = this.buildItemsColorsByProducerBlocks(this.getTileExplorerProducerBlocks(), l);
e.returnState = !0;
}
} else if (this.shouldSyncPostGuideFirstGameInitialProducerBlocks()) {
var l;
if (l = this.getTileExplorerSecondProducerBlockItemColors()) {
e.args[0] = this.buildItemsColorsByProducerBlocks(this.getTileExplorerSecondLevelProducerBlocks(), l);
e.returnState = !0;
}
}
};
o.prototype.getTileExplorerBoardData = function() {
var e;
return this.getConfiguredBoard(null === (e = this.props) || void 0 === e ? void 0 : e.fristBoard, n);
};
o.prototype.getTileExplorerProducerBlocks = function() {
var e;
return this.getConfiguredProducerBlocks(null === (e = this.props) || void 0 === e ? void 0 : e.fristProducerBlock, u);
};
o.prototype.getTileExplorerSecondLevelBoardData = function() {
var e;
return this.getConfiguredBoard(null === (e = this.props) || void 0 === e ? void 0 : e.secondBoard, d);
};
o.prototype.getTileExplorerSecondLevelProducerBlocks = function() {
var e;
return this.getConfiguredProducerBlocks(null === (e = this.props) || void 0 === e ? void 0 : e.secondProducerBlock, c);
};
o.prototype.getTileExplorerFirstProducerBlockItemColors = function() {
var e;
return this.cloneItemColors(null === (e = this.props) || void 0 === e ? void 0 : e.fristProducerBlockColors);
};
o.prototype.getTileExplorerSecondProducerBlockItemColors = function() {
var e;
return this.cloneItemColors(null === (e = this.props) || void 0 === e ? void 0 : e.secondProducerBlockColors);
};
o.prototype.isEnableAutoSettle = function() {
var e;
return !1 !== (null === (e = this.props) || void 0 === e ? void 0 : e.enableAutoSettle);
};
o.prototype.isEnableSecondStep = function() {
var e;
return !1 !== (null === (e = this.props) || void 0 === e ? void 0 : e.enableSecondStep);
};
o.prototype.isEnableThirdStep = function() {
var e;
return !1 !== (null === (e = this.props) || void 0 === e ? void 0 : e.enableThirdStep);
};
o.prototype.getTileExplorerBlocksColors = function() {
var e = this.getTileExplorerFirstProducerBlockItemColors();
return e ? this.buildBlocksColorsByProducerBlocks(this.getTileExplorerProducerBlocks(), e, a) : a.slice();
};
o.prototype.getTileExplorerSecondLevelBlocksColors = function() {
var e = this.getTileExplorerSecondProducerBlockItemColors();
return e ? this.buildBlocksColorsByProducerBlocks(this.getTileExplorerSecondLevelProducerBlocks(), e, p) : p.slice();
};
o.prototype.getConfiguredBoard = function(e, o) {
return this.cloneBoard(this.isValidBoard(e) ? e : o);
};
o.prototype.getConfiguredProducerBlocks = function(e, o) {
return Array.isArray(e) && 3 === e.length ? e.slice() : o.slice();
};
o.prototype.cloneItemColors = function(e) {
if (!e || "object" != typeof e) return null;
var o = {}, t = e;
for (var r in t) {
var s = t[r];
"number" == typeof s && (o[r] = s);
}
return Object.keys(o).length > 0 ? o : null;
};
o.prototype.buildItemsColorsByProducerBlocks = function(e, o) {
return e.map(function(e) {
return -1 === e ? {} : i({}, o);
});
};
o.prototype.buildBlocksColorsByProducerBlocks = function(e, o, t) {
var r, s, i = this.getFirstItemColor(o, null !== (s = null !== (r = t[1]) && void 0 !== r ? r : t[0]) && void 0 !== s ? s : 1);
return e.map(function(e, o) {
var r;
return -1 === e && null !== (r = t[o]) && void 0 !== r ? r : i;
});
};
o.prototype.getFirstItemColor = function(e, o) {
var t = Object.keys(e).sort(function(e, o) {
return Number(e) - Number(o);
})[0], r = null != t ? e[t] : void 0;
return "number" == typeof r ? r : o;
};
o.prototype.handleClassBlocksProducerTouchEndDelay = function(e) {
var o, t = this, r = null === (o = e.args) || void 0 === o ? void 0 : o[0], s = null == r ? void 0 : r.state;
if (this.shouldAutoEndAfterTileExplorerClear(s)) {
this.isTileExplorerGuideRound() && this.recordTileExplorerGuideFinished();
this._classAutoEndTriggered = !0;
e.returnState = !0;
setTimeoutSafe(function() {
t.executeClassAutoEnd();
}, 500);
} else this.isTileExplorerGuideRound() && this.recordTileExplorerGuideFinished();
};
o.prototype.recordTileExplorerGuideFinished = function() {
storage.setItem("TileExplorerGuideAlignmentTrait_GuideFinished", !0);
};
o.prototype.applyRecordedGuideFinishedState = function() {
if (storage.getItem("TileExplorerGuideAlignmentTrait_GuideFinished", !1)) {
storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
storage.setItem("isFinishedGuide", !0);
}
};
o.prototype.shouldAutoEndAfterTileExplorerClear = function(e) {
return !this._classAutoEndTriggered && !!this.isEnableAutoSettle() && hs.gameInfo.gameMode === hs.GameMode.Class && !(!this.isTileExplorerGuideRound() && !this.shouldHandlePostGuideFirstGame()) && !!(e && e.touchBlockId === this.getTileExplorerTargetBlockId() && e.clearScreen && e.clearProducer) && !!this.isTileExplorerTargetBoard(e.faceBlocksBefore) && this.isCorrectTileExplorerPutPos(e.putPos);
};
o.prototype.isTileExplorerGuideRound = function() {
return !hs.classGuideInfo.isFinishedGuide && 2 === hs.classGuideInfo.step;
};
o.prototype.getTileExplorerTargetBlockId = function() {
return this.shouldHandlePostGuideFirstGame() ? this.getTargetBlockIdFromProducerBlocks(this.getTileExplorerSecondLevelProducerBlocks(), 9) : this.getTargetBlockIdFromProducerBlocks(this.getTileExplorerProducerBlocks(), 36);
};
o.prototype.getTargetBlockIdFromProducerBlocks = function(e, o) {
var t;
return null !== (t = e.find(function(e) {
return -1 !== e;
})) && void 0 !== t ? t : o;
};
o.prototype.shouldHandlePostGuideFirstGame = function() {
return this.isEnableSecondStep() && this.shouldHandlePostGuideGameNum(1);
};
o.prototype.shouldHandlePostGuideSecondGame = function() {
return this.isEnableThirdStep() && this.shouldHandlePostGuideGameNum(this.getPostGuideThirdStepGameNum());
};
o.prototype.getPostGuideThirdStepGameNum = function() {
return this.isEnableSecondStep() ? 2 : 1;
};
o.prototype.shouldHandlePostGuideGameNum = function(e) {
return hs.gameInfo.gameMode === hs.GameMode.Class && !(hs.classGuideInfo.show && !hs.classGuideInfo.isFinishedGuide) && hs.classGameInfo.gameNum === e;
};
o.prototype.shouldSyncPostGuideFirstGameInitialProducerBlocks = function() {
if (!this.shouldHandlePostGuideFirstGame()) return !1;
if (storage.getItem("TileExplorerGuideAlignmentTrait_SecondStepAppliedGameNum", -1) !== hs.classGameInfo.gameNum) return !0;
var e = storage.getItem("classProducerBlocks", [ -1, -1, -1 ]);
return this.isSameProducerBlocks(e, this.getTileExplorerSecondLevelProducerBlocks());
};
o.prototype.markPostGuideFirstGameInitialProducerBlocksApplied = function() {
storage.setItem("TileExplorerGuideAlignmentTrait_SecondStepAppliedGameNum", hs.classGameInfo.gameNum);
};
o.prototype.shouldApplyPostGuideSecondGameAlgorithmResult = function() {
return !!this.shouldHandlePostGuideSecondGame() && storage.getItem("TileExplorerGuideAlignmentTrait_ThirdStepAppliedGameNum", -1) !== hs.classGameInfo.gameNum;
};
o.prototype.markPostGuideSecondGameAlgorithmResultApplied = function() {
storage.setItem("TileExplorerGuideAlignmentTrait_ThirdStepAppliedGameNum", hs.classGameInfo.gameNum);
};
o.prototype.shouldSyncPostGuideSecondGameProducerBlocks = function() {
if (!this.shouldHandlePostGuideSecondGame() || !this._postGuideSecondOfferResult) return !1;
var e = storage.getItem("classProducerBlocks", [ -1, -1, -1 ]);
return this.isSameProducerBlocks(e, this._postGuideSecondOfferResult.ids);
};
o.prototype.isSameProducerBlocks = function(e, o) {
return !(!Array.isArray(e) || e.length !== o.length) && o.every(function(o, t) {
return e[t] === o;
});
};
o.prototype.ensurePostGuideFirstGameAutoEndReady = function() {
var e = hs.classGameInfo.gameNum;
if (this._postGuideAutoEndReadyGameNum !== e) {
this._classAutoEndTriggered = !1;
this._postGuideAutoEndReadyGameNum = e;
}
};
o.prototype.preparePostGuideFirstGameBlocksAndColors = function() {
storage.setItem("classProducerBlocks", this.getTileExplorerSecondLevelProducerBlocks());
hs.classColorProducerGameInfo.setColorList(this.getTileExplorerSecondLevelBlocksColors());
this.markPostGuideFirstGameInitialProducerBlocksApplied();
};
o.prototype.applyPostGuideFirstGameBlocksAndColors = function(e) {
var o = this.getTileExplorerSecondLevelProducerBlocks(), t = this.getTileExplorerSecondLevelBlocksColors();
storage.setItem("classProducerBlocks", o);
hs.classColorProducerGameInfo.setColorList(t);
e.args[0] = o;
e.args[1] = t;
e.returnState = !0;
this.markPostGuideFirstGameInitialProducerBlocksApplied();
};
o.prototype.handlePostGuideSecondGameBottomOfferAlgorithm = function() {
this.shouldApplyPostGuideSecondGameAlgorithmResult() && 1 === hs.classGameInfo.roundNum && hs.algorithmBottomSequenceInfo.setAlgorithmBottomList([ hs.OFFER_TYPE.COLD_START_CLEAR_BOARD ]);
};
o.prototype.handlePostGuideSecondGameAlgorithmResult = function(e) {
var o, t = this;
if (this.shouldApplyPostGuideSecondGameAlgorithmResult() && 1 === hs.classGameInfo.roundNum) {
var r = null === (o = e.args) || void 0 === o ? void 0 : o[0];
if ((null == r ? void 0 : r.algoType) === hs.OFFER_ALGORITHM_SDK_TYPE[hs.OFFER_TYPE.COLD_START_CLEAR_BOARD]) {
var s = this.getColdStartClearBoardFromResult(r), i = r.blockIds || [];
if (s && 3 === i.length) {
this._postGuideSecondBoard = this.cloneBoard(s);
this._postGuideSecondOfferResult = {
ids: i.slice(),
poss: (r.blockPoses || []).map(function(e) {
return {
x: e.row,
y: e.col
};
}),
names: (r.blockNames || []).slice()
};
storage.setItem("classFaceBlocks", this.cloneBoard(s));
storage.setItem("classInitialFaceBlocks", this.cloneBoard(s));
storage.setItem("classProducerBlocks", this._postGuideSecondOfferResult.ids.slice());
this.markPostGuideSecondGameAlgorithmResultApplied();
CinstAsync(hs.Board).then(function(e) {
e && cc.isValid(e) && e.setState({
boards: t.cloneBoard(s)
});
});
}
}
}
};
o.prototype.applyPostGuideSecondGameBlocks = function(e) {
if (this._postGuideSecondOfferResult && 3 === this._postGuideSecondOfferResult.ids.length) {
var o = this._postGuideSecondOfferResult.ids.slice();
storage.setItem("classProducerBlocks", o);
e.args[0] = o;
e.returnState = !0;
}
};
o.prototype.getColdStartClearBoardFromResult = function(e) {
var o, t, r, s, i = null !== (t = null === (o = e.extra) || void 0 === o ? void 0 : o.board) && void 0 !== t ? t : null === (s = null === (r = e.extra) || void 0 === r ? void 0 : r.selectComExtra) || void 0 === s ? void 0 : s.board;
return this.isValidBoard(i) ? i : null;
};
o.prototype.isValidBoard = function(e) {
return !(!Array.isArray(e) || 8 !== e.length) && e.every(function(e) {
return Array.isArray(e) && 8 === e.length;
});
};
o.prototype.cloneBoard = function(e) {
return e.map(function(e) {
return e.slice();
});
};
o.prototype.isTileExplorerTargetBoard = function(e) {
var o = this.shouldHandlePostGuideFirstGame() ? this.getTileExplorerSecondLevelBoardData() : this.getTileExplorerBoardData();
return this.isSameTileExplorerBoard(e, o);
};
o.prototype.isSameTileExplorerBoard = function(e, o) {
if (!Array.isArray(e) || e.length !== o.length) return !1;
for (var t = 0; t < o.length; t++) {
var r = e[t], s = o[t];
if (!Array.isArray(r) || r.length !== s.length) return !1;
for (var i = 0; i < s.length; i++) if (r[i] !== s[i]) return !1;
}
return !0;
};
o.prototype.isCorrectTileExplorerPutPos = function(e) {
var o = this.shouldHandlePostGuideFirstGame() ? f : h;
if (!Array.isArray(e) || e.length !== o.length) return !1;
for (var t = e.map(function(e) {
return e.x + "," + e.y;
}).sort(), r = o.map(function(e) {
return e[0] + "," + e[1];
}).sort(), s = 0; s < r.length; s++) if (t[s] !== r[s]) return !1;
return !0;
};
o.prototype.executeClassAutoEnd = function() {
var e = this;
hs.gameOverGameInfo.setClassTriggerGameOver(!0);
setTimeoutSafe(function() {
var o = e.findProxy(hs.ClassGameOver_GameEndPre_Proxy);
if (o) {
e._isExecutingClassAutoEnd = !0;
try {
o.onGameEndPre(new hs.E_GameOver_GameEndPre({
source: hs.GameOverSourceType.NormalFail
}));
} finally {
e._isExecutingClassAutoEnd = !1;
}
} else hs.gameOverGameInfo.setClassTriggerGameOver(!1);
}, 0);
};
o.prototype.findProxy = function(e) {
var o, t;
return null !== (t = null === (o = hs.ModuleManager.moduleList.find(function(o) {
return null == o ? void 0 : o.getProxy(e);
})) || void 0 === o ? void 0 : o.getProxy(e)) && void 0 !== t ? t : null;
};
return l([ classId("TileExplorerGuideAlignmentTrait") ], o);
}(Trait);
t.TileExplorerGuideAlignmentTrait = m;
cc._RF.pop();
}, {} ]
}, {}, [ "TileExplorerGuideAlignmentTrait" ]);
//# sourceMappingURL=index.js.map
