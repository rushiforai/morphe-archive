window.__require = function e(r, t, i) {
function o(a, s) {
if (!t[a]) {
if (!r[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!r[u]) {
var f = "function" == typeof __require && __require;
if (!s && f) return f(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var l = t[a] = {
exports: {}
};
r[a][0].call(l.exports, function(e) {
return o(r[a][1][e] || e);
}, l, l.exports, e, r, t, i);
}
return t[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < i.length; a++) o(i[a]);
return o;
}({
PuzzleBeforeTimingAdjustParamsTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "3aa2dm6PABMLZM+gK2St3tW", "PuzzleBeforeTimingAdjustParamsTrait");
var i, o = this && this.__extends || (i = function(e, r) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
i(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), n = this && this.__decorate || function(e, r, t, i) {
var o, n = arguments.length, a = n < 3 ? r : null === i ? i = Object.getOwnPropertyDescriptor(r, t) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, r, t, i); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (a = (n < 3 ? o(a) : n > 3 ? o(r, t, a) : o(r, t)) || a);
return n > 3 && a && Object.defineProperty(r, t, a), a;
}, a = this && this.__values || function(e) {
var r = "function" == typeof Symbol && Symbol.iterator, t = r && e[r], i = 0;
if (t) return t.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && i >= e.length && (e = void 0);
return {
value: e && e[i++],
done: !e
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
}, s = this && this.__read || function(e, r) {
var t = "function" == typeof Symbol && e[Symbol.iterator];
if (!t) return e;
var i, o, n = t.call(e), a = [];
try {
for (;(void 0 === r || r-- > 0) && !(i = n.next()).done; ) a.push(i.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
i && !i.done && (t = n.return) && t.call(n);
} finally {
if (o) throw o.error;
}
}
return a;
}, u = this && this.__spread || function() {
for (var e = [], r = 0; r < arguments.length; r++) e = e.concat(s(arguments[r]));
return e;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.PuzzleBeforeTimingAdjustParamsTrait = void 0;
var f = function(e) {
o(r, e);
function r() {
return null !== e && e.apply(this, arguments) || this;
}
Object.defineProperty(r.prototype, "score1", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.score1) && void 0 !== r ? r : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "start1", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.start1) && void 0 !== r ? r : [];
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "end1", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.end1) && void 0 !== r ? r : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "start2", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.start2) && void 0 !== r ? r : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "end2", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.end2) && void 0 !== r ? r : 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "order", {
get: function() {
var e, r;
return null !== (r = null === (e = this.props) || void 0 === e ? void 0 : e.order) && void 0 !== r ? r : 0;
},
enumerable: !1,
configurable: !0
});
r.prototype.onActive = function(e) {
this.ios_initPuzzleTimeFirst(e);
};
r.prototype.ios_initPuzzleTimeFirst = function(e) {
if (hs.tp.isClassGame_GameInfoUpdate_ProxyUpdateClassGameNumAfter(e) && 6 == this.props.order && "number" == typeof this.score1 && hs.classScoreInfo.score >= this.score1) {
storage.setItem("everyDayGameNum", 0);
e.disable([ "PuzzleBeforeTimingTrait" ]);
}
if (hs.tp.isClassAlgorithmStrategy_Reset_ProxyPreprocessing_PuzzleTime(e)) {
var r = TRAIT("IsPuzzleTimeTrait");
if (null == r ? void 0 : r.active) {
var t = this._handleIOSBeforeTimingAdjustParams();
if (t > 0) {
r.setState({
puzzleTimeFirst: t
});
e.disable([ "PuzzleBeforeTimingAdjustParamsTrait" ]);
}
}
}
};
r.prototype._handleIOSBeforeTimingAdjustParams = function() {
var e = 0;
switch (this.order) {
case 1:
e = this._handleIOSBeforeTimingAdjustParamsOne();
break;

case 2:
e = this._handleIOSBeforeTimingAdjustParamsTwo();
break;

case 3:
e = this._handleIOSBeforeTimingAdjustParamsThree();
break;

case 4:
e = this.firstDiffTopTimeFeat();
break;

case 5:
e = this._handleIOSBeforeTimingAdjustParamsFive();
break;

case 6:
e = this.firstDiffTopTimeFeatRevert();
}
return e;
};
r.prototype._handleIOSBeforeTimingAdjustParamsOne = function() {
var e = this.start1, r = this.end1;
return "number" == typeof e && "number" == typeof r ? hs.randomInt(e, r) : 0;
};
r.prototype._handleIOSBeforeTimingAdjustParamsTwo = function() {
return Array.isArray(this.start1) && this.start1.length > 0 ? this.firstDiffTopicTimeConfig(this.start1) : 0;
};
r.prototype._handleIOSBeforeTimingAdjustParamsThree = function() {
if (Array.isArray(this.score1) && Array.isArray(this.start1) && Array.isArray(this.end1) && Array.isArray(this.start2) && Array.isArray(this.end2)) {
var e = hs.scoreInfo.highScore, r = [ this.start1, this.end1, this.start2, this.end2 ], t = this.score1.length - 1;
t = this.score1.length;
for (var i = 0; i < this.score1.length; i++) if (e <= this.score1[i]) {
t = i;
break;
}
var o = r[t];
return this.firstDiffTopicTimeConfig(o);
}
return 0;
};
r.prototype._handleIOSBeforeTimingAdjustParamsFive = function() {
var e = hs.classScoreInfo.highScore, r = hs.randomInt(180, 240), t = hs.randomInt(120, 180), i = hs.randomInt(90, 150);
return e <= 1e3 ? r : e <= 3e3 ? t : i;
};
r.prototype.firstDiffTopicTimeConfig = function(e) {
return e[this.compareResultGetTimeIndex(e.length)];
};
r.prototype.firstDiffTopTimeFeat = function() {
var e, r, t, i, o = null !== (i = null === (t = this.props) || void 0 === t ? void 0 : t.param) && void 0 !== i ? i : {}, n = hs.scoreInfo.highRecordScore, s = Object.keys(o).map(Number).filter(function(e) {
return !isNaN(e);
}).reverse(), u = [];
try {
for (var f = a(s), l = f.next(); !l.done; l = f.next()) {
var c = l.value;
if (n >= c) {
u = o[c];
break;
}
}
} catch (r) {
e = {
error: r
};
} finally {
try {
l && !l.done && (r = f.return) && r.call(f);
} finally {
if (e) throw e.error;
}
}
var h = this.compareResultGetTimeIndex(u.length);
return h < 0 ? 0 : u[h];
};
r.prototype.compareResultGetTimeIndex = function(e) {
if (e <= 0) return -1;
var r = new Date(), t = r.getFullYear() + "_" + (r.getMonth() + 1) + "_" + r.getDate();
if (t != hs.classGameInfo.dayTimeEveryDay) {
storage.setItem("dayTimeEveryDay", t);
storage.setItem("everyDayGameNum", 0);
}
return hs.classGameInfo.everyDayGameNum % e;
};
r.prototype.firstDiffTopTimeFeatRevert = function() {
var e = TRAIT("IsPuzzleTimeTrait");
if ((null == e ? void 0 : e.active) && Array.isArray(this.start1)) {
if (6 != this.order) return 0;
var r = this.start1, t = e.state.puzzleTimeFirst, i = u(r, [ t ]);
if (i.length <= 0) return 0;
var o = this.compareResultGetTimeIndex(i.length);
return i[o = hs.classGameInfo.everyDayGameNum > o ? i.length - 1 : o];
}
return 0;
};
return n([ classId("PuzzleBeforeTimingAdjustParamsTrait") ], r);
}(Trait);
t.PuzzleBeforeTimingAdjustParamsTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "PuzzleBeforeTimingAdjustParamsTrait" ]);
//# sourceMappingURL=index.js.map
