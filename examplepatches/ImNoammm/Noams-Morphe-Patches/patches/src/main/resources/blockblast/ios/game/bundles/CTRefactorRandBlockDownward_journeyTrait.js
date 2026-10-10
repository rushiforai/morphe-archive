window.__require = function t(r, e, o) {
function n(a, u) {
if (!e[a]) {
if (!r[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!r[c]) {
var f = "function" == typeof __require && __require;
if (!u && f) return f(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var l = e[a] = {
exports: {}
};
r[a][0].call(l.exports, function(t) {
return n(r[a][1][t] || t);
}, l, l.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorRandBlockDownward_journeyTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "011c81JJedHfpjeX20MwbBF", "CTRefactorRandBlockDownward_journeyTrait");
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
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorRandBlockDownward_journeyTrait = void 0;
var a = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isJourneyLayer = function() {
return hs.layerFeatureInfo.isEnterLayer(hs.LayerFeatureExtends.Journey);
};
r.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isJourneyLayer: function() {
return ASContext(t.isJourneyLayer(), "是否进入旅行模式");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isJourneyLayer",
operator: "=",
value: !0
},
platform: "ios",
gameMode: "journey",
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
return i([ classId("CTRefactorRandBlockDownward_journeyTrait") ], r);
}(Trait);
e.CTRefactorRandBlockDownward_journeyTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorRandBlockDownward_journeyTrait" ]);
//# sourceMappingURL=index.js.map
