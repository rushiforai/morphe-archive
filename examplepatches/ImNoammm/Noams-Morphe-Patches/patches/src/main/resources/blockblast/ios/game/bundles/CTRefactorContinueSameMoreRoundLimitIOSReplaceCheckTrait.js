window.__require = function t(e, r, o) {
function i(a, l) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!l && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var s = r[a] = {
exports: {}
};
e[a][0].call(s.exports, function(t) {
return i(e[a][1][t] || t);
}, s, s.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "92c0fhYVOlLvZKyhHagEYl5", "CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__awaiter || function(t, e, r, o) {
return new (r || (r = Promise))(function(i, n) {
function a(t) {
try {
c(o.next(t));
} catch (t) {
n(t);
}
}
function l(t) {
try {
c(o.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? i(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(a, l);
var e;
}
c((o = o.apply(t, e || [])).next());
});
}, l = this && this.__generator || function(t, e) {
var r, o, i, n, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return n = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function l(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (i = 2 & n[0] ? o.return : n[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, n[1])).done) return i;
(o = 0, i) && (n = [ 2 & n[0], i.value ]);
switch (n[0]) {
case 0:
case 1:
i = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!i || n[1] > i[0] && n[1] < i[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < i[1]) {
a.label = i[1];
i = n;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(n);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
r = i = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._flow = {};
return e;
}
e.prototype.data = function() {
return {
algorithm: null,
algorithmFail: null
};
};
e.prototype.onReplaceCheck = function(t, e) {
void 0 === t && (t = null);
void 0 === e && (e = null);
return {
algorithm: t,
algorithmFail: e
};
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
return a(this, void 0, Promise, function() {
return l(this, function(e) {
switch (e.label) {
case 0:
this._flow = null != t ? t : {};
return this.isReplaceDisabled() ? [ 2 ] : this.prepareReplaceCheck() ? [ 4, this.runReplaceCheck() ] : [ 2 ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
e.prototype.isReplaceDisabled = function() {
var t;
if (1 === hs.storage.getItem("classRoundNum", 0) && hs.gameInfo.gameMode === hs.GameMode.Class || 1 === hs.storage.getItem("chapterRoundNum", 0) && hs.gameInfo.gameMode === hs.GameMode.Chapter) return !0;
if (null === (t = TRAIT("CTRefactorFixIosNewAlgorithmStrategyTrait")) || void 0 === t ? void 0 : t.active) {
var e = hs.algorithmStrategyLevelRefactoredInfo.algorithmSourceLevel1;
if (e === hs.ClassAlgorithmSourceType.AlgoRevive || e === hs.ClassAlgorithmSourceType.AlgoReviveTrait || e === hs.ClassAlgorithmSourceType.AlgoNoReplaceBottom || e === hs.ChapterAlgorithmSourceType.AlgoNoReplaceBottom) return !0;
}
return !1;
};
e.prototype.prepareReplaceCheck = function() {
var t = this.onReplaceCheck(), e = t.algorithm, r = t.algorithmFail;
this.setState({
algorithm: e,
algorithmFail: r
});
return !!e || !!r;
};
e.prototype.runReplaceCheck = function() {
return a(this, void 0, Promise, function() {
var t;
return l(this, function(e) {
switch (e.label) {
case 0:
e.trys.push([ 0, , 5, 6 ]);
if (!this.state.algorithm) return [ 3, 2 ];
hs.algorithmProcessInfo.logAlgorithmInfo(this.state.algorithm, "平替检测正常");
return [ 4, this.requestReplaceSDK(this.state.algorithm) ];

case 1:
e.sent();
return [ 2 ];

case 2:
if (!this.state.algorithmFail) return [ 3, 4 ];
hs.algorithmProcessInfo.logAlgorithmInfo(this.state.algorithmFail, "平替检测降级");
return [ 4, this.requestReplaceSDK(this.state.algorithmFail) ];

case 3:
(null == (t = e.sent()) ? void 0 : t.SDK_SUCCESS) && as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE.SUI_JI_WU_SI, this);
e.label = 4;

case 4:
return [ 3, 6 ];

case 5:
this.setState({
algorithm: null,
algorithmFail: null
});
return [ 7 ];

case 6:
return [ 2 ];
}
});
});
};
e.prototype.requestReplaceSDK = function(t) {
var e, r, o, i, n, c;
return a(this, void 0, Promise, function() {
var a;
return l(this, function() {
a = {
algorithmId: t,
source: null !== (o = null === (r = null === (e = this._flow) || void 0 === e ? void 0 : e.sdk) || void 0 === r ? void 0 : r.source) && void 0 !== o ? o : hs.ClassAlgorithmSourceType.AlgoTrait,
traitSource: this.traitName,
algorithmListSource: null !== (c = null === (n = null === (i = this._flow) || void 0 === i ? void 0 : i.sdk) || void 0 === n ? void 0 : n.algorithmListSource) && void 0 !== c ? c : "normal"
};
return [ 2, as.AlgorithmStrategyAlgoItemSdkRequestPatch.patch(a, [], this) ];
});
});
};
return n([ classId("CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorContinueSameMoreRoundLimitIOSReplaceCheckTrait" ]);
//# sourceMappingURL=index.js.map
