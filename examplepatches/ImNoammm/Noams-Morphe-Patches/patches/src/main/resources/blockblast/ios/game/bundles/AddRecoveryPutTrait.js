window.__require = function t(e, r, o) {
function i(n, c) {
if (!r[n]) {
if (!e[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!e[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (s) return s(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var d = r[n] = {
exports: {}
};
e[n][0].call(d.exports, function(t) {
return i(e[n][1][t] || t);
}, d, d.exports, t, e, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
AddRecoveryPutTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "d58f4Ml0CZM4o2WrzAMXEsl", "AddRecoveryPutTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (n = (s < 3 ? i(n) : s > 3 ? i(e, r, n) : i(e, r)) || n);
return s > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryPutTrait = void 0;
var n = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isFirstPut = void 0;
e._isNeedRestore = void 0;
e.storageKey = "AddRecoveryPutTrait_isFirstPut";
return e;
}
e.prototype.onCreate = function() {
this.loadData();
};
e.prototype.loadData = function() {
this.isFirstPut = hs.storage.getItem(this.storageKey, !0);
};
e.prototype.setData = function() {
hs.storage.setItem(this.storageKey, this.isFirstPut);
};
e.prototype.isClassTopInfoInitCompelte = function() {
this.isNeedRestore() && this.isFirstPut && this.setHighNodeActive(!1);
};
e.prototype.isClassBlocksProducer_ProxyOnTouchEnd = function() {
if (hs.classGuideInfo.isFinishedGuide && this.isNeedRestore() && this.isFirstPut) {
this.isFirstPut = !1;
this.setData();
this.executeRestore();
}
};
e.prototype.isNeedRestore = function() {
if (void 0 !== this._isNeedRestore) return this._isNeedRestore;
var t = TRAIT("RestoreDataProviderTrait");
if (!(null == t ? void 0 : t.active)) {
this._isNeedRestore = !1;
return !1;
}
if (!t.isNeedRestore()) {
this._isNeedRestore = !1;
return !1;
}
this._isNeedRestore = !0;
return !0;
};
e.prototype.executeRestore = function() {
this.recoveryHighScore();
this.setHighNodeActive(!0);
};
e.prototype.recoveryHighScore = function() {
var t, e = TRAIT("RestoreEndlessHighScoreTrait");
(null == e ? void 0 : e.active) && !(null === (t = e.props) || void 0 === t ? void 0 : t.isAlert) && e.executeRestore();
};
e.prototype.setHighNodeActive = function(t) {
var e = Cinst(hs.ClassTopInfo);
cc.isValid(e) && cc.isValid(null == e ? void 0 : e.highNode) && (e.highNode.active = t);
};
return s([ classId("AddRecoveryPutTrait") ], e);
}(Trait);
r.AddRecoveryPutTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryPutTrait" ]);
//# sourceMappingURL=index.js.map
