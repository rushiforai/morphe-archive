window.__require = function t(e, r, o) {
function a(n, s) {
if (!r[n]) {
if (!e[n]) {
var u = n.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = u;
}
var c = r[n] = {
exports: {}
};
e[n][0].call(c.exports, function(t) {
return a(e[n][1][t] || t);
}, c, c.exports, t, e, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorPuzzle100Trait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "de4b6QEgF1LU5UEC5w+IltI", "CTRefactorPuzzle100Trait");
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
}), i = this && this.__decorate || function(t, e, r, o) {
var a, i = arguments.length, n = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (a = t[s]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, r, n) : a(e, r)) || n);
return i > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzle100Trait = void 0;
var n = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
puzzleTime: 0,
initTime: 0,
hard100Status: 0,
isHard: !1
};
};
e.prototype.getIsTimeElapsed = function() {
var t = this.dynamicAdjustDieDefaultTime(this.state.puzzleTime);
this.state.initTime = this.dynamicAdjustInitTime(this.state.initTime);
var e = (new Date().getTime() - this.state.initTime) / 1e3;
(e = this.updateDiffTime(e)) >= t && (this.state.isHard = !0);
return this.state.isHard;
};
e.prototype.dynamicAdjustDieDefaultTime = function(t) {
return t;
};
e.prototype.dynamicAdjustInitTime = function(t) {
return t;
};
e.prototype.isForceOpen100 = function() {
if (this.state.hard100Status == hs.Hard100Status.open) {
this.state.isHard = !0;
return !0;
}
return !1;
};
e.prototype.isForceClose100 = function() {
if (this.state.hard100Status == hs.Hard100Status.close) {
this.state.isHard = !1;
return !0;
}
return !1;
};
e.prototype.onAlgorithmStrategyGameInit = function(t) {
if ("preprocessing_Puzzle100" === t) {
this.state.puzzleTime = this.getPuzzleTime(300, 360);
this.state.initTime = Date.now();
this.state.isHard = !1;
this.state.hard100Status = hs.Hard100Status.default;
this.afterRetPuzzle100();
}
};
e.prototype.afterRetPuzzle100 = function() {};
e.prototype.getPuzzleTime = function(t, e) {
return hs.randomInt(t, e);
};
e.prototype.updateDiffTime = function(t) {
return t;
};
e.prototype.getFormatDate = function() {
var t = new Date();
return t.getHours().toString().padStart(2, "0") + ":" + t.getMinutes().toString().padStart(2, "0") + ":" + t.getSeconds().toString().padStart(2, "0") + ":" + t.getMilliseconds().toString().padStart(3, "0");
};
e.prototype.onPreprocessConditionContext = function() {
var t = this;
return buildLazyConditionContext({
isPuzzleNoneSource: function() {
return ASContext(hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.PuzzleNone, "当前一级出题源是否为默认/底板");
},
isTimeElapsed: function() {
return ASContext(t.getIsTimeElapsed(), "游戏时长已达到困难难题触发阈值");
},
isForceOpen: function() {
return ASContext(t.state.hard100Status === hs.Hard100Status.open, "强制开启困难100%");
},
isForceClose: function() {
return ASContext(t.state.hard100Status === hs.Hard100Status.close, "强制屏蔽困难100%");
},
isHard100Default: function() {
return ASContext(t.state.hard100Status === hs.Hard100Status.default, "困难100%为默认态（非强制开/关）");
},
hard100Status: function() {
return ASContext(t.state.hard100Status, "困难100%状态");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
mutex: {
Puzzle100: [ {
conditions: {
fact: "isForceClose",
operator: "=",
value: !0
},
platform: "ios",
flow: "iosFlowClose"
}, {
conditions: {
and: [ {
fact: "isForceOpen",
operator: "=",
value: !0
}, {
fact: "hard100Status",
operator: "checkPuzzle100Open",
value: !0
} ]
},
event: {
type: "markPuzzle100Source"
},
platform: "ios",
flow: "iosFlowOpen"
}, {
conditions: {
fact: "isPuzzleNoneSource",
operator: "=",
value: !1
},
platform: "ios",
flow: "flowSourceNotNone"
}, {
conditions: {
and: [ {
fact: "isHard100Default",
operator: "=",
value: !0
}, {
fact: "isPuzzleNoneSource",
operator: "=",
value: !0
}, {
fact: "hard100Status",
operator: "checkPuzzle100Open",
value: !0
} ]
},
event: {
type: "markPuzzle100Source"
},
platform: "ios",
flow: "iosFlowOpen"
}, {
conditions: {
fact: "isPuzzleNoneSource",
operator: "=",
value: !1
},
platform: "gp",
flow: "flowSourceNotNone"
}, {
conditions: {
and: [ {
fact: "isPuzzleNoneSource",
operator: "=",
value: !0
}, {
fact: "isForceClose",
operator: "=",
value: !1
}, {
or: [ {
fact: "isForceOpen",
operator: "=",
value: !0
}, {
fact: "isTimeElapsed",
operator: "=",
value: !0
} ]
} ]
},
event: {
type: "markPuzzle100Source"
},
platform: "gp",
flow: "gpFlow"
} ]
}
};
};
e.prototype.markPuzzle100Source = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.Puzzle100);
};
e.prototype.onPreprocessConditionOperators = function() {
var t = this;
return {
checkPuzzle100Open: function() {
return t.state.hard100Status == hs.Hard100Status.open ? {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceDifficultyOptimise(),
algorithmFailId: hs.algorithmStrategyIOSShangRefactoredInfo.get100DifClassToNoBitShangZeng3({
isDown: !0
})
}
} : t.state.hard100Status != hs.Hard100Status.close && !!t.getIsTimeElapsed() && {
status: !0,
data: {
algorithmId: hs.algorithmStrategyIOSDifficultRefactoredInfo.replaceDifficultyOptimise(),
algorithmFailId: hs.algorithmStrategyIOSShangRefactoredInfo.get100DifClassToNoBitShangZeng3({
isDown: !0
})
}
};
}
};
};
e.prototype.onPreprocessActions = function() {
return {
mutex: {
Puzzle100: {
flowSourceNotNone: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ],
gpFlow: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_DIFFICULTY.KUN_NAN_TI ]
} ],
iosFlowOpen: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.checkPuzzle100Open.data.algorithmId"
} ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "replaceAll",
args: [ {
fact: "operator.checkPuzzle100Open.data.algorithmFailId"
} ]
} ],
iosFlowClose: [ {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
}
};
};
return i([ classId("CTRefactorPuzzle100Trait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorPuzzle100Trait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzle100Trait" ]);
//# sourceMappingURL=index.js.map
