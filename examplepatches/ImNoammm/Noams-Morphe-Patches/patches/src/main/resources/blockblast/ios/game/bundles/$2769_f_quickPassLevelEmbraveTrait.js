window.__require = function t(e, r, o) {
function i(s, a) {
if (!r[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var c = r[s] = {
exports: {}
};
e[s][0].call(c.exports, function(t) {
return i(e[s][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
$2769_f_quickPassLevelEmbraveTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "655ceC7gSRFXat59q2lTC7W", "$2769_f_quickPassLevelEmbraveTrait");
var o, i = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, s = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (s = (n < 3 ? i(s) : n > 3 ? i(e, r, s) : i(e, r)) || s);
return n > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(i, n) {
function s(t) {
try {
u(o.next(t));
} catch (t) {
n(t);
}
}
function a(t) {
try {
u(o.throw(t));
} catch (t) {
n(t);
}
}
function u(t) {
t.done ? i(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
u((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, i, n, s = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return n = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function a(t) {
return function(e) {
return u([ t, e ]);
};
}
function u(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (i = 2 & n[0] ? o.return : n[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, n[1])).done) return i;
(o = 0, i) && (n = [ 2 & n[0], i.value ]);
switch (n[0]) {
case 0:
case 1:
i = n;
break;

case 4:
s.label++;
return {
value: n[1],
done: !1
};

case 5:
s.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(i = s.trys, i = i.length > 0 && i[i.length - 1]) && (6 === n[0] || 2 === n[0])) {
s = 0;
continue;
}
if (3 === n[0] && (!i || n[1] > i[0] && n[1] < i[3])) {
s.label = n[1];
break;
}
if (6 === n[0] && s.label < i[1]) {
s.label = i[1];
i = n;
break;
}
if (i && s.label < i[2]) {
s.label = i[2];
s.ops.push(n);
break;
}
i[2] && s.ops.pop();
s.trys.pop();
continue;
}
n = e.call(t, s);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = i = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.$2769_f_quickPassLevelEmbraveTrait = void 0;
var u = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isResLoaded = !1;
e._sessionTriggerCount = 0;
e._sessionRemoveInterstitial = !1;
e._totalTriggerCount = 0;
return e;
}
r = e;
e.prototype.onEnable = function() {
this._loadPersistedData();
};
e.prototype.onActive = function(t) {
var e, r;
if (hs.tp.isChapterGame_ProxyOnStartGame(t)) {
var o = t.target, i = null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.speed) && void 0 !== r ? r : 1;
cc.isValid(o.armatureDisplay) && (o.armatureDisplay.timeScale = i);
this._preloadDragonBonesRes();
this._preloadAudioRes();
} else if (hs.tp.isChapterGameOver_ProxyGetDelayTime(t)) {
if (this._sessionTriggerCount > 0) return;
var n = hs.chapterGameInfo.chapterNum;
if ("number" == typeof n) {
if (!this._shouldTrigger(n)) return;
var s = this._getEffectParent();
this._triggerAnimation(s, n);
t.args[0] += 2300;
t.returnState = !0;
}
} else hs.tp.isEncourage_ProxyOnGameReplay(t) ? this._resetSession() : hs.tp.isChapterWin_ProxyHideUI(t) || hs.tp.isChapterFail_ProxyHideUI(t) ? this._resetSession() : hs.tp.isChapterAdvertisement_FullScreenProxyShieldPlayAdvertisement(t) && this.checkShieldAdvByCondition(t);
};
e.prototype._isOpen = function() {
return this._isResLoaded;
};
e.prototype._shouldTrigger = function(t) {
var e;
if (!this._isOpen()) return !1;
var o = this._realGameTime(), i = null !== (e = r.LEVEL_TIME_CONFIG[t + 1]) && void 0 !== e ? e : r.LEVEL_TIME_CONFIG[t];
return void 0 !== i && o <= i;
};
e.prototype._triggerAnimation = function(t) {
return s(this, void 0, void 0, function() {
var e;
return a(this, function(r) {
switch (r.label) {
case 0:
return [ 4, hs.delayTimeFrame(1e3) ];

case 1:
r.sent();
this._sessionTriggerCount++;
this._totalTriggerCount++;
this._persistData();
"animation_2" == (e = this._totalTriggerCount > 0 && this._totalTriggerCount % 2 == 0 && !this._sessionRemoveInterstitial ? "animation_2" : "animation") && (this._sessionRemoveInterstitial = !0);
this._playDragonbones(t, e);
this._logFeature();
return [ 2 ];
}
});
});
};
e.prototype._playDragonbones = function(t, e) {
var r = this, o = t && cc.isValid(t) ? t : this._getCanvas();
if (o) {
var i = Cinst(hs.Board), n = new cc.Node(), s = n.addComponent(dragonBones.ArmatureDisplay);
n.setParent(o);
var a = cc.v2(0, 0), u = i.node;
if (u && cc.isValid(u)) {
var l = u.convertToWorldSpaceAR(cc.v2(0, 0));
a = o.convertToNodeSpaceAR(l);
}
n.setPosition(a);
s.once(dragonBones.EventObject.COMPLETE, function() {
cc.isValid(n) && n.destroy();
});
this._dragonAsset && this._dragonAtlas ? this._applyAndPlay(s, e) : this._preloadDragonBonesRes(function() {
return r._applyAndPlay(s, e);
});
}
};
e.prototype._applyAndPlay = function(t, e) {
var o, i;
if (cc.isValid(t) && this._dragonAsset && this._dragonAtlas) {
t.dragonAsset = this._dragonAsset;
t.dragonAtlasAsset = this._dragonAtlas;
t.armatureName = r.ARMATURE_NAME;
var n = null !== (i = null === (o = this.props) || void 0 === o ? void 0 : o.speed) && void 0 !== i ? i : 1;
t.timeScale = n > 0 ? n : 1;
t.playAnimation(e, 1);
hs.audioInfo.play({
url: r.AUDIO_FASTWIN,
type: hs.AudioType.EFFECT,
volume: 1,
bundleName: r.CLOUD_ID_BUNDLE
});
}
};
e.prototype._getDelayTime = function() {
return 1.5;
};
e.prototype._shouldRemoveInterstitialAd = function() {
return this._sessionRemoveInterstitial;
};
e.prototype._resetSessionInterstitialAd = function() {
this._sessionRemoveInterstitial = !1;
this._persistData();
};
e.prototype._init = function() {
this._loadPersistedData();
};
e.prototype._resetSession = function() {
this._sessionTriggerCount = 0;
this._sessionRemoveInterstitial = !1;
this._persistData();
};
e.prototype._preloadDragonBonesRes = function(t) {
var e = this;
this._isResLoaded && this._dragonAsset && this._dragonAtlas ? t && t() : cc.assetManager.loadBundle(r.CLOUD_ID_BUNDLE, function(o, i) {
!o && i && i.load(r.DRAGON_SKE, dragonBones.DragonBonesAsset, function(o, n) {
!o && n && i.load(r.DRAGON_ATLAS, dragonBones.DragonBonesAtlasAsset, function(r, o) {
if (!r && o) {
e._dragonAsset = n;
e._dragonAtlas = o;
e._isResLoaded = !0;
t && t();
}
});
});
});
};
e.prototype._preloadAudioRes = function() {
var t = this;
hs.ResLoader.loadByBundle(r.CLOUD_ID_BUNDLE, r.AUDIO_FASTWIN, cc.AudioClip, function(e, r) {
!e && r && (t._audioClip = r);
});
};
e.prototype._getExpectedTime = function(t) {
return r.LEVEL_TIME_CONFIG[t];
};
e.prototype._getCanvas = function() {
var t = cc.find("Canvas");
return t && cc.isValid(t) ? t : null;
};
e.prototype._getEffectParent = function() {
return hs.gameEffectLayer;
};
e.prototype._loadPersistedData = function() {
var t = hs.storage.getItem(r.CLOUD_ID_BUNDLE), e = hs.getTodayDate();
if (t) try {
var o = JSON.parse(t);
if (o.dateStr !== e) {
this._totalTriggerCount = 0;
hs.storage.setItem(r.CLOUD_ID_BUNDLE, JSON.stringify({
totalTriggerCount: 0,
dateStr: e
}));
} else this._totalTriggerCount = Number(o.totalTriggerCount) || 0;
} catch (t) {
this._totalTriggerCount = 0;
hs.storage.setItem(r.CLOUD_ID_BUNDLE, JSON.stringify({
totalTriggerCount: 0,
dateStr: e
}));
} else {
hs.storage.setItem(r.CLOUD_ID_BUNDLE, JSON.stringify({
totalTriggerCount: 0,
dateStr: e
}));
this._totalTriggerCount = 0;
}
};
e.prototype._persistData = function() {
hs.storage.setItem(r.CLOUD_ID_BUNDLE, JSON.stringify({
totalTriggerCount: this._totalTriggerCount,
dateStr: hs.getTodayDate()
}));
};
e.prototype._logFeature = function() {};
e.prototype._realGameTime = function() {
return Math.floor(hs.chapterTimerInfo.spendTime / 1e3);
};
e.prototype._getFallbackLevelId = function() {
var t = hs.chapterGameInfo.chapterNum;
if (t) {
var e = Number(t);
return Number.isFinite(e) ? e : void 0;
}
};
e.prototype.checkShieldAdvByCondition = function(t) {
var e = this._shouldRemoveInterstitialAd();
t.args[0] = e;
e && (t.returnState = !0);
};
var r;
e.CLOUD_ID_BUNDLE = "$2769_f_quickPassLevelEmbraveTrait";
e.DRAGON_SKE = "spine/jlc_fastwin_ske";
e.DRAGON_ATLAS = "spine/jlc_fastwin_tex";
e.ARMATURE_NAME = "armatureName";
e.AUDIO_FASTWIN = "audio/fastwin";
e.LEVEL_TIME_CONFIG = {
1: 32,
2: 26,
3: 38,
4: 35,
5: 46,
6: 49,
7: 53,
8: 60,
9: 66,
10: 68,
11: 74,
12: 77,
13: 45,
14: 39,
15: 48,
16: 60,
17: 67,
18: 65,
19: 60,
20: 59,
21: 82,
22: 92,
23: 121,
24: 111,
25: 53,
26: 61,
27: 67,
28: 83,
29: 75,
30: 98,
31: 89,
32: 105,
33: 102,
34: 133,
35: 123,
36: 142,
37: 78,
38: 71,
39: 69,
40: 93,
41: 94,
42: 103,
43: 63,
44: 76,
45: 82,
46: 123,
47: 118,
48: 173,
49: 49,
50: 25,
51: 33,
52: 41,
53: 59,
54: 56,
55: 68,
56: 74,
57: 94,
58: 87,
59: 100,
60: 100,
61: 36,
62: 43,
63: 66,
64: 63,
65: 72,
66: 81,
67: 83,
68: 81,
69: 114,
70: 130,
71: 156,
72: 159,
73: 60,
74: 74,
75: 78,
76: 115,
77: 110,
78: 139,
79: 91,
80: 163,
81: 178,
82: 195,
83: 183,
84: 193,
85: 75,
86: 112,
87: 103,
88: 126,
89: 97,
90: 150,
91: 70,
92: 91,
93: 115,
94: 174,
95: 120,
96: 270
};
return r = n([ classId("$2769_f_quickPassLevelEmbraveTrait") ], e);
}(Trait);
r.$2769_f_quickPassLevelEmbraveTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "$2769_f_quickPassLevelEmbraveTrait" ]);
//# sourceMappingURL=index.js.map
