window.__require = function t(e, i, n) {
function o(s, a) {
if (!i[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var p = "function" == typeof __require && __require;
if (!a && p) return p(u, !0);
if (r) return r(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var c = i[s] = {
exports: {}
};
e[s][0].call(c.exports, function(t) {
return o(e[s][1][t] || t);
}, c, c.exports, t, e, i, n);
}
return i[s].exports;
}
for (var r = "function" == typeof __require && __require, s = 0; s < n.length; s++) o(n[s]);
return o;
}({
BrandVisionDesign3Trait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "4bfb7UlaeRLdIZ6UCMlSgM5", "BrandVisionDesign3Trait");
var n, o = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
n(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), r = this && this.__decorate || function(t, e, i, n) {
var o, r = arguments.length, s = r < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, i) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, i, n); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (s = (r < 3 ? o(s) : r > 3 ? o(e, i, s) : o(e, i)) || s);
return r > 3 && s && Object.defineProperty(e, i, s), s;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.BrandVisionDesign3Trait = void 0;
var s = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
var e = this;
(hs.tp.isClassWin_ProxyOpenUI(t) || hs.tp.isClassFail_ProxyOpenUI(t) || hs.tp.isChapterWin_ProxyOpenUI(t)) && this.playAudio();
hs.tp.isChapterFail_ProxyOpenUI(t) && setTimeoutSafe(function() {
e.playAudio();
}, 1e3);
if (hs.tp.isAudio_ProxyStopAllEffects(t)) {
var i = hs.audioInfo.getPlayingAudioIdByUrl(hs.AudioConfig.BackgroundWhiteNoise.url);
-1 !== i && cc.audioEngine.stop(i);
t.replace = !0;
t.returnState = !0;
}
};
e.prototype.playAudio = function() {
var t, e = ((null === (t = this.props) || void 0 === t ? void 0 : t.audio) || [])[0].audio;
if (e) {
hs.audioInfo.play({
url: "audios/trait/brandVisionDesign/audios/" + e
});
var i = hs.gameInfo.gameNum || 0, n = void 0 !== hs.gameInfo.gameType ? hs.gameInfo.gameType.toString() : "";
DC("app_setting_humansound_success", {
game_id: i > 0 ? "" + (i - 1) : "",
game_type: n,
is_of_success: 1,
app_setting: 2
});
}
};
return r([ classId("BrandVisionDesign3Trait") ], e);
}(Trait);
i.BrandVisionDesign3Trait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "BrandVisionDesign3Trait" ]);
//# sourceMappingURL=index.js.map
