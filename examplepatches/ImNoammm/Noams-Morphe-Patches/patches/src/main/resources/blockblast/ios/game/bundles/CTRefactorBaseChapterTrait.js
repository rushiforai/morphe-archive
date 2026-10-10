window.__require = function t(r, e, o) {
function n(i, c) {
if (!e[i]) {
if (!r[i]) {
var p = i.split("/");
p = p[p.length - 1];
if (!r[p]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(p, !0);
if (a) return a(p, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = p;
}
var f = e[i] = {
exports: {}
};
r[i][0].call(f.exports, function(t) {
return n(r[i][1][t] || t);
}, f, f.exports, t, r, e, o);
}
return e[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorBaseChapterTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "d50c5R+gydL571xu3IaP+/R", "CTRefactorBaseChapterTrait");
var o, n = this && this.__extends || (o = function(t, r) {
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
}), a = this && this.__decorate || function(t, r, e, o) {
var n, a = arguments.length, i = a < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (a < 3 ? n(i) : a > 3 ? n(r, e, i) : n(r, e)) || i);
return a > 3 && i && Object.defineProperty(r, e, i), i;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorBaseChapterTrait = void 0;
var i = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.data = function() {
return {
isTrigger: !0
};
};
r.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isTrigger: function() {
return ASContext(t.state.isTrigger, "基础算法是否触发");
}
});
};
r.prototype.onPreprocessConditions = function() {
return {
mutex: {
TravelTrait: [ {
conditions: {
and: [ {
fact: "chapterRoundNum",
operator: ">",
value: 2
}, {
fact: "isTrigger",
operator: "=",
value: !0
} ]
},
flow: "flow1"
}, {
conditions: {
and: [ {
fact: "chapterRoundNum",
operator: "<=",
value: 2
}, {
fact: "isTrigger",
operator: "=",
value: !0
} ]
},
flow: "flow2"
} ]
}
};
};
r.prototype.onPreprocessActions = function() {
return {
mutex: {
TravelTrait: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.SUI_JI ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ],
flow2: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BLANK.TRAVEL_TIAN_KONG_XIAO_CHU ]
} ]
}
}
};
};
return a([ classId("CTRefactorBaseChapterTrait") ], r);
}(Trait);
e.CTRefactorBaseChapterTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBaseChapterTrait" ]);
//# sourceMappingURL=index.js.map
