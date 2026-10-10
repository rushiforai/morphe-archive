window.__require = function t(r, e, i) {
function o(a, s) {
if (!e[a]) {
if (!r[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!r[f]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(f, !0);
if (n) return n(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var c = e[a] = {
exports: {}
};
r[a][0].call(c.exports, function(t) {
return o(r[a][1][t] || t);
}, c, c.exports, t, r, e, i);
}
return e[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < i.length; a++) o(i[a]);
return o;
}({
TravelDifficultWithDayAndLevelTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "6dc8202wolOVbvsxLKaoUck", "TravelDifficultWithDayAndLevelTrait");
var i, o = this && this.__extends || (i = function(t, r) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
i(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), n = this && this.__decorate || function(t, r, e, i) {
var o, n = arguments.length, a = n < 3 ? r : null === i ? i = Object.getOwnPropertyDescriptor(r, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, i); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (a = (n < 3 ? o(a) : n > 3 ? o(r, e, a) : o(r, e)) || a);
return n > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.TravelDifficultWithDayAndLevelTrait = void 0;
var a = function(t) {
o(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.progressArray = [];
r.PROGRESS_STORAGE_KEY = "travel_difficult_progress";
return r;
}
Object.defineProperty(r.prototype, "isAlignTheMainPackage", {
get: function() {
var t, r;
return null !== (r = null === (t = this.props) || void 0 === t ? void 0 : t.alignTheMainPackage) && void 0 !== r && r;
},
enumerable: !1,
configurable: !0
});
r.prototype.onActive = function(t) {
var r, e, i;
if (this.isOpen()) {
if (hs.tp.isChapterCollect_ProxyOnGameStart(t)) {
var o = null === (r = null == t ? void 0 : t.args) || void 0 === r ? void 0 : r[0], n = null !== (i = null === (e = null == o ? void 0 : o.data) || void 0 === e ? void 0 : e.newGame) && void 0 !== i && i;
this.initDifficult(n);
}
if (hs.tp.isChapterDifficultyStrategyGameInfoGetChapterDifficultyWithTrait(t)) {
var a = t.args[0], s = t.args[1];
if (!t.args[2]) {
var f = this.getDifficult(a, s);
this.isAlignTheMainPackage && (f = this.getDifficult(a, f));
t.args[1] = f;
}
}
if (hs.tp.isChapterAlgorithmStrategyIOS_Deal_ProxyTriggerAlgorithm(t)) {
a = hs.chapterGameInfo.chapterNum;
if (this.isProgressReached()) {
this.consumeNextProgress(a);
hs.algorithmStrategyInfo.setAlgorithmSourceLevel1(hs.ChapterAlgorithmSourceType.RatoChapter);
hs.algorithmStrategyInfo.setAlgorithmList([ hs.OFFER_TYPE.KUN_NAN_TI ]);
t.returnState = !0;
}
}
}
};
r.prototype.isOpen = function() {
return hs.gameInfo.gameMode === hs.GameMode.Chapter;
};
r.prototype.initDifficult = function(t) {
var r = hs.chapterGameInfo.chapterNum;
this.progressArray = t ? [] : this.loadProgressFromLocal(r);
if (0 === this.progressArray.length) {
var e = s.getDifficultUnclamped(r) - hs.CHAPTER_DIFF_TYPE.DIFFICULT;
this.progressArray = this.generateRandomProgress(e);
this.saveProgressToLocal(r);
}
};
r.prototype.generateRandomProgress = function(t) {
if (t <= 0) return [];
if (1 === t) return [ Math.random() ];
var r = .05 * (t - 1);
if (r >= 1) {
for (var e = [], i = 1 / (t - 1), o = 0; o < t; o++) e.push(o * i);
return e;
}
var n = 1 - r, a = [];
for (o = 0; o < t; o++) a.push(Math.random() * n);
a.sort(function(t, r) {
return t - r;
});
var s = [];
for (o = 0; o < a.length; o++) s.push(a[o] + .05 * o);
return s.map(function(t) {
return Math.max(0, Math.min(1, t));
});
};
r.prototype.calculateTravelProgress = function() {
return hs.chapterConfigInfo.getChapterProgress();
};
r.prototype.isProgressReached = function() {
var t = this.calculateTravelProgress();
return !(t < 0 || t > 1) && (0 !== this.progressArray.length && t >= this.progressArray[0]);
};
r.prototype.consumeNextProgress = function(t) {
if (0 === this.progressArray.length) return null;
var r = this.progressArray.shift();
this.saveProgressToLocal(t);
return r || null;
};
r.prototype.getDifficult = function(t, r) {
if (r < hs.CHAPTER_DIFF_TYPE.SIMPLE || r > hs.CHAPTER_DIFF_TYPE.DIFFICULT) return r;
var e = s.getDifficult(t, r);
return this.resetDifficultProgress(e);
};
r.prototype.resetDifficultProgress = function(t) {
return t;
};
r.prototype.hasDifficultDelta = function(t) {
return s.getDifficultDelta(t) > 0;
};
r.prototype.loadProgressFromLocal = function(t) {
try {
var r = this.PROGRESS_STORAGE_KEY + "_" + t, e = storage.getItem(r);
if (e) {
var i = JSON.parse(e);
if (Array.isArray(i) && i.every(function(t) {
return "number" == typeof t;
})) return i;
}
} catch (t) {}
return [];
};
r.prototype.saveProgressToLocal = function(t) {
try {
var r = this.PROGRESS_STORAGE_KEY + "_" + t, e = JSON.stringify(this.progressArray);
storage.setItem(r, e);
} catch (t) {}
};
return n([ classId("TravelDifficultWithDayAndLevelTrait"), classMethodWatch() ], r);
}(Trait);
e.TravelDifficultWithDayAndLevelTrait = a;
var s = function() {
function t() {}
t.getDifficult = function(t, r) {
if (this.isForbiddenForTemp) return r;
r += this.getDifficultDelta(t);
return Math.max(hs.CHAPTER_DIFF_TYPE.SIMPLE, Math.min(r, hs.CHAPTER_DIFF_TYPE.DIFFICULT));
};
t.getDifficultUnclamped = function(t) {
return hs.chapterDifficultyInfo.getChapterDifficultyByChapterNum(t, !0) + this.getDifficultDelta(t);
};
t.getDifficultDelta = function(t) {
var r = 0, e = 7 - this.getLeftTimeDays();
t >= 15 * e && (r = t - 15 * e);
return r;
};
t.getLeftTimeDays = function() {
var t = storage.getItem("chapterPeriodsBeginTime", 0), r = 604800 - Math.floor((new Date().getTime() - t) / 1e3);
r = Math.max(r, 0);
return Math.floor(r / 86400);
};
t.isForbiddenForTemp = !1;
return t;
}();
cc._RF.pop();
}, {} ]
}, {}, [ "TravelDifficultWithDayAndLevelTrait" ]);
//# sourceMappingURL=index.js.map
