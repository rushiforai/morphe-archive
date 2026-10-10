window.__require = function e(t, r, n) {
function i(o, a) {
if (!r[o]) {
if (!t[o]) {
var u = o.split("/");
u = u[u.length - 1];
if (!t[u]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(u, !0);
if (s) return s(u, !0);
throw new Error("Cannot find module '" + o + "'");
}
o = u;
}
var c = r[o] = {
exports: {}
};
t[o][0].call(c.exports, function(e) {
return i(t[o][1][e] || e);
}, c, c.exports, e, t, r, n);
}
return r[o].exports;
}
for (var s = "function" == typeof __require && __require, o = 0; o < n.length; o++) i(n[o]);
return i;
}({
AdProtectAdjustParamsTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "0bcfdDlXvRDcL5+v0FN/b6m", "AdProtectAdjustParamsTrait");
var n, i = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), s = this && this.__decorate || function(e, t, r, n) {
var i, s = arguments.length, o = s < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(e, t, r, n); else for (var a = e.length - 1; a >= 0; a--) (i = e[a]) && (o = (s < 3 ? i(o) : s > 3 ? i(t, r, o) : i(t, r)) || o);
return s > 3 && o && Object.defineProperty(t, r, o), o;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AdProtectAdjustParamsTrait = void 0;
var o = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
Object.defineProperty(t.prototype, "adjustTime", {
get: function() {
var e;
return null !== (e = this.props.adjustTime) && void 0 !== e ? e : 2;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "first", {
get: function() {
var e, t = this.getAdProtectParamsOverride();
return null !== t && void 0 !== t.first ? t.first : null !== (e = this.props.first) && void 0 !== e ? e : 4;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "noFirst", {
get: function() {
var e, t = this.getAdProtectParamsOverride();
return null !== t && void 0 !== t.noFirst ? t.noFirst : null !== (e = this.props.noFirst) && void 0 !== e ? e : 3;
},
enumerable: !1,
configurable: !0
});
t.prototype.getAdProtectParamsOverride = function() {
return null;
};
t.prototype.onActive = function(e) {
(hs.tp.isAdvertisement_FullScene_ProxyShieldPlayAdvertisement(e) || hs.tp.isClassAdvertisement_FullScreenProxyShieldPlayAdvertisement(e) || hs.tp.isChapterAdvertisement_FullScreenProxyShieldPlayAdvertisement(e) || hs.tp.isJewelAdvertisement_FullScreen_ProxyShieldPlayAdvertisement(e)) && this.canPlayFullScreenAd(e);
if (hs.tp.isAdvertisement_Load_ProxyIsCanLoadClassFullScreenAd(e) || hs.tp.isAdvertisement_Load_ProxyIsCanLoadChapterFullScreenAd(e) || hs.tp.isAdvertisement_Load_ProxyIsCanLoadOtherFullScreenAd(e)) {
if (!this.isCanTrigger) return;
this.canLoadFullScreenAd(e);
}
};
Object.defineProperty(t.prototype, "isCanTrigger", {
get: function() {
return !this.isRemoveAdProtect();
},
enumerable: !1,
configurable: !0
});
t.prototype.isRemoveAdProtect = function() {
return !1;
};
t.prototype.canPlayFullScreenAd = function(e) {
if (this.isCanTrigger) {
var t = storage.getItem("chapterGameNumNoRefresh", 0), r = storage.getItem("classGameNumNoRefresh", 0), n = storage.getItem("jewelGameNumNoRefresh", 0);
if (hs.advertisementGameInfo.judgeInterstitialstate(hs.advertisementGameInfo.advertisementParemeters)) {
var i = r + t + n;
if (1 == hs.gameInfo.gameEntryCount && i < this.first + 1) {
e.args[0] = !0;
e.returnState = !0;
} else if (hs.gameInfo.gameEntryCount > this.adjustTime - 1 && i < this.noFirst + 1) {
e.args[0] = !0;
e.returnState = !0;
} else if (this.betweenUseFirst && hs.gameInfo.gameEntryCount > 1 && hs.gameInfo.gameEntryCount <= this.adjustTime - 1 && i < this.first + 1) {
e.args[0] = !0;
e.returnState = !0;
}
}
}
};
t.prototype.canLoadFullScreenAd = function(e) {
var t = storage.getItem("chapterGameNumNoRefresh", 0), r = storage.getItem("classGameNumNoRefresh", 0) + t + storage.getItem("jewelGameNumNoRefresh", 0);
if (1 == hs.gameInfo.gameEntryCount && r < this.first) {
if (this.needShieldAdvertisement(!0)) {
e.args[0] = !1;
e.returnState = !0;
}
} else if (hs.gameInfo.gameEntryCount > this.adjustTime - 1 && r < this.noFirst) {
if (this.needShieldAdvertisement(!0)) {
e.args[0] = !1;
e.returnState = !0;
}
} else if (this.betweenUseFirst && hs.gameInfo.gameEntryCount > 1 && hs.gameInfo.gameEntryCount <= this.adjustTime - 1 && r < this.first + 1 && this.needShieldAdvertisement(!0)) {
e.args[0] = !1;
e.returnState = !0;
}
};
t.prototype.needShieldAdvertisement = function(e) {
return e;
};
Object.defineProperty(t.prototype, "betweenUseFirst", {
get: function() {
var e;
return null !== (e = this.props.betweenUseFisrt) && void 0 !== e && e;
},
enumerable: !1,
configurable: !0
});
return s([ classId("AdProtectAdjustParamsTrait"), classMethodWatch() ], t);
}(Trait);
r.AdProtectAdjustParamsTrait = o;
cc._RF.pop();
}, {} ]
}, {}, [ "AdProtectAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
