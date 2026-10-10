window.__require = function t(e, r, o) {
function n(u, a) {
if (!r[u]) {
if (!e[u]) {
var c = u.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = c;
}
var f = r[u] = {
exports: {}
};
e[u][0].call(f.exports, function(t) {
return n(e[u][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < o.length; u++) n(o[u]);
return n;
}({
CTRefactorContinueOutSameRemoveHandleArgsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "293b3E6rlVH6JvGlDb3sdqU", "CTRefactorContinueOutSameRemoveHandleArgsTrait");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, u = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (u = (i < 3 ? n(u) : i > 3 ? n(e, r, u) : n(e, r)) || u);
return i > 3 && u && Object.defineProperty(e, r, u), u;
}, u = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, i = r.call(t), u = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) u.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return u;
}, a = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(u(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorContinueOutSameRemoveHandleArgsTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
return buildLazyConditionContext({
hostActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorContinueOutSameRemoveTrait")) || void 0 === t ? void 0 : t.active, "主特性 ContinueOutSameRemove 已激活");
},
isSupportAlgo: function() {
var t = TRAIT("CTRefactorContinueOutSameRemoveTrait");
return (null == t ? void 0 : t.active) ? ASContext(t.isSupportAlgorithm(null == r ? void 0 : r.algorithmId), "当前算法在连续出块剔除白名单内") : ASContext(!1, "主特性未激活");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "hostActive",
operator: "=",
value: !0
}, {
fact: "isSupportAlgo",
operator: "=",
value: !0
} ]
},
flow: "injectFilterBlocks",
gameMode: "class"
} ];
};
e.prototype.onSDKArgsActions = function(t) {
return {
injectFilterBlocks: function() {
var e, r = TRAIT("CTRefactorContinueOutSameRemoveTrait");
if (!(null == r ? void 0 : r.active)) return {};
var o = r.removeId();
return {
filterBlocks: a(null !== (e = null == t ? void 0 : t.filterBlocks) && void 0 !== e ? e : [], o)
};
}
};
};
return i([ classId("CTRefactorContinueOutSameRemoveHandleArgsTrait") ], e);
}(Trait);
r.CTRefactorContinueOutSameRemoveHandleArgsTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueOutSameRemoveHandleArgsTrait" ]);
//# sourceMappingURL=index.js.map
