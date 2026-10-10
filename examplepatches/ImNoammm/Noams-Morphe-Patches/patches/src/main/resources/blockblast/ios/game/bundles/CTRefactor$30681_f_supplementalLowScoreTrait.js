window.__require = function e(t, r, o) {
function n(i, p) {
if (!r[i]) {
if (!t[i]) {
var l = i.split("/");
l = l[l.length - 1];
if (!t[l]) {
var u = "function" == typeof __require && __require;
if (!p && u) return u(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + i + "'");
}
i = l;
}
var s = r[i] = {
exports: {}
};
t[i][0].call(s.exports, function(e) {
return n(t[i][1][e] || e);
}, s, s.exports, e, t, r, o);
}
return r[i].exports;
}
for (var a = "function" == typeof __require && __require, i = 0; i < o.length; i++) n(o[i]);
return n;
}({
CTRefactor$30681_f_supplementalLowScoreTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "9e9d6bCItRM0LMsEl8tnxfh", "CTRefactor$30681_f_supplementalLowScoreTrait");
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
}), a = this && this.__decorate || function(e, t, r, o) {
var n, a = arguments.length, i = a < 3 ? t : null === o ? o = Object.getOwnPropertyDescriptor(t, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) i = Reflect.decorate(e, t, r, o); else for (var p = e.length - 1; p >= 0; p--) (n = e[p]) && (i = (a < 3 ? n(i) : a > 3 ? n(t, r, i) : n(t, r)) || i);
return a > 3 && i && Object.defineProperty(t, r, i), i;
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
r.CTRefactor$30681_f_supplementalLowScoreTrait = void 0;
var p = "SupplementalLowScorerInfo", l = function(e) {
n(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._supplementalLowScorerInfo = null;
return t;
}
t.prototype.onCreate = function() {
this._supplementalLowScorerInfo = hs.storage.getItem(p, null);
this._supplementalLowScorerInfo && this._supplementalLowScorerInfo.type && this._supplementalLowScorerInfo.type !== this.props.req_type && this.clearRoundData();
};
t.prototype.isClassAlgorithmLifeCycle_GameEnd_ProxyOnGameEnd = function() {
this.overSendInfo();
};
t.prototype.onPostprocessConditionContext = function() {
var e = this, t = !1, r = null, o = function() {
if (!t) {
t = !0;
r = e.getReplacementAlgorithm();
}
return r;
};
return buildLazyConditionContext({
replacementAlgorithm: function() {
return ASContext(o(), "低得分补足策略替换算法");
}
});
};
t.prototype.onPostprocessConditions = function() {
return [ {
conditions: {
and: [ {
fact: "replacementAlgorithm",
operator: "!=",
value: null
} ]
},
event: {
type: "applySupplementalLowScore"
},
flow: "supplementalLowScore",
gameMode: "class"
} ];
};
t.prototype.onPostprocessActions = function() {
return {
supplementalLowScore: [ {
operator: "AlgorithmStrategyAlgorithmListOperator",
type: "replaceAll",
args: [ {
fact: "replacementAlgorithm"
} ]
}, {
operator: "AlgorithmStrategyReturnOperator",
type: "returnState",
args: [ as.AlgorithmStrategyReturnStateProcessType.POST_SDK_REQUEST_SUCCESS ]
} ]
};
};
t.prototype.applySupplementalLowScore = function() {
var e = TRAIT("RobotModelEventDataTrait");
(null == e ? void 0 : e.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Applay_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
feature_id: this.id,
model_output: hs.storage.getItem(p, null)
}));
};
t.prototype.overSendInfo = function() {
var e = this;
if (this.props.req_type && this.props.url) {
this.clearRoundData();
var t = hs.traitServerRequestInfo.uid;
hs.HUserRecentAdjust.online_service_pred(this.props.url, {
key: t,
req_type: this.props.req_type
}).then(function(t) {
var r = t[e.props.req_type];
if (r && 0 == r.code && r.data) {
var o = r.data, n = TRAIT("RobotModelEventDataTrait");
(null == n ? void 0 : n.active) && hs.EventManager.dispatchModuleEvent(new hs.E_HttpDot_Game_Model_Get_Request({
game_id: hs.gameInfo.gameNum,
game_type: hs.gameInfo.gameMode,
model_output: o,
feature_id: e.id
}));
if ("user_recent_adjust_score_1" === e.props.req_type) {
if (0 === o.rec_config.length) return;
e.supplementalLowScorerInfo = {
type: e.props.req_type,
num: o.rec_config[0].rate,
info: o.rec_config
};
} else "user_recent_adjust_score_2" === e.props.req_type && (e.supplementalLowScorerInfo = {
type: e.props.req_type,
num: o.board_id,
info: []
});
hs.storage.setItem(p, e.supplementalLowScorerInfo);
}
});
}
};
t.prototype.getReplacementAlgorithm = function() {
return "user_recent_adjust_score_1" !== this.props.req_type ? null : 5 === this.getReplaceRec() ? hs.OFFER_TYPE_BLANK.ALL_COMBINATION_ID9 : null;
};
t.prototype.getReplaceRec = function() {
var e, t, r = this.supplementalLowScorerInfo;
if (!r || !r.info) return null;
var o = hs.binarySupport.getWeightValue(hs.boardInfo.faceBlocks), n = function(e) {
if (!((null == e ? void 0 : e.weight_low) && (null == e ? void 0 : e.weight_high) && e.weight_low <= o && o <= e.weight_high)) return "continue";
if (Math.random() <= e.rate) {
var t = a.getRecName(e.origin_rec);
if (hs.algorithmName.algoActualName.every(function(e) {
return -1 !== e.indexOf(t);
})) return {
value: e.replace_rec
};
}
}, a = this;
try {
for (var p = i(r.info), l = p.next(); !l.done; l = p.next()) {
var u = n(l.value);
if ("object" == typeof u) return u.value;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (t = p.return) && t.call(p);
} finally {
if (e) throw e.error;
}
}
return null;
};
t.prototype.getRecName = function(e) {
return 19 === e ? "难题降级策略" : "";
};
Object.defineProperty(t.prototype, "supplementalLowScorerInfo", {
get: function() {
return this._supplementalLowScorerInfo;
},
set: function(e) {
this._supplementalLowScorerInfo = e;
hs.storage.setItem(p, e);
},
enumerable: !1,
configurable: !0
});
t.prototype.clearRoundData = function() {
this.supplementalLowScorerInfo = {
type: "",
num: 0,
info: []
};
};
return a([ classId("CTRefactor$30681_f_supplementalLowScoreTrait") ], t);
}(Trait);
r.CTRefactor$30681_f_supplementalLowScoreTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "CTRefactor$30681_f_supplementalLowScoreTrait" ]);
//# sourceMappingURL=index.js.map
