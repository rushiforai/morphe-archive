window.__require = function t(e, r, i) {
function n(s, a) {
if (!r[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var p = r[s] = {
exports: {}
};
e[s][0].call(p.exports, function(t) {
return n(e[s][1][t] || t);
}, p, p.exports, t, e, r, i);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < i.length; s++) n(i[s]);
return n;
}({
BrandVisionDesign2Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8bf25/CwMNCZYEh3O/QWRs0", "BrandVisionDesign2Trait");
var i, n = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
i(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, i) {
var n, o = arguments.length, s = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, i); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (o < 3 ? n(s) : o > 3 ? n(e, r, s) : n(e, r)) || s);
return o > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.BrandVisionDesign2Trait = void 0;
var s = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
hs.tp.isClassScoreTip_ProxyPlayHighScoreAudio(t) && this.playAudio();
};
e.prototype.playAudio = function() {
var t, e = ((null === (t = this.props) || void 0 === t ? void 0 : t.audio) || [])[0].audio;
if (e) {
hs.audioInfo.play({
url: "audios/trait/brandVisionDesign/audios/" + e
});
var r = hs.gameInfo.gameNum || 0, i = void 0 !== hs.gameInfo.gameType ? hs.gameInfo.gameType.toString() : "";
DC("app_setting_humansound_success", {
game_id: r > 0 ? r.toString() : "",
game_type: i,
is_of_success: 1,
app_setting: 3
});
}
};
return o([ classId("BrandVisionDesign2Trait") ], e);
}(Trait);
r.BrandVisionDesign2Trait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "BrandVisionDesign2Trait" ]);
//# sourceMappingURL=index.js.map
