window.__require = function t(r, e, o) {
function i(a, l) {
if (!e[a]) {
if (!r[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!r[c]) {
var s = "function" == typeof __require && __require;
if (!l && s) return s(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var u = e[a] = {
exports: {}
};
r[a][0].call(u.exports, function(t) {
return i(r[a][1][t] || t);
}, u, u.exports, t, r, e, o);
}
return e[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
EmptyPlateLimitSmallBlocksTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "b971eOQ+jJHS5H5VAUS9nAY", "EmptyPlateLimitSmallBlocksTrait");
var o, i = this && this.__extends || (o = function(t, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
o(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), n = this && this.__decorate || function(t, r, e, o) {
var i, n = arguments.length, a = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, e) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, o); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (a = (n < 3 ? i(a) : n > 3 ? i(r, e, a) : i(r, e)) || a);
return n > 3 && a && Object.defineProperty(r, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.EmptyPlateLimitSmallBlocksTrait = void 0;
var a = function(t) {
i(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.LIMIT_BLOCK_IDS = [ 1, 2, 3, 4, 5, 6 ];
return r;
}
r.prototype.onActive = function(t) {
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
if (hs.tp.isAlgorithmSDKTraitInfoGetLimitRandomSmall(t)) {
if (!hs.boardInfo.isNullBoard()) return;
if (1 !== hs.classGameInfo.roundNum) return;
t.args[3] = this.LIMIT_BLOCK_IDS;
t.returnState = !0;
}
if (hs.tp.isAlgorithmStrategyLogicProduceRandomId(t)) {
if (!hs.boardInfo.isNullBoard()) return;
if (1 !== hs.classGameInfo.roundNum) return;
t.args[2] = this.LIMIT_BLOCK_IDS;
t.returnState = !0;
}
}
};
return n([ classId("EmptyPlateLimitSmallBlocksTrait") ], r);
}(Trait);
e.EmptyPlateLimitSmallBlocksTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "EmptyPlateLimitSmallBlocksTrait" ]);
//# sourceMappingURL=index.js.map
