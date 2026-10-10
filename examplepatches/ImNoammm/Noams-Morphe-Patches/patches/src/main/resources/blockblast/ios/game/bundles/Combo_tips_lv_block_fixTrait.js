window.__require = function t(e, r, o) {
function i(_, c) {
if (!r[_]) {
if (!e[_]) {
var f = _.split("/");
f = f[f.length - 1];
if (!e[f]) {
var l = "function" == typeof __require && __require;
if (!c && l) return l(f, !0);
if (n) return n(f, !0);
throw new Error("Cannot find module '" + _ + "'");
}
_ = f;
}
var u = r[_] = {
exports: {}
};
e[_][0].call(u.exports, function(t) {
return i(e[_][1][t] || t);
}, u, u.exports, t, e, r, o);
}
return r[_].exports;
}
for (var n = "function" == typeof __require && __require, _ = 0; _ < o.length; _++) i(o[_]);
return i;
}({
Combo_tips_lv_block_fixTrait: [ function(t, e, r) {
"use strict";
cc._RF.push(e, "ca6fdOXNOFNe6gklqPURul2", "Combo_tips_lv_block_fixTrait");
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
var i, n = arguments.length, _ = n < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, r) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) _ = Reflect.decorate(t, e, r, o); else for (var c = t.length - 1; c >= 0; c--) (i = t[c]) && (_ = (n < 3 ? i(_) : n > 3 ? i(e, r, _) : i(e, r)) || _);
return n > 3 && _ && Object.defineProperty(e, r, _), _;
};
Object.defineProperty(r, "__esModule", {
value: !0
});
r.Combo_tips_lv_block_fixTrait = void 0;
var _ = function(t) {
i(e, t);
function e() {
return null !== t && t.apply(this, arguments) || this;
}
e.prototype.onActive = function(t) {
if (hs.tp.isCombo_tips_lv_blockTraitOnFixTraitModify(t)) {
t.returnValue = !1;
t.replace = !0;
}
};
return n([ classId("Combo_tips_lv_block_fixTrait") ], e);
}(Trait);
r.Combo_tips_lv_block_fixTrait = _;
cc._RF.pop();
}, {} ]
}, {}, [ "Combo_tips_lv_block_fixTrait" ]);
//# sourceMappingURL=index.js.map
