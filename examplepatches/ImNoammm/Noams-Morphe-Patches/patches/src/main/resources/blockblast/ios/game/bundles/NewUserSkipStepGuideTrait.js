window.__require = function e(t, r, o) {
function s(a, n) {
if (!r[a]) {
if (!t[a]) {
var p = a.split("/");
p = p[p.length - 1];
if (!t[p]) {
var l = "function" == typeof __require && __require;
if (!n && l) return l(p, !0);
if (i) return i(p, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = p;
}
var u = r[a] = {
exports: {}
};
t[a][0].call(u.exports, function(e) {
return s(t[a][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) s(o[a]);
return s;
}({
NewUserSkipStepGuideTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "77f98uC7DBMLJ57xBbNgfnv", "NewUserSkipStepGuideTrait");
var o, s = this && this.__extends || (o = function(e, t) {
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
}), i = this && this.__decorate || function(e, t, r, o) {
var s, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var n = e.length - 1; n >= 0; n--) (s = e[n]) && (a = (i < 3 ? s(a) : i > 3 ? s(t, r, a) : s(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
}, a = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, s, i = r.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (e) {
s = {
error: e
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (s) throw s.error;
}
}
return a;
}, n = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(a(arguments[t]));
return e;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.NewUserSkipStepGuideTrait = void 0;
var p = function(e) {
s(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._shouldApplyPresetBoard = !1;
t._presetBoardApplied = !1;
t.BOARD_PATTERN = [ [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 2, 2, -1, -1, -1 ], [ 5, 5, 2, -1, -1, 2, 5, 5 ], [ 5, 5, 2, -1, -1, 2, 5, 5 ], [ -1, -1, -1, 2, 2, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 5, 5, -1, -1, -1 ] ];
t.PRODUCER_BLOCKS = [ -1, 9, -1 ];
t.BLOCKS_COLORS = [ 1, 1, 1 ];
return t;
}
Object.defineProperty(t.prototype, "guideBypassMode", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.guideBypassMode) && void 0 !== t ? t : 0;
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
hs.tp.isClassGame_ProxyOnGameStart(e) ? this.handleGameStart() : hs.tp.isClassDefaultBoard_ProxyTriggerSpecialTrait(e) ? this.handleTriggerSpecialTrait(e) : hs.tp.isClassBlocksProducer_ProxyBeforeBlocksProducerUpdate(e) ? this.handleBeforeBlocksProducerUpdate(e) : hs.tp.isColdStartClearBoardTraitOnTriggerAlgorithmResult(e) && this.handleOnTriggerAlgorithmResult(e);
};
t.prototype.handleGameStart = function() {
if (this.isClassMode() && !hs.classGuideInfo.isFinishedGuide) {
hs.storage.setItem("classGuideStep", hs.classGuideInfo.totalStep);
0 === this.guideBypassMode ? this._shouldApplyPresetBoard = !0 : 1 === this.guideBypassMode && this.clearBoardStorage();
} else {
this._presetBoardApplied = !1;
this._shouldApplyPresetBoard = !1;
}
};
t.prototype.handleTriggerSpecialTrait = function(e) {
if (this._shouldApplyPresetBoard) {
e.args[0] = this.BOARD_PATTERN.map(function(e) {
return n(e);
});
e.returnState = !0;
this._presetBoardApplied = !0;
} else this._presetBoardApplied = !1;
};
t.prototype.handleBeforeBlocksProducerUpdate = function(e) {
if (this._shouldApplyPresetBoard) {
var t = e.args[0], r = e.args[1];
this.PRODUCER_BLOCKS.forEach(function(e, r) {
t[r] = e;
});
this.BLOCKS_COLORS.forEach(function(e, t) {
r[t] = e;
});
hs.storage.setItem("classProducerBlocks", n(this.PRODUCER_BLOCKS));
hs.storage.setItem("classColorLists", n(this.BLOCKS_COLORS));
this._shouldApplyPresetBoard = !1;
}
};
t.prototype.handleOnTriggerAlgorithmResult = function(e) {
if (this._presetBoardApplied) {
e.replace = !0;
this._presetBoardApplied = !1;
}
};
t.prototype.clearBoardStorage = function() {
hs.storage.setItem("classFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classInitialFaceBlocks", hs.boardInfo.NULL);
hs.storage.setItem("classProducerBlocks", [ -1, -1, -1 ]);
};
t.prototype.isClassMode = function() {
return hs.gameInfo.gameMode === hs.GameMode.Class;
};
return i([ classId("NewUserSkipStepGuideTrait") ], t);
}(Trait);
r.NewUserSkipStepGuideTrait = p;
cc._RF.pop();
}, {} ]
}, {}, [ "NewUserSkipStepGuideTrait" ]);
//# sourceMappingURL=index.js.map
