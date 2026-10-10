window.__require = function e(t, r, o) {
function i(n, c) {
if (!r[n]) {
if (!t[n]) {
var d = n.split("/");
d = d[d.length - 1];
if (!t[d]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(d, !0);
if (s) return s(d, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = d;
}
var u = r[n] = {
exports: {}
};
t[n][0].call(u.exports, function(e) {
return i(t[n][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
AddRecoveryEndTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "0e5bbYURHVH1ag/kyJO4NHr", "AddRecoveryEndTrait");
var o, i = this && this.__extends || (o = function(e, t) {
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
}), s = this && this.__decorate || function(e, t, r, o) {
var i, s = arguments.length, n = s < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (n = (s < 3 ? i(n) : s > 3 ? i(t, r, n) : i(t, r)) || n);
return s > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryEndTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isFirstEnd = void 0;
t._isNeedRestore = void 0;
t.storageKey = "AddRecoveryEndTrait_isFirstEnd";
return t;
}
t.prototype.onCreate = function() {
this.loadData();
};
t.prototype.loadData = function() {
this.isFirstEnd = hs.storage.getItem(this.storageKey, !0);
};
t.prototype.setData = function() {
hs.storage.setItem(this.storageKey, this.isFirstEnd);
};
t.prototype.isClassTopInfoInitCompelte = function() {
this.isNeedRestore() && this.isFirstEnd && this.setHighNodeActive(!1);
};
t.prototype.isClassGameOver_IOS_GameEnd_Dot_ProxyOnGameEndOrReplay = function() {
if (this.isNeedRestore() && this.isFirstEnd) {
this.isFirstEnd = !1;
this.setData();
this.executeRestore();
}
};
t.prototype.isNeedRestore = function() {
if (void 0 !== this._isNeedRestore) return this._isNeedRestore;
var e = TRAIT("RestoreDataProviderTrait");
if (!(null == e ? void 0 : e.active)) {
this._isNeedRestore = !1;
return !1;
}
if (!e.isNeedRestore()) {
this._isNeedRestore = !1;
return !1;
}
this._isNeedRestore = !0;
return !0;
};
t.prototype.setHighNodeActive = function(e) {
var t = Cinst(hs.ClassTopInfo);
cc.isValid(t) && cc.isValid(null == t ? void 0 : t.highNode) && (t.highNode.active = e);
};
t.prototype.executeRestore = function() {
this.recoveryHighScore();
this.setHighNodeActive(!0);
};
t.prototype.recoveryHighScore = function() {
var e, t = TRAIT("RestoreEndlessHighScoreTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
return s([ classId("AddRecoveryEndTrait") ], t);
}(Trait);
r.AddRecoveryEndTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryEndTrait" ]);
//# sourceMappingURL=index.js.map
