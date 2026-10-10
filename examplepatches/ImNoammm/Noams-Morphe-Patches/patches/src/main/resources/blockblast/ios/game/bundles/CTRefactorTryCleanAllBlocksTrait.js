window.__require = function t(o, r, e) {
function l(i, a) {
if (!r[i]) {
if (!o[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!o[s]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var u = r[i] = {
exports: {}
};
o[i][0].call(u.exports, function(t) {
return l(o[i][1][t] || t);
}, u, u.exports, t, o, r, e);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < e.length; i++) l(e[i]);
return l;
}({
CTRefactorTryCleanAllBlocksTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "bbd5dl6EihFl637HwCRxPP1", "CTRefactorTryCleanAllBlocksTrait");
var e, l = this && this.__extends || (e = function(t, o) {
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
var l, n = arguments.length, i = n < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, o, r, e); else for (var a = t.length - 1; a >= 0; a--) (l = t[a]) && (i = (n < 3 ? l(i) : n > 3 ? l(o, r, i) : l(o, r)) || i);
return n > 3 && i && Object.defineProperty(o, r, i), i;
}, i = this && this.__read || function(t, o) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var e, l, n = r.call(t), i = [];
try {
for (;(void 0 === o || o-- > 0) && !(e = n.next()).done; ) i.push(e.value);
} catch (t) {
l = {
error: t
};
} finally {
try {
e && !e.done && (r = n.return) && r.call(n);
} finally {
if (l) throw l.error;
}
}
return i;
}, a = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(i(arguments[o]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorTryCleanAllBlocksTrait = void 0;
var s = function(t) {
l(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(o.prototype, "scoreThreshold", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("TryCleanAllBlocksTrait", "scoreThreshold", this.props, 450);
},
enumerable: !1,
configurable: !0
});
o.prototype.isAlgorithmStrategyIOSBlankRefactoredInfoReplaceClass = function(t) {
this.handleBlankRefactoredReplaceClass(t);
};
o.prototype.handleBlankRefactoredReplaceClass = function(t) {
if (hs.scoreInfo.score < hs.scoreInfo.highRecordScore && hs.scoreInfo.score >= hs.scoreInfo.highRecordScore - this.scoreThreshold) {
var o = a([ hs.OFFER_TYPE.CLEAR_BOARD_BLANK ], t.args[0]);
t.args[0] = o;
}
};
o.prototype.onPreprocessConditionContext = function(t) {
return buildLazyConditionContext({
tryCleanAllBlocksFlow: function() {
return ASContext(t, "TryCleanAllBlocks 预处理 flow 快照");
}
});
};
o.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
resolveTryCleanAllBlocks: function(o) {
return t.resolveTryCleanAllBlocks(o);
}
};
};
o.prototype.onPreprocessConditions = function() {
return {
blankAlgorithm: [ {
conditions: {
fact: "tryCleanAllBlocksFlow",
operator: "resolveTryCleanAllBlocks",
value: !0
},
flow: "tryCleanAllBlocks",
platform: "gp",
gameMode: "class"
} ]
};
};
o.prototype.onPreprocessActions = function() {
return {
blankAlgorithm: {
tryCleanAllBlocks: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTryCleanAllBlocks.data.algorithmList"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.resolveTryCleanAllBlocks.data.fallbackList"
} ]
} ]
}
};
};
o.prototype.resolveTryCleanAllBlocks = function(t) {
var o, r;
if (!(hs.scoreInfo.score < hs.scoreInfo.highRecordScore && hs.scoreInfo.score >= hs.scoreInfo.highRecordScore - this.scoreThreshold)) return {
status: !1
};
for (var e = this.collectCleanAlgorithmIds(null !== (o = null == t ? void 0 : t.algorithmList) && void 0 !== o ? o : as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList), l = this.collectCleanAlgorithmIds(null !== (r = null == t ? void 0 : t.algorithmFallbackList) && void 0 !== r ? r : as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList), n = !1, i = e.slice(), a = 0; a < i.length; a++) if (this.shouldUpdateCleanAlgorithm(i[a])) {
n = !0;
i[a] = hs.OFFER_TYPE.CLEAR_BOARD_BLANK;
}
if (n) return {
status: !0,
data: {
algorithmList: i,
fallbackList: [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.SUI_JI_WU_SI ]
}
};
var s = !1, c = l.slice();
for (a = 0; a < c.length; a++) if (this.shouldUpdateCleanAlgorithm(c[a])) {
s = !0;
c[a] = hs.OFFER_TYPE.CLEAR_BOARD_BLANK;
}
return s ? {
status: !0,
data: {
fallbackList: c
}
} : {
status: !1
};
};
o.prototype.collectCleanAlgorithmIds = function(t) {
return t ? t.map(function(t) {
return t.algorithmId;
}) : [];
};
o.prototype.shouldUpdateCleanAlgorithm = function(t) {
return hs.isValueInEnum(t, hs.OFFER_TYPE_BLANK) && t !== hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU && t !== hs.OFFER_TYPE.ALL_COMBINATION_ID70 && t !== hs.OFFER_TYPE.EMPTYDONGFILL;
};
o.prototype.onSDKArgsConditionContext = function(t, o, r) {
return buildLazyConditionContext({
isClearBoardBlank: function() {
return ASContext((null == r ? void 0 : r.algorithmId) === hs.OFFER_TYPE_BASE.CLEAR_BOARD_BLANK, "是否清盘填空算法");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isClearBoardBlank",
operator: "=",
value: !0
},
platform: "ios",
flow: "limitRandomSmallWeight"
} ];
};
o.prototype.onSDKArgsActions = function(t) {
var o, r, e, l, n, i, a = {
isLimitBlockIdArr: null !== (r = null === (o = t.limitSmallRandomWeight) || void 0 === o ? void 0 : o.isLimitBlockIdArr) && void 0 !== r && r,
isLimitCopyBlockIdArr: !0,
isUseCopyBlock: null === (l = null === (e = t.limitSmallRandomWeight) || void 0 === e ? void 0 : e.isUseCopyBlock) || void 0 === l || l,
copyFilterBlocks: null !== (i = null === (n = t.limitSmallRandomWeight) || void 0 === n ? void 0 : n.copyFilterBlocks) && void 0 !== i ? i : []
};
return {
limitRandomSmallWeight: function() {
return {
limitSmallRandomWeight: a
};
}
};
};
return n([ classId("CTRefactorTryCleanAllBlocksTrait") ], o);
}(Trait);
r.CTRefactorTryCleanAllBlocksTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTryCleanAllBlocksTrait" ]);
//# sourceMappingURL=index.js.map
