window.__require = function e(r, t, o) {
function n(c, u) {
if (!t[c]) {
if (!r[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!r[a]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var s = t[c] = {
exports: {}
};
r[c][0].call(s.exports, function(e) {
return n(r[c][1][e] || e);
}, s, s.exports, e, r, t, o);
}
return t[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
IncreaseScoreByRoundTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "55f40mkp9BJVYifu/5QAB8A", "IncreaseScoreByRoundTrait");
var o, n = this && this.__extends || (o = function(e, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
o(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), i = this && this.__decorate || function(e, r, t, o) {
var n, i = arguments.length, c = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, r, t, o); else for (var u = e.length - 1; u >= 0; u--) (n = e[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(r, t, c) : n(r, t)) || c);
return i > 3 && c && Object.defineProperty(r, t, c), c;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.IncreaseScoreByRoundTrait = void 0;
var c = function(e) {
n(r, e);
function r() {
return null !== e && e.apply(this, arguments) || this;
}
Object.defineProperty(r.prototype, "maxMultiply", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("IncreaseScoreByRoundTrait", "maxMultiply", this.props, 3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "multiply", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("IncreaseScoreByRoundTrait", "multiply", this.props, .2);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "round", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("IncreaseScoreByRoundTrait", "round", this.props, 10);
},
enumerable: !1,
configurable: !0
});
r.prototype.onActive = function(e) {
if (hs.tp.isClassScore_ProxyIncreaseScoreByRound(e)) {
var r = e.args[0], t = r.baseScore, o = r.comboScore, n = 1;
if (hs.classGameInfo.roundNum > 0) {
n = 1 + (Math.ceil(hs.classGameInfo.roundNum / this.round) - 1) * this.multiply;
n = Math.min(n, this.maxMultiply);
}
r.baseScore = Math.floor(t * n);
r.comboScore = Math.floor(o * n);
e.returnValue = r;
}
};
return i([ classId("IncreaseScoreByRoundTrait") ], r);
}(Trait);
t.IncreaseScoreByRoundTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "IncreaseScoreByRoundTrait" ]);
//# sourceMappingURL=index.js.map
