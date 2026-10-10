window.__require = function t(e, i, o) {
function a(l, r) {
if (!i[l]) {
if (!e[l]) {
var s = l.split("/");
s = s[s.length - 1];
if (!e[s]) {
var c = "function" == typeof __require && __require;
if (!r && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + l + "'");
}
l = s;
}
var u = i[l] = {
exports: {}
};
e[l][0].call(u.exports, function(t) {
return a(e[l][1][t] || t);
}, u, u.exports, t, e, i, o);
}
return i[l].exports;
}
for (var n = "function" == typeof __require && __require, l = 0; l < o.length; l++) a(o[l]);
return a;
}({
$28640_f_mosaicTalkAfterAllLevelTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "26981+QJ15C74FGOeC4T+um", "$28640_f_mosaicTalkAfterAllLevelTrait");
var o, a = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), n = this && this.__decorate || function(t, e, i, o) {
var a, n = arguments.length, l = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, i, o); else for (var r = t.length - 1; r >= 0; r--) (a = t[r]) && (l = (n < 3 ? a(l) : n > 3 ? a(e, i, l) : a(e, i)) || l);
return n > 3 && l && Object.defineProperty(e, i, l), l;
}, l = this && this.__awaiter || function(t, e, i, o) {
return new (i || (i = Promise))(function(a, n) {
function l(t) {
try {
s(o.next(t));
} catch (t) {
n(t);
}
}
function r(t) {
try {
s(o.throw(t));
} catch (t) {
n(t);
}
}
function s(t) {
t.done ? a(t.value) : (e = t.value, e instanceof i ? e : new i(function(t) {
t(e);
})).then(l, r);
var e;
}
s((o = o.apply(t, e || [])).next());
});
}, r = this && this.__generator || function(t, e) {
var i, o, a, n, l = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return n = {
next: r(0),
throw: r(1),
return: r(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function r(t) {
return function(e) {
return s([ t, e ]);
};
}
function s(n) {
if (i) throw new TypeError("Generator is already executing.");
for (;l; ) try {
if (i = 1, o && (a = 2 & n[0] ? o.return : n[0] ? o.throw || ((a = o.return) && a.call(o), 
0) : o.next) && !(a = a.call(o, n[1])).done) return a;
(o = 0, a) && (n = [ 2 & n[0], a.value ]);
switch (n[0]) {
case 0:
case 1:
a = n;
break;

case 4:
l.label++;
return {
value: n[1],
done: !1
};

case 5:
l.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = l.ops.pop();
l.trys.pop();
continue;

default:
if (!(a = l.trys, a = a.length > 0 && a[a.length - 1]) && (6 === n[0] || 2 === n[0])) {
l = 0;
continue;
}
if (3 === n[0] && (!a || n[1] > a[0] && n[1] < a[3])) {
l.label = n[1];
break;
}
if (6 === n[0] && l.label < a[1]) {
l.label = a[1];
a = n;
break;
}
if (a && l.label < a[2]) {
l.label = a[2];
l.ops.push(n);
break;
}
a[2] && l.ops.pop();
l.trys.pop();
continue;
}
n = e.call(t, l);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
i = a = 0;
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
i.$28640_f_mosaicTalkAfterAllLevelTrait = void 0;
var s, c = "$28640_f_mosaicTalkAfterAllLevelTrait";
(function(t) {
t[t.TRY_MORE = 0] = "TRY_MORE";
t[t.STANDARD = 1] = "STANDARD";
t[t.PERFECT = 2] = "PERFECT";
})(s || (s = {}));
var u = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.prefab = null;
e.jsonAsset = null;
e.fangaoTarvelArrData = null;
e.talkAudioClips = null;
e.talkAudioClipNames = null;
return e;
}
e.prototype.onActive = function(t) {
if (hs.tp.isChapterContentAllAnimationComplete(t)) {
var e = hs.chapterGameInfo.chapterNum, i = hs.chapterGameInfo.lastChapterNum;
if (e === hs.chapterGameInfo.chapterAllNum) {
var o = e === i;
this.isMatchCondition() && this.prepareToCreateView(o);
}
}
};
e.prototype.isMatchCondition = function() {
return !d.hasShowed() && !!d.isFirstTravel();
};
e.prototype.calculateTravelEvaluation = function() {
var t = (hs.chapterGameInfo.chapterAllNum || 1) / (hs.chapterGameInfo.gameNum || 1);
return t < .4 ? s.TRY_MORE : t < .6 ? s.STANDARD : s.PERFECT;
};
e.prototype.prepareToCreateView = function(t) {
return l(this, void 0, void 0, function() {
return r(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this.loadAllAsync() ];

case 1:
e.sent() && this.createView(t);
return [ 2 ];
}
});
});
};
e.prototype.createView = function(t) {
var e, i, o, a, n, l = this, r = Cinst(hs.ChapterList), s = Cinst(hs.ChapterContent), c = null == s ? void 0 : s.itemContainer, u = null == s ? void 0 : s.scroll, h = null === (e = null == r ? void 0 : r.node) || void 0 === e ? void 0 : e.children[(null === (o = null === (i = null == r ? void 0 : r.node) || void 0 === i ? void 0 : i.children) || void 0 === o ? void 0 : o.length) - 1];
if (cc.isValid(c) && cc.isValid(u) && cc.isValid(h)) {
this.rootScriptParams = {
parentScrollView: u,
originalMosaicParent: c,
siblingNode: h,
canScroll: !0,
isStart: t
};
var f = null !== (n = null === (a = this.props) || void 0 === a ? void 0 : a.showDelayTime) && void 0 !== n ? n : 1.75, p = this.rootScriptParams.isStart ? 0 : f;
cc.tween(this.rootScriptParams.parentScrollView).delay(p).call(function() {
var t, e, i, o, a, n;
if (cc.isValid(l.rootScriptParams) && cc.isValid(l.rootScriptParams.parentScrollView) && cc.isValid(l.rootScriptParams.originalMosaicParent) && cc.isValid(l.rootScriptParams.siblingNode)) {
d.setHasShowed();
var r = cc.instantiate(l.prefab);
r.parent = l.rootScriptParams.siblingNode.parent;
r.setSiblingIndex(l.rootScriptParams.siblingNode.getSiblingIndex() + 1);
r.getComponent(hs.Component).setState({
parentScrollView: l.rootScriptParams.parentScrollView,
originalMosaicParent: l.rootScriptParams.originalMosaicParent,
siblingNode: l.rootScriptParams.siblingNode,
canScroll: l.rootScriptParams.canScroll,
isStart: l.rootScriptParams.isStart,
talkAudioClipNames: l.talkAudioClipNames,
talkAudioClips: l.talkAudioClips,
talkWords: d.getTalkWords(),
scrollToBottomDuration: null !== (e = null === (t = l.props) || void 0 === t ? void 0 : t.scrollToBottomDuration) && void 0 !== e ? e : .2,
talkBoxFadeOutAfterDuration: null !== (o = null === (i = l.props) || void 0 === i ? void 0 : i.talkBoxFadeOutAfterDuration) && void 0 !== o ? o : .33,
talkIntervalTime: null !== (n = null === (a = l.props) || void 0 === a ? void 0 : a.talkIntervalTime) && void 0 !== n ? n : 0
});
}
}).start();
}
};
e.prototype.loadAllAsync = function() {
return l(this, void 0, Promise, function() {
var t, e, i, o, a, n, l, s;
return r(this, function(r) {
switch (r.label) {
case 0:
if (this.fangaoTarvelArrData && 0 !== this.fangaoTarvelArrData.length) return [ 3, 2 ];
t = this;
return [ 4, this.loadTravelLevelDataResource() ];

case 1:
t.fangaoTarvelArrData = r.sent();
r.label = 2;

case 2:
d.setFangaoTarvelArrData(this.fangaoTarvelArrData);
if (!d.isFanGaoTarvel()) return [ 2, !1 ];
if (this.prefab) return [ 3, 4 ];
e = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(c, "prefabs/MosaicTalk", cc.Prefab) ];

case 3:
e.prefab = r.sent();
r.label = 4;

case 4:
if (this.jsonAsset) return [ 3, 6 ];
i = this;
return [ 4, hs.ResLoader.asyncLoadByBundle(c, "datas/talkWords", cc.JsonAsset) ];

case 5:
i.jsonAsset = r.sent();
r.label = 6;

case 6:
o = this.calculateTravelEvaluation();
d.setData(this.jsonAsset, o);
if (this.talkAudioClips) return [ 3, 10 ];
this.talkAudioClips = [];
this.talkAudioClipNames = [];
a = d.getTalkMusic();
n = 0;
r.label = 7;

case 7:
if (!(n < a.length)) return [ 3, 10 ];
l = a[n];
return [ 4, hs.ResLoader.asyncLoadByBundle(c, "audios/talk/" + l, cc.AudioClip) ];

case 8:
s = r.sent();
this.talkAudioClips.push(s);
this.talkAudioClipNames.push(l);
r.label = 9;

case 9:
n++;
return [ 3, 7 ];

case 10:
return [ 2, !0 ];
}
});
});
};
e.prototype.loadTravelLevelDataResource = function() {
var t, e;
return l(this, void 0, Promise, function() {
var i, o;
return r(this, function(a) {
switch (a.label) {
case 0:
i = [];
return [ 4, hs.ResLoader.asyncLoadByBundle(c, "datas/NoTheme96Config_new", cc.JsonAsset) ];

case 1:
if (o = a.sent()) try {
i = null !== (e = null === (t = null == o ? void 0 : o.json) || void 0 === t ? void 0 : t.arr) && void 0 !== e ? e : [];
} catch (t) {}
return [ 2, i ];
}
});
});
};
return n([ classId("$28640_f_mosaicTalkAfterAllLevelTrait") ], e);
}(Trait);
i.$28640_f_mosaicTalkAfterAllLevelTrait = u;
var d = function() {
function t() {}
t.setData = function(t, e) {
var i, o, a, n, l = null;
try {
l = t.json;
} catch (t) {}
var r = "standard";
switch (e) {
case s.TRY_MORE:
r = "multiple";
break;

case s.STANDARD:
r = "standard";
break;

case s.PERFECT:
r = "perfect";
}
var c = null !== (i = null == l ? void 0 : l[r]) && void 0 !== i ? i : null;
hs.multiLangInfo.checkLangIsChinese() ? this.talkWords = null !== (o = null == c ? void 0 : c.cn) && void 0 !== o ? o : [] : this.talkWords = null !== (a = null == c ? void 0 : c.en) && void 0 !== a ? a : [];
this.talkMusic = null !== (n = null == c ? void 0 : c.music) && void 0 !== n ? n : [];
};
t.setFangaoTarvelArrData = function(t) {
this.fangaoTarvelArrData = t;
};
t.getTalkWords = function() {
return this.talkWords;
};
t.getTalkMusic = function() {
return this.talkMusic;
};
t.hasShowed = function() {
return "true" === storage.getItem(this.HAS_SHOWED_KEY);
};
t.setHasShowed = function() {
storage.setItem(this.HAS_SHOWED_KEY, "true");
};
t.isFirstTravel = function() {
return 1 === storage.getItem("chapterPeriodsIndex", 1);
};
t.isFanGaoTarvel = function() {
var t = hs.chapterConfigInfo.chapterListCfg;
if (!t || !this.fangaoTarvelArrData || t.length !== this.fangaoTarvelArrData.length) return !1;
for (var e = 0; e < t.length; e++) if (!t[e] || !this.fangaoTarvelArrData[e] || t[e].length !== this.fangaoTarvelArrData[e].length) return !1;
for (e = 0; e < t.length; e++) for (var i = 0; i < t[e].length; i++) if (t[e][i] !== this.fangaoTarvelArrData[e][i]) return !1;
return !0;
};
t.talkWords = null;
t.talkMusic = null;
t.fangaoTarvelArrData = null;
t.HAS_SHOWED_KEY = "28640_f_mosaicTalkAfterAllLevel_hasShowed";
return t;
}();
cc._RF.pop();
}, {} ],
MosaicTalkAfterAllLevelView: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "63ff6a659BNo5vN0o+sxfEk", "MosaicTalkAfterAllLevelView");
var o, a = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), n = this && this.__decorate || function(t, e, i, o) {
var a, n = arguments.length, l = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, i, o); else for (var r = t.length - 1; r >= 0; r--) (a = t[r]) && (l = (n < 3 ? a(l) : n > 3 ? a(e, i, l) : a(e, i)) || l);
return n > 3 && l && Object.defineProperty(e, i, l), l;
}, l = this && this.__awaiter || function(t, e, i, o) {
return new (i || (i = Promise))(function(a, n) {
function l(t) {
try {
s(o.next(t));
} catch (t) {
n(t);
}
}
function r(t) {
try {
s(o.throw(t));
} catch (t) {
n(t);
}
}
function s(t) {
t.done ? a(t.value) : (e = t.value, e instanceof i ? e : new i(function(t) {
t(e);
})).then(l, r);
var e;
}
s((o = o.apply(t, e || [])).next());
});
}, r = this && this.__generator || function(t, e) {
var i, o, a, n, l = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
};
return n = {
next: r(0),
throw: r(1),
return: r(2)
}, "function" == typeof Symbol && (n[Symbol.iterator] = function() {
return this;
}), n;
function r(t) {
return function(e) {
return s([ t, e ]);
};
}
function s(n) {
if (i) throw new TypeError("Generator is already executing.");
for (;l; ) try {
if (i = 1, o && (a = 2 & n[0] ? o.return : n[0] ? o.throw || ((a = o.return) && a.call(o), 
0) : o.next) && !(a = a.call(o, n[1])).done) return a;
(o = 0, a) && (n = [ 2 & n[0], a.value ]);
switch (n[0]) {
case 0:
case 1:
a = n;
break;

case 4:
l.label++;
return {
value: n[1],
done: !1
};

case 5:
l.label++;
o = n[1];
n = [ 0 ];
continue;

case 7:
n = l.ops.pop();
l.trys.pop();
continue;

default:
if (!(a = l.trys, a = a.length > 0 && a[a.length - 1]) && (6 === n[0] || 2 === n[0])) {
l = 0;
continue;
}
if (3 === n[0] && (!a || n[1] > a[0] && n[1] < a[3])) {
l.label = n[1];
break;
}
if (6 === n[0] && l.label < a[1]) {
l.label = a[1];
a = n;
break;
}
if (a && l.label < a[2]) {
l.label = a[2];
l.ops.push(n);
break;
}
a[2] && l.ops.pop();
l.trys.pop();
continue;
}
n = e.call(t, l);
} catch (t) {
n = [ 6, t ];
o = 0;
} finally {
i = a = 0;
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
var s = cc._decorator, c = s.ccclass, u = s.property, d = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.talkAnimation = null;
e.talkBoxView = null;
e.container = null;
e.talkIndex = 0;
e.isTalking = !1;
return e;
}
e.prototype.onSkipBtnClick = function() {
this.isTalking && this.talkBoxView.setState({
isSkipBtnClick: !0
});
};
e.prototype.render = function() {
this.onShow(this.state);
};
e.prototype.onShow = function(t) {
var e, i = this;
this.talkIndex = 0;
this.talkBoxView.node.active = !1;
this.isTalking = !1;
this.talkAnimation.node.active = !1;
var o = null !== (e = null == t ? void 0 : t.scrollToBottomDuration) && void 0 !== e ? e : .2, a = (null == t ? void 0 : t.canScroll) ? o : 0;
(null == t ? void 0 : t.canScroll) && this.scrollToBottom(a);
this.scheduleOnce(function() {
cc.isValid(i) && i.showAfterScroll(t);
}, a);
};
e.prototype.showAfterScroll = function(t) {
var e = this;
if (cc.isValid(null == t ? void 0 : t.parentScrollView)) {
this.alignContainer(t);
this.originalMosaicNodeHide();
this.talkAnimation.node.active = !0;
this.talkAnimation.playAnimation("in", 1);
h.playShowMusic();
cc.tween(this.node).delay(3.25).call(function() {
var t;
if (cc.isValid(null === (t = null == e ? void 0 : e.talkAnimation) || void 0 === t ? void 0 : t.node)) {
e.isTalking = !0;
e.showNextTalk();
}
}).start();
}
};
e.prototype.alignContainer = function(t) {
for (var e = null == t ? void 0 : t.originalMosaicParent, i = e.children.length, o = 0, a = 0, n = 0; n < i; n++) {
var l = e.children[n];
o += l.x;
a += l.y + l.height / 2;
}
var r = o / i, s = a / i;
s += 28;
var c = e.convertToWorldSpaceAR(cc.v2(r, s)), u = this.container.parent.convertToNodeSpaceAR(c);
this.container.setPosition(u);
this.container.setScale(e.scale);
};
e.prototype.showNextTalk = function() {
var t, e, i, o, a, n, l, r, s, c, u, d, f, p, v, k, _ = this;
this.unscheduleAllCallbacks();
this.talkAnimation.removeEventListener(dragonBones.EventObject.COMPLETE);
if (null === (t = this.state) || void 0 === t || !t.talkWords || this.talkIndex >= (null === (e = this.state) || void 0 === e ? void 0 : e.talkWords.length)) this.onHide(); else {
if (0 === this.talkIndex) {
this.talkAnimation.playAnimation("init", 0);
this.talkBoxView.node.active = !0;
}
var m = null !== (a = null === (o = null === (i = this.state) || void 0 === i ? void 0 : i.talkAudioClips) || void 0 === o ? void 0 : o[this.talkIndex]) && void 0 !== a ? a : null, A = null !== (r = null === (l = null === (n = this.state) || void 0 === n ? void 0 : n.talkAudioClipNames) || void 0 === l ? void 0 : l[this.talkIndex]) && void 0 !== r ? r : "", y = null !== (s = null == m ? void 0 : m.duration) && void 0 !== s ? s : 1, T = null !== (u = null === (c = this.state) || void 0 === c ? void 0 : c.isChinese) && void 0 !== u && u, g = null !== (p = null === (f = null === (d = this.state) || void 0 === d ? void 0 : d.talkWords) || void 0 === f ? void 0 : f[this.talkIndex]) && void 0 !== p ? p : "", w = y + (null !== (k = null === (v = this.state) || void 0 === v ? void 0 : v.talkIntervalTime) && void 0 !== k ? k : 0);
this.talkBoxView.setState({
talkWholeLine: g,
isChinese: T,
talkAudioDuration: w,
callback: function() {
_.showNextTalk();
}
});
0 === this.talkIndex ? this.talkBoxViewScaleIn_First() : this.talkBoxViewScaleIn_Loop();
h.playWordMusic(A);
this.talkIndex++;
}
};
e.prototype.talkBoxViewScaleIn_First = function() {
this.talkBoxView.node.scale = .5;
cc.tween(this.talkBoxView.node).to(.13, {
scale: 1
}).start();
};
e.prototype.talkBoxViewScaleIn_Loop = function() {
this.talkBoxView.node.scale = 1;
cc.tween(this.talkBoxView.node).to(.08, {
scale: 1.05
}).to(.17, {
scale: 1
}).union().start();
};
e.prototype.talkBoxViewScaleOut = function(t) {
cc.tween(this.talkBoxView.node).to(t, {
scale: 0
}).start();
};
e.prototype.onHide = function() {
var t, e, i = this;
this.isTalking = !1;
var o = null !== (e = null === (t = this.state) || void 0 === t ? void 0 : t.talkBoxFadeOutAfterDuration) && void 0 !== e ? e : 0;
this.talkBoxViewScaleOut(.13);
this.scheduleOnce(function() {
if (cc.isValid(i) && cc.isValid(i.talkAnimation)) {
i.talkAnimation.playAnimation("out", 1);
h.playHideMusic();
i.originalMosaicNodeShow(.67);
i.scheduleOnce(function() {
cc.isValid(i) && cc.isValid(i.node) && (i.node.active = !1);
}, .67);
}
}, .13 + o);
};
e.prototype.scrollToBottom = function(t) {
var e, i;
cc.isValid(null === (e = this.state) || void 0 === e ? void 0 : e.parentScrollView) && (null === (i = this.state) || void 0 === i || i.parentScrollView.scrollToBottom(t));
};
e.prototype.originalMosaicNodeShow = function(t) {
var e, i;
cc.isValid(null === (e = this.state) || void 0 === e ? void 0 : e.originalMosaicParent) && cc.tween(null === (i = this.state) || void 0 === i ? void 0 : i.originalMosaicParent).to(t, {
opacity: 255
}).start();
};
e.prototype.originalMosaicNodeHide = function() {
var t, e;
cc.isValid(null === (t = this.state) || void 0 === t ? void 0 : t.originalMosaicParent) && cc.tween(null === (e = this.state) || void 0 === e ? void 0 : e.originalMosaicParent).to(.42, {
opacity: 0
}).start();
};
e.prototype.onDestroy = function() {
if (cc.isValid(this)) {
this.unscheduleAllCallbacks();
cc.isValid(this.talkAnimation) && this.talkAnimation.removeEventListener(dragonBones.EventObject.COMPLETE);
}
};
n([ u(dragonBones.ArmatureDisplay) ], e.prototype, "talkAnimation", void 0);
n([ u(hs.Component) ], e.prototype, "talkBoxView", void 0);
n([ u(cc.Node) ], e.prototype, "container", void 0);
return n([ c ], e);
}(hs.Component);
i.default = d;
var h = function() {
function t() {}
t.playWordMusic = function(t) {
this.stopWordMusic();
this.wordAudioID = this.audioOptions[t];
hs.audioInfo.play(this.wordAudioID);
};
t.stopWordMusic = function() {
if (this.wordAudioID) {
hs.audioInfo.stop(this.wordAudioID);
this.wordAudioID = null;
}
};
t.playShowMusic = function() {
this.playBgEffect(this.audioOptions.mosaic_blur);
};
t.playHideMusic = function() {
this.stopWordMusic();
this.playBgEffect(this.audioOptions.mosaic_clear);
};
t.playBgEffect = function(t) {
return l(this, void 0, void 0, function() {
return r(this, function() {
if (t) {
this.bgAudioID = t;
hs.audioInfo.play(t);
}
return [ 2 ];
});
});
};
t.stopBgEffect = function() {
if (this.bgAudioID) {
hs.audioInfo.stop(this.bgAudioID);
this.bgAudioID = null;
}
};
t.stopAll = function() {
this.stopWordMusic();
this.stopBgEffect();
};
t.wordAudioID = null;
t.bgAudioID = null;
t.audioOptions = {
mosaic_blur: {
url: "audios/bg/mosaic_blur",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_clear: {
url: "audios/bg/mosaic_clear",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_bright: {
url: "audios/talk/mosaic_bright",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_carry: {
url: "audios/talk/mosaic_carry",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_courage: {
url: "audios/talk/mosaic_courage",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_did: {
url: "audios/talk/mosaic_did",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_doubt: {
url: "audios/talk/mosaic_doubt",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_go: {
url: "audios/talk/mosaic_go",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_leave: {
url: "audios/talk/mosaic_leave",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_look: {
url: "audios/talk/mosaic_look",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_made: {
url: "audios/talk/mosaic_made",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_paint: {
url: "audios/talk/mosaic_paint",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_piece: {
url: "audios/talk/mosaic_piece",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_speak: {
url: "audios/talk/mosaic_speak",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
},
mosaic_thankyou: {
url: "audios/talk/mosaic_thankyou",
bundleName: "$28640_f_mosaicTalkAfterAllLevelTrait"
}
};
return t;
}();
cc._RF.pop();
}, {} ],
MosaicTalkBoxView: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "b04e2ytckdKBagGy7jA+8s/", "MosaicTalkBoxView");
var o, a = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
o(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), n = this && this.__decorate || function(t, e, i, o) {
var a, n = arguments.length, l = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, i) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) l = Reflect.decorate(t, e, i, o); else for (var r = t.length - 1; r >= 0; r--) (a = t[r]) && (l = (n < 3 ? a(l) : n > 3 ? a(e, i, l) : a(e, i)) || l);
return n > 3 && l && Object.defineProperty(e, i, l), l;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
var l = cc._decorator, r = l.ccclass, s = l.property, c = function(t) {
a(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.tweenTagNextWord = 28640001;
e.tweenTagFinishWord = 28640002;
e.talkLabel = null;
e.talkWords = null;
e.talkWordIndex = 0;
e.separator = "";
e.callback = null;
return e;
}
e.prototype.render = function() {
this.state.isSkipBtnClick && this.onSkipBtnClick();
var t = this.state, e = t.talkWholeLine, i = t.isChinese, o = t.talkAudioDuration;
e && this.onShow(e, i, o);
var a = this.state.callback;
a && (this.callback = a);
};
e.prototype.onSkipBtnClick = function() {
if (this.talkWordIndex >= this.talkWords.length - 1) {
cc.Tween.stopAllByTarget(this.node);
this.talkWordComplete();
} else {
cc.Tween.stopAllByTag(this.tweenTagNextWord);
this.talkWordIndex = this.talkWords.length - 1;
this.showNextWord();
}
};
e.prototype.onShow = function(t, e, i) {
var o = this;
cc.Tween.stopAllByTarget(this.node);
this.separator = e ? "" : " ";
this.talkWords = t.split(this.separator);
this.talkWordIndex = 0;
this.talkLabel.string = "";
var a = i;
this.showAllWords();
cc.tween(this.node).delay(a).tag(this.tweenTagFinishWord).call(function() {
o.talkWordComplete();
}).start();
};
e.prototype.talkWordComplete = function() {
var t = this.callback;
this.callback = null;
t && t();
};
e.prototype.showAllWords = function() {
this.talkWordIndex = this.talkWords.length;
this.talkLabel.string = this.talkWords.join(this.separator);
};
e.prototype.showNextWord = function() {
if (!(this.talkWordIndex >= this.talkWords.length)) {
this.talkLabel.string = this.talkWords.slice(0, this.talkWordIndex + 1).join(this.separator);
this.talkWordIndex++;
}
};
e.prototype.onDestroy = function() {
cc.isValid(this.node) && cc.Tween.stopAllByTarget(this.node);
};
n([ s(cc.Label) ], e.prototype, "talkLabel", void 0);
return n([ r ], e);
}(hs.Component);
i.default = c;
cc._RF.pop();
}, {} ]
}, {}, [ "$28640_f_mosaicTalkAfterAllLevelTrait", "MosaicTalkAfterAllLevelView", "MosaicTalkBoxView" ]);
//# sourceMappingURL=index.js.map
