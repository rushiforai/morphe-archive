window.__require = function e(t, r, o) {
function n(a, c) {
if (!r[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var l = r[a] = {
exports: {}
};
t[a][0].call(l.exports, function(e) {
return n(t[a][1][e] || e);
}, l, l.exports, e, t, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
$29437_f_SwitchOperateBlockToCenterOnBeginTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "70a74mZr1tM7p0HxB3mMKW/", "$29437_f_SwitchOperateBlockToCenterOnBeginTrait");
var o, n = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (n = e[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, r, a) : n(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
}, a = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], o = 0;
if (r) return r.call(e);
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
Object.defineProperty(r, "__esModule", {
value: !0
});
r.$29437_f_SwitchOperateBlockToCenterOnBeginTrait = void 0;
var c, s = e("./managers/SwitchOperateBlockToCenterOnBeginManager");
(function(e) {
e.AppShow = "appShow";
e.StartGameNotNew = "startGameNotNew";
})(c || (c = {}));
var u = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.coldStartMinutes = 10;
t.effectRounds = 3;
t.traitState = null;
t.lastHideTime = 0;
t.manager = new s.SwitchOperateBlockToCenterOnBeginManager();
return t;
}
t.prototype.onActive = function(e) {
if (hs.tp.isClassGame_ProxyOnGameStart(e) || hs.tp.isChapterGame_ProxyOnStartGame(e)) {
var t;
t = hs.gameInfo.gameMode === hs.GameMode.Chapter ? 0 === hs.chapterGameInfo.roundNum : 0 === hs.classGameInfo.roundNum;
this.resetCount();
this.resetAppHideTime();
if (!t) {
this.restartCount();
this.adjustBlockOrderAndProducerBlocks(c.StartGameNotNew);
}
}
if (hs.tp.isAlgorithmStrategyInfoAlgorithmComplete(e)) {
(this.isFirstRound() || this.isRevive()) && this.restartCount();
this.adjustBlockOrder();
}
(hs.tp.isClassTimer_ProxyOnGameHide(e) || hs.tp.isChapterTimer_ProxyOnGameHide(e)) && this.onAppHide(e);
if (hs.tp.isClassTimer_ProxyOnGameShow(e) || hs.tp.isChapterTimer_ProxyOnGameShow(e)) {
var r = this.isLongBackground();
this.resetAppHideTime();
r && this.restartCount();
this.onAppShow(r);
r || this.resetCount();
}
};
t.prototype.adjustBlockOrderAndProducerBlocks = function(e) {
if (this.checkRoundNum()) {
var t = hs.blocksProducerInfo.producerBlocks, r = this.changeBlockPosList(t);
if (3 === (null == r ? void 0 : r.length)) {
this.setProducerBlocks([ t[r[2]], t[r[0]], t[r[1]] ]);
e === c.AppShow && this.refreshProducerBlocksUI();
}
}
};
t.prototype.refreshProducerBlocksUI = function() {
var e = Cinst(hs.BlocksProducer);
e && cc.isValid(e.blocksContainer) && e.setState({
producerBlocks: hs.blocksProducerInfo.producerBlocks
});
};
t.prototype.adjustBlockOrder = function() {
if (this.checkRoundNum()) {
var e = hs.algorithmInfo.blockIdList;
this.changeBlockPosList(e);
}
};
t.prototype.changeBlockPosList = function(e) {
var t = this.manager.getOrderIndexList(e);
if (3 !== (null == t ? void 0 : t.length)) return t;
hs.algorithmStrategyBlocksPosInfo.adjustBlocksPosList([ t[2], t[0], t[1] ]);
var r = hs.OPERA_POS_TYPE.MIDDLE;
hs.algorithmStrategyBlocksPosInfo.setBlocksPosList(r);
return t;
};
t.prototype.resetAppHideTime = function() {
this.lastHideTime = 0;
};
t.prototype.onAppHide = function() {
this.lastHideTime = Date.now();
};
t.prototype.onAppShow = function(e) {
e && this.adjustBlockOrderAndProducerBlocks(c.AppShow);
};
t.prototype.isLongBackground = function() {
return !!this.lastHideTime && (Date.now() - this.lastHideTime >= 6e4 * this.coldStartMinutes && !!hs.gameInfo.isEffectiveMode());
};
t.prototype.checkRoundNum = function() {
if (!this.traitState) return !1;
var e = this.getCurrentRoundNum();
return e >= this.traitState.startRound && e <= this.traitState.endRound;
};
t.prototype.getCurrentRoundNum = function() {
var e = hs.gameInfo.gameMode;
return e === hs.GameMode.Class ? hs.classGameInfo.roundNum : e === hs.GameMode.Chapter ? hs.chapterGameInfo.roundNum : 0;
};
t.prototype.isFirstRound = function() {
return hs.gameInfo.gameMode == hs.GameMode.Chapter ? 1 === hs.chapterGameInfo.roundNum : 1 === hs.classGameInfo.roundNum;
};
t.prototype.isRevive = function() {
var e = !1;
hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoRevive && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoReviveTrait && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ChapterAlgorithmSourceType.TravelRevive && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ChapterAlgorithmSourceType.TravelReviveTrait || (e = !0);
return e;
};
t.prototype.resetCount = function() {
this.traitState = {
startRound: -1,
endRound: -1
};
};
t.prototype.restartCount = function() {
var e = this.getCurrentRoundNum();
this.traitState = {
startRound: e,
endRound: e + this.effectRounds - 1
};
};
t.prototype.setProducerBlocks = function(e) {
if (this.hasValidBlockByBlocks(e)) switch (hs.gameInfo.gameMode) {
case hs.GameMode.Class:
storage.setItem("classProducerBlocks", e);
break;

case hs.GameMode.Chapter:
storage.setItem("chapterProducerBlocks", e);
}
};
t.prototype.hasValidBlockByBlocks = function(e) {
var t, r;
if (3 == e.length) try {
for (var o = a(e), n = o.next(); !n.done; n = o.next()) {
var i = n.value;
if (i && -1 !== i) return !0;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
n && !n.done && (r = o.return) && r.call(o);
} finally {
if (t) throw t.error;
}
}
return !1;
};
return i([ classId("$29437_f_SwitchOperateBlockToCenterOnBeginTrait") ], t);
}(Trait);
r.$29437_f_SwitchOperateBlockToCenterOnBeginTrait = u;
cc._RF.pop();
}, {
"./managers/SwitchOperateBlockToCenterOnBeginManager": "SwitchOperateBlockToCenterOnBeginManager"
} ],
SwitchOperateBlockToCenterOnBeginData: [ function(e, t) {
"use strict";
cc._RF.push(t, "6ae99dstStPrJ5kd6a9541x", "SwitchOperateBlockToCenterOnBeginData");
cc._RF.pop();
}, {} ],
SwitchOperateBlockToCenterOnBeginManager: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "5f5a3lzzrxNy6Nsnn3sdhGM", "SwitchOperateBlockToCenterOnBeginManager");
var o = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, n, i = r.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (e) {
n = {
error: e
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, n = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(o(arguments[t]));
return e;
}, i = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], o = 0;
if (r) return r.call(e);
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
Object.defineProperty(r, "__esModule", {
value: !0
});
r.SwitchOperateBlockToCenterOnBeginManager = void 0;
var a = function() {
function e() {}
e.prototype.getOrderIndexList = function(e) {
var t = this.analyzeBlocks(e), r = this.decideCenterBlock(t);
return this.generateAdjustOrder(r);
};
e.prototype.analyzeBlocks = function(e) {
if (3 !== e.length) return {
cannotPlace: [],
uniquePlace: [],
cellCounts: []
};
if (!e.some(function(e) {
return e > 0;
})) return {
cannotPlace: [],
uniquePlace: [],
cellCounts: []
};
var t = new hs.BinaryBoard();
t.convertToBinaryBoard(hs.boardInfo.faceBlocks);
t.record();
for (var r = [], o = [], n = [], i = 0; i < 3; i++) {
var a = e[i];
if (-1 !== a && null != a) {
var c = t.canPut(a), s = t.getCanPutPoss(a);
c ? 1 === s.length && o.push(i) : r.push(i);
n[i] = this.getBlockCellCount(a);
} else n[i] = 0;
}
return {
cannotPlace: r,
uniquePlace: o,
cellCounts: n
};
};
e.prototype.decideCenterBlock = function(e) {
var t = e.cannotPlace, r = e.uniquePlace, o = e.cellCounts;
if (t.length > 0) return t;
if (r.length > 0) return r;
if (3 === o.length) {
Math.max.apply(Math, n(o));
for (var i = [], a = 0; a < o.length; a++) i.push({
blockIndex: a,
cellCount: o[a]
});
i.sort(function(e, t) {
if (-1 === e.cellCount && -1 === t.cellCount) return e.blockIndex - t.blockIndex;
if (-1 === e.cellCount) return 1;
if (-1 === t.cellCount) return -1;
if (e.cellCount === t.cellCount) {
if (1 === e.blockIndex) return -1;
if (1 === t.blockIndex) return 1;
if (2 === e.blockIndex) return 1;
if (2 === t.blockIndex) return -1;
}
return t.cellCount - e.cellCount;
});
return i.map(function(e) {
return e.blockIndex;
});
}
return [];
};
e.prototype.generateAdjustOrder = function(e) {
if (0 === e.length) return [ 1, 2, 0 ];
if (1 === e.length) {
var t = e[0], r = [ 0, 1, 2 ].filter(function(e) {
return e !== t;
});
return [ t, r[1], r[0] ];
}
if (2 === e.length) {
var n = o(e, 2);
return [ n[0], n[1], [ 0, 1, 2 ].find(function(t) {
return !e.includes(t);
}) ];
}
return 3 === e.length ? e : [ 1, 2, 0 ];
};
e.prototype.getBlockCellCount = function(e) {
var t, r, o = hs.BlockShapeMap[e];
if (!o) return 0;
var n = 0;
try {
for (var a = i(o.shape), c = a.next(); !c.done; c = a.next()) for (var s = c.value; s > 0; ) {
1 & s && n++;
s >>= 1;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
c && !c.done && (r = a.return) && r.call(a);
} finally {
if (t) throw t.error;
}
}
return n;
};
return e;
}();
r.SwitchOperateBlockToCenterOnBeginManager = a;
cc._RF.pop();
}, {} ]
}, {}, [ "$29437_f_SwitchOperateBlockToCenterOnBeginTrait", "SwitchOperateBlockToCenterOnBeginManager", "SwitchOperateBlockToCenterOnBeginData" ]);
//# sourceMappingURL=index.js.map
