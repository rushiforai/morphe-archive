window.__require = function t(r, e, o) {
function n(a, s) {
if (!e[a]) {
if (!r[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!r[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var p = e[a] = {
exports: {}
};
r[a][0].call(p.exports, function(t) {
return n(r[a][1][t] || t);
}, p, p.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
LevelSectionAdjustParamsTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "e7ea3s2WAdLibzt9toPUrzr", "LevelSectionAdjustParamsTrait");
var o, n = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.LevelSectionAdjustParamsTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(r.prototype, "range1", {
get: function() {
var t, r = null === (t = this.props) || void 0 === t ? void 0 : t.range1_arr;
return r && r.length >= 2 ? r : this.props.range1;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "range2", {
get: function() {
var t, r = null === (t = this.props) || void 0 === t ? void 0 : t.range2_arr;
return r && r.length >= 2 ? r : this.props.range2;
},
enumerable: !1,
configurable: !0
});
r.prototype.onActive = function(t) {
var r, e, o, n, i, a, s, l, u, p;
if (hs.tp.isChapterAlgoStrategyTraitChangeRatioArr(t)) if (this.props.isRandom) {
var c = -1, f = -1, d = this.range1, h = this.range2;
if (this.props.default1) f = (c = Math.floor(Math.random() * (d[1] - d[0])) + d[0]) + this.props.default1; else if (this.props.default2) {
c = Math.floor(Math.random() * (d[1] - d[0])) + d[0];
f = Math.floor(Math.random() * (h[1] - h[0])) + h[0] + this.props.default2;
} else {
c = Math.floor(Math.random() * (d[1] - d[0])) + d[0];
f = Math.floor(Math.random() * (h[1] - h[0])) + h[0];
}
t.args[0] = [ c / 100, f / 100 ];
} else if (null === (r = this.props) || void 0 === r ? void 0 : r.secCount) {
var v = Math.floor(Math.random() * (null === (e = this.props) || void 0 === e ? void 0 : e.secCount));
0 == v ? t.args[0] = null === (n = null === (o = this.props) || void 0 === o ? void 0 : o.sec1) || void 0 === n ? void 0 : n.concat() : 1 == v ? t.args[0] = null === (a = null === (i = this.props) || void 0 === i ? void 0 : i.sec2) || void 0 === a ? void 0 : a.concat() : 2 == v && (t.args[0] = null === (l = null === (s = this.props) || void 0 === s ? void 0 : s.sec3) || void 0 === l ? void 0 : l.concat());
} else t.args[0] = null === (p = null === (u = this.props) || void 0 === u ? void 0 : u.section) || void 0 === p ? void 0 : p.concat();
};
return i([ classId("LevelSectionAdjustParamsTrait") ], r);
}(Trait);
e.LevelSectionAdjustParamsTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "LevelSectionAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
