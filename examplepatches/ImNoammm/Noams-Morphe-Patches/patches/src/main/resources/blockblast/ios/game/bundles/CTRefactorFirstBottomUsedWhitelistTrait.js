window.__require = function t(o, r, e) {
function n(s, u) {
if (!r[s]) {
if (!o[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!o[c]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var f = r[s] = {
exports: {}
};
o[s][0].call(f.exports, function(t) {
return n(o[s][1][t] || t);
}, f, f.exports, t, o, r, e);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < e.length; s++) n(e[s]);
return n;
}({
CTRefactorFirstBottomUsedWhitelistTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "f13e0OB+zZFSKuJzqBVEwfc", "CTRefactorFirstBottomUsedWhitelistTrait");
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
var n, i = arguments.length, s = i < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, o, r, e); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (s = (i < 3 ? n(s) : i > 3 ? n(o, r, s) : n(o, r)) || s);
return i > 3 && s && Object.defineProperty(o, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFirstBottomUsedWhitelistTrait = void 0;
var s = function(t) {
n(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onPostprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isNotFirstRoundCannotRunFirstBottom: function() {
return ASContext(t.isNotFirstRound(), "非首轮，updateFirstBottomOfferList 穿参为 false");
}
});
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "isNotFirstRoundCannotRunFirstBottom",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableFirstBottomWhenNotFirstRound"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
disableFirstBottomWhenNotFirstRound: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.DEFAULT ]
} ]
};
};
o.prototype.isNotFirstRound = function() {
return 1 !== hs.storage.getItem("classRoundNum", 0);
};
return i([ classId("CTRefactorFirstBottomUsedWhitelistTrait") ], o);
}(Trait);
r.CTRefactorFirstBottomUsedWhitelistTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstBottomUsedWhitelistTrait" ]);
//# sourceMappingURL=index.js.map
