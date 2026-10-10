window.__require = function t(e, r, o) {
function i(n, s) {
if (!r[n]) {
if (!e[n]) {
var l = n.split("/");
l = l[l.length - 1];
if (!e[l]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(l, !0);
if (a) return a(l, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = l;
}
var u = r[n] = {
exports: {}
};
e[n][0].call(u.exports, function(t) {
return i(e[n][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[n].exports;
}
for (var a = "function" == typeof __require && __require, n = 0; n < o.length; n++) i(o[n]);
return i;
}({
GBMDataCompatibilityTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "25f053DBrpHD7UWkGxbMUpH", "GBMDataCompatibilityTrait");
var o, i = this && this.__extends || (o = function(t, e) {
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
}), a = this && this.__decorate || function(t, e, r, o) {
var i, a = arguments.length, n = a < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, r, o); else for (var s = t.length - 1; s >= 0; s--) (i = t[s]) && (n = (a < 3 ? i(n) : a > 3 ? i(e, r, n) : i(e, r)) || n);
return a > 3 && n && Object.defineProperty(e, r, n), n;
}, n = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, i, a = r.call(t), n = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = a.next()).done; ) n.push(o.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
o && !o.done && (r = a.return) && r.call(a);
} finally {
if (i) throw i.error;
}
}
return n;
}, s = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(n(arguments[e]));
return t;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.GBMDataCompatibilityTrait = void 0;
var l = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.registerTraitEventsMethods = function() {
return [ {
className: "DataCompatibilityIos_Data_Proxy",
methodName: "onTraitConfig_InitComplete"
} ];
};
e.prototype.onActive = function(t) {
if (hs.tp.isDataCompatibilityIos_Data_ProxyOnTraitConfig_InitComplete(t)) {
this.doProcessClassRoundGBMServerData();
this.doProcessClassGameOverGBMServerData();
}
};
e.prototype.doProcessClassRoundGBMServerData = function() {
this.processDataField("classRoundGBMServerData", function() {
var t = localStorage.getItem("PostGameToServerController_curSaveTurn");
if (t) {
var e = JSON.parse(t);
if (e && e.turns) {
var r = e.turns;
if (Array.isArray(r) && r.length > 0) {
var o = s(r);
storage.setItem("classRoundGBMServerData", o);
}
}
}
});
};
e.prototype.doProcessClassGameOverGBMServerData = function() {
this.processDataField("classGameOverGBMServerData", function() {
var t, e, r, o, i, a, n, s, l, c, u, _, d, f, p, v, y, h = localStorage.getItem("PostGameToServerController_gameInfoData");
if (h) {
var m = JSON.parse(h);
if (m && m.overBlockHistInfo) {
var g = m.overBlockHistInfo;
if (Array.isArray(g) && g.length > 0) {
for (var b = [], D = 0; D < g.length; D++) {
var G = g[D];
b.push({
dead_weight: null !== (t = G.dead_weight) && void 0 !== t ? t : 0,
dead_question: null !== (e = G.dead_question) && void 0 !== e ? e : "",
top_score: null !== (r = G.top_score) && void 0 !== r ? r : 0,
pipe_id: null !== (o = G.pipe_id) && void 0 !== o ? o : 0,
duration: null !== (i = G.duration) && void 0 !== i ? i : 0,
score: null !== (a = G.score) && void 0 !== a ? a : 0,
round_cnt: null !== (n = G.round_cnt) && void 0 !== n ? n : 0,
remain_block_cnt: null !== (s = G.remain_block_cnt) && void 0 !== s ? s : [],
game_id: null !== (l = G.game_id) && void 0 !== l ? l : 0,
game_start_timestamp: null !== (c = G.game_start_timestamp) && void 0 !== c ? c : 0,
board_init_id: null !== (u = G.board_init_id) && void 0 !== u ? u : 0,
board_init_weight: null !== (_ = G.board_init_weight) && void 0 !== _ ? _ : 0,
revive_success: null !== (d = G.revive_success) && void 0 !== d ? d : 0,
revive_show: null !== (f = G.revive_show) && void 0 !== f ? f : 0,
combo_info: null !== (p = G.combo_info) && void 0 !== p ? p : [],
round_info: null !== (v = G.round_info) && void 0 !== v ? v : [],
dead_reason: null !== (y = G.dead_reason) && void 0 !== y ? y : -1
});
}
storage.setItem("classGameOverGBMServerData", b);
}
}
}
});
};
e.prototype.processDataField = function(t, e) {
if (storage.getItem(t)) ; else try {
e();
} catch (t) {}
};
return a([ classId("GBMDataCompatibilityTrait") ], e);
}(Trait);
r.GBMDataCompatibilityTrait = l;
cc._RF.pop();
}, {} ]
}, {}, [ "GBMDataCompatibilityTrait" ]);
//# sourceMappingURL=index.js.map
