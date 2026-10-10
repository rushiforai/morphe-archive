window.__require = function t(e, r, i) {
function o(f, l) {
if (!r[f]) {
if (!e[f]) {
var u = f.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + f + "'");
}
f = u;
}
var s = r[f] = {
exports: {}
};
e[f][0].call(s.exports, function(t) {
return o(e[f][1][t] || t);
}, s, s.exports, t, e, r, i);
}
return r[f].exports;
}
for (var n = "function" == typeof __require && __require, f = 0; f < i.length; f++) o(i[f]);
return o;
}({
DifficultSimplePuzzlesTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8435eppWbFCk42ijp2eEsmc", "DifficultSimplePuzzlesTrait");
var i, o = this && this.__extends || (i = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, i) {
var o, n = arguments.length, f = n < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) f = Reflect.decorate(t, e, r, i); else for (var l = t.length - 1; l >= 0; l--) (o = t[l]) && (f = (n < 3 ? o(f) : n > 3 ? o(e, r, f) : o(e, r)) || f);
return n > 3 && f && Object.defineProperty(e, r, f), f;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.DifficultSimplePuzzlesTrait = void 0;
var f = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._probability = .75;
return e;
}
e.prototype.onActive = function(t) {
if (hs.tp.isClassAlgorithmStrategy_Condition_ProxyOnAlgorithmStrategyCondition(t) && Math.random() <= this._probability) {
var e = this.getDifficultyTypes();
if (e.length > 0) {
var r = hs.OFFER_TYPE.DIFF_EASY_HELP;
hs.algorithmStrategyInfo.setAlgorithmList(hs.algorithmStrategyLogic.insertAlgorithms(hs.algorithmStrategyInfo.algorithmList, e, r));
}
}
};
e.prototype.getDifficultyTypes = function() {
return Object.keys(hs.OFFER_TYPE_DIFFICULTY).filter(function(t) {
if (hs.OFFER_TYPE[t] != hs.OFFER_TYPE.DIFF_EASY_HELP && -1 != hs.algorithmStrategyInfo.algorithmList.indexOf(hs.OFFER_TYPE[t])) return t;
}).map(function(t) {
return hs.OFFER_TYPE[t];
});
};
return n([ classId("DifficultSimplePuzzlesTrait") ], e);
}(Trait);
r.DifficultSimplePuzzlesTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "DifficultSimplePuzzlesTrait" ]);
//# sourceMappingURL=index.js.map
