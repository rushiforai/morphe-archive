window.__require = function t(e, o, a) {
function n(i, c) {
if (!o[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (r) return r(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var f = o[i] = {
exports: {}
};
e[i][0].call(f.exports, function(t) {
return n(e[i][1][t] || t);
}, f, f.exports, t, e, o, a);
}
return o[i].exports;
}
for (var r = "function" == typeof __require && __require, i = 0; i < a.length; i++) n(a[i]);
return n;
}({
LoadingState: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "c16e6CbQuxP7p6TwZe0w547", "LoadingState");
Object.defineProperty(o, "__esModule", {
value: !0
});
o.LoadingState = void 0;
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.LOADING = 1] = "LOADING";
t[t.COMPLETE = 2] = "COMPLETE";
})(o.LoadingState || (o.LoadingState = {}));
cc._RF.pop();
}, {} ],
NewClearAllEffectTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "9d79fD9RLdCa6buMTsWZ/Jt", "NewClearAllEffectTrait");
var a, n = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
a(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), r = this && this.__decorate || function(t, e, o, a) {
var n, r = arguments.length, i = r < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, o) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, a); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (r < 3 ? n(i) : r > 3 ? n(e, o, i) : n(e, o)) || i);
return r > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.NewClearAllEffectTrait = void 0;
var i = t("../components/NewClearAllEffect"), c = t("../type/LoadingState"), l = "NewClearAllEffectTrait", s = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.loadingState = c.LoadingState.NONE;
e._lastPlayTime = 0;
return e;
}
o = e;
e.prototype.onEnable = function() {
this.preload();
};
e.prototype.onActive = function(t) {
hs.tp.isClassEncourage_ProxyPlayEncourageUnbelievable(t) && this.isPlatformCanPlay() && this.isCanClear() && this.shouldPlay() && (t.replace = !0);
if (hs.tp.isClassBoardSplashAnimation_ProxySetBoardSplashAnimationState(t)) {
var e = t.args[3];
if (this.isPlatformCanPlay() && this.isPlatformCanPlay() && this.isCanClear() && this.shouldPlay()) {
t.replace = !0;
this.play(e);
}
}
hs.tp.isClassScoreTip_ProxyPlayClearScreenScoreAnim(t) && this.isPlatformCanPlay() && this.isCanClear() && this.shouldPlay() && (t.replace = !0);
};
e.prototype.isPlatformCanPlay = function() {
return !0;
};
e.prototype.preload = function() {
var t = this;
if (this.loadingState === c.LoadingState.NONE) {
this.loadingState = c.LoadingState.LOADING;
hs.ResLoader.loadBundle(l, function(e, a) {
if (!e && a) {
hs.ResLoader.bundlePreload(a, o.PREFAB_DIR, cc.Prefab, function(e) {
t.loadingState = e ? c.LoadingState.NONE : c.LoadingState.COMPLETE;
});
hs.ResLoader.bundlePreload(a, o.SOUND_PATH, cc.AudioClip, function() {});
} else t.loadingState = c.LoadingState.NONE;
});
} else this.loadingState, c.LoadingState.COMPLETE;
};
e.prototype.play = function(t) {
var e = this;
if (!this.shouldPlay()) {
cc.isValid(t) && t();
return !1;
}
var a = Date.now();
if (a - this._lastPlayTime < o.PLAY_DEBOUNCE_MS) return !1;
this._lastPlayTime = a;
var n = hs.gameEffectLayer, r = Cinst(hs.Board);
if (!cc.isValid(n)) return !1;
cc.tween(n).delay(.4).call(function() {
e.playEffect();
}).delay(.3).call(function() {
hs.ResLoader.asyncLoadByBundle(l, o.PREFAB_PATH, cc.Prefab).then(function(e) {
if (e) {
var o = cc.instantiate(e);
n.addChild(o);
if (r) {
var a = r.node.parent.convertToWorldSpaceAR(cc.v2(0, 0)), c = hs.gameEffectLayer.convertToNodeSpaceAR(a);
o.setPosition(c);
}
var l = o.getComponent(i.default);
l && l.play();
}
cc.isValid(t) && t();
}).catch(function() {
cc.isValid(t) && t();
});
}).start();
return !0;
};
e.prototype.shouldPlay = function() {
var t, e, o = hs.storage.getItem("classGuideStep", 0), a = null === (e = null === (t = hs) || void 0 === t ? void 0 : t.classGameInfo) || void 0 === e ? void 0 : e.roundNum, n = hs.storage.getItem("classRoundNum", 0);
return o > 2 && ("number" == typeof a ? a : n) >= 5;
};
e.prototype.playEffect = function() {
hs.audioInfoData.audioSwitch && hs.ResLoader.asyncLoadByBundle(l, o.SOUND_PATH, cc.AudioClip).then(function(t) {
t && cc.audioEngine.play(t, !1, 1);
}).catch(function() {});
};
e.prototype.autoLog = function() {};
e.prototype.log = function() {};
e.prototype.isCanClear = function(t, e) {
var o = new hs.BinaryBoard();
o.convertToBinaryBoard(hs.boardInfo.faceBlocks);
t && t.forEach(function(t) {
o.clearRow(t);
});
e && e.forEach(function(t) {
o.clearCol(t);
});
o.record();
o.canClearBlockArr(!0);
return o.getEmptyNumObj() >= 64;
};
var o;
e.PREFAB_DIR = "prefabs";
e.PREFAB_PATH = "prefabs/clearall";
e.SOUND_PATH = "audio/lightning";
e.PLAY_DEBOUNCE_MS = 800;
return o = r([ classId("NewClearAllEffectTrait"), classMethodWatch() ], e);
}(Trait);
o.NewClearAllEffectTrait = s;
cc._RF.pop();
}, {
"../components/NewClearAllEffect": "NewClearAllEffect",
"../type/LoadingState": "LoadingState"
} ],
NewClearAllEffect: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "e9c385kKddDxbeRuXL47HL8", "NewClearAllEffect");
var a, n = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
a(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), r = this && this.__decorate || function(t, e, o, a) {
var n, r = arguments.length, i = r < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, o) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, a); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (r < 3 ? n(i) : r > 3 ? n(e, o, i) : n(e, o)) || i);
return r > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var i = t("../../../../../scripts/base/components/Component"), c = cc._decorator, l = c.ccclass, s = c.property, f = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.effect = null;
return e;
}
e.prototype.onLoad = function() {
this.effect.on(dragonBones.EventObject.COMPLETE, this.onComplete, this);
};
e.prototype.onComplete = function() {
this.node.destroy();
};
e.prototype.play = function() {
var t = cc.director._kSpeed || 1;
this.effect.timeScale = 1 / t;
this.effect.playAnimation("all_clear", 1);
};
r([ s(dragonBones.ArmatureDisplay) ], e.prototype, "effect", void 0);
return r([ l ], e);
}(i.default);
o.default = f;
cc._RF.pop();
}, {
"../../../../../scripts/base/components/Component": void 0
} ]
}, {}, [ "NewClearAllEffect", "NewClearAllEffectTrait", "LoadingState" ]);
//# sourceMappingURL=index.js.map
