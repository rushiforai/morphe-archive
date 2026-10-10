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
var u = i[a] = {
exports: {}
};
e[a][0].call(u.exports, function(t) {
return r(e[a][1][t] || t);
}, u, u.exports, t, e, i, s);
}
return i[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < s.length; a++) r(s[a]);
return r;
}({
ClassGameOverMsgTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "87e01ghSA9Lb6iLC84KdJWx", "ClassGameOverMsgTrait");
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
}, a = this && this.__awaiter || function(t, e, i, s) {
return new (i || (i = Promise))(function(r, n) {
function a(t) {
try {
c(s.next(t));
} catch (t) {
n(t);
}
}
function o(t) {
try {
c(s.throw(t));
} catch (t) {
n(t);
}
}
function c(t) {
t.done ? r(t.value) : (e = t.value, e instanceof i ? e : new i(function(t) {
t(e);
})).then(a, o);
var e;
}
c((s = s.apply(t, e || [])).next());
});
}, o = this && this.__generator || function(t, e) {
var i, s, r, n, a = {
label: 0,
sent: function() {
if (1 & r[0]) throw r[1];
return r[1];
},
trys: [],
ops: []
};
return n = {
next: o(0),
throw: o(1),
return: o(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function o(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(n) {
if (i) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (i = 1, s && (r = 2 & n[0] ? s.return : n[0] ? s.throw || ((r = s.return) && r.call(s), 
0) : s.next) && !(r = r.call(s, n[1])).done) return r;
(s = 0, r) && (n = [ 2 & n[0], r.value ]);
switch (n[0]) {
case 0:
case 1:
r = n;
break;

case 4:
a.label++;
return {
value: n[1],
done: !1
};

case 5:
a.label++;
s = n[1];
n = [ 0 ];
continue;

case 7:
n = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(r = a.trys, r = r.length > 0 && r[r.length - 1]) && (6 === n[0] || 2 === n[0])) {
a = 0;
continue;
}
if (3 === n[0] && (!r || n[1] > r[0] && n[1] < r[3])) {
a.label = n[1];
break;
}
if (6 === n[0] && a.label < r[1]) {
a.label = r[1];
r = n;
break;
}
if (r && a.label < r[2]) {
a.label = r[2];
a.ops.push(n);
break;
}
r[2] && a.ops.pop();
a.trys.pop();
continue;
}
n = e.call(t, a);
} catch (t) {
n = [ 6, t ];
s = 0;
} finally {
i = r = 0;
}
if (5 & n[0]) throw n[1];
return {
value: n[0] ? n[1] : void 0,
done: !0
};
}
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.ClassGameOverMsgTrait = void 0;
var c = t("./ClassGameOverMsgView"), l = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._parent = null;
e._classDataStatisticsInfo = null;
e._currentEliminate3 = 0;
e._curTime = 0;
return e;
}
e.prototype.onActive = function(t) {
var e, i;
hs.tp.isClassFailShowAction(t) && this.showEntranceBtn(t, !0);
hs.tp.isClassWinShowAction(t) && this.showEntranceBtn(t, !1);
if (hs.tp.isClassDataStatistics_ProxyOnTouchEnd(t)) {
var s = (null === (e = t.args[0]) || void 0 === e ? void 0 : e.state).eliminateCount;
if (Number(s) >= 3) {
this._currentEliminate3++;
hs.storage.setItem("classCurrentEliminate3", this._currentEliminate3);
}
}
if (hs.tp.isClassGameOver_GameEnd_ProxyOnGameEnd(t)) {
this.saveTimeData();
var r = hs.classDataStatisticsInfo.dataStatisticsInfo;
this._classDataStatisticsInfo = JSON.parse(JSON.stringify(r));
hs.storage.setItem("classCurrentComboMaxNum", (null === (i = this._classDataStatisticsInfo) || void 0 === i ? void 0 : i.comboMaxNum) || 0);
this.saveComboAndEliminate3Data();
}
if (hs.tp.isClassGame_ProxyNewGameInit(t)) {
this.hideEntranceBtn();
this._currentEliminate3 = 0;
this._curTime = 0;
hs.storage.setItem("classCurrentEliminate3", 0);
hs.storage.setItem("classCurrentComboMaxNum", 0);
hs.storage.setItem("classCurrentGameTime", 0);
}
};
e.prototype.showEntranceBtn = function(t, e) {
var i, s, r = this, n = null;
n = e ? null === (i = t.target) || void 0 === i ? void 0 : i.node : null === (s = t.target) || void 0 === s ? void 0 : s.node;
if (cc.isValid(n)) {
this._parent = n;
if (hs.classGameOverGameInfo.score < this.props.limitScore) ; else {
var a = n.getChildByName("GameOverMsgEntrance");
if (cc.isValid(a)) {
this.setEntranceRedPoint(a, !0);
a.position = this.getEntranceBtnPos(a, e);
a.active = !0;
} else hs.ResLoader.loadByBundle("ClassGameOverMsgTrait", "prefabs/MsgEntranceItem", cc.Prefab, function(t, i) {
if (!t && cc.isValid(i) && cc.isValid(n)) {
var s = cc.instantiate(i);
s.name = "GameOverMsgEntrance";
s.position = r.getEntranceBtnPos(s, e);
n.addChild(s);
r.setEntranceRedPoint(s, !0);
s.active = !0;
s.on(cc.Node.EventType.TOUCH_END, r.onTouchEnd, r);
}
});
}
}
};
e.prototype.hideEntranceBtn = function() {
if (cc.isValid(this._parent)) {
var t = this._parent.getChildByName("GameOverMsgEntrance");
cc.isValid(t) && (t.active = !1);
}
};
e.prototype.onTouchEnd = function() {
return a(this, void 0, void 0, function() {
var t, e, i;
return o(this, function(s) {
switch (s.label) {
case 0:
t = this._parent.getChildByName("GameOverMsgEntrance");
cc.isValid(t) && this.setEntranceRedPoint(t, !1);
return [ 4, hs.UI.show(hs.PrefabConfig.ClassGameOverMsgView, hs.tipLayer) ];

case 1:
e = s.sent();
if (cc.isValid(e)) {
i = e.getComponent(c.default);
cc.isValid(i) && i.setState({
dataList: this.getMsgList()
});
}
return [ 2 ];
}
});
});
};
e.prototype.setEntranceRedPoint = function(t, e) {
if (cc.isValid(t)) {
var i = t.getChildByName("red");
if (cc.isValid(i)) if (e) {
var s = hs.storage.getItem("classGameOverMsgEntranceRedPoint", !0);
if (!s) {
hs.storage.getItem("classHighScore", 0);
if (hs.classGameOverGameInfo.score >= hs.classGameOverGameInfo.highScore) {
s = !0;
hs.storage.setItem("classGameOverMsgEntranceRedPoint", s);
}
}
i.active = s;
} else {
hs.storage.setItem("classGameOverMsgEntranceRedPoint", !1);
i.active = !1;
}
}
};
e.prototype.getEntranceBtnPos = function(t) {
var e, i = new cc.Vec3(220, 652), s = t.getContentSize(), r = t.getComponent(cc.Widget);
r.enabled = !0;
var n = !1;
(null === (e = TRAIT("GameReplayCtrlTrait")) || void 0 === e ? void 0 : e.active) && hs.playbackInfo.lastRecordData && (n = !0);
if (n) {
r.top = 175;
r.right = 217;
setTimeout(function() {
cc.isValid(r) && r.updateAlignment();
}, 0);
return new cc.Vec3(i.x + s.width / 2 + 10, i.y);
}
r.top = 175;
r.right = 36.87;
setTimeout(function() {
cc.isValid(r) && r.updateAlignment();
}, 0);
return i;
};
e.prototype.saveTimeData = function() {
if (!(hs.classScoreInfo.score < this.props.limitScore)) {
this._curTime = hs.classTimerInfo.spendTime;
this._curTime > 0 && hs.storage.setItem("classCurrentGameTime", this._curTime);
var t = hs.storage.getItem("classHistoryGameTime", 0);
this._curTime > t && hs.storage.setItem("classHistoryGameTime", this._curTime);
}
};
e.prototype.saveComboAndEliminate3Data = function() {
var t, e = hs.storage.getItem("classHistoryComboMaxNum", -1), i = hs.storage.getItem("classHistoryEliminate3", -1), s = (null === (t = this._classDataStatisticsInfo) || void 0 === t ? void 0 : t.comboMaxNum) || 0;
s > e && hs.storage.setItem("classHistoryComboMaxNum", s);
this._currentEliminate3 > i && hs.storage.setItem("classHistoryEliminate3", this._currentEliminate3);
};
e.prototype.getMsgList = function() {
var t, e = [], i = hs.classGameOverGameInfo.score, s = hs.classGameOverGameInfo.highScore, r = (null === (t = this._classDataStatisticsInfo) || void 0 === t ? void 0 : t.comboMaxNum) || hs.storage.getItem("classCurrentComboMaxNum", 0), n = hs.storage.getItem("classHistoryComboMaxNum", -1), a = this._currentEliminate3 || hs.storage.getItem("classCurrentEliminate3", 0), o = hs.storage.getItem("classHistoryEliminate3", -1), c = this._curTime > 0 ? this._curTime : hs.storage.getItem("classCurrentGameTime", 0), l = hs.storage.getItem("classHistoryGameTime", 0);
if (n < 0 && o < 0) {
s = -1;
l = -1;
}
if (i >= s && s > 0) {
e.push({
type: "SCORE",
historyValue: i,
curValue: i
});
e.push({
type: "COMBO",
historyValue: r,
curValue: r
});
e.push({
type: "MATCH_3",
historyValue: a,
curValue: a
});
e.push({
type: "USE_TIME",
historyValue: c,
curValue: c
});
} else {
e.push({
type: "SCORE",
historyValue: s,
curValue: i
});
e.push({
type: "COMBO",
historyValue: n,
curValue: r
});
e.push({
type: "MATCH_3",
historyValue: o,
curValue: a
});
e.push({
type: "USE_TIME",
historyValue: l,
curValue: c
});
}
return e;
};
return n([ classId("ClassGameOverMsgTrait") ], e);
}(Trait);
i.ClassGameOverMsgTrait = l;
cc._RF.pop();
}, {
"./ClassGameOverMsgView": "ClassGameOverMsgView"
} ],
ClassGameOverMsgView: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "0a94aj7l0hAtq/qDXgAxa3a", "ClassGameOverMsgView");
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
var a = cc._decorator, o = a.ccclass, c = a.property, l = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.tempNode = null;
e.nodeScrollView = null;
e._scrollView = null;
return e;
}
e.prototype.onLoad = function() {
this._scrollView = this.nodeScrollView.getComponent(cc.ScrollView);
this.tempNode.active = !1;
};
e.prototype.onEnable = function() {
this._scrollView.content.children.forEach(function(t) {
t.active = !1;
});
};
e.prototype.render = function() {
this.refreshMsgList();
};
e.prototype.onClickClose = function() {
hs.UI.hide(this.node);
};
e.prototype.onClickOk = function() {
hs.UI.hide(this.node);
};
e.prototype.refreshMsgList = function() {
var t = this.state.dataList;
if (!t || t.length <= 0) this.nodeScrollView.active = !1; else for (var e = this._scrollView.content.children.length, i = 0; i < t.length; i++) if (i < e) {
var s = this._scrollView.content.children[i];
this.refreshItem(s, t[i]);
} else {
s = cc.instantiate(this.tempNode);
if (cc.isValid(s)) {
this._scrollView.content.addChild(s);
this.refreshItem(s, t[i]);
}
}
};
e.prototype.refreshItem = function(t, e) {
var i, s, r;
if (e && cc.isValid(t)) {
var n = null === (i = t.getChildByName("title")) || void 0 === i ? void 0 : i.getComponent(cc.Label);
cc.isValid(n) && (n.string = {
SCORE: "Score",
COMBO: "Combo",
MATCH_3: "Match 3+",
USE_TIME: "Use Time"
}[e.type]);
var a = null === (s = t.getChildByName("historyValue")) || void 0 === s ? void 0 : s.getComponent(cc.Label);
cc.isValid(a) && (e.historyValue < 0 ? a.string = "--" : "USE_TIME" == e.type ? a.string = this.getFormatTime(e.historyValue) : a.string = "" + e.historyValue);
var o = null === (r = t.getChildByName("currentValue")) || void 0 === r ? void 0 : r.getComponent(cc.Label);
cc.isValid(o) && ("USE_TIME" == e.type ? o.string = this.getFormatTime(e.curValue) : o.string = "" + e.curValue);
t.active = !0;
}
};
e.prototype.getFormatTime = function(t) {
t > 36e5 && (t = 36e5);
var e = Math.floor(t / 6e4), i = Math.floor(t % 6e4 / 1e3);
return (e < 10 ? "0" + e : e) + ":" + (i < 10 ? "0" + i : i);
};
n([ c(cc.Node) ], e.prototype, "tempNode", void 0);
n([ c(cc.Node) ], e.prototype, "nodeScrollView", void 0);
return n([ o ], e);
}(hs.Component);
i.default = l;
cc._RF.pop();
}, {} ]
}, {}, [ "ClassGameOverMsgTrait", "ClassGameOverMsgView" ]);
//# sourceMappingURL=index.js.map
