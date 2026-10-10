window.__require = function t(o, r, e) {
function i(s, n) {
if (!r[s]) {
if (!o[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!o[l]) {
var a = "function" == typeof __require && __require;
if (!n && a) return a(l, !0);
if (c) return c(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var h = r[s] = {
exports: {}
};
o[s][0].call(h.exports, function(t) {
return i(o[s][1][t] || t);
}, h, h.exports, t, o, r, e);
}
return r[s].exports;
}
for (var c = "function" == typeof __require && __require, s = 0; s < e.length; s++) i(e[s]);
return i;
}({
CTRefactorChangeBlockPosTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "32e875hcSBGaYlmdEtYOggR", "CTRefactorChangeBlockPosTrait");
var e, i = this && this.__extends || (e = function(t, o) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
e(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), c = this && this.__decorate || function(t, o, r, e) {
var i, c = arguments.length, s = c < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, o, r, e); else for (var n = t.length - 1; n >= 0; n--) (i = t[n]) && (s = (c < 3 ? i(s) : c > 3 ? i(o, r, s) : i(o, r)) || s);
return c > 3 && s && Object.defineProperty(o, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorChangeBlockPosTrait = void 0;
var s = function(t) {
i(o, t);
function o() {
var o, r = null !== t && t.apply(this, arguments) || this;
r._isLifed = !1;
r._blockClickSort = -1;
r._blockPutSort = ((o = {})[hs.DIFF_TYPE.SIMPLE] = [ 0, 1, 2 ], o[hs.DIFF_TYPE.MEDIUM] = [ 1, 0, 2 ], 
o[hs.DIFF_TYPE.DIFFICULT] = [ 2, 0, 1 ], o);
r._hardChapterArr = [ 4, 8 ];
r._mediumChapterArr = [ 2, 6 ];
r._validAlgoNames = [ "熵增3", "直觉难题", "死亡难题", "随机无死亡" ];
return r;
}
o.prototype.isBlocksProducer_ProxyOnTouchEnd = function(t) {
var o, r, e, i;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
if (storage.getItem("classGuideStep", 0) > 2) {
this.recordBlockClickSort(null === (o = t.args[0].state) || void 0 === o ? void 0 : o.touchIndex);
(null === (r = t.args[0].state) || void 0 === r ? void 0 : r.clearProducer) && this.addBlocksClickSortRecord();
}
} else {
this.recordBlockClickSort(null === (e = t.args[0].state) || void 0 === e ? void 0 : e.touchIndex);
(null === (i = t.args[0].state) || void 0 === i ? void 0 : i.clearProducer) && this.addBlocksClickSortRecord();
}
};
o.prototype.onAlgorithmStrategyGameInit = function() {
this.reset();
};
o.prototype.onAlgorithmStrategyPostprocessComplete = function() {
this.reset();
};
o.prototype.onAlgorithmStrategyPositionAdjust = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Chapter) {
var t = this.sortBlockByPlayerHabit(hs.algorithmInfo.blockIdList);
if (t) return {
data: this.getPositionTypeByOrder(t),
returnState: !0
};
}
};
o.prototype.getPositionTypeByOrder = function(t) {
switch (t.join(",")) {
case "0,1,2":
return hs.AlgorithmStrategyPositionType.LEFT;

case "2,0,1":
return hs.AlgorithmStrategyPositionType.MIDDLE;

case "2,1,0":
return hs.AlgorithmStrategyPositionType.RIGHT;

case "1,2,0":
return hs.AlgorithmStrategyPositionType.MIDDLE_LEFT;

case "1,0,2":
return hs.AlgorithmStrategyPositionType.RIGHT_LEFT;

case "0,2,1":
return hs.AlgorithmStrategyPositionType.LEFT_RIGHT;

default:
return hs.AlgorithmStrategyPositionType.LEFT;
}
};
o.prototype.setBlockClickSort = function(t) {
storage.setItem("chapterBlockClickSortRecord", t);
var o = this.getBlockClickSortModule();
storage.setItem("chapterChangeBlockPosBehavior", o);
};
o.prototype.getBlockClickSort = function() {
return storage.getItem("chapterBlockClickSortRecord", {
records: [],
sum: [],
sortPosSum: []
});
};
o.prototype.setIsLifedOfChangeBlockPos = function() {
this._isLifed = !0;
};
o.prototype.recordBlockClickSort = function(t) {
this._blockClickSortRecord = this._blockClickSortRecord || [];
this._blockClickSort = this._blockClickSort + 1;
this._blockClickSortRecord[this._blockClickSort] = t;
};
o.prototype.sortBlockByPlayerHabit = function(t) {
if (this._isLifed) this._isLifed = !1; else {
var o = this.getBlockClickSort();
if (o.sum && 0 !== o.sum.length && !(t.length < 3)) {
var r = hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId];
if (this._validAlgoNames.includes(r)) {
var e = storage.getItem("chapterNum", 0), i = this.getChapterDifficulty(e), c = this._blockPutSort[i], s = o.sum, n = [];
t.forEach(function(t, o) {
var r = c[o], e = s[r];
n[e] = o;
});
return n;
}
}
}
};
o.prototype.addBlocksClickSortRecord = function() {
if (2 == this._blockClickSort) {
var t = this.getBlockClickSort(), o = t.records;
o.push(this._blockClickSortRecord);
if (o.length < 100) {
this.setBlockClickSort(t);
this.reset();
} else {
var r = t.sortPosSum;
if (r && r.length > 0) {
o.shift().forEach(function(t, o) {
r[o][t] -= 1;
});
this._blockClickSortRecord.forEach(function(t, o) {
r[o][t] += 1;
});
} else {
t.sortPosSum = [ [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ] ];
r = t.sortPosSum;
o.forEach(function(t) {
t.forEach(function(t, o) {
r[o][t] += 1;
});
});
}
for (var e = [ 0, 0, 0 ], i = 0; i < 3; i++) for (var c = 0; c < 3; c++) e[i] += r[c][i] * (c + 1);
t.sum = e.map(function(t, o) {
return o;
});
t.sum.sort(function(t, o) {
return e[t] - e[o];
});
this.setBlockClickSort(t);
this.reset();
}
} else this.reset();
};
o.prototype.reset = function() {
this._blockClickSortRecord = [];
this._blockClickSort = -1;
};
o.prototype.getChapterDifficulty = function(t) {
var o = t % 10;
return this._hardChapterArr.includes(o) ? hs.DIFF_TYPE.DIFFICULT : this._mediumChapterArr.includes(o) ? hs.DIFF_TYPE.MEDIUM : hs.DIFF_TYPE.SIMPLE;
};
o.prototype.getBlockClickSortModule = function() {
var t = [], o = this.getBlockClickSort();
(null == o ? void 0 : o.sum) && (null == o ? void 0 : o.sum.length) > 0 && o.sum.forEach(function(o) {
t.push(++o);
});
return t;
};
return c([ classId("CTRefactorChangeBlockPosTrait") ], o);
}(Trait);
r.CTRefactorChangeBlockPosTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorChangeBlockPosTrait" ]);
//# sourceMappingURL=index.js.map
