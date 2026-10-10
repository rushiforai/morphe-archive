window.__require = function t(e, o, r) {
function n(a, s) {
if (!o[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = o[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return n(e[a][1][t] || t);
}, f, f.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
$26151_f_EasyChooseEntropyTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "d98a1BMAyFJIKyXYteBq5Cf", "$26151_f_EasyChooseEntropyTrait");
var r, n = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, o, a) : n(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
}, a = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, i = o.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(a(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.$26151_f_EasyChooseEntropyTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerAfterOfferAlgo(t) && this.isMeetConditions() && hs.algorithmBottomSequenceInfo.setAlgorithmAfterList(s([ hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY ], this.getFallbackAlgo([])));
hs.tpManual.isClassAlgorithmBottomSequenceInfoOnDisableAfterAlgo(t) && t.args[0] && t.args[0].callReturnValue && (hs.algorithmName.algoActualId == hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY ? hs.algorithmName.forceSetAlgoExpectedId(hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY) : hs.algorithmName.forceSetAlgoExpectedId(hs.OFFER_TYPE.IOS_SUI_JI_WU_SI));
};
e.prototype.isMeetConditions = function() {
return hs.OFFER_TYPE_STRINGS[hs.classAlgorithmName.algoExpectedId].includes("熵增") || hs.classAlgorithmName.algoActualName.find(function(t) {
return (t + "").includes("熵增");
});
};
e.prototype.getFallbackAlgo = function(t) {
void 0 === t && (t = []);
return s(t, hs.algorithmStrategyIOSRandomInfo.offerBitRandomNoDieBit());
};
return i([ classId("$26151_f_EasyChooseEntropyTrait"), classMethodWatch() ], e);
}(Trait);
o.$26151_f_EasyChooseEntropyTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "$26151_f_EasyChooseEntropyTrait" ]);
//# sourceMappingURL=index.js.map
