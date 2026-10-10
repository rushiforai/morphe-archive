window.__require = function t(e, r, n) {
function i(a, s) {
if (!r[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var f = r[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return i(e[a][1][t] || t);
}, f, f.exports, t, e, r, n);
}
return r[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < n.length; a++) i(n[a]);
return i;
}({
JAEJ_762_f_WinStreakResurrectedTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "0bbcc7MrdZIrr1C/qkcTmZ6", "JAEJ_762_f_WinStreakResurrectedTrait");
var n, i = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, n) {
var i, o = arguments.length, a = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, n); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (o < 3 ? i(a) : o > 3 ? i(e, r, a) : i(e, r)) || a);
return o > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.JAEJ_762_f_WinStreakResurrectedTrait = void 0;
var a = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.registerTraitEventsMethods = function() {
return [];
};
e.prototype.data = function() {
var t = storage.getItem("WinStreakResurrectedData", {
gameNum: 0,
triggerCount: 1,
continuityPassLevelCount: 0
});
("number" != typeof t.continuityPassLevelCount || isNaN(t.continuityPassLevelCount)) && (t.continuityPassLevelCount = 0);
return t;
};
e.prototype.getContinuityPassLevelCount = function() {
return hs.chapterContinuityPassLevelVo.continuityPassLevelCount;
};
e.prototype.onActive = function(t) {
if (hs.tp.isChapterGame_ProxyOnStartGame(t)) {
if (this.state.gameNum !== hs.chapterGameInfo.gameNum) {
this.state.gameNum = hs.chapterGameInfo.gameNum;
this.state.triggerCount = 1;
}
storage.setItem("WinStreakResurrectedData", this.state);
}
if (hs.tp.isChapterRevive_ProxyIsOpenRevive(t)) {
var e = this.getContinuityPassLevelCount();
if (this.state.triggerCount <= 0 || e < 3) return;
this.state.triggerCount--;
storage.setItem("WinStreakResurrectedData", this.state);
t.args[0] = !0;
t.args[1] = !0;
}
};
return o([ classId("JAEJ_762_f_WinStreakResurrectedTrait") ], e);
}(Trait);
r.JAEJ_762_f_WinStreakResurrectedTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "JAEJ_762_f_WinStreakResurrectedTrait" ]);
//# sourceMappingURL=index.js.map
