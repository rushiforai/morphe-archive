window.__require = function e(t, r, o) {
function i(s, a) {
if (!r[s]) {
if (!t[s]) {
var c = s.split("/");
c = c[c.length - 1];
if (!t[c]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = c;
}
var p = r[s] = {
exports: {}
};
t[s][0].call(p.exports, function(e) {
return i(t[s][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
RestoreChapterProgressTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "a4d34cGDx5OkLNdK3lJbLmP", "RestoreChapterProgressTrait");
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
}), n = this && this.__decorate || function(e, t, r, o) {
var i, n = arguments.length, s = n < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, r, o); else for (var a = e.length - 1; a >= 0; a--) (i = e[a]) && (s = (n < 3 ? i(s) : n > 3 ? i(t, r, s) : i(t, r)) || s);
return n > 3 && s && Object.defineProperty(t, r, s), s;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.RestoreChapterProgressTrait = void 0;
var s = function(e) {
i(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.onActive = function() {};
t.prototype.executeRestore = function() {
var e = TRAIT("RestoreDataProviderTrait");
if ((null == e ? void 0 : e.active) && e.isNeedRestore() && !e.isRestored(this.traitName)) {
var t = e.getRestoreData();
if (t) {
var r = null == t ? void 0 : t.chapterNum;
if (null != r) if (hs.storage.getItem("chapterNum", 0)) e.markRestored(this.traitName, !1); else {
hs.storage.setItem("chapterNum", r);
e.markRestored(this.traitName, !0);
} else e.markRestored(this.traitName, !1);
} else e.markRestored(this.traitName, !1);
}
};
return n([ classId("RestoreChapterProgressTrait") ], t);
}(Trait);
r.RestoreChapterProgressTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "RestoreChapterProgressTrait" ]);
//# sourceMappingURL=index.js.map
