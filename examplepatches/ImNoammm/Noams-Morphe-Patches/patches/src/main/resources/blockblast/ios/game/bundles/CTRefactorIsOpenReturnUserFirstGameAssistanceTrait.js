window.__require = function t(e, r, o) {
function s(i, n) {
if (!r[i]) {
if (!e[i]) {
var c = i.split("/");
c = c[c.length - 1];
if (!e[c]) {
var p = "function" == typeof __require && __require;
if (!n && p) return p(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = c;
}
var l = r[i] = {
exports: {}
};
e[i][0].call(l.exports, function(t) {
return s(e[i][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) s(o[i]);
return s;
}({
CTRefactorIsOpenReturnUserFirstGameAssistanceTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "aa39aVgDOxNqpFtCxfUL51b", "CTRefactorIsOpenReturnUserFirstGameAssistanceTrait");
var o, s = this && this.__extends || (o = function(t, e) {
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
var s, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var n = t.length - 1; n >= 0; n--) (s = t[n]) && (i = (a < 3 ? s(i) : a > 3 ? s(e, r, i) : s(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorIsOpenReturnUserFirstGameAssistanceTrait = void 0;
var i = function(t) {
s(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._timer = -1;
e._saveData = null;
e._canTigger = !1;
e._hasGameStart = !1;
e.boardIndexList = [ 14, 27, 35, 41, 42, 51, 55, 58 ];
return e;
}
Object.defineProperty(e.prototype, "saveData", {
get: function() {
this._saveData || (this._saveData = storage.getItem("IsOpenReturnUserFirstGameAssistanceTraitData", {
time: 0,
hasTrigger: !1
}));
return this._saveData;
},
enumerable: !1,
configurable: !0
});
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGame_Proxy",
methodName: "onGameStart"
} ];
};
e.prototype.onCreate = function() {
var t = this;
cc.game.on(cc.game.EVENT_SHOW, function() {
var e = Cinst(hs.ClassGame);
e && cc.isValid(e.node) && e.node.active && t.startTimer();
});
cc.game.on(cc.game.EVENT_HIDE, function() {
t.stopTimer();
});
hs.UI.addEventListener("open", function(e) {
"ClassGame" === e.name && t.startTimer();
});
hs.UI.addEventListener("close", function(e) {
if ("ClassGame" === e.name) {
t.stopTimer();
t._canTigger && (t._canTigger = !1);
}
});
if (this.saveData.hasTrigger) this._canTigger = !1; else {
var e = storage.getItem("classGameNum", 0), r = this.isReturnUser();
this._canTigger = !(0 !== e || !r);
}
};
e.prototype.isClassGame_ProxyOnGameStart = function() {
if (this._canTigger) {
this.saveData.hasTrigger = !0;
storage.setItem("IsOpenReturnUserFirstGameAssistanceTraitData", this.saveData);
}
};
e.prototype.isClassGuide_ProxyShowClassGuide = function(t) {
if (this._canTigger && 1 === this.props.openingExperienceStrategy) {
t.returnState = !0;
t.replace = !0;
}
};
e.prototype.handleClassBlocksProducer_ProxyOnInit = function() {
if (this._canTigger && 2 === this.props.openingExperienceStrategy) {
this.guideStartDot();
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classInitialFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classScore", 0);
this.guideEndDot();
}
};
e.prototype.isClassBlocksProducer_ProxyOnInit = function(t) {
this.handleClassBlocksProducer_ProxyOnInit(t);
};
e.prototype.isClassBoard_ProxyOnBoardInit = function(t) {
this.handleClassBlocksProducer_ProxyOnInit(t);
};
e.prototype.isClassDefaultBoard_ProxyPostPreprocessing = function(t) {
this._hasGameStart && (this._canTigger = !1);
t.args[0];
hs.classGameInfo.gameNum > 0 && (this._canTigger = !1);
if (this._canTigger && 2 === this.props.openingExperienceStrategy) {
var e = hs.storage.getItem("classFaceBlocks", hs.boardInfo.NULL);
if (hs.boardInfo.isNullBoard(e)) {
var r = hs.defaultInfo2Config.LevelConfigs[this.boardIndexList[Math.floor(Math.random() * this.boardIndexList.length)]].Map, o = this.mapConfigToBoard(r);
storage.setItem("classFaceBlocks", o);
}
}
this._hasGameStart = !0;
};
e.prototype.onPreprocessConditionContext = function() {
var t = this.shouldDealReplace();
return buildLazyConditionContext({
shouldDealReplace: function() {
return ASContext(t, "回流首局保护期内是否替换难题");
}
});
};
e.prototype.onPreprocessConditions = function() {
return {
conditionAlgorithm: [ {
conditions: {
fact: "shouldDealReplace",
operator: "=",
value: !0
},
flow: "returnUserProtectReplace",
platform: "ios",
gameMode: "class"
} ]
};
};
e.prototype.onPreprocessActions = function() {
return {
conditionAlgorithm: {
returnUserProtectReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceCategory",
args: [ hs.AlgorithmStrategyCategoryType.SHANG, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ]
}, {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceCategory",
args: [ hs.AlgorithmStrategyCategoryType.DIFFICULT, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ]
}, {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceCategory",
args: [ hs.AlgorithmStrategyCategoryType.DIE, hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU ]
}, {
operator: "AlgorithmStrategyAlgorithmFallbackListOperator",
type: "unshift",
args: [ [ hs.OFFER_TYPE.SUI_JI_WU_SI ] ]
} ]
}
};
};
e.prototype.shouldDealReplace = function() {
return !!this._canTigger && (!(this.props.frontProtectionDuration <= 0) && !(this.saveData.time >= this.props.frontProtectionDuration));
};
e.prototype.guideStartDot = function() {
var t;
try {
DS(null === (t = hs.classGuideInfo.steps[2]) || void 0 === t ? void 0 : t.dotStart);
} catch (t) {}
};
e.prototype.guideEndDot = function() {
var t;
try {
DS(null === (t = hs.classGuideInfo.steps[2]) || void 0 === t ? void 0 : t.dotEnd);
} catch (t) {}
};
e.prototype.mapConfigToBoard = function(t) {
for (var e = hs.boardInfo.NULL, r = 0; r < t.length && r < 64; r++) {
var o = Math.floor(r / 8), s = r % 8;
0 === t[r] ? e[o][s] = -1 : e[o][s] = t[r];
}
return e;
};
e.prototype.isReturnUser = function() {
var t, e = (null === (t = hs.deviceInfo.data) || void 0 === t ? void 0 : t.distinct_id) || "";
return !(!e || "string" != typeof e) && /_\d+$/.test(e);
};
e.prototype.startTimer = function() {
var t = this;
this.stopTimer();
if (!(this.props.frontProtectionDuration <= 0) && !(this.saveData.time >= this.props.frontProtectionDuration) && this._canTigger) {
var e = 0;
this._timer = setInterval(function() {
if (t._canTigger) {
t.saveData.time++;
++e >= 10 && (e = 0);
storage.setItem("IsOpenReturnUserFirstGameAssistanceTraitData", t.saveData);
t.saveData.time >= t.props.frontProtectionDuration && t.stopTimer();
} else t.stopTimer();
}, 1e3);
}
};
e.prototype.stopTimer = function() {
if (this._timer) {
clearInterval(this._timer);
this._timer = -1;
}
};
return a([ classId("CTRefactorIsOpenReturnUserFirstGameAssistanceTrait") ], e);
}(Trait);
r.CTRefactorIsOpenReturnUserFirstGameAssistanceTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorIsOpenReturnUserFirstGameAssistanceTrait" ]);
//# sourceMappingURL=index.js.map
