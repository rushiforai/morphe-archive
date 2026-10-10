window.__require = function t(o, e, r) {
function i(l, a) {
if (!e[l]) {
if (!o[l]) {
var c = l.split("/");
c = c[c.length - 1];
if (!o[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = c;
}
var f = e[l] = {
exports: {}
};
o[l][0].call(f.exports, function(t) {
return i(o[l][1][t] || t);
}, f, f.exports, t, o, e, r);
}
return e[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < r.length; l++) i(r[l]);
return i;
}({
CTRefactorRemoveAll23LimitRandomSmallTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "18ca0cKG29PQawmDAMPlwYE", "CTRefactorRemoveAll23LimitRandomSmallTrait");
var r, i = this && this.__extends || (r = function(t, o) {
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
}), n = this && this.__decorate || function(t, o, e, r) {
var i, n = arguments.length, l = n < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, e, r); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (l = (n < 3 ? i(l) : n > 3 ? i(o, e, l) : i(o, e)) || l);
return n > 3 && l && Object.defineProperty(o, e, l), l;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRemoveAll23LimitRandomSmallTrait = void 0;
var l = function(t) {
i(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(o.prototype, "isLimitBlock", {
get: function() {
var t;
return -1 !== (null !== (t = this.props.chapters) && void 0 !== t ? t : []).indexOf(hs.gameInfo.gameMode);
},
enumerable: !1,
configurable: !0
});
o.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
hostActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorRemoveAll23Trait")) || void 0 === t ? void 0 : t.active, "主特性 RemoveAll23 已激活");
},
isLimitBlock: function() {
return ASContext(t.isLimitBlock, "props.chapters 含当前 gameMode");
},
randDownOff: function() {
var t;
return ASContext(!(null === (t = TRAIT("CTRefactorRandBlockDownwardTrait")) || void 0 === t ? void 0 : t.active), "老逻辑：RandBlockDownwardTrait 未激活时才写 limitSmallRandomWeight");
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
fact: "isLimitBlock",
operator: "=",
value: !0
}, {
fact: "randDownOff",
operator: "=",
value: !0
} ]
},
platform: "all",
flow: "applyLimitRandomSmall"
} ];
};
o.prototype.onSDKArgsActions = function(t) {
return {
applyLimitRandomSmall: function() {
var o, e, r, i;
return {
limitSmallRandomWeight: {
isLimitBlockIdArr: !0,
isLimitCopyBlockIdArr: !0,
isUseCopyBlock: null === (e = null === (o = null == t ? void 0 : t.limitSmallRandomWeight) || void 0 === o ? void 0 : o.isUseCopyBlock) || void 0 === e || e,
copyFilterBlocks: null !== (i = null === (r = null == t ? void 0 : t.limitSmallRandomWeight) || void 0 === r ? void 0 : r.copyFilterBlocks) && void 0 !== i ? i : []
}
};
}
};
};
return n([ classId("CTRefactorRemoveAll23LimitRandomSmallTrait") ], o);
}(Trait);
e.CTRefactorRemoveAll23LimitRandomSmallTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRemoveAll23LimitRandomSmallTrait" ]);
//# sourceMappingURL=index.js.map
