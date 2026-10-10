window.__require = function t(e, o, i) {
function r(a, s) {
if (!o[a]) {
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
var u = o[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return r(e[a][1][t] || t);
}, u, u.exports, t, e, o, i);
}
return o[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < i.length; a++) r(i[a]);
return r;
}({
$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "e2228bss1RCK4VMusjoM5Dl", "$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait");
var i, r, n = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
i(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), a = this && this.__decorate || function(t, e, o, i) {
var r, n = arguments.length, a = n < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, i); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (a = (n < 3 ? r(a) : n > 3 ? r(e, o, a) : r(e, o)) || a);
return n > 3 && a && Object.defineProperty(e, o, a), a;
}, s = this && this.__awaiter || function(t, e, o, i) {
return new (o || (o = Promise))(function(r, n) {
function a(t) {
try {
c(i.next(t));
} catch (t) {
n(t);
}
}
function s(t) {
try {
c(i.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? r(t.value) : (e = t.value, e instanceof o ? e : new o(function(t) {
t(e);
})).then(a, s);
var e;
}
c((i = i.apply(t, e || [])).next());
});
}, c = this && this.__generator || function(t, e) {
var o, i, r, n, a = {
label: 0,
sent: function() {
if (1 & r[0]) throw r[1];
return r[1];
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
if (o) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (o = 1, i && (r = 2 & n[0] ? i.return : n[0] ? i.throw || ((r = i.return) && r.call(i), 
0) : i.next) && !(r = r.call(i, n[1])).done) return r;
(i = 0, r) && (n = [ 2 & n[0], r.value ]);
switch (n[0]) {
case 0:
case 1:
r = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
i = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(r = a.trys, r = r.length > 0 && r[r.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!r || n[1] > r[0] && n[1] < r[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < r[1]) {
a.label = r[1];
r = n;
break;
}
if (r && a.label < r[2]) {
a.label = r[2];
a.ops.push(n);
break;
}
r[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
i = 0;
} finally {
o = r = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait = void 0;
(function(t) {
t.ENTER = "enter";
t.IDLE = "idle";
t.EXIT = "exit";
t.NONE = "";
})(r || (r = {}));
var l = "$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait", u = {
up: [ "87FDFF", "FFFC78", "FFFFFF", "FFDB00", "FFC9A8", "C5FF93", "00FBFF" ],
down: [ "008AFF", "FFFC78", "C700FF", "FF8A00", "FF2323", "00BE6E", "00BDFF" ]
}, f = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._heartBeatEffectComp = null;
e._heartBeatEffectPrefab = null;
e._comboSkinConfig = null;
e._loadTimeoutBarrier = null;
e._currentComboNum = 0;
e._currentBlockColorIndex = 0;
e._curNode = null;
e._initScaleTween = null;
e._isPlayingInitScale = !1;
e._currentComboStage = 1;
e._colorHexs = [];
e._currentSkinId = "1000";
return e;
}
Object.defineProperty(e.prototype, "comboStage1", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.comboStage1) && void 0 !== e ? e : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "comboStage2", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.comboStage2) && void 0 !== e ? e : 10;
},
enumerable: !1,
configurable: !0
});
e.prototype.data = function() {
return hs.storage.getItem("$30673_f_OptimizeHeartBeatEffectTrait_color_key", {
colorHexs: [ "87FDFF", "008AFF" ]
});
};
e.prototype.onCreate = function() {
this.preloadHeartBeatEffect().catch(function() {});
this.loadComboSkinConfig();
this._colorHexs = this.state.colorHexs;
};
e.prototype.preloadHeartBeatEffect = function() {
return s(this, void 0, Promise, function() {
var t;
return c(this, function(e) {
switch (e.label) {
case 0:
t = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(l, "prefabs/heartBeatEffect", cc.Prefab) ];

case 1:
t._heartBeatEffectPrefab = e.sent();
return [ 2 ];
}
});
});
};
e.prototype.loadComboSkinConfig = function() {
var t = this;
hs.ResLoader.asyncLoadByBundle(l, "config/comboSkin", cc.JsonAsset).then(function(e) {
e && e.json && (t._comboSkinConfig = e.json);
}).catch(function() {});
};
e.prototype.onActive = function(t) {
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
hs.tp.isClassTopInfoInitComboAnim(t) && this.initHeartBeatEffect(t).catch(function() {});
hs.tp.isClassCombo_ProxyOnTouchEnd(t) && this.onTouchEnd(t);
hs.tp.isClassTopInfoComboAnimState(t) && this.updateComboAnimState(t).catch(function() {});
hs.tp.isClassTopInfoSetScoreLabel(t) && this.onScoreLabelUpdate(t);
}
};
e.prototype.initHeartBeatEffect = function(t) {
return s(this, void 0, Promise, function() {
var e, o;
return c(this, function(i) {
switch (i.label) {
case 0:
this._loadTimeoutBarrier || (this._loadTimeoutBarrier = new hs.TimeoutBarrier(2e3));
if (!(e = t.target) || !e.curNode) return [ 2 ];
this._curNode = e.curNode;
if (this._heartBeatEffectPrefab) return [ 3, 4 ];
i.label = 1;

case 1:
i.trys.push([ 1, 3, , 4 ]);
o = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(l, "prefabs/heartBeatEffect", cc.Prefab) ];

case 2:
o._heartBeatEffectPrefab = i.sent();
return [ 3, 4 ];

case 3:
i.sent();
return [ 2 ];

case 4:
this._loadTimeoutBarrier.open();
return [ 2 ];
}
});
});
};
e.prototype.createHeartBeatEffectComp = function() {
var t = Cinst(hs.ClassTopInfo);
if (t && t.curNode && null != this._heartBeatEffectPrefab && cc.isValid(this._heartBeatEffectPrefab) && !this._heartBeatEffectComp) {
var e = cc.instantiate(this._heartBeatEffectPrefab);
e.setParent(t.curNode);
var o = t.comboAnim.node.x, i = t.comboAnim.node.y;
e.setPosition(o, i);
e.zIndex = t.comboAnim.node.zIndex - 1;
this._heartBeatEffectComp = e.getComponent("HeartBeatEffectCompAdjustParams");
if (!this._heartBeatEffectComp) return;
this._heartBeatEffectComp.activeNode(!1);
}
};
e.prototype.updateHeartPosition = function() {
var t = Cinst(hs.ClassTopInfo);
if (t && t.curNode) {
var e = t.comboAnim.node.x, o = t.comboAnim.node.y;
this._heartBeatEffectComp && cc.isValid(this._heartBeatEffectComp.node) && this._heartBeatEffectComp.node.setPosition(e, o);
}
};
e.prototype.updateComboAnimState = function(t) {
return s(this, void 0, Promise, function() {
var e, o, i;
return c(this, function(n) {
switch (n.label) {
case 0:
t.replace = !0;
t.returnState = !0;
return !this._loadTimeoutBarrier || this._loadTimeoutBarrier.isOpen ? [ 3, 2 ] : [ 4, this._loadTimeoutBarrier.wait() ];

case 1:
n.sent();
n.label = 2;

case 2:
e = t.args[0], o = e.comboAnimState, i = e.continuousEliminateTimes;
this._currentComboNum = (i || 0) - 1;
this._colorHexs && 0 !== this._colorHexs.length || (this._colorHexs = this.getColorByBlockIndex(this._currentBlockColorIndex));
switch (o) {
case hs.TopInfoType.ShowCombo:
this.createHeartBeatEffectComp();
this.updateHeartPosition();
this._heartBeatEffectComp && this._heartBeatEffectComp.setState({
type: r.ENTER,
hexs: this._colorHexs,
comboNum: i,
comboStage1: this.comboStage1,
comboStage2: this.comboStage2
});
this._currentComboStage = this.getComboStage(this._currentComboNum);
break;

case hs.TopInfoType.ShowCombo_No_Eliminate:
break;

case hs.TopInfoType.CancelCombo:
if (this._heartBeatEffectComp) {
this.updateHeartPosition();
this._heartBeatEffectComp.setState({
type: r.EXIT,
hexs: this._colorHexs,
comboNum: i,
comboStage1: this.comboStage1,
comboStage2: this.comboStage2
});
}
break;

case hs.TopInfoType.None:
this._heartBeatEffectComp && this._heartBeatEffectComp.activeNode(!1);
}
return [ 2 ];
}
});
});
};
e.prototype.onTouchEnd = function(t) {
var e, o = t.args[0];
if ((null === (e = null == o ? void 0 : o.state) || void 0 === e ? void 0 : e.putEliminatesInfo) && 0 !== o.state.putEliminatesInfo.length) {
var i = o.state.putEliminatesInfo[0];
if (i && "number" == typeof i.color) {
this._currentBlockColorIndex = o.state.color;
this._colorHexs = this.getColorByBlockIndex(this._currentBlockColorIndex);
this.state.colorHexs = this._colorHexs;
hs.storage.setItem("$30673_f_OptimizeHeartBeatEffectTrait_color_key", this.state);
this._currentSkinId = hs.skinInfo.currentSkinId || "1000";
}
}
};
e.prototype.onScoreLabelUpdate = function() {};
e.prototype.getComboStage = function(t) {
return t > this.comboStage2 ? 3 : t > this.comboStage1 ? 2 : 1;
};
e.prototype.getDefaultSkinHexs = function(t) {
var e = u, o = e.up[t - 1], i = e.down[t - 1];
return o && i ? [ o, i ] : [ e.up[0], e.down[0] ];
};
e.prototype.getColorByBlockIndex = function(t, e) {
if (!this._comboSkinConfig) return this.getDefaultSkinHexs(t);
var o = "skin_" + (e || hs.skinInfo.currentSkinId || "1000"), i = t - 1, r = this._comboSkinConfig[o];
if (!r || !(null == r ? void 0 : r.length) || !(null == r ? void 0 : r[i])) {
var n = this._comboSkinConfig.skin_1000;
if (n && n.length > 0) {
var a = n[i];
a || (a = n[0]);
return [ a["上"], a["下"] ];
}
return this.getDefaultSkinHexs(t);
}
var s = r[i];
return [ s["上"], s["下"] ];
};
e.prototype.setBlockColorIndex = function(t) {
this._currentBlockColorIndex = t;
};
e.prototype.getScoreNode = function() {
return this._curNode;
};
e.prototype.playScoreInScaleAnimation = function() {
var t = this, e = this.getScoreNode();
if (e) {
cc.Tween.stopAllByTarget(e);
this._isPlayingInitScale = !1;
cc.tween(e).delay(.13).to(.07, {
scale: 1.15
}).to(.1, {
scale: .9
}).to(.13, {
scale: 1
}).call(function() {
t.startInitScaleAnimation();
}).start();
}
};
e.prototype.startInitScaleAnimation = function() {
var t = this, e = this.getScoreNode();
if (e) if (this._isPlayingInitScale) ; else {
this._isPlayingInitScale = !0;
var o = this.getInitScaleTimings(this._currentComboStage), i = function() {
t._isPlayingInitScale && cc.isValid(e) && (t._initScaleTween = cc.tween(e).to(o[0], {
scale: 1
}).to(o[1], {
scale: 1
}).to(o[2], {
scale: 1.05
}).to(o[3], {
scale: 1
}).to(o[4], {
scale: 1.05
}).to(.1, {
scale: 1
}).call(function() {
i();
}).start());
};
i();
}
};
e.prototype.getInitScaleTimings = function(t) {
switch (t) {
case 1:
return [ .07, .33, .3, .3, .2 ];

case 2:
return [ .07, .27, .23, .27, .17 ];

case 3:
return [ .07, .2, .2, .2, .13 ];

default:
return [ .07, .33, .3, .3, .2 ];
}
};
e.prototype.stopInitScaleAnimation = function() {
this._isPlayingInitScale = !1;
var t = this.getScoreNode();
if (t) {
cc.Tween.stopAllByTarget(t);
t.scale = 1;
}
};
e.prototype.onDestroy = function() {
if (this._heartBeatEffectComp && cc.isValid(this._heartBeatEffectComp.node)) {
this._heartBeatEffectComp.node.destroy();
this._heartBeatEffectComp = null;
}
this._heartBeatEffectPrefab = null;
this._comboSkinConfig = null;
};
return a([ classId("$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait") ], e);
}(Trait);
o.$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait = f;
cc._RF.pop();
}, {} ],
HeartBeatEffectCompAdjustParams: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "eb7b6TU5lFDKpYVnYGEGRNI", "HeartBeatEffectCompAdjustParams");
var i, r = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
i(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), n = this && this.__decorate || function(t, e, o, i) {
var r, n = arguments.length, a = n < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, i); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (a = (n < 3 ? r(a) : n > 3 ? r(e, o, a) : r(e, o)) || a);
return n > 3 && a && Object.defineProperty(e, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var a, s = cc._decorator, c = s.ccclass, l = s.property;
(function(t) {
t.ENTER = "enter";
t.IDLE = "idle";
t.EXIT = "exit";
t.NONE = "";
})(a || (a = {}));
var u = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.armatureDisplayDown = null;
e.armatureDisplayUp = null;
e._isPlaying = !1;
e._isListening = !1;
e._playingAniName = a.NONE;
e._curComboNum = -1;
return e;
}
Object.defineProperty(e.prototype, "comboStage1", {
get: function() {
var t, e;
return null !== (e = null === (t = this.state) || void 0 === t ? void 0 : t.comboStage1) && void 0 !== e ? e : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "comboStage2", {
get: function() {
var t, e;
return null !== (e = null === (t = this.state) || void 0 === t ? void 0 : t.comboStage2) && void 0 !== e ? e : 10;
},
enumerable: !1,
configurable: !0
});
e.prototype.onLoad = function() {
var t = this;
this.armatureDisplayDown.timeScale = 1 / (cc.director._kSpeed || 1);
this.armatureDisplayUp.timeScale = 1 / (cc.director._kSpeed || 1);
this.armatureDisplayUp.addEventListener(dragonBones.EventObject.COMPLETE, function() {}, this);
this.armatureDisplayDown.addEventListener(dragonBones.EventObject.COMPLETE, function() {
a.IDLE != t._playingAniName && (a.EXIT == t._playingAniName ? t.activeNode(!1) : a.ENTER == t._playingAniName && t.playIdleAni());
}, this);
};
e.prototype.render = function() {
this.playAni(this.state.type, this.state.hexs, this.state.comboNum);
};
e.prototype.playAni = function(t, e, o) {
void 0 === o && (o = -1);
this.activeNode(!0);
o > 0 && (this._curComboNum = o);
this._setColor(e);
switch (t) {
case a.ENTER:
this.playEnterAni();
break;

case a.IDLE:
this.playIdleAni();
break;

case a.EXIT:
this.playExitAni();
}
};
e.prototype._setColor = function(t) {
cc.isValid(this.armatureDisplayDown) && (this.armatureDisplayDown.node.color = cc.color().fromHEX("#" + t[1]));
cc.isValid(this.armatureDisplayUp) && (this.armatureDisplayUp.node.color = cc.color().fromHEX("#" + t[0]));
};
e.prototype._getAniSuffix = function() {
var t = this._curComboNum - 1;
return t > this.comboStage2 ? "3" : t > this.comboStage1 ? "2" : "1";
};
e.prototype.playEnterAni = function() {
this._playingAniName = a.ENTER;
var t = "in_" + this._getAniSuffix();
cc.isValid(this.armatureDisplayDown) && this.armatureDisplayDown.playAnimation(t, 1);
cc.isValid(this.armatureDisplayUp) && this.armatureDisplayUp.playAnimation(t + "_up", 1);
};
e.prototype.playIdleAni = function() {
this._playingAniName = a.IDLE;
var t = "init_" + this._getAniSuffix();
cc.isValid(this.armatureDisplayDown) && this.armatureDisplayDown.playAnimation(t, 0);
cc.isValid(this.armatureDisplayUp) && this.armatureDisplayUp.playAnimation(t + "_up", 0);
};
e.prototype.playExitAni = function() {
this._playingAniName = a.EXIT;
cc.isValid(this.armatureDisplayDown) && this.armatureDisplayDown.playAnimation("end", 1);
cc.isValid(this.armatureDisplayUp) && this.armatureDisplayUp.playAnimation("end_up", 1);
};
e.prototype.activeNode = function(t) {
this.node.active = t;
};
n([ l(dragonBones.ArmatureDisplay) ], e.prototype, "armatureDisplayDown", void 0);
n([ l(dragonBones.ArmatureDisplay) ], e.prototype, "armatureDisplayUp", void 0);
return n([ classId("HeartBeatEffectCompAdjustParams"), c ], e);
}(hs.Component);
o.default = u;
cc._RF.pop();
}, {} ]
}, {}, [ "$30673_f_OptimizeHeartBeatEffectAdjustParamsTrait", "HeartBeatEffectCompAdjustParams" ]);
//# sourceMappingURL=index.js.map
