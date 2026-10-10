window.__require = function t(e, r, o) {
function n(s, a) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var u = r[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return n(e[s][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
RestoreChapterContent: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6722b5Qpo5P8Yo9Du8Va7+W", "RestoreChapterContent");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(n, i) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, n, i, s = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
s.label++;
return {
value: i[1],
done: !1
};

case 5:
s.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(n = s.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
s = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
s.label = i[1];
break;
}
if (6 === i[0] && s.label < n[1]) {
s.label = n[1];
n = i;
break;
}
if (n && s.label < n[2]) {
s.label = n[2];
s.ops.push(i);
break;
}
n[2] && s.ops.pop();
s.trys.pop();
continue;
}
i = e.call(t, s);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, c = this && this.__values || function(t) {
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
var l = t("./RestoreChapterCurSeat"), u = t("./RestoreChapterItem"), p = t("./RestoreChapterLevelTxt"), h = cc._decorator.ccclass, d = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.itemList = [];
e.levelTextComps = [];
e._itemCaches = [];
e._levelTextCaches = [];
e._isInit = !1;
e._levelTextParent = null;
e._curSeatComp = null;
e._levelCount = 0;
e._stage = -1;
e._listData = [];
e._way = [];
e._order = [];
return e;
}
e.prototype.render = function() {
return s(this, void 0, Promise, function() {
return a(this, function(t) {
switch (t.label) {
case 0:
cc.Tween.stopAllByTarget(this.node);
return [ 4, this.init() ];

case 1:
t.sent();
if (!cc.isValid(this.node)) return [ 2 ];
this.resetAllItems();
this.hideCurSeat();
this.playMoveToCurrentChapter();
return [ 2 ];
}
});
});
};
e.prototype.shouldComponentUpdate = function(t) {
return this.state.curChapter !== t.curChapter || this.state.chapterPeriodsIndex !== t.chapterPeriodsIndex || this.state.redraw !== t.redraw;
};
e.prototype.init = function() {
return s(this, void 0, Promise, function() {
var t;
return a(this, function(e) {
switch (e.label) {
case 0:
t = this.getStage();
if (this._isInit && !this.state.redraw && this._stage === t) return [ 2 ];
this.node.opacity = 0;
return [ 4, hs.nextFrame() ];

case 1:
e.sent();
return cc.isValid(this.node) ? [ 4, this.loadChapterListResource(t) ] : [ 2 ];

case 2:
e.sent();
return cc.isValid(this.node) ? [ 4, this.loadItem() ] : [ 2 ];

case 3:
e.sent();
return cc.isValid(this.node) ? [ 4, this.loadLevelText() ] : [ 2 ];

case 4:
e.sent();
return cc.isValid(this.node) ? [ 4, this.initCurBone() ] : [ 2 ];

case 5:
e.sent();
return cc.isValid(this.node) ? [ 4, hs.nextFrame() ] : [ 2 ];

case 6:
e.sent();
if (!cc.isValid(this.node)) return [ 2 ];
this.node.opacity = 255;
this._isInit = !0;
this.state.redraw = !1;
this._stage = t;
return [ 2 ];
}
});
});
};
e.prototype.getStage = function() {
var t, e;
return null !== (e = null === (t = this.state) || void 0 === t ? void 0 : t.chapterPeriodsIndex) && void 0 !== e ? e : hs.storage.getItem("chapterPeriodsIndex", 1);
};
e.prototype.loadChapterListResource = function(t) {
return s(this, void 0, Promise, function() {
var e, r, o;
return a(this, function(n) {
switch (n.label) {
case 0:
e = this.getListJsonPath(t);
r = hs.ChapterConfig_Config.defaultListJsonPath;
o = null;
n.label = 1;

case 1:
n.trys.push([ 1, 3, , 8 ]);
return [ 4, this.loadJson(e) ];

case 2:
o = n.sent();
return [ 3, 8 ];

case 3:
n.sent();
if (e === r) return [ 3, 7 ];
n.label = 4;

case 4:
n.trys.push([ 4, 6, , 7 ]);
return [ 4, this.loadJson(r) ];

case 5:
o = n.sent();
return [ 3, 7 ];

case 6:
n.sent();
return [ 3, 7 ];

case 7:
return [ 3, 8 ];

case 8:
if (Array.isArray(o)) {
this._listData = o;
this._way = [];
this._order = [];
} else if (o && "object" == typeof o) {
this._listData = o.arr || [];
this._way = o.way || [];
this._order = o.order || [];
} else {
this._listData = [];
this._way = [];
this._order = [];
}
return [ 2 ];
}
});
});
};
e.prototype.getListJsonPath = function(t) {
var e, r, o = hs.ChapterConfig_Config.defaultListJsonPath;
if (!Number.isFinite(t) || t <= 1) return o;
var n = ((null === (r = null === (e = hs.themeInfo) || void 0 === e ? void 0 : e.getThemeConfig) || void 0 === r ? void 0 : r.call(e)) || [])[t - 1];
return n && "local" !== n ? "" + hs.chapterListDataUrl + n + "NoTheme" : o;
};
e.prototype.loadJson = function(t) {
return new Promise(function(e, r) {
hs.ResLoader.load(t, cc.JsonAsset, function(o, n) {
!o && n ? e(n.json) : r(o || new Error("load json failed: " + t));
});
});
};
e.prototype.loadItem = function() {
return s(this, void 0, Promise, function() {
var t, e, r, o, n, i, s, c, l, p, h, d, f;
return a(this, function(a) {
switch (a.label) {
case 0:
t = this._listData;
if (!Array.isArray(t) || 0 === t.length || !Array.isArray(t[0])) return [ 2 ];
e = t.length;
r = t[0].length;
o = 80;
this._levelCount = this.getLevelCount(t);
return (n = this.itemContainer) && cc.isValid(n) ? [ 4, this.createOrUpdateCacheComponents({
parent: n,
prefabUrl: "prefabs/RestoreChapterItem",
count: this._levelCount,
componentType: u.default,
caches: this._itemCaches
}) ] : [ 2 ];

case 1:
i = a.sent();
if (!cc.isValid(n)) return [ 2 ];
this.itemList = [];
s = 0;
c = e - 1;
a.label = 2;

case 2:
return c >= 0 ? [ 4, hs.nextFrame() ] : [ 3, 5 ];

case 3:
a.sent();
if (!cc.isValid(n)) return [ 2 ];
l = e % 2;
p = (e / 2 - .5 - c) * o;
for (h = 0; h < t[c].length; h++) if (-1 !== t[c][h]) {
d = 0 !== l ? cc.v3(-Math.floor(r / 2) * o + o * h, p) : cc.v3(-r / 2 * o + o / 2 + o * h, p);
f = i[s];
if (cc.isValid(f)) {
s++;
f.node.setPosition(d);
this.itemList[s - 1] = f;
}
}
a.label = 4;

case 4:
c--;
return [ 3, 2 ];

case 5:
this.setItemListOrder();
return [ 2 ];
}
});
});
};
e.prototype.getLevelCount = function(t) {
var e, r, o, n, i = 0;
try {
for (var s = c(t), a = s.next(); !a.done; a = s.next()) {
var l = a.value;
try {
for (var u = (o = void 0, c(l)), p = u.next(); !p.done; p = u.next()) -1 !== p.value && i++;
} catch (t) {
o = {
error: t
};
} finally {
try {
p && !p.done && (n = u.return) && n.call(u);
} finally {
if (o) throw o.error;
}
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (r = s.return) && r.call(s);
} finally {
if (e) throw e.error;
}
}
return i;
};
Object.defineProperty(e.prototype, "itemListColor", {
get: function() {
for (var t = this._listData, e = [], r = t.length - 1; r >= 0; r--) for (var o = 0; o < t[r].length; o++) -1 !== t[r][o] && e.push(t[r][o]);
return e;
},
enumerable: !1,
configurable: !0
});
e.prototype.setItemListOrder = function() {
var t, e = this.itemListColor;
if (1 === this._way[0]) {
var r = this.resolveRandomOrderList();
this.itemList = this.reorderList(this.itemList, r);
e = this.reorderList(e, r);
} else if (2 === this._way[0]) {
var o = this.getOrderResult(e, this._order);
this.itemList = this.reorderList(this.itemList, o.itemOrderList);
e = o.colorList;
}
for (var n = 0; n < this.itemList.length; n++) null === (t = this.itemList[n]) || void 0 === t || t.setState({
levelNum: n + 1,
color: e[n],
showColor: !1,
isShowAnimation: !1,
isStopAllAction: !0,
isOpacityAni: !1,
opacity: 0
});
};
e.prototype.resolveRandomOrderList = function() {
var t = this.getStage(), e = hs.storage.getItem("chapterContentItemOrder", {
stage: 1,
orderList: []
});
if (e && e.stage === t && Array.isArray(e.orderList) && e.orderList.length === this.itemList.length) return e.orderList.slice();
var r = this.itemList.map(function(t, e) {
return e;
});
r.sort(function() {
return Math.random() - .5;
});
hs.storage.setItem("chapterContentItemOrder", {
stage: t,
orderList: r
});
return r;
};
e.prototype.reorderList = function(t, e) {
var r, o, n = [];
try {
for (var i = c(e), s = i.next(); !s.done; s = i.next()) {
var a = t[s.value];
a && n.push(a);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
s && !s.done && (o = i.return) && o.call(i);
} finally {
if (r) throw r.error;
}
}
return n.length > 0 ? n : t;
};
e.prototype.getOrderResult = function(t, e) {
var r, o, n = [], i = [];
try {
for (var s = c(e), a = s.next(); !a.done; a = s.next()) for (var l = a.value, u = 0; u < t.length; u++) if (t[u] === l) {
n.push(u);
i.push(t[u]);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
a && !a.done && (o = s.return) && o.call(s);
} finally {
if (r) throw r.error;
}
}
return {
itemOrderList: n,
colorList: i.length > 0 ? i : t
};
};
e.prototype.loadLevelText = function() {
return s(this, void 0, Promise, function() {
var t, e, r, o, n, i;
return a(this, function(s) {
switch (s.label) {
case 0:
if (0 === this.itemList.length) return [ 2 ];
if (!(t = this.itemContainer) || !cc.isValid(t)) return [ 2 ];
if (!this._levelTextParent) {
this._levelTextParent = new cc.Node("RestoreChapterLevelTextParent");
this._levelTextParent.parent = t;
}
return [ 4, this.createOrUpdateCacheComponents({
parent: this._levelTextParent,
prefabUrl: "prefabs/RestoreChapterLevelTxt",
count: this._levelCount,
componentType: p.default,
caches: this._levelTextCaches
}) ];

case 1:
e = s.sent();
if (!cc.isValid(this._levelTextParent)) return [ 2 ];
this.levelTextComps = e;
for (r = 0; r < this._levelCount; r++) {
o = this.itemList[r];
n = e[r];
if (cc.isValid(o) && cc.isValid(n)) {
i = r + 1;
n.node.setPosition(o.node.position);
n.level = i;
n.node.name = "还原关卡数字" + i;
n.setState({
text: i.toString(),
opacity: 255
});
}
}
return [ 2 ];
}
});
});
};
e.prototype.initCurBone = function() {
return s(this, void 0, Promise, function() {
var t, e;
return a(this, function(r) {
switch (r.label) {
case 0:
return this._curSeatComp ? [ 2 ] : [ 4, hs.ResLoader.asyncLoadByBundle("RestoreConfirmPopupTrait", "prefabs/RestoreChapterCurSeat", cc.Prefab) ];

case 1:
t = r.sent();
e = this.itemContainer;
if (!t || !e || !cc.isValid(e)) return [ 2 ];
this.addCurBone(t);
return [ 2 ];
}
});
});
};
e.prototype.addCurBone = function(t) {
var e = cc.instantiate(t), r = this.itemContainer;
if (e && r && cc.isValid(r)) {
r.addChild(e);
e.active = !1;
this._curSeatComp = e.getComponent(l.default) || e.addComponent(l.default);
}
};
e.prototype.resetAllItems = function() {
for (var t, e = 0; e < this.itemList.length; e++) {
var r = this.itemList[e];
if (cc.isValid(r)) {
cc.Tween.stopAllByTarget(r.node);
null === (t = this.levelTextComps[e]) || void 0 === t || t.setState({
opacity: 255
});
r.setState({
isStopAllAction: !0,
isShowAnimation: !1,
isThrough: !1,
showColor: !1,
isOpacityAni: !1,
opacity: 0
});
}
}
};
e.prototype.hideCurSeat = function() {
this._curSeatComp && cc.isValid(this._curSeatComp.node) && (this._curSeatComp.node.active = !1);
};
e.prototype.updateCurSeat = function() {
if (this._curSeatComp && cc.isValid(this._curSeatComp.node)) {
var t = this.currentDisplayChapter, e = t - 1, r = this.itemList[e];
if (t <= 0 || !cc.isValid(r)) this.hideCurSeat(); else {
var o = this.itemContainer;
if (o && cc.isValid(o)) {
this._curSeatComp.node.parent !== o && (this._curSeatComp.node.parent = o);
this._curSeatComp.node.setPosition(r.node.position);
this._curSeatComp.node.active = !0;
this.updateCurBone(this._curSeatComp, t, 1);
}
}
}
};
e.prototype.updateCurBone = function(t, e, r) {
t && t.setState({
animName: "stand",
playTimes: r,
curNumId: e
});
};
e.prototype.playMoveToCurrentChapter = function() {
var t = this, e = this.currentDisplayChapter;
if (!(e <= 0)) for (var r = e - 1, o = function(e) {
cc.tween(n.node).delay(.07 * (e + 1)).call(function() {
var o = t.itemList[e];
if (cc.isValid(o)) {
var n = t.levelTextComps[e];
cc.isValid(n) && n.setState({
opacity: 0
});
o.setState({
isShowAnimation: !0,
showColor: !0,
isOpacityAni: !1,
opacity: 255
});
e == r && t.updateCurSeat();
}
}).start();
}, n = this, i = 0; i <= r; i++) o(i);
};
Object.defineProperty(e.prototype, "currentDisplayChapter", {
get: function() {
var t = this.currentChapter;
return Math.min(t + 1, this.itemList.length);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "currentChapter", {
get: function() {
var t, e = null !== (t = this.state.curChapter) && void 0 !== t ? t : 0;
return Number.isFinite(e) ? Math.max(0, Math.floor(e)) : 0;
},
enumerable: !1,
configurable: !0
});
e.prototype.getLevelTextComp = function(t) {
return this.levelTextComps[t];
};
e.prototype.createOrUpdateCacheComponents = function(t) {
return s(this, void 0, Promise, function() {
var e, r, o, n, i, s, c, l, u, p, h;
return a(this, function(a) {
switch (a.label) {
case 0:
e = t.parent, r = t.prefabUrl, o = t.count, n = t.componentType, i = t.caches;
return o <= 0 || !cc.isValid(e) ? [ 2, [] ] : [ 4, hs.ResLoader.asyncLoadByBundle("RestoreConfirmPopupTrait", r, cc.Prefab) ];

case 1:
s = a.sent();
if (!cc.isValid(s) || !cc.isValid(e)) return [ 2, [] ];
for (u = o; u < i.length; u++) {
c = i[u];
cc.isValid(c) && (c.node.active = !1);
}
l = [];
for (u = 0; u < o; u++) {
p = i[u];
if (cc.isValid(p)) {
p.node.active = !0;
p.node.parent !== e && (p.node.parent = e);
} else {
h = cc.instantiate(s);
p = h.getComponent(n) || h.addComponent(n);
i[u] = p;
e.addChild(h);
}
l[u] = p;
}
return [ 2, l ];
}
});
});
};
Object.defineProperty(e.prototype, "itemContainer", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("content")) || void 0 === t ? void 0 : t.getChildByName("itemContainer")) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
return i([ h, classMethodWatch() ], e);
}(hs.Component);
r.default = d;
cc._RF.pop();
}, {
"./RestoreChapterCurSeat": "RestoreChapterCurSeat",
"./RestoreChapterItem": "RestoreChapterItem",
"./RestoreChapterLevelTxt": "RestoreChapterLevelTxt"
} ],
RestoreChapterCurSeat: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "a8293kM+tJNdpbMfkIUHqU8", "RestoreChapterCurSeat");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var s = cc._decorator.ccclass, a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onLoad = function() {
var t = this, e = this.bone;
e && cc.isValid(e) && e.addEventListener(dragonBones.EventObject.COMPLETE, function(e) {
var r = t.bone;
r && cc.isValid(r) && e && e.animationState && e.animationState.name && "stand" == e.animationState.name && r.playAnimation("idle", -1);
}, this);
};
e.prototype.shouldComponentUpdate = function(t) {
return !this.state || !t || this.state.animName != t.animName || this.state.curNumId != t.curNumId;
};
e.prototype.render = function() {
if (this.state) {
var t = this.bone, e = this.curLab;
if (t && e && cc.isValid(t) && cc.isValid(e)) {
t.playAnimation(this.state.animName, this.state.playTimes || 1);
this.state.atlas && (e.font.spriteFrame = this.state.atlas.getSpriteFrame("item"));
e.string = "" + this.state.curNumId;
e._forceUpdateRenderData();
this.changeLabColor(e);
}
}
};
e.prototype.changeLabColor = function() {};
e.prototype.onClick = function() {};
Object.defineProperty(e.prototype, "curLab", {
get: function() {
var t, e, r, o, n;
return null !== (n = null === (o = null === (r = null === (e = null === (t = this.node.getChildByName("bone")) || void 0 === t ? void 0 : t.getChildByName("ATTACHED_NODE_TREE")) || void 0 === e ? void 0 : e.getChildByName("ATTACHED_NODE:root")) || void 0 === r ? void 0 : r.getChildByName("chapter")) || void 0 === o ? void 0 : o.getComponent(cc.Label)) && void 0 !== n ? n : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "bone", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("bone")) || void 0 === t ? void 0 : t.getComponent(dragonBones.ArmatureDisplay)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
e.prototype.onDestroy = function() {};
return i([ s, classMethodWatch() ], e);
}(hs.Component);
r.default = a;
cc._RF.pop();
}, {} ],
RestoreChapterItem: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6f1871J7ZJAB7IhlF4asdfG", "RestoreChapterItem");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(n, i) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, n, i, s = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
s.label++;
return {
value: i[1],
done: !1
};

case 5:
s.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(n = s.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
s = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
s.label = i[1];
break;
}
if (6 === i[0] && s.label < n[1]) {
s.label = n[1];
n = i;
break;
}
if (n && s.label < n[2]) {
s.label = n[2];
s.ops.push(i);
break;
}
n[2] && s.ops.pop();
s.trys.pop();
continue;
}
i = e.call(t, s);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var c = cc._decorator.ccclass, l = {
334: 321,
314: 297,
312: 279,
226: 213,
224: 215,
209: 182,
208: 181,
126: 102
}, u = null, p = new Map(), h = new Map(), d = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.shouldComponentUpdate = function(t) {
return this.state.color != t.color || this.state.isStopAllAction != t.isStopAllAction || this.state.isThrough != t.isThrough || this.state.isShowAnimation != t.isShowAnimation || this.state.levelNum != t.levelNum || this.state.showColor != t.showColor;
};
e.prototype.render = function() {
var t;
return s(this, void 0, Promise, function() {
var e;
return a(this, function(r) {
switch (r.label) {
case 0:
this.state.isStopAllAction && this.stopAllAction();
return [ 4, this.applyBgSpriteFrame() ];

case 1:
r.sent();
return cc.isValid(this.node) ? this.state.showColor ? [ 4, this.applyColorSpriteFrame(this.state.color) ] : [ 3, 3 ] : [ 2 ];

case 2:
r.sent();
if (!cc.isValid(this.node)) return [ 2 ];
r.label = 3;

case 3:
if ((e = this.colorImg) && cc.isValid(e)) {
e.node.scale = this.state.showColor ? 1 : 0;
e.node.active = this.state.showColor;
e.node.opacity = null !== (t = this.state.opacity) && void 0 !== t ? t : 0;
}
this.state.isShowAnimation && this.showAnimation();
this.state.isThrough && this.addHeightMovie();
this.state.isOpacityAni && this.playOpacityAni();
this.changeSkin();
return [ 2 ];
}
});
});
};
e.prototype.applyBgSpriteFrame = function() {
return s(this, void 0, Promise, function() {
var t, e, r;
return a(this, function(o) {
switch (o.label) {
case 0:
if (!(t = this.bg) || !cc.isValid(t)) return [ 2 ];
if (cc.isValid(u)) {
t.spriteFrame = u;
return [ 2 ];
}
o.label = 1;

case 1:
o.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.ResLoader.asyncLoadByBundle("RestoreConfirmPopupTrait", "texture/restore_chapter_item_bg", cc.SpriteFrame) ];

case 2:
e = o.sent();
if (!cc.isValid(e)) return [ 2 ];
u = e;
(r = this.bg) && cc.isValid(r) && (r.spriteFrame = e);
return [ 3, 4 ];

case 3:
o.sent();
return [ 3, 4 ];

case 4:
return [ 2 ];
}
});
});
};
e.prototype.applyColorSpriteFrame = function(t) {
return s(this, void 0, Promise, function() {
var e, r, o, n, i, s;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!(e = this.colorImg) || !cc.isValid(e)) return [ 2 ];
r = this.resolveColorIndex(t);
o = p.get(r);
if (cc.isValid(o)) {
e.spriteFrame = o;
return [ 2 ];
}
if (!(n = h.get(r))) {
n = this.loadColorSpriteFrame(r);
h.set(r, n);
}
return [ 4, n ];

case 1:
i = a.sent();
h.delete(r);
if (!(s = this.colorImg) || !cc.isValid(s) || !cc.isValid(i)) return [ 2 ];
s.spriteFrame = i;
return [ 2 ];
}
});
});
};
e.prototype.resolveColorIndex = function(t) {
if (!Number.isFinite(t) || t <= 0) return 1;
var e = l[t];
return null != e ? e : t;
};
e.prototype.loadColorSpriteFrame = function(t) {
return s(this, void 0, Promise, function() {
var e, r;
return a(this, function(o) {
switch (o.label) {
case 0:
e = "textures/chapterList/periods/block/" + t;
o.label = 1;

case 1:
o.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.ResLoader.asyncLoadByBundle("chapter", e, cc.SpriteFrame) ];

case 2:
r = o.sent();
if (cc.isValid(r)) {
p.set(t, r);
return [ 2, r ];
}
return [ 3, 4 ];

case 3:
o.sent();
return [ 3, 4 ];

case 4:
return [ 2, null ];
}
});
});
};
e.prototype.changeSkin = function() {};
e.prototype.playOpacityAni = function() {
var t = this.colorImg;
if (t && cc.isValid(t)) {
cc.tween(t.node).stop();
t.node.opacity = this.state.fromOpacity;
t.node.scale = 1;
t.node.active = !0;
cc.tween(t.node).to(.2, {
opacity: this.state.toOpacity
}).start();
}
};
e.prototype.showAnimation = function() {
var t = this.colorImg;
if (t && cc.isValid(t)) {
t.node.opacity = 255;
t.node.active = !0;
t.node.scale = .2;
cc.tween(t.node).to(.1, {
scale: 1.05
}).to(.7, {
scale: 1
}).start();
var e = this.light;
if (e && cc.isValid(e)) {
e.opacity = 0;
cc.tween(e).to(.1, {
opacity: 255
}).to(.17, {
opacity: 0
}).start();
}
}
};
e.prototype.stopAllAction = function() {
cc.Tween.stopAllByTarget(this.node);
var t = this.colorImg;
t && cc.isValid(t) && cc.Tween.stopAllByTarget(t.node);
var e = this.light;
e && cc.isValid(e) && cc.Tween.stopAllByTarget(e);
};
e.prototype.addHeightMovie = function() {
var t, e = this.colorImg;
if (e && cc.isValid(e)) {
var r = null !== (t = this.state.throughRatio) && void 0 !== t ? t : 1;
e.node.opacity = 255;
cc.tween(e.node).to(.13 * r, {
scale: 1.1,
y: 10
}).to(.3 * r, {
scale: 1,
y: 0
}).start();
var o = this.light;
if (o && cc.isValid(o)) {
o.opacity = 0;
cc.tween(o).to(.13 * r, {
opacity: 255
}).to(.3 * r, {
opacity: 0
}).start();
}
}
};
e.prototype.onClick = function() {};
Object.defineProperty(e.prototype, "bg", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("bg")) || void 0 === t ? void 0 : t.getComponent(cc.Sprite)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "colorImg", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("colorImg")) || void 0 === t ? void 0 : t.getComponent(cc.Sprite)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "light", {
get: function() {
return this.node.getChildByName("lightImg");
},
enumerable: !1,
configurable: !0
});
e.prototype.onDisable = function() {
this.node.setScale(1);
var t = this.colorImg;
null == t || t.node.setScale(1);
null == t || t.node.setPosition(0, 0);
var e = this.light;
e && (e.opacity = 0);
};
return i([ c, classMethodWatch() ], e);
}(hs.Component);
r.default = d;
cc._RF.pop();
}, {} ],
RestoreChapterLevelTxt: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6ec0fYsIDJLkZkG/tM47AIp", "RestoreChapterLevelTxt");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(n, i) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, n, i, s = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
s.label++;
return {
value: i[1],
done: !1
};

case 5:
s.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(n = s.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
s = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
s.label = i[1];
break;
}
if (6 === i[0] && s.label < n[1]) {
s.label = n[1];
n = i;
break;
}
if (n && s.label < n[2]) {
s.label = n[2];
s.ops.push(i);
break;
}
n[2] && s.ops.pop();
s.trys.pop();
continue;
}
i = e.call(t, s);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var c = cc._decorator.ccclass, l = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._level = 0;
return e;
}
Object.defineProperty(e.prototype, "level", {
get: function() {
return this._level;
},
set: function(t) {
this._level = t;
},
enumerable: !1,
configurable: !0
});
e.prototype.render = function() {
return s(this, void 0, void 0, function() {
var t, e, r, o, n;
return a(this, function() {
if (!(t = this.node.getComponent(cc.Label))) return [ 2 ];
e = this.state, r = e.text, o = e.fontSize, n = e.opacity;
t.node.opacity = null != n ? n : 255;
t.fontSize = null != o ? o : 50;
t.string = r;
this.changeSkin();
return [ 2 ];
});
});
};
e.prototype.changeSkin = function() {};
return i([ c, classMethodWatch() ], e);
}(hs.Component);
r.default = l;
cc._RF.pop();
}, {} ],
RestoreConfirmPopupComp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "1e867I6a/pFRKGRNJZcNUZ1", "RestoreConfirmPopupComp");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var s = t("./comp/RestoreChapterContent"), a = t("./comp/RestoreScoreComp"), c = cc._decorator.ccclass, l = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._scoreNode = null;
e._scoreComp = null;
e._chapterNode = null;
e._chapterComp = null;
e._blockSkOriginX = 0;
e._blastSkOriginX = 0;
e._hiding = !1;
return e;
}
e.prototype.onLoad = function() {
var t = this.connNode;
t && cc.isValid(t) && t.removeAllChildren();
var e = this.blockSk, r = this.blastSk;
if (e && cc.isValid(e)) {
this._blockSkOriginX = e.node.x;
e.node.active = !1;
}
if (r && cc.isValid(r)) {
this._blastSkOriginX = r.node.x;
r.node.active = !1;
}
this.bindButtons();
};
e.prototype.onEnable = function() {
this.playShowAnim();
};
e.prototype.componentWillUnmount = function() {
var t = this.blockSk, e = this.blastSk;
t && cc.isValid(t) && t.setCompleteListener(null);
e && cc.isValid(e) && e.setCompleteListener(null);
this.unbindButtons();
cc.Tween.stopAllByTarget(this.node);
this._scoreNode = null;
this._scoreComp = null;
this._chapterNode = null;
this._chapterComp = null;
};
e.prototype.shouldComponentUpdate = function(t) {
return this.state.restoreType !== t.restoreType || this.state.hasBrandIP !== t.hasBrandIP;
};
e.prototype.render = function() {
var t = this.state.restoreType, e = this.titleTxt;
if (e && cc.isValid(e)) {
var r = "";
1 === t ? r = "Restore your Best Score?" : 2 === t ? r = "Restore your Adventure\nProgress?" : 3 === t && (r = "Restore your Best Score and\nAdventure Progress?");
e.string = r;
}
if (1 === t) {
this.ensureScoreComp();
this.hideContentNode(this._chapterNode);
} else if (2 === t) {
this.ensureChapterComp();
this.hideContentNode(this._scoreNode);
} else if (3 === t) {
this.ensureScoreComp();
this.ensureChapterComp();
} else {
this.hideContentNode(this._scoreNode);
this.hideContentNode(this._chapterNode);
}
var o = this.blockSk, n = this.blastSk;
if (!0 === this.state.hasBrandIP) if (1 === t) {
this.playSk(o, 0);
this.hideSk(n);
} else if (2 === t) {
this.playSk(n, 0);
this.hideSk(o);
} else if (3 === t) {
this.playSk(o, this._blockSkOriginX);
this.playSk(n, this._blastSkOriginX);
} else {
this.hideSk(o);
this.hideSk(n);
} else {
this.hideSk(o);
this.hideSk(n);
}
};
e.prototype.onClickConfirmBtn = function(t, e) {
var r;
if (!this._hiding) {
this._hiding = !0;
var o = "1" === e ? this.state.onConfirmCallback : this.state.onCancelCallback;
"1" === e && cc.isValid(null === (r = this._scoreComp) || void 0 === r ? void 0 : r.scoreSk) && this.triggerRestoreHighScoreFly(this._scoreComp);
this.playHideAnim(function() {
return null == o ? void 0 : o();
});
}
};
e.prototype.triggerRestoreHighScoreFly = function() {};
e.prototype.ensureScoreComp = function() {
var t = this, e = function() {
var e, r, o, n, i, s = null !== (n = null === (o = null === (r = null === (e = TRAIT("RestoreDataProviderTrait")) || void 0 === e ? void 0 : e.getRestoreData) || void 0 === r ? void 0 : r.call(e)) || void 0 === o ? void 0 : o.classHighScore) && void 0 !== n ? n : 0;
null === (i = t._scoreComp) || void 0 === i || i.setState({
score: s,
hasBrandIP: t.state.hasBrandIP,
delayRoll: .2 + .1
});
};
if (cc.isValid(this._scoreNode)) {
this._scoreNode.active = !0;
e();
} else hs.ResLoader.loadByBundle("RestoreConfirmPopupTrait", "prefabs/RestoreScoreComp", cc.Prefab, function(r, o) {
var n = t.connNode;
if (!r && n && cc.isValid(o) && cc.isValid(n)) if (cc.isValid(t._scoreNode)) {
t._scoreNode.active = !0;
e();
} else {
var i = cc.instantiate(o);
n.addChild(i);
t._scoreNode = i;
t._scoreComp = i.getComponent(a.default) || i.addComponent(a.default);
e();
}
});
};
e.prototype.ensureChapterComp = function() {
var t = this, e = function() {
var e, r, o, n, i, s = TRAIT("RestoreDataProviderTrait");
if (null == s ? void 0 : s.active) {
var a = s.getRestoreData();
if (a) {
var c = 0;
(null === (e = TRAIT("RestoreChapterProgressTrait")) || void 0 === e ? void 0 : e.active) && (c = null !== (r = null == a ? void 0 : a.chapterNum) && void 0 !== r ? r : 0);
var l = 1;
(null === (o = TRAIT("RestoreChapterPeriodsTrait")) || void 0 === o ? void 0 : o.active) && (l = null !== (n = null == a ? void 0 : a.chapterPeriodsIndex) && void 0 !== n ? n : 1);
null === (i = t._chapterComp) || void 0 === i || i.setState({
curChapter: c,
chapterPeriodsIndex: l
});
}
}
};
if (cc.isValid(this._chapterNode)) {
this._chapterNode.active = !0;
e();
} else hs.ResLoader.loadByBundle("RestoreConfirmPopupTrait", "prefabs/RestoreChapterContent", cc.Prefab, function(r, o) {
var n = t.connNode;
if (!r && n && cc.isValid(o) && cc.isValid(n)) if (cc.isValid(t._chapterNode)) {
t._chapterNode.active = !0;
e();
} else {
var i = cc.instantiate(o);
n.addChild(i, 100);
t._chapterNode = i;
t._chapterComp = i.getComponent(s.default) || i.addComponent(s.default);
e();
}
});
};
e.prototype.playSk = function(t, e) {
if (t && cc.isValid(t)) {
"number" == typeof e && (t.node.x = e);
t.node.active = !0;
t.setCompleteListener(null);
t.setAnimation(0, "in", !1);
t.setCompleteListener(function() {
if (cc.isValid(t)) {
t.setCompleteListener(null);
t.setAnimation(0, "init", !0);
}
});
}
};
e.prototype.hideSk = function(t) {
if (t && cc.isValid(t)) {
t.setCompleteListener(null);
t.node.active = !1;
}
};
e.prototype.hideContentNode = function(t) {
cc.isValid(t) && (t.active = !1);
};
Object.defineProperty(e.prototype, "titleTxt", {
get: function() {
var t, e;
return null !== (e = null === (t = this.findNode("titleTxt")) || void 0 === t ? void 0 : t.getComponent(cc.Label)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "connNode", {
get: function() {
return this.findNode("connNode");
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "blockSk", {
get: function() {
var t, e;
return null !== (e = null === (t = this.findNode("gameplay_Restore_IP_a")) || void 0 === t ? void 0 : t.getComponent(sp.Skeleton)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "blastSk", {
get: function() {
var t, e;
return null !== (e = null === (t = this.findNode("adventure_mosaicRestore")) || void 0 === t ? void 0 : t.getComponent(sp.Skeleton)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "yesBtn", {
get: function() {
return this.findNode("yesBtn");
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "noBtn", {
get: function() {
return this.findNode("noBtn");
},
enumerable: !1,
configurable: !0
});
e.prototype.bindButtons = function() {
var t = this.yesBtn;
if (t && cc.isValid(t)) {
t.off(cc.Node.EventType.TOUCH_END, this.onClickYesBtn, this);
t.on(cc.Node.EventType.TOUCH_END, this.onClickYesBtn, this);
}
var e = this.noBtn;
if (e && cc.isValid(e)) {
e.off(cc.Node.EventType.TOUCH_END, this.onClickNoBtn, this);
e.on(cc.Node.EventType.TOUCH_END, this.onClickNoBtn, this);
}
};
e.prototype.unbindButtons = function() {
var t = this.yesBtn;
t && cc.isValid(t) && t.off(cc.Node.EventType.TOUCH_END, this.onClickYesBtn, this);
var e = this.noBtn;
e && cc.isValid(e) && e.off(cc.Node.EventType.TOUCH_END, this.onClickNoBtn, this);
};
e.prototype.onClickYesBtn = function(t) {
this.onClickConfirmBtn(t, "1");
};
e.prototype.onClickNoBtn = function(t) {
this.onClickConfirmBtn(t, "0");
};
e.prototype.findNode = function(t) {
return this.findNodeInner(this.node, t);
};
e.prototype.findNodeInner = function(t, e) {
if (!cc.isValid(t)) return null;
if (t.name === e) return t;
for (var r = 0; r < t.childrenCount; r++) {
var o = t.children[r], n = this.findNodeInner(o, e);
if (n) return n;
}
return null;
};
e.prototype.playShowAnim = function() {
cc.Tween.stopAllByTarget(this.node);
this.node.opacity = 255;
this.node.scale = .6;
cc.tween(this.node).to(.2, {
scale: 1.1
}, {
easing: "sineOut"
}).to(.1, {
scale: 1
}, {
easing: "sineIn"
}).start();
};
e.prototype.playHideAnim = function(t) {
var e = this;
cc.Tween.stopAllByTarget(this.node);
cc.tween(this.node).to(.1, {
scale: 1.1
}, {
easing: "sineOut"
}).to(.17, {
scale: .6,
opacity: 0
}, {
easing: "sineIn"
}).call(function() {
null == t || t();
e._hiding = !1;
}).start();
};
return i([ classId("RestoreConfirmPopupComp"), c, classMethodWatch() ], e);
}(hs.Component);
r.default = l;
cc._RF.pop();
}, {
"./comp/RestoreChapterContent": "RestoreChapterContent",
"./comp/RestoreScoreComp": "RestoreScoreComp"
} ],
RestoreConfirmPopupTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "5bc121F/rpGspVkhYRHOwBp", "RestoreConfirmPopupTrait");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(n, i) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, n, i, s = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
s.label++;
return {
value: i[1],
done: !1
};

case 5:
s.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(n = s.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
s = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
s.label = i[1];
break;
}
if (6 === i[0] && s.label < n[1]) {
s.label = n[1];
n = i;
break;
}
if (n && s.label < n[2]) {
s.label = n[2];
s.ops.push(i);
break;
}
n[2] && s.ops.pop();
s.trys.pop();
continue;
}
i = e.call(t, s);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, c = this && this.__values || function(t) {
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
r.RestoreConfirmPopupTrait = void 0;
var l = t("./RestoreConfirmPopupComp"), u = {
name: "RestoreConfirmPopupComp",
bundleName: "RestoreConfirmPopupTrait",
url: "prefabs/RestoreConfirmPopupComp",
platform: "ios",
modal: !0,
clickModalNotClose: !1
}, p = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
r = e;
e.prototype.onCreate = function() {
void 0 === hs.storage.getItem("restoreExecutedFlags", {})[this.traitName] && hs.ResLoader.loadBundle("RestoreConfirmPopupTrait", function(t, e) {
!t && e && hs.ResLoader.preloadByDir(e, "prefabs", function() {}).then(function() {}).catch(function() {});
});
};
e.prototype.onActive = function(t) {
if (hs.tp.isClassGuide_ProxyOnGuideChange(t) || hs.tp.isClassGame_ProxyOnGameStart(t)) {
"afterTutorial" === this.props.triggerPoint && hs.classGuideInfo.isFinishedGuide && this.showConfirmPopup();
this.props.enterClass && this.props.enterClass.length > 0 && this.showConfirmPopupEnterClass();
}
hs.tp.isHomePage_ProxyShowHomePageAfter(t) && "homePage" === this.props.triggerPoint && this.showConfirmPopup();
if (hs.tp.isChapterList_ProxyShowUIFinish(t)) {
"chapterEntry" === this.props.triggerPoint && this.showConfirmPopup();
this.props.enterMosaic && this.props.enterMosaic.length > 0 && this.showConfirmPopupEnterMosaic();
}
};
e.prototype.showConfirmPopupEnterClass = function() {
var t, e, r, o;
return s(this, void 0, void 0, function() {
var n, i, s, c, p;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!(null == (n = TRAIT("RestoreDataProviderTrait")) ? void 0 : n.active)) return [ 2 ];
i = this.traitName + "_enterClass";
if (n.isRestored(i)) return [ 2 ];
if (!n.isNeedRestore()) return [ 2 ];
if (!n.isDataReady()) return [ 2 ];
if (!(null === (t = this.props) || void 0 === t ? void 0 : t.enterClass)) return [ 2 ];
n.markRestored(i, !0);
return this.props.enterClass.includes("highScore") && 1 === this.props.enterClass.length && 0 == (null !== (r = null === (e = n.getRestoreData()) || void 0 === e ? void 0 : e.classHighScore) && void 0 !== r ? r : 0) ? [ 2 ] : [ 4, hs.UI.show(u, hs.gameAlertLayer) ];

case 1:
if (!(s = a.sent())) return [ 2 ];
if (!(c = s.getComponent(l.default) || s.addComponent(l.default))) return [ 2 ];
p = 0;
this.props.enterClass.includes("highScore") && (p += 1);
c.setState({
hasBrandIP: !!(null === (o = this.props) || void 0 === o ? void 0 : o.hasBrandIP),
restoreType: p,
onConfirmCallback: this.onUserConfirmEnterClass.bind(this),
onCancelCallback: this.onUserCancelEnterClass.bind(this)
});
return [ 2 ];
}
});
});
};
e.prototype.onUserConfirmEnterClass = function() {
var t, e, o, n;
this.closeConfirmPopup();
this.reportRestoreChoiceClick(1);
var i = null !== (o = this.props.enterClass) && void 0 !== o ? o : [];
try {
for (var s = c(i), a = s.next(); !a.done; a = s.next()) {
var l = a.value, u = r.RESTORE_MAP[l];
if (u) {
var p = TRAIT(u.trait);
(null == p ? void 0 : p.active) && (null === (n = null == p ? void 0 : p.executeRestore) || void 0 === n || n.call(p));
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = s.return) && e.call(s);
} finally {
if (t) throw t.error;
}
}
this.triggerRestoreChapterRefresh(i);
};
e.prototype.onUserCancelEnterClass = function() {
this.closeConfirmPopup();
this.reportRestoreChoiceClick(0);
};
e.prototype.showConfirmPopupEnterMosaic = function() {
var t, e;
return s(this, void 0, void 0, function() {
var r, o, n, i, s;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!(null == (r = TRAIT("RestoreDataProviderTrait")) ? void 0 : r.active)) return [ 2 ];
o = this.traitName + "_enterMosaic";
if (r.isRestored(o)) return [ 2 ];
if (!r.isNeedRestore()) return [ 2 ];
if (!r.isDataReady()) return [ 2 ];
if (!(null === (t = this.props) || void 0 === t ? void 0 : t.enterMosaic)) return [ 2 ];
r.markRestored(o, !0);
return [ 4, hs.UI.show(u, hs.gameAlertLayer) ];

case 1:
if (!(n = a.sent())) return [ 2 ];
if (!(i = n.getComponent(l.default) || n.addComponent(l.default))) return [ 2 ];
s = 0;
(this.props.enterMosaic.includes("chapterProgress") || this.props.enterMosaic.includes("chapterPeriods")) && (s += 2);
i.setState({
hasBrandIP: !!(null === (e = this.props) || void 0 === e ? void 0 : e.hasBrandIP),
restoreType: s,
onConfirmCallback: this.onUserConfirmEnterMosaic.bind(this),
onCancelCallback: this.onUserCancelEnterMosaic.bind(this)
});
return [ 2 ];
}
});
});
};
e.prototype.onUserConfirmEnterMosaic = function() {
var t, e, o, n;
this.closeConfirmPopup();
this.reportRestoreChoiceClick(1);
var i = null !== (o = this.props.enterMosaic) && void 0 !== o ? o : [];
try {
for (var s = c(i), a = s.next(); !a.done; a = s.next()) {
var l = a.value, u = r.RESTORE_MAP[l];
if (u) {
var p = TRAIT(u.trait);
(null == p ? void 0 : p.active) && (null === (n = null == p ? void 0 : p.executeRestore) || void 0 === n || n.call(p));
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = s.return) && e.call(s);
} finally {
if (t) throw t.error;
}
}
this.triggerRestoreChapterRefresh(i);
};
e.prototype.onUserCancelEnterMosaic = function() {
this.closeConfirmPopup();
this.reportRestoreChoiceClick(0);
};
e.prototype.showConfirmPopup = function() {
var t, e, r, o;
return s(this, void 0, void 0, function() {
var n, i, s, c;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!(null == (n = TRAIT("RestoreDataProviderTrait")) ? void 0 : n.active)) return [ 2 ];
if (this.props.traitName && !n.isRestoredTrue(this.props.traitName)) return [ 2 ];
if (n.isRestored(this.traitName)) return [ 2 ];
if (!n.isNeedRestore()) return [ 2 ];
if (!n.isDataReady()) return [ 2 ];
if (!(null === (t = this.props) || void 0 === t ? void 0 : t.restoreTypes)) return [ 2 ];
n.markRestored(this.traitName, !0);
return this.props.restoreTypes.includes("highScore") && 1 === this.props.restoreTypes.length && 0 == (null !== (r = null === (e = n.getRestoreData()) || void 0 === e ? void 0 : e.classHighScore) && void 0 !== r ? r : 0) ? [ 2 ] : [ 4, hs.UI.show(u, hs.gameAlertLayer) ];

case 1:
if (!(i = a.sent())) return [ 2 ];
if (!(s = i.getComponent(l.default) || i.addComponent(l.default))) return [ 2 ];
c = 0;
this.props.restoreTypes.includes("highScore") && (c += 1);
(this.props.restoreTypes.includes("chapterProgress") || this.props.restoreTypes.includes("chapterPeriods")) && (c += 2);
s.setState({
hasBrandIP: !!(null === (o = this.props) || void 0 === o ? void 0 : o.hasBrandIP),
restoreType: c,
onConfirmCallback: this.onUserConfirm.bind(this),
onCancelCallback: this.onUserCancel.bind(this)
});
return [ 2 ];
}
});
});
};
e.prototype.onUserConfirm = function() {
var t, e, o, n;
this.closeConfirmPopup();
this.reportRestoreChoiceClick(1);
var i = null !== (o = this.props.restoreTypes) && void 0 !== o ? o : [];
try {
for (var s = c(i), a = s.next(); !a.done; a = s.next()) {
var l = a.value, u = r.RESTORE_MAP[l];
if (u) {
var p = TRAIT(u.trait);
(null == p ? void 0 : p.active) && (null === (n = null == p ? void 0 : p.executeRestore) || void 0 === n || n.call(p));
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = s.return) && e.call(s);
} finally {
if (t) throw t.error;
}
}
this.triggerRestoreChapterRefresh(i);
};
e.prototype.reportRestoreChoiceClick = function(t) {
DS("g_game_restore_choice_click", {
choice: t
});
};
e.prototype.triggerRestoreChapterRefresh = function() {};
e.prototype.onUserCancel = function() {
this.closeConfirmPopup();
this.reportRestoreChoiceClick(0);
};
e.prototype.closeConfirmPopup = function() {
hs.UI.hideUI(u);
};
var r;
e.RESTORE_MAP = {
highScore: {
trait: "RestoreEndlessHighScoreTrait",
anim: "RestoreHighScoreAnimationTrait"
},
chapterPeriods: {
trait: "RestoreChapterPeriodsTrait",
anim: "RestoreChapterProgressAnimationTrait"
},
chapterProgress: {
trait: "RestoreChapterProgressTrait",
anim: "RestoreChapterProgressAnimationTrait"
},
chapterCountdown: {
trait: "RestoreChapterCountdownTrait"
},
gmmCluster: {
trait: "RestoreGMMClusterDataTrait"
},
adSensitivity: {
trait: "RestoreAdSensitivityDataTrait"
},
endlessGameCount: {
trait: "RestoreEndlessGameCountTrait"
},
skipTutorial: {
trait: "RestoreSkipTutorialTrait"
},
directEnterHome: {
trait: "RestoreDirectEnterHomePageTrait"
},
settingsShowHomeEntry: {
trait: "RestoreSettingsShowHomeEntryTrait"
},
behavior: {
trait: "RestoreBlockClickOrderDataTrait"
}
};
return r = i([ classId("RestoreConfirmPopupTrait"), classMethodWatch() ], e);
}(Trait);
r.RestoreConfirmPopupTrait = p;
cc._RF.pop();
}, {
"./RestoreConfirmPopupComp": "RestoreConfirmPopupComp"
} ],
RestoreScoreComp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "12dbaRJhltHropWSbNIESte", "RestoreScoreComp");
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
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var s = cc._decorator.ccclass, a = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._curSpineUrl = "";
return e;
}
e.prototype.componentWillUnmount = function() {
var t = this.maxScoreTxt;
t && cc.isValid(t) && cc.Tween.stopAllByTarget(t.node);
};
e.prototype.shouldComponentUpdate = function(t) {
return this.state.score !== t.score || this.state.hasBrandIP !== t.hasBrandIP;
};
e.prototype.render = function() {
var t, e, r = !0 === this.state.hasBrandIP ? "spine/gameplay_restore_a" : "spine/gameplay_restore_b";
this.applySpine(r);
this.scheduleScoreAnimation(null !== (t = this.state.score) && void 0 !== t ? t : 0, null !== (e = this.state.delayRoll) && void 0 !== e ? e : 0);
};
e.prototype.scheduleScoreAnimation = function(t, e) {
var r = this, o = this.maxScoreTxt;
if (o && cc.isValid(o)) {
var n = o.node;
cc.Tween.stopAllByTarget(n);
if (e > 0) {
o.string = "0";
cc.tween(n).delay(e).call(function() {
return r.playScoreAnimation(t);
}).start();
} else this.playScoreAnimation(t);
}
};
e.prototype.applySpine = function(t) {
var e = this, r = this.scoreSk;
r && cc.isValid(r) && (this._curSpineUrl === t && r.skeletonData ? r.setAnimation(0, "init", !0) : hs.ResLoader.loadByBundle("RestoreConfirmPopupTrait", t, sp.SkeletonData, function(r, o) {
var n = e.scoreSk;
if (!r && o && n && cc.isValid(n)) {
e._curSpineUrl = t;
n.skeletonData = o;
n.setAnimation(0, "init", !0);
}
}));
};
e.prototype.playScoreAnimation = function(t) {
var e = this, r = this.maxScoreTxt;
if (r && cc.isValid(r)) {
var o = r.node;
cc.Tween.stopAllByTarget(o);
o.scale = 1;
var n = Math.max(0, Math.floor(t));
r.string = "0";
cc.tween({
value: 0
}).to(.6, {
value: n
}, {
progress: function(t, r, o, n) {
var i = Math.floor(t + (r - t) * n), s = e.maxScoreTxt;
s && cc.isValid(s) && (s.string = "" + i);
return i;
}
}).call(function() {
var t = e.maxScoreTxt;
t && cc.isValid(t) && (t.string = "" + n);
}).start();
cc.tween(o).delay(.6).to(.2, {
scale: 1.1
}).to(.2, {
scale: 1
}).start();
}
};
Object.defineProperty(e.prototype, "scoreSk", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("gameplay_Restore_a")) || void 0 === t ? void 0 : t.getComponent(sp.Skeleton)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "maxScoreTxt", {
get: function() {
var t, e;
return null !== (e = null === (t = this.node.getChildByName("maxScoreTxt")) || void 0 === t ? void 0 : t.getComponent(cc.Label)) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
return i([ s ], e);
}(hs.Component);
r.default = a;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreConfirmPopupComp", "RestoreConfirmPopupTrait", "RestoreChapterContent", "RestoreChapterCurSeat", "RestoreChapterItem", "RestoreChapterLevelTxt", "RestoreScoreComp" ]);
//# sourceMappingURL=index.js.map
