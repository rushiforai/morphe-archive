window.__require = function t(e, s, r) {
function i(n, o) {
if (!s[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var p = "function" == typeof __require && __require;
if (!o && p) return p(c, !0);
if (a) return a(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var u = s[n] = {
exports: {}
};
e[n][0].call(u.exports, function(t) {
return i(e[n][1][t] || t);
}, u, u.exports, t, e, s, r);
}
return s[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < r.length; n++) i(r[n]);
return i;
}({
IsOpenReturnUserFirstGameAssistanceTrait: [ function(t, e, s) {
"use strict";
cc._RF.push(e, "8ac9aF5HllDNZq2DdraZA+e", "IsOpenReturnUserFirstGameAssistanceTrait");
var r, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var s in e) Object.prototype.hasOwnProperty.call(e, s) && (t[s] = e[s]);
})(t, e);
}, function(t, e) {
r(t, e);
function s() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (s.prototype = e.prototype, new s());
}), a = this && this.__decorate || function(t, e, s, r) {
var i, a = arguments.length, n = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, s) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, s, r); else for (var o = t.length - 1; o >= 0; o--) (i = t[o]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, s, n) : i(e, s)) || n);
return a > 3 && n && Object.defineProperty(e, s, n), n;
};
Object.defineProperty(s, "__esModule", {
value: !0
});
s.IsOpenReturnUserFirstGameAssistanceTrait = void 0;
var n = function(t) {
i(e, t);
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
var e = storage.getItem("classGameNum", 0), s = this.isReturnUser();
this._canTigger = !(0 !== e || !s);
}
};
e.prototype.onActive = function(t) {
if (hs.tp.isClassGame_ProxyOnGameStart(t) && this._canTigger) {
this.saveData.hasTrigger = !0;
storage.setItem("IsOpenReturnUserFirstGameAssistanceTraitData", this.saveData);
}
if (hs.tp.isClassGuide_ProxyShowClassGuide(t) && this._canTigger && 1 === this.props.openingExperienceStrategy) {
t.returnState = !0;
t.replace = !0;
}
if ((hs.tp.isClassBlocksProducer_ProxyOnInit(t) || hs.tp.isClassBoard_ProxyOnBoardInit(t)) && this._canTigger && 2 === this.props.openingExperienceStrategy) {
this.guideStartDot();
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classInitialFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classGuideStep", 3);
hs.storage.setItem("isFinishedGuide", !0);
hs.storage.setItem("classScore", 0);
this.guideEndDot();
}
if (hs.tp.isClassDefaultBoard_ProxyPostPreprocessing(t)) {
this._hasGameStart && (this._canTigger = !1);
t.args[0];
hs.classGameInfo.gameNum > 0 && (this._canTigger = !1);
if (this._canTigger && 2 === this.props.openingExperienceStrategy) {
var e = hs.storage.getItem("classFaceBlocks", hs.boardInfo.NULL);
if (hs.boardInfo.isNullBoard(e)) {
var s = hs.defaultInfo2Config.LevelConfigs[this.boardIndexList[Math.floor(Math.random() * this.boardIndexList.length)]].Map, r = this.mapConfigToBoard(s);
storage.setItem("classFaceBlocks", r);
}
}
this._hasGameStart = !0;
}
hs.tp.isClassAlgorithmStrategyIOS_Condition_ProxyOnAlgorithmStrategyCondition(t) && this.dealReplace();
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
e.prototype.dealReplace = function() {
if (this._canTigger && !(this.props.frontProtectionDuration <= 0 || this.saveData.time >= this.props.frontProtectionDuration)) {
for (var t = hs.algorithmStrategyInfo.algorithmList || [], e = 0; e < t.length; e++) {
var s = t[e];
hs.isValueInEnum(s, hs.OFFER_TYPE_SHANG) ? t[e] = hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU : hs.isValueInEnum(s, hs.OFFER_TYPE_DIFFICULTY) ? t[e] = hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU : hs.isValueInEnum(s, hs.OFFER_TYPE_DIE) && (t[e] = hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU);
}
(hs.algorithmStrategyInfo.algorithmFailList || []).unshift(hs.OFFER_TYPE.SUI_JI_WU_SI);
hs.algorithmStrategyInfo.setAlgorithmList(t);
}
};
e.prototype.mapConfigToBoard = function(t) {
for (var e = hs.boardInfo.NULL, s = 0; s < t.length && s < 64; s++) {
var r = Math.floor(s / 8), i = s % 8;
0 === t[s] ? e[r][i] = -1 : e[r][i] = t[s];
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
return a([ classId("IsOpenReturnUserFirstGameAssistanceTrait") ], e);
}(Trait);
s.IsOpenReturnUserFirstGameAssistanceTrait = n;
cc._RF.pop();
}, {} ],
IsOpenReturnUserFirstGameAssistance_GP_Trait: [ function(t, e, s) {
"use strict";
cc._RF.push(e, "4c38ef9KbFKzqYbEVyHg4hy", "IsOpenReturnUserFirstGameAssistance_GP_Trait");
var r, i = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var s in e) Object.prototype.hasOwnProperty.call(e, s) && (t[s] = e[s]);
})(t, e);
}, function(t, e) {
r(t, e);
function s() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (s.prototype = e.prototype, new s());
}), a = this && this.__decorate || function(t, e, s, r) {
var i, a = arguments.length, n = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, s) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, s, r); else for (var o = t.length - 1; o >= 0; o--) (i = t[o]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, s, n) : i(e, s)) || n);
return a > 3 && n && Object.defineProperty(e, s, n), n;
};
Object.defineProperty(s, "__esModule", {
value: !0
});
s.IsOpenReturnUserFirstGameAssistance_GP_Trait = void 0;
var n = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isClassAlgorithmStrategy_Condition_ProxyOnAlgorithmStrategyCondition = function() {
this.dealReplace();
};
return a([ classId("IsOpenReturnUserFirstGameAssistanceTrait", "gp") ], e);
}(t("./IsOpenReturnUserFirstGameAssistanceTrait").IsOpenReturnUserFirstGameAssistanceTrait);
s.IsOpenReturnUserFirstGameAssistance_GP_Trait = n;
cc._RF.pop();
}, {
"./IsOpenReturnUserFirstGameAssistanceTrait": "IsOpenReturnUserFirstGameAssistanceTrait"
} ]
}, {}, [ "IsOpenReturnUserFirstGameAssistanceTrait", "IsOpenReturnUserFirstGameAssistance_GP_Trait" ]);
//# sourceMappingURL=index.js.map
