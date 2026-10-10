window.__require = function t(e, r, n) {
function a(i, l) {
if (!r[i]) {
if (!e[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!e[c]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var u = r[i] = {
exports: {}
};
e[i][0].call(u.exports, function(t) {
return a(e[i][1][t] || t);
}, u, u.exports, t, e, r, n);
}
return r[i].exports;
}
for (var o = "function" == typeof __require && __require, i = 0; i < n.length; i++) a(n[i]);
return a;
}({
Arm1Comp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "bb24ccXcnpJLLYDa3aoW0T7", "Arm1Comp");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var a, o = arguments.length, i = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (o < 3 ? a(i) : o > 3 ? a(e, r, i) : a(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var i = cc._decorator, l = i.ccclass, c = i.property, s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.blockAtlas = null;
e.animitionGroup = [ [ [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ] ], [ [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ] ], [ [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ] ], [ [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ], [ .4 ] ], [ [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ], [ .5 ] ], [ [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .6 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ] ], [ [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ] ], [ [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ] ], [ [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ] ] ], [ [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ], [ [ .7 ], [ .6 ], [ .5 ], [ .4 ], [ .3 ], [ .2 ], [ .1 ], [ 0 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ] ], [ [ [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 1.3 ], [ 1.4 ] ], [ [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 1.3 ] ], [ [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ] ], [ [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ], [ 1.1 ] ], [ [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ], [ 1 ] ], [ [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ], [ .9 ] ], [ [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ], [ .8 ] ], [ [ 0 ], [ .1 ], [ .2 ], [ .3 ], [ .4 ], [ .5 ], [ .6 ], [ .7 ] ] ], [ [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ] ], [ [ [ 4.9 ], [ 5 ], [ 5.1 ], [ 5.2 ], [ 5.3 ], [ 5.4 ], [ 5.5 ], [ 5.6 ] ], [ [ 4.8 ], [ 2.5 ], [ 2.6 ], [ 2.7 ], [ 2.8 ], [ 2.9 ], [ 3 ], [ 5.7 ] ], [ [ 4.7 ], [ 2.4 ], [ .9 ], [ 1 ], [ 1.1 ], [ 1.2 ], [ 3.1 ], [ 5.8 ] ], [ [ 4.6 ], [ 2.3 ], [ .8 ], [ .1 ], [ .2 ], [ 1.3 ], [ 3.2 ], [ 5.9 ] ], [ [ 4.5 ], [ 2.1 ], [ .7 ], [ 0 ], [ .3 ], [ 1.4 ], [ 3.3 ], [ 6 ] ], [ [ 4.4 ], [ 2.1 ], [ .6 ], [ .5 ], [ .4 ], [ 1.5 ], [ 3.4 ], [ 6.1 ] ], [ [ 4.3 ], [ 2 ], [ 1.9 ], [ 1.8 ], [ 1.7 ], [ 1.6 ], [ 3.5 ], [ 6.2 ] ], [ [ 4.2 ], [ 4.1 ], [ 4 ], [ 3.9 ], [ 3.8 ], [ 3.7 ], [ 3.6 ], [ 6.3 ] ] ], [ [ [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ], [ .7 ] ], [ [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ], [ .6 ] ], [ [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ], [ .5 ] ], [ [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ], [ .4 ] ], [ [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ], [ .3 ] ], [ [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ], [ .2 ] ], [ [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ], [ .1 ] ], [ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 0 ] ] ] ];
e.enterActions = [ function(t, e, r, n, a, o) {
void 0 === e && (e = []);
t.scale = 0;
cc.tween(t).delay((e[0] || 0) / r).to(a || .1, {
scale: 1
}, {
easing: o
}).call(function() {
n && n();
}).start();
}, function(t, e, r, n, a, o) {
void 0 === e && (e = []);
t.opacity = 0;
cc.tween(t).delay((e[0] || 0) / r).to(a || .1, {
opacity: 255
}, {
easing: o
}).call(function() {
n && n();
}).start();
} ];
e.exitActions = [ function(t, e, r, n, a, o) {
void 0 === e && (e = []);
t.scale = 1;
cc.tween(t).delay((e[0] || 0) / r).to(a || .1, {
scale: 0
}, {
easing: o
}).call(function() {
n && n();
}).start();
}, function(t, e, r, n, a, o) {
void 0 === e && (e = []);
t.opacity = 255;
cc.tween(t).delay((e[0] || 0) / r).to(a || .1, {
opacity: 0
}, {
easing: o
}).call(function() {
n && n();
}).start();
} ];
return e;
}
e.prototype.onLoad = function() {};
e.prototype.setColor = function(t, e) {
void 0 === e && (e = null);
for (var r = 0; r < this.node.children.length; r++) {
var n = this.node.children[r].getComponent(cc.Sprite);
Array.isArray(t) ? n.spriteFrame = (e || this.blockAtlas).getSpriteFrame("game_cube_" + (t[r] || Math.floor(7 * Math.random()) + 1)) : n.spriteFrame = (e || this.blockAtlas).getSpriteFrame("game_cube_" + (t || Math.floor(7 * Math.random()) + 1));
}
};
e.prototype.playAnimition = function(t) {
var e = this;
void 0 === t && (t = {});
var r = t.enterAnimitionIndex, n = t.enterActionIndex || 0, a = t.enterTimeScale, o = t.enterDuration, i = t.enterAnimEase, l = t.exitAnimitionIndex, c = t.exitActionIndex || 0, s = t.exitTimeScale, u = t.exitDuration, f = t.exitDelay || 0, p = t.exitAnimEase, h = t.callback || null, d = t.color;
if (r >= 0 || l >= 0) {
this.setColor(d, t.blockAtlas);
if (r >= 0) {
var m = this.enterActions[n] || this.enterActions[0], y = this.exitActions[c] || this.exitActions[0];
this.childPlayAction(m, this.animitionGroup[r], a, o, function() {
l >= 0 ? cc.tween(e.node).delay(f).call(function() {
e.childPlayAction(y, e.animitionGroup[l], s, u, function() {
h && h();
}, p);
}).start() : h && h();
}, i);
} else if (l >= 0) {
var b = this.exitActions[c] || this.exitActions[0];
cc.tween(this.node).delay(f).call(function() {
e.childPlayAction(b, e.animitionGroup[l], s, u, function() {
h && h();
}, p);
});
}
}
};
e.prototype.childPlayAction = function(t, e, r, n, a, o) {
var i = this;
void 0 === r && (r = 1);
for (var l = 0, c = 0; c < this.node.children.length; c++) {
var s = c % 8, u = Math.floor(c / 8);
t(this.node.children[c], e[u][s], r, function() {
++l == i.node.children.length && a && a();
}, n, o);
}
};
e.prototype.start = function() {};
o([ c(cc.SpriteAtlas) ], e.prototype, "blockAtlas", void 0);
return o([ l ], e);
}(hs.Component);
r.default = s;
cc._RF.pop();
}, {} ],
Arm1Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "467892FapJOHYnACnsfZxyD", "Arm1Player");
var n = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(a, o) {
function i(t) {
try {
c(n.next(t));
} catch (t) {
o(t);
}
}
function l(t) {
try {
c(n.throw(t));
} catch (t) {
o(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, l);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, n, a, o, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return o = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(o) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, o[1])).done) return a;
(n = 0, a) && (o = [ 2 & o[0], a.value ]);
switch (o[0]) {
case 0:
case 1:
a = o;
break;

case 4:
i.label++;
return {
value: o[1],
done: !1
};

case 5:
i.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(a = i.trys, a = a.length > 0 && a[a.length - 1]) && (6 === o[0] || 2 === o[0])) {
i = 0;
continue;
}
if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
i.label = o[1];
break;
}
if (6 === o[0] && i.label < a[1]) {
i.label = a[1];
a = o;
break;
}
if (a && i.label < a[2]) {
i.label = a[2];
i.ops.push(o);
break;
}
a[2] && i.ops.pop();
i.trys.pop();
continue;
}
o = e.call(t, i);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
r = a = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm1Player = void 0;
var o = function() {
function t() {
this.armId = "1";
this.armName = "清盘动画优化(AllClearAnim)";
this.animPrefab = null;
this.bundleName = "SlotClearEffetsTrait";
this.prefabPath = "prefabs/arm1_refreshScreen";
this._parentNd = null;
this._boardContentSize = cc.size(0, 0);
this._boardPosition = cc.v2(0, 0);
}
t.prototype.preload = function() {
var t = this;
this.animPrefab || hs.ResLoader.loadByBundle(this.bundleName, this.prefabPath, cc.Prefab, function(e, r) {
e || (t.animPrefab = r);
});
};
t.prototype.play = function(t) {
var e = this, r = t.color, n = t.completeCallback, a = t.parentNode, o = t.boardComp;
a && cc.isValid(a) && (this._parentNd = a);
if (o && cc.isValid(o.node)) {
this._boardContentSize = o.node.getContentSize();
this._boardPosition = this._parentNd.convertToNodeSpaceAR(o.node.parent.convertToWorldSpaceAR(o.node.getPosition()));
}
t.screenScore;
var i = r || 1;
cc.tween(this._parentNd).delay(.4).call(function() {
e.LoadAnim(i, function() {
cc.tween(e._parentNd).delay(.43).call(function() {
var t = e._parentNd.getChildByName("allClearAnim");
t && t.destroy();
for (var r = 0; r < 8; r++) {
var n = e._boardPosition.y + Math.floor(e._boardContentSize.height / 2 - 53 - 106 * r);
e.showRowEliminateEffect({
y: n,
parent: e._parentNd,
color: i,
index: r
});
}
}).delay(.33).call(function() {
hs.EventManager.dispatchModuleEvent(new hs.E_Encourage_Play({
type: hs.EncourageType.LEVEL_COLOR,
eliminateCount: 7,
color: i,
promptType: hs.EncouragePromptType.PROMPT5
}));
null == n || n();
}).start();
});
}).start();
};
t.prototype.stop = function() {
var t = this._parentNd || hs.gameEffectLayer;
if (t && cc.isValid(t)) {
var e = t.getChildByName("allClearAnim");
e && cc.isValid(e) && e.destroy();
}
};
t.prototype.LoadAnim = function(t, e) {
return n(this, void 0, void 0, function() {
var r;
return a(this, function(n) {
switch (n.label) {
case 0:
if (null != this.animPrefab) return [ 3, 5 ];
n.label = 1;

case 1:
n.trys.push([ 1, 3, , 4 ]);
r = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(this.bundleName, this.prefabPath, cc.Prefab) ];

case 2:
r.animPrefab = n.sent();
this.ShowAnim(t, e);
return [ 3, 4 ];

case 3:
n.sent();
return [ 3, 4 ];

case 4:
return [ 3, 6 ];

case 5:
this.ShowAnim(t, e);
n.label = 6;

case 6:
return [ 2 ];
}
});
});
};
t.prototype.ShowAnim = function(t, e) {
var r = cc.instantiate(this.animPrefab);
r.name = "allClearAnim";
r.setParent(this._parentNd);
r.setPosition(this._boardPosition);
r.scale = Math.min(r.width / this._boardContentSize.width, r.height / this._boardContentSize.height);
r.getComponent("Arm1Comp").playAnimition({
enterAnimitionIndex: 7,
enterActionIndex: 1,
enterTimeScale: 1.6,
color: t,
callback: e
});
};
t.prototype.showRowEliminateEffect = function(t) {
return n(this, void 0, void 0, function() {
var e, r, n, o, i;
return a(this, function(a) {
switch (a.label) {
case 0:
e = t.y, r = t.parent, n = t.color, t.index;
o = null;
a.label = 1;

case 1:
a.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.eliminateComboRainbowEndPool.getNode() ];

case 2:
o = a.sent();
return [ 3, 4 ];

case 3:
a.sent();
o = null;
return [ 3, 4 ];

case 4:
if (!o) {
this.showEndScriptOld({
x: 0,
y: e,
scale: 0,
angle: 0,
parent: r,
color: n,
delayCount: 0
});
return [ 2 ];
}
cc.isValid(o.parent) || r.addChild(o, 100);
o.x = this._boardPosition.x;
o.y = e;
o.scale = 1;
if ((null == (i = o.getComponent("PreEliminateShowEndSkinRainbowComp")) ? void 0 : i.node) && cc.isValid(i.node)) {
try {
hs.eliminateComboRainbowEndPool.release(o);
} catch (t) {}
this.showEndScriptOld({
x: this._boardPosition.x,
y: e,
scale: 1,
angle: 0,
parent: r,
color: n,
delayCount: 0
});
} else {
try {
hs.eliminateComboRainbowEndPool.release(o);
} catch (t) {}
this.showEndScriptOld({
x: this._boardPosition.x,
y: e,
scale: 1,
angle: 0,
parent: r,
color: n,
delayCount: 0
});
}
return [ 2 ];
}
});
});
};
t.prototype.showEndScriptOld = function(t) {
return n(this, void 0, void 0, function() {
var e, r, n, o, i, l, c, s, u;
return a(this, function(a) {
switch (a.label) {
case 0:
e = t.x, r = t.y, n = t.scale, o = t.angle, i = t.parent, l = t.color, c = t.delayCount;
return [ 4, hs.eliminateEndPool.getNode() ];

case 1:
if (!(s = a.sent())) return [ 2 ];
cc.isValid(s.parent) || i.addChild(s, 0);
s.x = e;
s.y = r;
s.active = !0;
o && (s.angle = o);
s.scale = n;
0 != l && (null == (u = s.getComponent("PreEliminateShowEndComp")) ? void 0 : u.node) && cc.isValid(u.node) && cc.tween(s).delay(.1 * c).call(function() {
u.setState({
color: l,
isEven: !0
});
}).start();
return [ 2 ];
}
});
});
};
return t;
}();
r.Arm1Player = o;
cc._RF.pop();
}, {} ],
Arm2Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "add1eFHvO5JCJGWcZwqx9jg", "Arm2Player");
var n = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(a, o) {
function i(t) {
try {
c(n.next(t));
} catch (t) {
o(t);
}
}
function l(t) {
try {
c(n.throw(t));
} catch (t) {
o(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, l);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, n, a, o, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return o = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(o) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, o[1])).done) return a;
(n = 0, a) && (o = [ 2 & o[0], a.value ]);
switch (o[0]) {
case 0:
case 1:
a = o;
break;

case 4:
i.label++;
return {
value: o[1],
done: !1
};

case 5:
i.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(a = i.trys, a = a.length > 0 && a[a.length - 1]) && (6 === o[0] || 2 === o[0])) {
i = 0;
continue;
}
if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
i.label = o[1];
break;
}
if (6 === o[0] && i.label < a[1]) {
i.label = a[1];
a = o;
break;
}
if (a && i.label < a[2]) {
i.label = a[2];
i.ops.push(o);
break;
}
a[2] && i.ops.pop();
i.trys.pop();
continue;
}
o = e.call(t, i);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
r = a = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm2Player = void 0;
var o = function() {
function t() {
this.armId = "2";
this.armName = "新版本清盘动效搭配音效(EffectAllClearPlus)";
this.effectPrefab = null;
this.effectNode = null;
this.bundleName = "SlotClearEffetsTrait";
}
t.prototype.getPrefabPath = function() {
return "prefabs/arm2_effectAllClearPlus";
};
t.prototype.preload = function() {
var t = this;
this.effectPrefab || hs.ResLoader.loadByBundle(this.bundleName, this.getPrefabPath(), cc.Prefab, function(e, r) {
e || (t.effectPrefab = r);
});
};
t.prototype.play = function(t) {
var e = t.screenScore, r = t.completeCallback, n = e || 0;
this.playEffect(n, r);
};
t.prototype.stop = function() {
if (this.effectNode && cc.isValid(this.effectNode)) {
this.effectNode.destroy();
this.effectNode = null;
}
};
t.prototype.playEffect = function(t, e) {
void 0 === t && (t = 0);
return n(this, void 0, void 0, function() {
var r, n;
return a(this, function(a) {
switch (a.label) {
case 0:
r = this.createSafeMaskCallback();
return [ 4, this.getEffectNode() ];

case 1:
n = a.sent();
cc.tween(n).delay(.7).call(function() {
n.getComponent(hs.BoardClearAnimationDisplay).setState({
animName: hs.BoardClearAnim.Qingchang,
score: t,
callback: function() {
r();
null == e || e();
}
});
}).start();
return [ 2 ];
}
});
});
};
t.prototype.createSafeMaskCallback = function(t) {
void 0 === t && (t = 5e3);
var e = Cinst("BlocksProducerTouch");
e && "function" == typeof e.setMaskActive && e.setMaskActive(!0);
var r = !1, n = setTimeoutSafe(function() {
if (!r) {
r = !0;
e && "function" == typeof e.setMaskActive && e.setMaskActive(!1);
}
}, t);
return function() {
if (!r) {
r = !0;
clearTimeout(n);
e && "function" == typeof e.setMaskActive && e.setMaskActive(!1);
}
};
};
t.prototype.getEffectNode = function() {
return n(this, void 0, Promise, function() {
var t;
return a(this, function(e) {
switch (e.label) {
case 0:
if (this.effectPrefab) return [ 3, 2 ];
t = this;
return [ 4, this.loadPrefabRes() ];

case 1:
t.effectPrefab = e.sent();
e.label = 2;

case 2:
if (!this.effectNode) {
this.effectNode = cc.instantiate(this.effectPrefab);
this.effectNode.setParent(hs.gameEffectLayer);
}
return [ 2, this.effectNode ];
}
});
});
};
t.prototype.loadPrefabRes = function() {
return n(this, void 0, void 0, function() {
return a(this, function() {
return [ 2, hs.ResLoader.asyncLoadByBundle(this.bundleName, this.getPrefabPath(), cc.Prefab) ];
});
});
};
return t;
}();
r.Arm2Player = o;
cc._RF.pop();
}, {} ],
Arm3Comp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "f04c6B1cYVNdKOOAavQXQVM", "Arm3Comp");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var a, o = arguments.length, i = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (o < 3 ? a(i) : o > 3 ? a(e, r, i) : a(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var i = cc._decorator, l = i.ccclass, c = i.property, s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.effect = null;
e._completeCallback = null;
return e;
}
e.prototype.onLoad = function() {
this.effect.on(dragonBones.EventObject.COMPLETE, this.onComplete, this);
};
e.prototype.onComplete = function() {
var t;
null === (t = this._completeCallback) || void 0 === t || t.call(this);
this._completeCallback = null;
this.node.destroy();
};
e.prototype.play = function(t) {
this._completeCallback = t;
var e = cc.director._kSpeed || 1;
this.effect.timeScale = 1 / e;
this.effect.playAnimation("all_clear", 1);
};
o([ c(dragonBones.ArmatureDisplay) ], e.prototype, "effect", void 0);
return o([ l ], e);
}(hs.Component);
r.default = s;
cc._RF.pop();
}, {} ],
Arm3Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "7ac6cm/X45KuYSleaxHKHn0", "Arm3Player");
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm3Player = void 0;
var n = t("../comp/Arm3Comp"), a = function() {
function t() {
this.armId = "3";
this.armName = "加强清屏效果(NewClearAllEffect)";
this.bundleName = "SlotClearEffetsTrait";
this.soundPath = "audio/arm3_lightning";
}
t.prototype.getPrefabPath = function() {
return "prefabs/arm3_clearall";
};
t.prototype.preload = function() {
hs.ResLoader.loadByBundle(this.bundleName, this.soundPath, cc.AudioClip, function() {});
hs.ResLoader.loadByBundle(this.bundleName, this.getPrefabPath(), cc.Prefab, function() {});
};
t.prototype.play = function(t) {
var e = this, r = t.completeCallback, a = hs.gameEffectLayer, o = Cinst(hs.Board);
cc.isValid(a) && cc.tween(a).delay(.4).call(function() {
e.playEffect();
}).delay(.3).call(function() {
hs.ResLoader.asyncLoadByBundle(e.bundleName, e.getPrefabPath(), cc.Prefab).then(function(t) {
if (t) {
var e = cc.instantiate(t);
a.addChild(e);
if (o) {
var i = o.node.parent.convertToWorldSpaceAR(cc.v2(0, 0)), l = hs.gameEffectLayer.convertToNodeSpaceAR(i);
e.setPosition(l);
}
var c = e.getComponent(n.default);
c && c.play(function() {
null == r || r();
});
}
}).catch(function() {});
}).start();
};
t.prototype.stop = function() {};
t.prototype.playEffect = function() {
hs.audioInfoData.audioSwitch && hs.ResLoader.asyncLoadByBundle(this.bundleName, this.soundPath, cc.AudioClip).then(function(t) {
t && cc.audioEngine.play(t, !1, 1);
}).catch(function() {});
};
return t;
}();
r.Arm3Player = a;
cc._RF.pop();
}, {
"../comp/Arm3Comp": "Arm3Comp"
} ],
Arm4Comp: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "463a16UiRVNmJ2wysJsui51", "Arm4Comp");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var a, o = arguments.length, i = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (o < 3 ? a(i) : o > 3 ? a(e, r, i) : a(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var i = cc._decorator, l = i.ccclass, c = i.property, s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.armatureDisplay = null;
e._completeCallback = null;
return e;
}
e.prototype.onLoad = function() {
var t = this;
this.node.opacity = 0;
this.armatureDisplay.on(dragonBones.EventObject.COMPLETE, function() {
var e;
t.node.opacity = 0;
null === (e = t._completeCallback) || void 0 === e || e.call(t);
t._completeCallback = null;
}, this);
};
e.prototype.playAnimation = function(t, e) {
this._completeCallback = e;
this.node.opacity = 255;
this.armatureDisplay.playAnimation(t, 1);
};
e.prototype.onDestroy = function() {
this.armatureDisplay.off(dragonBones.EventObject.COMPLETE, null, this);
};
o([ c(dragonBones.ArmatureDisplay) ], e.prototype, "armatureDisplay", void 0);
return o([ l ], e);
}(hs.Component);
r.default = s;
cc._RF.pop();
}, {} ],
Arm4Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "d1490GkFXFFzpMnh9bC7+YY", "Arm4Player");
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm4Player = void 0;
var n = t("../comp/Arm4Comp"), a = function() {
function t() {
this.armId = "4";
this.armName = "波纹型清屏效果(WaveClearBoardEffect)";
this.isResLoadedPrefab = null;
this.effectNodeName = "WaveClearBoardEffectNode";
this.bundleName = "SlotClearEffetsTrait";
}
t.prototype.getPrefabPath = function() {
return "prefabs/arm4_wave";
};
t.prototype.preload = function() {
var t = this;
this.isResLoadedPrefab || hs.ResLoader.loadByBundle(this.bundleName, this.getPrefabPath(), cc.Prefab, function(e, r) {
e || (t.isResLoadedPrefab = r);
});
};
t.prototype.play = function(t) {
var e = this, r = t.completeCallback, n = t.isShowCombo;
if (this.isResLoadedPrefab) {
var a = hs.gameEffectLayer;
if (a && cc.isValid(a)) {
var o = a.getChildByName(this.effectNodeName);
if (!cc.isValid(o)) {
(o = cc.instantiate(this.isResLoadedPrefab)).name = this.effectNodeName;
a.addChild(o);
var i = this.getBoardGridCenterPosition(a);
if (!i) {
null == r || r();
return;
}
o.setPosition(i);
}
if (cc.isValid(o)) {
var l = n ? 1.1 : .6;
cc.tween(a).delay(l).call(function() {
e.showEffect(r);
}).start();
} else null == r || r();
} else null == r || r();
} else {
null == r || r();
this.preload();
}
};
t.prototype.stop = function() {
var t = hs.gameEffectLayer;
if (t && cc.isValid(t)) {
var e = t.getChildByName(this.effectNodeName);
e && cc.isValid(e) && e.destroy();
}
};
t.prototype.showEffect = function(t) {
var e = hs.gameEffectLayer;
if (e && cc.isValid(e)) {
var r = e.getChildByName(this.effectNodeName);
if (cc.isValid(r)) {
r.scale = 2;
var a = r.getComponent(n.default);
a ? a.playAnimation("in", function() {
null == t || t();
}) : null == t || t();
} else null == t || t();
} else null == t || t();
};
t.prototype.getBoardGridCenterPosition = function(t) {
var e = Cinst(hs.Board);
if (!e || !cc.isValid(e.boardGrid)) return null;
var r = cc.v2(0, 0), n = e.boardGrid.convertToWorldSpaceAR(r), a = t.convertToNodeSpaceAR(n);
return cc.v2(a.x, a.y - 124);
};
return t;
}();
r.Arm4Player = a;
cc._RF.pop();
}, {
"../comp/Arm4Comp": "Arm4Comp"
} ],
Arm5Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "9952cxvRBBIlKMAXfmbJi9V", "Arm5Player");
var n = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(a, o) {
function i(t) {
try {
c(n.next(t));
} catch (t) {
o(t);
}
}
function l(t) {
try {
c(n.throw(t));
} catch (t) {
o(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, l);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, n, a, o, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return o = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(o) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, o[1])).done) return a;
(n = 0, a) && (o = [ 2 & o[0], a.value ]);
switch (o[0]) {
case 0:
case 1:
a = o;
break;

case 4:
i.label++;
return {
value: o[1],
done: !1
};

case 5:
i.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(a = i.trys, a = a.length > 0 && a[a.length - 1]) && (6 === o[0] || 2 === o[0])) {
i = 0;
continue;
}
if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
i.label = o[1];
break;
}
if (6 === o[0] && i.label < a[1]) {
i.label = a[1];
a = o;
break;
}
if (a && i.label < a[2]) {
i.label = a[2];
i.ops.push(o);
break;
}
a[2] && i.ops.pop();
i.trys.pop();
continue;
}
o = e.call(t, i);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
r = a = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm5Player = void 0;
var o = function() {
function t() {
this.armId = "5";
this.armName = "清盘和combo和well done动效强化(ClearComboAnim)";
this.clearNd = null;
this.numNd = null;
}
t.prototype.preload = function() {};
t.prototype.play = function(t) {
var e = t.screenScore, r = t.completeCallback, n = e || 0;
this.playClear(n, r);
};
t.prototype.stop = function() {
this.removeNodes();
};
t.prototype.playClear = function(t, e) {
void 0 === t && (t = 0);
void 0 === e && (e = null);
return n(this, void 0, void 0, function() {
var r = this;
return a(this, function() {
cc.tween(hs.gameUiLayer).delay(.4).call(function() {
var n = Cinst(hs.Board);
if (cc.isValid(n) && cc.isValid(n.node)) {
var a, o = hs.dragonbonesAnim.play(n.node.parent, {
armatureName: "Armature",
animationName: "in",
playTimes: 1,
completeRemove: !0
}, hs.MainDragonBonesConfig.clearComboAnim);
if (o) {
o.scale = 2;
o.x = 0;
o.y = 0;
r.clearNd = o;
e && o.getComponent(dragonBones.ArmatureDisplay).once(dragonBones.EventObject.COMPLETE, function() {
e("UP_DOWN");
});
}
if (t > 0) {
a = cc.view.getVisibleSize().height / 6;
r.showNum(n.node.y, t);
} else a = n.node.y;
r.playExcellent(a);
hs.audioInfo.play(hs.MainTraitAudioConfig.clearComboAnim);
}
}).start();
return [ 2 ];
});
});
};
t.prototype.showNum = function(t, e) {
return n(this, void 0, void 0, function() {
var r, n, o, i, l = this;
return a(this, function(a) {
switch (a.label) {
case 0:
if (cc.isValid(this.numNd)) return [ 3, 2 ];
(r = new cc.Node()).x = cc.view.getVisibleSize().width / 2;
r.y = cc.view.getVisibleSize().height / 2 + t;
this.numNd = r;
return [ 4, hs.ResLoader.asyncLoadByBundle("mainTraits", "fonts/boardEffect/clearComboAnim/gameplay_num_allClear", cc.Font) ];

case 1:
n = a.sent();
(o = r.addComponent(cc.Label)).font = n;
o.lineHeight = 90;
o.fontSize = 50;
a.label = 2;

case 2:
cc.Tween.stopAllByTarget(this.numNd);
this.numNd.parent = hs.gameUiLayer;
this.numNd.opacity = 0;
this.numNd.scale = .1;
i = this.numNd.getComponent(cc.Label);
if (!cc.isValid(i)) return [ 2 ];
i.string = "+" + e;
cc.tween(this.numNd).to(.4, {
opacity: 255,
scale: 1
}, {
easing: cc.easing.backOut
}).delay(.6).to(.1, {
opacity: 0
}, {
easing: cc.easing.sineOut
}).call(function() {
l.numNd.removeFromParent();
}).start();
return [ 2 ];
}
});
});
};
t.prototype.playExcellent = function(t) {
return n(this, void 0, void 0, function() {
var e, r, n;
return a(this, function(a) {
switch (a.label) {
case 0:
return [ 4, hs.UI.show(hs.PrefabConfig.Encourage) ];

case 1:
(e = a.sent()).x = cc.view.getVisibleSize().width / 2;
e.y = t + cc.view.getVisibleSize().height / 2;
r = e.getComponent("Encourage");
n = {
type: hs.EncourageType.LEVEL_COLOR,
eliminateCount: 4,
color: 7
};
r.setState(n);
return [ 2 ];
}
});
});
};
t.prototype.removeNodes = function() {
cc.isValid(this.clearNd) && this.clearNd.removeFromParent();
this.clearNd = null;
cc.isValid(this.numNd) && this.numNd.removeFromParent();
};
return t;
}();
r.Arm5Player = o;
cc._RF.pop();
}, {} ],
Arm6Player: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8e7fah8Rt9FPZKNLK25WWYz", "Arm6Player");
var n = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(a, o) {
function i(t) {
try {
c(n.next(t));
} catch (t) {
o(t);
}
}
function l(t) {
try {
c(n.throw(t));
} catch (t) {
o(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, l);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, n, a, o, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return o = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(o) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, o[1])).done) return a;
(n = 0, a) && (o = [ 2 & o[0], a.value ]);
switch (o[0]) {
case 0:
case 1:
a = o;
break;

case 4:
i.label++;
return {
value: o[1],
done: !1
};

case 5:
i.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(a = i.trys, a = a.length > 0 && a[a.length - 1]) && (6 === o[0] || 2 === o[0])) {
i = 0;
continue;
}
if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
i.label = o[1];
break;
}
if (6 === o[0] && i.label < a[1]) {
i.label = a[1];
a = o;
break;
}
if (a && i.label < a[2]) {
i.label = a[2];
i.ops.push(o);
break;
}
a[2] && i.ops.pop();
i.trys.pop();
continue;
}
o = e.call(t, i);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
r = a = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm6Player = void 0;
var o = function() {
function t() {
this.armId = "6";
this.armName = "清盘动画方块爆发涌现(Featclearscreenbomb)";
this.aniUI = null;
this.completeCb = null;
this.bundleName = "SlotClearEffetsTrait";
}
t.prototype.getPrefabPath = function() {
return "prefabs/arm6_clearScreenBomb";
};
t.prototype.preload = function() {
hs.ResLoader.loadByBundle(this.bundleName, this.getPrefabPath(), cc.Prefab, function() {});
};
t.prototype.play = function(t) {
var e = t.screenScore, r = t.startPos, n = t.endPos, a = t.completeCallback, o = e || 0, i = hs.gameEffectLayer, l = r || cc.v2(0, 0), c = n || cc.v2(0, 0);
this.showAnim(i, o, l, c, function() {
null == a || a();
});
};
t.prototype.stop = function() {
if (this.aniUI && cc.isValid(this.aniUI)) {
this.aniUI.removeFromParent();
this.aniUI.destroy();
this.aniUI = null;
}
this.completeCb = null;
};
t.prototype.showAnim = function(t, e, r, o, i) {
return n(this, void 0, void 0, function() {
var n, l, c, s, u, f, p, h = this;
return a(this, function(a) {
switch (a.label) {
case 0:
return [ 4, hs.nextFrame() ];

case 1:
a.sent();
if (!t || !cc.isValid(t)) {
null == i || i();
return [ 2 ];
}
l = this.getPrefabPath();
if (n = hs.ResLoader.getAsset(this.bundleName + "_" + l)) return [ 3, 5 ];
a.label = 2;

case 2:
a.trys.push([ 2, 4, , 5 ]);
return [ 4, new Promise(function(t, e) {
hs.ResLoader.loadByBundle(h.bundleName, l, cc.Prefab, function(r, n) {
r ? e(r) : t(n);
});
}) ];

case 3:
n = a.sent();
return [ 3, 5 ];

case 4:
a.sent();
null == i || i();
return [ 2 ];

case 5:
if (!cc.isValid(n)) {
null == i || i();
return [ 2 ];
}
if (!t || !cc.isValid(t)) {
null == i || i();
return [ 2 ];
}
c = cc.instantiate(n);
t.addChild(c);
c.setPosition(r);
this.aniUI = c;
this.completeCb = i;
s = cc.director._kSpeed || 1;
if (u = c.getComponentInChildren(dragonBones.ArmatureDisplay)) {
u.timeScale = 1 / s;
u.playAnimation(e <= 0 ? "in" : "in_word", 1);
}
f = c.getComponentInChildren(cc.Label);
p = f.node.parent.convertToNodeSpaceAR(o);
if (hs.gameInfo.gameMode == hs.GameMode.Class && f && e > 0) {
f.node.opacity = 0;
f.string = "" + e;
cc.tween(f.node).delay(.16 * s).to(.1 * s, {
opacity: 255,
scale: 1.2
}).to(.2 * s, {
scale: 1
}).delay(.34 * s).to(.6 * s, {
scale: 1.4,
y: 150
}).start();
cc.tween(f.node).delay(1.3 * s).to(.16 * s, {
opacity: 0
}).delay(.1).call(function() {
f.node.y = p.y + 120;
f.node.scale = 1.2;
}).to(.1 * s, {
scale: 1.4,
opacity: 255
}).to(.17 * s, {
scale: 1
}).delay(.2 * s).to(.17 * s, {
scale: 1.2
}).to(.17 * s, {
scale: 1,
opacity: 0,
y: p.y
}).call(function() {
null == i || i();
c.destroy();
}).start();
} else cc.tween(c).delay(3.3).call(function() {
null == i || i();
c.destroy();
h.aniUI = null;
h.completeCb = null;
}).start();
return [ 2 ];
}
});
});
};
return t;
}();
r.Arm6Player = o;
cc._RF.pop();
}, {} ],
IArmPlayer: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "088794lE3lOu6PIsin8eiEP", "IArmPlayer");
Object.defineProperty(r, "__esModule", {
value: !0
});
cc._RF.pop();
}, {} ],
SlotClearEffetsOptimizationArmPlayers: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "b8e4dHyOnxOm41fLGqeG08D", "SlotClearEffetsOptimizationArmPlayers");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(a, o) {
function i(t) {
try {
c(n.next(t));
} catch (t) {
o(t);
}
}
function l(t) {
try {
c(n.throw(t));
} catch (t) {
o(t);
}
}
function c(t) {
t.done ? a(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, l);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, i = this && this.__generator || function(t, e) {
var r, n, a, o, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return o = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(o) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (a = 2 & o[0] ? n.return : o[0] ? n.throw || ((a = n.return) && a.call(n), 
0) : n.next) && !(a = a.call(n, o[1])).done) return a;
(n = 0, a) && (o = [ 2 & o[0], a.value ]);
switch (o[0]) {
case 0:
case 1:
a = o;
break;

case 4:
i.label++;
return {
value: o[1],
done: !1
};

case 5:
i.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(a = i.trys, a = a.length > 0 && a[a.length - 1]) && (6 === o[0] || 2 === o[0])) {
i = 0;
continue;
}
if (3 === o[0] && (!a || o[1] > a[0] && o[1] < a[3])) {
i.label = o[1];
break;
}
if (6 === o[0] && i.label < a[1]) {
i.label = a[1];
a = o;
break;
}
if (a && i.label < a[2]) {
i.label = a[2];
i.ops.push(o);
break;
}
a[2] && i.ops.pop();
i.trys.pop();
continue;
}
o = e.call(t, i);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
r = a = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Arm6_isOptimization_Player = r.Arm4_isOptimization_Player = r.Arm3_isOptimization_Player = r.Arm2_isOptimization_Player = void 0;
var l = t("./Arm2Player"), c = t("./Arm3Player"), s = t("./Arm4Player"), u = t("./Arm6Player"), f = "prefabs/arm2_effectAllClearPlus", p = "prefabs/arm3_clearall", h = "prefabs/arm4_wave", d = "prefabs/arm6_clearScreenBomb", m = "SlotClearEffetsTrait";
function y(t, e, r) {
return o(this, void 0, Promise, function() {
return i(this, function(n) {
switch (n.label) {
case 0:
return t ? [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(m, e, {
type: cc.Prefab
}) ] : [ 2, e ];

case 1:
return n.sent() ? [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(m, r, {
type: cc.Prefab
}) ] : [ 2, r ];

case 2:
return [ 2, n.sent() ? r : e ];
}
});
});
}
var b = function(t) {
a(e, t);
function e(e) {
var r = t.call(this) || this;
r._prefabUrl = f;
r._isOptimization = e;
return r;
}
e.prototype.getPrefabPath = function() {
return this._prefabUrl;
};
e.prototype.preload = function() {
this.effectPrefab || this.preloadWithOptimization();
};
e.prototype.preloadWithOptimization = function() {
return o(this, void 0, Promise, function() {
var e;
return i(this, function(r) {
switch (r.label) {
case 0:
e = this;
return [ 4, y(this._isOptimization, f, "prefabs/arm2_effectAllClearPlus_new") ];

case 1:
e._prefabUrl = r.sent();
t.prototype.preload.call(this);
return [ 2 ];
}
});
});
};
return e;
}(l.Arm2Player);
r.Arm2_isOptimization_Player = b;
var _ = function(t) {
a(e, t);
function e(e) {
var r = t.call(this) || this;
r._prefabUrl = p;
r._isOptimization = e;
return r;
}
e.prototype.getPrefabPath = function() {
return this._prefabUrl;
};
e.prototype.preload = function() {
this.preloadWithOptimization();
};
e.prototype.preloadWithOptimization = function() {
return o(this, void 0, Promise, function() {
var e;
return i(this, function(r) {
switch (r.label) {
case 0:
e = this;
return [ 4, y(this._isOptimization, p, "prefabs/arm3_clearall_new") ];

case 1:
e._prefabUrl = r.sent();
t.prototype.preload.call(this);
return [ 2 ];
}
});
});
};
return e;
}(c.Arm3Player);
r.Arm3_isOptimization_Player = _;
var v = function(t) {
a(e, t);
function e(e) {
var r = t.call(this) || this;
r._prefabUrl = h;
r._isOptimization = e;
return r;
}
e.prototype.getPrefabPath = function() {
return this._prefabUrl;
};
e.prototype.preload = function() {
this.isResLoadedPrefab || this.preloadWithOptimization();
};
e.prototype.preloadWithOptimization = function() {
return o(this, void 0, Promise, function() {
var e;
return i(this, function(r) {
switch (r.label) {
case 0:
e = this;
return [ 4, y(this._isOptimization, h, "prefabs/arm4_wave_new") ];

case 1:
e._prefabUrl = r.sent();
t.prototype.preload.call(this);
return [ 2 ];
}
});
});
};
return e;
}(s.Arm4Player);
r.Arm4_isOptimization_Player = v;
var P = function(t) {
a(e, t);
function e(e) {
var r = t.call(this) || this;
r._prefabUrl = d;
r._isOptimization = e;
return r;
}
e.prototype.getPrefabPath = function() {
return this._prefabUrl;
};
e.prototype.preload = function() {
this.preloadWithOptimization();
};
e.prototype.preloadWithOptimization = function() {
return o(this, void 0, Promise, function() {
var e;
return i(this, function(r) {
switch (r.label) {
case 0:
e = this;
return [ 4, y(this._isOptimization, d, "prefabs/arm6_clearScreenBomb_new") ];

case 1:
e._prefabUrl = r.sent();
t.prototype.preload.call(this);
return [ 2 ];
}
});
});
};
return e;
}(u.Arm6Player);
r.Arm6_isOptimization_Player = P;
cc._RF.pop();
}, {
"./Arm2Player": "Arm2Player",
"./Arm3Player": "Arm3Player",
"./Arm4Player": "Arm4Player",
"./Arm6Player": "Arm6Player"
} ],
SlotClearEffetsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "16c0aoeW/dLR4LyPFyB/42E", "SlotClearEffetsTrait");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var a, o = arguments.length, i = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (o < 3 ? a(i) : o > 3 ? a(e, r, i) : a(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.SlotClearEffetsTrait = void 0;
var i = t("./arms/Arm1Player"), l = t("./arms/Arm2Player"), c = t("./arms/Arm3Player"), s = t("./arms/Arm4Player"), u = t("./arms/Arm5Player"), f = t("./arms/Arm6Player"), p = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._mabData = {};
e._color = 0;
e._armPlayers = new Map();
e._isPlayEffect = !1;
e._pendingSplashCompleteCallback = null;
e._pendingSplashCompleteId = 0;
return e;
}
e.prototype.onCreate = function() {
this.initArmPlayers();
};
e.prototype.initArmPlayers = function() {
this._armPlayers.set("1", new i.Arm1Player());
this._armPlayers.set("2", new l.Arm2Player());
this._armPlayers.set("3", new c.Arm3Player());
this._armPlayers.set("4", new s.Arm4Player());
this._armPlayers.set("5", new u.Arm5Player());
this._armPlayers.set("6", new f.Arm6Player());
};
e.prototype.onActive = function(t) {
var e, r, n = this;
hs.tp.isClassGame_ProxyOnClassGameStart(t) && this.report();
hs.tp.isClassGame_ProxyNewGameInit(t) && this.loadJson();
if (hs.tp.isClassBoardSplashAnimation_ProxySetBoardSplashAnimationState(t)) {
this._isPlayEffect = !1;
this._pendingSplashCompleteCallback = null === (e = t.args) || void 0 === e ? void 0 : e[3];
var a = ++this._pendingSplashCompleteId;
this.playEffectByArm(t, hs.classScoreInfo.scoreGroup.screenScore, this.notifySplashCompleteCallback.bind(this, a)) && (this._isPlayEffect = !0);
if (!(null === (r = this.props) || void 0 === r ? void 0 : r.isFix)) {
t.replace = !0;
t.returnState = !0;
}
setTimeoutSafe(function() {
n.notifySplashCompleteCallback(a);
}, 2e3);
}
hs.tp.isClassGame_GameInfoUpdate_ProxyOnDataCleared(t) && this.setEndTime();
hs.tp.isClassBoardSplashAnimation_ProxyOnShowClearScreen(t) && (this._color = t.args[0].state.color);
};
e.prototype.loadJson = function() {
var t = this, e = "https://ucw.afafb.com/bbios/multi_armed_bandit/" + this.props.jsonName + ".json?_t=" + Date.now();
hs.ResLoader.load(e, cc.JsonAsset, function(e, r) {
if (e) ; else if (null == r ? void 0 : r.json) {
var n = r.json;
t.updateMabData(n);
cc.assetManager.releaseAsset(r);
}
});
};
e.prototype.playEffectByArm = function(t, e, r, n) {
var a, o = this, i = this.getClearArmId();
this.setReport();
if (!i) {
null == r || r();
this.delayNotifyClearAnimationComplete();
return !1;
}
var l = this._armPlayers.get(i);
if (!l) {
null == r || r();
this.delayNotifyClearAnimationComplete();
return !1;
}
if (null === (a = this.props) || void 0 === a ? void 0 : a.isFix) {
t.replace = !0;
t.returnState = !0;
}
var c = Cinst(hs.Board), s = {
screenScore: e || 0,
color: this._color,
completeCallback: function() {
null == r || r();
o.notifyClearAnimationComplete();
},
isShowCombo: n,
parentNode: hs.gameEffectLayer,
boardComp: c,
startPos: this.getStartPos(),
endPos: this.getEndPos()
};
l.play(s);
return !0;
};
e.prototype.getStartPos = function() {
var t = Cinst(hs.Board);
if (t && cc.isValid(t.node)) {
var e = hs.gameEffectLayer;
if (e && cc.isValid(e)) return e.convertToNodeSpaceAR(t.node.parent.convertToWorldSpaceAR(t.node.getPosition()));
}
return cc.v2(0, 0);
};
e.prototype.getEndPos = function() {
var t = hs.gameEffectLayer;
if (t && cc.isValid(t)) {
var e = t.getContentSize();
return cc.v2(e.width / 2 + 120, .8 * e.height);
}
return cc.v2(0, 0);
};
e.prototype.setReport = function() {
var t = this.getData();
t.canReport = !0;
this.saveData(t);
};
e.prototype.setEndTime = function() {
var t = this.getData();
t.endTime = Date.now();
this.saveData(t);
};
e.prototype.report = function() {
var t = this.getData();
if (!t.mab_id) return null;
if (t.canReport) {
var e = Date.now() - (null == t ? void 0 : t.endTime) > 18e5;
DS("game_classic_multi_armed_bandit_success", {
mab_id: this._mabData.mab_id,
arm_id: this._mabData.armId,
result: e ? 0 : 1
});
t.canReport = !1;
this.saveData(t);
}
};
e.prototype.getClearArmId = function() {
var t = this.getData();
return t.mab_id ? t.armId : null;
};
e.prototype.updateMabData = function(t) {
this._mabData.mab_id = t.mab_id;
this._mabData.c_info = t.c_info;
this._mabData.isInit = !!t.init;
this._mabData.loadTime = Date.now();
this._mabData.canReport = !1;
this._mabData.isInit;
var e = this.getRandomArmId();
e || (e = "1");
this._mabData.armId = e;
this.saveData(this._mabData);
this.preloadArmResources(e);
};
e.prototype.preloadArmResources = function(t) {
var e = this._armPlayers.get(t);
e && e.preload();
};
e.prototype.saveData = function(t) {
hs.storage.setItem("slotClearEffetsData", t);
};
e.prototype.getData = function() {
return hs.storage.getItem("slotClearEffetsData", {});
};
e.prototype.delayNotifyClearAnimationComplete = function() {
var t = this;
setTimeoutSafe(function() {
t.notifyClearAnimationComplete();
}, 300);
};
e.prototype.notifyClearAnimationComplete = function() {
try {
var t = TRAIT("ClearShowMarketingBoardTrait");
if (t && t.active) {
var e = t;
"function" == typeof e.onSlotClearEffectComplete && e.onSlotClearEffectComplete();
}
} catch (t) {}
};
e.prototype.getRandomArmId = function() {
var t;
if (0 === (t = this._mabData.c_info && Array.isArray(this._mabData.c_info) && !this._mabData.isInit ? this._mabData.c_info : [ {
arm_id: "1",
ratio: 100 / 6
}, {
arm_id: "2",
ratio: 100 / 6
}, {
arm_id: "3",
ratio: 100 / 6
}, {
arm_id: "4",
ratio: 100 / 6
}, {
arm_id: "5",
ratio: 100 / 6
}, {
arm_id: "6",
ratio: 100 / 6
} ]).length) return null;
for (var e = 0, r = 0; r < t.length; r++) (i = Number(t[r].ratio) || 0) > 0 && (e += i);
if (e <= 0) return null;
var n = Math.random() * e, a = 0;
for (r = 0; r < t.length; r++) {
var o = t[r];
if ((i = Number(o.ratio) || 0) > 0 && n <= (a += i)) return o.arm_id;
}
for (r = 0; r < t.length; r++) {
var i;
o = t[r];
if ((i = Number(o.ratio) || 0) > 0) return o.arm_id;
}
return null;
};
e.prototype.notifySplashCompleteCallback = function(t) {
if (t === this._pendingSplashCompleteId && this._pendingSplashCompleteCallback) {
var e = this._pendingSplashCompleteCallback;
this._pendingSplashCompleteCallback = null;
null == e || e();
}
};
return o([ classId("SlotClearEffetsTrait"), classMethodWatch() ], e);
}(Trait);
r.SlotClearEffetsTrait = p;
cc._RF.pop();
}, {
"./arms/Arm1Player": "Arm1Player",
"./arms/Arm2Player": "Arm2Player",
"./arms/Arm3Player": "Arm3Player",
"./arms/Arm4Player": "Arm4Player",
"./arms/Arm5Player": "Arm5Player",
"./arms/Arm6Player": "Arm6Player"
} ],
SlotClearEffets_isOptimization_Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "a7f3cLRjktPap0sG156P5wE", "SlotClearEffets_isOptimization_Trait");
var n, a = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var a, o = arguments.length, i = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (o < 3 ? a(i) : o > 3 ? a(e, r, i) : a(e, r)) || i);
return o > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.SlotClearEffets_isOptimization_Trait = void 0;
var i = t("./arms/Arm1Player"), l = t("./arms/Arm5Player"), c = t("./arms/SlotClearEffetsOptimizationArmPlayers"), s = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.getIsOptimization = function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.isOptimization) && void 0 !== e && e;
};
e.prototype.initArmPlayers = function() {
var t = this.getIsOptimization();
this._armPlayers.set("1", new i.Arm1Player());
this._armPlayers.set("2", new c.Arm2_isOptimization_Player(t));
this._armPlayers.set("3", new c.Arm3_isOptimization_Player(t));
this._armPlayers.set("4", new c.Arm4_isOptimization_Player(t));
this._armPlayers.set("5", new l.Arm5Player());
this._armPlayers.set("6", new c.Arm6_isOptimization_Player(t));
};
return o([ classId("SlotClearEffetsTrait", "isOptimization") ], e);
}(t("./SlotClearEffetsTrait").SlotClearEffetsTrait);
r.SlotClearEffets_isOptimization_Trait = s;
cc._RF.pop();
}, {
"./SlotClearEffetsTrait": "SlotClearEffetsTrait",
"./arms/Arm1Player": "Arm1Player",
"./arms/Arm5Player": "Arm5Player",
"./arms/SlotClearEffetsOptimizationArmPlayers": "SlotClearEffetsOptimizationArmPlayers"
} ]
}, {}, [ "SlotClearEffetsTrait", "SlotClearEffets_isOptimization_Trait", "Arm1Player", "Arm2Player", "Arm3Player", "Arm4Player", "Arm5Player", "Arm6Player", "SlotClearEffetsOptimizationArmPlayers", "Arm1Comp", "Arm3Comp", "Arm4Comp", "IArmPlayer" ]);
//# sourceMappingURL=index.js.map
