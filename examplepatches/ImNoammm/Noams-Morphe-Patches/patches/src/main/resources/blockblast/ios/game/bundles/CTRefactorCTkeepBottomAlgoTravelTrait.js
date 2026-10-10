window.__require = function t(o, r, e) {
function i(c, a) {
if (!r[c]) {
if (!o[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!o[l]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var f = r[c] = {
exports: {}
};
o[c][0].call(f.exports, function(t) {
return i(o[c][1][t] || t);
}, f, f.exports, t, o, r, e);
}
return r[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < e.length; c++) i(e[c]);
return i;
}({
CTRefactorCTkeepBottomAlgoTravelTrait: [ function(t, o, r) {
"use strict";
cc._RF.push(o, "82c9e3R4yhHfo9oBhVovfvU", "CTRefactorCTkeepBottomAlgoTravelTrait");
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
var i, n = arguments.length, c = n < 3 ? o : null === e ? e = Object.getOwnPropertyDescriptor(o, r) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, o, r, e); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (c = (n < 3 ? i(c) : n > 3 ? i(o, r, c) : i(o, r)) || c);
return n > 3 && c && Object.defineProperty(o, r, c), c;
}, c = this && this.__read || function(t, o) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var e, i, n = r.call(t), c = [];
try {
for (;(void 0 === o || o-- > 0) && !(e = n.next()).done; ) c.push(e.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
e && !e.done && (r = n.return) && r.call(n);
} finally {
if (i) throw i.error;
}
}
return c;
}, a = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(c(arguments[o]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorCTkeepBottomAlgoTravelTrait = void 0;
var l = function(t) {
i(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
o.prototype.onAlgorithmStrategyPostprocessComplete = function() {
var t = hs.algorithmInfo.blockIdList;
if (Array.isArray(t) && 3 === t.length) {
var o = a(t);
this.isAllBlocksCannotPut(o) ? this.patchMiddleBlock(o) : this.isSameBlockList(o) && this.isReplaceSameBlock() && this.patchMiddleBlock(o);
}
};
o.prototype.isReplaceSameBlock = function() {
return !0;
};
o.prototype.isAllBlocksCannotPut = function(t) {
return !hs.algorithmStrategyLogic.canPutBlock(t[0]) && !hs.algorithmStrategyLogic.canPutBlock(t[1]) && !hs.algorithmStrategyLogic.canPutBlock(t[2]);
};
o.prototype.isSameBlockList = function(t) {
return t[0] === t[1] && t[0] === t[2];
};
o.prototype.patchMiddleBlock = function(t) {
t[1] = hs.algorithmStrategyLogic.produceRandomId(t[1]);
as.AlgorithmStrategyAlgoBlockIdListPatch.patch([], this);
as.AlgorithmStrategyAlgoBlockIdListPatch.patch(t, this);
};
return n([ classId("CTRefactorCTkeepBottomAlgoTravelTrait"), classMethodWatch() ], o);
}(Trait);
r.CTRefactorCTkeepBottomAlgoTravelTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCTkeepBottomAlgoTravelTrait" ]);
//# sourceMappingURL=index.js.map
