window.__require = function t(r, e, n) {
function i(a, c) {
if (!e[a]) {
if (!r[a]) {
var u = a.split("/");
u = u[u.length - 1];
if (!r[u]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(u, !0);
if (o) return o(u, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = u;
}
var s = e[a] = {
exports: {}
};
r[a][0].call(s.exports, function(t) {
return i(r[a][1][t] || t);
}, s, s.exports, t, r, e, n);
}
return e[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < n.length; a++) i(n[a]);
return i;
}({
AdSubScribeFixTrait: [ function(t, r, e) {
"use strict";
cc._RF.push(r, "a66a6mjP/9P8oQf8lXxxNmz", "AdSubScribeFixTrait");
var n, i = this && this.__extends || (n = function(t, r) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, r) {
t.__proto__ = r;
} || function(t, r) {
for (var e in r) Object.prototype.hasOwnProperty.call(r, e) && (t[e] = r[e]);
})(t, r);
}, function(t, r) {
n(t, r);
function e() {
this.constructor = t;
}
t.prototype = null === r ? Object.create(r) : (e.prototype = r.prototype, new e());
}), o = this && this.__decorate || function(t, r, e, n) {
var i, o = arguments.length, a = o < 3 ? r : null === n ? n = Object.getOwnPropertyDescriptor(r, e) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, r, e, n); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (a = (o < 3 ? i(a) : o > 3 ? i(r, e, a) : i(r, e)) || a);
return o > 3 && a && Object.defineProperty(r, e, a), a;
}, a = this && this.__awaiter || function(t, r, e, n) {
return new (e || (e = Promise))(function(i, o) {
function a(t) {
try {
u(n.next(t));
} catch (t) {
o(t);
}
}
function c(t) {
try {
u(n.throw(t));
} catch (t) {
o(t);
}
}
function u(t) {
t.done ? i(t.value) : (r = t.value, r instanceof e ? r : new e(function(t) {
t(r);
})).then(a, c);
var r;
}
u((n = n.apply(t, r || [])).next());
});
}, c = this && this.__generator || function(t, r) {
var e, n, i, o, a = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return o = {
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function c(t) {
return function(r) {
return u([ t, r ]);
};
}
function u(o) {
if (e) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (e = 1, n && (i = 2 & o[0] ? n.return : o[0] ? n.throw || ((i = n.return) && i.call(n), 
0) : n.next) && !(i = i.call(n, o[1])).done) return i;
(n = 0, i) && (o = [ 2 & o[0], i.value ]);
switch (o[0]) {
case 0:
case 1:
i = o;
break;

case 4:
a.label++;
return {
value: o[1],
done: !1
};

case 5:
a.label++;
n = o[1];
o = [ 0 ];
continue;

case 7:
o = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(i = a.trys, i = i.length > 0 && i[i.length - 1]) && (6 === o[0] || 2 === o[0])) {
a = 0;
continue;
}
if (3 === o[0] && (!i || o[1] > i[0] && o[1] < i[3])) {
a.label = o[1];
break;
}
if (6 === o[0] && a.label < i[1]) {
a.label = i[1];
i = o;
break;
}
if (i && a.label < i[2]) {
a.label = i[2];
a.ops.push(o);
break;
}
i[2] && a.ops.pop();
a.trys.pop();
continue;
}
o = r.call(t, a);
} catch (t) {
o = [ 6, t ];
n = 0;
} finally {
e = i = 0;
}
if (5 & o[0]) throw o[1];
return {
value: o[0] ? o[1] : void 0,
done: !0
};
}
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.AdSubScribeFixTrait = void 0;
var u = function(t) {
i(r, t);
function r() {
var r = null !== t && t.apply(this, arguments) || this;
r.barrierInitStart = null;
return r;
}
r.prototype.onCreate = function() {};
r.prototype.onActive = function(t) {
hs.tp.isIpaPreRemoveAdMainOnLoad(t) && (this.barrierInitStart || (this.barrierInitStart = new hs.TimeoutBarrier(3e3)));
hs.tp.isIpaPreRemoveAdMainInitPriceItem(t) && this.barrierInitStart && this.barrierInitStart.open();
if (hs.tp.isIpaPreRemoveAdMainRefreshProductInfo(t) && this.barrierInitStart && !this.barrierInitStart.isOpen) {
t.replace = !0;
this.waitInitPriceItem(t);
}
};
r.prototype.waitInitPriceItem = function(t) {
var r;
return a(this, void 0, void 0, function() {
return c(this, function(e) {
switch (e.label) {
case 0:
return this.barrierInitStart ? [ 4, this.barrierInitStart.wait() ] : [ 3, 2 ];

case 1:
e.sent();
null === (r = t.originalCaller) || void 0 === r || r.call(t);
e.label = 2;

case 2:
return [ 2 ];
}
});
});
};
return o([ classId("AdSubScribeFixTrait") ], r);
}(Trait);
e.AdSubScribeFixTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "AdSubScribeFixTrait" ]);
//# sourceMappingURL=index.js.map
