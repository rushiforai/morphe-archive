window.__require = function t(e, r, o) {
function n(l, c) {
if (!r[l]) {
if (!e[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!e[a]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var f = r[l] = {
exports: {}
};
e[l][0].call(f.exports, function(t) {
return n(e[l][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < o.length; l++) n(o[l]);
return n;
}({
CTRefactorMultiElementCollect_BlockOrderLayerTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "92be8sNLYBLko7Z/Wcj5RVT", "CTRefactorMultiElementCollect_BlockOrderLayerTrait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, l = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (l = (i < 3 ? n(l) : i > 3 ? n(e, r, l) : n(e, r)) || l);
return i > 3 && l && Object.defineProperty(e, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorMultiElementCollect_BlockOrderLayerTrait = void 0;
var l = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategyPositionAdjust = function() {
if (3 == hs.chapterAlgorithmInfo.blockIdList.length) {
var t = this.getMultiElementCollectParam();
return hs.algorithmName.algoActualId == hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU && t.fillPathFirst ? {
data: hs.AlgorithmStrategyPositionType.LEFT,
disableTraits: [ "CTRefactorBasePositionAdjustTrait" ]
} : void 0;
}
};
e.prototype.getMultiElementCollectParam = function() {
return hs.traitConfigInfo.traitsByIdMap[649002].param;
};
return i([ classId("CTRefactorMultiElementCollect_BlockOrderLayerTrait") ], e);
}(Trait);
r.CTRefactorMultiElementCollect_BlockOrderLayerTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMultiElementCollect_BlockOrderLayerTrait" ]);
//# sourceMappingURL=index.js.map
