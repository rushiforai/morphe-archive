window.__require = function e(t, r, o) {
function i(a, s) {
if (!r[a]) {
if (!t[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!t[f]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(f, !0);
if (n) return n(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var c = r[a] = {
exports: {}
};
t[a][0].call(c.exports, function(e) {
return i(t[a][1][e] || e);
}, c, c.exports, e, t, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
CTRefactorPuzzleBeforeTimingTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "363f8FShPVORpdQGkTUTmSX", "CTRefactorPuzzleBeforeTimingTrait");
var o, i = this && this.__extends || (o = function(e, t) {
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
}), n = this && this.__assign || function() {
return (n = Object.assign || function(e) {
for (var t, r = 1, o = arguments.length; r < o; r++) {
t = arguments[r];
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
}
return e;
}).apply(this, arguments);
}, a = this && this.__decorate || function(e, t, r, o) {
var i, n = arguments.length, a = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var s = e.length - 1; s >= 0; s--) (i = e[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(t, r, a) : i(t, r)) || a);
return n > 3 && a && Object.defineProperty(t, r, a), a;
}, s = this && this.__values || function(e) {
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
}, f = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, i, n = r.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = n.next()).done; ) a.push(o.value);
} catch (e) {
i = {
error: e
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (i) throw i.error;
}
}
return a;
}, u = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(f(arguments[t]));
return e;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPuzzleBeforeTimingTrait = void 0;
var c = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.data = function() {
return {};
};
Object.defineProperty(t.prototype, "firstAlgoId", {
get: function() {
return hs.traitConfigSafePropsInfo.getSafePropValueByKey("PuzzleBeforeTimingTrait", "firstAlgoId", this.props, null);
},
enumerable: !1,
configurable: !0
});
t.prototype.getPropStart1 = function() {
return this.props.start1;
};
t.prototype.getHighRecordScore = function(e) {
var t;
return null !== (t = this.state.highRecordScoreOverride) && void 0 !== t ? t : e;
};
t.prototype.isClassGame_GameInfoUpdate_ProxyUpdateClassGameNumAfter = function() {
this.handleUpdateClassGameNumAfter();
};
t.prototype.handleUpdateClassGameNumAfter = function() {
if (6 == this.props.order && this.props.score1) {
var e = this.props.score1;
hs.classScoreInfo.score >= e && storage.setItem("everyDayGameNum", 0);
}
};
t.prototype.onAlgorithmStrategyGameInit = function(e) {
"preprocessing_PuzzleTime" === e && this.ios_initPuzzleTimeFirst();
};
t.prototype.gp_initPuzzleTimeFirst = function() {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == e ? void 0 : e.active) {
var t = this.props, r = t.gameNum, o = t.earlyType, i = t.end1, a = t.score1, s = t.start2, f = t.end2, u = t.order, c = this.getPropStart1(), l = !0;
void 0 === c ? l = !1 : "number" == typeof c ? void 0 !== i && "number" == typeof i || (l = !1) : Array.isArray(c) && c.every(function(e) {
return Array.isArray(e) && e.every(function(e) {
return "number" == typeof e;
});
}) || (l = !1);
void 0 !== a && ("number" == typeof a || Array.isArray(a) && a.every(function(e) {
return "number" == typeof e;
}) || (l = !1));
void 0 !== r && "number" != typeof r && (l = !1);
void 0 !== o && "number" != typeof o && (l = !1);
void 0 !== s && "number" != typeof s && (l = !1);
void 0 !== f && "number" != typeof f && (l = !1);
void 0 !== u && "number" != typeof u && (l = !1);
if (!l) {
r = 0;
o = 0;
c = [ [ 180, 120, 180, 120, 90 ] ];
i = 0;
a = 0;
s = 0;
f = 0;
u = 2;
}
if ("number" == typeof c) {
e.state.puzzleTimeFirst = hs.randomInt(c, i);
e.setState(n(n({}, e.state), {
firstAlgoId: this.firstAlgoId
}));
} else if (c.length > 0) {
var p = c[0];
if (a && "object" == typeof a && a.length > 0) for (var h = 0; h < a.length + 1; h++) {
if (h == a.length) {
p = c[h];
break;
}
if (this.getHighRecordScore(hs.classScoreInfo.highScore) < a[h]) {
p = c[h];
break;
}
}
var m = p[(hs.classGameInfo.gameNum - hs.classDataStatisticsInfo.todayGameNum) % p.length];
e.state.puzzleTimeFirst = m;
e.setState(n(n({}, e.state), {
firstAlgoId: this.firstAlgoId
}));
}
if (o && r && hs.classGameInfo.gameNum < r) {
var y = e.state.puzzleTimeFirst, d = Math.floor(y * (1 - (10 - hs.classGameInfo.gameNum) / 20));
e.state.puzzleTimeFirst = d;
e.setState(n(n({}, e.state), {
firstAlgoId: this.firstAlgoId
}));
}
}
};
t.prototype.ios_initPuzzleTimeFirst = function() {
var e = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == e ? void 0 : e.active) {
var t, r = this.props, o = hs.randomInt(180, 240), i = hs.randomInt(120, 180), n = hs.randomInt(90, 150);
if (1 == r.order) t = hs.randomInt(r.start1, r.end1); else if (2 == r.order && Array.isArray(r.start1)) {
var a = r.start1;
t = this.firstDiffTopicTimeConfig(a);
} else if (3 == r.order) {
for (var s = r.score1, f = this.getHighRecordScore(hs.classScoreInfo.highScore), u = [ r.start1, r.end1, r.start2, r.end2 ], c = s.length, l = 0; l < s.length; l++) if (f <= s[l]) {
c = l;
break;
}
var p = u[c];
t = this.firstDiffTopicTimeConfig(p);
} else 4 == r.order ? t = this.firstDiffTopTimeFeat() : 5 == r.order ? t = (f = this.getHighRecordScore(hs.classScoreInfo.highScore)) <= 1e3 ? o : f <= 3e3 ? i : n : 6 == r.order && (t = this.firstDiffTopTimeFeatRevert());
t > 0 && (e.state.puzzleTimeFirst = t);
}
};
t.prototype.firstDiffTopicTimeConfig = function(e) {
return e[this.compareResultGetTimeIndex(e.length)];
};
t.prototype.firstDiffTopTimeFeat = function() {
var e, t, r = this.props.param, o = this.getHighRecordScore(hs.scoreInfo.highRecordScore), i = Object.keys(r).map(Number).reverse(), n = [];
try {
for (var a = s(i), f = a.next(); !f.done; f = a.next()) {
var u = f.value;
if (o >= u) {
n = r[u];
break;
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
f && !f.done && (t = a.return) && t.call(a);
} finally {
if (e) throw e.error;
}
}
return n[this.compareResultGetTimeIndex(n.length)];
};
t.prototype.compareResultGetTimeIndex = function(e) {
var t = new Date(), r = t.getFullYear() + "_" + (t.getMonth() + 1) + "_" + t.getDate();
if (r != hs.classGameInfo.dayTimeEveryDay) {
storage.setItem("dayTimeEveryDay", r);
storage.setItem("everyDayGameNum", 0);
}
return hs.classGameInfo.everyDayGameNum % e;
};
t.prototype.firstDiffTopTimeFeatRevert = function() {
var e = this.props;
if (6 != (null == e ? void 0 : e.order)) return 0;
var t = TRAIT("CTRefactorIsPuzzleTimeTrait");
if (null == t ? void 0 : t.active) {
var r = e.start1, o = t.state.puzzleTimeFirst, i = u(r, [ o ]), n = this.compareResultGetTimeIndex(i.length);
return i[n = hs.classGameInfo.everyDayGameNum > n ? i.length - 1 : n];
}
};
return a([ classId("CTRefactorPuzzleBeforeTimingTrait"), classMethodWatch() ], t);
}(Trait);
r.CTRefactorPuzzleBeforeTimingTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPuzzleBeforeTimingTrait" ]);
//# sourceMappingURL=index.js.map
