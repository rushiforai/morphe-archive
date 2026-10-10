window.__require = function t(e, r, i) {
function n(s, c) {
if (!r[s]) {
if (!e[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(l, !0);
if (o) return o(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var a = r[s] = {
exports: {}
};
e[s][0].call(a.exports, function(t) {
return n(e[s][1][t] || t);
}, a, a.exports, t, e, r, i);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < i.length; s++) n(i[s]);
return n;
}({
ClassGuideSyncOldTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "af92bP0xi9AMLo06S2EbPd8", "ClassGuideSyncOldTrait");
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
var n, o = arguments.length, s = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, i); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (s = (o < 3 ? n(s) : o > 3 ? n(e, r, s) : n(e, r)) || s);
return o > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ClassGuideSyncOldTrait = void 0;
var s = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isFirstCallAfterClick = !1;
return e;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGuide_Proxy",
methodName: "onAnyTouchEnd"
} ];
};
e.prototype.onActive = function(t) {
if (hs.tp.isClassGuideOnStartMove(t)) {
var e = Cinst(hs.ClassGuide);
if (!e) return;
if (this._isFirstCallAfterClick) {
this._isFirstCallAfterClick = !1;
e.blocks.opacity = 0;
} else e.blocks.opacity = 120;
}
hs.tp.isClassGuide_ProxyOnAnyTouchEnd(t) && (this._isFirstCallAfterClick = !0);
};
return o([ classId("ClassGuideSyncOldTrait") ], e);
}(Trait);
r.ClassGuideSyncOldTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "ClassGuideSyncOldTrait" ]);
//# sourceMappingURL=index.js.map
