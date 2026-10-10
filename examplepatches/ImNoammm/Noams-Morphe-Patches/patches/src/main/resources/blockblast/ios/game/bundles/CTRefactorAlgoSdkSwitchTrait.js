window.__require = function t(e, r, o) {
function n(i, s) {
if (!r[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var p = r[i] = {
exports: {}
};
e[i][0].call(p.exports, function(t) {
return n(e[i][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactorAlgoSdkSwitchTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "6693ac7MJlFva2YADUpl0XX", "CTRefactorAlgoSdkSwitchTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var n, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, r, i) : n(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAlgoSdkSwitchTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.handleClassAlgorithmStrategy_Run_ProxyAlgoStrategyIsOpen = function(t) {
this.stopOldAlgoStrategyReceivedEvents(t);
};
e.prototype.isClassAlgorithmStrategy_Run_ProxyAlgoStrategyIsOpen = function(t) {
this.handleClassAlgorithmStrategy_Run_ProxyAlgoStrategyIsOpen(t);
};
e.prototype.isChapterAlgorithmStrategy_Run_ProxyAlgoStrategyIsOpen = function(t) {
this.handleClassAlgorithmStrategy_Run_ProxyAlgoStrategyIsOpen(t);
};
e.prototype.handleClassAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen = function(t) {
this.startNewAlgoStrategyReceivedEvents(t);
};
e.prototype.isClassAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen = function(t) {
this.handleClassAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen(t);
};
e.prototype.isChapterAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen = function(t) {
this.handleClassAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen(t);
};
e.prototype.isAlgorithmStrategyRefactored_ProxyAlgoStrategyRefactoredIsOpen = function(t) {
this.handleClassAlgorithmStrategyRefactored_Pipeline_ProxyAlgoStrategyRefactoredIsOpen(t);
};
e.prototype.isAlgorithmStrategySourceInfoGetAllTraitNamesArray = function(t) {
t.replace = !0;
t.returnState = !0;
t.returnValue = {
preprocess_priority: as.dot.preprocessPriorityList,
preprocess_normal: as.dot.preprocessNormalList,
preprocess_fail: as.dot.preprocessFallbackList,
postprocess_success_normal: as.dot.postprocessSuccessNormalList
};
};
e.prototype.stopOldAlgoStrategyReceivedEvents = function(t) {
t.returnValue = !1;
t.returnState = !0;
t.replace = !0;
};
e.prototype.startNewAlgoStrategyReceivedEvents = function(t) {
t.returnValue = !0;
t.returnState = !0;
t.replace = !0;
};
return a([ classId("CTRefactorAlgoSdkSwitchTrait") ], e);
}(Trait);
r.CTRefactorAlgoSdkSwitchTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgoSdkSwitchTrait" ]);
//# sourceMappingURL=index.js.map
