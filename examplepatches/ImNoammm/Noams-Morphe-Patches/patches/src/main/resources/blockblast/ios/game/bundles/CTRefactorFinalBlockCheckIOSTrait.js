window.__require = function t(e, r, o) {
function n(s, a) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var u = r[s] = {
exports: {}
};
e[s][0].call(u.exports, function(t) {
return n(e[s][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
CTRefactorFinalBlockCheckIOSTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "8bb75RkFIJDHqp/9Jm9fiv7", "CTRefactorFinalBlockCheckIOSTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
}, s = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(n, i) {
function s(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(s, a);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, o, n, i, s = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
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
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;s; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
s.label++;
return {
value: i[1],
done: !1
};

case 5:
s.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = s.ops.pop();
s.trys.pop();
continue;

default:
if (!(n = s.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
s = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
s.label = i[1];
break;
}
if (6 === i[0] && s.label < n[1]) {
s.label = n[1];
n = i;
break;
}
if (n && s.label < n[2]) {
s.label = n[2];
s.ops.push(i);
break;
}
n[2] && s.ops.pop();
s.trys.pop();
continue;
}
i = e.call(t, s);
} catch (t) {
i = [ 6, t ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, c = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, n, i = r.call(t), s = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) s.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFinalBlockCheckIOSTrait = void 0;
var l = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
return s(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.runFinalBlockCheck(t) ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
e.prototype.isValidBlockList = function(t) {
return Array.isArray(t) && 3 === t.length && t.every(function(t) {
return null != t && t > 0;
});
};
e.prototype.runFinalBlockCheck = function(t) {
return s(this, void 0, Promise, function() {
var e;
return a(this, function(r) {
switch (r.label) {
case 0:
if (!t || !this.canRunFinalCheck()) return [ 2 ];
if (3 === (e = this.getFlowBlockIdList(t)).length) {
e = hs.algorithmStrategyLogic.delCurrentSameBlock(e);
this.patchBlockIdList(e, t);
}
return [ 4, this.saveReplaceStep1(t) ];

case 1:
r.sent();
e = this.getFlowBlockIdList(t);
if (this.isAllBlockCannotPut(e)) {
e[1] = hs.algorithmStrategyLogic.produceRandomId(e[1]);
this.patchBlockIdList(e, t);
}
return [ 4, this.saveReplaceStep2(t) ];

case 2:
r.sent();
return [ 4, this.onSaveBottomhistoryBlock(t) ];

case 3:
r.sent();
return [ 4, this.fallBackPlan(t) ];

case 4:
r.sent();
return [ 4, this.saveReplaceFinalStep(t) ];

case 5:
r.sent();
e = this.getFlowBlockIdList(t);
hs.algorithmIOSGameInfo.checkIdsArr(e) || this.reportInvalidBlockIds("601", e);
r.label = 6;

case 6:
r.trys.push([ 6, 7, , 9 ]);
if (3 !== (e = null != e ? e : []).length || e.some(function(t) {
return null == t || t <= 0 || t > 51;
})) {
e = [ 5, 5, 5 ];
as.AlgorithmStrategyAlgoActualNamePatch.patch([ "保命大兜底", "保命大兜底", "保命大兜底" ], this);
}
as.AlgorithmStrategyAlgoBlockIdListPatch.patch(e, this);
return [ 3, 9 ];

case 7:
r.sent();
this.reportInvalidBlockIds("602", e);
return [ 4, this.fallbackSuijiWusi(t) ];

case 8:
r.sent();
return [ 3, 9 ];

case 9:
return [ 2 ];
}
});
});
};
e.prototype.canRunFinalCheck = function() {
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return !1;
if (1 === storage.getItem("classRoundNum", 0)) {
var t = hs.algorithmInfo.blockIdList;
if (0 == this.isValidBlockList(t)) {
as.AlgorithmStrategyAlgoActualNamePatch.patch([ "保命大兜底", "保命大兜底", "保命大兜底" ], this);
as.AlgorithmStrategyAlgoBlockIdListPatch.patch([ 5, 5, 5 ], this);
}
return !1;
}
return !this.isShieldedSaveBottomSource();
};
e.prototype.isShieldedSaveBottomSource = function() {
var t = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait");
if (!(null == t ? void 0 : t.active)) return !1;
var e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
return e === hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom || e === hs.ClassAlgorithmSourceType.AlgoRevive || e === hs.ClassAlgorithmSourceType.AlgoReviveTrait;
};
e.prototype.isAllBlockCannotPut = function(t) {
return !hs.algorithmStrategyLogic.canPutBlock(t[0]) && !hs.algorithmStrategyLogic.canPutBlock(t[1]) && !hs.algorithmStrategyLogic.canPutBlock(t[2]);
};
e.prototype.saveReplaceStep1 = function(t, e) {
return s(this, void 0, Promise, function() {
return a(this, function(r) {
switch (r.label) {
case 0:
if (!e) return [ 3, 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(e, "ios保命大兜底替换出块step1");
return [ 4, this.requestPostprocessAlgorithm(t, e) ];

case 1:
r.sent();
r.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.saveReplaceStep2 = function(t, e, r) {
void 0 === r && (r = !0);
return s(this, void 0, Promise, function() {
var o, n, i, s, l, u;
return a(this, function(a) {
switch (a.label) {
case 0:
if (!e) return [ 3, 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(e, "ios保命大兜底替换出块step2");
return [ 4, this.requestPostprocessAlgorithm(t, e) ];

case 1:
a.sent();
return [ 2 ];

case 2:
if (!(o = this.getFlowBlockIdList(t))) return [ 2 ];
n = c(o, 3), i = n[0], s = n[1], l = n[2];
i === s && i === l && r && ((null == (u = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait")) ? void 0 : u.active) ? o[1] = hs.algorithmStrategyLogic.produceRandomId(i, null, [], !1) : o[1] = hs.algorithmStrategyLogic.produceRandomId(i));
return [ 4, this.patchBlockIdList(o, t) ];

case 3:
a.sent();
return [ 2 ];
}
});
});
};
e.prototype.onSaveBottomhistoryBlock = function(t, e) {
return s(this, void 0, Promise, function() {
return a(this, function(r) {
switch (r.label) {
case 0:
if (!e) return [ 3, 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(e, "ios保命兜底历史盘面");
return [ 4, this.requestPostprocessAlgorithm(t, e) ];

case 1:
r.sent();
r.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.fallBackPlan = function(t) {
return s(this, void 0, Promise, function() {
var e;
return a(this, function(r) {
switch (r.label) {
case 0:
return (e = this.getFlowBlockIdList(t)) ? 0 !== e.length ? [ 3, 2 ] : [ 4, this.requestPostprocessAlgorithm(t, hs.OFFER_TYPE_BASE.SUI_JI, "fallback") ] : [ 2 ];

case 1:
r.sent();
r.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.saveReplaceFinalStep = function(t, e) {
return s(this, void 0, Promise, function() {
return a(this, function(r) {
switch (r.label) {
case 0:
if (!e) return [ 3, 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(e, "ios保命大兜底最终替换出块");
return [ 4, this.requestPostprocessAlgorithm(t, e) ];

case 1:
r.sent();
r.label = 2;

case 2:
return [ 2 ];
}
});
});
};
e.prototype.fallbackSuijiWusi = function(t) {
return s(this, void 0, Promise, function() {
return a(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.requestPostprocessAlgorithm(t, hs.OFFER_TYPE.SUI_JI_WU_SI, "fallback") ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
e.prototype.requestPostprocessAlgorithm = function(t, e, r) {
void 0 === r && (r = "normal");
return s(this, void 0, Promise, function() {
var o, n;
return a(this, function(i) {
switch (i.label) {
case 0:
if (!t) return [ 2 ];
o = {
algorithmId: e,
source: hs.ClassAlgorithmSourceType.AlgoTrait,
traitSource: this.traitName,
algorithmListSource: r
};
return [ 4, as.AlgorithmStrategyAlgoItemSdkArgsPatch.patch(o, [], this) ];

case 1:
n = i.sent();
return [ 4, as.AlgorithmStrategyAlgoSdkRequestPatch.patch(n, o, this) ];

case 2:
i.sent();
return [ 2 ];
}
});
});
};
e.prototype.getFlowBlockIdList = function() {
return hs.algorithmInfo.blockIdList;
};
e.prototype.patchBlockIdList = function(t, e) {
var r = as.AlgorithmStrategyAlgoBlockIdListPatch.patch(t, this);
e.sdk && (e.sdk.blockIds = t);
return r;
};
e.prototype.reportInvalidBlockIds = function(t, e) {
var r = t + "_v:" + hs.gameInfo.gameVersion + "_getIdArr:" + JSON.stringify(e) + "_currentWayName:" + hs.algorithmName.algoExpectedId + "_" + JSON.stringify(hs.algorithmName.algoActualName);
DS("gameLaunchProcess", {
id: r
});
};
return i([ classId("CTRefactorFinalBlockCheckIOSTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorFinalBlockCheckIOSTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFinalBlockCheckIOSTrait" ]);
//# sourceMappingURL=index.js.map
