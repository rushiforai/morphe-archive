window.__require = function t(e, r, o) {
function i(s, a) {
if (!r[s]) {
if (!e[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!e[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var f = r[s] = {
exports: {}
};
e[s][0].call(f.exports, function(t) {
return i(e[s][1][t] || t);
}, f, f.exports, t, e, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
RestoreDirectEnterHomePageTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "fe374sknZlKIIKK41CL/+cw", "RestoreDirectEnterHomePageTrait");
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, s = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (s = (n < 3 ? i(s) : n > 3 ? i(e, r, s) : i(e, r)) || s);
return n > 3 && s && Object.defineProperty(e, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreDirectEnterHomePageTrait = void 0;
var s = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.isFirstLaunchEnter = void 0;
e.storageKey = "RestoreDirectEnterHomePageTrait_isFirstLaunchEnter";
return e;
}
e.prototype.onCreate = function() {
this.loadData();
};
e.prototype.loadData = function() {
this.isFirstLaunchEnter = hs.storage.getItem(this.storageKey, !0);
};
e.prototype.setData = function() {
hs.storage.setItem(this.storageKey, this.isFirstLaunchEnter);
};
e.prototype.onActive = function(t) {
if (hs.tp.isLaunchStartEnter(t)) {
if (!this.isFirstLaunchEnter) return;
this.isFirstLaunchEnter = !1;
this.setData();
this.executeRestore();
}
};
e.prototype.executeRestore = function() {
var t = TRAIT("RestoreDataProviderTrait");
if ((null == t ? void 0 : t.active) && t.isNeedRestore() && t.isDataReady() && !t.isRestored(this.traitName)) {
hs.storage.setItem("intoModeChoice", !0);
t.markRestored(this.traitName, !0);
}
};
return n([ classId("RestoreDirectEnterHomePageTrait") ], e);
}(Trait);
r.RestoreDirectEnterHomePageTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreDirectEnterHomePageTrait" ]);
//# sourceMappingURL=index.js.map
