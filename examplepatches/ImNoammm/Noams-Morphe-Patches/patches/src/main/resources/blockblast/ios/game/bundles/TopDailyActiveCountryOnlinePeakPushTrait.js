window.__require = function e(t, r, n) {
function o(u, s) {
if (!r[u]) {
if (!t[u]) {
var a = u.split("/");
a = a[a.length - 1];
if (!t[a]) {
var p = "function" == typeof __require && __require;
if (!s && p) return p(a, !0);
if (i) return i(a, !0);
throw new Error("Cannot find module '" + u + "'");
}
u = a;
}
var c = r[u] = {
exports: {}
};
t[u][0].call(c.exports, function(e) {
return o(t[u][1][e] || e);
}, c, c.exports, e, t, r, n);
}
return r[u].exports;
}
for (var i = "function" == typeof __require && __require, u = 0; u < n.length; u++) o(n[u]);
return o;
}({
TopDailyActiveCountryOnlinePeakPushTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "2b548htLGBBLZBHg++sCNDA", "TopDailyActiveCountryOnlinePeakPushTrait");
var n, o = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
n(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), i = this && this.__decorate || function(e, t, r, n) {
var o, i = arguments.length, u = i < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) u = Reflect.decorate(e, t, r, n); else for (var s = e.length - 1; s >= 0; s--) (o = e[s]) && (u = (i < 3 ? o(u) : i > 3 ? o(t, r, u) : o(t, r)) || u);
return i > 3 && u && Object.defineProperty(t, r, u), u;
}, u = this && this.__read || function(e, t) {
var r = "function" == typeof Symbol && e[Symbol.iterator];
if (!r) return e;
var n, o, i = r.call(e), u = [];
try {
for (;(void 0 === t || t-- > 0) && !(n = i.next()).done; ) u.push(n.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
n && !n.done && (r = i.return) && r.call(i);
} finally {
if (o) throw o.error;
}
}
return u;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.TopDailyActiveCountryOnlinePeakPushTrait = void 0;
var s = function(e) {
o(t, e);
function t() {
return null !== e && e.apply(this, arguments) || this;
}
t.prototype.onCreate = function() {};
t.prototype.onActive = function(e) {
hs.tp.isLaunchChangeLaunchScene(e) && this.trySendPush();
};
t.prototype.trySendPush = function() {
var e = this.sendTime;
if (e) {
var t = this.parseSendTime(e), r = JSON.stringify({
strategyNum: this.props.taskType,
wayNum: this.opewaynum,
type: this.props.taskType,
hour: t.hour,
minute: t.minute,
second: 0
});
hs.NativePush.subscribePushTask(r);
}
};
t.prototype.gmSendPushAfterTwoMinutes = function() {
if (NativeBridge.isNative()) {
var e = hs.getCurentDate();
e.setTime(e.getTime() + 12e4);
Math.floor(e.getTime());
var t = JSON.stringify({
strategyNum: this.props.taskType,
wayNum: this.opewaynum,
type: this.props.taskType,
hour: e.getHours(),
minute: e.getMinutes(),
second: e.getSeconds()
});
hs.NativePush.subscribePushTask(t);
}
};
Object.defineProperty(t.prototype, "sendTimeList", {
get: function() {
var e;
return null !== (e = this.props.sendTimeList) && void 0 !== e ? e : {};
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "sendTime", {
get: function() {
var e, t, r = this.country, n = this.sendTimeList;
return n && "object" == typeof n && n.hasOwnProperty(r) ? null !== (e = n[r]) && void 0 !== e ? e : "14:00" : null !== (t = this.props.sendTime) && void 0 !== t ? t : "14:00";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "country", {
get: function() {
var e, t;
return ((null === (t = null === (e = hs.deviceInfo) || void 0 === e ? void 0 : e.data) || void 0 === t ? void 0 : t.country) || "").toUpperCase();
},
enumerable: !1,
configurable: !0
});
t.prototype.getPushTimeMs = function(e) {
var t = this.parseSendTime(e), r = hs.getCurentDate(), n = hs.getCurentDate();
n.setHours(t.hour, t.minute, 0, 0);
n.getTime() <= r.getTime() && n.setDate(n.getDate() + 1);
return Math.floor(n.getTime());
};
t.prototype.parseSendTime = function(e) {
var t = u(e.split(":").map(Number), 2), r = t[0], n = t[1];
return {
hour: isNaN(r) || r < 0 || r > 23 ? 0 : r,
minute: isNaN(n) || n < 0 || n > 59 ? 0 : n
};
};
Object.defineProperty(t.prototype, "opewaynum", {
get: function() {
var e, t;
return null !== (t = String(null === (e = this.props) || void 0 === e ? void 0 : e.opewaynum)) && void 0 !== t ? t : "";
},
enumerable: !1,
configurable: !0
});
return i([ classId("TopDailyActiveCountryOnlinePeakPushTrait") ], t);
}(Trait);
r.TopDailyActiveCountryOnlinePeakPushTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "TopDailyActiveCountryOnlinePeakPushTrait" ]);
//# sourceMappingURL=index.js.map
