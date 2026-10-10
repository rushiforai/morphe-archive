window.__require = function e(t, i, n) {
function r(o, a) {
if (!i[o]) {
if (!t[o]) {
var u = o.split("/");
u = u[u.length - 1];
if (!t[u]) {
var h = "function" == typeof __require && __require;
if (!a && h) return h(u, !0);
if (s) return s(u, !0);
throw new Error("Cannot find module '" + o + "'");
}
o = u;
}
var p = i[o] = {
exports: {}
};
t[o][0].call(p.exports, function(e) {
return r(t[o][1][e] || e);
}, p, p.exports, e, t, i, n);
}
return i[o].exports;
}
for (var s = "function" == typeof __require && __require, o = 0; o < n.length; o++) r(n[o]);
return r;
}({
PushBackChangeSkinTrait: [ function(e, t, i) {
"use strict";
cc._RF.push(t, "10558zusfVPh4l9kbSHJcng", "PushBackChangeSkinTrait");
var n, r = this && this.__extends || (n = function(e, t) {
return (n = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
})(e, t);
}, function(e, t) {
n(e, t);
function i() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i());
}), s = this && this.__decorate || function(e, t, i, n) {
var r, s = arguments.length, o = s < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, i) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(e, t, i, n); else for (var a = e.length - 1; a >= 0; a--) (r = e[a]) && (o = (s < 3 ? r(o) : s > 3 ? r(t, i, o) : r(t, i)) || o);
return s > 3 && o && Object.defineProperty(t, i, o), o;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.PushBackChangeSkinTrait = void 0;
var o = {
pf_3011: "3011",
pf_3012: "3012",
pf_3017: "3017",
pf_3032: "3032",
pf_3033: "3033",
pf_4001: "4001",
pf_4003: "4003",
pf_4005: "4005",
pf_4008: "4008",
pf_4010: "4010",
pf_4019: "4019",
pf_4021: "4021",
pf_4026: "4026",
pf_4028: "4028",
pf_4035: "4035",
pf_4037: "4037",
pf_4042: "4042",
pf_4045: "4045",
pf_4051: "4051",
pf_4054: "4054",
pf_4055: "4055",
pf_4061: "4061",
pf_4063: "4063",
pf_4072: "4072",
pf_4078: "4078",
pf_4079: "4079"
}, a = function(e) {
r(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t._hasHandledColdStart = !1;
t._needChangeSkin = !1;
t._enterPushMessageCode = "";
t._threeSkinList = [];
t.isEnterClass = !1;
t._localData = null;
return t;
}
t.prototype.onCreate = function() {
this._threeSkinList = hs.storage.getItem("threeSkinList", []);
};
t.prototype.onActive = function(e) {
hs.tp.isLaunchChangeLaunchScene(e) && this.handleColdStart(e);
hs.tp.isSkin_ProxyLoadSkinCfg(e) && this.loadLocalSkin();
hs.tp.isSkin_ProxyLoadSkinCfgComplete(e);
if (hs.tp.isSkinThreeLoadInfoSetSkinThreeConfigToSkinConfig(e)) {
var t = e.args[0].replace("Remote_Skin_Material_", ""), i = parseInt(t);
i > 0 && this.addSkinId(i);
}
};
t.prototype.loadLocalSkin = function() {
if (!this._hasHandledColdStart) {
this._hasHandledColdStart = !0;
this.subscribePushOnColdStart();
if (this.isEnterByCurrentPush()) {
this.isEnterClass = !0;
this._needChangeSkin = !0;
this.tryChangeNextSkin();
}
}
};
t.prototype.addSkinId = function(e) {
if (!this._threeSkinList.includes(e)) {
this._threeSkinList.push(e);
hs.storage.setItem("threeSkinList", this._threeSkinList);
}
};
t.prototype.getSkinId = function(e) {
return this._threeSkinList.includes(e);
};
t.prototype.handleColdStart = function(e) {
if (this.isEnterClass) {
this.isEnterClass = !1;
e.args[0] = "class";
e.returnState = !0;
}
};
t.prototype.subscribePushOnColdStart = function() {
if (NativeBridge.isNative() && (!this.isAssignSkin || this.isSkinThreeActive())) {
var e = this.parseSendTime(), t = JSON.stringify({
strategyNum: this.taskType,
wayNum: this.opewaynum,
type: this.taskType,
hour: e.hour,
minute: e.minute,
second: 0
});
hs.NativePush.subscribePushTask(t);
}
};
t.prototype.gmSendPushAfterTwoMinutes = function() {
if (NativeBridge.isNative()) {
var e = hs.getCurentDate();
e.setTime(e.getTime() + 12e4);
var t = JSON.stringify({
strategyNum: this.taskType,
wayNum: this.opewaynum,
type: this.taskType,
hour: e.getHours(),
minute: e.getMinutes(),
second: e.getSeconds()
});
hs.NativePush.subscribePushTask(t);
}
};
t.prototype.gmLogOpenAppPushInfo = function() {
NativeBridge.isNative() && (hs.NativePush.callNativeGetPushStrategy(), hs.NativePush.callNativeGetPushInfo());
};
t.prototype.isEnterByCurrentPush = function() {
if (!NativeBridge.isNative()) return !1;
this._enterPushMessageCode = "";
this.isAssignSkin && this.checkEnterPushMessageCode();
var e = String(this.opewaynum), t = hs.NativePush.callNativeGetPushStrategy();
return !!t && t.indexOf(e) >= 0;
};
t.prototype.checkEnterPushMessageCode = function() {
var e;
if (hs.NativeSudokuIPAUtils.checkAppFuncSupport("7.1.4")) {
var t = hs.NativePush.callNativeGetPushInfo();
this._enterPushMessageCode = null !== (e = null == t ? void 0 : t.message_code) && void 0 !== e ? e : "";
} else this._enterPushMessageCode = "";
};
t.prototype.tryChangeNextSkin = function() {
if (this._needChangeSkin) {
var e = this.getNextSkinId();
if ("-1" != e) {
this._needChangeSkin = !1;
storage.setItem("currentSkinId", "" + e);
hs.skinInfo.setCurrentSkinIdTemporary("" + e);
}
}
};
t.prototype.isSkinThreeActive = function() {
var e;
return (null === (e = TRAIT("SkinThreeStageTrait")) || void 0 === e ? void 0 : e.active) || !1;
};
t.prototype.getNextSkinId = function() {
if (!this.isSkinThreeActive()) return "-1";
if (this.isAssignSkin) {
var e = o[this._enterPushMessageCode], t = this.getSkinId(+e);
return e && t ? e : "-1";
}
var i = this.getSkinList();
return Array.isArray(i) && i.length > 0 ? i[Math.floor(Math.random() * i.length)].toString() : "-1";
};
t.prototype.getSkinList = function() {
return this._threeSkinList;
};
t.prototype.parseSendTime = function() {
var e = this.sendTime.split(":"), t = Number(e[0]), i = Number(e[1]);
return {
hour: Number.isFinite(t) ? t : 0,
minute: Number.isFinite(i) ? i : 0
};
};
t.prototype.getPushTimeMs = function() {
var e = this.parseSendTime(), t = hs.getCurentDate(), i = hs.getCurentDate();
i.setHours(e.hour, e.minute, 0, 0);
i.getTime() <= t.getTime() && i.setDate(i.getDate() + 1);
return Math.floor(i.getTime());
};
Object.defineProperty(t.prototype, "localData", {
get: function() {
this._localData || (this._localData = hs.storage.getItem("PushBackChangeSkinTraitLocalKey", {
__gmPushState: 0
}));
return this._localData;
},
enumerable: !1,
configurable: !0
});
t.prototype.saveLocalData = function() {
hs.storage.setItem("PushBackChangeSkinTraitLocalKey", this.localData);
};
Object.defineProperty(t.prototype, "sendTime", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.sendTime) && void 0 !== t ? t : "00:00";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "taskType", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.taskType) && void 0 !== t ? t : "";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "opewaynum", {
get: function() {
var e, t;
return null !== (t = String(null === (e = this.props) || void 0 === e ? void 0 : e.opewaynum)) && void 0 !== t ? t : "";
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "isAssignSkin", {
get: function() {
var e, t;
return null !== (t = null === (e = this.props) || void 0 === e ? void 0 : e.assignSkin) && void 0 !== t && t;
},
enumerable: !1,
configurable: !0
});
return s([ classId("PushBackChangeSkinTrait") ], t);
}(Trait);
i.PushBackChangeSkinTrait = a;
cc._RF.pop();
}, {} ]
}, {}, [ "PushBackChangeSkinTrait" ]);
//# sourceMappingURL=index.js.map
