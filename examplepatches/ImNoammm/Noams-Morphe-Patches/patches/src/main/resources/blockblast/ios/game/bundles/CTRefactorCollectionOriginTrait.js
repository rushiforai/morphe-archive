window.__require = function t(r, e, o) {
function n(a, c) {
if (!e[a]) {
if (!r[a]) {
var f = a.split("/");
f = f[f.length - 1];
if (!r[f]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = f;
}
var u = e[a] = {
exports: {}
};
r[a][0].call(u.exports, function(t) {
return n(r[a][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorCollectionOriginTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "51495xxYl5PM7AjyJrfwjDD", "CTRefactorCollectionOriginTrait");
var o, n = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), i = this && this.__decorate || function(t, r, e, o) {
var n, i = arguments.length, a = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var c = t.length - 1; c >= 0; c--) (n = t[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(r, e, a) : n(r, e)) || a);
return i > 3 && a && Object.defineProperty(r, e, a), a;
}, a = this && this.__values || function(t) {
var r = "function" == typeof Symbol && Symbol.iterator, e = r && t[r], o = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(r ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorCollectionOriginTrait = void 0;
var c = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.onAlgorithmStrategyCollectionAdjust = function() {
var t, r, e = [ [], [], [] ], o = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections, n = function(t) {
var r = hs.chapterCollectInfo.getRemainCollectNum(t.Key);
if (r <= 0) return "continue";
for (var o = hs.chapterBoardInfo.faceBlocks, n = [], i = [ 0, 1, 2 ].sort(function() {
var t = Math.random();
n.push(t);
return t - .5;
}), a = 0, c = 0; c < 8; c++) for (var f = 0; f < 8; f++) o && o[c][f] == t.Key && a++;
var l = (a + (t.Value - r)) / t.Value < 1.25, u = Math.ceil(1.25 * t.Value - (a + (t.Value - r)));
if (l) for (var h = Math.random(), s = Math.min(Math.floor(3 * h) + 1, u), p = 0; p < s; p++) {
var y = hs.algorithmPosInfo.getPos(hs.chapterAlgorithmInfo.blockIdList[i[p]]), d = Math.random(), v = Math.floor(d * y.length);
e[i[p]].push({
Key: t.Key,
pos: v
});
}
};
try {
for (var i = a(o), c = i.next(); !c.done; c = i.next()) n(c.value);
} catch (r) {
t = {
error: r
};
} finally {
try {
c && !c.done && (r = i.return) && r.call(i);
} finally {
if (t) throw t.error;
}
}
for (var f = [], l = function(t) {
f[t] = [];
if (e[t].length > 0) {
var r = [], o = e[t].sort(function() {
var t = Math.random();
r.push(t);
return t - .5;
});
f[t].push(o[0]);
} else f[t].push([]);
}, u = 0; u < e.length; u++) l(u);
return {
data: f
};
};
return i([ classId("CTRefactorCollectionOriginTrait") ], r);
}(Trait);
e.CTRefactorCollectionOriginTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCollectionOriginTrait" ]);
//# sourceMappingURL=index.js.map
