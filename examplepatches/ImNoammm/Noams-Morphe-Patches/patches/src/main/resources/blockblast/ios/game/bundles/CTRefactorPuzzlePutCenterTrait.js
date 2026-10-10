window.__require = function t(r, e, o) {
function n(a, c) {
if (!e[a]) {
if (!r[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!r[u]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var s = e[a] = {
exports: {}
};
r[a][0].call(s.exports, function(t) {
return n(r[a][1][t] || t);
}, s, s.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorPuzzlePutCenterTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "dc18b1l7UpAJaS/4t2JqNqK", "CTRefactorPuzzlePutCenterTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorPuzzlePutCenterTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.HARD_BLOCK_NAMES = [ "困难难题", "死亡难题", "直觉难题" ];
return r;
}
r.prototype.onAlgorithmStrategyPositionAdjust = function() {
if (this.isLastOfferBlockHard(hs.algorithmName.algoActualName)) {
var t = hs.algorithmInfo.blockIdList;
if (Array.isArray(t) && !(t.length < 3)) {
var r = new hs.BinaryBoard();
r.convertToBinaryBoard(hs.boardInfo.faceBlocks);
r.record();
for (var e = -1, o = 0; o < t.length; o++) if (1 !== o && !r.canPut(t[o])) {
e = o;
break;
}
if (!(e < 0)) return {
data: 0 === e ? hs.AlgorithmStrategyPositionType.MIDDLE_LEFT : hs.AlgorithmStrategyPositionType.LEFT_RIGHT,
returnState: !0
};
}
}
};
r.prototype.isLastOfferBlockHard = function(t) {
var r = this;
return !(!Array.isArray(t) || 0 === t.length) && t.some(function(t) {
return r.HARD_BLOCK_NAMES.includes(t);
});
};
return i([ classId("CTRefactorPuzzlePutCenterTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorPuzzlePutCenterTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzlePutCenterTrait" ]);
//# sourceMappingURL=index.js.map
