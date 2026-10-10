window.__require = function t(e, i, s) {
function r(a, o) {
if (!i[a]) {
if (!e[a]) {
var c = a.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!o && l) return l(c, !0);
if (n) return n(c, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = c;
}
var p = i[a] = {
exports: {}
};
e[a][0].call(p.exports, function(t) {
return r(e[a][1][t] || t);
}, p, p.exports, t, e, i, s);
}
return i[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < s.length; a++) r(s[a]);
return r;
}({
ResultSpeedTextTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "d6c0c87zutHmZScxvr+u4B9", "ResultSpeedTextTrait");
var s, r = this && this.__extends || (s = function(t, e) {
return (s = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
s(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), n = this && this.__decorate || function(t, e, i, s) {
var r, n = arguments.length, a = n < 3 ? e : null === s ? s = Object.getOwnPropertyDescriptor(e, i) : s;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, i, s); else for (var o = t.length - 1; o >= 0; o--) (r = t[o]) && (a = (n < 3 ? r(a) : n > 3 ? r(e, i, a) : r(e, i)) || a);
return n > 3 && a && Object.defineProperty(e, i, a), a;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ResultSpeedTextTrait = void 0;
var a = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._statisticsInfo = null;
return e;
}
e.prototype.onActive = function(t) {
hs.tp.isClassDataStatistics_ProxyOnDataClear(t) && (this._statisticsInfo = hs.classDataStatisticsInfo.dataStatisticsInfo);
hs.tp.isClassWinShowBtn(t) && this.showSpeedText(t);
hs.tp.isClassFailShowBtn(t) && this.showSpeedText(t);
hs.tp.isClassWinResetBtnState(t) && this.resetTextState(t);
hs.tp.isClassFailResetBtnState(t) && this.resetTextState(t);
};
e.prototype.showSpeedText = function(t) {
var e = this, i = this.calculateSpeedValue();
if (i < this.props.rLimitValue) ; else {
var s = t.target, r = s.node, n = s.playBtn;
if (cc.isValid(r)) {
var a = r.getChildByName("resultSpeedText");
if (cc.isValid(a)) {
this.setContent(a, i);
this.playTextAni(a);
} else hs.ResLoader.loadByBundle("ResultSpeedTextTrait", "prefabs/ResultSpeedText", cc.Prefab, function(t, s) {
if (t) ; else if (cc.isValid(s) && cc.isValid(r) && cc.isValid(n)) {
var a = n.node, o = cc.instantiate(s);
if (o && cc.isValid(o) && cc.isValid(a)) {
o.position = new cc.Vec3(a.x, a.y - a.height / 2 - o.height / 2 - 25, 0);
o.name = "resultSpeedText";
e.setContent(o, i);
e.playTextAni(o);
r.addChild(o);
}
}
});
}
}
};
e.prototype.setContent = function(t, e) {
if (cc.isValid(t)) {
var i = this.substitute(this.props.content, e, this.props.second);
if (i && !(i.length <= 0)) {
var s = t.getComponent(cc.RichText);
cc.isValid(s) && (s.string = i);
}
}
};
e.prototype.playTextAni = function(t) {
if (cc.isValid(t)) {
t.scale = 0;
t.opacity = 0;
cc.Tween.stopAllByTarget(t);
cc.tween(t).delay(.2).to(.2, {
scale: 1,
opacity: 255
}, {
easing: cc.easing.backOut
}).delay(1).call(function() {}).start();
}
};
e.prototype.resetTextState = function(t) {
var e = t.target.node;
if (cc.isValid(e)) {
var i = e.getChildByName("resultSpeedText");
if (cc.isValid(i)) {
i.scale = 0;
i.opacity = 0;
}
}
};
e.prototype.substitute = function(t) {
for (var e = [], i = 1; i < arguments.length; i++) e[i - 1] = arguments[i];
if (null == t) return "";
var s, r = e.length;
1 == r && e[0] instanceof Array ? r = (s = e[0]).length : s = e;
for (var n = 0; n < r; n++) t = t.replace(new RegExp("\\{" + n + "\\}", "g"), s[n]);
return t;
};
e.prototype.calculateSpeedValue = function() {
if (!this._statisticsInfo) return 0;
var t = this._statisticsInfo.eliminateRows + this._statisticsInfo.eliminateCols, e = hs.classGameInfo.gameTime / 1e3;
if (e <= 0 || t <= 0) return 0;
var i = t / (e / 3);
return Math.ceil(100 * i) / 100;
};
return n([ classId("ResultSpeedTextTrait") ], e);
}(t("../../../../../scripts/base/trait/Trait").Trait);
i.ResultSpeedTextTrait = a;
cc._RF.pop();
}, {
"../../../../../scripts/base/trait/Trait": void 0
} ]
}, {}, [ "ResultSpeedTextTrait" ]);
//# sourceMappingURL=index.js.map
