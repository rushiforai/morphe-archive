window.__require = function t(r, e, o) {
function n(l, a) {
if (!e[l]) {
if (!r[l]) {
var c = l.split("/");
c = c[c.length - 1];
if (!r[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = c;
}
var f = e[l] = {
exports: {}
};
r[l][0].call(f.exports, function(t) {
return n(r[l][1][t] || t);
}, f, f.exports, t, r, e, o);
}
return e[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < o.length; l++) n(o[l]);
return n;
}({
CTRefactorChapterEarlyBlock13LimitHandleArgsTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "b3263LgFF5IToAgzA3bCC1w", "CTRefactorChapterEarlyBlock13LimitHandleArgsTrait");
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
var n, i = arguments.length, l = i < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, r, e, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (l = (i < 3 ? n(l) : i > 3 ? n(r, e, l) : n(r, e)) || l);
return i > 3 && l && Object.defineProperty(r, e, l), l;
}, l = this && this.__read || function(t, r) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var o, n, i = e.call(t), l = [];
try {
for (;(void 0 === r || r-- > 0) && !(o = i.next()).done; ) l.push(o.value);
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
return l;
}, a = this && this.__spread || function() {
for (var t = [], r = 0; r < arguments.length; r++) t = t.concat(l(arguments[r]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorChapterEarlyBlock13LimitHandleArgsTrait = void 0;
var c = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
e = r;
Object.defineProperty(r.prototype, "fullProtectRounds", {
get: function() {
var t, r;
return null !== (r = null === (t = this.props) || void 0 === t ? void 0 : t.fullProtectRounds) && void 0 !== r ? r : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "perRoundProtect", {
get: function() {
var t, r;
return null !== (r = null === (t = this.props) || void 0 === t ? void 0 : t.perRoundProtect) && void 0 !== r ? r : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(r.prototype, "onActiveCondition", {
get: function() {
var t;
return (null === (t = hs.gameInfo) || void 0 === t ? void 0 : t.gameMode) === hs.GameMode.Chapter;
},
enumerable: !1,
configurable: !0
});
r.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
hostIsActive: function() {
var t;
return ASContext(null === (t = TRAIT("CTRefactorChapterEarlyBlock13LimitTrait")) || void 0 === t ? void 0 : t.active, "主特性生效");
},
shouldFilterBlock13: function() {
return ASContext(t.shouldFilterBlock13(), "关卡前期保护窗口内限制13号块");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "hostIsActive",
operator: "=",
value: !0
}, {
fact: "shouldFilterBlock13",
operator: "=",
value: !0
} ]
},
flow: "filterBlock13HandleArgs",
platform: "ios",
gameMode: "journey"
} ];
};
r.prototype.onSDKArgsActions = function() {
var t = e.BLOCK_13_ID;
return {
filterBlock13HandleArgs: function(r) {
var e, o = null !== (e = null == r ? void 0 : r.filterBlocks) && void 0 !== e ? e : [], n = {
filterWeightBlocks: [ t ]
};
o.includes(t) || (n.filterBlocks = a(o, [ t ]));
return n;
}
};
};
r.prototype.shouldFilterBlock13 = function() {
var t, r, e, o, n = (null !== (r = null === (t = hs.chapterGameInfo) || void 0 === t ? void 0 : t.gameNum) && void 0 !== r ? r : 0) + 1, i = null !== (o = null === (e = hs.chapterGameInfo) || void 0 === e ? void 0 : e.roundNum) && void 0 !== o ? o : 0;
return n <= this.fullProtectRounds || i <= this.perRoundProtect;
};
var e;
r.BLOCK_13_ID = 13;
return e = i([ classId("CTRefactorChapterEarlyBlock13LimitHandleArgsTrait") ], r);
}(Trait);
e.CTRefactorChapterEarlyBlock13LimitHandleArgsTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorChapterEarlyBlock13LimitHandleArgsTrait" ]);
//# sourceMappingURL=index.js.map
