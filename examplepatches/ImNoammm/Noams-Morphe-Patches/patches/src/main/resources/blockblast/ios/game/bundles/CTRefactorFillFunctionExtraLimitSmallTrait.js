window.__require = function t(o, e, i) {
function r(l, c) {
if (!e[l]) {
if (!o[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!o[a]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var s = e[l] = {
exports: {}
};
o[l][0].call(s.exports, function(t) {
return r(o[l][1][t] || t);
}, s, s.exports, t, o, e, i);
}
return e[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < i.length; l++) r(i[l]);
return r;
}({
CTRefactorFillFunctionExtraLimitSmallTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "2aa7bvR/d5JgaV+is6KNorU", "CTRefactorFillFunctionExtraLimitSmallTrait");
var i, r = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), n = this && this.__decorate || function(t, o, e, i) {
var r, n = arguments.length, l = n < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, e, i); else for (var c = t.length - 1; c >= 0; c--) (r = t[c]) && (l = (n < 3 ? r(l) : n > 3 ? r(o, e, l) : r(o, e)) || l);
return n > 3 && l && Object.defineProperty(o, e, l), l;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFillFunctionExtraLimitSmallTrait = void 0;
var l = function(t) {
r(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(o.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
o.prototype.data = function() {
return {
limitBlock: !1,
excludeBlocks: []
};
};
o.prototype.onSDKArgsConditionContext = function(t, o, e) {
var i = null == e ? void 0 : e.algorithmId;
return buildLazyConditionContext({
isLimitBlock: function() {
var t = TRAIT("CTRefactorFillFunctionTrait");
return (null == t ? void 0 : t.active) ? ASContext(!0 === t.isLimitBlock(), "主 trait isLimitBlock") : ASContext(!1, "主特性未激活");
},
isSupportAlgo: function() {
var t = TRAIT("CTRefactorFillFunctionTrait");
return (null == t ? void 0 : t.active) ? ASContext(!0 === t.supportAlgos.includes(i), "算法在主 trait supportAlgos 中") : ASContext(!1, "主特性未激活");
}
});
};
o.prototype.onSDKArgsConditions = function() {
var t = {
and: [ {
fact: "isLimitBlock",
operator: "=",
value: !0
}, {
fact: "isSupportAlgo",
operator: "=",
value: !0
} ]
};
return [ {
conditions: t,
flow: "extraLimitSmallFlow",
event: {
type: "setLimitBlockState"
}
}, {
conditions: {
not: t
},
event: {
type: "resetLimitBlockState"
}
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
extraLimitSmallFlow: function() {
return {
extra: {
traits: {
extraLimitSmall: !0
}
}
};
}
};
};
o.prototype.setLimitBlockState = function() {
var t = TRAIT("CTRefactorFillFunctionTrait");
if (null == t ? void 0 : t.active) {
var o = t.getExcludeBlocksByParam(t.props.exclude);
this.state.excludeBlocks = o;
this.state.limitBlock = !0;
}
};
o.prototype.resetLimitBlockState = function() {
this.state.limitBlock = !1;
this.state.excludeBlocks = [];
};
return n([ classId("CTRefactorFillFunctionExtraLimitSmallTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorFillFunctionExtraLimitSmallTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFillFunctionExtraLimitSmallTrait" ]);
//# sourceMappingURL=index.js.map
