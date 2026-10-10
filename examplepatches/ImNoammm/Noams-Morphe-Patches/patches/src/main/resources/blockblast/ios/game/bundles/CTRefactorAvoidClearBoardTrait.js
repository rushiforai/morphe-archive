window.__require = function o(t, r, e) {
function n(c, l) {
if (!r[c]) {
if (!t[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!t[a]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var u = r[c] = {
exports: {}
};
t[c][0].call(u.exports, function(o) {
return n(t[c][1][o] || o);
}, u, u.exports, o, t, r, e);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < e.length; c++) n(e[c]);
return n;
}({
CTRefactorAvoidClearBoardTrait: [ function(o, t, r) {
"use strict";
cc._RF.push(t, "a0013NqA6dLmLDe/W51o3ss", "CTRefactorAvoidClearBoardTrait");
var e, n = this && this.__extends || (e = function(o, t) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(o, t) {
o.__proto__ = t;
} || function(o, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (o[r] = t[r]);
})(o, t);
}, function(o, t) {
e(o, t);
function r() {
this.constructor = o;
}
o.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(o, t, r, e) {
var n, i = arguments.length, c = i < 3 ? t : null === e ? e = Object.getOwnPropertyDescriptor(t, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(o, t, r, e); else for (var l = o.length - 1; l >= 0; l--) (n = o[l]) && (c = (i < 3 ? n(c) : i > 3 ? n(t, r, c) : n(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
}, c = this && this.__read || function(o, t) {
var r = "function" == typeof Symbol && o[Symbol.iterator];
if (!r) return o;
var e, n, i = r.call(o), c = [];
try {
for (;(void 0 === t || t-- > 0) && !(e = i.next()).done; ) c.push(e.value);
} catch (o) {
n = {
error: o
};
} finally {
try {
e && !e.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return c;
}, l = this && this.__spread || function() {
for (var o = [], t = 0; t < arguments.length; t++) o = o.concat(c(arguments[t]));
return o;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAvoidClearBoardTrait = void 0;
var a = function(o) {
n(t, o);
function t() {
var t = null !== o && o.apply(this, arguments) || this;
t._sdkBlockIds = [];
t._sdkBlockNames = [];
t._sdkBlockPoses = [];
return t;
}
t.prototype.onPostprocessConditionContext = function(o) {
var t, r, e, n, i = hs.scoreInfo.score, c = null !== (r = null === (t = null == o ? void 0 : o.sdk) || void 0 === t ? void 0 : t.blockIds) && void 0 !== r ? r : [], l = null !== (n = null === (e = null == o ? void 0 : o.sdk) || void 0 === e ? void 0 : e.blockNames) && void 0 !== n ? n : [], a = i < this.props.score && c.length > 0 && l.some(function(o) {
return o.includes("填空");
});
return buildLazyConditionContext({
canAvoidClearBoard: function() {
return ASContext(a, "分数低于阈值且出题含填空消除算法");
}
});
};
t.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
fact: "canAvoidClearBoard",
operator: "=",
value: !0
},
flow: "avoidClearBoard",
gameMode: "class"
} ];
};
t.prototype.onPostprocessActions = function() {
return {
avoidClearBoard: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ hs.OFFER_TYPE.ALGO_AVOID_CLEAR_BOARD ]
} ]
};
};
t.prototype.onSDKArgsConditionContext = function(o, t, r) {
var e, n, i, c = null == o ? void 0 : o.sdk;
this._sdkBlockIds = l(null !== (e = null == c ? void 0 : c.blockIds) && void 0 !== e ? e : []);
this._sdkBlockNames = l(null !== (n = null == c ? void 0 : c.blockNames) && void 0 !== n ? n : []);
this._sdkBlockPoses = (null !== (i = null == c ? void 0 : c.blockPoses) && void 0 !== i ? i : []).map(function(o) {
return {
row: o.row,
col: o.col
};
});
var a = (null == r ? void 0 : r.algorithmId) === hs.OFFER_TYPE.ALGO_AVOID_CLEAR_BOARD;
return buildLazyConditionContext({
isAvoidClearBoard: function() {
return ASContext(a, "是否不清屏填空消除算法");
}
});
};
t.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
fact: "isAvoidClearBoard",
operator: "=",
value: !0
},
flow: "injectBlockArgs"
} ];
};
t.prototype.onSDKArgsActions = function() {
var o = this;
return {
injectBlockArgs: function() {
return {
blockIds: o._sdkBlockIds.concat(),
blockNames: o._sdkBlockNames.concat(),
blockPoses: o._sdkBlockPoses.map(function(o) {
return {
row: o.row,
col: o.col
};
})
};
}
};
};
return i([ classId("CTRefactorAvoidClearBoardTrait") ], t);
}(Trait);
r.CTRefactorAvoidClearBoardTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAvoidClearBoardTrait" ]);
//# sourceMappingURL=index.js.map
