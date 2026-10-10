window.__require = function t(o, r, e) {
function i(l, c) {
if (!r[l]) {
if (!o[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!o[a]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var u = r[l] = {
exports: {}
};
o[l][0].call(u.exports, function(t) {
return i(o[l][1][t] || t);
}, u, u.exports, t, o, r, e);
}
return r[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < e.length; l++) i(e[l]);
return i;
}({
CTRefactorRemoveAll23Trait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "0da884QzbBP/qNMurYsclOg", "CTRefactorRemoveAll23Trait");
var e, i = this && this.__extends || (e = function(t, o) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
e(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), n = this && this.__decorate || function(t, o, r, e) {
var i, n = arguments.length, l = n < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, r, e); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (l = (n < 3 ? i(l) : n > 3 ? i(o, r, l) : i(o, r)) || l);
return n > 3 && l && Object.defineProperty(o, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorRemoveAll23Trait = void 0;
var l = function(t) {
i(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.workAlgorithmList = [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_NOT_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_BIT, hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT, hs.OFFER_TYPE.SHANG_ZEND_MEDIUM, hs.OFFER_TYPE.HISTORY_CLEAR_BOARD, hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN, hs.OFFER_TYPE.IOS_KUN_NAN_BIT, hs.OFFER_TYPE.ALGO_HISTORY_BOARD, hs.OFFER_TYPE.IOS_ALGO_TRAVEL_BLOCK_RANDOMNESS, hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY ];
return o;
}
Object.defineProperty(o.prototype, "isLimitBlock", {
get: function() {
var t;
return -1 !== (null !== (t = this.props.chapters) && void 0 !== t ? t : []).indexOf(hs.gameInfo.gameMode);
},
enumerable: !1,
configurable: !0
});
o.prototype.isAlgorithmStrategyLogicProduceRandomId = function(t) {
var o;
t.args[2] = null !== (o = this.props.blockIds) && void 0 !== o ? o : [ 2, 3, 37, 38, 39, 40, 41, 6, 27, 28, 15, 5, 4 ];
};
o.prototype.onSDKArgsConditionContext = function(t, o, r) {
var e = this;
return buildLazyConditionContext({
isLimitBlockScope: function() {
return ASContext(e.isLimitBlock, "props.chapters 含当前 gameMode");
},
isInWorkAlgo: function() {
return ASContext(e.workAlgorithmList.includes(null == r ? void 0 : r.algorithmId), "当前算法在 workAlgorithmList 白名单内");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isLimitBlockScope",
operator: "=",
value: !0
}, {
fact: "isInWorkAlgo",
operator: "=",
value: !0
} ]
},
platform: "all",
flow: "applyLimitSmall"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
applyLimitSmall: function() {
return {
limitSmall: !0
};
}
};
};
o.prototype.getLimitSmallBlock = function() {
return this.isLimitBlock && this.workAlgorithmList.includes(hs.algorithmName.algoActualId) ? "limitSmall" : "ignore";
};
o.isLegacyRandBlockDownwardActive = function() {
var t;
return !!(null === (t = TRAIT("CTRefactorRandBlockDownwardTrait")) || void 0 === t ? void 0 : t.active);
};
return n([ classId("CTRefactorRemoveAll23Trait"), classMethodWatch() ], o);
}(Trait);
r.CTRefactorRemoveAll23Trait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRemoveAll23Trait" ]);
//# sourceMappingURL=index.js.map
