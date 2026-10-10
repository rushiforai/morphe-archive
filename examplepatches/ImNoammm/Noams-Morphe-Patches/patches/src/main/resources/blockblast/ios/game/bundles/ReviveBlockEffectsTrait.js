window.__require = function e(t, n, i) {
function o(r, c) {
if (!n[r]) {
if (!t[r]) {
var l = r.split("/");
l = l[l.length - 1];
if (!t[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = l;
}
var p = n[r] = {
exports: {}
};
t[r][0].call(p.exports, function(e) {
return o(t[r][1][e] || e);
}, p, p.exports, e, t, n, i);
}
return n[r].exports;
}
for (var a = "function" == typeof __require && __require, r = 0; r < i.length; r++) o(i[r]);
return o;
}({
ReviveBlockEffectsTrait: [ function(e, t, n) {
"use strict";
cc._RF.push(t, "88beba87qxD5bcl0SQDlsGs", "ReviveBlockEffectsTrait");
var i, o = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n]);
})(e, t);
}, function(e, t) {
i(e, t);
function n() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n());
}), a = this && this.__decorate || function(e, t, n, i) {
var o, a = arguments.length, r = a < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(e, t, n, i); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (r = (a < 3 ? o(r) : a > 3 ? o(t, n, r) : o(t, n)) || r);
return a > 3 && r && Object.defineProperty(t, n, r), r;
}, r = this && this.__awaiter || function(e, t, n, i) {
return new (n || (n = Promise))(function(o, a) {
function r(e) {
try {
l(i.next(e));
} catch (e) {
a(e);
}
}
function c(e) {
try {
l(i.throw(e));
} catch (e) {
a(e);
}
}
function l(e) {
e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n(function(e) {
e(t);
})).then(r, c);
var t;
}
l((i = i.apply(e, t || [])).next());
});
}, c = this && this.__generator || function(e, t) {
var n, i, o, a, r = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return a = {
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function c(e) {
return function(t) {
return l([ e, t ]);
};
}
function l(a) {
if (n) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (n = 1, i && (o = 2 & a[0] ? i.return : a[0] ? i.throw || ((o = i.return) && o.call(i), 
0) : i.next) && !(o = o.call(i, a[1])).done) return o;
(i = 0, o) && (a = [ 2 & a[0], o.value ]);
switch (a[0]) {
case 0:
case 1:
o = a;
break;

case 4:
r.label++;
return {
value: a[1],
done: !1
};

case 5:
r.label++;
i = a[1];
a = [ 0 ];
continue;

case 7:
a = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(o = r.trys, o = o.length > 0 && o[o.length - 1]) && (6 === a[0] || 2 === a[0])) {
r = 0;
continue;
}
if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
r.label = a[1];
break;
}
if (6 === a[0] && r.label < o[1]) {
r.label = o[1];
o = a;
break;
}
if (o && r.label < o[2]) {
r.label = o[2];
r.ops.push(a);
break;
}
o[2] && r.ops.pop();
r.trys.pop();
continue;
}
a = t.call(e, r);
} catch (e) {
a = [ 6, e ];
i = 0;
} finally {
n = o = 0;
}
if (5 & a[0]) throw a[1];
return {
value: a[0] ? a[1] : void 0,
done: !0
};
}
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.ReviveBlockEffectsTrait = void 0;
var l = "ReviveBlockEffectsTrait", s = "res/revive_bg_chukuaix1", p = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._spineNodes = [];
t._spineDataCache = null;
return t;
}
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ReviveBlockAlertComponent",
methodName: "render"
} ];
};
t.prototype.data = function() {
return {
isAnimating: !1,
spineDataCache: null
};
};
t.prototype.onCreate = function() {
this.preloadSpineData();
};
t.prototype.onDisable = function() {
this.clearSpineNodes();
};
t.prototype.onActive = function(e) {
hs.tp.isReviveBlockAlertComponentRender(e) && this.handleReviveBlockAnimation(e);
};
t.prototype.preloadSpineData = function() {
var e = this;
this._spineDataCache || hs.ResLoader.loadByBundle(l, s, sp.SkeletonData, function(t, n) {
t || (e._spineDataCache = n);
});
};
t.prototype.clearSpineNodes = function() {
for (;this._spineNodes.length > 0; ) {
var e = this._spineNodes.pop();
if (cc.isValid(e)) {
e.removeFromParent();
e.destroy();
}
}
};
t.prototype.resetAnimatingState = function() {
this.setState({
isAnimating: !1
});
};
t.prototype.handleReviveBlockAnimation = function() {
var e, t, n, i, o, a, r, c, l, s, p, u = this;
this.setState({
isAnimating: !1
});
this.clearSpineNodes();
this.setState({
isAnimating: !0
});
var f = this.props || {}, d = null !== (e = f.panelShowDuration) && void 0 !== e ? e : .1, h = null !== (t = f.panelStartScale) && void 0 !== t ? t : .3, v = null !== (n = f.panelEndScale) && void 0 !== n ? n : 1, y = null !== (i = f.panelStartOpacity) && void 0 !== i ? i : 0, m = null !== (o = f.panelEndOpacity) && void 0 !== o ? o : 255, _ = null !== (a = f.blockAnimTimes) && void 0 !== a ? a : [ .1, .23, .43 ], S = null !== (r = f.blockScaleMax) && void 0 !== r ? r : 1.3, A = null !== (c = f.blockAnimDuration) && void 0 !== c ? c : .13, k = null !== (l = f.effectAnimPlayTime) && void 0 !== l ? l : .1, B = null !== (s = f.spineAnimName) && void 0 !== s ? s : "in", g = null !== (p = f.blockSpineAnimNames) && void 0 !== p ? p : [ "anim1", "anim2", "anim3" ];
this.scheduleOnce(function() {
u.playPanelAnimation(d, h, v, y, m);
u.playBlocksAnimation(_, S, A);
u.playAllSpineEffects(k, B, g);
}, 0);
};
t.prototype.playPanelAnimation = function(e, t, n, i, o) {
var a = Cinst(hs.ReviveBlockAlertComponent);
if (a && a.node) {
var r = a.node.getChildByName("container");
if (r) {
r.scale = t;
r.opacity = i;
var c = e * this.getKSpeed();
cc.tween(r).to(c, {
scale: n,
opacity: o
}, {
easing: cc.easing.backOut
}).start();
}
}
};
t.prototype.playBlocksAnimation = function(e, t, n) {
var i, o = this, a = Cinst(hs.ReviveBlockAlertComponent);
if (a) {
var r = a.itemNodes;
if (r && 0 !== r.length) {
var c = null !== (i = e[0]) && void 0 !== i ? i : .1;
this.scheduleOnce(function() {
for (var e = 0; e < r.length; e++) {
var i = r[e];
if (i && cc.isValid(i)) {
var a = i.scale;
o.playBlockBounceAnimation(i, a, t, n);
}
}
}, c);
}
}
};
t.prototype.playBlockBounceAnimation = function(e, t, n, i) {
if (e && cc.isValid(e)) {
var o = t * n, a = i * this.getKSpeed();
cc.tween(e).to(a / 2, {
scale: o
}, {
easing: cc.easing.sineOut
}).to(a / 2, {
scale: t
}, {
easing: cc.easing.sineIn
}).start();
}
};
t.prototype.playAllSpineEffects = function(e, t, n) {
var i = this, o = Cinst(hs.ReviveBlockAlertComponent);
if (o && o.node) {
var a = o.node.getChildByName("container");
if (a && cc.isValid(a)) {
var r = a.getChildByName("content");
if (r && cc.isValid(r)) {
var c = o.itemNodes;
c && c.length;
this.scheduleOnce(function() {
i.createAndPlayAllSpineEffects(r, t, c, n);
}, e);
} else this.resetAnimatingState();
} else this.resetAnimatingState();
} else this.resetAnimatingState();
};
t.prototype.createAndPlayAllSpineEffects = function(e, t, n, i) {
return r(this, void 0, void 0, function() {
var o, a, r = this;
return c(this, function(c) {
switch (c.label) {
case 0:
(o = []).push(this.createSpineEffectNodeAtPosition(e, 0, 0));
n && n.length > 0 && n.forEach(function(e, t) {
e && cc.isValid(e) ? o.push(r.createBlockBackSpineNode(e, t)) : o.push(Promise.resolve(null));
});
return [ 4, Promise.all(o) ];

case 1:
(a = c.sent()).forEach(function(e, n) {
if (e && cc.isValid(e)) {
r._spineNodes.push(e);
var o = e.getComponent(sp.Skeleton);
if (o) if (0 === n) {
e.active = !0;
o.setAnimation(0, t, !1);
o.setCompleteListener(function() {
e.active = !1;
r.resetAnimatingState();
});
} else r.scheduleOnce(function() {
if (cc.isValid(e)) {
e.active = !0;
var t = Math.floor(Math.random() * i.length), n = i[t];
o.setAnimation(0, n, !1);
o.setCompleteListener(function() {
e.active = !1;
});
}
}, .1);
}
});
a.every(function(e) {
return !e;
}) && this.scheduleOnce(function() {
r.resetAnimatingState();
}, 1);
return [ 2 ];
}
});
});
};
t.prototype.createBlockBackSpineNode = function(e, t) {
var n = this;
return new Promise(function(i) {
if (cc.isValid(e)) if (n._spineDataCache) {
var o = n.createBlockBackSpineNodeWithData(n._spineDataCache, e, t);
i(o);
} else hs.ResLoader.loadByBundle(l, s, sp.SkeletonData, function(o, a) {
if (o) i(null); else if (cc.isValid(e)) {
n._spineDataCache = a;
var r = n.createBlockBackSpineNodeWithData(a, e, t);
i(r);
} else i(null);
}); else i(null);
});
};
t.prototype.createBlockBackSpineNodeWithData = function(e, t, n) {
if (!cc.isValid(t) || !e) return null;
var i = new cc.Node("revive_effect_spine_block_" + n), o = i.addComponent(sp.Skeleton);
o.premultipliedAlpha = !1;
o.setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.REALTIME);
o.enableBatch = !0;
o.skeletonData = e;
i.zIndex = -1;
i.setParent(t);
i.setPosition(0, 0);
var a = t.scale;
if (a > 0) {
var r = 1 / a;
i.setScale(r);
}
i.active = !1;
return i;
};
t.prototype.createSpineEffectNodeAtPosition = function(e, t, n) {
var i = this;
return new Promise(function(o) {
if (cc.isValid(e)) if (i._spineDataCache) {
var a = i.createSpineNodeAtPosition(i._spineDataCache, e, t, n - 3);
o(a);
} else hs.ResLoader.loadByBundle(l, s, sp.SkeletonData, function(a, r) {
if (a) o(null); else if (cc.isValid(e)) {
i._spineDataCache = r;
var c = i.createSpineNodeAtPosition(r, e, t, n - 3);
o(c);
} else o(null);
}); else o(null);
});
};
t.prototype.createSpineNodeAtPosition = function(e, t, n, i) {
if (!cc.isValid(t) || !e) return null;
var o = new cc.Node("revive_effect_spine_center"), a = o.addComponent(sp.Skeleton);
a.premultipliedAlpha = !1;
a.setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.REALTIME);
a.enableBatch = !0;
a.skeletonData = e;
o.zIndex = 100;
o.setParent(t);
o.setPosition(n, i);
o.active = !1;
return o;
};
t.prototype.createSpineEffectNode = function(e, t) {
var n = this;
return new Promise(function(i) {
if (cc.isValid(e)) if (n._spineDataCache) {
var o = n.createSpineNode(n._spineDataCache, e, t);
i(o);
} else hs.ResLoader.loadByBundle(l, s, sp.SkeletonData, function(o, a) {
if (o) i(null); else if (cc.isValid(e)) {
n._spineDataCache = a;
var r = n.createSpineNode(a, e, t);
i(r);
} else i(null);
}); else i(null);
});
};
t.prototype.createSpineNode = function(e, t, n) {
if (!cc.isValid(t) || !e) return null;
var i = new cc.Node("revive_effect_spine_" + n), o = i.addComponent(sp.Skeleton);
o.premultipliedAlpha = !1;
o.setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.REALTIME);
o.enableBatch = !0;
o.skeletonData = e;
i.zIndex = -1;
i.setParent(t);
i.setPosition(0, 0);
i.active = !1;
o.setCompleteListener(function() {
i.active = !1;
});
return i;
};
t.prototype.scheduleOnce = function(e, t) {
t <= 0 ? e() : setTimeout(e, 1e3 * t);
};
t.prototype.getKSpeed = function() {
return cc.director._kSpeed || 1;
};
return a([ classId("ReviveBlockEffectsTrait"), classMethodWatch() ], t);
}(Trait);
n.ReviveBlockEffectsTrait = p;
cc._RF.pop();
}, {} ]
}, {}, [ "ReviveBlockEffectsTrait" ]);
//# sourceMappingURL=index.js.map
