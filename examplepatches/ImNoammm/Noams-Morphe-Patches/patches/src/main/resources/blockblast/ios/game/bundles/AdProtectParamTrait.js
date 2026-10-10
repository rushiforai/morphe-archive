window.__require = function e(t, r, a) {
function n(i, s) {
if (!r[i]) {
if (!t[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!t[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var l = r[i] = {
exports: {}
};
t[i][0].call(l.exports, function(e) {
return n(t[i][1][e] || e);
}, l, l.exports, e, t, r, a);
}
return r[i].exports;
}
for (var o = "function" == typeof __require && __require, i = 0; i < a.length; i++) n(a[i]);
return n;
}({
AdProtectParamTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "1253fKxQqxFUL/vh9ZA4gRL", "AdProtectParamTrait");
var a, n = this && this.__extends || (a = function(e, t) {
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
}), o = this && this.__decorate || function(e, t, r, a) {
var n, o = arguments.length, i = o < 3 ? t : null === a ? a = Object.getOwnPropertyDescriptor(t, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, a); else for (var s = e.length - 1; s >= 0; s--) (n = e[s]) && (i = (o < 3 ? n(i) : o > 3 ? n(t, r, i) : n(t, r)) || i);
return o > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AdProtectParamTrait = void 0;
var i = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.fixTraitName = "AdProtectTrait";
return t;
}
t.prototype.onActive = function(e) {
if (hs.tp.isAdProtectTraitCanPlayFullScreenAd(e) || hs.tp.isAdProtectAdjustParamsTraitCanPlayFullScreenAd(e)) {
var t = e.args[0];
this.canPlayFullScreenAdFix(t);
e.replace = !0;
}
if (hs.tp.isAdProtectTraitCanLoadFullScreenAd(e) || hs.tp.isAdProtectAdjustParamsTraitCanLoadFullScreenAd(e)) {
t = e.args[0];
this.canLoadFullScreenAdFix(t);
e.replace = !0;
}
};
t.prototype.canPlayFullScreenAdFix = function(e) {
var t = TRAIT(this.fixTraitName), r = TRAIT("AdProtectAdjustParamsTrait");
if (((null == t ? void 0 : t.active) || (null == r ? void 0 : r.active)) && hs.advertisementGameInfo.judgeInterstitialstate(hs.advertisementGameInfo.advertisementParemeters)) {
var a = null == t ? void 0 : t.adjustTime, n = null == t ? void 0 : t.first, o = null == t ? void 0 : t.noFirst, i = storage.getItem("chapterGameNumNoRefresh", 0), s = storage.getItem("classGameNumNoRefresh", 0) + i + storage.getItem("jewelGameNumNoRefresh", 0);
if (hs.gameInfo.gameEntryCount < a && s < n + 1) {
e.args[0] = !0;
e.returnState = !0;
} else if (hs.gameInfo.gameEntryCount >= a && s < o + 1) {
e.args[0] = !0;
e.returnState = !0;
}
}
};
t.prototype.canLoadFullScreenAdFix = function(e) {
var t = TRAIT(this.fixTraitName), r = TRAIT("AdProtectAdjustParamsTrait");
if ((null == t ? void 0 : t.active) || (null == r ? void 0 : r.active)) {
var a = t.adjustTime, n = t.first, o = t.noFirst, i = storage.getItem("chapterGameNumNoRefresh", 0), s = storage.getItem("classGameNumNoRefresh", 0) + i + storage.getItem("jewelGameNumNoRefresh", 0);
if (hs.gameInfo.gameEntryCount < a && s < n) {
if (this.needShieldAdvertisement(!0)) {
e.args[0] = !1;
e.returnState = !0;
}
} else if (hs.gameInfo.gameEntryCount >= a && s < o && this.needShieldAdvertisement(!0)) {
e.args[0] = !1;
e.returnState = !0;
}
}
};
t.prototype.needShieldAdvertisement = function(e) {
return e;
};
return o([ classId("AdProtectParamTrait") ], t);
}(Trait);
r.AdProtectParamTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "AdProtectParamTrait" ]);
//# sourceMappingURL=index.js.map
