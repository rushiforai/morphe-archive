window.__require = function e(t, r, o) {
function a(i, l) {
if (!r[i]) {
if (!t[i]) {
var s = i.split("/");
s = s[s.length - 1];
if (!t[s]) {
var c = "function" == typeof __require && __require;
if (!l && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = s;
}
var d = r[i] = {
exports: {}
};
t[i][0].call(d.exports, function(e) {
return a(t[i][1][e] || e);
}, d, d.exports, e, t, r, o);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
CTRefactorClearScreenAIModelTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "55150U/UxlNbqVDTUtwx2Iq", "CTRefactorClearScreenAIModelTrait");
var o, a, n = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, o) {
var a, n = arguments.length, i = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, o); else for (var l = e.length - 1; l >= 0; l--) (a = e[l]) && (i = (n < 3 ? a(i) : n > 3 ? a(t, r, i) : a(t, r)) || i);
return n > 3 && i && Object.defineProperty(t, r, i), i;
}, l = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], o = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && o >= e.length && (e = void 0);
return {
value: e && e[o++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorClearScreenAIModelTrait = void 0;
var s = {
gameNum: 0,
lastRoundBoard: ""
}, c = ((a = {})[54] = "clearScreen_btn_00c3c07c5446188ae97e77b6bdfb2414.tflite", 
a[55] = "clearScreen_pos_bdcb0162b939f6ab1b3bf5b8a37f5bde.tflite", a[56] = "clearScreen1_btn_4df19a236b927e15027d6390c5142058.tflite", 
a[57] = "clearScreen1_pos_8a286c31d6f3c2ce88ed2724ad3e2690.tflite", a[5] = "clearScreen_btn_00c3c07c5446188ae97e77b6bdfb2414.tflite", 
a[6] = "clearScreen_pos_bdcb0162b939f6ab1b3bf5b8a37f5bde.tflite", a), d = "https://bbios1.afafb.com/algorithm_model/", f = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.bOri = new hs.BinaryBoard();
t.tfLiteModels = {};
t._pendingInsertIds = [];
return t;
}
t.prototype.onCreate = function() {
this.loadModelFile();
};
t.prototype.onPreprocessConditionContext = function() {
var e = this, t = as.AlgorithmStrategyAlgorithmListPatch.curAlgorithmList.map(function(e) {
return e.algorithmId;
});
return buildLazyConditionContext({
isNative: function() {
var e, t;
return ASContext(null !== (t = null === (e = cc.sys) || void 0 === e ? void 0 : e.isNative) && void 0 !== t && t, "是否为原生环境");
},
isCutOff: function() {
return ASContext(e.isCutOff(t), "是否被切断");
},
offerState: function() {
return ASContext(e.offerState(), "模型配置是否开启");
},
canTrigger: function() {
return ASContext(e.checkCanTrigger(), "盘面是否允许触发");
},
isLaneScheme: function() {
return ASContext(e.isLaneSchemeSource(), "是否为泳道源");
},
isClassMode: function() {
return ASContext(hs.gameInfo.gameMode === hs.GameMode.Class, "是否为无尽模式");
},
pendingInsertIds: function() {
return ASContext(e._pendingInsertIds, "待插入算法ID列表");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
conditionAlgorithm: [ {
conditions: {
and: [ {
fact: "isNative",
operator: "=",
value: !0
}, {
fact: "isCutOff",
operator: "=",
value: !1
}, {
fact: "offerState",
operator: "=",
value: !0
}, {
fact: "canTrigger",
operator: "=",
value: !0
}, {
fact: "isLaneScheme",
operator: "=",
value: !0
}, {
fact: "isClassMode",
operator: "=",
value: !0
} ]
},
event: {
type: "markClearScreenAIModelTriggered"
},
flow: "insertClearScreenAIModel",
platform: "ios"
}, {
conditions: {
and: [ {
fact: "isNative",
operator: "=",
value: !0
}, {
fact: "isCutOff",
operator: "=",
value: !1
}, {
fact: "offerState",
operator: "=",
value: !0
}, {
fact: "canTrigger",
operator: "=",
value: !0
}, {
fact: "isLaneScheme",
operator: "=",
value: !0
}, {
fact: "isClassMode",
operator: "=",
value: !0
} ]
},
event: {
type: "markClearScreenAIModelTriggered"
},
flow: "insertClearScreenAIModelGp",
platform: "gp"
} ]
};
};
t.prototype.onPreprocessActions = function() {
return {
conditionAlgorithm: {
insertClearScreenAIModel: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ {
fact: "pendingInsertIds"
} ]
} ],
insertClearScreenAIModelGp: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "unshift",
args: [ {
fact: "pendingInsertIds"
} ]
} ]
}
};
};
t.prototype.markClearScreenAIModelTriggered = function() {
this.conditionReplace();
var e = TRAIT("RobotModelEventDataTrait");
(null == e ? void 0 : e.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
feature_id: this.id,
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {}
}));
};
t.prototype.isLaneSchemeSource = function() {
return hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 === hs.ClassAlgorithmSourceType.LaneScheme;
};
t.prototype.onSDKArgsConditionContext = function(e, t, r) {
var o = null == r ? void 0 : r.algorithmId, a = hs.OFFER_TYPE.CLEAR_BOARD_MODEL, n = hs.OFFER_TYPE.CLEAR_BOARD_MODEL_GL, i = hs.OFFER_TYPE.CLEAR_BOARD_MODEL_C1;
return buildLazyConditionContext({
isClearScreenAIModelAlgo: function() {
return ASContext(o === a || o === n || o === i, "是否清屏 AI 模型算法");
}
});
};
t.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isClearScreenAIModelAlgo",
operator: "=",
value: !0
},
platform: "ios",
flow: "injectClearScreenModelData"
}, {
conditions: {
fact: "isClearScreenAIModelAlgo",
operator: "=",
value: !0
},
platform: "gp",
flow: "injectClearScreenModelDataGp"
} ];
};
t.prototype.onSDKArgsActions = function() {
var e = this;
return {
injectClearScreenModelData: function() {
var t;
if (!(null === (t = cc.sys) || void 0 === t ? void 0 : t.isNative)) return {};
var r = e.loadModel(e.props.modelArr[0]), o = e.loadModel(e.props.modelArr[1]);
if (!r || !o) return {};
var a = {
modeltype: e.props.modeltype,
minMaxValue: e.props.minMaxValue,
blockModelId: null == r ? void 0 : r[0],
posModelId: null == o ? void 0 : o[0],
curScore: hs.scoreInfo.score
}, n = TRAIT("RobotModelEventDataTrait");
(null == n ? void 0 : n.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
feature_id: e.id,
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {}
}));
return {
extra: {
traits: {
modelData: a
}
}
};
},
injectClearScreenModelDataGp: function() {
var t;
if (!(null === (t = cc.sys) || void 0 === t ? void 0 : t.isNative)) return {};
var r = e.loadModel(e.props.modelArr[0]), o = e.loadModel(e.props.modelArr[1]);
if (!r || !o) return {};
var a = {
modeltype: e.props.modeltype,
minMaxValue: e.props.minMaxValue,
blockModelId: null == r ? void 0 : r[0],
posModelId: null == o ? void 0 : o[0],
curScore: hs.scoreInfo.score
}, n = TRAIT("RobotModelEventDataTrait");
(null == n ? void 0 : n.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
feature_id: e.id,
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: {}
}));
return {
extra: {
traits: {
modelData: a
}
}
};
}
};
};
t.prototype.conditionReplace = function() {
var e, t, r;
this._pendingInsertIds = [];
var o = hs.storage.getItem("ClearScreenAIModelState", s);
this.bOri.convertToBinaryBoard(hs.deepCopy(hs.boardInfo.faceBlocks));
if (o.gameNum == hs.classGameInfo.gameNum && this.bOri.rowBinary.join(",") == (null == o ? void 0 : o.lastRoundBoard)) this._pendingInsertIds = hs.algorithmStrategyIOSBlankRefactoredInfo.offerNoBit(); else if (1 == (null === (e = this.props) || void 0 === e ? void 0 : e.modeltype)) {
this._pendingInsertIds = [ hs.OFFER_TYPE.CLEAR_BOARD_MODEL ];
this.registerClearScreenAlgorithmNameMapping(hs.OFFER_TYPE.CLEAR_BOARD_MODEL);
} else if (2 == (null === (t = this.props) || void 0 === t ? void 0 : t.modeltype)) {
this._pendingInsertIds = [ hs.OFFER_TYPE.CLEAR_BOARD_MODEL_GL ];
this.registerClearScreenAlgorithmNameMapping(hs.OFFER_TYPE.CLEAR_BOARD_MODEL_GL);
} else if (3 == (null === (r = this.props) || void 0 === r ? void 0 : r.modeltype)) {
this._pendingInsertIds = [ hs.OFFER_TYPE.CLEAR_BOARD_MODEL_C1 ];
this.registerClearScreenAlgorithmNameMapping(hs.OFFER_TYPE.CLEAR_BOARD_MODEL_C1);
}
};
t.prototype.registerClearScreenAlgorithmNameMapping = function(e) {
var t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
(null == t ? void 0 : t.active) && t.addAlgorithmNameMapping(e, this.traitName, null, null, e);
};
t.prototype.recordBoard = function() {
var e = hs.storage.getItem("ClearScreenAIModelState", s);
this.bOri.convertToBinaryBoard(hs.deepCopy(hs.boardInfo.faceBlocks));
e.lastRoundBoard = this.bOri.rowBinary.join(",");
e.gameNum != hs.classGameInfo.gameNum && (e.gameNum = hs.classGameInfo.gameNum);
hs.storage.setItem("ClearScreenAIModelState", e);
};
t.prototype.offerState = function() {
var e, t, r;
if (!(null === (e = cc.sys) || void 0 === e ? void 0 : e.isNative)) return !1;
var o = [ 54, 55 ];
switch (this.props.modeltype || 1) {
case 1:
case 2:
o = (null === (t = this.props.modelArr) || void 0 === t ? void 0 : t.includes(5)) ? [ 5, 6 ] : [ 54, 55 ];
break;

case 3:
o = [ 56, 57 ];
}
var a = this.props.modelArr || [ 54, 55 ];
if (a.includes(o[0]) && a.includes(o[1])) {
if (null === (r = this.props) || void 0 === r || !r.devicesLimit) return !0;
var n = hs.NativeDeviceInfo.callNativeDeviceInfoForAI();
if (n) {
var i = (null == n ? void 0 : n.deviceName) ? n.deviceName.split(",")[0] : "", l = parseFloat((null == n ? void 0 : n.memorySize) ? n.memorySize.split("G")[0] : "0");
if (i.includes("iPad") || l <= 4) return !1;
}
if (jsb && jsb.loadModel && this.isModelLoaded(o[0]) && this.isModelLoaded(o[1])) return !0;
}
return !1;
};
t.prototype.checkCanTrigger = function() {
var e;
this.bOri.convertToBinaryBoard(hs.deepCopy(hs.boardInfo.faceBlocks));
return !this.bOri.isEmpty() && (2 != (null === (e = this.props) || void 0 === e ? void 0 : e.modeltype) || Math.random() > .5);
};
t.prototype.isModelLoaded = function(e) {
if (cc.sys.isNative) {
var t = c[e], r = d + t;
return !!cc.assetManager.cacheManager.getCache(r);
}
return !1;
};
t.prototype.loadModelFile = function() {
var e, t;
if (cc.sys.isNative && Array.isArray(this.props.modelArr)) {
var r = function(e) {
var t = c[e];
if (t) {
var r = d + t;
cc.assetManager.cacheManager.getCache(r) || hs.ResLoader.load(r, cc.Asset, function() {});
}
};
try {
for (var o = l(this.props.modelArr), a = o.next(); !a.done; a = o.next()) r(a.value);
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (t = o.return) && t.call(o);
} finally {
if (e) throw e.error;
}
}
}
};
t.prototype.loadModel = function(e) {
var t;
if (this.tfLiteModels[e]) return this.tfLiteModels[e];
var r = c[e];
if (r) {
var o = d + r, a = cc.assetManager.cacheManager.getCache(o), n = null === (t = jsb.fileUtils.getDataFromFile(a)) || void 0 === t ? void 0 : t.buffer;
if (n) {
var i = jsb.loadModel(n);
this.tfLiteModels[e] = [ i, n ];
return this.tfLiteModels[e];
}
}
return null;
};
t.prototype.isCutOff = function(e, t) {
void 0 === t && (t = !1);
return t;
};
return i([ classId("CTRefactorClearScreenAIModelTrait"), classMethodWatch() ], t);
}(Trait);
r.CTRefactorClearScreenAIModelTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorClearScreenAIModelTrait" ]);
//# sourceMappingURL=index.js.map
