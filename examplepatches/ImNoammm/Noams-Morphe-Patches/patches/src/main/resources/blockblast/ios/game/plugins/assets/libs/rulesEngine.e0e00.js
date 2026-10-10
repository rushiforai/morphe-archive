(() => {
"use strict";
var e, t, n, r = {
187: function(e, t) {
var n = this && this.__read || function(e, t) {
var n = "function" == typeof Symbol && e[Symbol.iterator];
if (!n) return e;
var r, o, a = n.call(e), i = [];
try {
for (;(void 0 === t || t-- > 0) && !(r = a.next()).done; ) i.push(r.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
r && !r.done && (n = a.return) && n.call(a);
} finally {
if (o) throw o.error;
}
}
return i;
};
Object.defineProperty(t, "__esModule", {
value: !0
}), t.BUILTIN_JSON_RULE_OPERATORS = void 0, t.BUILTIN_JSON_RULE_OPERATORS = {
"=": function(e, t) {
return e === t;
},
"!=": function(e, t) {
return e !== t;
},
"<": function(e, t) {
return e < t;
},
"<=": function(e, t) {
return e <= t;
},
">": function(e, t) {
return e > t;
},
">=": function(e, t) {
return e >= t;
},
"∈": function(e, t) {
return Array.isArray(t) && t.includes(e);
},
"∉": function(e, t) {
return !Array.isArray(t) || !t.includes(e);
},
"∋": function(e, t) {
return Array.isArray(e) && e.includes(t);
},
"∌": function(e, t) {
return !Array.isArray(e) || !e.includes(t);
},
"~": function(e, t) {
var r = n(Array.isArray(t) ? t : [], 2), o = r[0], a = r[1];
return "number" == typeof e && e >= o && e <= a;
},
empty: function(e) {
return null == e || "" === e || Array.isArray(e) && 0 === e.length;
},
isDefined: function(e) {
return null != e;
},
startsWith: function(e, t) {
return "string" == typeof e && "string" == typeof t && e.startsWith(t);
},
endsWith: function(e, t) {
return "string" == typeof e && "string" == typeof t && e.endsWith(t);
},
includes: function(e, t) {
return "string" == typeof e && "string" == typeof t && e.includes(t);
},
match: function(e, t) {
return "string" == typeof e && (t instanceof RegExp ? t : new RegExp(String(t))).test(e);
},
isEmpty: function(e) {
return Array.isArray(e) && 0 === e.length;
}
};
},
239: (e, t) => {
Object.defineProperty(t, "__esModule", {
value: !0
}), t.RULE_FACT_COMMENT_CONTEXT_KEY = t.RULE_LOOP_BINDINGS_CONTEXT_KEY = t.RULE_TRAIT_PROPS_CONTEXT_KEY = t.RULE_RESOLVED_OPERATOR_CONTEXT_KEY = void 0, 
t.RULE_RESOLVED_OPERATOR_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.ruleResolvedOperator"), 
t.RULE_TRAIT_PROPS_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.traitProps"), 
t.RULE_LOOP_BINDINGS_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.loopBindings"), 
t.RULE_FACT_COMMENT_CONTEXT_KEY = Symbol.for("blockblast.rulesEngine.factComment");
},
253: function(e, t, n) {
var r = this && this.__awaiter || function(e, t, n, r) {
return new (n || (n = Promise))(function(o, a) {
function i(e) {
try {
l(r.next(e));
} catch (e) {
a(e);
}
}
function u(e) {
try {
l(r.throw(e));
} catch (e) {
a(e);
}
}
function l(e) {
var t;
e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n(function(e) {
e(t);
})).then(i, u);
}
l((r = r.apply(e, t || [])).next());
});
}, o = this && this.__generator || function(e, t) {
var n, r, o, a = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
}, i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(u) {
return function(l) {
return function(u) {
if (n) throw new TypeError("Generator is already executing.");
for (;i && (i = 0, u[0] && (a = 0)), a; ) try {
if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 
0) : r.next) && !(o = o.call(r, u[1])).done) return o;
switch (r = 0, o && (u = [ 2 & u[0], o.value ]), u[0]) {
case 0:
case 1:
o = u;
break;

case 4:
return a.label++, {
value: u[1],
done: !1
};

case 5:
a.label++, r = u[1], u = [ 0 ];
continue;

case 7:
u = a.ops.pop(), a.trys.pop();
continue;

default:
if (!((o = (o = a.trys).length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
a = 0;
continue;
}
if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
a.label = u[1];
break;
}
if (6 === u[0] && a.label < o[1]) {
a.label = o[1], o = u;
break;
}
if (o && a.label < o[2]) {
a.label = o[2], a.ops.push(u);
break;
}
o[2] && a.ops.pop(), a.trys.pop();
continue;
}
u = t.call(e, a);
} catch (e) {
u = [ 6, e ], r = 0;
} finally {
n = o = 0;
}
if (5 & u[0]) throw u[1];
return {
value: u[0] ? u[1] : void 0,
done: !0
};
}([ u, l ]);
};
}
}, a = this && this.__values || function(e) {
var t = "function" == typeof Symbol && Symbol.iterator, n = t && e[t], r = 0;
if (n) return n.call(e);
if (e && "number" == typeof e.length) return {
next: function() {
return e && r >= e.length && (e = void 0), {
value: e && e[r++],
done: !e
};
}
};
throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(t, "__esModule", {
value: !0
}), t.resolveArgs = function(e, t) {
return t.map(function(t) {
return u(e, t);
});
}, t.resolveArgsAsync = function(e, t) {
return r(this, void 0, Promise, function() {
var n, r, i, u, c, s, f, h, p;
return o(this, function(o) {
switch (o.label) {
case 0:
n = [], o.label = 1;

case 1:
o.trys.push([ 1, 6, 7, 8 ]), r = a(t), i = r.next(), o.label = 2;

case 2:
return i.done ? [ 3, 5 ] : (u = i.value, s = (c = n).push, [ 4, l(e, u) ]);

case 3:
s.apply(c, [ o.sent() ]), o.label = 4;

case 4:
return i = r.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return f = o.sent(), h = {
error: f
}, [ 3, 8 ];

case 7:
try {
i && !i.done && (p = r.return) && p.call(r);
} finally {
if (h) throw h.error;
}
return [ 7 ];

case 8:
return [ 2, n ];
}
});
});
}, t.resolveValue = u, t.resolveValueAsync = l, t.getFactValue = c, t.getFactValueAsync = s;
var i = n(239);
function u(e, t) {
return null != t && "object" == typeof t && "fact" in t && "string" == typeof t.fact ? c(e, t.fact) : Array.isArray(t) ? t.map(function(t) {
return u(e, t);
}) : t;
}
function l(e, t) {
return r(this, void 0, Promise, function() {
var n, r, i, u, c, f, h, p, d;
return o(this, function(o) {
switch (o.label) {
case 0:
if (null != t && "object" == typeof t && "fact" in t && "string" == typeof t.fact) return [ 2, s(e, t.fact) ];
if (!Array.isArray(t)) return [ 3, 9 ];
n = [], o.label = 1;

case 1:
o.trys.push([ 1, 6, 7, 8 ]), r = a(t), i = r.next(), o.label = 2;

case 2:
return i.done ? [ 3, 5 ] : (u = i.value, f = (c = n).push, [ 4, l(e, u) ]);

case 3:
f.apply(c, [ o.sent() ]), o.label = 4;

case 4:
return i = r.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return h = o.sent(), p = {
error: h
}, [ 3, 8 ];

case 7:
try {
i && !i.done && (d = r.return) && d.call(r);
} finally {
if (p) throw p.error;
}
return [ 7 ];

case 8:
return [ 2, n ];

case 9:
return [ 2, t ];
}
});
});
}
function c(e, t) {
if ("string" == typeof t && 0 !== t.length) {
var n = t.split(".").filter(function(e) {
return e.length > 0;
});
if (0 !== n.length) {
var r = n[0], o = e[i.RULE_RESOLVED_OPERATOR_CONTEXT_KEY];
if ("operator" === r && null != o && "object" == typeof o) return 1 === n.length ? o : f(o, n.slice(1));
var a = e[i.RULE_TRAIT_PROPS_CONTEXT_KEY];
if ("props" === r && null != a && "object" == typeof a) return 1 === n.length ? a : f(a, n.slice(1));
var u = e[i.RULE_LOOP_BINDINGS_CONTEXT_KEY];
if (u && Object.prototype.hasOwnProperty.call(u, r) && !Object.prototype.hasOwnProperty.call(e, r)) {
for (var l = u[r], c = 1; c < n.length; c++) {
if (null == l || "object" != typeof l) return;
l = l[n[c]];
}
return l;
}
if (!(n.length > 1)) return e[n[0]];
}
}
}
function s(e, t) {
return r(this, void 0, Promise, function() {
var n, r, a, u, l, c, s;
return o(this, function(o) {
switch (o.label) {
case 0:
return "string" != typeof t || 0 === t.length || 0 === (n = t.split(".").filter(function(e) {
return e.length > 0;
})).length ? [ 2, void 0 ] : (r = n[0], a = e[i.RULE_RESOLVED_OPERATOR_CONTEXT_KEY], 
"operator" === r && null != a && "object" == typeof a ? 1 === n.length ? [ 2, a ] : [ 2, h(a, n.slice(1)) ] : (u = e[i.RULE_TRAIT_PROPS_CONTEXT_KEY], 
"props" === r && null != u && "object" == typeof u ? 1 === n.length ? [ 2, u ] : [ 2, h(u, n.slice(1)) ] : (l = e[i.RULE_LOOP_BINDINGS_CONTEXT_KEY]) && Object.prototype.hasOwnProperty.call(l, r) ? Object.prototype.hasOwnProperty.call(e, r) ? [ 3, 6 ] : [ 4, l[r] ] : [ 3, 6 ]));

case 1:
c = o.sent(), s = 1, o.label = 2;

case 2:
return s < n.length ? [ 4, c ] : [ 3, 5 ];

case 3:
if (null == (c = o.sent()) || "object" != typeof c) return [ 2, void 0 ];
c = c[n[s]], o.label = 4;

case 4:
return s++, [ 3, 2 ];

case 5:
return [ 2, c ];

case 6:
return n.length > 1 ? [ 2, void 0 ] : [ 4, e[n[0]] ];

case 7:
return [ 2, o.sent() ];
}
});
});
}
function f(e, t) {
var n, r, o = e;
try {
for (var i = a(t), u = i.next(); !u.done; u = i.next()) {
var l = u.value;
if (null == o || "object" != typeof o) return;
o = o[l];
}
} catch (e) {
n = {
error: e
};
} finally {
try {
u && !u.done && (r = i.return) && r.call(i);
} finally {
if (n) throw n.error;
}
}
return o;
}
function h(e, t) {
return r(this, void 0, Promise, function() {
var n, r, i, u, l, c, s;
return o(this, function(o) {
switch (o.label) {
case 0:
return [ 4, e ];

case 1:
n = o.sent(), o.label = 2;

case 2:
o.trys.push([ 2, 7, 8, 9 ]), r = a(t), i = r.next(), o.label = 3;

case 3:
return i.done ? [ 3, 6 ] : (u = i.value, [ 4, n ]);

case 4:
if (null == (n = o.sent()) || "object" != typeof n) return [ 2, void 0 ];
n = n[u], o.label = 5;

case 5:
return i = r.next(), [ 3, 3 ];

case 6:
return [ 3, 9 ];

case 7:
return l = o.sent(), c = {
error: l
}, [ 3, 9 ];

case 8:
try {
i && !i.done && (s = r.return) && s.call(r);
} finally {
if (c) throw c.error;
}
return [ 7 ];

case 9:
return [ 2, n ];
}
});
});
}
},
329: function(e, t, n) {
var r = this && this.__assign || function() {
return (r = Object.assign || function(e) {
for (var t, n = 1, r = arguments.length; n < r; n++) for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
return e;
}).apply(this, arguments);
}, o = this && this.__awaiter || function(e, t, n, r) {
return new (n || (n = Promise))(function(o, a) {
function i(e) {
try {
l(r.next(e));
} catch (e) {
a(e);
}
}
function u(e) {
try {
l(r.throw(e));
} catch (e) {
a(e);
}
}
function l(e) {
var t;
e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n(function(e) {
e(t);
})).then(i, u);
}
l((r = r.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var n, r, o, a = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
}, i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(u) {
return function(l) {
return function(u) {
if (n) throw new TypeError("Generator is already executing.");
for (;i && (i = 0, u[0] && (a = 0)), a; ) try {
if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 
0) : r.next) && !(o = o.call(r, u[1])).done) return o;
switch (r = 0, o && (u = [ 2 & u[0], o.value ]), u[0]) {
case 0:
case 1:
o = u;
break;

case 4:
return a.label++, {
value: u[1],
done: !1
};

case 5:
a.label++, r = u[1], u = [ 0 ];
continue;

case 7:
u = a.ops.pop(), a.trys.pop();
continue;

default:
if (!((o = (o = a.trys).length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
a = 0;
continue;
}
if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
a.label = u[1];
break;
}
if (6 === u[0] && a.label < o[1]) {
a.label = o[1], o = u;
break;
}
if (o && a.label < o[2]) {
a.label = o[2], a.ops.push(u);
break;
}
o[2] && a.ops.pop(), a.trys.pop();
continue;
}
u = t.call(e, a);
} catch (e) {
u = [ 6, e ], r = 0;
} finally {
n = o = 0;
}
if (5 & u[0]) throw u[1];
return {
value: u[0] ? u[1] : void 0,
done: !0
};
}([ u, l ]);
};
}
}, i = this && this.__read || function(e, t) {
var n = "function" == typeof Symbol && e[Symbol.iterator];
if (!n) return e;
var r, o, a = n.call(e), i = [];
try {
for (;(void 0 === t || t-- > 0) && !(r = a.next()).done; ) i.push(r.value);
} catch (e) {
o = {
error: e
};
} finally {
try {
r && !r.done && (n = a.return) && n.call(a);
} finally {
if (o) throw o.error;
}
}
return i;
};
Object.defineProperty(t, "__esModule", {
value: !0
}), t.evaluateForEachCondition = function e(t, n, s, f, h, p) {
return o(this, arguments, Promise, function(t, n, o, s, f, h, p) {
var d, y, v, b, _, E, O, g, w, T, m, R, P, A;
return void 0 === p && (p = {}), a(this, function(a) {
switch (a.label) {
case 0:
return (d = function(e) {
var t = e.trim().match(/^\(\s*([a-zA-Z_$][\w$]*)\s*(?:,\s*([a-zA-Z_$][\w$]*))?\s*\)\s+in\s+(.+)$/);
if (!t) return null;
var n = i(t, 4), r = n[1], o = n[2], a = function(e) {
var t = e.trim();
if (!t) return null;
var n = t.match(/^(.+)\[([^\]]+)\]$/);
if (!n) return {
basePath: t
};
var r = n[1].trim(), o = n[2].trim();
if (!r) return null;
var a = o.indexOf(":");
if (-1 === a) {
var i = parseInt(o, 10);
return Number.isNaN(i) ? null : {
basePath: r,
sliceRange: {
start: i,
end: i + 1
}
};
}
var u, l = o.slice(0, a).trim(), c = o.slice(a + 1).trim(), s = 0;
if ("" !== l && (s = parseInt(l, 10), Number.isNaN(s))) return null;
if ("" === c) u = Number.MAX_SAFE_INTEGER; else if (u = parseInt(c, 10), Number.isNaN(u)) return null;
return {
basePath: r,
sliceRange: {
start: s,
end: u
}
};
}(n[3].trim());
return a ? {
itemVar: r,
indexVar: o || void 0,
collectionPath: a.basePath,
sliceRange: a.sliceRange
} : null;
}(t.each)) ? [ 4, (0, c.getFactValueAsync)(n, d.collectionPath) ] : [ 2, {
matched: !1
} ];

case 1:
if (y = a.sent(), !Array.isArray(y)) return [ 2, {
matched: !1
} ];
v = y.length, b = 0, _ = v, d.sliceRange && (b = d.sliceRange.start, _ = d.sliceRange.end >= v ? v : Math.min(d.sliceRange.end, v), 
b < 0 && (b = 0), b > v && (b = v), _ < b && (_ = b)), E = null != h ? h : null == f ? void 0 : f.resolvedContext, 
O = b, a.label = 2;

case 2:
return O < _ ? ((A = {})[d.itemVar] = y[O], g = A, d.indexVar && (g[d.indexVar] = O), 
w = r(r({}, p), g), T = function(e, t) {
var n = (0, u.cloneContextRecordPreservingAccessors)(e);
return n[l.RULE_LOOP_BINDINGS_CONTEXT_KEY] = t, n;
}(n, w), m = t.body, (R = m.for) ? [ 4, e(R, T, o, s, f, h, w) ] : [ 3, 4 ]) : [ 3, 7 ];

case 3:
return (P = a.sent()).matched ? [ 2, P ] : [ 3, 6 ];

case 4:
return [ 4, s(m.conditions, T, o, f) ];

case 5:
if (a.sent()) return E && (E[l.RULE_LOOP_BINDINGS_CONTEXT_KEY] = w), [ 2, {
matched: !0,
flow: m.flow,
event: m.event
} ];
a.label = 6;

case 6:
return O++, [ 3, 2 ];

case 7:
return [ 2, {
matched: !1
} ];
}
});
});
};
var u = n(351), l = n(239), c = n(253);
},
351: (e, t) => {
Object.defineProperty(t, "__esModule", {
value: !0
}), t.cloneContextRecordPreservingAccessors = function(e) {
return Object.create(Object.getPrototypeOf(e), Object.getOwnPropertyDescriptors(e));
};
},
802: function(e, t, n) {
var r = this && this.__assign || function() {
return (r = Object.assign || function(e) {
for (var t, n = 1, r = arguments.length; n < r; n++) for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
return e;
}).apply(this, arguments);
}, o = this && this.__awaiter || function(e, t, n, r) {
return new (n || (n = Promise))(function(o, a) {
function i(e) {
try {
l(r.next(e));
} catch (e) {
a(e);
}
}
function u(e) {
try {
l(r.throw(e));
} catch (e) {
a(e);
}
}
function l(e) {
var t;
e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n(function(e) {
e(t);
})).then(i, u);
}
l((r = r.apply(e, t || [])).next());
});
}, a = this && this.__generator || function(e, t) {
var n, r, o, a = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
}, i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(u) {
return function(l) {
return function(u) {
if (n) throw new TypeError("Generator is already executing.");
for (;i && (i = 0, u[0] && (a = 0)), a; ) try {
if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 
0) : r.next) && !(o = o.call(r, u[1])).done) return o;
switch (r = 0, o && (u = [ 2 & u[0], o.value ]), u[0]) {
case 0:
case 1:
o = u;
break;

case 4:
return a.label++, {
value: u[1],
done: !1
};

case 5:
a.label++, r = u[1], u = [ 0 ];
continue;

case 7:
u = a.ops.pop(), a.trys.pop();
continue;

default:
if (!((o = (o = a.trys).length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
a = 0;
continue;
}
if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
a.label = u[1];
break;
}
if (6 === u[0] && a.label < o[1]) {
a.label = o[1], o = u;
break;
}
if (o && a.label < o[2]) {
a.label = o[2], a.ops.push(u);
break;
}
o[2] && a.ops.pop(), a.trys.pop();
continue;
}
u = t.call(e, a);
} catch (e) {
u = [ 6, e ], r = 0;
} finally {
n = o = 0;
}
if (5 & u[0]) throw u[1];
return {
value: u[0] ? u[1] : void 0,
done: !0
};
}([ u, l ]);
};
}
};
Object.defineProperty(t, "__esModule", {
value: !0
}), t.evaluateRulesConditionsFirstMatch = function(e, t, n) {
return o(this, void 0, Promise, function() {
var o, l, c, f, p, d, y, b, _, E;
return a(this, function(a) {
switch (a.label) {
case 0:
o = r(r({}, u.BUILTIN_JSON_RULE_OPERATORS), null == n ? void 0 : n.operators), l = 0, 
a.label = 1;

case 1:
return l < e.length ? (c = e[l], f = (null == n ? void 0 : n.target) ? (0, i.cloneContextRecordPreservingAccessors)(t) : void 0, 
p = f && (null == n ? void 0 : n.target) ? {
resolvedContext: f,
target: n.target
} : void 0, d = (null == n ? void 0 : n.debug) ? {
ruleIndex: l,
flow: c.flow,
path: "conditions",
depth: 0,
onTrace: null === (E = null == n ? void 0 : n.debug) || void 0 === E ? void 0 : E.onTrace
} : void 0, (null == n ? void 0 : n.debug) && v(d, {
type: "ruleStart",
flow: c.flow
}), [ 4, h(c, t, o, p, f, d) ]) : [ 3, 5 ];

case 2:
return y = a.sent(), (null == n ? void 0 : n.debug) && v(d, {
type: "ruleEnd",
flow: c.flow,
matched: y.matched
}), y.matched ? (b = y.flow, _ = y.event, [ 4, (0, s.runEvent)(_, p) ]) : [ 3, 4 ];

case 3:
return a.sent(), [ 2, {
matched: !0,
matchedFlows: b ? [ b ] : [],
resolvedContext: f
} ];

case 4:
return l++, [ 3, 1 ];

case 5:
return [ 2, {
matched: !1,
matchedFlows: [],
resolvedContext: void 0
} ];
}
});
});
};
var i = n(351), u = n(187), l = n(239), c = n(253), s = n(883), f = n(329);
function h(e, t, n, r, i, u) {
return o(this, void 0, Promise, function() {
var o, l;
return a(this, function(a) {
switch (a.label) {
case 0:
return (o = e.for) ? [ 3, 2 ] : [ 4, p(e.conditions, t, n, r, u) ];

case 1:
return [ 2, {
matched: a.sent(),
flow: e.flow,
event: e.event
} ];

case 2:
return [ 4, (0, f.evaluateForEachCondition)(o, t, n, p, r, i) ];

case 3:
return l = a.sent(), u && v(u, {
type: "condition",
kind: "for",
matched: l.matched,
path: "for",
depth: 0,
fact: o.each
}), [ 2, l ];
}
});
});
}
function p(e, t, n, i, u) {
return o(this, void 0, Promise, function() {
var o, f, h, b, _, E, O, g, w, T, m, R, P, A, x, N;
return a(this, function(a) {
switch (a.label) {
case 0:
if ("boolean" == typeof e) return u && v(u, {
type: "condition",
kind: "boolean",
matched: e
}), [ 2, e ];
if (!("and" in e)) return [ 3, 7 ];
o = !0, h = 0, a.label = 1;

case 1:
return h < e.and.length ? (b = u ? y(u, "and[".concat(h, "]")) : void 0, [ 4, p(e.and[h], t, n, i, b) ]) : [ 3, 4 ];

case 2:
if (!a.sent()) return o = !1, [ 3, 4 ];
a.label = 3;

case 3:
return h++, [ 3, 1 ];

case 4:
return o ? [ 4, (0, s.runEvent)(e.event, i) ] : [ 3, 6 ];

case 5:
a.sent(), a.label = 6;

case 6:
return u && v(u, {
type: "condition",
kind: "and",
matched: o
}), [ 2, o ];

case 7:
if (!("or" in e)) return [ 3, 14 ];
f = !1, h = 0, a.label = 8;

case 8:
return h < e.or.length ? (b = u ? y(u, "or[".concat(h, "]")) : void 0, [ 4, p(e.or[h], t, n, i, b) ]) : [ 3, 11 ];

case 9:
if (a.sent()) return f = !0, [ 3, 11 ];
a.label = 10;

case 10:
return h++, [ 3, 8 ];

case 11:
return f ? [ 4, (0, s.runEvent)(e.event, i) ] : [ 3, 13 ];

case 12:
a.sent(), a.label = 13;

case 13:
return u && v(u, {
type: "condition",
kind: "or",
matched: f
}), [ 2, f ];

case 14:
return "not" in e ? [ 4, p(e.not, t, n, i, u ? y(u, "not") : void 0) ] : [ 3, 18 ];

case 15:
return (_ = !a.sent()) ? [ 4, (0, s.runEvent)(e.event, i) ] : [ 3, 17 ];

case 16:
a.sent(), a.label = 17;

case 17:
return u && v(u, {
type: "condition",
kind: "not",
matched: _
}), [ 2, _ ];

case 18:
return E = e.fact, O = e.operator, g = e.value, [ 4, (0, c.getFactValueAsync)(t, E) ];

case 19:
return w = a.sent(), T = u ? d(t, E) : "", [ 4, (0, c.resolveValueAsync)(t, g) ];

case 20:
return m = a.sent(), R = u ? function() {
if (null != g && "object" == typeof g && "fact" in g) {
var e = g.fact;
return "string" == typeof e ? e : void 0;
}
}() : void 0, P = R ? d(t, R) : void 0, (A = n[O]) ? [ 4, A(w, m) ] : (u && v(u, {
type: "condition",
kind: "leaf",
matched: !1,
fact: E,
operator: O,
factValue: w,
value: m,
valueFact: R,
valueFactComment: P,
reason: "未知运算符",
factComment: T
}), [ 2, !1 ]);

case 21:
return "object" == typeof (x = a.sent()) && null !== x && "status" in x ? (N = !!x.status) && x.data && i && function(e, t) {
var n, o, a, i = null == O ? void 0 : O.trim();
if (i) {
var u = null !== (n = e[l.RULE_RESOLVED_OPERATOR_CONTEXT_KEY]) && void 0 !== n ? n : e[l.RULE_RESOLVED_OPERATOR_CONTEXT_KEY] = {}, c = null !== (o = u[i]) && void 0 !== o ? o : u[i] = {}, s = null !== (a = c.data) && void 0 !== a ? a : {};
c.data = r(r({}, s), t);
}
}(i.resolvedContext, x.data) : N = !!x, N ? [ 4, (0, s.runEvent)(e.event, i) ] : [ 3, 23 ];

case 22:
a.sent(), a.label = 23;

case 23:
return u && v(u, {
type: "condition",
kind: "leaf",
matched: N,
fact: E,
operator: O,
factValue: w,
value: m,
valueFact: R,
valueFactComment: P,
factComment: T
}), [ 2, N ];
}
});
});
}
function d(e, t) {
var n = e[l.RULE_FACT_COMMENT_CONTEXT_KEY];
return null == n ? void 0 : n[t];
}
function y(e, t) {
if (e) return r(r({}, e), {
path: "".concat(e.path, ".").concat(t),
depth: e.depth + 1
});
}
function v(e, t) {
var n, o;
if (null == e ? void 0 : e.onTrace) try {
if ("condition" === t.type) return void e.onTrace(r({
ruleIndex: e.ruleIndex,
flow: e.flow,
path: null !== (n = t.path) && void 0 !== n ? n : e.path,
depth: null !== (o = t.depth) && void 0 !== o ? o : e.depth
}, t));
e.onTrace(r({
ruleIndex: e.ruleIndex
}, t));
} catch (e) {}
}
},
883: function(e, t, n) {
var r = this && this.__awaiter || function(e, t, n, r) {
return new (n || (n = Promise))(function(o, a) {
function i(e) {
try {
l(r.next(e));
} catch (e) {
a(e);
}
}
function u(e) {
try {
l(r.throw(e));
} catch (e) {
a(e);
}
}
function l(e) {
var t;
e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n(function(e) {
e(t);
})).then(i, u);
}
l((r = r.apply(e, t || [])).next());
});
}, o = this && this.__generator || function(e, t) {
var n, r, o, a = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
}, i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return i.next = u(0), i.throw = u(1), i.return = u(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
return this;
}), i;
function u(u) {
return function(l) {
return function(u) {
if (n) throw new TypeError("Generator is already executing.");
for (;i && (i = 0, u[0] && (a = 0)), a; ) try {
if (n = 1, r && (o = 2 & u[0] ? r.return : u[0] ? r.throw || ((o = r.return) && o.call(r), 
0) : r.next) && !(o = o.call(r, u[1])).done) return o;
switch (r = 0, o && (u = [ 2 & u[0], o.value ]), u[0]) {
case 0:
case 1:
o = u;
break;

case 4:
return a.label++, {
value: u[1],
done: !1
};

case 5:
a.label++, r = u[1], u = [ 0 ];
continue;

case 7:
u = a.ops.pop(), a.trys.pop();
continue;

default:
if (!((o = (o = a.trys).length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
a = 0;
continue;
}
if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
a.label = u[1];
break;
}
if (6 === u[0] && a.label < o[1]) {
a.label = o[1], o = u;
break;
}
if (o && a.label < o[2]) {
a.label = o[2], a.ops.push(u);
break;
}
o[2] && a.ops.pop(), a.trys.pop();
continue;
}
u = t.call(e, a);
} catch (e) {
u = [ 6, e ], r = 0;
} finally {
n = o = 0;
}
if (5 & u[0]) throw u[1];
return {
value: u[0] ? u[1] : void 0,
done: !0
};
}([ u, l ]);
};
}
};
Object.defineProperty(t, "__esModule", {
value: !0
}), t.runEvent = function(e, t) {
return r(this, void 0, Promise, function() {
var n, r, i, u, l, c, s;
return o(this, function(o) {
switch (o.label) {
case 0:
return e && t ? (n = t.resolvedContext, r = t.target, i = e.type, u = e.args, l = void 0 === u ? [] : u, 
Array.isArray(l) ? [ 4, (0, a.resolveArgsAsync)(n, l) ] : [ 3, 2 ]) : [ 2 ];

case 1:
return s = o.sent(), [ 3, 3 ];

case 2:
s = [], o.label = 3;

case 3:
return c = s, "function" != typeof r[i] ? [ 3, 5 ] : [ 4, r[i].apply(r, c) ];

case 4:
return o.sent(), [ 3, 6 ];

case 5:
o.label = 6;

case 6:
return [ 2 ];
}
});
});
};
var a = n(253);
}
}, o = {};
function a(e) {
var t = o[e];
if (void 0 !== t) return t.exports;
var n = o[e] = {
exports: {}
};
return r[e].call(n.exports, n, n.exports, a), n.exports;
}
e = a(239), t = a(802), n = a(253), window.rulesEngine || (window.rulesEngine = {
RULE_RESOLVED_OPERATOR_CONTEXT_KEY: e.RULE_RESOLVED_OPERATOR_CONTEXT_KEY,
RULE_TRAIT_PROPS_CONTEXT_KEY: e.RULE_TRAIT_PROPS_CONTEXT_KEY,
evaluateRulesConditionsFirstMatch: t.evaluateRulesConditionsFirstMatch,
resolveValue: n.resolveValue,
resolveValueAsync: n.resolveValueAsync,
getFactValue: n.getFactValue,
getFactValueAsync: n.getFactValueAsync
});
})();