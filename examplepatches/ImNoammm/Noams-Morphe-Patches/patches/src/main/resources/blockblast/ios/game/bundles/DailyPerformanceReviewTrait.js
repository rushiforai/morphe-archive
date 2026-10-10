window.__require = function e(t, o, i) {
function r(s, a) {
if (!o[s]) {
if (!t[s]) {
var l = s.split("/");
l = l[l.length - 1];
if (!t[l]) {
var c = "function" == typeof __require && __require;
if (!a && c) return c(l, !0);
if (n) return n(l, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = l;
}
var h = o[s] = {
exports: {}
};
t[s][0].call(h.exports, function(e) {
return r(t[s][1][e] || e);
}, h, h.exports, e, t, o, i);
}
return o[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < i.length; s++) r(i[s]);
return r;
}({
DailyPerformanceReviewTrait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "6284eN7mPxJpq4mGvDPI1+z", "DailyPerformanceReviewTrait");
var i, r = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), n = this && this.__decorate || function(e, t, o, i) {
var r, n = arguments.length, s = n < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, o, i); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (s = (n < 3 ? r(s) : n > 3 ? r(t, o, s) : r(t, o)) || s);
return n > 3 && s && Object.defineProperty(t, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.DailyPerformanceReviewTrait = o.shouldSkipDailyPerformanceReviewByReviewData = o.shouldSkipDailyPerformanceReviewByShowTime = o.resolveDailyPerformanceReviewLevel = void 0;
var s = "333037001_dailyPerformanceReviewData", a = {
name: "DailyPerformanceReviewUI",
url: "prefabs/DailyPerformanceReviewUI",
bundleName: "DailyPerformanceReviewTrait",
modal: !1,
clickModalNotClose: !0
}, l = {
showTime: 0,
records: []
}, c = [ 0, 500, 2e3, 5e3, 1e4, 2e4, 4e4 ], h = [ 0, 2, 5, 9, 14, 19, 20 ], u = [ "C", "B", "A", "A+", "S", "SS", "SSS" ];
function p(e, t) {
for (var o = Math.max(0, Math.floor(Number.isFinite(e) ? e : 0)), i = Math.min(t.length, u.length) - 1; i > 0; i--) {
var r = t[i];
if (Number.isFinite(r) && o >= r) return i + 1;
}
return 1;
}
o.resolveDailyPerformanceReviewLevel = p;
function d(e, t) {
if (t || !Number.isFinite(e) || e <= 0) return !1;
var o = new Date(e), i = new Date();
return o.getFullYear() === i.getFullYear() && o.getMonth() === i.getMonth() && o.getDate() === i.getDate();
}
o.shouldSkipDailyPerformanceReviewByShowTime = d;
function f(e, t) {
var o = Math.max(0, Math.floor(Number.isFinite(e) ? e : 0)), i = Math.max(0, Math.floor(Number.isFinite(t) ? t : 0));
return 0 === o && 0 === i;
}
o.shouldSkipDailyPerformanceReviewByReviewData = f;
var _ = function(e) {
r(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._isShowingOrLoading = !1;
t._currentUI = null;
t._logoTouchNode = null;
return t;
}
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
t.prototype.isTrigger = function() {
return !0;
};
t.prototype.onActive = function(e) {
var t;
(hs.tp.isClassScoreTip_ProxyOnClassScoreUpdate(e) || hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(e)) && this._recordTodayClassScore();
hs.tp.isChapterContinuityPassLevel_ProxyGameWin(e) && this._recordTodayAdventurePass();
if (hs.tp.isHomePageOnDisable(e)) {
if (!this.isTrigger()) return;
this._unbindLogoClick();
this._closeCurrentUI(!0);
}
if (hs.tp.isHomePage_ProxyShowComplete(e) || hs.tp.isHomePageOnEnable(e)) {
if (!this.isTrigger()) return;
this._bindLogoClick();
this._tryShowReview(!1);
}
hs.tp.isHomePageModifyLogoByTraits(e) && this._bindLogoClick();
if (hs.tp.isAdvertisement_FullScene_ProxyOnAppShow(e)) {
if (!this.isTrigger()) return;
(null === (t = hs.homePageInfo) || void 0 === t ? void 0 : t.isInHomePage) && this._tryShowReview(!1);
}
};
t.prototype._tryShowReview = function(e) {
var t, o, i = this;
if (this._isShowingOrLoading || this._currentUI) ; else {
var r = this._getStorageData();
if (d(r.showTime, e)) ; else {
var n = this._getYesterdayRecord(r), s = {
classScore: null !== (t = null == n ? void 0 : n.classMaxScore) && void 0 !== t ? t : 0,
adventureScore: null !== (o = null == n ? void 0 : n.adventurePassCount) && void 0 !== o ? o : 0
};
if (f(s.classScore, s.adventureScore)) ; else {
var l = this._calculateLevelIndex(s.classScore, s.adventureScore);
this._isShowingOrLoading = !0;
hs.UI.show(a, hs.gameAlertLayer || hs.uiLayer).then(function(t) {
i._isShowingOrLoading = !1;
if (t && cc.isValid(t)) {
var o = i._getUIComponent(t);
if (o) {
i._currentUI = o;
e || i._markTodayShown();
o.setState({
classScore: s.classScore,
adventureScore: s.adventureScore,
levelIndex: l,
autoCloseDelaySec: i._autoCloseDelaySec,
onClose: function() {
i._currentUI = null;
hs.UI.hideUI(a);
}
});
} else hs.UI.hideUI(a);
}
}).catch(function() {
i._isShowingOrLoading = !1;
});
}
}
}
};
t.prototype.showUIByOtherTrait = function() {
var e, t, o = this, i = this._getStorageData(), r = this._getYesterdayRecord(i), n = {
classScore: null !== (e = null == r ? void 0 : r.classMaxScore) && void 0 !== e ? e : 0,
adventureScore: null !== (t = null == r ? void 0 : r.adventurePassCount) && void 0 !== t ? t : 0
}, s = this._calculateLevelIndex(n.classScore, n.adventureScore);
hs.UI.show(a, hs.gameAlertLayer || hs.uiLayer).then(function(e) {
o._isShowingOrLoading = !1;
if (e && cc.isValid(e)) {
var t = o._getUIComponent(e);
if (t) {
o._currentUI = t;
t.setState({
classScore: n.classScore,
adventureScore: n.adventureScore,
levelIndex: s,
autoCloseDelaySec: o._autoCloseDelaySec,
onClose: function() {
o._currentUI = null;
hs.UI.hideUI(a);
}
});
} else hs.UI.hideUI(a);
}
});
};
t.prototype._getUIComponent = function(e) {
return e.getComponent("DailyPerformanceReviewUI") || e.addComponent("DailyPerformanceReviewUI");
};
t.prototype._bindLogoClick = function() {
var e, t;
if (this.props.isClickIconShow) {
var o = Cinst(hs.HomePage), i = null === (t = null === (e = null == o ? void 0 : o.sections) || void 0 === e ? void 0 : e[hs.HomePageSectionType.LOGO]) || void 0 === t ? void 0 : t.node;
if (i && cc.isValid(i)) {
if (this._logoTouchNode !== i) {
this._unbindLogoClick();
this._logoTouchNode = i;
i.on(cc.Node.EventType.TOUCH_END, this._onLogoTouchEnd, this);
}
} else this._unbindLogoClick();
} else this._unbindLogoClick();
};
t.prototype._unbindLogoClick = function() {
if (this._logoTouchNode && cc.isValid(this._logoTouchNode)) {
this._logoTouchNode.off(cc.Node.EventType.TOUCH_END, this._onLogoTouchEnd, this);
this._logoTouchNode = null;
} else this._logoTouchNode = null;
};
t.prototype._onLogoTouchEnd = function() {
this._tryShowReview(!0);
};
t.prototype._closeCurrentUI = function(e) {
if (this._currentUI && cc.isValid(this._currentUI.node)) {
this._currentUI.close(e);
this._currentUI = null;
} else this._currentUI = null;
};
t.prototype._recordTodayClassScore = function() {
var e, t, o, i = this._getValidNumber(null !== (t = null === (e = hs.scoreInfo) || void 0 === e ? void 0 : e.score) && void 0 !== t ? t : null === (o = hs.classScoreInfo) || void 0 === o ? void 0 : o.score, 0), r = this._getStorageData(), n = this._getOrCreateTodayRecord(r);
n.classMaxScore;
n.classMaxScore = Math.max(n.classMaxScore, Math.floor(i));
this._saveStorageData(r);
};
t.prototype._recordTodayAdventurePass = function() {
var e = this._getStorageData();
this._getOrCreateTodayRecord(e).adventurePassCount += 1;
this._saveStorageData(e);
};
t.prototype._markTodayShown = function() {
var e = this._getStorageData();
e.showTime = Date.now();
this._saveStorageData(e);
};
t.prototype._getStorageData = function() {
var e = this, t = hs.storage.getItem(s, l);
return t && Array.isArray(t.records) ? {
showTime: this._getValidNumber(t.showTime, 0),
records: t.records.filter(function(e) {
return e && Number.isFinite(e.time);
}).map(function(t) {
return {
time: t.time,
classMaxScore: Math.max(0, Math.floor(e._getValidNumber(t.classMaxScore, 0))),
adventurePassCount: Math.max(0, Math.floor(e._getValidNumber(t.adventurePassCount, 0)))
};
})
} : {
showTime: 0,
records: []
};
};
t.prototype._saveStorageData = function(e) {
var t = Date.now(), o = t - 6912e5, i = e.records.filter(function(e) {
return e.time >= o || hs.isSameDate(e.time, t);
});
hs.storage.setItem(s, {
showTime: e.showTime,
records: i
});
};
t.prototype._getOrCreateTodayRecord = function(e) {
var t = Date.now(), o = e.records.find(function(e) {
return hs.isSameDate(e.time, t);
});
if (o) return o;
var i = {
time: t,
classMaxScore: 0,
adventurePassCount: 0
};
e.records.push(i);
return i;
};
t.prototype._getYesterdayRecord = function(e) {
var t, o = new Date();
o.setDate(o.getDate() - 1);
var i = o.getTime();
return null !== (t = e.records.find(function(e) {
return hs.isSameDate(e.time, i);
})) && void 0 !== t ? t : null;
};
t.prototype._calculateLevelIndex = function(e, t) {
var o = this._classScoreLevelThresholds, i = this._adventurePassLevelThresholds, r = p(e, o), n = p(t, i);
return Math.max(r, n);
};
t.prototype._getClassScoreLevel = function(e) {
return p(e, this._classScoreLevelThresholds);
};
t.prototype._getAdventureLevel = function(e) {
return p(e, this._adventurePassLevelThresholds);
};
t.prototype._getValidNumber = function(e, t) {
return Number.isFinite(e) ? e : t;
};
t.prototype._getLevelCalculationProcess = function(e, t) {
var o = this, i = Math.max(0, Math.floor(this._getValidNumber(e, 0)));
return t.slice(0, u.length).map(function(e, t) {
var r = Math.max(0, Math.floor(o._getValidNumber(e, 0)));
return u[t] + "(" + r + ")=" + (i >= r ? "满足" : "未满足");
});
};
t.prototype._getValidThresholds = function(e, t) {
var o = this;
return !Array.isArray(e) || e.length < u.length ? t : e.slice(0, u.length).map(function(e, i) {
var r = t[i];
return Math.max(0, Math.floor(o._getValidNumber(e, r)));
});
};
Object.defineProperty(t.prototype, "_autoCloseDelaySec", {
get: function() {
var e = this._getValidNumber(this.props.autoCloseDelaySec, 5);
return e > 0 ? e : 5;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "_classScoreLevelThresholds", {
get: function() {
return this._getValidThresholds(this.props.classScoreLevelThresholds, c);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "_adventurePassLevelThresholds", {
get: function() {
return this._getValidThresholds(this.props.adventurePassLevelThresholds, h);
},
enumerable: !1,
configurable: !0
});
return n([ classId("DailyPerformanceReviewTrait"), classMethodWatch() ], t);
}(Trait);
o.DailyPerformanceReviewTrait = _;
cc._RF.pop();
}, {} ],
DailyPerformanceReviewUI: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "9a94c68OclAlKusCEO/tmmM", "DailyPerformanceReviewUI");
var i, r = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), n = this && this.__decorate || function(e, t, o, i) {
var r, n = arguments.length, s = n < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, o, i); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (s = (n < 3 ? r(s) : n > 3 ? r(t, o, s) : r(t, o)) || s);
return n > 3 && s && Object.defineProperty(t, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var s = cc._decorator, a = s.ccclass, l = s.property, c = Math.round(178.5), h = function(e) {
r(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.bg = null;
t.contentBg = null;
t.classScore = null;
t.adventureScore = null;
t.levelspine = null;
t.bgspine = null;
t._autoCloseTimer = 0;
t._destroyTimer = 0;
t._isShowing = !1;
t._isClosing = !1;
t._basePanelScale = 1;
return t;
}
t.prototype.onLoad = function() {
this._bindMissingProperties();
this.bg && cc.isValid(this.bg) && this.bg.on(cc.Node.EventType.TOUCH_END, this._onMaskTouchEnd, this);
};
t.prototype.onDestroy = function() {
this._clearTimers();
this._stopTweens();
this.bg && cc.isValid(this.bg) && this.bg.off(cc.Node.EventType.TOUCH_END, this._onMaskTouchEnd, this);
this.levelspine && this.levelspine.setCompleteListener(null);
this.bgspine && this.bgspine.setCompleteListener(null);
};
t.prototype.render = function() {
if (this.state && void 0 !== this.state.classScore && void 0 !== this.state.adventureScore && void 0 !== this.state.levelIndex && !this._isShowing) {
this._isShowing = !0;
this._isClosing = !1;
this._playShow();
}
};
t.prototype.isBlockClosingWhenOpenning = function() {
return !1;
};
t.prototype.close = function(e) {
var t = this;
void 0 === e && (e = !1);
if (!this.isBlockClosingWhenOpenning() && !this._isClosing) {
this._isClosing = !0;
this._clearTimers();
if (e) this._finishClose(); else {
var o = this._panelNode, i = this._kSpeed;
if (this.levelspine) {
this.levelspine.setCompleteListener(null);
this.levelspine.setAnimation(0, this._levelAnimName("out"), !1);
}
this.bgspine && this.bgspine.setCompleteListener(null);
if (this.bg && cc.isValid(this.bg)) {
cc.Tween.stopAllByTarget(this.bg);
cc.tween(this.bg).to(.27 / i, {
opacity: 0
}).start();
}
if (o && cc.isValid(o)) {
cc.Tween.stopAllByTarget(o);
cc.tween(o).parallel(cc.tween().to(.27 / i, {
opacity: 0
}), cc.tween().to(.27 / i, {
scale: .65 * this._basePanelScale
}, {
easing: "backIn"
})).start();
}
this._destroyTimer = setTimeoutSafe(function() {
return t._finishClose();
}, 340 / i);
}
}
};
t.prototype._playShow = function() {
var e = this;
this._bindMissingProperties();
this._resetViewState();
this._renderScores();
var t = this._kSpeed;
setTimeoutSafe(function() {
if (cc.isValid(e.node) && !e._isClosing) {
e._playMaskIn();
setTimeoutSafe(function() {
if (cc.isValid(e.node) && !e._isClosing) {
e._playPanelIn();
e._playSpinesIn();
e._scheduleAutoClose();
}
}, 200 / t);
}
}, 300 / t);
};
t.prototype._playMaskIn = function() {
if (this.bg && cc.isValid(this.bg)) {
cc.Tween.stopAllByTarget(this.bg);
cc.tween(this.bg).to(.27 / this._kSpeed, {
opacity: c
}).start();
}
};
t.prototype._playPanelIn = function() {
var e = this._panelNode;
if (e && cc.isValid(e)) {
cc.Tween.stopAllByTarget(e);
cc.tween(e).parallel(cc.tween().to(.12 / this._kSpeed, {
opacity: 255
}), cc.tween().to(.24 / this._kSpeed, {
scale: this._basePanelScale
}, {
easing: "backOut"
})).start();
}
};
t.prototype._playSpinesIn = function() {
var e = this;
if (this.bgspine) {
this.bgspine.timeScale = this._kSpeed;
this.bgspine.setAnimation(0, "in", !1);
}
if (this.levelspine) {
this.levelspine.timeScale = this._kSpeed;
this.levelspine.setCompleteListener(null);
this.levelspine.setAnimation(0, this._levelAnimName("in"), !1);
this.levelspine.setCompleteListener(function() {
if (e.levelspine && cc.isValid(e.levelspine.node) && !e._isClosing) {
e.levelspine.setAnimation(0, e._levelAnimName("idle"), !0);
e.levelspine.setCompleteListener(null);
}
});
}
};
t.prototype._scheduleAutoClose = function() {
var e = this, t = this._getFiniteNumber(this.state.autoCloseDelaySec, 5);
t <= 0 || (this._autoCloseTimer = setTimeoutSafe(function() {
e.close(!1);
}, 1e3 * t / this._kSpeed));
};
t.prototype._resetViewState = function() {
this._clearTimers();
this._stopTweens();
var e = this._panelNode;
this.bg && cc.isValid(this.bg) && (this.bg.opacity = 0);
if (e && cc.isValid(e)) {
this._basePanelScale = e.scale || 1;
e.opacity = 0;
e.scale = .65 * this._basePanelScale;
}
};
t.prototype._renderScores = function() {
var e, t;
this.classScore && (this.classScore.string = String(Math.max(0, Math.floor(null !== (e = this.state.classScore) && void 0 !== e ? e : 0))));
this.adventureScore && (this.adventureScore.string = String(Math.max(0, Math.floor(null !== (t = this.state.adventureScore) && void 0 !== t ? t : 0))));
};
t.prototype._finishClose = function() {
var e, t = null === (e = this.state) || void 0 === e ? void 0 : e.onClose;
"function" == typeof t && t();
cc.isValid(this.node) && this.node.destroy();
};
t.prototype._onMaskTouchEnd = function(e) {
e && "function" == typeof e.stopPropagation && e.stopPropagation();
this.close(!1);
};
t.prototype._bindMissingProperties = function() {
this.bg || (this.bg = this.node.getChildByName("bg"));
this.contentBg || (this.contentBg = this.node.getChildByName("contentBg") || this.node.getChildByName("flash_img_paper"));
this.bgspine || (this.bgspine = this._findComponentByNodeName(this.node, "main_popUP_ribbon", sp.Skeleton));
this.levelspine || (this.levelspine = this._findComponentByNodeName(this.node, "main_popUP_medal", sp.Skeleton));
this.classScore || (this.classScore = this._findComponentByNodeName(this.node, "ClassicScore", cc.Label));
this.adventureScore || (this.adventureScore = this._findComponentByNodeName(this.node, "AdventureScore", cc.Label));
};
t.prototype._findComponentByNodeName = function(e, t, o) {
var i = this._findNodeByName(e, t);
return i ? i.getComponent(o) : null;
};
t.prototype._findNodeByName = function(e, t) {
if (!e || !cc.isValid(e)) return null;
if (e.name === t) return e;
for (var o = 0; o < e.childrenCount; o++) {
var i = this._findNodeByName(e.children[o], t);
if (i) return i;
}
return null;
};
t.prototype._levelAnimName = function(e) {
var t;
return e + "_" + Math.min(7, Math.max(1, Math.floor(null !== (t = this.state.levelIndex) && void 0 !== t ? t : 1)));
};
t.prototype._clearTimers = function() {
if (this._autoCloseTimer) {
clearTimeout(this._autoCloseTimer);
this._autoCloseTimer = 0;
}
if (this._destroyTimer) {
clearTimeout(this._destroyTimer);
this._destroyTimer = 0;
}
};
t.prototype._stopTweens = function() {
this.bg && cc.isValid(this.bg) && cc.Tween.stopAllByTarget(this.bg);
var e = this._panelNode;
e && cc.isValid(e) && cc.Tween.stopAllByTarget(e);
};
t.prototype._getFiniteNumber = function(e, t) {
return Number.isFinite(e) ? e : t;
};
Object.defineProperty(t.prototype, "_panelNode", {
get: function() {
return this.contentBg && cc.isValid(this.contentBg) ? this.contentBg : this.levelspine && this.levelspine.node && cc.isValid(this.levelspine.node.parent) ? this.levelspine.node.parent : this.node.getChildByName("flash_img_paper");
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "_kSpeed", {
get: function() {
var e = cc.director._kSpeed || 1;
return Number.isFinite(e) && e > 0 ? e : 1;
},
enumerable: !1,
configurable: !0
});
n([ l(cc.Node) ], t.prototype, "bg", void 0);
n([ l(cc.Node) ], t.prototype, "contentBg", void 0);
n([ l(cc.Label) ], t.prototype, "classScore", void 0);
n([ l(cc.Label) ], t.prototype, "adventureScore", void 0);
n([ l(sp.Skeleton) ], t.prototype, "levelspine", void 0);
n([ l(sp.Skeleton) ], t.prototype, "bgspine", void 0);
return n([ classId("DailyPerformanceReviewUI"), a, classMethodWatch() ], t);
}(hs.Component);
o.default = h;
cc._RF.pop();
}, {} ],
DailyPerformanceReview_gp_Trait: [ function(e, t, o) {
"use strict";
cc._RF.push(t, "a7f3dVBK45MkZ02Xgv0GMdi", "DailyPerformanceReview_gp_Trait");
var i, r = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
})(e, t);
}, function(e, t) {
i(e, t);
function o() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (o.prototype = t.prototype, new o());
}), n = this && this.__decorate || function(e, t, o, i) {
var r, n = arguments.length, s = n < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, o) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, t, o, i); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (s = (n < 3 ? r(s) : n > 3 ? r(t, o, s) : r(t, o)) || s);
return n > 3 && s && Object.defineProperty(t, o, s), s;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.DailyPerformanceReview_gp_Trait = void 0;
var s = function(e) {
r(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return !1;
},
enumerable: !1,
configurable: !0
});
return n([ classId("DailyPerformanceReviewTrait", "gp") ], t);
}(e("./DailyPerformanceReviewTrait").DailyPerformanceReviewTrait);
o.DailyPerformanceReview_gp_Trait = s;
cc._RF.pop();
}, {
"./DailyPerformanceReviewTrait": "DailyPerformanceReviewTrait"
} ]
}, {}, [ "DailyPerformanceReviewTrait", "DailyPerformanceReviewUI", "DailyPerformanceReview_gp_Trait" ]);
//# sourceMappingURL=index.js.map
