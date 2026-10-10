window.__require = function t(e, r, a) {
function o(i, s) {
if (!r[i]) {
if (!e[i]) {
var u = i.split("/");
u = u[u.length - 1];
if (!e[u]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = u;
}
var h = r[i] = {
exports: {}
};
e[i][0].call(h.exports, function(t) {
return o(e[i][1][t] || t);
}, h, h.exports, t, e, r, a);
}
return r[i].exports;
}
for (var n = "function" == typeof __require && __require, i = 0; i < a.length; i++) o(a[i]);
return o;
}({
CTRefactorPureGemTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "a7c3eiRTytNbpqBK1+MDj0U", "CTRefactorPureGemTrait");
var a, o = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
a(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), n = this && this.__decorate || function(t, e, r, a) {
var o, n = arguments.length, i = n < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, r) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(t, e, r, a); else for (var s = t.length - 1; s >= 0; s--) (o = t[s]) && (i = (n < 3 ? o(i) : n > 3 ? o(e, r, i) : o(e, r)) || i);
return n > 3 && i && Object.defineProperty(e, r, i), i;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorPureGemTrait = void 0;
var i = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._isPureGemModel = !1;
e._randomInx = -1;
e._pureColorId = -1;
e._currdata = {
prePureGemLocalData: null,
pureGemRandomStart: null
};
return e;
}
e.prototype.data = function() {
return {
all_jewel: 0
};
};
e.prototype.isChapterDefaultBoard_ProxyOnProduceChapterDefaultBoard = function() {
this.initPureGemData();
};
e.prototype.isChapterDefaultBoard_ProxySetChapterColor = function() {
if (this._isPureGemModel) {
var t = storage.getItem("chapterFaceBlocks", hs.boardInfo.NULL);
if (t && Array.isArray(t)) for (var e = 0; e < t.length; e++) if (Array.isArray(t[e])) for (var r = 0; r < t[e].length; r++) "number" == typeof t[e][r] && -1 != t[e][r] && (t[e][r] = this._pureColorId);
storage.setItem("chapterFaceBlocks", t);
}
};
e.prototype.isBlocksProducerTouchIsShowShaderColor = function(t) {
if (this.isChangeShaderColor(t.args[0], t.args[1])) {
t.returnValue = !0;
t.returnState = !0;
t.replace = !0;
}
};
e.prototype.onAlgorithmStrategyCollectionAdjust = function() {
if (this._isPureGemModel) {
var t = hs.chapterAlgorithmInfo.blockIdList;
if (Array.isArray(t) && 0 !== t.length) {
for (var e = [], r = 0; r < 3; r++) {
var a = hs.AlgorithmPosType[t[r]], o = {};
if (a) for (var n = 0; n < a.length; n++) o[n] = {
Key: this._pureColorId,
pos: n
};
e.push(o);
}
return {
data: e,
returnState: !0
};
}
}
};
e.prototype.getGemPureColor = function() {
return this._pureColorId;
};
e.prototype.initPureCurrentArry = function() {};
e.prototype.isChangeShaderColor = function(t, e) {
var r = !0;
t: for (var a in t) for (var o in t[a]) if (t[a][o] == e) {
r = !1;
break t;
}
return r;
};
e.prototype.initPureGemData = function() {
this.loadData();
if (this.isTriggered()) {
this._isPureGemModel = !0;
this.state.all_jewel = 1;
this.initRandomInx();
var t = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections[0];
this._pureColorId = t.Key;
} else {
this._isPureGemModel = !1;
this.state.all_jewel = 0;
}
};
e.prototype.initRandomInx = function() {
var t = hs.chapterGameInfo.stage, e = hs.chapterGameInfo.chapterNum + 1, r = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections.length;
if (!this.currIsPureGem() || r > 1) {
this._randomInx = Math.floor(Math.random() * r);
if (this.currIsPureGem()) {
var a = this._currdata.prePureGemLocalData;
a && a.randomInx && (this._randomInx = parseInt(a.randomInx));
}
this._currdata.prePureGemLocalData = {
travelid: t,
travellevelid: e,
randomInx: this._randomInx
};
this.initPureRequiredCollections();
this.saveData();
}
};
e.prototype.initPureRequiredCollections = function() {
var t = this.newRandomRequiredCollection();
hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections = [];
hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections.push(t);
};
e.prototype.newRandomRequiredCollection = function() {
for (var t = this.props && this.props.multipleNum ? this.props.multipleNum : 6, e = hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections, r = {
Key: hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.RequiredCollections[this._randomInx].Key,
Value: 0
}, a = 0; a < e.length; a++) r.Value += e[a].Value;
r.Value *= t;
return r;
};
e.prototype.isTriggered = function() {
return !!this.currIsPureGem() || !!(this.isBiggerLevel() && this.isCollection() && this.isIntervalLevel());
};
e.prototype.isIntervalLevel = function() {
var t = this.props.interval, e = hs.chapterGameInfo.stage, r = hs.chapterGameInfo.chapterNum + 1, a = this._currdata.prePureGemLocalData;
if (a) {
var o = a.travelid, n = a.travellevelid;
return e == o && (r - n >= t || r == n) || e != o;
}
return !0;
};
e.prototype.isCollection = function() {
return 1 == hs.chapterConfigInfo.chapterDatasCfg[hs.chapterGameInfo.chapterNum].Condition.Way;
};
e.prototype.isBiggerLevel = function() {
var t = hs.chapterGameInfo.chapterNum + 1, e = this.props.startRange[0], r = this.props.startRange[1], a = Math.floor(Math.random() * (r - e + 1) + e);
if (this._currdata.pureGemRandomStart && this._currdata.pureGemRandomStart >= e) a = this._currdata.pureGemRandomStart; else {
this._currdata.pureGemRandomStart = a;
this.saveData();
}
return t > a;
};
e.prototype.currIsPureGem = function() {
var t = hs.chapterGameInfo.stage, e = hs.chapterGameInfo.chapterNum + 1, r = this._currdata.prePureGemLocalData;
if (r) {
var a = r.travelid, o = r.travellevelid;
if (t == a && e == o) return !0;
}
return !1;
};
e.prototype.loadData = function() {
var t = storage.getItem("chapterPureGemTraitData", null);
if (t) try {
this._currdata = t;
} catch (t) {}
};
e.prototype.saveData = function() {
storage.setItem("chapterPureGemTraitData", this._currdata);
};
return n([ classId("CTRefactorPureGemTrait") ], e);
}(Trait);
r.CTRefactorPureGemTrait = i;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorPureGemTrait" ]);
//# sourceMappingURL=index.js.map
