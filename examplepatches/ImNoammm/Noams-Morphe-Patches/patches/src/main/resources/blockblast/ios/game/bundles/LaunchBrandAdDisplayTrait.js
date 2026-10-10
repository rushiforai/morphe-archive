window.__require = function t(e, o, n) {
function i(c, a) {
if (!o[c]) {
if (!e[c]) {
var s = c.split("/");
s = s[s.length - 1];
if (!e[s]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(s, !0);
if (r) return r(s, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = s;
}
var p = o[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return i(e[c][1][t] || t);
}, p, p.exports, t, e, o, n);
}
return o[c].exports;
}
for (var r = "function" == typeof __require && __require, c = 0; c < n.length; c++) i(n[c]);
return i;
}({
LaunchAdComponent: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "f6cbdupA+NJZ5j7hPFTzwro", "LaunchAdComponent");
var n, i = this && this.__extends || (n = function(t, e) {
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
}), r = this && this.__decorate || function(t, e, o, n) {
var i, r = arguments.length, c = r < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, o, n); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (c = (r < 3 ? i(c) : r > 3 ? i(e, o, c) : i(e, o)) || c);
return r > 3 && c && Object.defineProperty(e, o, c), c;
}, c = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, o = e && t[e], n = 0;
if (o) return o.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && n >= t.length && (t = void 0);
return {
value: t && t[n++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(o, "__esModule", {
value: !0
});
var a = cc._decorator, s = a.ccclass, u = a.property, p = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.skipButtonNode = null;
e.jumpButtonNode = null;
e._config = null;
e._showStartTime = 0;
e._maxDisplayTime = 0;
e._lastLogTime = 0;
return e;
}
e.prototype.start = function() {
this._config = hs.storage.getItem("LaunchBrandAd_NextConfig", null);
if (this._config) if (this.validateConfig(this._config)) {
this._showStartTime = Date.now();
var t = Number(this._config.adConfig.minDisplayTime) || 5;
this._maxDisplayTime = t + 5;
var e = this._config.adConfig.showSkipButton, o = this._config.adConfig.showJumpButton;
this.skipButtonNode && (this.skipButtonNode.active = e);
this.jumpButtonNode && (this.jumpButtonNode.active = o);
this.recordAdShow();
} else this.closeAd(); else this.closeAd();
};
e.prototype.validateConfig = function(t) {
var e, o;
if (!t.adConfig || "object" != typeof t.adConfig) return !1;
if (!t.frequency || "object" != typeof t.frequency) return !1;
try {
for (var n = c([ "minDisplayTime", "showSkipButton", "showJumpButton" ]), i = n.next(); !i.done; i = n.next()) {
var r = i.value;
if (void 0 === t.adConfig[r]) return !1;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (o = n.return) && o.call(n);
} finally {
if (e) throw e.error;
}
}
return !0;
};
e.prototype.recordAdShow = function() {
if (this._config && this._config.frequency) {
var t = Number(this._config.frequency.todayCount) || 0;
this._config.frequency.todayCount = t + 1;
this._config.frequency.lastShowDate = Date.now();
hs.storage.setItem("LaunchBrandAd_NextConfig", this._config);
}
};
e.prototype.trackAdShow = function() {
if (0 !== this._showStartTime && this._config && this._config.frequency) {
var t = Math.floor((Date.now() - this._showStartTime) / 1e3), e = {
views: this._config.frequency.todayCount || 0,
time: t
};
DS("usr_data_theme_splashad_show", e);
this._showStartTime = 0;
}
};
e.prototype.onJumpClick = function() {
this.trackJumpClick();
this.closeAd();
this.executeJump();
};
e.prototype.executeJump = function() {
if (this._config && this._config.adConfig) {
var t = (this._config.adConfig.jumpType || "web").toLowerCase(), e = this._config.adConfig.jumpUrl || "", o = this._config.adConfig.jumpAppId || "", n = this._config.adConfig.jumpBundleId || "";
switch (t) {
case "web":
if (!e) return;
this.openWebView(e);
break;

case "store":
this.openAppStore(o, n, e);
break;

case "deeplink":
if (!e) return;
this.openDeepLink(e);
}
}
};
e.prototype.openWebView = function(t) {
cc.sys.isNative ? hs.NativePlatformIOS.openUrl(t) : cc.sys.openURL(t);
};
e.prototype.openAppStore = function(t, e, o) {
cc.sys.isNative ? t && e && hs.NativePlatformIOS.openAppStore(t, e) : o && cc.sys.openURL(o);
};
e.prototype.openDeepLink = function() {};
e.prototype.trackJumpClick = function() {
DS("usr_data_theme_splashadjump_click");
};
e.prototype.onSkipClick = function() {
this.trackSkipClick();
this.closeAd();
};
e.prototype.closeAd = function() {
cc.isValid(this.node) && this.node.destroy();
};
e.prototype.trackSkipClick = function() {
DS("usr_data_theme_splashadskip_click");
};
e.prototype.update = function() {
if (0 !== this._showStartTime && 0 !== this._maxDisplayTime) {
(Date.now() - this._showStartTime) / 1e3 >= this._maxDisplayTime && this.closeAd();
}
};
e.prototype.onDestroy = function() {
this.trackAdShow();
};
r([ u(cc.Node) ], e.prototype, "skipButtonNode", void 0);
r([ u(cc.Node) ], e.prototype, "jumpButtonNode", void 0);
return r([ s, classMethodWatch() ], e);
}(hs.Component);
o.default = p;
cc._RF.pop();
}, {} ],
LaunchBrandAdDisplayTrait: [ function(t, e, o) {
"use strict";
cc._RF.push(e, "42b830TAT1OJ4Q7WXMZbU+P", "LaunchBrandAdDisplayTrait");
var n, i = this && this.__extends || (n = function(t, e) {
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
}), r = this && this.__decorate || function(t, e, o, n) {
var i, r = arguments.length, c = r < 3 ? e : null === n ? n = Object.getOwnPropertyDescriptor(e, o) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, o, n); else for (var a = t.length - 1; a >= 0; a--) (i = t[a]) && (c = (r < 3 ? i(c) : r > 3 ? i(e, o, c) : i(e, o)) || c);
return r > 3 && c && Object.defineProperty(e, o, c), c;
};
Object.defineProperty(o, "__esModule", {
value: !0
});
o.LaunchBrandAdDisplayTrait = void 0;
var c = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.data = function() {
return {
lastAdRestartTimes: -1
};
};
e.prototype.onActive = function(t) {
hs.tp.isLaunch_ProxyEnterGame(t) && this.calculateNextConfig();
};
e.prototype.checkRetention = function() {
return !0;
};
e.prototype.checkFrequency = function() {
return !0;
};
e.prototype.calculateNextConfig = function() {
var t, e, o, n, i = this.checkRetention(), r = this.checkFrequency(), c = TRAIT("LaunchBrandAdJumpTrait"), a = TRAIT("LaunchBrandAdSkipTrait"), s = TRAIT("LaunchBrandAdFrequencyTrait"), u = hs.storage.getItem("LaunchBrandAd_NextConfig", null), p = (null == s ? void 0 : s.getTodayShowCount()) || 0, f = (null === (t = null == u ? void 0 : u.frequency) || void 0 === t ? void 0 : t.lastShowDate) || 0, l = Number(null == s ? void 0 : s.props.showTimes) || 3, h = {
shouldShow: i && r,
adConfig: {
minDisplayTime: Number(this.props.showTime) || 2,
showSkipButton: null !== (e = null == a ? void 0 : a.active) && void 0 !== e && e,
showJumpButton: null !== (o = null == c ? void 0 : c.active) && void 0 !== o && o,
jumpType: null == c ? void 0 : c.props.type,
jumpUrl: null == c ? void 0 : c.props.content,
jumpAppId: null === (n = null == c ? void 0 : c.props.appid) || void 0 === n ? void 0 : n.toString(),
jumpBundleId: null == c ? void 0 : c.props.bundleid
},
frequency: {
todayCount: p,
lastShowDate: f,
dailyLimit: l
},
lastCalculateTime: Date.now()
};
hs.storage.setItem("LaunchBrandAd_NextConfig", h);
};
return r([ classId("LaunchBrandAdDisplayTrait"), classMethodWatch() ], e);
}(Trait);
o.LaunchBrandAdDisplayTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "LaunchBrandAdDisplayTrait", "LaunchAdComponent" ]);
//# sourceMappingURL=index.js.map
