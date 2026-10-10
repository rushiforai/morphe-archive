window.__require = function t(e, r, o) {
function n(a, c) {
if (!r[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var p = r[a] = {
exports: {}
};
e[a][0].call(p.exports, function(t) {
return n(e[a][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorLevelSectionTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "f0910NFvXVD+Zbs+eUnk8BL", "CTRefactorLevelSectionTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLevelSectionTrait = void 0;
var a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isCTRefactorChapterAlgoStrategyTraitChangeRatioArr = function(t) {
if (this.props.isRandom) {
var e = -1, r = -1, o = this.props.range1, n = this.props.range2;
if (this.props.default1) r = (e = Math.floor(Math.random() * (o[1] - o[0])) + o[0]) + this.props.default1; else if (this.props.default2) {
e = Math.floor(Math.random() * (o[1] - o[0])) + o[0];
r = Math.floor(Math.random() * (n[1] - n[0])) + n[0] + this.props.default2;
} else {
e = Math.floor(Math.random() * (o[1] - o[0])) + o[0];
r = Math.floor(Math.random() * (n[1] - n[0])) + n[0];
}
t.args[0] = [ e / 100, r / 100 ];
} else if (this.props.secCount) {
var i = Math.floor(Math.random() * this.props.secCount);
0 == i ? t.args[0] = this.props.sec1.concat() : 1 == i ? t.args[0] = this.props.sec2.concat() : 2 == i && (t.args[0] = this.props.sec3.concat());
} else t.args[0] = this.props.section.concat();
};
return i([ classId("CTRefactorLevelSectionTrait") ], e);
}(Trait);
r.CTRefactorLevelSectionTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLevelSectionTrait" ]);
//# sourceMappingURL=index.js.map
