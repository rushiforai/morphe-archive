window.__require = function t(e, r, o) {
function a(n, c) {
if (!r[n]) {
if (!e[n]) {
var p = n.split("/");
p = p[p.length - 1];
if (!e[p]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(p, !0);
if (i) return i(p, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = p;
}
var u = r[n] = {
exports: {}
};
e[n][0].call(u.exports, function(t) {
return a(e[n][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[n].exports;
}
for (var i = "function" == typeof __require && __require, n = 0; n < o.length; n++) a(o[n]);
return a;
}({
CTRefactorAlgorithmStrategyIOSNameInfoTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "fde49qJeRZFA5vGvjRLOM/O", "CTRefactorAlgorithmStrategyIOSNameInfoTrait");
var o, a = this && this.__extends || (o = function(t, e) {
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
var a, i = arguments.length, n = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (a = t[c]) && (n = (i < 3 ? a(n) : i > 3 ? a(e, r, n) : a(e, r)) || n);
return i > 3 && n && Object.defineProperty(e, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorAlgorithmStrategyIOSNameInfoTrait = void 0;
var n = function(t) {
a(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
_algorithmNameMappings: []
};
};
e.prototype.onAlgorithmStrategyRoundInit = function() {
this.clearAllMappings();
};
e.prototype.onAlgorithmStrategySDKComplete = function(t, e) {
this.updateAlgorithmIOSExpectedId(e.algorithmId);
if (t) {
this.updateAlgorithmIOSSuccessExpectedId(e.algorithmId);
this.updateAlgorithmActualIOSName(e.algorithmId);
}
};
e.prototype.addAlgorithmNameMapping = function(t, e, r, o, a) {
var i = {
algorithmId: t,
traitName: e,
expectedId: r,
expected_success_Id: a,
actualName: o || ""
};
this.state._algorithmNameMappings.push(i);
};
e.prototype.findMappingByAlgorithmId = function(t, e) {
return this.state._algorithmNameMappings.find(function(r) {
if ("number" == typeof r.algorithmId && r.algorithmId === t) {
var o = r[e];
return "number" == typeof o ? o >= 0 : "string" == typeof o ? "" !== o.trim() : !!o;
}
return !1;
}) || null;
};
e.prototype.clearAllMappings = function() {
this.state._algorithmNameMappings = [];
};
e.prototype.updateAlgorithmIOSExpectedId = function(t) {
var e = this.findMappingByAlgorithmId(t, "expectedId");
if (null == e ? void 0 : e.expectedId) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(e.expectedId, this);
}
};
e.prototype.updateAlgorithmIOSSuccessExpectedId = function(t) {
var e = this.findMappingByAlgorithmId(t, "expected_success_Id");
if (null == e ? void 0 : e.expected_success_Id) {
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(hs.OFFER_TYPE_BASE.NONE, this);
as.AlgorithmStrategyAlgoExpectedIdPatch.patch(e.expected_success_Id, this);
}
};
e.prototype.updateAlgorithmActualIOSName = function(t) {
var e = this.findMappingByAlgorithmId(t, "actualName");
if (null == e ? void 0 : e.actualName) {
var r = e.actualName.split(",");
as.AlgorithmStrategyAlgoActualNamePatch.patch(r, this);
storage.setItem("classAlgoActualName", r);
}
};
return i([ classId("CTRefactorAlgorithmStrategyIOSNameInfoTrait") ], e);
}(Trait);
r.CTRefactorAlgorithmStrategyIOSNameInfoTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorAlgorithmStrategyIOSNameInfoTrait" ]);
//# sourceMappingURL=index.js.map
