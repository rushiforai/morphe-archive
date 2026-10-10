window.__require = function t(o, r, e) {
function n(u, a) {
if (!r[u]) {
if (!o[u]) {
var c = u.split("/");
c = c[c.length - 1];
if (!o[c]) {
var f = "function" == typeof __require && __require;
if (!a && f) return f(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = c;
}
var s = r[u] = {
exports: {}
};
o[u][0].call(s.exports, function(t) {
return n(o[u][1][t] || t);
}, s, s.exports, t, o, r, e);
}
return r[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < e.length; u++) n(e[u]);
return n;
}({
CTRefactorBaseGuideTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "49eeclA1V5E0by2I1w36+ct", "CTRefactorBaseGuideTrait");
var e, n = this && this.__extends || (e = function(t, o) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
e(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), i = this && this.__decorate || function(t, o, r, e) {
var n, i = arguments.length, u = i < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(t, o, r, e); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (u = (i < 3 ? n(u) : i > 3 ? n(o, r, u) : n(o, r)) || u);
return i > 3 && u && Object.defineProperty(o, r, u), u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorBaseGuideTrait = void 0;
var u = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoGuide: [ {
conditions: {
and: [ {
fact: "isNullBoard",
operator: "=",
value: !0
} ]
},
flow: "flow1"
}, {
conditions: {
and: [ {
fact: "isNullBoard",
operator: "=",
value: !1
} ]
},
flow: "flow2"
} ]
}
};
};
o.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoGuide: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_NOBAOARD ]
} ],
flow2: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ hs.OFFER_TYPE_BASE.SUI_JI_GUIDE ]
} ]
}
}
};
};
o.prototype.onSDKArgsConditionContext = function(t, o, r) {
var e = r.algorithmId;
return buildLazyConditionContext({
isNoBoard: function() {
return ASContext(e == hs.OFFER_TYPE_BASE.SUI_JI_NOBAOARD, "是否为填空消除");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isNoBoard",
operator: "=",
value: !0
} ]
},
flow: "flow1"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
flow1: function() {
return {
filterBlocks: [ 1 ]
};
}
};
};
return i([ classId("CTRefactorBaseGuideTrait") ], o);
}(Trait);
r.CTRefactorBaseGuideTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBaseGuideTrait" ]);
//# sourceMappingURL=index.js.map
