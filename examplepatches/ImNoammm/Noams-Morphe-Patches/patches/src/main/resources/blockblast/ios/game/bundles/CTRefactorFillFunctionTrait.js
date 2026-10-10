window.__require = function t(o, r, i) {
function e(l, a) {
if (!r[l]) {
if (!o[l]) {
var c = l.split("/");
c = c[c.length - 1];
if (!o[c]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = c;
}
var u = r[l] = {
exports: {}
};
o[l][0].call(u.exports, function(t) {
return e(o[l][1][t] || t);
}, u, u.exports, t, o, r, i);
}
return r[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < i.length; l++) e(i[l]);
return e;
}({
CTRefactorFillFunctionTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "79416Lm7Z5PjKyJ28XKW7Kn", "CTRefactorFillFunctionTrait");
var i, e = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
i(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), n = this && this.__decorate || function(t, o, r, i) {
var e, n = arguments.length, l = n < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, r, i); else for (var a = t.length - 1; a >= 0; a--) (e = t[a]) && (l = (n < 3 ? e(l) : n > 3 ? e(o, r, l) : e(o, r)) || l);
return n > 3 && l && Object.defineProperty(o, r, l), l;
}, l = this && this.__read || function(t, o) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var i, e, n = r.call(t), l = [];
try {
for (;(void 0 === o || o-- > 0) && !(i = n.next()).done; ) l.push(i.value);
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (r = n.return) && r.call(n);
} finally {
if (e) throw e.error;
}
}
return l;
}, a = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(l(arguments[o]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFillFunctionTrait = void 0;
var c = function(t) {
e(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.supportAlgos = [ hs.OFFER_TYPE.IOS_FILL_BLANK_BIT, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.ALGO_CLEAR_BOARD_GATHER, hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING ];
o.blocksArr = [ [ 1 ], [ 2, 3, 37, 38 ], [ 6, 27, 28, 15, 5, 4, 39, 40, 41 ], [ 9, 17, 7, 31, 30, 29, 8, 32, 33, 42, 34, 10, 20, 26, 25, 19, 18, 16, 14 ], [ 11, 24, 12, 23, 21, 22 ], [ 35, 36 ], [], [], [ 13 ] ];
return o;
}
o.prototype.onCreate = function() {
this.supportAlgos.includes(hs.OFFER_TYPE.EMPTYDONGFILL) || this.supportAlgos.push(hs.OFFER_TYPE.EMPTYDONGFILL);
};
o.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isLimitBlock: function() {
return ASContext(t.isLimitBlock(), "调参 funcType=execAlgorithmBitOper 且 allRemove");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isLimitBlock",
operator: "=",
value: !0
},
flow: "limitRandomWeightFlow"
} ];
};
o.prototype.onSDKArgsActions = function(t) {
var o, r, i, e, n, l, a = {
isLimitBlockIdArr: null !== (r = null === (o = t.limitSmallRandomWeight) || void 0 === o ? void 0 : o.isLimitBlockIdArr) && void 0 !== r && r,
isLimitCopyBlockIdArr: !0,
isUseCopyBlock: null === (e = null === (i = t.limitSmallRandomWeight) || void 0 === i ? void 0 : i.isUseCopyBlock) || void 0 === e || e,
copyFilterBlocks: null !== (l = null === (n = t.limitSmallRandomWeight) || void 0 === n ? void 0 : n.copyFilterBlocks) && void 0 !== l ? l : []
};
return {
limitRandomWeightFlow: function() {
return {
limitSmallRandomWeight: a
};
}
};
};
o.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
if (this.isLimitBlock()) {
var o = t.args[0];
if (this.isIosSupportAlgos(o)) {
var r = [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ], i = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
if (i && i.length > 0) {
var e = hs.algorithmStrategyLogic.insertArrayAlgorithms(o, r, i);
t.args[0] = e;
}
}
}
};
o.prototype.isLimitBlock = function() {
return "execAlgorithmBitOper" === this.props.funcType && !!this.props.allRemove;
};
o.prototype.getExcludeBlocksByParam = function(t) {
if (!t) return [];
for (var o = [], r = 0; r < this.blocksArr.length; r++) ("number" == typeof t && t === r + 1 || Array.isArray(t) && -1 !== t.indexOf(r + 1)) && (o = o.concat(this.blocksArr[r]));
return o;
};
o.prototype.isIosSupportAlgos = function(t) {
var o = a(t, as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList.map(function(t) {
return t.algorithmId;
}), as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList.map(function(t) {
return t.algorithmId;
}));
return hs.algorithmStrategyLogic.haveAlgorithms(o, [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ]);
};
o.prototype.getLimitSmallBlock = function() {
if (hs.algorithmName.algoActualId == hs.OFFER_TYPE.IOS_FILL_BLANK_BIT || hs.algorithmName.algoActualId == hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU) {
if (storage.getItem("classRoundNum", 0) >= 2) return "limitSmall";
} else if (this.supportAlgos.includes(hs.algorithmName.algoActualId)) return "limitSmall";
return "ignore";
};
return n([ classId("CTRefactorFillFunctionTrait"), classMethodWatch() ], o);
}(Trait);
r.CTRefactorFillFunctionTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFillFunctionTrait" ]);
//# sourceMappingURL=index.js.map
