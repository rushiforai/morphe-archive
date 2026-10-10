window.__require = function t(o, i, r) {
function e(l, c) {
if (!i[l]) {
if (!o[l]) {
var a = l.split("/");
a = a[a.length - 1];
if (!o[a]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(a, !0);
if (n) return n(a, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = a;
}
var u = i[l] = {
exports: {}
};
o[l][0].call(u.exports, function(t) {
return e(o[l][1][t] || t);
}, u, u.exports, t, o, i, r);
}
return i[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < r.length; l++) e(r[l]);
return e;
}({
CTRefactorBlockLimitClassicsLimitRandomSmallTrait: [ function(t, o, i) {
"use strict";
cc._RF.push(o, "8db9axTrMpAvKdY5nq4lh3d", "CTRefactorBlockLimitClassicsLimitRandomSmallTrait");
var r, e = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var i in o) Object.prototype.hasOwnProperty.call(o, i) && (t[i] = o[i]);
})(t, o);
}, function(t, o) {
r(t, o);
function i() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (i.prototype = o.prototype, new i());
}), n = this && this.__decorate || function(t, o, i, r) {
var e, n = arguments.length, l = n < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, i) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, i, r); else for (var c = t.length - 1; c >= 0; c--) (e = t[c]) && (l = (n < 3 ? e(l) : n > 3 ? e(o, i, l) : e(o, i)) || l);
return n > 3 && l && Object.defineProperty(o, i, l), l;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.CTRefactorBlockLimitClassicsLimitRandomSmallTrait = void 0;
var l = function(t) {
e(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
hostActive: function() {
var t;
return ASContext(!0 === (null === (t = TRAIT("CTRefactorBlockLimitClassicsTrait")) || void 0 === t ? void 0 : t.active), "主特性 BlockLimitClassics 已激活（映射辅助 trait）");
},
isTriggerScore: function() {
var o;
return ASContext("number" == typeof (null === (o = t.props) || void 0 === o ? void 0 : o.score) && hs.scoreInfo.score > t.props.score, "scoreInfo.score > props.score（老 getLimitRandomSmall strict >）");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "hostActive",
operator: "=",
value: !0
}, {
fact: "isTriggerScore",
operator: "=",
value: !0
} ]
},
gameMode: "class",
platform: "ios",
flow: "iosLimitRandomSmall"
} ];
};
o.prototype.onSDKArgsActions = function(t) {
return {
iosLimitRandomSmall: function() {
var o, i, r, e, n, l = TRAIT("CTRefactorBlockLimitClassicsTrait");
return {
limitSmallRandomWeight: {
isLimitBlockIdArr: !0,
isLimitCopyBlockIdArr: null !== (i = null === (o = t.limitSmallRandomWeight) || void 0 === o ? void 0 : o.isLimitCopyBlockIdArr) && void 0 !== i && i,
isUseCopyBlock: !1,
copyFilterBlocks: null !== (e = null === (r = t.limitSmallRandomWeight) || void 0 === r ? void 0 : r.copyFilterBlocks) && void 0 !== e ? e : []
},
disableTraits: null !== (n = null == l ? void 0 : l.getSdkArgsTraitsToDisableAfterGetLimitRandomSmallHit()) && void 0 !== n ? n : []
};
}
};
};
return n([ classId("CTRefactorBlockLimitClassicsLimitRandomSmallTrait") ], o);
}(Trait);
i.CTRefactorBlockLimitClassicsLimitRandomSmallTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBlockLimitClassicsLimitRandomSmallTrait" ]);
//# sourceMappingURL=index.js.map
