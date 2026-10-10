window.__require = function t(e, r, o) {
function n(c, a) {
if (!r[c]) {
if (!e[c]) {
var s = c.split("/");
s = s[s.length - 1];
if (!e[s]) {
var u = "function" == typeof __require && __require;
if (!a && u) return u(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + c + "'");
}
c = s;
}
var p = r[c] = {
exports: {}
};
e[c][0].call(p.exports, function(t) {
return n(e[c][1][t] || t);
}, p, p.exports, t, e, r, o);
}
return r[c].exports;
}
for (var i = "function" == typeof __require && __require, c = 0; c < o.length; c++) n(o[c]);
return n;
}({
AddScoreStopTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "fe7abyipqJFaoGHIrW/RGvP", "AddScoreStopTrait");
var o, n = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
})(t, e);
}, function(t, e) {
o(t, e);
function r() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (r.prototype = e.prototype, new r());
}), i = this && this.__decorate || function(t, e, r, o) {
var n, i = arguments.length, c = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) c = Reflect.decorate(t, e, r, o); else for (var a = t.length - 1; a >= 0; a--) (n = t[a]) && (c = (i < 3 ? n(c) : i > 3 ? n(e, r, c) : n(e, r)) || c);
return i > 3 && c && Object.defineProperty(e, r, c), c;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddScoreStopTrait = void 0;
var c = function(t) {
n(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
hs.tp.isClassFailOnLoad(t) && (r = t.target).node.getChildByName("touchNode").on(cc.Node.EventType.TOUCH_START, this.touchStartFail.bind(this, r), this);
if (hs.tp.isClassFailIsPlayScore(t)) {
var e = (r = t.target).curScore.string == "" + r.state.score;
t.returnValue = !e;
t.returnState = !0;
}
hs.tp.isClassWinOnLoad(t) && (r = t.target).node.getChildByName("touchNode").on(cc.Node.EventType.TOUCH_START, this.touchStartWin.bind(this, r), this);
if (hs.tp.isClassWinIsPlayScore(t)) {
var r;
e = (r = t.target).highScore.string == "" + r.state.highScore;
t.returnValue = !e;
t.returnState = !0;
}
};
e.prototype.touchStartWin = function(t) {
if ((!t.highScore || 255 == t.highScore.node.opacity) && t.highScore.string != "" + t.state.highScore) {
cc.Tween.stopAllByTag(t.ShowTweenTag);
t.timeOver();
}
};
e.prototype.touchStartFail = function(t) {
if ((!t.curScore || 255 == t.curScore.node.opacity) && t.curScore.string != "" + t.state.score) {
cc.Tween.stopAllByTag(t.ShowTweenTag);
t.timeOver();
}
};
return i([ classId("AddScoreStopTrait") ], e);
}(Trait);
r.AddScoreStopTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "AddScoreStopTrait" ]);
//# sourceMappingURL=index.js.map
