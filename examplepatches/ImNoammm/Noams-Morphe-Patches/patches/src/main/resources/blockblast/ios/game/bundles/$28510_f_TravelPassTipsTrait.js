window.__require = function t(e, i, o) {
function n(a, s) {
if (!i[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (r) return r(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var h = i[a] = {
exports: {}
};
e[a][0].call(h.exports, function(t) {
return n(e[a][1][t] || t);
}, h, h.exports, t, e, i, o);
}
return i[a].exports;
}
for (var r = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
$28510_f_TravelPassTipsTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "7edcb6Li3BP86O59tSns4y3", "$28510_f_TravelPassTipsTrait");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), r = this && this.__assign || function() {
return (r = Object.assign || function(t) {
for (var e, i = 1, o = arguments.length; i < o; i++) {
e = arguments[i];
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
}
return t;
}).apply(this, arguments);
}, a = this && this.__decorate || function(t, e, i, o) {
var n, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(e, i, a) : n(e, i)) || a);
return r > 3 && a && Object.defineProperty(e, i, a), a;
}, s = this && this.__awaiter || function(t, e, i, o) {
return new (i || (i = Promise))(function(n, r) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
r(t);
}
}
function s(t) {
try {
c(o.throw(t));
} catch (t) {
r(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof i ? e : new i(function(t) {
t(e);
})).then(a, s);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, c = this && this.__generator || function(t, e) {
var i, o, n, r, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
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
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(r) {
if (i) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (i = 1, o && (n = 2 & r[0] ? o.return : r[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, r[1])).done) return n;
(o = 0, n) && (r = [ 2 & r[0], n.value ]);
switch (r[0]) {
case 0:
case 1:
n = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
o = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!n || r[1] > n[0] && r[1] < n[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < n[1]) {
a.label = n[1];
n = r;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(r);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = e.call(t, a);
} catch (t) {
r = [ 6, t ];
o = 0;
} finally {
i = n = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
}, l = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, i = e && t[e], o = 0;
if (i) return i.call(t);
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
Object.defineProperty(i, "__esModule", {
value: !0
});
i.$28510_f_TravelPassTipsTrait = void 0;
var h = t("../components/TravelPassLevelTipComponent"), p = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.storeKey = "28510_f_TravelPassTips";
e.tipPrefab = null;
e.tipNode = null;
e.tipComp = null;
e.mosaicNodeRef = null;
e.mosaicRowTween = null;
e.mosaicDistanceTween = null;
e.PREFAB_BUNDLE = "$28510_f_TravelPassTipsTrait";
e.PREFAB_PATH = "prefab/TravelPassLevelTip";
e.PREFAB_PATH_NEW = "prefab/TravelPassLevelTipNew";
e.prefabPath = e.PREFAB_PATH;
e.curBundle = null;
e.initPromise = null;
return e;
}
e.prototype.getFixedPassTarget = function() {
return 0;
};
e.prototype.loadData = function() {
var t = {
refreshTime: Date.now(),
passTimes: 0,
currentPassNum: hs.chapterGameInfo.chapterNum,
recordPassNum: 0,
gp_dem: 10,
gp_stage: 0,
gp_dem_ori: 0
}, e = storage.getItem(this.storeKey, t);
return r(r({}, t), e);
};
e.prototype.saveData = function(t) {
storage.setItem(this.storeKey, t);
};
e.prototype.onCreate = function() {
var t = this;
if (this.getIsUseNewArt()) {
this.initPromise = this.initUseNewArt();
this.initPromise.then(function() {
return t.ensureTipInstance();
}).catch(function() {});
} else this.ensureTipInstance().catch(function() {});
};
e.prototype.initUseNewArt = function() {
return s(this, void 0, void 0, function() {
var t;
return c(this, function(e) {
switch (e.label) {
case 0:
t = this;
return [ 4, hs.ResLoader.asyncLoadBundle(this.PREFAB_BUNDLE) ];

case 1:
t.curBundle = e.sent();
if (!this.curBundle || !cc.isValid(this.curBundle)) return [ 2 ];
if (hs.ResLoader.isBundleAssetDownloaded(this.curBundle, this.PREFAB_PATH_NEW, {
type: cc.Prefab,
target: "import"
})) {
this.prefabPath = this.PREFAB_PATH_NEW;
return [ 2 ];
}
if (!hs.ResLoader.isBundleAssetDownloaded(this.curBundle, this.PREFAB_PATH, {
type: cc.Prefab,
target: "import"
})) {
this.prefabPath = this.PREFAB_PATH_NEW;
return [ 2 ];
}
hs.ResLoader.loadByBundle(this.PREFAB_BUNDLE, this.PREFAB_PATH_NEW, cc.Prefab, function() {});
return [ 2 ];
}
});
});
};
e.prototype.ensureTipInstance = function() {
return s(this, void 0, Promise, function() {
var t;
return c(this, function(e) {
switch (e.label) {
case 0:
e.trys.push([ 0, 5, , 6 ]);
return this.getIsUseNewArt() && this.initPromise ? [ 4, this.initPromise ] : [ 3, 2 ];

case 1:
e.sent();
e.label = 2;

case 2:
if (this.tipPrefab && cc.isValid(this.tipPrefab)) return [ 3, 4 ];
t = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(this.PREFAB_BUNDLE, this.prefabPath, cc.Prefab) ];

case 3:
t.tipPrefab = e.sent();
e.label = 4;

case 4:
if (!this.tipNode || !cc.isValid(this.tipNode)) {
this.tipNode = cc.instantiate(this.tipPrefab);
this.tipComp = this.tipNode.getComponent(h.default);
}
return [ 2, this.tipComp ];

case 5:
throw e.sent();

case 6:
return [ 2 ];
}
});
});
};
e.prototype.getIsUseNewArt = function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.useNewArt) && void 0 !== e && e;
};
e.prototype.isSameDay = function(t, e) {
var i = new Date(t), o = new Date(e);
return i.getFullYear() === o.getFullYear() && i.getMonth() === o.getMonth() && i.getDate() === o.getDate();
};
e.prototype.getRemainSecondsToNextMondayZero = function(t) {
void 0 === t && (t = Date.now());
var e = new Date(t), i = e.getDay(), o = 1 === i ? 7 : 0 === i ? 1 : 8 - i, n = new Date(e);
n.setHours(0, 0, 0, 0);
n.setDate(n.getDate() + o);
return Math.max(0, Math.floor((n.getTime() - t) / 1e3));
};
e.prototype.getRemainRefreshTime = function() {
var t = Date.now(), e = storage.getItem("chapterPeriodsBeginTime", t), i = 604800 - Math.floor((t - e) / 1e3);
i < 0 && (i = 0);
return i;
};
e.prototype.calcPassTarget = function(t, e, i) {
var o = this.getFixedPassTarget();
if (o > 0) return o;
var n = Math.max(0, e - t), r = Math.floor(i / 86400);
return Math.max(1, Math.ceil(n / (r + 1)));
};
e.prototype.computeTipState = function(t, e, i, o) {
var n = Math.floor(t / Math.max(1, o + 1)), r = {
state: "NO_SHOW",
nextRecord: e
};
n > 0 && n > e && (r = {
state: "NO_SHOW",
nextRecord: n
});
t >= i && (r = {
state: t === i ? "BE_LIKE" : "NO_SHOW",
nextRecord: e
});
1 === t && 1 !== i && (r = {
state: "NOT_PASS",
nextRecord: e
});
var a = hs.chapterGameInfo.chapterAllNum || 96;
hs.chapterGameInfo.chapterNum >= a && (r = {
state: "BE_LIKE",
nextRecord: e
});
return r;
};
e.prototype.mapToPassState = function(t) {
switch (t) {
case "BE_LIKE":
return h.PASS_STATE.BE_LIKE;

case "NOT_PASS":
return h.PASS_STATE.NOT_PASS;

default:
return h.PASS_STATE.NO_SHOW;
}
};
e.prototype.showTipWhenUiReady = function(t) {
return s(this, void 0, void 0, function() {
var e, i, o;
return c(this, function(n) {
switch (n.label) {
case 0:
return [ 4, this.waitForWinRootNode(2e3) ];

case 1:
return (e = n.sent()) && cc.isValid(e) ? [ 4, this.waitForOptimizingOrHardNode(e, 500) ] : [ 2 ];

case 2:
n.sent();
return [ 4, this.ensureTipInstance() ];

case 3:
i = n.sent();
this.tipNode && this.tipNode.parent !== e && (this.tipNode.parent = e);
this.tipNode.active = !1;
o = this.mapToPassState(t);
i.init(o, e, this);
return [ 2 ];
}
});
});
};
e.prototype.waitForOptimizingOrHardNode = function(t, e) {
void 0 === e && (e = 2e3);
return s(this, void 0, Promise, function() {
var i;
return c(this, function() {
i = Date.now();
return [ 2, new Promise(function(o) {
var n = function() {
if (cc.isValid(t)) {
var r = !!t.getChildByName("ResultOptimizing_UI"), a = !!t.getChildByName("hardLevelDefeat");
r || a ? o() : Date.now() - i >= e ? o() : setTimeoutSafe(n, 50);
} else o();
};
n();
}) ];
});
});
};
e.prototype.waitForWinRootNode = function(t) {
void 0 === t && (t = 2e3);
return s(this, void 0, Promise, function() {
var e;
return c(this, function() {
e = Date.now();
return [ 2, new Promise(function(i) {
var o = function() {
var n, r, a = "undefined" != typeof hs.ChapterScoreWin ? Cinst(hs.ChapterScoreWin) : null, s = "undefined" != typeof hs.ChapterCollectWin ? Cinst(hs.ChapterCollectWin) : null, c = null;
(null === (n = null == a ? void 0 : a.node) || void 0 === n ? void 0 : n.active) && cc.isValid(a.node) ? c = a.node : (null === (r = null == s ? void 0 : s.node) || void 0 === r ? void 0 : r.active) && cc.isValid(s.node) && (c = s.node);
c ? i(c) : Date.now() - e >= t ? i(null) : setTimeoutSafe(o, 50);
};
o();
}) ];
});
});
};
e.prototype.showCompletedLevelsInstantlyForMosaic = function(t) {
for (var e = hs.chapterGameInfo, i = e.chapterNum, o = e.lastChapterNum, n = 0; n < t.itemList.length; n++) {
var r = t.itemList[n];
n < i && r.setState({
isStopAllAction: !0,
isShowAnimation: !1,
showColor: !0,
isOpacityAni: !1,
opacity: 255
});
}
i <= o && !hs.chapterGameInfo.isThroughAll && storage.setItem("lastChapterNum", i);
};
e.prototype.playGlowEffect = function(t) {
if (t) {
var e = null, i = t.colorImg;
i && (i instanceof cc.Node ? e = i : i.node && i.node instanceof cc.Node && (e = i.node));
var o = null, n = t.light;
n && (n instanceof cc.Node ? o = n : n.node && n.node instanceof cc.Node && (o = n.node));
if (e && cc.isValid(e)) {
var r = cc.instantiate(e);
r.parent = e.parent;
r.position = e.position;
var a = r.getComponent(cc.Sprite);
if (a) {
a.srcBlendFactor = cc.macro.BlendFactor.SRC_ALPHA;
a.dstBlendFactor = cc.macro.BlendFactor.ONE;
}
r.opacity = 0;
cc.Tween.stopAllByTarget(r);
cc.tween(r).to(.1, {
opacity: 255
}).to(.3, {
opacity: 0
}).call(function() {
cc.Tween.stopAllByTarget(r);
cc.isValid(r) && r.destroy();
}).start();
}
if (o && cc.isValid(o)) {
o.opacity = 0;
cc.Tween.stopAllByTarget(o);
cc.tween(o).to(.1, {
opacity: 255
}).to(.17, {
opacity: 0
}).call(function() {
cc.Tween.stopAllByTarget(o);
}).start();
}
}
};
e.prototype.showRowByRowAnimation = function(t) {
var e = this, i = t.target, o = t.args[0];
if (o && cc.isValid(o) && i._rowItems && 0 !== i._rowItems.length) {
this.mosaicNodeRef = o;
if (this.mosaicRowTween) {
this.mosaicRowTween.stop();
this.mosaicRowTween = null;
}
cc.Tween.stopAllByTarget(o);
var n = 0;
this.showCompletedLevelsInstantlyForMosaic(i);
var r = function() {
if (o && cc.isValid(o)) if (n > i._heightLength - 1) {
if (e.mosaicRowTween) {
e.mosaicRowTween.stop();
e.mosaicRowTween = null;
}
e.playDistanceBasedAnimation(t);
} else {
var a = i._rowItems[n];
a && a.length > 0 && a.forEach(function(t) {
t && cc.isValid(t) && (t.node.active = !0);
});
n++;
if (o && cc.isValid(o)) {
cc.Tween.stopAllByTarget(o);
e.mosaicRowTween = cc.tween(o).delay(.03).call(r);
e.mosaicRowTween.start();
}
} else if (e.mosaicRowTween) {
e.mosaicRowTween.stop();
e.mosaicRowTween = null;
}
};
r();
}
};
e.prototype.playDistanceBasedAnimation = function(t) {
var e, i, o, n, r = this, a = t.target, s = t.args[0];
if (a._itemPositions && 0 !== a._itemPositions.length) {
this.mosaicNodeRef = s;
if (this.mosaicDistanceTween) {
this.mosaicDistanceTween.stop();
this.mosaicDistanceTween = null;
}
s && cc.isValid(s) && cc.Tween.stopAllByTarget(s);
var c = hs.chapterGameInfo;
if (!(c.chapterNum - c.lastChapterNum <= 0)) {
var h = Infinity;
try {
for (var p = l(a._itemPositions), u = p.next(); !u.done; u = p.next()) (v = u.value).col < h && (h = v.col);
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (i = p.return) && i.call(p);
} finally {
if (e) throw e.error;
}
}
var f = new Map();
try {
for (var d = l(a._itemPositions), m = d.next(); !m.done; m = d.next()) {
var v = m.value, y = Math.abs(v.row - 0) + Math.abs(v.col - h);
f.has(y) || f.set(y, []);
f.get(y).push(v.item);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
m && !m.done && (n = d.return) && n.call(d);
} finally {
if (o) throw o.error;
}
}
var _ = Array.from(f.keys()).sort(function(t, e) {
return t - e;
}), T = 0, w = function() {
if (T >= _.length) {
if (r.mosaicDistanceTween) {
r.mosaicDistanceTween.stop();
r.mosaicDistanceTween = null;
}
} else {
var t = _[T];
f.get(t).forEach(function(t) {
t && t.state && t.state.showColor && r.playGlowEffect(t);
});
T++;
if (s && cc.isValid(s)) {
cc.Tween.stopAllByTarget(s);
r.mosaicDistanceTween = cc.tween(s).delay(.08).call(function() {
w();
});
r.mosaicDistanceTween.start();
}
}
};
w();
}
}
};
e.prototype.stopMosaicAnimations = function() {
if (this.mosaicRowTween) {
this.mosaicRowTween.stop();
this.mosaicRowTween = null;
}
if (this.mosaicDistanceTween) {
this.mosaicDistanceTween.stop();
this.mosaicDistanceTween = null;
}
this.mosaicNodeRef && cc.isValid(this.mosaicNodeRef) && cc.Tween.stopAllByTarget(this.mosaicNodeRef);
this.mosaicNodeRef = null;
};
e.prototype.addPassTimes = function() {
var t = this.loadData();
t.passTimes = Math.max(0, t.passTimes || 0) + 1;
this.saveData(t);
};
e.prototype.getLeftPassTimes = function() {
var t = this.getFixedPassTarget();
if (t > 0) return t;
var e = this.getRemainRefreshTime(), i = hs.chapterGameInfo.chapterAllNum || 96, o = Math.floor(e / 86400);
return Math.max(1, Math.ceil((i - hs.chapterGameInfo.chapterNum) / (o + 1)));
};
e.prototype.getGpDem = function() {
var t = this.loadData();
return t.gp_dem_ori || t.gp_dem || 10;
};
e.prototype.onActive = function(t) {
var e, i;
if (hs.tp.isChapterGame_ProxyOnStartGame(t)) {
var o = this.loadData();
if (!this.isSameDay(o.refreshTime, Date.now())) {
o.refreshTime = Date.now();
o.passTimes = 0;
o.recordPassNum = 0;
o.gp_dem_ori = o.gp_dem;
o.currentPassNum = hs.chapterGameInfo.chapterNum;
}
this.saveData(o);
} else if (hs.tp.isChapterGame_ProxyOnGameOver(t)) {
if (!hs.gameOverGameInfo.isChapterWin) return;
o = this.loadData();
if (!this.isSameDay(o.refreshTime, Date.now())) {
o.refreshTime = Date.now();
o.passTimes = 0;
o.recordPassNum = 0;
o.gp_dem_ori = o.gp_dem;
o.currentPassNum = hs.chapterGameInfo.chapterNum;
}
o.passTimes = Math.max(0, o.passTimes || 0) + 1;
this.saveData(o);
} else if (hs.tp.isChapterCollectWinAddItem(t) || hs.tp.isChapterScoreWinScoreBonePlay(t)) this.tryShowTravelPassTips(); else if (hs.tp.isChapterCollectWinOnDisable(t) || hs.tp.isChapterScoreWinOnDisable(t)) {
var n = t.target.node.getChildByName("TravelPassLevelTip");
n && (n.active = !1);
this.stopMosaicAnimations();
} else if (hs.tp.isTravelResultOptimizingTraitShowMosaicNode(t)) {
(a = t.args[0]).active = !1;
t.replace = !0;
} else if (hs.tp.isTravelResultOptimizingTraitMoveChapter(t)) {
t.replace = !0;
var r = t.target, a = t.args[0];
r._rowItems = [];
r._itemPositions = [];
if (!r._rowItems || 0 === r._rowItems.length) {
for (var s = Array.isArray(r.itemList) ? r.itemList : [], c = [], h = new Map(), p = 0; p < s.length; p++) {
var u = s[p], f = u && u.node;
if (f && cc.isValid(f)) {
var d = Math.round(f.y), m = void 0;
try {
for (var v = (e = void 0, l(c)), y = v.next(); !y.done; y = v.next()) {
var _ = y.value;
if (Math.abs(_ - d) <= 1) {
m = _;
break;
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
y && !y.done && (i = v.return) && i.call(v);
} finally {
if (e) throw e.error;
}
}
if (void 0 === m) {
m = d;
c.push(m);
}
h.has(m) || h.set(m, []);
h.get(m).push(u);
u.setState({
isStopAllAction: !0,
isShowAnimation: !1,
showColor: !1,
isOpacityAni: !1,
opacity: 0
});
u.node.active = !1;
}
}
a.active = !0;
c.sort(function(t, e) {
return t - e;
});
r._rowItems = c.map(function(t) {
var e = h.get(t) || [];
e.sort(function(t, e) {
return t.node.x - e.node.x;
});
return e;
});
r._rowItems.forEach(function(t, e) {
t.forEach(function(t, i) {
r._itemPositions.push({
item: t,
row: e,
col: i
});
});
});
"number" == typeof r._heightLength && r._heightLength === r._rowItems.length || (r._heightLength = r._rowItems.length);
}
var T = hs.chapterGameInfo;
if (T.chapterNum - T.lastChapterNum <= 0) {
a.active = !0;
this.showCompletedLevelsInstantlyForMosaic(r);
return;
}
this.showRowByRowAnimation(t);
}
};
e.prototype.tryShowTravelPassTips = function() {
var t = this.loadData(), e = this.getRemainRefreshTime(), i = hs.chapterGameInfo.chapterAllNum || 96, o = Math.floor(e / 86400), n = this.calcPassTarget("number" == typeof t.currentPassNum ? t.currentPassNum : hs.chapterGameInfo.chapterNum, i, e), r = this.computeTipState(Math.max(0, t.passTimes || 0), Math.max(0, t.recordPassNum || 0), n, o), a = r.state, s = r.nextRecord;
t.recordPassNum = s;
if ("NO_SHOW" !== a) {
this.showTipWhenUiReady(a);
this.saveData(t);
} else this.saveData(t);
};
return a([ classId("$28510_f_TravelPassTipsTrait"), classMethodWatch() ], e);
}(Trait);
i.$28510_f_TravelPassTipsTrait = p;
cc._RF.pop();
}, {
"../components/TravelPassLevelTipComponent": "TravelPassLevelTipComponent"
} ],
$28510_f_TravelPassTips_isOptimization_Trait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "d1f6bAjflpMna8ui3w9bp8Y", "$28510_f_TravelPassTips_isOptimization_Trait");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), r = this && this.__decorate || function(t, e, i, o) {
var n, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(e, i, a) : n(e, i)) || a);
return r > 3 && a && Object.defineProperty(e, i, a), a;
}, a = this && this.__awaiter || function(t, e, i, o) {
return new (i || (i = Promise))(function(n, r) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
r(t);
}
}
function s(t) {
try {
c(o.throw(t));
} catch (t) {
r(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof i ? e : new i(function(t) {
t(e);
})).then(a, s);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, s = this && this.__generator || function(t, e) {
var i, o, n, r, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
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
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(r) {
if (i) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (i = 1, o && (n = 2 & r[0] ? o.return : r[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, r[1])).done) return n;
(o = 0, n) && (r = [ 2 & r[0], n.value ]);
switch (r[0]) {
case 0:
case 1:
n = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
o = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!n || r[1] > n[0] && r[1] < n[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < n[1]) {
a.label = n[1];
n = r;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(r);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = e.call(t, a);
} catch (t) {
r = [ 6, t ];
o = 0;
} finally {
i = n = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.$28510_f_TravelPassTips_isOptimization_Trait = void 0;
var c = t("../components/TravelPassLevelTipComponent"), l = t("./$28510_f_TravelPassTipsTrait"), h = "prefab/TravelPassLevelTipOptimization", p = "prefab/TravelPassLevelTipNewOptimization", u = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.PREFAB_PATH_OPTIMIZATION = h;
e.PREFAB_PATH_NEW_OPTIMIZATION = p;
return e;
}
e.prototype.getIsOptimization = function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.isOptimization) && void 0 !== e && e;
};
e.prototype.getResUrl = function() {
return a(this, void 0, void 0, function() {
return s(this, function(t) {
switch (t.label) {
case 0:
return this.getIsOptimization() ? [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(this.traitName, this.PREFAB_PATH, {
type: cc.Prefab
}) ] : [ 2 ];

case 1:
if (!t.sent()) {
this.prefabPath = this.PREFAB_PATH_NEW_OPTIMIZATION;
return [ 2 ];
}
return [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(this.traitName, this.PREFAB_PATH_NEW_OPTIMIZATION, {
type: cc.Prefab
}) ];

case 2:
if (t.sent()) {
this.prefabPath = this.PREFAB_PATH_NEW_OPTIMIZATION;
return [ 2 ];
}
return [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(this.traitName, this.PREFAB_PATH_OPTIMIZATION, {
type: cc.Prefab
}) ];

case 3:
t.sent() && (this.prefabPath = this.PREFAB_PATH_OPTIMIZATION);
return [ 2 ];
}
});
});
};
e.prototype.ensureTipInstance = function() {
return a(this, void 0, Promise, function() {
var t;
return s(this, function(e) {
switch (e.label) {
case 0:
e.trys.push([ 0, 6, , 7 ]);
return this.getIsUseNewArt() && this.initPromise ? [ 4, this.initPromise ] : [ 3, 2 ];

case 1:
e.sent();
e.label = 2;

case 2:
return [ 4, this.getResUrl() ];

case 3:
e.sent();
if (this.tipPrefab && cc.isValid(this.tipPrefab)) return [ 3, 5 ];
t = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(this.PREFAB_BUNDLE, this.prefabPath, cc.Prefab) ];

case 4:
t.tipPrefab = e.sent();
e.label = 5;

case 5:
if (!this.tipNode || !cc.isValid(this.tipNode)) {
this.tipNode = cc.instantiate(this.tipPrefab);
this.tipComp = this.tipNode.getComponent(c.default);
}
return [ 2, this.tipComp ];

case 6:
throw e.sent();

case 7:
return [ 2 ];
}
});
});
};
return r([ classId("$28510_f_TravelPassTipsTrait", "isOptimization") ], e);
}(l.$28510_f_TravelPassTipsTrait);
i.$28510_f_TravelPassTips_isOptimization_Trait = u;
cc._RF.pop();
}, {
"../components/TravelPassLevelTipComponent": "TravelPassLevelTipComponent",
"./$28510_f_TravelPassTipsTrait": "$28510_f_TravelPassTipsTrait"
} ],
TravelPassLevelTipComponent: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "77a55MKF9RPlI1RE1dT1y4A", "TravelPassLevelTipComponent");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), r = this && this.__decorate || function(t, e, i, o) {
var n, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(e, i, a) : n(e, i)) || a);
return r > 3 && a && Object.defineProperty(e, i, a), a;
}, a = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, i = e && t[e], o = 0;
if (i) return i.call(t);
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
Object.defineProperty(i, "__esModule", {
value: !0
});
i.PASS_STATE = void 0;
var s, c = cc._decorator, l = c.ccclass, h = c.property;
(function(t) {
t[t.NO_SHOW = 0] = "NO_SHOW";
t[t.PASS = 1] = "PASS";
t[t.NOT_PASS = 2] = "NOT_PASS";
t[t.BE_LIKE = 3] = "BE_LIKE";
})(s = i.PASS_STATE || (i.PASS_STATE = {}));
var p = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.dragonBones = null;
e.word_1 = null;
e.word_2 = null;
e.rootNode = null;
e.tipsTrait = null;
return e;
}
e.prototype.init = function(t, e, i) {
var o = this;
this.__state = t;
this.rootNode = e;
this.tipsTrait = i;
this.changeSkin();
setTimeout(function() {
if (cc.isValid(o.node)) {
o.node.active = !0;
o.updateTipsView();
}
}, 100);
if (hs.multiLangInfo.checkLangIsKorean()) {
null != this.word_1 && (this.word_1.font = null);
null != this.word_2 && (this.word_2.font = null);
}
};
e.prototype.changeSkin = function() {};
e.prototype.updateTipsView = function() {
var t = "gold1";
this.word_2.string = "Finish the season and full mosaic!";
switch (this.__state) {
case s.PASS:
t = "gold3";
this.word_1.string = "";
break;

case s.NOT_PASS:
t = "gold1";
this.word_1.string = "Daily Goal: {0} levels";
var e = this.word_1.string;
e = hs.multiLangInfo.replaceString(e, [ this.tipsTrait.getLeftPassTimes() + "" ]);
this.word_1.string = e;
break;

case s.BE_LIKE:
t = "gold2";
this.word_1.string = "Daily Goal Complete!";
}
if (this.__state !== s.NO_SHOW) {
this.dragonBones.playAnimation(t, 1);
this.autoAdapt();
} else this.node.active = !1;
};
e.prototype.autoAdapt = function() {
var t, e, i, o, n, r;
(null === (t = this.rootNode.getChildByName("ResultOptimizing_UI")) || void 0 === t ? void 0 : t.active) ? r = this.rootNode.getChildByName("ResultOptimizing_UI") : (null === (e = this.rootNode.getChildByName("scoreBoneAni")) || void 0 === e ? void 0 : e.active) ? r = this.rootNode.getChildByName("scoreBoneAni") : (null === (i = this.rootNode.getChildByName("collectItemNode")) || void 0 === i ? void 0 : i.active) && (r = this.rootNode.getChildByName("collectItemNode"));
(null === (o = this.rootNode.getChildByName("hardLevelDefeat")) || void 0 === o ? void 0 : o.active) && (r = this.rootNode.getChildByName("hardLevelDefeat"));
if (cc.isValid(r)) {
var a = this.rootNode.getChildByName("playBtn"), s = this.rootNode.getChildByName("playBtnIOS"), c = r.y, l = "ResultOptimizing_UI" === r.name ? -220 : this.getNodeBoundingBox(r).height, h = null === (n = this.rootNode) || void 0 === n ? void 0 : n.getChildByName("PassLevelReward"), p = 0;
if ("collectItemNode" === r.name) {
p = 40;
h && h.active && (h.y -= 20);
}
var u = 0;
if (h && h.active && "ResultOptimizing_UI" === r.name) h.y -= h.height + 40 + 150; else if (h && h.active && "scoreBoneAni" === r.name) {
u += 20;
h.y -= 50;
}
this.node.y = c - l / 2 - 40 - 42 - p;
if ("hardLevelDefeat" === r.name) {
this.node.y = r.y - 513;
h && h.active && (h.y -= 50);
}
a && (a.y = this.node.y - 84 - 66 - a.height / 2 + u);
s && (s.y = this.node.y - 84 - 66 - s.height / 2 + u);
this.afterAutoAdapt();
} else this.node.active = !1;
};
e.prototype.afterAutoAdapt = function() {};
e.prototype.getNodeBoundingBox = function(t) {
var e = t || this.node, i = e.getBoundingBox();
if (0 === e.children.length) return i;
var o = i.x, n = i.y, r = i.x + i.width, s = i.y + i.height, c = function(t) {
var e, i;
try {
for (var l = a(t.children), h = l.next(); !h.done; h = l.next()) {
var p = h.value, u = p.getBoundingBox();
o = Math.min(o, u.x);
n = Math.min(n, u.y);
r = Math.max(r, u.x + u.width);
s = Math.max(s, u.y + u.height);
c(p);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
h && !h.done && (i = l.return) && i.call(l);
} finally {
if (e) throw e.error;
}
}
};
c(e);
return cc.rect(o, n, r - o, s - n);
};
r([ h(dragonBones.ArmatureDisplay) ], e.prototype, "dragonBones", void 0);
r([ h(cc.Label) ], e.prototype, "word_1", void 0);
r([ h(cc.Label) ], e.prototype, "word_2", void 0);
return r([ classId("TravelPassLevelTipComponent"), l, classMethodWatch() ], e);
}(hs.Component);
i.default = p;
cc._RF.pop();
}, {} ]
}, {}, [ "TravelPassLevelTipComponent", "$28510_f_TravelPassTipsTrait", "$28510_f_TravelPassTips_isOptimization_Trait" ]);
//# sourceMappingURL=index.js.map
