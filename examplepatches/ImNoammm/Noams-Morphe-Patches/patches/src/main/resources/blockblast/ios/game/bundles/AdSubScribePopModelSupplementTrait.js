window.__require = function e(t, r, o) {
function p(n, a) {
if (!r[n]) {
if (!t[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!t[u]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var l = r[n] = {
exports: {}
};
t[n][0].call(l.exports, function(e) {
return p(t[n][1][e] || e);
}, l, l.exports, e, t, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) p(o[n]);
return p;
}({
AdSubScribePopModelSupplementTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "1453bB4LD1BdbQ60dm1Ez7J", "AdSubScribePopModelSupplementTrait");
var o, p = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, o) {
var p, i = arguments.length, n = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var a = e.length - 1; a >= 0; a--) (p = e[a]) && (n = (i < 3 ? p(n) : i > 3 ? p(t, r, n) : p(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AdSubScribePopModelSupplementTrait = void 0;
var n = function(e) {
p(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._supplementData = null;
return t;
}
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return hs.ipaModelRemoveAdMethodInfo.isSubscriptionDisplayEnabled();
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
hs.tp.isIpaPreRemoveAdMainOnEnable(e) && this._handleTypeCView();
hs.tp.isIpaPreRemoveAdMainOnDisable(e) && this._handleTypeCClose();
hs.tp.isAdSubScribePopModelTraitResetClickHistory(e) && this._shouldResetClickHistory(e.args[0]) && (e.args[1] = !0);
if (hs.tp.isAdSubScribePopModelTraitGetUrl(e)) {
e.returnValue = "https://ai-server.afafb.com/infer/v1/pay_free_ad_popup_rec_v1_1";
e.returnState = !0;
}
};
Object.defineProperty(t.prototype, "supplementData", {
get: function() {
this._supplementData || (this._supplementData = hs.storage.getItem("AdSubScribePopModelSupplementData", {
last_req_type: "",
had_vip: !1
}));
return this._supplementData;
},
enumerable: !1,
configurable: !0
});
t.prototype._saveSupplementData = function() {
hs.storage.setItem("AdSubScribePopModelSupplementData", this.supplementData);
};
t.prototype._shouldResetClickHistory = function(e) {
var t = !1;
this.supplementData.last_req_type !== e && (t = !0);
this.supplementData.last_req_type = e;
var r = hs.ipaModelRemoveAdMethodInfo.getVipState();
if (r) {
var o = !!r.isVip;
if (this.supplementData.had_vip && !o) {
t = !0;
this.supplementData.had_vip = !1;
}
o && (this.supplementData.had_vip = !0);
}
this._saveSupplementData();
return t;
};
t.prototype._handleTypeCView = function() {
DS("g_game_subscribepopuptypec_view", {});
};
t.prototype._handleTypeCClose = function() {
DS("g_game_subscribepopuptypec_close", {});
};
return i([ classId("AdSubScribePopModelSupplementTrait") ], t);
}(Trait);
r.AdSubScribePopModelSupplementTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "AdSubScribePopModelSupplementTrait" ]);
//# sourceMappingURL=index.js.map
