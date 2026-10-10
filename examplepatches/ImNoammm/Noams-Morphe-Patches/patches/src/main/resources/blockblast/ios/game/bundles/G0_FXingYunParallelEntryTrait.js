window.__require = function t(e, o, n) {
function r(a, s) {
if (!o[a]) {
if (!e[a]) {
var h = a.split("/");
h = h[h.length - 1];
if (!e[h]) {
var p = "function" == typeof __require && __require;
if (!s && p) return p(h, !0);
if (i) return i(h, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = h;
}
var l = o[a] = {
exports: {}
};
e[a][0].call(l.exports, function(t) {
return r(e[a][1][t] || t);
}, l, l.exports, t, e, o, n);
}
return o[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < n.length; a++) r(n[a]);
return r;
}({
G0_FXingYunParallelEntryTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "db5c0g1kGhF9a3v/EgXpEQ7", "G0_FXingYunParallelEntryTrait");
var n, r = this && this.__extends || (n = function(t, e) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var o in e) Object.prototype.hasOwnProperty.call(e, o) && (t[o] = e[o]);
})(t, e);
}, function(t, e) {
n(t, e);
function o() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (o.prototype = e.prototype, new o());
}), i = this && this.__decorate || function(t, e, o, n) {
var r, i = arguments.length, a = i < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, o, n); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (a = (i < 3 ? r(a) : i > 3 ? r(e, o, a) : r(e, o)) || a);
return i > 3 && a && Object.defineProperty(e, o, a), a;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.G0_FXingYunParallelEntryTrait = void 0;
var a = function(t) {
r(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.registerTraitEventsMethods = function() {
return [];
};
e.prototype.onActive = function(t) {
var e = this.props.worldId;
hs.tp.isAtomengine4_ProxyOnFeatureListReady(t) && this._triggerPreload();
hs.tp.isHomePage_ProxyShowHomePage(t) && this._triggerPreload();
if (hs.tp.isAtomengine4_ProxyOnPreloadSuccess(t) && t.args[0].rootWorldId === e) {
this._isReadyShowEntry = !0;
this._showEntry(e);
}
hs.tp.isHomePage_Game_ProxyOnEnterClass(t) && hs.atomengine4Info.setHostActive(e, !1);
hs.tp.isHomePage_Game_ProxyOnEnterChapter(t) && hs.atomengine4Info.setHostActive(e, !1);
hs.tp.isAchievement_ProxyOnAchievement_Entrance(t) && hs.atomengine4Info.setHostActive(e, !1);
hs.tp.isGameLobby_DataInfoEnterGameLobby(t) && hs.atomengine4Info.setHostActive(e, !1);
if (hs.tp.isSetupBtnItemRenderComplete(t)) {
var o = t.target;
o && o.state.key === hs.enSetupKeys.home && hs.atomengine4Info.hasEntryRedDot(e) && (o.redNode.active = !0);
}
hs.tp.isClassTopInfoRefreshRedPoint(t) && hs.launchInfo.openChapterModule() && hs.atomengine4Info.hasEntryRedDot(e) && (t.args[1] = !0);
if (hs.tp.isChapterTopInfoBtnInitCompelte(t) && hs.atomengine4Info.hasEntryRedDot(e)) {
var n = t.args[0];
(i = null == n ? void 0 : n.getChildByName("red")) && (i.active = !0);
}
hs.tp.isChapterTopInfo_ProxyOnChapterTopInfoOpen(t) && hs.atomengine4Info.hasEntryRedDot(e) && (r = Cinst(hs.ChapterTopInfoBtn)) && r.setup && (i = r.setup.node.getChildByName("red")) && (i.active = !0);
if (hs.tp.isHomePage_ProxyShowHomePage(t)) {
var r;
if ((r = Cinst(hs.ChapterTopInfoBtn)) && r.setup) {
var i;
(i = r.setup.node.getChildByName("red")) && (i.active = !1);
}
this._isReadyShowEntry && this._showEntry(e);
}
if (hs.tp.isAddMoreGameTraitDoPostProcess(t)) {
this._isReadyShowEntry = !0;
this._showEntry(e);
}
};
e.prototype._showEntry = function(t) {
var e, o, n = TRAIT("Atomengine4EntryLimitTrait");
if (!n || n.canShowEntry()) {
var r = null === (e = hs.uiLayer) || void 0 === e ? void 0 : e.getChildByName("homePage"), i = null == r ? void 0 : r.getChildByName("btn_layout"), a = null == i ? void 0 : i.getChildByName("GameLobbyAddMoreGame"), s = cc.v2(233, 740);
if (a) {
null === (o = i.getComponent(cc.Layout)) || void 0 === o || o.updateLayout();
s.x = a.x;
s.y = a.y + 2;
s = r.convertToNodeSpaceAR(i.convertToWorldSpaceAR(s));
hs.atomengine4Info.showEntry({
rootWorldId: t,
parentNode: r,
position: s,
onEntryState: function(t) {
t === hs.Atomengine4EntryState.Open ? a.active = !1 : a.active = !0;
}
});
}
}
};
e.prototype._triggerPreload = function() {
var t = this.props.worldId;
hs.atomengine4Info.preloadUniverse(t);
};
return i([ classId("G0_FXingYunParallelEntryTrait") ], e);
}(Trait);
o.G0_FXingYunParallelEntryTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "G0_FXingYunParallelEntryTrait" ]);
//# sourceMappingURL=index.js.map
