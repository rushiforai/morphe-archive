window.__require = function t(o, e, r) {
function l(n, a) {
if (!e[n]) {
if (!o[n]) {
var s = n.split("/");
s = s[s.length - 1];
if (!o[s]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = s;
}
var c = e[n] = {
exports: {}
};
o[n][0].call(c.exports, function(t) {
return l(o[n][1][t] || t);
}, c, c.exports, t, o, e, r);
}
return e[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < r.length; n++) l(r[n]);
return l;
}({
CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "6a0e49cPRtMmq5/G1xNOm98", "CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
var r, l = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), i = this && this.__assign || function() {
return (i = Object.assign || function(t) {
for (var o, e = 1, r = arguments.length; e < r; e++) {
o = arguments[e];
for (var l in o) Object.prototype.hasOwnProperty.call(o, l) && (t[l] = o[l]);
}
return t;
}).apply(this, arguments);
}, n = this && this.__decorate || function(t, o, e, r) {
var l, i = arguments.length, n = i < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, o, e, r); else for (var a = t.length - 1; a >= 0; a--) (l = t[a]) && (n = (i < 3 ? l(n) : i > 3 ? l(o, e, n) : l(o, e)) || n);
return i > 3 && n && Object.defineProperty(o, e, n), n;
}, a = this && this.__awaiter || function(t, o, e, r) {
return new (e || (e = Promise))(function(l, i) {
function n(t) {
try {
s(r.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
s(r.throw(t));
} catch (t) {
i(t);
}
}
function s(t) {
t.done ? l(t.value) : (o = t.value, o instanceof e ? o : new e(function(t) {
t(o);
})).then(n, a);
var o;
}
s((r = r.apply(t, o || [])).next());
});
}, s = this && this.__generator || function(t, o) {
var e, r, l, i, n = {
label: 0,
sent: function() {
if (1 & l[0]) throw l[1];
return l[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(o) {
return s([ t, o ]);
};
}
function s(i) {
if (e) throw new TypeError("Generator is already executing.");
for (;n; ) try {
if (e = 1, r && (l = 2 & i[0] ? r.return : i[0] ? r.throw || ((l = r.return) && l.call(r), 
0) : r.next) && !(l = l.call(r, i[1])).done) return l;
(r = 0, l) && (i = [ 2 & i[0], l.value ]);
switch (i[0]) {
case 0:
case 1:
l = i;
break;

case 4:
n.label++;
return {
value: i[1],
done: !1
};

case 5:
n.label++;
r = i[1];
i = [ 0 ];
continue;

case 7:
i = n.ops.pop();
n.trys.pop();
continue;

default:
if (!(l = n.trys, l = l.length > 0 && l[l.length - 1]) && (6 === i[0] || 2 === i[0])) {
n = 0;
continue;
}
if (3 === i[0] && (!l || i[1] > l[0] && i[1] < l[3])) {
n.label = i[1];
break;
}
if (6 === i[0] && n.label < l[1]) {
n.label = l[1];
l = i;
break;
}
if (l && n.label < l[2]) {
n.label = l[2];
n.ops.push(i);
break;
}
l[2] && n.ops.pop();
n.trys.pop();
continue;
}
i = o.call(t, n);
} catch (t) {
i = [ 6, t ];
r = 0;
} finally {
e = l = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, u = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var r, l, i = e.call(t), n = [];
try {
for (;(void 0 === o || o-- > 0) && !(r = i.next()).done; ) n.push(r.value);
} catch (t) {
l = {
error: t
};
} finally {
try {
r && !r.done && (e = i.return) && e.call(i);
} finally {
if (l) throw l.error;
}
}
return n;
}, c = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(u(arguments[o]));
return t;
}, h = this && this.__values || function(t) {
var o = "function" == typeof Symbol && Symbol.iterator, e = o && t[o], r = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && r >= t.length && (t = void 0);
return {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(o ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait = void 0;
var f = function(t) {
l(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.data = function() {
return {
sameMoreName: [],
isTrigger: !1,
round: 2,
followUpCanRun: !1,
followUpAlgorithmActualId: -1,
followUpBlockNames: [],
followUpBlockIds: [],
followUpSameIds: [],
followUpSource: hs.ClassAlgorithmSourceType.AlgoTrait,
followUpAlgorithmListSource: "normal",
sdkArgsActive: !1,
sdkFilterBlocks: [],
sdkOverTime: 0,
sdkPassThroughAlgoName: [],
sdkLimitSmall: void 0
};
};
o.prototype.onPostprocessConditionContext = function(t) {
var o = this;
this.refreshFollowUpContextFromFlow(t);
this.refreshFollowUpPreparedState();
return buildLazyConditionContext({
isClassGameMode: function() {
return ASContext(hs.gameInfo.gameMode === hs.GameMode.Class, "无尽（Class）模式");
},
canRunAlgoFollowUp: function() {
return ASContext(o.state.followUpCanRun, "两轮相似块 FollowUp 是否需要重新出块");
}
});
};
o.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isClassGameMode",
operator: "=",
value: !0
}, {
fact: "canRunAlgoFollowUp",
operator: "=",
value: !0
} ],
event: {
type: "runAlgoFollowUp"
}
},
flow: "followUpDone",
platform: "ios"
} ];
};
o.prototype.onPostprocessActions = function() {
return {
followUpDone: []
};
};
o.prototype.runAlgoFollowUp = function() {
var t;
return a(this, void 0, Promise, function() {
var o, e, r, l, i, n, a, u, h, f, p, d, m, g;
return s(this, function(s) {
switch (s.label) {
case 0:
o = new Date().getTime();
e = 0;
s.label = 1;

case 1:
return e < 6 ? [ 4, this.prepareFollowUp() ] : [ 3, 7 ];

case 2:
r = s.sent(), l = r.algorithmIndex, i = r.algorArgs;
if (-1 === l) return [ 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(l, "后续策略连轮相似");
if (!(new Date().getTime() - o > 100 || 5 === e)) return [ 3, 4 ];
n = hs.algorithmName.algoActualId;
as.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch.patch(hs.OFFER_TYPE.SUI_JI_WU_SI, this);
if (null === (t = null == i ? void 0 : i.extra) || void 0 === t ? void 0 : t.feature) {
a = !1;
(null == (u = TRAIT("CTRefactorRemoveAll23Trait")) ? void 0 : u.active) && "limitSmall" === u.getLimitSmallBlock() && (a = !0);
(null == (h = TRAIT("CTRefactorFillFunctionTrait")) ? void 0 : h.active) && "limitSmall" === h.getLimitSmallBlock() && (a = !0);
(null == (f = TRAIT("CTRefactorBlockLimitLevelTrait")) ? void 0 : f.active) && "limitSmall" === f.getLimitSmallBlock() && (a = !0);
(null == (p = TRAIT("CTRefactorBlockLimitClassicsTrait")) ? void 0 : p.active) && "limitSmall" === p.getLimitSmallBlock() && (a = !0);
i.extra.feature.limitSmall = a;
}
as.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch.patch(n, this);
return [ 4, this.requestFollowUpSDK(hs.OFFER_TYPE.SUI_JI_WU_SI, i) ];

case 3:
s.sent();
return [ 2 ];

case 4:
return [ 4, this.requestFollowUpSDK(l, i) ];

case 5:
if ((null == (d = s.sent()) ? void 0 : d.SDK_SUCCESS) && ((m = hs.algorithmName.algoActualId) === hs.OFFER_TYPE.SHANG_ZENG_3 || m === hs.OFFER_TYPE.SHANG_ZENG_4 || m === hs.OFFER_TYPE.SHANG_ZEND_MEDIUM)) {
g = [ hs.ALGO_NAME_TYPE.NAME_NODIE, hs.ALGO_NAME_TYPE.NAME_NODIE, hs.ALGO_NAME_TYPE.NAME_NODIE ];
as.AlgorithmStrategyAlgoActualNamePatch.patch(g, this);
this.setState({
followUpBlockNames: c(g)
});
this.refreshFollowUpPreparedState();
}
s.label = 6;

case 6:
e++;
return [ 3, 1 ];

case 7:
return [ 2 ];
}
});
});
};
o.prototype.prepareFollowUp = function() {
return a(this, void 0, Promise, function() {
var t, o, e, r, l, i, n;
return s(this, function(a) {
switch (a.label) {
case 0:
t = -1;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return [ 2, {
algorithmIndex: t,
algorArgs: null
} ];
if (this.state.isTrigger) return [ 2, {
algorithmIndex: t,
algorArgs: null
} ];
o = this.state.followUpAlgorithmActualId;
e = this.state.followUpBlockNames;
this.state.followUpBlockIds;
if (!this.state.followUpCanRun) return [ 3, 2 ];
if (!((r = this.state.followUpSameIds).length >= 2)) return [ 3, 2 ];
!((l = hs.algorithmDataStatistics.algorithmDataStatistics).length >= 1) || l[l.length - 1].blocksList;
!(l.length >= 2) || l[l.length - 2].blocksList;
2 == this.state.round || this.state.round;
t = o;
i = {
algorithmId: o,
source: this.state.followUpSource,
traitSource: this.traitName,
algorithmListSource: this.state.followUpAlgorithmListSource
};
return [ 4, as.AlgorithmStrategyAlgoItemSdkArgsPatch.patch(i, [], this) ];

case 1:
(n = a.sent()).filterBlocks = r;
n.overTime = 100;
if (o == hs.OFFER_TYPE.IOS_FILL_BLANK_BIT || o == hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU) {
0 == this.state.sameMoreName.length && (this.state.sameMoreName = c(e));
n.extra.passThroughAlgoName = c(e);
}
return [ 2, {
algorithmIndex: t,
algorArgs: n
} ];

case 2:
return [ 2, {
algorithmIndex: t,
algorArgs: null
} ];
}
});
});
};
o.prototype.requestFollowUpSDK = function(t, o) {
return a(this, void 0, Promise, function() {
var e, r;
return s(this, function(l) {
switch (l.label) {
case 0:
e = {
algorithmId: t,
source: this.state.followUpSource,
traitSource: this.traitName,
algorithmListSource: this.state.followUpAlgorithmListSource
};
return [ 4, as.AlgorithmStrategyAlgoSdkRequestPatch.patch(null != o ? o : {}, e, this) ];

case 1:
r = l.sent();
this.refreshFollowUpContextFromSDK(r);
this.refreshFollowUpPreparedState();
return [ 2, r ];
}
});
});
};
o.prototype.refreshFollowUpContextFromFlow = function(t) {
var o, e, r, l, i, n, a, s, u, h;
this.setState({
followUpAlgorithmActualId: null !== (e = null === (o = null == t ? void 0 : t.sdk) || void 0 === o ? void 0 : o.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch) && void 0 !== e ? e : hs.algorithmName.algoActualId,
followUpBlockNames: c(null !== (l = null === (r = null == t ? void 0 : t.sdk) || void 0 === r ? void 0 : r.blockNames) && void 0 !== l ? l : hs.algorithmName.algoActualName),
followUpBlockIds: c(null !== (n = null === (i = null == t ? void 0 : t.sdk) || void 0 === i ? void 0 : i.blockIds) && void 0 !== n ? n : hs.algorithmInfo.blockIdList),
followUpSource: null !== (s = null === (a = null == t ? void 0 : t.sdk) || void 0 === a ? void 0 : a.source) && void 0 !== s ? s : hs.ClassAlgorithmSourceType.AlgoTrait,
followUpAlgorithmListSource: null !== (h = null === (u = null == t ? void 0 : t.sdk) || void 0 === u ? void 0 : u.algorithmListSource) && void 0 !== h ? h : "normal"
});
};
o.prototype.refreshFollowUpContextFromSDK = function(t) {
var o, e, r, l, i;
this.setState({
followUpAlgorithmActualId: null !== (o = null == t ? void 0 : t.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch) && void 0 !== o ? o : hs.algorithmName.algoActualId,
followUpBlockNames: c(null !== (e = null == t ? void 0 : t.blockNames) && void 0 !== e ? e : hs.algorithmName.algoActualName),
followUpBlockIds: c(null !== (r = null == t ? void 0 : t.blockIds) && void 0 !== r ? r : hs.algorithmInfo.blockIdList),
followUpSource: null !== (l = null == t ? void 0 : t.source) && void 0 !== l ? l : hs.ClassAlgorithmSourceType.AlgoTrait,
followUpAlgorithmListSource: null !== (i = null == t ? void 0 : t.algorithmListSource) && void 0 !== i ? i : "normal"
});
};
o.prototype.refreshFollowUpPreparedState = function() {
var t = this.state.followUpAlgorithmActualId, o = !1, e = [];
hs.gameInfo.gameMode !== hs.GameMode.Class || this.state.isTrigger || t != hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU && t != hs.OFFER_TYPE.IOS_FILL_BLANK_BIT && t != hs.OFFER_TYPE.SHANG_ZENG_3 && t != hs.OFFER_TYPE.KUN_NAN_NAN_TI && t != hs.OFFER_TYPE.ZHI_JUE_NAN_TI && t != hs.OFFER_TYPE.SHANG_ZENG_4 && t != hs.OFFER_TYPE.SHANG_ZENG_4_IOS && t != hs.OFFER_TYPE.SHANG_ZEND_MEDIUM && t != hs.OFFER_TYPE.ALL_COMBINATION_ID70 && t != hs.OFFER_TYPE.ALL_COMBINATION_ID9 || t == hs.OFFER_TYPE.SHANG_ZENG_4_IOS && this.state.followUpBlockNames.some(function(t) {
return "随机" == t;
}) || (o = (e = this.comparePreOut(this.state.followUpBlockIds)).length >= 2);
this.setState({
followUpCanRun: o,
followUpSameIds: e
});
};
o.prototype.comparePreOut = function(t) {
var o = hs.algorithmDataStatistics.algorithmDataStatistics, e = o.length >= 1 ? o[o.length - 1].blocksList : [], r = o.length >= 2 ? o[o.length - 2].blocksList : [];
switch (this.state.round) {
case 2:
if (0 == e.length) return [];
break;

case 3:
if (0 == e.length || 0 == r.length) return [];
}
var l = function(t, o) {
var e, r, l, i, n = {}, a = [];
try {
for (var s = h(t), u = s.next(); !u.done; u = s.next()) n[p = u.value] = (n[p] || 0) + 1;
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (r = s.return) && r.call(s);
} finally {
if (e) throw e.error;
}
}
try {
for (var c = h(o), f = c.next(); !f.done; f = c.next()) {
var p;
if (n[p = f.value] > 0) {
a.push(p);
n[p]--;
}
}
} catch (t) {
l = {
error: t
};
} finally {
try {
f && !f.done && (i = c.return) && i.call(c);
} finally {
if (l) throw l.error;
}
}
return a;
}, i = l(t, e);
if (i.length >= 2) return i.slice(0, 2);
if (3 == this.state.round) {
var n = l(t, r);
if (n.length >= 2) return n.slice(0, 2);
}
return [];
};
o.prototype.onAlgorithmStrategyRoundInit = function() {
this.setState({
sameMoreName: [],
isTrigger: !1,
followUpCanRun: !1,
followUpAlgorithmActualId: -1,
followUpBlockNames: [],
followUpBlockIds: [],
followUpSameIds: [],
followUpSource: hs.ClassAlgorithmSourceType.AlgoTrait,
followUpAlgorithmListSource: "normal",
sdkArgsActive: !1,
sdkFilterBlocks: [],
sdkOverTime: 0,
sdkPassThroughAlgoName: [],
sdkLimitSmall: void 0
});
};
o.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
followUpSdkArgsActive: function() {
return ASContext(t.state.sdkArgsActive, "两轮相似块 FollowUp：注入 SDK 参数");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "followUpSdkArgsActive",
operator: "=",
value: !0
},
flow: "injectFollowUpSDKArgs",
platform: "ios"
} ];
};
o.prototype.onSDKArgsActions = function() {
var t = this;
return {
injectFollowUpSDKArgs: function() {
var o = t.state.sdkPassThroughAlgoName, e = t.state.sdkLimitSmall, r = i(i({
filterBlocks: t.state.sdkFilterBlocks,
overTime: t.state.sdkOverTime
}, void 0 !== e && {
limitSmall: e
}), o.length > 0 && {
extra: {
traits: {
passThroughAlgoName: o
}
}
});
t.setState({
sdkArgsActive: !1,
sdkFilterBlocks: [],
sdkOverTime: 0,
sdkPassThroughAlgoName: [],
sdkLimitSmall: void 0
});
return r;
},
else: function() {
t.setState({
sdkArgsActive: !1,
sdkFilterBlocks: [],
sdkOverTime: 0,
sdkPassThroughAlgoName: [],
sdkLimitSmall: void 0
});
return {};
}
};
};
return n([ classId("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait" ]);
//# sourceMappingURL=index.js.map
