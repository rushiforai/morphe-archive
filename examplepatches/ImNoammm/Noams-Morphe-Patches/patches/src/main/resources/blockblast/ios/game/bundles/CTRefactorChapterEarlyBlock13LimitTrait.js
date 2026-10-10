window.__require = function t(o, r, e) {
function i(l, u) {
if (!r[l]) {
if (!o[l]) {
var c = l.split("/");
c = c[c.length - 1];
if (!o[c]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = c;
}
var p = r[l] = {
exports: {}
};
o[l][0].call(p.exports, function(t) {
return i(o[l][1][t] || t);
}, p, p.exports, t, o, r, e);
}
return r[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < e.length; l++) i(e[l]);
return i;
}({
CTRefactorChapterEarlyBlock13LimitTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "09062qQHSJPLbjD+CjuyI4o", "CTRefactorChapterEarlyBlock13LimitTrait");
var e, i = this && this.__extends || (e = function(t, o) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var r in o) Object.prototype.hasOwnProperty.call(o, r) && (t[r] = o[r]);
})(t, o);
}, function(t, o) {
e(t, o);
function r() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (r.prototype = o.prototype, new r());
}), n = this && this.__decorate || function(t, o, r, e) {
var i, n = arguments.length, l = n < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, o, r, e); else for (var u = t.length - 1; u >= 0; u--) (i = t[u]) && (l = (n < 3 ? i(l) : n > 3 ? i(o, r, l) : i(o, r)) || l);
return n > 3 && l && Object.defineProperty(o, r, l), l;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorChapterEarlyBlock13LimitTrait = void 0;
var l = function(t) {
i(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(o.prototype, "fullProtectRounds", {
get: function() {
var t, o;
return null !== (o = null === (t = this.props) || void 0 === t ? void 0 : t.fullProtectRounds) && void 0 !== o ? o : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(o.prototype, "perRoundProtect", {
get: function() {
var t, o;
return null !== (o = null === (t = this.props) || void 0 === t ? void 0 : t.perRoundProtect) && void 0 !== o ? o : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(o.prototype, "onActiveCondition", {
get: function() {
var t;
return (null === (t = hs.gameInfo) || void 0 === t ? void 0 : t.gameMode) === hs.GameMode.Chapter;
},
enumerable: !1,
configurable: !0
});
o.prototype.onSDKArgsConditionContext = function() {
var t = this;
return buildLazyConditionContext({
shouldFilterBlock13: function() {
return ASContext(t.shouldFilterBlock13(), "关卡前期保护窗口内限制13号块");
}
});
};
o.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "shouldFilterBlock13",
operator: "=",
value: !0
},
flow: "filterBlock13",
platform: "ios",
gameMode: "journey"
} ];
};
o.prototype.onSDKArgsActions = function() {
return {
filterBlock13: function(t) {
var o, r, e, i = null == t ? void 0 : t.limitSmallRandomWeight;
return {
limitSmallRandomWeight: {
isLimitBlockIdArr: null !== (o = null == i ? void 0 : i.isLimitBlockIdArr) && void 0 !== o && o,
isLimitCopyBlockIdArr: null !== (r = null == i ? void 0 : i.isLimitCopyBlockIdArr) && void 0 !== r && r,
isUseCopyBlock: null === (e = null == i ? void 0 : i.isUseCopyBlock) || void 0 === e || e,
copyFilterBlocks: [ 13 ]
}
};
}
};
};
o.prototype.shouldFilterBlock13 = function() {
var t, o, r, e, i = (null !== (o = null === (t = hs.chapterGameInfo) || void 0 === t ? void 0 : t.gameNum) && void 0 !== o ? o : 0) + 1, n = null !== (e = null === (r = hs.chapterGameInfo) || void 0 === r ? void 0 : r.roundNum) && void 0 !== e ? e : 0;
return i <= this.fullProtectRounds || n <= this.perRoundProtect;
};
return n([ classId("CTRefactorChapterEarlyBlock13LimitTrait") ], o);
}(Trait);
r.CTRefactorChapterEarlyBlock13LimitTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorChapterEarlyBlock13LimitTrait" ]);
//# sourceMappingURL=index.js.map
