window.__require = function t(e, o, r) {
function n(a, s) {
if (!o[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var f = o[a] = {
exports: {}
};
e[a][0].call(f.exports, function(t) {
return n(e[a][1][t] || t);
}, f, f.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
CTRefactorFeatPerfectTranslateTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "6fee9C/bNBNML+1qXzfNUpt", "CTRefactorFeatPerfectTranslateTrait");
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
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorFeatPerfectTranslateTrait = void 0;
var a = {
roundNum: -1,
blockIdx: -1,
blockId: 0
}, s = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
idx: -1,
tType: "",
blockList: [],
blockNames: []
};
};
e.prototype.isClassAlgorithmLifeCycle_Revive_ProxyOnRevive_Success = function() {
storage.setItem("FeatPerfectTranslateKey", a);
};
e.prototype.onPostprocessConditionContext = function(t) {
var e = this, o = !1, r = -1, n = function() {
if (!o) {
o = !0;
var n = e._computeTargetIdx(t);
r = n.idx;
if (-1 == n.idx) return r;
e.state.idx = n.idx;
e.state.tType = n.tType;
e.state.blockList = n.blockList;
e.state.blockNames = n.blockNames;
}
return r;
};
return buildLazyConditionContext({
canRunAfterOffer: function() {
return ASContext(e.canRunAfterOffer(t), "是否可运行 After 后置段");
},
hasTarget: function() {
return ASContext(-1 !== n(), "有可替换目标块");
}
});
};
e.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "canRunAfterOffer",
operator: "=",
value: !0
}, {
fact: "hasTarget",
operator: "=",
value: !0
} ]
},
flow: "replaceFeat",
platform: "ios",
gameMode: "class"
} ];
};
e.prototype.onPostprocessActions = function() {
return {
replaceFeat: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE_BASE.FEAT_PERFECT_TRANSLATE ]
} ]
};
};
e.prototype.canRunAfterOffer = function() {
return !(1 === hs.storage.getItem("classRoundNum", 0)) || hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1 !== hs.ClassAlgorithmSourceType.AlgoFirstRound;
};
e.prototype.onSDKArgsConditionContext = function(t, e, o) {
var r = (null == o ? void 0 : o.algorithmId) === hs.OFFER_TYPE_BASE.FEAT_PERFECT_TRANSLATE;
return buildLazyConditionContext({
isFeatPerfect: function() {
return ASContext(r, "是否完美契合算法");
}
});
};
e.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isFeatPerfect",
operator: "=",
value: !0
},
flow: "injectArgs"
} ];
};
e.prototype.onSDKArgsActions = function() {
var t = this;
return {
injectArgs: function() {
return {
blockIds: t.state.blockList.concat(),
blockNames: t.state.blockNames.concat(),
extra: {
traits: {
idx: t.state.idx
}
}
};
}
};
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
if (t && e.algorithmId === hs.OFFER_TYPE_BASE.FEAT_PERFECT_TRANSLATE) {
var o = this.state.blockNames.concat();
as.AlgorithmStrategyAlgoActualNamePatch.patch(o, this);
if (this.props.blockName && this.state.idx >= 0 && o[this.state.idx]) {
o[this.state.idx] = this.props.blockName;
as.AlgorithmStrategyAlgoActualNamePatch.patch(o, this);
}
var r = storage.getItem("FeatPerfectTranslateKey", a);
r.roundNum = hs.classGameInfo.roundNum;
r.blockIdx = this.state.idx;
r.blockId = e.blockIds[this.state.idx];
storage.setItem("FeatPerfectTranslateKey", r);
}
};
e.prototype.isOnlyFillOffer = function() {
return !1;
};
e.prototype.isNoFillOffer = function() {
return !1;
};
e.prototype.packagePoint_BlockEnd = function() {
if (this.props.difficultRate > 0) {
var t = storage.getItem("FeatPerfectTranslateKey", a);
if ((null == t ? void 0 : t.roundNum) === hs.classGameInfo.roundNum && hs.classAlgorithmInfo.blockIdList[t.blockIdx] == t.blockId) return {
not_hard_blocks: t.blockIdx
};
}
return {};
};
e.prototype.packagePoint_TouchEnd = function() {
if ("number" == typeof this.props.difficultRate) {
var t = storage.getItem("FeatPerfectTranslateKey", a);
if (t.roundNum > 0) return {
not_hard_blocks: t.blockIdx
};
}
return {};
};
e.prototype._computeTargetIdx = function(t) {
var e, o, r, n, i, a, s, c, l, f, u = new hs.BinaryBoard();
u.convertToBinaryBoard(hs.boardInfo.faceBlocks);
u.record();
var d, p = 0, _ = (null !== (o = null === (e = null == t ? void 0 : t.sdk) || void 0 === e ? void 0 : e.blockIds) && void 0 !== o ? o : []).concat(), h = (null !== (n = null === (r = null == t ? void 0 : t.sdk) || void 0 === r ? void 0 : r.blockNames) && void 0 !== n ? n : []).concat();
if (3 !== _.length || 0 === h.length) return {
idx: -1,
tType: "",
blockList: [],
blockNames: []
};
for (var T = 0; T < _.length; T++) {
var F = _[T];
if (!(F > 0)) return {
idx: -1,
tType: "",
blockList: [],
blockNames: []
};
var E = null === (i = algo.ShapeInfo.getConfig(F)) || void 0 === i ? void 0 : i.count;
if (p < E) {
f = T;
p = E;
}
void 0 !== d || u.canPut(F) || (d = T);
}
var R = -1, v = "", y = !1, N = !1;
this.isOnlyFillOffer() ? N = !this.isNoFillOffer() : y = this.isNoFillOffer();
for (T = 0; T < h.length; T++) {
var g = h[T];
v = g;
if (g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.TIAN_KONG_XIAO_CHU]) {
if (y) continue;
R = T;
break;
}
if (!N) {
if (g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.SHANG_ZENG_1] || g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.SHANG_ZENG_3] || (null === (a = this.props) || void 0 === a ? void 0 : a.diffChange) && g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN]) {
R = null != f ? f : -1;
break;
}
if (g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.KUN_NAN_TI] || g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.KUN_NAN_NAN_TI] || (null === (s = this.props) || void 0 === s ? void 0 : s.diffChange) && g != hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_DIFFICULT_DOWN] && (g + "").includes(hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.ALGO_NAN_TI])) {
R = null != d ? d : -1;
var A = Math.random();
if (void 0 !== (null === (c = this.props) || void 0 === c ? void 0 : c.difficultRate) && A >= (null === (l = this.props) || void 0 === l ? void 0 : l.difficultRate)) return {
idx: -1,
tType: "",
blockList: [],
blockNames: []
};
break;
}
if (g == hs.OFFER_TYPE_STRINGS[hs.OFFER_TYPE.SUI_JI_WU_SI]) {
R = T;
break;
}
}
}
return {
idx: R,
tType: v,
blockList: _,
blockNames: h
};
};
return i([ classId("CTRefactorFeatPerfectTranslateTrait"), classMethodWatch() ], e);
}(Trait);
o.CTRefactorFeatPerfectTranslateTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFeatPerfectTranslateTrait" ]);
//# sourceMappingURL=index.js.map
