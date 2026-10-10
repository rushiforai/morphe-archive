window.__require = function t(e, i, r) {
function n(a, p) {
if (!i[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!p && u) return u(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var d = i[a] = {
exports: {}
};
e[a][0].call(d.exports, function(t) {
return n(e[a][1][t] || t);
}, d, d.exports, t, e, i, r);
}
return i[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
GuideHandOptimizationTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "f1553PaPLxFG4QOsXxC9FWq", "GuideHandOptimizationTrait");
var r, n = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
r(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), o = this && this.__decorate || function(t, e, i, r) {
var n, o = arguments.length, a = o < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, r); else for (var p = t.length - 1; p >= 0; p--) (n = t[p]) && (a = (o < 3 ? n(a) : o > 3 ? n(e, i, a) : n(e, i)) || a);
return o > 3 && a && Object.defineProperty(e, i, a), a;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.GuideHandOptimizationTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "handIndex", {
get: function() {
var t, e, i = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.handIndex) && void 0 !== e ? e : 1;
return Math.min(Math.max(Math.floor(i), 1), 8);
},
enumerable: !1,
configurable: !0
});
e.prototype.onCreate = function() {
hs.ResLoader.loadByBundle("GuideHandOptimizationTrait", "textures/texture", cc.SpriteAtlas, function() {});
};
e.prototype.onActive = function(t) {
if (hs.tp.isClassGuideShowOneTimeHand(t)) {
var e = t.target;
this.replaceHandSprite(null == e ? void 0 : e.moveContainer);
}
};
e.prototype.replaceHandSprite = function(t) {
var e = this, i = null == t ? void 0 : t.getChildByName("hand");
if (cc.isValid(i)) {
i.opacity = 0;
var r = hs.ResLoader.getAsset("GuideHandOptimizationTrait_textures/texture");
if (r) this.applyHandFrame(i, r); else {
hs.ResLoader.loadByBundle("GuideHandOptimizationTrait", "textures/texture", cc.SpriteAtlas, function(t, r) {
!t && cc.isValid(i) && e.applyHandFrame(i, r);
});
setTimeoutSafe(function() {
cc.isValid(i) && (i.opacity = 255);
}, 2e3);
}
}
};
e.prototype.applyHandFrame = function(t, e) {
try {
var i = String(this.handIndex), r = e.getSpriteFrame(i);
if (!r) return;
(t.getComponent(cc.Sprite) || t.addComponent(cc.Sprite)).spriteFrame = r;
t.opacity = 255;
} catch (t) {}
};
return o([ classId("GuideHandOptimizationTrait") ], e);
}(Trait);
i.GuideHandOptimizationTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "GuideHandOptimizationTrait" ]);
//# sourceMappingURL=index.js.map
