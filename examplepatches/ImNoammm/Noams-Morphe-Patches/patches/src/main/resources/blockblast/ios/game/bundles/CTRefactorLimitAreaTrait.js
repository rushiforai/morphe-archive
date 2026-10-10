window.__require = function t(o, r, e) {
function n(a, s) {
if (!r[a]) {
if (!o[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!o[c]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = r[a] = {
exports: {}
};
o[a][0].call(f.exports, function(t) {
return n(o[a][1][t] || t);
}, f, f.exports, t, o, r, e);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < e.length; a++) n(e[a]);
return n;
}({
CTRefactorLimitAreaTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "2ee82mlZ29Ls51NUPAMPlxt", "CTRefactorLimitAreaTrait");
var e, n = this && this.__extends || (e = function(t, o) {
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
}), i = this && this.__decorate || function(t, o, r, e) {
var n, i = arguments.length, a = i < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, r, e); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(o, r, a) : n(o, r)) || a);
return i > 3 && a && Object.defineProperty(o, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLimitAreaTrait = void 0;
var a = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
r = o;
o.prototype.onPostprocessConditionContext = function(t) {
var o = this;
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(o.canRunAfterOffer(t), "是否可运行 After 后置段");
},
limitAreaFirstNameIsSuiJi: function() {
var t, o = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.SUI_JI];
return ASContext((null === (t = hs.algorithmName.algoActualName) || void 0 === t ? void 0 : t[0]) === o, "首位算法名为随机");
}
});
};
o.prototype.onPostprocessConditionOperators = function() {
return {
limitAreaIosAlgoList: function(t) {
return !!t && (!(hs.scoreInfo.score >= r.LIMIT_SCORE) && {
status: !0,
data: {
algoList: [ hs.OFFER_TYPE.ALGO_LIMIT_AREA ]
}
});
}
};
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "limitAreaFirstNameIsSuiJi",
operator: "limitAreaIosAlgoList",
value: !0
} ]
},
flow: "replaceLimitAreaIos",
platform: "ios"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
replaceLimitAreaIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.limitAreaIosAlgoList.data.algoList"
} ]
} ]
};
};
o.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
o.prototype.onSDKArgsConditionContext = function(t, o, r) {
var e = r.algorithmId;
return buildLazyConditionContext({
isLimitArea: function() {
return ASContext(e === hs.OFFER_TYPE_SHANG.ALGO_LIMIT_AREA, "是否随机策略控制位置");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isLimitArea",
operator: "=",
value: !0
} ]
},
flow: "flow1"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
flow1: function() {
return {
blockIds: hs.algorithmInfo.blockIdList,
blockNames: hs.algorithmName.algoActualName,
blockPoses: hs.algorithmInfo.blockPosList
};
}
};
};
var r;
o.LIMIT_SCORE = 1e3;
return r = i([ classId("CTRefactorLimitAreaTrait") ], o);
}(Trait);
r.CTRefactorLimitAreaTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLimitAreaTrait" ]);
//# sourceMappingURL=index.js.map
