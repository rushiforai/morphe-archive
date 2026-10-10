window.__require = function r(t, e, o) {
function a(n, s) {
if (!e[n]) {
if (!t[n]) {
var h = n.split("/");
h = h[h.length - 1];
if (!t[h]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(h, !0);
if (i) return i(h, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = h;
}
var l = e[n] = {
exports: {}
};
t[n][0].call(l.exports, function(r) {
return a(t[n][1][r] || r);
}, l, l.exports, r, t, e, o);
}
return e[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
TravelSupplyBlocksTrait: [ function(r, t, e) {
"use strict";
cc._RF.push(t, "4a1bcGakH1GN4ckanOy3DDM", "TravelSupplyBlocksTrait");
var o, a, i, n = this && this.__extends || (o = function(r, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(r, t) {
r.__proto__ = t;
} || function(r, t) {
for (var e in t) Object.prototype.hasOwnProperty.call(t, e) && (r[e] = t[e]);
})(r, t);
}, function(r, t) {
o(r, t);
function e() {
this.constructor = r;
}
r.prototype = null === t ? Object.create(t) : (e.prototype = t.prototype, new e());
}), s = this && this.__decorate || function(r, t, e, o) {
var a, i = arguments.length, n = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(r, t, e, o); else for (var s = r.length - 1; s >= 0; s--) (a = r[s]) && (n = (i < 3 ? a(n) : i > 3 ? a(t, e, n) : a(t, e)) || n);
return i > 3 && n && Object.defineProperty(t, e, n), n;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.TravelSupplyBlocksTrait = void 0;
(function(r) {
r[r.SIMPLE = 1] = "SIMPLE";
r[r.MEDIUM = 2] = "MEDIUM";
r[r.DIFFICULT = 3] = "DIFFICULT";
})(i || (i = {}));
var h = ((a = {})[i.DIFFICULT] = [ 400, 450 ], a[i.MEDIUM] = [ 350, 400 ], a[i.SIMPLE] = [ 300, 350 ], 
a), c = [ 4, 8 ], l = [ 2, 6 ], f = function(r) {
n(t, r);
function t() {
var t = null !== r && r.apply(this, arguments) || this;
t.hasRandom = !1;
t.save_arr = [];
t.colorArr = [];
return t;
}
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ChapterDefaultBoard_Proxy",
methodName: "setChapterColor"
} ];
};
t.prototype.onActive = function(r) {
hs.tp.isChapterDefaultBoard_ProxySetChapterColor(r) && this.replaceTravelBoard();
};
t.prototype.resetData = function() {
this.hasRandom = !1;
this.save_arr = [];
this.colorArr = [];
};
t.prototype.checkPlatformCondition = function() {
return !0;
};
t.prototype.replaceTravelBoard = function() {
this.resetData();
if (this.checkPlatformCondition()) {
for (var r = hs.chapterBlocksProducerInfo.producerBlocks, t = 0; t < r.length; t++) if (-1 !== r[t]) return;
var e = hs.chapterBoardInfo.faceBlocks, o = new hs.BinaryBoard();
o.convertToBinaryBoard(e);
var a = o.getWeightValueObj(), i = this.getLevelDifficulty(), n = h[i];
if (a >= n[0]) {
this.hasRandom = !1;
this.save_arr = [];
this.colorArr = [];
} else {
this.getBlockColorArr();
var s = this.randomInt(n[0], n[1]);
this.supplyBlocks(e, i, s);
0 !== this.save_arr.length && hs.storage.setItem("chapterFaceBlocks", this.save_arr);
}
}
};
t.prototype.getBlockColorArr = function() {
for (var r = [], t = 1; t < 8; t++) r.push(t);
r.sort(function() {
return Math.random() - .5;
});
this.colorArr = r.slice(0, 3);
};
t.prototype.supplyBlocks = function(r, t, e) {
if (!this.hasRandom) {
this.save_arr = [];
for (var o = [], a = [], i = [], n = 0; n < 8; n++) {
this.save_arr[n] || (this.save_arr[n] = []);
for (var s = 0; s < 8; s++) {
this.save_arr[n][s] = r[n][s];
-1 === this.save_arr[n][s] ? o.push(8 * n + s) : this.save_arr[n][s] < 10 && -1 === a.indexOf(this.save_arr[n][s]) ? a.push(this.save_arr[n][s]) : -1 === i.indexOf(this.save_arr[n][s]) && i.push(this.save_arr[n][s]);
}
}
if (0 !== o.length) {
this.hasRandom = !0;
var c = new hs.BinaryBoard();
c.convertToBinaryBoard(this.save_arr);
for (var l = c.getWeightValueObj(), f = [], p = [], u = h[t]; l < e; ) {
if (0 === o.length) return;
var v = Math.floor(Math.random() * o.length), _ = o[v], d = _ % 8, y = Math.floor(_ / 8);
o.splice(v, 1);
if (-1 === p.indexOf(d) && -1 === f.indexOf(y)) {
var B = this.randomColor(a, i);
this.save_arr[y][d] = B;
var g = !0;
for (n = 0; n < this.save_arr[y].length; n++) if (-1 === this.save_arr[y][n]) {
g = !1;
break;
}
g && f.push(y);
var T = !0;
for (n = 0; n < 8; n++) if (-1 === this.save_arr[n][d]) {
T = !1;
break;
}
T && p.push(d);
(T || g) && (this.save_arr[y][d] = -1);
c.convertToBinaryBoard(this.save_arr);
if ((l = c.getWeightValueObj()) > u[1]) {
this.save_arr[y][d] = -1;
c.convertToBinaryBoard(this.save_arr);
l = c.getWeightValueObj();
break;
}
}
}
}
}
};
t.prototype.randomColor = function(r) {
if (1 === this.colorArr.length) return r[0] || this.colorArr[0];
if (this.colorArr.length > 1) {
var t = Math.floor(Math.random() * this.colorArr.length);
return this.colorArr[t];
}
return 1;
};
t.prototype.getLevelDifficulty = function() {
var r = hs.chapterGameInfo.chapterNum % 10;
return -1 !== c.indexOf(r) ? i.DIFFICULT : -1 !== l.indexOf(r) ? i.MEDIUM : i.SIMPLE;
};
t.prototype.randomInt = function(r, t) {
return Math.floor(Math.random() * (t - r + 1)) + r;
};
return s([ classId("TravelSupplyBlocksTrait") ], t);
}(Trait);
e.TravelSupplyBlocksTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "TravelSupplyBlocksTrait" ]);
//# sourceMappingURL=index.js.map
