window.__require = function t(e, r, o) {
function i(a, s) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var u = r[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return i(e[a][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
$27720_f_OptimizeHeartAndScoreTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "77353N+2d1EmquEqzcISg9q", "$27720_f_OptimizeHeartAndScoreTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(i, n) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
n(t);
}
}
function s(t) {
try {
c(o.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? i(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(a, s);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, s = this && this.__generator || function(t, e) {
var r, o, i, n, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return n = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (i = 2 & n[0] ? o.return : n[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, n[1])).done) return i;
(o = 0, i) && (n = [ 2 & n[0], i.value ]);
switch (n[0]) {
case 0:
case 1:
i = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!i || n[1] > i[0] && n[1] < i[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < i[1]) {
a.label = i[1];
i = n;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(n);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = i = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.$27720_f_OptimizeHeartAndScoreTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.heartNode = null;
e.clearPrefab = null;
e.heartAndScorePrefab = null;
e.currentColor = 1;
e.accumulatedScore = -1;
e.isFirstShow = !0;
e.skinColorConfig = null;
e._loadTimeoutBarrier = null;
e._colorHexs = [];
e._colorTipsHex = null;
e._isCombo = !1;
return e;
}
e.prototype.data = function() {
return hs.storage.getItem("$27720_f_OptimizeHeartAndScoreTrait_color_key", {
colorTipsHex: "87FDFF"
});
};
e.prototype.onCreate = function() {
this.loadPrefabs();
this._colorTipsHex = this.state.colorTipsHex;
};
e.prototype.onActive = function() {
hs.gameInfo.gameMode, hs.GameMode.Class;
};
e.prototype.initHeartAndScore = function(t) {
return a(this, void 0, void 0, function() {
return s(this, function(e) {
switch (e.label) {
case 0:
t.replace = !0;
t.returnState = !0;
this._loadTimeoutBarrier || (this._loadTimeoutBarrier = new hs.TimeoutBarrier(2e3));
return [ 4, this.loadPrefabs() ];

case 1:
e.sent();
this._loadTimeoutBarrier.open();
return [ 2 ];
}
});
});
};
e.prototype.createHeartAndScore = function() {
if (this.heartAndScorePrefab) {
var t = Cinst(hs.ClassTopInfo);
if (!this.heartNode || !cc.isValid(this.heartNode)) {
this.heartNode = cc.instantiate(this.heartAndScorePrefab);
this.heartNode.active = !0;
t && t.node && cc.isValid(t.node) && t.curNode && cc.isValid(t.curNode) && (this.heartNode.parent = t.curNode);
}
this.activeTopScoresNode(!0);
this.heartNode && (this.heartNode.opacity = 0);
this.updateHeartPosition();
}
};
e.prototype.updateHeartPosition = function() {
var t = Cinst(hs.ClassTopInfo);
if (this.heartNode && cc.isValid(this.heartNode) && t && t.curNode && cc.isValid(t.curNode)) {
this.heartNode.x = t.comboAnim.node.x;
this.heartNode.y = t.comboAnim.node.y;
}
};
e.prototype.playEliminateEffects = function(t) {
return a(this, void 0, void 0, function() {
var e, r, o, i;
return s(this, function(n) {
switch (n.label) {
case 0:
e = t.args[0];
r = e.state, o = r.continuousEliminateTimes, i = r.color, r.eliminateRows, r.eliminateCols;
if (!r.canEliminate) return [ 2 ];
if (!(o > 1)) return [ 3, 2 ];
this._isCombo = !0;
if (this.shouldReplaceEffect()) {
t.returnState = !0;
t.replace = !0;
}
this.currentColor = i;
this._colorHexs = this.getColorHexByIndex(i);
this._colorTipsHex = this.getComboTipsColorByIndex(i);
this.state.colorTipsHex = this._colorTipsHex;
hs.storage.setItem("$27720_f_OptimizeHeartAndScoreTrait_color_key", this.state);
return [ 4, this.playComboEffect(e) ];

case 1:
n.sent();
n.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.updateComboAnimState = function(t) {
return a(this, void 0, Promise, function() {
var e, r;
return s(this, function(o) {
switch (o.label) {
case 0:
t.replace = !0;
t.returnState = !0;
return !this._loadTimeoutBarrier || this._loadTimeoutBarrier.isOpen ? [ 3, 2 ] : [ 4, this._loadTimeoutBarrier.wait() ];

case 1:
o.sent();
o.label = 2;

case 2:
e = t.args[0], r = e.comboAnimState, e.continuousEliminateTimes;
switch (r) {
case hs.TopInfoType.ShowCombo:
return [ 3, 3 ];

case hs.TopInfoType.ShowCombo_No_Eliminate:
return [ 3, 5 ];

case hs.TopInfoType.CancelCombo:
return [ 3, 6 ];

case hs.TopInfoType.None:
return [ 3, 7 ];
}
return [ 3, 8 ];

case 3:
this._isCombo = !0;
return [ 4, this.showOrUpdateHeart(this.currentColor) ];

case 4:
o.sent();
return [ 3, 8 ];

case 5:
this._isCombo = !1;
return [ 3, 8 ];

case 6:
this._isCombo = !1;
this.hideHeart();
return [ 3, 8 ];

case 7:
this._isCombo = !1;
this.onGameEnd();
return [ 3, 8 ];

case 8:
return [ 2 ];
}
});
});
};
e.prototype.playComboEffect = function(t) {
return a(this, void 0, void 0, function() {
var e, r, o, i;
return s(this, function(n) {
switch (n.label) {
case 0:
e = t.state, r = e.eliminateRows, o = e.eliminateCols, i = e.color;
return [ 4, this.loadPrefabs() ];

case 1:
n.sent();
return [ 4, this.playComboClearEffect(r, o, i) ];

case 2:
n.sent();
return [ 2 ];
}
});
});
};
e.prototype.onScoreUpdate = function(t) {
if (hs.gameInfo.gameMode === hs.GameMode.Class) if (t.eliminateCount > 0) ; else if (!this.isFirstShow && this.heartNode && cc.isValid(this.heartNode) && !this._isCombo) {
var e = this.heartNode.getComponent("NumberAnimator");
if (e) {
var r = hs.scoreInfo.score;
e.setValue(this.accumulatedScore);
e.setState({
to: r
});
this.accumulatedScore = r;
}
}
};
e.prototype.onGameEnd = function() {
this.restoreOriginalScoreNode();
this.isFirstShow = !0;
this.currentColor = 1;
};
e.prototype.loadPrefabs = function() {
return a(this, void 0, void 0, function() {
var t, e, r;
return s(this, function(o) {
switch (o.label) {
case 0:
if (this.clearPrefab && this.heartAndScorePrefab && this.skinColorConfig) return [ 3, 9 ];
o.label = 1;

case 1:
o.trys.push([ 1, 8, , 9 ]);
if (this.clearPrefab) return [ 3, 3 ];
t = this;
return [ 4, hs.ResLoader.asyncLoadByBundle("$27720_f_OptimizeHeartAndScoreTrait", "prefabs/clear", cc.Prefab) ];

case 2:
t.clearPrefab = o.sent();
o.label = 3;

case 3:
if (this.heartAndScorePrefab) return [ 3, 5 ];
e = this;
return [ 4, hs.ResLoader.asyncLoadByBundle("$27720_f_OptimizeHeartAndScoreTrait", "prefabs/heartAndScore", cc.Prefab) ];

case 4:
e.heartAndScorePrefab = o.sent();
o.label = 5;

case 5:
return this.skinColorConfig ? [ 3, 7 ] : [ 4, hs.ResLoader.asyncLoadByBundle("$27720_f_OptimizeHeartAndScoreTrait", "config/heartSkin", cc.JsonAsset) ];

case 6:
if ((r = o.sent()) && r.json) {
this.skinColorConfig = r.json;
this.props.isFix && Object.values(this.skinColorConfig).forEach(function(t) {
Array.isArray(t) && t.forEach(function(t) {
for (var e = 1; e <= 7; e++) {
var r = "clear" + e;
if (Array.isArray(t[r]) && t[r].length >= 3) {
var o = t[r][0];
t[r][0] = t[r][2];
t[r][2] = o;
}
}
});
});
}
o.label = 7;

case 7:
return [ 3, 9 ];

case 8:
o.sent();
return [ 3, 9 ];

case 9:
return [ 2 ];
}
});
});
};
e.prototype.playComboClearEffect = function(t, e, r) {
return a(this, void 0, void 0, function() {
var o, i, n, a, c, l, u;
return s(this, function(s) {
switch (s.label) {
case 0:
return this.clearPrefab ? [ 4, CinstAsync(hs.Board) ] : [ 2 ];

case 1:
o = s.sent();
i = o.boardGrid.getBoundingBoxToWorld();
n = hs.eliminateLayerInfo.getEliminateParentNode();
this._colorHexs && 0 !== this._colorHexs.length || (this._colorHexs = this.getColorHexByIndex(r));
for (a in t) {
l = cc.instantiate(this.clearPrefab);
n.addChild(l);
l.x = cc.view.getVisibleSize().width / 2;
l.y = t[a].y;
l.angle = 0;
(u = l.getComponent("ClearComp")) && u.setState({
colors: this._colorHexs
});
}
for (c in e) {
l = cc.instantiate(this.clearPrefab);
n.addChild(l);
l.x = e[c].x;
l.y = i.y + 450;
if (this.props.isFix) {
l.angle = -90;
l.y = i.y + 434;
} else l.angle = 90;
(u = l.getComponent("ClearComp")) && u.setState({
colors: this._colorHexs,
isFix: this.props.isFix
});
}
return [ 2 ];
}
});
});
};
e.prototype.showOrUpdateHeart = function(t) {
var e;
return a(this, void 0, void 0, function() {
var r, o, i, n, a, c;
return s(this, function(s) {
switch (s.label) {
case 0:
return [ 4, this.loadPrefabs() ];

case 1:
s.sent();
this._colorTipsHex || (this._colorTipsHex = this.getComboTipsColorByIndex(t));
Cinst(hs.ClassTopInfo);
this.createHeartAndScore();
if (this.heartNode && cc.isValid(this.heartNode)) {
this.heartNode.opacity = 255;
this.activeTopScoresNode(!1);
r = this.heartNode.getComponent("HeartComp");
o = this.heartNode.getComponent("NumberAnimator");
if (r) {
i = hs.scoreInfo.score;
n = null === (e = hs.classScoreInfo) || void 0 === e ? void 0 : e.scoreGroup;
a = (null == n ? void 0 : n.comboScore) || 0;
c = i - a;
if (this.isFirstShow) {
this.isFirstShow = !1;
if (o) {
o.setValue(i);
this.accumulatedScore = i;
}
r.activeScore(!0);
r.setState({
type: "high",
hex: this._colorTipsHex
});
} else {
r.activeScore(!0);
r.setState({
type: "high",
hex: this._colorTipsHex
});
if (o) {
o.setState({
to: c
});
cc.tween(o.node).delay(.95).call(function() {
o.setState({
to: i
});
}).start();
this.accumulatedScore = i;
}
}
}
}
return [ 2 ];
}
});
});
};
e.prototype.hideHeart = function() {
if (this.heartNode && cc.isValid(this.heartNode)) {
var t = this.heartNode.getComponent("HeartComp");
if (t) {
t.activeScore(!1);
this.restoreTopScoreNode();
t.setState({
type: "low",
hex: this._colorTipsHex
});
this.isFirstShow = !0;
} else this.restoreOriginalScoreNode();
}
};
e.prototype.onExitAnimComplete = function() {
this.restoreOriginalScoreNode();
};
e.prototype.restoreOriginalScoreNode = function() {
this.restoreTopScoreNode();
if (this.heartNode && cc.isValid(this.heartNode)) {
this.heartNode.opacity = 0;
this.restoreRollScoreNode(this.heartNode);
}
};
e.prototype.restoreRollScoreNode = function() {};
e.prototype.activeTopScoresNode = function(t) {
var e = Cinst(hs.ClassTopInfo);
if (e && e.curNode && cc.isValid(e.curNode)) {
var r = e.curNode.getChildByName("SkinScore");
cc.isValid(r) && (r.y = t ? 0 : 106e3);
var o = e.curNode.getChildByName("currentNum");
cc.isValid(o) && (o.y = t ? 0 : 106e3);
}
};
e.prototype.restoreTopScoreNode = function() {
this.activeTopScoresNode(!0);
};
e.prototype.getCurrentSkinId = function() {
var t;
return "skin_" + ((null === (t = hs.skinInfo) || void 0 === t ? void 0 : t.currentSkinId) || "1000");
};
e.prototype.getColorHexByIndex = function(t) {
var e, r, o = "clear" + t, i = this.getCurrentSkinId(), n = null === (e = this.skinColorConfig) || void 0 === e ? void 0 : e[i];
if (n && n[0] && n[0][o]) return n[0][o];
var a = null === (r = this.skinColorConfig) || void 0 === r ? void 0 : r.skin_1000;
return a && a[0] && a[0][o] ? a[0][o] : [ "6A80FF", "2F43B3", "252E58" ];
};
e.prototype.getComboTipsColorByIndex = function(t) {
var e, r, o = "comboTips" + t, i = this.getCurrentSkinId(), n = null === (e = this.skinColorConfig) || void 0 === e ? void 0 : e[i];
if (n && n[0] && n[0][o]) return n[0][o][0];
var a = null === (r = this.skinColorConfig) || void 0 === r ? void 0 : r.skin_1000;
return a && a[0] && a[0][o] ? a[0][o][0] : "819CFF";
};
e.prototype.shouldReplaceEffect = function() {
return !!this.props.isFix;
};
return n([ classId("$27720_f_OptimizeHeartAndScoreTrait"), classMethodWatch() ], e);
}(Trait);
r.$27720_f_OptimizeHeartAndScoreTrait = c;
cc._RF.pop();
}, {} ],
ClearComp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8c0d6l6hXNJCrg+tmRFUi/O", "ClearComp");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(i, n) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
n(t);
}
}
function s(t) {
try {
c(o.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? i(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(a, s);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, s = this && this.__generator || function(t, e) {
var r, o, i, n, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return n = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (i = 2 & n[0] ? o.return : n[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, n[1])).done) return i;
(o = 0, i) && (n = [ 2 & n[0], i.value ]);
switch (n[0]) {
case 0:
case 1:
i = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!i || n[1] > i[0] && n[1] < i[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < i[1]) {
a.label = i[1];
i = n;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(n);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = i = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var c = cc._decorator, l = c.ccclass, u = c.property, h = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.armatureDisplayArray = [];
e.animationArray = [];
e._isPlaying = !1;
e._curComboNum = -1;
e._completeTimes = 0;
return e;
}
e.prototype.onLoad = function() {};
e.prototype.render = function() {
return a(this, void 0, void 0, function() {
return s(this, function() {
this.playClearAni(this.state.colors);
return [ 2 ];
});
});
};
e.prototype.playClearAni = function(t) {
var e = this;
this.armatureDisplayArray.forEach(function(r, o) {
if (o < e.animationArray.length && o < t.length) {
r.node.color = cc.Color.fromHEX(new cc.Color(), "#" + t[o]);
if (e.state.isFix) {
r && void 0 !== r.timeScale && (r.timeScale = 1);
2 === o ? r.playAnimation("efx_1_2", 1) : r.playAnimation(e.animationArray[o], 1);
} else r.playAnimation(e.animationArray[o], 1);
r.once(dragonBones.EventObject.COMPLETE, e.completed.bind(e, t));
}
});
};
e.prototype.completed = function(t) {
this._completeTimes++;
var e = Math.min(this.animationArray.length, t.length, this.animationArray.length);
this._completeTimes >= e && this.destroySelf();
};
e.prototype.destroySelf = function() {
this.node.destroy();
};
n([ u([ dragonBones.ArmatureDisplay ]) ], e.prototype, "armatureDisplayArray", void 0);
n([ u([ cc.String ]) ], e.prototype, "animationArray", void 0);
return n([ classId("ClearComp"), l ], e);
}(hs.Component);
r.default = h;
cc._RF.pop();
}, {} ],
HeartComp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8accfnFWHpOdp907VKWY7yB", "HeartComp");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(i, n) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
n(t);
}
}
function s(t) {
try {
c(o.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? i(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(a, s);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, s = this && this.__generator || function(t, e) {
var r, o, i, n, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return n = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (i = 2 & n[0] ? o.return : n[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, n[1])).done) return i;
(o = 0, i) && (n = [ 2 & n[0], i.value ]);
switch (n[0]) {
case 0:
case 1:
i = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!i || n[1] > i[0] && n[1] < i[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < i[1]) {
a.label = i[1];
i = n;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(n);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = i = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AniType = void 0;
var c, l = cc._decorator, u = l.ccclass, h = l.property;
(function(t) {
t.ENTER = "high";
t.IDLE = "loop";
t.EXIT = "low";
t.NONE = "";
})(c = r.AniType || (r.AniType = {}));
var p = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.armatureDisplayArray = [];
e.scoreLabel = null;
e._isPlaying = !1;
e._playingAniName = c.NONE;
return e;
}
e.prototype.onLoad = function() {
var t = this;
this.armatureDisplayArray.forEach(function(t) {
t.timeScale = 1 / (cc.director._kSpeed || 1);
});
this.armatureDisplayArray[0].addEventListener(dragonBones.EventObject.COMPLETE, function() {
c.IDLE != t._playingAniName ? c.EXIT == t._playingAniName ? t.activeNode(!1) : c.ENTER == t._playingAniName && t.playIdleAni() : t.activeNode(!0);
}, this);
this.armatureDisplayArray[1] && this.armatureDisplayArray[1].addEventListener(dragonBones.EventObject.COMPLETE, function() {}, this);
};
e.prototype.render = function() {
return a(this, void 0, void 0, function() {
return s(this, function() {
this.playAni(this.state.type, this.state.hex);
return [ 2 ];
});
});
};
e.prototype.playAni = function(t, e) {
this.activeNode(!0);
this._setColor(e);
switch (t) {
case c.ENTER:
this.playEnterAni();
break;

case c.IDLE:
this.playIdleAni();
break;

case c.EXIT:
this.playExitAni();
}
};
e.prototype._setColor = function(t) {
this.armatureDisplayArray.forEach(function(e) {
cc.isValid(e) && (e.node.color = cc.color().fromHEX("#" + t));
});
};
e.prototype.activeScore = function(t) {
this.scoreLabel.node.opacity = t ? 255 : 0;
};
e.prototype.setScore = function(t) {
var e = -1 == t ? "" : t + "";
this.scoreLabel.string = e;
};
e.prototype.playEnterAni = function() {
this._playingAniName = c.ENTER;
this.armatureDisplayArray.forEach(function(t) {
cc.isValid(t) && t.playAnimation(c.ENTER, 1);
});
};
e.prototype.playIdleAni = function() {
this._playingAniName = c.IDLE;
this.armatureDisplayArray.forEach(function(t) {
cc.isValid(t) && t.playAnimation(c.IDLE, 0);
});
};
e.prototype.playExitAni = function() {
this._playingAniName = c.EXIT;
this.armatureDisplayArray.forEach(function(t) {
cc.isValid(t) && t.playAnimation(c.EXIT, 1);
});
};
e.prototype.activeNode = function(t) {
this.armatureDisplayArray.forEach(function(e) {
e.node.opacity = t ? 255 : 0;
});
};
n([ h([ dragonBones.ArmatureDisplay ]) ], e.prototype, "armatureDisplayArray", void 0);
n([ h(cc.Label) ], e.prototype, "scoreLabel", void 0);
return n([ classId("HeartComp"), u, classMethodWatch() ], e);
}(hs.Component);
r.default = p;
cc._RF.pop();
}, {} ],
NumberAnimator: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "e42f1VwvuJIjYGJt9IhBaUN", "NumberAnimator");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.NumberAnimator = void 0;
var a = cc._decorator, s = a.ccclass, c = a.property, l = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.targetLabel = null;
e.duration = .5;
e._currentValue = 0;
e._startValue = 0;
e._targetValue = 0;
e._elapsedTime = 0;
e._isAnimating = !1;
return e;
}
e.prototype.render = function() {
this.animateToValue(this.state.to);
};
e.prototype.animateTo = function(t, e) {
this._startValue = t;
this._targetValue = e;
this._currentValue = t;
this._elapsedTime = 0;
this._isAnimating = !0;
this.updateDisplay();
};
e.prototype.animateToValue = function(t) {
0 == this._currentValue && (this._currentValue = t);
this.animateTo(this._currentValue, t);
};
e.prototype.update = function(t) {
if (this._isAnimating) {
this._elapsedTime += t;
var e = Math.min(this._elapsedTime / this.duration, 1);
this._currentValue = this._startValue + (this._targetValue - this._startValue) * e;
this.updateDisplay();
if (e >= 1) {
this._isAnimating = !1;
this._currentValue = this._targetValue;
this.updateDisplay();
}
}
};
e.prototype.updateDisplay = function() {
this.targetLabel && (this.targetLabel.string = Math.floor(this._currentValue).toString());
};
e.prototype.setValue = function(t) {
this._currentValue = t;
this._targetValue = t;
this._isAnimating = !1;
this.updateDisplay();
};
e.prototype.getCurrentValue = function() {
return this._currentValue;
};
n([ c(cc.Label) ], e.prototype, "targetLabel", void 0);
n([ c(cc.Float) ], e.prototype, "duration", void 0);
return n([ classId("NumberAnimator"), s, classMethodWatch() ], e);
}(hs.Component);
r.NumberAnimator = l;
cc._RF.pop();
}, {} ]
}, {}, [ "$27720_f_OptimizeHeartAndScoreTrait", "ClearComp", "HeartComp", "NumberAnimator" ]);
//# sourceMappingURL=index.js.map
