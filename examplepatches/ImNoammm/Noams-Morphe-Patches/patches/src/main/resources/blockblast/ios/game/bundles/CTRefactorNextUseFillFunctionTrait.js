window.__require = function t(o, e, r) {
function n(a, c) {
if (!e[a]) {
if (!o[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!o[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var u = e[a] = {
exports: {}
};
o[a][0].call(u.exports, function(t) {
return n(o[a][1][t] || t);
}, u, u.exports, t, o, e, r);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
CTRefactorNextUseFillFunctionTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "2edcaYhcsVH5b2yZnUGm2RM", "CTRefactorNextUseFillFunctionTrait");
var r, n = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), i = this && this.__decorate || function(t, o, e, r) {
var n, i = arguments.length, a = i < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, r); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(o, e, a) : n(o, e)) || a);
return i > 3 && a && Object.defineProperty(o, e, a), a;
}, a = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var r, n, i = e.call(t), a = [];
try {
for (;(void 0 === o || o-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, c = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(a(arguments[o]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorNextUseFillFunctionTrait = void 0;
var l = [ 2, 3, 37, 38, 39, 40, 41, 6, 27, 28, 15, 5, 4 ], s = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.isLoadLocalData = !1;
o.localData = {};
return o;
}
o.prototype.data = function() {
if (!this.isLoadLocalData) {
this.loadLocalData();
this.isLoadLocalData = !0;
}
return this.localData;
};
o.prototype.onAlgorithmStrategyGameNewInit = function() {
this.localData.hardSuccesseNum = 0;
this.localData.hasShowHelpStep = !1;
this.saveLocalData();
};
o.prototype.onAlgorithmStrategySDKComplete = function(t, o) {
var e;
if (t && hs.gameInfo.gameMode === hs.GameMode.Class) {
var r = null !== (e = o.actualAlgorithmId) && void 0 !== e ? e : o.algorithmId;
if (hs.isValueInEnum(r, hs.OFFER_TYPE_DIFFICULTY)) {
this.localData.hardSuccesseNum++;
this.saveLocalData();
}
}
};
o.prototype.onPreprocessConditionOperators = function() {
return {
fillFunctionCondition: function(t) {
return !!t && {
status: !0,
data: {
algorithmIds: [ hs.OFFER_TYPE.ALGO_REMOTE_23 ]
}
};
}
};
};
o.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
condFirstHardRemove23: function() {
return ASContext(t.condFirstHardRemove23(), "非复活每局第一个困难难题直觉难题，下一个出填空消除条件");
}
});
};
o.prototype.onPreprocessConditions = function() {
return {
priority: [ {
conditions: {
fact: "condFirstHardRemove23",
operator: "fillFunctionCondition",
value: !0
},
event: {
type: "triggerFillFunctionSuccess"
},
flow: "fillFunctionIOS",
platform: "ios"
} ]
};
};
o.prototype.onPreprocessActions = function() {
return {
priority: {
fillFunctionIOS: [ {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "push",
args: [ {
fact: "operator.fillFunctionCondition.data.algorithmIds"
} ]
} ]
}
};
};
o.prototype.triggerFillFunctionSuccess = function() {
this.localData.hasShowHelpStep = !0;
this.saveLocalData();
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, this);
var t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == t ? void 0 : t.active) && t.addAlgorithmNameMapping(hs.OFFER_TYPE.ALGO_REMOTE_23, "CTRefactorNextUseFillFunctionTrait", hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT);
};
o.prototype.condFirstHardRemove23 = function() {
var t = storage.getItem("NextUseFillFunctionTraitKey", this.localData), o = this.localData.hardSuccesseNum, e = storage.getItem("classReviveShowNum", 0);
return 1 == o && 0 == e && 0 == t.hasShowHelpStep;
};
o.prototype.loadLocalData = function() {
var t = storage.getItem("NextUseFillFunctionTraitKey", {
hasShowHelpStep: !1,
hardSuccesseNum: 0
});
this.localData = t;
};
o.prototype.saveLocalData = function() {
storage.setItem("NextUseFillFunctionTraitKey", this.localData);
};
o.prototype.onSDKArgsConditionContext = function(t, o, e) {
return buildLazyConditionContext({
isAlgoRemote23: function() {
return ASContext((null == e ? void 0 : e.algorithmId) === hs.OFFER_TYPE_BLANK.ALGO_REMOTE_23, "当前 SDK 请求算法为 ALGO_REMOTE_23");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isAlgoRemote23",
operator: "=",
value: !0
},
flow: "injectFilterBlocks",
platform: "ios"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
injectFilterBlocks: function() {
return {
filterBlocks: c(l)
};
}
};
};
return i([ classId("CTRefactorNextUseFillFunctionTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorNextUseFillFunctionTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorNextUseFillFunctionTrait" ]);
//# sourceMappingURL=index.js.map
