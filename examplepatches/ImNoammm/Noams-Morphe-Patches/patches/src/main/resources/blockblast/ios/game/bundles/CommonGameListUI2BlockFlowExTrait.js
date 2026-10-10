window.__require = function t(e, o, r) {
function n(a, s) {
if (!o[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!s && l) return l(c, !0);
if (i) return i(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var u = o[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return n(e[a][1][t] || t);
}, u, u.exports, t, e, o, r);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < r.length; a++) n(r[a]);
return n;
}({
BlockFlowPower: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "2f458IHXLtLA6mPmjI6+DuZ", "BlockFlowPower");
var r = this && this.__awaiter || function(t, e, o, r) {
return new (o || (o = Promise))(function(n, i) {
function a(t) {
try {
c(r.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
c(r.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof o ? e : new o(function(t) {
t(e);
})).then(a, s);
var e;
}
c((r = r.apply(t, e || [])).next());
});
}, n = this && this.__generator || function(t, e) {
var o, r, n, i, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (o = 1, r && (n = 2 & i[0] ? r.return : i[0] ? r.throw || ((n = r.return) && n.call(r), 
0) : r.next) && !(n = n.call(r, i[1])).done) return n;
(r = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
a.label++;
return {
value: i[1],
done: !1
};

case 5:
a.label++;
r = i[1];
i = [ 0 ];
continue;

case 7:
i = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
a = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
a.label = i[1];
break;
}
if (6 === i[0] && a.label < n[1]) {
a.label = n[1];
n = i;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(i);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
i = e.call(t, a);
} catch (t) {
i = [ 6, t ];
r = 0;
} finally {
o = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, i = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, i = o.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var a = t("./TimeCountDownBlockFlow"), s = function() {
function t(t, e) {
this.bundleName = t;
this.gameName = e;
this.heartCountNode = null;
this.heartTimeNode = null;
}
Object.defineProperty(t.prototype, "heartTimeCountDownBlockFlow", {
get: function() {
return cc.isValid(this.heartTimeNode) ? this.heartTimeNode.getComponent(a.default) || this.heartTimeNode.addComponent(a.default) : null;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "localData", {
get: function() {
try {
var t = cc.sys.localStorage.getItem("ae_storage_G12_FHeartSystem_HeartManagerLogic") || "{}";
if (t) return JSON.parse(t);
} catch (t) {}
return null;
},
enumerable: !1,
configurable: !0
});
t.prototype.preloadHeart = function() {
return r(this, void 0, Promise, function() {
var t, e, o;
return n(this, function(r) {
switch (r.label) {
case 0:
r.trys.push([ 0, 2, , 3 ]);
return [ 4, Promise.all([ hs.ResLoader.asyncLoadByBundle(this.bundleName, "prefab/heart_tip_count", cc.Prefab), hs.ResLoader.asyncLoadByBundle(this.bundleName, "prefab/heart_tip_time", cc.Prefab) ]) ];

case 1:
t = i.apply(void 0, [ r.sent(), 2 ]), e = t[0], o = t[1];
this.heartCountNode = cc.instantiate(e);
this.heartTimeNode = cc.instantiate(o);
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
t.prototype.showHeart = function(t, e, o) {
var r, n;
this.heartCountNode.setPosition(e.position);
this.heartCountNode.zIndex = e.zIndex;
t.addChild(this.heartCountNode);
this.heartCountNode.active = !0;
var i = null === (n = null === (r = this.heartCountNode.getChildByName("tip_bg")) || void 0 === r ? void 0 : r.getChildByName("count")) || void 0 === n ? void 0 : n.getComponent(cc.Label);
i && (i.string = "x" + o);
};
t.prototype.showHeartTip = function(t, e) {
if (cc.isValid(e) && cc.isValid(e.parent)) {
var o = e.parent;
if ((null == t ? void 0 : t.gameName) === this.gameName) {
var r = this.getHeartSystemData(void 0);
if (r) {
this.detachHeartTips();
var n = Number(r.currentHeart) || 0, i = Number(r.nextRecoveryAt) || 0;
n > 0 && cc.isValid(this.heartCountNode) && this.showHeart(o, e, n);
i > 0 && cc.isValid(this.heartTimeNode) && this.showTime(o, e, i, n);
} else this.detachHeartTips();
} else this.detachHeartTips(o);
}
};
t.prototype.showTime = function(t, e, o, r) {
var n, i, a = this;
this.heartTimeNode.opacity = r > 0 ? 0 : 255;
this.heartTimeNode.setPosition(e.position);
this.heartTimeNode.zIndex = e.zIndex;
t.addChild(this.heartTimeNode);
this.heartTimeNode.active = !0;
var s = null === (i = null === (n = this.heartTimeNode.getChildByName("tip_bg")) || void 0 === n ? void 0 : n.getChildByName("time")) || void 0 === i ? void 0 : i.getComponent(cc.Label);
s && this.startRecoveryCountdown(s, o, function() {
t && cc.isValid(t) && e && cc.isValid(e) && a.showRecoveryHeart(t, e);
});
};
t.prototype.showRecoveryHeart = function(t, e) {
var o = this.getHeartSystemData(void 0);
if (o) {
var r = Number(o.currentHeart) || 0, n = Number(o.maxHeart) || 0, i = Number(o.recoveryInterval) || 0, a = Number(o.nextRecoveryAt) || 0, s = Math.min(n, Math.floor((Date.now() - a) / i) + 1);
if (s > 0 && cc.isValid(this.heartCountNode)) {
var c = Math.min(n, r + s);
this.showHeart(t, e, c);
if (c < n) {
var l = Date.now() + i;
l > 0 && cc.isValid(this.heartTimeNode) && this.showTime(t, e, l, c);
}
}
} else this.detachHeartTips();
};
t.prototype.getHeartSystemData = function(t) {
var e, o, r, n, i = this.localData, a = null !== (e = null == t ? void 0 : t.currentHeart) && void 0 !== e ? e : null == i ? void 0 : i.currentHeart, s = null !== (o = null == t ? void 0 : t.nextRecoveryAt) && void 0 !== o ? o : null == i ? void 0 : i.nextRecoveryAt, c = null !== (r = null == t ? void 0 : t.maxHeart) && void 0 !== r ? r : null == i ? void 0 : i.maxHeart, l = null !== (n = null == t ? void 0 : t.recoveryInterval) && void 0 !== n ? n : null == i ? void 0 : i.recoveryInterval;
return void 0 === a && void 0 === s ? null : {
currentHeart: a,
nextRecoveryAt: s,
maxHeart: c,
recoveryInterval: l
};
};
t.prototype.startRecoveryCountdown = function(t, e, o) {
var r, n = this;
this.stopRecoveryCountdown();
var i = function() {
if (cc.isValid(t) && cc.isValid(n.heartTimeNode) && cc.isValid(n.heartTimeNode.parent)) {
t.string = n.formatRecoveryCountdown(e);
if (n.getRecoveryRemainingSeconds(e) <= 0) {
n.stopRecoveryCountdown();
n.detachHeartTips();
null == o || o();
}
} else n.stopRecoveryCountdown();
};
i();
null === (r = this.heartTimeCountDownBlockFlow) || void 0 === r || r.startCountdown(i, 1);
};
t.prototype.stopRecoveryCountdown = function(t) {
var e;
t && this.heartTimeCountDownBlockFlow && this.heartTimeCountDownBlockFlow.node.parent !== t || null === (e = this.heartTimeCountDownBlockFlow) || void 0 === e || e.stopCountdown();
};
t.prototype.formatRecoveryCountdown = function(t) {
var e = this.getRecoveryRemainingSeconds(t), o = Math.floor(e / 60), r = e % 60;
return this.padTimeUnit(o) + ":" + this.padTimeUnit(r);
};
t.prototype.getRecoveryRemainingSeconds = function(t) {
return Math.max(0, Math.ceil((t - Date.now()) / 1e3));
};
t.prototype.padTimeUnit = function(t) {
return t < 10 ? "0" + t : "" + t;
};
t.prototype.detachHeartTips = function(t) {
this.stopRecoveryCountdown(t);
this.detachHeartTipNode(this.heartCountNode, t);
this.detachHeartTipNode(this.heartTimeNode, t);
};
t.prototype.detachHeartTipNode = function(t, e) {
cc.isValid(t) && cc.isValid(t.parent) && (e && t.parent !== e || t.removeFromParent(!1));
};
return t;
}();
o.default = s;
cc._RF.pop();
}, {
"./TimeCountDownBlockFlow": "TimeCountDownBlockFlow"
} ],
CommonGameListUI2BlockFlowExTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "d680e3dwIRBGox9RWWfT7Av", "CommonGameListUI2BlockFlowExTrait");
var r, n = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, o, a) : n(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
}, a = this && this.__awaiter || function(t, e, o, r) {
return new (o || (o = Promise))(function(n, i) {
function a(t) {
try {
c(r.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
c(r.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
t.done ? n(t.value) : (e = t.value, e instanceof o ? e : new o(function(t) {
t(e);
})).then(a, s);
var e;
}
c((r = r.apply(t, e || [])).next());
});
}, s = this && this.__generator || function(t, e) {
var o, r, n, i, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function s(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(i) {
if (o) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (o = 1, r && (n = 2 & i[0] ? r.return : i[0] ? r.throw || ((n = r.return) && n.call(r), 
0) : r.next) && !(n = n.call(r, i[1])).done) return n;
(r = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
a.label++;
return {
value: i[1],
done: !1
};

case 5:
a.label++;
r = i[1];
i = [ 0 ];
continue;

case 7:
i = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
a = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
a.label = i[1];
break;
}
if (6 === i[0] && a.label < n[1]) {
a.label = n[1];
n = i;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(i);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
i = e.call(t, a);
} catch (t) {
i = [ 6, t ];
r = 0;
} finally {
o = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, c = this && this.__read || function(t, e) {
var o = "function" == typeof Symbol && t[Symbol.iterator];
if (!o) return t;
var r, n, i = o.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) a.push(r.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
r && !r.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.CommonGameListUI2BlockFlowExTrait = o.DownloadState = void 0;
var l, u, h, p = t("./BlockFlowPower");
(function(t) {
t[t.LEGACY = 1] = "LEGACY";
t[t.SAND = 2] = "SAND";
t[t.ATOM = 3] = "ATOM";
t[t.CHAPTER = 5] = "CHAPTER";
})(l || (l = {}));
(function(t) {
t[t.DEFAULT = 1] = "DEFAULT";
t[t.CLICK = 2] = "CLICK";
})(u || (u = {}));
(function(t) {
t[t.NONE = 0] = "NONE";
t[t.PENDING = 1] = "PENDING";
t[t.SUCCESS = 2] = "SUCCESS";
t[t.FAIL = 3] = "FAIL";
})(h = o.DownloadState || (o.DownloadState = {}));
var d = function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.gameName = "G12";
e.gameType = l.ATOM;
e.trigger = u.DEFAULT;
e.defaultAtomWorldId = "G12_FBase_World";
e.defaultAtomDownloadId = "G12_FDownload_World";
e.trackSubtype = "4";
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
var t;
this.preloadGameIcons();
if (this.shouldShowHeartTip) {
this.powerCtrl = new p.default(this.traitName, this.gameName);
null === (t = this.powerCtrl) || void 0 === t || t.preloadHeart();
}
};
e.prototype.getIconPath = function() {
return 0 === this.props.plan ? "textures/G12_rect" : "image/btn_BlockFlow_big";
};
e.prototype.getIconPathSquare = function() {
return 0 === this.props.plan ? "textures/G12_square" : "image/MiniGame_img_BlockFlow";
};
e.prototype.preloadGameIcons = function() {
return a(this, void 0, Promise, function() {
var t, e, o;
return s(this, function(r) {
switch (r.label) {
case 0:
r.trys.push([ 0, 2, , 3 ]);
return [ 4, Promise.all([ this.loadGameIcon(this.getIconPath()), this.loadGameIcon(this.getIconPathSquare()) ]) ];

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
var e = this.atomWorldId, o = this.atomDownloadId;
t.atom = {
worldId: e,
downloadId: o
};
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
var i = this.trigger == u.CLICK, a = !0 === this.props.played ? .1 : 0, s = !0 === this.props.played ? Date.now() : 0;
r = {
gameName: this.gameName,
duringTime: this.props.duringTime,
played: this.props.played,
timestamp: this.getInitialGameTimestamp(o),
type: this.gameType,
trigger: this.trigger,
download: 0,
clickCount: a,
lastClickTime: s,
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
t.download = h.NONE;
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
var e, o = this;
if (hs.tp.isCommonGameSurpriseMiniGameTraitChangeMiniGameIcon(t)) {
if (!this.isValidSpriteFrame(this.gameIconSquare)) return;
var r = t.args[0];
r && !r.has(this.gameName) && r.set(this.gameName, this.gameIconSquare);
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
hs.tp.isCommonGameListGamesStoreGameInfoList(t) && (n = t.args[0].find(function(t) {
return t.gameName === o.gameName;
})) && hs.storage.setItem(this.traitName, n);
if (hs.tp.isCommonGameListUI2ItemNotNewTag(t) && this.shouldShowHeartTip) {
var n = t.args[0], i = t.args[1];
null === (e = this.powerCtrl) || void 0 === e || e.showHeartTip(n, i);
}
};
Object.defineProperty(e.prototype, "shouldShowHeartTip", {
get: function() {
return !0 === this.props.heart;
},
enumerable: !1,
configurable: !0
});
return i([ classId("CommonGameListUI2BlockFlowExTrait") ], e);
}(Trait);
o.CommonGameListUI2BlockFlowExTrait = d;
cc._RF.pop();
}, {
"./BlockFlowPower": "BlockFlowPower"
} ],
TimeCountDownBlockFlow: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "236a5ca6shKyaDDe5mrldS6", "TimeCountDownBlockFlow");
var r, n = this && this.__extends || (r = function(t, e) {
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
}), i = this && this.__decorate || function(t, e, o, r) {
var n, i = arguments.length, a = i < 3 ? e : null === r ? r = Object.getOwnPropertyDescriptor(e, o) : r;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, r); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (i < 3 ? n(a) : i > 3 ? n(e, o, a) : n(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var a = cc._decorator, s = a.ccclass, c = (a.property, function(t) {
n(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._countdownTime = 0;
e._countdownCallback = null;
e._interval = 1;
return e;
}
e.prototype.startCountdown = function(t, e) {
void 0 === e && (e = 1);
this._countdownCallback = t;
this._countdownTime = 0;
this._interval = e;
};
e.prototype.stopCountdown = function() {
this._countdownCallback = null;
this._countdownTime = 0;
};
e.prototype.update = function(t) {
if (this._countdownCallback) {
this._countdownTime += t;
if (this._countdownTime >= this._interval) {
this._countdownTime = 0;
this._countdownCallback();
}
}
};
return i([ s ], e);
}(hs.Component));
o.default = c;
cc._RF.pop();
}, {} ]
}, {}, [ "BlockFlowPower", "CommonGameListUI2BlockFlowExTrait", "TimeCountDownBlockFlow" ]);
//# sourceMappingURL=index.js.map
