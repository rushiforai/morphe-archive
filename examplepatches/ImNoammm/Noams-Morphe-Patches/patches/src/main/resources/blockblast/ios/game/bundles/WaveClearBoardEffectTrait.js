window.__require = function e(t, r, a) {
function o(n, s) {
if (!r[n]) {
if (!t[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!t[c]) {
var f = "function" == typeof __require && __require;
if (!s && f) return f(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
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
WaveClearBoardEffectNode: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "d2dbdYey75DJLvpeHrwKU63", "WaveClearBoardEffectNode");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, a); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (n = (i < 3 ? o(n) : i > 3 ? o(t, r, n) : o(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var n = cc._decorator, s = n.ccclass, c = n.property, f = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.armatureDisplay = null;
return t;
}
t.prototype.onLoad = function() {
var e = this;
this.node.opacity = 0;
this.armatureDisplay.on(dragonBones.EventObject.COMPLETE, function() {
e.node.opacity = 0;
}, this);
};
t.prototype.playAnimation = function(e) {
this.node.opacity = 255;
this.armatureDisplay.playAnimation(e, 1);
};
t.prototype.onDestroy = function() {
this.armatureDisplay.off(dragonBones.EventObject.COMPLETE, null, this);
};
i([ c(dragonBones.ArmatureDisplay) ], t.prototype, "armatureDisplay", void 0);
return i([ s ], t);
}(hs.Component);
r.default = f;
cc._RF.pop();
}, {} ],
WaveClearBoardEffectTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "22063gZY7pAO5S4nGcBB850", "WaveClearBoardEffectTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, a); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (n = (i < 3 ? o(n) : i > 3 ? o(t, r, n) : o(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.WaveClearBoardEffectTrait = void 0;
var n = e("./WaveClearBoardEffectNode"), s = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isResLoadedPrefab = null;
t.effectNodeName = "WaveClearBoardEffectNode";
t.bundleName = "WaveClearBoardEffectTrait";
return t;
}
t.prototype.onActive = function(e) {
(hs.tp.isClassGame_ProxySetBoardShowFinish(e) || hs.tp.isChapterGame_ProxyOnShowBoardFinished(e)) && this.proLoadRes();
if (hs.tp.isClassBoardSplashAnimation_ProxySetBoardSplashAnimationState(e)) {
this.playClass(e);
e.replace = !0;
}
if (hs.tp.isChapterBoardSplashAnimation_ProxyPlayBoardSplashAnimationForTraitOnly(e)) {
this.playChapter();
e.replace = !0;
}
if (hs.tp.isClassEncourage_ProxyPlayEncourageUnbelievable(e)) {
if (!this.isResLoadedPrefab) return;
e.replace = !0;
}
if (hs.tp.isClassScoreTip_ProxyPlayClearScreenScoreAnim(e)) {
if (!this.isResLoadedPrefab) return;
e.replace = !0;
}
if (hs.tp.isClassEncourage_ProxyPlayEncourageUnbelievableAudio(e)) {
if (!this.isResLoadedPrefab) return;
e.replace = !0;
}
hs.tp.isChapterEncourage_ProxyOnTouchEnd(e) && this.chapterNoEncourage(e);
if (hs.tp.isChapterComboScoreTip_ProxyIsAllowClearScreenScoreAnim(e)) {
if (!this.isResLoadedPrefab) return;
e.returnValue = !1;
e.returnState = !0;
}
};
t.prototype.playClass = function(e) {
var t = this, r = e.args[3], a = e.args[4];
if (this.isResLoadedPrefab) {
var o = hs.gameEffectLayer;
if (o && cc.isValid(o)) {
var i = o.getChildByName(this.effectNodeName);
if (!cc.isValid(i)) {
(i = cc.instantiate(this.isResLoadedPrefab)).name = this.effectNodeName;
o.addChild(i);
var n = this.getBoardGridCenterPosition(o);
if (!n) {
null == r || r();
return;
}
i.setPosition(n);
}
if (cc.isValid(i)) {
var s = a ? 1.1 : .6;
cc.tween(o).delay(s).call(function() {
t.showEffect(r);
}).start();
} else null == r || r();
} else null == r || r();
} else null == r || r();
};
t.prototype.playChapter = function() {
if (this.isResLoadedPrefab) {
var e = hs.gameEffectLayer;
if (e && cc.isValid(e)) {
var t = e.getChildByName(this.effectNodeName);
if (!cc.isValid(t)) {
(t = cc.instantiate(this.isResLoadedPrefab)).name = this.effectNodeName;
e.addChild(t);
var r = this.getBoardGridCenterPosition(e);
if (!r) return;
t.setPosition(r);
}
cc.isValid(t) && this.showEffect();
}
}
};
t.prototype.showEffect = function(e) {
var t = hs.gameEffectLayer;
if (t && cc.isValid(t)) {
var r = t.getChildByName(this.effectNodeName);
if (cc.isValid(r)) {
r.scale = 2;
var a = r.getComponent(n.default);
if (a) {
a.playAnimation("in");
null == e || e();
} else null == e || e();
} else null == e || e();
} else null == e || e();
};
t.prototype.getBoardGridCenterPosition = function(e) {
var t = Cinst(hs.Board);
if (!t || !cc.isValid(t.boardGrid)) return null;
var r = cc.v2(0, 0), a = t.boardGrid.convertToWorldSpaceAR(r), o = e.convertToNodeSpaceAR(a);
return cc.v2(o.x, o.y - 124);
};
t.prototype.chapterNoEncourage = function(e) {
if (this.isResLoadedPrefab) {
var t = e.args[0].state;
if ((null == t ? void 0 : t.touchEndState).clearScreen) {
t.promptType = hs.EncouragePromptType.PROMPT_NONE;
e.replace = !0;
}
}
};
t.prototype.proLoadRes = function() {
var e = this;
this.isResLoadedPrefab || hs.ResLoader.loadByBundle(this.bundleName, "prefabs/WaveClearBoardEffectNode", cc.Prefab, function(t, r) {
t || (e.isResLoadedPrefab = r);
});
};
return i([ classId("WaveClearBoardEffectTrait") ], t);
}(Trait);
r.WaveClearBoardEffectTrait = s;
cc._RF.pop();
}, {
"./WaveClearBoardEffectNode": "WaveClearBoardEffectNode"
} ]
}, {}, [ "WaveClearBoardEffectNode", "WaveClearBoardEffectTrait" ]);
//# sourceMappingURL=index.js.map
