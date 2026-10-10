window.__require = function t(e, r, o) {
function i(a, c) {
if (!r[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var u = r[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return i(e[a][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
RestoreBlockClickOrderDataTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "b9375ogmfVEradgxXEpiCtu", "RestoreBlockClickOrderDataTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), n = this && this.__assign || function() {
return (n = Object.assign || function(t) {
for (var e, r = 1, o = arguments.length; r < o; r++) {
e = arguments[r];
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
}
return t;
}).apply(this, arguments);
}, a = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreBlockClickOrderDataTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onCreate = function() {};
e.prototype.onActive = function() {};
e.prototype.executeRestore = function() {
var t, e = TRAIT("RestoreDataProviderTrait");
if ((null == e ? void 0 : e.active) && e.isNeedRestore() && !e.isRestored(this.traitName)) if (null === (t = TRAIT("ChangeBlockPosTrait")) || void 0 === t ? void 0 : t.active) {
var r = e.getRestoreData();
if (r) {
var o = null == r ? void 0 : r.behavior;
if (o && 0 !== o.length) {
var i = o.map(function(t) {
return t - 1;
}), a = hs.storage.getItem("chapterBlockClickSortRecord", {
records: [],
sum: [],
sortPosSum: []
}), c = n(n({}, a), {
sum: i
});
hs.storage.setItem("chapterBlockClickSortRecord", c);
e.markRestored(this.traitName, !0);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
};
return a([ classId("RestoreBlockClickOrderDataTrait") ], e);
}(Trait);
r.RestoreBlockClickOrderDataTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreBlockClickOrderDataTrait" ]);
//# sourceMappingURL=index.js.map
