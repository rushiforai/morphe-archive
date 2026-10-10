window.__require = function t(e, o, r) {
function n(i, s) {
if (!o[i]) {
if (!e[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!e[u]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(u, !0);
if (a) return a(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var m = o[i] = {
exports: {}
};
e[i][0].call(m.exports, function(t) {
return n(e[i][1][t] || t);
}, m, m.exports, t, e, o, r);
}
return o[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < r.length; i++) n(r[i]);
return n;
}({
CommonGameListUI2PixelArtExTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "d04521YRmBLg7231lFeuJEw", "CommonGameListUI2PixelArtExTrait");
var r, n, a, i, s = this && this.__extends || (r = function(t, e) {
return (r = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
r(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), u = this && this.__decorate || function(t, e, o, r) {
var n, a = arguments.length, i = a < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (i = (a < 3 ? n(i) : a > 3 ? n(e, o, i) : n(e, o)) || i);
return a > 3 && i && Object.defineProperty(e, o, i), i;
}, l = this && this.__awaiter || function(t, e, o, r) {
return new (o || (o = Promise))(function(n, a) {
function i(t) {
try {
u(r.next(t));
} catch (t) {
a(t);
}
}
function s(t) {
try {
u(r.throw(t));
} catch (t) {
a(t);
}
}
function u(t) {
t.done ? n(t.value) : (e = t.value, e instanceof o ? e : new o(function(t) {
t(e);
})).then(i, s);
var e;
}
u((r = r.apply(t, e || [])).next());
});
}, m = this && this.__generator || function(t, e) {
var o, r, n, a, i = {
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
function s(t) {
return function(e) {
return u([ t, e ]);
};
}
function u(a) {
if (o) throw new TypeError("Generator is already executing.");
for (;i; ) try {
if (o = 1, r && (n = 2 & a[0] ? r.return : a[0] ? r.throw || ((n = r.return) && n.call(r), 
0) : r.next) && !(n = n.call(r, a[1])).done) return n;
(r = 0, n) && (a = [ 2 & a[0], n.value ]);
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
r = a[1];
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
a = e.call(t, i);
} catch (t) {
a = [ 6, t ];
r = 0;
} finally {
o = n = 0;
}
if (5 & a[0]) throw a[1];
return {
value: a[0] ? a[1] : void 0,
done: !0
};
}
}, c = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, a = o.call(t), i = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = a.next()).done; ) i.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (o = a.return) && o.call(a);
} finally {
if (n) throw n.error;
}
}
return i;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListUI2PixelArtExTrait = o.DownloadState = void 0;
(function(t) {
t[t.LEGACY = 1] = "LEGACY";
t[t.SAND = 2] = "SAND";
t[t.ATOM = 3] = "ATOM";
t[t.CHAPTER = 5] = "CHAPTER";
})(n || (n = {}));
(function(t) {
t[t.DEFAULT = 1] = "DEFAULT";
t[t.CLICK = 2] = "CLICK";
})(a || (a = {}));
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.PENDING = 1] = "PENDING";
t[t.SUCCESS = 2] = "SUCCESS";
t[t.FAIL = 3] = "FAIL";
})(i = o.DownloadState || (o.DownloadState = {}));
var f = function(t) {
s(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.gameName = "G15";
e.gameType = n.ATOM;
e.trigger = a.DEFAULT;
e.defaultAtomWorldId = "G15_FBase_WorldAtom";
e.defaultAtomDownloadId = "G15_FDownload_WorldAtom";
e.trackSubtype = "5";
e.gameIconRect = null;
e.gameIconSquare = null;
return e;
}
Object.defineProperty(e.prototype, "atomWorldId", {
get: function() {
var t;
return null !== (t = this.props.atomWorldId) && void 0 !== t ? t : this.defaultAtomWorldId;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "atomDownloadId", {
get: function() {
var t;
return null !== (t = this.props.atomDownloadId) && void 0 !== t ? t : this.defaultAtomDownloadId;
},
enumerable: !1,
configurable: !0
});
e.prototype.onCreate = function() {
this.preloadGameIcons();
};
e.prototype.preloadGameIcons = function() {
return l(this, void 0, Promise, function() {
var t, e, o;
return m(this, function(r) {
switch (r.label) {
case 0:
r.trys.push([ 0, 2, , 3 ]);
return [ 4, Promise.all([ this.loadGameIcon("textures/G15_rect"), this.loadGameIcon("textures/G15_square") ]) ];

case 1:
t = c.apply(void 0, [ r.sent(), 2 ]), e = t[0], o = t[1];
this.gameIconRect = e;
this.gameIconSquare = o;
this.ensureGameInfoInStorage();
this.refreshCommonGameListOutput();
return [ 3, 3 ];

case 2:
r.sent();
return [ 3, 3 ];

case 3:
return [ 2 ];
}
});
});
};
e.prototype.getInitialGameTimestamp = function() {
return Date.now();
};
e.prototype.refreshCommonGameListOutput = function() {
var t = TRAIT("CommonGameListTrait");
(null == t ? void 0 : t.active) && t.setState({});
};
e.prototype.syncAtomConfig = function(t) {
var e, o, r = this.atomWorldId, n = this.atomDownloadId;
if ((null === (e = t.atom) || void 0 === e ? void 0 : e.worldId) === r && (null === (o = t.atom) || void 0 === o ? void 0 : o.downloadId) === n) return !1;
t.atom = {
worldId: r,
downloadId: n
};
return !0;
};
Object.defineProperty(e.prototype, "localGameInfo", {
get: function() {
return hs.storage.getItem(this.traitName, null);
},
enumerable: !1,
configurable: !0
});
e.prototype.ensureGameInfoInStorage = function() {
var t = this, e = TRAIT("CommonGameListTrait");
if (null == e ? void 0 : e.active) {
var o = hs.storage.getItem("CommonGameListGames_InfoList", []), r = o.find(function(e) {
return e.gameName === t.gameName;
}), n = !!r;
r || (r = this.localGameInfo);
if (!r) {
var i = this.trigger == a.CLICK, s = !0 === this.props.played ? .1 : 0, u = !0 === this.props.played ? Date.now() : 0;
r = {
gameName: this.gameName,
duringTime: this.props.duringTime,
played: this.props.played,
timestamp: this.getInitialGameTimestamp(o),
type: this.gameType,
trigger: this.trigger,
download: 0,
clickCount: s,
lastClickTime: u,
atom: {
worldId: this.atomWorldId,
downloadId: this.atomDownloadId
},
isManualDownload: i,
sort: this.props.sort
};
}
r.sort = this.props.sort;
this.syncAtomConfig(r);
if (!n) {
this.fixGameInfo(r);
o.push(r);
}
hs.storage.setItem("CommonGameListGames_InfoList", o);
}
};
e.prototype.fixGameInfo = function(t) {
var e = TRAIT("CommonGameListTrait");
if (null == e ? void 0 : e.active) {
t.download = i.NONE;
e.checkGameDownloadState(t);
}
};
e.prototype.loadGameIcon = function(t) {
return hs.ResLoader.asyncLoadByBundle(this.traitName, t, cc.SpriteFrame);
};
e.prototype.isValidSpriteFrame = function(t) {
return !!t && cc.isValid(t);
};
e.prototype.onActive = function(t) {
var e = this;
if (hs.tp.isCommonGameSurpriseMiniGameTraitChangeMiniGameIcon(t)) {
if (!this.isValidSpriteFrame(this.gameIconSquare)) return;
var o = t.args[0];
o && !o.has(this.gameName) && o.set(this.gameName, this.gameIconSquare);
}
if (hs.tp.isCommonGameListUI2Trait_getEntryAssets(t) && t.args[0] === this.gameName) {
if (!this.isValidSpriteFrame(this.gameIconRect)) return;
t.replace = !0;
t.returnValue = [ this.gameIconRect ];
}
if (hs.tp.isAtomengine4InfoGetTrackGameSubtype(t) && t.args[0] === this.gameName) {
t.replace = !0;
t.returnValue = this.trackSubtype;
}
hs.tp.isCommonGameListGamesGetGameInfoList(t) && this.ensureGameInfoInStorage();
if (hs.tp.isCommonGameListGamesStoreGameInfoList(t)) {
var r = t.args[0].find(function(t) {
return t.gameName === e.gameName;
});
r && hs.storage.setItem(this.traitName, r);
}
};
return u([ classId("CommonGameListUI2PixelArtExTrait") ], e);
}(Trait);
o.CommonGameListUI2PixelArtExTrait = f;
cc._RF.pop();
}, {} ]
}, {}, [ "CommonGameListUI2PixelArtExTrait" ]);
//# sourceMappingURL=index.js.map
