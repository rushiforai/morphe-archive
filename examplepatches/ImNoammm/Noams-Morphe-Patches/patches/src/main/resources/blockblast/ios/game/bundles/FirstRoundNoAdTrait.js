window.__require = function e(t, r, i) {
function o(s, d) {
if (!r[s]) {
if (!t[s]) {
var a = s.split("/");
a = a[a.length - 1];
if (!t[a]) {
var c = "function" == typeof __require && __require;
if (!d && c) return c(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = a;
}
var l = r[s] = {
exports: {}
};
t[s][0].call(l.exports, function(e) {
return o(t[s][1][e] || e);
}, l, l.exports, e, t, r, i);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < i.length; s++) o(i[s]);
return o;
}({
FirstRoundNoAdTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "17450nT+DtFOar1NmL8eV8w", "FirstRoundNoAdTrait");
var i, o = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
i(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), n = this && this.__decorate || function(e, t, r, i) {
var o, n = arguments.length, s = n < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, i); else for (var d = e.length - 1; d >= 0; d--) (o = e[d]) && (s = (n < 3 ? o(s) : n > 3 ? o(t, r, s) : o(t, r)) || s);
return n > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.FirstRoundNoAdTrait = void 0;
var s = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isColdFirst = !1;
t.coldFirstGameEnded = !1;
t.logKey = "FirstRoundNoAdTrait";
return t;
}
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "Advertisement_Proxy",
methodName: "onGameOverGameEndPre"
}, {
className: "Advertisement_Proxy",
methodName: "onGameInitComplete"
}, {
className: "Advertisement_Proxy",
methodName: "onGameStart"
} ];
};
t.prototype.onActive = function(e) {
if (hs.tp.isAdvertisement_ProxyOnGameInitComplete(e)) {
this.isColdFirst = !0;
this.coldFirstGameEnded = !1;
}
hs.tp.isAdvertisement_ProxyOnGameOverGameEndPre(e) && this.isColdFirst && (this.coldFirstGameEnded = !0);
if (hs.tp.isAdvertisement_ProxyOnGameStart(e) && this.coldFirstGameEnded) {
this.isColdFirst = !1;
this.coldFirstGameEnded = !1;
}
hs.tp.isClassAdvertisement_FullScreenProxyShieldPlayAdvertisement(e) && this.checkShieldAd() && (e.args[0] = !0);
hs.tp.isChapterAdvertisement_FullScreenProxyReShieldPlayAdvertisement(e) && 0 == e.args[0] && this.checkShieldAd() && (e.args[0] = !0);
};
t.prototype.checkShieldAd = function() {
var e, t, r = null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.activeDays) && void 0 !== t ? t : 0, i = !1;
if (this.isColdFirst) if (r) {
var o = hs.gameInfo.installTime;
hs.gameInfo.gameMode == hs.GameMode.Chapter && (o = hs.storage.getItem("chapterPeriodsBeginTime", 0));
Math.floor((Date.now() - o) / 1e3) < 86400 * r && (i = !0);
} else i = !0;
i && (i = this.isSheildFullScreenAd());
return i;
};
t.prototype.isSheildFullScreenAd = function(e) {
return !e;
};
return n([ classId("FirstRoundNoAdTrait"), classMethodWatch() ], t);
}(Trait);
r.FirstRoundNoAdTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "FirstRoundNoAdTrait" ]);
//# sourceMappingURL=index.js.map
