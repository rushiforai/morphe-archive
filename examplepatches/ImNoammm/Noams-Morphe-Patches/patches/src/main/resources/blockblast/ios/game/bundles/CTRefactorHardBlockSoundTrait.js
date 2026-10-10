window.__require = function t(e, o, r) {
function a(i, s) {
if (!o[i]) {
if (!e[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var l = o[i] = {
exports: {}
};
e[i][0].call(l.exports, function(t) {
return a(e[i][1][t] || t);
}, l, l.exports, t, e, o, r);
}
return o[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < r.length; i++) a(r[i]);
return a;
}({
CTRefactorHardBlockSoundTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "213c9GMbElOfKe7EONdMkDK", "CTRefactorHardBlockSoundTrait");
var r, a, n, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), s = this && this.__decorate || function(t, e, o, r) {
var a, n = arguments.length, i = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, o, i) : a(e, o)) || i);
return n > 3 && i && Object.defineProperty(e, o, i), i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorHardBlockSoundTrait = o.CTRefactorHardBlockSoundTraitStatusENUMS = void 0;
(function(t) {
t[t.None = 0] = "None";
t[t.Normal = 1] = "Normal";
t[t.Other = 2] = "Other";
})(a = o.CTRefactorHardBlockSoundTraitStatusENUMS || (o.CTRefactorHardBlockSoundTraitStatusENUMS = {}));
(function(t) {
t[t["困难难题"] = 0] = "困难难题";
t[t["死亡难题"] = 1] = "死亡难题";
t[t["直觉难题"] = 2] = "直觉难题";
t[t["迷惑难题"] = 3] = "迷惑难题";
t[t["骨牌难题"] = 4] = "骨牌难题";
t[t["不容易被发现的困难难题"] = 5] = "不容易被发现的困难难题";
t[t["极其困难难题"] = 6] = "极其困难难题";
t[t["多消困难难题"] = 7] = "多消困难难题";
t[t["顺序难题"] = 8] = "顺序难题";
t[t["小块难题"] = 9] = "小块难题";
t[t["组合放置困难难题"] = 10] = "组合放置困难难题";
t[t["简单直觉题"] = 11] = "简单直觉题";
t[t["十字消除难题"] = 12] = "十字消除难题";
t[t["难题概率"] = 13] = "难题概率";
t[t["随机难题"] = 14] = "随机难题";
t[t["斜向块难题"] = 15] = "斜向块难题";
t[t["间隔放置难题"] = 16] = "间隔放置难题";
t[t["极端难题"] = 17] = "极端难题";
t[t["连续边数少难题"] = 18] = "连续边数少难题";
t[t["多活路难题"] = 19] = "多活路难题";
t[t["干扰难题"] = 20] = "干扰难题";
t[t.D1 = 21] = "D1";
t[t.D2 = 22] = "D2";
t[t.D3 = 23] = "D3";
t[t.D4 = 24] = "D4";
t[t.D5 = 25] = "D5";
t[t.D6 = 26] = "D6";
})(n || (n = {}));
var c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._duration = 10300;
e._startTimer = 0;
e._status = a.None;
e._animationName = "amazing_purple";
e._amazingNode = null;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "Encourage_Proxy",
methodName: "checkHardBlockPlaySound"
}, {
className: "NewComboEffectTrait",
methodName: "_onClassEncourage_ProxyOnTouchEnd"
}, {
className: "NewComboEffectAdjustParamsTrait",
methodName: "_onClassEncourage_ProxyOnTouchEnd"
} ];
};
Object.defineProperty(e.prototype, "animationName", {
get: function() {
return this._animationName;
},
enumerable: !1,
configurable: !0
});
e.prototype.setAnimationName = function(t) {
this._animationName = t;
};
Object.defineProperty(e.prototype, "status", {
get: function() {
return this._status;
},
set: function(t) {
this._status = t;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "startTimer", {
get: function() {
return this._startTimer;
},
enumerable: !1,
configurable: !0
});
e.prototype.isClassGame_ProxyOnReviveShow = function() {
this._status = a.Other;
};
e.prototype.isChapterGame_ProxyOnReviveShow = function() {
this._status = a.Other;
};
e.prototype.isChapterRevive_ProxyOnClick_ok = function() {
this.reviveData();
};
e.prototype.isClassRevive_ProxyOnClick_ok = function() {
this.reviveData();
};
e.prototype.isEncourage_ProxyCheckHardBlockPlaySound = function() {
this.checkHardBlockPlaySound();
};
e.prototype.isNewComboEffectTrait_onClassEncourage_ProxyOnTouchEnd = function(t) {
this._onEncourageOnTouchEnd(t);
};
e.prototype.isNewComboEffectAdjustParamsTrait_onClassEncourage_ProxyOnTouchEnd = function(t) {
this._onEncourageOnTouchEnd(t);
};
e.prototype.onAlgorithmStrategyGameNewInit = function() {
this.initData();
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
this.checkPlaySound(!1);
};
e.prototype.checkHardBlockPlaySound = function() {
this.status = a.Other;
};
e.prototype._onEncourageOnTouchEnd = function(t) {
var e = t.args[0].state.touchEndState, o = e.continuousEliminateTimes, r = e.eliminateCount, n = storage.getItem("classGuideStep", 0), i = TRAIT("NewComboEffectTrait"), s = TRAIT("NewComboEffectAdjustParamsTrait"), c = (null == i ? void 0 : i.active) || (null == s ? void 0 : s.active);
this._status = c && o > 1 && r >= 2 && n > 2 ? a.Other : a.Normal;
};
e.prototype.checkPlaySound = function(t) {
var e = this;
void 0 === t && (t = !1);
hs.algorithmName.algoActualName;
if ((t || this.startTimer > 0) && this.status === a.Normal) {
var o = Date.now() - this.startTimer;
if (t || o >= this._duration) {
var r = 500, n = TRAIT("TravelWordOptTrait");
(null == n ? void 0 : n.active) && (null == n ? void 0 : n.isTriggeredEncourage) && (r += 1500);
setTimeoutSafe(function() {
hs.audioInfo.play(hs.AudioConfig.Amazing2);
e.showAmazingEffect();
}, r);
}
}
this.resetData();
};
e.prototype.reviveData = function() {
this._startTimer = 0;
this._status = a.Other;
};
e.prototype.resetData = function() {
var t = this.isLastOfferBlockHard();
this._startTimer = t ? Date.now() : 0;
this._status = a.Normal;
};
e.prototype.initData = function() {
this._startTimer = 0;
this._status = a.Normal;
};
e.prototype.showAmazingEffect = function() {
var t = Cinst(hs.Board);
if (t) {
var e = t.blocks.parent.convertToWorldSpaceAR(t.blocks.position), o = hs.gameEffectLayer.convertToNodeSpaceAR(e), r = TRAIT("Feat_yxqMotivationalWordsTrait");
if (null != r && r.active) r.play(1, hs.EncouragePromptType.PROMPT4, cc.v2(o.x, o.y)); else if (hs.skinInfo.skinEnabled) {
var a = TRAIT("TravelWordOptTrait");
(null == a ? void 0 : a.active) && (a.EncourageEliminateCount = 5);
hs.EventManager.dispatchModuleEvent(new hs.E_Encourage_Play({
promptType: hs.EncouragePromptType.PROMPT4,
type: hs.EncourageType.LEVEL_COLOR,
eliminateCount: 5,
color: 4,
isHardBlockShow: !0
}));
} else {
this._amazingNode || (this._amazingNode = new cc.Node());
this._amazingNode.getComponent(dragonBones.ArmatureDisplay) || this._amazingNode.addComponent(dragonBones.ArmatureDisplay);
o.y = cc.view.getVisibleSize().height / 6 + cc.view.getVisibleSize().height / 2;
this._amazingNode.position = o;
hs.effectLayer.addChild(this._amazingNode);
this.setAnimationName("amazing_orange");
var n = cc.find("NewBestScoreEffect", hs.effectLayer);
n && this._amazingNode.setSiblingIndex(n.getSiblingIndex());
var i = this._amazingNode.getComponent(dragonBones.ArmatureDisplay);
i.node.active = !0;
hs.ResLoader.renderDragonbones({
dragonBonesArmatureDisplay: i,
dragonAssetUrl: "dragonbones/encourage/encourage_ske",
dragonAtlasAssetUrl: "dragonbones/encourage/encourage_tex",
armatureName: "Armature",
animationName: this.animationName,
playTimes: 1
});
}
}
};
e.prototype.isLastOfferBlockHard = function() {
var t = hs.algorithmName.algoActualName;
return !!t && this.checkResult(t);
};
e.prototype.checkResult = function(t) {
return t.some(function(t) {
return hs.isValueInEnum(t, n);
});
};
return s([ classId("CTRefactorHardBlockSoundTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorHardBlockSoundTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorHardBlockSoundTrait" ]);
//# sourceMappingURL=index.js.map
