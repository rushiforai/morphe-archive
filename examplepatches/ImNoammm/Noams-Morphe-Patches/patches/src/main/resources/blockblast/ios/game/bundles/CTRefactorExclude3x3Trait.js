window.__require = function t(o, e, r) {
function i(c, l) {
if (!e[c]) {
if (!o[c]) {
var u = c.split("/");
u = u[u.length - 1];
if (!o[u]) {
var a = "function" == typeof __require && __require;
if (!l && a) return a(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = u;
}
var s = e[c] = {
exports: {}
};
o[c][0].call(s.exports, function(t) {
return i(o[c][1][t] || t);
}, s, s.exports, t, o, e, r);
}
return e[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < r.length; c++) i(r[c]);
return i;
}({
CTRefactorExclude3x3Trait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "a4051qNniZGsbwqVcZb3KZD", "CTRefactorExclude3x3Trait");
var r, i = this && this.__extends || (r = function(t, o) {
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
}), n = this && this.__decorate || function(t, o, e, r) {
var i, n = arguments.length, c = n < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, o, e, r); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (c = (n < 3 ? i(c) : n > 3 ? i(o, e, c) : i(o, e)) || c);
return n > 3 && c && Object.defineProperty(o, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorExclude3x3Trait = void 0;
var c = function(t) {
i(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onSDKArgsConditionContext = function() {
return buildLazyConditionContext({
isLowScore: function() {
return ASContext(hs.scoreInfo.highRecordScore <= 2160 && hs.scoreInfo.score <= 1e3, "历史最高<=2160且当前分<=1000");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isLowScore",
operator: "=",
value: !0
} ]
},
gameMode: "class",
platform: "ios",
flow: "iosDisableCopyBlock"
} ];
};
o.prototype.onSDKArgsActions = function(t) {
return {
iosDisableCopyBlock: function() {
var o, e, r, i, n, c;
return {
limitSmallRandomWeight: {
isLimitBlockIdArr: null !== (e = null === (o = t.limitSmallRandomWeight) || void 0 === o ? void 0 : o.isLimitBlockIdArr) && void 0 !== e && e,
isLimitCopyBlockIdArr: null !== (i = null === (r = t.limitSmallRandomWeight) || void 0 === r ? void 0 : r.isLimitCopyBlockIdArr) && void 0 !== i && i,
isUseCopyBlock: !1,
copyFilterBlocks: null !== (c = null === (n = t.limitSmallRandomWeight) || void 0 === n ? void 0 : n.copyFilterBlocks) && void 0 !== c ? c : []
}
};
}
};
};
return n([ classId("CTRefactorExclude3x3Trait") ], o);
}(Trait);
e.CTRefactorExclude3x3Trait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorExclude3x3Trait" ]);
//# sourceMappingURL=index.js.map
