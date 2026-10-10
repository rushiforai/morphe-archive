window.__require = function t(r, e, o) {
function i(c, a) {
if (!e[c]) {
if (!r[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!r[l]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var f = e[c] = {
exports: {}
};
r[c][0].call(f.exports, function(t) {
return i(r[c][1][t] || t);
}, f, f.exports, t, r, e, o);
}
return e[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < o.length; c++) i(o[c]);
return i;
}({
CTRefactorAlgoPriorityTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "27e1eDSdu5HpaEeNGMKGJdE", "CTRefactorAlgoPriorityTrait");
var o, i = this && this.__extends || (o = function(t, r) {
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
}), n = this && this.__decorate || function(t, r, e, o) {
var i, n = arguments.length, c = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, r, e, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (c = (n < 3 ? i(c) : n > 3 ? i(r, e, c) : i(r, e)) || c);
return n > 3 && c && Object.defineProperty(r, e, c), c;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorAlgoPriorityTrait = void 0;
var c = function(t) {
i(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onAlgorithmStrategySDKBetween = function(t) {
var r, e, o, i = (null === (r = t.sdk) || void 0 === r ? void 0 : r.SDK_SUCCESS) || !1, n = "priority" === (null === (e = t.sdk) || void 0 === e ? void 0 : e.algorithmListSource), c = null === (o = t.sdk) || void 0 === o ? void 0 : o.actualAlgorithmId;
if (i && n && c !== hs.OFFER_TYPE_BASE.NONE) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(c, this);
var a = hs.gameInfo.gameMode === hs.GameMode.Chapter ? hs.ChapterAlgorithmSourceType.Priority : hs.ClassAlgorithmSourceType.Priority;
as.AlgorithmStrategyPreprocessShareSequenceSourcePatch.patch(a, this);
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(a);
}
};
return n([ classId("CTRefactorAlgoPriorityTrait") ], r);
}(Trait);
e.CTRefactorAlgoPriorityTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgoPriorityTrait" ]);
//# sourceMappingURL=index.js.map
