window.__require = function e(t, r, o) {
function a(n, l) {
if (!r[n]) {
if (!t[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!t[c]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var u = r[n] = {
exports: {}
};
t[n][0].call(u.exports, function(e) {
return a(t[n][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorCollectIncreaseTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "f67af7x2YRGB5JVG18HaFv3", "CTRefactorCollectIncreaseTrait");
var o, a = this && this.__extends || (o = function(e, t) {
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
var a, i = arguments.length, n = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var l = e.length - 1; l >= 0; l--) (a = e[l]) && (n = (i < 3 ? a(n) : i > 3 ? a(t, r, n) : a(t, r)) || n);
return i > 3 && n && Object.defineProperty(t, r, n), n;
}, n = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, a, i = r.call(e), n = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = i.next()).done; ) n.push(o.value);
} catch (e) {
a = {
error: e
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (a) throw a.error;
}
}
return n;
}, l = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(n(arguments[t]));
return e;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorCollectIncreaseTrait = void 0;
var c = function(e) {
a(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.accumulatedPassLevel = 0;
t.accumulatedTargetPassLevel = 3;
t.isTravelingHardModelOrNewBlockDrama = !1;
t.collectIncreaseDottingNum = 0;
return t;
}
t.prototype.isTrigger = function() {
return this.isTravelingHardModelOrNewBlockDrama;
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isTrigger: function() {
return ASContext(e.isTrigger(), "是否触发特性");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
priority: [ {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
}, {
fact: "chapterRoundNum",
operator: ">",
value: 1
} ]
},
event: {
type: "registerAlgorithmNameMappings"
},
flow: "flow1"
} ]
};
};
t.prototype.registerAlgorithmNameMappings = function() {
var e = TRAIT("CTRefactorAlgorithmStrategyIOSNameInfoTrait");
if (null == e ? void 0 : e.active) {
e.addAlgorithmNameMapping(hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4, "CTRefactorCollectIncreaseTrait", null, "困难难题,困难难题,困难难题", hs.OFFER_TYPE.KUN_NAN_TI);
e.addAlgorithmNameMapping(hs.OFFER_TYPE.SUI_JI_WU_SI, "CTRefactorCollectIncreaseTrait", null, null, hs.OFFER_TYPE.SUI_JI_WU_SI);
}
};
t.prototype.onPreprocessActions = function() {
var e = hs.algorithmStrategyIOSDifficultRefactoredInfo.offerNoBitKunNanNanTi();
return {
priority: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmPriorityListOperator",
type: "replaceAll",
args: [ l(e, [ hs.OFFER_TYPE_BASE.SUI_JI_WU_SI ]) ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState"
} ]
}
};
};
t.prototype.onAlgorithmStrategyCollectionAdjust = function() {
if (this.isTravelingHardModelOrNewBlockDrama && hs.algorithmName.algoActualId === hs.OFFER_TYPE.IOS_KUN_NAN_HARD_LEVEL_4) {
var e = hs.chapterAlgorithmInfo.blockIdList;
if (Array.isArray(e) && !(e.length < 3)) {
var t = [ [], [], [] ], r = hs.chapterCollectInfo.remainCollections.filter(function(e) {
return e.Value > 0;
});
if (r && r.length) {
r.sort(function(e, t) {
return t.Value - e.Value;
});
var o = hs.AlgorithmPosType[e[1]];
if (!o) return;
for (var a = o.length, i = 0; i < a; i++) if (r[0] && r[0].Key) {
var n = r[0].Key, l = i;
t[1].push({
Key: n,
pos: l
});
}
}
if (r && r.length >= 3) {
var c = r.slice(1);
c.sort(function() {
return Math.random() - .5;
});
if (c && c.length) {
var s = hs.AlgorithmPosType[e[0]];
if (!s) return;
var u = s.length;
for (i = 0; i < u; i++) if (c[0] && c[0].Key) {
n = c[0].Key, l = i;
t[0].push({
Key: n,
pos: l
});
}
var f = hs.AlgorithmPosType[e[2]];
if (!f) return;
var p = f.length;
for (i = 0; i < p; i++) if (c[1] && c[1].Key) {
n = c[1].Key, l = i;
t[2].push({
Key: n,
pos: l
});
}
}
}
for (var h = [], g = function(e) {
if (t[e].length > 0) {
var r = {};
t[e].forEach(function(e) {
r[e.pos] = e;
});
h.push(r);
} else h.push({});
}, y = 0; y < t.length; y++) g(y);
return {
data: h,
disableTraits: [ "CTRefactorMultiElementCollectTrait", "CTRefactorMultiElementCollect_TravelAlgorithmLayerTrait", "CTRefactorMultiElementCollect_TravelConfigLayerTrait", "CTRefactorCollectionOriginTrait" ]
};
}
}
};
t.prototype.isChapterCollectWinOnClickPlay = function() {
this.accumulatedPassLevel++;
};
t.prototype.isChapterCollectionProducer_ProxyOnChapterDefaultBoardReadyComplete = function() {
this.checkTravelingHardModelOrNewBlockDrama();
};
t.prototype.checkTravelingHardModelOrNewBlockDrama = function() {
this.isTravelingHardModelOrNewBlockDrama = !1;
if (hs.chapterGameInfo.chapterCondition && hs.chapterGameInfo.chapterCondition.Way != hs.ChapterType.score) {
this.isTravelingHardModelOrNewBlockDrama = this.accumulatedPassLevel >= this.accumulatedTargetPassLevel;
if (this.isTravelingHardModelOrNewBlockDrama) {
this.accumulatedPassLevel = 0;
this.collectIncreaseDottingNum = 1;
} else this.collectIncreaseDottingNum = 0;
}
};
return i([ classId("CTRefactorCollectIncreaseTrait") ], t);
}(Trait);
r.CTRefactorCollectIncreaseTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCollectIncreaseTrait" ]);
//# sourceMappingURL=index.js.map
