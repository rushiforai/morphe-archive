window.__require = function e(t, r, o) {
function i(n, c) {
if (!r[n]) {
if (!t[n]) {
var a = n.split("/");
a = a[a.length - 1];
if (!t[a]) {
var u = "function" == typeof __require && __require;
if (!c && u) return u(a, !0);
if (s) return s(a, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = a;
}
var p = r[n] = {
exports: {}
};
t[n][0].call(p.exports, function(e) {
return i(t[n][1][e] || e);
}, p, p.exports, e, t, r, o);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
QBlockNewGuideTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "0f3571TIDZNs7X49m+4oVjF", "QBlockNewGuideTrait");
var o, i = this && this.__extends || (o = function(e, t) {
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
}), s = this && this.__decorate || function(e, t, r, o) {
var i, s = arguments.length, n = s < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (n = (s < 3 ? i(n) : s > 3 ? i(t, r, n) : i(t, r)) || n);
return s > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.QBlockNewGuideTrait = void 0;
var n = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.guideStep0Config = {
save_arr: r.SAVE_ARRAY[0],
producerBlocks: r.OPERA_ARRAY[0],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 53,
y: -653.75
}, {
x: -53,
y: 126.75
} ]
};
t.guideStep1Config = {
save_arr: r.SAVE_ARRAY[1],
producerBlocks: r.OPERA_ARRAY[1],
blocksColors: [ 1, 4, 1 ],
color: 4,
currentScore: 0,
highScore: 0,
move: [ {
x: 53,
y: -548.75
}, {
x: -53,
y: 19.75
} ]
};
return t;
}
r = t;
t.prototype.getQBlockGuideStep = function() {
return hs.storage.getItem("QBlockNewGuideStep", 0);
};
t.prototype.setQBlockGuideStep = function(e) {
hs.storage.setItem("QBlockNewGuideStep", e);
};
t.prototype.onActive = function(e) {
if (!(hs.classGuideInfo.step > 2)) {
var t = this.getQBlockGuideStep();
if (hs.tp.isLaunch_ProxyOnTraitConfigInitComplete(e)) {
if (t > 2) return;
this.applyGuideStepConfigs();
}
if (hs.tp.isClassGuide_ProxyRenderGuideState(e)) {
if (t > 2) return;
2 === t && (e.args[0].showHand = !0);
this.applyGuideStepConfigsToSteps(t);
hs.storage.setItem("classGuideStep", t);
e.args[0].step = t;
}
if (hs.tp.isClassGuide_ProxyGuideEndDot(e) && t < 2) {
var r = t + 1;
this.setQBlockGuideStep(r);
hs.storage.setItem("classFaceBlocks", [ [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ], [ -1, -1, -1, -1, -1, -1, -1, -1 ] ]);
}
hs.tp.isClassGuide_ProxyOnGuideChangeTrait(e) && 2 === t && (e.replace = !0);
if (hs.tp.isClassTopInfo_ProxyModifyScoreInGuide(e) || hs.tp.isClassTopInfoModifyScoreInGuide(e)) {
if (0 == t) {
e.replace = !0;
e.returnState = !0;
hs.storage.setItem("classScore", 0);
}
if (1 == t) {
e.replace = !0;
e.returnState = !0;
hs.storage.setItem("classScore", 10);
}
}
if (hs.tp.isClassTopInfoSetScoreLabel(e)) {
0 == t && (e.args[0] = 0);
1 == t && (e.args[0] = 10);
}
if (hs.tp.isClassBoard_ProxyOnBoardRender(e) && t < 2) {
var o = 0 === t ? this.guideStep0Config.save_arr : this.guideStep1Config.save_arr, i = e.args[0].boards;
if (!this.isBoardMatch(i, o)) {
e.args[0].boards = o;
hs.storage.setItem("classFaceBlocks", o);
}
}
}
};
t.prototype.isBoardMatch = function(e, t) {
if (!e || !t) return !1;
if (e.length !== t.length) return !1;
for (var r = 0; r < e.length; r++) {
if (!e[r] || !t[r] || e[r].length !== t[r].length) return !1;
for (var o = 0; o < e[r].length; o++) if (e[r][o] !== t[r][o]) return !1;
}
return !0;
};
t.prototype.applyGuideStepConfigs = function() {
hs.storage.setItem("guideStepConfigOverride_0", this.guideStep0Config);
hs.storage.setItem("guideStepConfigOverride_1", this.guideStep1Config);
};
t.prototype.applyGuideStepConfigsToSteps = function(e) {
var t, r = null === (t = hs.classGuideInfo) || void 0 === t ? void 0 : t.steps;
if (r) {
if (0 == e && r[0]) {
this.applyConfigToStep(r[0], this.guideStep0Config, 0);
this.refreshBoardAndBlocks(e);
}
if (1 == e && r[1]) {
this.applyConfigToStep(r[1], this.guideStep1Config, 1);
this.refreshBoardAndBlocks(e);
}
}
};
t.prototype.refreshBoardAndBlocks = function(e) {
var t = 0 === e ? this.guideStep0Config : 1 === e ? this.guideStep1Config : null;
if (t) {
hs.storage.setItem("classFaceBlocks", t.save_arr);
hs.storage.setItem("classProducerBlocks", t.producerBlocks);
}
};
t.prototype.applyConfigToStep = function(e, t) {
e.save_arr = t.save_arr;
e.producerBlocks = t.producerBlocks;
e.blocksColors = t.blocksColors;
e.color = t.color;
e.currentScore = t.currentScore;
e.highScore = t.highScore;
e.move = t.move;
};
t.isOpen = function() {
var e, t = TRAIT("QBlockNewGuideTrait");
return null !== (e = null == t ? void 0 : t.active) && void 0 !== e && e;
};
t.getDottedArr = function(e) {
return r.DOTTED_LINE_BLOCK_ARRAY[e];
};
t.getSaveArr = function(e) {
return r.SAVE_ARRAY[e];
};
t.getOperaArr = function(e) {
return r.OPERA_ARRAY[e];
};
var r;
t.OPERA_ARRAY = [ [ -1, 2, -1 ], [ -1, 8, -1 ] ];
t.SAVE_ARRAY = [ [ [ 10, 10, 10, 5, 10, 10, 10, 10 ], [ 10, 10, 10, 4, 10, 10, 10, 10 ], [ 10, 10, 10, 2, 10, 10, 10, 10 ], [ 10, 10, 10, -1, 10, 10, 10, 10 ], [ 10, 10, 10, -1, 10, 10, 10, 10 ], [ 10, 10, 10, 7, 10, 10, 10, 10 ], [ 10, 10, 10, 1, 10, 10, 10, 10 ], [ 10, 10, 10, 3, 10, 10, 10, 10 ] ], [ [ 10, 10, 10, 10, 10, 10, 10, 10 ], [ 10, 10, 10, 10, 10, 10, 10, 10 ], [ 10, 10, 10, 10, 10, 10, 10, 10 ], [ 10, 10, 10, 10, 10, 10, 10, 10 ], [ 5, 4, -1, 2, 6, 7, 1, 3 ], [ 5, 4, -1, -1, -1, 7, 1, 3 ], [ 10, 10, 10, 10, 10, 10, 10, 10 ], [ 10, 10, 10, 10, 10, 10, 10, 10 ] ] ];
t.DOTTED_LINE_BLOCK_ARRAY = [ [ [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ] ], [ [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 1, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0 ] ] ];
return r = s([ classId("QBlockNewGuideTrait") ], t);
}(Trait);
r.QBlockNewGuideTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "QBlockNewGuideTrait" ]);
//# sourceMappingURL=index.js.map
