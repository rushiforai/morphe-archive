window.__require = function t(r, e, o) {
function n(c, a) {
if (!e[c]) {
if (!r[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!r[l]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
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
CTRefactorExclude3x3HandleArgsTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "ced3ePot8xKHZI8i70ha647", "CTRefactorExclude3x3HandleArgsTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(r, e, c) : n(r, e)) || c);
return i > 3 && c && Object.defineProperty(r, e, c), c;
}, c = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), c = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) c.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return c;
}, a = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(c(arguments[r]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorExclude3x3HandleArgsTrait = void 0;
var l = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
e = r;
r.prototype.onSDKArgsConditionContext = function(t, r, e) {
return buildLazyConditionContext({
hostActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorExclude3x3Trait")) || void 0 === t ? void 0 : t.active, "主特性 Exclude3x3 已激活");
},
isLowScore: function() {
return ASContext(hs.scoreInfo.highRecordScore <= 2160 && hs.scoreInfo.score <= 1e3, "历史最高<=2160且当前分<=1000");
},
isEasyChooseEntropy: function() {
return ASContext((null == e ? void 0 : e.algorithmId) === hs.OFFER_TYPE.EASY_CHOOSE_ENTROPY, "算法是 EASY_CHOOSE_ENTROPY");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "hostActive",
operator: "=",
value: !0
}, {
fact: "isLowScore",
operator: "=",
value: !0
}, {
fact: "isEasyChooseEntropy",
operator: "=",
value: !0
} ]
},
gameMode: "class",
platform: "all",
flow: "filterWithEntropy"
}, {
conditions: {
and: [ {
fact: "hostActive",
operator: "=",
value: !0
}, {
fact: "isLowScore",
operator: "=",
value: !0
} ]
},
gameMode: "class",
platform: "all",
flow: "filterWeightOnly"
} ];
};
r.prototype.onSDKArgsActions = function(t) {
var r = e.BLOCK_3X3_ID, o = [ r ];
return {
filterWithEntropy: function() {
var e;
return {
filterBlocks: a(null !== (e = null == t ? void 0 : t.filterBlocks) && void 0 !== e ? e : [], [ r ]),
filterWeightBlocks: o
};
},
filterWeightOnly: function() {
return {
filterWeightBlocks: o
};
}
};
};
var e;
r.BLOCK_3X3_ID = 13;
return e = i([ classId("CTRefactorExclude3x3HandleArgsTrait") ], r);
}(Trait);
e.CTRefactorExclude3x3HandleArgsTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorExclude3x3HandleArgsTrait" ]);
//# sourceMappingURL=index.js.map
