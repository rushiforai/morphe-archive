window.__require = function e(t, r, n) {
function o(i, l) {
if (!r[i]) {
if (!t[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!t[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var f = r[i] = {
exports: {}
};
t[i][0].call(f.exports, function(e) {
return o(t[i][1][e] || e);
}, f, f.exports, e, t, r, n);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < n.length; i++) o(n[i]);
return o;
}({
PreEliminateGemBreathTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "1faf1kPds1IeYsPNnKTTRLe", "PreEliminateGemBreathTrait");
var n, o = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), a = this && this.__decorate || function(e, t, r, n) {
var o, a = arguments.length, i = a < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, n); else for (var l = e.length - 1; l >= 0; l--) (o = e[l]) && (i = (a < 3 ? o(i) : a > 3 ? o(t, r, i) : o(t, r)) || i);
return a > 3 && i && Object.defineProperty(t, r, i), i;
}, i = this && this.__awaiter || function(e, t, r, n) {
return new (r || (r = Promise))(function(o, a) {
function i(e) {
try {
s(n.next(e));
} catch (e) {
a(e);
}
}
function l(e) {
try {
s(n.throw(e));
} catch (e) {
a(e);
}
}
function s(e) {
e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r(function(e) {
e(t);
})).then(i, l);
var t;
}
s((n = n.apply(e, t || [])).next());
});
}, l = this && this.__generator || function(e, t) {
var r, n, o, a, i = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return a = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(e) {
return function(t) {
return s([ e, t ]);
};
}
function s(a) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (o = 2 & a[0] ? n.return : a[0] ? n.throw || ((o = n.return) && o.call(n), 
0) : n.next) && !(o = o.call(n, a[1])).done) return o;
(n = 0, o) && (a = [ 2 & a[0], o.value ]);
switch (a[0]) {
case 0:
case 1:
o = a;
break;

case 4:
i.label++;
return {
value: a[1],
done: !1
};

case 5:
i.label++;
n = a[1];
a = [ 0 ];
continue;

case 7:
a = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(o = i.trys, o = o.length > 0 && o[o.length - 1]) && (6 === a[0] || 2 === a[0])) {
i = 0;
continue;
}
if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
i.label = a[1];
break;
}
if (6 === a[0] && i.label < o[1]) {
i.label = o[1];
o = a;
break;
}
if (o && i.label < o[2]) {
i.label = o[2];
i.ops.push(a);
break;
}
o[2] && i.ops.pop();
i.trys.pop();
continue;
}
a = t.call(e, i);
} catch (e) {
a = [ 6, e ];
n = 0;
} finally {
r = o = 0;
}
if (5 & a[0]) throw a[1];
return {
value: a[0] ? a[1] : void 0,
done: !0
};
}
}, s = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], n = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && n >= e.length && (e = void 0);
return {
value: e && e[n++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, c = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var n, o, a = r.call(e), i = [];
try {
for (;(void 0 === t || t-- > 0) && !(n = a.next()).done; ) i.push(n.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
n && !n.done && (r = a.return) && r.call(a);
} finally {
if (o) throw o.error;
}
}
return i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PreEliminateGemBreathTrait = void 0;
var f = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._breathPrefab = null;
t._breathNodes = new Map();
t._lastDetectedColors = new Set();
t._lastEliminatePathKey = "";
t._isPreloaded = !1;
t.BREATH_PREFAB_PATH = "prefab/BreathSpine";
t.BREATH_PREFAB_BUNDLE = "PreEliminateGemBreathTrait";
t.SPINE_NODE_NAME = "spine";
t.GEM_ANIMATION_MAP = {
101: "blue",
102: "green",
103: "orange",
104: "yellow",
105: "red",
106: "purple"
};
t.BREATH_SCALE = 1.5;
return t;
}
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ChapterGame_Proxy",
methodName: "onShowBoardFinished"
}, {
className: "ChapterEliminate_Effects_Proxy",
methodName: "touchOnMoveCanSnap"
}, {
className: "ChapterEliminate_Effects_Proxy",
methodName: "touchOnMoveNoCanSnap"
}, {
className: "ChapterEliminate_Effects_Proxy",
methodName: "onBlockProducerTouchEnd"
}, {
className: "ChapterEliminate_Effects_Proxy",
methodName: "onCloseChapterGame"
}, {
className: "ChapterEliminate_Effects_Proxy",
methodName: "onCloseChapterGame"
} ];
};
t.prototype.onActive = function(e) {
hs.tp.isChapterGame_ProxyOnShowBoardFinished(e) && this._preloadBreathPrefab();
if (hs.tp.isChapterEliminate_Effects_ProxyTouchOnMoveCanSnap(e)) {
var t = e.args[0];
this._handlePreEliminate(t);
}
hs.tp.isChapterEliminate_Effects_ProxyTouchOnMoveNoCanSnap(e) && this._stopAllBreathAnimations();
hs.tp.isChapterEliminate_Effects_ProxyOnBlockProducerTouchEnd(e) && this._stopAllBreathAnimations();
hs.tp.isChapterEliminate_Effects_ProxyOnCloseChapterGame(e) && this._cleanup();
};
t.prototype._preloadBreathPrefab = function() {
var e = this;
this._isPreloaded || hs.ResLoader.loadByBundle(this.BREATH_PREFAB_BUNDLE, this.BREATH_PREFAB_PATH, cc.Prefab, function(t, r) {
if (t) ; else {
e._breathPrefab = r;
e._isPreloaded = !0;
}
});
};
t.prototype._handleTouchMove = function(e) {
var t = e.target;
if (t) {
var r = t._showShaders;
if (t._canSnap && r && 0 !== Object.keys(r).length) {
var n = {
rowsEffect: t._rowsEffect || {},
colsEffect: t._colsEffect || {},
_showShaders: r,
color: t._color
};
this._handlePreEliminate(n);
}
}
};
t.prototype._handlePreEliminate = function(e) {
var t = this._getEliminatePathKey(e), r = t !== this._lastEliminatePathKey;
this._lastEliminatePathKey = t;
var n = this._detectGemColorsInPath(e), o = this._filterUnfinishedColors(n);
if (r || !this._isSameAsLast(o)) {
this._lastDetectedColors = o;
this._updateBreathAnimations(o);
}
};
t.prototype._getEliminatePathKey = function(e) {
var t = Object.keys(e.rowsEffect || {}).filter(function(t) {
return e.rowsEffect[t];
}).sort().join(","), r = Object.keys(e.colsEffect || {}).filter(function(t) {
return e.colsEffect[t];
}).sort().join(","), n = [];
if (e._showShaders) for (var o in e._showShaders) for (var a in e._showShaders[o]) n.push(o + "_" + a);
n.sort();
return "r:" + t + "|c:" + r + "|s:" + n.join(",");
};
t.prototype._detectGemColorsInPath = function(e) {
var t, r, n, o, a, i = new Set(), l = null === (a = hs.boardInfo) || void 0 === a ? void 0 : a.faceBlocks;
if (!l || 0 === l.length) return i;
var c = Object.keys(e.rowsEffect || {}).filter(function(t) {
return e.rowsEffect[t];
}).map(function(e) {
return parseInt(e);
}), f = Object.keys(e.colsEffect || {}).filter(function(t) {
return e.colsEffect[t];
}).map(function(e) {
return parseInt(e);
}), h = {};
if (e._showShaders) for (var u in e._showShaders) for (var p in e._showShaders[u]) h[u + "," + p] = e._showShaders[u][p];
try {
for (var _ = s(c), d = _.next(); !d.done; d = _.next()) if ((u = d.value) >= 0 && u < l.length) for (p = 0; p < l[u].length; p++) (E = void 0 !== h[v = u + "," + p] ? h[v] : l[u][p]) > 100 && i.add(E);
} catch (e) {
t = {
error: e
};
} finally {
try {
d && !d.done && (r = _.return) && r.call(_);
} finally {
if (t) throw t.error;
}
}
try {
for (var y = s(f), m = y.next(); !m.done; m = y.next()) if ((p = m.value) >= 0 && p < l[0].length) for (u = 0; u < l.length; u++) {
var v, E;
(E = void 0 !== h[v = u + "," + p] ? h[v] : l[u][p]) > 100 && i.add(E);
}
} catch (e) {
n = {
error: e
};
} finally {
try {
m && !m.done && (o = y.return) && o.call(y);
} finally {
if (n) throw n.error;
}
}
return i;
};
t.prototype._filterUnfinishedColors = function(e) {
var t, r, n, o = new Set(), a = (null === (n = hs.chapterCollectInfo) || void 0 === n ? void 0 : n.collectRemainCollectItems) || {};
try {
for (var i = s(e), l = i.next(); !l.done; l = i.next()) {
var c = l.value;
(a[c] || 0) > 0 && o.add(c);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
l && !l.done && (r = i.return) && r.call(i);
} finally {
if (t) throw t.error;
}
}
return o;
};
t.prototype._isSameAsLast = function(e) {
var t, r;
if (e.size !== this._lastDetectedColors.size) return !1;
try {
for (var n = s(e), o = n.next(); !o.done; o = n.next()) {
var a = o.value;
if (!this._lastDetectedColors.has(a)) return !1;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (t) throw t.error;
}
}
return !0;
};
t.prototype._updateBreathAnimations = function(e) {
var t, r, n, o;
try {
for (var a = s(this._breathNodes), i = a.next(); !i.done; i = a.next()) {
var l = c(i.value, 1)[0];
e.has(l) || this._stopBreathAnimation(l);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
i && !i.done && (r = a.return) && r.call(a);
} finally {
if (t) throw t.error;
}
}
try {
for (var f = s(e), h = f.next(); !h.done; h = f.next()) {
l = h.value;
this._breathNodes.has(l) || this._playBreathAnimation(l);
}
} catch (e) {
n = {
error: e
};
} finally {
try {
h && !h.done && (o = f.return) && o.call(f);
} finally {
if (n) throw n.error;
}
}
};
t.prototype._playBreathAnimation = function(e) {
return i(this, void 0, Promise, function() {
var t, r, n, o, a, i, s, c, f, h, u;
return l(this, function() {
if (!(t = hs.ChapterTopInfoCollect)) return [ 2 ];
if (!(r = Cinst(t))) return [ 2 ];
if (!(n = r.cacheCollectItems) || 0 === n.length) return [ 2 ];
if (!(o = n.find(function(t) {
return t.color === e;
})) || !cc.isValid(o.node)) return [ 2 ];
a = hs.ChapterCollectTopItem;
if (!(i = o.node.getComponent(a)) || !i.gemImg) return [ 2 ];
if (!(s = i.gemImg.node) || !cc.isValid(s)) return [ 2 ];
if (!this._breathPrefab) return [ 2 ];
c = cc.instantiate(this._breathPrefab);
s.addChild(c);
c.setPosition(cc.v2(0, 0));
c.scale = this.BREATH_SCALE;
if ((f = c.getChildByName(this.SPINE_NODE_NAME)) && (h = f.getComponent(sp.Skeleton))) {
if (!(u = this.GEM_ANIMATION_MAP[e])) return [ 2 ];
h.clearTracks();
h.setToSetupPose();
h.setAnimation(0, u, !0);
}
this._breathNodes.set(e, c);
return [ 2 ];
});
});
};
t.prototype._stopBreathAnimation = function(e) {
var t = this._breathNodes.get(e);
if (t && cc.isValid(t)) {
t.removeFromParent();
t.destroy();
}
this._breathNodes.delete(e);
};
t.prototype._stopAllBreathAnimations = function() {
var e, t;
try {
for (var r = s(this._breathNodes), n = r.next(); !n.done; n = r.next()) {
var o = c(n.value, 2)[1];
if (o && cc.isValid(o)) {
o.removeFromParent();
o.destroy();
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
n && !n.done && (t = r.return) && t.call(r);
} finally {
if (e) throw e.error;
}
}
this._breathNodes.clear();
this._lastDetectedColors.clear();
this._lastEliminatePathKey = "";
};
t.prototype._cleanup = function() {
this._stopAllBreathAnimations();
this._breathPrefab = null;
this._isPreloaded = !1;
};
return a([ classId("PreEliminateGemBreathTrait") ], t);
}(Trait);
r.PreEliminateGemBreathTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "PreEliminateGemBreathTrait" ]);
//# sourceMappingURL=index.js.map
