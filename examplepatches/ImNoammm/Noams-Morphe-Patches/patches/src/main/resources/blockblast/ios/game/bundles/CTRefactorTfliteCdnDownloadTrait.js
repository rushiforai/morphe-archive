window.__require = function e(t, o, r) {
function i(a, l) {
if (!o[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var d = o[a] = {
exports: {}
};
t[a][0].call(d.exports, function(e) {
return i(t[a][1][e] || e);
}, d, d.exports, e, t, o, r);
}
return o[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < r.length; a++) i(r[a]);
return i;
}({
CTRefactorTfliteCdnDownloadTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "2b860dczjdLq75+Zz3XnGZ7", "CTRefactorTfliteCdnDownloadTrait");
var r, i = this && this.__extends || (r = function(e, t) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
r(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), n = this && this.__decorate || function(e, t, o, r) {
var i, n = arguments.length, a = n < 3 ? t : null === r ? r = Object.getOwnPropertyDescriptor(t, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, o, r); else for (var l = e.length - 1; l >= 0; l--) (i = e[l]) && (a = (n < 3 ? i(a) : n > 3 ? i(t, o, a) : i(t, o)) || a);
return n > 3 && a && Object.defineProperty(t, o, a), a;
}, a = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, o = t && e[t], r = 0;
if (o) return o.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && r >= e.length && (e = void 0);
return {
value: e && e[r++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorTfliteCdnDownloadTrait = void 0;
var l = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.tfLiteModels = {};
t.needAlgorithmStrategyRequest = "";
return t;
}
t.prototype.onCreate = function() {
this.loadModelFile();
};
t.prototype.isAlgorithmStrategyLogicIsAlgorithmSendEndEvent = function(e) {
this.needAlgorithmStrategyRequest == hs.classGameInfo.roundNum + "," + hs.classGameInfo.gameNum && (e.args[0] = !1);
};
t.prototype.isClassBlocksProducer_Round_ProxyOnAlgorithmStrategyRequest = function(e) {
this.needAlgorithmStrategyRequest == hs.classGameInfo.roundNum + "," + hs.classGameInfo.gameNum && (e.replace = !0);
};
t.prototype.isClassBlocksProducer_ProxyRequestBlocksProducer = function(e) {
var t = e.args[0];
if (this.getOfferResurrectionBlockInfo().result && t && t.strategyState == hs.ALGO_STRATEGY_TYPE.REVIVE) {
t.needAlgorithmStrategyRequest = !0;
this.needAlgorithmStrategyRequest = hs.classGameInfo.roundNum + "," + hs.classGameInfo.gameNum;
var o = TRAIT("RobotModelEventDataTrait");
(null == o ? void 0 : o.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
feature_id: this.id,
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {}
}));
}
};
t.prototype.onAlgorithmStrategyGameInit = function(e) {
"initCommonData" === e && this.loadModelFile();
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
reviveRequestMatched: function() {
return ASContext(e.needAlgorithmStrategyRequest == hs.classGameInfo.roundNum + "," + hs.classGameInfo.gameNum, "本轮复活请求由本特性发起");
},
reviveAiReady: function() {
var t = e.getOfferResurrectionBlockInfo(), o = t.result, r = t.aiID;
return ASContext(o && (r == hs.AIModelType.SHANGJIAN || r == hs.AIModelType.TKXC_TIEHE), "AI 复活模型已就绪（上剑 / 填空消除贴合）");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoReviveTrait: [ {
conditions: {
and: [ {
fact: "reviveRequestMatched",
operator: "=",
value: !0
}, {
fact: "reviveAiReady",
operator: "=",
value: !0
} ]
},
event: {
type: "consumeReviveAiOffer"
},
flow: "reviveAiOffer",
platform: "ios"
}, {
conditions: {
fact: "reviveRequestMatched",
operator: "=",
value: !0
},
event: {
type: "consumeReviveRequest"
},
flow: "reviveConsumeOnly",
platform: "ios"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoReviveTrait: {
reviveAiOffer: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ [ hs.OFFER_TYPE.SHANG_JIAN_AND_TIE_HE, hs.OFFER_TYPE.REVIVE ] ]
} ],
reviveConsumeOnly: []
}
}
};
};
t.prototype.consumeReviveAiOffer = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoRevive);
this.needAlgorithmStrategyRequest = "";
this.getOfferResurrectionBlockInfo().aiID;
var e = TRAIT("RobotModelEventDataTrait");
(null == e ? void 0 : e.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
feature_id: this.id,
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {}
}));
};
t.prototype.consumeReviveRequest = function() {
this.needAlgorithmStrategyRequest = "";
};
t.prototype.checkIsMyModel = function(e) {
var t, o = this;
return !!(e && (null === (t = this.props) || void 0 === t ? void 0 : t.modelArr)) && e.some(function(e) {
return o.props.modelArr.includes(e);
});
};
t.prototype.getOfferResurrectionBlockInfo = function() {
var e, t = -1, o = null === (e = this.props) || void 0 === e ? void 0 : e.modelArr;
o && (o.includes(hs.AIModelType.SHANGJIAN) ? t = hs.AIModelType.SHANGJIAN : o.includes(hs.AIModelType.TKXC_TIEHE) && (t = hs.AIModelType.TKXC_TIEHE));
return this.isAIoffer && jsb && jsb.loadModel && this.isModelLoaded(t) ? {
result: !0,
aiID: t
} : {
result: !1,
aiID: -1
};
};
Object.defineProperty(t.prototype, "isAIoffer", {
get: function() {
var e;
if (!cc.sys.isNative) return !1;
var t = !1;
if (null === (e = this.props) || void 0 === e ? void 0 : e.devicesLimit) {
var o = hs.NativeDeviceInfo.callNativeDeviceInfoForAI(), r = (null == o ? void 0 : o.deviceName) ? o.deviceName.split(",")[0] : "", i = parseFloat((null == o ? void 0 : o.memorySize) ? o.memorySize.split("G")[0] : "0");
(r.includes("iPad") || i <= 4) && (t = !0);
}
return !t;
},
enumerable: !1,
configurable: !0
});
t.prototype.isModelLoaded = function(e) {
var t, o;
return !!this.extendModelArr((null === (t = this.props) || void 0 === t ? void 0 : t.modelArr) || []).includes(e) && !!(null === (o = cc.assetManager.cacheManager) || void 0 === o ? void 0 : o.getCache(hs.tfliteModelUrl[e]));
};
t.prototype.extendModelArr = function(e) {
return e;
};
t.prototype.loadModelFile = function() {
var e, t, o, r = this;
if (cc.sys.isNative && Array.isArray(this.props.modelArr)) {
var i = function(e) {
var t = hs.tfliteModelUrl[e];
t && ((null === (o = cc.assetManager.cacheManager) || void 0 === o ? void 0 : o.getCache(t)) || hs.ResLoader.load(t, cc.Asset, function(e) {
if (!e) {
var o = TRAIT("RobotModelEventDataTrait");
(null == o ? void 0 : o.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Get_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {
modelFile: t
},
feature_id: r.id
}));
}
}));
};
try {
for (var n = a(this.props.modelArr), l = n.next(); !l.done; l = n.next()) i(l.value);
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (t = n.return) && t.call(n);
} finally {
if (e) throw e.error;
}
}
}
};
t.prototype.loadModel = function(e) {
var t, o, r, i;
if (this.tfLiteModels[e]) return this.tfLiteModels[e];
var n = hs.tfliteModelUrl[e];
if (n) {
var a = null === (t = cc.assetManager.cacheManager) || void 0 === t ? void 0 : t.getCache(n), l = null === (r = null === (o = null === jsb || void 0 === jsb ? void 0 : jsb.fileUtils) || void 0 === o ? void 0 : o.getDataFromFile(a)) || void 0 === r ? void 0 : r.buffer;
if (l) {
var s = null === (i = null === jsb || void 0 === jsb ? void 0 : jsb.loadModel) || void 0 === i ? void 0 : i.call(jsb, l);
this.tfLiteModels[e] = [ s, l ];
return this.tfLiteModels[e];
}
}
return null;
};
t.prototype.onSDKArgsConditionContext = function(e, t, o) {
return buildLazyConditionContext({
isShangJianTieHeAlgo: function() {
return ASContext((null == o ? void 0 : o.algorithmId) === hs.OFFER_TYPE.SHANG_JIAN_AND_TIE_HE, "是否上剑贴合复活算法");
}
});
};
t.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isShangJianTieHeAlgo",
operator: "=",
value: !0
},
platform: "ios",
flow: "injectModelData"
} ];
};
t.prototype.onSDKArgsActions = function() {
var e = this;
return {
injectModelData: function() {
var t, o = e.getOfferResurrectionBlockInfo().aiID;
return {
extra: {
traits: {
modelData: {
typeId: o,
modelId: null === (t = e.loadModel(o)) || void 0 === t ? void 0 : t[0]
}
}
}
};
}
};
};
return n([ classId("CTRefactorTfliteCdnDownloadTrait") ], t);
}(Trait);
o.CTRefactorTfliteCdnDownloadTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTfliteCdnDownloadTrait" ]);
//# sourceMappingURL=index.js.map
