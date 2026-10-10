window.__require = function t(e, r, o) {
function a(n, c) {
if (!r[n]) {
if (!e[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!e[s]) {
var p = "function" == typeof __require && __require;
if (!c && p) return p(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var f = r[n] = {
exports: {}
};
e[n][0].call(f.exports, function(t) {
return a(e[n][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorReplaceBoardIOSTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "e2b3cTV5veoucDR4vOktcbX", "CTRefactorReplaceBoardIOSTrait");
var o, a = this && this.__extends || (o = function(t, e) {
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
var a, i = arguments.length, n = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (a = t[c]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, r, n) : a(e, r)) || n);
return i > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorReplaceBoardIOSTrait = void 0;
var n = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.hasGameInitOnce = !1;
return e;
}
e.prototype.data = function() {
return {
isTrigger: !1
};
};
e.prototype.onAlgorithmStrategyGameInit = function() {
if (!this.hasGameInitOnce) {
this.hasGameInitOnce = !0;
if (hs.traitServerInfo.experimentConfig) {
var t = hs.scoreInfo.highScore, e = !1;
t >= 1218 && t < 2459 && (e = !0);
if (e) {
this.state.isTrigger = !0;
var r = hs.traitConfigInfo.traitsByIdMap[105005], o = hs.traitConfigInfo.traitsByIdMap[104005], a = r.param.sections, i = o.param.sections, n = TRAIT("CTRefactorLaneSchemeTrait");
(null == n ? void 0 : n.active) && n.setState({
weightRatioArr: a,
getWayInfo: i
});
} else this.state.isTrigger = !1;
} else this.state.isTrigger = !1;
}
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
replaceBoardIOSShouldSkipBaseplateTraits: function() {
return ASContext(!0 === t.state.isTrigger, "如果 isTrigger 为 true, 则本局已按 ReplaceBoardIOS 写入泳道分数段/权重段；互斥预处理禁用 CTRefactorBaseplateLaneTrait / CTRefactorBaseplateTrait，避免覆盖");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
LaneScheme: [ {
conditions: {
and: [ {
fact: "replaceBoardIOSShouldSkipBaseplateTraits",
operator: "=",
value: !0
} ]
},
flow: "skipBaseplateTraits"
} ]
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
LaneScheme: {
skipBaseplateTraits: [ {
operator: "AlgorithmStrategyDisableOperator",
type: "disable",
args: [ [ "CTRefactorBaseplateLaneTrait", "CTRefactorBaseplateTrait" ] ]
} ]
}
}
};
};
return i([ classId("CTRefactorReplaceBoardIOSTrait") ], e);
}(Trait);
r.CTRefactorReplaceBoardIOSTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorReplaceBoardIOSTrait" ]);
//# sourceMappingURL=index.js.map
