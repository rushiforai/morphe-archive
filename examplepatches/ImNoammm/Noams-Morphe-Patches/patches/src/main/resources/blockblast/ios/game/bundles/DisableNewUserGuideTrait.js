window.__require = function e(t, s, r) {
function i(n, a) {
if (!s[n]) {
if (!t[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!t[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var d = s[n] = {
exports: {}
};
t[n][0].call(d.exports, function(e) {
return i(t[n][1][e] || e);
}, d, d.exports, e, t, s, r);
}
return s[n].exports;
}
for (var o = "function" == typeof __require && __require, n = 0; n < r.length; n++) i(r[n]);
return i;
}({
DisableNewUserGuideTrait: [ function(e, t, s) {
"use strict";
cc._RF.push(t, "f9ca7s2MK9GnYRFJxYlXNI3", "DisableNewUserGuideTrait");
var r, i = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var s in t) Object.prototype.hasOwnProperty.call(t, s) && (e[s] = t[s]);
})(e, t);
}, function(e, t) {
r(e, t);
function s() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (s.prototype = t.prototype, new s());
}), o = this && this.__decorate || function(e, t, s, r) {
var i, o = arguments.length, n = o < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, s) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, s, r); else for (var a = e.length - 1; a >= 0; a--) (i = e[a]) && (n = (o < 3 ? i(n) : o > 3 ? i(t, s, n) : i(t, s)) || n);
return o > 3 && n && Object.defineProperty(t, s, n), n;
};
Object.defineProperty(s, "__esModule", {
value: !0
});
s.DisableNewUserGuideTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.TAG = "[DisableNewUserGuideTrait]";
return t;
}
t.prototype.onActive = function(e) {
hs.tp.isClassGame_ProxyOnGameStart(e) && this.skipNewUserGuide();
};
t.prototype.skipNewUserGuide = function() {
if (this.shouldSkipNewUserGuide()) {
this.sendGuideDots();
this.markGuideFinished();
}
};
t.prototype.shouldSkipNewUserGuide = function() {
return hs.gameInfo.gameMode === hs.GameMode.Class && !hs.classGuideInfo.isFinishedGuide;
};
t.prototype.sendGuideDots = function() {
var e = this;
hs.classGuideInfo.steps.forEach(function(t, s) {
e.sendDot(t.dotStart, "guide_" + (s + 1) + "_start");
e.sendDot(t.dotEnd, "guide_" + (s + 1) + "_end");
});
};
t.prototype.sendDot = function(e) {
if (e) try {
DS(e);
} catch (e) {}
};
t.prototype.markGuideFinished = function() {
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classInitialFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
hs.storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classScore", 0);
hs.EventManager.dispatchModuleEvent(new hs.E_ClassGuide_Change());
hs.EventManager.dispatchModuleEvent(new hs.E_Activity_ClassGuide_Change());
};
return o([ classId("DisableNewUserGuideTrait") ], t);
}(Trait);
s.DisableNewUserGuideTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "DisableNewUserGuideTrait" ]);
//# sourceMappingURL=index.js.map
