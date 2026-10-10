window.__require = function e(t, r, o) {
function n(c, u) {
if (!r[c]) {
if (!t[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!t[f]) {
var s = "function" == typeof __require && __require;
if (!u && s) return s(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var p = r[c] = {
exports: {}
};
t[c][0].call(p.exports, function(e) {
return n(t[c][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
ScoreMilestoneFixRevertTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "96f86okuxpG24PHmA2Rqhes", "ScoreMilestoneFixRevertTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, o); else for (var u = e.length - 1; u >= 0; u--) (n = e[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(t, r, c) : n(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ScoreMilestoneFixRevertTrait = void 0;
var c = function(e) {
n(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
if (hs.tp.isScoreMilestoneTraitOnFixRevertModify(e)) {
e.returnValue = !1;
e.returnState = !0;
}
};
return i([ classId("ScoreMilestoneFixRevertTrait") ], t);
}(Trait);
r.ScoreMilestoneFixRevertTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ScoreMilestoneFixRevertTrait" ]);
//# sourceMappingURL=index.js.map
