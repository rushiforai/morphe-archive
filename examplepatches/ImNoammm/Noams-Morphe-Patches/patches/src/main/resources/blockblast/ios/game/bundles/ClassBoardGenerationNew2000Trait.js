window.__require = function r(e, t, o) {
function n(i, s) {
if (!t[i]) {
if (!e[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!e[l]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var c = t[i] = {
exports: {}
};
e[i][0].call(c.exports, function(r) {
return n(e[i][1][r] || r);
}, c, c.exports, r, e, t, o);
}
return t[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
ClassBoardGenerationNew2000Trait: [ function(r, e, t) {
"use strict";
cc._RF.push(e, "ff4c2w1yPlFcZT0os7fHYlb", "ClassBoardGenerationNew2000Trait");
var o, n = this && this.__extends || (o = function(r, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(r, e) {
r.__proto__ = e;
} || function(r, e) {
for (var t in e) Object.prototype.hasOwnProperty.call(e, t) && (r[t] = e[t]);
})(r, e);
}, function(r, e) {
o(r, e);
function t() {
this.constructor = r;
}
r.prototype = null === e ? Object.create(e) : (t.prototype = e.prototype, new t());
}), a = this && this.__decorate || function(r, e, t, o) {
var n, a = arguments.length, i = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(r, e, t, o); else for (var s = r.length - 1; s >= 0; s--) (n = r[s]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, t, i) : n(e, t)) || i);
return a > 3 && i && Object.defineProperty(e, t, i), i;
}, i = this && this.__awaiter || function(r, e, t, o) {
return new (t || (t = Promise))(function(n, a) {
function i(r) {
try {
l(o.next(r));
} catch (r) {
a(r);
}
}
function s(r) {
try {
l(o.throw(r));
} catch (r) {
a(r);
}
}
function l(r) {
r.done ? n(r.value) : (e = r.value, e instanceof t ? e : new t(function(r) {
r(e);
})).then(i, s);
var e;
}
l((o = o.apply(r, e || [])).next());
});
}, s = this && this.__generator || function(r, e) {
var t, o, n, a, i = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return a = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function s(r) {
return function(e) {
return l([ r, e ]);
};
}
function l(a) {
if (t) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (t = 1, o && (n = 2 & a[0] ? o.return : a[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, a[1])).done) return n;
(o = 0, n) && (a = [ 2 & a[0], n.value ]);
switch (a[0]) {
case 0:
case 1:
n = a;
break;

case 4:
i.label++;
return {
value: a[1],
done: !1
};

case 5:
i.label++;
o = a[1];
a = [ 0 ];
continue;

case 7:
a = i.ops.pop();
i.trys.pop();
continue;

default:
if (!(n = i.trys, n = n.length > 0 && n[n.length - 1]) && (6 === a[0] || 2 === a[0])) {
i = 0;
continue;
}
if (3 === a[0] && (!n || a[1] > n[0] && a[1] < n[3])) {
i.label = a[1];
break;
}
if (6 === a[0] && i.label < n[1]) {
i.label = n[1];
n = a;
break;
}
if (n && i.label < n[2]) {
i.label = n[2];
i.ops.push(a);
break;
}
n[2] && i.ops.pop();
i.trys.pop();
continue;
}
a = e.call(r, i);
} catch (r) {
a = [ 6, r ];
o = 0;
} finally {
t = n = 0;
}
if (5 & a[0]) throw a[1];
return {
value: a[0] ? a[1] : void 0,
done: !0
};
}
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.ClassBoardGenerationNew2000Trait = void 0;
var l = hs.storageProperty, u = function(r) {
n(e, r);
function e() {
var e = null !== r && r.apply(this, arguments) || this;
e.nextBoard = [];
e.lastInitialBoard = [];
e.requestFailed = !1;
e.serverBoardString = "";
e.currentConfigId = 0;
return e;
}
t = e;
e.isOffline = function() {
return cc.sys.isBrowser ? !navigator.onLine : cc.sys.getNetworkType() === cc.sys.NetworkType.NONE;
};
e.prototype.printBoard = function() {};
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "ClassGameOver_GameEnd_Proxy",
methodName: "onGameEnd"
}, {
className: "ClassGameDataClear_Disk_Proxy",
methodName: "resetClassScore"
} ];
};
e.prototype.isValidBoard = function(r) {
if (!Array.isArray(r) || 8 !== r.length) return !1;
for (var e = 0; e < 8; e++) {
var t = r[e];
if (!Array.isArray(t) || 8 !== t.length) return !1;
for (var o = 0; o < 8; o++) {
var n = t[o];
if ("number" != typeof n || 0 !== n && 1 !== n) return !1;
}
}
return !0;
};
e.prototype.emptyBoard = function() {
for (var r = [], e = 0; e < 8; e++) r.push([ -1, -1, -1, -1, -1, -1, -1, -1 ]);
return r;
};
e.prototype.isPureColorRound = function() {
var r = hs.storage.getItem("classSolidColor", 0);
return !!r && r > 0;
};
e.prototype.buildColorPool = function(r) {
if (Array.isArray(r) && r.length > 0) return r;
for (var e = [ 1, 2, 3, 4, 5, 6, 7 ], t = 2 + Math.floor(3 * Math.random()), o = []; o.length < t && e.length > 0; ) {
var n = Math.floor(Math.random() * e.length), a = e[n];
o.push(a);
e.splice(n, 1);
}
return o;
};
e.prototype.recolorBoard = function(r, e) {
for (var t = 0; t < r.length; t++) for (var o = r[t], n = 0; n < o.length; n++) {
var a = o[n];
0 === a ? o[n] = -1 : 1 === a && (o[n] = e[Math.floor(Math.random() * e.length)]);
}
};
e.prototype.convertToPureColor = function(r) {
var e = hs.storage.getItem("classSolidColor", 0);
if (e && !(e <= 0)) for (var t = 0; t < r.length; t++) for (var o = r[t], n = 0; n < o.length; n++) {
var a = o[n];
0 === a ? o[n] = -1 : 1 === a && (o[n] = e);
}
};
e.prototype.chooseReqType = function() {
var r = this.props;
return r && "string" == typeof r.req_type ? r.req_type : "new_2000_board_clean";
};
e.prototype.requestNextBoard = function() {
var r = this, e = hs.traitServerRequestInfo && "string" == typeof hs.traitServerRequestInfo.uid ? hs.traitServerRequestInfo.uid : "", o = this.chooseReqType(), n = {
key: e,
req_type: o
};
if (t.isOffline()) {
this.requestFailed = !0;
this.nextBoard = this.emptyBoard();
this.serverBoardString = "";
} else hs.HUCB.requestBoardInit("https://block-ucb.afafb.com/infer/v1/new_2000_board_20251017", n).then(function(e) {
var t, n = null, a = null === (t = null == e ? void 0 : e[o]) || void 0 === t ? void 0 : t.data;
r.currentConfigId = "number" == typeof (null == a ? void 0 : a.id) ? a.id : 0;
var i = "string" == typeof (null == a ? void 0 : a.board) ? a.board : "";
if (i) try {
n = JSON.parse(i);
r.serverBoardString = i;
} catch (e) {
n = null;
r.serverBoardString = "";
}
if (r.isValidBoard(n)) {
r.nextBoard = n;
r.requestFailed = !1;
} else {
r.nextBoard = [];
r.requestFailed = !1;
r.serverBoardString = "";
}
}).catch(function() {
r.requestFailed = !0;
r.nextBoard = r.emptyBoard();
r.serverBoardString = "";
});
};
e.prototype.onActive = function(r) {
return i(this, void 0, void 0, function() {
return s(this, function() {
hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(r) && this.requestNextBoard();
hs.tp.isClassDefaultBoard_ProxyProduceDefaultBoard(r) && this.handleProduceDefaultBoard(r);
hs.tp.isClassGameDataClear_Disk_ProxyResetClassScore(r) && this.clearDotData();
return [ 2 ];
});
});
};
e.prototype.clearDotData = function() {
this.serverBoardString = "";
this.currentConfigId = 0;
};
e.prototype.handleProduceDefaultBoard = function(r) {
var e = null;
this.requestFailed ? e = this.emptyBoard() : this.isValidBoard(this.nextBoard) && (e = this.nextBoard);
if (e) {
if (this.isPureColorRound()) try {
this.convertToPureColor(e);
} catch (r) {} else try {
var t = hs.storage.getItem("classUseInitialColor", []), o = this.buildColorPool(t);
this.recolorBoard(e, o);
hs.storage.setItem("classUseInitialColor", o);
hs.classColorProducerGameInfo && hs.classColorProducerGameInfo.setColorList(o);
} catch (r) {}
this.lastInitialBoard = e;
r.args[0] = e;
r.returnState = !0;
} else r.returnState = !1;
};
var t;
a([ l({
key: "classNew2000BoardString"
}) ], e.prototype, "serverBoardString", void 0);
a([ l({
key: "classNew2000BoardId"
}) ], e.prototype, "currentConfigId", void 0);
return t = a([ classId("ClassBoardGenerationNew2000Trait") ], e);
}(Trait);
t.ClassBoardGenerationNew2000Trait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "ClassBoardGenerationNew2000Trait" ]);
//# sourceMappingURL=index.js.map
