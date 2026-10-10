window.__require = function t(e, r, o) {
function n(i, u) {
if (!r[i]) {
if (!e[i]) {
var p = i.split("/");
p = p[p.length - 1];
if (!e[p]) {
var a = "function" == typeof __require && __require;
if (!u && a) return a(p, !0);
if (c) return c(p, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = p;
}
var f = r[i] = {
exports: {}
};
e[i][0].call(f.exports, function(t) {
return n(e[i][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[i].exports;
}
for (var c = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
AccountModuleOpenTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "64f6aPzbg5Fpqhn19qFm7lz", "AccountModuleOpenTrait");
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
}), c = this && this.__decorate || function(t, e, r, o) {
var n, c = arguments.length, i = c < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, o); else for (var u = t.length - 1; u >= 0; u--) (n = t[u]) && (i = (c < 3 ? n(i) : c > 3 ? n(e, r, i) : n(e, r)) || i);
return c > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AccountModuleOpenTrait = void 0;
var i = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onCreate = function() {};
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "Account_Proxy",
methodName: "isModuleEnabled"
} ];
};
e.prototype.onActive = function(t) {
if (hs.tp.isAccount_ProxyIsModuleEnabled(t)) {
if (!hs.AccountNativeBridge.isVersionSupported()) {
t.returnValue = !1;
t.replace = !0;
return;
}
t.returnValue = this.active;
t.replace = !0;
}
};
return c([ classId("AccountModuleOpenTrait") ], e);
}(Trait);
r.AccountModuleOpenTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "AccountModuleOpenTrait" ]);
//# sourceMappingURL=index.js.map
