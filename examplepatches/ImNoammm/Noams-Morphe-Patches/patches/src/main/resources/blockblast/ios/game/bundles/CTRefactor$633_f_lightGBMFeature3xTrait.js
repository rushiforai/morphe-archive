window.__require = function t(r, e, o) {
function n(a, l) {
if (!e[a]) {
if (!r[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!r[f]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var u = e[a] = {
exports: {}
};
r[a][0].call(u.exports, function(t) {
return n(r[a][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactor$633_f_lightGBMFeature3xTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "c3d6clbmFxOWJsIoXreLb4z", "CTRefactor$633_f_lightGBMFeature3xTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
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
}, l = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(a(arguments[r]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactor$633_f_lightGBMFeature3xTrait = void 0;
var f = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.registerTraitEventsMethods = function() {
return [ {
className: "GBM_Light_Proxy",
methodName: "onInitComplete"
} ];
};
r.prototype.isGBM_Light_ProxyOnInitComplete = function() {
hs.gbmChurnRateInfo.reqChurnRateData(!1);
};
r.prototype.isCTRefactorControlWeightTraitGetAlgorithmList = function(t) {
var r = this.getConditionV3xBlock();
if ((null == r ? void 0 : r.length) > 0) {
var e = t.args[0];
e.splice.apply(e, l([ 0, 0 ], r));
}
};
r.prototype.isCTRefactorDifficultDownStrategyTraitGetAlgorithmList = function(t) {
var r = this.getConditionV3xBlock();
if ((null == r ? void 0 : r.length) > 0) {
var e = t.args[0];
e.splice.apply(e, l([ 0, 0 ], r));
}
};
r.prototype.getConditionV3xBlock = function() {
var t;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return [];
var r = this.getLocalData(), e = null === (t = this.props) || void 0 === t ? void 0 : t.gbmVersion, o = "3.1" == e ? null == r ? void 0 : r.sz_rp_prob_v_3_1 : null == r ? void 0 : r.sz_rp_prob_v_3_3;
if (void 0 === o) return [];
if (Math.random() <= o) {
if ("3.1" == e) return hs.algorithmStrategyIOSSingleRefactoredInfo.offerOrderFillElim(this.traitName);
var n = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == n ? void 0 : n.active) && n.addAlgorithmNameMapping(hs.OFFER_TYPE_BLANK.ALGO_QUICK, this.traitName, null, null, hs.OFFER_TYPE_BLANK.ALGO_QUICK);
return [ hs.OFFER_TYPE_BLANK.ALGO_QUICK ];
}
return [];
};
r.prototype.getLocalData = function() {
return hs.gbmChurnRateInfo.churnRateInfo;
};
return i([ classId("CTRefactor$633_f_lightGBMFeature3xTrait") ], r);
}(Trait);
e.CTRefactor$633_f_lightGBMFeature3xTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$633_f_lightGBMFeature3xTrait" ]);
//# sourceMappingURL=index.js.map
