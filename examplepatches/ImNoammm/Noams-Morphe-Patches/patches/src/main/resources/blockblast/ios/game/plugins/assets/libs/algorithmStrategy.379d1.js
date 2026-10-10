(() => {
"use strict";
var t = {
261: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, a = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmListOperator = r._algorithmList = void 0;
var l = e(4246);
function c(t) {
return t.dynamicSource === algorithmStrategy.context.ClassAlgorithmSourceType.Priority || t.dynamicSource === algorithmStrategy.context.ChapterAlgorithmSourceType.Priority;
}
r._algorithmList = {
pre: [],
post: []
};
var s = function() {
function t() {}
return Object.defineProperty(t, "curAlgorithmList", {
get: function() {
return r._algorithmList[this._process].sort(function(t, r) {
var e = c(t);
return e === c(r) ? 0 : e ? -1 : 1;
}), r._algorithmList[this._process];
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t, "algorithmList", {
get: function() {
return Object.freeze(i([], n(this.curAlgorithmList), !1));
},
enumerable: !1,
configurable: !0
}), t.unshift = function(r) {
var e;
return !(0, l.isAbsentAlgorithmIdArg)(r) && ((e = this.curAlgorithmList).unshift.apply(e, i([], n((0, 
l.transformAlgorithmId)(r, t.unshift.options)), !1)), !0);
}, t.unshiftFilterPriority = function(e) {
if ((0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var o = this.curAlgorithmList, a = o.filter(function(t) {
return c(t);
}), s = o.filter(function(t) {
return !c(t);
});
return r._algorithmList[this._process] = i(i(i([], n(a), !1), n((0, l.transformAlgorithmId)(e, t.unshiftFilterPriority.options)), !1), n(s), !1), 
!0;
}, t.push = function(r) {
var e;
return !(0, l.isAbsentAlgorithmIdArg)(r) && ((e = this.curAlgorithmList).push.apply(e, i([], n((0, 
l.transformAlgorithmId)(r, t.push.options)), !1)), !0);
}, t.pushFilterPriority = function(e) {
if ((0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var o = this.curAlgorithmList, a = o.filter(function(t) {
return c(t);
}), s = o.filter(function(t) {
return !c(t);
});
return r._algorithmList[this._process] = i(i(i([], n(a), !1), n(s), !1), n((0, l.transformAlgorithmId)(e, t.pushFilterPriority.options)), !1), 
!0;
}, t.insertBefore = function(r, e) {
var o;
if (null == r || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var a = this.curAlgorithmList.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== a && ((o = this.curAlgorithmList).splice.apply(o, i([ a, 0 ], n((0, 
l.transformAlgorithmId)(e, t.insertBefore.options)), !1)), !0);
}, t.insertBeforeFilterPriority = function(r, e) {
var o;
if (null == r || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var a = this.curAlgorithmList.findIndex(function(t) {
return !c(t) && t.algorithmId === r;
});
return -1 !== a && ((o = this.curAlgorithmList).splice.apply(o, i([ a, 0 ], n((0, 
l.transformAlgorithmId)(e, t.insertBeforeFilterPriority.options)), !1)), !0);
}, t.insertAfter = function(r, e) {
var o;
if (null == r || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var a = this.curAlgorithmList.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== a && ((o = this.curAlgorithmList).splice.apply(o, i([ a + 1, 0 ], n((0, 
l.transformAlgorithmId)(e, t.insertAfter.options)), !1)), !0);
}, t.insertAfterFilterPriority = function(r, e) {
var o;
if (null == r || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var a = this.curAlgorithmList.findIndex(function(t) {
return !c(t) && t.algorithmId === r;
});
return -1 !== a && ((o = this.curAlgorithmList).splice.apply(o, i([ a + 1, 0 ], n((0, 
l.transformAlgorithmId)(e, t.insertAfterFilterPriority.options)), !1)), !0);
}, t.remove = function(t) {
if ((0, l.isAbsentAlgorithmIdArg)(t)) return !1;
var e = (0, l.toArray)(t), o = new Set(e), n = this.curAlgorithmList.filter(function(t) {
return !o.has(t.algorithmId);
}), i = n.length !== this.curAlgorithmList.length;
return i && (r._algorithmList[this._process] = n), i;
}, t.removeFilterPriority = function(t) {
if ((0, l.isAbsentAlgorithmIdArg)(t)) return !1;
var e = (0, l.toArray)(t), o = new Set(e), n = this.curAlgorithmList.filter(function(t) {
return c(t) || !o.has(t.algorithmId);
}), i = n.length !== this.curAlgorithmList.length;
return i && (r._algorithmList[this._process] = n), i;
}, t.removeCategory = function(t) {
if (null == t) return !1;
var e = (0, l.CATEGORY_TO_ENUM)()[t], o = this.curAlgorithmList.filter(function(t) {
return !Object.values(e).includes(t.algorithmId);
}), n = o.length !== this.curAlgorithmList.length;
return n && (r._algorithmList[this._process] = o), n;
}, t.replaceFirst = function(e, o) {
if ((0, l.isAbsentAlgorithmIdArg)(e) || (0, l.isAbsentAlgorithmIdArg)(o)) return !1;
var a = (0, l.toArray)(e), c = new Set(a), s = (0, l.transformAlgorithmId)(o, t.replaceFirst.options), u = this.curAlgorithmList, g = u.findIndex(function(t) {
return c.has(t.algorithmId);
});
if (-1 === g) return !1;
var f = i([], n(u), !1);
return f.splice.apply(f, i([ g, 1 ], n(s), !1)), r._algorithmList[this._process] = f, 
!0;
}, t.replace = function(e, o) {
var c, s;
if ((0, l.isAbsentAlgorithmIdArg)(e) || (0, l.isAbsentAlgorithmIdArg)(o)) return !1;
var u = (0, l.toArray)(e), g = new Set(u), f = (0, l.transformAlgorithmId)(o, t.replace.options), h = !1, d = [], p = this.curAlgorithmList;
try {
for (var y = a(p), S = y.next(); !S.done; S = y.next()) {
var m = S.value;
g.has(m.algorithmId) ? (d.push.apply(d, i([], n(f), !1)), h = !0) : d.push(m);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
S && !S.done && (s = y.return) && s.call(y);
} finally {
if (c) throw c.error;
}
}
return h && (r._algorithmList[this._process] = d), h;
}, t.replaceFilterPriority = function(e, o) {
var s, u;
if ((0, l.isAbsentAlgorithmIdArg)(e) || (0, l.isAbsentAlgorithmIdArg)(o)) return !1;
var g = (0, l.toArray)(e), f = new Set(g), h = (0, l.transformAlgorithmId)(o, t.replaceFilterPriority.options), d = !1, p = [], y = this.curAlgorithmList;
try {
for (var S = a(y), m = S.next(); !m.done; m = S.next()) {
var A = m.value;
!c(A) && f.has(A.algorithmId) ? (p.push.apply(p, i([], n(h), !1)), d = !0) : p.push(A);
}
} catch (t) {
s = {
error: t
};
} finally {
try {
m && !m.done && (u = S.return) && u.call(S);
} finally {
if (s) throw s.error;
}
}
return d && (r._algorithmList[this._process] = p), d;
}, t.replaceCategory = function(t, e) {
var o, c;
if (null == t || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var s = (0, l.CATEGORY_TO_ENUM)()[t], u = !1, g = [], f = this.curAlgorithmList;
try {
for (var h = a(f), d = h.next(); !d.done; d = h.next()) {
var p = d.value;
Object.values(s).includes(p.algorithmId) ? (g.push.apply(g, i([], n((0, l.transformAlgorithmId)(e, this.replaceCategory.options)), !1)), 
u = !0) : g.push(p);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
d && !d.done && (c = h.return) && c.call(h);
} finally {
if (o) throw o.error;
}
}
return u && (r._algorithmList[this._process] = g), u;
}, t.replaceCategoryFilterPriority = function(t, e) {
var o, s;
if (null == t || (0, l.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, l.CATEGORY_TO_ENUM)()[t], g = !1, f = [], h = this.curAlgorithmList;
try {
for (var d = a(h), p = d.next(); !p.done; p = d.next()) {
var y = p.value;
!c(y) && Object.values(u).includes(y.algorithmId) ? (f.push.apply(f, i([], n((0, 
l.transformAlgorithmId)(e, this.replaceCategoryFilterPriority.options)), !1)), g = !0) : f.push(y);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
p && !p.done && (s = d.return) && s.call(d);
} finally {
if (o) throw o.error;
}
}
return g && (r._algorithmList[this._process] = f), g;
}, t.replaceAll = function(t) {
return !(0, l.isAbsentReplaceAllAlgorithmIdArg)(t) && (r._algorithmList[this._process] = (0, 
l.transformAlgorithmId)(t, this.replaceAll.options), !0);
}, t.replaceAllFilterPriority = function(t) {
if ((0, l.isAbsentReplaceAllAlgorithmIdArg)(t)) return !1;
var e = this.curAlgorithmList.filter(function(t) {
return c(t);
});
return r._algorithmList[this._process] = i(i([], n(e), !1), n((0, l.transformAlgorithmId)(t, this.replaceAllFilterPriority.options)), !1), 
!0;
}, t.replaceAllPrioritySpecialPatch = function(e) {
if ((0, l.isAbsentReplaceAllAlgorithmIdArg)(e)) return !1;
var a = this.curAlgorithmList.find(function(t) {
return c(t);
}), s = (0, l.transformAlgorithmId)(e, t.replaceAllPrioritySpecialPatch.options);
if (a && s.length > 0) {
var u = s.map(function(t) {
return o(o({}, t), {
dynamicSource: a.dynamicSource
});
});
r._algorithmList[this._process] = i(i([], n(u), !1), n(s), !1);
} else r._algorithmList[this._process] = s;
return !0;
}, t.clear = function() {
r._algorithmList.pre.length = 0, r._algorithmList.post.length = 0;
}, t.clearPostprocess = function() {
r._algorithmList.post.length = 0;
}, t._process = "pre", t;
}();
r.AlgorithmStrategyAlgorithmListOperator = s;
},
304: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyPreprocessShareSequenceSourcePatch = void 0;
var n, i = e(5213), a = e(7594);
function l(t, r) {
if (null == t) return !1;
for (var e = !1, o = 0; o < t.length; o++) t[o].source !== r && (i.flow.source = r, 
e = !0);
return i.flow.__patch_source_ = r, e;
}
var c = function() {
function t() {}
return t.patch = function(t) {
var r = function(t, r) {
return null != t && t.source !== r && (i.flow.source = r, !0);
}(null === i.flow || void 0 === i.flow ? void 0 : i.flow.sdk, t), e = l(null === i.flow || void 0 === i.flow ? void 0 : i.flow.algorithmList, t), o = l(null === i.flow || void 0 === i.flow ? void 0 : i.flow.algorithmPriorityList, t), a = l(null === i.flow || void 0 === i.flow ? void 0 : i.flow.algorithmFallbackList, t), c = l(null === i.flow || void 0 === i.flow ? void 0 : i.flow.postAlgorithmList, t);
return !!(n !== t || r || e || o || a || c) && (n = t, !0);
}, o([ (0, a.patch)({
patchKey: "preprocessShareSequenceDynamicSource",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyPreprocessShareSequenceSourcePatch = c;
},
578: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.PostprocessEvaluatorType = void 0, r.runPostprocess = function(t, r, e) {
return n(this, void 0, Promise, function() {
var n, d, p, y, S, m, A, v, b, _, C, T, O, P, R, E, L, I, x, k;
return i(this, function(i) {
switch (i.label) {
case 0:
return r.process = l.AlgorithmStrategyProcessType.POSTPROCESS, n = (0, u.shallowMergePreservingAccessors)(g.algorithmStrategy.context.globalContext(), (0, 
u.mergeConditionContextFromPrototypeChain)(t, "onPostprocessConditionContext", r), {
flow: r
}), d = (0, u.mergePostprocessOrSDKConditionsFromPrototypeChain)(t, "onPostprocessConditions"), 
[ 4, rulesEngine.getFactValueAsync(n, "platform") ];

case 1:
return p = i.sent(), [ 4, rulesEngine.getFactValueAsync(n, "gameMode") ];

case 2:
return y = i.sent(), S = (0, s.filterRules)(d, {
platform: p,
gameMode: y
}), m = {
operators: null === (k = t.onPostprocessConditionOperators) || void 0 === k ? void 0 : k.call(t),
target: t
}, (A = g.algorithmStrategy.context.CC_DEBUG ? (0, h.createPostprocessConditionTraceLogger)(e, S.length) : void 0) && (m.debug = {
onTrace: A.onTrace
}), [ 4, rulesEngine.evaluateRulesConditionsFirstMatch(S, n, m) ];

case 3:
return v = i.sent(), b = v.matched, _ = v.matchedFlows, C = b && _.length > 0 ? _[0] : void 0, 
T = v.resolvedContext, O = T, P = b && (null == O ? void 0 : O[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY]) ? o(o({}, null != e ? e : {}), ((x = {})[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY] = O[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY], 
x)) : e, R = (0, u.mergeActionsFromPrototypeChain)(t, "onPostprocessActions", r), 
(E = (0, c.resolvePendingActions)("postprocess", R, b ? _ : [], e)).length > 0 ? [ 4, (0, 
c.executeActions)("postprocess", E, _, t, r, P, n) ] : [ 3, 5 ];

case 4:
return L = i.sent(), g.algorithmStrategy.context.CONFLICT_DEBUG && f.AlgorithmStrategyConflictRecorder.recordPartialActionSuccess({
process: "postprocess",
traitSource: e.traitSource,
matchedRuleFlow: C,
results: L
}), I = L.some(function(t) {
return ("AlgorithmStrategyAlgorithmListOperator" === t.operator || "AlgorithmStrategyAlgorithmFallbackListOperator" === t.operator) && t.status;
}), null == A || A.logResult((0, h.formatPostprocessActionMessages)(L), I), [ 2, {
status: I,
conditionMatched: b,
type: a.PostprocessActionEvaluatorSuccess,
matchedRuleFlow: C
} ];

case 5:
return null == A || A.logResult(b ? "\n命中规则无对应动作" : "\n条件未命中，动作未执行", !1), [ 2, {
status: !1,
conditionMatched: b,
type: a.PostprocessActionEvaluatorFail,
matchedRuleFlow: C
} ];
}
});
});
};
var a, l = e(7880), c = e(6074), s = e(2848), u = e(2436), g = e(5800), f = e(8011), h = e(2771);
!function(t) {
t[t.PostprocessActionEvaluatorSuccess = 0] = "PostprocessActionEvaluatorSuccess", 
t[t.PostprocessActionEvaluatorFail = 1] = "PostprocessActionEvaluatorFail";
}(a || (r.PostprocessEvaluatorType = a = {}));
},
777: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyWarnType = void 0, function(t) {
t.PREPROCESS_MUTEX_ALGORITHM_LIST_EMPTY = "预处理-互斥-算法列表为空", t.PREPROCESS_SHARE_SEQUENCE_ALGORITHM_LIST_EMPTY = "预处理-共享-算法列表为空";
}(e || (r.AlgorithmStrategyWarnType = e = {}));
},
801: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoActualNamePatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
if (n === t) return !1;
var r = i.flow.sdk;
return r && (r.blockNames = t), n = t, !0;
}, o([ (0, a.patch)({
patchKey: "algoActualName",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoActualNamePatch = l;
},
1092: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.conflictStore = void 0;
var e = function() {
function t() {
this.gameIndex = 0, this.roundIndex = 0, this.nextEventId = 1, this.nextOperationOrder = 1, 
this.events = [], this.allEvents = [], this.roundEvents = [], this.traitCallCount = new Map(), 
this.allTraitCallCount = new Map(), this.roundTraitCallCount = new Map(), this.traitTriggerCount = new Map(), 
this.roundTriggeredTraits = new Set(), this.pendingConsumeItems = new Map(), this.sdkRequestedAlgorithmIds = [], 
this.sdkTrace = [], this.actionRecords = [], this.replacedSourceOwner = new Map(), 
this.pendingLineage = new Map(), this.roundResultConflictRecorded = !1, this.roundFinalResults = new Map(), 
this.gameAlgorithmCount = new Map(), this.gameAlgorithmTraitCount = new Map(), this.gameAlgorithmLastTraitSource = new Map(), 
this.gameAlgorithmBlockNameCount = new Map(), this.gameAlgorithmBlockNameTraitCount = new Map(), 
this.gameAlgorithmBlockNames = new Map();
}
return t.prototype.nextEventID = function() {
return this.nextEventId++;
}, t.prototype.nextOperationOrderValue = function() {
return this.nextOperationOrder++;
}, t.prototype.resetSDKRequestState = function() {
this.sdkRequestedAlgorithmIds = [], this.sdkTrace = [], this.sdkStopReason = void 0;
}, t.prototype.resetRoundState = function() {
this.roundEvents = [], this.roundTraitCallCount.clear(), this.roundTriggeredTraits.clear(), 
this.pendingConsumeItems.clear(), this.resetSDKRequestState(), this.actionRecords = [], 
this.replacedSourceOwner.clear(), this.pendingLineage.clear(), this.roundResultConflictRecorded = !1;
}, t;
}();
r.conflictStore = new e();
},
1174: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmFallbackListPatch = void 0;
var n, i = e(9423), a = e(4246), l = e(7594), c = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
return void 0 !== t && t === r && t.length === r.length && JSON.stringify(t) === JSON.stringify(r);
}(n, t)) return !1;
for (var r = 0; r < t.length; r++) {
var e = t[r];
e.category = (0, a.getCategoryForAlgorithm)(e.algorithmId), e.algorithmListSource = "fallback";
}
return n = t, !0;
}, Object.defineProperty(t, "algorithmFallbackList", {
get: function() {
return i.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList;
},
enumerable: !1,
configurable: !0
}), o([ (0, l.patch)({
patchKey: "algorithmFallbackList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgorithmFallbackListPatch = c;
},
1425: function(t, r, e) {
var o = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.resetGame = function(t) {
var r;
n.conflictStore.gameIndex = null !== (r = function(t) {
return "number" == typeof t && t > 0 ? t : i();
}(t)) && void 0 !== r ? r : n.conflictStore.gameIndex + 1, n.conflictStore.roundIndex = 0, 
n.conflictStore.nextEventId = 1, n.conflictStore.nextOperationOrder = 1, n.conflictStore.events = [], 
n.conflictStore.roundFinalResults.clear(), n.conflictStore.traitCallCount.clear(), 
n.conflictStore.gameAlgorithmCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmTraitCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmTraitCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmLastTraitSource.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmLastTraitSource.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNameCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNameCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNameTraitCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNameTraitCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNames.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNames.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.resetRoundState();
}, r.resetRound = function(t) {
var r;
n.conflictStore.roundIndex = null !== (r = function(t) {
return "number" == typeof t && t > 0 ? t : a();
}(t)) && void 0 !== r ? r : n.conflictStore.roundIndex + 1, n.conflictStore.resetRoundState();
}, r.syncCurrentGameIndex = function() {
var t = i();
null != t && t !== n.conflictStore.gameIndex && (n.conflictStore.gameIndex = t, 
n.conflictStore.gameAlgorithmCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmTraitCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmTraitCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmLastTraitSource.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmLastTraitSource.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNameCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNameCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNameTraitCount.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNameTraitCount.set(n.conflictStore.gameIndex, new Map()), 
n.conflictStore.gameAlgorithmBlockNames.has(n.conflictStore.gameIndex) || n.conflictStore.gameAlgorithmBlockNames.set(n.conflictStore.gameIndex, new Map()));
}, r.syncCurrentRoundIndex = function() {
var t = a();
if (null != t && t !== n.conflictStore.roundIndex) {
var r = n.conflictStore.roundIndex;
n.conflictStore.roundIndex = t, function(t, r) {
var e, i;
if (t !== r && 0 !== n.conflictStore.roundEvents.length) try {
for (var a = o(n.conflictStore.roundEvents), l = a.next(); !l.done; l = a.next()) {
var c = l.value;
c.roundIndex === t && (c.roundIndex = r);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (i = a.return) && i.call(a);
} finally {
if (e) throw e.error;
}
}
}(r, t);
}
};
var n = e(1092);
function i() {
var t, r, e, o, n = globalThis, i = "class" === (null === (r = null === (t = n.algorithmStrategy) || void 0 === t ? void 0 : t.context) || void 0 === r ? void 0 : r.gameMode) ? "classGameNum" : "chapterGameNum", a = null === (o = null === (e = n.storage) || void 0 === e ? void 0 : e.getItem) || void 0 === o ? void 0 : o.call(e, i, 0);
return "number" == typeof a && a > 0 ? a : void 0;
}
function a() {
var t, r, e, o, n = globalThis, i = "class" === (null === (r = null === (t = n.algorithmStrategy) || void 0 === t ? void 0 : t.context) || void 0 === r ? void 0 : r.gameMode) ? "classRoundNum" : "chapterRoundNum", a = null === (o = null === (e = n.storage) || void 0 === e ? void 0 : e.getItem) || void 0 === o ? void 0 : o.call(e, i, 0);
return "number" == typeof a && a > 0 ? a : void 0;
}
},
1688: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.priorityRequest = function(t) {
return o(this, void 0, Promise, function() {
var r, e, o, S, m, A, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U;
return n(this, function(n) {
switch (n.label) {
case 0:
if (t.process = p.AlgorithmStrategyProcessType.PREPROCESS_SDK_PRIORITY, !(r = h.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList) || 0 === r.length) return [ 2, !1 ];
e = -1, algorithmStrategy.context.CC_DEBUG && (0, f.logSDKAlgorithmListWithTraits)("SDK 请求-算法优先级列表", r), 
o = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
t.algorithmPriorityList = r, t.traits = o, S = Date.now(), m = 0, n.label = 1;

case 1:
return m < r.length ? (A = r[m], v = A.router, (null === (B = algorithmStrategy.context.preprocess_sdk_strategy) || void 0 === B ? void 0 : B.continue(A.algorithmId)) ? (t.sdk || (t.sdk = {
blockIds: [],
blockNames: [],
expectedAlgorithmIdPatch: e,
expectedAlgorithmId: e,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: e,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: e,
actualAlgorithmId: e
}), [ 3, 9 ]) : Date.now() - S > algorithmStrategy.context.timeout.preprocess_normalAlgorithm_sdk ? (algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "timeout",
algorithmId: A.algorithmId
}), [ 3, 10 ]) : [ 4, (0, y.shouldSkipSDKItem)(A, "normal", t, m) ]) : [ 3, 10 ];

case 2:
if (n.sent()) return algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemSkipped(A, "SDK item before 生命周期要求跳过"), 
[ 3, 9 ];
algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemRequested("preprocess", A), 
b = d.AlgorithmStrategySDKRequest.createBaseInputArgs(), _ = [], C = {}, T = algorithmStrategy.context.CC_DEBUG ? [] : void 0, 
O = 0, n.label = 3;

case 3:
return O < o.length ? (P = o[O], R = {
itemIndex: m,
itemTotal: r.length,
traitIndex: O,
traitTotal: o.length
}, (null == _ ? void 0 : _.includes(P)) ? (algorithmStrategy.context.CC_DEBUG && (E = C[P], 
(0, g.logSDKConditionTraceSkipped)(P, E ? "跳过：被前置特性【".concat((0, u.formatTraitNameWithDescription)(E), "】通过 disableTraits 禁用") : "跳过：被前置特性 disableTraits 禁用", A, {
itemIndex: m,
itemTotal: r.length,
traitIndex: O,
traitTotal: o.length
})), [ 3, 6 ]) : (null == (L = TRAIT(P)) ? void 0 : L.onActiveCondition) && (null == L ? void 0 : L.active) ? (0, 
y.isSDKRequestTrait)(L) ? [ 4, (0, s.mergeSDKActionsArgs)(L, t, b, A, R) ] : [ 3, 5 ] : (algorithmStrategy.context.CC_DEBUG && (0, 
g.logSDKConditionTraceSkipped)(P, (0, g.formatSDKArgsTraitInactiveReason)(L), A, R), 
[ 3, 6 ])) : [ 3, 7 ];

case 4:
if (I = n.sent()) {
if (x = I.merged, k = I.args, void 0 !== x.disableTraits) {
if (algorithmStrategy.context.CC_DEBUG) try {
for (F = void 0, w = i(x.disableTraits), D = w.next(); !D.done; D = w.next()) N = D.value, 
_.includes(N) || (C[N] = P);
} catch (t) {
F = {
error: t
};
} finally {
try {
D && !D.done && (G = w.return) && G.call(w);
} finally {
if (F) throw F.error;
}
}
_ = l([], a(new Set(l(l([], a(_), !1), a(x.disableTraits), !1))), !1);
}
d.AlgorithmStrategySDKRequest.mergeToInputArgs(b, x, P), algorithmStrategy.context.CC_DEBUG && (null == T || T.push({
traitClassName: (0, u.formatTraitNameWithDescription)(P),
args: k
}));
}
return [ 3, 6 ];

case 5:
algorithmStrategy.context.CC_DEBUG && (0, g.logSDKConditionTraceSkipped)(P, "跳过：不是 SDK 参数特性", A, R), 
n.label = 6;

case 6:
return O++, [ 3, 3 ];

case 7:
return algorithmStrategy.context.CC_DEBUG && (u.AlgorithmStrategyLog.log("SDK 算法列表-请求-合并参数：", u.AlgorithmStrategyLog.NORMAL_COLOR), 
u.AlgorithmStrategyLog.table(null != T ? T : [])), [ 4, d.AlgorithmStrategySDKRequest.request(b, A, t) ];

case 8:
if (j = n.sent(), algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemResult(A, j), 
null == j ? void 0 : j.SDK_SUCCESS) {
if (t.process = p.AlgorithmStrategyProcessType.PREPROCESS_SDK_PRIORITY_SUCCESS, 
algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSuccessfulSDKResult("preprocess", j), 
K = null !== (U = A.dynamicSource) && void 0 !== U ? U : "journey" === algorithmStrategy.context.gameMode ? algorithmStrategy.context.ChapterAlgorithmSourceType.Priority : algorithmStrategy.context.ClassAlgorithmSourceType.Priority, 
algorithmStrategy.context.algorithmStrategySourceLevelInfo.setAlgorithmSourceLevel(K), 
!(null == v ? void 0 : v.type) || "break" === (null == v ? void 0 : v.type)) return algorithmStrategy.context.CONFLICT_DEBUG && (M = t, 
c.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "break" === (null == v ? void 0 : v.type) ? "success-router-break" : "success-default-break",
algorithmId: A.algorithmId,
routerType: null == v ? void 0 : v.type,
returnState: !0 === M.returnState,
returnStateProcessType: null == M.returnStateProcessType ? void 0 : String(M.returnStateProcessType),
detail: "break" === (null == v ? void 0 : v.type) ? "router.type 为 break，SDK 成功后停止" : !0 === M.returnState ? "returnState 已设置".concat(null == M.returnStateProcessType ? "" : "（".concat(String(M.returnStateProcessType), "）"), "，且未配置 router.next，SDK 成功后停止") : "未配置 router.next，SDK 成功后默认停止"
})), [ 2, !0 ];
if ("next" === v.type) return [ 3, 9 ];
}
n.label = 9;

case 9:
return m++, [ 3, 1 ];

case 10:
return t.process = p.AlgorithmStrategyProcessType.PREPROCESS_SDK_PRIORITY_FAIL, 
[ 2, !1 ];
}
});
});
};
var c = e(8011), s = e(2436), u = e(5815), g = e(3957), f = e(3173), h = e(3325), d = e(2230), p = e(7880), y = e(3768);
},
1811: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, a = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.beginSDKRequest = function() {
d.conflictStore.resetSDKRequestState();
}, r.recordSDKItemRequested = function(t, r) {
var e = (0, h.itemKey)(t, r);
d.conflictStore.sdkRequestedAlgorithmIds.push(r.algorithmId), d.conflictStore.sdkTrace.push({
algorithmId: r.algorithmId,
source: r.source,
dynamicSource: r.dynamicSource,
traitSource: r.traitSource,
status: "requested"
}), d.conflictStore.pendingConsumeItems.delete(e), (0, g.recordLineageConflict)(t, r, e);
}, r.recordSDKItemSkipped = function(t, r) {
d.conflictStore.sdkTrace.push({
algorithmId: t.algorithmId,
source: t.source,
dynamicSource: t.dynamicSource,
traitSource: t.traitSource,
status: "skipped",
reason: r
});
}, r.recordSDKItemResult = function(t, r) {
var e, a, c, s, u = i([], n(d.conflictStore.sdkTrace), !1).reverse().find(function(r) {
return r.algorithmId === t.algorithmId && r.traitSource === t.traitSource && "requested" === r.status;
});
u && (u.sdkSuccess = !0 === (null == r ? void 0 : r.SDK_SUCCESS), u.sdkSuccess || (u.status = "request-failed"), 
u.errorCode = r.SDK_SUCCESS ? 0 : void 0, u.sdkAlgorithmType = null == r ? void 0 : r.SDK_ALGO_TYPE, 
u.source = null !== (e = null == r ? void 0 : r.source) && void 0 !== e ? e : u.source, 
u.expectedAlgorithmId = null !== (a = null == r ? void 0 : r.expectedAlgorithmId) && void 0 !== a ? a : null === (s = null === (c = l.algorithmStrategy.context) || void 0 === c ? void 0 : c.algorithmName) || void 0 === s ? void 0 : s.algoExpectedId, 
u.actualAlgorithmId = null == r ? void 0 : r.actualAlgorithmId, u.blockIds = i([], n(r.blockIds), !1), 
u.blockNames = i([], n(r.blockNames), !1), u.blockPoses = r.blockPoses.map(function(t) {
return o({}, t);
}), u.betterBlockCount = null == r ? void 0 : r.betterBlockCount, u.betterSpaceCount = null == r ? void 0 : r.betterSpaceCount, 
u.sdkExtra = r.SDK_Extra ? JSON.parse(JSON.stringify(r.SDK_Extra)) : void 0);
}, r.recordSDKStopReason = function(t) {
d.conflictStore.sdkStopReason = t;
var r = i([], n(d.conflictStore.sdkTrace), !1).reverse().find(function(r) {
return r.algorithmId === t.algorithmId && "requested" === r.status;
});
r && (r.status = "success-stop");
}, r.completeSDK = function(t) {
var r, e, l, p = (0, h.createListSnapshot)(s.AlgorithmStrategyAlgorithmListOperator.algorithmList), v = (0, 
h.createListSnapshot)(c.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList), b = (0, 
h.createListSnapshot)(y.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList), _ = (0, 
h.createListSnapshot)(S.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList), C = A(p);
m(t, C, p, v, b, _, !1);
try {
for (var T = a(i([], n(d.conflictStore.pendingConsumeItems.values()), !1)), O = T.next(); !O.done; O = T.next()) {
var P = O.value;
if (P.process === t) {
var R = P.item.traitSource;
if (R) {
var E = (0, g.findRemovedByAction)(P.item.algorithmId, null !== (l = P.snapshots.operationOrder) && void 0 !== l ? l : 0);
(0, f.addEvent)(o({
type: u.AlgorithmStrategyConflictType.ALGORITHM_OPERATOR_SUCCESS_BUT_NOT_CONSUME,
severity: "conflict",
process: t,
algorithmListSource: P.item.algorithmListSource,
affectedTrait: R,
triggerTrait: R,
actionType: P.actionType,
args: P.args,
algorithmId: P.item.algorithmId,
reason: "算法列表操作成功，但 SDK 阶段未请求该算法项",
sdkCompleteAlgorithmList: p,
sdkCompleteAlgorithmFallbackList: v,
sdkCompleteAlgorithmPriorityList: b,
sdkCompleteAlgorithmPostList: _,
sdkRequestedAlgorithmIds: i([], n(d.conflictStore.sdkRequestedAlgorithmIds), !1),
sdkTrace: C,
sdkStopReason: d.conflictStore.sdkStopReason,
removedByTrait: null == E ? void 0 : E.traitSource,
removedByActionType: null == E ? void 0 : E.actionType
}, P.snapshots));
}
d.conflictStore.pendingConsumeItems.delete(P.key);
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
O && !O.done && (e = T.return) && e.call(T);
} finally {
if (r) throw r.error;
}
}
}, r.completeFallbackSDK = function(t) {
var r = (0, h.createListSnapshot)(s.AlgorithmStrategyAlgorithmListOperator.algorithmList), e = (0, 
h.createListSnapshot)(c.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList), o = (0, 
h.createListSnapshot)(y.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList), n = (0, 
h.createListSnapshot)(S.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList);
m(t, A(e), r, e, o, n, !0);
}, r.recordPreprocessSuccessButPostprocessReplace = function(t, r) {
(null == t ? void 0 : t.SDK_SUCCESS) && (null == r ? void 0 : r.SDK_SUCCESS) && t.actualAlgorithmId !== r.actualAlgorithmId && (0, 
f.addEvent)({
type: u.AlgorithmStrategyConflictType.ALGORITHM_PRE_PROCESS_SDK_SUCCESS_BUT_POST_PROCESS_REPLACE,
severity: "warn",
process: "postprocess",
triggerTrait: r.traitSource,
affectedTrait: t.traitSource,
algorithmId: t.actualAlgorithmId,
algorithmIds: [ t.actualAlgorithmId, r.actualAlgorithmId ].filter(function(t) {
return null != t;
}),
reason: "预处理 SDK 成功后，后处理 SDK 替换了最终算法"
});
}, r.recordSuccessfulSDKResult = function(t, r) {
(0, p.recordSuccessfulSDKResult)(t, r);
};
var l = e(5800), c = e(9423), s = e(261), u = e(4727), g = e(7809), f = e(6325), h = e(7721), d = e(1092), p = e(9818), y = e(3325), S = e(8281);
function m(t, r, e, o, l, c, s) {
var u, g;
try {
for (var f = a(d.conflictStore.roundEvents), h = f.next(); !h.done; h = f.next()) {
var p = h.value;
p.process === t && "fallback" !== p.algorithmListSource && (s || null == p.sdkTrace) && (p.sdkTrace = r, 
p.sdkCompleteAlgorithmList = e, p.sdkCompleteAlgorithmFallbackList = o, p.sdkCompleteAlgorithmPriorityList = l, 
p.sdkCompleteAlgorithmPostList = c, p.sdkRequestedAlgorithmIds = i([], n(d.conflictStore.sdkRequestedAlgorithmIds), !1), 
p.sdkStopReason = d.conflictStore.sdkStopReason);
}
} catch (t) {
u = {
error: t
};
} finally {
try {
h && !h.done && (g = f.return) && g.call(f);
} finally {
if (u) throw u.error;
}
}
}
function A(t) {
var r = new Set(d.conflictStore.sdkTrace.map(function(t) {
var r;
return "".concat(t.algorithmId, "|").concat(null !== (r = t.traitSource) && void 0 !== r ? r : "");
})), e = t.filter(function(t) {
var e;
return !r.has("".concat(t.algorithmId, "|").concat(null !== (e = t.traitSource) && void 0 !== e ? e : ""));
}).map(function(t) {
return {
algorithmId: t.algorithmId,
source: t.source,
dynamicSource: t.dynamicSource,
traitSource: t.traitSource,
status: "not-reached"
};
});
return Object.freeze(i(i([], n(d.conflictStore.sdkTrace), !1), n(e), !1));
}
},
2072: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.PRODUCE_ITEM_TYPES = r.OPERATION_TARGET_FAILURE_TYPES = void 0, r.OPERATION_TARGET_FAILURE_TYPES = new Set([ "replace", "replaceCategory", "insertBefore", "insertAfter", "remove", "removeCategory" ]), 
r.PRODUCE_ITEM_TYPES = new Set([ "unshift", "push", "insertBefore", "insertAfter", "replace", "replaceCategory", "replaceAll" ]);
},
2166: function(t, r) {
var e = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, o = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyReturnFilterOperator = void 0;
var n = function() {
function t() {}
return t.returnFilter = function(r) {
var n, i = t.returnFilter.options, a = null == i ? void 0 : i.flow;
if (a) {
var l = Array.isArray(r) ? r : [ r ];
a.returnFilter = o([], e(new Set(o(o([], e(null !== (n = a.returnFilter) && void 0 !== n ? n : []), !1), e(l), !1))), !1);
}
return !0;
}, t;
}();
r.AlgorithmStrategyReturnFilterOperator = n;
},
2196: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoItemSdkRequestPatch = void 0;
var c = e(2436), s = e(5815), u = e(5213), g = e(3768), f = e(2230), h = function() {
function t() {}
return t.patch = function(t, r) {
return o(this, void 0, Promise, function() {
var e, o, h, d, p, y, S, m, A, v, b, _, C, T;
return n(this, function(n) {
switch (n.label) {
case 0:
e = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
(null == r ? void 0 : r.length) > 0 && (e = e.filter(function(t) {
return !r.includes(t);
})), u.flow.traits = e, o = f.AlgorithmStrategySDKRequest.createBaseInputArgs(), 
h = [], d = [], n.label = 1;

case 1:
n.trys.push([ 1, 6, 7, 8 ]), p = i(e), y = p.next(), n.label = 2;

case 2:
return y.done ? [ 3, 5 ] : (S = y.value, (null == h ? void 0 : h.includes(S)) ? [ 3, 4 ] : (null == (m = TRAIT(S)) ? void 0 : m.onActiveCondition) && (null == m ? void 0 : m.active) && (0, 
g.isSDKRequestTrait)(m) ? [ 4, (0, c.mergeSDKActionsArgs)(m, u.flow, o, t) ] : [ 3, 4 ]);

case 3:
(A = n.sent()) && (v = A.merged, b = A.args, void 0 !== v.disableTraits && (h = l([], a(new Set(l(l([], a(h), !1), a(v.disableTraits), !1))), !1)), 
f.AlgorithmStrategySDKRequest.mergeToInputArgs(o, v, S), algorithmStrategy.context.CC_DEBUG && d.push({
traitClassName: (0, s.formatTraitNameWithDescription)(S),
args: b
})), n.label = 4;

case 4:
return y = p.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return _ = n.sent(), C = {
error: _
}, [ 3, 8 ];

case 7:
try {
y && !y.done && (T = p.return) && T.call(p);
} finally {
if (C) throw C.error;
}
return [ 7 ];

case 8:
return algorithmStrategy.context.CC_DEBUG && (s.AlgorithmStrategyLog.log("SDK 算法列表-请求-合并参数：", s.AlgorithmStrategyLog.NORMAL_COLOR), 
s.AlgorithmStrategyLog.table(d)), [ 4, f.AlgorithmStrategySDKRequest.request(o, t, u.flow) ];

case 9:
return [ 2, n.sent() ];
}
});
});
}, t;
}();
r.AlgorithmStrategyAlgoItemSdkRequestPatch = h;
},
2230: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategySDKRequest = void 0;
var c = e(5800), s = e(5815), u = e(9351), g = e(801), f = e(8088), h = e(7209), d = e(2698), p = e(4046), y = e(3817), S = e(6320), m = function() {
function t() {}
return t.createBaseInputArgs = function() {
var t = c.algorithmStrategy.context, r = t.blockCenterPos();
return {
highRecordGrade: t.highScore(),
lastBlockIds: [ -1, -1, -1 ],
currRecordGrade: t.score(),
mode: t.gameMode,
chapterNum: storage.getItem("chapterNum", 0),
board: t.faceBlocks(),
idToRemove: new Map(),
device: t.deviceLevel,
extra: {
centerRow: r.x,
centerCol: r.y
}
};
}, t.mergeToInputArgs = function(t, r, e) {
var n, i, c, s, u, g;
for (var f in t.extra || (t.extra = {}), r) if ("disableTraits" !== f) if ("extra" === f) {
var h = r.extra;
if (h) {
if (h.traits) {
var d = o({}, null !== (n = t.extra.traits) && void 0 !== n ? n : {}), p = null !== (i = d[e]) && void 0 !== i ? i : {};
d[e] = o(o({}, p), h.traits), t.extra.traits = d;
}
h.algos && (t.extra.algos = o(o({}, null !== (s = null === (c = t.extra) || void 0 === c ? void 0 : c.algos) && void 0 !== s ? s : {}), h.algos));
}
} else if ("filterBlocks" === f || "filterWeightBlocks" === f) {
var y = null !== (u = t[f]) && void 0 !== u ? u : [], S = null !== (g = r[f]) && void 0 !== g ? g : [];
t[f] = Array.from(new Set(l(l([], a(y), !1), a(S), !1)));
} else t[f] = r[f];
}, t.request = function(t, r, e) {
return n(this, void 0, Promise, function() {
var o, n, m, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M;
return i(this, function(i) {
switch (i.label) {
case 0:
return t.blockIds = null !== (_ = null == t ? void 0 : t.blockIds) && void 0 !== _ ? _ : [ 0, 0, 0 ], 
t.blockNames = null !== (C = null == t ? void 0 : t.blockNames) && void 0 !== C ? C : [ "", "", "" ], 
t.blockPoses = null !== (T = null == t ? void 0 : t.blockPoses) && void 0 !== T ? T : [ {
row: 0,
col: 0
}, {
row: 0,
col: 0
}, {
row: 0,
col: 0
} ], t.overTime = null !== (O = null == t ? void 0 : t.overTime) && void 0 !== O ? O : 100, 
t.filterBlocks = null !== (P = null == t ? void 0 : t.filterBlocks) && void 0 !== P ? P : [], 
t.addBlocks = null !== (R = null == t ? void 0 : t.addBlocks) && void 0 !== R ? R : [], 
t.blocksGroup = null !== (E = null == t ? void 0 : t.blocksGroup) && void 0 !== E ? E : [], 
t.filterWeightBlocks = null !== (L = null == t ? void 0 : t.filterWeightBlocks) && void 0 !== L ? L : [], 
t = (0, S.patchSdkExtraFromArgs)(t), Object.defineProperty(r, "actualAlgorithmId_SDK_REQUEST_BEFORE_Patch", {
value: r.algorithmId,
writable: !1,
configurable: !1
}), y.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch.patch(r.algorithmId, this), 
(o = c.algorithmStrategy.context).CC_DEBUG && s.AlgorithmStrategyLog.log("SDK 请求：", s.AlgorithmStrategyLog.NORMAL_COLOR, "".concat(o.algorithmInfo.getOfferTypeDisplayName(r.algorithmId), "(").concat(r.algorithmId, ")"), JSON.parse(JSON.stringify(t))), 
o.offerTopicAsync && o.configs.ALGORITHM_STRATEGY_ASYNC_ALGORITHM_CONFIG.has(r.algorithmId) ? [ 4, o.offerTopicAsync(t, r.algorithmId) ] : [ 3, 2 ];

case 1:
return n = i.sent(), [ 3, 3 ];

case 2:
n = o.PuzzleUtil.offerTopic(t, r.algorithmId), i.label = 3;

case 3:
return o.CC_DEBUG && s.AlgorithmStrategyLog.log("SDK 返回：".concat(0 === n.errorCode && 3 === (null === (I = n.blockIds) || void 0 === I ? void 0 : I.length) ? "成功" : "失败"), s.AlgorithmStrategyLog.NORMAL_COLOR, JSON.parse(JSON.stringify(n))), 
[ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_RESULT_MUTATE_CONFIG, "onAlgorithmStrategySDKResultMutate", n, r, e) ];

case 4:
return i.sent(), (v = 0 === n.errorCode && 3 === (null === (x = n.blockIds) || void 0 === x ? void 0 : x.length)) ? (Object.defineProperty(r, "SDK_SUCCESS", {
value: !0,
writable: !1,
configurable: !1
}), r.SDK_ALGO_TYPE = n.algoType, Object.defineProperty(r, "SDK_Extra", {
value: n.extra,
writable: !1,
configurable: !1
}), Object.defineProperty(r, "actualAlgorithmId", {
value: r.algorithmId,
writable: !1,
configurable: !1
}), Object.defineProperty(r, "actualAlgorithmId_SDK_REQUEST_AFTER_Patch", {
value: r.algorithmId,
writable: !1,
configurable: !1
}), Object.defineProperty(r, "blockIds", {
value: l([], a(n.blockIds), !1),
writable: !1,
configurable: !1
}), Object.defineProperty(r, "blockNames", {
value: l([], a(n.blockNames), !1),
writable: !1,
configurable: !1
}), Object.defineProperty(r, "blockPoses", {
value: l([], a(n.blockPoses), !1),
writable: !1,
configurable: !1
}), Object.defineProperty(r, "betterBlockCount", {
value: null !== (w = null === (k = n.extra) || void 0 === k ? void 0 : k.betterBlockCount) && void 0 !== w ? w : 0,
writable: !1,
configurable: !1
}), Object.defineProperty(r, "betterSpaceCount", {
value: null !== (N = null === (D = n.extra) || void 0 === D ? void 0 : D.betterSpaceCount) && void 0 !== N ? N : 0,
writable: !1,
configurable: !1
}), Object.freeze(r.blockIds), Object.freeze(r.blockNames), Object.freeze(r.blockPoses), 
p.AlgorithmStrategyAlgoSdkRequestAfterActualIdPatch.patch(r.algorithmId, this), 
g.AlgorithmStrategyAlgoActualNamePatch.patch(l([], a(n.blockNames), !1), this), 
h.AlgorithmStrategyAlgoBlockPosListPatch.patch(l([], a(n.blockPoses), !1), this), 
f.AlgorithmStrategyAlgoBlockIdListPatch.patch(l([], a(n.blockIds), !1), this), d.AlgorithmStrategyAlgoExtraPatch.patch({
better_block: r.betterBlockCount,
better_space: r.betterSpaceCount
}, this), A.setActualAlgorithmId(r.algorithmId), m = {
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: r.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: r.actualAlgorithmId_SDK_REQUEST_AFTER_Patch,
source: r.source,
traitSource: r.traitSource,
algorithmListSource: r.algorithmListSource,
SDK_SUCCESS: !0,
SDK_ALGO_TYPE: r.SDK_ALGO_TYPE,
SDK_Extra: r.SDK_Extra,
expectedAlgorithmId: r.expectedAlgorithmId,
actualAlgorithmId: r.actualAlgorithmId,
blockIds: r.blockIds,
blockNames: r.blockNames,
blockPoses: r.blockPoses,
betterBlockCount: r.betterBlockCount,
betterSpaceCount: r.betterSpaceCount
}, this._lastSuccessSDK = m) : (b = this._lastSuccessSDK, m = {
SDK_SUCCESS: !1,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: r.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch,
source: null == b ? void 0 : b.source,
traitSource: null == b ? void 0 : b.traitSource,
algorithmListSource: null == b ? void 0 : b.algorithmListSource,
SDK_ALGO_TYPE: null == b ? void 0 : b.SDK_ALGO_TYPE,
SDK_Extra: null == b ? void 0 : b.SDK_Extra,
expectedAlgorithmId: null == b ? void 0 : b.expectedAlgorithmId,
actualAlgorithmId: null == b ? void 0 : b.actualAlgorithmId,
blockIds: null !== (j = null == b ? void 0 : b.blockIds) && void 0 !== j ? j : [],
blockNames: null !== (K = null == b ? void 0 : b.blockNames) && void 0 !== K ? K : [],
blockPoses: null !== (M = null == b ? void 0 : b.blockPoses) && void 0 !== M ? M : [ {
row: 0,
col: 0
}, {
row: 0,
col: 0
}, {
row: 0,
col: 0
} ],
betterBlockCount: null == b ? void 0 : b.betterBlockCount,
betterSpaceCount: null == b ? void 0 : b.betterSpaceCount
}), e.sdk = m, [ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_COMPLETE_TRAITS_CONFIG, "onAlgorithmStrategySDKComplete", v, r) ];

case 5:
return i.sent(), [ 2, m ];
}
});
});
}, t.clear = function() {
this._lastSuccessSDK = void 0;
}, t;
}();
r.AlgorithmStrategySDKRequest = m;
var A = new (function() {
function t() {}
return Object.defineProperty(t.prototype, "actualAlgorithmId", {
get: function() {
switch (c.algorithmStrategy.context.gameMode) {
case "class":
return storage.getItem("classActualAlgorithmlId");

case "journey":
return storage.getItem("chapterActualAlgorithmlId");
}
},
enumerable: !1,
configurable: !0
}), t.prototype.setActualAlgorithmId = function(t) {
switch (c.algorithmStrategy.context.gameMode) {
case "class":
storage.setItem("classActualAlgorithmlId", t);
break;

case "journey":
storage.setItem("chapterActualAlgorithmlId", t);
}
}, t;
}())();
},
2436: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, c = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.mergePreprocessConditionsFromPrototypeChain = function(t) {
for (var r, e, n, i, s, u, g = [], f = Object.getPrototypeOf(t); f && f !== Object.prototype; ) {
var h = f.onPreprocessConditions;
if ("function" == typeof h) {
S(t);
var d = h.call(t);
d && "object" == typeof d && g.push(d);
}
f = Object.getPrototypeOf(f);
}
if (1 === g.length) return g[0];
for (var p = {}, y = g.length - 1; y >= 0; y--) {
var m = g[y], A = {};
try {
for (var b = (r = void 0, c(new Set(l(l([], a(Object.keys(p)), !1), a(Object.keys(m)), !1)))), _ = b.next(); !_.done; _ = b.next()) {
var C = _.value, T = p[C], O = m[C];
if (void 0 !== O) if (void 0 !== T) if (Array.isArray(T) && Array.isArray(O)) {
var P = null === (s = O[0]) || void 0 === s ? void 0 : s.mergeType;
A[C] = v(T, O, P);
} else if ("object" != typeof T || null === T || Array.isArray(T) || "object" != typeof O || null === O || Array.isArray(O)) A[C] = O; else {
var R = o({}, T);
try {
for (var E = (n = void 0, c(Object.keys(O))), L = E.next(); !L.done; L = E.next()) {
var I = L.value, x = T[I], k = O[I];
Array.isArray(x) && Array.isArray(k) ? (P = null === (u = k[0]) || void 0 === u ? void 0 : u.mergeType, 
R[I] = v(x, k, P)) : void 0 !== k && (R[I] = k);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
L && !L.done && (i = E.return) && i.call(E);
} finally {
if (n) throw n.error;
}
}
A[C] = R;
} else A[C] = O; else A[C] = T;
}
} catch (t) {
r = {
error: t
};
} finally {
try {
_ && !_.done && (e = b.return) && e.call(b);
} finally {
if (r) throw r.error;
}
}
p = A;
}
return p;
}, r.mergePostprocessOrSDKConditionsFromPrototypeChain = h, r.mergeActionsFromPrototypeChain = d, 
r.mergeConditionContextFromPrototypeChain = y, r.mergeSDKActionsArgs = function(t, r, e, o, f) {
return n(this, void 0, Promise, function() {
var n, p, S, A, v, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j;
return i(this, function(i) {
switch (i.label) {
case 0:
return t && t.onSDKArgsConditions && t.onSDKArgsActions ? (n = b.apply(void 0, l([ s.algorithmStrategy.context.globalContext(), y(t, "onSDKArgsConditionContext", r, e, o) ], a(null != r ? [ {
flow: r
} ] : []), !1)), p = h(t, "onSDKArgsConditions"), [ 4, rulesEngine.getFactValueAsync(n, "platform") ]) : [ 2, void 0 ];

case 1:
return S = i.sent(), [ 4, rulesEngine.getFactValueAsync(n, "gameMode") ];

case 2:
return A = i.sent(), v = (0, g.filterRules)(p, {
platform: S,
gameMode: A
}), (_ = d(t, "onSDKArgsActions", e)) ? (C = {
operators: null === (j = t.onSDKArgsConditionOperators) || void 0 === j ? void 0 : j.call(t),
target: t
}, s.algorithmStrategy.context.CC_DEBUG && (T = (0, u.createSDKConditionTraceLogger)(t, v.length, o, f), 
C.debug = {
onTrace: T.onTrace
}, p.length > 0 && 0 === v.length && T.logSkipped("条件规则过滤为空：platform=".concat(S, "，gameMode=").concat(A, "，原始规则=").concat(p.length))), 
[ 4, rulesEngine.evaluateRulesConditionsFirstMatch(v, n, C) ]) : [ 2, void 0 ];

case 3:
if (O = i.sent(), P = O.matched, R = O.matchedFlows, E = {}, L = {}, P && R.length > 0) try {
for (I = c(R), x = I.next(); !x.done; x = I.next()) k = x.value, (w = m(_[k], e)) && (L = w, 
Object.assign(E, w), null == T || T.addArgs(k, w));
} catch (t) {
D = {
error: t
};
} finally {
try {
x && !x.done && (N = I.return) && N.call(I);
} finally {
if (D) throw D.error;
}
} else (w = m(_.else, e)) && (L = w, Object.assign(E, w), null == T || T.addArgs("else", w));
return null == T || T.logResult(), [ 2, Object.keys(E).length > 0 ? {
merged: E,
args: L
} : void 0 ];
}
});
});
}, r.deepMergeActions = A, r.mergeRulesArray = v, r.shallowMergePreservingAccessors = b;
var s = e(5800), u = e(3957), g = e(2848), f = e(8011);
function h(t, r) {
for (var e, o = [], n = Object.getPrototypeOf(t); n && n !== Object.prototype; ) {
var i = n[r];
if ("function" == typeof i) {
S(t);
var a = i.call(t);
Array.isArray(a) && o.push(a);
}
n = Object.getPrototypeOf(n);
}
for (var l = [], c = o.length - 1; c >= 0; c--) {
var s = o[c];
l = v(l, s, null === (e = s[0]) || void 0 === e ? void 0 : e.mergeType);
}
return l;
}
function d(t, r, e) {
for (var o, n, i, a, l = [], s = Object.getPrototypeOf(t); s && s !== Object.prototype; ) {
var u = s[r];
if ("function" == typeof u) {
var g;
S(t), null != (g = u.call(t, e)) && l.push(g);
}
s = Object.getPrototypeOf(s);
}
for (var f = void 0, h = l.length - 1; h >= 0; h--) f = A(f, l[h]);
var d = p(f);
if (d) try {
for (var y = c(Object.keys(d)), m = y.next(); !m.done; m = y.next()) {
var v = d[m.value];
if (null === (a = v.extra) || void 0 === a ? void 0 : a.traits) {
var b = v.extra.traits;
v.extra.traits = ((i = {})[t.traitName] = b, i);
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
m && !m.done && (n = y.return) && n.call(y);
} finally {
if (o) throw o.error;
}
}
return d;
}
function p(t) {
var r, e;
if (Array.isArray(t)) return t.map(p);
if (null != t && "object" == typeof t) {
var o = {};
try {
for (var n = c(Object.keys(t)), i = n.next(); !i.done; i = n.next()) {
var a = i.value;
o[a] = p(t[a]);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
i && !i.done && (e = n.return) && e.call(n);
} finally {
if (r) throw r.error;
}
}
return o;
}
return t;
}
function y(t, r, e, o, n) {
for (var i = [], a = Object.getPrototypeOf(t); a && a !== Object.prototype; ) {
var l = a[r];
if ("function" == typeof l) {
S(t);
var c;
(c = "onSDKArgsConditionContext" === r ? l.call(t, e, o, n) : l.call(t, e)) && "object" == typeof c && i.push(c);
}
a = Object.getPrototypeOf(a);
}
for (var s = {}, u = i.length - 1; u >= 0; u--) s = b(s, i[u]);
return s;
}
function S(t) {
if (s.algorithmStrategy.context.CONFLICT_DEBUG) {
var r = null == t ? void 0 : t.traitName;
f.AlgorithmStrategyConflictRecorder.recordTraitTrigger(r);
}
}
function m(t, r) {
return "function" == typeof t ? t(r) : t;
}
function A(t, r) {
var e, n;
if (null == r) return t;
if (null == t) return r;
if (Array.isArray(r)) return r;
if (Array.isArray(t) && !Array.isArray(r)) return r;
if ("object" == typeof r && null !== r && "object" == typeof t && null !== t && !Array.isArray(t) && !Array.isArray(r)) {
var i = o({}, t);
try {
for (var a = c(Object.keys(r)), l = a.next(); !l.done; l = a.next()) {
var s = l.value;
i[s] = A(t[s], r[s]);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
return i;
}
return r;
}
function v(t, r, e) {
return "prepend" === e ? l(l([], a(r || []), !1), a(t || []), !1) : l("append" === e ? l([], a(t || []), !1) : [], a(r || []), !1);
}
function b() {
for (var t, r, e, o, n = [], i = 0; i < arguments.length; i++) n[i] = arguments[i];
var a = {};
try {
for (var l = c(n), s = l.next(); !s.done; s = l.next()) {
var u = s.value;
if (null != u && "object" == typeof u) try {
for (var g = (e = void 0, c(Reflect.ownKeys(u))), f = g.next(); !f.done; f = g.next()) {
var h = f.value;
if ("__proto__" !== h) {
var d = Object.getOwnPropertyDescriptor(u, h);
d && Object.defineProperty(a, h, d);
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
f && !f.done && (o = g.return) && o.call(g);
} finally {
if (e) throw e.error;
}
}
}
} catch (r) {
t = {
error: r
};
} finally {
try {
s && !s.done && (r = l.return) && r.call(l);
} finally {
if (t) throw t.error;
}
}
return a;
}
},
2616: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.postRequest = function(t) {
return o(this, void 0, Promise, function() {
var r, e, o, m, A, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U, q;
return n(this, function(n) {
switch (n.label) {
case 0:
if (t.process = y.AlgorithmStrategyProcessType.PREPROCESS_SDK_POST, !(r = d.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList) || 0 === r.length) return [ 2, !1 ];
if (e = algorithmStrategy.context.categoryToOfferEnum[c.AlgorithmStrategyCategoryType.DIFFICULT], 
!Object.values(e).includes(null === (U = t.sdk) || void 0 === U ? void 0 : U.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch)) return [ 2, !1 ];
o = -1, algorithmStrategy.context.CC_DEBUG && (0, h.logSDKAlgorithmListWithTraits)("SDK 请求-算法优先级列表", r), 
m = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
t.algorithmPostList = r, t.traits = m, A = Date.now(), v = 0, n.label = 1;

case 1:
return v < r.length ? (b = r[v], _ = b.router, (null === (q = algorithmStrategy.context.preprocess_sdk_strategy) || void 0 === q ? void 0 : q.continue(b.algorithmId)) ? (t.sdk || (t.sdk = {
blockIds: [],
blockNames: [],
expectedAlgorithmIdPatch: o,
expectedAlgorithmId: o,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: o,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: o,
actualAlgorithmId: o
}), [ 3, 9 ]) : Date.now() - A > algorithmStrategy.context.timeout.preprocess_normalAlgorithm_sdk ? (algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "timeout",
algorithmId: b.algorithmId
}), [ 3, 10 ]) : [ 4, (0, S.shouldSkipSDKItem)(b, "normal", t, v) ]) : [ 3, 10 ];

case 2:
if (n.sent()) return algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemSkipped(b, "SDK item before 生命周期要求跳过"), 
[ 3, 9 ];
algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemRequested("preprocess", b), 
C = p.AlgorithmStrategySDKRequest.createBaseInputArgs(), T = [], O = {}, P = algorithmStrategy.context.CC_DEBUG ? [] : void 0, 
R = 0, n.label = 3;

case 3:
return R < m.length ? (E = m[R], L = {
itemIndex: v,
itemTotal: r.length,
traitIndex: R,
traitTotal: m.length
}, (null == T ? void 0 : T.includes(E)) ? (algorithmStrategy.context.CC_DEBUG && (I = O[E], 
(0, f.logSDKConditionTraceSkipped)(E, I ? "跳过：被前置特性【".concat((0, g.formatTraitNameWithDescription)(I), "】通过 disableTraits 禁用") : "跳过：被前置特性 disableTraits 禁用", b, L)), 
[ 3, 6 ]) : (null == (x = TRAIT(E)) ? void 0 : x.onActiveCondition) && (null == x ? void 0 : x.active) ? (0, 
S.isSDKRequestTrait)(x) ? [ 4, (0, u.mergeSDKActionsArgs)(x, t, C, b, L) ] : [ 3, 5 ] : (algorithmStrategy.context.CC_DEBUG && (0, 
f.logSDKConditionTraceSkipped)(E, (0, f.formatSDKArgsTraitInactiveReason)(x), b, L), 
[ 3, 6 ])) : [ 3, 7 ];

case 4:
if (k = n.sent()) {
if (w = k.merged, D = k.args, void 0 !== w.disableTraits) {
if (algorithmStrategy.context.CC_DEBUG) try {
for (G = void 0, N = i(w.disableTraits), j = N.next(); !j.done; j = N.next()) K = j.value, 
T.includes(K) || (O[K] = E);
} catch (t) {
G = {
error: t
};
} finally {
try {
j && !j.done && (B = N.return) && B.call(N);
} finally {
if (G) throw G.error;
}
}
T = l([], a(new Set(l(l([], a(T), !1), a(w.disableTraits), !1))), !1);
}
p.AlgorithmStrategySDKRequest.mergeToInputArgs(C, w, E), algorithmStrategy.context.CC_DEBUG && (null == P || P.push({
traitClassName: (0, g.formatTraitNameWithDescription)(E),
args: D
}));
}
return [ 3, 6 ];

case 5:
algorithmStrategy.context.CC_DEBUG && (0, f.logSDKConditionTraceSkipped)(E, "跳过：不是 SDK 参数特性", b, L), 
n.label = 6;

case 6:
return R++, [ 3, 3 ];

case 7:
return algorithmStrategy.context.CC_DEBUG && (g.AlgorithmStrategyLog.log("SDK 算法列表-请求-合并参数：", g.AlgorithmStrategyLog.NORMAL_COLOR), 
g.AlgorithmStrategyLog.table(null != P ? P : [])), [ 4, p.AlgorithmStrategySDKRequest.request(C, b, t) ];

case 8:
if (M = n.sent(), algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemResult(b, M), 
null == M ? void 0 : M.SDK_SUCCESS) {
if (t.process = y.AlgorithmStrategyProcessType.PREPROCESS_SDK_POST_SUCCESS, algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSuccessfulSDKResult("preprocess", M), 
b.dynamicSource && algorithmStrategy.context.algorithmStrategySourceLevelInfo.setAlgorithmSourceLevel(b.dynamicSource), 
!(null == _ ? void 0 : _.type) || "break" === (null == _ ? void 0 : _.type)) return algorithmStrategy.context.CONFLICT_DEBUG && (F = t, 
s.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "break" === (null == _ ? void 0 : _.type) ? "success-router-break" : "success-default-break",
algorithmId: b.algorithmId,
routerType: null == _ ? void 0 : _.type,
returnState: !0 === F.returnState,
returnStateProcessType: null == F.returnStateProcessType ? void 0 : String(F.returnStateProcessType),
detail: "break" === (null == _ ? void 0 : _.type) ? "router.type 为 break，SDK 成功后停止" : !0 === F.returnState ? "returnState 已设置".concat(null == F.returnStateProcessType ? "" : "（".concat(String(F.returnStateProcessType), "）"), "，且未配置 router.next，SDK 成功后停止") : "未配置 router.next，SDK 成功后默认停止"
})), [ 2, !0 ];
if ("next" === _.type) return [ 3, 9 ];
}
n.label = 9;

case 9:
return v++, [ 3, 1 ];

case 10:
return t.process = y.AlgorithmStrategyProcessType.PREPROCESS_SDK_POST_FAIL, [ 2, !1 ];
}
});
});
};
var c = e(8978), s = e(8011), u = e(2436), g = e(5815), f = e(3957), h = e(3173), d = e(8281), p = e(2230), y = e(7880), S = e(3768);
},
2688: function(t, r) {
var e = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyDisableOperator = void 0;
var o = function() {
function t() {}
return t.disable = function(r) {
var o, n, i = t.disable.options, a = null == i ? void 0 : i.flow;
if (a) {
Array.isArray(a.disabledTraits) || (a.disabledTraits = []);
var l = Array.isArray(r) ? r : [ r ];
try {
for (var c = e(l), s = c.next(); !s.done; s = c.next()) {
var u = s.value;
a.disabledTraits.includes(u) || a.disabledTraits.push(u);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
s && !s.done && (n = c.return) && n.call(c);
} finally {
if (o) throw o.error;
}
}
}
return !0;
}, t.disableTag = function(r) {
var o, n, i = t.disableTag.options, a = null == i ? void 0 : i.flow;
if (a) {
Array.isArray(a.disabledTags) || (a.disabledTags = []);
var l = Array.isArray(r) ? r : [ r ];
try {
for (var c = e(l), s = c.next(); !s.done; s = c.next()) {
var u = s.value;
a.disabledTags.includes(u) || a.disabledTags.push(u);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
s && !s.done && (n = c.return) && n.call(c);
} finally {
if (o) throw o.error;
}
}
}
return !0;
}, t.disablePostTag = function(r, o) {
var n, i, a = t.disablePostTag.options, l = null == a ? void 0 : a.flow;
if (l) {
o && (l.__traitAlgoSuccess__ = !0), Array.isArray(l.disabledPostTags) || (l.disabledPostTags = []);
var c = Array.isArray(r) ? r : [ r ];
try {
for (var s = e(c), u = s.next(); !u.done; u = s.next()) {
var g = u.value;
l.disabledPostTags.includes(g) || l.disabledPostTags.push(g);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
u && !u.done && (i = s.return) && i.call(s);
} finally {
if (n) throw n.error;
}
}
}
return !0;
}, t.disablePostRestTags = function(r) {
var e = t.disablePostRestTags.options, o = null == e ? void 0 : e.flow;
return o && (r && (o.__traitAlgoSuccess__ = !0), o.disabledPostRestTags = !0), !0;
}, t;
}();
r.AlgorithmStrategyDisableOperator = o;
},
2698: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoExtraPatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
return !function(t, r) {
return void 0 !== t && t === r && JSON.stringify(t) === JSON.stringify(r);
}(n, t) && (i.flow.sdk && (i.flow.sdk.betterBlockCount = t.better_block, i.flow.sdk.betterSpaceCount = t.better_space), 
n = t, !0);
}, o([ (0, a.patch)({
patchKey: "blockExtraList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoExtraPatch = l;
},
2771: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.formatPostprocessActionMessages = function(t) {
return (0, o.formatActionExecuteMessages)(t);
}, r.createPostprocessConditionTraceLogger = function(t, r) {
var e, o, i, a, l = null !== (e = null == t ? void 0 : t.traitSource) && void 0 !== e ? e : "UnknownTrait", c = "".concat(l).concat(null !== (a = null === (i = null === (o = window.traitConfigDebugInfo) || void 0 === o ? void 0 : o.getTraitClassNameDes) || void 0 === i ? void 0 : i.call(o, l)) && void 0 !== a ? a : ""), s = "后处理-特性【".concat(null == (null == t ? void 0 : t.traitIndex) ? "?" : t.traitIndex + 1).concat(null == (null == t ? void 0 : t.traitTotal) ? "" : "/".concat(t.traitTotal), "】：").concat(c);
return (0, n.createAlgorithmStrategyRuleTraceLogger)({
rulesCount: r,
buildPrefix: function(t) {
return "".concat(s, "，").concat((0, n.formatRuleProgress)(t, r));
},
color: n.getAlgorithmStrategyTraceResultColor,
fallbackPrefix: "后处理-条件计算-结果",
factWrapper: "plain",
separator: "colon"
});
};
var o = e(4542), n = e(6582);
},
2806: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, a = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.positionAdjust = function(t) {
var r, e, f, h, d, p, y, S, m, A;
t.process = u.AlgorithmStrategyProcessType.POSITION_ADJUST, delete t.returnState, 
delete t.disabledTraits;
var v, b, _, C, T, O = l.algorithmStrategy.context.AlgorithmStrategyPositionType, P = [], R = l.algorithmStrategy.context.CONFLICT_DEBUG && null != (null === (d = t.sdk) || void 0 === d ? void 0 : d.blockIds) ? i([], n(t.sdk.blockIds), !1) : void 0, E = l.algorithmStrategy.context.CONFLICT_DEBUG && null != (null === (p = t.sdk) || void 0 === p ? void 0 : p.blockNames) ? i([], n(t.sdk.blockNames), !1) : void 0, L = l.algorithmStrategy.context.CONFLICT_DEBUG && null != (null === (y = t.sdk) || void 0 === y ? void 0 : y.blockPoses) ? t.sdk.blockPoses.map(function(t) {
return o({}, t);
}) : void 0, I = [ 0, 1, 2 ];
try {
for (var x = a(l.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_POSITION_ADJUST_TRAITS_CONFIG), k = x.next(); !k.done; k = x.next()) {
var w = k.value;
if (t.returnState) break;
if (!(null === (S = t.disabledTraits) || void 0 === S ? void 0 : S.includes(w))) {
var D = TRAIT(w);
if ((null == D ? void 0 : D.onActiveCondition) && (null == D ? void 0 : D.active) && g(D)) {
var N = D.onAlgorithmStrategyPositionAdjust(t);
if (!N) continue;
switch (v = w, b = N.data, l.algorithmStrategy.context.CONFLICT_DEBUG && (s.AlgorithmStrategyConflictRecorder.recordTraitTrigger(v), 
P.push({
traitSource: v,
data: N.data,
returnState: N.returnState,
disableTraits: null == N.disableTraits ? void 0 : i([], n(N.disableTraits), !1)
})), b) {
case O.LEFT:
I = [ 0, 1, 2 ];
break;

case O.MIDDLE:
I = [ 2, 0, 1 ];
break;

case O.RIGHT:
I = [ 2, 1, 0 ];
break;

case O.MIDDLE_LEFT:
I = [ 1, 0, 2 ];
break;

case O.RIGHT_LEFT:
I = [ 1, 2, 0 ];
break;

case O.LEFT_RIGHT:
I = [ 0, 2, 1 ];
break;

default:
void 0 !== b && l.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.error("AlgorithmStrategyPositionOperator.adjust 调整类型：".concat(b, " 传入错误！"));
}
if (null === (m = N.disableTraits) || void 0 === m ? void 0 : m.length) {
Array.isArray(t.disabledTraits) || (t.disabledTraits = []);
try {
for (var j = (f = void 0, a(N.disableTraits)), K = j.next(); !K.done; K = j.next()) {
var M = K.value;
t.disabledTraits.includes(M) || t.disabledTraits.push(M);
}
} catch (t) {
f = {
error: t
};
} finally {
try {
K && !K.done && (h = j.return) && h.call(j);
} finally {
if (f) throw f.error;
}
}
}
N.returnState && (t.returnState = !0), l.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.log("特性：".concat(w, " 位置调整："), c.AlgorithmStrategyLog.NORMAL_COLOR, N);
}
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
k && !k.done && (e = x.return) && e.call(x);
} finally {
if (r) throw r.error;
}
}
if (I) {
var F = l.algorithmStrategy.context.algorithmInfo, G = l.algorithmStrategy.context.algorithmName, B = t.sdk;
if (3 === (null === (A = null == B ? void 0 : B.blockIds) || void 0 === A ? void 0 : A.length)) {
var U = B.blockIds, q = B.blockNames, H = B.blockPoses;
H && 3 === H.length || (H = F.blockPosList);
var Y = I[0], J = I[1], W = I[2];
_ = [ U[Y], U[J], U[W] ], C = [ q[Y], q[J], q[W] ], T = [ H[Y], H[J], H[W] ], F.setBlockIdList(_), 
G.setAlgoActualChangeName(C), l.algorithmStrategy.context.MACRO_IOS && G.setAlgoActualName(C), 
F.setBlockPosList(T), t.process = u.AlgorithmStrategyProcessType.POSITION_ADJUST_SUCCESS, 
l.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.log("%c【算法策略阶段】 位置调整-后", "color:#fff;background:#ff0000;", {
process: t.process,
order: "[".concat(I.join(","), "]")
});
}
} else t.process = u.AlgorithmStrategyProcessType.POSITION_ADJUST_FAIL, l.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.log("%c【算法策略阶段】 位置调整-失败", "color:#fff;background:#ff0000;", {
process: t.process
});
return l.algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordAdjustResult({
process: "positionAdjust",
success: t.process === u.AlgorithmStrategyProcessType.POSITION_ADJUST_SUCCESS,
traitSource: v,
traitResults: P,
positionType: b,
order: I,
beforeBlockIds: R,
afterBlockIds: _,
beforeBlockNames: E,
afterBlockNames: C,
beforeBlockPoses: L,
afterBlockPoses: T,
reason: "位置调整阶段记录最终出块顺序"
}), delete t.returnState, delete t.disabledTraits, t;
};
var l = e(5800), c = e(5815), s = e(8011), u = e(7880);
function g(t) {
return t && "function" == typeof t.onAlgorithmStrategyPositionAdjust;
}
},
2848: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.filterRules = function(t, r) {
return t.filter(function(t) {
return !(null != t.platform && "all" !== t.platform && t.platform !== r.platform || null != t.gameMode && "all" !== t.gameMode && t.gameMode !== r.gameMode);
});
};
},
3003: function(t, r, e) {
var o = this && this.__rest || function(t, r) {
var e = {};
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && r.indexOf(o) < 0 && (e[o] = t[o]);
if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
var n = 0;
for (o = Object.getOwnPropertySymbols(t); n < o.length; n++) r.indexOf(o[n]) < 0 && Object.prototype.propertyIsEnumerable.call(t, o[n]) && (e[o[n]] = t[o[n]]);
}
return e;
}, n = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, i = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, a = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.algorithmStrategyRobotAlgorithmStats = r.ALGORITHM_BLOCK_NAME_SEPARATOR = void 0, 
r.createAlgorithmBlockNameKey = function(t) {
var e = c(t);
return e ? e.join(r.ALGORITHM_BLOCK_NAME_SEPARATOR) : void 0;
};
var l = e(5800);
function c(t) {
if (t && 0 !== t.length) {
var r = t.map(function(t) {
return null == t ? "" : String(t);
});
if (!r.every(function(t) {
return "" === t;
})) return r;
}
}
function s(t) {
var r, e;
return [ t.operator, null !== (r = t.actionType) && void 0 !== r ? r : "", u(null !== (e = t.args) && void 0 !== e ? e : []) ].join("|");
}
function u(t) {
if (null == t || "object" != typeof t) return JSON.stringify(t);
if (Array.isArray(t)) return "[".concat(t.map(u).join(","), "]");
var r = t;
return "{".concat(Object.keys(r).sort().map(function(t) {
return "".concat(JSON.stringify(t), ":").concat(u(r[t]));
}).join(","), "}");
}
r.ALGORITHM_BLOCK_NAME_SEPARATOR = "#";
var g = function() {
function t() {
this.algorithmCount = {}, this.algorithmLastTraitSource = {}, this.algorithmTraitCount = {}, 
this.algorithmBlockNameCount = {}, this.algorithmBlockNames = {}, this.algorithmBlockNameTraitsCount = {}, 
this.algorithmBlockNameTraitsTotalCount = {}, this.algorithmTraitsAlgorithmNameCount = {}, 
this.finalResultTraitAlgorithmCount = {}, this.finalResultTraitTotalCount = {}, 
this.finalResultTraitExpectedAlgorithmCount = {}, this.finalResultTraitExpectedTotalCount = {}, 
this.partialActionSuccessRecordMap = {}, this.nextPartialActionSuccessRecordId = 1;
}
return t.prototype.recordResult = function(t) {
var r, e, o, n, i = (null === (r = t.sdk) || void 0 === r ? void 0 : r.SDK_SUCCESS) ? t.sdk : void 0, a = null == i ? void 0 : i.actualAlgorithmId, c = null == i ? void 0 : i.traitSource, s = null !== (e = null == i ? void 0 : i.expectedAlgorithmId) && void 0 !== e ? e : null === (n = null === (o = l.algorithmStrategy.context) || void 0 === o ? void 0 : o.algorithmName) || void 0 === n ? void 0 : n.algoExpectedId;
this.record(a, c, null == i ? void 0 : i.blockNames, s);
}, t.prototype.record = function(t, r, e, o) {
null != t && r && (this.recordBlockNames(e, r), void 0 === this.algorithmCount[t] && (this.algorithmCount[t] = 0), 
this.algorithmCount[t]++, this.recordAlgorithmTrait(t, r), this.recordFinalResultTraitAlgorithm(t, r), 
this.recordFinalResultTraitExpectedAlgorithm(o, r), this.algorithmLastTraitSource[t] = r);
}, t.prototype.recordAlgorithmTrait = function(t, r) {
var e = String(t);
void 0 === this.algorithmTraitCount[e] && (this.algorithmTraitCount[e] = {}), void 0 === this.algorithmTraitCount[e][r] && (this.algorithmTraitCount[e][r] = 0), 
this.algorithmTraitCount[e][r]++;
}, t.prototype.recordFinalResultTraitAlgorithm = function(t, r) {
this.recordTraitAlgorithmCount(this.finalResultTraitAlgorithmCount, this.finalResultTraitTotalCount, t, r);
}, t.prototype.recordFinalResultTraitExpectedAlgorithm = function(t, r) {
null != t && -1 !== t && this.recordTraitAlgorithmCount(this.finalResultTraitExpectedAlgorithmCount, this.finalResultTraitExpectedTotalCount, t, r);
}, t.prototype.recordTraitAlgorithmCount = function(t, r, e, o) {
var n = String(o), i = String(e);
void 0 === t[n] && (t[n] = {}), void 0 === t[n][i] && (t[n][i] = 0), void 0 === r[n] && (r[n] = 0), 
t[n][i]++, r[n]++;
}, t.prototype.recordBlockNames = function(t, e) {
var o = c(t);
if (o) {
var n = o.join(r.ALGORITHM_BLOCK_NAME_SEPARATOR);
void 0 === this.algorithmBlockNameCount[n] && (this.algorithmBlockNameCount[n] = 0), 
this.algorithmBlockNameCount[n]++, this.algorithmBlockNames[n] = o, e && (void 0 === this.algorithmBlockNameTraitsCount[n] && (this.algorithmBlockNameTraitsCount[n] = {}), 
void 0 === this.algorithmBlockNameTraitsCount[n][e] && (this.algorithmBlockNameTraitsCount[n][e] = 0), 
void 0 === this.algorithmBlockNameTraitsTotalCount[n] && (this.algorithmBlockNameTraitsTotalCount[n] = 0), 
void 0 === this.algorithmTraitsAlgorithmNameCount[e] && (this.algorithmTraitsAlgorithmNameCount[e] = {}), 
void 0 === this.algorithmTraitsAlgorithmNameCount[e][n] && (this.algorithmTraitsAlgorithmNameCount[e][n] = 0), 
this.algorithmBlockNameTraitsCount[n][e]++, this.algorithmBlockNameTraitsTotalCount[n]++, 
this.algorithmTraitsAlgorithmNameCount[e][n]++);
}
}, t.prototype.recordPartialActionSuccess = function(t) {
var r, e, o, i, a, l, c, u = function(t) {
var r, e;
return [ t.process, null !== (r = t.traitSource) && void 0 !== r ? r : "", null !== (e = t.matchedRuleFlow) && void 0 !== e ? e : "" ].join("|");
}(t);
void 0 === this.partialActionSuccessRecordMap[u] && (this.partialActionSuccessRecordMap[u] = {
id: this.nextPartialActionSuccessRecordId++,
gameIndex: null !== (o = t.gameIndex) && void 0 !== o ? o : 0,
roundIndex: null !== (i = t.roundIndex) && void 0 !== i ? i : 0,
process: t.process,
traitSource: t.traitSource,
matchedRuleFlow: t.matchedRuleFlow,
actionStats: [],
actionStatsMap: {},
totalCount: 0,
successCount: 0,
failedCount: 0
});
var g = this.partialActionSuccessRecordMap[u];
g.gameIndex = null !== (a = t.gameIndex) && void 0 !== a ? a : g.gameIndex, g.roundIndex = null !== (l = t.roundIndex) && void 0 !== l ? l : g.roundIndex, 
g.matchedRuleFlow = null !== (c = t.matchedRuleFlow) && void 0 !== c ? c : g.matchedRuleFlow;
try {
for (var f = n(t.results), h = f.next(); !h.done; h = f.next()) {
var d = h.value, p = s({
operator: d.operator,
actionType: d.actionType,
args: d.args
});
void 0 === g.actionStatsMap[p] && (g.actionStatsMap[p] = {
operator: d.operator,
actionType: d.actionType,
args: d.args,
totalCount: 0,
successCount: 0,
failedCount: 0
});
var y = g.actionStatsMap[p];
y.totalCount++, g.totalCount++, d.status ? (y.successCount++, g.successCount++) : (y.failedCount++, 
g.failedCount++);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
h && !h.done && (e = f.return) && e.call(f);
} finally {
if (r) throw r.error;
}
}
g.actionStats = Object.keys(g.actionStatsMap).map(function(t) {
return g.actionStatsMap[t];
}).sort(function(t, r) {
return r.failedCount - t.failedCount || r.successCount - t.successCount || t.operator.localeCompare(r.operator);
});
}, t.prototype.snapshot = function() {
var t = this;
return {
algorithmCounts: Object.keys(this.algorithmCount).map(function(r) {
var e = {
algorithmId: r,
count: t.algorithmCount[r]
}, o = t.algorithmLastTraitSource[r], n = t.createTraitCountStats(t.algorithmTraitCount[r]);
return o && (e.lastTraitSource = o), n.length > 0 && (e.traitsCounts = n), e;
}),
algorithmBlockNameCounts: Object.keys(this.algorithmBlockNameCount).map(function(e) {
var o;
return {
blockNameKey: e,
blockNames: null !== (o = t.algorithmBlockNames[e]) && void 0 !== o ? o : e.split(r.ALGORITHM_BLOCK_NAME_SEPARATOR),
count: t.algorithmBlockNameCount[e]
};
}).sort(function(t, r) {
return r.count - t.count || t.blockNameKey.localeCompare(r.blockNameKey);
}),
algorithmBlockNameTraitsCounts: Object.keys(this.algorithmBlockNameTraitsCount).map(function(r) {
var e;
return {
blockNameKey: r,
traitsCounts: Object.keys(t.algorithmBlockNameTraitsCount[r]).map(function(e) {
var o;
return {
traitClassName: e,
count: null !== (o = t.algorithmBlockNameTraitsCount[r][e]) && void 0 !== o ? o : 0
};
}).sort(function(t, r) {
return r.count - t.count || t.traitClassName.localeCompare(r.traitClassName);
}),
count: null !== (e = t.algorithmBlockNameTraitsTotalCount[r]) && void 0 !== e ? e : 0
};
}).sort(function(t, r) {
return r.count - t.count || t.blockNameKey.localeCompare(r.blockNameKey);
}),
algorithmTraitsAlgorithmNameCounts: this.createAlgorithmTraitsAlgorithmNameCountsSnapshot(),
finalResultTraitAlgorithmCounts: this.createFinalResultTraitAlgorithmCountsSnapshot(),
partialActionSuccessRecords: Object.freeze(Object.keys(this.partialActionSuccessRecordMap).map(function(r) {
var e = t.partialActionSuccessRecordMap[r];
return e.actionStatsMap, o(e, [ "actionStatsMap" ]);
}).sort(function(t, r) {
return r.failedCount - t.failedCount || r.successCount - t.successCount || t.id - r.id;
}))
};
}, t.prototype.createAlgorithmTraitsAlgorithmNameCountsSnapshot = function() {
var t, r, e = {}, o = function(t) {
var r, o, a = i.algorithmTraitsAlgorithmNameCount[t];
e[t] = {};
try {
for (var l = (r = void 0, n(Object.keys(a).sort(function(t, r) {
return a[r] - a[t] || t.localeCompare(r);
}))), c = l.next(); !c.done; c = l.next()) {
var s = c.value;
e[t][s] = a[s];
}
} catch (t) {
r = {
error: t
};
} finally {
try {
c && !c.done && (o = l.return) && o.call(l);
} finally {
if (r) throw r.error;
}
}
}, i = this;
try {
for (var a = n(Object.keys(this.algorithmTraitsAlgorithmNameCount)), l = a.next(); !l.done; l = a.next()) o(l.value);
} catch (r) {
t = {
error: r
};
} finally {
try {
l && !l.done && (r = a.return) && r.call(a);
} finally {
if (t) throw t.error;
}
}
return e;
}, t.prototype.createFinalResultTraitAlgorithmCountsSnapshot = function() {
var t = this;
return a([], i(new Set(a(a(a([], i(Object.keys(this.finalResultTraitAlgorithmCount)), !1), i(Object.keys(this.finalResultTraitExpectedAlgorithmCount)), !1), i(Object.keys(this.algorithmTraitsAlgorithmNameCount)), !1))), !1).map(function(r) {
var e, o;
return {
traitSource: r,
algorithmCounts: t.createAlgorithmCountStats(t.finalResultTraitAlgorithmCount[r]),
expectedAlgorithmCounts: t.createAlgorithmCountStats(t.finalResultTraitExpectedAlgorithmCount[r]),
blockNameCounts: t.createBlockNameCountStats(t.algorithmTraitsAlgorithmNameCount[r]),
count: null !== (e = t.finalResultTraitTotalCount[r]) && void 0 !== e ? e : 0,
expectedCount: null !== (o = t.finalResultTraitExpectedTotalCount[r]) && void 0 !== o ? o : 0
};
}).sort(function(r, e) {
return e.count - r.count || e.expectedCount - r.expectedCount || t.sumCountStats(e.blockNameCounts) - t.sumCountStats(r.blockNameCounts) || r.traitSource.localeCompare(e.traitSource);
});
}, t.prototype.createAlgorithmCountStats = function(t) {
return t ? Object.keys(t).map(function(r) {
return {
algorithmId: r,
count: t[r]
};
}).sort(function(t, r) {
return r.count - t.count || String(t.algorithmId).localeCompare(String(r.algorithmId));
}) : [];
}, t.prototype.createTraitCountStats = function(t) {
return t ? Object.keys(t).map(function(r) {
var e;
return {
traitClassName: r,
count: null !== (e = t[r]) && void 0 !== e ? e : 0
};
}).sort(function(t, r) {
return r.count - t.count || t.traitClassName.localeCompare(r.traitClassName);
}) : [];
}, t.prototype.createBlockNameCountStats = function(t) {
return t ? Object.keys(t).map(function(r) {
return {
blockNameKey: r,
count: t[r]
};
}).sort(function(t, r) {
return r.count - t.count || t.blockNameKey.localeCompare(r.blockNameKey);
}) : [];
}, t.prototype.sumCountStats = function(t) {
return t.reduce(function(t, r) {
return t + r.count;
}, 0);
}, t.prototype.reset = function() {
this.algorithmCount = {}, this.algorithmLastTraitSource = {}, this.algorithmTraitCount = {}, 
this.algorithmBlockNameCount = {}, this.algorithmBlockNames = {}, this.algorithmBlockNameTraitsCount = {}, 
this.algorithmBlockNameTraitsTotalCount = {}, this.algorithmTraitsAlgorithmNameCount = {}, 
this.finalResultTraitAlgorithmCount = {}, this.finalResultTraitTotalCount = {}, 
this.finalResultTraitExpectedAlgorithmCount = {}, this.finalResultTraitExpectedTotalCount = {}, 
this.partialActionSuccessRecordMap = {}, this.nextPartialActionSuccessRecordId = 1;
}, t;
}();
r.algorithmStrategyRobotAlgorithmStats = new g();
},
3165: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoExpectedIdPatch = void 0;
var n, i = e(7594), a = function() {
function t() {}
return t.patch = function(t) {
return n !== t && (n = t, !0);
}, o([ (0, i.patch)({
patchKey: "algoExpectedId",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoExpectedIdPatch = a;
},
3173: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.logSDKAlgorithmListWithTraits = function(t, r, e) {
void 0 === e && (e = "SDK 请求-特性列表"), n.AlgorithmStrategyLog.log(t, n.AlgorithmStrategyLog.NORMAL_COLOR), 
n.AlgorithmStrategyLog.table(function(t) {
return JSON.parse(JSON.stringify(t, function(t, r) {
var e;
if ("trait" !== t && "flow" !== t) return "source" === t ? "".concat(null !== (e = o.algorithmStrategy.context.algorithmSourceType[r]) && void 0 !== e ? e : r, "(").concat(r, ")") : "algorithmId" === t ? "".concat(o.algorithmStrategy.context.algorithmInfo.getOfferTypeDisplayName(r), "(").concat(r, ")") : r;
}));
}(r));
var i = o.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG.map(n.formatTraitNameWithDescription);
i.length > 0 && (n.AlgorithmStrategyLog.log(e, n.AlgorithmStrategyLog.NORMAL_COLOR), 
n.AlgorithmStrategyLog.table(i));
};
var o = e(5800), n = e(5815);
},
3187: function(t, r) {
var e = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.BUILTIN_JSON_RULE_OPERATORS = void 0, r.BUILTIN_JSON_RULE_OPERATORS = {
"=": function(t, r) {
return t === r;
},
"!=": function(t, r) {
return t !== r;
},
"<": function(t, r) {
return t < r;
},
"<=": function(t, r) {
return t <= r;
},
">": function(t, r) {
return t > r;
},
">=": function(t, r) {
return t >= r;
},
"∈": function(t, r) {
return Array.isArray(r) && r.includes(t);
},
"∉": function(t, r) {
return !Array.isArray(r) || !r.includes(t);
},
"∋": function(t, r) {
return Array.isArray(t) && t.includes(r);
},
"∌": function(t, r) {
return !Array.isArray(t) || !t.includes(r);
},
"~": function(t, r) {
var o = e(Array.isArray(r) ? r : [], 2), n = o[0], i = o[1];
return "number" == typeof t && t >= n && t <= i;
},
empty: function(t) {
return null == t || "" === t || Array.isArray(t) && 0 === t.length;
},
isDefined: function(t) {
return null != t;
},
startsWith: function(t, r) {
return "string" == typeof t && "string" == typeof r && t.startsWith(r);
},
endsWith: function(t, r) {
return "string" == typeof t && "string" == typeof r && t.endsWith(r);
},
includes: function(t, r) {
return "string" == typeof t && "string" == typeof r && t.includes(r);
},
match: function(t, r) {
return "string" == typeof t && (r instanceof RegExp ? r : new RegExp(String(r))).test(t);
},
isEmpty: function(t) {
return Array.isArray(t) && 0 === t.length;
}
};
},
3239: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.RULE_FACT_COMMENT_CONTEXT_KEY = r.RULE_LOOP_BINDINGS_CONTEXT_KEY = r.RULE_TRAIT_PROPS_CONTEXT_KEY = r.RULE_RESOLVED_OPERATOR_CONTEXT_KEY = void 0, 
r.RULE_RESOLVED_OPERATOR_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.ruleResolvedOperator"), 
r.RULE_TRAIT_PROPS_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.traitProps"), 
r.RULE_LOOP_BINDINGS_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.loopBindings"), 
r.RULE_FACT_COMMENT_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.factComment");
},
3325: function(t, r, e) {
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, n = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmPriorityListOperator = void 0;
var a = e(4246), l = [], c = function() {
function t() {}
return Object.defineProperty(t, "algorithmPriorityList", {
get: function() {
return Object.freeze(n([], o(l), !1));
},
enumerable: !1,
configurable: !0
}), t.unshift = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.unshift.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.unshift.options)), !1)), 
!0);
}, t.push = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.push.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.push.options)), !1)), 
!0);
}, t.insertBefore = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i, 0 ], o((0, a.transformAlgorithmId)(e, t.insertBefore.options)), !1)), 
!0);
}, t.insertAfter = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i + 1, 0 ], o((0, a.transformAlgorithmId)(e, t.insertAfter.options)), !1)), 
!0);
}, t.remove = function(t) {
if ((0, a.isAbsentAlgorithmIdArg)(t)) return !1;
var r = (0, a.toArray)(t), e = new Set(r), o = l.filter(function(t) {
return !e.has(t.algorithmId);
}), n = o.length !== l.length;
return n && (l = o), n;
}, t.removeCategory = function(t) {
if (null == t) return !1;
var r = (0, a.CATEGORY_TO_ENUM)()[t], e = l.filter(function(t) {
return !Object.values(r).includes(t.algorithmId);
}), o = e.length !== l.length;
return o && (l = e), o;
}, t.replaceFirst = function(r, e) {
if ((0, a.isAbsentAlgorithmIdArg)(r) || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = (0, a.toArray)(r), c = new Set(i), s = (0, a.transformAlgorithmId)(e, t.replaceFirst.options), u = l.findIndex(function(t) {
return c.has(t.algorithmId);
});
if (-1 === u) return !1;
var g = n([], o(l), !1);
return g.splice.apply(g, n([ u, 1 ], o(s), !1)), l = g, !0;
}, t.replace = function(r, e) {
var c, s;
if ((0, a.isAbsentAlgorithmIdArg)(r) || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.toArray)(r), g = new Set(u), f = (0, a.transformAlgorithmId)(e, t.replace.options), h = !1, d = [];
try {
for (var p = i(l), y = p.next(); !y.done; y = p.next()) {
var S = y.value;
g.has(S.algorithmId) ? (d.push.apply(d, n([], o(f), !1)), h = !0) : d.push(S);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
y && !y.done && (s = p.return) && s.call(p);
} finally {
if (c) throw c.error;
}
}
return h && (l = d), h;
}, t.replaceCategory = function(r, e) {
var c, s;
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.CATEGORY_TO_ENUM)()[r], g = !1, f = [];
try {
for (var h = i(l), d = h.next(); !d.done; d = h.next()) {
var p = d.value;
Object.values(u).includes(p.algorithmId) ? (f.push.apply(f, n([], o((0, a.transformAlgorithmId)(e, t.replaceCategory.options)), !1)), 
g = !0) : f.push(p);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
d && !d.done && (s = h.return) && s.call(h);
} finally {
if (c) throw c.error;
}
}
return g && (l = f), g;
}, t.replaceAll = function(r) {
return !(0, a.isAbsentReplaceAllAlgorithmIdArg)(r) && (l = (0, a.transformAlgorithmId)(r, t.replaceAll.options), 
!0);
}, t.clear = function() {
l.length = 0;
}, t;
}();
r.AlgorithmStrategyAlgorithmPriorityListOperator = c;
},
3374: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.preprocess = function(t, r) {
return n(this, void 0, Promise, function() {
var e, n, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U, q, H;
return i(this, function(i) {
switch (i.label) {
case 0:
switch (c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-互斥-进入：流：".concat(f.AlgorithmStrategyProcessType.PREPROCESS_MUTEX, ", 类型：").concat(r), s.AlgorithmStrategyLog.PREPROCESS_COLOR), 
g.AlgorithmStrategyAlgorithmListOperator._process = "pre", t.process = f.AlgorithmStrategyProcessType.PREPROCESS_MUTEX, 
t.traits = [], t.preprocessType = r, r) {
case d.AlgorithmStrategyPreprocessType.DEFAULT:
e = c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_MUTEX_PREPROCESS_TRAITS_CONFIG();
break;

case d.AlgorithmStrategyPreprocessType.GUIDE:
e = c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_GUIDE_MUTEX_PREPROCESS_TRAITS_CONFIG();
break;

case d.AlgorithmStrategyPreprocessType.REVIVE:
e = c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_REVIVE_MUTEX_PREPROCESS_TRAITS_CONFIG();
break;

default:
return s.AlgorithmStrategyLog.error("预处理-互斥-传入的预处理类型：".concat(r, " 无法处理！"), s.AlgorithmStrategyLog.PREPROCESS_COLOR), 
[ 2, t ];
}
delete t.disableShareSequence, n = Number.MIN_SAFE_INTEGER, v = -1, b = 0, i.label = 1;

case 1:
if (!(b < e.length)) return [ 3, 7 ];
_ = e[b], C = _.source, T = _.list, t.traits = l([], a(T), !1), delete t.returnState, 
delete t.returnFilter, delete t.disabledTraits, delete t.routerTarget, c.algorithmStrategy.context.CC_DEBUG && ((null == T ? void 0 : T.length) > 0 ? (s.AlgorithmStrategyLog.log("预处理-互斥-源【".concat(b + 1, "/").concat(e.length, "】：【源:").concat((0, 
p.preprocessAlgorithmSourceKey)(C), "(").concat(C, ")】执行列表："), p.PREPROCESS_SOURCE_START_COLOR), 
s.AlgorithmStrategyLog.table(T.map(s.formatTraitNameWithDescription))) : s.AlgorithmStrategyLog.log("预处理-互斥-源【".concat(b + 1, "/").concat(e.length, "】：【源:").concat((0, 
p.preprocessAlgorithmSourceKey)(C), "(").concat(C, ")】执行列表为空"), p.PREPROCESS_SOURCE_START_COLOR)), 
O = 0, (0, S.clearPreprocessMutexRouterPatch)(), P = 0, i.label = 2;

case 2:
if (!(P < T.length)) return [ 3, 5 ];
if (R = T[P], m(t, R)) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-互斥-【源:".concat((0, 
p.preprocessAlgorithmSourceKey)(C), "(").concat(C, ")】：执行特性【").concat(P + 1, "/").concat(T.length, "】：").concat(R).concat(window.traitConfigDebugInfo.getTraitClassNameDes(R), " 时 returnState = true，被跳过"), p.PREPROCESS_SKIP_COLOR), 
[ 3, 4 ];
if (null === (G = t.disabledTraits) || void 0 === G ? void 0 : G.includes(R)) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-互斥-【源:".concat((0, 
p.preprocessAlgorithmSourceKey)(C), "(").concat(C, ")】：执行特性【").concat(P + 1, "/").concat(T.length, "】：").concat(R).concat(window.traitConfigDebugInfo.getTraitClassNameDes(R), " 时 disabledTraits 为 true 时跳过余下特性"), p.PREPROCESS_SKIP_COLOR), 
[ 3, 4 ];
if (null != (D = t.routerTarget)) {
if (R !== D) return [ 3, 4 ];
delete t.routerTarget;
}
return (null == (N = TRAIT(R)) ? void 0 : N.onActiveCondition) && (null == N ? void 0 : N.active) && A(N) ? (c.algorithmStrategy.context.CONFLICT_DEBUG && y.AlgorithmStrategyConflictRecorder.recordTraitCall(R), 
j = {
tag: "mutex",
source: C,
sourceIndex: b,
sourceTotal: e.length,
traitIndex: P,
traitTotal: T.length,
traitSource: R,
trait: N
}, [ 4, (0, u.runPreprocess)(N, t, j) ]) : [ 3, 4 ];

case 3:
(K = i.sent()).status ? (c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-互斥-【源:".concat((0, 
p.preprocessAlgorithmSourceKey)(C), "(").concat(C, ")】：特性【").concat(P + 1, "/").concat(T.length, "】：").concat(R).concat(window.traitConfigDebugInfo.getTraitClassNameDes(R), "-算法列表：").concat(JSON.stringify(g.AlgorithmStrategyAlgorithmListOperator.algorithmList)), (0, 
p.getPreprocessTraitTraceColor)(P)), n = C, v = b, t.process = f.AlgorithmStrategyProcessType.PREPROCESS_MUTEX_SUCCESS, 
S.preprocessMutexRouterPatch[R] || O++) : c.algorithmStrategy.context.CC_DEBUG && (0, 
p.shouldLogPreprocessFailResult)(K) && (F = (0, p.formatPreprocessRunLog)("mutex", {
source: C,
trait: R
}, K).line, s.AlgorithmStrategyLog.log(F, (0, p.getPreprocessTraitTraceColor)(P))), 
i.label = 4;

case 4:
return P++, [ 3, 2 ];

case 5:
if (O > 0) return [ 3, 7 ];
i.label = 6;

case 6:
return b++, [ 3, 1 ];

case 7:
if (0 === (null === (B = g.AlgorithmStrategyAlgorithmListOperator.algorithmList) || void 0 === B ? void 0 : B.length) && c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.warn("【算法策略】- 异常：", h.AlgorithmStrategyWarnType.PREPROCESS_MUTEX_ALGORITHM_LIST_EMPTY), 
t.process !== f.AlgorithmStrategyProcessType.PREPROCESS_MUTEX_SUCCESS && (t.process = f.AlgorithmStrategyProcessType.PREPROCESS_MUTEX_FAIL, 
c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-互斥-阶段所有特性均未命中，继续共享阶段", s.AlgorithmStrategyLog.FALLBACK_COLOR)), 
t.disableShareSequence) return [ 2, o({}, t) ];
if (r !== d.AlgorithmStrategyPreprocessType.DEFAULT) return [ 2, o({}, t) ];
t.process = f.AlgorithmStrategyProcessType.PREPROCESS_SHARE, t.traits = [], delete t.disabledTags, 
delete t.returnState, delete t.returnFilter, delete t.disabledTraits, delete t.routerTarget, 
E = c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SHARE_PREPROCESS_TRAITS_CONFIG, 
L = 0, i.label = 8;

case 8:
if (!(L < E.length)) return [ 3, 13 ];
if (I = E[L], x = (0, p.formatPreprocessTagProgress)(I.tag, L, E.length), t.traits = l([], a(I.list.map(function(t) {
return t.traitClassName;
})), !1), null === (U = t.disabledTags) || void 0 === U ? void 0 : U.includes(I.tag)) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-共享-跳过共享 ".concat(x, " 被 disabledTags 禁用"), s.AlgorithmStrategyLog.PREPROCESS_COLOR), 
[ 3, 12 ];
delete t.returnState, delete t.returnFilter, delete t.disabledTraits, delete t.routerTarget, 
t.__patch_source_ && (n = t.__patch_source_), c.algorithmStrategy.context.CC_DEBUG && I.list.length > 0 && (s.AlgorithmStrategyLog.log("预处理-共享-特性【".concat(x, " - 源：").concat((0, 
p.preprocessAlgorithmSourceKey)(n), "(").concat(n, ")】执行列表："), (0, p.getPreprocessSourceTraceColor)(v)), 
s.AlgorithmStrategyLog.table(I.list.map(function(t) {
return (0, s.formatTraitNameWithDescription)(t.traitClassName);
}))), k = 0, i.label = 9;

case 9:
if (!(k < I.list.length)) return [ 3, 12 ];
if (w = I.list[k], m(t, w.traitClassName)) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-共享-特性【".concat(x, "】：执行特性【").concat(k + 1, "/").concat(I.list.length, "】 returnState 为 true，被跳过"), p.PREPROCESS_SKIP_COLOR), 
[ 3, 11 ];
if (null === (q = t.disabledTraits) || void 0 === q ? void 0 : q.includes(w.traitClassName)) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-共享-特性【".concat(x, "】：执行特性【").concat(k + 1, "/").concat(I.list.length, "】：").concat(w.traitClassName).concat(window.traitConfigDebugInfo.getTraitClassNameDes(w.traitClassName), " disabledTraits 为 true 时跳过余下特性"), p.PREPROCESS_SKIP_COLOR), 
[ 3, 11 ];
if (null != (D = t.routerTarget)) {
if (w.traitClassName !== D) return [ 3, 11 ];
delete t.routerTarget;
}
return w.sourceList && !w.sourceList.includes(n) ? (c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-共享-特性【".concat(x, "】：执行特性【").concat(k + 1, "/").concat(I.list.length, "】：").concat(w.traitClassName).concat(window.traitConfigDebugInfo.getTraitClassNameDes(w.traitClassName), " 互斥胜出源：").concat((0, 
p.formatPreprocessSource)(n), "，允许来源：").concat((0, p.formatPreprocessSourceList)(w.sourceList), "，不匹配，跳过"), p.PREPROCESS_SKIP_COLOR), 
[ 3, 11 ]) : (null == (N = TRAIT(w.traitClassName)) ? void 0 : N.onActiveCondition) && (null == N ? void 0 : N.active) && A(N) ? (c.algorithmStrategy.context.CONFLICT_DEBUG && y.AlgorithmStrategyConflictRecorder.recordTraitCall(w.traitClassName), 
j = {
tag: I.tag,
source: n,
sourceIndex: v,
tagIndex: L,
tagTotal: E.length,
traitIndex: k,
traitTotal: I.list.length,
traitSource: w.traitClassName,
trait: N
}, [ 4, (0, u.runPreprocess)(N, t, j) ]) : [ 3, 11 ];

case 10:
(K = i.sent()).status ? t.process = f.AlgorithmStrategyProcessType.PREPROCESS_SHARE_SUCCESS : c.algorithmStrategy.context.CC_DEBUG && (0, 
p.shouldLogPreprocessFailResult)(K) && (M = (0, p.getPreprocessTraitTraceColor)(k), 
F = (0, p.formatPreprocessRunLog)("share", {
source: n,
tag: I.tag,
trait: w.traitClassName
}, K).line, s.AlgorithmStrategyLog.log(F, M)), i.label = 11;

case 11:
return k++, [ 3, 9 ];

case 12:
return L++, [ 3, 8 ];

case 13:
return 0 === (null === (H = g.AlgorithmStrategyAlgorithmListOperator.algorithmList) || void 0 === H ? void 0 : H.length) && c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.warn("【算法策略】- 异常：", h.AlgorithmStrategyWarnType.PREPROCESS_SHARE_SEQUENCE_ALGORITHM_LIST_EMPTY), 
t.process !== f.AlgorithmStrategyProcessType.PREPROCESS_SHARE_SUCCESS && (t.process = f.AlgorithmStrategyProcessType.PREPROCESS_SHARE_FAIL, 
c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("预处理-共享-阶段失败", s.AlgorithmStrategyLog.FALLBACK_COLOR)), 
delete t.disableShareSequence, delete t.disabledTags, delete t.returnState, delete t.returnFilter, 
delete t.disabledTraits, delete t.routerTarget, delete t.__patch_source_, [ 2, o({}, t) ];
}
});
});
};
var c = e(5800), s = e(5815), u = e(4386), g = e(261), f = e(7880), h = e(777), d = e(7611), p = e(7871), y = e(8011), S = e(7894);
function m(t, r) {
var e = t, o = e.returnState, n = e.returnFilter;
return !0 === o && !(null == n ? void 0 : n.includes(r));
}
function A(t) {
return t && "function" == typeof t.onPreprocessConditions && "function" == typeof t.onPreprocessActions;
}
},
3381: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyReturnStateProcessType = void 0, function(t) {
t.DEFAULT = "默认", t.POST_SDK_REQUEST_SUCCESS = "后处理阶段 SDK 请求成功后";
}(e || (r.AlgorithmStrategyReturnStateProcessType = e = {}));
},
3768: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.sdkRequest = function(t, r) {
return o(this, void 0, Promise, function() {
return n(this, function() {
return t.process = "preprocess" === r ? c.AlgorithmStrategyProcessType.PREPROCESS_SDK : c.AlgorithmStrategyProcessType.POSTPROCESS_SDK, 
t.traits = [], i.algorithmStrategy.context.CONFLICT_DEBUG && a.AlgorithmStrategyConflictRecorder.beginSDKRequest(), 
"preprocess" === r ? [ 2, h(t) ] : [ 2, d(t) ];
});
});
}, r.isSDKRequestTrait = function(t) {
return t && "function" == typeof t.onSDKArgsConditions && "function" == typeof t.onSDKArgsActions;
}, r.shouldSkipSDKItem = function(t, r, e, a) {
return o(this, void 0, Promise, function() {
return n(this, function(o) {
switch (o.label) {
case 0:
return [ 4, (0, l.invokeLifeCycle)(i.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ITEM_BEFORE_CONFIG, "onAlgorithmStrategySDKItemBefore", t, r, e, a) ];

case 1:
return [ 2, o.sent().some(function(t) {
return "object" == typeof t && null !== t && !1 === t.isRun;
}) ];
}
});
});
};
var i = e(5800), a = e(8011), l = e(9351), c = e(7880), s = e(4600), u = e(4568), g = e(2616), f = e(1688);
function h(t) {
return o(this, void 0, Promise, function() {
var r;
return n(this, function(e) {
switch (e.label) {
case 0:
return r = i.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_PREPROCESS_BETWEEN_NORMAL_AND_FALLBACK_TRAITS_CONFIG, 
[ 4, (0, l.invokeLifeCycle)(i.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_BEFORE_TRAITS_CONFIG, "onAlgorithmStrategySDKBefore") ];

case 1:
return e.sent(), [ 4, (0, f.priorityRequest)(t) ];

case 2:
return e.sent() ? [ 4, (0, l.invokeLifeCycle)(r, "onAlgorithmStrategySDKBetween", t) ] : [ 3, 5 ];

case 3:
case 7:
return e.sent(), [ 4, (0, g.postRequest)(t) ];

case 4:
case 8:
case 11:
return e.sent(), [ 2, t ];

case 5:
return [ 4, (0, u.normalRequest)(t, "preprocess") ];

case 6:
return e.sent() ? [ 4, (0, l.invokeLifeCycle)(r, "onAlgorithmStrategySDKBetween", t) ] : [ 3, 9 ];

case 9:
return [ 4, (0, l.invokeLifeCycle)(r, "onAlgorithmStrategySDKBetween", t) ];

case 10:
return e.sent(), [ 4, (0, s.fallbackRequest)(t) ];
}
});
});
}
function d(t) {
return o(this, void 0, Promise, function() {
return n(this, function(r) {
switch (r.label) {
case 0:
return [ 4, (0, u.normalRequest)(t, "postprocess") ];

case 1:
return r.sent(), [ 2, t ];
}
});
});
}
},
3774: function(t, r, e) {
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, n = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.snapshot = function() {
(0, s.syncCurrentGameIndex)(), (0, s.syncCurrentRoundIndex)();
var t, r, e = l.algorithmStrategyRobotAlgorithmStats.snapshot(), i = e.algorithmCounts, a = e.algorithmBlockNameCounts, f = e.algorithmBlockNameTraitsCounts, y = e.algorithmTraitsAlgorithmNameCounts, S = e.finalResultTraitAlgorithmCounts, m = e.partialActionSuccessRecords;
return {
gameIndex: c.conflictStore.gameIndex,
roundIndex: c.conflictStore.roundIndex,
events: Object.freeze(n([], o(c.conflictStore.events), !1)),
roundEvents: Object.freeze(n([], o(c.conflictStore.roundEvents), !1)),
traitStats: g(c.conflictStore.traitCallCount, c.conflictStore.events, !1),
roundTraitStats: g(c.conflictStore.roundTraitCallCount, c.conflictStore.roundEvents, !0),
allTraitStats: g(c.conflictStore.allTraitCallCount, c.conflictStore.allEvents, !1, !0),
traitTriggerStats: Object.freeze(n([], o(c.conflictStore.traitTriggerCount.entries()), !1).map(function(t) {
var r = o(t, 2);
return {
trait: r[0],
triggerCount: r[1]
};
}).sort(function(t, r) {
return r.triggerCount - t.triggerCount;
})),
algorithmStats: i,
algorithmBlockNameStats: a,
algorithmBlockNameTraitsCounts: f,
algorithmTraitsAlgorithmNameCounts: y,
finalResultTraitAlgorithmCounts: S,
gameAlgorithmStats: p((0, u.getCurrentGameAlgorithmCount)(), (0, u.getCurrentGameAlgorithmLastTraitSource)(), (0, 
u.getCurrentGameAlgorithmTraitCount)()),
gameAlgorithmBlockNameStats: h(null !== (t = c.conflictStore.gameAlgorithmBlockNameCount.get(c.conflictStore.gameIndex)) && void 0 !== t ? t : new Map(), null !== (r = c.conflictStore.gameAlgorithmBlockNames.get(c.conflictStore.gameIndex)) && void 0 !== r ? r : new Map()),
algorithmGameStats: Object.freeze(n([], o(c.conflictStore.gameAlgorithmCount.keys()), !1).filter(function(t) {
var r, e;
return (null !== (e = null === (r = c.conflictStore.gameAlgorithmCount.get(t)) || void 0 === r ? void 0 : r.size) && void 0 !== e ? e : 0) > 0;
}).sort(function(t, r) {
return t - r;
}).map(function(t) {
var r, e, i, a, l, s, u, g, f;
return {
gameIndex: t,
stats: p(null !== (r = c.conflictStore.gameAlgorithmCount.get(t)) && void 0 !== r ? r : new Map(), null !== (e = c.conflictStore.gameAlgorithmLastTraitSource.get(t)) && void 0 !== e ? e : new Map(), null !== (i = c.conflictStore.gameAlgorithmTraitCount.get(t)) && void 0 !== i ? i : new Map()),
blockNameStats: h(null !== (a = c.conflictStore.gameAlgorithmBlockNameCount.get(t)) && void 0 !== a ? a : new Map(), null !== (l = c.conflictStore.gameAlgorithmBlockNames.get(t)) && void 0 !== l ? l : new Map()),
blockNameTraitsStats: (g = null !== (s = c.conflictStore.gameAlgorithmBlockNameCount.get(t)) && void 0 !== s ? s : new Map(), 
f = null !== (u = c.conflictStore.gameAlgorithmBlockNameTraitCount.get(t)) && void 0 !== u ? u : new Map(), 
Object.freeze(n([], o(g.entries()), !1).map(function(t) {
var r = o(t, 2), e = r[0], n = r[1];
return {
blockNameKey: e,
traitsCounts: d(f.get(e)),
count: n
};
}).filter(function(t) {
return t.count > 0 && t.traitsCounts.length > 0;
}).sort(function(t, r) {
return r.count - t.count || t.blockNameKey.localeCompare(r.blockNameKey);
})))
};
})),
roundFinalResults: Object.freeze(n([], o(c.conflictStore.roundFinalResults.values()), !1).sort(function(t, r) {
return t.roundIndex - r.roundIndex;
})),
partialActionSuccessRecords: m
};
};
var a = e(4727), l = e(3003), c = e(1092), s = e(1425), u = e(9818);
function g(t, r, e, l) {
var c, s;
void 0 === l && (l = !1);
var u = new Map(), g = new Map(), h = new Map();
try {
for (var d = i(r), p = d.next(); !p.done; p = d.next()) {
var y = p.value, S = y.affectedTrait;
if (S) {
var m = e ? y.roundAffectedTraitCallIndex : y.affectedTraitCallIndex, A = l ? "".concat(y.gameIndex, ":") : "", v = m && m > 0 ? "".concat(A).concat(m) : "".concat(A, "event:").concat(y.id);
"warn" === y.severity ? f(h, S, v) : "conflict" === y.severity && (f(u, S, v), y.type === a.AlgorithmStrategyConflictType.ALGORITHM_OPERATOR_UNSUCCESS && f(g, S, v));
}
}
} catch (t) {
c = {
error: t
};
} finally {
try {
p && !p.done && (s = d.return) && s.call(d);
} finally {
if (c) throw c.error;
}
}
var b = new Set(n(n(n(n([], o(t.keys()), !1), o(u.keys()), !1), o(g.keys()), !1), o(h.keys()), !1));
return Object.freeze(n([], o(b), !1).map(function(r) {
var e, o, n, i, a, l, c, s = null !== (e = t.get(r)) && void 0 !== e ? e : 0, f = null !== (n = null === (o = u.get(r)) || void 0 === o ? void 0 : o.size) && void 0 !== n ? n : 0, d = null !== (a = null === (i = g.get(r)) || void 0 === i ? void 0 : i.size) && void 0 !== a ? a : 0;
return {
trait: r,
callCount: s,
conflictCount: f,
ineffectiveCount: d,
warnCount: null !== (c = null === (l = h.get(r)) || void 0 === l ? void 0 : l.size) && void 0 !== c ? c : 0,
probability: s > 0 ? f / s : 0,
ineffectiveProbability: s > 0 ? d / s : 0
};
}));
}
function f(t, r, e) {
var o = t.get(r);
o || (o = new Set(), t.set(r, o)), o.add(e);
}
function h(t, r) {
return Object.freeze(n([], o(t.entries()), !1).map(function(t) {
var e, n = o(t, 2), i = n[0], a = n[1];
return {
blockNameKey: i,
blockNames: null !== (e = r.get(i)) && void 0 !== e ? e : i.split(l.ALGORITHM_BLOCK_NAME_SEPARATOR),
count: a
};
}).sort(function(t, r) {
return r.count - t.count || t.blockNameKey.localeCompare(r.blockNameKey);
}));
}
function d(t) {
return t ? n([], o(t.entries()), !1).map(function(t) {
var r = o(t, 2);
return {
traitClassName: r[0],
count: r[1]
};
}).sort(function(t, r) {
return r.count - t.count || t.traitClassName.localeCompare(r.traitClassName);
}) : [];
}
function p(t, r, e) {
return void 0 === e && (e = new Map()), Object.freeze(n([], o(t.entries()), !1).map(function(t) {
var n = o(t, 2), i = n[0], a = {
algorithmId: i,
count: n[1]
}, l = r.get(i), c = d(e.get(i));
return l && (a.lastTraitSource = l), c.length > 0 && (a.traitsCounts = c), a;
}).sort(function(t, r) {
return r.count - t.count;
}));
}
},
3817: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
if (n === t) return !1;
var r = i.flow.sdk;
return r && (r.actualAlgorithmId_SDK_REQUEST_BEFORE_Patch = t), n = t, !0;
}, o([ (0, a.patch)({
patchKey: "algoActualId",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch = l;
},
3957: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.createSDKConditionTraceLogger = function(t, r, e, o) {
var c, s, u, g, f = null == t ? void 0 : t.traitName, h = "".concat(null != f ? f : "UnknownTrait").concat(f && null !== (u = null === (s = null === (c = window.traitConfigDebugInfo) || void 0 === c ? void 0 : c.getTraitClassNameDes) || void 0 === s ? void 0 : s.call(c, f)) && void 0 !== u ? u : ""), d = l(o), p = a(e, o), y = {}, S = (0, 
i.createAlgorithmStrategyRuleTraceLogger)({
rulesCount: r,
buildPrefix: function(t) {
return g = t, function(t, r, e, o, n) {
return "".concat(p, "：").concat(o, "：").concat(n, "，").concat((0, i.formatRuleProgress)(t, r));
}(t, r, 0, d, h);
},
color: i.getAlgorithmStrategyTraceResultColor,
fallbackPrefix: "条件计算-结果",
factWrapper: "paren",
separator: "comma"
});
return {
onTrace: function(t) {
"ruleEnd" === t.type && (g = t), S.onTrace(t);
},
addArgs: function(t, r) {
y[t] = r;
},
logResult: function() {
var t, r = null !== (t = null == g ? void 0 : g.flow) && void 0 !== t ? t : "default", e = y[r];
S.logResult(e ? "\n参数：".concat((0, i.formatTraceValue)(e)) : void 0);
},
logSkipped: function(t) {
n.AlgorithmStrategyLog.log("✗ ".concat(p, "：").concat(d, "：").concat(h, "，规则【0/").concat(r, "】，").concat(t), (0, 
i.getAlgorithmStrategyTraceResultColor)(!1));
}
};
}, r.logSDKConditionTraceSkipped = function(t, r, e, o) {
var c, s, u, g = "".concat(t).concat(null !== (u = null === (s = null === (c = window.traitConfigDebugInfo) || void 0 === c ? void 0 : c.getTraitClassNameDes) || void 0 === s ? void 0 : s.call(c, t)) && void 0 !== u ? u : ""), f = l(o), h = a(e, o);
n.AlgorithmStrategyLog.log("✗ ".concat(h, "：").concat(f, "：").concat(g, "，规则【0/0】，").concat(r), (0, 
i.getAlgorithmStrategyTraceResultColor)(!1));
}, r.formatSDKArgsTraitInactiveReason = function(t) {
return t ? "跳过：特性未激活（staticActive=".concat(String(t.staticActive), "，dynamicActive=").concat(String(t.dynamicActive), "）") : "跳过：Trait 实例不存在";
};
var o = e(5800), n = e(5815), i = e(6582);
function a(t, r) {
if (null == (null == t ? void 0 : t.algorithmId)) return "SDK";
var e = null == (null == r ? void 0 : r.itemIndex) ? "" : "【".concat(r.itemIndex + 1).concat(null == r.itemTotal ? "" : "/".concat(r.itemTotal), "】"), n = o.algorithmStrategy.context.algorithmInfo.getOfferTypeDisplayName(t.algorithmId);
return "SDK【算法".concat(e, "：").concat(n, "(").concat(t.algorithmId, ")】");
}
function l(t) {
return null == (null == t ? void 0 : t.traitIndex) ? "特性" : "特性【".concat(t.traitIndex + 1).concat(null == t.traitTotal ? "" : "/".concat(t.traitTotal), "】");
}
},
4046: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoSdkRequestAfterActualIdPatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
if (n === t) return !1;
var r = i.flow.sdk;
return r && (r.actualAlgorithmId_SDK_REQUEST_AFTER_Patch = t), n = t, !0;
}, o([ (0, a.patch)({
patchKey: "algoActualIdByPos",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoSdkRequestAfterActualIdPatch = l;
},
4050: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmPostListPatch = void 0;
var n, i = e(8281), a = e(4246), l = e(7594), c = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
return void 0 !== t && t === r && t.length === r.length && JSON.stringify(t) === JSON.stringify(r);
}(n, t)) return !1;
for (var r = 0; r < t.length; r++) {
var e = t[r];
e.category = (0, a.getCategoryForAlgorithm)(e.algorithmId), e.algorithmListSource = "post";
}
return n = t, !0;
}, Object.defineProperty(t, "algorithmPostList", {
get: function() {
return i.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList;
},
enumerable: !1,
configurable: !0
}), o([ (0, l.patch)({
patchKey: "algorithmPostList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgorithmPostListPatch = c;
},
4057: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
});
var o = e(5800), n = e(8011), i = e(5815), a = e(9423), l = e(261), c = e(5213), s = e(7594), u = e(2230);
(0, s.patchWatch)(function(t, r) {
r.target !== u.AlgorithmStrategySDKRequest && o.algorithmStrategy.context.CC_DEBUG && i.AlgorithmStrategyLog.log("补丁：".concat(t.patchKey), i.AlgorithmStrategyLog.PATCH_COLOR, r.target, "旧值：", r.prev, "，更新值：", r.next);
var e, s = o.algorithmStrategy.context.CONFLICT_DEBUG && ("algoActualId" === (e = t.patchKey) || "algoActualIdByPos" === e || "algoExpectedId" === e || "algoActualName" === e || "blockIdList" === e || "blockPosList" === e || "blockExtraList" === e), g = o.algorithmStrategy.context.algorithmName, f = o.algorithmStrategy.context.algorithmInfo;
switch (t.patchKey) {
case "algorithmList":
r.next && l.AlgorithmStrategyAlgorithmListOperator.replaceAll(r.next.map(function(t) {
return t.algorithmId;
}));
break;

case "algorithmFallbackList":
r.next && a.AlgorithmStrategyAlgorithmFallbackListOperator.replaceAll(r.next.map(function(t) {
return t.algorithmId;
}));
break;

case "algoActualId":
g.setAlgoActualId(r.next);
break;

case "algoActualIdByPos":
g.setAlgoActualIdByPos(r.next);
break;

case "algoExpectedId":
g.setAlgoExpectedId(r.next);
break;

case "algoActualName":
g.setAlgoActualName(r.next), g.setAlgoActualChangeName(r.next);
break;

case "blockIdList":
f.setBlockIdList(r.next);
break;

case "blockPosList":
f.setBlockPosList(r.next);
break;

case "blockExtraList":
f.setBlockExtraList(r.next);
break;

case "positionAdjust":
var h = f.blockIdList, d = f.blockPosList, p = g.algoActualName, y = [ 0, 1, 2 ], S = r.next;
switch (S) {
case hs.AlgorithmStrategyPositionType.LEFT:
y = [ 0, 1, 2 ];
break;

case hs.AlgorithmStrategyPositionType.MIDDLE:
y = [ 2, 0, 1 ];
break;

case hs.AlgorithmStrategyPositionType.RIGHT:
y = [ 2, 1, 0 ];
break;

case hs.AlgorithmStrategyPositionType.MIDDLE_LEFT:
y = [ 1, 0, 2 ];
break;

case hs.AlgorithmStrategyPositionType.RIGHT_LEFT:
y = [ 1, 2, 0 ];
break;

case hs.AlgorithmStrategyPositionType.LEFT_RIGHT:
y = [ 0, 2, 1 ];
break;

default:
o.algorithmStrategy.context.CC_DEBUG && i.AlgorithmStrategyLog.error("AlgorithmStrategyPositionOperator.adjust 调整类型：".concat(S, " 传入错误！"));
}
f.setBlockIdList([ h[y[0]], h[y[1]], h[y[2]] ]), g.setAlgoActualChangeName([ p[y[0]], p[y[1]], p[y[2]] ]), 
f.setBlockPosList([ d[y[0]], d[y[1]], d[y[2]] ]);
}
if (s && null != r.prev) {
var m = function(t) {
var r;
return "positionAdjust" === t ? "positionAdjust" : String(null !== (r = c.flow.process) && void 0 !== r ? r : "").includes("后处理") ? "postprocess" : "preprocess";
}(t.patchKey);
"blockIdList" === t.patchKey && "postprocess" === m && r.target !== u.AlgorithmStrategySDKRequest ? n.AlgorithmStrategyConflictRecorder.recordBlockListFinalCheck({
process: m,
beforeBlockIds: r.prev,
afterBlockIds: r.next,
target: r.target
}) : n.AlgorithmStrategyConflictRecorder.recordPatchUpdate({
process: m,
patchKey: t.patchKey,
prev: r.prev,
next: r.next,
target: r.target,
includeListSnapshots: !1
});
}
});
},
4081: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordPatchUpdate = function(t) {
var r, e, n, i, f, h, d = g.conflictStore.nextOperationOrderValue(), p = null === (r = t.includeListSnapshots) || void 0 === r || r, y = p ? null !== (e = t.beforeList) && void 0 !== e ? e : (0, 
u.createListSnapshot)(l.AlgorithmStrategyAlgorithmListOperator.algorithmList) : void 0, S = p ? null !== (n = t.afterList) && void 0 !== n ? n : (0, 
u.createListSnapshot)(l.AlgorithmStrategyAlgorithmListOperator.algorithmList) : void 0, m = p ? null !== (i = t.beforeFallbackList) && void 0 !== i ? i : (0, 
u.createListSnapshot)(a.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList) : void 0, A = p ? null !== (f = t.afterFallbackList) && void 0 !== f ? f : (0, 
u.createListSnapshot)(a.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList) : void 0, v = !!p && !(0, 
u.isSameListSnapshot)(null != y ? y : [], null != S ? S : []), b = !!p && !(0, u.isSameListSnapshot)(null != m ? m : [], null != A ? A : []);
(0, s.addEvent)(o({
type: c.AlgorithmStrategyConflictType.ALGORITHM_LIST_CHANGED,
severity: "info",
process: null !== (h = t.process) && void 0 !== h ? h : "preprocess",
algorithmListSource: v ? "normal" : b ? "fallback" : void 0,
reason: "外部补丁修改了算法策略数据",
patch: {
patchKey: t.patchKey,
prev: (0, u.cloneSnapshotValue)(t.prev),
next: (0, u.cloneSnapshotValue)(t.next),
target: (0, u.formatPatchTarget)(t.target)
},
operationOrder: d
}, p ? {
beforeAlgorithmList: y,
afterAlgorithmList: S,
beforeAlgorithmFallbackList: m,
afterAlgorithmFallbackList: A
} : {}));
}, r.recordBlockListFinalCheck = function(t) {
var r = (0, u.toNumberList)(t.beforeBlockIds), e = (0, u.toNumberList)(t.afterBlockIds);
if (r && e && !(0, u.isSameNumberList)(r, e)) {
var a = g.conflictStore.nextOperationOrderValue(), l = {
beforeBlockIds: r,
afterBlockIds: e,
blockPatchApplied: !0
};
(function(t, r) {
(0, f.syncCurrentRoundIndex)();
var e = g.conflictStore.roundFinalResults.get(g.conflictStore.roundIndex);
e && g.conflictStore.roundFinalResults.set(g.conflictStore.roundIndex, o(o({}, e), {
operationOrder: r,
sdkData: null == e.sdkData ? e.sdkData : o(o({}, e.sdkData), {
blockIds: null == t.afterBlockIds ? e.sdkData.blockIds : i([], n(t.afterBlockIds), !1)
}),
finalBlockListPatch: t
}));
})(l, a), (0, s.addEvent)({
type: c.AlgorithmStrategyConflictType.ALGORITHM_LIST_CHANGED,
severity: "info",
process: t.process,
reason: "保命大兜底修改了最终出块列表",
patch: {
patchKey: "blockIdList",
prev: r,
next: e,
target: (0, u.formatPatchTarget)(t.target)
},
blockListPatch: l,
operationOrder: a
});
}
};
var a = e(9423), l = e(261), c = e(4727), s = e(6325), u = e(7721), g = e(1092), f = e(1425);
},
4246: function(t, r, e) {
var o = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.CATEGORY_TO_ENUM = void 0, r.toArray = function(t) {
return Array.isArray(t) ? t : [ t ];
}, r.isAbsentAlgorithmIdArg = function(t) {
return null == t || !!Array.isArray(t) && (0 === t.length || t.some(function(t) {
return null == t;
}));
}, r.isAbsentReplaceAllAlgorithmIdArg = function(t) {
return null == t || !!Array.isArray(t) && t.some(function(t) {
return null == t;
});
}, r.transformAlgorithmId = function(t, r) {
return Array.isArray(t) ? t.map(function(t) {
return a(t, r);
}) : [ a(t, r) ];
}, r.getCategoryForAlgorithm = l;
var i = e(5800);
function a(t, r) {
var e, o, n, i, a, c;
return {
algorithmId: t,
tag: null === (e = null == r ? void 0 : r.context) || void 0 === e ? void 0 : e.tag,
category: l(t),
source: null === (o = null == r ? void 0 : r.context) || void 0 === o ? void 0 : o.source,
dynamicSource: null === (n = null == r ? void 0 : r.context) || void 0 === n ? void 0 : n.dynamicSource,
traitSource: null === (i = null == r ? void 0 : r.context) || void 0 === i ? void 0 : i.traitSource,
algorithmListSource: null === (a = null == r ? void 0 : r.context) || void 0 === a ? void 0 : a.algorithmListSource,
router: null === (c = null == r ? void 0 : r.context) || void 0 === c ? void 0 : c.router
};
}
function l(t) {
var e, a;
try {
for (var l = o(Object.entries((0, r.CATEGORY_TO_ENUM)())), c = l.next(); !c.done; c = l.next()) {
var s = n(c.value, 2), u = s[0], g = s[1];
if (Object.values(g).includes(t)) return u;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
c && !c.done && (a = l.return) && a.call(l);
} finally {
if (e) throw e.error;
}
}
return i.algorithmStrategy.context.AlgorithmStrategyCategoryType.BASE;
}
r.CATEGORY_TO_ENUM = function() {
return i.algorithmStrategy.context.categoryToOfferEnum;
};
},
4312: function(t, r, e) {
var o = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.ASContext = l, r.buildLazyConditionContext = c;
var n, i = e(3239), a = Object.create(null);
function l(t, r) {
return algorithmStrategy.context.CC_DEBUG && (n = r), t;
}
function c(t) {
var r, e, l = {}, c = function(r) {
Object.defineProperty(l, r, {
get: function() {
if (!algorithmStrategy.context.CC_DEBUG) return t[r]();
n = void 0;
var e = t[r]();
return void 0 !== n && (a[r] = n, n = void 0), e;
},
enumerable: !0,
configurable: !0
});
};
try {
for (var s = o(Object.keys(t)), u = s.next(); !u.done; u = s.next()) c(u.value);
} catch (t) {
r = {
error: t
};
} finally {
try {
u && !u.done && (e = s.return) && e.call(s);
} finally {
if (r) throw r.error;
}
}
return algorithmStrategy.context.CC_DEBUG && Object.defineProperty(l, i.RULE_FACT_COMMENT_CONTEXT_KEY, {
value: a,
enumerable: !1,
configurable: !0,
writable: !0
}), l;
}
Object.assign(window, {
ASContext: l,
buildLazyConditionContext: c
});
},
4386: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.PreprocessEvaluatorType = void 0, r.runPreprocess = function(t, r, e) {
return n(this, void 0, Promise, function() {
var n, h, d, p, y, S, m, A, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B;
return i(this, function(i) {
switch (i.label) {
case 0:
return n = (0, f.shallowMergePreservingAccessors)(l.algorithmStrategy.context.globalContext(), (0, 
f.mergeConditionContextFromPrototypeChain)(t, "onPreprocessConditionContext", r), {
flow: r
}), h = (0, f.mergePreprocessConditionsFromPrototypeChain)(t), d = h, p = null !== (j = null == e ? void 0 : e.tag) && void 0 !== j ? j : "mutex", 
y = null !== (M = null !== (K = d[p]) && void 0 !== K ? K : d.mutex) && void 0 !== M ? M : [], 
S = l.algorithmStrategy.context.algorithmSourceType, m = Array.isArray(y) ? y : null !== (F = y[S[e.source]]) && void 0 !== F ? F : [], 
[ 4, rulesEngine.getFactValueAsync(n, "platform") ];

case 1:
return A = i.sent(), [ 4, rulesEngine.getFactValueAsync(n, "gameMode") ];

case 2:
return v = i.sent(), b = (0, g.filterRules)(m, {
platform: A,
gameMode: v
}), _ = {
operators: null === (G = t.onPreprocessConditionOperators) || void 0 === G ? void 0 : G.call(t),
target: t
}, (C = l.algorithmStrategy.context.CC_DEBUG ? (0, s.createPreprocessConditionTraceLogger)(e, b.length) : void 0) && (_.debug = {
onTrace: C.onTrace
}), [ 4, rulesEngine.evaluateRulesConditionsFirstMatch(b, n, _) ];

case 3:
return T = i.sent(), O = T.matched, P = null !== (B = T.matchedFlows) && void 0 !== B ? B : [], 
R = O && P.length > 0 ? P[0] : void 0, E = T.resolvedContext, null != (L = null == r ? void 0 : r.__patch_source_) && e.source !== L && (e.source = L), 
I = O && (null == E ? void 0 : E[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY]) ? o(o({}, null != e ? e : {}), ((N = {})[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY] = E[rulesEngine.RULE_RESOLVED_OPERATOR_CONTEXT_KEY], 
N)) : e, x = (0, f.mergeActionsFromPrototypeChain)(t, "onPreprocessActions", r), 
(k = (0, u.resolvePendingActions)("preprocess", x, O ? P : [], e)).length > 0 ? [ 4, (0, 
u.executeActions)("preprocess", k, P, t, r, I, n) ] : [ 3, 5 ];

case 4:
return w = i.sent(), l.algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordPartialActionSuccess({
process: "preprocess",
traitSource: e.traitSource,
matchedRuleFlow: R,
results: w
}), D = w.some(function(t) {
return ("AlgorithmStrategyAlgorithmPriorityListOperator" === t.operator || "AlgorithmStrategyAlgorithmListOperator" === t.operator || "AlgorithmStrategyAlgorithmPostListPatchOperator" === t.operator || "AlgorithmStrategyAlgorithmFallbackListOperator" === t.operator) && t.status;
}), null == C || C.logResult((0, s.formatPreprocessActionMessages)(w), D), [ 2, {
status: D,
conditionMatched: O,
type: a.PreprocessActionEvaluatorSuccess,
matchedRuleFlow: R
} ];

case 5:
return null == C || C.logResult(O ? "\n命中规则无对应动作" : "\n条件未命中，动作未执行", !1), [ 2, {
status: !1,
conditionMatched: O,
type: a.PreprocessActionEvaluatorFail,
matchedRuleFlow: R
} ];
}
});
});
};
var a, l = e(5800), c = e(8011), s = e(6242), u = e(6074), g = e(2848), f = e(2436);
!function(t) {
t[t.PreprocessActionEvaluatorSuccess = 0] = "PreprocessActionEvaluatorSuccess", 
t[t.PreprocessActionEvaluatorFail = 1] = "PreprocessActionEvaluatorFail";
}(a || (r.PreprocessEvaluatorType = a = {}));
},
4542: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.formatActionExecuteMessages = function(t) {
var r = t.map(c).filter(function(t) {
return Boolean(t);
});
if (0 !== r.length) return 1 === r.length ? "\n动作：".concat(r[0]) : "\n动作：\n\t".concat(r.join("\n\t"));
};
var o = e(5800), n = e(9423), i = e(261), a = e(8281), l = e(3325);
function c(t) {
var r, e, o, c, f;
if (t.actionType) return t.status ? function(t, r, e, o) {
if ("AlgorithmStrategyAlgorithmPriorityListOperator" === t) return s("算法优先级列表", r, e, o, l.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList);
if ("AlgorithmStrategyAlgorithmListOperator" === t) return s("算法列表", r, e, o, i.AlgorithmStrategyAlgorithmListOperator.algorithmList);
if ("AlgorithmStrategyAlgorithmPostListPatchOperator" === t) return s("算法Post列表", r, e, o, a.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList);
if ("AlgorithmStrategyAlgorithmFallbackListOperator" === t) return s("算法降级列表", r, e, o, n.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList);
if ("AlgorithmStrategyReturnOperator" === t) return "执行 ".concat(r, " 成功，跳过其它特性");
if ("AlgorithmStrategyReturnFilterOperator" === t) return "执行 ".concat(r, " 成功，过滤后续特性");
if ("AlgorithmStrategyDisableShareSequenceOperator" === t) return "执行 ".concat(r, " 成功，跳过整个共享串行阶段");
if ("AlgorithmStrategyDisableOperator" === t) {
if ("disable" === r) return "执行 ".concat(r, " 成功，特性：").concat(g(e[0]), " 被禁用");
if ("disableTag" === r) return "执行 ".concat(r, " 成功，tag：").concat(g(e[0]), " 被禁用");
}
return "执行 ".concat(t, ".").concat(r, " 成功").concat(e.length > 0 ? "，参数：".concat(u(e)) : "");
}(t.operator, t.actionType, null !== (r = t.args) && void 0 !== r ? r : [], t.beforeList) : (o = t.operator, 
c = t.actionType, f = null !== (e = t.args) && void 0 !== e ? e : [], "AlgorithmStrategyAlgorithmPriorityListOperator" === o ? "✗ 算法优先级列表：".concat(h(l.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList), " 执行 ").concat(c).concat(u(f), " 时未生效") : "AlgorithmStrategyAlgorithmListOperator" === o ? "✗ 算法列表：".concat(h(i.AlgorithmStrategyAlgorithmListOperator.algorithmList), " 执行 ").concat(c).concat(u(f), " 时未生效") : "AlgorithmStrategyAlgorithmPostListPatchOperator" === o ? "✗ 算法Post列表：".concat(h(a.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList), " 执行 ").concat(c).concat(u(f), " 时未生效") : "AlgorithmStrategyAlgorithmFallbackListOperator" === o ? "✗ 算法降级列表：".concat(h(n.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList), " 执行 ").concat(c).concat(u(f), " 时未生效") : void 0);
}
function s(t, r, e, o, n) {
var i = o ? "，执行前列表：".concat(h(o)) : "";
return "✓ ".concat(t, "执行 ").concat(r).concat(u(e), " 成功").concat(i, "，执行后列表：").concat(h(n));
}
function u(t) {
return "[".concat(t.map(g).join("、"), "]");
}
function g(t) {
if (Array.isArray(t)) return "[".concat(t.map(g).join("、"), "]");
if ("number" == typeof t) return f(t);
if ("string" == typeof t || "boolean" == typeof t) return String(t);
try {
return JSON.stringify(t);
} catch (r) {
return String(t);
}
}
function f(t) {
var r = o.algorithmStrategy.context.algorithmInfo.getOfferTypeDisplayName(t);
return r ? "".concat(r, "(").concat(t, ")") : String(t);
}
function h(t) {
return 0 === t.length ? "[]" : "[".concat(t.map(function(t) {
return f(t.algorithmId);
}).join("、"), "]");
}
},
4568: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.normalRequest = function(t, r) {
return o(this, void 0, Promise, function() {
var e, o, m, A, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U, q;
return n(this, function(n) {
switch (n.label) {
case 0:
if (t.process = "preprocess" === r ? y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL : y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL, 
e = -1, o = d.AlgorithmStrategyAlgorithmListOperator.algorithmList, algorithmStrategy.context.CC_DEBUG && (0, 
h.logSDKAlgorithmListWithTraits)("SDK 请求-算法列表", o), m = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
t.traits = m, "preprocess" === r && s.algorithmStrategyDot.preprocessNormalPush(o.map(s.toAlgorithmStrategyDotItem)), 
!(o.length > 0)) return [ 3, 11 ];
for ("preprocess" === r ? t.algorithmList = o : t.postAlgorithmList = o, "preprocess" === r && algorithmStrategy.context.algorithmStrategySourceLevelInfo.setAlgorithmSourceLevel(o[0].source), 
A = function(t) {
var r = o[t].router;
if (!(r && "adjust" in r)) return "continue";
var e = r.adjust, n = o.find(function(t) {
return t.algorithmId === e.algorithmId;
});
n && ("next" === e.type ? n.router = {
type: "next"
} : delete n.router);
}, b = 0; b < o.length; b++) A(b);
v = Date.now(), b = 0, n.label = 1;

case 1:
if (!(b < o.length)) return [ 3, 10 ];
if (_ = o[b], C = _.router, "preprocess" === r) {
if (null === (q = algorithmStrategy.context.preprocess_sdk_strategy) || void 0 === q ? void 0 : q.continue(_.algorithmId)) return t.sdk || (t.sdk = {
blockIds: [],
blockNames: [],
expectedAlgorithmIdPatch: e,
expectedAlgorithmId: e,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: e,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: e,
actualAlgorithmId: e
}), [ 3, 9 ];
if (Date.now() - v > algorithmStrategy.context.timeout.preprocess_normalAlgorithm_sdk) return algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "timeout",
algorithmId: _.algorithmId
}), [ 3, 10 ];
}
return [ 4, (0, S.shouldSkipSDKItem)(_, "normal", t, b) ];

case 2:
if (n.sent()) return algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemSkipped(_, "SDK item before 生命周期要求跳过"), 
[ 3, 9 ];
algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemRequested(r, _), 
T = p.AlgorithmStrategySDKRequest.createBaseInputArgs(), O = [], P = {}, R = algorithmStrategy.context.CC_DEBUG ? [] : void 0, 
E = 0, n.label = 3;

case 3:
return E < m.length ? (L = m[E], I = {
itemIndex: b,
itemTotal: o.length,
traitIndex: E,
traitTotal: algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG.length
}, (null == O ? void 0 : O.includes(L)) ? (algorithmStrategy.context.CC_DEBUG && (x = P[L], 
(0, f.logSDKConditionTraceSkipped)(L, x ? "跳过：被前置特性【".concat((0, g.formatTraitNameWithDescription)(x), "】通过 disableTraits 禁用") : "跳过：被前置特性 disableTraits 禁用", _, I)), 
[ 3, 6 ]) : (null == (k = TRAIT(L)) ? void 0 : k.onActiveCondition) && (null == k ? void 0 : k.active) ? (0, 
S.isSDKRequestTrait)(k) ? [ 4, (0, u.mergeSDKActionsArgs)(k, t, T, _, I) ] : [ 3, 5 ] : (algorithmStrategy.context.CC_DEBUG && (0, 
f.logSDKConditionTraceSkipped)(L, (0, f.formatSDKArgsTraitInactiveReason)(k), _, I), 
[ 3, 6 ])) : [ 3, 7 ];

case 4:
if (w = n.sent()) {
if (D = w.merged, N = w.args, void 0 !== D.disableTraits) {
if (algorithmStrategy.context.CC_DEBUG) try {
for (B = void 0, j = i(D.disableTraits), K = j.next(); !K.done; K = j.next()) M = K.value, 
O.includes(M) || (P[M] = L);
} catch (t) {
B = {
error: t
};
} finally {
try {
K && !K.done && (U = j.return) && U.call(j);
} finally {
if (B) throw B.error;
}
}
O = l([], a(new Set(l(l([], a(O), !1), a(D.disableTraits), !1))), !1);
}
p.AlgorithmStrategySDKRequest.mergeToInputArgs(T, D, L), algorithmStrategy.context.CC_DEBUG && (null == R || R.push({
traitClassName: (0, g.formatTraitNameWithDescription)(L),
args: N
}));
}
return [ 3, 6 ];

case 5:
algorithmStrategy.context.CC_DEBUG && (0, f.logSDKConditionTraceSkipped)(L, "跳过：不是 SDK 参数特性", _, I), 
n.label = 6;

case 6:
return E++, [ 3, 3 ];

case 7:
return algorithmStrategy.context.CC_DEBUG && (g.AlgorithmStrategyLog.log("SDK 算法列表-请求-合并参数：", g.AlgorithmStrategyLog.NORMAL_COLOR), 
g.AlgorithmStrategyLog.table(null != R ? R : [])), [ 4, p.AlgorithmStrategySDKRequest.request(T, _, t) ];

case 8:
if (F = n.sent(), algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSDKItemResult(_, F), 
null == F ? void 0 : F.SDK_SUCCESS) {
if ("postprocess" === r && s.algorithmStrategyDot.postprocessSuccessNormalPush([ (0, 
s.toAlgorithmStrategyDotItem)(_) ]), algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordSuccessfulSDKResult(r, F), 
t.process = "preprocess" === r ? y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_SUCCESS : y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_SUCCESS, 
"preprocess" === r && _.dynamicSource && algorithmStrategy.context.algorithmStrategySourceLevelInfo.setAlgorithmSourceLevel(_.dynamicSource), 
!(null == C ? void 0 : C.type) || "break" === (null == C ? void 0 : C.type)) return algorithmStrategy.context.CONFLICT_DEBUG && (G = t, 
c.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "break" === (null == C ? void 0 : C.type) ? "success-router-break" : "success-default-break",
algorithmId: _.algorithmId,
routerType: null == C ? void 0 : C.type,
returnState: !0 === G.returnState,
returnStateProcessType: null == G.returnStateProcessType ? void 0 : String(G.returnStateProcessType),
detail: "break" === (null == C ? void 0 : C.type) ? "router.type 为 break，SDK 成功后停止" : !0 === G.returnState ? "returnState 已设置".concat(null == G.returnStateProcessType ? "" : "（".concat(String(G.returnStateProcessType), "）"), "，且未配置 router.next，SDK 成功后停止") : "未配置 router.next，SDK 成功后默认停止"
})), [ 3, 10 ];
if ("next" === C.type) return [ 3, 9 ];
}
n.label = 9;

case 9:
return b++, [ 3, 1 ];

case 10:
return [ 3, 12 ];

case 11:
t.sdk || (t.sdk = {
blockIds: [],
blockNames: [],
SDK_SUCCESS: !1,
expectedAlgorithmIdPatch: e,
expectedAlgorithmId: e,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: e,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: e,
actualAlgorithmId: e
}), t.process = "preprocess" === r ? y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_FAIL : y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_FAIL, 
n.label = 12;

case 12:
return algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.completeSDK(r), 
"preprocess" === r ? (t.process !== y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_SUCCESS && (t.process = y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_FAIL), 
[ 2, t.process == y.AlgorithmStrategyProcessType.PREPROCESS_SDK_NORMAL_SUCCESS ]) : (t.process !== y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_SUCCESS && (t.process = y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_FAIL), 
[ 2, t.process == y.AlgorithmStrategyProcessType.POSTPROCESS_SDK_NORMAL_SUCCESS ]);
}
});
});
};
var c = e(8011), s = e(8637), u = e(2436), g = e(5815), f = e(3957), h = e(3173), d = e(261), p = e(2230), y = e(7880), S = e(3768);
},
4600: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, a = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, l = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, c = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.fallbackRequest = function(t) {
return n(this, void 0, Promise, function() {
var r, e, n, v, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U, q, H;
return i(this, function(i) {
switch (i.label) {
case 0:
if (t.process = m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK, r = -1, 
e = y.AlgorithmStrategyAlgorithmListOperator.algorithmList, n = p.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList, 
v = (null === (q = t.sdk) || void 0 === q ? void 0 : q.SDK_SUCCESS) ? o({}, t.sdk) : void 0, 
u.algorithmStrategyDot.preprocessFallbackPush(n.map(u.toAlgorithmStrategyDotItem)), 
!(n.length > 0)) return [ 3, 11 ];
0 == e.length && algorithmStrategy.context.algorithmStrategySourceLevelInfo.setAlgorithmSourceLevel(n[0].source), 
algorithmStrategy.context.CC_DEBUG && (0, d.logSDKAlgorithmListWithTraits)("SDK 请求-算法降级列表", n, "SDK 请求-算法降级特性列表"), 
b = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
t.algorithmFallbackList = n, t.traits = b, _ = 0, i.label = 1;

case 1:
return _ < n.length ? (C = n[_], (null === (H = algorithmStrategy.context.preprocess_sdk_strategy) || void 0 === H ? void 0 : H.continue(C.algorithmId)) ? [ 3, 9 ] : [ 4, (0, 
A.shouldSkipSDKItem)(C, "fallback", t, _) ]) : [ 3, 10 ];

case 2:
if (i.sent()) return algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemSkipped(C, "SDK item before 生命周期要求跳过"), 
[ 3, 9 ];
algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemRequested("preprocess", C), 
T = S.AlgorithmStrategySDKRequest.createBaseInputArgs(), O = [], P = {}, R = algorithmStrategy.context.CC_DEBUG ? [] : void 0, 
E = 0, i.label = 3;

case 3:
return E < b.length ? (L = b[E], I = {
itemIndex: _,
itemTotal: n.length,
traitIndex: E,
traitTotal: b.length
}, (null == O ? void 0 : O.includes(L)) ? (algorithmStrategy.context.CC_DEBUG && (x = P[L], 
(0, h.logSDKConditionTraceSkipped)(L, x ? "跳过：被前置特性【".concat((0, f.formatTraitNameWithDescription)(x), "】通过 disableTraits 禁用") : "跳过：被前置特性 disableTraits 禁用", C, I)), 
[ 3, 6 ]) : (null == (k = TRAIT(L)) ? void 0 : k.onActiveCondition) && !(null == k ? void 0 : k.active) ? (algorithmStrategy.context.CC_DEBUG && (0, 
h.logSDKConditionTraceSkipped)(L, (0, h.formatSDKArgsTraitInactiveReason)(k), C, I), 
[ 3, 6 ]) : (0, A.isSDKRequestTrait)(k) ? [ 4, (0, g.mergeSDKActionsArgs)(k, t, T, C, I) ] : [ 3, 5 ]) : [ 3, 7 ];

case 4:
if (w = i.sent()) {
if (D = w.merged, N = w.args, void 0 !== D.disableTraits) {
if (algorithmStrategy.context.CC_DEBUG) try {
for (B = void 0, j = a(D.disableTraits), K = j.next(); !K.done; K = j.next()) M = K.value, 
O.includes(M) || (P[M] = L);
} catch (t) {
B = {
error: t
};
} finally {
try {
K && !K.done && (U = j.return) && U.call(j);
} finally {
if (B) throw B.error;
}
}
O = c([], l(new Set(c(c([], l(O), !1), l(D.disableTraits), !1))), !1);
}
S.AlgorithmStrategySDKRequest.mergeToInputArgs(T, D, L), algorithmStrategy.context.CC_DEBUG && (null == R || R.push({
traitClassName: (0, f.formatTraitNameWithDescription)(L),
args: N
}));
}
return [ 3, 6 ];

case 5:
algorithmStrategy.context.CC_DEBUG && (0, h.logSDKConditionTraceSkipped)(L, "跳过：不是 SDK 参数特性", C, I), 
i.label = 6;

case 6:
return E++, [ 3, 3 ];

case 7:
return algorithmStrategy.context.CC_DEBUG && (f.AlgorithmStrategyLog.log("SDK 算法降级列表-请求-合并参数：", f.AlgorithmStrategyLog.NORMAL_COLOR), 
f.AlgorithmStrategyLog.table(null != R ? R : [])), [ 4, S.AlgorithmStrategySDKRequest.request(T, C, t) ];

case 8:
if (F = i.sent(), algorithmStrategy.context.CONFLICT_DEBUG && s.AlgorithmStrategyConflictRecorder.recordSDKItemResult(C, F), 
null == F ? void 0 : F.SDK_SUCCESS) return algorithmStrategy.context.CONFLICT_DEBUG && (G = t, 
s.AlgorithmStrategyConflictRecorder.recordSuccessfulSDKResult("preprocess", F), 
s.AlgorithmStrategyConflictRecorder.recordSDKStopReason({
type: "success-default-break",
algorithmId: C.algorithmId,
returnState: !0 === G.returnState,
returnStateProcessType: null == G.returnStateProcessType ? void 0 : String(G.returnStateProcessType),
detail: !0 === G.returnState ? "returnState 已设置".concat(null == G.returnStateProcessType ? "" : "（".concat(String(G.returnStateProcessType), "）"), "，降级列表 SDK 成功后停止") : "算法降级列表 SDK 成功后固定停止"
})), t.process = m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK_SUCCESS, 
[ 3, 10 ];
i.label = 9;

case 9:
return _++, [ 3, 1 ];

case 10:
return [ 3, 12 ];

case 11:
t.sdk || (t.sdk = {
SDK_SUCCESS: !1,
expectedAlgorithmIdPatch: r,
expectedAlgorithmId: r,
actualAlgorithmId_SDK_REQUEST_BEFORE_Patch: r,
actualAlgorithmId_SDK_REQUEST_AFTER_Patch: r,
actualAlgorithmId: r
}), t.process = m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK_FAIL, i.label = 12;

case 12:
return algorithmStrategy.context.CONFLICT_DEBUG && (s.AlgorithmStrategyConflictRecorder.completeFallbackSDK("preprocess"), 
s.AlgorithmStrategyConflictRecorder.recordPreprocessSuccessButPostprocessReplace(v, t.sdk)), 
t.process !== m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK_SUCCESS && (t.process = m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK_FAIL), 
[ 2, t.process === m.AlgorithmStrategyProcessType.PREPROCESS_SDK_FALLBACK_SUCCESS ];
}
});
});
};
var s = e(8011), u = e(8637), g = e(2436), f = e(5815), h = e(3957), d = e(3173), p = e(9423), y = e(261), S = e(2230), m = e(7880), A = e(3768);
},
4727: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyConflictType = void 0, function(t) {
t[t.ALGORITHM_OPERATOR_UNSUCCESS = 0] = "ALGORITHM_OPERATOR_UNSUCCESS", t[t.ALGORITHM_OPERATOR_REPLACE_ALL_SUCCESS = 1] = "ALGORITHM_OPERATOR_REPLACE_ALL_SUCCESS", 
t[t.ALGORITHM_OPERATOR_SAME_SOURCE_SDK_FAIL = 2] = "ALGORITHM_OPERATOR_SAME_SOURCE_SDK_FAIL", 
t[t.ALGORITHM_PRE_PROCESS_SDK_SUCCESS_BUT_POST_PROCESS_REPLACE = 3] = "ALGORITHM_PRE_PROCESS_SDK_SUCCESS_BUT_POST_PROCESS_REPLACE", 
t[t.ALGORITHM_OPERATOR_SUCCESS_BUT_NOT_CONSUME = 4] = "ALGORITHM_OPERATOR_SUCCESS_BUT_NOT_CONSUME", 
t[t.ALGORITHM_RESULT_APPLIED_CONFLICT = 5] = "ALGORITHM_RESULT_APPLIED_CONFLICT", 
t[t.ALGORITHM_LIST_CHANGED = 6] = "ALGORITHM_LIST_CHANGED", t[t.ALGORITHM_ADJUST_RESULT = 7] = "ALGORITHM_ADJUST_RESULT";
}(e || (r.AlgorithmStrategyConflictType = e = {}));
},
4846: function(t, r, e) {
var o = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.collectionAdjust = function(t) {
var r, e, g, f, h, d;
t.process = s.AlgorithmStrategyProcessType.COLLECTION_ADJUST, delete t.returnState, 
delete t.disabledTraits;
var p, y, S = [];
try {
for (var m = o(a.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_COLLECTION_ADJUST_TRAITS_CONFIG), A = m.next(); !A.done; A = m.next()) {
var v = A.value;
if (t.returnState) break;
if (!(null === (h = t.disabledTraits) || void 0 === h ? void 0 : h.includes(v))) {
var b = TRAIT(v);
if ((null == b ? void 0 : b.onActiveCondition) && (null == b ? void 0 : b.active) && u(b)) {
var _ = b.onAlgorithmStrategyCollectionAdjust(t);
if (!_) continue;
if (p = v, y = _.data, a.algorithmStrategy.context.CONFLICT_DEBUG && (l.AlgorithmStrategyConflictRecorder.recordTraitTrigger(p), 
S.push({
traitSource: p,
data: _.data,
returnState: _.returnState,
disableTraits: null == _.disableTraits ? void 0 : i([], n(_.disableTraits), !1)
})), null === (d = _.disableTraits) || void 0 === d ? void 0 : d.length) {
var C = t;
Array.isArray(C.disabledTraits) || (C.disabledTraits = []);
try {
for (var T = (g = void 0, o(_.disableTraits)), O = T.next(); !O.done; O = T.next()) {
var P = O.value;
C.disabledTraits.includes(P) || C.disabledTraits.push(P);
}
} catch (t) {
g = {
error: t
};
} finally {
try {
O && !O.done && (f = T.return) && f.call(T);
} finally {
if (g) throw g.error;
}
}
}
_.returnState && (t.returnState = !0), a.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.log("特性：".concat(v, " 收集物调整："), c.AlgorithmStrategyLog.NORMAL_COLOR, _);
}
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
A && !A.done && (e = m.return) && e.call(m);
} finally {
if (r) throw r.error;
}
}
return Array.isArray(y) && y.length >= 0 ? ("journey" === a.algorithmStrategy.context.gameMode && storage.setItem("chapterCollectionLists", y), 
t.process = s.AlgorithmStrategyProcessType.COLLECTION_ADJUST_SUCCESS) : t.process = s.AlgorithmStrategyProcessType.COLLECTION_ADJUST_FAIL, 
a.algorithmStrategy.context.CONFLICT_DEBUG && l.AlgorithmStrategyConflictRecorder.recordAdjustResult({
process: "collectionAdjust",
success: t.process === s.AlgorithmStrategyProcessType.COLLECTION_ADJUST_SUCCESS,
traitSource: p,
traitResults: S,
collectionList: y,
reason: "收集物调整阶段记录最终收集物列表"
}), delete t.returnState, delete t.disabledTraits, t;
};
var a = e(5800), l = e(8011), c = e(5815), s = e(7880);
function u(t) {
return t && "function" == typeof t.onAlgorithmStrategyCollectionAdjust;
}
},
5213: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.algorithmStrategyPipeline = r.flow = void 0;
var i = e(261), a = e(7880), l = e(9423), c = e(3374), s = e(8350), u = e(3768), g = e(9351), f = e(2806), h = e(4846), d = e(6024), p = e(5800), y = e(2230), S = e(5815), m = e(9223), A = e(8011), v = e(8281), b = e(3325), _ = e(8637);
r.flow = {};
var C = function() {
function t() {
this._sessionInit = !1;
}
return t.prototype.sessionInit = function() {
return o(this, void 0, void 0, function() {
return n(this, function(t) {
switch (t.label) {
case 0:
return this._sessionInit ? [ 2 ] : (p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== session 开始==========================", S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.SESSION_INIT), 
this._sessionInit = !0, r.flow = {
process: a.AlgorithmStrategyProcessType.SESSION_INIT
}, [ 4, (0, g.invokeLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SESSION_INIT_CONFIG, "onAlgorithmStrategySessionInit") ]);

case 1:
return t.sent(), [ 2 ];
}
});
});
}, t.prototype.roundInit = function() {
return o(this, void 0, void 0, function() {
var t;
return n(this, function(e) {
switch (e.label) {
case 0:
return t = p.algorithmStrategy.context.gameMode === m.GameMode.Class ? storage.getItem("classRoundNum", 0) : storage.getItem("chapterRoundNum", 0), 
p.algorithmStrategy.context.CC_DEBUG && (S.AlgorithmStrategyLog.log("========================== 每轮开始【第".concat(t, "轮】 =========================="), S.AlgorithmStrategyLog.ROUND_COLOR, a.AlgorithmStrategyProcessType.ROUND_INIT), 
S.AlgorithmStrategyLog.log("全局上下文：", S.AlgorithmStrategyLog.NORMAL_COLOR), S.AlgorithmStrategyLog.table(p.algorithmStrategy.context.globalContext())), 
r.flow = {
process: a.AlgorithmStrategyProcessType.ROUND_INIT,
algorithmList: [],
algorithmFallbackList: [],
postAlgorithmList: []
}, _.algorithmStrategyDot.clear(), y.AlgorithmStrategySDKRequest.clear(), b.AlgorithmStrategyAlgorithmPriorityListOperator.clear(), 
i.AlgorithmStrategyAlgorithmListOperator.clear(), v.AlgorithmStrategyAlgorithmPostListPatchOperator.clear(), 
l.AlgorithmStrategyAlgorithmFallbackListOperator.clear(), p.algorithmStrategy.context.CONFLICT_DEBUG && A.AlgorithmStrategyConflictRecorder.resetRound(t), 
[ 4, (0, g.invokeLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_ROUNDS_INIT_CONFIG, "onAlgorithmStrategyRoundInit") ];

case 1:
return e.sent(), [ 2 ];
}
});
});
}, t.prototype.gameInit = function() {
return o(this, void 0, void 0, function() {
var t;
return n(this, function(e) {
switch (e.label) {
case 0:
return p.algorithmStrategy.context.CC_DEBUG && (t = p.algorithmStrategy.context.gameMode === m.GameMode.Class ? storage.getItem("classGameNum", 0) : storage.getItem("chapterGameNum", 0), 
S.AlgorithmStrategyLog.log("========================== 每局开始【第".concat(t, "局】=========================="), S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.GAMES_INIT)), 
r.flow.process = a.AlgorithmStrategyProcessType.GAMES_INIT, [ 4, (0, g.invokeTaggedLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_GAMES_INIT_CONFIG, "onAlgorithmStrategyGameInit") ];

case 1:
return e.sent(), [ 2 ];
}
});
});
}, t.prototype.gameNewInit = function() {
return o(this, void 0, void 0, function() {
var t;
return n(this, function(e) {
switch (e.label) {
case 0:
return t = p.algorithmStrategy.context.gameMode === m.GameMode.Class ? storage.getItem("classGameNum", 0) : storage.getItem("chapterGameNum", 0), 
p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 每局（新）开始【第".concat(t, "局】 =========================="), S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.GAMES_NEW_INIT), 
r.flow.process = a.AlgorithmStrategyProcessType.GAMES_NEW_INIT, [ 4, (0, g.invokeTaggedLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_GAMES_INIT_CONFIG, "onAlgorithmStrategyGameNewInit") ];

case 1:
return e.sent(), p.algorithmStrategy.context.CONFLICT_DEBUG && A.AlgorithmStrategyConflictRecorder.resetGame(t), 
[ 2 ];
}
});
});
}, t.prototype.preprocess = function(t) {
return o(this, void 0, void 0, function() {
return n(this, function(e) {
switch (e.label) {
case 0:
return p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 预处理开始 ==========================", S.AlgorithmStrategyLog.PREPROCESS_COLOR, a.AlgorithmStrategyProcessType.PREPROCESS_MUTEX, t), 
[ 4, (0, c.preprocess)(r.flow, t) ];

case 1:
return e.sent(), [ 2 ];
}
});
});
}, t.prototype.sdkRequest = function(t) {
return o(this, void 0, void 0, function() {
return n(this, function(e) {
switch (e.label) {
case 0:
return p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== SDK 开始 ==========================", S.AlgorithmStrategyLog.SDK_COLOR, a.AlgorithmStrategyProcessType.PREPROCESS_SDK, t), 
[ 4, (0, u.sdkRequest)(r.flow, t) ];

case 1:
return e.sent(), [ 4, (0, g.invokeLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_PREPROCESS_COMPLETE_TRAITS_CONFIG, "onAlgorithmStrategyPreprocessComplete", r.flow) ];

case 2:
return e.sent(), [ 2 ];
}
});
});
}, t.prototype.postprocess = function() {
return o(this, void 0, void 0, function() {
return n(this, function(t) {
switch (t.label) {
case 0:
return p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 后处理开始 ==========================", S.AlgorithmStrategyLog.POSTPROCESS_COLOR, a.AlgorithmStrategyProcessType.POSTPROCESS), 
[ 4, (0, s.postprocess)(r.flow) ];

case 1:
return t.sent(), [ 4, (0, g.invokeLifeCycle)(p.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_POSTPROCESS_COMPLETE_TRAITS_CONFIG, "onAlgorithmStrategyPostprocessComplete", r.flow) ];

case 2:
return t.sent(), [ 2 ];
}
});
});
}, t.prototype.positionAdjust = function() {
p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 位置调整开始 ==========================", S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.POSITION_ADJUST), 
(0, f.positionAdjust)(r.flow);
}, t.prototype.colorAdjust = function() {
p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 颜色调整开始 ==========================", S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.COLOR_ADJUST), 
(0, d.colorAdjust)(r.flow);
}, t.prototype.collectionAdjust = function() {
p.algorithmStrategy.context.CC_DEBUG && S.AlgorithmStrategyLog.log("========================== 收集物调整开始 ==========================", S.AlgorithmStrategyLog.NORMAL_COLOR, a.AlgorithmStrategyProcessType.COLLECTION_ADJUST), 
(0, h.collectionAdjust)(r.flow);
}, t.prototype.complete = function() {
p.algorithmStrategy.context.CONFLICT_DEBUG && as.AlgorithmStrategyConflictRecorder.recordResultConflict(r.flow);
}, t;
}();
r.algorithmStrategyPipeline = new C();
},
5492: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmListPatch = void 0;
var n, i = e(261), a = e(4246), l = e(7594), c = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
return void 0 !== t && t === r && t.length === r.length && JSON.stringify(t) === JSON.stringify(r);
}(n, t)) return !1;
for (var r = 0; r < t.length; r++) {
var e = t[r];
e.category = (0, a.getCategoryForAlgorithm)(e.algorithmId), e.algorithmListSource = "normal";
}
return n = t, !0;
}, Object.defineProperty(t, "curAlgorithmList", {
get: function() {
return i.AlgorithmStrategyAlgorithmListOperator.curAlgorithmList;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t, "preprocessAlgorithmList", {
get: function() {
return i._algorithmList.pre;
},
enumerable: !1,
configurable: !0
}), o([ (0, l.patch)({
patchKey: "algorithmList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgorithmListPatch = c;
},
5706: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmIdModifyPatch = void 0;
var n, i = e(7594), a = function() {
function t() {}
return t.patch = function(t, r) {
if (t.algorithmId !== r) return n = t.algorithmId = r, !0;
}, o([ (0, i.patch)({
patchKey: "algorithmIdModify",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgorithmIdModifyPatch = a;
},
5733: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordTraitCall = function(t) {
t && (n(t), i(o.conflictStore.traitCallCount, t), i(o.conflictStore.allTraitCallCount, t), 
i(o.conflictStore.roundTraitCallCount, t));
}, r.recordTraitTrigger = n, r.increment = i;
var o = e(1092);
function n(t) {
t && (o.conflictStore.roundTriggeredTraits.has(t) || (o.conflictStore.roundTriggeredTraits.add(t), 
i(o.conflictStore.traitTriggerCount, t)));
}
function i(t, r) {
var e;
t.set(r, (null !== (e = t.get(r)) && void 0 !== e ? e : 0) + 1);
}
},
5800: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.algorithmStrategy = void 0;
var e = function() {
function t() {}
return Object.defineProperty(t.prototype, "context", {
get: function() {
return this._context;
},
enumerable: !1,
configurable: !0
}), t.prototype.init = function(t) {
this._context = t;
}, t.prototype.updateContext = function(t) {
this._context.timeout.preprocess_normalAlgorithm_sdk = t.timeout.preprocess_normalAlgorithm_sdk, 
this._context.preprocess_sdk_strategy = t.preprocess_sdk_strategy;
}, t;
}();
r.algorithmStrategy = new e();
},
5815: function(t, r) {
var e = this && this.__assign || function() {
return (e = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, o = this && this.__rest || function(t, r) {
var e = {};
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && r.indexOf(o) < 0 && (e[o] = t[o]);
if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
var n = 0;
for (o = Object.getOwnPropertySymbols(t); n < o.length; n++) r.indexOf(o[n]) < 0 && Object.prototype.propertyIsEnumerable.call(t, o[n]) && (e[o[n]] = t[o[n]]);
}
return e;
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyLog = void 0, r.formatTraitNameWithDescription = function(t) {
var r, e, o;
return "".concat(t).concat(null !== (o = null === (e = null === (r = window.traitConfigDebugInfo) || void 0 === r ? void 0 : r.getTraitClassNameDes) || void 0 === e ? void 0 : e.call(r, t)) && void 0 !== o ? o : "");
};
var a = "[算法策略]";
function l(t) {
return void 0 === t ? void 0 : i([], n(t), !1);
}
function c(t) {
if (null == t) return t;
if ("object" == typeof t) try {
return JSON.stringify(t);
} catch (r) {
return String(t);
}
return t;
}
var s = function() {
function t() {}
return t.log = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
if (t.length >= 2 && "string" == typeof t[0] && "string" == typeof t[1] && t[1].includes("color:")) {
var e = n(t);
e[0], e[1], e.slice(2);
}
}, t.info = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
}, t.warn = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
}, t.error = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
}, t.debug = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
}, t.table = function() {
for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
var s = n(t, 2), u = s[0], g = s[1], f = function(t) {
if (Array.isArray(t)) return t.map(function(t) {
if (null === t || "object" != typeof t || Array.isArray(t)) return t;
var r = t;
return Object.fromEntries(Object.entries(r).map(function(t) {
var r = n(t, 2);
return [ r[0], c(r[1]) ];
}));
});
if (null !== t && "object" == typeof t && !Array.isArray(t)) {
var r = t;
return Object.fromEntries(Object.entries(r).map(function(t) {
var r = n(t, 2);
return [ r[0], c(r[1]) ];
}));
}
return t;
}(u), h = function(t, r) {
var c;
if (Array.isArray(t)) {
if (0 === t.length) return {
data: t,
properties: l(r)
};
var s = t.map(function(t) {
var r, n, i;
if (null === t || "object" != typeof t || Array.isArray(t)) return (r = {})["".concat(a, " #")] = t, 
r;
var l = t, c = Object.keys(l);
if (0 === c.length) return (n = {})[a] = "", n;
var s = c[0], u = l, g = s, f = u[g], h = o(u, [ "symbol" == typeof g ? g : g + "" ]);
return e(((i = {})["".concat(a, " ").concat(s)] = f, i), h);
});
if (null == (d = void 0 !== r ? i([], n(r), !1) : void 0) ? void 0 : d.length) {
var u = t[0];
if (null !== u && "object" == typeof u && !Array.isArray(u)) {
var g = Object.keys(u)[0];
void 0 !== g && d[0] === g && (d = i([ "".concat(a, " ").concat(g) ], n(d.slice(1)), !1));
}
}
return {
data: s,
properties: d
};
}
if (null !== t && "object" == typeof t) {
var f = t, h = Object.keys(f);
if (0 === h.length) return {
data: t,
properties: l(r)
};
var d, p = h[0], y = f, S = p, m = y[S], A = o(y, [ "symbol" == typeof S ? S : S + "" ]), v = e(((c = {})["".concat(a, " ").concat(p)] = m, 
c), A);
return (null == (d = void 0 !== r ? i([], n(r), !1) : void 0) ? void 0 : d.length) && d[0] === p && (d = i([ "".concat(a, " ").concat(p) ], n(d.slice(1)), !1)), 
{
data: v,
properties: d
};
}
return {
data: t,
properties: l(r)
};
}(f, g), d = h.data;
h.properties;
if ("function" == typeof console.table) try {
return;
} catch (t) {}
null != d && "object" == typeof d ? JSON.stringify(d, null, 2) : String(d);
}, t.ROUND_COLOR = "color:#3E2723;background:#00ff00;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #C62828;", 
t.PATCH_COLOR = "color:#ffffff;background:#0000ff;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #C62828;", 
t.NORMAL_COLOR = "color:#3E2723;background:#FFCDD2;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #C62828;", 
t.FALLBACK_COLOR = "color:#BF360C;background:#EEEEEE;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #E65100;", 
t.PREPROCESS_COLOR = "color:#004D40;background:#B2DFDB;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #00897B;", 
t.PREPROCESS_FAIL_COLOR = "color:#004D40;background:#80CBC4;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #00695C;", 
t.POSTPROCESS_COLOR = "color:#1A237E;background:#C5CAE9;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #3949AB;", 
t.POSTPROCESS_FAIL_COLOR = "color:#1A237E;background:#C5CAE9;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #3949AB;", 
t.SDK_COLOR = "color:#616161;background:#F5F5F5;padding:0 4px;border-radius:2px;", 
t.SDK_FAIL_COLOR = "color:#616161;background:#F5F5F5;padding:0 4px;border-radius:2px;", 
t;
}();
r.AlgorithmStrategyLog = s, window.AlgorithmStrategyLog = s;
},
5931: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.algorithmStrategyRobot = void 0;
var o = e(3003);
r.algorithmStrategyRobot = {
algorithmStats: o.algorithmStrategyRobotAlgorithmStats
};
},
6024: function(t, r, e) {
var o = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.colorAdjust = function(t) {
var r, e, g, f, h, d;
t.process = s.AlgorithmStrategyProcessType.COLOR_ADJUST, delete t.returnState, delete t.disabledTraits;
var p, y = [ 1, 4, 2 ], S = a.algorithmStrategy.context.CONFLICT_DEBUG ? "class" === a.algorithmStrategy.context.gameMode ? storage.getItem("classColorLists", y) : storage.getItem("chapterColorLists", y) : void 0, m = [], A = y;
try {
for (var v = o(a.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_COLOR_ADJUST_TRAITS_CONFIG), b = v.next(); !b.done; b = v.next()) {
var _ = b.value;
if (t.returnState) break;
if (!(null === (h = t.disabledTraits) || void 0 === h ? void 0 : h.includes(_))) {
var C = TRAIT(_);
if ((null == C ? void 0 : C.onActiveCondition) && (null == C ? void 0 : C.active) && u(C)) {
var T = C.onAlgorithmStrategyColorAdjust(t);
if (!T) continue;
if (p = _, A = T.data, a.algorithmStrategy.context.CONFLICT_DEBUG && (l.AlgorithmStrategyConflictRecorder.recordTraitTrigger(p), 
m.push({
traitSource: p,
data: T.data,
returnState: T.returnState,
disableTraits: null == T.disableTraits ? void 0 : i([], n(T.disableTraits), !1)
})), null === (d = T.disableTraits) || void 0 === d ? void 0 : d.length) {
Array.isArray(t.disabledTraits) || (t.disabledTraits = []);
try {
for (var O = (g = void 0, o(T.disableTraits)), P = O.next(); !P.done; P = O.next()) {
var R = P.value;
t.disabledTraits.includes(R) || t.disabledTraits.push(R);
}
} catch (t) {
g = {
error: t
};
} finally {
try {
P && !P.done && (f = O.return) && f.call(O);
} finally {
if (g) throw g.error;
}
}
}
T.returnState && (t.returnState = !0), a.algorithmStrategy.context.CC_DEBUG && c.AlgorithmStrategyLog.log("特性：".concat(_, " 颜色调整："), c.AlgorithmStrategyLog.NORMAL_COLOR, T);
}
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
b && !b.done && (e = v.return) && e.call(v);
} finally {
if (r) throw r.error;
}
}
return A && ("class" === a.algorithmStrategy.context.gameMode ? storage.setItem("classColorLists", A) : storage.setItem("chapterColorLists", A), 
t.process = s.AlgorithmStrategyProcessType.COLOR_ADJUST_SUCCESS), a.algorithmStrategy.context.CONFLICT_DEBUG && l.AlgorithmStrategyConflictRecorder.recordAdjustResult({
process: "colorAdjust",
success: t.process === s.AlgorithmStrategyProcessType.COLOR_ADJUST_SUCCESS,
traitSource: p,
traitResults: m,
beforeColorList: S,
colorList: A,
reason: "颜色调整阶段记录颜色列表变化"
}), delete t.returnState, delete t.disabledTraits, t;
};
var a = e(5800), l = e(8011), c = e(5815), s = e(7880);
function u(t) {
return t && "function" == typeof t.onAlgorithmStrategyColorAdjust;
}
},
6074: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.resolvePendingActions = function(t, r, e, o) {
var n, s, u;
if (Array.isArray(r)) return r;
var g, f, h = null == o ? void 0 : o.tag;
if (f = "preprocess" === t ? h && h in r ? r[h] : r.mutex : r, "mutex" === h && null != (null == o ? void 0 : o.source) && f && "object" == typeof f && !Array.isArray(g)) {
var d = null !== (u = c.algorithmStrategy.context.algorithmSourceType[o.source]) && void 0 !== u ? u : o.source;
f[d] && (g = f[d]);
} else g = f;
var p = [];
if (g) if (e.length > 0) try {
for (var y = i(e), S = y.next(); !S.done; S = y.next()) {
var m = g[S.value];
m && p.push.apply(p, l([], a(m), !1));
}
} catch (t) {
n = {
error: t
};
} finally {
try {
S && !S.done && (s = y.return) && s.call(y);
} finally {
if (n) throw n.error;
}
} else {
var A = g.else;
A && p.push.apply(p, l([], a(A), !1));
}
return p;
}, r.executeActions = function(t, r, e, a, l, c, s) {
return o(this, void 0, Promise, function() {
var e, o, u, g, f, h, d, p, y;
return n(this, function(n) {
switch (n.label) {
case 0:
e = [], n.label = 1;

case 1:
n.trys.push([ 1, 6, 7, 8 ]), o = i(r), u = o.next(), n.label = 2;

case 2:
return u.done ? [ 3, 5 ] : (g = u.value, h = (f = e).push, [ 4, m(t, g, a, l, c, s) ]);

case 3:
h.apply(f, [ n.sent() ]), n.label = 4;

case 4:
return u = o.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return d = n.sent(), p = {
error: d
}, [ 3, 8 ];

case 7:
try {
u && !u.done && (y = o.return) && y.call(o);
} finally {
if (p) throw p.error;
}
return [ 7 ];

case 8:
return [ 2, e ];
}
});
});
};
var c = e(5800), s = e(5815), u = e(9351), g = e(9423), f = e(261), h = e(8742), d = e(8011), p = e(3325), y = e(8281), S = e(2436);
function m(t, r, e, m, A, v) {
return o(this, void 0, Promise, function() {
var o, b, _, C, T, O, P, R, E, L, I, x, k, w, D, N, j, K, M, F, G, B, U, q, H, Y, J, W;
return n(this, function(n) {
switch (n.label) {
case 0:
if (!(o = h.ALGORITHM_STRATEGY_OPERATOR_MAP[r.operator])) return c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.error("特性：".concat(null == e ? void 0 : e.traitName).concat(window.traitConfigDebugInfo.getTraitClassNameDes(null == e ? void 0 : e.traitName), "调用操作器不存在")), 
[ 2, {
status: !1,
operator: r.operator,
actionType: r.type
} ];
if ("function" != typeof (b = o[r.type])) return [ 3, 26 ];
switch (c.algorithmStrategy.context.CONFLICT_DEBUG && d.AlgorithmStrategyConflictRecorder.recordTraitTrigger(null == e ? void 0 : e.traitName), 
_ = (0, S.shallowMergePreservingAccessors)(v, A), null != (C = null == e ? void 0 : e.props) && "object" == typeof C && (_[rulesEngine.RULE_TRAIT_PROPS_CONTEXT_KEY] = C), 
void 0 !== r.dynamicSource && null !== r.dynamicSource && (_.dynamicSource = r.dynamicSource), 
r.operator) {
case "AlgorithmStrategyAlgorithmPriorityListOperator":
_.algorithmListSource = "priority";
break;

case "AlgorithmStrategyAlgorithmListOperator":
_.algorithmListSource = "normal";
break;

case "AlgorithmStrategyAlgorithmPostListPatchOperator":
_.algorithmListSource = "post";
break;

case "AlgorithmStrategyAlgorithmFallbackListOperator":
_.algorithmListSource = "fallback";
}
r.router && (_.router = r.router), b.options = {
context: _,
flow: m
}, T = [], n.label = 1;

case 1:
n.trys.push([ 1, 6, 7, 8 ]), O = i(null !== (G = r.args) && void 0 !== G ? G : []), 
P = O.next(), n.label = 2;

case 2:
return P.done ? [ 3, 5 ] : (R = P.value, L = (E = T).push, [ 4, rulesEngine.resolveValueAsync(_, R) ]);

case 3:
L.apply(E, [ n.sent() ]), n.label = 4;

case 4:
return P = O.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return I = n.sent(), M = {
error: I
}, [ 3, 8 ];

case 7:
try {
P && !P.done && (F = O.return) && F.call(O);
} finally {
if (M) throw M.error;
}
return [ 7 ];

case 8:
return x = c.algorithmStrategy.context.CONFLICT_DEBUG && ("AlgorithmStrategyAlgorithmListOperator" === r.operator || "AlgorithmStrategyAlgorithmFallbackListOperator" === r.operator || "AlgorithmStrategyAlgorithmPriorityListOperator" === r.operator || "AlgorithmStrategyAlgorithmPostListPatchOperator" === r.operator), 
k = x ? d.AlgorithmStrategyConflictRecorder.createListSnapshot(f.AlgorithmStrategyAlgorithmListOperator.algorithmList) : [], 
w = x ? d.AlgorithmStrategyConflictRecorder.createListSnapshot(g.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList) : [], 
D = x ? d.AlgorithmStrategyConflictRecorder.createListSnapshot(p.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList) : [], 
N = x ? d.AlgorithmStrategyConflictRecorder.createListSnapshot(y.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList) : [], 
j = c.algorithmStrategy.context.CC_DEBUG ? function() {
switch (r.operator) {
case "AlgorithmStrategyAlgorithmPriorityListOperator":
return l([], a(p.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList), !1);

case "AlgorithmStrategyAlgorithmListOperator":
return l([], a(f.AlgorithmStrategyAlgorithmListOperator.algorithmList), !1);

case "AlgorithmStrategyAlgorithmPostListPatchOperator":
return l([], a(y.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList), !1);

case "AlgorithmStrategyAlgorithmFallbackListOperator":
return l([], a(g.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList), !1);

default:
return;
}
}() : [], [ 4, b.apply(o, T) ];

case 9:
if (K = n.sent(), x && d.AlgorithmStrategyConflictRecorder.recordActionResult({
process: t,
algorithmListSource: "AlgorithmStrategyAlgorithmFallbackListOperator" === r.operator ? "fallback" : "normal",
actionType: r.type,
traitSource: _.traitSource,
args: T,
beforePriorityList: D,
afterPriorityList: d.AlgorithmStrategyConflictRecorder.createListSnapshot(p.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList),
beforeList: k,
afterList: d.AlgorithmStrategyConflictRecorder.createListSnapshot(f.AlgorithmStrategyAlgorithmListOperator.algorithmList),
beforePostList: N,
afterPostList: d.AlgorithmStrategyConflictRecorder.createListSnapshot(y.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList),
beforeFallbackList: w,
afterFallbackList: d.AlgorithmStrategyConflictRecorder.createListSnapshot(g.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList),
success: K
}), !K) return [ 3, 25 ];
switch (r.operator) {
case "AlgorithmStrategyAlgorithmPriorityListOperator":
return [ 3, 10 ];

case "AlgorithmStrategyAlgorithmListOperator":
return [ 3, 14 ];

case "AlgorithmStrategyAlgorithmPostListPatchOperator":
return [ 3, 17 ];

case "AlgorithmStrategyAlgorithmFallbackListOperator":
return [ 3, 20 ];
}
return [ 3, 24 ];

case 10:
return "preprocess" !== t ? [ 3, 13 ] : (m.algorithmPriorityList = p.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList, 
[ 4, (0, u.invokeSelfLifeCycle)(null !== (B = null == e ? void 0 : e.traitName) && void 0 !== B ? B : _.traitSource, "onAlgorithmStrategyAlgorithmPriorityListSelfChanged", r.type, o.algorithmPriorityList) ]);

case 11:
return n.sent(), [ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_ALGORITHM_PRIORITY_LIST_CHANGED_CONFIG, "onAlgorithmStrategyAlgorithmPriorityListChanged", r.type, o.algorithmPriorityList, null !== (U = null == e ? void 0 : e.traitName) && void 0 !== U ? U : _.traitSource) ];

case 12:
n.sent(), n.label = 13;

case 13:
return [ 3, 24 ];

case 14:
switch (t) {
case "preprocess":
m.algorithmList = f.AlgorithmStrategyAlgorithmListOperator.algorithmList;
break;

case "postprocess":
m.postAlgorithmList = f.AlgorithmStrategyAlgorithmListOperator.algorithmList;
}
return [ 4, (0, u.invokeSelfLifeCycle)(null !== (q = null == e ? void 0 : e.traitName) && void 0 !== q ? q : _.traitSource, "onAlgorithmStrategyAlgorithmListSelfChanged", t, r.type, o.algorithmList) ];

case 15:
return n.sent(), [ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_ALGORITHM_LIST_CHANGED_CONFIG, "onAlgorithmStrategyAlgorithmListChanged", t, r.type, o.algorithmList, null !== (H = null == e ? void 0 : e.traitName) && void 0 !== H ? H : _.traitSource) ];

case 16:
return n.sent(), [ 3, 24 ];

case 17:
return "preprocess" !== t ? [ 3, 19 ] : (m.algorithmPostList = y.AlgorithmStrategyAlgorithmPostListPatchOperator.algorithmPostList, 
[ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_ALGORITHM_POST_LIST_CHANGED_CONFIG, "onAlgorithmStrategyAlgorithmPostListChanged", r.type, o.algorithmPostList, null !== (Y = null == e ? void 0 : e.traitName) && void 0 !== Y ? Y : _.traitSource) ]);

case 18:
n.sent(), n.label = 19;

case 19:
return [ 3, 24 ];

case 20:
return "preprocess" !== t ? [ 3, 23 ] : (m.algorithmFallbackList = g.AlgorithmStrategyAlgorithmFallbackListOperator.algorithmFallbackList, 
[ 4, (0, u.invokeSelfLifeCycle)(null !== (J = null == e ? void 0 : e.traitName) && void 0 !== J ? J : _.traitSource, "onAlgorithmStrategyAlgorithmFallbackListSelfChanged", r.type, o.algorithmFallbackList) ]);

case 21:
return n.sent(), [ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_ALGORITHM_FALLBACK_LIST_CHANGED_CONFIG, "onAlgorithmStrategyAlgorithmFallbackListChanged", r.type, o.algorithmFallbackList, null !== (W = null == e ? void 0 : e.traitName) && void 0 !== W ? W : _.traitSource) ];

case 22:
n.sent(), n.label = 23;

case 23:
return [ 3, 24 ];

case 24:
return [ 2, {
status: !0,
operator: r.operator,
actionType: r.type,
args: T,
beforeList: j
} ];

case 25:
return [ 2, {
status: !1,
operator: r.operator,
actionType: r.type,
args: T,
beforeList: j
} ];

case 26:
c.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.error("特性：".concat(null == e ? void 0 : e.traitName).concat(window.traitConfigDebugInfo.getTraitClassNameDes(null == e ? void 0 : e.traitName), "调用方法：").concat(r.type, " 失败！")), 
n.label = 27;

case 27:
return [ 2, {
status: !1,
operator: r.operator,
actionType: r.type
} ];
}
});
});
}
},
6136: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
});
},
6242: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.formatPreprocessActionMessages = function(t) {
return (0, n.formatActionExecuteMessages)(t);
}, r.createPreprocessConditionTraceLogger = function(t, r) {
var e, n, a, l, c, s = null !== (e = null == t ? void 0 : t.traitSource) && void 0 !== e ? e : "UnknownTrait", u = null !== (n = null == t ? void 0 : t.tag) && void 0 !== n ? n : "mutex", g = null == (null == t ? void 0 : t.source) ? "" : "".concat(o.algorithmStrategy.context.algorithmSourceType[t.source], "(").concat(t.source, ")"), f = "".concat(s).concat(null !== (c = null === (l = null === (a = window.traitConfigDebugInfo) || void 0 === a ? void 0 : a.getTraitClassNameDes) || void 0 === l ? void 0 : l.call(a, s)) && void 0 !== c ? c : ""), h = "".concat(function(t, r, e, o) {
if ("mutex" === t) return "预处理-互斥-【源:".concat(r, "】");
var n = null == e ? "tag:".concat(t) : "tag【".concat(e + 1).concat(null == o ? "" : "/".concat(o), ":").concat(t, "】");
return "预处理-共享-【".concat(n).concat(r ? " 源:".concat(r) : "", "】");
}(u, g, null == t ? void 0 : t.tagIndex, null == t ? void 0 : t.tagTotal), "：执行特性【").concat(null == (null == t ? void 0 : t.traitIndex) ? "?" : t.traitIndex + 1).concat(null == (null == t ? void 0 : t.traitTotal) ? "" : "/".concat(t.traitTotal), "】：").concat(f);
return (0, i.createAlgorithmStrategyRuleTraceLogger)({
rulesCount: r,
buildPrefix: function(t) {
return "".concat(h, "，").concat((0, i.formatRuleProgress)(t, r));
},
color: i.getAlgorithmStrategyTraceResultColor,
fallbackPrefix: "预处理-条件计算-结果",
factWrapper: "paren",
separator: "colon"
});
};
var o = e(5800), n = e(4542), i = e(6582);
},
6320: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__rest || function(t, r) {
var e = {};
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && r.indexOf(o) < 0 && (e[o] = t[o]);
if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
var n = 0;
for (o = Object.getOwnPropertySymbols(t); n < o.length; n++) r.indexOf(o[n]) < 0 && Object.prototype.propertyIsEnumerable.call(t, o[n]) && (e[o[n]] = t[o[n]]);
}
return e;
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.sdkExtraPatchParser = u, r.patchSdkExtraFromArgs = function(t) {
return t.extra = u(t.extra), t.extra = function(t) {
var r, e, o, n, a = t;
(null == a.feature || "object" != typeof a.feature || Array.isArray(a.feature)) && (a.feature = {});
var c = a.feature;
Array.isArray(c.fixFea) || (c.fixFea = []);
var s = c.fixFea;
try {
for (var u = i(l.algorithmStrategy.context.configs.SDK_FIX_FEA_EXTERNAL_CONFIG_NAMES), g = u.next(); !g.done; g = u.next()) {
var f = g.value;
traitExternalConfigInfo.isActiveSync(f) && s.push(f);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
g && !g.done && (e = u.return) && e.call(u);
} finally {
if (r) throw r.error;
}
}
try {
for (var h = i(l.algorithmStrategy.context.configs.SDK_FIX_FEA_TRAIT_NAMES), d = h.next(); !d.done; d = h.next()) {
var p = d.value, y = TRAIT("CTRefactor" + p);
(null == y ? void 0 : y.onActiveCondition) && (null == y ? void 0 : y.active) && s.push(p);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
d && !d.done && (n = h.return) && n.call(h);
} finally {
if (o) throw o.error;
}
}
return a;
}(t.extra), function(t) {
var r, e;
try {
for (var o = i(Object.entries(l.algorithmStrategy.context.configs.SDK_OPTIONS_EXTRA_PATH_CONFIG)), n = o.next(); !n.done; n = o.next()) {
var c = a(n.value, 2), u = c[0], g = c[1], f = t[u];
void 0 !== f && s(t.extra, g, f), delete t[u];
}
} catch (t) {
r = {
error: t
};
} finally {
try {
n && !n.done && (e = o.return) && e.call(o);
} finally {
if (r) throw r.error;
}
}
return s(t.extra, "feature.pos", !0), t;
}(t);
};
var l = e(5800);
function c(t, r) {
var e, o, n = r.split(".").filter(Boolean), a = t;
try {
for (var l = i(n), c = l.next(); !c.done; c = l.next()) {
var s = c.value;
if (null == a || "object" != typeof a) return;
a = a[s];
}
} catch (t) {
e = {
error: t
};
} finally {
try {
c && !c.done && (o = l.return) && o.call(l);
} finally {
if (e) throw e.error;
}
}
return a;
}
function s(t, r, e) {
var o = r.split(".").filter(Boolean);
if (0 !== o.length) {
for (var n = t, i = 0; i < o.length - 1; i++) {
var a = o[i], l = n[a];
(null == l || "object" != typeof l || Array.isArray(l)) && (n[a] = {}), n = n[a];
}
n[o[o.length - 1]] = e;
}
}
function u(t) {
var r, e, a, u, g, f, h = null != t ? t : {}, d = h.traits, p = h.algos, y = (h.traits, 
h.algos, n(h, [ "traits", "algos" ])), S = o({}, y), m = l.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_PATCH_CONFIG;
if (m.traits) try {
for (var A = i(Object.keys(m.traits)), v = A.next(); !v.done; v = A.next()) {
var b = v.value, _ = m.traits[b];
if (_) {
var C = null == d ? void 0 : d[b];
if (null != C && "object" == typeof C && !Array.isArray(C)) {
var T = C;
try {
for (var O = (a = void 0, i(Object.keys(_))), P = O.next(); !P.done; P = O.next()) {
var R = P.value, E = _[R];
if ("string" == typeof E && 0 !== E.length) {
var L = T[R];
void 0 !== L && s(S, E, L);
}
}
} catch (t) {
a = {
error: t
};
} finally {
try {
P && !P.done && (u = O.return) && u.call(O);
} finally {
if (a) throw a.error;
}
}
}
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
v && !v.done && (e = A.return) && e.call(A);
} finally {
if (r) throw r.error;
}
}
if (m.algos) try {
for (var I = i(Object.keys(m.algos)), x = I.next(); !x.done; x = I.next()) {
var k = x.value, w = m.algos[k];
if ("string" == typeof w && 0 !== w.length) {
var D = null == p ? void 0 : p[k];
if (void 0 !== D) {
var N = c(S, w);
null == N || "object" != typeof N || Array.isArray(N) || "object" != typeof D || Array.isArray(D) ? s(S, w, D) : s(S, w, o(o({}, N), D));
}
}
}
} catch (t) {
g = {
error: t
};
} finally {
try {
x && !x.done && (f = I.return) && f.call(I);
} finally {
if (g) throw g.error;
}
}
return (null == S.feature || "object" != typeof S.feature || Array.isArray(S.feature)) && (S.feature = {}), 
S;
}
},
6325: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.addEvent = function(t) {
var r, e, a;
(0, i.syncCurrentRoundIndex)();
var l = o(o({
id: n.conflictStore.nextEventID(),
gameIndex: n.conflictStore.gameIndex,
roundIndex: n.conflictStore.roundIndex,
operationOrder: null !== (r = t.operationOrder) && void 0 !== r ? r : n.conflictStore.nextOperationOrderValue()
}, t), {
affectedTraitCallIndex: t.affectedTrait ? null !== (e = n.conflictStore.traitCallCount.get(t.affectedTrait)) && void 0 !== e ? e : 0 : void 0,
roundAffectedTraitCallIndex: t.affectedTrait ? null !== (a = n.conflictStore.roundTraitCallCount.get(t.affectedTrait)) && void 0 !== a ? a : 0 : void 0
});
n.conflictStore.events.push(l), n.conflictStore.allEvents.push(l), n.conflictStore.roundEvents.push(l);
};
var n = e(1092), i = e(1425);
},
6507: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyRouterOperator = void 0;
var e = function() {
function t() {}
return t.router = function(r) {
var e = t.router.options, o = null == e ? void 0 : e.context;
if (o) {
var n = o.traits;
return !!(null == n ? void 0 : n.includes(r)) && (o.routerTarget = r, (null == e ? void 0 : e.flow).routerTarget = r, 
!0);
}
return !1;
}, t;
}();
r.AlgorithmStrategyRouterOperator = e;
},
6573: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyReturnPatch = void 0;
var n = e(5213), i = e(3381), a = e(7594), l = function() {
function t() {}
return t.postReturnPatch = function() {
var t = n.flow;
return t.returnStateProcessType = i.AlgorithmStrategyReturnStateProcessType.DEFAULT, 
t.returnState = !0, !0;
}, o([ (0, a.patch)({
patchKey: "returnState",
getStored: function() {
return !0;
}
}) ], t, "postReturnPatch", null), t;
}();
r.AlgorithmStrategyReturnPatch = l;
},
6582: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.createAlgorithmStrategyRuleTraceLogger = function(t) {
var r, e = {}, o = function(r, o, i) {
var l, c = null != i ? i : r.matched, u = t.buildPrefix(r), g = function(t, r, e, o, i) {
return void 0 === r && (r = []), function(t, r, e, o, i) {
var a, l, c, u = function(t) {
var r, e, o, i;
if (0 !== t.length) {
var a, l, c, s = new Map();
try {
for (var u = n(t), g = u.next(); !g.done; g = u.next()) {
var f = g.value;
s.set(f.path, {
kind: f.kind,
event: f,
children: []
});
}
} catch (t) {
r = {
error: t
};
} finally {
try {
g && !g.done && (e = u.return) && e.call(u);
} finally {
if (r) throw r.error;
}
}
try {
for (var h = n(t), d = h.next(); !d.done; d = h.next()) {
f = d.value;
var p = s.get(f.path);
if (p) {
var y = -1 === (c = (l = f.path).lastIndexOf(".")) ? void 0 : l.slice(0, c);
if (void 0 !== y) {
var S = s.get(y);
S ? S.children.push(p) : a || (a = p);
} else a = p;
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
d && !d.done && (i = h.return) && i.call(h);
} finally {
if (o) throw o.error;
}
}
return a;
}
}(r), g = "".concat(o ? "✓" : "✗", " ").concat(null != e ? e : "".concat(null !== (a = i.fallbackPrefix) && void 0 !== a ? a : "条件计算-".concat(null !== (l = null == u ? void 0 : u.kind) && void 0 !== l ? l : "结果"), "：规则【").concat(null !== (c = t.flow) && void 0 !== c ? c : t.ruleIndex + 1, "】"));
return u ? "".concat(g, "：\n条件：").concat(s(u, i, !0)) : g;
}(t, r, u, c, i);
}(r, null !== (l = e[r.ruleIndex]) && void 0 !== l ? l : [], 0, 0, t);
a.AlgorithmStrategyLog.log("".concat(g).concat(null != o ? o : ""), t.color(c));
};
return {
onTrace: function(t) {
var n, i;
switch (t.type) {
case "ruleStart":
r && (o(r), r = void 0);
break;

case "ruleEnd":
r = t;
break;

case "condition":
(null !== (n = e[i = t.ruleIndex]) && void 0 !== n ? n : e[i] = []).push(t);
break;

default:
return t;
}
},
logResult: function(t, e) {
r && (o(r, t, e), r = void 0);
}
};
}, r.getAlgorithmStrategyTraceResultColor = function(t) {
return t ? "color:#1B5E20;background:#C8E6C9;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #43A047;" : "color:#546E7A;background:#ECEFF1;font-weight:500;padding:2px 8px;border-radius:2px;border:1px solid #B0BEC5;";
}, r.formatRuleProgress = function(t, r) {
return "规则【".concat(t.ruleIndex + 1, "/").concat(r).concat(t.flow ? " ".concat(t.flow) : "", "】");
}, r.formatTraceValue = l;
var i = e(3187), a = e(5815);
function l(t) {
if ("string" == typeof t) return '"'.concat(t, '"');
if (void 0 === t) return "undefined";
try {
var r = JSON.stringify(t);
return null == r ? String(t) : r;
} catch (r) {
return String(t);
}
}
function c(t) {
return "and" === t.kind || "or" === t.kind;
}
function s(t, r, e) {
var n;
switch (t.kind) {
case "leaf":
return "【".concat(t.event.matched ? "✓" : "✗", " ").concat(function(t, r) {
var e, n = null !== (e = t.operator) && void 0 !== e ? e : "";
if (function(t) {
return Object.prototype.hasOwnProperty.call(i.BUILTIN_JSON_RULE_OPERATORS, t);
}(n)) {
var a = u(t.fact, t.factValue, r, t.factComment), c = u(t.valueFact, t.value, r, t.valueFactComment);
return "".concat(a, " ").concat(n, " ").concat(c);
}
var s = u(t.fact, t.factValue, o(o({}, r), {
factWrapper: "plain"
}), t.factComment);
return "".concat(n, "(").concat(s, ") → ").concat(l(t.matched), " = ").concat(l(t.value));
}(t.event, r), "】");

case "boolean":
return "conditions=".concat(String(t.event.matched));

case "not":
var a = t.children[0];
if (!a) return "!";
var g = s(a, r, !1);
return "!".concat(c(a) ? "(".concat(g, ")") : g);

case "and":
case "or":
var f = "and" === t.kind ? "&&" : "||", h = t.children.map(function(t) {
var e = s(t, r, !1);
return c(t) ? "(".concat(e, ")") : e;
});
return 0 === h.length ? "" : 1 === h.length ? h[0] : e ? "\n\t".concat(h.join("".concat(f, "\n\t"))) : h.join(" ".concat(f, " "));

case "for":
return "each：".concat(null !== (n = t.event.fact) && void 0 !== n ? n : "");

default:
return "";
}
}
function u(t, r, e, o) {
if (!t) return l(r);
var n = "".concat(t).concat(o ? "【".concat(o, "】") : "", ":").concat(l(r));
return "plain" === e.factWrapper ? n : "(".concat(n, ")");
}
},
7044: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyDisablePostprocessSequenceOperator = void 0;
var e = function() {
function t() {}
return t.disable = function() {
var r = t.disable.options, e = null == r ? void 0 : r.flow;
return e && (e.disablePostprocessSequence = !0), !0;
}, t;
}();
r.AlgorithmStrategyDisablePostprocessSequenceOperator = e;
},
7120: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, i = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordAdjustResult = function(t) {
var r, e, g, f = s.conflictStore.nextOperationOrderValue(), h = function(t) {
return {
process: t.process,
success: t.success,
traitSource: t.traitSource,
traitResults: null == t.traitResults ? void 0 : t.traitResults.map(function(t) {
return {
traitSource: t.traitSource,
data: (0, c.cloneSnapshotValue)(t.data),
returnState: t.returnState,
disableTraits: null == t.disableTraits ? void 0 : i([], n(t.disableTraits), !1)
};
}),
positionType: (0, c.cloneSnapshotValue)(t.positionType),
order: null == t.order ? void 0 : i([], n(t.order), !1),
beforeBlockIds: null == t.beforeBlockIds ? void 0 : i([], n(t.beforeBlockIds), !1),
afterBlockIds: null == t.afterBlockIds ? void 0 : i([], n(t.afterBlockIds), !1),
beforeBlockNames: null == t.beforeBlockNames ? void 0 : i([], n(t.beforeBlockNames), !1),
afterBlockNames: null == t.afterBlockNames ? void 0 : i([], n(t.afterBlockNames), !1),
beforeBlockPoses: null == t.beforeBlockPoses ? void 0 : t.beforeBlockPoses.map(function(t) {
return o({}, t);
}),
afterBlockPoses: null == t.afterBlockPoses ? void 0 : t.afterBlockPoses.map(function(t) {
return o({}, t);
}),
beforeColorList: null == t.beforeColorList ? void 0 : t.beforeColorList.map(function(t) {
return (0, c.cloneSnapshotValue)(t);
}),
colorList: null == t.colorList ? void 0 : t.colorList.map(function(t) {
return (0, c.cloneSnapshotValue)(t);
}),
collectionList: null == t.collectionList ? void 0 : t.collectionList.map(function(t) {
return (0, c.cloneSnapshotValue)(t);
})
};
}(t);
(function(t, r) {
(0, u.syncCurrentRoundIndex)();
var e = s.conflictStore.roundFinalResults.get(s.conflictStore.roundIndex);
if (e) {
var n = o(o(o(o({}, e.finalAdjust), "positionAdjust" === t.process ? {
position: t
} : {}), "colorAdjust" === t.process ? {
color: t
} : {}), "collectionAdjust" === t.process ? {
collection: t
} : {});
s.conflictStore.roundFinalResults.set(s.conflictStore.roundIndex, o(o({}, e), {
operationOrder: r,
finalAdjust: n
}));
}
})(h, f), (0, l.addEvent)({
type: a.AlgorithmStrategyConflictType.ALGORITHM_ADJUST_RESULT,
severity: "info",
process: t.process,
triggerTrait: t.traitSource,
reason: null !== (r = t.reason) && void 0 !== r ? r : (e = t.process, g = t.success, 
"".concat({
positionAdjust: "位置调整",
colorAdjust: "颜色调整",
collectionAdjust: "收集物调整"
}[e]).concat(g ? "成功" : "失败或无结果")),
operationOrder: f,
adjust: h
});
};
var a = e(4727), l = e(6325), c = e(7721), s = e(1092), u = e(1425);
},
7176: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyDisableShareSequenceOperator = void 0;
var e = function() {
function t() {}
return t.disable = function() {
var r = t.disable.options, e = null == r ? void 0 : r.flow;
return e && (e.disableShareSequence = !0), !0;
}, t;
}();
r.AlgorithmStrategyDisableShareSequenceOperator = e;
},
7209: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoBlockPosListPatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
if (!Array.isArray(t) || !Array.isArray(r) || t.length !== r.length) return !1;
for (var e = 0; e < t.length; e++) {
var o = t[e], n = r[e];
if (o.row !== n.row || o.col !== n.col) return !1;
}
return !0;
}(n, t)) return !1;
var r = i.flow.sdk;
return r && (r.blockPoses = t), n = t, !0;
}, o([ (0, a.patch)({
patchKey: "blockPosList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoBlockPosListPatch = l;
},
7263: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordPartialActionSuccess = function(t) {
(0, i.syncCurrentRoundIndex)(), n.algorithmStrategyRobotAlgorithmStats.recordPartialActionSuccess(o({
gameIndex: a.conflictStore.gameIndex,
roundIndex: a.conflictStore.roundIndex
}, t));
};
var n = e(3003), i = e(1425), a = e(1092);
},
7388: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyReturnOperator = void 0;
var o = e(3381), n = function() {
function t() {}
return t.returnState = function(r) {
void 0 === r && (r = o.AlgorithmStrategyReturnStateProcessType.DEFAULT);
var e = t.returnState.options, n = null == e ? void 0 : e.flow;
return n && (n.returnStateProcessType = r, r === o.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS || (n.returnState = !0)), 
!0;
}, t;
}();
r.AlgorithmStrategyReturnOperator = n;
},
7594: (t, r) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.patchWatch = function(t) {
e.push(t);
}, r.patch = function(t) {
return function(r, o, n) {
var i = n.value;
"function" == typeof i && (n.value = function() {
for (var r = [], o = 0; o < arguments.length; o++) r[o] = arguments[o];
var n = t.getStored(), a = !0 === i.apply(this, r);
if (a) {
var l = r.length >= 2 ? r[1] : void 0, c = {
prev: n,
next: t.getStored(),
target: l
};
!function(t, r) {
if (0 !== e.length) for (var o = {
patchKey: t.patchKey
}, n = 0; n < e.length; n++) e[n](o, r);
}(t, c);
}
return a;
});
};
};
var e = [];
},
7611: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyPreprocessType = void 0, function(t) {
t.DEFAULT = "默认", t.REVIVE = "复活", t.GUIDE = "引导";
}(e || (r.AlgorithmStrategyPreprocessType = e = {}));
},
7721: function(t, r) {
var e = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.createListSnapshot = function(t) {
return t.map(function(t) {
return {
algorithmId: t.algorithmId,
traitSource: t.traitSource,
source: t.source,
dynamicSource: t.dynamicSource,
tag: t.tag,
algorithmListSource: t.algorithmListSource,
category: t.category,
router: null == t.router ? void 0 : JSON.parse(JSON.stringify(t.router))
};
});
}, r.createSnapshots = function(t, r) {
return {
operationOrder: r,
beforeAlgorithmList: t.beforeList,
afterAlgorithmList: t.afterList,
beforeAlgorithmFallbackList: t.beforeFallbackList,
afterAlgorithmFallbackList: t.afterFallbackList
};
}, r.itemKey = function(t, r) {
var e, o, n, i, a;
return [ t, null !== (e = r.algorithmListSource) && void 0 !== e ? e : "normal", r.algorithmId, null !== (o = r.traitSource) && void 0 !== o ? o : "", null !== (n = r.source) && void 0 !== n ? n : "", null !== (i = r.dynamicSource) && void 0 !== i ? i : "", null !== (a = r.tag) && void 0 !== a ? a : "", r.router ? JSON.stringify(r.router) : "" ].join("|");
}, r.extractAlgorithmIds = function(t) {
return Array.isArray(t) ? t.filter(function(t) {
return null != t;
}) : null == t ? [] : [ t ];
}, r.isSameListSnapshot = function(t, r) {
return JSON.stringify(t) === JSON.stringify(r);
}, r.isSameNumberList = function(t, r) {
if (t.length !== r.length) return !1;
for (var e = 0; e < t.length; e++) if (t[e] !== r[e]) return !1;
return !0;
}, r.toNumberList = function(t) {
if (Array.isArray(t)) return t.filter(function(t) {
return "number" == typeof t;
});
}, r.cloneSnapshotValue = function t(r, n, i) {
var a, l, c;
if (void 0 === n && (n = 0), void 0 === i && (i = new WeakSet()), null == r || "string" == typeof r || "number" == typeof r || "boolean" == typeof r) return r;
if ("bigint" == typeof r) return r.toString();
if ("function" == typeof r) return "[Function ".concat(null !== (c = r.name) && void 0 !== c ? c : "anonymous", "]");
if ("object" != typeof r) return String(r);
if (i.has(r)) return "[Circular]";
if (n >= 5) return "[Object]";
if (i.add(r), Array.isArray(r)) return r.map(function(r) {
return t(r, n + 1, i);
});
var s = {};
try {
for (var u = e(Object.entries(r)), g = u.next(); !g.done; g = u.next()) {
var f = o(g.value, 2), h = f[0], d = f[1];
s[h] = t(d, n + 1, i);
}
} catch (t) {
a = {
error: t
};
} finally {
try {
g && !g.done && (l = u.return) && l.call(u);
} finally {
if (a) throw a.error;
}
}
return s;
}, r.formatPatchTarget = function(t) {
var r;
if (t) return "function" == typeof t ? t.name || "anonymous" : "object" == typeof t ? null === (r = t.constructor) || void 0 === r ? void 0 : r.name : String(t);
};
},
7728: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoItemSdkArgsPatch = void 0;
var c = e(2436), s = e(5815), u = e(5213), g = e(3768), f = e(2230), h = function() {
function t() {}
return t.patch = function(t, r) {
return o(this, void 0, Promise, function() {
var e, o, h, d, p, y, S, m, A, v, b, _, C, T;
return n(this, function(n) {
switch (n.label) {
case 0:
e = algorithmStrategy.context.configs.ALGORITHM_STRATEGY_SDK_ARGS_TRAITS_CONFIG, 
(null == r ? void 0 : r.length) > 0 && (e = e.filter(function(t) {
return !r.includes(t);
})), u.flow.traits = e, o = f.AlgorithmStrategySDKRequest.createBaseInputArgs(), 
h = [], d = [], n.label = 1;

case 1:
n.trys.push([ 1, 6, 7, 8 ]), p = i(e), y = p.next(), n.label = 2;

case 2:
return y.done ? [ 3, 5 ] : (S = y.value, (null == h ? void 0 : h.includes(S)) ? [ 3, 4 ] : (null == (m = TRAIT(S)) ? void 0 : m.onActiveCondition) && (null == m ? void 0 : m.active) && (0, 
g.isSDKRequestTrait)(m) ? [ 4, (0, c.mergeSDKActionsArgs)(m, u.flow, o, t) ] : [ 3, 4 ]);

case 3:
(A = n.sent()) && (v = A.merged, b = A.args, void 0 !== v.disableTraits && (h = l([], a(new Set(l(l([], a(h), !1), a(v.disableTraits), !1))), !1)), 
f.AlgorithmStrategySDKRequest.mergeToInputArgs(o, v, S), algorithmStrategy.context.CC_DEBUG && d.push({
traitClassName: (0, s.formatTraitNameWithDescription)(S),
args: b
})), n.label = 4;

case 4:
return y = p.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return _ = n.sent(), C = {
error: _
}, [ 3, 8 ];

case 7:
try {
y && !y.done && (T = p.return) && T.call(p);
} finally {
if (C) throw C.error;
}
return [ 7 ];

case 8:
return algorithmStrategy.context.CC_DEBUG && (s.AlgorithmStrategyLog.log("SDK 算法列表-请求-合并参数：", s.AlgorithmStrategyLog.NORMAL_COLOR), 
s.AlgorithmStrategyLog.table(d)), [ 2, o ];
}
});
});
}, t;
}();
r.AlgorithmStrategyAlgoItemSdkArgsPatch = h;
},
7809: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, i = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, a = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordActionResult = function(t) {
var r = t.actionType, e = t.traitSource, i = t.args, a = t.beforeList, f = t.afterList, h = t.success, d = t.process, p = t.algorithmListSource;
if (e) {
var y = u.conflictStore.nextOperationOrderValue(), S = (0, g.createSnapshots)(t, y);
(function(t, r) {
t.traitSource && u.conflictStore.actionRecords.push({
process: t.process,
actionType: t.actionType,
traitSource: t.traitSource,
beforeList: t.beforeList,
afterList: t.afterList,
operationOrder: r
});
})(t, y), h ? ("fallback" !== p && "replaceAll" === r && function(t, r, e, i, a, c) {
var u, g, f = new Set(a.map(function(t) {
return t.traitSource;
}).filter(function(t) {
return !!t && t !== e;
})), h = function(n) {
(0, s.addEvent)(o({
type: l.AlgorithmStrategyConflictType.ALGORITHM_OPERATOR_REPLACE_ALL_SUCCESS,
severity: "conflict",
process: t,
triggerTrait: e,
affectedTrait: n,
actionType: r,
args: i,
algorithmIds: a.filter(function(t) {
return t.traitSource === n;
}).map(function(t) {
return t.algorithmId;
}),
reason: "后置特性 replaceAll 覆盖了前置特性的算法列表项"
}, c));
};
try {
for (var d = n(f), p = d.next(); !p.done; p = d.next()) h(p.value);
} catch (t) {
u = {
error: t
};
} finally {
try {
p && !p.done && (g = d.return) && g.call(d);
} finally {
if (u) throw u.error;
}
}
}(d, r, e, i, a, S), "fallback" !== p && (function(t, r, e, o, i, a) {
var l, c, s, f;
if ("replace" === t || "replaceCategory" === t) {
var h = function(t, r, e, o) {
var n = new Set();
if ("replace" === t) {
var i = new Set((0, g.extractAlgorithmIds)(null == r ? void 0 : r[0]));
e.forEach(function(t) {
i.has(t.algorithmId) && t.traitSource && t.traitSource !== o && n.add(t.traitSource);
});
} else if ("replaceCategory" === t) {
var a = null == r ? void 0 : r[0];
e.forEach(function(t) {
t.category === a && t.traitSource && t.traitSource !== o && n.add(t.traitSource);
});
}
return n;
}(t, e, o, r);
if (0 !== h.size) {
try {
for (var d = n((0, g.extractAlgorithmIds)(null == e ? void 0 : e[0])), p = d.next(); !p.done; p = d.next()) {
var y = p.value;
u.conflictStore.replacedSourceOwner.set(y, r);
}
} catch (t) {
l = {
error: t
};
} finally {
try {
p && !p.done && (c = d.return) && c.call(d);
} finally {
if (l) throw l.error;
}
}
try {
for (var S = n(i), m = S.next(); !m.done; m = S.next()) {
var A = m.value;
if (A.traitSource === r) {
var v = {
affectedTraits: new Set(h),
affectedAlgorithmIds: (0, g.extractAlgorithmIds)(null == e ? void 0 : e[0]),
actionType: t,
args: e,
snapshots: a
};
u.conflictStore.pendingLineage.set((0, g.itemKey)("preprocess", A), v), u.conflictStore.pendingLineage.set((0, 
g.itemKey)("postprocess", A), v);
}
}
} catch (t) {
s = {
error: t
};
} finally {
try {
m && !m.done && (f = S.return) && f.call(S);
} finally {
if (s) throw s.error;
}
}
}
}
}(r, e, i, a, f, S), function(t, r, e, o, i, a) {
var l, s;
if (c.PRODUCE_ITEM_TYPES.has(r)) try {
for (var f = n(i), h = f.next(); !h.done; h = f.next()) {
var d = h.value;
if (d.traitSource === e && "normal" === d.algorithmListSource) {
var p = (0, g.itemKey)(t, d);
u.conflictStore.pendingConsumeItems.set(p, {
process: t,
key: p,
item: d,
actionType: r,
args: o,
snapshots: a
});
}
}
} catch (t) {
l = {
error: t
};
} finally {
try {
h && !h.done && (s = f.return) && s.call(f);
} finally {
if (l) throw l.error;
}
}
}(d, r, e, i, f, S)), function(t, r, e, n, i, a, c, u, f) {
(0, g.isSameListSnapshot)(i, a) && (0, g.isSameListSnapshot)(c, u) || (0, s.addEvent)(o({
type: l.AlgorithmStrategyConflictType.ALGORITHM_LIST_CHANGED,
severity: "info",
process: t,
algorithmListSource: (0, g.isSameListSnapshot)(i, a) ? "fallback" : "normal",
triggerTrait: e,
actionType: r,
args: n,
reason: "算法列表操作成功，前后列表发生变化"
}, f));
}(d, r, e, i, a, f, t.beforeFallbackList, t.afterFallbackList, S)) : function(t, r, e, n, i, a) {
var f;
if (c.OPERATION_TARGET_FAILURE_TYPES.has(e)) {
var h = (0, g.extractAlgorithmIds)(null == i ? void 0 : i[0]), d = null !== (f = h.map(function(t) {
return u.conflictStore.replacedSourceOwner.get(t);
}).find(Boolean)) && void 0 !== f ? f : n;
(0, s.addEvent)(o({
type: l.AlgorithmStrategyConflictType.ALGORITHM_OPERATOR_UNSUCCESS,
severity: "conflict",
process: t,
algorithmListSource: r,
triggerTrait: d,
affectedTrait: n,
actionType: e,
args: i,
algorithmIds: h,
reason: "算法列表操作目标不存在或无法命中"
}, a));
}
}(d, p, r, e, i, S);
}
}, r.recordLineageConflict = function(t, r, e) {
var i, a, c = u.conflictStore.pendingLineage.get(e);
if (c && 0 !== c.affectedTraits.size && r.traitSource) {
try {
for (var g = n(c.affectedTraits), f = g.next(); !f.done; f = g.next()) {
var h = f.value;
(0, s.addEvent)(o({
type: l.AlgorithmStrategyConflictType.ALGORITHM_OPERATOR_SAME_SOURCE_SDK_FAIL,
severity: "conflict",
process: t,
triggerTrait: r.traitSource,
affectedTrait: h,
actionType: c.actionType,
args: c.args,
algorithmId: r.algorithmId,
affectedAlgorithmIds: c.affectedAlgorithmIds,
reason: "多个特性影响同一算法链路，且最终算法被 SDK 请求"
}, c.snapshots));
}
} catch (t) {
i = {
error: t
};
} finally {
try {
f && !f.done && (a = g.return) && a.call(g);
} finally {
if (i) throw i.error;
}
}
u.conflictStore.pendingLineage.delete(e);
}
}, r.findRemovedByAction = function(t, r) {
return a([], i(u.conflictStore.actionRecords), !1).filter(function(t) {
return t.operationOrder > r;
}).filter(function(r) {
return f(r.beforeList, t);
}).filter(function(r) {
return !f(r.afterList, t);
}).sort(function(t, r) {
return t.operationOrder - r.operationOrder;
})[0];
};
var l = e(4727), c = e(2072), s = e(6325), u = e(1092), g = e(7721);
function f(t, r) {
return t.some(function(t) {
return t.algorithmId === r;
});
}
},
7871: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.PREPROCESS_SKIP_COLOR = r.PREPROCESS_SOURCE_START_COLOR = void 0, r.preprocessAlgorithmSourceKey = a, 
r.formatPreprocessSource = l, r.formatPreprocessSourceList = function(t) {
return "[".concat(t.map(l).join("、"), "]");
}, r.formatPreprocessTagProgress = function(t, r, e) {
return "tag【".concat(r + 1, "/").concat(e, ":").concat(t, "】");
}, r.getPreprocessSourceTraceColor = function(t) {
return !Number.isFinite(t) || t < 0 ? i.AlgorithmStrategyLog.PREPROCESS_COLOR : c[t % c.length];
}, r.getPreprocessTraitTraceColor = function(t) {
return !Number.isFinite(t) || t < 0 ? i.AlgorithmStrategyLog.PREPROCESS_COLOR : s[t % s.length];
}, r.shouldLogPreprocessFailResult = function(t) {
return t.conditionMatched && t.type !== n.PreprocessEvaluatorType.PreprocessActionEvaluatorSuccess;
}, r.formatPreprocessRunLog = function(t, r, e) {
var o, l = a(r.source), c = "mutex" === t ? "预处理-互斥-特性【源:".concat(l, "(").concat(r.source, ")】：").concat(r.trait).concat(window.traitConfigDebugInfo.getTraitClassNameDes(r.trait)) : "预处理-共享-特性【tag:".concat(r.tag, " 源:").concat(l, "(").concat(r.source, ")】：").concat(r.trait).concat(window.traitConfigDebugInfo.getTraitClassNameDes(r.trait));
if (e.status) return {
line: "✓ ".concat(c, " 已更新算法列表").concat(u(e)),
color: i.AlgorithmStrategyLog.PREPROCESS_COLOR
};
switch (e.type) {
case n.PreprocessEvaluatorType.PreprocessActionEvaluatorSuccess:
o = "规则已匹配".concat(u(e), "，但未向算法/降级列表写入");
break;

case n.PreprocessEvaluatorType.PreprocessActionEvaluatorFail:
o = e.conditionMatched ? "规则已匹配".concat(u(e), "，但动作评估失败") : "规则未匹配";
break;

default:
var s = e.type;
o = "未知 type(".concat(String(s), ")");
}
return {
line: "✗ ".concat(c, " ").concat(o),
color: i.AlgorithmStrategyLog.PREPROCESS_FAIL_COLOR
};
};
var o = e(5800), n = e(4386), i = e(5815);
function a(t) {
var r;
return String(null !== (r = o.algorithmStrategy.context.algorithmSourceType[t]) && void 0 !== r ? r : t);
}
function l(t) {
return t === Number.MIN_SAFE_INTEGER ? "无互斥胜出源" : "".concat(a(t), "(").concat(t, ")");
}
r.PREPROCESS_SOURCE_START_COLOR = "color:#FFFFFF;background:#D32F2F;font-weight:700;padding:2px 8px;border-radius:2px;border:1px solid #B71C1C;", 
r.PREPROCESS_SKIP_COLOR = "color:#546E7A;background:#ECEFF1;font-weight:500;padding:2px 8px;border-radius:2px;border:1px solid #B0BEC5;";
var c = [ "color:#004D40;background:#B2DFDB;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #00897B;", "color:#1A237E;background:#C5CAE9;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #3949AB;", "color:#4A148C;background:#E1BEE7;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #8E24AA;", "color:#3E2723;background:#FFE0B2;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #FB8C00;", "color:#263238;background:#CFD8DC;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #607D8B;", "color:#0D47A1;background:#BBDEFB;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #1E88E5;" ], s = [ "color:#004D40;background:#E0F2F1;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #26A69A;", "color:#1A237E;background:#E8EAF6;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #5C6BC0;", "color:#4A148C;background:#F3E5F5;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #AB47BC;", "color:#3E2723;background:#FFF3E0;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #FB8C00;", "color:#263238;background:#ECEFF1;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #78909C;", "color:#0D47A1;background:#E3F2FD;font-weight:600;padding:2px 8px;border-radius:2px;border:1px solid #42A5F5;" ];
function u(t) {
return t.conditionMatched ? t.matchedRuleFlow ? "、条件分支【".concat(t.matchedRuleFlow, "】") : "、命中规则无 flow 名" : "";
}
},
7880: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyProcessType = void 0, function(t) {
t.SESSION_INIT = "游戏 Session 初始化（每次启动后）", t.ROUND_INIT = "每轮初始化", t.GAMES_INIT = "每局初始化", 
t.GAMES_NEW_INIT = "每局初始化（新的一局）", t.PREPROCESS_MUTEX = "预处理-互斥-进入", t.PREPROCESS_MUTEX_SUCCESS = "预处理-互斥-成功", 
t.PREPROCESS_MUTEX_FAIL = "预处理-互斥-失败", t.PREPROCESS_SHARE = "预处理-共享-进入", t.PREPROCESS_SHARE_SUCCESS = "预处理-共享-成功", 
t.PREPROCESS_SHARE_FAIL = "预处理-共享-失败", t.PREPROCESS_SDK = "预处理-SDK-进入", t.PREPROCESS_SDK_PRIORITY = "预处理-SDK-算法优先级列表-进入", 
t.PREPROCESS_SDK_PRIORITY_SUCCESS = "预处理-SDK-算法优先级列表-请求成功", t.PREPROCESS_SDK_PRIORITY_FAIL = "预处理-SDK-算法优先级列表-请求失败", 
t.PREPROCESS_SDK_NORMAL = "预处理-SDK-算法列表-进入", t.PREPROCESS_SDK_NORMAL_SUCCESS = "预处理-SDK-算法列表-请求成功", 
t.PREPROCESS_SDK_NORMAL_FAIL = "预处理-SDK-算法列表-请求失败", t.PREPROCESS_SDK_POST = "预处理-SDK-算法POST列表-进入", 
t.PREPROCESS_SDK_POST_SUCCESS = "预处理-SDK-算法POST列表-请求成功", t.PREPROCESS_SDK_POST_FAIL = "预处理-SDK-算法POST列表-请求失败", 
t.PREPROCESS_SDK_FALLBACK = "预处理-SDK-算法降级列表-进入", t.PREPROCESS_SDK_FALLBACK_SUCCESS = "预处理-SDK-算法降级列表-请求成功", 
t.PREPROCESS_SDK_FALLBACK_FAIL = "预处理-SDK-算法降级列表-请求失败", t.POSTPROCESS = "后处理-进入", 
t.POSTPROCESS_SDK = "后处理-SDK-进入", t.POSTPROCESS_SDK_NORMAL = "后处理-SDK-算法列表-进入", 
t.POSTPROCESS_SDK_NORMAL_SUCCESS = "后处理-SDK-算法列表-请求成功", t.POSTPROCESS_SDK_NORMAL_FAIL = "后处理-SDK-算法列表-请求失败", 
t.POSTPROCESS_SUCCESS = "后处理-成功", t.POSTPROCESS_SDK_SUCCESS = "后处理-SDK-成功", t.POSTPROCESS_SDK_FAIL = "后处理-SDK-失败", 
t.POSTPROCESS_FAIL = "后处理-失败", t.POSITION_ADJUST = "位置调整-进入", t.POSITION_ADJUST_SUCCESS = "位置调整-成功", 
t.POSITION_ADJUST_FAIL = "位置调整-失败", t.COLOR_ADJUST = "颜色调整", t.COLOR_ADJUST_SUCCESS = "颜色调整-成功", 
t.COLLECTION_ADJUST = "收集物调整", t.COLLECTION_ADJUST_SUCCESS = "收集物调整-成功", t.COLLECTION_ADJUST_FAIL = "收集物调整-失败", 
t.COMPLETE_PRE = "完成前", t.COMPLETE = "完成";
}(e || (r.AlgorithmStrategyProcessType = e = {}));
},
7894: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoPreprocessMutexRouterChangedPatch = r.preprocessMutexRouterPatch = void 0, 
r.clearPreprocessMutexRouterPatch = function() {
r.preprocessMutexRouterPatch = {};
};
var n = e(7594);
r.preprocessMutexRouterPatch = {};
var i = function() {
function t() {}
return t.patch = function(t) {
return r.preprocessMutexRouterPatch[t] = !0, !0;
}, o([ (0, n.patch)({
patchKey: "preprocessMutexRouter",
getStored: function() {
return r.preprocessMutexRouterPatch;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoPreprocessMutexRouterChangedPatch = i;
},
8011: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyConflictRecorder = void 0;
var o = e(7809), n = e(7120), i = e(4081), a = e(7263), l = e(1425), c = e(7721), s = e(3774), u = e(9818), g = e(1811), f = e(5733), h = function() {
function t() {}
return t.resetGame = function(t) {
(0, l.resetGame)(t);
}, t.resetRound = function(t) {
(0, l.resetRound)(t);
}, t.beginSDKRequest = function() {
(0, g.beginSDKRequest)();
}, t.recordTraitCall = function(t) {
(0, f.recordTraitCall)(t);
}, t.recordTraitTrigger = function(t) {
(0, f.recordTraitTrigger)(t);
}, t.createListSnapshot = function(t) {
return (0, c.createListSnapshot)(t);
}, t.recordActionResult = function(t) {
(0, o.recordActionResult)(t);
}, t.recordPartialActionSuccess = function(t) {
(0, a.recordPartialActionSuccess)(t);
}, t.recordAdjustResult = function(t) {
(0, n.recordAdjustResult)(t);
}, t.recordPatchUpdate = function(t) {
(0, i.recordPatchUpdate)(t);
}, t.recordBlockListFinalCheck = function(t) {
(0, i.recordBlockListFinalCheck)(t);
}, t.recordSDKItemRequested = function(t, r) {
(0, g.recordSDKItemRequested)(t, r);
}, t.recordSDKItemSkipped = function(t, r) {
(0, g.recordSDKItemSkipped)(t, r);
}, t.recordSDKItemResult = function(t, r) {
(0, g.recordSDKItemResult)(t, r);
}, t.recordSDKStopReason = function(t) {
(0, g.recordSDKStopReason)(t);
}, t.completeSDK = function(t) {
(0, g.completeSDK)(t);
}, t.completeFallbackSDK = function(t) {
(0, g.completeFallbackSDK)(t);
}, t.recordPreprocessSuccessButPostprocessReplace = function(t, r) {
(0, g.recordPreprocessSuccessButPostprocessReplace)(t, r);
}, t.recordSuccessfulSDKResult = function(t, r) {
(0, g.recordSuccessfulSDKResult)(t, r);
}, t.recordResultConflict = function(t) {
(0, u.recordResultConflict)(t);
}, t.snapshot = function() {
return (0, s.snapshot)();
}, t;
}();
r.AlgorithmStrategyConflictRecorder = h;
},
8088: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoBlockIdListPatch = void 0;
var n, i = e(5213), a = e(7594), l = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
if (!Array.isArray(t) || !Array.isArray(r) || t.length !== r.length) return !1;
if (5 === r[0] && (4 === r[1] || 5 === r[1]) && 5 === r[2]) return !1;
for (var e = 0; e < t.length; e++) if (t[e] !== r[e]) return !1;
return !0;
}(n, t)) return !1;
var r = i.flow.sdk;
return r && (r.blockIds = t), n = t, !0;
}, o([ (0, a.patch)({
patchKey: "blockIdList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgoBlockIdListPatch = l;
},
8243: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyDisablePatch = void 0;
var n = e(5213), i = e(7594), a = function() {
function t() {}
return t.disablePostRestTagsPatch = function() {
return n.flow.disabledPostRestTags = !0, !0;
}, o([ (0, i.patch)({
patchKey: "disablePostRestTags",
getStored: function() {
return !0;
}
}) ], t, "disablePostRestTagsPatch", null), t;
}();
r.AlgorithmStrategyDisablePatch = a;
},
8281: function(t, r, e) {
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, n = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmPostListPatchOperator = void 0;
var a = e(4246), l = [], c = function() {
function t() {}
return Object.defineProperty(t, "algorithmPostList", {
get: function() {
return Object.freeze(n([], o(l), !1));
},
enumerable: !1,
configurable: !0
}), t.unshift = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.unshift.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.unshift.options)), !1)), 
!0);
}, t.push = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.push.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.push.options)), !1)), 
!0);
}, t.insertBefore = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i, 0 ], o((0, a.transformAlgorithmId)(e, t.insertBefore.options)), !1)), 
!0);
}, t.insertAfter = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i + 1, 0 ], o((0, a.transformAlgorithmId)(e, t.insertAfter.options)), !1)), 
!0);
}, t.remove = function(t) {
if ((0, a.isAbsentAlgorithmIdArg)(t)) return !1;
var r = (0, a.toArray)(t), e = new Set(r), o = l.filter(function(t) {
return !e.has(t.algorithmId);
}), n = o.length !== l.length;
return n && (l = o), n;
}, t.removeCategory = function(t) {
if (null == t) return !1;
var r = (0, a.CATEGORY_TO_ENUM)()[t], e = l.filter(function(t) {
return !Object.values(r).includes(t.algorithmId);
}), o = e.length !== l.length;
return o && (l = e), o;
}, t.replace = function(r, e) {
var c, s;
if ((0, a.isAbsentAlgorithmIdArg)(r) || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.toArray)(r), g = new Set(u), f = (0, a.transformAlgorithmId)(e, t.replace.options), h = !1, d = [];
try {
for (var p = i(l), y = p.next(); !y.done; y = p.next()) {
var S = y.value;
g.has(S.algorithmId) ? (d.push.apply(d, n([], o(f), !1)), h = !0) : d.push(S);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
y && !y.done && (s = p.return) && s.call(p);
} finally {
if (c) throw c.error;
}
}
return h && (l = d), h;
}, t.replaceCategory = function(r, e) {
var c, s;
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.CATEGORY_TO_ENUM)()[r], g = !1, f = [];
try {
for (var h = i(l), d = h.next(); !d.done; d = h.next()) {
var p = d.value;
Object.values(u).includes(p.algorithmId) ? (f.push.apply(f, n([], o((0, a.transformAlgorithmId)(e, t.replaceCategory.options)), !1)), 
g = !0) : f.push(p);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
d && !d.done && (s = h.return) && s.call(h);
} finally {
if (c) throw c.error;
}
}
return g && (l = f), g;
}, t.replaceAll = function(r) {
return !(0, a.isAbsentReplaceAllAlgorithmIdArg)(r) && (l = (0, a.transformAlgorithmId)(r, t.replaceAll.options), 
!0);
}, t.clear = function() {
l.length = 0;
}, t;
}();
r.AlgorithmStrategyAlgorithmPostListPatchOperator = c;
},
8329: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgoSdkRequestPatch = void 0;
var o = e(5815), n = e(5213), i = e(2230), a = function() {
function t() {}
return t.patch = function(t, r) {
var e = i.AlgorithmStrategySDKRequest.request(t, r, n.flow);
return algorithmStrategy.context.CC_DEBUG && o.AlgorithmStrategyLog.log("补丁：sdkRequest", o.AlgorithmStrategyLog.PATCH_COLOR), 
e;
}, t;
}();
r.AlgorithmStrategyAlgoSdkRequestPatch = a;
},
8350: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, i = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.postprocess = function(t) {
return n(this, void 0, Promise, function() {
var r, e, n, A, v, b, _, C, T, O, P, R, E, L, I, x, k, w;
return i(this, function(i) {
switch (i.label) {
case 0:
if (f.AlgorithmStrategyAlgorithmListOperator._process = "post", t.process = h.AlgorithmStrategyProcessType.POSTPROCESS, 
delete t.returnState, delete t.returnStateProcessType, delete t.disabledTraits, 
delete t.disabledTags, delete t.disabledPostTags, delete t.disabledPostRestTags, 
delete t.routerTarget, t.__traitAlgoSuccess__ = void 0, S.clear(), t.disablePostprocessSequence) return t.process = h.AlgorithmStrategyProcessType.POSTPROCESS_FAIL, 
c.algorithmStrategy.context.CC_DEBUG && g.AlgorithmStrategyLog.log("后处理阶段被禁用，无特性 runPostprocess 成功，标记失败", g.AlgorithmStrategyLog.POSTPROCESS_COLOR), 
delete t.disablePostprocessSequence, delete t.returnState, delete t.returnStateProcessType, 
delete t.disabledTraits, delete t.disabledTags, delete t.disabledPostTags, delete t.disabledPostRestTags, 
delete t.routerTarget, [ 2, o({}, t) ];
Object.defineProperty(t, "currentPostTag", {
get: function() {
return S.get(this);
},
enumerable: !0,
configurable: !0
}), r = c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_POSTPROCESS_TRAITS_CONFIG, 
e = 0, i.label = 1;

case 1:
if (!(e < r.length)) return [ 3, 10 ];
if (n = r[e], S.set(t, n.tag), !t.__traitAlgoSuccess__ && (null === (I = t.disabledPostTags) || void 0 === I ? void 0 : I.includes(n.tag))) return c.algorithmStrategy.context.CC_DEBUG && (A = "tag【".concat(e + 1, "/").concat(r.length, ":").concat(n.tag, "】"), 
g.AlgorithmStrategyLog.log("后处理-跳过 tag ".concat(A, " 被 disabledPostTags 禁用"), g.AlgorithmStrategyLog.PREPROCESS_COLOR)), 
[ 3, 9 ];
if (!t.__traitAlgoSuccess__ && t.disabledPostRestTags) return [ 2 ];
t.traits = l([], a(n.list.map(m)), !1), (null === (x = t.traits) || void 0 === x ? void 0 : x.length) > 0 && c.algorithmStrategy.context.CC_DEBUG && (g.AlgorithmStrategyLog.log("后处理-特性执行列表：", g.AlgorithmStrategyLog.POSTPROCESS_COLOR), 
g.AlgorithmStrategyLog.table(t.traits.map(g.formatTraitNameWithDescription))), delete t.returnState, 
delete t.returnStateProcessType, delete t.disabledTraits, delete t.routerTarget, 
v = 0, i.label = 2;

case 2:
if (!(v < n.list.length)) return [ 3, 9 ];
if (b = n.list[v], _ = m(b), !(C = "string" == typeof (D = b) ? {} : D).returnStateDisable && function(t) {
var r, e = t, o = e.returnState, n = e.returnStateProcessType;
return !!o && (!n || n === d.AlgorithmStrategyReturnStateProcessType.DEFAULT || n === d.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS && !0 === (null === (r = t.sdk) || void 0 === r ? void 0 : r.SDK_SUCCESS));
}(t)) return [ 3, 8 ];
if (!C.disabledTraitsDisable && (null === (k = t.disabledTraits) || void 0 === k ? void 0 : k.includes(_))) return [ 3, 8 ];
if (null != (T = t.routerTarget)) {
if (_ !== T) return [ 3, 8 ];
delete t.routerTarget;
}
return (null == (O = TRAIT(_)) ? void 0 : O.onActiveCondition) && (null == O ? void 0 : O.active) && function(t) {
return t && "function" == typeof t.onPostprocessConditions && "function" == typeof t.onPostprocessActions;
}(O) ? (c.algorithmStrategy.context.CONFLICT_DEBUG && y.AlgorithmStrategyConflictRecorder.recordTraitCall(_), 
f.AlgorithmStrategyAlgorithmListOperator.clearPostprocess(), Object.defineProperty(t, "postAlgorithmList", {
value: []
}), P = {
traitSource: _,
trait: O
}, [ 4, (0, s.runPostprocess)(O, t, P) ]) : [ 3, 8 ];

case 3:
return i.sent().status ? (t.process = h.AlgorithmStrategyProcessType.POSTPROCESS_SUCCESS, 
[ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_POSTPROCESS_SDK_REQUEST_BEFORE_TRAITS_CONFIG, "onAfterOfferBefore", t) ]) : [ 3, 7 ];

case 4:
return i.sent(), [ 4, (0, p.sdkRequest)(t, "postprocess") ];

case 5:
return R = i.sent(), [ 4, (0, u.invokeLifeCycle)(c.algorithmStrategy.context.configs.ALGORITHM_STRATEGY_POSTPROCESS_SDK_REQUEST_AFTER_TRAITS_CONFIG, "onPostSdkResult", R, _) ];

case 6:
return i.sent(), (E = !0 === (null === (w = t.sdk) || void 0 === w ? void 0 : w.SDK_SUCCESS)) && t.__traitAlgoSuccess__ && (t.__traitAlgoSuccess__ = void 0), 
(L = t).returnStateProcessType === d.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS && (E ? L.returnState = !0 : delete L.returnStateProcessType), 
t.process = E ? h.AlgorithmStrategyProcessType.POSTPROCESS_SDK_SUCCESS : h.AlgorithmStrategyProcessType.POSTPROCESS_SDK_FAIL, 
c.algorithmStrategy.context.CC_DEBUG && (E ? g.AlgorithmStrategyLog.log("✓ 后处理-特性：".concat(_).concat(window.traitConfigDebugInfo.getTraitClassNameDes(_), " 请求 SDK 执行成功!"), g.AlgorithmStrategyLog.SDK_COLOR) : g.AlgorithmStrategyLog.log("✗ 后处理-特性：".concat(_).concat(window.traitConfigDebugInfo.getTraitClassNameDes(_), " 请求 SDK 执行失败!"), g.AlgorithmStrategyLog.SDK_FAIL_COLOR)), 
[ 3, 8 ];

case 7:
(L = t).returnStateProcessType === d.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS && delete L.returnStateProcessType, 
i.label = 8;

case 8:
return v++, [ 3, 2 ];

case 9:
return e++, [ 3, 1 ];

case 10:
return t.process === h.AlgorithmStrategyProcessType.POSTPROCESS && (t.process = h.AlgorithmStrategyProcessType.POSTPROCESS_FAIL), 
delete t.returnState, delete t.returnStateProcessType, delete t.disabledTraits, 
delete t.disabledTags, delete t.disabledPostTags, delete t.disabledPostRestTags, 
delete t.routerTarget, [ 2 ];
}
var D;
});
});
};
var c = e(5800), s = e(578), u = e(9351), g = e(5815), f = e(261), h = e(7880), d = e(3381), p = e(3768), y = e(8011), S = new Map();
function m(t) {
return "string" == typeof t ? t : t.name;
}
},
8637: function(t, r) {
var e = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, o = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.algorithmStrategyDot = void 0, r.toAlgorithmStrategyDotItem = function(t) {
return {
algorithmId: t.algorithmId,
source: t.source,
traitSource: t.traitSource
};
};
var n = function() {
function t() {
this._preprocessPriorityList = [], this._preprocessNormalList = [], this._preprocessFallbackList = [], 
this._postprocessSuccessNormalList = [], this._snapshotCache = null;
}
return t.prototype.clear = function() {
this._snapshotCache = null, this._preprocessPriorityList.length = 0, this._preprocessNormalList.length = 0, 
this._preprocessFallbackList.length = 0, this._postprocessSuccessNormalList.length = 0;
}, Object.defineProperty(t.prototype, "preprocessPriorityList", {
get: function() {
return this._preprocessPriorityList;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "preprocessNormalList", {
get: function() {
return this._preprocessNormalList.concat();
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "preprocessFallbackList", {
get: function() {
return this._preprocessFallbackList.concat();
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "postprocessSuccessNormalList", {
get: function() {
return this._postprocessSuccessNormalList.concat();
},
enumerable: !1,
configurable: !0
}), t.prototype.getSnapshot = function() {
return this._snapshotCache || (this._snapshotCache = {
preprocessPriorityList: this.preprocessPriorityList,
preprocessNormalList: this.preprocessNormalList,
preprocessFallbackList: this.preprocessFallbackList,
postprocessSuccessNormalList: this.postprocessSuccessNormalList
}), this._snapshotCache;
}, t.prototype.preprocessPriorityPush = function(t) {
var r;
this._snapshotCache = null, (r = this._preprocessPriorityList).push.apply(r, o([], e(t), !1));
}, t.prototype.preprocessNormalPush = function(t) {
var r;
this._snapshotCache = null, (r = this._preprocessNormalList).push.apply(r, o([], e(t), !1));
}, t.prototype.preprocessFallbackPush = function(t) {
var r;
this._snapshotCache = null, (r = this._preprocessFallbackList).push.apply(r, o([], e(t), !1));
}, t.prototype.postprocessSuccessNormalPush = function(t) {
var r;
this._snapshotCache = null, (r = this._postprocessSuccessNormalList).push.apply(r, o([], e(t), !1));
}, t;
}();
r.algorithmStrategyDot = new n();
},
8742: (t, r, e) => {
Object.defineProperty(r, "__esModule", {
value: !0
}), r.ALGORITHM_STRATEGY_OPERATOR_MAP = void 0;
var o = e(9423), n = e(261), i = e(8281), a = e(3325), l = e(2688), c = e(7044), s = e(7176), u = e(2166), g = e(7388), f = e(6507);
r.ALGORITHM_STRATEGY_OPERATOR_MAP = {
AlgorithmStrategyAlgorithmPriorityListOperator: a.AlgorithmStrategyAlgorithmPriorityListOperator,
AlgorithmStrategyAlgorithmListOperator: n.AlgorithmStrategyAlgorithmListOperator,
AlgorithmStrategyAlgorithmPostListPatchOperator: i.AlgorithmStrategyAlgorithmPostListPatchOperator,
AlgorithmStrategyAlgorithmFallbackListOperator: o.AlgorithmStrategyAlgorithmFallbackListOperator,
AlgorithmStrategyDisableOperator: l.AlgorithmStrategyDisableOperator,
AlgorithmStrategyDisableShareSequenceOperator: s.AlgorithmStrategyDisableShareSequenceOperator,
AlgorithmStrategyDisablePostprocessSequenceOperator: c.AlgorithmStrategyDisablePostprocessSequenceOperator,
AlgorithmStrategyReturnOperator: g.AlgorithmStrategyReturnOperator,
AlgorithmStrategyReturnFilterOperator: u.AlgorithmStrategyReturnFilterOperator,
AlgorithmStrategyRouterOperator: f.AlgorithmStrategyRouterOperator
};
},
8978: (t, r) => {
var e;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyCategoryType = void 0, function(t) {
t.BASE = "基础类", t.SHANG = "熵增类", t.BLACK = "填空消除类", t.DIFFICULT = "困难难题类", t.DIE = "死亡难题类";
}(e || (r.AlgorithmStrategyCategoryType = e = {}));
},
9016: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmPriorityListPatch = void 0;
var n, i = e(3325), a = e(4246), l = e(7594), c = function() {
function t() {}
return t.patch = function(t) {
if (function(t, r) {
return void 0 !== t && t === r && t.length === r.length && JSON.stringify(t) === JSON.stringify(r);
}(n, t)) return !1;
for (var r = 0; r < t.length; r++) {
var e = t[r];
e.category = (0, a.getCategoryForAlgorithm)(e.algorithmId), e.algorithmListSource = "priority";
}
return n = t, !0;
}, Object.defineProperty(t, "algorithmPriorityList", {
get: function() {
return i.AlgorithmStrategyAlgorithmPriorityListOperator.algorithmPriorityList;
},
enumerable: !1,
configurable: !0
}), o([ (0, l.patch)({
patchKey: "algorithmPriorityList",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyAlgorithmPriorityListPatch = c;
},
9223: (t, r) => {
var e, o;
Object.defineProperty(r, "__esModule", {
value: !0
}), r.GameType = r.GameMode = void 0, function(t) {
t.Class = "class", t.Chapter = "journey", t.Jewel = "jewel", t.StarMiniGame = "starMiniGame", 
t.AdventureGame = "adventureGame", t.MergeBlocks = "mergeBlocks", t.RoyalMatchStory = "royalMatchStory";
}(e || (r.GameMode = e = {})), function(t) {
t[t.Class = 0] = "Class", t[t.Chapter = 2] = "Chapter", t[t.Jewel = 6] = "Jewel", 
t[t.StarMiniGame = 15] = "StarMiniGame", t[t.AdventureGame = 12] = "AdventureGame", 
t[t.MergeBlocks = 16] = "MergeBlocks", t[t.RoyalMatchStory = 18] = "RoyalMatchStory";
}(o || (r.GameType = o = {}));
},
9351: function(t, r, e) {
var o = this && this.__awaiter || function(t, r, e, o) {
return new (e || (e = Promise))(function(n, i) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
i(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var r;
t.done ? n(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, l);
}
c((o = o.apply(t, r || [])).next());
});
}, n = this && this.__generator || function(t, r) {
var e, o, n, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function l(l) {
return function(c) {
return function(l) {
if (e) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, l[0] && (i = 0)), i; ) try {
if (e = 1, o && (n = 2 & l[0] ? o.return : l[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, l[1])).done) return n;
switch (o = 0, n && (l = [ 2 & l[0], n.value ]), l[0]) {
case 0:
case 1:
n = l;
break;

case 4:
return i.label++, {
value: l[1],
done: !1
};

case 5:
i.label++, o = l[1], l = [ 0 ];
continue;

case 7:
l = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((n = (n = i.trys).length > 0 && n[n.length - 1]) || 6 !== l[0] && 2 !== l[0])) {
i = 0;
continue;
}
if (3 === l[0] && (!n || l[1] > n[0] && l[1] < n[3])) {
i.label = l[1];
break;
}
if (6 === l[0] && i.label < n[1]) {
i.label = n[1], n = l;
break;
}
if (n && i.label < n[2]) {
i.label = n[2], i.ops.push(l);
break;
}
n[2] && i.ops.pop(), i.trys.pop();
continue;
}
l = r.call(t, i);
} catch (t) {
l = [ 6, t ], o = 0;
} finally {
e = n = 0;
}
if (5 & l[0]) throw l[1];
return {
value: l[0] ? l[1] : void 0,
done: !0
};
}([ l, c ]);
};
}
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, a = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, l = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.invokeLifeCycle = function(t, r) {
for (var e = [], g = 2; g < arguments.length; g++) e[g - 2] = arguments[g];
return o(this, void 0, Promise, function() {
var o, g, f, h, d, p, y, S, m, A, v, b;
return n(this, function(n) {
switch (n.label) {
case 0:
o = Array.from(new Set(t)), g = [], f = [], n.label = 1;

case 1:
n.trys.push([ 1, 6, 7, 8 ]), h = i(o), d = h.next(), n.label = 2;

case 2:
return d.done ? [ 3, 5 ] : (p = d.value, (null == g ? void 0 : g.includes(p)) ? [ 3, 4 ] : (null == (y = TRAIT(p)) ? void 0 : y.onActiveCondition) && (null == y ? void 0 : y.active) && "function" == typeof y[r] ? (u.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("".concat((0, 
s.formatTraitNameWithDescription)(p), " 执行了生命周期【").concat(r, "】方法"), s.AlgorithmStrategyLog.SDK_COLOR), 
u.algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordTraitTrigger(p), 
[ 4, y[r].apply(y, l([], a(e), !1)) ]) : [ 3, 4 ]);

case 3:
S = n.sent(), f.push(S), "object" == typeof S && null !== S && void 0 !== S.disableTraits && (m = S.disableTraits, 
g = l([], a(new Set(l(l([], a(g), !1), a(m), !1))), !1)), n.label = 4;

case 4:
return d = h.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return A = n.sent(), v = {
error: A
}, [ 3, 8 ];

case 7:
try {
d && !d.done && (b = h.return) && b.call(h);
} finally {
if (v) throw v.error;
}
return [ 7 ];

case 8:
return [ 2, f ];
}
});
});
}, r.invokeSelfLifeCycle = function(t, r) {
for (var e = [], i = 2; i < arguments.length; i++) e[i - 2] = arguments[i];
return o(this, void 0, Promise, function() {
var o;
return n(this, function(n) {
switch (n.label) {
case 0:
return (null == (o = TRAIT(t)) ? void 0 : o.onActiveCondition) && (null == o ? void 0 : o.active) && "function" == typeof o[r] ? [ 4, o[r].apply(o, l([], a(e), !1)) ] : [ 3, 2 ];

case 1:
n.sent(), n.label = 2;

case 2:
return [ 2 ];
}
});
});
}, r.invokeTaggedLifeCycle = function(t, r) {
for (var e = [], g = 2; g < arguments.length; g++) e[g - 2] = arguments[g];
return o(this, void 0, Promise, function() {
var o, g, f, h, d, p, y, S, m, A, v, b, _, C, T, O, P, R, E, L;
return n(this, function(n) {
switch (n.label) {
case 0:
o = [], g = [], n.label = 1;

case 1:
n.trys.push([ 1, 12, 13, 14 ]), f = i(t), h = f.next(), n.label = 2;

case 2:
if (h.done) return [ 3, 11 ];
d = h.value, p = !1, n.label = 3;

case 3:
n.trys.push([ 3, 8, 9, 10 ]), E = void 0, y = i(d.list), S = y.next(), n.label = 4;

case 4:
return S.done ? [ 3, 7 ] : (m = S.value, A = "string" == typeof m ? m : m.name, 
("string" == typeof m || !m.returnStateDisable) && p || (null == o ? void 0 : o.includes(A)) ? [ 3, 6 ] : (null == (v = TRAIT(A)) ? void 0 : v.onActiveCondition) && (null == v ? void 0 : v.active) && "function" == typeof v[r] ? (u.algorithmStrategy.context.CC_DEBUG && s.AlgorithmStrategyLog.log("".concat((0, 
s.formatTraitNameWithDescription)(A), " 执行了生命周期【").concat(r, "·tag:").concat(d.tag, "】方法"), s.AlgorithmStrategyLog.SDK_COLOR), 
u.algorithmStrategy.context.CONFLICT_DEBUG && c.AlgorithmStrategyConflictRecorder.recordTraitTrigger(A), 
[ 4, v[r].apply(v, l([ d.tag ], a(e), !1)) ]) : [ 3, 6 ]);

case 5:
b = n.sent(), g.push(b), "object" == typeof b && null !== b && (void 0 !== (_ = b).disableTraits && (C = _.disableTraits, 
o = l([], a(new Set(l(l([], a(o), !1), a(C), !1))), !1)), _.returnState && (p = !0)), 
n.label = 6;

case 6:
return S = y.next(), [ 3, 4 ];

case 7:
return [ 3, 10 ];

case 8:
return T = n.sent(), E = {
error: T
}, [ 3, 10 ];

case 9:
try {
S && !S.done && (L = y.return) && L.call(y);
} finally {
if (E) throw E.error;
}
return [ 7 ];

case 10:
return h = f.next(), [ 3, 2 ];

case 11:
return [ 3, 14 ];

case 12:
return O = n.sent(), P = {
error: O
}, [ 3, 14 ];

case 13:
try {
h && !h.done && (R = f.return) && R.call(f);
} finally {
if (P) throw P.error;
}
return [ 7 ];

case 14:
return [ 2, g ];
}
});
});
};
var c = e(8011), s = e(5815), u = e(5800);
},
9423: function(t, r, e) {
var o = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, n = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
}, i = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyAlgorithmFallbackListOperator = void 0;
var a = e(4246), l = [], c = function() {
function t() {}
return Object.defineProperty(t, "algorithmFallbackList", {
get: function() {
return Object.freeze(n([], o(l), !1));
},
enumerable: !1,
configurable: !0
}), t.unshift = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.unshift.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.unshift.options)), !1)), 
!0);
}, t.push = function(r) {
return !(0, a.isAbsentAlgorithmIdArg)(r) && (l.push.apply(l, n([], o((0, a.transformAlgorithmId)(r, t.push.options)), !1)), 
!0);
}, t.insertBefore = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i, 0 ], o((0, a.transformAlgorithmId)(e, t.insertBefore.options)), !1)), 
!0);
}, t.insertAfter = function(r, e) {
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = l.findIndex(function(t) {
return t.algorithmId === r;
});
return -1 !== i && (l.splice.apply(l, n([ i + 1, 0 ], o((0, a.transformAlgorithmId)(e, t.insertAfter.options)), !1)), 
!0);
}, t.remove = function(t) {
if ((0, a.isAbsentAlgorithmIdArg)(t)) return !1;
var r = (0, a.toArray)(t), e = new Set(r), o = l.filter(function(t) {
return !e.has(t.algorithmId);
}), n = o.length !== l.length;
return n && (l = o), n;
}, t.removeCategory = function(t) {
if (null == t) return !1;
var r = (0, a.CATEGORY_TO_ENUM)()[t], e = l.filter(function(t) {
return !Object.values(r).includes(t.algorithmId);
}), o = e.length !== l.length;
return o && (l = e), o;
}, t.replaceFirst = function(r, e) {
if ((0, a.isAbsentAlgorithmIdArg)(r) || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var i = (0, a.toArray)(r), c = new Set(i), s = (0, a.transformAlgorithmId)(e, t.replaceFirst.options), u = l.findIndex(function(t) {
return c.has(t.algorithmId);
});
if (-1 === u) return !1;
var g = n([], o(l), !1);
return g.splice.apply(g, n([ u, 1 ], o(s), !1)), l = g, !0;
}, t.replace = function(r, e) {
var c, s;
if ((0, a.isAbsentAlgorithmIdArg)(r) || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.toArray)(r), g = new Set(u), f = (0, a.transformAlgorithmId)(e, t.replace.options), h = !1, d = [];
try {
for (var p = i(l), y = p.next(); !y.done; y = p.next()) {
var S = y.value;
g.has(S.algorithmId) ? (d.push.apply(d, n([], o(f), !1)), h = !0) : d.push(S);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
y && !y.done && (s = p.return) && s.call(p);
} finally {
if (c) throw c.error;
}
}
return h && (l = d), h;
}, t.replaceCategory = function(r, e) {
var c, s;
if (null == r || (0, a.isAbsentAlgorithmIdArg)(e)) return !1;
var u = (0, a.CATEGORY_TO_ENUM)()[r], g = !1, f = [];
try {
for (var h = i(l), d = h.next(); !d.done; d = h.next()) {
var p = d.value;
Object.values(u).includes(p.algorithmId) ? (f.push.apply(f, n([], o((0, a.transformAlgorithmId)(e, t.replaceCategory.options)), !1)), 
g = !0) : f.push(p);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
d && !d.done && (s = h.return) && s.call(h);
} finally {
if (c) throw c.error;
}
}
return g && (l = f), g;
}, t.replaceAll = function(r) {
return !(0, a.isAbsentReplaceAllAlgorithmIdArg)(r) && (l = (0, a.transformAlgorithmId)(r, t.replaceAll.options), 
!0);
}, t.clear = function() {
l.length = 0;
}, t;
}();
r.AlgorithmStrategyAlgorithmFallbackListOperator = c;
},
9747: function(t, r, e) {
var o = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (n = t[l]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.AlgorithmStrategyPositionAdjustPatch = void 0;
var n, i = e(7594), a = function() {
function t() {}
return t.patch = function(t) {
return n !== t && (n = t, !0);
}, o([ (0, i.patch)({
patchKey: "positionAdjust",
getStored: function() {
return n;
}
}) ], t, "patch", null), t;
}();
r.AlgorithmStrategyPositionAdjustPatch = a;
},
9818: function(t, r, e) {
var o = this && this.__assign || function() {
return (o = Object.assign || function(t) {
for (var r, e = 1, o = arguments.length; e < o; e++) for (var n in r = arguments[e]) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n]);
return t;
}).apply(this, arguments);
}, n = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, i = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
o && !o.done && (e = i.return) && e.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
}, a = this && this.__spreadArray || function(t, r, e) {
if (e || 2 === arguments.length) for (var o, n = 0, i = r.length; n < i; n++) !o && n in r || (o || (o = Array.prototype.slice.call(r, 0, n)), 
o[n] = r[n]);
return t.concat(o || Array.prototype.slice.call(r));
};
Object.defineProperty(r, "__esModule", {
value: !0
}), r.recordSuccessfulSDKResult = function(t, r) {
var e = null == r ? void 0 : r.traitSource, o = null == r ? void 0 : r.actualAlgorithmId;
(null == r ? void 0 : r.SDK_SUCCESS) && e && null != o && h(o, e, r.algorithmListSource, r, t);
}, r.recordResultConflict = function(t) {
var r, e, o, i, a, d;
if (!f.conflictStore.roundResultConflictRecorded) {
(0, g.syncCurrentRoundIndex)();
var b = (null === (o = t.sdk) || void 0 === o ? void 0 : o.SDK_SUCCESS) ? t.sdk : void 0, _ = f.conflictStore.roundFinalResults.get(f.conflictStore.roundIndex), C = null == b ? void 0 : b.traitSource, T = null == b ? void 0 : b.actualAlgorithmId, O = null == b ? void 0 : b.algorithmListSource, P = null != C ? C : null == _ ? void 0 : _.traitSource, R = null != T ? T : null == _ ? void 0 : _.algorithmId, E = null != O ? O : null == _ ? void 0 : _.algorithmListSource;
if (P && null != R) {
f.conflictStore.roundResultConflictRecorded = !0, (null == b ? void 0 : b.SDK_SUCCESS) && h(R, P, E, b), 
c.algorithmStrategyRobotAlgorithmStats.record(R, P, null == b ? void 0 : b.blockNames, null !== (i = null == b ? void 0 : b.expectedAlgorithmId) && void 0 !== i ? i : null === (d = null === (a = l.algorithmStrategy.context) || void 0 === a ? void 0 : a.algorithmName) || void 0 === d ? void 0 : d.algoExpectedId), 
function(t, r, e) {
var o;
(0, g.syncCurrentGameIndex)();
var n = p(), i = S();
n.set(t, (null !== (o = n.get(t)) && void 0 !== o ? o : 0) + 1), function(t, r) {
var e, o = y(), n = o.get(t);
n || (n = new Map(), o.set(t, n)), n.set(r, (null !== (e = n.get(r)) && void 0 !== e ? e : 0) + 1);
}(t, r), i.set(t, r), function(t, r) {
var e, o = (0, c.createAlgorithmBlockNameKey)(t);
if (o) {
var n = m(), i = v();
n.set(o, (null !== (e = n.get(o)) && void 0 !== e ? e : 0) + 1), r && function(t, r) {
var e, o = A(), n = o.get(t);
n || (n = new Map(), o.set(t, n)), n.set(r, (null !== (e = n.get(r)) && void 0 !== e ? e : 0) + 1);
}(o, r), i.set(o, o.split(c.ALGORITHM_BLOCK_NAME_SEPARATOR));
}
}(e, r);
}(R, P, null == b ? void 0 : b.blockNames);
try {
for (var L = n(f.conflictStore.roundTraitCallCount.keys()), I = L.next(); !I.done; I = L.next()) {
var x = I.value;
x !== P && (0, u.addEvent)({
type: s.AlgorithmStrategyConflictType.ALGORITHM_RESULT_APPLIED_CONFLICT,
severity: "conflict",
process: "postprocess",
triggerTrait: P,
affectedTrait: x,
algorithmId: R,
reason: "该轮最终算法结果由一个特性成功应用，其它已调用特性均与该最终结果冲突"
});
}
} catch (t) {
r = {
error: t
};
} finally {
try {
I && !I.done && (e = L.return) && e.call(L);
} finally {
if (r) throw r.error;
}
}
}
}
}, r.recordRoundFinalResult = h, r.getCurrentGameAlgorithmCount = p, r.getCurrentGameAlgorithmTraitCount = y, 
r.getCurrentGameAlgorithmLastTraitSource = S, r.getCurrentGameAlgorithmBlockNameCount = m, 
r.getCurrentGameAlgorithmBlockNameTraitCount = A, r.getCurrentGameAlgorithmBlockNames = v;
var l = e(5800), c = e(3003), s = e(4727), u = e(6325), g = e(1425), f = e(1092);
function h(t, r, e, o, n) {
var l;
(0, g.syncCurrentRoundIndex)();
var c = f.conflictStore.roundFinalResults.get(f.conflictStore.roundIndex), s = f.conflictStore.roundEvents.length > 0 ? Math.max.apply(Math, a([], i(f.conflictStore.roundEvents.map(function(t) {
var r;
return null !== (r = t.operationOrder) && void 0 !== r ? r : t.id;
})), !1)) : void 0;
f.conflictStore.roundFinalResults.set(f.conflictStore.roundIndex, {
roundIndex: f.conflictStore.roundIndex,
operationOrder: n ? s : null !== (l = null == c ? void 0 : c.operationOrder) && void 0 !== l ? l : s,
process: null != n ? n : null == c ? void 0 : c.process,
traitSource: r,
algorithmId: t,
algorithmListSource: e,
sdkData: d(o),
finalBlockListPatch: null == c ? void 0 : c.finalBlockListPatch,
finalAdjust: null == c ? void 0 : c.finalAdjust
});
}
function d(t) {
var r, e, n;
if (t) return {
source: t.source,
SDK_ALGO_TYPE: t.SDK_ALGO_TYPE,
SDK_Extra: null == t.SDK_Extra ? void 0 : JSON.parse(JSON.stringify(t.SDK_Extra)),
SDK_SUCCESS: t.SDK_SUCCESS,
expectedAlgorithmId: null !== (r = t.expectedAlgorithmId) && void 0 !== r ? r : null === (n = null === (e = l.algorithmStrategy.context) || void 0 === e ? void 0 : e.algorithmName) || void 0 === n ? void 0 : n.algoExpectedId,
actualAlgorithmId: t.actualAlgorithmId,
blockIds: null == t.blockIds ? void 0 : a([], i(t.blockIds), !1),
blockNames: null == t.blockNames ? void 0 : a([], i(t.blockNames), !1),
blockPoses: null == t.blockPoses ? void 0 : t.blockPoses.map(function(t) {
return o({}, t);
}),
betterBlockCount: t.betterBlockCount,
betterSpaceCount: t.betterSpaceCount
};
}
function p() {
var t = f.conflictStore.gameAlgorithmCount.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmCount.set(f.conflictStore.gameIndex, t)), 
t;
}
function y() {
var t = f.conflictStore.gameAlgorithmTraitCount.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmTraitCount.set(f.conflictStore.gameIndex, t)), 
t;
}
function S() {
var t = f.conflictStore.gameAlgorithmLastTraitSource.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmLastTraitSource.set(f.conflictStore.gameIndex, t)), 
t;
}
function m() {
var t = f.conflictStore.gameAlgorithmBlockNameCount.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmBlockNameCount.set(f.conflictStore.gameIndex, t)), 
t;
}
function A() {
var t = f.conflictStore.gameAlgorithmBlockNameTraitCount.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmBlockNameTraitCount.set(f.conflictStore.gameIndex, t)), 
t;
}
function v() {
var t = f.conflictStore.gameAlgorithmBlockNames.get(f.conflictStore.gameIndex);
return t || (t = new Map(), f.conflictStore.gameAlgorithmBlockNames.set(f.conflictStore.gameIndex, t)), 
t;
}
}
}, r = {};
function e(o) {
var n = r[o];
if (void 0 !== n) return n.exports;
var i = r[o] = {
exports: {}
};
return t[o].call(i.exports, i, i.exports, e), i.exports;
}
(() => {
var t = e(5800), r = e(5213), o = e(5931), n = e(7209), i = e(2698), a = e(4046), l = e(3817), c = e(3165), s = e(9747), u = e(801), g = e(8088), f = e(7894), h = e(9016), d = e(5492), p = e(4050), y = e(1174), S = e(8329), m = e(7728), A = e(2196), v = e(304), b = e(5706), _ = e(8243), C = e(6573), T = e(7611), O = e(3381), P = e(7880), R = e(8011), E = e(4727), L = e(8637);
e(4312), e(8011), e(6074), e(2848), e(2436), e(4386), e(578), e(9351), e(2688), 
e(7176), e(4246), e(8742), e(2166), e(7388), e(6507), e(7594), e(4846), e(6024), 
e(2806), e(3374), e(8350), e(3768), e(6320), e(4057), e(2230), e(6136), e(7880), 
e(4727), e(777);
var I = {
AlgorithmStrategyAlgoBlockPosListPatch: n.AlgorithmStrategyAlgoBlockPosListPatch,
AlgorithmStrategyAlgoExtraPatch: i.AlgorithmStrategyAlgoExtraPatch,
AlgorithmStrategyAlgoSdkRequestAfterActualIdPatch: a.AlgorithmStrategyAlgoSdkRequestAfterActualIdPatch,
AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch: l.AlgorithmStrategyAlgoSdkRequestBeforeActualIdPatch,
AlgorithmStrategyAlgoExpectedIdPatch: c.AlgorithmStrategyAlgoExpectedIdPatch,
AlgorithmStrategyPositionAdjustPatch: s.AlgorithmStrategyPositionAdjustPatch,
AlgorithmStrategyAlgoActualNamePatch: u.AlgorithmStrategyAlgoActualNamePatch,
AlgorithmStrategyAlgoBlockIdListPatch: g.AlgorithmStrategyAlgoBlockIdListPatch,
AlgorithmStrategyAlgorithmPriorityListPatch: h.AlgorithmStrategyAlgorithmPriorityListPatch,
AlgorithmStrategyAlgorithmListPatch: d.AlgorithmStrategyAlgorithmListPatch,
AlgorithmStrategyAlgorithmPostListPatch: p.AlgorithmStrategyAlgorithmPostListPatch,
AlgorithmStrategyAlgorithmFallbackListPatch: y.AlgorithmStrategyAlgorithmFallbackListPatch,
AlgorithmStrategyAlgoSdkRequestPatch: S.AlgorithmStrategyAlgoSdkRequestPatch,
AlgorithmStrategyAlgoItemSdkArgsPatch: m.AlgorithmStrategyAlgoItemSdkArgsPatch,
AlgorithmStrategyAlgoItemSdkRequestPatch: A.AlgorithmStrategyAlgoItemSdkRequestPatch,
AlgorithmStrategyPreprocessShareSequenceSourcePatch: v.AlgorithmStrategyPreprocessShareSequenceSourcePatch,
AlgorithmStrategyAlgoPreprocessMutexRouterChangedPatch: f.AlgorithmStrategyAlgoPreprocessMutexRouterChangedPatch,
AlgorithmStrategyAlgorithmIdModifyPatch: b.AlgorithmStrategyAlgorithmIdModifyPatch,
AlgorithmStrategyDisablePatch: _.AlgorithmStrategyDisablePatch,
AlgorithmStrategyReturnPatch: C.AlgorithmStrategyReturnPatch,
AlgorithmStrategyPreprocessType: T.AlgorithmStrategyPreprocessType,
AlgorithmStrategyReturnStateProcessType: O.AlgorithmStrategyReturnStateProcessType,
AlgorithmStrategyProcessType: P.AlgorithmStrategyProcessType,
AlgorithmStrategyConflictRecorder: R.AlgorithmStrategyConflictRecorder,
AlgorithmStrategyConflictType: E.AlgorithmStrategyConflictType,
get dot() {
return L.algorithmStrategyDot.getSnapshot();
},
get SDK_SUCCESS() {
var t, e, o, n;
return 3 === (null === (e = null === (t = r.flow.sdk) || void 0 === t ? void 0 : t.blockIds) || void 0 === e ? void 0 : e.length) && (null === (n = null === (o = r.flow.sdk) || void 0 === o ? void 0 : o.blockIds) || void 0 === n ? void 0 : n.every(function(t) {
return t > 0;
}));
}
};
window.as || (window.as = I), Object.assign(window, {
algorithmStrategy: t.algorithmStrategy,
algorithmStrategyPipeline: r.algorithmStrategyPipeline,
algorithmStrategyRobot: o.algorithmStrategyRobot
});
})();
})();