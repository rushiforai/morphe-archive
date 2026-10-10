window.__require = function t(e, r, o) {
function n(l, a) {
if (!r[l]) {
if (!e[l]) {
var f = l.split("/");
f = f[f.length - 1];
if (!e[f]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = f;
}
var u = r[l] = {
exports: {}
};
e[l][0].call(u.exports, function(t) {
return n(e[l][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < o.length; l++) n(o[l]);
return n;
}({
CTRefactorMultiElementCollect_TravelConfigLayerTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "1116cSsg29LLqHHll759muz", "CTRefactorMultiElementCollect_TravelConfigLayerTrait");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, l = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (l = (i < 3 ? n(l) : i > 3 ? n(e, r, l) : n(e, r)) || l);
return i > 3 && l && Object.defineProperty(e, r, l), l;
}, l = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, i = r.call(t), l = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) l.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return l;
}, a = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, r = e && t[e], o = 0;
if (r) return r.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorMultiElementCollect_TravelConfigLayerTrait = void 0;
var f = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategyCollectionAdjust = function() {
if (-1 == hs.algorithmName.algoActualChangeName.indexOf("消除爽")) {
var t = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
if (t != hs.ChapterAlgorithmSourceType.TravelRevive && t != hs.ChapterAlgorithmSourceType.TravelReviveTrait && 3 == hs.chapterAlgorithmInfo.blockIdList.length) return {
data: this.produceItemsForBlock(hs.chapterAlgorithmInfo.blockIdList),
returnState: !0,
disableTraits: [ "CTRefactorCollectionOriginTrait" ]
};
}
};
e.prototype.produceItemsForBlock = function(t) {
var e, r = [ [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ], [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ], [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ] ];
e = hs.chapterConfigInfo.getChapterProgress();
var o = this.getMultiElementCollectParam(), n = o.segmentCountWeightArr;
o.firstPeriodCountWeightArr && 1 == hs.chapterGameInfo.stage && (n = o.firstPeriodCountWeightArr);
if (n) {
var i = hs.chapterDifficultyInfo.getChapterDifficultyByChapterNum(hs.chapterGameInfo.chapterNum);
hs.chapterDifficultyInfo.isChapterSimple(i) && (i = 1);
var l = n[i - 1];
if (l) for (var a = 0; a < l.length; a++) {
var f = l[a];
if ("number" == typeof f[0] && e <= f[0]) {
r = f[1];
break;
}
}
}
var c = this.getCollectElementsInfo(), u = r[c.length - 1] || r[r.length - 1], h = c.length > 0 ? this.getElementByWeight(u)[0] : 0, s = this.getElementArrayByWeight(c, h), p = this.getElementMapOnBlock(s);
return this.generateElementPosOnBlock(t, p);
};
e.prototype.getMultiElementCollectParam = function() {
return hs.traitConfigInfo.traitsByIdMap[649002].param;
};
e.prototype.getCollectElementsInfo = function() {
var t, e = null === (t = hs.chapterConfigInfo.getChapterCurData()) || void 0 === t ? void 0 : t.Condition.RequiredCollections;
if (!e) return [];
for (var r = hs.chapterCollectInfo.collectRemainCollectItems, o = [], n = hs.boardInfo.faceBlocks, i = function(t) {
var i = e[t], l = r[i.Key];
if (0 == l) return "continue";
var a = n.reduce(function(t, e) {
return t + e.reduce(function(t, e) {
return t + (e == i.Key ? 1 : 0);
}, 0);
}, 0), f = i.Value, c = a + (f - l), u = Math.ceil(1.25 * f), h = u - c;
h && c < u && o.push([ i.Key, h ]);
}, l = 0; l < e.length; l++) i(l);
return o;
};
e.prototype.getElementByWeight = function(t) {
var e, r, o = t.reduce(function(t, e) {
return t + l(e, 2)[1];
}, 0), n = Math.random() * o;
try {
for (var i = a(t), f = i.next(); !f.done; f = i.next()) {
var c = f.value;
if (n < c[1]) return c;
n -= c[1];
}
} catch (t) {
e = {
error: t
};
} finally {
try {
f && !f.done && (r = i.return) && r.call(i);
} finally {
if (e) throw e.error;
}
}
return t[t.length - 1];
};
e.prototype.getElementArrayByWeight = function(t, e, r) {
void 0 === r && (r = {});
if (0 == e) return [];
for (var o = Array.from(Array(t.length), function(e, o) {
var n = t[o];
return [ n[0], r[n[0]] || 1, n[1] ];
}), n = [], i = 0; i < e && o.length > 0; i++) {
var l = this.getElementByWeight(o), a = l[0];
n.push(a);
0 == --l[2] && o.splice(o.indexOf(l), 1);
}
return n;
};
e.prototype.getElementMapOnBlock = function(t) {
var e, r;
if (0 == t.length) return [ [], [], [] ];
for (var o = [], n = [], i = t.length, l = Math.floor(i / 3), f = i % 3, c = 0; c < 3; c++) n.push(l + (c < f ? 1 : 0));
hs.shuffleArray(n);
var u = 0;
try {
for (var h = a(n), s = h.next(); !s.done; s = h.next()) {
var p = s.value;
o.push(t.slice(u, u + p));
u += p;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (r = h.return) && r.call(h);
} finally {
if (e) throw e.error;
}
}
return o;
};
e.prototype.generateElementPosOnBlock = function(t, e) {
for (var r = [ [], [], [] ], o = 0; o < 3; o++) for (var n = hs.AlgorithmPosType[t[o]].length, i = e[o], l = Math.min(n, i.length), a = Math.floor(Math.random() * n), f = 0; f < l; f++) {
var c = i[f], u = (a + f) % n;
r[o].push({
Key: c,
pos: u
});
}
for (var h = [], s = 0; s < r.length; s++) {
var p = {};
for (f = 0; f < r[s].length; f++) {
var y = r[s][f];
p[y.pos] = y;
}
h.push(p);
}
return h;
};
return i([ classId("CTRefactorMultiElementCollect_TravelConfigLayerTrait") ], e);
}(Trait);
r.CTRefactorMultiElementCollect_TravelConfigLayerTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMultiElementCollect_TravelConfigLayerTrait" ]);
//# sourceMappingURL=index.js.map
