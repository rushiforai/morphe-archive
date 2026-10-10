window.__require = function e(t, r, o) {
function n(a, u) {
if (!r[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var c = "function" == typeof __require && __require;
if (!u && c) return c(s, !0);
if (i) return i(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var l = r[a] = {
exports: {}
};
t[a][0].call(l.exports, function(e) {
return n(t[a][1][e] || e);
}, l, l.exports, e, t, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
$32777_f_ThreeHardGuideShineCtrlTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "c5cf6wCOURCabSYDfGHdYLb", "$32777_f_ThreeHardGuideShineCtrlTrait");
var o, n = this && this.__extends || (o = function(e, t) {
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
}), i = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var u = e.length - 1; u >= 0; u--) (n = e[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, r, a) : n(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.$32777_f_ThreeHardGuideShineCtrlTrait = void 0;
var a = e("./managers/ThreeHardGuideShineManager"), u = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.manager = null;
t.lastSuccessGuideRound = -2;
t.shouldTriggerGuideTimeoutId = -1;
return t;
}
t.prototype.registerTraitEventsMethods = function() {
return [ {
className: "HardBlockSoundTrait",
methodName: "checkPlaySound"
}, {
className: "HardBlockSoundAdjustParamsTrait",
methodName: "checkPlaySound"
} ];
};
t.prototype.onActive = function(e) {
this.manager || (this.manager = new a.ThreeHardGuideShineManager());
(hs.tp.isClassGame_ProxyOnGameStart(e) || hs.tp.isChapterGame_ProxyOnStartGame(e)) && this.onReset();
hs.tp.isAlgorithmProcessInfoAlgorithmSuccess(e) && this.onAlgorithmSuccess(e);
hs.tp.isBlocksProducer_ProxyOnTouchEnd(e) && this.onBlockPlaceSuccess(e);
(hs.tp.isHardBlockSoundTraitCheckPlaySound(e) || hs.tp.isHardBlockSoundAdjustParamsTraitCheckPlaySound(e)) && this.onCheckHardBlockPlaySoundAndReset() && (e.args[0] = !0);
hs.tp.isRevive_ProxyOpenUI(e) && this.onReset();
};
t.prototype.onAlgorithmSuccess = function() {
var e = this;
clearTimeout(this.shouldTriggerGuideTimeoutId);
this.shouldTriggerGuideTimeoutId = setTimeoutSafe(function() {
var t;
(null === (t = e.manager) || void 0 === t ? void 0 : t.shouldTriggerGuide()) && e.manager.triggerGuideShine();
}, 130);
};
t.prototype.onReset = function() {
var e;
this.lastSuccessGuideRound = -2;
null === (e = this.manager) || void 0 === e || e.onReset();
};
t.prototype.onCheckHardBlockPlaySoundAndReset = function() {
var e = 0;
hs.gameInfo.gameMode === hs.GameMode.Class ? e = hs.classGameInfo.roundNum : hs.gameInfo.gameMode === hs.GameMode.Chapter && (e = hs.chapterGameInfo.roundNum);
var t = this.lastSuccessGuideRound === e - 1;
this.lastSuccessGuideRound = -2;
return t;
};
t.prototype.isGuiding = function() {
return !!this.manager && this.manager.isGuiding();
};
t.prototype.onBlockPlaceSuccess = function(e) {
var t, r, o, n, i;
clearTimeout(this.shouldTriggerGuideTimeoutId);
this.manager && this.manager.isGuiding() && this.manager.clearShineEffects();
if ((null === (t = this.manager) || void 0 === t ? void 0 : t.isGuiding()) && (null === (n = null === (o = null === (r = null == e ? void 0 : e.args) || void 0 === r ? void 0 : r[0]) || void 0 === o ? void 0 : o.state) || void 0 === n ? void 0 : n.clearProducer)) {
hs.gameInfo.gameMode === hs.GameMode.Class ? this.lastSuccessGuideRound = hs.classGameInfo.roundNum : hs.gameInfo.gameMode === hs.GameMode.Chapter && (this.lastSuccessGuideRound = hs.chapterGameInfo.roundNum);
null === (i = this.manager) || void 0 === i || i.onPuzzleSolved();
}
};
t.prototype.testBoardContainer = function() {};
return i([ classId("$32777_f_ThreeHardGuideShineCtrlTrait") ], t);
}(Trait);
r.$32777_f_ThreeHardGuideShineCtrlTrait = u;
cc._RF.pop();
}, {
"./managers/ThreeHardGuideShineManager": "ThreeHardGuideShineManager"
} ],
HardPuzzleDetector: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "4284e2m98NO8IGcpmUoaHq8", "HardPuzzleDetector");
Object.defineProperty(r, "__esModule", {
value: !0
});
r.HardPuzzleDetector = void 0;
var o = function() {
function e() {}
e.prototype.isHardPuzzle = function() {
var e, t = (null === (e = hs.algorithmName) || void 0 === e ? void 0 : e.algoActualName) || [];
return !(!Array.isArray(t) || 0 === t.length) && t.some(function(e) {
return "string" == typeof e && e.includes("难题");
});
};
e.prototype.isPuzzleSolved = function() {
return !0;
};
e.prototype.isHardPuzzlePositionInfoValid = function() {
var e = this.getBlockPutPosCorrectList();
return !(!e || 2 !== e.length);
};
e.prototype.getBlockPutPosCorrectList = function() {
var e, t;
if (!this.isHasCannotPutBlock()) return [];
var r = new hs.BinaryBoard();
r.convertToBinaryBoard(hs.boardInfo.faceBlocks);
var o = hs.algorithmInfo.blockIdList.concat([]), n = [];
r.checkPutAllBlocks(o, n);
if (n.length < 3) return [];
n.reverse();
for (var i = [], a = 0; a < 2; a++) i.push({
blockId: n[a].id,
blockIndex: n[a].index,
point: null === (t = null === (e = hs.algorithmInfo) || void 0 === e ? void 0 : e.blockPosList) || void 0 === t ? void 0 : t[n[a].index],
calculatePutPos: {
row: n[a].pos.y,
col: n[a].pos.x
},
color: cc.Color.WHITE
});
return i;
};
e.prototype.isHasCannotPutBlock = function() {
var e = new hs.BinaryBoard();
e.convertToBinaryBoard(hs.boardInfo.faceBlocks);
for (var t = hs.algorithmInfo.blockIdList.concat([]), r = 0; r < t.length; r++) {
var o = t[r];
if (!e.canPut(o)) return !0;
}
return !1;
};
return e;
}();
r.HardPuzzleDetector = o;
cc._RF.pop();
}, {} ],
ThreeHardBlockSkinColor: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "a2d29hoX+VHiJD7TpHCqVLN", "ThreeHardBlockSkinColor");
var o = this && this.__awaiter || function(e, t, r, o) {
return new (r || (r = Promise))(function(n, i) {
function a(e) {
try {
s(o.next(e));
} catch (e) {
i(e);
}
}
function u(e) {
try {
s(o.throw(e));
} catch (e) {
i(e);
}
}
function s(e) {
e.done ? n(e.value) : (t = e.value, t instanceof r ? t : new r(function(e) {
e(t);
})).then(a, u);
var t;
}
s((o = o.apply(e, t || [])).next());
});
}, n = this && this.__generator || function(e, t) {
var r, o, n, i, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: u(0),
throw: u(1),
return: u(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(e) {
return function(t) {
return s([ e, t ]);
};
}
function s(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
a.label++;
return {
value: i[1],
done: !1
};

case 5:
a.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
a = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
a.label = i[1];
break;
}
if (6 === i[0] && a.label < n[1]) {
a.label = n[1];
n = i;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(i);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
i = t.call(e, a);
} catch (e) {
i = [ 6, e ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, i = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], o = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && o >= e.length && (e = void 0);
return {
value: e && e[o++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ThreeHardBlockSkinColor = void 0;
var a = function() {
function e() {
this.blockSkinColorMap = new Map();
this.loadURL = "config/blockSkinColor";
this.log_prefix = "$32777_f_ThreeHardGuideShineCtrlTrait";
}
e.prototype.tryLoadJsonAsset = function() {
return o(this, void 0, Promise, function() {
var e;
return n(this, function(t) {
switch (t.label) {
case 0:
if (this.blockSkinColorMap.size > 0) return [ 2 ];
t.label = 1;

case 1:
t.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.ResLoader.asyncLoadByBundle(this.log_prefix, this.loadURL, cc.JsonAsset) ];

case 2:
(e = t.sent()) && e.json && this.parseJsonAsset(e);
return [ 3, 4 ];

case 3:
t.sent();
return [ 3, 4 ];

case 4:
return [ 2 ];
}
});
});
};
e.prototype.parseJsonAsset = function(e) {
var t, r;
try {
var o = e.json;
try {
for (var n = i(o), a = n.next(); !a.done; a = n.next()) {
var u = a.value;
this.blockSkinColorMap.set(u.skinId, u.color.map(function(e) {
return new cc.Color().fromHEX(e);
}));
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (r = n.return) && r.call(n);
} finally {
if (t) throw t.error;
}
}
} catch (e) {}
};
e.prototype.getBlockSkinColor = function(e, t, r) {
var o;
void 0 === r && (r = "1000");
0 === this.blockSkinColorMap.size && this.tryLoadJsonAsset();
var n = this.blockSkinColorMap.get("skin_" + e);
n || (n = this.blockSkinColorMap.get("skin_" + r));
return null !== (o = null == n ? void 0 : n[t - 1]) && void 0 !== o ? o : cc.Color.WHITE;
};
e.prototype.getBlockColorId = function(e, t, r) {
var o, n, i, a, u, s;
void 0 === r && (r = !0);
var c = this.getColorList(), l = null !== (o = null == c ? void 0 : c[e]) && void 0 !== o ? o : 0, d = null === (n = Cinst(hs.BlocksProducer)) || void 0 === n ? void 0 : n.blocksContainer;
if (!cc.isValid(d)) return l;
if (r) {
for (var h = 0; h < (null == d ? void 0 : d.children.length); h++) if ((null === (a = null == (f = null === (i = null == d ? void 0 : d.children[h]) || void 0 === i ? void 0 : i.getComponent(hs.BlocksProducerItem)) ? void 0 : f.state) || void 0 === a ? void 0 : a.id) === t) return f.state.color;
} else for (h = (null == d ? void 0 : d.children.length) - 1; h >= 0; h--) {
var f;
if ((null === (s = null == (f = null === (u = null == d ? void 0 : d.children[h]) || void 0 === u ? void 0 : u.getComponent(hs.BlocksProducerItem)) ? void 0 : f.state) || void 0 === s ? void 0 : s.id) === t) return f.state.color;
}
return l;
};
e.prototype.getColorList = function() {
var e, t;
return hs.gameInfo.gameMode === hs.GameMode.Class ? (null === (e = hs.classGameInfo) || void 0 === e ? void 0 : e.color_list) || null : hs.gameInfo.gameMode === hs.GameMode.Chapter && (null === (t = hs.chapterGameInfo) || void 0 === t ? void 0 : t.color_list) || null;
};
return e;
}();
r.ThreeHardBlockSkinColor = a;
cc._RF.pop();
}, {} ],
ThreeHardGuideShineManager: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "34521pIc8JHv6NfOnLwEBQ+", "ThreeHardGuideShineManager");
var o = this && this.__awaiter || function(e, t, r, o) {
return new (r || (r = Promise))(function(n, i) {
function a(e) {
try {
s(o.next(e));
} catch (e) {
i(e);
}
}
function u(e) {
try {
s(o.throw(e));
} catch (e) {
i(e);
}
}
function s(e) {
e.done ? n(e.value) : (t = e.value, t instanceof r ? t : new r(function(e) {
e(t);
})).then(a, u);
var t;
}
s((o = o.apply(e, t || [])).next());
});
}, n = this && this.__generator || function(e, t) {
var r, o, n, i, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return i = {
next: u(0),
throw: u(1),
return: u(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(e) {
return function(t) {
return s([ e, t ]);
};
}
function s(i) {
if (r) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (r = 1, o && (n = 2 & i[0] ? o.return : i[0] ? o.throw || ((n = o.return) && n.call(o), 
0) : o.next) && !(n = n.call(o, i[1])).done) return n;
(o = 0, n) && (i = [ 2 & i[0], n.value ]);
switch (i[0]) {
case 0:
case 1:
n = i;
break;

case 4:
a.label++;
return {
value: i[1],
done: !1
};

case 5:
a.label++;
o = i[1];
i = [ 0 ];
continue;

case 7:
i = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === i[0] || 2 === i[0])) {
a = 0;
continue;
}
if (3 === i[0] && (!n || i[1] > n[0] && i[1] < n[3])) {
a.label = i[1];
break;
}
if (6 === i[0] && a.label < n[1]) {
a.label = n[1];
n = i;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(i);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
i = t.call(e, a);
} catch (e) {
i = [ 6, e ];
o = 0;
} finally {
r = n = 0;
}
if (5 & i[0]) throw i[1];
return {
value: i[0] ? i[1] : void 0,
done: !0
};
}
}, i = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var o, n, i = r.call(e), a = [];
try {
for (;(void 0 === t || t-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (e) {
n = {
error: e
};
} finally {
try {
o && !o.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.ThreeHardGuideShineManager = void 0;
var a = e("../types/ThreeHardGuideShineTypes"), u = e("../views/ThreeHardGuideShineView"), s = e("./HardPuzzleDetector"), c = e("./ThreeHardBlockSkinColor"), l = function() {
function e() {
var e;
this.currentGuideData = null;
this.guideView = null;
this.triggerCount = 3;
this.detector = new s.HardPuzzleDetector();
this.threeHardBlockSkinColor = new c.ThreeHardBlockSkinColor();
this.getGuidedCount() >= this.triggerCount || null === (e = this.threeHardBlockSkinColor) || void 0 === e || e.tryLoadJsonAsset();
}
e.prototype.shouldTriggerGuide = function() {
if (this.getGuidedCount() >= this.triggerCount) return !1;
if (!this.detector.isHardPuzzle()) return !1;
if (!this.detector.isHardPuzzlePositionInfoValid()) return !1;
var e = this.getColorList();
return !(!e || e.length < 3);
};
e.prototype.triggerGuideShine = function() {
this.currentGuideData = {
state: a.GuideState.Showing
};
var e = this.detector.getBlockPutPosCorrectList();
this.createShineEffects(e);
this.currentGuideData && (this.currentGuideData.state = a.GuideState.Waiting);
};
e.prototype.onPuzzleSolved = function() {
if (this.currentGuideData) {
this.clearShineEffects();
this.currentGuideData.state = a.GuideState.Solved;
this.incrementCountAndCheck();
}
};
e.prototype.createShineEffects = function(e) {
return o(this, void 0, Promise, function() {
var t;
return n(this, function(r) {
switch (r.label) {
case 0:
return [ 4, this.getGuideView() ];

case 1:
if (!(t = r.sent())) return [ 2 ];
if (!this.setGuideViewParent(t)) return [ 2 ];
if (e.length < 2) return [ 2 ];
t.produceBlocks(e[0], e[1], this.threeHardBlockSkinColor);
return [ 2 ];
}
});
});
};
e.prototype.clearShineEffects = function() {
var e;
null === (e = this.guideView) || void 0 === e || e.clearGuideBlocks();
};
e.prototype.incrementCountAndCheck = function() {
var e = this.getGuidedCount() + 1;
storage.setItem("threeHardGuideShineCount", e);
e >= this.triggerCount && this.currentGuideData && (this.currentGuideData.state = a.GuideState.Completed);
this.currentGuideData = null;
};
e.prototype.getGuidedCount = function() {
return storage.getItem("threeHardGuideShineCount", 0);
};
e.prototype.getColorList = function() {
var e, t;
return hs.gameInfo.gameMode === hs.GameMode.Class ? (null === (e = hs.classGameInfo) || void 0 === e ? void 0 : e.color_list) || null : hs.gameInfo.gameMode === hs.GameMode.Chapter && (null === (t = hs.chapterGameInfo) || void 0 === t ? void 0 : t.color_list) || null;
};
e.prototype.getGuideView = function() {
return o(this, void 0, Promise, function() {
var e, t;
return n(this, function(r) {
switch (r.label) {
case 0:
return this.guideView && cc.isValid(this.guideView.node) ? [ 2, this.guideView ] : [ 4, hs.ResLoader.asyncLoadByBundle("$32777_f_ThreeHardGuideShineCtrlTrait", "prefabs/ThreeHardGuideShine", cc.Prefab) ];

case 1:
if (!(e = r.sent())) return [ 2, null ];
t = INSTANTIATE(e);
this.guideView = t.getComponent(u.default);
return [ 2, this.guideView ];
}
});
});
};
e.prototype.setGuideViewParent = function(e) {
var t = i(this.getBoardContainer(), 2), r = t[0], o = t[1];
if (!r || !o) return !1;
e.node.parent = r;
e.node.setSiblingIndex(r.children.length - 1);
e.node.setPosition(o.getPosition());
e.node.setScale(1, 1);
return !0;
};
e.prototype.getBoardContainer = function() {
var e = Cinst(hs.Board);
return cc.isValid(e) && cc.isValid(e.node) && cc.isValid(e.node.parent) && cc.isValid(e.node.parent) ? [ e.node.parent, e.node ] : [ null, null ];
};
e.prototype.onReset = function() {
this.clearShineEffects();
this.currentGuideData = null;
};
e.prototype.isGuiding = function() {
var e;
return (null === (e = this.currentGuideData) || void 0 === e ? void 0 : e.state) === a.GuideState.Waiting;
};
return e;
}();
r.ThreeHardGuideShineManager = l;
cc._RF.pop();
}, {
"../types/ThreeHardGuideShineTypes": "ThreeHardGuideShineTypes",
"../views/ThreeHardGuideShineView": "ThreeHardGuideShineView",
"./HardPuzzleDetector": "HardPuzzleDetector",
"./ThreeHardBlockSkinColor": "ThreeHardBlockSkinColor"
} ],
ThreeHardGuideShineTypes: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "c53c3XAx35HPYcjoRBNzi/6", "ThreeHardGuideShineTypes");
Object.defineProperty(r, "__esModule", {
value: !0
});
r.GuideState = void 0;
(function(e) {
e[e.Idle = 0] = "Idle";
e[e.Showing = 1] = "Showing";
e[e.Waiting = 2] = "Waiting";
e[e.Solved = 3] = "Solved";
e[e.Completed = 4] = "Completed";
})(r.GuideState || (r.GuideState = {}));
cc._RF.pop();
}, {} ],
ThreeHardGuideShineView: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "3a60fdkxx9FHq1fzSz2ZB0o", "ThreeHardGuideShineView");
var o, n = this && this.__extends || (o = function(e, t) {
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
}), i = this && this.__decorate || function(e, t, r, o) {
var n, i = arguments.length, a = i < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var u = e.length - 1; u >= 0; u--) (n = e[u]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, r, a) : n(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
var a = cc._decorator, u = a.ccclass, s = a.property, c = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.shineBlockPrefab = null;
t.pool = new cc.NodePool();
return t;
}
t.prototype.produceBlocks = function(e, t, r) {
if (e && t) {
this.threeHardBlockSkinColor = r;
this.calcShineBlockPos(e, !0);
this.calcShineBlockPos(t, !1);
}
};
t.prototype.calcShineBlockPos = function(e, t) {
var r = e.blockId, o = hs.BlockShapeMap[r];
if (o) for (var n = o.shape, i = e.calculatePutPos.row, a = e.calculatePutPos.col, u = 0, s = 0; s < o.height; s++) for (var c = n[s], l = 0; l < o.width; l++) if (0 != (c & 1 << o.width - 1 - l)) {
var d = a + l, h = i + s;
this.createBlockItem(u, e, h, d, t);
u++;
}
};
t.prototype.createBlockItem = function(e, t, r, o, n) {
var i, a, u = this.pool.get();
u || (u = cc.instantiate(this.shineBlockPrefab));
u.active = !0;
u.parent = this.node;
var s = hs.BLOCK_SIZE, c = o * s - 8 * s / 2 + s / 2, l = -r * s + 8 * s / 2 - s / 2;
u.setPosition(c, l);
var d = null === (i = this.threeHardBlockSkinColor) || void 0 === i ? void 0 : i.getBlockColorId(t.blockIndex, t.blockId, n), h = null === (a = this.threeHardBlockSkinColor) || void 0 === a ? void 0 : a.getBlockSkinColor(hs.skinInfo.currentSkinId, d, hs.skinInfo.originSkinId);
u.color = h;
var f = u.getComponent(dragonBones.ArmatureDisplay);
null == f || f.playAnimation("in", 0);
};
t.prototype.clearGuideBlocks = function() {
if (cc.isValid(this) && cc.isValid(this.node)) for (var e = this.node.children.length - 1; e >= 0; e--) {
var t = this.node.children[e];
cc.isValid(t) && this.pool.put(t);
}
};
i([ s(cc.Prefab) ], t.prototype, "shineBlockPrefab", void 0);
return i([ u ], t);
}(hs.Component);
r.default = c;
cc._RF.pop();
}, {} ]
}, {}, [ "$32777_f_ThreeHardGuideShineCtrlTrait", "HardPuzzleDetector", "ThreeHardBlockSkinColor", "ThreeHardGuideShineManager", "ThreeHardGuideShineTypes", "ThreeHardGuideShineView" ]);
//# sourceMappingURL=index.js.map
