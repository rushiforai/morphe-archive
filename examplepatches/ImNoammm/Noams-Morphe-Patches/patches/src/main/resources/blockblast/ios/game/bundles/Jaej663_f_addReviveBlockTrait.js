window.__require = function e(t, r, a) {
function o(n, c) {
if (!r[n]) {
if (!t[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!t[s]) {
var d = "function" == typeof __require && __require;
if (!c && d) return d(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var l = r[n] = {
exports: {}
};
t[n][0].call(l.exports, function(e) {
return o(t[n][1][e] || e);
}, l, l.exports, e, t, r, a);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < a.length; n++) o(a[n]);
return o;
}({
Jaej663_f_addReviveBlockTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "f605f2sSaNHy5Af+l3/8d2X", "Jaej663_f_addReviveBlockTrait");
var a, o = this && this.__extends || (a = function(e, t) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
a(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, a) {
var o, i = arguments.length, n = i < 3 ? t : null === a ? a = Object.getOwnPropertyDescriptor(t, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, a); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (n = (i < 3 ? o(n) : i > 3 ? o(t, r, n) : o(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
}, n = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], a = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && a >= e.length && (e = void 0);
return {
value: e && e[a++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Jaej663_f_addReviveBlockTrait = void 0;
var c = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.bundleName = "Jaej663_f_addReviveBlockTrait";
t.renderOk = !1;
t.loadArr = [];
return t;
}
t.prototype.onCreate = function() {
this.preload();
};
t.prototype.preload = function() {
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/button663", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/kuang663", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/item663", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/block663", cc.Prefab);
this.loadArr = [ "Jaej663_f_addReviveBlockTrait_prefabs/button663", "Jaej663_f_addReviveBlockTrait_prefabs/kuang663", "Jaej663_f_addReviveBlockTrait_prefabs/item663", "Jaej663_f_addReviveBlockTrait_prefabs/block663" ];
};
t.prototype.isLoadOk = function() {
var e, t;
try {
for (var r = n(this.loadArr), a = r.next(); !a.done; a = r.next()) {
var o = a.value;
if (!hs.ResLoader.getAsset(o)) return !1;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (t = r.return) && t.call(r);
} finally {
if (e) throw e.error;
}
}
return !0;
};
t.prototype.onActive = function(e) {
var t = this;
hs.tp.isRevive_ProxyOnGameReady(e);
if (hs.tp.isReviveBlockAlertComponentReplaceItems(e)) {
if (!this.isLoadOk()) return;
var r = (n = e.target).node.getChildByName("container");
if (!cc.isValid(r)) return;
var a = r.getChildByName("content");
if (cc.isValid(a)) {
var o = a.getChildByName("items");
o.active = !1;
var i = a.getChildByName("item663");
cc.isValid(i) && i.removeFromParent();
hs.delayTimeFrame(100).then(function() {
var e = cc.instantiate(t.getItem663Asset());
e.parent = a;
e.position = o.position;
t.checkItemNode(e);
var r = t.getAttachUtil(e);
if (r) {
r.generateAllAttachedNodes();
t.createAttach("kuai1", r, 1, o);
t.createAttach("kuai2", r, 2, o);
t.createAttach("kuai3", r, 3, o);
}
t.afterDelayReplaceItems();
});
}
}
if (hs.tp.isReviveBlockAlertComponentReplaceNode(e)) {
if (!this.isLoadOk()) return;
if (this.renderOk) {
this.otherTraitReplace(e.target);
return;
}
var n;
r = (n = e.target).node.getChildByName("container");
if (!cc.isValid(r)) return;
var c = r.getComponent(cc.Sprite);
cc.isValid(c) && (c.spriteFrame = null);
this.replaceKuang(r);
var s = r.getChildByName("content");
if (cc.isValid(s)) {
var d = s.getComponent(cc.Sprite);
cc.isValid(d) && hs.ResLoader.renderSpriteByBundle(d, "textures/tips_img_bg1", this.bundleName);
}
var l = n.buttons[0];
l.node.active = !1;
var f = cc.instantiate(this.getButton663Asset());
f.parent = r;
var p = l.node.getSiblingIndex();
f.setSiblingIndex(p);
f.y = l.node.y;
f.getComponent(cc.Button).clickEvents = l.clickEvents;
var u = n.buttons[1], _ = u.node.getChildByName("label");
cc.isValid(_) && (_.color = cc.Color.WHITE);
var v = u.node.getChildByName("line");
cc.isValid(v) && (v.color = cc.Color.WHITE);
this.renderOk = !0;
this.replaceEnd();
this.otherTraitReplace(n);
}
};
t.prototype.replaceKuang = function(e) {
var t = cc.instantiate(this.getKuang663Asset());
t.parent = e;
var r = e.getChildByName("title"), a = r ? r.getSiblingIndex() : e.childrenCount;
t.setSiblingIndex(a);
this.onKuangCreated(t);
};
t.prototype.onKuangCreated = function() {};
t.prototype.createAttach = function(e, t, r, a) {
var o, i, c, s, d = t.getAttachedNodes(e)[0];
if (d) {
var l = cc.instantiate(hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/block663"));
this.isHideItmeNode() && (l.getChildByName("item").active = !1);
d.addChild(l);
var f = l.getChildByName("shadow"), p = a.getChildByName("shadow" + r);
if (cc.isValid(p) && p.children) try {
for (var u = n(p.children), _ = u.next(); !_.done; _ = u.next()) {
var v = _.value, h = cc.instantiate(v);
h.parent = f;
h.position = v.position;
}
} catch (e) {
o = {
error: e
};
} finally {
try {
_ && !_.done && (i = u.return) && i.call(u);
} finally {
if (o) throw o.error;
}
}
var y = l.getChildByName("item"), b = a.getChildByName("item" + r).getChildByName("BlockProducerItem"), g = y.getChildByName("one");
if (cc.isValid(b) && b.children) try {
for (var m = n(b.children), B = m.next(); !B.done; B = m.next()) {
v = B.value;
var R = cc.instantiate(g);
R.parent = y;
R.position = v.position;
}
} catch (e) {
c = {
error: e
};
} finally {
try {
B && !B.done && (s = m.return) && s.call(m);
} finally {
if (c) throw c.error;
}
}
g.removeFromParent();
this.addOtherTraitEffect(y, r);
1 == r ? l.x = -30 : 3 == r && (l.x = 25);
}
};
t.prototype.afterDelayReplaceItems = function() {};
t.prototype.checkItemNode = function() {};
t.prototype.isHideItmeNode = function() {
return !1;
};
t.prototype.addOtherTraitEffect = function() {};
t.prototype.replaceEnd = function() {};
t.prototype.otherTraitReplace = function() {};
t.prototype.getButton663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/button663");
};
t.prototype.getItem663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/item663");
};
t.prototype.getKuang663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/kuang663");
};
t.prototype.getAttachUtil = function(e) {
return e.getComponent(dragonBones.ArmatureDisplay).attachUtil;
};
return i([ classId("Jaej663_f_addReviveBlockTrait"), classMethodWatch() ], t);
}(Trait);
r.Jaej663_f_addReviveBlockTrait = c;
cc._RF.pop();
}, {} ],
Jaej663_f_addReviveBlock_comparisonNew_Trait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "f5b9eefh4tIWYp7izHlIc2R", "Jaej663_f_addReviveBlock_comparisonNew_Trait");
var a, o = this && this.__extends || (a = function(e, t) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
a(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, a) {
var o, i = arguments.length, n = i < 3 ? t : null === a ? a = Object.getOwnPropertyDescriptor(t, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, a); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (n = (i < 3 ? o(n) : i > 3 ? o(t, r, n) : o(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Jaej663_f_addReviveBlock_comparisonNew_Trait = void 0;
var n = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.preload = function() {
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/button663Spine", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/kuang663Spine", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/item663Spine", cc.Prefab);
hs.ResLoader.loadByBundle(this.bundleName, "prefabs/block663", cc.Prefab);
this.loadArr = [ "Jaej663_f_addReviveBlockTrait_prefabs/button663Spine", "Jaej663_f_addReviveBlockTrait_prefabs/kuang663Spine", "Jaej663_f_addReviveBlockTrait_prefabs/item663Spine", "Jaej663_f_addReviveBlockTrait_prefabs/block663" ];
};
t.prototype.getButton663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/button663Spine");
};
t.prototype.getItem663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/item663Spine");
};
t.prototype.getKuang663Asset = function() {
return hs.ResLoader.getAsset("Jaej663_f_addReviveBlockTrait_prefabs/kuang663Spine");
};
t.prototype.getAttachUtil = function(e) {
var t = e.getComponent(sp.Skeleton);
return t ? t.attachUtil : null;
};
return i([ classId("Jaej663_f_addReviveBlockTrait", "comparisonNew") ], t);
}(e("./Jaej663_f_addReviveBlockTrait").Jaej663_f_addReviveBlockTrait);
r.Jaej663_f_addReviveBlock_comparisonNew_Trait = n;
cc._RF.pop();
}, {
"./Jaej663_f_addReviveBlockTrait": "Jaej663_f_addReviveBlockTrait"
} ]
}, {}, [ "Jaej663_f_addReviveBlockTrait", "Jaej663_f_addReviveBlock_comparisonNew_Trait" ]);
//# sourceMappingURL=index.js.map
