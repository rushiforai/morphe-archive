window.__require = function t(e, o, r) {
function n(u, c) {
if (!o[u]) {
if (!e[u]) {
var l = u.split("/");
l = l[l.length - 1];
if (!e[l]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = l;
}
var s = o[u] = {
exports: {}
};
e[u][0].call(s.exports, function(t) {
return n(e[u][1][t] || t);
}, s, s.exports, t, e, o, r);
}
return o[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < r.length; u++) n(r[u]);
return n;
}({
CTRefactorContinueOutSameRemoveTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "09dc0f+ydtCZpo6bDs/Ejcz", "CTRefactorContinueOutSameRemoveTrait");
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
var n, i = arguments.length, u = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, o, r); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (u = (i < 3 ? n(u) : i > 3 ? n(e, o, u) : n(e, o)) || u);
return i > 3 && u && Object.defineProperty(e, o, u), u;
}, u = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, i = o.call(t), u = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) u.push(r.value);
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
return u;
}, c = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(u(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorContinueOutSameRemoveTrait = void 0;
var l = [ hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN ], a = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
return buildLazyConditionContext({
isNotIgnoredAlgo: function() {
return ASContext(!l.includes(null == o ? void 0 : o.algorithmId), "非 ALGO_DIFFICULT_DOWN（1.0 ignoreList）");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isNotIgnoredAlgo",
operator: "=",
value: !0
} ]
},
flow: "injectContinueOutSameRemove",
gameMode: "class"
} ];
};
e.prototype.onSDKArgsActions = function(t) {
var e = this;
return {
injectContinueOutSameRemove: function() {
var o = e.removeId();
return {
limitSmallRandomWeight: e.buildLimitSmallRandomWeight(t, o)
};
}
};
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
var e, o, r = null !== (o = null === (e = t.sdk) || void 0 === e ? void 0 : e.blockIds) && void 0 !== o ? o : [];
this.checkCanRecord(!0) && this.recordPreIds(c(r));
};
e.prototype.checkCanRecord = function(t) {
return t;
};
e.prototype.checkCanRemove = function() {
return this.removeId().length >= 0;
};
e.prototype.recordPreIds = function(t) {
hs.storage.setItem("continueOutSameRemove", c(t));
};
e.prototype.removeId = function() {
return hs.storage.getItem("continueOutSameRemove", []);
};
e.prototype.isSupportAlgorithm = function(t) {
return [ hs.OFFER_TYPE.SUI_JI, hs.OFFER_TYPE.SUI_JI_WU_SI, hs.OFFER_TYPE.ALGORITHM_INCREASE_VARIANCE_RANDOM, hs.OFFER_TYPE.SHANG_ZENG_3, hs.OFFER_TYPE.SHANG_ZEND_MEDIUM, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING, hs.OFFER_TYPE.EMPTYDONGFILL, hs.OFFER_TYPE.KUN_NAN_NAN_TI ].includes(t);
};
e.prototype.buildLimitSmallRandomWeight = function(t, e) {
var o, r, n, i = t.limitSmallRandomWeight;
return {
isLimitBlockIdArr: null !== (o = null == i ? void 0 : i.isLimitBlockIdArr) && void 0 !== o && o,
isLimitCopyBlockIdArr: null !== (r = null == i ? void 0 : i.isLimitCopyBlockIdArr) && void 0 !== r && r,
isUseCopyBlock: null === (n = null == i ? void 0 : i.isUseCopyBlock) || void 0 === n || n,
copyFilterBlocks: e
};
};
return i([ classId("CTRefactorContinueOutSameRemoveTrait") ], e);
}(Trait);
o.CTRefactorContinueOutSameRemoveTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueOutSameRemoveTrait" ]);
//# sourceMappingURL=index.js.map
