window.__require = function e(t, r, n) {
function o(c, s) {
if (!r[c]) {
if (!t[c]) {
var a = c.split("/");
a = a[a.length - 1];
if (!t[a]) {
var u = "function" == typeof __require && __require;
if (!s && u) return u(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = a;
}
var p = r[c] = {
exports: {}
};
t[c][0].call(p.exports, function(e) {
return o(t[c][1][e] || e);
}, p, p.exports, e, t, r, n);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < n.length; c++) o(n[c]);
return o;
}({
LongPressEntryTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "0409cC0Q+VHQLUzUm5N4iDW", "LongPressEntryTrait");
var n, o = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, n) {
var o, i = arguments.length, c = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(e, t, r, n); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (c = (i < 3 ? o(c) : i > 3 ? o(t, r, c) : o(t, r)) || c);
return i > 3 && c && Object.defineProperty(t, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.LongPressEntryTrait = void 0;
var c = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._jumpPage = 0;
return t;
}
t.prototype.onCreate = function() {
var e = this;
hs.onNativeReponse("onShortMenuDidClicked", function(t) {
e._jumpPage = t.page;
});
};
t.prototype.onActive = function(e) {
if (hs.tp.isLaunchChangeLaunchScene(e) && (1 == this._jumpPage || 2 == this._jumpPage && hs.launchInfo.openChapterModule() && !hs.homePageInfo.checkNeedGoNextPeriods())) {
e.args[0] = 1 === this._jumpPage ? "class" : "chapter";
e.returnState = !0;
DS("s_home_screen_click", {
GameType: 1 === this._jumpPage ? 0 : 2
});
}
if (hs.tp.isLaunchNativeLongPressMenuShow(e)) {
e.replace = !0;
this._jumpPage = hs.NativePlatformIOS.jumpToGamePage("1");
}
};
return i([ classId("LongPressEntryTrait") ], t);
}(Trait);
r.LongPressEntryTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "LongPressEntryTrait" ]);
//# sourceMappingURL=index.js.map
