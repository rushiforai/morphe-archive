window.__require = function t(e, n, o) {
function i(a, c) {
if (!n[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var p = "function" == typeof __require && __require;
if (!c && p) return p(s, !0);
if (r) return r(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var l = n[a] = {
exports: {}
};
e[a][0].call(l.exports, function(t) {
return i(e[a][1][t] || t);
}, l, l.exports, t, e, n, o);
}
return n[a].exports;
}
for (var r = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
$1097_f_OptimizeBlockDownAnimationTrait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "9ccf4Kdny1Omod/k/ahp37W", "$1097_f_OptimizeBlockDownAnimationTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), r = this && this.__decorate || function(t, e, n, o) {
var i, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (r < 3 ? i(a) : r > 3 ? i(e, n, a) : i(e, n)) || a);
return r > 3 && a && Object.defineProperty(e, n, a), a;
}, a = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, n = e && t[e], o = 0;
if (n) return n.call(t);
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
Object.defineProperty(n, "__esModule", {
value: !0
});
n.$1097_f_OptimizeBlockDownAnimationTrait = void 0;
var c = t("./DropItem"), s = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._pool = new cc.NodePool();
e._prefab = null;
e._itemContainer = null;
e._preContinuousEliminateTimes = 0;
e.PREFAB_URL = "prefabs/DropItem";
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "Eliminate_Effects_Proxy",
methodName: "touchOnMoveCanSnap"
} ];
};
e.prototype.onActive = function(t) {
var e = this;
if (hs.gameInfo.gameType === hs.GameType.Class || this.props && !0 === this.props.chapterEnabled) {
if (hs.tp.isEliminate_Effects_ProxyTouchOnMoveCanSnap(t)) {
var n = t.args[0];
this._preContinuousEliminateTimes = n.continuousEliminateTimes;
}
if (hs.tp.isEliminate_Effects_ProxyPlayColumnEliminateEffect(t) || hs.tp.isEliminate_Effects_ProxyPlayRowEliminateEffect(t)) {
if (this.isTrigger()) return;
var o = t.args[0];
if (o && o.state && o.state.canEliminate) {
this._prefab ? this.playDropAnimation(o.state) : this.loadPrefab(function() {
e.playDropAnimation(o.state);
});
t.replace = !0;
t.returnState = !0;
}
}
}
};
e.prototype.isTrigger = function() {
return !1;
};
e.prototype.loadPrefab = function(t) {
var e = this;
hs.ResLoader.loadByBundle("$1097_f_OptimizeBlockDownAnimationTrait", this.PREFAB_URL, cc.Prefab, function(n, o) {
if (n) ; else {
e._prefab = o;
t(o);
}
});
};
e.prototype.playDropAnimation = function(t) {
var e = this, n = t.putEliminatesInfo, o = t.color, i = t.eliminateRows, r = t.eliminateCols;
this.createContainer();
var a = this.excludeRepeatPoints(n), c = this.checkIsRainbow(i, r, this._preContinuousEliminateTimes);
a.forEach(function(t) {
var n = t.row, i = t.col, a = t.node;
e.spawnDropItem(n, i, r, o, a, c);
});
};
e.prototype.checkIsRainbow = function(t, e, n) {
var o = !1, i = TRAIT("$32523_f_ColorClearPreviewTrait");
if (i && i.active && i.checkIsOpen()) {
var r = Object.keys(t).length + Object.keys(e).length;
o = i.checkCanShowPreview(r, n);
}
return o;
};
e.prototype.excludeRepeatPoints = function(t) {
var e, n, o = new Set(), i = [];
try {
for (var r = a(t), c = r.next(); !c.done; c = r.next()) {
var s = c.value, p = s.row + "-" + s.col;
if (!o.has(p)) {
o.add(p);
i.push(s);
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
c && !c.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
return i;
};
e.prototype.createContainer = function() {
var t = hs.eliminateLayerInfo.getEliminateParentNode();
if (t) {
var e = t.getChildByName("DropAniContainer");
e || (e = new cc.Node("DropAniContainer"));
e.setParent(t);
e.setPosition(0, 0);
this._itemContainer = e;
}
};
e.prototype.spawnDropItem = function(t, e, n, o, i, r) {
var a = this;
if (this._itemContainer) {
var s = this._pool.get();
s || (s = cc.instantiate(this._prefab));
s.setParent(this._itemContainer);
var p = i.convertToWorldSpaceAR(cc.v2(0, 0)), l = this._itemContainer.convertToNodeSpaceAR(p);
s.setPosition(l);
var u = s.getComponent(c.default);
if (u) {
if (r) {
var f = null != e ? e : 0;
n[e] && (f = t);
u.setRainbowTexture(f);
} else u.loadBlockSprite(o);
u.playRandomAni(function() {
a.recycleNode(s);
if (a._itemContainer && 0 === a._itemContainer.childrenCount) {
a._itemContainer.destroy();
a._itemContainer.parent && a._itemContainer.parent.removeChild(a._itemContainer);
a._itemContainer = null;
}
});
}
}
};
e.prototype.recycleNode = function(t) {
this._pool.put(t);
t.parent && t.parent.removeChild(t);
};
return r([ classId("$1097_f_OptimizeBlockDownAnimationTrait"), classMethodWatch() ], e);
}(Trait);
n.$1097_f_OptimizeBlockDownAnimationTrait = s;
cc._RF.pop();
}, {
"./DropItem": "DropItem"
} ],
$1097_f_OptimizeBlockDownAnimation_isOptimization_Trait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "7a3f6xqD1VK05FiKx8NbV4s", "$1097_f_OptimizeBlockDownAnimation_isOptimization_Trait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), r = this && this.__decorate || function(t, e, n, o) {
var i, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (r < 3 ? i(a) : r > 3 ? i(e, n, a) : i(e, n)) || a);
return r > 3 && a && Object.defineProperty(e, n, a), a;
}, a = this && this.__awaiter || function(t, e, n, o) {
return new (n || (n = Promise))(function(i, r) {
function a(t) {
try {
s(o.next(t));
} catch (t) {
r(t);
}
}
function c(t) {
try {
s(o.throw(t));
} catch (t) {
r(t);
}
}
function s(t) {
t.done ? i(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(a, c);
var e;
}
s((o = o.apply(t, e || [])).next());
});
}, c = this && this.__generator || function(t, e) {
var n, o, i, r, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return r = {
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
return this;
}), r;
function c(t) {
return function(e) {
return s([ t, e ]);
};
}
function s(r) {
if (n) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (n = 1, o && (i = 2 & r[0] ? o.return : r[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, r[1])).done) return i;
(o = 0, i) && (r = [ 2 & r[0], i.value ]);
switch (r[0]) {
case 0:
case 1:
i = r;
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
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!i || r[1] > i[0] && r[1] < i[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < i[1]) {
a.label = i[1];
i = r;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(r);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = e.call(t, a);
} catch (t) {
r = [ 6, t ];
o = 0;
} finally {
n = i = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.$1097_f_OptimizeBlockDownAnimation_isOptimization_Trait = void 0;
var s = t("./$1097_f_OptimizeBlockDownAnimationTrait"), p = "prefabs/DropItemOptimization", l = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.loadPrefab = function(t) {
var e = this;
this.getResUrl().then(function(n) {
hs.ResLoader.loadByBundle("$1097_f_OptimizeBlockDownAnimationTrait", n, cc.Prefab, function(n, o) {
if (n) ; else {
e._prefab = o;
t(o);
}
});
});
};
e.prototype.getResUrl = function() {
return a(this, void 0, void 0, function() {
return c(this, function(t) {
switch (t.label) {
case 0:
return [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(this.traitName, "prefabs/DropItem", {
type: cc.Prefab
}) ];

case 1:
return t.sent() ? [ 4, hs.ResLoader.asyncIsBundleAssetDownloaded(this.traitName, p, {
type: cc.Prefab
}) ] : [ 2, p ];

case 2:
return t.sent() ? [ 2, p ] : [ 2, "prefabs/DropItem" ];
}
});
});
};
return r([ classId("$1097_f_OptimizeBlockDownAnimationTrait", "isOptimization") ], e);
}(s.$1097_f_OptimizeBlockDownAnimationTrait);
n.$1097_f_OptimizeBlockDownAnimation_isOptimization_Trait = l;
cc._RF.pop();
}, {
"./$1097_f_OptimizeBlockDownAnimationTrait": "$1097_f_OptimizeBlockDownAnimationTrait"
} ],
DropItem: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "4abb4erH+VLqLb8ne5iwfy+", "DropItem");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), r = this && this.__decorate || function(t, e, n, o) {
var i, r = arguments.length, a = r < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (r < 3 ? i(a) : r > 3 ? i(e, n, a) : i(e, n)) || a);
return r > 3 && a && Object.defineProperty(e, n, a), a;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var a = cc._decorator, c = a.ccclass, s = a.property, p = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.blockNode = null;
e.dropAni = null;
e.rainbowSprite = null;
return e;
}
n = e;
e.prototype.setRainbowTexture = function(t) {
var e = this;
this.blockNode.active = !1;
this.rainbowSprite.node.active = !0;
cc.isValid(this.rainbowSprite.node) && hs.ResLoader.loadByBundle("Remote_32523_f_ColorClearPreview", "textures/gameplay_block_color_" + (t + 1), cc.SpriteFrame, function(t, n) {
t || n && (e.rainbowSprite.spriteFrame = n);
});
};
e.prototype.loadBlockSprite = function(t) {
this.blockNode.active = !0;
this.rainbowSprite.node.active = !1;
if (cc.isValid(this.blockNode)) {
var e = this.blockNode.getComponent(hs.Block);
e && e.setState({
color: t,
sourceColor: t
});
}
};
e.prototype.playRandomAni = function(t) {
if (cc.isValid(this.dropAni)) {
var e = "in" + this.getNextAniIndex();
this.dropAni.playAnimation(e, 1);
this.dropAni.once(dragonBones.EventObject.COMPLETE, function() {
t && t();
}, this);
}
};
e.prototype.getNextAniIndex = function() {
if (0 === n._aniQueue.length) {
for (var t = 1; t <= 8; t++) n._aniQueue.push(t);
n._aniQueue.sort(function() {
return Math.random() - .5;
});
if (-1 !== n._lastAniIndex && n._aniQueue[0] === n._lastAniIndex) {
var e = n._aniQueue.shift();
n._aniQueue.push(e);
}
}
var o = n._aniQueue.shift();
n._lastAniIndex = o;
return o;
};
var n;
e._aniQueue = [];
e._lastAniIndex = -1;
r([ s(cc.Node) ], e.prototype, "blockNode", void 0);
r([ s(dragonBones.ArmatureDisplay) ], e.prototype, "dropAni", void 0);
r([ s(cc.Sprite) ], e.prototype, "rainbowSprite", void 0);
return n = r([ c ], e);
}(hs.Component);
n.default = p;
cc._RF.pop();
}, {} ]
}, {}, [ "$1097_f_OptimizeBlockDownAnimationTrait", "$1097_f_OptimizeBlockDownAnimation_isOptimization_Trait", "DropItem" ]);
//# sourceMappingURL=index.js.map
