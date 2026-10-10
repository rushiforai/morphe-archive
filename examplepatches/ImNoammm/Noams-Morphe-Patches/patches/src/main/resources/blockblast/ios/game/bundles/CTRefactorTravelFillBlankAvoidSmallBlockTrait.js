window.__require = function t(r, o, e) {
function n(l, a) {
if (!o[l]) {
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
var f = o[l] = {
exports: {}
};
r[l][0].call(f.exports, function(t) {
return n(r[l][1][t] || t);
}, f, f.exports, t, r, o, e);
}
return o[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < e.length; l++) n(e[l]);
return n;
}({
CTRefactorTravelFillBlankAvoidSmallBlockTrait: [ function(t, r, o) {
"use strict";
cc._RF.push(r, "d36d7usDrtNcqWC67i0OL1u", "CTRefactorTravelFillBlankAvoidSmallBlockTrait");
var e, n = this && this.__extends || (e = function(t, r) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
})(t, r);
}, function(t, r) {
e(t, r);
function o() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (o.prototype = r.prototype, new o());
}), i = this && this.__decorate || function(t, r, o, e) {
var n, i = arguments.length, l = i < 3 ? r : null === e ? e = Object.getOwnPropertyDescriptor(r, o) : e;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, r, o, e); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (l = (i < 3 ? n(l) : i > 3 ? n(r, o, l) : n(r, o)) || l);
return i > 3 && l && Object.defineProperty(r, o, l), l;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CTRefactorTravelFillBlankAvoidSmallBlockTrait = void 0;
var l = function(t) {
n(r, t);
function r() {
return null !== t && t.apply(this, arguments) || this;
}
r.prototype.isTrigger = function(t) {
return t.algorithmId == hs.OFFER_TYPE_BLANK.TRAVEL_FILL_FUNCTION_BIT;
};
r.prototype.onSDKArgsConditionContext = function(t, r, o) {
var e = this;
return buildLazyConditionContext({
isTrigger: function() {
return ASContext(e.isTrigger(o), "是否出发特性");
}
});
};
r.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
} ]
},
flow: "flow1"
} ];
};
r.prototype.onSDKArgsActions = function() {
return {
flow1: function() {
return {
extra: {
traits: {
travelFillBlankAvoidSmallBlock: !0
}
}
};
}
};
};
return i([ classId("CTRefactorTravelFillBlankAvoidSmallBlockTrait") ], r);
}(Trait);
o.CTRefactorTravelFillBlankAvoidSmallBlockTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorTravelFillBlankAvoidSmallBlockTrait" ]);
//# sourceMappingURL=index.js.map
