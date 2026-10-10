window.__require = function e(r, t, o) {
function i(s, c) {
if (!t[s]) {
if (!r[s]) {
var u = s.split("/");
u = u[u.length - 1];
if (!r[u]) {
var a = "function" == typeof __require && __require;
if (!c && a) return a(u, !0);
if (n) return n(u, !0);
throw new Error("Cannot find module '" + s + "'");
}
s = u;
}
var l = t[s] = {
exports: {}
};
r[s][0].call(l.exports, function(e) {
return i(r[s][1][e] || e);
}, l, l.exports, e, r, t, o);
}
return t[s].exports;
}
for (var n = "function" == typeof __require && __require, s = 0; s < o.length; s++) i(o[s]);
return i;
}({
IrregularGuideTrait: [ function(e, r, t) {
"use strict";
cc._RF.push(r, "4002euHHMpCuLwvFRDvMilO", "IrregularGuideTrait");
var o, i = this && this.__extends || (o = function(e, r) {
return (o = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(e, r) {
e.__proto__ = r;
} || function(e, r) {
for (var t in r) Object.prototype.hasOwnProperty.call(r, t) && (e[t] = r[t]);
})(e, r);
}, function(e, r) {
o(e, r);
function t() {
this.constructor = e;
}
e.prototype = null === r ? Object.create(r) : (t.prototype = r.prototype, new t());
}), n = this && this.__decorate || function(e, r, t, o) {
var i, n = arguments.length, s = n < 3 ? r : null === o ? o = Object.getOwnPropertyDescriptor(r, t) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) s = Reflect.decorate(e, r, t, o); else for (var c = e.length - 1; c >= 0; c--) (i = e[c]) && (s = (n < 3 ? i(s) : n > 3 ? i(r, t, s) : i(r, t)) || s);
return n > 3 && s && Object.defineProperty(r, t, s), s;
};
Object.defineProperty(t, "__esModule", {
value: !0
});
t.IrregularGuideTrait = void 0;
var s = function(e) {
i(r, e);
function r() {
var r = null !== e && e.apply(this, arguments) || this;
r._isInjected = !1;
return r;
}
r.prototype.onActive = function(e) {
(hs.tp.isClassBlocksProducer_ProxyOnInit(e) || hs.tp.isClassBoard_ProxyOnBoardInit(e)) && this.changeGuideStep();
};
r.prototype.changeGuideStep = function() {
if (hs.gameInfo.gameMode === hs.GameMode.Class) if (this._isInjected) ; else {
var e = hs.classGuideInfo;
if (e) {
var r = e.steps;
if (2 == e.step && r) {
var t = {
save_arr: [ [ -1, -1, -1, 5, 5, -1, -1, -1 ], [ -1, -1, -1, 4, 4, -1, -1, -1 ], [ -1, -1, -1, 2, 2, -1, -1, -1 ], [ 5, 4, 2, -1, 6, 7, 7, 3 ], [ 5, 4, 2, -1, -1, -1, 7, 3 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 7, 7, -1, -1, -1 ], [ -1, -1, -1, 3, 3, -1, -1, -1 ] ],
producerBlocks: [ -1, 8, -1 ],
blocksColors: [ 6, 6, 6 ],
color: 6,
move: [ {
x: 53,
y: -553.75
}, {
x: 53,
y: 126.25
} ]
};
Object.assign(r[2], t);
hs.storage.setItem("classFaceBlocks", t.save_arr);
hs.storage.setItem("classProducerBlocks", t.producerBlocks);
this._isInjected = !0;
}
}
}
};
return n([ classId("IrregularGuideTrait") ], r);
}(Trait);
t.IrregularGuideTrait = s;
cc._RF.pop();
}, {} ]
}, {}, [ "IrregularGuideTrait" ]);
//# sourceMappingURL=index.js.map
