window.__require = function t(e, r, o) {
function i(a, s) {
if (!r[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var f = "function" == typeof __require && __require;
if (!s && f) return f(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
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
RestoreLoginDaysTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "69f68JI7IZI2KzX4tOwSfk9", "RestoreLoginDaysTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreLoginDaysTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function() {};
e.prototype.executeRestore = function() {
var t = TRAIT("RestoreDataProviderTrait");
if ((null == t ? void 0 : t.active) && t.isNeedRestore() && !t.isRestored(this.traitName)) {
var e = t.getRestoreData();
if (e && e.login_days) {
var r = e.login_days;
if (r <= 0) t.markRestored(this.traitName, !1); else {
r++;
var o = hs.param230012Info.paramData;
if (o.days > r) t.markRestored(this.traitName, !1); else {
hs.param230012Info.updateParamData(n(n({}, o), {
days: r
}));
t.markRestored(this.traitName, !0);
}
}
} else t.markRestored(this.traitName, !1);
}
};
return a([ classId("RestoreLoginDaysTrait") ], e);
}(Trait);
r.RestoreLoginDaysTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreLoginDaysTrait" ]);
//# sourceMappingURL=index.js.map
