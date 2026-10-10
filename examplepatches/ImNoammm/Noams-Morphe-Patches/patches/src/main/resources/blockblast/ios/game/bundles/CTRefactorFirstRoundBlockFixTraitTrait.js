window.__require = function t(e, r, o) {
function i(n, c) {
if (!r[n]) {
if (!e[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!e[u]) {
var f = "function" == typeof __require && __require;
if (!c && f) return f(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var s = r[n] = {
exports: {}
};
e[n][0].call(s.exports, function(t) {
return i(e[n][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorFirstRoundBlockFixTraitTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "11f97I2JUBPVYam1jUKmy9u", "CTRefactorFirstRoundBlockFixTraitTrait");
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
}), a = this && this.__decorate || function(t, e, r, o) {
var i, a = arguments.length, n = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, r, n) : i(e, r)) || n);
return a > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFirstRoundBlockFixTraitTrait = void 0;
var n = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.handleCTRefactorFirstRoundBlockTraitGetChapterOfferType = function(t) {
t.returnValue = hs.algorithmStrategyIOSBlankRefactoredInfo.offerBitTravelTianKongXiaoChu();
t.replace = !0;
};
e.prototype.isCTRefactorFirstRoundBlockTraitGetChapterOfferType = function(t) {
this.handleCTRefactorFirstRoundBlockTraitGetChapterOfferType(t);
};
e.prototype.isFirstRoundBlockAdjustParamsTraitGetChapterOfferType = function(t) {
this.handleCTRefactorFirstRoundBlockTraitGetChapterOfferType(t);
};
e.prototype.isCTRefactorFirstRoundBlockTraitCheckIsNeedChangeResult = function(t) {
var e = TRAIT("CTRefactorFirstRoundBlockTrait");
if (null == e ? void 0 : e.active) {
t.returnValue = e.isFirstRoundMutexConsumed() && 1 === e.getTriggerStep() && hs.gameInfo.gameMode === hs.GameMode.Class;
t.replace = !0;
}
};
e.prototype.isFirstRoundBlockAdjustParamsTraitCheckIsNeedChangeResult = function(t) {
var e = TRAIT("FirstRoundBlockAdjustParamsTrait");
if (null == e ? void 0 : e.active) {
t.returnValue = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2 === e.traitName && 1 === e.getTriggerStep() && hs.gameInfo.gameMode === hs.GameMode.Class;
t.replace = !0;
}
};
e.prototype.handleCTRefactorFirstRoundBlockTraitCheckStep = function(t) {
var e = t.args[0];
t.returnValue = 1 === e || 2 === e;
t.replace = !0;
};
e.prototype.isCTRefactorFirstRoundBlockTraitCheckStep = function(t) {
this.handleCTRefactorFirstRoundBlockTraitCheckStep(t);
};
e.prototype.isFirstRoundBlockAdjustParamsTraitCheckStep = function(t) {
this.handleCTRefactorFirstRoundBlockTraitCheckStep(t);
};
return a([ classId("CTRefactorFirstRoundBlockFixTraitTrait") ], e);
}(Trait);
r.CTRefactorFirstRoundBlockFixTraitTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFirstRoundBlockFixTraitTrait" ]);
//# sourceMappingURL=index.js.map
