window.__require = function t(r, e, i) {
function o(a, l) {
if (!e[a]) {
if (!r[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!r[s]) {
var f = "function" == typeof __require && __require;
if (!l && f) return f(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var p = e[a] = {
exports: {}
};
r[a][0].call(p.exports, function(t) {
return o(r[a][1][t] || t);
}, p, p.exports, t, r, e, i);
}
return e[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < i.length; a++) o(i[a]);
return o;
}({
CTRefactorCtrlAlgoLimitTimeTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "0dfbbwrqyZJZoIU9Zo2uqf0", "CTRefactorCtrlAlgoLimitTimeTrait");
var i, o = this && this.__extends || (i = function(t, r) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
i(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), n = this && this.__decorate || function(t, r, e, i) {
var o, n = arguments.length, a = n < 3 ? r : null === i ? i = Object.getOwnPropertyDescriptor(r, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, i); else for (var l = t.length - 1; l >= 0; l--) (o = t[l]) && (a = (n < 3 ? o(a) : n > 3 ? o(r, e, a) : o(r, e)) || a);
return n > 3 && a && Object.defineProperty(r, e, a), a;
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var i, o, n = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(i = n.next()).done; ) a.push(i.value);
} catch (t) {
o = {
error: t
};
} finally {
try {
i && !i.done && (e = n.return) && e.call(n);
} finally {
if (o) throw o.error;
}
}
return a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorCtrlAlgoLimitTimeTrait = void 0;
var l = function(t) {
o(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.algoTypeObj = null;
r.algoLimitIdObj = null;
return r;
}
r.prototype.data = function() {
return {
overTime: 0
};
};
r.prototype.onAlgorithmStrategySessionInit = function() {
this.buildMaps();
};
r.prototype.buildMaps = function() {
var t = {}, r = this.algoIDArr;
if (r && r.length > 0 && this.timeLimitArr && this.timeLimitArr.length > 0) {
for (var e = 0, i = r.length; e < i; e++) {
var o = r[e], n = this.timeLimitArr[e];
isNaN(o) || isNaN(n) || (t[o] = n);
}
this.algoLimitIdObj = t;
} else {
var l = this.props.para;
if (l && l.length > 0) {
for (e = 0, i = (c = l.split("|")).length; e < i; e++) {
var s = a(c[e].split(":"), 2), f = s[0], p = s[1];
o = parseInt(f, 10), n = parseInt(p, 10);
isNaN(o) || isNaN(n) || (t[o] = n);
}
this.algoTypeObj = t;
}
var u = this.props.algoLimitId;
if (u && u.length > 0) {
var c;
for (e = 0, i = (c = u.split("|")).length; e < i; e++) {
var h = a(c[e].split(":"), 2);
f = h[0], p = h[1], o = parseInt(f, 10), n = parseInt(p, 10);
hs.algorithmSDKArgsInfo.getAlgoSdkFeatureOpen("algoSDK_useMicroTime") && (n = parseFloat(p));
isNaN(o) || isNaN(n) || (t[o] = n);
}
this.algoLimitIdObj = t;
}
}
};
Object.defineProperty(r.prototype, "algoIDArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("CtrlAlgoLimitTimeTrait", "algoIDArr", this.props, null);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "timeLimitArr", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("CtrlAlgoLimitTimeTrait", "timeLimitArr", this.props, null);
},
enumerable: !1,
configurable: !0
});
r.prototype.computeOverTime = function(t) {
var r = t.algorithmId;
this.state.overTime = 0;
if (this.algoLimitIdObj) {
var e = this.algoLimitIdObj[r];
this.state.overTime = e || 100;
}
if (this.algoTypeObj) {
var i = hs.algorithmInfo.getOfferTypeCategory(r), o = hs.algorithmMainTypeEnum[i] || 999, n = this.algoTypeObj[o] || this.algoTypeObj[999];
n && (this.state.overTime = n);
}
return this.state.overTime;
};
r.prototype.onSDKArgsConditionContext = function(t, r, e) {
var i = this;
return buildLazyConditionContext({
computedOverTime: function() {
return ASContext(i.computeOverTime(e), "查表得到当前算法的超时时间");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "computedOverTime",
operator: ">",
value: 0
} ]
},
flow: "flow1"
} ];
};
r.prototype.onSDKArgsActions = function() {
var t = this;
return {
flow1: function() {
return {
overTime: t.state.overTime
};
}
};
};
return n([ classId("CTRefactorCtrlAlgoLimitTimeTrait") ], r);
}(Trait);
e.CTRefactorCtrlAlgoLimitTimeTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCtrlAlgoLimitTimeTrait" ]);
//# sourceMappingURL=index.js.map
