window.__require = function t(e, n, o) {
function i(r, l) {
if (!n[r]) {
if (!e[r]) {
var a = r.split("/");
a = a[a.length - 1];
if (!e[a]) {
var d = "function" == typeof __require && __require;
if (!l && d) return d(a, !0);
if (s) return s(a, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = a;
}
var c = n[r] = {
exports: {}
};
e[r][0].call(c.exports, function(t) {
return i(e[r][1][t] || t);
}, c, c.exports, t, e, n, o);
}
return n[r].exports;
}
for (var s = "function" == typeof __require && __require, r = 0; r < o.length; r++) i(o[r]);
return i;
}({
DownloadCancelTrait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "866e6Y9Fw9BqZvpYEKWwFCU", "DownloadCancelTrait");
var o, i = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
o(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, o) {
var i, s = arguments.length, r = s < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, o); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (r = (s < 3 ? i(r) : s > 3 ? i(e, n, r) : i(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
}, r = this && this.__awaiter || function(t, e, n, o) {
return new (n || (n = Promise))(function(i, s) {
function r(t) {
try {
a(o.next(t));
} catch (t) {
s(t);
}
}
function l(t) {
try {
a(o.throw(t));
} catch (t) {
s(t);
}
}
function a(t) {
t.done ? i(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(r, l);
var e;
}
a((o = o.apply(t, e || [])).next());
});
}, l = this && this.__generator || function(t, e) {
var n, o, i, s, r = {
label: 0,
sent: function() {
if (1 & i[0]) throw i[1];
return i[1];
},
trys: [],
ops: []
};
return s = {
next: l(0),
throw: l(1),
return: l(2)
}, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
return this;
}), s;
function l(t) {
return function(e) {
return a([ t, e ]);
};
}
function a(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (n = 1, o && (i = 2 & s[0] ? o.return : s[0] ? o.throw || ((i = o.return) && i.call(o), 
0) : o.next) && !(i = i.call(o, s[1])).done) return i;
(o = 0, i) && (s = [ 2 & s[0], i.value ]);
switch (s[0]) {
case 0:
case 1:
i = s;
break;

case 4:
r.label++;
return {
value: s[1],
done: !1
};

case 5:
r.label++;
o = s[1];
s = [ 0 ];
continue;

case 7:
s = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(i = r.trys, i = i.length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
r = 0;
continue;
}
if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
r.label = s[1];
break;
}
if (6 === s[0] && r.label < i[1]) {
r.label = i[1];
i = s;
break;
}
if (i && r.label < i[2]) {
r.label = i[2];
r.ops.push(s);
break;
}
i[2] && r.ops.pop();
r.trys.pop();
continue;
}
s = e.call(t, r);
} catch (t) {
s = [ 6, t ];
o = 0;
} finally {
n = i = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}
}, a = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, n = e && t[e], o = 0;
if (n) return n.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && o >= t.length && (t = void 0);
return {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.DownloadCancelTrait = void 0;
var d = t("./DownloadWindow"), c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._windowNode = null;
e._windowComponent = null;
e._isShowing = !1;
return e;
}
n = e;
Object.defineProperty(e.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
});
e.prototype.onActive = function() {};
e.prototype.showDownloadWindow = function(t) {
var e, o;
return r(this, void 0, Promise, function() {
var i, s;
return l(this, function(r) {
switch (r.label) {
case 0:
if (this._isShowing && this._windowComponent) {
this._windowComponent.show(null !== (e = null == t ? void 0 : t.showDetailed) && void 0 !== e && e);
return [ 2, this._windowComponent ];
}
r.label = 1;

case 1:
r.trys.push([ 1, 3, , 4 ]);
return [ 4, hs.ResLoader.asyncLoadByBundle(n.BUNDLE_NAME, n.PREFAB_PATH, cc.Prefab) ];

case 2:
if (!(i = r.sent()) || !cc.isValid(i)) return [ 2, null ];
this._windowNode = cc.instantiate(i);
if (!this._windowNode) return [ 2, null ];
if ((s = cc.director.getScene()) && cc.isValid(s)) {
s.addChild(this._windowNode);
this._windowNode.zIndex = 9999;
}
this._windowComponent = this._windowNode.addComponent(d.default);
this.bindNodeReferences();
this._windowComponent.initAfterBinding();
(null == t ? void 0 : t.onPause) && this._windowComponent.setOnPause(t.onPause);
(null == t ? void 0 : t.onResume) && this._windowComponent.setOnResume(t.onResume);
(null == t ? void 0 : t.onCancel) && this._windowComponent.setOnCancel(t.onCancel);
this._windowComponent.show(null !== (o = null == t ? void 0 : t.showDetailed) && void 0 !== o && o);
this._isShowing = !0;
return [ 2, this._windowComponent ];

case 3:
r.sent();
return [ 2, null ];

case 4:
return [ 2 ];
}
});
});
};
e.prototype.bindNodeReferences = function() {
if (this._windowNode && this._windowComponent) {
var t = this._windowNode.getChildByName("detailedWindow");
if (t) {
this._windowComponent.detailedWindow = t;
if (s = t.getChildByName("progressBar")) {
this._windowComponent.detailedProgressBar = s.getComponent(cc.ProgressBar);
(r = s.getChildByName("label")) && (this._windowComponent.detailedProgressLabel = r.getComponent(cc.Label));
}
var e = t.getChildByName("btn_Pause");
e && (this._windowComponent.btnPause = e.getComponent(cc.Button));
var n = t.getChildByName("btn_Cancel");
n && (this._windowComponent.btnCancel = n.getComponent(cc.Button));
var o = t.getChildByName("btn_Min");
o && (this._windowComponent.btnMin = o.getComponent(cc.Button));
}
var i = this._windowNode.getChildByName("simpleWindow");
if (i) {
this._windowComponent.simpleWindow = i;
var s;
if (s = i.getChildByName("progressBar")) {
this._windowComponent.simpleProgressBar = s.getComponent(cc.ProgressBar);
var r;
(r = s.getChildByName("label")) && (this._windowComponent.simpleProgressLabel = r.getComponent(cc.Label));
}
var l = i.getChildByName("bg");
l && (this._windowComponent.simpleWindowBg = l.getComponent(cc.Button));
}
}
};
e.prototype.hideDownloadWindow = function() {
this._windowComponent && this._windowComponent.hide();
this._isShowing = !1;
};
e.prototype.destroyDownloadWindow = function() {
this._windowNode && cc.isValid(this._windowNode) && this._windowNode.destroy();
this._windowNode = null;
this._windowComponent = null;
this._isShowing = !1;
};
e.prototype.updateProgress = function(t, e) {
this._windowComponent && this._windowComponent.updateProgress(t, e);
};
e.prototype.setDownloadTask = function(t) {
this._windowComponent && this._windowComponent.setDownloadTask(t);
};
e.prototype.setCompleted = function() {
this._windowComponent && this._windowComponent.setCompleted();
};
e.prototype.getWindowComponent = function() {
return this._windowComponent;
};
e.prototype.isShowing = function() {
return this._isShowing;
};
e.prototype.downloadBundleWithUI = function(t, e) {
void 0 === e && (e = !1);
return r(this, void 0, Promise, function() {
var n, o, i, s = this;
return l(this, function(r) {
switch (r.label) {
case 0:
if (0 === (n = Array.isArray(t) ? t : [ t ]).length) return [ 2, !0 ];
o = {
isCancelled: !1,
isPaused: !1
};
return [ 4, this.showDownloadWindow({
showDetailed: e,
onPause: function() {
o.isPaused = !0;
s.destroyDownloadWindow();
},
onResume: function() {},
onCancel: function() {
s.destroyDownloadWindow();
o.isCancelled = !0;
}
}) ];

case 1:
if (!(i = r.sent())) return [ 2, !1 ];
i.clearTasks();
return [ 4, this.downloadBundle(n, o) ];

case 2:
if (!r.sent()) return [ 2, !1 ];
this.setCompleted();
return [ 2, !0 ];
}
});
});
};
e.prototype.downloadZipWithUI = function(t, e) {
void 0 === e && (e = !1);
return r(this, void 0, Promise, function() {
var n, o, i, s, r, a, d, c, u, p, h, w, f, y, m = this;
return l(this, function(l) {
switch (l.label) {
case 0:
if (!cc.sys.isNative) return [ 2, !1 ];
n = new jsb.DownloadClient();
o = this.getRemoteBundleUrl(t);
i = jsb.fileUtils.getWritablePath();
r = (s = i + "/download/assets/") + t;
a = -1;
d = null;
c = !1;
jsb.fileUtils.getSearchPaths().includes(i + "/download/") || jsb.fileUtils.addSearchPath(i + "/download/", !0);
u = function(t) {
if (!c) {
c = !0;
null == d || d(t);
}
};
return [ 4, this.showDownloadWindow({
showDetailed: e,
onPause: function() {
-1 !== a && n.abort(a, !1);
m.destroyDownloadWindow();
u(!1);
},
onResume: function() {},
onCancel: function() {
-1 !== a && n.abort(a, !0);
jsb.fileUtils.removeDirectory(s);
m.destroyDownloadWindow();
u(!1);
}
}) ];

case 1:
if (!(p = l.sent())) return [ 2, !1 ];
p.clearTasks();
jsb.fileUtils.isDirectoryExist(s) || jsb.fileUtils.createDirectory(s);
h = [ 4e3, 8e3, 16e3, 32e3, 4e3 ];
w = !1;
f = function(t, e) {
if ((e = e || 0) >= h.length || c) {
-1 !== a && n.abort(a, !1);
m.destroyDownloadWindow();
t(!1);
} else setTimeoutSafe(function() {
if (!w) {
e++;
y(t);
f(t, e);
}
}, h[e]);
};
y = function(t) {
a = n.downloadFile({
url: o,
path: r,
enableResume: !0,
success: function() {
jsb.fileUtils.unzip({
zipPath: r,
destPath: s,
success: function() {
m.setCompleted();
t(!0);
},
failure: function() {
t(!1);
}
});
},
progress: function(t, e, n, o) {
w = !0;
var i = Number((n / 1024 / 1024).toFixed(2)), s = Number((o / 1024 / 1024).toFixed(2));
o > 0 && Math.floor(i / s * 100);
m.updateProgress(i, s);
},
failure: function() {
if (w) {
w = !1;
f(t);
}
}
});
};
return [ 2, new Promise(function(t) {
d = t;
y(function(t) {
u(t);
});
}) ];
}
});
});
};
e.prototype.downloadBundle = function(t, e) {
return r(this, void 0, Promise, function() {
var n, o, i, s, r, d, c, u, p, h, w, f, y;
return l(this, function(l) {
switch (l.label) {
case 0:
n = [];
o = 0;
l.label = 1;

case 1:
l.trys.push([ 1, 8, 9, 10 ]);
i = a(t), s = i.next();
l.label = 2;

case 2:
if (s.done) return [ 3, 7 ];
r = s.value;
if (e.isCancelled || e.isPaused) return [ 2, !1 ];
l.label = 3;

case 3:
l.trys.push([ 3, 5, , 6 ]);
return [ 4, this.loadBundleAsync(r) ];

case 4:
if (!(h = l.sent())) return [ 2, !1 ];
if ((w = this.getBundleAssetPaths(h)).length > 0) {
n.push({
bundle: h,
paths: w
});
o += w.length;
}
return [ 3, 6 ];

case 5:
l.sent();
return [ 2, !1 ];

case 6:
s = i.next();
return [ 3, 2 ];

case 7:
return [ 3, 10 ];

case 8:
d = l.sent();
f = {
error: d
};
return [ 3, 10 ];

case 9:
try {
s && !s.done && (y = i.return) && y.call(i);
} finally {
if (f) throw f.error;
}
return [ 7 ];

case 10:
if (0 === o) {
this.setCompleted();
return [ 2, !0 ];
}
c = 0;
u = 0;
l.label = 11;

case 11:
if (!(u < n.length)) return [ 3, 14 ];
if (e.isCancelled || e.isPaused) return [ 2, !1 ];
p = n[u], h = p.bundle, w = p.paths;
return [ 4, this.loadBundleAssetsWithProgress(h, w, c, o) ];

case 12:
if (!l.sent()) return [ 2, !1 ];
c += w.length;
l.label = 13;

case 13:
u++;
return [ 3, 11 ];

case 14:
return [ 2, !0 ];
}
});
});
};
e.prototype.loadBundleAsync = function() {
return new Promise(function() {});
};
e.prototype.getBundleAssetPaths = function(t) {
var e, n = null === (e = t._config) || void 0 === e ? void 0 : e.paths;
if (!n) return [];
var o = n._map || {};
return Object.keys(o);
};
e.prototype.loadBundleAssetsWithProgress = function() {
return new Promise(function() {});
};
e.prototype.getIOSRemoteBundleUrl = function(t) {
return hs.isMultilink() ? hs.envInfo.remoteResServerUrl + "/remote/" + t : hs.envInfo.remoteResServerUrl + "/remote/ios/prod/" + t;
};
e.prototype.getRemoteBundleUrl = function(t) {
return this.getIOSRemoteBundleUrl(t);
};
var n;
e.PREFAB_PATH = "prefabs/downloadWindow";
e.BUNDLE_NAME = "DownloadCancelTrait";
return n = s([ classId("DownloadCancelTrait") ], e);
}(Trait);
n.DownloadCancelTrait = c;
cc._RF.pop();
}, {
"./DownloadWindow": "DownloadWindow"
} ],
DownloadWindow: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "40247Zq1UpAlpsAbatGAB2W", "DownloadWindow");
var o, i = this && this.__extends || (o = function(t, e) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
o(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, o) {
var i, s = arguments.length, r = s < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, o); else for (var l = t.length - 1; l >= 0; l--) (i = t[l]) && (r = (s < 3 ? i(r) : s > 3 ? i(e, n, r) : i(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.DownloadStatus = void 0;
var r, l = cc._decorator, a = l.ccclass, d = l.property;
(function(t) {
t.Downloading = "downloading";
t.Paused = "paused";
t.Cancelled = "cancelled";
t.Completed = "completed";
})(r = n.DownloadStatus || (n.DownloadStatus = {}));
var c = function(t) {
i(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.detailedWindow = null;
e.detailedProgressBar = null;
e.detailedProgressLabel = null;
e.btnPause = null;
e.btnCancel = null;
e.btnMin = null;
e.simpleWindow = null;
e.simpleProgressBar = null;
e.simpleProgressLabel = null;
e.simpleWindowBg = null;
e._tasks = [];
e._onPause = null;
e._onCancel = null;
e._onResume = null;
return e;
}
e.prototype.setDownloadTask = function(t) {
t && this._tasks.push(t);
};
e.prototype.clearTasks = function() {
this._tasks = [];
};
e.prototype.cancelAllTasks = function() {
this._tasks = [];
};
e.prototype.setOnPause = function(t) {
this._onPause = t;
};
e.prototype.setOnCancel = function(t) {
this._onCancel = t;
};
e.prototype.setOnResume = function(t) {
this._onResume = t;
};
e.prototype.componentDidMount = function() {
this.setState({
progress: 0,
downloadedCount: 0,
totalCount: 0,
status: r.Downloading,
showDetailedWindow: !1
});
};
e.prototype.initAfterBinding = function() {
this.bindButtonEvents();
};
e.prototype.componentWillUnmount = function() {
this.unbindButtonEvents();
};
e.prototype.bindButtonEvents = function() {
var t, e, n, o;
(null === (t = this.btnMin) || void 0 === t ? void 0 : t.node) && this.btnMin.node.on("click", this.onMinClick, this);
(null === (e = this.btnPause) || void 0 === e ? void 0 : e.node) && this.btnPause.node.on("click", this.onPauseClick, this);
(null === (n = this.btnCancel) || void 0 === n ? void 0 : n.node) && this.btnCancel.node.on("click", this.onCancelClick, this);
(null === (o = this.simpleWindowBg) || void 0 === o ? void 0 : o.node) && this.simpleWindowBg.node.on("click", this.onSimpleWindowClick, this);
};
e.prototype.unbindButtonEvents = function() {
var t, e, n, o;
(null === (t = this.btnMin) || void 0 === t ? void 0 : t.node) && this.btnMin.node.off("click", this.onMinClick, this);
(null === (e = this.btnPause) || void 0 === e ? void 0 : e.node) && this.btnPause.node.off("click", this.onPauseClick, this);
(null === (n = this.btnCancel) || void 0 === n ? void 0 : n.node) && this.btnCancel.node.off("click", this.onCancelClick, this);
(null === (o = this.simpleWindowBg) || void 0 === o ? void 0 : o.node) && this.simpleWindowBg.node.off("click", this.onSimpleWindowClick, this);
};
e.prototype.onMinClick = function() {
this.setState({
showDetailedWindow: !1
});
};
e.prototype.onSimpleWindowClick = function() {
this.setState({
showDetailedWindow: !0
});
};
e.prototype.onPauseClick = function() {
this.cancelAllTasks();
this.setState({
status: r.Paused
});
this._onPause && this._onPause();
};
e.prototype.onCancelClick = function() {
this.cancelAllTasks();
this.setState({
status: r.Cancelled
});
this._onCancel && this._onCancel();
};
e.prototype.updateProgress = function(t, e) {
var n = e > 0 ? t / e : 0;
this.setState({
progress: Math.min(n, 1),
downloadedCount: t,
totalCount: e
});
};
e.prototype.setCompleted = function() {
this.setState({
progress: 1,
status: r.Completed
});
};
e.prototype.hide = function() {
this.node && cc.isValid(this.node) && (this.node.active = !1);
};
e.prototype.show = function(t) {
void 0 === t && (t = !1);
if (this.node && cc.isValid(this.node)) {
this.node.active = !0;
this.setState({
showDetailedWindow: t
});
}
};
e.prototype.render = function() {
var t = this.state, e = t.progress, n = t.downloadedCount, o = t.totalCount, i = t.showDetailedWindow;
this.detailedWindow && (this.detailedWindow.active = i);
this.simpleWindow && (this.simpleWindow.active = !i);
var s = e || 0, r = (n || 0) + "/" + (o || 0);
this.detailedProgressBar && (this.detailedProgressBar.progress = s);
this.detailedProgressLabel && (this.detailedProgressLabel.string = r);
this.simpleProgressBar && (this.simpleProgressBar.progress = s);
this.simpleProgressLabel && (this.simpleProgressLabel.string = r);
};
s([ d(cc.Node) ], e.prototype, "detailedWindow", void 0);
s([ d(cc.ProgressBar) ], e.prototype, "detailedProgressBar", void 0);
s([ d(cc.Label) ], e.prototype, "detailedProgressLabel", void 0);
s([ d(cc.Button) ], e.prototype, "btnPause", void 0);
s([ d(cc.Button) ], e.prototype, "btnCancel", void 0);
s([ d(cc.Button) ], e.prototype, "btnMin", void 0);
s([ d(cc.Node) ], e.prototype, "simpleWindow", void 0);
s([ d(cc.ProgressBar) ], e.prototype, "simpleProgressBar", void 0);
s([ d(cc.Label) ], e.prototype, "simpleProgressLabel", void 0);
s([ d(cc.Button) ], e.prototype, "simpleWindowBg", void 0);
return s([ a ], e);
}(hs.Component);
n.default = c;
cc._RF.pop();
}, {} ]
}, {}, [ "DownloadCancelTrait", "DownloadWindow" ]);
//# sourceMappingURL=index.js.map
