window.__require = function t(e, r, o) {
function i(u, s) {
if (!r[u]) {
if (!e[u]) {
var a = u.split("/");
a = a[a.length - 1];
if (!e[a]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = a;
}
var f = r[u] = {
exports: {}
};
e[u][0].call(f.exports, function(t) {
return i(e[u][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[u].exports;
}
for (var n = "function" == typeof __require && __require, u = 0; u < o.length; u++) i(o[u]);
return i;
}({
PuzzleAfterTimingAdjustParamsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "d8776PIeuFHy60pYtGXuxyX", "PuzzleAfterTimingAdjustParamsTrait");
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
var i, n = arguments.length, u = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (u = (n < 3 ? i(u) : n > 3 ? i(e, r, u) : i(e, r)) || u);
return n > 3 && u && Object.defineProperty(e, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PuzzleAfterTimingAdjustParamsTrait = void 0;
var u = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "otherAlgoId", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.otherAlgoId) && void 0 !== e ? e : null;
},
enumerable: !1,
configurable: !0
});
e.prototype.onActive = function(t) {
var e, r;
if (hs.tp.isClassAlgorithmStrategy_Reset_ProxyPreprocessing_PuzzleTime(t)) {
t.disable([ "PuzzleAfterTimingTrait" ]);
var o = TRAIT("IsPuzzleTimeTrait");
if (null == o ? void 0 : o.active) {
var i = null === (e = this.props) || void 0 === e ? void 0 : e.gameNum, n = null === (r = this.props) || void 0 === r ? void 0 : r.earlyType;
o.setState({
puzzleTimeOther: hs.randomInt(this.props.start1, this.props.end1),
otherAlgoId: this.otherAlgoId
});
n && i && hs.classGameInfo.gameNum < i && o.setState({
puzzleTimeOther: Math.floor(o.state.puzzleTimeOther * (1 - (10 - hs.classGameInfo.gameNum) / 20)),
otherAlgoId: this.otherAlgoId
});
}
}
};
return n([ classId("PuzzleAfterTimingAdjustParamsTrait") ], e);
}(Trait);
r.PuzzleAfterTimingAdjustParamsTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "PuzzleAfterTimingAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
