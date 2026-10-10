window.__require = function t(e, r, n) {
function o(l, a) {
if (!r[l]) {
if (!e[l]) {
var c = l.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = c;
}
var s = r[l] = {
exports: {}
};
e[l][0].call(s.exports, function(t) {
return o(e[l][1][t] || t);
}, s, s.exports, t, e, r, n);
}
return r[l].exports;
}
for (var i = "function" == typeof __require && __require, l = 0; l < n.length; l++) o(n[l]);
return o;
}({
CTRefactorFallBackTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "9d0afNExYxMBobXvNGOl9wm", "CTRefactorFallBackTrait");
var n, o = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
n(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, n) {
var o, i = arguments.length, l = i < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, r, n); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (l = (i < 3 ? o(l) : i > 3 ? o(e, r, l) : o(e, r)) || l);
return i > 3 && l && Object.defineProperty(e, r, l), l;
}, l = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(o, i) {
function l(t) {
try {
c(n.next(t));
} catch (t) {
i(t);
}
}
function a(t) {
try {
c(n.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? o(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(l, a);
var e;
}
c((n = n.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var r, n, o, i, l = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return i = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;l; ) try {
if (r = 1, n && (o = 2 & i[0] ? n.return : i[0] ? n.throw || ((o = n.return) && o.call(n), 
0) : n.next) && !(o = o.call(n, i[1])).done) return o;
(n = 0, o) && (i = [ 2 & i[0], o.value ]);
switch (i[0]) {
case 0:
case 1:
o = i;
break;

case 4:
l.label++;
return {
value: i[1],
done: !1
};

case 5:
l.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = l.ops.pop();
l.trys.pop();
continue;

default:
if (!(o = l.trys, o = o.length > 0 && o[o.length - 1]) && (6 === i[0] || 2 === i[0])) {
l = 0;
continue;
}
if (3 === i[0] && (!o || i[1] > o[0] && i[1] < o[3])) {
l.label = i[1];
break;
}
if (6 === i[0] && l.label < o[1]) {
l.label = o[1];
o = i;
break;
}
if (o && l.label < o[2]) {
l.label = o[2];
l.ops.push(i);
break;
}
o[2] && l.ops.pop();
l.trys.pop();
continue;
}
i = e.call(t, l);
} catch (t) {
i = [ 6, t ];
n = 0;
} finally {
r = o = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFallBackTrait = void 0;
var c = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.isValidBlockList = function(t) {
return Array.isArray(t) && 3 === t.length && t.every(function(t) {
return null != t && t > 0;
});
};
e.prototype.isTravelFillBlankExpected = function() {
return hs.algorithmName.algoExpectedId === hs.OFFER_TYPE.TRAVEL_TIAN_KONG_XIAO_CHU;
};
e.prototype.onAlgorithmStrategyPostprocessComplete = function(t) {
var e, r, n, o, i;
return l(this, void 0, Promise, function() {
var l, c;
return a(this, function(a) {
switch (a.label) {
case 0:
if (this.isValidBlockList(null === (e = null == t ? void 0 : t.sdk) || void 0 === e ? void 0 : e.blockIds)) return [ 2 ];
l = this.isTravelFillBlankExpected() ? hs.OFFER_TYPE.SUI_JI_WU_SI : hs.OFFER_TYPE.SUI_JI;
c = {
algorithmId: l,
source: null !== (n = null === (r = null == t ? void 0 : t.sdk) || void 0 === r ? void 0 : r.source) && void 0 !== n ? n : hs.ClassAlgorithmSourceType.AlgoTrait,
traitSource: this.traitName,
algorithmListSource: null !== (i = null === (o = null == t ? void 0 : t.sdk) || void 0 === o ? void 0 : o.algorithmListSource) && void 0 !== i ? i : "fallback"
};
return [ 4, as.AlgorithmStrategyAlgoItemSdkRequestPatch.patch(c, [], this) ];

case 1:
a.sent();
return [ 2 ];
}
});
});
};
return i([ classId("CTRefactorFallBackTrait") ], e);
}(Trait);
r.CTRefactorFallBackTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFallBackTrait" ]);
//# sourceMappingURL=index.js.map
