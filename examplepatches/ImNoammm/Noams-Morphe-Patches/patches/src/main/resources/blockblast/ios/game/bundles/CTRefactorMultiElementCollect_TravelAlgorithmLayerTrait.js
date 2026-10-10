window.__require = function e(t, r, o) {
function n(a, i) {
if (!r[a]) {
if (!t[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!t[c]) {
var f = "function" == typeof __require && __require;
if (!i && f) return f(c, !0);
if (l) return l(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var u = r[a] = {
exports: {}
};
t[a][0].call(u.exports, function(e) {
return n(t[a][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[a].exports;
}
for (var l = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "1a3e5yyz7BMoYX+sYSHOe3d", "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait");
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
}), l = this && this.__decorate || function(e, t, r, o) {
var n, l = arguments.length, a = l < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var i = e.length - 1; i >= 0; i--) (n = e[i]) && (a = (l < 3 ? n(a) : l > 3 ? n(t, r, a) : n(t, r)) || a);
return l > 3 && a && Object.defineProperty(t, r, a), a;
}, a = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, n, l = r.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = l.next()).done; ) a.push(o.value);
} catch (e) {
n = {
error: e
};
} finally {
try {
o && !o.done && (r = l.return) && r.call(l);
} finally {
if (n) throw n.error;
}
}
return a;
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
r.CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onAlgorithmStrategyCollectionAdjust = function() {
if (this.checkNeedAlgorithmLayer() && -1 == hs.algorithmName.algoActualChangeName.indexOf("消除爽")) {
var e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
if (e != hs.ChapterAlgorithmSourceType.TravelRevive && e != hs.ChapterAlgorithmSourceType.TravelReviveTrait && 3 == hs.chapterAlgorithmInfo.blockIdList.length) return {
data: this.produceItemsForBlock(hs.chapterAlgorithmInfo.blockIdList),
returnState: !0,
disableTraits: [ "CTRefactorMultiElementCollect_TravelConfigLayerTrait", "CTRefactorCollectionOriginTrait" ]
};
}
};
t.prototype.checkNeedAlgorithmLayer = function() {
return this.getMultiElementCollectParam().fillPathFirst && 3 == hs.algorithmName.algoActualChangeName.filter(function(e) {
return "填空消除" == e;
}).length;
};
t.prototype.produceItemsForBlock = function(e) {
var t, r = [ [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ], [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ], [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ] ] ];
t = hs.chapterConfigInfo.getChapterProgress();
var o = this.getMultiElementCollectParam(), n = o.segmentCountWeightArr;
o.firstPeriodCountWeightArr && 1 == hs.chapterGameInfo.stage && (n = o.firstPeriodCountWeightArr);
if (n) {
var l = hs.chapterDifficultyInfo.getChapterDifficultyByChapterNum(hs.chapterGameInfo.chapterNum);
hs.chapterDifficultyInfo.isChapterSimple(l) && (l = 1);
var a = n[l - 1];
if (a) for (var i = 0; i < a.length; i++) {
var c = a[i];
if ("number" == typeof c[0] && t <= c[0]) {
r = c[1];
break;
}
}
}
var f = this.getCollectElementsInfo(), u = r[f.length - 1] || r[r.length - 1], h = f.length > 0 ? this.getElementByWeight(u)[0] : 0, s = this.getElementArrayByWeight(f, h), p = this.getElementMapOnBlock(s);
return this.generateElementPosOnBlock(e, p);
};
t.prototype.getMultiElementCollectParam = function() {
return hs.traitConfigInfo.traitsByIdMap[649002].param;
};
t.prototype.getCollectElementsInfo = function() {
var e, t = null === (e = hs.chapterConfigInfo.getChapterCurData()) || void 0 === e ? void 0 : e.Condition.RequiredCollections;
if (!t) return [];
for (var r = hs.chapterCollectInfo.collectRemainCollectItems, o = [], n = hs.boardInfo.faceBlocks, l = function(e) {
var l = t[e], a = r[l.Key];
if (0 == a) return "continue";
var i = n.reduce(function(e, t) {
return e + t.reduce(function(e, t) {
return e + (t == l.Key ? 1 : 0);
}, 0);
}, 0), c = l.Value, f = i + (c - a), u = Math.ceil(1.25 * c), h = u - f;
h && f < u && o.push([ l.Key, h ]);
}, a = 0; a < t.length; a++) l(a);
return o;
};
t.prototype.getElementByWeight = function(e) {
var t, r, o = e.reduce(function(e, t) {
return e + a(t, 2)[1];
}, 0), n = Math.random() * o;
try {
for (var l = i(e), c = l.next(); !c.done; c = l.next()) {
var f = c.value;
if (n < f[1]) return f;
n -= f[1];
}
} catch (e) {
t = {
error: e
};
} finally {
try {
c && !c.done && (r = l.return) && r.call(l);
} finally {
if (t) throw t.error;
}
}
return e[e.length - 1];
};
t.prototype.getElementArrayByWeight = function(e, t, r) {
void 0 === r && (r = {});
if (0 == t) return [];
for (var o = Array.from(Array(e.length), function(t, o) {
var n = e[o];
return [ n[0], r[n[0]] || 1, n[1] ];
}), n = [], l = 0; l < t && o.length > 0; l++) {
var a = this.getElementByWeight(o), i = a[0];
n.push(i);
0 == --a[2] && o.splice(o.indexOf(a), 1);
}
return n;
};
t.prototype.getElementMapOnBlock = function(e) {
var t, r;
if (0 == e.length) return [ [], [], [] ];
for (var o = [], n = [], l = e.length, a = Math.floor(l / 3), c = l % 3, f = 0; f < 3; f++) n.push(a + (f < c ? 1 : 0));
hs.shuffleArray(n);
var u = 0;
try {
for (var h = i(n), s = h.next(); !s.done; s = h.next()) {
var p = s.value;
o.push(e.slice(u, u + p));
u += p;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
s && !s.done && (r = h.return) && r.call(h);
} finally {
if (t) throw t.error;
}
}
return o;
};
t.prototype.getCanClearPosOnBlock = function(e) {
var t = new hs.BinaryBoard();
t.convertToBinaryBoard(hs.boardInfo.faceBlocks);
t.record();
for (var r = t.getEdgeGameNum(), o = [ [], [], [] ], n = 0; n < e.length; n++) {
var l = e[n];
t.revert();
var a = null, i = null, c = null, f = null, u = r, h = r, s = null, p = null, g = null;
if (!hs.BlockShapeMap[l]) return o;
for (var y = t.getCanPutPoss(l), v = 0; v < y.length; v++) {
t.revert();
t.putBlock(l, y[v]);
var m = t.getEdgeGameNum(), d = t.canClearBlockArr();
if (m < u && d) {
c = l;
a = t.rowBinary.concat();
u = m;
s = y[v];
} else if (m < h) {
f = l;
i = t.rowBinary.concat();
h = m;
p = y[v];
}
}
if (c) {
t.setBoard(a);
r = u;
t.record();
g = s;
} else if (f) {
t.setBoard(i);
r = h;
t.record();
g = p;
}
var C = t.canClearBlockArr(!0);
if (g && C) {
var _ = hs.BlockShapeMap[l];
if (!_) return o;
for (var T = 0, B = 0; B < _.height; B++) for (var A = _.shape[B].toString(2).padStart(_.width, "0").split("").map(Number), E = 0; E < _.width; E++) if (A[E]) {
var b = cc.v2(g.x + E, g.y + B);
t.emptyAt(b.x, b.y) && o[n].push(T);
T++;
}
}
}
return o;
};
t.prototype.generateElementPosOnBlock = function(e, t) {
for (var r = [ [], [], [] ], o = t.reduce(function(e, t) {
return e + t.length;
}, 0) > 0 ? this.getCanClearPosOnBlock(e) : null, n = 0; n < 3; n++) for (var l = hs.AlgorithmPosType[e[n]].length, a = t[n], i = Math.min(l, a.length), c = Math.floor(Math.random() * l), f = 0; f < i; f++) {
var u = a[f], h = 0;
o && o[n].length > 0 ? c = h = o[n].shift() : h = (c + f) % l;
r[n].push({
Key: u,
pos: h
});
}
for (var s = [], p = 0; p < r.length; p++) {
var g = {};
for (f = 0; f < r[p].length; f++) {
var y = r[p][f];
g[y.pos] = y;
}
s.push(g);
}
return s;
};
return l([ classId("CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait") ], t);
}(Trait);
r.CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait" ]);
//# sourceMappingURL=index.js.map
