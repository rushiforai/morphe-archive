window.__require = function e(t, r, i) {
function o(n, c) {
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
var d = r[n] = {
exports: {}
};
t[n][0].call(d.exports, function(e) {
return o(t[n][1][e] || e);
}, d, d.exports, e, t, r, i);
}
return r[n].exports;
}
for (var s = "function" == typeof __require && __require, n = 0; n < i.length; n++) o(i[n]);
return o;
}({
AddRecoveryDragTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "177b3WJkSZBJ6z9kGQDZfd1", "AddRecoveryDragTrait");
var i, o = this && this.__extends || (i = function(e, t) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, t) {
e.__proto__ = t;
} || function(e, t) {
for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r]);
})(e, t);
}, function(e, t) {
i(e, t);
function r() {
this.constructor = e;
}
e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r());
}), s = this && this.__decorate || function(e, t, r, i) {
var o, s = arguments.length, n = s < 3 ? t : null === i ? i = Object.getOwnPropertyDescriptor(t, r) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(e, t, r, i); else for (var c = e.length - 1; c >= 0; c--) (o = e[c]) && (n = (s < 3 ? o(n) : s > 3 ? o(t, r, n) : o(t, r)) || n);
return s > 3 && n && Object.defineProperty(t, r, n), n;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.AddRecoveryDragTrait = void 0;
var n = function(e) {
o(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.isFirstDrag = void 0;
t._isNeedRestore = void 0;
t.storageKey = "AddRecoveryDragTrait_isFirstDrag";
return t;
}
t.prototype.onCreate = function() {
this.loadData();
};
t.prototype.loadData = function() {
this.isFirstDrag = hs.storage.getItem(this.storageKey, !0);
};
t.prototype.setData = function() {
hs.storage.setItem(this.storageKey, this.isFirstDrag);
};
t.prototype.isClassBlocksProducer_ProxyOnTouchStart = function() {
if (hs.classGuideInfo.isFinishedGuide && this.isNeedRestore() && this.isFirstDrag) {
this.isFirstDrag = !1;
this.setData();
this.executeRestore();
}
};
t.prototype.isClassTopInfoInitCompelte = function() {
this.isNeedRestore() && this.isFirstDrag && this.setHighNodeActive(!1);
};
t.prototype.isNeedRestore = function() {
if (void 0 !== this._isNeedRestore) return this._isNeedRestore;
var e = TRAIT("RestoreDataProviderTrait");
if (!(null == e ? void 0 : e.active)) {
this._isNeedRestore = !1;
return !1;
}
if (!e.isNeedRestore()) {
this._isNeedRestore = !1;
return !1;
}
this._isNeedRestore = !0;
return !0;
};
t.prototype.setHighNodeActive = function(e) {
var t = Cinst(hs.ClassTopInfo);
cc.isValid(t) && cc.isValid(null == t ? void 0 : t.highNode) && (t.highNode.active = e);
};
t.prototype.executeRestore = function() {
this.recoveryHighScore();
this.setHighNodeActive(!0);
};
t.prototype.recoveryHighScore = function() {
var e, t = TRAIT("RestoreEndlessHighScoreTrait");
(null == t ? void 0 : t.active) && !(null === (e = t.props) || void 0 === e ? void 0 : e.isAlert) && t.executeRestore();
};
return s([ classId("AddRecoveryDragTrait") ], t);
}(Trait);
r.AddRecoveryDragTrait = n;
cc._RF.pop();
}, {} ]
}, {}, [ "AddRecoveryDragTrait" ]);
//# sourceMappingURL=index.js.map
