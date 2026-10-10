window.__require = function t(e, r, i) {
function a(s, n) {
if (!r[s]) {
if (!e[s]) {
var p = s.split("/");
p = p[p.length - 1];
if (!e[p]) {
var c = "function" == typeof __require && __require;
if (!n && c) return c(p, !0);
if (o) return o(p, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = p;
}
var u = r[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return a(e[s][1][t] || t);
}, u, u.exports, t, e, r, i);
}
return r[s].exports;
}
for (var o = "function" == typeof __require && __require, s = 0; s < i.length; s++) a(i[s]);
return a;
}({
CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "933c0AXDatJKoE/uqugI6oS", "CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait");
var i, a = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
i(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, i) {
var a, o = arguments.length, s = o < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, i); else for (var n = t.length - 1; n >= 0; n--) (a = t[n]) && (s = (o < 3 ? a(s) : o > 3 ? a(e, r, s) : a(e, r)) || s);
return o > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait = void 0;
var s = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return storage.getItem("firstRoundSpiceProbabilityData", {
currentProbability: .8,
lastGameRound: 0,
hasTriggeredThisGame: !1,
skipNextGame: !1,
isEmptyBoardReplay: !0
});
};
e.prototype.isCTRefactorFirstRoundSpiceOfferTraitUpdateProbability = function(t) {
var e = this.getCurrentProbability();
t.args[0] = e;
};
e.prototype.isCTRefactorFirstRoundSpiceOfferTraitOnTriggered = function() {
this.onFirstRoundSpiceTriggered();
};
e.prototype.isClassGameOver_GameEnd_ProxyOnGameEnd = function() {
this.onGameEnd();
};
e.prototype.isClassGame_Replay_ProxyOnGameReplay = function() {
this.onGameReplay();
};
e.prototype.isClassBlocksProducer_ProxyRequestBlocksProducer = function(t) {
t.args[0].strategyState === hs.ALGO_STRATEGY_TYPE.DEFAULT && this.onBlockPlaced();
};
e.prototype.reportData = function() {
DS("game_classic_interest_success", {
interest: this.state.hasTriggeredThisGame ? 1 : 0
});
};
e.prototype.setEmptyBoardReplay = function(t) {
if (!1 !== this.state.isEmptyBoardReplay) {
this.state.isEmptyBoardReplay = t;
this.saveProbabilityData();
}
};
e.prototype.getCurrentProbability = function() {
if (this.state.skipNextGame) {
this.state.skipNextGame = !1;
this.saveProbabilityData();
return 0;
}
return this.state.currentProbability;
};
e.prototype.onFirstRoundSpiceTriggered = function() {
this.state.hasTriggeredThisGame = !0;
this.state.lastGameRound = 0;
this.saveProbabilityData();
};
e.prototype.onGameReplay = function() {
if (this.state.hasTriggeredThisGame && this.state.isEmptyBoardReplay) {
this.state.skipNextGame = !0;
this.decreaseProbability();
}
this.reportData();
this.resetCurrentGameState();
this.saveProbabilityData();
};
e.prototype.onBlockPlaced = function() {
if (this.state.hasTriggeredThisGame) {
this.setEmptyBoardReplay(!1);
this.state.lastGameRound++;
this.saveProbabilityData();
}
};
e.prototype.onGameEnd = function() {
if (this.state.hasTriggeredThisGame) {
var t = this.state.lastGameRound;
(Math.round(hs.classTimerInfo.spendTime / 1e3) >= 120 || t >= 10) && this.increaseProbability();
}
this.reportData();
this.resetCurrentGameState();
this.saveProbabilityData();
};
e.prototype.decreaseProbability = function() {
var t = Math.round(100 * this.state.currentProbability), e = Math.round(5), r = Math.round(10), i = Math.max(r, t - e);
this.state.currentProbability = i / 100;
};
e.prototype.increaseProbability = function() {
var t = Math.round(100 * this.state.currentProbability), e = Math.round(2), r = Math.round(90), i = Math.min(r, t + e);
this.state.currentProbability = i / 100;
};
e.prototype.resetCurrentGameState = function() {
this.state.hasTriggeredThisGame = !1;
this.state.lastGameRound = 0;
this.state.isEmptyBoardReplay = !0;
};
e.prototype.saveProbabilityData = function() {
storage.setItem("firstRoundSpiceProbabilityData", this.state);
};
e.prototype.createDefaultData = function() {
return {
currentProbability: .8,
lastGameRound: 0,
hasTriggeredThisGame: !1,
skipNextGame: !1,
isEmptyBoardReplay: !0
};
};
return o([ classId("CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait") ], e);
}(Trait);
r.CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$27877_f_ChangeFirstRoundSpiceOfferProbabilityTrait" ]);
//# sourceMappingURL=index.js.map
