window.__require = function e(t, r, o) {
function i(n, c) {
if (!r[n]) {
if (!t[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!t[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var p = r[n] = {
exports: {}
};
t[n][0].call(p.exports, function(e) {
return i(t[n][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
CTRefactorBaseSwitchGuideReviveTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "4b0c5n/x+hJr7ayUDyOgTqY", "CTRefactorBaseSwitchGuideReviveTrait");
var o, i = this && this.__extends || (o = function(e, t) {
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
}), a = this && this.__decorate || function(e, t, r, o) {
var i, a = arguments.length, n = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (n = (a < 3 ? i(n) : a > 3 ? i(t, r, n) : i(t, r)) || n);
return a > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorBaseSwitchGuideReviveTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoGuide: [ {
conditions: !0,
flow: "flowGuide"
} ],
AlgoRevive: [ {
conditions: !0,
flow: "flowRevive"
} ],
AlgoReviveTrait: [ {
conditions: !0,
flow: "flowReviveTrait"
} ],
TravelRevive: [ {
conditions: !0,
flow: "flowRevive"
} ],
TravelReviveTrait: [ {
conditions: !0,
flow: "flowReviveTrait"
} ]
}
};
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoGuide: {
flowGuide: [ {
operator: "AlgorithmStrategyDisableShareSequenceOperator",
type: "disable"
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
},
AlgoRevive: {
flowRevive: [ {
operator: "AlgorithmStrategyDisableShareSequenceOperator",
type: "disable"
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
},
AlgoReviveTrait: {
flowReviveTrait: [ {
operator: "AlgorithmStrategyDisableShareSequenceOperator",
type: "disable"
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
},
TravelRevive: {
flowRevive: [ {
operator: "AlgorithmStrategyDisableShareSequenceOperator",
type: "disable"
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
},
TravelReviveTrait: {
flowReviveTrait: [ {
operator: "AlgorithmStrategyDisableShareSequenceOperator",
type: "disable"
}, {
operator: "AlgorithmStrategyDisablePostprocessSequenceOperator",
type: "disable"
} ]
}
}
};
};
return a([ classId("CTRefactorBaseSwitchGuideReviveTrait") ], t);
}(Trait);
r.CTRefactorBaseSwitchGuideReviveTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorBaseSwitchGuideReviveTrait" ]);
//# sourceMappingURL=index.js.map
