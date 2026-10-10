window.__require = function t(e, r, o) {
function a(i, c) {
if (!r[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var f = r[i] = {
exports: {}
};
e[i][0].call(f.exports, function(t) {
return a(e[i][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < o.length; i++) a(o[i]);
return a;
}({
CTRefactorAdvantureScoreTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "14514fbkVNDo5j2HZgrkscs", "CTRefactorAdvantureScoreTrait");
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
}), n = this && this.__decorate || function(t, e, r, o) {
var a, n = arguments.length, i = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (a = t[c]) && (i = (n < 3 ? a(i) : n > 3 ? a(e, r, i) : a(e, r)) || i);
return n > 3 && i && Object.defineProperty(e, r, i), i;
}, i = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, r = e && t[e], o = 0;
if (r) return r.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, c = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, a, n = r.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = n.next()).done; ) i.push(o.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (a) throw a.error;
}
}
return i;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(c(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAdvantureScoreTrait = void 0;
var s = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._replaceRec = null;
e.replaceObj = null;
e.repNormalTypeList = [ "ios_high_score_rate_1_3", "ios_high_score_rate_1_2", "ios_high_score_rate_1_1", "ios_high_score_rate_mix_1_3", "ios_high_score_rate_mix_1_2", "ios_high_score_rate_mix_1_1", "ios_high_score_rate_diff_1_2", "ios_high_score_rate_diff_1_1" ];
return e;
}
e.prototype.onAlgorithmStrategySessionInit = function() {
this.checkAndSendDailyRequest();
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
t && e.traitSource === this.traitName && this.applyReplaceObjSdkComplete(e);
};
e.prototype.applyReplaceObjSdkComplete = function(t) {
if (this.replaceObj && this.replaceObj.isChangeEffect && -1 !== this.replaceObj.effectId && t.actualAlgorithmId === this.replaceObj.id) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(this.replaceObj.effectId, this);
}
};
e.prototype.onPostprocessConditionContext = function(t) {
return buildLazyConditionContext({
currentFlow: function() {
return ASContext(t, "当前流程");
},
isAfterTag: function() {
return ASContext("updateAfterOfferList" === (null == t ? void 0 : t.currentPostTag), "是否是 After 锚点");
},
isBottomTag: function() {
return ASContext("updateBottomOfferList" === (null == t ? void 0 : t.currentPostTag), "是否是 Bottom 锚点");
}
});
};
e.prototype.onPostprocessConditionOperators = function() {
var t = this;
return {
advantureScoreReplace: function(e) {
var r = null == e ? void 0 : e.currentPostTag, o = null;
if ("updateAfterOfferList" === r) o = "after"; else {
if ("updateBottomOfferList" !== r) return !1;
o = "bottom";
}
var a = t.tryReplaceForStage(o);
return !(!a || 0 === a.length) && {
status: !0,
data: {
algoList: a
}
};
}
};
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isBottomTag",
operator: "=",
value: !0
}, {
fact: "currentFlow",
operator: "advantureScoreReplace",
value: !0
} ]
},
flow: "bottomReplace",
platform: "ios",
gameMode: "class"
}, {
conditions: {
and: [ {
fact: "isBottomTag",
operator: "=",
value: !0
}, {
fact: "currentFlow",
operator: "advantureScoreReplace",
value: !0
} ]
},
flow: "bottomReplace",
platform: "gp",
gameMode: "class"
}, {
conditions: {
and: [ {
fact: "isAfterTag",
operator: "=",
value: !0
}, {
fact: "currentFlow",
operator: "advantureScoreReplace",
value: !0
} ]
},
flow: "afterReplace",
platform: "ios",
gameMode: "class"
}, {
conditions: {
and: [ {
fact: "isAfterTag",
operator: "=",
value: !0
}, {
fact: "currentFlow",
operator: "advantureScoreReplace",
value: !0
} ]
},
flow: "afterReplace",
platform: "gp",
gameMode: "class"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
afterReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.advantureScoreReplace.data.algoList"
} ]
} ],
bottomReplace: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "push",
args: [ {
fact: "operator.advantureScoreReplace.data.algoList"
} ]
} ]
};
};
e.prototype.tryReplaceForBottomHook = function() {
return this.tryReplaceForStage("bottom");
};
e.prototype.tryReplaceForStage = function(t) {
this.replaceObj = null;
if ("bottom" === t) {
if (3 !== hs.algorithmInfo.blockIdList.length) return null;
if (!this.isQuanZuHeStrategy()) return null;
} else if (this.isQuanZuHeStrategy()) return null;
if (this.canReplaceStrategy()) {
var e = this.offerReplacementBlocks();
if (null !== e && e.algoList && e.algoList.length > 0) {
this.replaceObj = e;
return e.algoList;
}
}
return null;
};
e.prototype.checkAndSendDailyRequest = function() {
this.checkIsSameDay() || this.sendStrategyRequest();
};
e.prototype.sendStrategyRequest = function() {
var t, e = this, r = {
key: (null === (t = hs.deviceInfo.data) || void 0 === t ? void 0 : t.distinct_id) || "913CBBDB-FF34-4275-B68E-1D54FBB30A5C_128",
req_type: this.reqType
};
hs.HUserRecentAdjust.online_service_pred(this.url, r).then(function(t) {
e.updateStrategyData(t);
}).catch(function() {});
};
e.prototype.updateStrategyData = function(t) {
var e = t[this.reqType], r = {
send_time: this.formatDate(new Date()),
rec_configs: (null == e ? void 0 : e.rec_config) || []
};
this.saveData(r);
};
e.prototype.canReplaceStrategy = function() {
var t, e, r = this.getData().rec_configs;
if (!r || 0 === r.length) return !1;
var o = function(t) {
var e = t.origin_rec, r = t.replace_rec, o = t.rate, n = t.weight_low, i = t.weight_high;
if (!r || !e) return "continue";
var c = a.getStrategyName(e);
if (5 !== e && "全组合填空消除" === c) return "continue";
var l = hs.algorithmName.algoActualName;
if (!(null == l ? void 0 : l.every(function(t) {
return -1 !== t.indexOf(c);
}))) return "continue";
if (void 0 !== n && void 0 !== i) {
var s = hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks);
if (s < n || s > i) return "continue";
}
if (Math.random() >= o) return "continue";
a._replaceRec = r;
return {
value: !0
};
}, a = this;
try {
for (var n = i(r), c = n.next(); !c.done; c = n.next()) {
var l = o(c.value);
if ("object" == typeof l) return l.value;
}
} catch (e) {
t = {
error: e
};
} finally {
try {
c && !c.done && (e = n.return) && e.call(n);
} finally {
if (t) throw t.error;
}
}
return !1;
};
e.prototype.offerReplacementBlocks = function() {
if (!this._replaceRec) return null;
var t = null, e = {
algoList: null,
isChangeEffect: !1,
id: 0,
effectId: 0
};
switch (this._replaceRec) {
case 1:
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BLANK.TIAN_KONG_XIAO_CHU, this);
t = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
break;

case 2:
t = [ hs.OFFER_TYPE.ALGO_HORIZONTAL_3_8 ];
break;

case 7:
t = [ hs.OFFER_TYPE.ALGO_SCORE ];
e.isChangeEffect = !0;
e.id = hs.OFFER_TYPE.ALGO_SCORE;
e.effectId = hs.OFFER_TYPE.ALGO_SCORE;
break;

case 8:
var r = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
t = l([ hs.OFFER_TYPE.ORDER_FILL_ELIM ], r);
e.isChangeEffect = !0;
e.id = hs.OFFER_TYPE.ORDER_FILL_ELIM;
e.effectId = hs.OFFER_TYPE.ORDER_FILL_ELIM;
break;

case 10:
t = hs.algorithmStrategyIOSDifficultRefactoredInfo.offerBitKunNanNanTi();
break;

case 11:
t = hs.algorithmStrategyIOSShangRefactoredInfo.offerShangZeng3();
break;

case 13:
t = [ hs.OFFER_TYPE.VERY_DIFFICULT_HARD ];
e.isChangeEffect = !0;
e.id = hs.OFFER_TYPE.VERY_DIFFICULT_HARD;
e.effectId = hs.OFFER_TYPE.KUN_NAN_TI;
break;

case 14:
t = hs.algorithmStrategyIOSRandomRefactoredInfo.offerNoBitRandomNoDie();
}
if (!(t && 0 !== t.length || this.repNormalTypeList.includes(this.reqType))) {
var o = hs.classAlgorithmStrategySolveDiffInfo.getAlgorithmStrategy(this._replaceRec);
o && o.algorithmId.length > 0 && (t = o.algorithmId);
}
e.algoList = t;
return e;
};
e.prototype.isQuanZuHeStrategy = function() {
var t, e, r = this.getData().rec_configs;
if (!r || 0 === r.length) return !1;
try {
for (var o = i(r), a = o.next(); !a.done; a = o.next()) if (5 === a.value.origin_rec) return !0;
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = o.return) && e.call(o);
} finally {
if (t) throw t.error;
}
}
return !1;
};
e.prototype.getStrategyName = function(t) {
return {
1: "填空消除",
2: "切割块",
3: "随机",
4: "熵增4",
5: "全组合填空消除",
6: "清盘算法plus",
7: "分数算法",
8: "秩序填空",
9: "死亡难题",
10: "困难难题",
11: "熵增3",
12: "难题矩阵",
13: "极其困难难题",
14: "随机无死",
15: "填空消除边数plus",
16: "陷阱题-高贴边",
17: "快速填空",
18: "秩序抉择",
19: "难题降级策略",
20: "全组合填空消除_1_3_1_1_0",
21: "聚拢算法",
22: "多消算法",
23: "混合填空2",
24: "致死题",
25: "连续边数少难题",
26: "易择熵增"
}[t] || "";
};
e.prototype.checkIsSameDay = function() {
var t = this.getData().send_time;
return !!t && t === this.formatDate(new Date());
};
e.prototype.formatDate = function(t) {
return [ t.getFullYear(), (t.getMonth() + 1).toString().padStart(2, "0"), t.getDate().toString().padStart(2, "0") ].join("-");
};
Object.defineProperty(e.prototype, "reqType", {
get: function() {
var t;
return (null === (t = this.props) || void 0 === t ? void 0 : t.reqType) || "ios_high_score_rate_1_1";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "url", {
get: function() {
var t;
return (null === (t = this.props) || void 0 === t ? void 0 : t.url) || "https://user-skill-eval.afafb.com/infer/v1/block_user_ability_layer";
},
enumerable: !1,
configurable: !0
});
e.prototype.saveData = function(t) {
storage.setItem("advantureScore_" + this.reqType, t);
};
e.prototype.getData = function() {
return storage.getItem("advantureScore_" + this.reqType, {});
};
return n([ classId("CTRefactorAdvantureScoreTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorAdvantureScoreTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAdvantureScoreTrait" ]);
//# sourceMappingURL=index.js.map
