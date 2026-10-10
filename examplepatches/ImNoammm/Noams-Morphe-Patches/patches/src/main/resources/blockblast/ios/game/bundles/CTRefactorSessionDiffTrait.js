window.__require = function t(r, e, i) {
function o(n, f) {
if (!e[n]) {
if (!r[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!r[l]) {
var c = "function" == typeof __require && __require;
if (!f && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var s = e[n] = {
exports: {}
};
r[n][0].call(s.exports, function(t) {
return o(r[n][1][t] || t);
}, s, s.exports, t, r, e, i);
}
return e[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < i.length; n++) o(i[n]);
return o;
}({
CTRefactorSessionDiffTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "ec738wQDMJC9K9yq8dC9zSU", "CTRefactorSessionDiffTrait");
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
}), a = this && this.__assign || function() {
return (a = Object.assign || function(t) {
for (var r, e = 1, i = arguments.length; e < i; e++) {
r = arguments[e];
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
}
return t;
}).apply(this, arguments);
}, n = this && this.__decorate || function(t, r, e, i) {
var o, a = arguments.length, n = a < 3 ? r : null === i ? i = Object.getOwnPropertyDescriptor(r, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, r, e, i); else for (var f = t.length - 1; f >= 0; f--) (o = t[f]) && (n = (a < 3 ? o(n) : a > 3 ? o(r, e, n) : o(r, e)) || n);
return a > 3 && n && Object.defineProperty(r, e, n), n;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorSessionDiffTrait = void 0;
var f = function(t) {
o(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace = function(t) {
this.isCanRunDiff || this.hasPuzzleDiffAlgorithm(t) && this.replaceAllPuzzleDiffAlgorithms(t);
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace(t);
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceNoBitKunNanNanti = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace(t);
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoLaneReplaceBitKunNanNanti = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace(t);
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoReplaceNoBitKunNanNanTiChapter = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace(t);
};
r.prototype.isAlgorithmStrategyIOSDifficultRefactoredInfoReplaceNoBitKunNanNanTiClass = function(t) {
this.handleAlgorithmStrategyIOSDifficultRefactoredInfoDiffReplace(t);
};
Object.defineProperty(r.prototype, "isCanRunDiff", {
get: function() {
var t, r = null !== (t = this.props.time) && void 0 !== t ? t : 60, e = 6e4;
"number" == typeof r && (e = 1e3 * r);
return !(Date.now() - hs.gameInfo.entryTime < e);
},
enumerable: !1,
configurable: !0
});
r.prototype.isPuzzleDiffStrategy = function(t) {
return hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY);
};
r.prototype.hasPuzzleDiffAlgorithm = function(t) {
var r, e, i = this, o = function(t) {
return !!Array.isArray(t) && t.some(function(t) {
return i.isPuzzleDiffStrategy(t);
});
}, a = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList.map(function(t) {
return t.algorithmId;
}), n = as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList.map(function(t) {
return t.algorithmId;
}), f = null === (r = t.args) || void 0 === r ? void 0 : r[0];
"number" == typeof f || Array.isArray(f);
return o(a) || o(n) || o(null === (e = t.args) || void 0 === e ? void 0 : e[0]);
};
r.prototype.replaceAllPuzzleDiffAlgorithms = function(t) {
var r, e = this, i = function(t) {
if (e.isPuzzleDiffStrategy(t)) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, e);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, e);
return hs.OFFER_TYPE.SUI_JI_WU_SI;
}
return t;
}, o = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList, n = o.map(function(t) {
return a(a({}, t), {
algorithmId: i(t.algorithmId)
});
}), f = n.some(function(t, r) {
return t.algorithmId !== o[r].algorithmId;
});
n.length > 0 && f && as.AlgorithmStrategyAlgorithmListPatch.patch(n, this);
var l = as.AlgorithmStrategyAlgorithmFallbackListPatch.algorithmFallbackList, c = l.map(function(t) {
return a(a({}, t), {
algorithmId: i(t.algorithmId)
});
}), s = c.some(function(t, r) {
return t.algorithmId !== l[r].algorithmId;
});
c.length > 0 && s && as.AlgorithmStrategyAlgorithmFallbackListPatch.patch(c, this);
if (null === (r = t.args) || void 0 === r ? void 0 : r.length) {
var h = t.args[0];
"number" == typeof h ? t.args[0] = i(h) : Array.isArray(h) && (t.args[0] = h.map(function(t) {
return "number" == typeof t ? i(t) : t;
}));
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.SUI_JI_WU_SI, this);
}
};
return n([ classId("CTRefactorSessionDiffTrait"), classMethodWatch() ], r);
}(Trait);
e.CTRefactorSessionDiffTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorSessionDiffTrait" ]);
//# sourceMappingURL=index.js.map
