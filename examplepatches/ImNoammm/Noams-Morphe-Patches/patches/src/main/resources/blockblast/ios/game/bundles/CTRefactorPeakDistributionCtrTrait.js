window.__require = function t(e, r, a) {
function i(n, s) {
if (!r[n]) {
if (!e[n]) {
var _ = n.split("/");
_ = _[_.length - 1];
if (!e[_]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(_, !0);
if (o) return o(_, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = _;
}
var h = r[n] = {
exports: {}
};
e[n][0].call(h.exports, function(t) {
return i(e[n][1][t] || t);
}, h, h.exports, t, e, r, a);
}
return r[n].exports;
}
for (var o = "function" == typeof __require && __require, n = 0; n < a.length; n++) i(a[n]);
return i;
}({
CTRefactorPeakDistributionCtrTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "4ee96OpZpxA6rxsV0Tg5xxi", "CTRefactorPeakDistributionCtrTrait");
var a, i = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), o = this && this.__decorate || function(t, e, r, a) {
var i, o = arguments.length, n = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (n = (o < 3 ? i(n) : o > 3 ? i(e, r, n) : i(e, r)) || n);
return o > 3 && n && Object.defineProperty(e, r, n), n;
}, n = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var a, i, o = r.call(t), n = [];
try {
for (;(void 0 === e || e-- > 0) && !(a = o.next()).done; ) n.push(a.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
a && !a.done && (r = o.return) && r.call(o);
} finally {
if (i) throw i.error;
}
}
return n;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(n(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPeakDistributionCtrTrait = r.CurStatus = void 0;
var _, u = t("../vo/CTRefactorPeakDistributionTable");
(function(t) {
t.None = "None";
t.LowState = "LowState";
t.TallState = "TallState";
})(_ = r.CurStatus || (r.CurStatus = {}));
var h = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.firing = 2;
e.curStatus = _.None;
e.bOri = new hs.BinaryBoard();
return e;
}
e.prototype.isClassGame_ProxyOnClassGameStart = function() {
this.initData();
};
e.prototype.isClassAlgorithmLifeCycle_GameStart_ProxyOnBoardRender = function() {
this.handleBoardRender();
};
e.prototype.handleBoardRender = function() {
2 == hs.classGuideInfo.step && this.initData();
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this;
return buildLazyConditionContext({
canRunAfterOfferIOS: function() {
return ASContext(e.canRunAfterOffer(t) && !e.shouldSkipSetAlgorithmAfterList(), "iOS 是否可运行 After 后置段");
},
notIosTerminateCyclePeakDist: function() {
var t, e = hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.IOS_TERMINATE_CYCLE];
return ASContext(!(null === (t = hs.algorithmName.algoActualName) || void 0 === t ? void 0 : t.includes(e)), "终结周期则跳过后置替换");
},
notNewbieGuideDeathOfferSkip: function() {
return ASContext("CTRefactorZX209_NewbieGuideDeadEndRateTrait" !== hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel2, "新手引导局死亡回合出题后跳过 PeakDistribution 后置");
}
});
};
e.prototype.onPostprocessConditionOperators = function() {
var t = this;
return {
peakDistributionIosAlgoList: function(e) {
if (!e) return !1;
var r = t.getBlockIdsByAlgorithmIOS();
return !(null == r || !r.length) && {
status: !0,
data: {
algoList: r
}
};
},
peakDistributionGpAlgoList: function(e) {
if (!e) return !1;
var r = t.computeGpTriggerBottomOfferAlgorithmIds();
return null !== r && {
status: !0,
data: {
algoList: r
}
};
}
};
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOfferIOS",
operator: "=",
value: !0
}, {
fact: "notIosTerminateCyclePeakDist",
operator: "peakDistributionIosAlgoList",
value: !0
}, {
fact: "notNewbieGuideDeathOfferSkip",
operator: "=",
value: !0
} ]
},
flow: "replacePeakDistributionIos",
platform: "ios"
}, {
conditions: {
fact: "peakDistributionGpGuideReady",
operator: "peakDistributionGpAlgoList",
value: !0
},
flow: "replacePeakDistributionGp",
platform: "gp"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
replacePeakDistributionIos: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.peakDistributionIosAlgoList.data.algoList"
} ]
} ],
replacePeakDistributionGp: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "operator.peakDistributionGpAlgoList.data.algoList"
} ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS ]
}, {
operator: "AlgorithmStrategyDisableOperator",
type: "disablePostRestTags",
args: [ !0 ]
} ]
};
};
e.prototype.getBlockIdsByAlgorithmIOS = function() {
var t, e;
this.updateCurStatus();
if (this.curStatus == _.None) return null;
var r = u.PeakDistributionAlgorithm.None;
if (this._isEmptyBorad()) r = u.PeakDistributionAlgorithm.Sjsf; else {
u.default.InitWeightDataByCurStatus(this.curStatus);
r = u.default.GetRandomAlgorithm();
}
var a = null;
switch (r = this.adjustAlgorithm(r)) {
case u.PeakDistributionAlgorithm.Sjsf:
a = [ hs.OFFER_TYPE.SUI_JI ];
(null === (t = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait")) || void 0 === t ? void 0 : t.active) && (null === (e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait")) || void 0 === e || e.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI, "CTRefactorPeakDistributionCtrTrait", hs.OFFER_TYPE.SUI_JI));
break;

case u.PeakDistributionAlgorithm.Tbxc_sz:
a = [ hs.OFFER_TYPE.ALGO_FILL_CHANGE_EDGE ];
break;

case u.PeakDistributionAlgorithm.Kdxc:
break;

case u.PeakDistributionAlgorithm.Zhtk_id9:
a = [ hs.OFFER_TYPE.ALL_COMBINATION_ID9 ];
break;

case u.PeakDistributionAlgorithm.Zhtk_id70:
a = [ hs.OFFER_TYPE.ALL_COMBINATION_ID70 ];
break;

case u.PeakDistributionAlgorithm.Tkxc:
a = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
}
return a;
};
e.prototype.initData = function() {
var t, e;
if (!(hs.classGuideInfo.step < 2)) {
this.curStatus = _.None;
u.default.InitDataInfo(null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.firing) && void 0 !== e ? e : this.firing);
this.adjustPeakDistributionTableData();
}
};
e.prototype.adjustPeakDistributionTableData = function() {};
e.prototype.adjustAlgorithm = function(t) {
return t;
};
e.prototype.updateCurStatus = function() {
var t = this._isDifficulty();
this.curStatus = u.default.GetUserCurStatus(t);
};
e.prototype.getBlockIdsByAlgorithm = function(t) {
this.updateCurStatus();
if (this.curStatus != _.None) {
var e = u.PeakDistributionAlgorithm.None;
if (this._isEmptyBorad()) e = u.PeakDistributionAlgorithm.Sjsf; else {
u.default.InitWeightDataByCurStatus(this.curStatus);
e = u.default.GetRandomAlgorithm();
}
var r = t.args[0] || [];
switch (e) {
case u.PeakDistributionAlgorithm.Sjsf:
r.push(hs.OFFER_TYPE.SUI_JI);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.SUI_JI, this);
break;

case u.PeakDistributionAlgorithm.Tbxc_sz:
r.push(hs.OFFER_TYPE.ALGO_FILL_CHANGE_EDGE);
break;

case u.PeakDistributionAlgorithm.Kdxc:
break;

case u.PeakDistributionAlgorithm.Zhtk_id9:
r.push(hs.OFFER_TYPE.ALL_COMBINATION_ID9);
break;

case u.PeakDistributionAlgorithm.Zhtk_id70:
r.push(hs.OFFER_TYPE.ALL_COMBINATION_ID70);
break;

case u.PeakDistributionAlgorithm.Tkxc:
var a = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
r = r.concat(a);
}
t.args[0] = r;
}
};
e.prototype.computeGpTriggerBottomOfferAlgorithmIds = function() {
this.updateCurStatus();
if (this.curStatus == _.None) return null;
var t = u.PeakDistributionAlgorithm.None;
if (this._isEmptyBorad()) t = u.PeakDistributionAlgorithm.Sjsf; else {
u.default.InitWeightDataByCurStatus(this.curStatus);
t = u.default.GetRandomAlgorithm();
}
var e = [];
switch (t) {
case u.PeakDistributionAlgorithm.Sjsf:
e.push(hs.OFFER_TYPE.SUI_JI);
break;

case u.PeakDistributionAlgorithm.Tbxc_sz:
e.push(hs.OFFER_TYPE.ALGO_FILL_CHANGE_EDGE);
break;

case u.PeakDistributionAlgorithm.Kdxc:
break;

case u.PeakDistributionAlgorithm.Zhtk_id9:
e.push(hs.OFFER_TYPE.ALL_COMBINATION_ID9);
break;

case u.PeakDistributionAlgorithm.Zhtk_id70:
e.push(hs.OFFER_TYPE.ALL_COMBINATION_ID70);
break;

case u.PeakDistributionAlgorithm.Tkxc:
var r = hs.algorithmStrategyIOSBlankRefactoredInfo.offer();
e.push.apply(e, s(r));
}
return e;
};
e.prototype._isDifficulty = function() {
return -1 !== (hs.OFFER_TYPE_STRINGS[hs.algorithmName.algoExpectedId] || "").indexOf("难题");
};
e.prototype._isEmptyBorad = function() {
this.bOri.convertToBinaryBoard(hs.deepCopy(hs.boardInfo.faceBlocks));
this.bOri.record();
return this.bOri.isEmpty();
};
e.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.shouldSkipSetAlgorithmAfterList = function() {
return !1;
};
return o([ classId("CTRefactorPeakDistributionCtrTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorPeakDistributionCtrTrait = h;
cc._RF.pop();
}, {
"../vo/CTRefactorPeakDistributionTable": "CTRefactorPeakDistributionTable"
} ],
CTRefactorPeakDistributionTable: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "dd115GAigZI1JO56KeEIpyE", "CTRefactorPeakDistributionTable");
var a, i = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
});
Object.defineProperty(r, "__esModule", {
value: !0
});
r.WeightData = r.WeightParam = r.PeakDistributionAlgorithm = r.Weight = void 0;
var o, n, s = t("../scripts/CTRefactorPeakDistributionCtrTrait");
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.LOW_1 = 1] = "LOW_1";
t[t.TAL_1 = 11] = "TAL_1";
t[t.TAL_2 = 12] = "TAL_2";
t[t.TAL_3 = 13] = "TAL_3";
})(o = r.Weight || (r.Weight = {}));
(function(t) {
t.None = "None";
t.Sjsf = "Sjsf";
t.Tbxc_sz = "Tbxc_sz";
t.Kdxc = "Kdxc";
t.Zhtk_id9 = "Zhtk_id9";
t.Zhtk_id70 = "Zhtk_id70";
t.Tkxc = "Tkxc";
})(n = r.PeakDistributionAlgorithm || (r.PeakDistributionAlgorithm = {}));
var _ = function() {};
r.WeightParam = _;
var u = function() {
function t(t, e, r, a, i) {
this.tbxc_sz = t;
this.kdxc = e;
this.zhtk_id9 = r;
this.zhtk_id70 = a;
this.tkxc = i;
}
t.prototype.getValuesInOrder = function() {
return [ this.tbxc_sz, this.kdxc, this.zhtk_id9, this.zhtk_id70, this.tkxc ];
};
return t;
}();
r.WeightData = u;
var h = [ 100, 290, 400, 500, 1e3 ], l = [ 100, 290, 400, 500, 1e3 ], c = [ 100, 290, 400, 500, 1e3 ], f = [ 100, 290, 400, 500, 1e3 ], p = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.GetWeightParam = function() {
return e._WeightParam;
};
e.GetWeightData = function() {
return e._WeightData;
};
e.InitDataInfo = function(t) {
this.bOri = new hs.BinaryBoard();
e._WeightParam = null;
e._WeightData = null;
e._CurBoardWeights = null;
e._CurWightDatas = null;
e._WeightDataLowArray_1.length = 0;
e._WeightDataTalArray_1.length = 0;
e._WeightDataTalArray_2.length = 0;
e._WeightDataTalArray_3.length = 0;
e._InitTime = new Date().getTime();
e._InitWeightParam(t);
e._InitWeightDatas();
};
e._InitWeightParam = function(t) {
var r = new _();
switch (t) {
case 1:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_1;
break;

case 2:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_2;
break;

case 3:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_3;
break;

case 4:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_1;
break;

case 5:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_2;
break;

case 6:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_3;
break;

case 7:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_1;
break;

case 8:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_2;
break;

case 9:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = .3;
r.cut_t = this._Get_Cut_T(r);
r.low = o.LOW_1;
r.tal = o.TAL_3;
break;

case 10:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_1;
break;

case 11:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_2;
break;

case 12:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = 60 * this._Get_T_Beta(1, 3) + 30 + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_3;
break;

case 13:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_1;
break;

case 14:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_2;
break;

case 15:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(30, 60) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_3;
break;

case 16:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_1;
break;

case 17:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_2;
break;

case 18:
r.t1 = 60 * this._Get_T_Beta(2, 6) + 45;
r.t2 = this._Get_T_Rand(0, 90) + r.t1;
r.p = 0;
r.cut_t = this._Get_Cut_T(r);
r.low = o.NONE;
r.tal = o.TAL_3;
break;

default:
r = null;
}
e._WeightParam = r;
};
e._InitWeightDatas = function() {
var t = new u(.35, 0, .3, 0, .35), e = new u(.25, 0, .25, .25, .25), r = new u(.25, 0, .25, .25, .25), a = new u(0, 0, .2, .1, .7), i = new u(0, 0, .1, 0, .9);
this._WeightDataLowArray_1.push(t, e, r, a, i);
var o = new u(.15, 0, .7, 0, .15), n = new u(.1, 0, .35, .15, .4), s = new u(0, 0, 0, .6, .4), _ = new u(0, 0, .4, .5, .1), h = new u(0, 0, .8, 0, .2);
this._WeightDataTalArray_1.push(o, n, s, _, h);
var l = new u(.35, 0, .3, 0, .35), c = new u(.25, 0, .25, .25, .25), f = new u(.25, 0, .25, .25, .25), p = new u(0, 0, .1, .2, .7), T = new u(0, 0, .1, 0, .9);
this._WeightDataTalArray_2.push(l, c, f, p, T);
var g = new u(.4, 0, .2, 0, .4), d = new u(.3, 0, .2, .4, .1), A = new u(0, 0, .2, .5, .3), b = new u(0, 0, .2, .4, .4), k = new u(0, 0, .5, 0, .5);
this._WeightDataTalArray_3.push(g, d, A, b, k);
};
e._Get_T_Beta = function(t, e) {
return hs.BetaRandom.Sample(t, e);
};
e._Get_T_Rand = function(t, e) {
return Math.floor(Math.random() * (e - t + 1)) + t;
};
e._Get_Cut_T = function(t) {
if (null != t) return t.t1 + (t.t2 - t.t1) * t.p;
};
e.GetUserCurStatus = function(t) {
var r = s.CurStatus.None;
if (null == e._WeightParam) return r;
var a = new Date().getTime() - e._InitTime;
if (a >= 1e3 * e._WeightParam.t1 && a < 1e3 * e._WeightParam.t2) {
if (t) {
r = s.CurStatus.None;
e._WeightParam.t2 = e._WeightParam.t1;
return r;
}
r = a < 1e3 * e._WeightParam.cut_t ? s.CurStatus.LowState : s.CurStatus.TallState;
}
return r;
};
e.InitWeightDataByCurStatus = function(t) {
if (t != s.CurStatus.None && null != e._WeightParam) {
var r = o.NONE;
t == s.CurStatus.LowState ? r = e._WeightParam.low : t == s.CurStatus.TallState && (r = e._WeightParam.tal);
this._CurBoardWeights = this.GetBoardWeightArray(r);
this._CurWightDatas = this.GetWeightDatasArray(r);
if (!(null == this._CurBoardWeights || this._CurWightDatas && 0 == this._CurWightDatas.length)) {
this.bOri.convertToBinaryBoard(hs.deepCopy(hs.boardInfo.faceBlocks));
this.bOri.record();
for (var a = -1, i = hs.BinaryBoard.getWeightValue(), n = 0, _ = this._CurBoardWeights.length; n < _; n++) if (i < this._CurBoardWeights[n]) {
a = n;
break;
}
e._WeightData = this._CurWightDatas[a];
}
}
};
e.GetRandomAlgorithm = function() {
var t;
if (null == e._WeightData) return n.None;
for (var r = 0, a = -1, i = Math.random(), o = null === (t = e._WeightData) || void 0 === t ? void 0 : t.getValuesInOrder(), s = 0, _ = (null == o ? void 0 : o.length) || 0; s < _; s++) if (i < (r += o[s])) {
a = s;
break;
}
switch (a) {
case 0:
return n.Tbxc_sz;

case 1:
return n.Kdxc;

case 2:
return n.Zhtk_id9;

case 3:
return n.Zhtk_id70;

case 4:
return n.Tkxc;

default:
return n.None;
}
};
e.GetBoardWeightArray = function(t) {
switch (t) {
case o.NONE:
return null;

case o.LOW_1:
return h;

case o.TAL_1:
return l;

case o.TAL_2:
return c;

case o.TAL_3:
return f;

default:
return null;
}
};
e.GetWeightDatasArray = function(t) {
switch (t) {
case o.NONE:
return null;

case o.LOW_1:
return e._WeightDataLowArray_1;

case o.TAL_1:
return e._WeightDataTalArray_1;

case o.TAL_2:
return e._WeightDataTalArray_2;

case o.TAL_3:
return e._WeightDataTalArray_3;

default:
return null;
}
};
e._WeightParam = null;
e._WeightData = null;
e._CurBoardWeights = null;
e._CurWightDatas = null;
e._WeightDataLowArray_1 = [];
e._WeightDataTalArray_1 = [];
e._WeightDataTalArray_2 = [];
e._WeightDataTalArray_3 = [];
e._InitTime = 0;
e.bOri = null;
return e;
}(hs.Component);
r.default = p;
cc._RF.pop();
}, {
"../scripts/CTRefactorPeakDistributionCtrTrait": "CTRefactorPeakDistributionCtrTrait"
} ]
}, {}, [ "CTRefactorPeakDistributionCtrTrait", "CTRefactorPeakDistributionTable" ]);
//# sourceMappingURL=index.js.map
