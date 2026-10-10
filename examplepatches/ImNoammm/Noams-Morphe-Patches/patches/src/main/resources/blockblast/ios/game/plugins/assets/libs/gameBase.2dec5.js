(() => {
"use strict";
var t = {
9: (t, e) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.Emitter = void 0;
var n = function() {
function t(t) {
this._options = t;
}
return Object.defineProperty(t.prototype, "event", {
get: function() {
var t, e = this;
return null !== (t = this._event) && void 0 !== t || (this._event = function(t, n) {
var r, a, i, o, s, c;
n && (t = t.bind(n)), e._callbacks || (null === (a = null === (r = e._options) || void 0 === r ? void 0 : r.onWillAddFirstListener) || void 0 === a || a.call(r, e), 
e._callbacks = [], null === (o = null === (i = e._options) || void 0 === i ? void 0 : i.onDidAddFirstListener) || void 0 === o || o.call(i, e)), 
null === (c = null === (s = e._options) || void 0 === s ? void 0 : s.onDidAddListener) || void 0 === c || c.call(s, e), 
e._callbacks.push({
callback: t,
thisArgs: n
});
}), this._event;
},
enumerable: !1,
configurable: !0
}), t.prototype.fire = function(t) {
for (var e = this._callbacks, n = 0; n < (null == e ? void 0 : e.length); n++) {
var r = e[n], a = r.callback, i = r.thisArgs;
a && a.apply(i, [ t ]);
}
}, t.prototype.dispose = function() {
var t, e;
this._disposed || (this._disposed = !0, this._callbacks = void 0, null === (e = null === (t = this._options) || void 0 === t ? void 0 : t.onDidRemoveLastListener) || void 0 === e || e.call(t));
}, t;
}();
e.Emitter = n;
},
58: function(t, e) {
var n = this && this.__awaiter || function(t, e, n, r) {
return new (n || (n = Promise))(function(a, i) {
function o(t) {
try {
c(r.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
c(r.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var e;
t.done ? a(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(o, s);
}
c((r = r.apply(t, e || [])).next());
});
}, r = this && this.__generator || function(t, e) {
var n, r, a, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
}, o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function s(s) {
return function(c) {
return function(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;o && (o = 0, s[0] && (i = 0)), i; ) try {
if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 
0) : r.next) && !(a = a.call(r, s[1])).done) return a;
switch (r = 0, a && (s = [ 2 & s[0], a.value ]), s[0]) {
case 0:
case 1:
a = s;
break;

case 4:
return i.label++, {
value: s[1],
done: !1
};

case 5:
i.label++, r = s[1], s = [ 0 ];
continue;

case 7:
s = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== s[0] && 2 !== s[0])) {
i = 0;
continue;
}
if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
i.label = s[1];
break;
}
if (6 === s[0] && i.label < a[1]) {
i.label = a[1], a = s;
break;
}
if (a && i.label < a[2]) {
i.label = a[2], i.ops.push(s);
break;
}
a[2] && i.ops.pop(), i.trys.pop();
continue;
}
s = e.call(t, i);
} catch (t) {
s = [ 6, t ], r = 0;
} finally {
n = a = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}([ s, c ]);
};
}
};
Object.defineProperty(e, "__esModule", {
value: !0
}), e.Trait = void 0;
var a = function() {
function t() {
this._state = {}, this._props = void 0, this._cachedStaticActive = void 0, this._dynamicActive = !0, 
this.__onEnabled__ = !1;
}
return Object.defineProperty(t, "activatedListenerTraits", {
get: function() {
return t._activatedListenerTraits;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "id", {
get: function() {
return this._id;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "traitName", {
get: function() {
return getClassName(this.constructor);
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "state", {
get: function() {
return this._state;
},
enumerable: !1,
configurable: !0
}), t.prototype.data = function() {
return {};
}, Object.defineProperty(t.prototype, "props", {
get: function() {
return this._props;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "active", {
get: function() {
return this.dynamicActive && this.staticActive;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "staticActive", {
get: function() {
return void 0 === this._cachedStaticActive && (this._cachedStaticActive = t.traitIsActive(this.props)), 
this._cachedStaticActive;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "dynamicActive", {
get: function() {
return this._dynamicActive;
},
set: function(t) {
this._dynamicActive !== t && (this._dynamicActive = t, t ? this.onEnable() : this.onDisable());
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "onActiveCondition", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "shouldWaitForResourcesLoadedBeforeActivation", {
get: function() {
return !0;
},
enumerable: !1,
configurable: !0
}), t.prototype.registerTraitEventsMethods = function() {
return null;
}, t.prototype.onCreate = function() {}, t.prototype.onEnable = function() {}, t.prototype.onDisable = function() {}, 
t.prototype.setState = function(t) {
for (var e in t) {
var n = t[e];
this._state[e] = n;
}
}, t.prototype.onActive = function() {}, t.traitIsActive = function(t) {
return !!t && 0 !== t.firing && !1 !== t.active;
}, t.dynamicEnableTraits = function(t) {
if (t) for (var e = window.traitConfigInfo.traitsByIdMap, n = window.traitConfigInfo._traitsClassNameMap, r = window.__traitsClassMap__, a = 0; a < t.length; a++) {
var i = t[a], o = i.id, s = e[o];
if (s) {
var c = s.traitClassName;
if (!(null == r ? void 0 : r[c])) continue;
var u = TRAIT(c);
u ? (u._props = i, u.dynamicActive = !0, n[c] = {
id: o,
param: i
}) : n[c] = {
id: o,
param: i
};
}
}
}, t.dynamicEnableTraitsAsync = function(t) {
var e = this;
return new Promise(function(a) {
return n(e, void 0, void 0, function() {
var e, i, o, s, c, u, l, f, d, v, p = this;
return r(this, function(h) {
switch (h.label) {
case 0:
if (!t || 0 === t.length) return a(null), [ 2 ];
e = window.traitsInfo, i = window.traitConfigInfo.traitsByIdMap, o = window.traitConfigInfo._traitsClassNameMap, 
s = window.__traitsClassMap__, c = [], u = function(u) {
var l, h, y, g, _, b, w, m;
return r(this, function(O) {
switch (O.label) {
case 0:
return l = t[u], h = l.id, y = i[h], g = function(e, n) {
if (n && e) {
o[e] = {
id: h,
param: l
};
var r = TRAIT(e);
r && (r._props = l, r.dynamicActive = !0);
}
c.push({
traitClassName: e,
status: n
}), c.length === t.length && a(c);
}, _ = function(t) {
return n(p, void 0, void 0, function() {
return r(this, function(e) {
switch (e.label) {
case 0:
return e.trys.push([ 0, 2, , 3 ]), [ 4, window.ResLoader.asyncLoadBundle(t) ];

case 1:
return e.sent(), g(t, !0), [ 3, 3 ];

case 2:
return e.sent(), g(t, !1), [ 3, 3 ];

case 3:
return [ 2 ];
}
});
});
}, b = function(t) {
var n = window.ResLoader, r = null == e ? void 0 : e._remoteTraitBundleLoadedStates;
r && (r[t] = {
state: 0
}), n.setCustomRemoteBundle(t), n.loadBundle(t, function(e, n) {
var a, i;
!e && n ? (g(t, !0), r && (r[t] = {
state: 1
}), 0 === (null === (i = null === (a = n._config) || void 0 === a ? void 0 : a.assetInfos) || void 0 === i ? void 0 : i.count) ? r && (r[t] = {
state: 2
}) : n.loadDir("", function(e) {
e || r && (r[t] = {
state: 2
});
})) : g(t, !1);
});
}, y ? (w = y.traitClassName, (null == s ? void 0 : s[w]) ? [ 3, 7 ] : window.jsb ? [ 3, 2 ] : [ 4, _(w) ]) : [ 3, 8 ];

case 1:
return O.sent(), [ 2, "continue" ];

case 2:
return (null === (f = null == e ? void 0 : e.traitsBundleLocalData) || void 0 === f ? void 0 : f.includes(w)) ? [ 4, _(w) ] : [ 3, 4 ];

case 3:
return O.sent(), [ 2, "continue" ];

case 4:
return !0 === (null === (d = null == e ? void 0 : e.traitsBundleData) || void 0 === d ? void 0 : d.some(function(t) {
return t.name === w;
})) ? (m = window.ResLoader, (null === (v = null == e ? void 0 : e.isRemoteTraitLocalization) || void 0 === v ? void 0 : v.call(e, w)) ? (m.setCustomRemoteBundle(w), 
[ 4, _(w) ]) : [ 3, 6 ]) : (g(w, !1), [ 2, "continue" ]);

case 5:
return O.sent(), [ 2, "continue" ];

case 6:
return b(w), [ 2, "continue" ];

case 7:
return g(w, !0), [ 3, 9 ];

case 8:
g(null, !1), O.label = 9;

case 9:
return [ 2 ];
}
});
}, l = 0, h.label = 1;

case 1:
return l < t.length ? [ 5, u(l) ] : [ 3, 4 ];

case 2:
h.sent(), h.label = 3;

case 3:
return l++, [ 3, 1 ];

case 4:
return [ 2 ];
}
});
});
});
}, t.dynamicDisableTraits = function(t) {
if (t) for (var e = window.traitConfigInfo.traitsByIdMap, n = window.traitConfigInfo._traitsClassNameMap, r = 0; r < t.length; r++) {
var a = e[t[r]];
if (a) {
var i = a.traitClassName, o = TRAIT(i);
o && n[i] && (o.__onEnabled__ = !1, delete n[i], o.dynamicActive = !1);
}
}
}, t.dynamicDisableTraitsByName = function(t) {
var e;
if (t) {
var n = null === (e = window.traitConfigInfo) || void 0 === e ? void 0 : e._traitsClassNameMap;
if (n) for (var r = Array.isArray(t) ? t : [ t ], a = 0; a < r.length; a++) {
var i = r[a], o = TRAIT(i);
o && n[i] && (o.__onEnabled__ = !1, delete n[i], o.dynamicActive = !1);
}
}
}, t.onTraitActive = function(t, e, n) {
this._activatedListenerTraits.has(t) || this._activatedListenerTraits.set(t, []), 
this._activatedListenerTraits.get(t).push({
preActive: e,
activated: n
});
}, t._activatedListenerTraits = new Map(), t;
}();
e.Trait = a, assignWindowSafe({
Trait: a
});
},
126: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.decorate = function(t) {
return function(e, n, a) {
var i = null, o = null;
if ("function" == typeof a.value ? (i = "value", o = a.value) : "function" == typeof a.get && (i = "get", 
o = a.get), !o || !i) throw new Error("not supported");
var s = t(o, n);
"function" == typeof s && (0, r.setOriginalMethod)(s, o), a[i] = s;
};
};
var r = n(747);
},
177: (t, e) => {
function n(t) {
return function(e, n) {
var r = [];
Object.defineProperty(e, n, {
get: function() {
return r;
},
set: function(e) {
if (!Array.isArray(e)) throw new Error("Property ".concat(n, " must be an array"));
r = e.length > t ? e.slice(-t) : e;
},
enumerable: !0,
configurable: !0
});
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.MaxListLength = n, assignWindowSafe({
MaxListLength: n
}), assignHsSafe({
MaxListLength: n
});
},
193: (t, e) => {
function n(t, e, n) {
var r = null, a = null;
if ("function" == typeof n.value ? (r = "value", (a = n.value).length) : "function" == typeof n.get && (r = "get", 
a = n.get), !a) throw new Error("not supported");
var i = "$memoize$".concat(e);
n[r] = function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return this.hasOwnProperty(i) || Object.defineProperty(this, i, {
configurable: !1,
enumerable: !1,
writable: !1,
value: a.apply(this, t)
}), this[i];
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.memoize = n, assignWindowSafe({
memoize: n
}), assignHsSafe({
memoize: n
});
},
203: (t, e) => {
function n() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return function(e, n, r) {
var a = r.value;
return r.value = function() {
for (var e = this, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
return t.forEach(function(t) {
var n = e[t];
n && window.applyAdapterFringe(n);
}), a.apply(this, n);
}, r;
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.adapterFringe = n, assignWindowSafe({
adapterFringe: n
}), assignHsSafe({
adapterFringe: n
});
},
219: (t, e) => {
function n(t) {
if (t) {
for (var e in t) e in window && assertError(!1, "当前 key：".concat(e, ",不能重复赋值给 window 对象！"));
Object.assign(window, t);
}
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.assignWindowSafe = n, Object.assign(window, {
assignWindowSafe: n
});
},
247: function(t, e, n) {
var r = this && this.__read || function(t, e) {
var n = "function" == typeof Symbol && t[Symbol.iterator];
if (!n) return t;
var r, a, i = n.call(t), o = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) o.push(r.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
r && !r.done && (n = i.return) && n.call(i);
} finally {
if (a) throw a.error;
}
}
return o;
}, a = this && this.__spreadArray || function(t, e, n) {
if (n || 2 === arguments.length) for (var r, a = 0, i = e.length; a < i; a++) !r && a in e || (r || (r = Array.prototype.slice.call(e, 0, a)), 
r[a] = e[a]);
return t.concat(r || Array.prototype.slice.call(e));
}, i = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, n = e && t[e], r = 0;
if (n) return n.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && r >= t.length && (t = void 0), {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
}), e.getClassName = u;
var o = n(747);
window.traitRegisterEvents = {}, window.__traitsClassMap__ = {};
var s = {};
function c(t, e) {
return function(n) {
var r, a = n.prototype;
if (a.__classname__ || (a.__classname__ = t), a instanceof Trait) {
window.__traitsClassMap__[t] || (window.__traitsClassMap__[t] = []), e && (n.__adjustParamShape__ = e), 
-1 === window.__traitsClassMap__[t].indexOf(n) && window.__traitsClassMap__[t].push(n);
var i = a.registerTraitEventsMethods;
if (i) {
var o = i();
if (o) for (var c = u(n), f = 0; f < o.length; f++) {
var d = o[f], v = d.className, p = d.methodName;
window.traitRegisterEvents[v] || (window.traitRegisterEvents[v] = Object.create(null)), 
window.traitRegisterEvents[v][p] || (window.traitRegisterEvents[v][p] = new Map()), 
window.traitRegisterEvents[v][p].set(n, !0);
var h = null === (r = s[v]) || void 0 === r ? void 0 : r[p];
h && -1 === h.findIndex(function(t) {
return t.traitClassName === c;
}) && h.unshift({
traitClassName: c
});
}
}
}
if (n.__classMethodWatch__) {
var y = Object.getOwnPropertyNames(n).filter(function(t) {
if ([ "length", "name", "prototype" ].includes(t)) return !1;
var e = Object.getOwnPropertyDescriptor(n, t);
return !!e && "function" == typeof e.value;
}), g = Object.getOwnPropertyNames(a).map(function(t) {
return {
propertyName: t,
isStatic: !1
};
}), _ = y.map(function(t) {
return {
propertyName: t,
isStatic: !0
};
}).filter(function(t) {
return -1 === g.findIndex(function(e) {
return e.propertyName === t.propertyName;
});
}), b = g.concat(_);
for (f = 0; f < b.length; f++) {
var w = b[f], m = w.propertyName, O = w.isStatic ? n : a;
if ("constructor" !== m) {
var T = Object.getOwnPropertyDescriptor(O, m);
if (T && "function" == typeof T.value) {
var M = getOriginalMethod(T.value);
T.value = l(T, M, t, m), Object.defineProperty(O, m, T);
}
}
}
}
};
}
function u(t) {
var e;
return (null === (e = null == t ? void 0 : t.prototype) || void 0 === e ? void 0 : e.__classname__) || cc.js.getClassName(t);
}
function l(t, e, n, c) {
var l = t.value, f = function() {
for (var t = [], o = 0; o < arguments.length; o++) t[o] = arguments[o];
if ("function" != typeof l.__should_execute__ || l.__should_execute__()) {
var f = window.traitsInfo;
if (!f) return e.call.apply(e, a([ this ], r(t), !1));
if (!n) return e.call.apply(e, a([ this ], r(t), !1));
var d = function(t, e) {
var n, a, o, c, l, f, d, v = null === (o = window.traitsInfo) || void 0 === o ? void 0 : o.traitsData;
if (!v) return [];
var p = null === (c = s[t]) || void 0 === c ? void 0 : c[e];
if (p) return p;
var h = null === (l = null == v ? void 0 : v[t]) || void 0 === l ? void 0 : l[e], y = (null == h ? void 0 : h.decorators) ? h.decorators.slice() : [], g = null === (d = null === (f = window.traitRegisterEvents) || void 0 === f ? void 0 : f[t]) || void 0 === d ? void 0 : d[e];
if (g) {
var _ = function(t) {
var e = u(t);
-1 === y.findIndex(function(t) {
return t.traitClassName === e;
}) && y.unshift({
traitClassName: e
});
};
try {
for (var b = i(g), w = b.next(); !w.done; w = b.next()) _(r(w.value, 1)[0]);
} catch (t) {
n = {
error: t
};
} finally {
try {
w && !w.done && (a = b.return) && a.call(b);
} finally {
if (n) throw n.error;
}
}
}
return s[t] || (s[t] = Object.create(null)), s[t][e] = y, y;
}(n, c);
if (0 === d.length) return e.call.apply(e, a([ this ], r(t), !1));
try {
var v = f.filterLoadedRemoteTraits(d);
v = v.filter(function(t) {
return window.traitConfigInfo.traitsClassNameMap[t.traitClassName];
});
var p = window.hs.TraitSequenceDecorators.sequenceDecorators(this, e, t, n, c, v), h = p.replace, y = p.returnValue, g = void 0;
return h || (g = e.call.apply(e, a([ this ], r(t), !1))), "##undefined##" !== y ? y : g;
} catch (i) {
var _ = i, b = (null == _ ? void 0 : _.message) || (null == _ ? void 0 : _.stack) || (i && "object" == typeof i ? JSON.stringify(i) : i);
return window.assertError(!1, "挂载点：".concat(n, ".").concat(c, " 发生错误，请检查：").concat(b)), 
e.call.apply(e, a([ this ], r(t), !1));
}
}
};
return (0, o.setOriginalMethod)(f, e), f;
}
assignWindowSafe({
classId: c,
getClassName: u
}), assignHsSafe({
classId: c,
getClassName: u
});
},
271: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.INP = a;
var r = n(126);
function a(t, e) {
return void 0 === e && (e = 4e3), (0, r.decorate)(function(n, r) {
var a = {}, i = 0;
return window.UI.addEventListener("open", function(e) {
if (e.url === t) for (var n in a) {
var r = a[n];
r.isOpened || (r.isOpened = !0, clearTimeout(r.timeoutId), delete a[n]);
}
}), function() {
for (var o = [], s = 0; s < arguments.length; s++) o[s] = arguments[s];
var c = ++i, u = {
timeoutId: null,
isOpened: !1
};
return a[c] = u, u.timeoutId = setTimeout(function() {
var n = a[c];
n && !n.isOpened && (assertError(!1, '[@INP] 方法 "'.concat(r, '" 执行超时，面板 "').concat(t, '" 在 ').concat(e, "ms 内未打开，callId: ").concat(c)), 
delete a[c]);
}, e), n.apply(this, o);
};
});
}
assignWindowSafe({
INP: a
}), assignHsSafe({
INP: a
});
},
293: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.storageProperty = i;
var r = n(650), a = n(436);
function i(t) {
return function(e, n) {
var i, o = (null == t ? void 0 : t.key) ? t.key : n, s = "_" + n, c = r.storage.getItem(o), u = (0, 
a._reactive)(((i = {})[n] = e[n], i), e, n), l = function(t) {
if (Array.isArray(t)) {
var e = t.push, n = t.pop, a = t.splice, i = t.shift, s = t.unshift;
t.push = function() {
for (var n = [], a = 0; a < arguments.length; a++) n[a] = arguments[a];
var i = e.apply(this, n);
return r.storage.setItem(o, t), i;
}, t.pop = function() {
var e = n.apply(this);
return r.storage.setItem(o, t), e;
}, t.splice = function() {
for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
var i = a.apply(this, e);
return r.storage.setItem(o, t), i;
}, t.shift = function() {
var e = i.apply(this);
return r.storage.setItem(o, t), e;
}, t.unshift = function() {
for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
var a = s.apply(this, e);
return r.storage.setItem(o, t), a;
};
}
return t;
};
Array.isArray(u[n]) && (u[n] = l(u[n])), (0, a.reactive)({
target: e,
propertyName: n,
pos: s,
callback: function(t, e, a) {
void 0 === c ? (Array.isArray(a) && (a = l(a)), r.storage.setItem(o, a)) : void 0 === e ? u[n] = c : (Array.isArray(a) && (a = l(a)), 
r.storage.setItem(o, a));
}
}), Object.defineProperty(e, n, {
get: function() {
return u[n];
},
set: function(t) {
u[n] !== t && (Array.isArray(t) && (t = l(t)), u[n] = t);
},
enumerable: !0,
configurable: !0
});
};
}
assignWindowSafe({
storageProperty: i
}), assignHsSafe({
storageProperty: i
});
},
373: function(t, e, n) {
var r = this && this.__values || function(t) {
var e = "function" == typeof Symbol && Symbol.iterator, n = e && t[e], r = 0;
if (n) return n.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && r >= t.length && (t = void 0), {
value: t && t[r++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
}), e.shareObjects = e.onDidTraitOnActive = e.onDidTraitOnActiveEmitter = e.GBMTraitsMaps = void 0, 
e.getTemplateTraits = u, e.isTraitReady = f, e.traitsReady = d, e.isTraitsConfigReady = v, 
e.traitsConfigReady = h, e.getGameTraitName = g, e.listenerTraitOnActive = _, e.GBM = b, 
e.templateTrait = w;
var a = n(219), i = n(9), o = new Map(), s = new Map();
e.GBMTraitsMaps = new Map();
var c = {};
function u() {
return c;
}
e.onDidTraitOnActiveEmitter = new i.Emitter(), e.onDidTraitOnActive = e.onDidTraitOnActiveEmitter.event;
var l = !1;
function f() {
return l;
}
function d(t) {
l = t;
}
function v() {
return p;
}
var p = !1;
function h(t) {
p = t;
}
function y(t) {
var e, n, a, i = window.traitConfigInfo.traitsClassNameMap[t];
if (i) {
var c = i, u = c.id, l = c.param, f = null === (a = window.__traitsClassMap__) || void 0 === a ? void 0 : a[t];
if (f) {
var d = l.adjustParamShape, v = "".concat(t, ":").concat(d), p = s.get(v);
if (void 0 === p) {
var h = void 0;
try {
for (var y = r(f), g = y.next(); !g.done; g = y.next()) {
var _ = g.value;
if (_.__adjustParamShape__ === d) {
p = _;
break;
}
_.__adjustParamShape__ || (h = _);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
g && !g.done && (n = y.return) && n.call(y);
} finally {
if (e) throw e.error;
}
}
null != p || (p = null != h ? h : null), s.set(v, p);
}
if (p) {
var b = o.get(p);
return b || ((b = new p())._id = u, b._props = l, b._state = b.data(), b.onCreate(), 
o.set(p, b)), b;
}
}
}
return null;
}
function g(t) {
return t ? /^\d/.test(t) ? "$" + t + "Trait" : t.charAt(0).toUpperCase() + t.slice(1) + "Trait" : "";
}
function _(t, e, n) {
var r = Trait.activatedListenerTraits.get(t.constructor);
if (r) for (var a = 0; a < r.length; a++) {
var i = r[a];
(null == i ? void 0 : i[n]) && i[n](t, e);
}
}
function b() {
return function(t) {
var n = t, r = getClassName(n);
e.GBMTraitsMaps.has(n) || e.GBMTraitsMaps.set(t, r);
};
}
function w(t) {
return function(e) {
if (t && 0 !== t.length) {
e.__isTemplateTrait__ = !0, e.__templateTrait__ = t;
var n = getClassName(e);
n && (c[n] = t);
}
};
}
e.shareObjects = new Map(), (0, a.assignWindowSafe)({
GBMTraitsMaps: e.GBMTraitsMaps,
getTemplateTraits: u,
onDidTraitOnActiveEmitter: e.onDidTraitOnActiveEmitter,
onDidTraitOnActive: e.onDidTraitOnActive,
isTraitReady: f,
traitsReady: d,
isTraitsConfigReady: v,
traitsConfigReady: h,
shareObjects: e.shareObjects,
TRAIT: y,
getGameTraitName: g,
listenerTraitOnActive: _,
GBM: b,
templateTrait: w
}), assignHsSafe({
GBMTraitsMaps: e.GBMTraitsMaps,
getTemplateTraits: u,
onDidTraitOnActiveEmitter: e.onDidTraitOnActiveEmitter,
onDidTraitOnActive: e.onDidTraitOnActive,
isTraitReady: f,
traitsReady: d,
isTraitsConfigReady: v,
traitsConfigReady: h,
shareObjects: e.shareObjects,
TRAIT: y,
getGameTraitName: g,
listenerTraitOnActive: _,
GBM: b,
templateTrait: w
});
},
436: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.reactive = o, e._reactive = s, e.watch = u, e.watchDebug = l;
var r = n(219);
function a(t) {
return !("object" != typeof t || null === t || Array.isArray(t) || t instanceof RegExp || t instanceof Date);
}
var i = new Map();
function o(t) {
var e = t.target, n = t.propertyName, r = t.pos, a = t.callback, o = i.get(e.constructor);
o || (o = {}, i.set(e.constructor, o)), o[n + r] = a;
}
function s(t, e, n) {
if (!a(t)) return t;
var r = {
get: function(t, r, i) {
var o = Reflect.get(t, r, i);
return a(o) ? s(o, e, n) : o;
},
set: function(t, r, o, u) {
var l = t[r], f = c(e[n]), d = Reflect.set(t, r, o, u);
if (l !== o) {
var v = i.get(e.constructor);
v && Object.keys(v).forEach(function(t) {
if (t.includes(n) && v[t]) {
var r = c(e[n]);
v[t](n, f, r);
}
}), a(o) && s(o, e, n);
}
return d;
}
};
return new Proxy(t, r);
}
function c(t, e) {
if (void 0 === e && (e = new WeakMap()), !a(t)) return t;
if (e.has(t)) return e.get(t);
if (Array.isArray(t)) {
var n = [];
e.set(t, n);
for (var r = 0; r < t.length; r++) n[r] = c(t[r], e);
return n;
}
var i = {};
return e.set(t, i), Object.keys(t).forEach(function(n) {
i[n] = c(t[n], e);
}), i;
}
function u() {
return function(t, e) {
var n, r = s(((n = {})[e] = t[e], n), t, e);
Object.defineProperty(t, e, {
get: function() {
return r[e];
},
set: function(t) {
r[e] = t;
},
enumerable: !0,
configurable: !0
});
};
}
function l(t, e, n, r) {
void 0 === n && (n = []), void 0 === r && (r = 2);
}
(0, r.assignWindowSafe)({
reactive: o,
_reactive: s,
watch: u,
watchDebug: l
}), assignHsSafe({
reactive: o,
_reactive: s,
watch: u,
watchDebug: l
});
},
496: (t, e) => {
function n() {
return function(t) {
t.__classMethodWatch__ = !0;
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.classMethodWatch = n, assignWindowSafe({
classMethodWatch: n
}), assignHsSafe({
classMethodWatch: n
});
},
585: function(t, e) {
var n = this && this.__awaiter || function(t, e, n, r) {
return new (n || (n = Promise))(function(a, i) {
function o(t) {
try {
c(r.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
c(r.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var e;
t.done ? a(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(o, s);
}
c((r = r.apply(t, e || [])).next());
});
}, r = this && this.__generator || function(t, e) {
var n, r, a, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
}, o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function s(s) {
return function(c) {
return function(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;o && (o = 0, s[0] && (i = 0)), i; ) try {
if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 
0) : r.next) && !(a = a.call(r, s[1])).done) return a;
switch (r = 0, a && (s = [ 2 & s[0], a.value ]), s[0]) {
case 0:
case 1:
a = s;
break;

case 4:
return i.label++, {
value: s[1],
done: !1
};

case 5:
i.label++, r = s[1], s = [ 0 ];
continue;

case 7:
s = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== s[0] && 2 !== s[0])) {
i = 0;
continue;
}
if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
i.label = s[1];
break;
}
if (6 === s[0] && i.label < a[1]) {
i.label = a[1], a = s;
break;
}
if (a && i.label < a[2]) {
i.label = a[2], i.ops.push(s);
break;
}
a[2] && i.ops.pop(), i.trys.pop();
continue;
}
s = e.call(t, i);
} catch (t) {
s = [ 6, t ], r = 0;
} finally {
n = a = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}([ s, c ]);
};
}
};
function a(t, e, a) {
var i = a.value;
return a.value = function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return n(this, void 0, void 0, function() {
return r(this, function() {
return [ 2, i.apply(this, t) ];
});
});
}, a;
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.measure = a, assignWindowSafe({
measure: a
}), assignHsSafe({
measure: a
});
},
650: function(t, e, n) {
var r = this && this.__read || function(t, e) {
var n = "function" == typeof Symbol && t[Symbol.iterator];
if (!n) return t;
var r, a, i = n.call(t), o = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) o.push(r.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
r && !r.done && (n = i.return) && n.call(i);
} finally {
if (a) throw a.error;
}
}
return o;
};
Object.defineProperty(e, "__esModule", {
value: !0
}), e.storage = void 0;
var a = n(219), i = function() {
function t() {
this.cacheData = {};
}
return t.prototype.initPrefix = function(e) {
t.prefix = e;
}, t.prototype.setItem = function(e, n) {
try {
var r = t.prefix + e, a = void 0, i = typeof n;
null === n || "string" === i || "number" === i || "boolean" === i || "bigint" === i || "undefined" === i ? a = n : "object" === i && (a = JSON.stringify(n)), 
this.cacheData[e] = {
type: i,
data: a
};
var o = i + t.valueTypeSplit + a;
localStorage.setItem(r, o);
} catch (t) {
throw t instanceof DOMException && (22 === t.code || 1014 === t.code || "QuotaExceededError" === t.name || "NS_ERROR_DOM_QUOTA_REACHED" === t.name) ? new Error("LocalStorage is full") : t;
}
}, t.prototype.getItem = function(e, n) {
if (Object.prototype.hasOwnProperty.call(this.cacheData, e)) {
var a = this.cacheData[e], i = a.type, o = a.data;
return null === o ? o : "object" === i ? JSON.parse(o) : o;
}
var s = t.prefix + e, c = localStorage.getItem(s), u = void 0;
if (null !== c && "" !== c) {
var l = c.split(t.valueTypeSplit);
if (2 === (null == l ? void 0 : l.length)) {
var f = r(l, 2), d = f[0], v = f[1], p = void 0;
switch (d) {
case "string":
p = u = v;
break;

case "number":
case "bigint":
p = u = +v;
break;

case "boolean":
p = u = JSON.parse(v);
break;

case "undefined":
p = u = void 0;
break;

case "object":
u = JSON.parse(v), p = v;
}
this.cacheData[e] = {
type: d,
data: p
};
} else assertError(2 === (null == l ? void 0 : l.length), "【Storage-getItem】存储长度错误：应该为2, 错误key:".concat(s));
} else if (null == n) u = n; else if ("string" == (d = typeof n) || "number" === d || "boolean" === d || "bigint" === d || "undefined" === d) u = n; else if ("object" === d) try {
u = JSON.parse(JSON.stringify(n));
} catch (t) {
u = n;
} else u = n;
return u;
}, t.prototype.remove = function(e) {
Object.prototype.hasOwnProperty.call(this.cacheData, e) && delete this.cacheData[e];
var n = t.prefix + e;
localStorage.removeItem(n);
}, t.prototype.clear = function() {
this.cacheData = {}, localStorage.clear();
}, t.prefix = "block-blast-", t.valueTypeSplit = "^_^", t;
}();
e.storage = new i(), (0, a.assignWindowSafe)({
storage: e.storage
});
},
694: (t, e) => {
function n(t) {
if (t) {
for (var e in window.hs || (window.hs = {}), t) e in window.hs && assertError(!1, "当前 key：".concat(e, ",不能重复赋值给 hs 对象！"));
Object.assign(window.hs, t);
}
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.assignHsSafe = n, Object.assign(window, {
assignHsSafe: n
});
},
747: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.ORIGINAL_METHOD = void 0, e.getOriginalMethod = a, e.setOriginalMethod = i;
var r = n(219);
function a(t) {
return t[e.ORIGINAL_METHOD] || t;
}
function i(t, n) {
var r = a(n);
t[e.ORIGINAL_METHOD] = r;
}
e.ORIGINAL_METHOD = Symbol("ORIGINAL_METHOD"), (0, r.assignWindowSafe)({
getOriginalMethod: a,
setOriginalMethod: i
}), assignHsSafe({
getOriginalMethod: a,
setOriginalMethod: i
});
},
751: function(t, e, n) {
var r = this && this.__awaiter || function(t, e, n, r) {
return new (n || (n = Promise))(function(a, i) {
function o(t) {
try {
c(r.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
c(r.throw(t));
} catch (t) {
i(t);
}
}
function c(t) {
var e;
t.done ? a(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(o, s);
}
c((r = r.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var n, r, a, i = {
label: 0,
sent: function() {
if (1 & a[0]) throw a[1];
return a[1];
},
trys: [],
ops: []
}, o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
return this;
}), o;
function s(s) {
return function(c) {
return function(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;o && (o = 0, s[0] && (i = 0)), i; ) try {
if (n = 1, r && (a = 2 & s[0] ? r.return : s[0] ? r.throw || ((a = r.return) && a.call(r), 
0) : r.next) && !(a = a.call(r, s[1])).done) return a;
switch (r = 0, a && (s = [ 2 & s[0], a.value ]), s[0]) {
case 0:
case 1:
a = s;
break;

case 4:
return i.label++, {
value: s[1],
done: !1
};

case 5:
i.label++, r = s[1], s = [ 0 ];
continue;

case 7:
s = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((a = (a = i.trys).length > 0 && a[a.length - 1]) || 6 !== s[0] && 2 !== s[0])) {
i = 0;
continue;
}
if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
i.label = s[1];
break;
}
if (6 === s[0] && i.label < a[1]) {
i.label = a[1], a = s;
break;
}
if (a && i.label < a[2]) {
i.label = a[2], i.ops.push(s);
break;
}
a[2] && i.ops.pop(), i.trys.pop();
continue;
}
s = e.call(t, i);
} catch (t) {
s = [ 6, t ], r = 0;
} finally {
n = a = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}([ s, c ]);
};
}
};
function i(t, e, n) {
n.value;
return n.value = function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return r(this, void 0, void 0, function() {
return a(this, function() {
return [ 2 ];
});
});
}, n;
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.Debug = i, (0, n(219).assignWindowSafe)({
Debug: i
}), assignHsSafe({
Debug: i
});
},
775: (t, e, n) => {
Object.defineProperty(e, "__esModule", {
value: !0
}), e.cacheProperty = a;
var r = n(650);
function a(t, e) {
return function(n, a) {
var i, o, s = (null !== (o = null !== (i = null != e ? e : n.constructor.featureName) && void 0 !== i ? i : n.constructor.name) && void 0 !== o ? o : "Default") + "_" + a, c = Symbol("__cache_".concat(a));
Object.defineProperty(n, a, {
get: function() {
if (!(c in this)) {
var e = r.storage.getItem(s);
null == e && (e = t, r.storage.setItem(s, e)), this[c] = e;
}
return this[c];
},
set: function(t) {
this[c] = t, r.storage.setItem(s, t);
}
});
};
}
assignWindowSafe({
cacheProperty: a
}), assignHsSafe({
cacheProperty: a
});
},
781: (t, e, n) => {
function r() {
return function(t, e, n) {
var r = n.value;
return n.value = function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
var n = cc.view.getVisibleSize();
if (n.height / n.width >= 1334 / 750) (a = cc.Canvas.instance).fitHeight = !1, a.fitWidth = !0; else if (n.height / n.width < 1334 / 750) {
var a;
(a = cc.Canvas.instance).fitHeight = !0, a.fitWidth = !1;
}
return r.apply(this, t);
}, n;
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.ScreenAdapter = r, (0, n(219).assignWindowSafe)({
ScreenAdapter: r
}), assignHsSafe({
ScreenAdapter: r
});
},
853: (t, e) => {
function n(t, e) {
return void 0 === t && (t = 500), void 0 === e && (e = !0), function(n, r, a) {
var i = a.value;
if ("function" != typeof i) throw new Error("@throttle can only be applied to methods, but ".concat(r, " is not a function"));
var o = Date.now(), s = null, c = function() {
for (var n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
var a = this;
if (e) {
var c = Date.now();
Math.abs(c - o) >= t && (i.apply(a, n), o = c);
} else clearTimeout(s), s = setTimeoutSafe(function() {
i.apply(a, n);
}, t);
};
c.__should_execute__ = function() {
return !e || Math.abs(Date.now() - o) >= t;
}, a.value = c;
};
}
function r(t, e, n) {
void 0 === e && (e = 500), void 0 === n && (n = !0);
var r = Date.now(), a = null;
return function() {
for (var i = [], o = 0; o < arguments.length; o++) i[o] = arguments[o];
var s = this;
if (n) {
var c = Date.now();
Math.abs(c - r) >= e && (t.apply(s, i), r = c);
} else clearTimeout(a), a = setTimeoutSafe(function() {
t.apply(s, i);
}, e);
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.throttle = n, e.throttleCall = r, assignWindowSafe({
throttle: n,
throttleCall: r
}), assignHsSafe({
throttle: n,
throttleCall: r
});
},
925: (t, e, n) => {
function r(t) {
return void 0 === t && (t = 1e3), function(e, n, r) {
var a = r.value;
if ("function" != typeof a) throw new Error("@debounce can only be applied to methods, but ".concat(n, " is not a function"));
var i = "$debounce$".concat(n), o = {};
o[i] = -1e7;
var s = function() {
for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
var r = Date.now(), s = o[i];
if (Math.abs(r - s) >= t) return o[i] = r, a.apply(this, e);
};
s.__should_execute__ = function() {
return Math.abs(Date.now() - o[i]) >= t;
}, r.value = s;
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.debounce = r, (0, n(219).assignWindowSafe)({
debounce: r
}), assignHsSafe({
debounce: r
});
},
959: function(t, e, n) {
var r, a, i = this && this.__read || function(t, e) {
var n = "function" == typeof Symbol && t[Symbol.iterator];
if (!n) return t;
var r, a, i = n.call(t), o = [];
try {
for (;(void 0 === e || e-- > 0) && !(r = i.next()).done; ) o.push(r.value);
} catch (t) {
a = {
error: t
};
} finally {
try {
r && !r.done && (n = i.return) && n.call(i);
} finally {
if (a) throw a.error;
}
}
return o;
}, o = this && this.__spreadArray || function(t, e, n) {
if (n || 2 === arguments.length) for (var r, a = 0, i = e.length; a < i; a++) !r && a in e || (r || (r = Array.prototype.slice.call(e, 0, a)), 
r[a] = e[a]);
return t.concat(r || Array.prototype.slice.call(e));
};
function s(t) {
r = t;
}
function c(t) {
a = t;
}
function u() {
return function(t, e, n) {
var a = n.value;
return n.value = function() {
for (var s = [], c = 0; c < arguments.length; c++) s[c] = arguments[c];
var u = a.apply(this, s);
return null == r || r.apply(this, o([ t, e, n ], i(s), !1)), u;
}, n;
};
}
function l() {
return function(t, e, n) {
var r = n.value;
return n.value = function() {
for (var s = [], c = 0; c < arguments.length; c++) s[c] = arguments[c];
var u = r.apply(this, s);
return null == a || a.apply(this, o([ t, e, n ], i(s), !1)), u;
}, n;
};
}
Object.defineProperty(e, "__esModule", {
value: !0
}), e.algorithmInitCall = s, e.algorithmCall = c, e.AlgorithmInit = u, e.Algorithm = l, 
(0, n(219).assignWindowSafe)({
algorithmInitCall: s,
algorithmCall: c,
Algorithm: l,
AlgorithmInit: u
}), assignHsSafe({
algorithmInitCall: s,
algorithmCall: c,
Algorithm: l,
AlgorithmInit: u
});
}
}, e = {};
function n(r) {
var a = e[r];
if (void 0 !== a) return a.exports;
var i = e[r] = {
exports: {}
};
return t[r].call(i.exports, i, i.exports, n), i.exports;
}
n(219), n(694), n(126), n(496), n(373), n(203), n(959), n(436), n(247), n(925), 
n(751), n(271), n(781), n(177), n(585), n(193), n(853), n(58), n(650), n(293), n(775);
})();