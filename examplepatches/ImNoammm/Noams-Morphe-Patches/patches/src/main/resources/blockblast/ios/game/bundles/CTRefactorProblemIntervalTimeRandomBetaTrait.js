window.__require = function e(t, r, o) {
function a(n, l) {
if (!r[n]) {
if (!t[n]) {
var f = n.split("/");
f = f[f.length - 1];
if (!t[f]) {
var p = "function" == typeof __require && __require;
if (!l && p) return p(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = f;
}
var u = r[n] = {
exports: {}
};
t[n][0].call(u.exports, function(e) {
return a(t[n][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorProblemIntervalTimeRandomBetaTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "d6a3dkBnK9P1LrcDC70kr/T", "CTRefactorProblemIntervalTimeRandomBetaTrait");
var o, a = this && this.__extends || (o = function(e, t) {
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
var a, i = arguments.length, n = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var l = e.length - 1; l >= 0; l--) (a = e[l]) && (n = (i < 3 ? a(n) : i > 3 ? a(t, r, n) : a(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorProblemIntervalTimeRandomBetaTrait = void 0;
var n = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
Object.defineProperty(t.prototype, "alpha", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ProblemIntervalTimeRandomBetaTrait", "alpha", this.props, 1);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "beta", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ProblemIntervalTimeRandomBetaTrait", "beta", this.props, 3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "k", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ProblemIntervalTimeRandomBetaTrait", "k", this.props, 80);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "v", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("ProblemIntervalTimeRandomBetaTrait", "v", this.props, 40);
},
enumerable: !1,
configurable: !0
});
t.prototype.onAlgorithmStrategyGameInit = function(e) {
if ("preprocessing_PuzzleTime" === e) {
var t = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == t ? void 0 : t.active) {
var r = hs.BetaRandom.Sample(this.alpha, this.beta), o = Math.floor(this.k * r + this.v);
t.setState({
puzzleTimeOther: o
});
}
}
};
t.prototype.onAlgorithmStrategyPreprocessComplete = function(e) {
var t, r, o = TRAIT("CTRefactorIsPuzzleTimeTrait");
if ((null == o ? void 0 : o.active) && (null === (t = e.sdk) || void 0 === t ? void 0 : t.SDK_SUCCESS)) {
var a = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
if ((a == hs.ClassAlgorithmSourceType.PuzzleTimeFirst || a == hs.ClassAlgorithmSourceType.PuzzleTimeOther) && "normal" === (null === (r = e.sdk) || void 0 === r ? void 0 : r.algorithmListSource)) {
var i = hs.BetaRandom.Sample(this.alpha, this.beta), n = Math.floor(this.k * i + this.v);
o.setState({
puzzleTimeOther: n
});
}
}
};
return i([ classId("CTRefactorProblemIntervalTimeRandomBetaTrait") ], t);
}(Trait);
r.CTRefactorProblemIntervalTimeRandomBetaTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorProblemIntervalTimeRandomBetaTrait" ]);
//# sourceMappingURL=index.js.map
