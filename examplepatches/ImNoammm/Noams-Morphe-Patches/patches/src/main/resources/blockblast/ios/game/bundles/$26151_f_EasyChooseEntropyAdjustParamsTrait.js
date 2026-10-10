window.__require = function t(r, e, o) {
function n(a, s) {
if (!e[a]) {
if (!r[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!r[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var f = e[a] = {
exports: {}
};
r[a][0].call(f.exports, function(t) {
return n(r[a][1][t] || t);
}, f, f.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
$26151_f_EasyChooseEntropyAdjustParamsTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "c1676ModCJHb4Vqdb/d+aQI", "$26151_f_EasyChooseEntropyAdjustParamsTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, s = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(a(arguments[r]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.$26151_f_EasyChooseEntropyAdjustParamsTrait = void 0;
var l = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(r.prototype, "fromAlgo", {
get: function() {
var t, r = null === (t = this.props) || void 0 === t ? void 0 : t.fromAlgo;
if (!Array.isArray(r) || 0 === r.length) return [];
var e = r.filter(function(t) {
return "number" == typeof t && hs.isValueInEnum(t, hs.OFFER_TYPE);
});
return e.length > 0 ? e : [];
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "ratio", {
get: function() {
var t, r;
return null !== (r = null === (t = this.props) || void 0 === t ? void 0 : t.ratio) && void 0 !== r ? r : 1;
},
enumerable: !1,
configurable: !0
});
r.prototype.onActive = function(t) {
hs.tpManual.isClassAlgorithmBottomSequenceInfoTriggerAfterOfferAlgo(t) && (this.fromAlgo.length > 0 ? this.isMeetConditionsByFromAlgo() : this.isMeetConditions()) && hs.algorithmBottomSequenceInfo.setAlgorithmAfterList(s([ hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY ], hs.algorithmStrategyIOSRandomInfo.offerBitRandomNoDieBit()));
hs.tpManual.isClassAlgorithmBottomSequenceInfoOnDisableAfterAlgo(t) && t.args[0] && t.args[0].callReturnValue && (hs.algorithmName.algoActualId == hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY ? hs.algorithmName.forceSetAlgoExpectedId(hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY) : hs.algorithmName.forceSetAlgoExpectedId(hs.OFFER_TYPE.IOS_SUI_JI_WU_SI));
};
r.prototype.isMeetConditions = function() {
return hs.OFFER_TYPE_STRINGS[hs.classAlgorithmName.algoExpectedId].includes("熵增") || hs.classAlgorithmName.algoActualName.find(function(t) {
return (t + "").includes("熵增");
});
};
r.prototype.isMeetConditionsByFromAlgo = function() {
var t = hs.classAlgorithmName.algoExpectedId, r = hs.algorithmName.algoActualIdByPos, e = this.fromAlgo.includes(t), o = this.fromAlgo.includes(r);
return !(!e && !o) && Math.random() < this.ratio;
};
return i([ classId("$26151_f_EasyChooseEntropyAdjustParamsTrait") ], r);
}(Trait);
e.$26151_f_EasyChooseEntropyAdjustParamsTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "$26151_f_EasyChooseEntropyAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
