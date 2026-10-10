window.__require = function e(t, r, o) {
function a(i, p) {
if (!r[i]) {
if (!t[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!t[l]) {
var f = "function" == typeof __require && __require;
if (!p && f) return f(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var c = r[i] = {
exports: {}
};
t[i][0].call(c.exports, function(e) {
return a(t[i][1][e] || e);
}, c, c.exports, e, t, r, o);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
CTRefactorLevelRandomReplaceTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "71ea4ILLU1JiZtflWiTqBGY", "CTRefactorLevelRandomReplaceTrait");
var o, a = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), n = this && this.__decorate || function(e, t, r, o) {
var a, n = arguments.length, i = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, o); else for (var p = e.length - 1; p >= 0; p--) (a = e[p]) && (i = (n < 3 ? a(i) : n > 3 ? a(t, r, i) : a(t, r)) || i);
return n > 3 && i && Object.defineProperty(t, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorLevelRandomReplaceTrait = void 0;
var i = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.getOfferType = function() {
return hs.algorithmStrategyLogic.getShangZengAndSuiJi(this.rate1, !1, this.algoId1, this.algoId2);
};
Object.defineProperty(t.prototype, "algoId1", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelRandomReplaceTrait", "algoId1", this.props, hs.OFFER_TYPE_BASE.SUI_JI_WU_SI);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "algoId2", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelRandomReplaceTrait", "algoId2", this.props, hs.OFFER_TYPE_SHANG.SHANG_ZENG_3);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "rate1", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelRandomReplaceTrait", "rate1", this.props, .5);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "rate2", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("LevelRandomReplaceTrait", "rate2", this.props, .5);
},
enumerable: !1,
configurable: !0
});
t.prototype.onPreprocessConditionOperators = function() {
var e = this;
return {
randomAlgo: function() {
return {
status: !0,
data: {
algorithmId: e.getOfferType()
}
};
}
};
};
t.prototype.onPreprocessConditions = function() {
return {
postPreprocessing: [ {
conditions: {
fact: "isTrue",
operator: "randomAlgo",
value: !0
},
flow: "replaceRandom",
platform: "gp"
} ]
};
};
t.prototype.onPreprocessActions = function() {
return {
postPreprocessing: {
replaceRandom: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.SUI_JI, {
fact: "operator.randomAlgo.data.algorithmId"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replace",
args: [ hs.OFFER_TYPE_BASE.SUI_JI, {
fact: "operator.randomAlgo.data.algorithmId"
} ]
} ]
}
};
};
t.prototype.isAlgorithmStrategyLogicGetShangZengAndSuiJiRate = function(e) {
hs.layerFeatureInfo.isLoadedChapter && (e.returnValue = this.rate1 + this.rate2);
};
t.prototype.isAlgorithmStrategyIOSRandomRefactoredInfoOfferTravelSuiJi = function(e) {
if (this.props) {
var t = this.props.rate1 + this.props.rate2, r = Math.random() * t < this.props.rate1 ? 0 : 1, o = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (0 == r) {
e.returnValue = [ hs.OFFER_TYPE.SUI_JI_WU_SI ];
null == o || o.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorLevelRandomReplaceTrait", hs.OFFER_TYPE.SUI_JI_WU_SI);
} else if (1 == r) {
e.returnValue = hs.algorithmStrategyIOSShangRefactoredInfo.offerNoBit();
null == o || o.addAlgorithmNameMapping(hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT, "CTRefactorLevelRandomReplaceTrait", hs.OFFER_TYPE.SHANG_ZENG_3_NO_BIT);
}
}
};
return n([ classId("CTRefactorLevelRandomReplaceTrait") ], t);
}(Trait);
r.CTRefactorLevelRandomReplaceTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorLevelRandomReplaceTrait" ]);
//# sourceMappingURL=index.js.map
