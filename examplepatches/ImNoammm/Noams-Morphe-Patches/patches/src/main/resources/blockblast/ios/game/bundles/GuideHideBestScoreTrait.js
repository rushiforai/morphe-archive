window.__require = function e(t, i, r) {
function o(s, c) {
if (!i[s]) {
if (!t[s]) {
var a = s.split("/");
a = a[a.length - 1];
if (!t[a]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = a;
}
var d = i[s] = {
exports: {}
};
t[s][0].call(d.exports, function(e) {
return o(t[s][1][e] || e);
}, d, d.exports, e, t, i, r);
}
return i[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < r.length; s++) o(r[s]);
return o;
}({
GuideHideBestScoreTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "57abakOqqFLjK3qeG9kXrDq", "GuideHideBestScoreTrait");
var r, o = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
})(e, t);
}, function(e, t) {
r(e, t);
function i() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i());
}), n = this && this.__decorate || function(e, t, i, r) {
var o, n = arguments.length, s = n < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, i, r); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (s = (n < 3 ? o(s) : n > 3 ? o(t, i, s) : o(t, i)) || s);
return n > 3 && s && Object.defineProperty(t, i, s), s;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.GuideHideBestScoreTrait = void 0;
var s = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.onActive = function(e) {
hs.tp.isClassTopInfoInitCompelte(e) && this.handleGameStart();
hs.tp.isClassGuide_ProxyOnGuideChange(e) && this.handleGuideChange();
};
t.prototype.handleGameStart = function() {
var e = TRAIT("RestoreDataProviderTrait");
(null == e ? void 0 : e.active) && e.isNeedRestore() && e.isDataReady() && (hs.classGuideInfo.isFinishedGuide || this.setHighNodeActive(!1));
};
t.prototype.handleGuideChange = function() {
hs.classGuideInfo.isFinishedGuide && this.setHighNodeActive(!0);
};
t.prototype.setHighNodeActive = function(e) {
var t = Cinst(hs.ClassTopInfo);
cc.isValid(t) && cc.isValid(null == t ? void 0 : t.highNode) && (t.highNode.active = e);
};
return n([ classId("GuideHideBestScoreTrait") ], t);
}(Trait);
i.GuideHideBestScoreTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "GuideHideBestScoreTrait" ]);
//# sourceMappingURL=index.js.map
