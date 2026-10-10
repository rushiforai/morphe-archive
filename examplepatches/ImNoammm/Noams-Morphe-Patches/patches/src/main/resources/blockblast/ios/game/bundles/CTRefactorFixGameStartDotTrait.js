window.__require = function t(e, r, n) {
function o(i, c) {
if (!r[i]) {
if (!e[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!e[u]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var f = r[i] = {
exports: {}
};
e[i][0].call(f.exports, function(t) {
return o(e[i][1][t] || t);
}, f, f.exports, t, e, r, n);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < n.length; i++) o(n[i]);
return o;
}({
CTRefactorFixGameStartDotTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "f5f3d59KbpJh5yJLTbKI/sB", "CTRefactorFixGameStartDotTrait");
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
}), a = this && this.__decorate || function(t, e, r, n) {
var o, a = arguments.length, i = a < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, n); else for (var c = t.length - 1; c >= 0; c--) (o = t[c]) && (i = (a < 3 ? o(i) : a > 3 ? o(e, r, i) : o(e, r)) || i);
return a > 3 && i && Object.defineProperty(e, r, i), i;
}, i = this && this.__awaiter || function(t, e, r, n) {
return new (r || (r = Promise))(function(o, a) {
function i(t) {
try {
u(n.next(t));
} catch (t) {
a(t);
}
}
function c(t) {
try {
u(n.throw(t));
} catch (t) {
a(t);
}
}
function u(t) {
t.done ? o(t.value) : (e = t.value, e instanceof r ? e : new r(function(t) {
t(e);
})).then(i, c);
var e;
}
u((n = n.apply(t, e || [])).next());
});
}, c = this && this.__generator || function(t, e) {
var r, n, o, a, i = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return a = {
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function c(t) {
return function(e) {
return u([ t, e ]);
};
}
function u(a) {
if (r) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (r = 1, n && (o = 2 & a[0] ? n.return : a[0] ? n.throw || ((o = n.return) && o.call(n), 
0) : n.next) && !(o = o.call(n, a[1])).done) return o;
(n = 0, o) && (a = [ 2 & a[0], o.value ]);
switch (a[0]) {
case 0:
case 1:
o = a;
break;

case 4:
i.label++;
return {
value: a[1],
done: !1
};

case 5:
i.label++;
n = a[1];
a = [ 0 ];
continue;

case 7:
a = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(o = i.trys, o = o.length > 0 && o[o.length - 1]) && (6 === a[0] || 2 === a[0])) {
i = 0;
continue;
}
if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
i.label = a[1];
break;
}
if (6 === a[0] && i.label < o[1]) {
i.label = o[1];
o = a;
break;
}
if (o && i.label < o[2]) {
i.label = o[2];
i.ops.push(a);
break;
}
o[2] && i.ops.pop();
i.trys.pop();
continue;
}
a = e.call(t, i);
} catch (t) {
a = [ 6, t ];
n = 0;
} finally {
r = o = 0;
}
if (5 & a[0]) throw a[1];
return {
value: a[0] ? a[1] : void 0,
done: !0
};
}
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorFixGameStartDotTrait = void 0;
var u = function(t) {
o(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onAlgorithmStrategyPostprocessComplete = function() {
return i(this, void 0, Promise, function() {
return c(this, function() {
hs.gameInfo.gameMode === hs.GameMode.Class ? 1 == storage.getItem("classRoundNum", 0) && hs.EventManager.dispatchModuleEvent(new hs.E_ClassBlockOutStrategy_FirstRound()) : 1 === storage.getItem("chapterRoundNum", 0) && hs.EventManager.dispatchModuleEvent(new hs.E_AlgorithmStrategy_FirstRound());
return [ 2 ];
});
});
};
return a([ classId("CTRefactorFixGameStartDotTrait"), classMethodWatch() ], e);
}(Trait);
r.CTRefactorFixGameStartDotTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorFixGameStartDotTrait" ]);
//# sourceMappingURL=index.js.map
