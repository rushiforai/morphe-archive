window.__require = function t(e, r, i) {
function n(u, s) {
if (!r[u]) {
if (!e[u]) {
var c = u.split("/");
c = c[c.length - 1];
if (!e[c]) {
var a = "function" == typeof __require && __require;
if (!s && a) return a(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = c;
}
var h = r[u] = {
exports: {}
};
e[u][0].call(h.exports, function(t) {
return n(e[u][1][t] || t);
}, h, h.exports, t, e, r, i);
}
return r[u].exports;
}
for (var o = "function" == typeof __require && __require, u = 0; u < i.length; u++) n(i[u]);
return n;
}({
PushDispatchCentralTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "45c15fc5t1BIYN32HluXh/q", "PushDispatchCentralTrait");
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
var n, o = arguments.length, u = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (u = (o < 3 ? n(u) : o > 3 ? n(e, r, u) : n(e, r)) || u);
return o > 3 && u && Object.defineProperty(e, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PushDispatchCentralTrait = void 0;
var u = [ "AchievementPushMixTrait", "SkinChangeAblePushTrait", "PreLostUserPushTrait" ], s = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._pushList = [];
return e;
}
e.prototype.onCreate = function() {
for (var t = this.pushTraitList, e = [], r = [], i = 0; i < t.length; i++) {
var n = t[i];
if (!(r.indexOf(n) >= 0)) {
r.push(n);
var o = this.getPushTraitName(n);
o && e.push(o);
}
}
this._pushList = e;
this.registerGmMenu();
};
e.prototype.onActive = function(t) {
hs.tp.isLaunchChangeLaunchScene(t) && this.checkCurrentPushTraitActive();
hs.tp.isPushDispatchCentralInfoGetPushPriorityList(t) && this.setPushPriorityList(t);
};
Object.defineProperty(e.prototype, "pushTraitList", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.pushTraitList) && void 0 !== e ? e : [];
},
enumerable: !1,
configurable: !0
});
e.prototype.checkCurrentPushTraitActive = function() {
hs.pushDispatchCentralInfo.checkCurrentPushTraitActive();
};
e.prototype.setPushPriorityList = function(t) {
t.returnValue = this._pushList;
t.returnState = !0;
};
e.prototype.registerGmMenu = function() {};
e.prototype.handleGmSetCurrentPush = function() {};
e.prototype.printGmUsage = function() {};
e.prototype.getPushTraitName = function(t) {
return t > 0 && t <= u.length ? u[t - 1] : "";
};
return o([ classId("PushDispatchCentralTrait") ], e);
}(Trait);
r.PushDispatchCentralTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "PushDispatchCentralTrait" ]);
//# sourceMappingURL=index.js.map
