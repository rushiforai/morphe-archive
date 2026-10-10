window.__require = function t(o, e, r) {
function n(c, i) {
if (!e[c]) {
if (!o[c]) {
var u = c.split("/");
u = u[u.length - 1];
if (!o[u]) {
var p = "function" == typeof __require && __require;
if (!i && p) return p(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = u;
}
var f = e[c] = {
exports: {}
};
o[c][0].call(f.exports, function(t) {
return n(o[c][1][t] || t);
}, f, f.exports, t, o, e, r);
}
return e[c].exports;
}
for (var a = "function" == typeof __require && __require, c = 0; c < r.length; c++) n(r[c]);
return n;
}({
CTRefactorAdvantureScoreBottomTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "ad43800JxhDeJyqUf7/ztYR", "CTRefactorAdvantureScoreBottomTrait");
var r, n = this && this.__extends || (r = function(t, o) {
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
}), a = this && this.__decorate || function(t, o, e, r) {
var n, a = arguments.length, c = a < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, o, e, r); else for (var i = t.length - 1; i >= 0; i--) (n = t[i]) && (c = (a < 3 ? n(c) : a > 3 ? n(o, e, c) : n(o, e)) || c);
return a > 3 && c && Object.defineProperty(o, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorAdvantureScoreBottomTrait = void 0;
var c = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onAlgorithmStrategySDKComplete = function(t, o) {
var e;
t && o.traitSource === this.traitName && (null === (e = TRAIT("CTRefactorAdvantureScoreTrait")) || void 0 === e || e.applyReplaceObjSdkComplete(o));
};
o.prototype.onPostprocessConditionContext = function(t) {
return buildLazyConditionContext({
currentFlow: function() {
return ASContext(t, "当前流程");
},
isBottomTag: function() {
return ASContext("updateBottomOfferList" === (null == t ? void 0 : t.currentPostTag), "是否是 Bottom 锚点");
}
});
};
o.prototype.onPostprocessConditionOperators = function() {
return {
advantureScoreBottomReplace: function(t) {
if ("updateBottomOfferList" !== (null == t ? void 0 : t.currentPostTag)) return !1;
var o = TRAIT("CTRefactorAdvantureScoreTrait"), e = null == o ? void 0 : o.tryReplaceForBottomHook();
return !(!e || 0 === e.length) && {
status: !0,
data: {
algoList: e
}
};
}
};
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBottomTag",
operator: "=",
value: !0
}, {
fact: "currentFlow",
operator: "advantureScoreBottomReplace",
value: !0
} ]
},
flow: "bottomReplace",
platform: "ios",
gameMode: "class"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
bottomReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.advantureScoreBottomReplace.data.algoList"
} ]
} ]
};
};
return a([ classId("CTRefactorAdvantureScoreBottomTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorAdvantureScoreBottomTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAdvantureScoreBottomTrait" ]);
//# sourceMappingURL=index.js.map
