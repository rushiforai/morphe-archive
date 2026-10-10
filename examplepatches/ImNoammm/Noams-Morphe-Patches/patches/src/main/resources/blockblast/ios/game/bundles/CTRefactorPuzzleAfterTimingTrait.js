window.__require = function t(e, r, o) {
function n(a, f) {
if (!r[a]) {
if (!e[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!f && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var s = r[a] = {
exports: {}
};
e[a][0].call(s.exports, function(t) {
return n(e[a][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorPuzzleAfterTimingTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8a37c9iQRdOn5TFaHNRvV0M", "CTRefactorPuzzleAfterTimingTrait");
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
}), i = this && this.__assign || function() {
return (i = Object.assign || function(t) {
for (var e, r = 1, o = arguments.length; r < o; r++) {
e = arguments[r];
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
}
return t;
}).apply(this, arguments);
}, a = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var f = t.length - 1; f >= 0; f--) (n = t[f]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzleAfterTimingTrait = void 0;
var f = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "otherAlgoId", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("PuzzleAfterTimingTrait", "otherAlgoId", this.props, null);
},
enumerable: !1,
configurable: !0
});
e.prototype.getPropStart1 = function() {
return this.props.start1;
};
e.prototype.getPropEnd1 = function() {
return this.props.end1;
};
e.prototype.onAlgorithmStrategyGameNewInit = function() {};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
if ("preprocessing_PuzzleTime" === t) {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == e ? void 0 : e.active) {
var r = this.props, o = r.gameNum, n = r.earlyType, a = hs.randomInt(this.getPropStart1(), this.getPropEnd1());
e.state.puzzleTimeOther = a;
e.setState(i(i({}, e.state), {
otherAlgoId: this.otherAlgoId
}));
if (n && o && hs.classGameInfo.gameNum < o) {
var f = e.state.puzzleTimeOther, u = Math.floor(f * (1 - (10 - hs.classGameInfo.gameNum) / 20));
e.state.puzzleTimeOther = u;
e.setState(i(i({}, e.state), {
otherAlgoId: this.otherAlgoId
}));
}
}
}
};
return a([ classId("CTRefactorPuzzleAfterTimingTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorPuzzleAfterTimingTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleAfterTimingTrait" ]);
//# sourceMappingURL=index.js.map
