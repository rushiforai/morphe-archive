window.__require = function t(e, i, n) {
function r(a, s) {
if (!i[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var p = i[a] = {
exports: {}
};
e[a][0].call(p.exports, function(t) {
return r(e[a][1][t] || t);
}, p, p.exports, t, e, i, n);
}
return i[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < n.length; a++) r(n[a]);
return r;
}({
BrandVisionDesign1Trait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "9bf1bPqbyJI/rP3L5u2Covt", "BrandVisionDesign1Trait");
var n, r = this && this.__extends || (n = function(t, e) {
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
}), o = this && this.__decorate || function(t, e, i, n) {
var r, o = arguments.length, a = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, i) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, n); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (a = (o < 3 ? r(a) : o > 3 ? r(e, i, a) : r(e, i)) || a);
return o > 3 && a && Object.defineProperty(e, i, a), a;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.BrandVisionDesign1Trait = void 0;
var a = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isPlaying = !1;
return e;
}
e.prototype.onActive = function(t) {
hs.tp.isLaunchReadyToEnterGame(t) && (this._isPlaying || this.playAudio());
if (hs.tp.isAudio_ProxyStopAllEffects(t)) {
var e = hs.audioInfo.getPlayingAudioIdByUrl(hs.AudioConfig.BackgroundWhiteNoise.url);
-1 !== e && cc.audioEngine.stop(e);
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
this._isPlaying = !0;
var i = hs.gameInfo.gameNum || 0, n = void 0 !== hs.gameInfo.gameType ? hs.gameInfo.gameType.toString() : "";
DC("app_setting_humansound_success", {
game_id: i > 0 ? i.toString() : "",
game_type: n,
is_of_success: 1,
app_setting: 1
});
}
};
return o([ classId("BrandVisionDesign1Trait") ], e);
}(Trait);
i.BrandVisionDesign1Trait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "BrandVisionDesign1Trait" ]);
//# sourceMappingURL=index.js.map
