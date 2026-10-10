window.__require = function e(t, i, n) {
function o(a, s) {
if (!i[a]) {
if (!t[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!t[l]) {
var p = "function" == typeof __require && __require;
if (!s && p) return p(l, !0);
if (r) return r(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var h = i[a] = {
exports: {}
};
t[a][0].call(h.exports, function(e) {
return o(t[a][1][e] || e);
}, h, h.exports, e, t, i, n);
}
return i[a].exports;
}
for (var r = "function" == typeof __require && __require, a = 0; a < n.length; a++) o(n[a]);
return o;
}({
ComboTipsDynamicStyleTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "1de22nXIsBC9qzDxS9DBzHy", "ComboTipsDynamicStyleTrait");
var n, o, r = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
})(e, t);
}, function(e, t) {
n(e, t);
function i() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i());
}), a = this && this.__decorate || function(e, t, i, n) {
var o, r = arguments.length, a = r < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, i) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, i, n); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (a = (r < 3 ? o(a) : r > 3 ? o(t, i, a) : o(t, i)) || a);
return r > 3 && a && Object.defineProperty(t, i, a), a;
}, s = this && this.__awaiter || function(e, t, i, n) {
return new (i || (i = Promise))(function(o, r) {
function a(e) {
try {
l(n.next(e));
} catch (e) {
r(e);
}
}
function s(e) {
try {
l(n.throw(e));
} catch (e) {
r(e);
}
}
function l(e) {
e.done ? o(e.value) : (t = e.value, t instanceof i ? t : new i(function(e) {
e(t);
})).then(a, s);
var t;
}
l((n = n.apply(e, t || [])).next());
});
}, l = this && this.__generator || function(e, t) {
var i, n, o, r, a = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return r = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
return this;
}), r;
function s(e) {
return function(t) {
return l([ e, t ]);
};
}
function l(r) {
if (i) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (i = 1, n && (o = 2 & r[0] ? n.return : r[0] ? n.throw || ((o = n.return) && o.call(n), 
0) : n.next) && !(o = o.call(n, r[1])).done) return o;
(n = 0, o) && (r = [ 2 & r[0], o.value ]);
switch (r[0]) {
case 0:
case 1:
o = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
n = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(o = a.trys, o = o.length > 0 && o[o.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!o || r[1] > o[0] && r[1] < o[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < o[1]) {
a.label = o[1];
o = r;
break;
}
if (o && a.label < o[2]) {
a.label = o[2];
a.ops.push(r);
break;
}
o[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = t.call(e, a);
} catch (e) {
r = [ 6, e ];
n = 0;
} finally {
i = o = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
}, p = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, i = t && e[t], n = 0;
if (i) return i.call(e);
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
}, h = this && this.__read || function(e, t) {
var i = "function" == typeof Symbol && e[Symbol.iterator];
if (!i) return e;
var n, o, r = i.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(n = r.next()).done; ) a.push(n.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
n && !n.done && (i = r.return) && i.call(r);
} finally {
if (o) throw o.error;
}
}
return a;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ComboTipsDynamicStyleTrait = void 0;
var c = e("./types/ComboTipsDynamicStyleTypes"), u = function(e) {
r(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._spineNodes = new Map();
t._skeletonCache = new Map();
t._skeletonDataCache = new Map();
t._layerNodes = new Map();
t._layerSkeletons = new Map();
t._layerInAnimCompleteCount = 0;
t._comboLevel = -1;
t._currentShape = c.ComboShapeType.Heart;
t._currentSkinId = i.ORIGINAL_SKIN_ID;
t._loadTimeoutBarrier = null;
t._skinAnimColorsConfig = null;
t._parentNode = null;
t._classTopInfo = null;
t._originalComboAnimNode = null;
t._isPlaying = !1;
t._isOriginalSkin = !0;
t._loadedShapes = new Set();
t._currentSkinGroupName = "";
t._oldComboNum = -1;
t._pendingShape = null;
t._playingShape = null;
return t;
}
i = t;
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return this.isTrigger();
},
enumerable: !1,
configurable: !0
});
t.prototype.isTrigger = function() {
return !0;
};
t.prototype.registerEvents = function() {
return [ hs.E_Skin_DataUpdateCompleted ];
};
t.prototype.receivedEvents = function(e) {
if (e.getClass() === hs.E_Skin_DataUpdateCompleted) {
var t = e;
this.onSkinDataUpdateCompleted(t.skinId);
}
};
t.prototype.onCreate = function() {
this._loadTimeoutBarrier = new hs.TimeoutBarrier(5e3);
this.loadColorConfig();
this.preloadAllSpineResources();
};
t.prototype.onActive = function(e) {
if (hs.tp.isClassTopInfoComboAnimState(e)) {
this._parentNode || this.onInitComboAnim(e);
this.onComboAnimState(e);
e.returnState = !0;
}
};
t.prototype.preloadAllSpineResources = function() {
return s(this, void 0, Promise, function() {
var e, t, i, n, o, r, a, s, h, u, y, d, _;
return l(this, function(l) {
switch (l.label) {
case 0:
e = [ c.ComboShapeType.Heart, c.ComboShapeType.Square, c.ComboShapeType.Pentagon, c.ComboShapeType.Crown ];
t = [ "defaultSkin", "otherSkin" ];
i = [];
try {
for (n = p(t), o = n.next(); !o.done; o = n.next()) {
r = o.value;
try {
for (a = (d = void 0, p(e)), s = a.next(); !s.done; s = a.next()) {
h = s.value;
i.push(this.preloadSpineData(r, h));
}
} catch (e) {
d = {
error: e
};
} finally {
try {
s && !s.done && (_ = a.return) && _.call(a);
} finally {
if (d) throw d.error;
}
}
}
} catch (e) {
u = {
error: e
};
} finally {
try {
o && !o.done && (y = n.return) && y.call(n);
} finally {
if (u) throw u.error;
}
}
return [ 4, Promise.all(i) ];

case 1:
l.sent();
this._loadTimeoutBarrier && this._loadTimeoutBarrier.open();
return [ 2 ];
}
});
});
};
t.prototype.preloadSpineData = function(e, t) {
return s(this, void 0, Promise, function() {
var n, o, r;
return l(this, function(a) {
switch (a.label) {
case 0:
n = e + "_" + t;
if (this._skeletonDataCache.has(n)) return [ 2 ];
o = i.SPINE_PATH_MAP[t].replace("{skinType}", e);
return [ 4, hs.ResLoader.asyncLoadByBundle(i.BUNDLE_NAME, o, sp.SkeletonData).catch(function() {
return null;
}) ];

case 1:
(r = a.sent()) && this._skeletonDataCache.set(n, r);
return [ 2 ];
}
});
});
};
t.prototype.getCachedSkeletonData = function(e) {
var t = (this._isOriginalSkin ? "defaultSkin" : "otherSkin") + "_" + e;
return this._skeletonDataCache.get(t) || null;
};
t.prototype.onSkinDataUpdateCompleted = function(e) {
this._currentSkinId !== e && this.handleSkinChange(e);
};
t.prototype.handleSkinChange = function(e) {
var t = e === i.ORIGINAL_SKIN_ID, n = this.getSkinGroupName(e), o = (this._currentSkinId, 
this._currentSkinGroupName), r = o === n || "" === o || "" === n, a = t !== this._isOriginalSkin;
this._currentSkinId = e;
this._isOriginalSkin = t;
this._currentSkinGroupName = n;
if (this._classTopInfo) {
if (a) {
this._loadedShapes.clear();
this.clearAllNodes();
this.ensureShapeNodesCreated(this._currentShape);
}
r || this._isOriginalSkin || !this._isPlaying || this.playNonOriginalSkinInAnimation();
}
};
t.prototype.loadColorConfig = function() {
var e = this;
hs.ResLoader.asyncLoadByBundle(i.BUNDLE_NAME, "json/skin_animation_colors", cc.JsonAsset).then(function(t) {
e._skinAnimColorsConfig = t.json;
}).catch(function() {});
};
t.prototype.onInitComboAnim = function(e) {
var t = e.target;
this._classTopInfo = t;
t.comboAnim.node.active = !1;
t.comboAnim.node.opacity = 0;
this._originalComboAnimNode = t.comboAnim.node;
this._parentNode = t.curNode;
this._currentSkinId = this.getCurrentSkinId();
this._isOriginalSkin = this._currentSkinId === i.ORIGINAL_SKIN_ID;
this._currentSkinGroupName = this.getSkinGroupName(this._currentSkinId);
};
t.prototype.getSpinePath = function(e) {
var t = this._isOriginalSkin ? "defaultSkin" : "otherSkin";
return i.SPINE_PATH_MAP[e].replace("{skinType}", t);
};
t.prototype.ensureShapeNodesCreated = function(e) {
var t;
if (this._loadedShapes.has(e)) return !0;
if (!cc.isValid(this._parentNode)) {
if (!cc.isValid(null === (t = this._classTopInfo) || void 0 === t ? void 0 : t.curNode)) return !1;
this._parentNode = this._classTopInfo.curNode;
}
var i = this.getCachedSkeletonData(e);
if (!i) return !1;
this._isOriginalSkin ? this.createSingleSpineNode(e, i) : this.createLayerSpineNodes(e, i);
this._loadedShapes.add(e);
return !0;
};
t.prototype.createSingleSpineNode = function(e, t) {
var i = new cc.Node("ComboTipsDynamicStyle_" + e), n = i.addComponent(sp.Skeleton);
n.premultipliedAlpha = !1;
n.setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.REALTIME);
n.enableBatch = !0;
n.skeletonData = t;
this._originalComboAnimNode && i.setPosition(this._originalComboAnimNode.getPosition());
i.setParent(this._parentNode);
i.setSiblingIndex(0);
i.opacity = 0;
n.setCompleteListener(this.onAnimationComplete.bind(this));
this._spineNodes.set(e, i);
this._skeletonCache.set(e, n);
};
t.prototype.createLayerSpineNodes = function(e, t) {
for (var i = [], n = [], o = 1; o <= 4; o++) {
var r = new cc.Node("ComboTipsDynamicStyle_" + e + "_L" + o), a = r.addComponent(sp.Skeleton);
a.premultipliedAlpha = !1;
a.setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.REALTIME);
a.enableBatch = !0;
a.skeletonData = t;
this._originalComboAnimNode && r.setPosition(this._originalComboAnimNode.getPosition());
r.setParent(this._parentNode);
r.setSiblingIndex(0);
r.opacity = 0;
1 === o && a.setCompleteListener(this.onLayerAnimationComplete.bind(this));
i.push(r);
n.push(a);
}
this._layerNodes.set(e, i);
this._layerSkeletons.set(e, n);
};
t.prototype.onComboAnimState = function(e) {
return s(this, void 0, Promise, function() {
var t, i, n, o;
return l(this, function(r) {
switch (r.label) {
case 0:
return this._loadTimeoutBarrier ? this._loadTimeoutBarrier.isOpen ? [ 3, 2 ] : [ 4, this._loadTimeoutBarrier.wait() ] : [ 3, 2 ];

case 1:
r.sent();
r.label = 2;

case 2:
t = e.args[0], i = t.comboAnimState, n = t.continuousEliminateTimes;
if ((o = n - 1) <= this._oldComboNum && !this.isOtherTraitControlComboAnimState()) {
if (o < this._oldComboNum) {
this.hideAllAnimations();
this._oldComboNum = o;
}
return [ 2 ];
}
this._oldComboNum = o;
switch (i) {
case hs.TopInfoType.ShowCombo:
this._comboLevel = this.getComboLevel(o);
this._currentShape = this.getShapeByComboNum(o);
if (!this.ensureShapeLoaded(this._currentShape)) break;
this.playInAnimation();
break;

case hs.TopInfoType.CancelCombo:
this.playOutAnimation();
break;

case hs.TopInfoType.ShowCombo_No_Eliminate:
if (o > 0) {
this._comboLevel = this.getComboLevel(o);
this._currentShape = this.getShapeByComboNum(o);
if (!this.ensureShapeLoaded(this._currentShape)) break;
this._isPlaying || this.playInAnimation();
}
break;

case hs.TopInfoType.None:
this.hideAllAnimations();
}
return [ 2 ];
}
});
});
};
t.prototype.isOtherTraitControlComboAnimState = function() {
return !1;
};
t.prototype.ensureShapeLoaded = function(e) {
return !!this._loadedShapes.has(e) || this.ensureShapeNodesCreated(e);
};
t.prototype.getShapeByComboNum = function(e) {
return e <= i.COMBO_THRESHOLD_HEART ? c.ComboShapeType.Heart : e <= i.COMBO_THRESHOLD_SQUARE ? c.ComboShapeType.Square : e <= i.COMBO_THRESHOLD_PENTAGON ? c.ComboShapeType.Pentagon : c.ComboShapeType.Crown;
};
t.prototype.getComboLevel = function(e) {
return e <= i.COMBO_THRESHOLD_HEART ? 0 : e <= i.COMBO_THRESHOLD_SQUARE ? 1 : e <= i.COMBO_THRESHOLD_PENTAGON ? 2 : 3;
};
t.prototype.playInAnimation = function() {
if (null === this._playingShape || this._playingShape === this._currentShape) {
this.hideOtherShapes(this._currentShape);
this._playingShape = this._currentShape;
this._isOriginalSkin ? this.playOriginalSkinInAnimation() : this.playNonOriginalSkinInAnimation();
} else {
this._pendingShape = this._currentShape;
this.playOutAnimationForShape(this._playingShape);
}
};
t.prototype.hideOtherShapes = function(e) {
var t, i, n, o;
try {
for (var r = p(this._spineNodes), a = r.next(); !a.done; a = r.next()) {
var s = h(a.value, 2), l = s[0], c = s[1];
if (l !== e && cc.isValid(c)) {
c.opacity = 0;
var u = this._skeletonCache.get(l);
u && u.clearTracks();
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (i = r.return) && i.call(r);
} finally {
if (t) throw t.error;
}
}
try {
for (var y = p(this._layerNodes), d = y.next(); !d.done; d = y.next()) {
var _ = h(d.value, 2), m = (l = _[0], _[1]);
if (l !== e) for (var f = this._layerSkeletons.get(l), S = 0; S < m.length; S++) {
c = m[S];
cc.isValid(c) && (c.opacity = 0);
f && f[S] && f[S].clearTracks();
}
}
} catch (e) {
n = {
error: e
};
} finally {
try {
d && !d.done && (o = y.return) && o.call(y);
} finally {
if (n) throw n.error;
}
}
};
t.prototype.playOriginalSkinInAnimation = function() {
var e = this._skeletonCache.get(this._currentShape), t = this._spineNodes.get(this._currentShape);
if (e && t && cc.isValid(t)) {
t.opacity = 255;
this._isPlaying = !0;
var i = this._currentShape + "_in";
e.timeScale = this.animSpeed;
e.setCompleteListener(this.onAnimationComplete.bind(this));
e.setAnimation(0, i, !1);
}
};
t.prototype.playNonOriginalSkinInAnimation = function() {
var e = this._layerNodes.get(this._currentShape), t = this._layerSkeletons.get(this._currentShape);
if (e && t && 4 === e.length) {
this._isPlaying = !0;
this._layerInAnimCompleteCount = 0;
for (var i = this.getColorConfigForSkin(this._currentSkinId, this._currentShape), n = 0; n < 4; n++) {
var o = e[n], r = t[n], a = n + 1;
if (cc.isValid(o)) {
o.opacity = 255;
var s = this._currentShape + "_in_" + a;
r.timeScale = this.animSpeed;
0 === n && r.setCompleteListener(this.onLayerAnimationComplete.bind(this));
r.setAnimation(0, s, !1);
if (i) {
var l = i["_" + a];
l && this.applyColorToNode(o, l);
}
}
}
}
};
t.prototype.getInitOutColorKey = function(e) {
return e === c.ComboShapeType.Pentagon ? "_3" : "_1";
};
t.prototype.playInitAnimation = function() {
var e = this._currentShape + "_init";
if (this._isOriginalSkin) {
var t = this._skeletonCache.get(this._currentShape), i = this._spineNodes.get(this._currentShape);
if (!t || !i || !cc.isValid(i)) return;
i.opacity = 255;
t.timeScale = this.animSpeed;
t.setCompleteListener(null);
t.setAnimation(0, e, !0);
} else {
var n = this._layerNodes.get(this._currentShape), o = this._layerSkeletons.get(this._currentShape);
if (!n || !o) return;
for (var r = this.getColorConfigForSkin(this._currentSkinId, this._currentShape), a = this.getInitOutColorKey(this._currentShape), s = 0; s < n.length; s++) {
i = n[s], t = o[s];
if (cc.isValid(i)) if (0 === s) {
i.opacity = 255;
t.timeScale = this.animSpeed;
t.setCompleteListener(null);
t.setAnimation(0, e, !0);
r && r[a] && this.applyColorToNode(i, r[a]);
} else {
i.opacity = 0;
t.clearTracks();
}
}
}
};
t.prototype.playOutAnimation = function() {
var e = this._currentShape + "_out";
if (this._isOriginalSkin) {
var t = this._skeletonCache.get(this._currentShape), i = this._spineNodes.get(this._currentShape);
if (!t || !i || !cc.isValid(i)) return;
t.timeScale = this.animSpeed;
t.setCompleteListener(this.onAnimationComplete.bind(this));
t.setAnimation(0, e, !1);
} else {
var n = this._layerNodes.get(this._currentShape), o = this._layerSkeletons.get(this._currentShape);
if (!n || !o || 0 === n.length) return;
i = n[0], t = o[0];
if (!cc.isValid(i)) return;
i.opacity = 255;
t.timeScale = this.animSpeed;
t.setCompleteListener(this.onLayerAnimationComplete.bind(this));
t.setAnimation(0, e, !1);
var r = this.getColorConfigForSkin(this._currentSkinId, this._currentShape), a = this.getInitOutColorKey(this._currentShape);
r && r[a] && this.applyColorToNode(i, r[a]);
}
};
t.prototype.playOutAnimationForShape = function(e) {
var t = e + "_out";
if (this._isOriginalSkin) {
var i = this._skeletonCache.get(e), n = this._spineNodes.get(e);
if (!i || !n || !cc.isValid(n)) {
this.playPendingShapeInAnimation();
return;
}
i.timeScale = this.animSpeed;
i.setCompleteListener(this.onAnimationComplete.bind(this));
i.setAnimation(0, t, !1);
} else {
var o = this._layerNodes.get(e), r = this._layerSkeletons.get(e);
if (!o || !r || 0 === o.length) {
this.playPendingShapeInAnimation();
return;
}
n = o[0], i = r[0];
if (!cc.isValid(n)) {
this.playPendingShapeInAnimation();
return;
}
n.opacity = 255;
i.timeScale = this.animSpeed;
i.setCompleteListener(this.onLayerAnimationComplete.bind(this));
i.setAnimation(0, t, !1);
var a = this.getColorConfigForSkin(this._currentSkinId, e), s = this.getInitOutColorKey(e);
a && a[s] && this.applyColorToNode(n, a[s]);
}
};
t.prototype.playPendingShapeInAnimation = function() {
if (null !== this._pendingShape) {
var e = this._pendingShape;
this._pendingShape = null;
null !== this._playingShape && this.hideShapeNodes(this._playingShape);
this._currentShape = e;
this._playingShape = e;
this.ensureShapeLoaded(e) && (this._isOriginalSkin ? this.playOriginalSkinInAnimation() : this.playNonOriginalSkinInAnimation());
}
};
t.prototype.hideShapeNodes = function(e) {
var t = this._spineNodes.get(e);
if (t && cc.isValid(t)) {
t.opacity = 0;
var i = this._skeletonCache.get(e);
i && i.clearTracks();
}
var n = this._layerNodes.get(e), o = this._layerSkeletons.get(e);
if (n) for (var r = 0; r < n.length; r++) {
var a = n[r];
cc.isValid(a) && (a.opacity = 0);
o && o[r] && o[r].clearTracks();
}
};
t.prototype.hideAllAnimations = function() {
var e, t, i, n, o, r;
this._isPlaying = !1;
this._layerInAnimCompleteCount = 0;
this._playingShape = null;
this._pendingShape = null;
try {
for (var a = p(this._spineNodes.values()), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
cc.isValid(l) && (l.opacity = 0);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (t = a.return) && t.call(a);
} finally {
if (e) throw e.error;
}
}
try {
for (var h = p(this._layerNodes.values()), c = h.next(); !c.done; c = h.next()) {
var u = c.value;
try {
for (var y = (o = void 0, p(u)), d = y.next(); !d.done; d = y.next()) {
l = d.value;
cc.isValid(l) && (l.opacity = 0);
}
} catch (e) {
o = {
error: e
};
} finally {
try {
d && !d.done && (r = y.return) && r.call(y);
} finally {
if (o) throw o.error;
}
}
}
} catch (e) {
i = {
error: e
};
} finally {
try {
c && !c.done && (n = h.return) && n.call(h);
} finally {
if (i) throw i.error;
}
}
};
t.prototype.clearAllNodes = function() {
var e, t, i, n, o, r;
try {
for (var a = p(this._spineNodes.values()), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
cc.isValid(l) && l.destroy();
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (t = a.return) && t.call(a);
} finally {
if (e) throw e.error;
}
}
this._spineNodes.clear();
this._skeletonCache.clear();
try {
for (var h = p(this._layerNodes.values()), c = h.next(); !c.done; c = h.next()) {
var u = c.value;
try {
for (var y = (o = void 0, p(u)), d = y.next(); !d.done; d = y.next()) {
l = d.value;
cc.isValid(l) && l.destroy();
}
} catch (e) {
o = {
error: e
};
} finally {
try {
d && !d.done && (r = y.return) && r.call(y);
} finally {
if (o) throw o.error;
}
}
}
} catch (e) {
i = {
error: e
};
} finally {
try {
c && !c.done && (n = h.return) && n.call(h);
} finally {
if (i) throw i.error;
}
}
this._layerNodes.clear();
this._layerSkeletons.clear();
};
t.prototype.onAnimationComplete = function(e) {
var t;
if (e) {
var i = (null === (t = e.animation) || void 0 === t ? void 0 : t.name) || "";
i.endsWith("_out") ? null !== this._pendingShape ? this.playPendingShapeInAnimation() : this.hideAllAnimations() : i.endsWith("_init") || i.endsWith("_in") && this.playInitAnimation();
}
};
t.prototype.onLayerAnimationComplete = function(e) {
var t;
if (e) {
var i = (null === (t = e.animation) || void 0 === t ? void 0 : t.name) || "";
i.endsWith("_out") ? null !== this._pendingShape ? this.playPendingShapeInAnimation() : this.hideAllAnimations() : i.endsWith("_init") || i.match(/_in_\d$/) && this.playInitAnimation();
}
};
t.prototype.getCurrentSkinId = function() {
var e, t = null === (e = hs.skinInfo) || void 0 === e ? void 0 : e.currentSkinId;
return null != t && "" !== t ? t : i.ORIGINAL_SKIN_ID;
};
t.prototype.getColorConfigForSkin = function(e, t) {
var i, n;
if (!this._skinAnimColorsConfig || !this._skinAnimColorsConfig.groups) return null;
try {
for (var o = p(this._skinAnimColorsConfig.groups), r = o.next(); !r.done; r = o.next()) {
var a = r.value;
if (a.skinIds.some(function(t) {
return String(t) === e;
})) return a.animations[t];
}
} catch (e) {
i = {
error: e
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (i) throw i.error;
}
}
return null;
};
t.prototype.getSkinGroupName = function(e) {
var t, i;
if (!this._skinAnimColorsConfig || !this._skinAnimColorsConfig.groups) return "";
try {
for (var n = p(this._skinAnimColorsConfig.groups), o = n.next(); !o.done; o = n.next()) {
var r = o.value;
if (r.skinIds.some(function(t) {
return String(t) === e;
})) return r.groupName;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
o && !o.done && (i = n.return) && i.call(n);
} finally {
if (t) throw t.error;
}
}
return "";
};
t.prototype.applyColorToNode = function(e, t) {
if (cc.isValid(e) && t) {
var i, n, o, r = t.replace("#", ""), a = 255;
if (6 === r.length) {
i = parseInt(r.substring(0, 2), 16);
n = parseInt(r.substring(2, 4), 16);
o = parseInt(r.substring(4, 6), 16);
} else {
if (8 !== r.length) return;
i = parseInt(r.substring(0, 2), 16);
n = parseInt(r.substring(2, 4), 16);
o = parseInt(r.substring(4, 6), 16);
a = parseInt(r.substring(6, 8), 16);
}
e.color = new cc.Color(i, n, o);
a < 255 && (e.opacity = a);
}
};
Object.defineProperty(t.prototype, "animSpeed", {
get: function() {
var e = this.getAnimSpeed();
return "number" == typeof e ? e : 1;
},
enumerable: !1,
configurable: !0
});
t.prototype.getAnimSpeed = function() {
return this.props.animSpeed;
};
var i;
t.BUNDLE_NAME = "ComboTipsDynamicStyleTrait";
t.ORIGINAL_SKIN_ID = "1000";
t.COMBO_THRESHOLD_HEART = 5;
t.COMBO_THRESHOLD_SQUARE = 10;
t.COMBO_THRESHOLD_PENTAGON = 15;
t.SPINE_PATH_MAP = ((o = {})[c.ComboShapeType.Heart] = "spine/{skinType}/xx/gameplay_xxcombo_tips", 
o[c.ComboShapeType.Square] = "spine/{skinType}/fx/gameplay_fxcombo_tips", o[c.ComboShapeType.Pentagon] = "spine/{skinType}/wjx/gameplay_wjxcombo_tips", 
o[c.ComboShapeType.Crown] = "spine/{skinType}/hg/gameplay_hgcombo_tips", o);
return i = a([ classId("ComboTipsDynamicStyleTrait"), classMethodWatch() ], t);
}(Trait);
i.ComboTipsDynamicStyleTrait = u;
cc._RF.pop();
}, {
"./types/ComboTipsDynamicStyleTypes": "ComboTipsDynamicStyleTypes"
} ],
ComboTipsDynamicStyleTypes: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "5d063XG7X1DuaCFJczEYJJt", "ComboTipsDynamicStyleTypes");
Object.defineProperty(i, "__esModule", {
value: !0
});
i.AnimationNameUtil = i.SkinType = i.ComboShapeType = void 0;
(function(e) {
e.Heart = "xx";
e.Square = "fx";
e.Pentagon = "wjx";
e.Crown = "hg";
})(i.ComboShapeType || (i.ComboShapeType = {}));
(function(e) {
e.Default = "defaultSkin";
e.Other = "otherSkin";
})(i.SkinType || (i.SkinType = {}));
i.AnimationNameUtil = {
getInAnimName: function(e) {
return e + "_in";
},
getInLayerAnimName: function(e, t) {
return e + "_in_" + t;
},
getInitAnimName: function(e) {
return e + "_init";
},
getOutAnimName: function(e) {
return e + "_out";
}
};
cc._RF.pop();
}, {} ]
}, {}, [ "ComboTipsDynamicStyleTrait", "ComboTipsDynamicStyleTypes" ]);
//# sourceMappingURL=index.js.map
