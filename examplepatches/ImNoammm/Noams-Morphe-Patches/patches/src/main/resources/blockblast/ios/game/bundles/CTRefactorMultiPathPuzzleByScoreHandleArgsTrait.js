window.__require = function t(e, r, o) {
function n(a, u) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!u && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = r[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return n(e[a][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorMultiPathPuzzleByScoreHandleArgsTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "86132LUQlVCX7c/2Cx3qf+D", "CTRefactorMultiPathPuzzleByScoreHandleArgsTrait");
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
var n, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, r, a) : n(e, r)) || a);
return i > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorMultiPathPuzzleByScoreHandleArgsTrait = void 0;
var a = hs.OFFER_TYPE.MORE_LIVE_WAY_HARD_TUNE, u = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onSDKArgsConditionContext = function(t, e, r) {
return buildLazyConditionContext({
hostIsActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorMultiPathPuzzleByScoreTrait")) || void 0 === t ? void 0 : t.active, "主特性生效");
},
isMultiPathByScoreAlgo: function() {
return ASContext((null == r ? void 0 : r.algorithmId) === a, "当前算法为多活路难题调参");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "hostIsActive",
operator: "=",
value: !0
}, {
fact: "isMultiPathByScoreAlgo",
operator: "=",
value: !0
} ]
},
flow: "injectMultiPathByScoreHandleArgs",
platform: "ios",
gameMode: "class"
} ];
};
e.prototype.onSDKArgsActions = function() {
return {
injectMultiPathByScoreHandleArgs: function() {
var t = TRAIT("CTRefactorMultiPathPuzzleByScoreTrait");
if (!(null == t ? void 0 : t.active)) return {};
var e = t.buildSdkExtraSnapshot();
return e ? {
filterBlocks: [],
extra: {
traits: {
minAlivePathCount: e.minAlivePathCount,
alivePathWeight: e.alivePathWeight,
areaSumWeight: e.areaSumWeight,
qualifiedPoolTopK: e.qualifiedPoolTopK
}
}
} : {};
}
};
};
return i([ classId("CTRefactorMultiPathPuzzleByScoreHandleArgsTrait") ], e);
}(Trait);
r.CTRefactorMultiPathPuzzleByScoreHandleArgsTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorMultiPathPuzzleByScoreHandleArgsTrait" ]);
//# sourceMappingURL=index.js.map
