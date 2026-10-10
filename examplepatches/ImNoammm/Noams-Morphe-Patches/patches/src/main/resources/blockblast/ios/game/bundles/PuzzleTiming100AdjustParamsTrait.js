window.__require = function t(e, r, i) {
function n(u, a) {
if (!r[u]) {
if (!e[u]) {
var s = u.split("/");
s = s[s.length - 1];
if (!e[s]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(s, !0);
if (o) return o(s, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = s;
}
var c = r[u] = {
exports: {}
};
e[u][0].call(c.exports, function(t) {
return n(e[u][1][t] || t);
}, c, c.exports, t, e, r, i);
}
return r[u].exports;
}
for (var o = "function" == typeof __require && __require, u = 0; u < i.length; u++) n(i[u]);
return n;
}({
PuzzleTiming100AdjustParamsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "78b8dnYMuRE0bOwg3EEU9p1", "PuzzleTiming100AdjustParamsTrait");
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
var n, o = arguments.length, u = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, i); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (u = (o < 3 ? n(u) : o > 3 ? n(e, r, u) : n(e, r)) || u);
return o > 3 && u && Object.defineProperty(e, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PuzzleTiming100AdjustParamsTrait = void 0;
var u = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isClassAlgorithmStrategy_Reset_ProxyPreprocessing_Puzzle100(t)) {
var e = TRAIT("Puzzle100Trait");
if (null == e ? void 0 : e.active) {
var r = this.getPuzzleTime(this.start, this.end);
e.setState({
puzzleTime: r
});
t.disable([ "PuzzleTiming100Trait" ]);
}
}
};
e.prototype.getPuzzleTime = function(t, e) {
return Math.floor(Math.random() * (e - t)) + t;
};
Object.defineProperty(e.prototype, "start", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.start) && void 0 !== e ? e : 300;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "end", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.end) && void 0 !== e ? e : 360;
},
enumerable: !1,
configurable: !0
});
return o([ classId("PuzzleTiming100AdjustParamsTrait") ], e);
}(Trait);
r.PuzzleTiming100AdjustParamsTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "PuzzleTiming100AdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
