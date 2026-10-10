window.__require = function t(e, n, o) {
function r(a, c) {
if (!n[a]) {
if (!e[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!e[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var u = n[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return r(e[a][1][t] || t);
}, u, u.exports, t, e, n, o);
}
return n[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) r(o[a]);
return r;
}({
AllClearAnimTrait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "60c37Oxd1NM1YXpyQ2MAarx", "AllClearAnimTrait");
var o, r = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
o(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), i = this && this.__decorate || function(t, e, n, o) {
var r, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var c = t.length - 1; c >= 0; c--) (r = t[c]) && (a = (i < 3 ? r(a) : i > 3 ? r(e, n, a) : r(e, n)) || a);
return i > 3 && a && Object.defineProperty(e, n, a), a;
}, a = this && this.__awaiter || function(t, e, n, o) {
return new (n || (n = Promise))(function(r, i) {
function a(t) {
try {
l(o.next(t));
} catch (t) {
i(t);
}
}
function c(t) {
try {
l(o.throw(t));
} catch (t) {
i(t);
}
}
function l(t) {
t.done ? r(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(a, c);
var e;
}
l((o = o.apply(t, e || [])).next());
});
}, c = this && this.__generator || function(t, e) {
var n, o, r, i, a = {
label: 0,
sent: function() {
if (1 & r[0]) throw r[1];
return r[1];
},
trys: [],
ops: []
};
return i = {
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function c(t) {
return function(e) {
return l([ t, e ]);
};
}
function l(i) {
if (n) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (n = 1, o && (r = 2 & i[0] ? o.return : i[0] ? o.throw || ((r = o.return) && r.call(o), 
0) : o.next) && !(r = r.call(o, i[1])).done) return r;
(o = 0, r) && (i = [ 2 & i[0], r.value ]);
switch (i[0]) {
case 0:
case 1:
r = i;
break;

case 4:
a.label++;
return {
value: i[1],
done: !1
};

case 5:
a.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(r = a.trys, r = r.length > 0 && r[r.length - 1]) && (6 === i[0] || 2 === i[0])) {
a = 0;
continue;
}
if (3 === i[0] && (!r || i[1] > r[0] && i[1] < r[3])) {
a.label = i[1];
break;
}
if (6 === i[0] && a.label < r[1]) {
a.label = r[1];
r = i;
break;
}
if (r && a.label < r[2]) {
a.label = r[2];
a.ops.push(i);
break;
}
r[2] && a.ops.pop();
a.trys.pop();
continue;
}
i = e.call(t, a);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
n = r = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.AllClearAnimTrait = void 0;
var l = t("../components/RefreshScreen"), s = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._blockOverNode = null;
e._parentNd = null;
e._boardContentSize = cc.size(0, 0);
e._boardPosition = cc.v2(0, 0);
e._currentColor = 0;
e.animPrefab = null;
return e;
}
e.prototype.onActive = function(t) {
var e = this;
if (hs.tp.isClassBoardSplashAnimation_ProxyOnShowClearScreen(t)) {
var n = t.args[0].state;
this._currentColor = n.color;
}
if (hs.tp.isClassBoardSplashAnimation_ProxySetBoardSplashAnimationState(t)) {
if (!this.isCanClear()) return;
this.play(t);
t.replace = !0;
}
if (hs.tp.isBoardStartFinish(t)) {
var o = t.target;
cc.isValid(null == o ? void 0 : o.node) && setTimeoutSafe(function() {
var t = hs.gameUiLayer.convertToNodeSpaceAR(o.node.parent.convertToWorldSpaceAR(o.node.getPosition()));
e._parentNd = hs.gameUiLayer;
e._boardContentSize = o.node.getContentSize();
e._boardPosition = t;
});
}
hs.tp.isClassScoreTip_ProxyPlayClearScreenScoreAnim(t) && this.isCanClear() && this.shouldPlay() && (t.replace = !0);
hs.tp.isClassEncourage_ProxyPlayEncourageUnbelievable(t) && this.isCanClear() && this.shouldPlay() && (t.replace = !0);
};
e.prototype.play = function(t) {
var e = this, n = this._currentColor, o = t.args[3];
if (!this.shouldPlay()) {
cc.isValid(o) && o();
return !1;
}
cc.isValid(this._parentNd) ? cc.tween(this._parentNd).delay(.4).call(function() {
e.LoadAnim(n, function() {
cc.tween(e._parentNd).delay(.43).call(function() {
var t = e._parentNd.getChildByName("allClearAnim");
t && t.destroy();
for (var o = 0; o < 8; o++) {
var r = e._boardPosition.y + Math.floor(e._boardContentSize.height / 2 - 53 - 106 * o);
e.showRowEliminateEffect({
y: r,
parent: e._parentNd,
color: n,
index: o
});
}
}).delay(.33).call(function() {
hs.EventManager.dispatchModuleEvent(new hs.E_Encourage_Play({
type: hs.EncourageType.LEVEL_COLOR,
eliminateCount: 7,
color: n,
promptType: hs.EncouragePromptType.PROMPT5
}));
cc.isValid(o) && o();
}).start();
});
}).start() : cc.isValid(o) && o();
};
e.prototype.LoadAnim = function(t, e) {
return a(this, void 0, void 0, function() {
var n;
return c(this, function(o) {
switch (o.label) {
case 0:
if (null != this.animPrefab) return [ 3, 5 ];
o.label = 1;

case 1:
o.trys.push([ 1, 3, , 4 ]);
n = this;
return [ 4, hs.ResLoader.asyncLoadByBundle("AllClearAnimTrait", "prefab/refreshScreen", cc.Prefab) ];

case 2:
n.animPrefab = o.sent();
this.ShowAnim(t, e);
return [ 3, 4 ];

case 3:
o.sent();
return [ 3, 4 ];

case 4:
return [ 3, 6 ];

case 5:
this.ShowAnim(t, e);
o.label = 6;

case 6:
return [ 2 ];
}
});
});
};
e.prototype.ShowAnim = function(t, e) {
var n = cc.instantiate(this.animPrefab);
n.name = "allClearAnim";
n.setParent(this._parentNd);
n.setSiblingIndex(100);
n.setPosition(this._boardPosition);
n.scale = Math.min(n.width / this._boardContentSize.width, n.height / this._boardContentSize.height);
n.getComponent(l.default).playAnimition({
enterAnimitionIndex: 7,
enterActionIndex: 1,
enterTimeScale: 1.6,
color: t,
callback: e
});
};
e.prototype.showEndScriptOld = function(t) {
return a(this, void 0, void 0, function() {
var e, n, o, r, i, a, l, s, u;
return c(this, function(c) {
switch (c.label) {
case 0:
e = t.x, n = t.y, o = t.scale, r = t.angle, i = t.parent, a = t.color, l = t.delayCount;
return [ 4, hs.eliminateEndPool.getNode() ];

case 1:
if (!(s = c.sent())) return [ 2 ];
cc.isValid(s.parent) || i.addChild(s, 0);
s.x = e;
s.y = n;
s.active = !0;
r && (s.angle = r);
s.scale = o;
0 != a && (null == (u = s.getComponent("PreEliminateShowEndComp")) ? void 0 : u.node) && cc.isValid(u.node) && cc.tween(s).delay(.1 * l).call(function() {
u.setState({
color: a,
isEven: !0
});
}).start();
return [ 2 ];
}
});
});
};
e.prototype.showRowEliminateEffect = function(t) {
return a(this, void 0, void 0, function() {
var e, n, o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
e = t.y, n = t.parent, o = t.color, t.index;
r = null;
a.label = 1;

case 1:
a.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.eliminateComboRainbowEndPool.getNode() ];

case 2:
r = a.sent();
return [ 3, 4 ];

case 3:
a.sent();
r = null;
return [ 3, 4 ];

case 4:
if (!r) {
this.showEndScriptOld({
x: 0,
y: e,
scale: 0,
angle: 0,
parent: n,
color: o,
delayCount: 0
});
return [ 2 ];
}
cc.isValid(r.parent) || n.addChild(r, 100);
r.x = this._boardPosition.x;
r.y = e;
r.scale = 1;
if ((null == (i = r.getComponent("PreEliminateShowEndSkinRainbowComp")) ? void 0 : i.node) && cc.isValid(i.node)) {
try {
hs.eliminateComboRainbowEndPool.release(r);
} catch (t) {}
this.showEndScriptOld({
x: this._boardPosition.x,
y: e,
scale: 1,
angle: 0,
parent: n,
color: o,
delayCount: 0
});
} else {
try {
hs.eliminateComboRainbowEndPool.release(r);
} catch (t) {}
this.showEndScriptOld({
x: this._boardPosition.x,
y: e,
scale: 1,
angle: 0,
parent: n,
color: o,
delayCount: 0
});
}
return [ 2 ];
}
});
});
};
e.prototype.shouldPlay = function() {
var t, e, n = hs.storage.getItem("classGuideStep", 0), o = null === (e = null === (t = hs) || void 0 === t ? void 0 : t.classGameInfo) || void 0 === e ? void 0 : e.roundNum, r = hs.storage.getItem("classRoundNum", 0);
return n > 2 && ("number" == typeof o ? o : r) >= 5;
};
e.prototype.isCanClear = function(t, e) {
var n = new hs.BinaryBoard();
n.convertToBinaryBoard(hs.boardInfo.faceBlocks);
t && t.forEach(function(t) {
n.clearRow(t);
});
e && e.forEach(function(t) {
n.clearCol(t);
});
n.record();
n.canClearBlockArr(!0);
return n.getEmptyNumObj() >= 64;
};
return i([ classId("AllClearAnimTrait") ], e);
}(Trait);
n.AllClearAnimTrait = s;
cc._RF.pop();
}, {
"../components/RefreshScreen": "RefreshScreen"
} ],
RefreshScreen: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "81f01On/QVLAo+YIp10e2Vw", "RefreshScreen");
var o, r = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
o(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), i = this && this.__decorate || function(t, e, n, o) {
var r, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var c = t.length - 1; c >= 0; c--) (r = t[c]) && (a = (i < 3 ? r(a) : i > 3 ? r(e, n, a) : r(e, n)) || a);
return i > 3 && a && Object.defineProperty(e, n, a), a;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var a = cc._decorator, c = a.ccclass, l = a.property, s = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.blockAtlas = null;
e.animitionGroup = [ [ [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ] ], [ [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ] ], [ [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ] ], [ [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ] ], [ [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ] ], [ [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ] ], [ [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ] ], [ [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ] ], [ [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ] ] ], [ [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ] ], [ [ [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 1.3 ], [ 1.4 ] ], [ [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 1.3 ] ], [ [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ] ], [ [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ] ], [ [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ] ], [ [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ] ], [ [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ] ], [ [ [ 4.9 ], [ 5 ], [ 5.1 ], [ 5.2 ], [ 5.3 ], [ 5.4 ], [ 5.5 ], [ 5.6 ] ], [ [ 4.8 ], [ 2.5 ], [ 2.6 ], [ 2.7 ], [ 2.8 ], [ 2.9 ], [ 3 ], [ 5.7 ] ], [ [ 4.7 ], [ 2.4 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 3.1 ], [ 5.8 ] ], [ [ 4.6 ], [ 2.3 ], [ .8 ], [ .1 ], [ .2 ], [ 1.3 ], [ 3.2 ], [ 5.9 ] ], [ [ 4.5 ], [ 2.1 ], [ .7 ], [ 0 ], [ .3 ], [ 1.4 ], [ 3.3 ], [ 6 ] ], [ [ 4.4 ], [ 2.1 ], [ .6 ], [ .5 ], [ .4 ], [ 1.5 ], [ 3.4 ], [ 6.1 ] ], [ [ 4.3 ], [ 2 ], [ 1.9 ], [ 1.8 ], [ 1.7 ], [ 1.6 ], [ 3.5 ], [ 6.2 ] ], [ [ 4.2 ], [ 4.1 ], [ 4 ], [ 3.9 ], [ 3.8 ], [ 3.7 ], [ 3.6 ], [ 6.3 ] ] ], [ [ [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ] ], [ [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ] ], [ [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ] ], [ [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ] ] ];
e.enterActions = [ function(t, e, n, o, r, i) {
void 0 === e && (e = []);
t.scale = 0;
cc.tween(t).delay((e[0] || 0) / n).to(r || .1, {
scale: 1
}, {
easing: i
}).call(function() {
o && o();
}).start();
}, function(t, e, n, o, r, i) {
void 0 === e && (e = []);
t.opacity = 0;
cc.tween(t).delay((e[0] || 0) / n).to(r || .1, {
opacity: 255
}, {
easing: i
}).call(function() {
o && o();
}).start();
} ];
e.exitActions = [ function(t, e, n, o, r, i) {
void 0 === e && (e = []);
t.scale = 1;
cc.tween(t).delay((e[0] || 0) / n).to(r || .1, {
scale: 0
}, {
easing: i
}).call(function() {
o && o();
}).start();
}, function(t, e, n, o, r, i) {
void 0 === e && (e = []);
t.opacity = 255;
cc.tween(t).delay((e[0] || 0) / n).to(r || .1, {
opacity: 0
}, {
easing: i
}).call(function() {
o && o();
}).start();
} ];
return e;
}
e.prototype.onLoad = function() {};
e.prototype.setColor = function(t, e) {
void 0 === e && (e = null);
for (var n = 0; n < this.node.children.length; n++) {
var o = this.node.children[n].getComponent(cc.Sprite);
Array.isArray(t) ? o.spriteFrame = (e || this.blockAtlas).getSpriteFrame("game_cube_" + (t[n] || Math.floor(7 * Math.random()) + 1)) : o.spriteFrame = (e || this.blockAtlas).getSpriteFrame("game_cube_" + (t || Math.floor(7 * Math.random()) + 1));
}
};
e.prototype.playAnimition = function(t) {
var e = this;
void 0 === t && (t = {});
var n = t.enterAnimitionIndex, o = t.enterActionIndex || 0, r = t.enterTimeScale, i = t.enterDuration, a = t.enterAnimEase, c = t.exitAnimitionIndex, l = t.exitActionIndex || 0, s = t.exitTimeScale, u = t.exitDuration, h = t.exitDelay || 0, d = t.exitAnimEase, p = t.callback || null, f = t.color;
if (n >= 0 || c >= 0) {
this.setColor(f, t.blockAtlas);
if (n >= 0) {
var y = this.enterActions[o] || this.enterActions[0], m = this.exitActions[l] || this.exitActions[0];
this.childPlayAction(y, this.animitionGroup[n], r, i, function() {
c >= 0 ? cc.tween(e.node).delay(h).call(function() {
e.childPlayAction(m, e.animitionGroup[c], s, u, function() {
p && p();
}, d);
}).start() : p && p();
}, a);
} else if (c >= 0) {
var v = this.exitActions[l] || this.exitActions[0];
cc.tween(this.node).delay(h).call(function() {
e.childPlayAction(v, e.animitionGroup[c], s, u, function() {
p && p();
}, d);
});
}
}
};
e.prototype.childPlayAction = function(t, e, n, o, r, i) {
var a = this;
void 0 === n && (n = 1);
for (var c = 0, l = 0; l < this.node.children.length; l++) {
var s = l % 8, u = Math.floor(l / 8);
t(this.node.children[l], e[u][s], n, function() {
++c == a.node.children.length && r && r();
}, o, i);
}
};
e.prototype.start = function() {};
i([ l(cc.SpriteAtlas) ], e.prototype, "blockAtlas", void 0);
return i([ c ], e);
}(t("../../../../../scripts/base/components/Component").default);
n.default = s;
cc._RF.pop();
}, {
"../../../../../scripts/base/components/Component": void 0
} ]
}, {}, [ "RefreshScreen", "AllClearAnimTrait" ]);
//# sourceMappingURL=index.js.map
