window.__require = function t(r, e, o) {
function n(c, u) {
if (!e[c]) {
if (!r[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!r[a]) {
var _ = "function" == typeof __require && __require;
if (!u && _) return _(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var f = e[c] = {
exports: {}
};
r[c][0].call(f.exports, function(t) {
return n(r[c][1][t] || t);
}, f, f.exports, t, r, e, o);
}
return e[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorClearContBorderTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "7a284czWVJC356pruq28k/n", "CTRefactorClearContBorderTrait");
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
var n, i = arguments.length, c = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (c = (i < 3 ? n(c) : i > 3 ? n(r, e, c) : n(r, e)) || c);
return i > 3 && c && Object.defineProperty(r, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorClearContBorderTrait = void 0;
var c = function(t) {
n(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.supportAlgos = [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU, hs.OFFER_TYPE.IOS_FILL_BLANK_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_NOT_BIT, hs.OFFER_TYPE.IOS_FILL_BLANK_NOT_BIT_REVERSE, hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING ];
return r;
}
r.prototype.onSDKArgsConditionContext = function(t, r, e) {
var o = this, n = null == e ? void 0 : e.algorithmId;
return buildLazyConditionContext({
isSupportAlgo: function() {
return ASContext(o.supportAlgos.includes(n), "当前 SDK 请求算法在连续边支持列表中");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isSupportAlgo",
operator: "=",
value: !0
},
gameMode: "class",
flow: "enableEdge"
} ];
};
r.prototype.onSDKArgsActions = function() {
return {
enableEdge: function() {
return {
extra: {
traits: {
edge: 1
}
}
};
}
};
};
return i([ classId("CTRefactorClearContBorderTrait") ], r);
}(Trait);
e.CTRefactorClearContBorderTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorClearContBorderTrait" ]);
//# sourceMappingURL=index.js.map
