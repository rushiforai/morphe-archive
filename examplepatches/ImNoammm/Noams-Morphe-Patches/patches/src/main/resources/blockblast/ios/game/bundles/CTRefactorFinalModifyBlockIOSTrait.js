window.__require = function t(o, e, r) {
function i(c, a) {
if (!e[c]) {
if (!o[c]) {
var l = c.split("/");
l = l[l.length - 1];
if (!o[l]) {
var f = "function" == typeof __require && __require;
if (!a && f) return f(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = l;
}
var u = e[c] = {
exports: {}
};
o[c][0].call(u.exports, function(t) {
return i(o[c][1][t] || t);
}, u, u.exports, t, o, e, r);
}
return e[c].exports;
}
for (var n = "function" == typeof __require && __require, c = 0; c < r.length; c++) i(r[c]);
return i;
}({
CTRefactorFinalModifyBlockIOSTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "1cf4anftetO05Yauu1BWISu", "CTRefactorFinalModifyBlockIOSTrait");
var r, i = this && this.__extends || (r = function(t, o) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
r(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), n = this && this.__decorate || function(t, o, e, r) {
var i, n = arguments.length, c = n < 3 ? o : null === r ? r = Object.getOwnPropertyDescriptor(o, e) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, o, e, r); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (c = (n < 3 ? i(c) : n > 3 ? i(o, e, c) : i(o, e)) || c);
return n > 3 && c && Object.defineProperty(o, e, c), c;
}, c = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var r, i, n = e.call(t), c = [];
try {
for (;(void 0 === o || o-- > 0) && !(r = n.next()).done; ) c.push(r.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
r && !r.done && (e = n.return) && e.call(n);
} finally {
if (i) throw i.error;
}
}
return c;
}, a = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(c(arguments[o]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.CTRefactorFinalModifyBlockIOSTrait = void 0;
var l = function(t) {
i(o, t);
function o() {
return null !== t && t.apply(this, arguments) || this;
}
Object.defineProperty(o.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
o.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
hs.gameInfo.gameMode === hs.GameMode.Class && 1 !== storage.getItem("classRoundNum", 0) && this.modifyFinalBlock(t);
this.modifyComplete();
};
o.prototype.modifyFinalBlock = function(t) {
this.checkGuaranteedBlock(t);
};
o.prototype.checkGuaranteedBlock = function(t) {
var o;
if (!this.shouldSkipCheckGuaranteedBlock(t)) {
var e = null === (o = t.sdk) || void 0 === o ? void 0 : o.blockIds;
if (e) {
var r = a(e);
if (hs.algorithmIOSGameInfo.checkIdsArr(r)) {
if (!hs.algorithmStrategyLogic.canPutBlock(r[0]) && !hs.algorithmStrategyLogic.canPutBlock(r[1]) && !hs.algorithmStrategyLogic.canPutBlock(r[2])) {
this.reportInvalidBlockIds("600", r);
r[1] = hs.algorithmStrategyLogic.produceRandomId(r[1]);
this.patchBlockIdList(r);
}
} else this.reportInvalidBlockIds("600", r);
}
}
};
o.prototype.shouldSkipCheckGuaranteedBlock = function(t) {
return !0 === t.newLifeBlockCtrlSkipFinalModifyBlockCheck;
};
o.prototype.patchBlockIdList = function(t) {
return as.AlgorithmStrategyAlgoBlockIdListPatch.patch(t, this);
};
o.prototype.reportInvalidBlockIds = function(t, o) {
var e = t + "_v:" + hs.gameInfo.gameVersion + "_getIdArr:" + JSON.stringify(o) + "_currentWayName:" + hs.algorithmName.algoExpectedId + "_" + JSON.stringify(hs.algorithmName.algoActualName);
DS("gameLaunchProcess", {
id: e
});
};
o.prototype.modifyComplete = function() {};
return n([ classId("CTRefactorFinalModifyBlockIOSTrait"), classMethodWatch() ], o);
}(Trait);
e.CTRefactorFinalModifyBlockIOSTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFinalModifyBlockIOSTrait" ]);
//# sourceMappingURL=index.js.map
