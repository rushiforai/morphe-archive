window.__require = function t(r, e, o) {
function n(i, c) {
if (!e[i]) {
if (!r[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!r[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (a) return a(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var u = e[i] = {
exports: {}
};
r[i][0].call(u.exports, function(t) {
return n(r[i][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorRandBlockDownward_classTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "3e3b1Sk20VKi5Qjz0tLHbMz", "CTRefactorRandBlockDownward_classTrait");
var o, n = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), a = this && this.__decorate || function(t, r, e, o) {
var n, a = arguments.length, i = a < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (i = (a < 3 ? n(i) : a > 3 ? n(r, e, i) : n(r, e)) || i);
return a > 3 && i && Object.defineProperty(r, e, i), i;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRandBlockDownward_classTrait = void 0;
var i = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isClassLayer = function() {
return hs.layerFeatureInfo.isEnterLayer(hs.LayerFeatureExtends.Class);
};
r.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isClassLayer: function() {
return ASContext(t.isClassLayer(), "是否进入无尽模式");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isClassLayer",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "class",
flow: "disableRemoveAll23LimitRandomSmall"
} ];
};
r.prototype.onSDKArgsActions = function() {
return {
disableRemoveAll23LimitRandomSmall: function() {
return {
disableTraits: [ "CTRefactorRemoveAll23LimitRandomSmallTrait" ]
};
}
};
};
return a([ classId("CTRefactorRandBlockDownward_classTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorRandBlockDownward_classTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownward_classTrait" ]);
//# sourceMappingURL=index.js.map
