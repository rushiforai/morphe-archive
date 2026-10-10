window.__require = function e(a, i, r) {
function t(n, o) {
if (!i[n]) {
if (!a[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!a[l]) {
var A = "function" == typeof __require && __require;
if (!o && A) return A(l, !0);
if (s) return s(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var u = i[n] = {
exports: {}
};
a[n][0].call(u.exports, function(e) {
return t(a[n][1][e] || e);
}, u, u.exports, e, a, i, r);
}
return i[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < r.length; n++) t(r[n]);
return t;
}({
CTRefactorAlgoFillSortEdgeIOSTrait: [ function(e, a, i) {
"use strict";
cc._RF.push(a, "474465PdSVHv4JBji0aixOG", "CTRefactorAlgoFillSortEdgeIOSTrait");
var r, t, s, n, o, l = this && this.__extends || (r = function(e, a) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, a) {
e.__proto__ = a;
} || function(e, a) {
for (var i in a) Object.prototype.hasOwnProperty.call(a, i) && (e[i] = a[i]);
})(e, a);
}, function(e, a) {
r(e, a);
function i() {
this.constructor = e;
}
e.prototype = null === a ? Object.create(a) : (i.prototype = a.prototype, new i());
}), A = this && this.__decorate || function(e, a, i, r) {
var t, s = arguments.length, n = s < 3 ? a : null === r ? r = Object.getOwnPropertyDescriptor(a, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, a, i, r); else for (var o = e.length - 1; o >= 0; o--) (t = e[o]) && (n = (s < 3 ? t(n) : s > 3 ? t(a, i, n) : t(a, i)) || n);
return s > 3 && n && Object.defineProperty(a, i, n), n;
}, u = this && this.__read || function(e, a) {
var i = "function" == typeof Symbol && e[Symbol.iterator];
if (!i) return e;
var r, t, s = i.call(e), n = [];
try {
for (;(void 0 === a || a-- > 0) && !(r = s.next()).done; ) n.push(r.value);
} catch (e) {
t = {
error: e
};
} finally {
try {
r && !r.done && (i = s.return) && i.call(s);
} finally {
if (t) throw t.error;
}
}
return n;
}, C = this && this.__spread || function() {
for (var e = [], a = 0; a < arguments.length; a++) e = e.concat(u(arguments[a]));
return e;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.CTRefactorAlgoFillSortEdgeIOSTrait = i.EDGE = i.COMBOWAY = i.PUTWAY = void 0;
(function(e) {
e[e.ID9 = 81] = "ID9";
e[e.ID70 = 98] = "ID70";
})(t || (t = {}));
(function(e) {
e[e.A1B1C1 = 1] = "A1B1C1";
e[e["A1B2|A1C2"] = 2] = "A1B2|A1C2";
e[e["A1B2C3|A1C2B3"] = 3] = "A1B2C3|A1C2B3";
})(s = i.PUTWAY || (i.PUTWAY = {}));
(function(e) {
e[e.OLD_ORDER = 1] = "OLD_ORDER";
e[e.OLD_PARALLEL = 2] = "OLD_PARALLEL";
e[e.NEW_SELECT = 3] = "NEW_SELECT";
})(n = i.COMBOWAY || (i.COMBOWAY = {}));
(function(e) {
e[e.DEFAULT = 1] = "DEFAULT";
e[e.BOARD = 2] = "BOARD";
e[e.LIAN = 3] = "LIAN";
})(o = i.EDGE || (i.EDGE = {}));
var L = function(e) {
l(a, e);
function a() {
var a = null !== e && e.apply(this, arguments) || this;
a.algoGathers = [ {
index: 1,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 2,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 3,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 4,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 5,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 6,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 7,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 8,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 9,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 10,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 11,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 12,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 13,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 14,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 15,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 16,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 17,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 18,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 19,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 20,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 21,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 22,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 23,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 24,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 25,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 26,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 27,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 28,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 29,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 30,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 31,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 32,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 33,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 34,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 35,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 36,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 37,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 38,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 39,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 40,
putWay: s.A1B1C1,
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 41,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 42,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 43,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 44,
putWay: s.A1B1C1,
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 45,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 46,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 47,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 48,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 49,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 50,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 51,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 52,
putWay: s["A1B2|A1C2"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 53,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 54,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 55,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 56,
putWay: s["A1B2|A1C2"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 57,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 58,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 59,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 2 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 60,
putWay: s["A1B2|A1C2"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 2 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 61,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 62,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 63,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 64,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 65,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 66,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 67,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 68,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 69,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 70,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1
}, {
index: 71,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !0
}, {
index: 72,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !0
}, {
index: 73,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
lessInitEdge: !0
}, {
index: 74,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 8, 4, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 75,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1
}, {
index: 76,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
trigger: .5
}, {
index: 77,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
combos: 8
}, {
index: 78,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
combos: 3
}, {
index: 79,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
limitSmall: !1
}, {
index: 80,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
limitSmall: !0
}, {
index: 81,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceRandom: !0
}, {
index: 82,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0
}, {
index: 83,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
edge: o.LIAN
}, {
index: 84,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
edge: o.BOARD
}, {
index: 85,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
replaceRandom: !0
}, {
index: 86,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
replaceRandom: !0
}, {
index: 87,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
random: .5
}, {
index: 88,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
random: .75
}, {
index: 89,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
score: [ 0, 3e3 ]
}, {
index: 90,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
limitTime: 24e4
}, {
index: 91,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceShang3: !0
}, {
index: 92,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0
}, {
index: 93,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0
}, {
index: 94,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_ORDER,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceShang3: !0
}, {
index: 95,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
indexs: [ 8, 33, 65, 69 ]
}, {
index: 96,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
indexs: [ 8, 33, 65, 69, 0 ]
}, {
index: 97,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceShang3: !0
}, {
index: 98,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0
}, {
index: 99,
putWay: s["A1B2C3|A1C2B3"],
select: n.NEW_SELECT,
ratios: [ 4, 2, 1 ],
isClear: !1,
remainNum: 10,
isNear: !1,
lessInitEdge: !0,
noOverLap: !0
}, {
index: 100,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
replaceRandom: !0,
indexs: [ 8, 33, 65, 69, 0 ],
randomIndexs: [ 69 ]
}, {
index: 101,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0
}, {
index: 102,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0,
replaceShang3: !0
}, {
index: 103,
putWay: s["A1B2C3|A1C2B3"],
select: n.OLD_PARALLEL,
ratios: [ 4, 2, 1 ],
isClear: !0,
remainNum: 5,
isNear: !1,
replaceRandom: !0,
replaceShang3: !0,
indexs: [ 69 ],
randomIndexs: [ 33 ]
}, {
index: 104,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
indexs: [ 8 ],
limitTime: 24e4,
replaceRandom: !0,
randomIndexs: [ 69 ]
}, {
index: 105,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
indexs: [ 8, 33, 65, 69 ],
replaceRandom: !0,
randomIndexs: [ 69 ]
}, {
index: 106,
putWay: s.A1B1C1,
select: n.OLD_PARALLEL,
ratios: [ 1, 1, 1 ],
isClear: !1,
remainNum: 5,
isNear: !1,
replaceShang3: !0,
indexs: [ 8, 33, 65, 69 ],
replaceRandom: !0,
randomIndexs: [ 65 ]
} ];
return a;
}
a.prototype.data = function() {
return {
isBottomReplace: !1
};
};
a.prototype.isCTRefactorNextUseFillFunctionTraitCondFirstHardRemove23 = function(e) {
var a = this.props.way - 1, i = this.algoGathers[a];
if (i && (i.trigger ? Math.random() > i.trigger : !i.replaceRandom && !i.replaceShang3)) {
var r = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList, t = C([ {
algorithmId: hs.OFFER_TYPE.ALL_COMBINATION_ID70,
traitSource: this.traitName
} ], r);
as.AlgorithmStrategyAlgorithmListPatch.patch(t, this);
e.returnValue = !1;
e.replace = !0;
e.returnState = !0;
}
};
a.prototype.onPostprocessConditionContext = function(e) {
var a = this.buildBottomAlgoList(e), i = 1 === hs.storage.getItem("classRoundNum", 0);
return buildLazyConditionContext({
isBottomOfferTiming: function() {
return ASContext(!i, "是否底部兜底时机");
},
hasBottomAlgo: function() {
var e;
return ASContext((null !== (e = null == a ? void 0 : a.length) && void 0 !== e ? e : 0) > 0, "全组合填空消除替换条件（blockIdList===3 且随机/强制替换）");
},
bottomAlgoList: function() {
return ASContext(a, "全组合填空消除算法列表");
}
});
};
a.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBottomOfferTiming",
operator: "=",
value: !0
}, {
fact: "hasBottomAlgo",
operator: "=",
value: !0
} ]
},
flow: "bottomReplace",
platform: "ios",
gameMode: "class"
} ];
};
a.prototype.onPostprocessActions = function() {
return {
bottomReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "bottomAlgoList"
} ]
} ]
};
};
a.prototype.canReplaceRandom = function(e) {
return null == e ? void 0 : e.every(function(e) {
return "随机" === e || "随机无死亡" === e;
});
};
a.prototype.forceReplaceAlgorithm = function(e) {
void 0 === e && (e = !1);
return e;
};
a.prototype.updateReplace = function(e) {
return e;
};
a.prototype.buildBottomAlgoList = function() {
this.state.isBottomReplace = !1;
if (3 !== hs.algorithmInfo.blockIdList.length) return null;
if (this.isReplaceParam()) {
this.state.isBottomReplace = this.forceReplaceAlgorithm();
if (!this.state.isBottomReplace) {
var e = this.canReplaceRandom(hs.algorithmName.algoActualName);
this.state.isBottomReplace = this.updateReplace(e);
}
}
var a = this.updateBottomAlgoList(this.state.isBottomReplace);
return (null == a ? void 0 : a.length) > 0 ? a : null;
};
a.prototype.isReplaceParam = function() {
return !0;
};
a.prototype.updateFillSortAlgo = function(e) {
this.props.way == t.ID70 ? e.push(hs.OFFER_TYPE.ALL_COMBINATION_ID70) : this.props.way == t.ID9 && e.push(hs.OFFER_TYPE.ALL_COMBINATION_ID9);
this.state.isBottomReplace = !0;
return e;
};
a.prototype.updateBottomAlgoList = function(e) {
var a = [];
e && (a = this.updateFillSortAlgo(a));
this.syncLightGBMFillSortEdgeBottomReplaceFlag(e);
return a;
};
a.prototype.syncLightGBMFillSortEdgeBottomReplaceFlag = function(e) {
var a = TRAIT("CTRefactor$633_f_LightGBMFeature20Trait");
if (null == a ? void 0 : a.active) {
a.isCTRefactorAlgoFillSortEdgeIOSTraitUpdateBottomAlgoList({
args: [ e ]
});
a.isAlgoFillSortEdgeIOSAdjustParamsTraitUpdateBottomAlgoList({
args: [ e ]
});
}
};
return A([ classId("CTRefactorAlgoFillSortEdgeIOSTrait"), classMethodWatch() ], a);
}(Trait);
i.CTRefactorAlgoFillSortEdgeIOSTrait = L;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgoFillSortEdgeIOSTrait" ]);
//# sourceMappingURL=index.js.map
