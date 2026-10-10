window.__require = function t(e, r, o) {
function a(i, n) {
if (!r[i]) {
if (!e[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!e[c]) {
var _ = "function" == typeof __require && __require;
if (!n && _) return _(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var l = r[i] = {
exports: {}
};
e[i][0].call(l.exports, function(t) {
return a(e[i][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[i].exports;
}
for (var s = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
JAEJ1439_f_ScoreSpeedAlgoTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "65837aX8Q9Eb7bH7QFzn0HA", "JAEJ1439_f_ScoreSpeedAlgoTrait");
var o, a = this && this.__extends || (o = function(t, e) {
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
}), s = this && this.__decorate || function(t, e, r, o) {
var a, s = arguments.length, i = s < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var n = t.length - 1; n >= 0; n--) (a = t[n]) && (i = (s < 3 ? a(i) : s > 3 ? a(e, r, i) : a(e, r)) || i);
return s > 3 && i && Object.defineProperty(e, r, i), i;
}, i = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, a, s = r.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = s.next()).done; ) i.push(o.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
o && !o.done && (r = s.return) && r.call(s);
} finally {
if (a) throw a.error;
}
}
return i;
}, n = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(i(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.JAEJ1439_f_ScoreSpeedAlgoTrait = void 0;
var c = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
var t = storage.getItem("JAEJ1439_f_ScoreSpeedAlgoTraitData", {
score1: 0,
score2: 0,
score3: 0
});
return {
score1: t.score1,
score2: t.score2,
score3: t.score3
};
};
e.prototype.onActive = function(t) {
if (hs.tp.isClassAlgorithmLifeCycle_GameStart_ProxyNewGameInit(t)) {
this.state.score1 = 0;
this.state.score2 = 0;
this.state.score3 = 0;
storage.setItem("JAEJ1439_f_ScoreSpeedAlgoTraitData", this.state);
}
if (hs.tp.isClassAlgorithmStrategy_Run_ProxyOnTriggerStrategyRun(t)) {
var e = t.args[0];
e && e.option && (e.option.strategyState, hs.ALGO_STRATEGY_TYPE.REVIVE);
this.state.score3 = this.state.score2;
this.state.score2 = this.state.score1;
this.state.score1 = hs.scoreInfo.score;
storage.setItem("JAEJ1439_f_ScoreSpeedAlgoTraitData", this.state);
}
if (hs.tp.isAlgorithmStrategyIOSBlankInfoReplaceClass(t)) {
if (!this.canTrigger()) return;
var r = t.args[0];
if ((a = this.startOutStrategy(0)).length > 0 && a && r && r.length > 0) {
var o = hs.algorithmStrategyLogic.insertArrayAlgorithms(r, [ hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU_NO_BIT ], a);
t.args[0] = o;
}
}
if (hs.tp.isExceedScoreTraitUpdateAlgorithmList(t) || hs.tp.isExceedScoreAdjustParamsTraitUpdateAlgorithmList(t)) {
if (!this.canTrigger()) return;
var a;
r = t.args[0];
if ((a = this.startOutStrategy(1)).length > 0 && a && r && r.length > 0) {
var s = n(a, r);
t.args[0] = s;
}
}
};
e.prototype.startOutStrategy = function(t) {
var e = hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks), r = [];
if (0 === t) {
if (e < 350) {
r = [ hs.OFFER_TYPE.ORDER_FILL_ELIM ];
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.ORDER_FILL_ELIM, "JAEJ1439_f_ScoreSpeedAlgoTrait", null, null, hs.OFFER_TYPE.ORDER_FILL_ELIM);
}
} else {
var o = Math.random();
if (e < 350) {
r = [ hs.OFFER_TYPE.ORDER_FILL_ELIM ];
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.ORDER_FILL_ELIM, "JAEJ1439_f_ScoreSpeedAlgoTrait", null, null, hs.OFFER_TYPE.ORDER_FILL_ELIM);
} else if (e >= 350 && e < 400) if (o < .5) {
r = [ hs.OFFER_TYPE.ORDER_FILL_ELIM ];
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.ORDER_FILL_ELIM, "JAEJ1439_f_ScoreSpeedAlgoTrait", null, null, hs.OFFER_TYPE.ORDER_FILL_ELIM);
} else r = hs.algorithmStrategyIOSBlankInfo.offer(); else if (o < .2) {
r = [ hs.OFFER_TYPE.ORDER_FILL_ELIM ];
hs.algorithmStrategyIOSNameInfo.addAlgorithmNameMapping(hs.OFFER_TYPE.ORDER_FILL_ELIM, "JAEJ1439_f_ScoreSpeedAlgoTrait", null, null, hs.OFFER_TYPE.ORDER_FILL_ELIM);
} else r = hs.algorithmStrategyIOSBlankInfo.offer();
}
return r;
};
e.prototype.canTrigger = function() {
var t = storage.getItem("classRoundNum", 0);
return !(t < 5) && (!(t > 50) && (this.state.score2 > 0 ? (this.state.score1 - this.state.score2) / this.state.score2 : 0) < 3.1476 * Math.pow(t - 1, -1.292));
};
return s([ classId("JAEJ1439_f_ScoreSpeedAlgoTrait"), classMethodWatch() ], e);
}(Trait);
r.JAEJ1439_f_ScoreSpeedAlgoTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "JAEJ1439_f_ScoreSpeedAlgoTrait" ]);
//# sourceMappingURL=index.js.map
