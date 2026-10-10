window.__require = function e(t, r, o) {
function n(a, c) {
if (!r[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var m = r[a] = {
exports: {}
};
t[a][0].call(m.exports, function(e) {
return n(t[a][1][e] || e);
}, m, m.exports, e, t, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CommonGameEntrance1Define: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "08756VTGcxAPLw1TihNThaY", "CommonGameEntrance1Define");
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CommonGameDefine = void 0;
(function(e) {
e.DownloadState = {
NONE: 0,
PENDING: 1,
SUCCESS: 2,
FAIL: 3
};
(function(e) {
e[e.DOWNLOAD_ONLY = 1] = "DOWNLOAD_ONLY";
})(e.EntryState || (e.EntryState = {}));
})(r.CommonGameDefine || (r.CommonGameDefine = {}));
cc._RF.pop();
}, {} ],
CommonGameEntrance1Trait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "7c944ppMWNIt6trM8M0Btvl", "CommonGameEntrance1Trait");
var o, n, i = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
o(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), a = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (n = e[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, r, a) : n(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CommonGameEntrance1Trait = void 0;
(function(e) {
e.THREE_BUTTONS = "threeButtons";
e.FOUR_BUTTONS_A = "fourButtonsA";
e.FOUR_BUTTONS_B = "fourButtonsB";
e.DEFAULT = "default";
})(n || (n = {}));
var c = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._redNumberPrefab = null;
return t;
}
t.prototype.onCreate = function() {
var t = this, r = this.computeEntranceState();
e.prototype.setState.call(this, r);
this._preloadResources().then(function() {
var e = TRAIT("CommonGameListDependenciesTrait");
e && e.active && e.setState({
traitId: t.id
});
});
};
t.prototype._preloadResources = function() {
var e = this;
return new Promise(function(t, r) {
hs.ResLoader.loadByBundle(e.traitName, "prefabs/redNumber", cc.Prefab, function(o, n) {
if (!o && cc.isValid(n)) {
e._redNumberPrefab = n;
t();
} else r(o);
});
});
};
t.prototype.computeEntranceState = function() {
return {
layoutMode: n.DEFAULT,
showAchievementInHome: !1,
showStreakInHome: !1,
showAchievementInSetting: !1,
showStreakInSetting: !1,
chapterBtnShow: !0
};
};
Object.defineProperty(t.prototype, "uiReady", {
get: function() {
var e = TRAIT("CommonGameListDependenciesTrait");
return !!(e && e.active && e.state.uiReady);
},
enumerable: !1,
configurable: !0
});
t.prototype.onActive = function(e) {
if (hs.tp.isHomePage_ProxyShowComplete(e)) {
if (!this.uiReady) return;
this.hideWinStreakNode();
this.hideChapterBtn();
}
if (hs.tp.isAddMoreGameTraitDoPostProcess(e)) {
if (!this.uiReady) return;
var t = e.args[0];
this._tryAttachMoreGameBadge(t);
}
if (hs.tp.isGameLobbyGLHallMoreGamesPopupViewOnHide(e)) {
if (!this.uiReady) return;
this._refreshMoreGameBadgeFromHomePage();
}
};
t.prototype.isCommonGameListTraitOnFinishClickGame = function() {
this._refreshMoreGameBadgeFromHomePage();
};
t.prototype._getNewGameCount = function() {
var e = TRAIT("CommonGameListTrait");
if (!(null == e ? void 0 : e.active) || !e.state.output) return 0;
e.setState({});
var t = e.state.output, r = "FilterResult" in t ? t.FilterResult : t;
return (Array.isArray(null == r ? void 0 : r.newGames) ? r.newGames : []).filter(function(e) {
var t;
return (null !== (t = e.clickCount) && void 0 !== t ? t : 0) <= 0;
}).length;
};
t.prototype._tryAttachMoreGameBadge = function(e) {
if (cc.isValid(e)) {
var t = this._getNewGameCount();
if (t <= 0) {
var r = e.getChildByName("CommonGameEntrance1Trait_redNumber");
cc.isValid(r) && (r.active = !1);
} else cc.isValid(this._redNumberPrefab) && function(r) {
var o;
if (cc.isValid(r) && cc.isValid(e)) {
var n = e.getChildByName("CommonGameEntrance1Trait_redNumber");
if (!cc.isValid(n)) {
(n = cc.instantiate(r)).name = "CommonGameEntrance1Trait_redNumber";
e.addChild(n);
n.setPosition(277, 68);
}
n.active = !0;
var i = null === (o = n.getChildByName("label_number")) || void 0 === o ? void 0 : o.getComponent(cc.Label);
cc.isValid(i) && (i.string = "" + t);
}
}(this._redNumberPrefab);
}
};
t.prototype._refreshMoreGameBadgeFromHomePage = function() {
var e, t, r = Cinst(hs.HomePage);
if (r && cc.isValid(r.node)) {
var o = null === (t = null === (e = null == r ? void 0 : r.node) || void 0 === e ? void 0 : e.getChildByName("btn_layout")) || void 0 === t ? void 0 : t.getChildByName("GameLobbyAddMoreGame");
this._tryAttachMoreGameBadge(o);
}
};
t.prototype.refreshMoreGameBadge = function() {
this._refreshMoreGameBadgeFromHomePage();
};
t.prototype.hideChapterBtn = function() {
var e = TRAIT("CommonGameListTrait");
if (null == e ? void 0 : e.active) {
var t = Cinst(hs.HomePage);
if (t && cc.isValid(t.node)) {
var r = cc.find("btn_layout/btn_JourneyLoading", t.node);
r && cc.isValid(r) && (r.active = !e.checkChapterInList());
}
}
};
t.prototype.hideWinStreakNode = function() {
var e = Cinst(hs.HomePage);
if (e && cc.isValid(e.node)) {
var t = e.node.getChildByName("winStreak");
if (t && cc.isValid(t) && t.active) {
t.active = !1;
t.opacity = 0;
}
}
};
return a([ classId("CommonGameEntrance1Trait") ], t);
}(Trait);
r.CommonGameEntrance1Trait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CommonGameEntrance1Define", "CommonGameEntrance1Trait" ]);
//# sourceMappingURL=index.js.map
