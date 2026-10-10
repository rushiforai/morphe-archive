window.__require = function t(e, r, n) {
function i(s, a) {
if (!r[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var f = r[s] = {
exports: {}
};
e[s][0].call(f.exports, function(t) {
return i(e[s][1][t] || t);
}, f, f.exports, t, e, r, n);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < n.length; s++) i(n[s]);
return i;
}({
JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "0ffdev7BlFI4qdM3w0ZNJm1", "JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait");
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
var i, o = arguments.length, s = o < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, n); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (s = (o < 3 ? i(s) : o > 3 ? i(e, r, s) : i(e, r)) || s);
return o > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "continuityPassLevelLimit", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.continuityPassLevelLimit) && void 0 !== e ? e : 3;
},
enumerable: !1,
configurable: !0
});
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
if (this.state.triggerCount <= 0 || e < this.continuityPassLevelLimit) return;
this.state.triggerCount--;
storage.setItem("WinStreakResurrectedData", this.state);
t.args[0] = !0;
t.args[1] = !0;
}
};
return o([ classId("JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait") ], e);
}(Trait);
r.JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "JAEJ_762_f_WinStreakResurrectedAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
