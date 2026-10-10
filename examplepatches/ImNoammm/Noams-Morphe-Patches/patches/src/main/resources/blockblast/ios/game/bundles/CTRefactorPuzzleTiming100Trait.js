window.__require = function t(e, r, o) {
function i(u, a) {
if (!r[u]) {
if (!e[u]) {
var f = u.split("/");
f = f[f.length - 1];
if (!e[f]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(f, !0);
if (n) return n(f, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = f;
}
var p = r[u] = {
exports: {}
};
e[u][0].call(p.exports, function(t) {
return i(e[u][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[u].exports;
}
for (var n = "function" == typeof __require && __require, u = 0; u < o.length; u++) i(o[u]);
return i;
}({
CTRefactorPuzzleTiming100Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "36b7butoKxDfLQLPRd5c3y7", "CTRefactorPuzzleTiming100Trait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (u = (n < 3 ? i(u) : n > 3 ? i(e, r, u) : i(e, r)) || u);
return n > 3 && u && Object.defineProperty(e, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzleTiming100Trait = void 0;
var u = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.getPropStart = function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("PuzzleTiming100Trait", "start", this.props, 300);
};
e.prototype.getPropEnd = function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("PuzzleTiming100Trait", "end", this.props, 360);
};
e.prototype.getPuzzleTime = function(t, e) {
return Math.floor(Math.random() * (e - t)) + t;
};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
if ("preprocessing_Puzzle100" === t) {
var e = TRAIT("CTRefactorPuzzle100Trait");
if (null == e ? void 0 : e.active) {
var r = this.getPuzzleTime(this.getPropStart(), this.getPropEnd());
e.setState({
puzzleTime: r
});
}
}
};
return n([ classId("CTRefactorPuzzleTiming100Trait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorPuzzleTiming100Trait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleTiming100Trait" ]);
//# sourceMappingURL=index.js.map
