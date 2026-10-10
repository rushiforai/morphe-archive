window.__require = function t(e, r, o) {
function n(s, a) {
if (!r[s]) {
if (!e[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(u, !0);
if (i) return i(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var _ = r[s] = {
exports: {}
};
e[s][0].call(_.exports, function(t) {
return n(e[s][1][t] || t);
}, _, _.exports, t, e, r, o);
}
return r[s].exports;
}
for (var i = "function" == typeof __require && __require, s = 0; s < o.length; s++) n(o[s]);
return n;
}({
CTRefactorBasePositionAdjustTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "35262qWkA5JdrpmZa4RSQuK", "CTRefactorBasePositionAdjustTrait");
var o, n = this && this.__extends || (o = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, s = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (s = (i < 3 ? n(s) : i > 3 ? n(e, r, s) : n(e, r)) || s);
return i > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorBasePositionAdjustTrait = void 0;
var s = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategyPositionAdjust = function() {
return {
data: hs.AlgorithmStrategyPositionType.LEFT
};
};
e.prototype.isNeedRandomOrder = function() {
var t = this.downgradeActualIdByBlockNames(hs.algorithmName.algoActualId);
return t !== hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU && (hs.isValueInEnum(t, hs.OFFER_TYPE_DIFFICULTY) || hs.isValueInEnum(t, hs.OFFER_TYPE_DIE) || hs.isValueInEnum(t, hs.OFFER_TYPE_BLANK));
};
e.prototype.downgradeActualIdByBlockNames = function(t) {
var e = hs.algorithmName.algoActualName;
return e.every(function(t) {
return t === hs.ALGO_NAME_TYPE.NAME_RANDOM;
}) ? hs.OFFER_TYPE.SUI_JI : e.every(function(t) {
return t === hs.ALGO_NAME_TYPE.NAME_NODIE;
}) ? hs.OFFER_TYPE.SUI_JI_WU_SI : t;
};
e.prototype.getPositionTypeByOrder = function(t) {
switch (t.join(",")) {
case "0,1,2":
return hs.AlgorithmStrategyPositionType.LEFT;

case "2,0,1":
return hs.AlgorithmStrategyPositionType.MIDDLE;

case "2,1,0":
return hs.AlgorithmStrategyPositionType.RIGHT;

case "1,2,0":
return hs.AlgorithmStrategyPositionType.MIDDLE_LEFT;

case "1,0,2":
return hs.AlgorithmStrategyPositionType.RIGHT_LEFT;

case "0,2,1":
return hs.AlgorithmStrategyPositionType.LEFT_RIGHT;

default:
return hs.AlgorithmStrategyPositionType.LEFT;
}
};
return i([ classId("CTRefactorBasePositionAdjustTrait") ], e);
}(Trait);
r.CTRefactorBasePositionAdjustTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBasePositionAdjustTrait" ]);
//# sourceMappingURL=index.js.map
