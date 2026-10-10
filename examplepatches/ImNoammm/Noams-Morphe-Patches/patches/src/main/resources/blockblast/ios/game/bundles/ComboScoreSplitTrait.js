window.__require = function t(e, o, r) {
function n(c, u) {
if (!o[c]) {
if (!e[c]) {
var s = c.split("/");
s = s[s.length - 1];
if (!e[s]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = s;
}
var p = o[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return n(e[c][1][t] || t);
}, p, p.exports, t, e, o, r);
}
return o[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < r.length; c++) n(r[c]);
return n;
}({
ComboScoreSplitTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "f4261SnL95Dc6PYS6fvD06c", "ComboScoreSplitTrait");
var r, n = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, c = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, o, r); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, o, c) : n(e, o)) || c);
return i > 3 && c && Object.defineProperty(e, o, c), c;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.ComboScoreSplitTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return this.isCanActive();
},
enumerable: !1,
configurable: !0
});
e.prototype.isCanActive = function() {
return !0;
};
e.prototype.registerTraitEventsMethods = function() {
return [];
};
e.prototype.onActive = function(t) {
if (hs.tp.isIsOpenComboContinuousTraitUpdateComboPost(t) && hs.gameInfo.gameMode === hs.GameMode.Class) {
t.replace = !0;
var e = t.args[0];
e.continuousEliminateTimes = e.continuousEliminateTimes - 1;
var o = storage.getItem("classComboContinuous", 0);
storage.setItem("classComboContinuous", o - 1);
}
};
return i([ classId("ComboScoreSplitTrait"), classMethodWatch() ], e);
}(Trait);
o.ComboScoreSplitTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ComboScoreSplitTrait" ]);
//# sourceMappingURL=index.js.map
