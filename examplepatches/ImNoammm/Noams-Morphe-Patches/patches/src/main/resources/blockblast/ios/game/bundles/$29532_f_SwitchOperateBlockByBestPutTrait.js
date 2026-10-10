window.__require = function t(r, e, o) {
function n(i, l) {
if (!e[i]) {
if (!r[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!r[c]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var u = e[i] = {
exports: {}
};
r[i][0].call(u.exports, function(t) {
return n(r[i][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
$29532_f_SwitchOperateBlockByBestPutTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "5816f8RghJJbI00WTmAOc/d", "$29532_f_SwitchOperateBlockByBestPutTrait");
var o, n = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), a = this && this.__decorate || function(t, r, e, o) {
var n, a = arguments.length, i = a < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (i = (a < 3 ? n(i) : a > 3 ? n(r, e, i) : n(r, e)) || i);
return a > 3 && i && Object.defineProperty(r, e, i), i;
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.$29532_f_SwitchOperateBlockByBestPutTrait = void 0;
var l = t("./managers/BlockOrderManager"), c = function(t) {
n(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.manager = new l.BlockOrderManager();
return r;
}
r.prototype.onActive = function(t) {
var r, e;
if (hs.tp.isClassGame_ProxyOnGameStart(t) || hs.tp.isChapterGame_ProxyOnStartGame(t)) {
var o = t.args[0];
null !== (e = null === (r = null == o ? void 0 : o.data) || void 0 === r ? void 0 : r.newGame) && void 0 !== e && e || this.adjustBlockOrderAndProducerBlocks();
}
hs.tp.isAlgorithmStrategyInfoAlgorithmComplete(t) && this.isFirstRoundOrRevive() && this.adjustBlockOrder();
};
r.prototype.adjustBlockOrderAndProducerBlocks = function() {
var t = hs.blocksProducerInfo.producerBlocks, r = this.changeBlockPosList(t);
3 === (null == r ? void 0 : r.length) && this.setProducerBlocks([ t[r[2]], t[r[0]], t[r[1]] ]);
};
r.prototype.adjustBlockOrder = function() {
var t = hs.algorithmInfo.blockIdList;
this.changeBlockPosList(t);
};
r.prototype.changeBlockPosList = function(t) {
var r = this.manager.getOrderIndexList(t);
if (3 !== (null == r ? void 0 : r.length)) return r;
hs.algorithmStrategyBlocksPosInfo.adjustBlocksPosList([ r[2], r[0], r[1] ]);
var e = hs.OPERA_POS_TYPE.MIDDLE;
hs.algorithmStrategyBlocksPosInfo.setBlocksPosList(e);
return r;
};
r.prototype.isFirstRoundOrRevive = function() {
var t;
t = hs.gameInfo.gameMode == hs.GameMode.Chapter ? 1 === hs.chapterGameInfo.roundNum : 1 === hs.classGameInfo.roundNum;
var r = !1;
hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoRevive && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoReviveTrait && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ChapterAlgorithmSourceType.TravelRevive && hs.algorithmStrategyInfo.algorithmSourceLevel1 !== hs.ChapterAlgorithmSourceType.TravelReviveTrait || (r = !0);
return t || r;
};
r.prototype.setProducerBlocks = function(t) {
if (this.hasValidBlockByBlocks(t)) switch (hs.gameInfo.gameMode) {
case hs.GameMode.Class:
storage.setItem("classProducerBlocks", t);
break;

case hs.GameMode.Chapter:
storage.setItem("chapterProducerBlocks", t);
}
};
r.prototype.hasValidBlockByBlocks = function(t) {
var r, e;
if (3 == t.length) try {
for (var o = i(t), n = o.next(); !n.done; n = o.next()) {
var a = n.value;
if (a && -1 !== a) return !0;
}
} catch (t) {
r = {
error: t
};
} finally {
try {
n && !n.done && (e = o.return) && e.call(o);
} finally {
if (r) throw r.error;
}
}
return !1;
};
return a([ classId("$29532_f_SwitchOperateBlockByBestPutTrait") ], r);
}(Trait);
e.$29532_f_SwitchOperateBlockByBestPutTrait = c;
cc._RF.pop();
}, {
"./managers/BlockOrderManager": "BlockOrderManager"
} ],
BestPutInMassCenterUtil: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "b8075xZMnBGc5q/vvOrRZpB", "BestPutInMassCenterUtil");
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, a = e.call(t), i = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = a.next()).done; ) i.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = a.return) && e.call(a);
} finally {
if (n) throw n.error;
}
}
return i;
}, n = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(o(arguments[r]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.BestPutInMassCenterUtil = void 0;
var a = function() {
function t() {}
t.calcBlockCenterOfMass = function(t) {
if (this.blockShapeCenterOfMassMap.has(t)) return this.blockShapeCenterOfMassMap.get(t);
for (var r = hs.BlockShapeMap[t], e = [], o = 0; o < r.height; o++) {
for (var a = 0, i = 0; i < r.width; i++) r.shape[o] >> r.width - i - 1 & 1 && a++;
e[o] = a;
}
var l = [];
for (i = 0; i < r.width; i++) {
for (a = 0, o = 0; o < r.height; o++) r.shape[o] >> r.width - i - 1 & 1 && a++;
l[i] = a;
}
var c, s = Math.max.apply(Math, n(e)), u = e.map(function(t, r) {
return {
count: t,
index: r
};
}).filter(function(t) {
return t.count === s;
}).map(function(t) {
return t.index;
}), h = Math.max.apply(Math, n(l)), f = l.map(function(t, r) {
return {
count: t,
index: r
};
}).filter(function(t) {
return t.count === h;
}).map(function(t) {
return t.index;
});
c = 0 === u.length ? 0 : 1 === u.length ? u[0] : Math.ceil((u[0] + u[u.length - 1]) / 2);
var d;
d = 0 === f.length ? 0 : 1 === f.length ? f[0] : Math.floor((f[0] + f[f.length - 1]) / 2);
this.blockShapeCenterOfMassMap.set(t, [ c, d ]);
return [ c, d ];
};
t.drawAllBlockShape = function() {};
t.drawBlockShape = function() {};
t.blockShapeCenterOfMassMap = new Map();
return t;
}();
e.BestPutInMassCenterUtil = a;
cc._RF.pop();
}, {} ],
BlockOrderData: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "a8b3bbY3kRLw71cNNd0ArXe", "BlockOrderData");
Object.defineProperty(e, "__esModule", {
value: !0
});
cc._RF.pop();
}, {} ],
BlockOrderManager: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "5c691hNHa9OUp3IoLmChA6q", "BlockOrderManager");
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, a = e.call(t), i = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = a.next()).done; ) i.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = a.return) && e.call(a);
} finally {
if (n) throw n.error;
}
}
return i;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.BlockOrderManager = void 0;
var n = t("../utils/BestPutInMassCenterUtil"), a = function() {
function t() {}
t.prototype.getOrderIndexList = function(t) {
var r = this.getBlockSortInfoArr(t);
this.sortOperateBlockSortInfo(r);
return this.parseOrderIndexList(r);
};
t.prototype.parseOrderIndexList = function(t) {
return 3 !== t.length ? [] : -1 === t[0].rightPutRow ? [] : [ t[0].blockIndex, t[1].blockIndex, t[2].blockIndex ];
};
t.prototype.getBlockSortInfoArr = function(t) {
var r, e;
if (0 === (null == t ? void 0 : t.length)) return [];
if (t.every(function(t) {
return -1 === t;
})) return [];
var a = hs.algorithmInfo.blockPosList;
if (a && a.every(function(t) {
return 0 === t.row && 0 === t.col;
})) return [];
new hs.BinaryBoard().convertToBinaryBoard(hs.boardInfo.faceBlocks);
for (var i = [], l = 0; l < t.length; l++) {
var c = t[l];
i.push({
blockId: c,
blockIndex: l,
rightPutRow: -1,
rightPutCol: -1
});
if (-1 !== c) {
var s = hs.algorithmInfo.blockPosList[l], u = null !== (r = null == s ? void 0 : s.row) && void 0 !== r ? r : -1, h = null !== (e = null == s ? void 0 : s.col) && void 0 !== e ? e : -1;
if (-1 !== u && -1 !== h) {
var f = o(n.BestPutInMassCenterUtil.calcBlockCenterOfMass(c), 2), d = f[0], p = f[1];
i[l].rightPutRow = u + d;
i[l].rightPutCol = h + p;
}
}
}
return i;
};
t.prototype.sortOperateBlockSortInfo = function(t) {
t.sort(function(t, r) {
return -1 === t.blockId && -1 === r.blockId ? t.blockIndex - r.blockIndex : -1 === t.blockId ? 1 : -1 === r.blockId ? -1 : t.rightPutRow === r.rightPutRow ? t.rightPutCol === r.rightPutCol ? 1 === t.blockIndex ? -1 : 1 === r.blockIndex ? 1 : 2 === t.blockIndex ? 1 : 2 === r.blockIndex ? -1 : t.blockIndex - r.blockIndex : t.rightPutCol - r.rightPutCol : r.rightPutRow - t.rightPutRow;
});
};
return t;
}();
e.BlockOrderManager = a;
cc._RF.pop();
}, {
"../utils/BestPutInMassCenterUtil": "BestPutInMassCenterUtil"
} ]
}, {}, [ "$29532_f_SwitchOperateBlockByBestPutTrait", "BlockOrderManager", "BlockOrderData", "BestPutInMassCenterUtil" ]);
//# sourceMappingURL=index.js.map
