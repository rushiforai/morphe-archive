window.__require = function t(e, r, o) {
function i(s, a) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var p = r[s] = {
exports: {}
};
e[s][0].call(p.exports, function(t) {
return i(e[s][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
RestoreSkipTutorialTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "687adoMf6dKfY0gyN9Vr17T", "RestoreSkipTutorialTrait");
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, s = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (s = (n < 3 ? i(s) : n > 3 ? i(e, r, s) : i(e, r)) || s);
return n > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreSkipTutorialTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onCreate = function() {};
e.prototype.onActive = function(t) {
hs.tp.isClassGame_ProxyOnGameStart(t) && this.executeRestore();
};
e.prototype.executeRestore = function() {
var t = TRAIT("RestoreDataProviderTrait");
if ((null == t ? void 0 : t.active) && t.isNeedRestore() && t.isDataReady() && !t.isRestored(this.traitName)) {
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
t.markRestored(this.traitName, !0);
}
};
return n([ classId("RestoreSkipTutorialTrait") ], e);
}(Trait);
r.RestoreSkipTutorialTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreSkipTutorialTrait" ]);
//# sourceMappingURL=index.js.map
