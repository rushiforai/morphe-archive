window.__require = function t(e, r, o) {
function n(c, a) {
if (!r[c]) {
if (!e[c]) {
var f = c.split("/");
f = f[f.length - 1];
if (!e[f]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(f, !0);
if (i) return i(f, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = f;
}
var u = r[c] = {
exports: {}
};
e[c][0].call(u.exports, function(t) {
return n(e[c][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
CTRefactorCollectionSwitchTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "e69ccNP2QxDSruoBH/R59Ss", "CTRefactorCollectionSwitchTrait");
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
var n, i = arguments.length, c = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorCollectionSwitchTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategyCollectionAdjust = function() {
var t, e;
if (1 == (null === (e = null === (t = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum]) || void 0 === t ? void 0 : t.Condition) || void 0 === e ? void 0 : e.Way)) {
hs.collectionProducerGameInfo.setCollectionTrait(!1);
return {
data: []
};
}
storage.setItem("chapterCollectionLists", []);
return {
data: [],
returnState: !0
};
};
return i([ classId("CTRefactorCollectionSwitchTrait") ], e);
}(Trait);
r.CTRefactorCollectionSwitchTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorCollectionSwitchTrait" ]);
//# sourceMappingURL=index.js.map
