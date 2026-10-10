window.__require = function t(e, r, o) {
function i(a, u) {
if (!r[a]) {
if (!e[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!e[s]) {
var c = "function" == typeof __require && __require;
if (!u && c) return c(s, !0);
if (n) return n(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var l = r[a] = {
exports: {}
};
e[a][0].call(l.exports, function(t) {
return i(e[a][1][t] || t);
}, l, l.exports, t, e, r, o);
}
return r[a].exports;
}
for (var n = "function" == typeof __require && __require, a = 0; a < o.length; a++) i(o[a]);
return i;
}({
PushBackNoAdTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "2688ahviatBApm06kIxP5m7", "PushBackNoAdTrait");
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
}), n = this && this.__decorate || function(t, e, r, o) {
var i, n = arguments.length, a = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, r, o); else for (var u = t.length - 1; u >= 0; u--) (i = t[u]) && (a = (n < 3 ? i(a) : n > 3 ? i(e, r, a) : i(e, r)) || a);
return n > 3 && a && Object.defineProperty(e, r, a), a;
}, a = this && this.__read || function(t, e) {
var r = "function" == typeof Symbol && t[Symbol.iterator];
if (!r) return t;
var o, i, n = r.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = n.next()).done; ) a.push(o.value);
} catch (t) {
i = {
error: t
};
} finally {
try {
o && !o.done && (r = n.return) && r.call(n);
} finally {
if (i) throw i.error;
}
}
return a;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.PushBackNoAdTrait = void 0;
var u = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._hasHandledColdStart = !1;
e._isEnteredByCurrentPush = !1;
e._localData = null;
return e;
}
e.prototype.onCreate = function() {};
e.prototype.onActive = function(t) {
hs.tp.isLaunchChangeLaunchScene(t) && this.handleColdStart();
if (hs.tp.isBackPlayerNoAdTraitGetShowUIByTrait(t)) {
t.returnValue = this.showUI;
t.returnState = !0;
}
if (hs.tp.isBackPlayerNoAdTraitGetCountDownTimeEndByTrait(t)) {
t.returnValue = this.countDownTimeEnd;
t.returnState = !0;
}
if (hs.tp.isBackPlayerNoAdTraitGetShieldTypeByTrait(t)) {
t.returnValue = this.shieldType;
t.returnState = !0;
}
};
e.prototype.handleColdStart = function() {
if (!this._hasHandledColdStart) {
this._hasHandledColdStart = !0;
this.subscribePushOnColdStart();
this._isEnteredByCurrentPush = this.isEnterByCurrentPush();
this.tryActivateNoAdByPushBack();
}
};
e.prototype.tryActivateNoAdByPushBack = function() {
if (this._isEnteredByCurrentPush) {
var t = Date.now();
if (this.isCountDownTimeUpdatedToday(t)) ; else {
var e = t + 6e4 * this.durationMinutes;
this.localData.countDownTimeEnd = e;
this.localData.countDownTimeUpdateTime = t;
this.saveLocalData();
}
}
};
e.prototype.isCountDownTimeUpdatedToday = function(t) {
var e = this.localData.countDownTimeUpdateTime || 0;
return e > 0 && hs.isSameDay(e, t);
};
e.prototype.subscribePushOnColdStart = function() {
if (NativeBridge.isNative()) {
var t = this.parseSendTime(), e = JSON.stringify({
strategyNum: this.taskType,
wayNum: this.opewaynum,
type: this.taskType,
hour: t.hour,
minute: t.minute,
second: 0
});
hs.NativePush.subscribePushTask(e);
}
};
e.prototype.gmSendPushAfterTwoMinutes = function() {
if (NativeBridge.isNative()) {
var t = hs.getCurentDate();
t.setTime(t.getTime() + 12e4);
var e = JSON.stringify({
strategyNum: this.taskType,
wayNum: this.opewaynum,
type: this.taskType,
hour: t.getHours(),
minute: t.getMinutes(),
second: t.getSeconds()
});
hs.NativePush.subscribePushTask(e);
}
};
e.prototype.isEnterByCurrentPush = function() {
if (!NativeBridge.isNative()) return !1;
var t = this.opewaynum.trim();
if (!t) return !1;
var e = hs.NativePush.callNativeGetPushStrategy();
return e && e.includes(t);
};
e.prototype.parseSendTime = function() {
var t = a(this.sendTime.split(":").map(Number), 2), e = t[0], r = t[1];
return {
hour: isNaN(e) || e < 0 || e > 23 ? 0 : e,
minute: isNaN(r) || r < 0 || r > 59 ? 0 : r
};
};
e.prototype.getPushTimeMs = function() {
var t = this.parseSendTime(), e = hs.getCurentDate(), r = hs.getCurentDate();
r.setHours(t.hour, t.minute, 0, 0);
r.getTime() <= e.getTime() && r.setDate(r.getDate() + 1);
return Math.floor(r.getTime());
};
Object.defineProperty(e.prototype, "localData", {
get: function() {
this._localData || (this._localData = hs.storage.getItem("PushBackNoAdTraitLocalKey", {
countDownTimeEnd: 0,
countDownTimeUpdateTime: 0,
__gmPushState: !1
}));
return this._localData;
},
enumerable: !1,
configurable: !0
});
e.prototype.saveLocalData = function() {
hs.storage.setItem("PushBackNoAdTraitLocalKey", this.localData);
};
Object.defineProperty(e.prototype, "countDownTimeEnd", {
get: function() {
return this.localData.countDownTimeEnd || 0;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "sendTime", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.sendTime) && void 0 !== e ? e : "00:00";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "taskType", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.taskType) && void 0 !== e ? e : "";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "opewaynum", {
get: function() {
var t, e;
return null !== (e = String(null === (t = this.props) || void 0 === t ? void 0 : t.opewaynum)) && void 0 !== e ? e : "";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "duration", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.duration) && void 0 !== e ? e : 30;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "durationMinutes", {
get: function() {
return Math.max(0, this.duration);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "showUI", {
get: function() {
var t, e;
return null === (e = null === (t = this.props) || void 0 === t ? void 0 : t.showUI) || void 0 === e || e;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(e.prototype, "shieldType", {
get: function() {
var t, e;
return null !== (e = null === (t = this.props) || void 0 === t ? void 0 : t.shiedType) && void 0 !== e ? e : 3;
},
enumerable: !1,
configurable: !0
});
return n([ classId("PushBackNoAdTrait") ], e);
}(Trait);
r.PushBackNoAdTrait = u;
cc._RF.pop();
}, {} ]
}, {}, [ "PushBackNoAdTrait" ]);
//# sourceMappingURL=index.js.map
