window.__require = function t(e, r, o) {
function n(c, a) {
if (!r[c]) {
if (!e[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!e[l]) {
var f = "function" == typeof __require && __require;
if (!a && f) return f(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var u = r[c] = {
exports: {}
};
e[c][0].call(u.exports, function(t) {
return n(e[c][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorTravelFillFunctionBitTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "a2b3cTV5vdIkKvN7xI0VniQ", "CTRefactorTravelFillFunctionBitTrait");
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
var n, i = arguments.length, c = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorTravelFillFunctionBitTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoChapterReplaceTravelTianKongXiaoChu = function(t) {
t.args[0] = [ hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT ];
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
if (t && e.SDK_ALGO_TYPE === hs.OFFER_ALGORITHM_SDK_TYPE[hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT]) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.TRAVEL_FILL_FUNCTION_BIT, this);
}
};
return i([ classId("CTRefactorTravelFillFunctionBitTrait") ], e);
}(Trait);
r.CTRefactorTravelFillFunctionBitTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTravelFillFunctionBitTrait" ]);
//# sourceMappingURL=index.js.map
