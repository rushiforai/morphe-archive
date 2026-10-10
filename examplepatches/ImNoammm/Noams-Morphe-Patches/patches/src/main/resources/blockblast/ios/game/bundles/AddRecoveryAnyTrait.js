window.__require = function e(t, r, o) {
function n(c, a) {
if (!r[c]) {
if (!t[c]) {
var u = c.split("/");
u = u[u.length - 1];
if (!t[u]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = u;
}
var y = r[c] = {
exports: {}
};
t[c][0].call(y.exports, function(e) {
return n(t[c][1][e] || e);
}, y, y.exports, e, t, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
AddRecoveryAnyTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "da144O0Y9lNzaSKZ2jFvCnq", "AddRecoveryAnyTrait");
var o, n = this && this.__extends || (o = function(e, t) {
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
var n, i = arguments.length, c = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var a = e.length - 1; a >= 0; a--) (n = e[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(t, r, c) : n(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryAnyTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.isRestoreDataProviderTraitOnRecvDataSucc = function() {
this.executeRestore();
};
t.prototype.executeRestore = function() {
this.recoveryLoginDays();
this.recoveryAdInfo();
this.recoveryGMMData();
this.recoveryClickData();
this.recoveryEndlessGameCount();
};
t.prototype.recoveryLoginDays = function() {
var e = TRAIT("RestoreLoginDaysTrait");
(null == e ? void 0 : e.active) && e.executeRestore();
};
t.prototype.recoveryAdInfo = function() {
var e = TRAIT("RestoreAdSensitivityDataTrait");
(null == e ? void 0 : e.active) && e.executeRestore();
};
t.prototype.recoveryGMMData = function() {
var e = TRAIT("RestoreGMMClusterDataTrait");
(null == e ? void 0 : e.active) && e.executeRestore();
};
t.prototype.recoveryClickData = function() {
var e = TRAIT("RestoreBlockClickOrderDataTrait");
(null == e ? void 0 : e.active) && e.executeRestore();
};
t.prototype.recoveryEndlessGameCount = function() {
var e = TRAIT("RestoreEndlessGameCountTrait");
(null == e ? void 0 : e.active) && e.executeRestore();
};
return i([ classId("AddRecoveryAnyTrait") ], t);
}(Trait);
r.AddRecoveryAnyTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryAnyTrait" ]);
//# sourceMappingURL=index.js.map
