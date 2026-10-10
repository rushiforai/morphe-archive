window.__require = function e(t, r, n) {
function i(a, c) {
if (!r[a]) {
if (!t[a]) {
var s = a.split("/");
s = s[s.length - 1];
if (!t[s]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(s, !0);
if (o) return o(s, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = s;
}
var u = r[a] = {
exports: {}
};
t[a][0].call(u.exports, function(e) {
return i(t[a][1][e] || e);
}, u, u.exports, e, t, r, n);
}
return r[a].exports;
}
for (var o = "function" == typeof __require && __require, a = 0; a < n.length; a++) i(n[a]);
return i;
}({
CleanSceneUseSkinPerformanceSequenceTrait: [ function(e, t, r) {
"use strict";
cc._RF.push(t, "947bdwt+EpLBIMPnSawE7HS", "CleanSceneUseSkinPerformanceSequenceTrait");
var n, i = this && this.__extends || (n = function(e, t) {
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
}), o = this && this.__decorate || function(e, t, r, n) {
var i, o = arguments.length, a = o < 3 ? t : null === n ? n = Object.getOwnPropertyDescriptor(t, r) : n;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(e, t, r, n); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (a = (o < 3 ? i(a) : o > 3 ? i(t, r, a) : i(t, r)) || a);
return o > 3 && a && Object.defineProperty(t, r, a), a;
}, a = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, r = t && e[t], n = 0;
if (r) return r.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
e && n >= e.length && (e = void 0);
return {
value: e && e[n++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.CleanSceneUseSkinPerformanceSequenceTrait = void 0;
var c = function(e) {
i(t, e);
function t() {
var t = null !== e && e.apply(this, arguments) || this;
t.skinPool = [];
return t;
}
t.prototype.onActive = function(e) {
hs.tp.isCleanSceneUseSequenceSkinTraitUpdateSkinPool(e) && (t = e.args[0]) && t.length > 0 && this.updateSkinPool(t);
if (hs.tp.isCleanSceneUseSequenceSkinTraitGetNextAvailableSkinId(e)) {
var t = e.args[0], r = e.args[1], n = this.getNextAvailableSkinId(t, r);
if (n) {
e.returnValue = n;
e.replace = !0;
}
}
};
t.prototype.getNextAvailableSkinId = function(e, t) {
if (this.skinPool && 0 !== this.skinPool.length) {
var r = Number(hs.skinInfo.currentSkinId), n = this.getStorageKey();
if (!n) return {
id: 0,
index: 0
};
var i = t;
if (!hs.storage.getItem(n, !1)) {
storage.setItem(n, !0);
i = 0;
if (1e3 !== r) return {
id: 1e3,
index: 0
};
}
for (var o = i, a = 0, c = this.skinPool.length; a < c; ) {
(o < 0 || o >= this.skinPool.length) && (o = 0);
var s = this.skinPool[o].ID;
if (s !== r) return {
id: s,
index: o + 1
};
o++;
a++;
}
}
};
t.prototype.updateSkinPool = function(e) {
var t, r, n, i, o = this.getSkinSeqByPath();
if (0 !== o.length && e && 0 !== e.length) {
var c = new Map();
try {
for (var s = a(e), l = s.next(); !l.done; l = s.next()) (p = l.value) && p.ID && c.set(p.ID, p);
} catch (e) {
t = {
error: e
};
} finally {
try {
l && !l.done && (r = s.return) && r.call(s);
} finally {
if (t) throw t.error;
}
}
var u = [];
try {
for (var S = a(o), f = S.next(); !f.done; f = S.next()) {
var p, h = f.value;
(p = c.get(h)) && u.push(p);
}
} catch (e) {
n = {
error: e
};
} finally {
try {
f && !f.done && (i = S.return) && i.call(S);
} finally {
if (n) throw n.error;
}
}
this.skinPool = u;
}
};
t.prototype.getSkinSeqByPath = function() {
switch (this.props.path) {
case "newUserGP":
return this.getNewUserGP();

case "activeUserGP":
return this.getActiveUserGP();

case "newUserClickRatioGP":
return this.getNewUserClickRatioGP();

case "activeUserClickRatioGP":
return this.getActiveUserClickRatioGP();

case "newUserClickRatioiOS":
return this.getNewUserClickRatioiOS();

case "activeUserClickRatioiOS":
return this.getActiveUserClickRatioiOS();

case "newUserIOS":
return this.getNewUserIOS();

case "activeUserIOS":
return this.getActiveUserIOS();
}
return [];
};
t.prototype.getStorageKey = function() {
switch (this.props.path) {
case "newUserGP":
return "classCleanSceneUseSkinPerformanceSequence_newUserGP_hasStarted";

case "activeUserGP":
return "classCleanSceneUseSkinPerformanceSequence_activeUserGP_hasStarted";

case "newUserClickRatioGP":
return "classCleanSceneUseSkinPerformanceSequence_newUserClickRatioGP_hasStarted";

case "activeUserClickRatioGP":
return "classCleanSceneUseSkinPerformanceSequence_activeUserClickRatioGP_hasStarted";

case "newUserIOS":
return "classCleanSceneUseSkinPerformanceSequence_newUserIOS_hasStarted";

case "activeUserIOS":
return "classCleanSceneUseSkinPerformanceSequence_activeUserIOS_hasStarted";

case "newUserClickRatioiOS":
return "classCleanSceneUseSkinPerformanceSequence_newUserClickRatioiOS_hasStarted";

case "activeUserClickRatioiOS":
return "classCleanSceneUseSkinPerformanceSequence_activeUserClickRatioiOS_hasStarted";

default:
return null;
}
};
t.prototype.logSkinChange = function() {
this.props.path;
};
t.prototype.getNewUserGP = function() {
return [ 1028, 1030, 1009, 1026, 1022, 1019, 1039, 1012, 1011, 1005, 1029, 1027, 1001, 1032, 1035, 1010, 1006, 1018, 1020, 1008, 1016, 1014, 1038, 1007, 1002, 1017, 1013, 1023, 1036, 1031, 1025, 1015, 1004, 1033, 1037, 1003, 1021, 1024, 1034 ];
};
t.prototype.getActiveUserGP = function() {
return [ 1001, 1020, 1025, 1039, 1030, 1008, 1009, 1007, 1029, 1015, 1028, 1019, 1021, 1006, 1022, 1013, 1032, 1005, 1012, 1011, 1031, 1003, 1017, 1035, 1026, 1018, 1024, 1034, 1033, 1010, 1023, 1037, 1014, 1002, 1027, 1038, 1016, 1036, 1004 ];
};
t.prototype.getNewUserClickRatioGP = function() {
return [ 1001, 1030, 1029, 1028, 1039, 1007, 1008, 1013, 1011, 1032, 1005, 1035, 1009, 1018, 1019, 1006, 1022, 1026, 1012, 1017, 1016, 1023, 1014, 1031, 1027, 1015, 1004, 1038, 1036, 1002, 1037, 1010, 1033, 1024, 1003, 1034, 1021, 1025, 1020 ];
};
t.prototype.getActiveUserClickRatioGP = function() {
return [ 1005, 1006, 1007, 1008, 1011, 1013, 1022, 1026, 1028, 1029, 1030, 1032, 1039, 1004, 1009, 1012, 1014, 1016, 1017, 1018, 1019, 1023, 1027, 1031, 1035, 1038, 1002, 1010, 1015, 1037, 1003, 1024, 1033, 1034, 1036, 1020, 1021, 1025, 1001 ];
};
t.prototype.getNewUserClickRatioiOS = function() {
return [ 1003, 1004, 1009, 1010, 1013, 1027, 1030, 1032, 1008, 1017, 1021, 1023, 1025, 1028, 1031, 1036, 1038, 1039, 1015, 1007, 1002, 1029, 1014, 1022, 1034, 1005, 1011, 1026, 1033, 1001, 1016, 1018, 1012, 1035, 1019, 1024, 1037, 1006, 1020 ];
};
t.prototype.getActiveUserClickRatioiOS = function() {
return [ 1002, 1024, 1027, 1001, 1003, 1004, 1023, 1010, 1014, 1020, 1030, 1011, 1022, 1026, 1008, 1015, 1017, 1029, 1031, 1038, 1009, 1013, 1018, 1012, 1016, 1025, 1028, 1032, 1034, 1037, 1006, 1007, 1036, 1021, 1035, 1033, 1005, 1019, 1039 ];
};
t.prototype.getNewUserIOS = function() {
return [ 1027, 1038, 1016, 1011, 1014, 1017, 1030, 1007, 1022, 1018, 1031, 1024, 1005, 1036, 1023, 1029, 1032, 1006, 1002, 1015, 1009, 1001, 1020, 1026, 1008, 1012, 1035, 1037, 1034, 1033, 1003, 1004, 1010, 1013, 1019, 1021, 1025, 1028, 1039 ];
};
t.prototype.getActiveUserIOS = function() {
return [ 1031, 1003, 1038, 1035, 1037, 1030, 1005, 1008, 1022, 1023, 1020, 1009, 1012, 1015, 1010, 1007, 1016, 1019, 1032, 1024, 1029, 1018, 1014, 1011, 1034, 1017, 1006, 1002, 1001, 1027, 1028, 1013, 1026, 1033, 1036, 1004, 1021, 1025, 1039 ];
};
return o([ classId("CleanSceneUseSkinPerformanceSequenceTrait") ], t);
}(Trait);
r.CleanSceneUseSkinPerformanceSequenceTrait = c;
cc._RF.pop();
}, {} ]
}, {}, [ "CleanSceneUseSkinPerformanceSequenceTrait" ]);
//# sourceMappingURL=index.js.map
