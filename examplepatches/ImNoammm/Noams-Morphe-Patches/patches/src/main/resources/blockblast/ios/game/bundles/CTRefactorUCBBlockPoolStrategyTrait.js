window.__require = function t(e, o, r) {
function a(i, l) {
if (!o[i]) {
if (!e[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!e[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var u = o[i] = {
exports: {}
};
e[i][0].call(u.exports, function(t) {
return a(e[i][1][t] || t);
}, u, u.exports, t, e, o, r);
}
return o[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < r.length; i++) a(r[i]);
return a;
}({
CTRefactorUCBBlockPoolStrategyTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "ce070R7xG1O8KslMmyTCivH", "CTRefactorUCBBlockPoolStrategyTrait");
var r, a = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), n = this && this.__decorate || function(t, e, o, r) {
var a, n = arguments.length, i = n < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var l = t.length - 1; l >= 0; l--) (a = t[l]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, o, i) : a(e, o)) || i);
return n > 3 && i && Object.defineProperty(e, o, i), i;
}, i = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, a, n = o.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = n.next()).done; ) i.push(r.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
r && !r.done && (o = n.return) && o.call(n);
} finally {
if (a) throw a.error;
}
}
return i;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(i(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorUCBBlockPoolStrategyTrait = void 0;
var s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.excludeData = [];
e.defaultLocalData = {
weightData: null
};
e.hasTrigger = !1;
e.currentSDKItemAlgorithmId = hs.OFFER_TYPE.NONE;
return e;
}
e.prototype.onResponse = function(t) {
if (t && "success" === t.message && t.data && t.data.ban_list) {
var e = t.data.ban_list;
this.setLocalData({
weightData: e
});
this.excludeData = [];
this.msgData = t.data;
var o = TRAIT("RobotModelEventDataTrait");
(null == o ? void 0 : o.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Get_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: t.data,
feature_id: this.id
}));
}
};
e.prototype.setLocalData = function(t) {
storage.setItem("UCBBlockPoolStrategy", t);
};
e.prototype.parseServerData = function() {
if (0 !== this.excludeData.length) return this.excludeData;
var t = this.getLocalData().weightData;
if (!t) return [];
var e = Object.keys(t).map(function(e) {
var o = e.replace(/\[|\]/g, "").split(",");
return {
min: parseFloat(o[0]),
max: parseFloat(o[1]),
values: t[e]
};
});
this.excludeData = e;
return e;
};
e.prototype.findExByWeight = function() {
var t, e = this.getBoardWeight();
return (null === (t = this.parseServerData().find(function(t) {
return e >= t.min && e <= t.max;
})) || void 0 === t ? void 0 : t.values) || [];
};
e.prototype.getBoardWeight = function() {
return hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks);
};
e.prototype.getAllFillCombinationsExcludePool = function(t) {
return [ hs.OFFER_TYPE.ALL_COMBINATION_ID9, hs.OFFER_TYPE.ALL_COMBINATION_ID21, hs.OFFER_TYPE.ALL_COMBINATION_ID70 ].includes(t) && this.getLocalData().weightData ? this.findExByWeight() : [];
};
e.prototype.getOfferStr = function() {
return hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId];
};
e.prototype.getFillBitExcludePool = function() {
return "填空消除" != this.getOfferStr() ? [] : this.getLocalData().weightData ? this.findExByWeight() : [];
};
e.prototype.getFillNearThicknessBlockFillingBitExcludePool = function() {
var t = hs.OFFER_TYPE.ALGO_NEAR_THICKNESS_BLOCK_FILLING;
return hs.algorithmName.algoExpectedId != t ? [] : this.getLocalData().weightData ? this.findExByWeight() : [];
};
e.prototype.resetAllData = function() {
this.setLocalData(this.defaultLocalData);
this.msgData = {};
this.hasTrigger = !1;
};
e.prototype.getLocalData = function() {
try {
return storage.getItem("UCBBlockPoolStrategy", this.defaultLocalData) || this.defaultLocalData;
} catch (t) {
return this.defaultLocalData;
}
};
e.prototype.dot = function() {
if (Object.keys(this.msgData).length > 0) {
var t = this.msgData;
this.msgData = {};
return t;
}
return {};
};
e.prototype.valid = function() {
return !0;
};
Object.defineProperty(e.prototype, "tag", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.serverTag) && void 0 !== e ? e : "";
},
enumerable: !1,
configurable: !0
});
e.prototype.onReset = function() {};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
var r;
this.currentSDKItemAlgorithmId = null !== (r = null == o ? void 0 : o.algorithmId) && void 0 !== r ? r : hs.OFFER_TYPE.NONE;
return buildLazyConditionContext({});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: !0,
gameMode: "class",
flow: "handleSDKArgs"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = this;
return {
handleSDKArgs: function() {
var e = [], o = !1, r = t.getAllFillCombinationsExcludePool(t.currentSDKItemAlgorithmId);
if (r.length > 0) {
e.push.apply(e, l(r));
o = !0;
}
var a = t.getFillBitExcludePool();
if (a.length > 0) {
e.push.apply(e, l(a));
o = !0;
}
var n = t.getFillNearThicknessBlockFillingBitExcludePool();
if (n.length > 0) {
e.push.apply(e, l(n));
o = !0;
}
if (o && !t.hasTrigger) {
t.hasTrigger = !0;
hs.gbmInfo.onEffectServerRequest(t.tag, {});
}
var i = TRAIT("RobotModelEventDataTrait");
(null == i ? void 0 : i.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: t.id,
model_output: {}
}));
return {
filterBlocks: e
};
}
};
};
e.prototype.isClassUCB_ProxyOnClassGameReplayDataCleared = function() {
this.resetAllData();
};
n([ hs.cacheProperty({}) ], e.prototype, "msgData", void 0);
return n([ GBM(), classId("CTRefactorUCBBlockPoolStrategyTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorUCBBlockPoolStrategyTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorUCBBlockPoolStrategyTrait" ]);
//# sourceMappingURL=index.js.map
