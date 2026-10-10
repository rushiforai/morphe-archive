window.__require = function t(e, r, o) {
function i(a, c) {
if (!r[a]) {
if (!e[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!e[l]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var u = r[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return i(e[a][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
CTRefactorAgloReviveTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "c3d2cihk7dJS4imFmOkUTQ0", "CTRefactorAgloReviveTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, i, n = r.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = n.next()).done; ) a.push(o.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (i) throw i.error;
}
}
return a;
}, c = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(a(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAgloReviveTrait = void 0;
var l = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
algoName: []
};
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.state.algoName = c(hs.algorithmName.algoActualName);
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
var t = hs.algorithmName.algoActualName, e = t.includes("复活算法"), r = t.includes("复活");
if (e || r) {
1 == hs.algorithmIOSReviveInfo.algorithmReviveTriat ? as.AlgorithmStrategyAlgoActualNamePatch.patch(c(this.state.algoName), this) : as.AlgorithmStrategyAlgoActualNamePatch.patch([ "复活", "复活", "复活" ], this);
hs.algorithmIOSReviveInfo.setAlgorithmReviveTriat(!1);
}
};
return n([ classId("CTRefactorAgloReviveTrait") ], e);
}(Trait);
r.CTRefactorAgloReviveTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAgloReviveTrait" ]);
//# sourceMappingURL=index.js.map
