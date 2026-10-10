window.__require = function t(e, o, r) {
function i(s, l) {
if (!o[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var a = "function" == typeof __require && __require;
if (!l && a) return a(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var u = o[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return i(e[s][1][t] || t);
}, u, u.exports, t, e, o, r);
}
return o[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < r.length; s++) i(r[s]);
return i;
}({
CTRefactorBlockLimitClassicsTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "a4071g8q1lLfqEI24ynVl0i", "CTRefactorBlockLimitClassicsTrait");
var r, i = this && this.__extends || (r = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, o, r) {
var i, n = arguments.length, s = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, o, r); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (s = (n < 3 ? i(s) : n > 3 ? i(e, o, s) : i(e, o)) || s);
return n > 3 && s && Object.defineProperty(e, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorBlockLimitClassicsTrait = void 0;
var s = [], l = [], c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.ignoreList = [ hs.OFFER_TYPE.TRAVEL_FILL_FUNCTION_BIT ];
return e;
}
Object.defineProperty(e.prototype, "scoreThreshold", {
get: function() {
return this.getPropScore();
},
enumerable: !1,
configurable: !0
});
e.prototype.getPropScore = function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BlockLimitClassicsTrait", "score", this.props, 2e3);
};
Object.defineProperty(e.prototype, "excludeAlgo", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("BlockLimitClassicsTrait", "excludeAlgo", this.props, []);
},
enumerable: !1,
configurable: !0
});
e.prototype.isInFlushLimitIgnoreList = function(t) {
return null != t && this.flushLimitAlgoth(this.ignoreList.concat()).includes(t);
};
e.prototype.flushLimitAlgoth = function(t) {
return t;
};
e.prototype.getLimitSmallBlock = function() {
if (hs.gameInfo.gameMode != hs.GameMode.Class) return "ignore";
if (this.flushLimitAlgoth(this.ignoreList.concat()).includes(hs.algorithmName.algoActualId)) return "ignore";
if (hs.scoreInfo.score >= this.scoreThreshold) {
var t = hs.algorithmName.algoActualId;
if (!this.excludeAlgo.includes(t)) return "limitSmall";
}
return "ignore";
};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
var r = this;
return buildLazyConditionContext({
isTriggerScore: function() {
return ASContext(hs.scoreInfo.score >= r.scoreThreshold, "无尽模式触发 limitSmall 的分数阈值（safeProps，默认 2000）");
},
isExcluded: function() {
return ASContext(!r.excludeAlgo.includes(null == o ? void 0 : o.algorithmId), "当前 SDK 算法在 excludeAlgo 排除列表");
},
isInFlushLimitIgnoreList: function() {
return ASContext(r.isInFlushLimitIgnoreList(null == o ? void 0 : o.algorithmId), "iOS flushLimitAlgoth ignore 列表命中（含 FIxIOSBlockLimitClassics AOP）");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isTriggerScore",
operator: ">=",
value: !0
}, {
fact: "isExcluded",
operator: "=",
value: !0
} ]
},
gameMode: "class",
platform: "gp",
flow: "applyLimitSmall"
}, {
conditions: {
and: [ {
fact: "isTriggerScore",
operator: ">=",
value: !0
}, {
fact: "isExcluded",
operator: "=",
value: !0
}, {
fact: "isInFlushLimitIgnoreList",
operator: "=",
value: !1
} ]
},
gameMode: "class",
platform: "ios",
flow: "applyLimitSmall"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
applyLimitSmall: function() {
return {
limitSmall: !0
};
}
};
};
e.prototype.getSdkArgsTraitsToDisableAfterGetLimitSmallHit = function() {
return s;
};
e.prototype.getSdkArgsTraitsToDisableAfterGetLimitRandomSmallHit = function() {
return l;
};
return n([ classId("CTRefactorBlockLimitClassicsTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorBlockLimitClassicsTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBlockLimitClassicsTrait" ]);
//# sourceMappingURL=index.js.map
