window.__require = function e(t, o, n) {
function r(u, a) {
if (!o[u]) {
if (!t[u]) {
var c = u.split("/");
c = c[c.length - 1];
if (!t[c]) {
var s = "function" == typeof __require && __require;
if (!a && s) return s(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = c;
}
var l = o[u] = {
exports: {}
};
t[u][0].call(l.exports, function(e) {
return r(t[u][1][e] || e);
}, l, l.exports, e, t, o, n);
}
return o[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < n.length; u++) r(n[u]);
return r;
}({
ComboAddRemoveNum_fix2Trait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "22c807kPplPDbxU2c33KGxW", "ComboAddRemoveNum_fix2Trait");
var n, r = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
n(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), i = this && this.__decorate || function(e, t, o, n) {
var r, i = arguments.length, u = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(e, t, o, n); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (u = (i < 3 ? r(u) : i > 3 ? r(t, o, u) : r(t, o)) || u);
return i > 3 && u && Object.defineProperty(t, o, u), u;
}, u = this && this.__awaiter || function(e, t, o, n) {
return new (o || (o = Promise))(function(r, i) {
function u(e) {
try {
c(n.next(e));
} catch (e) {
i(e);
}
}
function a(e) {
try {
c(n.throw(e));
} catch (e) {
i(e);
}
}
function c(e) {
e.done ? r(e.value) : (t = e.value, t instanceof o ? t : new o(function(e) {
e(t);
})).then(u, a);
var t;
}
c((n = n.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var o, n, r, i, u = {
label: 0,
sent: function() {
if (1 & r[0]) throw r[1];
return r[1];
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
function a(e) {
return function(t) {
return c([ e, t ]);
};
}
function c(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;u; ) try {
if (o = 1, n && (r = 2 & i[0] ? n.return : i[0] ? n.throw || ((r = n.return) && r.call(n), 
0) : n.next) && !(r = r.call(n, i[1])).done) return r;
(n = 0, r) && (i = [ 2 & i[0], r.value ]);
switch (i[0]) {
case 0:
case 1:
r = i;
break;

case 4:
u.label++;
return {
value: i[1],
done: !1
};

case 5:
u.label++;
n = i[1];
i = [ 0 ];
continue;

case 7:
i = u.ops.pop();
u.trys.pop();
continue;

default:
if (!(r = u.trys, r = r.length > 0 && r[r.length - 1]) && (6 === i[0] || 2 === i[0])) {
u = 0;
continue;
}
if (3 === i[0] && (!r || i[1] > r[0] && i[1] < r[3])) {
u.label = i[1];
break;
}
if (6 === i[0] && u.label < r[1]) {
u.label = r[1];
r = i;
break;
}
if (r && u.label < r[2]) {
u.label = r[2];
u.ops.push(i);
break;
}
r[2] && u.ops.pop();
u.trys.pop();
continue;
}
i = t.call(e, u);
} catch (e) {
i = [ 6, e ];
n = 0;
} finally {
o = r = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.ComboAddRemoveNum_fix2Trait = void 0;
var c = function(e) {
r(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.data = function() {
return {
preUnEliminateTimes: 0
};
};
t.prototype.onActive = function(e) {
return u(this, void 0, void 0, function() {
var t, o, n, r, i, u, c, s, l;
return a(this, function() {
if (hs.gameInfo.gameMode !== hs.GameMode.Class) return [ 2 ];
hs.tp.isBlocksProducerTouchComputeContinuousEliminateTimes(e) && (null == (t = TRAIT("IsOpenComboContinuousTrait")) ? void 0 : t.active) && t.setState({
isStorageOnClear: !0
});
if (hs.tp.isBlocksProducerTouchPrecessUnEliminateTimes(e)) {
o = e.args[0].unEliminateTimes;
this.setState({
preUnEliminateTimes: o
});
}
if (hs.tp.isBlocksProducerTouchTouchFollowUpEliminateTimes(e)) {
n = storage.getItem("isFinishedGuide", !1);
r = e.args[0];
i = r.eliminateCount, u = r.comboAllowNoContinuousTimes;
c = this.state.preUnEliminateTimes;
s = c >= u || !n;
if ((null == (l = TRAIT("ClassicComboProtectAfterAllCleanTrait")) ? void 0 : l.active) && !storage.getItem("classicComboProtectAfterAllClean", !1) && s) return [ 2 ];
r.continuousEliminateTimes += Math.max(0, i);
}
return [ 2 ];
});
});
};
return i([ classId("ComboAddRemoveNum_fix2Trait") ], t);
}(Trait);
o.ComboAddRemoveNum_fix2Trait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "ComboAddRemoveNum_fix2Trait" ]);
//# sourceMappingURL=index.js.map
