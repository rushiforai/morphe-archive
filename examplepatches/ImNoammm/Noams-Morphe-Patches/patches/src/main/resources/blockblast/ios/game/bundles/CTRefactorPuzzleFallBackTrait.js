window.__require = function t(r, e, o) {
function i(l, a) {
if (!e[l]) {
if (!r[l]) {
var s = l.split("/");
s = s[s.length - 1];
if (!r[s]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = s;
}
var u = e[l] = {
exports: {}
};
r[l][0].call(u.exports, function(t) {
return i(r[l][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < o.length; l++) i(o[l]);
return i;
}({
CTRefactorPuzzleFallBackTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "3fa899e/b5Ay5uYZRFx18ke", "CTRefactorPuzzleFallBackTrait");
var o, i = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), n = this && this.__decorate || function(t, r, e, o) {
var i, n = arguments.length, l = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, r, e, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (l = (n < 3 ? i(l) : n > 3 ? i(r, e, l) : i(r, e)) || l);
return n > 3 && l && Object.defineProperty(r, e, l), l;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorPuzzleFallBackTrait = void 0;
var l = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isDifficultyOrDie = function(t) {
return !!((null == t ? void 0 : t.algorithmList) && (null == t ? void 0 : t.algorithmFallbackList)) && t.algorithmList.length > 0 && 0 === t.algorithmFallbackList.length && (hs.isValueInEnum(t.algorithmList[t.algorithmList.length - 1].algorithmId, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(t.algorithmList[t.algorithmList.length - 1].algorithmId, hs.OFFER_TYPE_DIE));
};
r.prototype.onPreprocessConditionContext = function(t) {
return buildLazyConditionContext({
isAlgorithmListNull: function() {
return ASContext(0 === t.algorithmList.length, "算法列表是否为空");
},
isFallBackNull: function() {
return ASContext(t.algorithmList.length > 0 && 0 === t.algorithmFallbackList.length, "降级列表是否为空");
},
isDifficultyOrDie: function() {
return ASContext(hs.isValueInEnum(t.algorithmList[t.algorithmList.length - 1].algorithmId, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(t.algorithmList[t.algorithmList.length - 1].algorithmId, hs.OFFER_TYPE_DIE), "是否为困难难题或致死题");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
postPreprocessing: [ {
conditions: {
and: [ {
fact: "isAlgorithmListNull",
operator: "=",
value: !0
} ]
},
flow: "flow0"
} ],
base: [ {
conditions: {
and: [ {
fact: "isTrue",
operator: "resetAlgorithmCache",
value: !0
}, {
fact: "isFallBackNull",
operator: "=",
value: !0
}, {
fact: "isDifficultyOrDie",
operator: "=",
value: !0
} ]
},
flow: "flow1"
} ]
};
};
r.prototype.resetAlgorithmCache = function() {};
r.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
resetAlgorithmCache: function() {
t.resetAlgorithmCache();
return {
status: !0
};
}
};
};
r.prototype.onPreprocessActions = function() {
return {
postPreprocessing: {
flow0: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.SUI_JI ]
} ]
},
base: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "push",
args: [ hs.OFFER_TYPE_SHANG.SHANG_ZENG_3 ]
} ]
}
};
};
n([ hs.AlgorithmCacheClear ], r.prototype, "resetAlgorithmCache", null);
return n([ classId("CTRefactorPuzzleFallBackTrait") ], r);
}(Trait);
e.CTRefactorPuzzleFallBackTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleFallBackTrait" ]);
//# sourceMappingURL=index.js.map
