window.__require = function t(e, r, o) {
function i(n, a) {
if (!r[n]) {
if (!e[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (s) return s(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var l = r[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return i(e[n][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
$1960_f_sessionFirstNoAdTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "237d2IxyQVMs4pAwkXijBQu", "$1960_f_sessionFirstNoAdTrait");
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
}), s = this && this.__decorate || function(t, e, r, o) {
var i, s = arguments.length, n = s < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (n = (s < 3 ? i(n) : s > 3 ? i(e, r, n) : i(e, r)) || n);
return s > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.$1960_f_sessionFirstNoAdTrait = void 0;
var n = "1960_f_sessionFirstNoAd_dailyData", a = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.logKey = "$1960_f_sessionFirstNoAdTrait";
e._modelLabel = null;
e._isRequesting = !1;
e._hasRequested = !1;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "Advertisement_Proxy",
methodName: "onGameInitComplete"
} ];
};
e.prototype.onActive = function(t) {
hs.tp.isAdvertisement_ProxyOnGameInitComplete(t) && this.requestModelData();
hs.tp.isFirstRoundNoAdTraitIsSheildFullScreenAd(t) && (this.checkShieldAd() || (t.args[0] = !0));
};
e.prototype.requestModelData = function() {
var t = this;
if (!this._isRequesting && !this._hasRequested) {
this._isRequesting = !0;
this._hasRequested = !0;
var e = hs.traitServerRequestInfo.uid;
if (e) {
var r = "https://bbios-nus.afafb.com/" + e + ".json";
hs.ResLoader.load(r, cc.JsonAsset, function(e, r) {
t._isRequesting = !1;
if (e) ; else try {
var o = r.json;
o && "number" == typeof o.label && (t._modelLabel = o.label);
} catch (t) {}
});
} else this._isRequesting = !1;
}
};
e.prototype.checkShieldAd = function() {
var t, e;
if (null === this._modelLabel) return !1;
var r = null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.val) && void 0 !== e ? e : -3;
if (this._modelLabel < r) return !1;
if (this.getDailyCount() >= 2) return !1;
this.increaseDailyCount();
return !0;
};
e.prototype.getDailyCount = function() {
var t = hs.storage.getItem(n);
return t && this.isToday(t.date) && t.count || 0;
};
e.prototype.increaseDailyCount = function() {
var t = this.getTodayDate(), e = hs.storage.getItem(n), r = 1;
e && this.isToday(e.date) && (r = (e.count || 0) + 1);
var o = {
count: r,
date: t
};
hs.storage.setItem(n, o);
};
e.prototype.isToday = function(t) {
return t === this.getTodayDate();
};
e.prototype.getTodayDate = function() {
var t = new Date();
return t.getFullYear() + "-" + String(t.getMonth() + 1).padStart(2, "0") + "-" + String(t.getDate()).padStart(2, "0");
};
return s([ classId("$1960_f_sessionFirstNoAdTrait") ], e);
}(Trait);
r.$1960_f_sessionFirstNoAdTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "$1960_f_sessionFirstNoAdTrait" ]);
//# sourceMappingURL=index.js.map
