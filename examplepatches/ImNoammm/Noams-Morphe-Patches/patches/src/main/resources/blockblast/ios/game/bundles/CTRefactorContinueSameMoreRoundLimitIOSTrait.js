window.__require = function t(e, o, r) {
function n(a, s) {
if (!o[a]) {
if (!e[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var c = o[a] = {
exports: {}
};
e[a][0].call(c.exports, function(t) {
return n(e[a][1][t] || t);
}, c, c.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
CTRefactorContinueSameMoreRoundLimitIOSTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "16ed6aJhwdKQoKJEhqB9nsN", "CTRefactorContinueSameMoreRoundLimitIOSTrait");
var r, n = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, o, a) : n(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
}, a = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, o = e && t[e], r = 0;
if (o) return o.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && r >= t.length && (t = void 0);
return {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, s = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, i = o.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(s(arguments[e]));
return t;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorContinueSameMoreRoundLimitIOSTrait = void 0;
var u = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
round: 2,
isTrigger: !1,
sameMoreName: [],
isContinumID70Use: !1,
isDealID70: !1,
newBlockIds: [],
replacePosIndex: 0,
filterBlockIds: []
};
};
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return hs.gameInfo.gameMode == hs.GameMode.Class && hs.algorithmInfo.blockIdList.length >= 3;
},
enumerable: !1,
configurable: !0
});
e.prototype.isCTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTraitOnReplaceCheck = function(t) {
this.onOnReplaceCheck(t);
};
e.prototype.onBottomOfferBefore = function() {
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
if (this.state.isTrigger) return !1;
this.setState({
isDealID70: !1
});
if ((hs.algorithmName.algoActualId === hs.OFFER_TYPE.ALL_COMBINATION_ID70 || hs.algorithmName.algoActualId == hs.OFFER_TYPE.ALL_COMBINATION_ID9) && this.comparePreOut().length >= 2) {
this.setState({
isContinumID70Use: !0
});
return !0;
}
return !1;
};
e.prototype.onOnReplaceCheck = function(t) {
var e, o;
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
var r = TRAIT("CTRefactorContinueSameMoreRoundLimitIOSFollowUpTrait");
if (!((null == r ? void 0 : r.active) && r.state.isTrigger) && this.updateReplaceCheck(!0)) {
var n = hs.algorithmInfo.blockIdList;
if (hs.algorithmIOSGameInfo.checkIdsArr(n) && !n.some(function(t) {
return t > 42;
})) {
var i = this.comparePreOut();
if (!(i.length < 2)) {
var s = null;
this.state.replacePosIndex = -1;
2 == i.length && (s = i[0]);
this.state.replacePosIndex = hs.algorithmInfo.blockIdList.indexOf(s);
this.state.newBlockIds = hs.algorithmInfo.blockIdList;
this.state.newBlockIds.splice(this.state.newBlockIds.indexOf(s), 1);
this.state.filterBlockIds = [];
try {
for (var l = a(i), u = l.next(); !u.done; u = l.next()) {
var c = u.value;
this.state.filterBlockIds.push(c);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (o = l.return) && o.call(l);
} finally {
if (e) throw e.error;
}
}
t.args[0] = hs.OFFER_TYPE.REPLACE_ROUNDLIMIT;
t.args[1] = hs.OFFER_TYPE.SUI_JI_WU_SI;
}
}
}
}
};
e.prototype.comparePreOut = function() {
var t = hs.algorithmDataStatistics.algorithmDataStatistics, e = hs.algorithmInfo.blockIdList, o = t.length >= 1 ? t[t.length - 1].blocksList : [], r = t.length >= 2 ? t[t.length - 2].blocksList : [];
switch (this.state.round) {
case 2:
if (0 == o.length) return [];
break;

case 3:
if (0 == o.length || 0 == r.length) return [];
}
var n = function(t, e) {
var o, r, n, i, s = {}, l = [];
try {
for (var u = a(t), c = u.next(); !c.done; c = u.next()) s[d = c.value] = (s[d] || 0) + 1;
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (r = u.return) && r.call(u);
} finally {
if (o) throw o.error;
}
}
try {
for (var f = a(e), h = f.next(); !h.done; h = f.next()) {
var d;
if (s[d = h.value] > 0) {
l.push(d);
s[d]--;
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
h && !h.done && (i = f.return) && i.call(f);
} finally {
if (n) throw n.error;
}
}
return l;
}, i = n(e, o);
if (i.length >= 2) return i.slice(0, 2);
if (3 == this.state.round) {
var s = n(e, r);
if (s.length >= 2) return s.slice(0, 2);
}
return [];
};
e.prototype.updateReplaceCheck = function(t) {
var e = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait");
if (null == e ? void 0 : e.active) {
if (3 != hs.algorithmName.algoActualName.length) return !1;
var o = s(hs.algorithmName.algoActualName, 3), r = o[0], n = o[1], i = o[2];
if (r !== n || n !== i) return t;
if ([ "D1", "D2", "D3", "D4", "D5", "D6", "间隔放置难题", "极端难题", "连续边数少难题", "多活路难题", "干扰难题", "困难难题", "死亡难题", "直觉难题", "迷惑难题", "骨牌难题", "不容易被发现的困难难题", "极其困难难题", "多消困难难题", "顺序难题", "小块难题", "组合放置困难难题", "简单直觉题", "十字消除难题", "难题概率", "随机难题", "斜向块难题" ].includes(r)) return !1;
}
return t;
};
e.prototype.canRunAfterOffer = function(t) {
var e, o, r, n;
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return {
isRunAfterOffer: !1,
reTryAlgoID: null
};
this.state.isDealID70 = !1;
var i = null !== (o = null === (e = null == t ? void 0 : t.sdk) || void 0 === e ? void 0 : e.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch) && void 0 !== o ? o : hs.algorithmName.algoActualId;
if ((i == hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU || i == hs.OFFER_TYPE.IOS_FILL_BLANK_BIT || i == hs.OFFER_TYPE.SHANG_ZENG_3 || i == hs.OFFER_TYPE.KUN_NAN_NAN_TI || i == hs.OFFER_TYPE.ZHI_JUE_NAN_TI || i == hs.OFFER_TYPE.SHANG_ZENG_4 || i == hs.OFFER_TYPE.SHANG_ZENG_4_IOS || i == hs.OFFER_TYPE.SHANG_ZEND_MEDIUM || i == hs.OFFER_TYPE.ALL_COMBINATION_ID70 || i == hs.OFFER_TYPE.ALL_COMBINATION_ID9) && this.comparePreOut().length >= 2) {
var a = hs.algorithmDataStatistics.algorithmDataStatistics;
a.length >= 1 && a[a.length - 1].blocksList, a.length >= 2 && a[a.length - 2].blocksList;
2 == this.state.round || this.state.round;
this.state.sameMoreName = [];
this.state.isContinumID70Use = !0;
i != hs.OFFER_TYPE.IOS_FILL_BLANK_BIT && i != hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU || (this.state.sameMoreName = l(null !== (n = null === (r = null == t ? void 0 : t.sdk) || void 0 === r ? void 0 : r.blockNames) && void 0 !== n ? n : hs.algorithmName.algoActualName));
return {
isRunAfterOffer: !0,
reTryAlgoID: i
};
}
return {
isRunAfterOffer: !1,
reTryAlgoID: null
};
};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
var r = (null == o ? void 0 : o.algorithmId) === hs.OFFER_TYPE.REPLACE_ROUNDLIMIT, n = this.state.isContinumID70Use;
this._flow = t;
return buildLazyConditionContext({
isReplaceRoundLimitAndContinueID70: function() {
return ASContext(r && n, "替换 REPLACE_ROUNDLIMIT 并继续 ID70");
},
isOnlyReplaceRoundLimit: function() {
return ASContext(r && !n, "仅替换 REPLACE_ROUNDLIMIT");
},
isContinueID70: function() {
return ASContext(!r && n, "仅 ID70");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isReplaceRoundLimitAndContinueID70",
operator: "=",
value: !0
},
flow: "patchReplaceAndContinueID70Info"
}, {
conditions: {
fact: "isOnlyReplaceRoundLimit",
operator: "=",
value: !0
},
flow: "patchReplaceInfo"
}, {
conditions: {
fact: "isContinueID70",
operator: "=",
value: !0
},
flow: "patchContinueInfo"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = this;
return {
patchReplaceAndContinueID70Info: function() {
var e, o, r, n, i, a = {
blockIds: l(t.state.newBlockIds),
blockNames: l(hs.algorithmName.algoActualName),
filterBlocks: l(t.state.filterBlockIds)
};
if (3 == (null === (r = null === (o = null === (e = t._flow) || void 0 === e ? void 0 : e.sdk) || void 0 === o ? void 0 : o.blockIds) || void 0 === r ? void 0 : r.length) && -1 != t.state.replacePosIndex) {
var s = l(null === (i = null === (n = t._flow) || void 0 === n ? void 0 : n.sdk) || void 0 === i ? void 0 : i.blockIds).filter(function(e, o) {
return o !== t.state.replacePosIndex;
});
a.blockPoses = s;
}
if (t.state.isContinumID70Use) {
var u = t.comparePreOut();
a.filterBlocks = u;
a.overTime = 100;
t.state.sameMoreName.length > 0 && (a.extra = {
traits: {
passThroughAlgoName: t.state.sameMoreName
}
});
}
t.setState({
isContinumID70Use: !1
});
return a;
},
patchReplaceInfo: function() {
var e, o, r, n, i, a = {
blockIds: l(t.state.newBlockIds),
blockNames: l(hs.algorithmName.algoActualName),
filterBlocks: l(t.state.filterBlockIds)
};
if (3 == (null === (r = null === (o = null === (e = t._flow) || void 0 === e ? void 0 : e.sdk) || void 0 === o ? void 0 : o.blockIds) || void 0 === r ? void 0 : r.length) && -1 != t.state.replacePosIndex) {
var s = l(null === (i = null === (n = t._flow) || void 0 === n ? void 0 : n.sdk) || void 0 === i ? void 0 : i.blockIds).filter(function(e, o) {
return o !== t.state.replacePosIndex;
});
a.blockPoses = s;
}
return a;
},
patchContinueInfo: function() {
if (t.state.isContinumID70Use) {
t.setState({
isContinumID70Use: !1
});
var e = {
filterBlocks: t.comparePreOut(),
overTime: 100
};
t.state.sameMoreName.length > 0 && (e.extra = {
traits: {
passThroughAlgoName: t.state.sameMoreName
}
});
return e;
}
}
};
};
return i([ classId("CTRefactorContinueSameMoreRoundLimitIOSTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorContinueSameMoreRoundLimitIOSTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueSameMoreRoundLimitIOSTrait" ]);
//# sourceMappingURL=index.js.map
