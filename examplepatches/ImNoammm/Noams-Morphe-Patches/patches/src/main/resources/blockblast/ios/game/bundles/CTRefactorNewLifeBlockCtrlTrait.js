window.__require = function e(t, r, o) {
function n(a, c) {
if (!r[a]) {
if (!t[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!t[l]) {
var s = "function" == typeof __require && __require;
if (!c && s) return s(l, !0);
if (i) return i(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var u = r[a] = {
exports: {}
};
t[a][0].call(u.exports, function(e) {
return n(t[a][1][e] || e);
}, u, u.exports, e, t, r, o);
}
return r[a].exports;
}
for (var i = "function" == typeof __require && __require, a = 0; a < o.length; a++) n(o[a]);
return n;
}({
CTRefactorNewLifeBlockCtrlTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "9a61d5uMIVIB7GpeSybSunq", "CTRefactorNewLifeBlockCtrlTrait");
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
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, o); else for (var c = e.length - 1; c >= 0; c--) (n = e[c]) && (a = (i < 3 ? n(a) : i > 3 ? n(t, r, a) : n(t, r)) || a);
return i > 3 && a && Object.defineProperty(t, r, a), a;
}, a = this && this.__awaiter || function(e, t, r, o) {
return new (r || (r = Promise))(function(n, i) {
function a(e) {
try {
l(o.next(e));
} catch (e) {
i(e);
}
}
function c(e) {
try {
l(o.throw(e));
} catch (e) {
i(e);
}
}
function l(e) {
e.done ? n(e.value) : (t = e.value, t instanceof r ? t : new r(function(e) {
e(t);
})).then(a, c);
var t;
}
l((o = o.apply(e, t || [])).next());
});
}, c = this && this.__generator || function(e, t) {
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
next: c(0),
throw: c(1),
return: c(2)
}, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function c(e) {
return function(t) {
return l([ e, t ]);
};
}
function l(i) {
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
}, l = this && this.__read || function(e, t) {
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
}, s = this && this.__spread || function() {
for (var e = [], t = 0; t < arguments.length; t++) e = e.concat(l(arguments[t]));
return e;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CTRefactorNewLifeBlockCtrlTrait = void 0;
var u = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.ani = null;
t.failBlockId = -1;
t.failBlockIdList = [];
return t;
}
t.prototype.onCreate = function() {
this.loadRes();
};
t.prototype.data = function() {
return {
isTrigger: !1
};
};
t.prototype.loadRes = function() {
return a(this, void 0, Promise, function() {
var e;
return c(this, function(t) {
switch (t.label) {
case 0:
return cc.isValid(this.ani) ? [ 2 ] : [ 4, hs.ResLoader.asyncLoad(hs.PrefabConfig.NewLifeBlockItem.url, cc.Prefab) ];

case 1:
(e = t.sent()) && (this.ani = e);
return [ 2 ];
}
});
});
};
t.prototype.reset = function() {
hs.gameInfo.gameType == hs.GameType.Class ? storage.setItem("NewLifeBlockCtrl_addData_class", []) : storage.setItem("NewLifeBlockCtrl_addData_journey", []);
};
t.prototype.onAlgorithmStrategyGameNewInit = function() {
this.reset();
};
t.prototype.onAlgorithmStrategyPostprocessComplete = function() {
var e;
(null === (e = hs.algorithmName.algoActualName[0]) || void 0 === e ? void 0 : e.includes("复活")) && this.setAddData(hs.algorithmInfo.blockIdList);
};
t.prototype.isTrigger = function() {
var e = TRAIT("CTRefactorReviveBlockAlertTrait");
return !(null != e && e.active || this.state.isTrigger);
};
t.prototype.checkFailBlockId = function() {
var e = storage.getItem("classProducerBlocks", [ -1, -1, -1 ]).find(function(e) {
return -1 != e;
});
this.failBlockIdList = storage.getItem("classProducerBlocks", [ -1, -1, -1 ]).filter(function(e) {
return -1 != e;
});
if (e && e > 0) {
this.failBlockId = e;
return !0;
}
return !1;
};
t.prototype.checkFailBlockIdChapter = function() {
var e = storage.getItem("chapterProducerBlocks", [ -1, -1, -1 ]).find(function(e) {
return -1 != e;
});
this.failBlockIdList = storage.getItem("chapterProducerBlocks", [ -1, -1, -1 ]).filter(function(e) {
return -1 != e;
});
if (e && e > 0) {
this.failBlockId = e;
return !0;
}
return !1;
};
t.prototype.onPreprocessConditionContext = function() {
var e = this;
return buildLazyConditionContext({
isTrigger: function() {
return ASContext(e.isTrigger(), "检查是否触发");
},
checkFailBlockId: function() {
return ASContext(e.checkFailBlockId(), "检查是否还有未放得块");
},
checkFailBlockIdChapter: function() {
return ASContext(e.checkFailBlockIdChapter(), "旅行：检查是否还有未放得块");
}
});
};
t.prototype.onPreprocessConditions = function() {
return {
mutex: {
AlgoReviveTrait: [ {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
}, {
fact: "checkFailBlockId",
operator: "=",
value: !0
} ]
},
event: {
type: "onAlgoReviveSourceLevel"
},
flow: "flow1"
} ],
TravelRevive: [ {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
}, {
fact: "checkFailBlockIdChapter",
operator: "=",
value: !0
} ]
},
event: {
type: "onTravelReviveSourceLevel"
},
flow: "flow1"
} ]
}
};
};
t.prototype.onAlgoReviveSourceLevel = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ClassAlgorithmSourceType.AlgoRevive);
};
t.prototype.onTravelReviveSourceLevel = function() {
hs.algorithmStrategyLevelRefactoredInfo.setAlgorithmSourceLevel1(hs.ChapterAlgorithmSourceType.TravelRevive);
};
t.prototype.onPreprocessActions = function() {
return {
mutex: {
AlgoReviveTrait: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ [ hs.OFFER_TYPE_BASE.NEW_LIFE_BLOCK_IOS, hs.OFFER_TYPE_BASE.REVIVE ] ]
} ]
},
TravelRevive: {
flow1: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ [ hs.OFFER_TYPE_BASE.NEW_LIFE_BLOCK_IOS, hs.OFFER_TYPE_BASE.REVIVE ] ]
} ]
}
}
};
};
t.prototype.isNewLifeBlock = function(e) {
return e.algorithmId == hs.OFFER_TYPE.NEW_LIFE_BLOCK_IOS;
};
Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
var e = TRAIT("CTRefactorReviveBlockAlertTrait");
return !(null != e && e.active || this.state.isTrigger);
},
enumerable: !1,
configurable: !0
});
t.prototype.isBlocksProducerPlayBlockAppearAnimation = function(e) {
var t;
if (null === (t = hs.algorithmName.algoActualName[0]) || void 0 === t ? void 0 : t.includes("复活")) {
var r = e.args[0].x, o = 0 == r ? 1 : r > 0 ? 2 : 0, n = hs.blocksProducerInfo.producerBlocks[o];
this.tryShowAnimation(n, e.args[0], e.args[2]) && (e.replace = !0);
}
};
t.prototype.isCTRefactorFinalModifyBlockIOSTraitCheckGuaranteedBlock = function(e) {
-1 != hs.algorithmName.algoActualName.indexOf("复活") && 3 == hs.algorithmInfo.blockIdList.length && (e.replace = !0);
};
t.prototype.tryShowAnimation = function(e, t, r) {
return a(this, void 0, Promise, function() {
var o;
return c(this, function(n) {
switch (n.label) {
case 0:
if (hs.deviceInfo.isLowLevel) return [ 2, !1 ];
if (!cc.isValid(this.ani)) return [ 3, 1 ];
this.showAnimation(e, t, r);
return [ 3, 3 ];

case 1:
return [ 4, hs.ResLoader.asyncLoad(hs.PrefabConfig.NewLifeBlockItem.url, cc.Prefab) ];

case 2:
if (o = n.sent()) {
this.ani = o;
this.showAnimation(e, t, r);
}
n.label = 3;

case 3:
return [ 2, !0 ];
}
});
});
};
t.prototype.showAnimation = function(e, t, r) {
if (cc.isValid(t) && cc.isValid(this.ani)) {
var o = cc.instantiate(this.ani);
t.addChild(o, 100);
o.name = "NewLifeBlock";
o.x = 0;
o.y = 0;
t.scale = .45;
t.opacity = 255;
o.getComponent(hs.ShowItem3Script).setCurrentId(e, r);
} else r && "function" == typeof r && r();
};
Object.defineProperty(t.prototype, "addData", {
get: function() {
return hs.gameInfo.gameType == hs.GameType.Class ? storage.getItem("NewLifeBlockCtrl_addData_class", []) : storage.getItem("NewLifeBlockCtrl_addData_journey", []);
},
enumerable: !1,
configurable: !0
});
t.prototype.setAddData = function(e) {
var t = this.addData;
t.push(e);
hs.gameInfo.gameType == hs.GameType.Class ? storage.setItem("NewLifeBlockCtrl_addData_class", t) : storage.setItem("NewLifeBlockCtrl_addData_journey", t);
};
t.prototype.onSDKArgsConditionContext = function(e, t, r) {
var o = this;
return buildLazyConditionContext({
isTrigger: function() {
return ASContext(o.isTrigger(), "检查是否触发");
},
isNewLifeBlock: function() {
return ASContext(o.isNewLifeBlock(r), "是否是当前算法触发");
},
failBlockId: function() {
return ASContext(o.failBlockId > 0, "失败块ID");
}
});
};
t.prototype.onSDKArgsConditions = function() {
return [ {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
}, {
fact: "isNewLifeBlock",
operator: "=",
value: !0
} ]
},
platform: "ios",
flow: "flowios"
}, {
conditions: {
and: [ {
fact: "isTrigger",
operator: "=",
value: !0
}, {
fact: "isNewLifeBlock",
operator: "=",
value: !0
}, {
fact: "failBlockId",
operator: "=",
value: !0
} ]
},
platform: "gp",
flow: "flowgp"
} ];
};
t.prototype.onSDKArgsActions = function() {
var e = this;
return {
flowios: function() {
return {
blocksGroup: [ s(e.failBlockIdList) ]
};
},
flowgp: function() {
return {
blocksGroup: [ s(e.failBlockIdList) ]
};
}
};
};
return i([ classId("CTRefactorNewLifeBlockCtrlTrait") ], t);
}(Trait);
r.CTRefactorNewLifeBlockCtrlTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactorNewLifeBlockCtrlTrait" ]);
//# sourceMappingURL=index.js.map
