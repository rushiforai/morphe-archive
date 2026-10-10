window.__require = function e(t, n, o) {
function r(i, s) {
if (!n[i]) {
if (!t[i]) {
var p = i.split("/");
p = p[p.length - 1];
if (!t[p]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(p, !0);
if (a) return a(p, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = p;
}
var l = n[i] = {
exports: {}
};
t[i][0].call(l.exports, function(e) {
return r(t[i][1][e] || e);
}, l, l.exports, e, t, n, o);
}
return n[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) r(o[i]);
return r;
}({
MABGameLifecycleHandlerTrait: [ function(e, t, n) {
"use strict";
cc._RF.push(t, "1edde14UKlGA6cfVZJPJACA", "MABGameLifecycleHandlerTrait");
var o, r, a = this && this.__extends || (o = function(e, t) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n]);
})(e, t);
}, function(e, t) {
o(e, t);
function n() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n());
}), i = this && this.__decorate || function(e, t, n, o) {
var r, a = arguments.length, i = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, n, o); else for (var s = e.length - 1; s >= 0; s--) (r = e[s]) && (i = (a < 3 ? r(i) : a > 3 ? r(t, n, i) : r(t, n)) || i);
return a > 3 && i && Object.defineProperty(t, n, i), i;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.MABGameLifecycleHandlerTrait = void 0;
(function(e) {
e.GAME_GET_BLOCK_END = "game_get_block_end";
e.GAME_DATA_GAMEEND = "usr_data_game_end";
})(r || (r = {}));
var s = function(e) {
a(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onActive = function(e) {
var t, n, o, a;
hs.tp.isLaunchStartEnter(e) && this.startEnterGame();
hs.tp.isClassBoardSplashAnimation_ProxyOnGameStart(e) && (null === (n = null === (t = e.args[0]) || void 0 === t ? void 0 : t.data) || void 0 === n ? void 0 : n.newGame) && this.onClassNewGame(!0);
hs.tp.isChapterBoardSplashAnimation_ProxyOnGameStart(e) && (null === (a = null === (o = e.args[0]) || void 0 === o ? void 0 : o.data) || void 0 === a ? void 0 : a.newGame) && this.onChapterNewGame(!1);
if (hs.tp.isDot_ProxyMabDataHandler(e)) {
var i = e.args[0], s = e.args[1], p = hs.gameInfo.gameType == hs.GameType.Class;
i === r.GAME_GET_BLOCK_END && (p ? this.onClassRoundEnd(!0, s) : this.onChapterRoundEnd(!1, s));
i === r.GAME_DATA_GAMEEND && (p ? this.onClassGameEnd(!0, s) : this.onChapterGameEnd(!1, s));
}
hs.tp.isClassGame_Replay_ProxyOnGameReplay(e) && this.onClassReplay(!0);
hs.tp.isChapterGame_Replay_ProxyOnGameReplay(e) && this.onChapterReplay(!1);
};
t.prototype.startEnterGame = function() {};
t.prototype.onClassNewGame = function() {};
t.prototype.onChapterNewGame = function() {};
t.prototype.onClassRoundEnd = function() {};
t.prototype.onChapterRoundEnd = function() {};
t.prototype.onClassGameEnd = function() {};
t.prototype.onChapterGameEnd = function() {};
t.prototype.onClassReplay = function() {};
t.prototype.onChapterReplay = function() {};
return i([ classId("MABGameLifecycleHandlerTrait"), classMethodWatch() ], t);
}(Trait);
n.MABGameLifecycleHandlerTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "MABGameLifecycleHandlerTrait" ]);
//# sourceMappingURL=index.js.map
