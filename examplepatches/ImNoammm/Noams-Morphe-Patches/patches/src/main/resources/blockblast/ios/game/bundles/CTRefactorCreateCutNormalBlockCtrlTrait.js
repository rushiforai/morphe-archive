window.__require = function t(r, o, e) {
function a(l, i) {
if (!o[l]) {
if (!r[l]) {
var u = l.split("/");
u = u[u.length - 1];
if (!r[u]) {
var c = "function" == typeof __require && __require;
if (!i && c) return c(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = u;
}
var s = o[l] = {
exports: {}
};
r[l][0].call(s.exports, function(t) {
return a(r[l][1][t] || t);
}, s, s.exports, t, r, o, e);
}
return o[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < e.length; l++) a(e[l]);
return a;
}({
CTRefactorCreateCutNormalBlockCtrlTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "48823kGbNxMVIuVZKO/HSXh", "CTRefactorCreateCutNormalBlockCtrlTrait");
var e, a = this && this.__extends || (e = function(t, r) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
})(t, r);
}, function(t, r) {
e(t, r);
function o() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (o.prototype = r.prototype, new o());
}), n = this && this.__decorate || function(t, r, o, e) {
var a, n = arguments.length, l = n < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, r, o, e); else for (var i = t.length - 1; i >= 0; i--) (a = t[i]) && (l = (n < 3 ? a(l) : n > 3 ? a(r, o, l) : a(r, o)) || l);
return n > 3 && l && Object.defineProperty(r, o, l), l;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorCreateCutNormalBlockCtrlTrait = void 0;
var l = function(t) {
a(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onPostprocessConditionContext = function(t) {
var r = this;
return buildLazyConditionContext({
canRunAfterOfferIOS: function() {
return ASContext(r.canRunAfterOffer(t), "iOS 是否可运行 After 后置段");
},
createCutNormalIosNotJulong: function() {
var t;
return ASContext(!(null === (t = hs.algorithmName.algoActualName) || void 0 === t ? void 0 : t.some(function(t) {
return "聚拢算法" === t;
})), "iOS：聚拢算法直接跳过");
},
createCutNormalGpNotExcluded: function() {
var t;
return ASContext(!(null === (t = hs.algorithmName.algoActualName) || void 0 === t ? void 0 : t.some(function(t) {
return t === hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_CLEAR_BOARD_GATHER];
})), "GP：清屏聚拢直接跳过");
}
});
};
r.prototype.onPostprocessConditionOperators = function() {
var t = this;
return {
createCutNormalIosAlgoList: function(r) {
var o, e;
return !!r && !!t.isScoreInRange(null === (o = t.props) || void 0 === o ? void 0 : o.score2) && !(null === (e = hs.algorithmName.algoActualName) || void 0 === e || !e.some(function(t) {
return "填空消除" === t;
})) && {
status: !0,
data: {
algoList: [ hs.OFFER_TYPE.ALGO_HORIZONTAL_3_8 ]
}
};
},
createCutNormalGpAlgoList: function(r) {
var o, e, a;
if (!r) return !1;
if (!t.isScoreInRange(null === (o = t.props) || void 0 === o ? void 0 : o.score)) return !1;
var n = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU];
return !(null === (e = hs.algorithmName.algoActualName) || void 0 === e || !e.some(function(t) {
return t === n;
})) && !(null === (a = t.props) || void 0 === a || !a.isAllStage) && {
status: !0,
data: {
algoList: [ hs.OFFER_TYPE.ALGO_HORIZONTAL_3_8 ]
}
};
}
};
};
r.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOfferIOS",
operator: "=",
value: !0
}, {
fact: "createCutNormalIosNotJulong",
operator: "createCutNormalIosAlgoList",
value: !0
} ]
},
flow: "replaceCreateCutNormalIos",
platform: "ios"
}, {
conditions: {
fact: "createCutNormalGpNotExcluded",
operator: "createCutNormalGpAlgoList",
value: !0
},
flow: "replaceCreateCutNormalGp",
platform: "gp"
} ];
};
r.prototype.onPostprocessActions = function() {
return {
replaceCreateCutNormalIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.createCutNormalIosAlgoList.data.algoList"
} ]
} ],
replaceCreateCutNormalGp: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.createCutNormalGpAlgoList.data.algoList"
} ]
} ]
};
};
r.prototype.isScoreInRange = function(t) {
if (t && t.length > 1) {
var r = hs.classScoreInfo.score;
return r > t[0] && r < t[1];
}
return !0;
};
r.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
return n([ classId("CTRefactorCreateCutNormalBlockCtrlTrait") ], r);
}(Trait);
o.CTRefactorCreateCutNormalBlockCtrlTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCreateCutNormalBlockCtrlTrait" ]);
//# sourceMappingURL=index.js.map
