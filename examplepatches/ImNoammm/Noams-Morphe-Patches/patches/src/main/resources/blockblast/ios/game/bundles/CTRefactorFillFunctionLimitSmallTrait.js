window.__require = function t(o, r, i) {
function e(l, c) {
if (!r[l]) {
if (!o[l]) {
var u = l.split("/");
u = u[u.length - 1];
if (!o[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = u;
}
var f = r[l] = {
exports: {}
};
o[l][0].call(f.exports, function(t) {
return e(o[l][1][t] || t);
}, f, f.exports, t, o, r, i);
}
return r[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < i.length; l++) e(i[l]);
return e;
}({
CTRefactorFillFunctionLimitSmallTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "f23feeeHVNChoFGEffIfoAd", "CTRefactorFillFunctionLimitSmallTrait");
var i, e = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
i(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), n = this && this.__decorate || function(t, o, r, i) {
var e, n = arguments.length, l = n < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, r, i); else for (var c = t.length - 1; c >= 0; c--) (e = t[c]) && (l = (n < 3 ? e(l) : n > 3 ? e(o, r, l) : e(o, r)) || l);
return n > 3 && l && Object.defineProperty(o, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFillFunctionLimitSmallTrait = void 0;
var l = function(t) {
e(o, t);
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
o.prototype.onSDKArgsConditionContext = function(t, o, r) {
var i = null == r ? void 0 : r.algorithmId;
return buildLazyConditionContext({
isLimitBlock: function() {
var t = TRAIT("CTRefactorFillFunctionTrait");
return (null == t ? void 0 : t.active) ? ASContext(!0 === t.isLimitBlock(), "主 trait isLimitBlock") : ASContext(!1, "主特性未激活");
},
isSupportAlgo: function() {
var t = TRAIT("CTRefactorFillFunctionTrait");
return (null == t ? void 0 : t.active) ? ASContext(!0 === t.supportAlgos.includes(i), "算法在主 trait supportAlgos 中") : ASContext(!1, "主特性未激活");
},
isBitFillOrTKXC: function() {
return ASContext(i === hs.OFFER_TYPE.IOS_FILL_BLANK_BIT || i === hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, "算法是位运算填空或填空消除");
},
roundGe2: function() {
return ASContext(hs.storage.getItem("classRoundNum", 0) >= 2, "轮数>=2");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isLimitBlock",
operator: "=",
value: !0
}, {
or: [ {
and: [ {
fact: "isBitFillOrTKXC",
operator: "=",
value: !0
}, {
fact: "roundGe2",
operator: "=",
value: !0
} ]
}, {
and: [ {
fact: "isBitFillOrTKXC",
operator: "=",
value: !1
}, {
fact: "isSupportAlgo",
operator: "=",
value: !0
} ]
} ]
} ]
},
flow: "limitSmallFlow"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
limitSmallFlow: function() {
return {
limitSmall: !0
};
}
};
};
return n([ classId("CTRefactorFillFunctionLimitSmallTrait"), classMethodWatch() ], o);
}(Trait);
r.CTRefactorFillFunctionLimitSmallTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFillFunctionLimitSmallTrait" ]);
//# sourceMappingURL=index.js.map
