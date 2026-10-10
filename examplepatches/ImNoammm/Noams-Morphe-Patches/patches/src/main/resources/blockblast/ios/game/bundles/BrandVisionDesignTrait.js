window.__require = function n(e, i, o) {
function a(r, s) {
if (!i[r]) {
if (!e[r]) {
var l = r.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (t) return t(l, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = l;
}
var c = i[r] = {
exports: {}
};
e[r][0].call(c.exports, function(n) {
return a(e[r][1][n] || n);
}, c, c.exports, n, e, i, o);
}
return i[r].exports;
}
for (var t = "function" == typeof __require && __require, r = 0; r < o.length; r++) a(o[r]);
return a;
}({
BrandVisionDesignTraitAudioConfig: [ function(n, e, i) {
"use strict";
cc._RF.push(e, "999afqmOGBOC4/uoTqbz92H", "BrandVisionDesignTraitAudioConfig");
Object.defineProperty(i, "__esModule", {
value: !0
});
i.AudioConfigType = i.satisfies = i.BrandVisionDesignTraitAudioConfig = void 0;
var o = n("../../../../../scripts/base/audio/AudioInfo");
i.BrandVisionDesignTraitAudioConfig = {
man_gaokang: {
url: "audios/man_gaokang",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
},
man_lengjing: {
url: "audios/man_lengjing",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
},
man_huopo: {
url: "audios/man_huopo",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
},
man_dichen: {
url: "audios/man_dichen",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
},
woman_lengjing: {
url: "audios/woman_lengjing",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
},
woman_huopo: {
url: "audios/woman_huopo",
type: o.AudioType.EFFECT,
volume: 1,
bundleName: "BrandVisionDesignTrait"
}
};
cc._RF.pop();
}, {
"../../../../../scripts/base/audio/AudioInfo": void 0
} ],
BrandVisionDesignTrait: [ function(n, e, i) {
"use strict";
cc._RF.push(e, "aaea8F6L5tIa5nFycvt7X6E", "BrandVisionDesignTrait");
var o, a = this && this.__extends || (o = function(n, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(n, e) {
n.__proto__ = e;
} || function(n, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (n[i] = e[i]);
})(n, e);
}, function(n, e) {
o(n, e);
function i() {
this.constructor = n;
}
n.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), t = this && this.__decorate || function(n, e, i, o) {
var a, t = arguments.length, r = t < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(n, e, i, o); else for (var s = n.length - 1; s >= 0; s--) (a = n[s]) && (r = (t < 3 ? a(r) : t > 3 ? a(e, i, r) : a(e, i)) || r);
return t > 3 && r && Object.defineProperty(e, i, r), r;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.BrandVisionDesignTrait = void 0;
var r = function(n) {
a(e, n);
function e() {
return null !== n && n.apply(this, arguments) || this;
}
e.prototype.onActive = function(n) {
hs.tp.isClassScoreTip_ProxyPlayHighScoreAudio(n) && this.playAudio(hs.BlockBlastAudioType.ClassNewRecord);
(hs.tp.isClassWin_ProxyOpenUI(n) || hs.tp.isClassFail_ProxyOpenUI(n) || hs.tp.isChapterWin_ProxyOpenUI(n) || hs.tp.isChapterFail_ProxyOpenUI(n)) && this.playAudio(hs.BlockBlastAudioType.GameOver);
if (hs.tp.isHomePageSectionClassBtnDefaultOnClick(n) && hs.noSignalInfo.canOpenNoSignal(hs.NoSignalType.EnterGameIng)) {
if (!this.checkEnterGameIngLimitActive()) return;
n.replace = !0;
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_ShowUI({
noSignalType: hs.NoSignalType.EnterGameIng,
callback: function() {
n.originalCaller();
}
}));
}
if (hs.tp.isAddMoreGameTraitOnClickMoreGame(n) && hs.noSignalInfo.canOpenNoSignal(hs.NoSignalType.EnterGameIng)) {
if (!this.checkEnterGameIngLimitActive()) return;
n.replace = !0;
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_ShowUI({
noSignalType: hs.NoSignalType.EnterGameIng,
callback: function() {
n.originalCaller();
}
}));
}
if (hs.tp.isHomePageSectionChapterBtnDefaultOnClick(n) && hs.noSignalInfo.canOpenNoSignal(hs.NoSignalType.EnterGameIng)) {
if (!this.checkEnterGameIngLimitActive()) return;
n.replace = !0;
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_ShowUI({
noSignalType: hs.NoSignalType.EnterGameIng,
callback: function() {
n.originalCaller();
}
}));
}
if (hs.tp.isHomePage_ProxyShowNoSignal(n) && hs.noSignalInfo.canOpenNoSignal(hs.NoSignalType.HomePage)) {
if (!this.checkHomePageLimitActive()) return;
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_ShowUI({
noSignalType: hs.NoSignalType.HomePage,
callback: null
}));
}
if (hs.tp.isLaunch_ProxyEnterGame(n) && hs.noSignalInfo.canOpenNoSignal(hs.NoSignalType.Loading)) {
if (!this.checkLoadingLimitActive()) return;
n.replace = !0;
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_ShowUI({
noSignalType: hs.NoSignalType.Loading,
callback: function() {
n.originalCaller();
}
}));
}
hs.tp.isButtonClick_ProxyPlayButtonClickSound(n) && hs.UI.activeState(hs.PrefabConfig.NoSignal.url) && (n.replace = !0);
};
e.prototype.playAudio = function(n) {
var e, i, o = null === (i = ((null === (e = this.props) || void 0 === e ? void 0 : e.audio) || []).find(function(e) {
return e.pos === n;
})) || void 0 === i ? void 0 : i.audio;
if (o) {
hs.audioInfo.play({
url: "audios/" + o,
bundleName: "BrandVisionDesignTrait"
});
hs.EventManager.dispatchModuleEvent(new hs.E_NoSignal_PlayAudioDot({
audioType: n,
is_of_success: 1
}));
}
};
e.prototype.checkEnterGameIngLimitActive = function() {
return !0;
};
e.prototype.checkHomePageLimitActive = function() {
return !0;
};
e.prototype.checkLoadingLimitActive = function() {
return !0;
};
return t([ classId("BrandVisionDesignTrait"), classMethodWatch() ], e);
}(Trait);
i.BrandVisionDesignTrait = r;
cc._RF.pop();
}, {} ]
}, {}, [ "BrandVisionDesignTraitAudioConfig", "BrandVisionDesignTrait" ]);
//# sourceMappingURL=index.js.map
