window.__require = function t(o, e, i) {
function n(a, s) {
if (!e[a]) {
if (!o[a]) {
var l = a.split("/");
l = l[l.length - 1];
if (!o[l]) {
var c = "function" == typeof __require && __require;
if (!s && c) return c(l, !0);
if (r) return r(l, !0);
throw new Error("Cannot find module '" + a + "'");
}
a = l;
}
var h = e[a] = {
exports: {}
};
o[a][0].call(h.exports, function(t) {
return n(o[a][1][t] || t);
}, h, h.exports, t, o, e, i);
}
return e[a].exports;
}
for (var r = "function" == typeof __require && __require, a = 0; a < i.length; a++) n(i[a]);
return n;
}({
ColorTools: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "872fbfiNlVAJ4Cb3+Bgknf8", "ColorTools");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = t("./HueTools"), s = t("./LightAndSaturationTools"), l = cc._decorator, c = l.ccclass, h = l.property, d = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.hue_tools = null;
o.light_and_saturation_tools = null;
o.hue = 0;
o.light = 0;
o.saturation = 0;
o.colorData = null;
return o;
}
o.prototype.setState = function(t) {
this.colorData = new cc.Color().fromHEX("" + t);
this.initHueLightSaturationValue(this.colorData);
this.hue_tools.setHue(this.hue);
this.light_and_saturation_tools.setColorData(this.hue, this.light, this.saturation);
};
o.prototype.initColor = function(t, o, e) {
var i = this;
void 0 === e && (e = {
lightMin: .25,
lightMax: .9,
saturationMin: .2,
saturationMax: .9
});
this.colorData = new cc.Color().fromHEX("" + t);
this.initHueLightSaturationValue(this.colorData);
this.hue_tools.init(this.hue, function(t) {
i.hue = t;
i.light_and_saturation_tools.setHue(t);
i.setColor();
});
this.light_and_saturation_tools.init(this.light, this.saturation, e, this.hue, function(t, o) {
i.light = t;
i.saturation = o;
i.setColor();
});
this.callback = o;
};
o.prototype.setColor = function() {
var t = this;
this.scheduleOnce(function() {
t.hslToRgb(t.hue, t.saturation, t.light);
t.exportColor();
}, 0);
};
o.prototype.exportColor = function() {
var t = this.colorData.toHEX("#");
this.callback && this.callback("#" + t);
};
o.prototype.hslToRgb = function(t, o, e) {
var i = t / 360, n = o, r = e;
if (0 !== n) {
i = 6 * (i - Math.floor(i));
var a, s, l, c = Math.floor(i), h = i - c, d = r * (1 - n), u = r * (1 - n * h), p = r * (1 - n * (1 - h));
if (0 === c) {
a = r;
s = p;
l = d;
} else if (1 === c) {
a = u;
s = r;
l = d;
} else if (2 === c) {
a = d;
s = r;
l = p;
} else if (3 === c) {
a = d;
s = u;
l = r;
} else if (4 === c) {
a = p;
s = d;
l = r;
} else {
a = r;
s = d;
l = u;
}
this.colorData.r = Math.round(255 * a);
this.colorData.g = Math.round(255 * s);
this.colorData.b = Math.round(255 * l);
this.colorData.a = 255;
} else {
var f = Math.round(255 * r);
this.colorData.r = f;
this.colorData.g = f;
this.colorData.b = f;
this.colorData.a = 255;
}
};
o.prototype.initHueLightSaturationValue = function(t) {
var o = t.r / 255, e = t.g / 255, i = t.b / 255, n = Math.max(Math.max(o, e), i), r = n - Math.min(Math.min(o, e), i), a = 0, s = 0, l = n;
0 !== n && (s = r / n);
if (0 !== r) {
a = n === o ? (e - i) / r + (e < i ? 6 : 0) : n === e ? (i - o) / r + 2 : (o - e) / r + 4;
a /= 6;
}
this.hue = 360 * a;
this.saturation = s;
this.light = l;
};
r([ h(a.default) ], o.prototype, "hue_tools", void 0);
r([ h(s.default) ], o.prototype, "light_and_saturation_tools", void 0);
return r([ c ], o);
}(hs.Component);
e.default = d;
cc._RF.pop();
}, {
"./HueTools": "HueTools",
"./LightAndSaturationTools": "LightAndSaturationTools"
} ],
HueTools: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "e46ccbSEVNPTZQWS7I+fAZX", "HueTools");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = cc._decorator, s = a.ccclass, l = a.property, c = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.sprite = null;
o.select_node = null;
o.height = 0;
o.hue = 0;
o.startY = 0;
return o;
}
o.prototype.init = function(t, o) {
this.hue = t;
this.height = this.sprite.node.height;
this.callback = o;
this.setHueState(this.hue);
this.node.on(cc.Node.EventType.TOUCH_START, this.onTouchStart, this);
this.node.on(cc.Node.EventType.TOUCH_MOVE, this.onTouchMove, this);
this.node.on(cc.Node.EventType.TOUCH_END, this.onTouchEnd, this);
this.node.on(cc.Node.EventType.TOUCH_CANCEL, this.onTouchEnd, this);
};
o.prototype.setHue = function(t) {
this.hue = t;
this.setHueState(this.hue);
};
o.prototype.setHueState = function(t) {
var o = t / 360 * this.height - this.height / 2;
this.select_node.y = o;
};
o.prototype.onTouchStart = function(t) {
var o = t.getLocation();
(o = this.node.convertToNodeSpaceAR(o)).y < -this.height / 2 ? o.y = -this.height / 2 : o.y > this.height / 2 && (o.y = this.height / 2);
this.startY = o.y;
this.setSelectNodePositionByPosition(o);
};
o.prototype.onTouchMove = function(t) {
var o = t.getLocation();
(o = this.node.convertToNodeSpaceAR(o)).y < -this.height / 2 ? o.y = -this.height / 2 : o.y > this.height / 2 && (o.y = this.height / 2);
this.setSelectNodePositionByPosition(o);
};
o.prototype.onTouchEnd = function(t) {
var o = t.getLocation();
(o = this.node.convertToNodeSpaceAR(o)).y < -this.height / 2 ? o.y = -this.height / 2 : o.y > this.height / 2 && (o.y = this.height / 2);
this.setSelectNodePositionByPosition(o);
};
o.prototype.setSelectNodePositionByPosition = function(t) {
this.select_node.y = t.y;
var o = t.y + this.height / 2;
this.hue = o / this.height * 360;
this.callback(this.hue);
};
o.prototype.onDestroy = function() {
this.node.off(cc.Node.EventType.TOUCH_START, this.onTouchStart, this);
this.node.off(cc.Node.EventType.TOUCH_MOVE, this.onTouchMove, this);
this.node.off(cc.Node.EventType.TOUCH_END, this.onTouchEnd, this);
this.node.off(cc.Node.EventType.TOUCH_CANCEL, this.onTouchEnd, this);
};
r([ l(cc.Sprite) ], o.prototype, "sprite", void 0);
r([ l(cc.Node) ], o.prototype, "select_node", void 0);
return r([ s ], o);
}(hs.Component);
e.default = c;
cc._RF.pop();
}, {} ],
LightAndSaturationTools: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "49206XXcqNP7YYFn958gmKR", "LightAndSaturationTools");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = cc._decorator, s = a.ccclass, l = a.property, c = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.sprite = null;
o.select_node = null;
o.hue = 0;
o.light = 0;
o.saturation = 0;
o.material = null;
o.width = 0;
o.height = 0;
o.color = null;
o.option = {
lightMin: 0,
lightMax: 1,
saturationMin: 0,
saturationMax: 1
};
return o;
}
o.prototype.init = function(t, o, e, i, n) {
void 0 === e && (e = {
lightMin: 0,
lightMax: 1,
saturationMin: 0,
saturationMax: 1
});
this.option = e;
this.color = new cc.Color();
this.callback = n;
this.hue = i;
this.light = t;
this.saturation = o;
this.width = this.sprite.node.width;
this.height = this.sprite.node.height;
this.material = this.sprite.getMaterial(0);
this.material && this.material.setProperty("colorRange", [ this.option.saturationMin, this.option.saturationMax, this.option.lightMin, this.option.lightMax ]);
this.setHue(this.hue);
this.setSelectNodePosition(this.light, this.saturation);
this.node.on(cc.Node.EventType.TOUCH_START, this.onTouchStart, this);
this.node.on(cc.Node.EventType.TOUCH_MOVE, this.onTouchMove, this);
this.node.on(cc.Node.EventType.TOUCH_END, this.onTouchEnd, this);
this.node.on(cc.Node.EventType.TOUCH_CANCEL, this.onTouchEnd, this);
};
o.prototype.setHue = function(t) {
this.hue = t;
this.getColorFromHue(t);
this.material && this.material.setProperty("baseColor", this.color);
};
o.prototype.setColorData = function(t, o, e) {
this.hue = t;
this.light = o;
this.saturation = e;
this.setHue(this.hue);
this.setSelectNodePosition(this.light, this.saturation);
};
o.prototype.setSelectNodePosition = function(t, o) {
var e = this.width * (o - this.option.saturationMin) / (this.option.saturationMax - this.option.saturationMin) - this.width / 2, i = this.height * (t - this.option.lightMin) / (this.option.lightMax - this.option.lightMin) - this.height / 2;
this.select_node.setPosition(cc.v2(e, i));
};
o.prototype.onTouchStart = function(t) {
var o = t.getLocation();
o = this.node.convertToNodeSpaceAR(o);
if (!this.outMove(o)) {
o = this.sprite.node.convertToNodeSpaceAR(t.getLocation());
this.fixPosition(o);
this.setSelectNodePositionByPosition(o);
}
};
o.prototype.outMove = function(t) {
return t.x < -this.node.width / 2 || t.x > this.node.width / 2 || t.y < -this.node.height / 2 || t.y > this.node.height / 2;
};
o.prototype.fixPosition = function(t) {
t.x < -this.width / 2 + 10 && (t.x = -this.width / 2 + 10);
t.x > this.width / 2 - 10 && (t.x = this.width / 2 - 10);
t.y < -this.height / 2 + 10 && (t.y = -this.height / 2 + 10);
t.y > this.height / 2 - 10 && (t.y = this.height / 2 - 10);
};
o.prototype.onTouchMove = function(t) {
var o = t.getLocation();
o = this.node.convertToNodeSpaceAR(o);
if (!this.outMove(o)) {
o = this.sprite.node.convertToNodeSpaceAR(t.getLocation());
this.fixPosition(o);
this.setSelectNodePositionByPosition(o);
}
};
o.prototype.onTouchEnd = function(t) {
var o = t.getLocation();
o = this.node.convertToNodeSpaceAR(o);
if (!this.outMove(o)) {
o = this.sprite.node.convertToNodeSpaceAR(t.getLocation());
this.fixPosition(o);
this.setSelectNodePositionByPosition(o);
}
};
o.prototype.setSelectNodePositionByPosition = function(t) {
this.select_node.setPosition(t);
var o = t.x + this.width / 2, e = t.y + this.height / 2;
this.saturation = o / this.width * (this.option.saturationMax - this.option.saturationMin) + this.option.saturationMin;
this.light = e / this.height * (this.option.lightMax - this.option.lightMin) + this.option.lightMin;
this.callback(this.light, this.saturation);
};
o.prototype.onDestroy = function() {
this.node.off(cc.Node.EventType.TOUCH_START, this.onTouchStart, this);
this.node.off(cc.Node.EventType.TOUCH_MOVE, this.onTouchMove, this);
this.node.off(cc.Node.EventType.TOUCH_END, this.onTouchEnd, this);
this.node.off(cc.Node.EventType.TOUCH_CANCEL, this.onTouchEnd, this);
};
o.prototype.getColorFromHue = function(t) {
(t %= 360) < 0 && (t += 360);
var o, e, i, n = t % 60 / 60, r = 255 * (1 - n), a = 255 * n, s = 255;
switch (Math.floor(t / 60)) {
case 0:
o = s;
e = a;
i = 0;
break;

case 1:
o = r;
e = s;
i = 0;
break;

case 2:
o = 0;
e = s;
i = a;
break;

case 3:
o = 0;
e = r;
i = s;
break;

case 4:
o = a;
e = 0;
i = s;
break;

case 5:
o = s;
e = 0;
i = r;
break;

default:
o = e = i = 0;
}
this.color.r = Math.round(o);
this.color.g = Math.round(e);
this.color.b = Math.round(i);
this.color.a = 255;
};
r([ l(cc.Sprite) ], o.prototype, "sprite", void 0);
r([ l(cc.Node) ], o.prototype, "select_node", void 0);
return r([ s ], o);
}(hs.Component);
e.default = c;
cc._RF.pop();
}, {} ],
SkinEditItem: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "da613x7zfNHI5X2gmP6/uDR", "SkinEditItem");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = cc._decorator, s = a.ccclass, l = a.property, c = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.singleColor = null;
o.selectNd = null;
o.resetNd = null;
o.resetNd1 = null;
o.resetNd2 = null;
o._resetStyle = 1;
return o;
}
o.prototype.onLoad = function() {
this.setState({
isSelected: !1,
showReset: !1
});
this._resetStyle = 1;
if (2 === this._resetStyle) {
this.resetNd2 && (this.resetNd2.active = !0);
this.resetNd1 && (this.resetNd1.active = !1);
} else {
this.resetNd2 && (this.resetNd2.active = !1);
this.resetNd1 && (this.resetNd1.active = !0);
}
};
o.prototype.render = function() {
this.selectNd && (this.selectNd.active = this.state.isSelected || !1);
this.resetNd && (this.resetNd.active = this.state.showReset || !1);
};
o.prototype.setColor = function(t) {
this.singleColor && (this.singleColor.node.color = cc.color().fromHEX(t));
};
o.prototype.setSelected = function(t) {
this.setState({
isSelected: t
});
};
o.prototype.setShowReset = function(t) {
this.setState({
showReset: t
});
};
r([ l(cc.Sprite) ], o.prototype, "singleColor", void 0);
r([ l(cc.Node) ], o.prototype, "selectNd", void 0);
r([ l(cc.Node) ], o.prototype, "resetNd", void 0);
r([ l(cc.Node) ], o.prototype, "resetNd1", void 0);
r([ l(cc.Node) ], o.prototype, "resetNd2", void 0);
return r([ s ], o);
}(hs.Component);
e.default = c;
cc._RF.pop();
}, {} ],
SkinUGCBtn: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "346efkYcOZAOL6jTPkYRXUc", "SkinUGCBtn");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = t("../scripts/SkinUGCInfo"), s = cc._decorator, l = s.ccclass, c = s.property, h = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.btn = null;
o.redDot = null;
return o;
}
o.prototype.onLoad = function() {
this.setState({
showRedDot: !1
});
};
o.prototype.start = function() {
this.refreshRedDot();
this._sendExposureData();
};
o.prototype.onEnable = function() {
this.refreshRedDot();
};
o.prototype.render = function() {
this.redDot && (this.redDot.active = this.state.showRedDot || !1);
};
o.prototype.refreshRedDot = function() {
var t = !a.skinUGCInfo.enteredEdit;
this.setState({
showRedDot: t
});
};
o.prototype.onClick = function() {
var t = TRAIT("SkinUGCTrait");
(null == t ? void 0 : t.active) && t.openSkinList();
this._sendClickData();
};
o.prototype._sendExposureData = function() {};
o.prototype._sendClickData = function() {};
r([ c(cc.Button) ], o.prototype, "btn", void 0);
r([ c(cc.Node) ], o.prototype, "redDot", void 0);
r([ hs.throttle(500) ], o.prototype, "onClick", null);
return r([ l ], o);
}(hs.Component);
e.default = h;
cc._RF.pop();
}, {
"../scripts/SkinUGCInfo": "SkinUGCInfo"
} ],
SkinUGCDelete: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "5b4eacXxeBA2I/ekhxxp6Fe", "SkinUGCDelete");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = t("../scripts/SkinUGCInfo"), s = t("./SkinUGCEdit"), l = t("./SkinUGCList"), c = cc._decorator, h = c.ccclass, d = c.property, u = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.label = null;
o._data = null;
return o;
}
o.prototype.show = function(t) {
this._data = t;
};
o.prototype.onClickYes = function() {
var t = this;
if (this._data) {
this._sendClickData(!0);
var o = a.skinUGCInfo.extractBaseId(a.skinUGCInfo.getCurrentSkinId());
a.skinUGCInfo.deleteSkin(this._data);
if (this._data.id === o) {
var e = TRAIT("SkinUGCTrait");
null == e || e.dispatchSkinUpdate(hs.skinInfo.originSkinId, function() {
t._emitListRefresh();
});
}
var i = hs.gameAlertLayer;
if (cc.isValid(i)) {
var n = i.getChildByName("SkinUGCEdit");
if (cc.isValid(n)) {
var r = n.getComponent(s.default);
r && r.close();
}
}
this._emitListRefresh();
this._destroyNode();
}
};
o.prototype.onClickNo = function() {
this._sendClickData(!1);
this._destroyNode();
};
o.prototype._sendClickData = function() {};
o.prototype._emitListRefresh = function() {
var t = hs.gameAlertLayer;
if (cc.isValid(t)) {
var o = t.getChildByName("SkinUGCList");
if (cc.isValid(o)) {
var e = o.getComponent(l.default);
e && e.refresh();
}
}
};
o.prototype._destroyNode = function() {
var t = this;
cc.isValid(this.node) && cc.director.once(cc.Director.EVENT_AFTER_UPDATE, function() {
cc.isValid(t.node) && t.node.destroy();
});
};
r([ d(cc.Label) ], o.prototype, "label", void 0);
r([ hs.throttle(500) ], o.prototype, "onClickYes", null);
r([ hs.throttle(500) ], o.prototype, "onClickNo", null);
return r([ h ], o);
}(hs.Component);
e.default = u;
cc._RF.pop();
}, {
"../scripts/SkinUGCInfo": "SkinUGCInfo",
"./SkinUGCEdit": "SkinUGCEdit",
"./SkinUGCList": "SkinUGCList"
} ],
SkinUGCEdit: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "5d450YxFmpEDY3E0ODfEYot", "SkinUGCEdit");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
}, a = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var i, n, r = e.call(t), a = [];
try {
for (;(void 0 === o || o-- > 0) && !(i = r.next()).done; ) a.push(i.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (n) throw n.error;
}
}
return a;
}, s = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(a(arguments[o]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var l = t("../scripts/SkinUGCInfo"), c = t("../scripts/SkinUGCType"), h = t("./colorTools/ColorTools"), d = t("./SkinEditItem"), u = t("./SkinUGCList"), p = cc._decorator, f = p.ccclass, g = p.property, _ = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.gameBg = null;
o.board = null;
o.blocks = [];
o.blockSelectNd = null;
o.colorNd = null;
o.newColor = null;
o.oldColor = null;
o.bgItem = null;
o.boardItem = null;
o.boardFrame = null;
o.boardLine = null;
o.blockItems = [];
o.tipNd = null;
o.colorPanel = null;
o.oldNd = null;
o.newNd = null;
o.toolNd = null;
o._data = null;
o._originalData = null;
o._defaultData = null;
o._allItems = [];
o._curIndex = 2;
o._pnlTop = 0;
o._pnlLeft = 0;
o._colorPnl = null;
o._blockInited = !1;
o._colorTools = null;
return o;
}
o.prototype.start = function() {
var t;
if (null === (t = TRAIT("SkinUGCEditBackTrait")) || void 0 === t ? void 0 : t.active) {
var o = this.node.getChildByName("btnBack");
o && hs.applyAdapterFringe(o);
}
this.setState({
curIndex: 2
});
};
o.prototype.show = function(t) {
var o, e = this;
this._data = t;
this._originalData = JSON.parse(JSON.stringify(t));
this._defaultData = l.skinUGCInfo.getDefaultSkin();
this._allItems = s([ this.bgItem, this.boardItem ], this.blockItems);
if (this.colorPanel) {
this._pnlTop = this.colorPanel.height / 2;
this._pnlLeft = -this.colorPanel.width / 2;
}
this._initStyle();
if (!l.skinUGCInfo.enteredEdit) {
l.skinUGCInfo.enteredEdit = 1;
null === (o = TRAIT("SkinUGCTrait")) || void 0 === o || o.refreshBtn();
}
this._changeBgColor(t);
this.blocks[0] && (this.blocks[0].node.active = !1);
this.blockItems[0] && (this.blockItems[0].node.active = !1);
this.scheduleOnce(function() {
e._initBlocks();
for (var o = 0; o < t.blocks.length; o++) e._changeBlocksColor(t, o);
e._refreshSelect();
}, 0);
var i = TRAIT("IsOpenSkinUGCEditEnableClickTrait");
(null == i ? void 0 : i.active) && i.addExtraClickArea(this.node, function(t) {
e._curIndex = t;
e._refreshSelect();
});
};
o.prototype._initStyle = function() {
var t, o = this;
switch (l.skinUGCInfo.editStyle) {
case c.EditStyle.Tile1:
this.toolNd && (this.toolNd.active = !1);
this.colorPanel && (this.colorPanel.active = !0);
this._colorPnl = this.colorPanel;
this.colorNd && (this.colorNd.active = !1);
this.oldNd && (this.oldNd.active = !0);
break;

case c.EditStyle.Tile2:
this.toolNd && (this.toolNd.active = !1);
this.colorPanel && (this.colorPanel.active = !0);
this._colorPnl = this.colorPanel;
this.colorNd && (this.colorNd.active = !0);
this.oldNd && (this.oldNd.active = !1);
break;

case c.EditStyle.Palette:
this.toolNd && (this.toolNd.active = !0);
this.colorPanel && (this.colorPanel.active = !1);
this._colorPnl = this.toolNd;
this.colorNd && (this.colorNd.active = !0);
this._colorTools = this.toolNd.getComponent(h.default);
var e;
e = (null === (t = TRAIT("SkinUGCRemoveDarkTrait")) || void 0 === t ? void 0 : t.active) ? {
lightMin: .25,
lightMax: .9,
saturationMin: .2,
saturationMax: .9
} : {
lightMin: 0,
lightMax: 1,
saturationMin: 0,
saturationMax: 1
};
this._colorTools.initColor(this._getColor(this._data, this._curIndex), function(t) {
var e;
o._setColor(o._data, o._curIndex, t);
var i = (null === (e = TRAIT("SkinUGCResetTrait")) || void 0 === e ? void 0 : e.active) && !o._isDefaultColor(o._curIndex);
o._allItems[o._curIndex].resetNd.active = i;
o.newColor.color = cc.color().fromHEX(t);
}, e);
}
};
o.prototype.render = function() {
for (var t, o = null !== (t = this.state.curIndex) && void 0 !== t ? t : 2, e = 0; e < this._allItems.length; e++) this._allItems[e] && this._allItems[e].setSelected(e === o);
if (o > 1 && this._blockInited && this.blockSelectNd) {
this.blockSelectNd.active = !0;
var i = 4 * (o - 2);
this.blocks[i] && (this.blockSelectNd.y = this.blocks[i].node.y);
} else this.blockSelectNd && (this.blockSelectNd.active = !1);
};
o.prototype.onClickClose = function() {
this._data && this._originalData && l.skinUGCInfo.resetSkin(this._data, this._originalData);
this.close();
};
o.prototype.close = function() {
this._emitListRefresh();
this._destroyNode();
};
o.prototype.onClickBack = function() {
this._saveSkin();
};
o.prototype.onClickSave = function() {
this._saveSkin();
};
o.prototype._saveSkin = function() {
var t, o = this;
l.skinUGCInfo.saveSkin(this._data, !0);
var e = TRAIT("SkinUGCTrait"), i = l.skinUGCInfo.extractBaseId(l.skinUGCInfo.getCurrentSkinId());
this._data.id === i ? null == e || e.dispatchSkinUpdate(this._data.id) : (null === (t = TRAIT("SkinUGCAutoSwitchTrait")) || void 0 === t ? void 0 : t.active) && (null == e || e.dispatchSkinUpdate(this._data.id, function() {
o._emitListRefresh();
}));
this.close();
};
o.prototype.onClickDelete = function() {
if (this._data) {
var t = TRAIT("SkinUGCTrait");
null == t || t.openDelete(this._data);
}
};
o.prototype.onClickColorPnl = function(t) {
var o;
if (this.colorPanel && this._data) {
for (var e = this.colorPanel.convertToNodeSpaceAR(t.getLocation()), i = l.skinUGCInfo.colors, n = null, r = 0; r < i.length; r++) for (var a = 0; a < i[r].length; a++) if (e.x >= this._pnlLeft + 72 * a && e.x <= this._pnlLeft + 72 * (a + 1) && e.y >= this._pnlTop - 72 * (r + 1) && e.y <= this._pnlTop - 72 * r) {
n = i[r][a];
this._setNewPos(a, r);
break;
}
if (n) {
var s = null !== (o = this.state.curIndex) && void 0 !== o ? o : 2, c = this._getColor(this._data, s);
if (n && n !== c) {
this._setColor(this._data, s, n);
this._updateResetButton(s);
this.newColor && (this.newColor.color = cc.color().fromHEX(n));
}
}
}
};
o.prototype.onItemClick = function(t) {
var o, e = t.target.getComponent(d.default), i = this._allItems.indexOf(e);
if (i > -1 && i !== this.state.curIndex) {
this._curIndex = i;
this.setState({
curIndex: i
});
this._refreshSelect();
if ((null === (o = this.tipNd) || void 0 === o ? void 0 : o.active) && this._colorPnl) {
this.tipNd.active = !1;
this._colorPnl.active = !0;
}
}
};
o.prototype.onResetClick = function() {
var t, o;
if (this._data && this._defaultData && (null === (t = TRAIT("SkinUGCResetTrait")) || void 0 === t ? void 0 : t.active)) {
var e = null !== (o = this.state.curIndex) && void 0 !== o ? o : 2, i = this._getColor(this._defaultData, e);
this._setColor(this._data, e, i);
this.newColor && (this.newColor.color = cc.color().fromHEX(i));
this._updateResetButton(e);
this._setNewColor(i);
}
};
o.prototype.onOldClick = function() {
var t;
if (this._data && this._originalData) {
var o = null !== (t = this.state.curIndex) && void 0 !== t ? t : 2, e = this._getColor(this._originalData, o);
if (e !== this._getColor(this._data, o)) {
this._setColor(this._data, o, e);
this.newColor && (this.newColor.color = cc.color().fromHEX(e));
this._setNewColor(e);
}
}
};
o.prototype._initBlocks = function() {
for (var t = 0; t < 7; t++) if (this.blockItems.length <= t) {
(n = cc.instantiate(this.blockItems[0].node)).parent = this.blockItems[0].node.parent;
var o = n.getComponent(d.default);
if (o) {
this.blockItems.push(o);
this._allItems.push(o);
}
}
for (t = 0; t < 28; t++) {
var e = Math.floor(t / 4), i = t % 4;
if (this.blocks.length <= t) {
var n, r = (n = cc.instantiate(this.blocks[0].node)).getComponent(hs.BlockMaterialUpdate);
r && this.blocks.push(r);
n.parent = this.blocks[0].node.parent;
}
this.blocks[t].node.x = 106 * (2 + i) - 371;
this.blocks[t].node.y = 371 - 106 * (1 + e);
}
this.blockSelectNd && (this.blockSelectNd.zIndex = 100);
this._blockInited = !0;
};
o.prototype._changeBgColor = function(t) {
var o = t.bg, e = t.board;
if (o || e) {
var i = o ? l.skinUGCInfo.getChangeGameBgColorData(t) : null, n = e ? l.skinUGCInfo.getChangeBoardBgColorData(t) : null, r = e ? l.skinUGCInfo.getChangeBoardLineColorData(t) : null, a = o ? l.skinUGCInfo.getChangeBoardOutLineColorData(t) : null;
i && this.gameBg && (null == (s = this.gameBg.getComponent(hs.SkinGameBgComponent)) || s.setState({
colorData: i,
spriteFrame: null
}));
if (this.board && n && r && a) {
var s;
null == (s = this.board.getComponent(hs.SkinBoardComponent)) || s.setState({
colorData: {
board_out_line: a,
board_bg: n,
board_line: r
},
spriteFrame: null
});
}
this.bgItem && i && (this.bgItem.singleColor.node.color = cc.color().fromHEX(i.color.colorParam));
this.boardItem && n && (this.boardItem.singleColor.node.color = cc.color().fromHEX(n.color.colorParam));
this.boardLine && r && (this.boardLine.node.color = cc.color().fromHEX(r.color.colorParam));
this.boardFrame && a && (this.boardFrame.node.color = cc.color().fromHEX(a.color.colorParam));
}
};
o.prototype._changeBlocksColor = function(t, o) {
for (var e = t.blocks[o], i = 4 * o; i < 4 * o + 4; i++) {
var n = this.blocks[i];
if (n && cc.isValid(n.node)) {
var r = l.skinUGCInfo.getChangeBlocksColorData(t, o);
n.setMaterial(!0);
n.setAllParams(o, r.colorList);
n.node.active || (n.node.active = !0);
}
}
var a = this.blockItems[o];
if (a && cc.isValid(a.node)) {
a.singleColor.node.color = cc.color().fromHEX(e);
a.node.active || (a.node.active = !0);
}
};
o.prototype._getColor = function(t, o) {
return 0 === o ? t.bg : 1 === o ? t.board : t.blocks[o - 2];
};
o.prototype._setColor = function(t, o, e) {
if (0 === o) {
t.bg = e;
this._changeBgColor(t);
} else if (1 === o) {
t.board = e;
this._changeBgColor(t);
} else {
t.blocks[o - 2] = e;
this._changeBlocksColor(t, o - 2);
}
};
o.prototype._refreshSelect = function() {
for (var t, o = null !== (t = this.state.curIndex) && void 0 !== t ? t : 2, e = 0; e < this._allItems.length; e++) this._allItems[e] && this._allItems[e].setSelected(e === o);
if (o > 1 && this._blockInited && this.blockSelectNd) {
this.blockSelectNd.active = !0;
this.blockSelectNd.y = this.blocks[4 * (o - 2)].node.y;
} else this.blockSelectNd && (this.blockSelectNd.active = !1);
if (!(o < 0) && this._data) {
this._setOldColor(this._getColor(this._originalData, o), this._getColor(this._defaultData, o));
this._setNewColor(this._getColor(this._data, o));
this._updateResetButton(o);
}
};
o.prototype._updateResetButton = function(t) {
var o, e = null === (o = TRAIT("SkinUGCResetTrait")) || void 0 === o ? void 0 : o.active, i = this._isDefaultColor(t);
this._allItems[t] && this._allItems[t].setShowReset(!!e && !i);
};
o.prototype._isDefaultColor = function(t) {
return !this._data || !this._defaultData || this._getColor(this._defaultData, t) === this._getColor(this._data, t);
};
o.prototype._setOldColor = function(t, o) {
this.oldColor && (this.oldColor.color = cc.color().fromHEX(t));
if (this.oldNd) {
this.oldNd.active = !1;
for (var e = l.skinUGCInfo.colors, i = 0; i < e.length; i++) for (var n = 0; n < e[i].length; n++) if (o === e[i][n]) {
this.oldNd.y = this._pnlTop - 72 * i - 36;
this.oldNd.x = this._pnlLeft + 72 * n + 36;
this.oldNd.active = !0;
break;
}
}
};
o.prototype._setNewColor = function(t) {
this.newColor && (this.newColor.color = cc.color().fromHEX(t));
if (this.newNd) {
this.newNd.active = !1;
for (var o = l.skinUGCInfo.colors, e = 0; e < o.length; e++) for (var i = 0; i < o[e].length; i++) if (t === o[e][i]) {
this._setNewPos(i, e);
break;
}
}
};
o.prototype._setNewPos = function(t, o) {
if (this.newNd) {
this.newNd.y = this._pnlTop - 72 * o - 36;
this.newNd.x = this._pnlLeft + 72 * t + 36;
this.newNd.active = !0;
}
};
o.prototype._sendClickData = function(t) {
this._data && this._defaultData && DS(t, {
GameType: l.skinUGCInfo.getGameType(),
background: l.skinUGCInfo.getBg(this._data, this._defaultData),
board: l.skinUGCInfo.getBoard(this._data, this._defaultData),
block: l.skinUGCInfo.getBlocks(this._data, this._defaultData)
});
};
o.prototype._emitListRefresh = function() {
var t = hs.gameAlertLayer;
if (cc.isValid(t)) {
var o = t.getChildByName("SkinUGCList");
if (cc.isValid(o)) {
var e = o.getComponent(u.default);
e && e.refresh();
}
}
};
o.prototype._destroyNode = function() {
this.node && cc.isValid(this.node) && this.node.destroy();
};
r([ g(cc.Node) ], o.prototype, "gameBg", void 0);
r([ g(cc.Node) ], o.prototype, "board", void 0);
r([ g([ hs.BlockMaterialUpdate ]) ], o.prototype, "blocks", void 0);
r([ g(cc.Node) ], o.prototype, "blockSelectNd", void 0);
r([ g(cc.Node) ], o.prototype, "colorNd", void 0);
r([ g(cc.Node) ], o.prototype, "newColor", void 0);
r([ g(cc.Node) ], o.prototype, "oldColor", void 0);
r([ g(d.default) ], o.prototype, "bgItem", void 0);
r([ g(d.default) ], o.prototype, "boardItem", void 0);
r([ g(cc.Sprite) ], o.prototype, "boardFrame", void 0);
r([ g(cc.Sprite) ], o.prototype, "boardLine", void 0);
r([ g([ d.default ]) ], o.prototype, "blockItems", void 0);
r([ g(cc.Node) ], o.prototype, "tipNd", void 0);
r([ g(cc.Node) ], o.prototype, "colorPanel", void 0);
r([ g(cc.Node) ], o.prototype, "oldNd", void 0);
r([ g(cc.Node) ], o.prototype, "newNd", void 0);
r([ g(cc.Node) ], o.prototype, "toolNd", void 0);
r([ hs.throttle(500) ], o.prototype, "onClickClose", null);
r([ hs.throttle(500) ], o.prototype, "onClickBack", null);
r([ hs.throttle(500) ], o.prototype, "onClickSave", null);
r([ hs.throttle(500) ], o.prototype, "onClickDelete", null);
r([ hs.throttle(500) ], o.prototype, "onClickColorPnl", null);
r([ hs.throttle(500) ], o.prototype, "onItemClick", null);
r([ hs.throttle(500) ], o.prototype, "onResetClick", null);
r([ hs.throttle(500) ], o.prototype, "onOldClick", null);
return r([ f ], o);
}(hs.Component);
e.default = _;
cc._RF.pop();
}, {
"../scripts/SkinUGCInfo": "SkinUGCInfo",
"../scripts/SkinUGCType": "SkinUGCType",
"./SkinEditItem": "SkinEditItem",
"./SkinUGCList": "SkinUGCList",
"./colorTools/ColorTools": "ColorTools"
} ],
SkinUGCInfo: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "f4201VC/ZJI6J+Dhk/MQZGp", "SkinUGCInfo");
var i = this && this.__assign || function() {
return (i = Object.assign || function(t) {
for (var o, e = 1, i = arguments.length; e < i; e++) {
o = arguments[e];
for (var n in o) Object.prototype.hasOwnProperty.call(o, n) && (t[n] = o[n]);
}
return t;
}).apply(this, arguments);
}, n = this && this.__awaiter || function(t, o, e, i) {
return new (e || (e = Promise))(function(n, r) {
function a(t) {
try {
l(i.next(t));
} catch (t) {
r(t);
}
}
function s(t) {
try {
l(i.throw(t));
} catch (t) {
r(t);
}
}
function l(t) {
t.done ? n(t.value) : (o = t.value, o instanceof e ? o : new e(function(t) {
t(o);
})).then(a, s);
var o;
}
l((i = i.apply(t, o || [])).next());
});
}, r = this && this.__generator || function(t, o) {
var e, i, n, r, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return r = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
return this;
}), r;
function s(t) {
return function(o) {
return l([ t, o ]);
};
}
function l(r) {
if (e) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (e = 1, i && (n = 2 & r[0] ? i.return : r[0] ? i.throw || ((n = i.return) && n.call(i), 
0) : i.next) && !(n = n.call(i, r[1])).done) return n;
(i = 0, n) && (r = [ 2 & r[0], n.value ]);
switch (r[0]) {
case 0:
case 1:
n = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
i = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!n || r[1] > n[0] && r[1] < n[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < n[1]) {
a.label = n[1];
n = r;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(r);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = o.call(t, a);
} catch (t) {
r = [ 6, t ];
i = 0;
} finally {
e = n = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
}, a = this && this.__values || function(t) {
var o = "function" == typeof Symbol && Symbol.iterator, e = o && t[o], i = 0;
if (e) return e.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
t && i >= t.length && (t = void 0);
return {
value: t && t[i++],
done: !t
};
}
};
throw new TypeError(o ? "Object is not iterable." : "Symbol.iterator is not defined.");
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.skinUGCInfo = void 0;
var s = t("./SkinUGCType"), l = function() {
function t() {
this._data = [];
this._enteredEdit = 0;
this._editStyle = s.EditStyle.Tile1;
this._colorsConfig = null;
this._colors = [];
this._ugcColorTemplate = null;
this._originalSkinConfig = null;
this._presetSkinConfigMap = new Map();
this._presetSkinLoaded = !1;
}
Object.defineProperty(t.prototype, "data", {
get: function() {
return this._data;
},
set: function(t) {
this._data = t;
this._saveData();
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "enteredEdit", {
get: function() {
return this._enteredEdit;
},
set: function(o) {
this._enteredEdit = o;
hs.storage.setItem(t.STORAGE_KEY_ENTERED, o);
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "editStyle", {
get: function() {
return this._editStyle;
},
set: function(t) {
this._editStyle = t;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "colorsConfig", {
get: function() {
return this._colorsConfig;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "colors", {
get: function() {
return this._colors;
},
enumerable: !1,
configurable: !0
});
t.prototype.init = function() {
this._data = hs.storage.getItem(t.STORAGE_KEY_DATA, []);
this._enteredEdit = hs.storage.getItem(t.STORAGE_KEY_ENTERED, 0);
};
t.prototype.loadAsset = function(t) {
void 0 === t && (t = !1);
return n(this, void 0, Promise, function() {
var o;
return r(this, function(e) {
switch (e.label) {
case 0:
o = [ Promise.resolve(this.loadUgcColorTemplate()), Promise.resolve(this.loadOriginalSkinConfig()), Promise.resolve(this.loadPresetSkinConfigs()) ];
t && o.push(this.loadColorsConfig());
return [ 4, Promise.all(o) ];

case 1:
e.sent();
return [ 2 ];
}
});
});
};
t.prototype.loadColorsConfig = function() {
return n(this, void 0, Promise, function() {
var t = this;
return r(this, function() {
return [ 2, new Promise(function(o) {
hs.ResLoader.loadByBundle("SkinUGCTrait", "config/ugc_colors", cc.JsonAsset, function(e, i) {
if (e) o(); else {
var n, r, a = i.json;
t._colors = [];
t._colorsConfig = {};
for (var s = 0; s < a.length; s++) {
n = s % 10;
r = Math.floor(s / 10);
t._colors[n] || (t._colors[n] = []);
t._colorsConfig[a[s].id] = a[s];
t._colors[n][r] = a[s].id;
}
o();
}
});
}) ];
});
});
};
t.prototype.getVersionedSkinId = function(t) {
return t.version && 0 !== t.version ? t.id + "_v" + t.version : t.id;
};
t.prototype.extractBaseId = function(t) {
var o = t.match(/^(.+)_v\d+$/);
return o ? o[1] : t;
};
t.prototype.isVersionedUGCSkinId = function(t) {
return /_v\d+$/.test(t);
};
t.prototype.isCurrentSkinUGC = function() {
var t = this.getCurrentSkinId();
return !!t && null !== this.getSkinById(t);
};
t.prototype.getCurrentSkin = function() {
return this.getSkinById(this.getCurrentSkinId()) || null;
};
t.prototype.getCurrentSkinId = function() {
return hs.storage.getItem("currentSkinId", "1000");
};
t.prototype.getSkinById = function(t) {
var o = this._data.find(function(o) {
return o.id === t;
});
if (o) return o;
var e = this.extractBaseId(t);
e !== t && (o = this._data.find(function(t) {
return t.id === e;
}));
return o || null;
};
t.prototype.getAllSkinIds = function() {
var t = this;
return this._data.map(function(o) {
return t.getVersionedSkinId(o);
});
};
t.prototype.getDefaultSkin = function() {
return this._editStyle === s.EditStyle.Palette ? {
id: "" + Date.now(),
blocks: [ "#1717e5", "#e5b217", "#9f17e5", "#e55c17", "#e61717", "#17e517", "#17c3e5" ],
bg: "#364c87",
board: "#1d2445"
} : {
id: "" + Date.now(),
blocks: [ "#0060fd", "#fde43f", "#854efd", "#ff6900", "#e12401", "#42ce2c", "#04c7fb" ],
bg: "#364c87",
board: "#1d2445"
};
};
t.prototype.saveSkin = function(t, o) {
void 0 === o && (o = !1);
var e = this._data.findIndex(function(o) {
return o.id === t.id;
});
if (-1 === e) {
t.version = 1;
e = this._data.length;
this._data.push(t);
} else {
t.version = o ? (this._data[e].version || 0) + 1 : this._data[e].version || 1;
this._data[e] = t;
this.updateSkinMapData(t);
}
this._saveData();
return e;
};
t.prototype.updateSkinMapData = function(t) {
var o = this.getVersionedSkinId(t);
if (hs.skinInfo.hasSkin(o) || hs.skinInfo.hasSkin(t.id)) {
var e = this.convertUGCDataToSkinConfig(t);
e && hs.skinInfo.setSkinMap(o, e);
}
};
t.prototype.resetSkin = function(t, o) {
var e = this._data.findIndex(function(o) {
return o.id === t.id;
});
if (e > -1) {
this._data[e] = o;
this._saveData();
}
};
t.prototype.deleteSkin = function(t) {
var o = this._data.findIndex(function(o) {
return o.id === t.id;
});
if (o > -1) {
this._data.splice(o, 1);
this._saveData();
}
return o;
};
t.prototype._saveData = function() {
hs.storage.setItem(t.STORAGE_KEY_DATA, this._data);
};
t.prototype.getBlockColor = function(t) {
return this._colorsConfig && this._colorsConfig[t] ? this._colorsConfig[t].colorList : this._editStyle === s.EditStyle.Palette ? this._generateDefaultColorList(t) : null;
};
t.prototype._generateDefaultColorList = function(t) {
var o = this.getColorCommon(t);
return [ o, o, o, o, o, o ];
};
t.prototype.getColorCommon = function(t) {
return {
colorParam: t,
gradientParam: t,
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 0,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
};
};
t.prototype.getBlockCfg = function() {
var t = this, o = this.getCurrentSkin();
return o ? {
blocks: o.blocks.map(function(o, e) {
return t._getBlocksType(o, e + 1);
}),
substrate: this._getSubstrate()
} : null;
};
t.prototype._getBlocksType = function(t, o) {
return {
colorList: this.getBlockColor(t, o - 1) || [],
rgbaPercentage: [ 0, 0, 0, 0 ],
isShade: 1,
type: 1,
shaderPrefabPath: "",
noShaderPrefabPath: ""
};
};
t.prototype._getSubstrate = function() {
return {
status_one: [ this.getColorCommon("#e0cea3"), this.getColorCommon("#8e6a4a"), this.getColorCommon("#e6cea5"), this.getColorCommon("#b59570"), this.getColorCommon("#d0af83"), this.getColorCommon("#4d2608") ],
status_two: [ this.getColorCommon("#fff9d7"), this.getColorCommon("#9b6e4f"), this.getColorCommon("#f1d3b2"), this.getColorCommon("#bd9c76"), this.getColorCommon("#e5c397"), this.getColorCommon("#4d2608") ],
isShade: 1,
type: 3,
shaderPrefabPath: "",
noShaderPrefabPath: ""
};
};
t.prototype.getProportionColor = function(t, o) {
var e = new cc.Color().fromHEX(t), i = e.r * o.rProportion, n = e.g * o.gProportion, r = e.b * o.bProportion;
i = Math.min(255, Math.max(0, Math.round(i)));
n = Math.min(255, Math.max(0, Math.round(n)));
r = Math.min(255, Math.max(0, Math.round(r)));
return "#" + new cc.Color(i, n, r).toHEX("#rrggbb");
};
t.prototype._deepCopy = function(t) {
return JSON.parse(JSON.stringify(t));
};
t.prototype.getChangeGameBgColorData = function(o) {
var e;
if (o.isPreset) {
var i = this._presetSkinConfigMap.get(o.id);
if (null == i ? void 0 : i.game_bg) return this._deepCopy(i.game_bg);
}
var n, r = o.bg;
r.startsWith("#") || (r = "#" + r);
(n = (null === (e = this._ugcColorTemplate) || void 0 === e ? void 0 : e.game_bg) ? this._deepCopy(this._ugcColorTemplate.game_bg) : {
color: {
colorParam: "#405aa0",
gradientParam: "#374f8f",
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 1,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
},
opacity: 255,
isShade: 1,
type: 2,
shaderPrefabPath: "prefabs/skin/GameBg/SkinGameBgPrefab",
noShaderPrefabPath: "",
gradientProportion: t.BG_GRADIENT_PROPORTION
}).color.colorParam = r;
var a = n.gradientProportion || t.BG_GRADIENT_PROPORTION;
n.color.gradientParam = this.getProportionColor(r, a);
return n;
};
t.prototype.getChangeBoardBgColorData = function(t) {
var o;
if (t.isPreset) {
var e = this._presetSkinConfigMap.get(t.id);
if (null == e ? void 0 : e.board_bg) return this._deepCopy(e.board_bg);
}
var i, n = t.board;
n.startsWith("#") || (n = "#" + n);
(i = (null === (o = this._ugcColorTemplate) || void 0 === o ? void 0 : o.board_bg) ? this._deepCopy(this._ugcColorTemplate.board_bg) : {
color: {
colorParam: "#242c54",
gradientParam: "#242c54",
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 0,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
},
opacity: 255,
isShade: 1,
type: 2,
shaderPrefabPath: "prefabs/skin/board/SkinBoardPrefab",
noShaderPrefabPath: "",
gradientProportion: {
rProportion: 1,
gProportion: 1,
bProportion: 1
}
}).color.colorParam = n;
var r = i.gradientProportion || {
rProportion: 1,
gProportion: 1,
bProportion: 1
};
i.color.gradientParam = this.getProportionColor(n, r);
return i;
};
t.prototype.getChangeBoardOutLineColorData = function(o) {
var e;
if (o.isPreset) {
var i = this._presetSkinConfigMap.get(o.id);
if (null == i ? void 0 : i.board_out_line) return this._deepCopy(i.board_out_line);
}
var n, r = o.bg;
r.startsWith("#") || (r = "#" + r);
var a = (n = (null === (e = this._ugcColorTemplate) || void 0 === e ? void 0 : e.board_out_line) ? this._deepCopy(this._ugcColorTemplate.board_out_line) : {
color: {
colorParam: "#304479",
gradientParam: "#304478",
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 1,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
},
opacity: 255,
isShade: 1,
type: 2,
shaderPrefabPath: "prefabs/skin/board/SkinBoardPrefab",
noShaderPrefabPath: "",
colorProportion: t.BOARD_OUTLINE_COLOR_PROPORTION,
gradientProportion: t.BOARD_OUTLINE_GRADIENT_PROPORTION
}).colorProportion || t.BOARD_OUTLINE_COLOR_PROPORTION;
n.color.colorParam = this.getProportionColor(r, a);
var s = n.gradientProportion || t.BOARD_OUTLINE_GRADIENT_PROPORTION;
n.color.gradientParam = this.getProportionColor(n.color.colorParam, s);
return n;
};
t.prototype.getChangeBoardLineColorData = function(o) {
var e;
if (o.isPreset) {
var i = this._presetSkinConfigMap.get(o.id);
if (null == i ? void 0 : i.board_line) return this._deepCopy(i.board_line);
}
var n, r = o.board;
r.startsWith("#") || (r = "#" + r);
var a = (n = (null === (e = this._ugcColorTemplate) || void 0 === e ? void 0 : e.board_line) ? this._deepCopy(this._ugcColorTemplate.board_line) : {
color: {
colorParam: "#1e264a",
gradientParam: "#1e264a",
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 0,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
},
opacity: 255,
isShade: 1,
type: 2,
shaderPrefabPath: "prefabs/skin/board/SkinBoardPrefab",
noShaderPrefabPath: "",
colorProportion: t.BOARD_LINE_COLOR_PROPORTION,
gradientProportion: {
rProportion: 1,
gProportion: 1,
bProportion: 1
}
}).colorProportion || t.BOARD_LINE_COLOR_PROPORTION;
n.color.colorParam = this.getProportionColor(r, a);
var s = n.gradientProportion || {
rProportion: 1,
gProportion: 1,
bProportion: 1
};
n.color.gradientParam = this.getProportionColor(n.color.colorParam, s);
return n;
};
t.prototype._getHue = function(t) {
var o = t.r / 255, e = t.g / 255, i = t.b / 255, n = Math.max(o, e, i), r = n - Math.min(o, e, i);
if (0 === r) return 0;
var a;
a = n === o ? (e - i) / r + (e < i ? 6 : 0) : n === e ? (i - o) / r + 2 : (o - e) / r + 4;
return Math.round(a / 6 * 360);
};
t.prototype._getHueLightSaturationValue = function(t) {
var o = t.r / 255, e = t.g / 255, i = t.b / 255, n = Math.max(o, e, i), r = n - Math.min(o, e, i), a = 0, s = 0, l = n;
0 !== n && (s = r / n);
if (0 !== r) {
a = n === o ? (e - i) / r + (e < i ? 6 : 0) : n === e ? (i - o) / r + 2 : (o - e) / r + 4;
a /= 6;
}
return {
hue: Math.round(360 * a),
saturation: s,
light: l
};
};
t.prototype._clamp = function(t, o, e) {
return Math.min(e, Math.max(o, t));
};
t.prototype._getBlockTemplateForHue = function(t) {
return this._ugcColorTemplate ? t < 12.5 ? this._ugcColorTemplate.block5 : t < 37.5 ? this._ugcColorTemplate.block4 : t < 75 ? this._ugcColorTemplate.block2 : t < 152.5 ? this._ugcColorTemplate.block6 : t < 202.5 ? this._ugcColorTemplate.block7 : t < 257.5 ? this._ugcColorTemplate.block1 : t < 317.5 ? this._ugcColorTemplate.block3 : this._ugcColorTemplate.block5 : null;
};
t.prototype._calculateColorByProportion = function(t, o) {
var e = this._clamp(Math.round(t.r * o.rProportion), 0, 255), i = this._clamp(Math.round(t.g * o.gProportion), 0, 255), n = this._clamp(Math.round(t.b * o.bProportion), 0, 255);
return "#" + new cc.Color(e, i, n).toHEX("#rrggbb");
};
t.prototype._createColorCommonFromTemplate = function(t, o, e) {
return e ? i(i({}, e), {
colorParam: t,
gradientParam: o
}) : {
colorParam: t,
gradientParam: o,
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 1,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
};
};
t.prototype.getChangeBlocksColorData = function(t, o) {
var e, i;
if (t.isPreset) {
var n = this._presetSkinConfigMap.get(t.id);
if (n) {
var r = n["block" + (o + 1)];
if (r) return this._deepCopy(r);
}
}
var a = t.blocks[o];
a.startsWith("#") || (a = "#" + a);
var s = new cc.Color().fromHEX(a), l = this._getHue(s), c = this._getBlockTemplateForHue(l);
if (!c || !c.colorProportion) return this._getChangeBlocksColorDataFallback(a, s);
for (var h = [], d = c.colorProportion, u = c.gradientProportion, p = 0; p < 6; p++) {
var f = this._calculateColorByProportion(s, d[p]), g = f;
if (u && u[p]) {
var _ = new cc.Color().fromHEX(f);
g = this._calculateColorByProportion(_, u[p]);
}
var C = c.colorList[p];
h.push(this._createColorCommonFromTemplate(f, g, C));
}
return {
colorList: h,
rgbaPercentage: c.rgbaPercentage || [ 0, 0, 0, 0 ],
isShade: null !== (e = c.isShade) && void 0 !== e ? e : 1,
type: null !== (i = c.type) && void 0 !== i ? i : 1,
shaderPrefabPath: c.shaderPrefabPath || "",
noShaderPrefabPath: c.noShaderPrefabPath || ""
};
};
t.prototype._getChangeBlocksColorDataFallback = function(t, o) {
for (var e = [ .15, -.2, -.1, .05, 0, -.25 ], i = [], n = 0; n < 6; n++) {
var r = e[n], a = this._clamp(Math.round(o.r * (1 + r)), 0, 255), s = this._clamp(Math.round(o.g * (1 + r)), 0, 255), l = this._clamp(Math.round(o.b * (1 + r)), 0, 255), c = "#" + new cc.Color(a, s, l).toHEX("#rrggbb"), h = this._clamp(Math.round(.95 * a), 0, 255), d = this._clamp(Math.round(.95 * s), 0, 255), u = this._clamp(Math.round(.95 * l), 0, 255), p = "#" + new cc.Color(h, d, u).toHEX("#rrggbb");
i.push(this._createColorCommonFromTemplate(c, p));
}
return {
colorList: i,
rgbaPercentage: [ 0, 0, 0, 0 ],
isShade: 1,
type: 1,
shaderPrefabPath: "prefabs/skin/block/SkinBlockPrefab",
noShaderPrefabPath: ""
};
};
t.prototype.getChangeClearColorData = function(t, o) {
if (t.isPreset) {
var e = this._presetSkinConfigMap.get(t.id);
if (e) {
var i = e[d = "clear" + (o + 1)];
if (i) return this._deepCopy(i);
}
}
var n = t.blocks[o], r = t.board;
n.startsWith("#") || (n = "#" + n);
r.startsWith("#") || (r = "#" + r);
var a, s = new cc.Color().fromHEX(r), l = (this._getHueLightSaturationValue(s).light - .25) / .75, c = this._clamp(Math.round(80 * l + 70), 0, 255), h = this._clamp(Math.round(50 * l + 20), 0, 255);
if (this._ugcColorTemplate) {
var d = "clear" + (o + 1), u = this._ugcColorTemplate[d];
u && (a = this._deepCopy(u));
}
a || (a = {
colorList: [ {
color: "#008EFF",
opacity: 255
}, {
color: "#2647DB",
opacity: 255
}, {
color: "#0E2A9F",
opacity: 255
} ],
isShade: 0,
type: 4,
shaderPrefabPath: "",
noShaderPrefabPath: "prefabs/skin/eliminate/SkinEliminatePrefab"
});
a.colorList = [ {
color: n,
opacity: 255
}, {
color: n,
opacity: c
}, {
color: n,
opacity: h
} ];
return a;
};
t.prototype.getChangeBlockShadowColorData = function(t) {
var o;
if (t.isPreset) {
var e = this._presetSkinConfigMap.get(t.id);
if (null == e ? void 0 : e.blcokshadow) return this._deepCopy(e.blcokshadow);
}
return (null === (o = this._ugcColorTemplate) || void 0 === o ? void 0 : o.blcokshadow) ? this._deepCopy(this._ugcColorTemplate.blcokshadow) : {
color: {
colorParam: "#000000",
gradientParam: "#000000",
brightness: 1,
contrast: 1,
saturation: 1,
hue: 0,
hueEnabled: 0,
gradientEnabled: 0,
blendModeEnabled: 1,
gradientStrength: .5,
blendMode: 1,
gradientDirection: 90,
gradientType: 0
},
opacity: Math.round(76.5),
isShade: 1,
type: 2,
shaderPrefabPath: "prefabs/skin/block/SkinBlockShadowPrefab",
noShaderPrefabPath: ""
};
};
Object.defineProperty(t.prototype, "ugcColorTemplate", {
get: function() {
return this._ugcColorTemplate;
},
enumerable: !1,
configurable: !0
});
t.prototype.loadUgcColorTemplate = function() {
return n(this, void 0, Promise, function() {
var t = this;
return r(this, function() {
return this._ugcColorTemplate ? [ 2, this._ugcColorTemplate ] : [ 2, new Promise(function(o) {
hs.ResLoader.loadByBundle("SkinUGCTrait", "config/ugc_color_template", cc.JsonAsset, function(e, i) {
if (e) o(null); else {
t._ugcColorTemplate = i.json;
o(t._ugcColorTemplate);
}
});
}) ];
});
});
};
Object.defineProperty(t.prototype, "originalSkinConfig", {
get: function() {
return this._originalSkinConfig;
},
enumerable: !1,
configurable: !0
});
t.prototype.loadOriginalSkinConfig = function() {
return n(this, void 0, Promise, function() {
var t = this;
return r(this, function() {
return this._originalSkinConfig ? [ 2, this._originalSkinConfig ] : [ 2, new Promise(function(o) {
hs.ResLoader.load("configs/skin/default/skin_1000", cc.JsonAsset, function(e, i) {
if (e) o(null); else {
t._originalSkinConfig = i.json;
o(t._originalSkinConfig);
}
});
}) ];
});
});
};
t.prototype.getOriginalSkinConfig = function() {
return this._originalSkinConfig;
};
t.prototype.getUgcColorTemplate = function() {
return this._ugcColorTemplate;
};
t.prototype.getPresetSkinId = function(o) {
return "" + t.PRESET_ID_PREFIX + o;
};
t.prototype.isPresetSkinId = function(o) {
return o.startsWith(t.PRESET_ID_PREFIX);
};
t.prototype.getOriginalIdFromPresetId = function(o) {
if (!this.isPresetSkinId(o)) return null;
var e = o.substring(t.PRESET_ID_PREFIX.length), i = parseInt(e, 10);
return isNaN(i) ? null : i;
};
t.prototype.loadPresetSkinConfigs = function(t) {
return n(this, void 0, Promise, function() {
var o, e, i, n, a = this;
return r(this, function(r) {
switch (r.label) {
case 0:
if (void 0 === t) return [ 3, 2 ];
if (this._presetSkinConfigMap.has(t)) return [ 2 ];
if (null === (o = this.getOriginalIdFromPresetId(t))) return [ 2 ];
this._initPresetSkinToData([ o ]);
return [ 4, this._loadSinglePresetSkinConfig(o) ];

case 1:
r.sent();
return [ 2 ];

case 2:
if (this._presetSkinLoaded) return [ 2 ];
if (!(null == (e = TRAIT("PresetUgcSkinTrait")) ? void 0 : e.active)) return [ 2 ];
if (!(i = e.getPresetSkinIds()) || 0 === i.length) return [ 2 ];
this._initPresetSkinToData(i);
n = i.map(function(t) {
return a._loadSinglePresetSkinConfig(t);
});
return [ 4, Promise.all(n) ];

case 3:
r.sent();
this._presetSkinLoaded = !0;
return [ 2 ];
}
});
});
};
t.prototype._initPresetSkinToData = function(t) {
if (t && 0 !== t.length) {
for (var o = function(o) {
var i = t[o], n = e.getPresetSkinId(i);
if (-1 !== e._data.findIndex(function(t) {
return t.id === n;
})) return "continue";
var r = e._createPresetUGCData(i);
e._data.unshift(r);
}, e = this, i = t.length - 1; i >= 0; i--) o(i);
this._saveData();
}
};
t.prototype._createPresetUGCData = function(t) {
for (var o = this.getPresetSkinId(t), e = [], i = 1; i <= 7; i++) e.push(t + "_" + i);
return {
id: o,
blocks: e,
bg: "",
board: "",
isPreset: !0
};
};
t.prototype._loadSinglePresetSkinConfig = function(t) {
var o = this;
return new Promise(function(e) {
var i = "configs/skin/default/skin_" + t;
hs.ResLoader.load(i, cc.JsonAsset, function(i, n) {
if (i) e(); else {
var r = o.getPresetSkinId(t), a = n.json;
o._presetSkinConfigMap.set(r, a);
e();
}
});
});
};
t.prototype.getPresetSkinConfigById = function(t) {
return this._presetSkinConfigMap.get(t) || null;
};
t.prototype.getAllPresetSkinIds = function() {
return Array.from(this._presetSkinConfigMap.keys());
};
t.prototype.getPresetSkinCount = function() {
return this._presetSkinConfigMap.size;
};
t.prototype.convertPresetToUGCData = function(t) {
var o, e, i, n, r, a, s = this.getPresetSkinConfigById(t);
if (!s) return null;
for (var l = [], c = 1; c <= 7; c++) {
var h = s["block" + c];
(null === (e = null === (o = null == h ? void 0 : h.colorList) || void 0 === o ? void 0 : o[4]) || void 0 === e ? void 0 : e.colorParam) ? l.push(h.colorList[4].colorParam) : l.push("#ffffff");
}
return {
id: t,
blocks: l,
bg: (null === (n = null === (i = s.game_bg) || void 0 === i ? void 0 : i.color) || void 0 === n ? void 0 : n.colorParam) || "#364c87",
board: (null === (a = null === (r = s.board_bg) || void 0 === r ? void 0 : r.color) || void 0 === a ? void 0 : a.colorParam) || "#1d2445",
isPreset: !0
};
};
t.prototype.getAllPresetUGCData = function() {
var t, o, e = [];
try {
for (var i = a(this._presetSkinConfigMap.keys()), n = i.next(); !n.done; n = i.next()) {
var r = n.value, s = this.convertPresetToUGCData(r);
s && e.push(s);
}
} catch (o) {
t = {
error: o
};
} finally {
try {
n && !n.done && (o = i.return) && o.call(i);
} finally {
if (t) throw t.error;
}
}
return e;
};
t.prototype.getUgcTemplateBlockConfig = function(t) {
if (!this._ugcColorTemplate) return null;
var o = "block" + t;
return this._ugcColorTemplate[o] || null;
};
t.prototype.convertUGCDataToSkinConfig = function(t) {
var o, e, i, n, r, a, s;
if (!this._originalSkinConfig) return null;
var l = this._deepCopy(this._originalSkinConfig);
l.game_bg = this.getChangeGameBgColorData(t);
l.board_bg = this.getChangeBoardBgColorData(t);
l.board_out_line = this.getChangeBoardOutLineColorData(t);
l.board_line = this.getChangeBoardLineColorData(t);
if (t.blocks[0] && !(null === (o = t.blocksDelete) || void 0 === o ? void 0 : o[0])) {
l.block1 = this.getChangeBlocksColorData(t, 0);
l.clear1 = this.getChangeClearColorData(t, 0);
}
if (t.blocks[1] && !(null === (e = t.blocksDelete) || void 0 === e ? void 0 : e[1])) {
l.block2 = this.getChangeBlocksColorData(t, 1);
l.clear2 = this.getChangeClearColorData(t, 1);
}
if (t.blocks[2] && !(null === (i = t.blocksDelete) || void 0 === i ? void 0 : i[2])) {
l.block3 = this.getChangeBlocksColorData(t, 2);
l.clear3 = this.getChangeClearColorData(t, 2);
}
if (t.blocks[3] && !(null === (n = t.blocksDelete) || void 0 === n ? void 0 : n[3])) {
l.block4 = this.getChangeBlocksColorData(t, 3);
l.clear4 = this.getChangeClearColorData(t, 3);
}
if (t.blocks[4] && !(null === (r = t.blocksDelete) || void 0 === r ? void 0 : r[4])) {
l.block5 = this.getChangeBlocksColorData(t, 4);
l.clear5 = this.getChangeClearColorData(t, 4);
}
if (t.blocks[5] && !(null === (a = t.blocksDelete) || void 0 === a ? void 0 : a[5])) {
l.block6 = this.getChangeBlocksColorData(t, 5);
l.clear6 = this.getChangeClearColorData(t, 5);
}
if (t.blocks[6] && !(null === (s = t.blocksDelete) || void 0 === s ? void 0 : s[6])) {
l.block7 = this.getChangeBlocksColorData(t, 6);
l.clear7 = this.getChangeClearColorData(t, 6);
}
l.blcokshadow = this.getChangeBlockShadowColorData(t);
return l;
};
t.prototype.getGameType = function() {
var t;
return "journey" === (null === (t = hs.gameInfo) || void 0 === t ? void 0 : t.gameMode) ? 2 : 0;
};
t.prototype.getBg = function(t, o) {
return t.bg === o.bg ? "-1" : t.bg;
};
t.prototype.getBoard = function(t, o) {
return t.board === o.board ? "-1" : t.board;
};
t.prototype.getBlocks = function(t, o) {
for (var e = [], i = 0; i < t.blocks.length; i++) t.blocksDelete && t.blocksDelete[i] || (t.blocks[i] === o.blocks[i] ? e.push("-1") : e.push(t.blocks[i]));
return e;
};
t.STORAGE_KEY_DATA = "skinUGC_data";
t.STORAGE_KEY_ENTERED = "skinUGC_enteredEdit";
t.BG_GRADIENT_PROPORTION = {
rProportion: .859375,
gProportion: .8777777777777778,
bProportion: .89375
};
t.BOARD_OUTLINE_COLOR_PROPORTION = {
rProportion: .75,
gProportion: .7555555555555555,
bProportion: .75625
};
t.BOARD_OUTLINE_GRADIENT_PROPORTION = {
rProportion: 1,
gProportion: 1,
bProportion: .9917355371900827
};
t.BOARD_LINE_COLOR_PROPORTION = {
rProportion: .8333333333333334,
gProportion: .8636363636363636,
bProportion: .8809523809523809
};
t.PRESET_ID_PREFIX = "preset_";
return t;
}();
e.skinUGCInfo = new l();
cc._RF.pop();
}, {
"./SkinUGCType": "SkinUGCType"
} ],
SkinUGCItem: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "289c6vhk91KXrxG0fuI6JKF", "SkinUGCItem");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var a = t("../scripts/SkinUGCInfo"), s = t("./SkinUGCList"), l = cc._decorator, c = l.ccclass, h = l.property, d = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.addNd = null;
o.redDot = null;
o.itemNd = null;
o.gameBg = null;
o.boardFrame = null;
o.boardLine = null;
o.board = null;
o.blockBg = null;
o.blocks = [];
o.noShaderBlocks = [];
o.selectNd = null;
o.editNd = null;
o.useNd = null;
o.useSp = null;
o.usedSp = null;
o.unusedSp = null;
o._data = null;
return o;
}
o.prototype.start = function() {
var t;
if (null === (t = TRAIT("SkinUGCUseBtnTrait")) || void 0 === t ? void 0 : t.active) {
this.useNd && (this.useNd.active = !0);
this.editNd && (this.editNd.active = !1);
} else {
this.useNd && (this.useNd.active = !1);
this.editNd && (this.editNd.active = !0);
}
};
o.prototype.render = function() {
this.addNd && (this.addNd.active = this.state.isAddItem || !1);
this.itemNd && (this.itemNd.active = !this.state.isAddItem);
this.selectNd && (this.selectNd.active = this.state.isSelected || !1);
this.useSp && (this.useSp.spriteFrame = this.state.isSelected ? this.usedSp : this.unusedSp);
};
o.prototype.renderItem = function(t) {
var o;
this._data = t;
if (t) {
this.node.active = !0;
var e = a.skinUGCInfo.isCurrentSkinUGC() && (null === (o = a.skinUGCInfo.getCurrentSkin()) || void 0 === o ? void 0 : o.id) === t.id;
this.setState({
isAddItem: !1,
isSelected: e
});
this._updateColorPreview(t);
} else {
this.setState({
isAddItem: !0,
isSelected: !1
});
this.redDot && (this.redDot.active = !a.skinUGCInfo.enteredEdit);
}
};
o.prototype._updateColorPreview = function(t) {
var o, e = a.skinUGCInfo.getChangeGameBgColorData(t), i = a.skinUGCInfo.getChangeBoardOutLineColorData(t), n = a.skinUGCInfo.getChangeBoardBgColorData(t), r = a.skinUGCInfo.getChangeBoardLineColorData(t);
this.gameBg && e && (this.gameBg.node.color = cc.color().fromHEX(e.color.colorParam));
this.boardFrame && i && (this.boardFrame.node.color = cc.color().fromHEX(i.color.colorParam));
this.boardLine && r && (this.boardLine.node.color = cc.color().fromHEX(r.color.colorParam));
this.board && n && (this.board.node.color = cc.color().fromHEX(n.color.colorParam));
this.blockBg && r && (this.blockBg.node.color = cc.color().fromHEX(r.color.colorParam));
for (var s = 0; s < t.blocks.length; s++) {
var l = null === (o = a.skinUGCInfo.getChangeBlocksColorData(t, s)) || void 0 === o ? void 0 : o.colorList;
if (l && 0 !== l.length) {
var c = hs.skinAtlas.getBlockSpriteFrame(l[4].colorParam, s + 1);
if (c) {
this.noShaderBlocks[s].spriteFrame = c;
this.noShaderBlocks[s].node.active = !0;
this.blocks[s].node.active = !1;
} else {
this.noShaderBlocks[s].node.active = !1;
this.blocks[s].node.active = !0;
this.blocks[s].setMaterial(!0);
this.blocks[s].setAllParams(s, l);
}
}
}
};
o.prototype._findListComponent = function() {
for (var t = this.node.parent; t; ) {
var o = t.getComponent(s.default);
if (o) return o;
t = t.parent;
}
return null;
};
o.prototype.onClickAdd = function() {
var t = this._findListComponent();
t && t.onClickAdd();
};
o.prototype.onClickEdit = function() {
var t = this._findListComponent();
t && t.onClickEdit(this._data);
};
o.prototype.onClickItem = function() {
var t = this._findListComponent();
t && t.onClickItem(this._data);
};
r([ h(cc.Node) ], o.prototype, "addNd", void 0);
r([ h(cc.Node) ], o.prototype, "redDot", void 0);
r([ h(cc.Node) ], o.prototype, "itemNd", void 0);
r([ h(cc.Sprite) ], o.prototype, "gameBg", void 0);
r([ h(cc.Sprite) ], o.prototype, "boardFrame", void 0);
r([ h(cc.Sprite) ], o.prototype, "boardLine", void 0);
r([ h(cc.Sprite) ], o.prototype, "board", void 0);
r([ h(cc.Sprite) ], o.prototype, "blockBg", void 0);
r([ h([ hs.BlockMaterialUpdate ]) ], o.prototype, "blocks", void 0);
r([ h([ cc.Sprite ]) ], o.prototype, "noShaderBlocks", void 0);
r([ h(cc.Node) ], o.prototype, "selectNd", void 0);
r([ h(cc.Node) ], o.prototype, "editNd", void 0);
r([ h(cc.Node) ], o.prototype, "useNd", void 0);
r([ h(cc.Sprite) ], o.prototype, "useSp", void 0);
r([ h(cc.SpriteFrame) ], o.prototype, "usedSp", void 0);
r([ h(cc.SpriteFrame) ], o.prototype, "unusedSp", void 0);
return r([ c ], o);
}(hs.Component);
e.default = d;
cc._RF.pop();
}, {
"../scripts/SkinUGCInfo": "SkinUGCInfo",
"./SkinUGCList": "SkinUGCList"
} ],
SkinUGCList: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "bdc7ejd3YxACotA9sFyOx0C", "SkinUGCList");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
}, a = this && this.__awaiter || function(t, o, e, i) {
return new (e || (e = Promise))(function(n, r) {
function a(t) {
try {
l(i.next(t));
} catch (t) {
r(t);
}
}
function s(t) {
try {
l(i.throw(t));
} catch (t) {
r(t);
}
}
function l(t) {
t.done ? n(t.value) : (o = t.value, o instanceof e ? o : new e(function(t) {
t(o);
})).then(a, s);
var o;
}
l((i = i.apply(t, o || [])).next());
});
}, s = this && this.__generator || function(t, o) {
var e, i, n, r, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return r = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
return this;
}), r;
function s(t) {
return function(o) {
return l([ t, o ]);
};
}
function l(r) {
if (e) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (e = 1, i && (n = 2 & r[0] ? i.return : r[0] ? i.throw || ((n = i.return) && n.call(i), 
0) : i.next) && !(n = n.call(i, r[1])).done) return n;
(i = 0, n) && (r = [ 2 & r[0], n.value ]);
switch (r[0]) {
case 0:
case 1:
n = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
i = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!n || r[1] > n[0] && r[1] < n[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < n[1]) {
a.label = n[1];
n = r;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(r);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = o.call(t, a);
} catch (t) {
r = [ 6, t ];
i = 0;
} finally {
e = n = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
}, l = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var i, n, r = e.call(t), a = [];
try {
for (;(void 0 === o || o-- > 0) && !(i = r.next()).done; ) a.push(i.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (n) throw n.error;
}
}
return a;
}, c = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(l(arguments[o]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
var h = t("../scripts/SkinUGCInfo"), d = t("./SkinUGCItem"), u = cc._decorator, p = u.ccclass, f = u.property, g = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o.contentNd = null;
o.bg = null;
o.virtualList = null;
return o;
}
o.prototype.start = function() {
return a(this, void 0, Promise, function() {
return s(this, function(t) {
switch (t.label) {
case 0:
this.node.active = !1;
this.contentNd && hs.applyAdapterFringe(this.contentNd);
this._sendExposureData();
return this.virtualList ? [ 4, this.virtualList.init({
prefabUrl: "prefabs/SkinUGCItem",
bundleName: "SkinUGCTrait",
itemHeight: 140,
itemComponent: d.default,
bufferCount: 2
}) ] : [ 3, 2 ];

case 1:
t.sent();
t.label = 2;

case 2:
this.refresh();
return [ 2 ];
}
});
});
};
o.prototype.render = function() {
this.virtualList && this.state.dataList && this.virtualList.setState({
dataSource: c(this.state.dataList)
});
this._adjustBgHeight();
};
o.prototype.refresh = function() {
this.node.active = !0;
var t = this._getMaxNum(), o = h.skinUGCInfo.data.slice(0, t).reverse(), e = c(o);
e.length < t && e.unshift(null);
this.setState({
dataList: e
});
};
o.prototype._getMaxNum = function() {
return 15;
};
o.prototype._adjustBgHeight = function() {
var t, o, e, i;
if (this.bg && this.virtualList) {
if (((null === (t = this.state.dataList) || void 0 === t ? void 0 : t.length) || 0) <= 6) {
var n = (null === (e = null === (o = this.virtualList.scrollView) || void 0 === o ? void 0 : o.content) || void 0 === e ? void 0 : e.height) || 0;
this.bg.height = 90 + n;
this.virtualList.scrollView.enabled = !1;
} else {
this.bg.height = 969;
this.virtualList.scrollView.enabled = !0;
}
(null === (i = this.virtualList.scrollView) || void 0 === i ? void 0 : i.node) && (this.virtualList.scrollView.node.height = this.bg.height);
}
};
o.prototype.onClickAdd = function() {
var t = TRAIT("SkinUGCTrait");
(null == t ? void 0 : t.active) && t.openEdit(h.skinUGCInfo.getDefaultSkin());
};
o.prototype.onClickEdit = function(t) {
if (!t.isPreset) {
var o = TRAIT("SkinUGCTrait");
(null == o ? void 0 : o.active) && o.openEdit(t);
this.node.active = !1;
}
};
o.prototype.onClickItem = function(t) {
var o = this, e = (h.skinUGCInfo.getDefaultSkin(), TRAIT("SkinUGCTrait")), i = h.skinUGCInfo.extractBaseId(h.skinUGCInfo.getCurrentSkinId());
if (t.id === i) null == e || e.dispatchSkinUpdate(hs.skinInfo.originSkinId, function() {
o.refresh();
}); else {
h.skinUGCInfo.isCurrentSkinUGC();
null == e || e.dispatchSkinUpdate(t.id, function() {
o.refresh();
});
}
};
o.prototype.onClickClose = function() {
this._destroyNode();
};
o.prototype._destroyNode = function() {
var t = this;
if (this.node && cc.isValid(this.node)) {
cc.Tween.stopAllByTarget(this.node);
cc.director.once(cc.Director.EVENT_AFTER_UPDATE, function() {
t.node && cc.isValid(t.node) && t.node.destroy();
});
}
};
o.prototype._sendExposureData = function() {};
r([ f(cc.Node) ], o.prototype, "contentNd", void 0);
r([ f(cc.Node) ], o.prototype, "bg", void 0);
r([ f(hs.VirtualList) ], o.prototype, "virtualList", void 0);
r([ hs.throttle(500) ], o.prototype, "onClickAdd", null);
r([ hs.throttle(500) ], o.prototype, "onClickEdit", null);
r([ hs.throttle(500) ], o.prototype, "onClickItem", null);
r([ hs.throttle(500) ], o.prototype, "onClickClose", null);
return r([ p ], o);
}(hs.Component);
e.default = g;
cc._RF.pop();
}, {
"../scripts/SkinUGCInfo": "SkinUGCInfo",
"./SkinUGCItem": "SkinUGCItem"
} ],
SkinUGCTrait: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "56035WccA9JyqpXJ9BN4Rng", "SkinUGCTrait");
var i, n = this && this.__extends || (i = function(t, o) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, o) {
t.__proto__ = o;
} || function(t, o) {
for (var e in o) Object.prototype.hasOwnProperty.call(o, e) && (t[e] = o[e]);
})(t, o);
}, function(t, o) {
i(t, o);
function e() {
this.constructor = t;
}
t.prototype = null === o ? Object.create(o) : (e.prototype = o.prototype, new e());
}), r = this && this.__decorate || function(t, o, e, i) {
var n, r = arguments.length, a = r < 3 ? o : null === i ? i = Object.getOwnPropertyDescriptor(o, e) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, o, e, i); else for (var s = t.length - 1; s >= 0; s--) (n = t[s]) && (a = (r < 3 ? n(a) : r > 3 ? n(o, e, a) : n(o, e)) || a);
return r > 3 && a && Object.defineProperty(o, e, a), a;
}, a = this && this.__awaiter || function(t, o, e, i) {
return new (e || (e = Promise))(function(n, r) {
function a(t) {
try {
l(i.next(t));
} catch (t) {
r(t);
}
}
function s(t) {
try {
l(i.throw(t));
} catch (t) {
r(t);
}
}
function l(t) {
t.done ? n(t.value) : (o = t.value, o instanceof e ? o : new e(function(t) {
t(o);
})).then(a, s);
var o;
}
l((i = i.apply(t, o || [])).next());
});
}, s = this && this.__generator || function(t, o) {
var e, i, n, r, a = {
label: 0,
sent: function() {
if (1 & n[0]) throw n[1];
return n[1];
},
trys: [],
ops: []
};
return r = {
next: s(0),
throw: s(1),
return: s(2)
}, "function" == typeof Symbol && (r[Symbol.iterator] = function() {
return this;
}), r;
function s(t) {
return function(o) {
return l([ t, o ]);
};
}
function l(r) {
if (e) throw new TypeError("Generator is already executing.");
for (;a; ) try {
if (e = 1, i && (n = 2 & r[0] ? i.return : r[0] ? i.throw || ((n = i.return) && n.call(i), 
0) : i.next) && !(n = n.call(i, r[1])).done) return n;
(i = 0, n) && (r = [ 2 & r[0], n.value ]);
switch (r[0]) {
case 0:
case 1:
n = r;
break;

case 4:
a.label++;
return {
value: r[1],
done: !1
};

case 5:
a.label++;
i = r[1];
r = [ 0 ];
continue;

case 7:
r = a.ops.pop();
a.trys.pop();
continue;

default:
if (!(n = a.trys, n = n.length > 0 && n[n.length - 1]) && (6 === r[0] || 2 === r[0])) {
a = 0;
continue;
}
if (3 === r[0] && (!n || r[1] > n[0] && r[1] < n[3])) {
a.label = r[1];
break;
}
if (6 === r[0] && a.label < n[1]) {
a.label = n[1];
n = r;
break;
}
if (n && a.label < n[2]) {
a.label = n[2];
a.ops.push(r);
break;
}
n[2] && a.ops.pop();
a.trys.pop();
continue;
}
r = o.call(t, a);
} catch (t) {
r = [ 6, t ];
i = 0;
} finally {
e = n = 0;
}
if (5 & r[0]) throw r[1];
return {
value: r[0] ? r[1] : void 0,
done: !0
};
}
}, l = this && this.__read || function(t, o) {
var e = "function" == typeof Symbol && t[Symbol.iterator];
if (!e) return t;
var i, n, r = e.call(t), a = [];
try {
for (;(void 0 === o || o-- > 0) && !(i = r.next()).done; ) a.push(i.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (n) throw n.error;
}
}
return a;
}, c = this && this.__spread || function() {
for (var t = [], o = 0; o < arguments.length; o++) t = t.concat(l(arguments[o]));
return t;
};
Object.defineProperty(e, "__esModule", {
value: !0
});
e.SkinUGCTrait = void 0;
var h = t("../components/SkinUGCBtn"), d = t("../components/SkinUGCDelete"), u = t("../components/SkinUGCEdit"), p = t("../components/SkinUGCList"), f = t("./SkinUGCInfo"), g = t("./SkinUGCType"), _ = function(t) {
n(o, t);
function o() {
var o = null !== t && t.apply(this, arguments) || this;
o._loadingList = !1;
o._loadingEdit = !1;
o._loadingDelete = !1;
o._btnNode = null;
o._btnAdded = !1;
o._assetLoaded = !1;
o._lastDispatchedSkinId = "1000";
return o;
}
e = o;
Object.defineProperty(o.prototype, "editStyle", {
get: function() {
var t;
return (null === (t = this.props) || void 0 === t ? void 0 : t.style) || g.EditStyle.Tile1;
},
enumerable: !1,
configurable: !0
});
o.prototype.isCurrentSkinUGC = function() {
return f.skinUGCInfo.isCurrentSkinUGC();
};
o.prototype.init = function() {
var t = this;
f.skinUGCInfo.init();
f.skinUGCInfo.editStyle = this.editStyle;
f.skinUGCInfo.loadAsset(this.editStyle !== g.EditStyle.Palette).then(function() {
t._assetLoaded = !0;
});
};
o.prototype.preLoadRes = function() {
var t = function(t) {
return new Promise(function(o, i) {
hs.ResLoader.loadByBundle(e.BUNDLE_NAME, t, cc.Prefab, function(e, n) {
e || !n ? i(e || new Error("Prefab not found: " + t)) : o(n);
});
});
};
Promise.all([ t(e.PREFAB_BTN).then(function() {}).catch(function() {}), t(e.PREFAB_ITEM).then(function() {}).catch(function() {}) ]).catch(function() {});
};
o.prototype.onCreate = function() {
this.init();
this.preLoadRes();
};
o.prototype.onActive = function(t) {
var o = this;
if (hs.tp.isClassTopInfoInitCompelte(t)) {
var e = t.args[0];
cc.isValid(e) && this._addGameBtn(e);
}
if (hs.tp.isChapterTopInfoBtnInitCompelte(t)) {
e = t.args[0];
cc.isValid(e) && this._addGameBtn(e);
}
if (hs.tp.isSkin_ProxyLoadSkinInfoConfig(t)) {
var i = t.args[0], n = f.skinUGCInfo.getSkinById(i);
if (n) {
t.replace = !0;
t.returnValue = new Promise(function(t) {
return a(o, void 0, void 0, function() {
var o, e;
return s(this, function(i) {
switch (i.label) {
case 0:
o = [ f.skinUGCInfo.loadUgcColorTemplate(), f.skinUGCInfo.loadOriginalSkinConfig() ];
n.isPreset && o.push(f.skinUGCInfo.loadPresetSkinConfigs(n.id));
return [ 4, Promise.all(o) ];

case 1:
i.sent();
e = f.skinUGCInfo.convertUGCDataToSkinConfig(n);
t({
json: e
});
return [ 2 ];
}
});
});
});
}
}
if (hs.tp.isSkin_ProxyIsValidSkinId(t)) {
var r = f.skinUGCInfo.getAllSkinIds(), l = t.args[1] || [];
t.args[1] = c(l, r);
}
(hs.tp.isSkinUGC_ProxyOnCloseChapterGame(t) || hs.tp.isSkinUGC_ProxyOnCloseClassGame(t) || hs.tp.isSkinUGC_ProxyOnGameEnd(t)) && this._hideSkinList();
if (hs.tp.isSkinAtlasChangeBlockParent(t) || hs.tp.isSkinAtlasGetBlockRenderRootNode(t)) {
var h = this.getOrCreateNodeInScene("SkinUGCTrait_BlockRTT");
cc.isValid(h) && (t.returnValue = h);
}
if (hs.tp.isSkinAtlasChangeBoardParent(t) || hs.tp.isSkinAtlasGetBoardRenderRootNode(t)) {
h = this.getOrCreateNodeInScene("SkinUGCTrait_BoardRTT");
cc.isValid(h) && (t.returnValue = h);
}
if (hs.tp.isSkinAtlasChangeBgParent(t) || hs.tp.isSkinAtlasGetBgRenderRootNode(t)) {
h = this.getOrCreateNodeInScene("SkinUGCTrait_BgRTT");
cc.isValid(h) && (t.returnValue = h);
}
};
o.prototype.getOrCreateNodeInScene = function(t) {
var o = cc.director.getScene();
if (cc.isValid(o)) {
var e = o.getChildByName(t);
if (!cc.isValid(e)) {
(e = new cc.Node(t)).zIndex = cc.macro.MAX_ZINDEX;
o.addChild(e);
}
return e;
}
};
o.prototype._hideSkinList = function() {
var t = hs.gameAlertLayer;
if (cc.isValid(t)) {
var o = t.getChildByName("SkinUGCList");
if (cc.isValid(o)) {
var e = o.getComponent(p.default);
cc.isValid(e) && e.onClickClose();
}
}
};
o.prototype._addGameBtn = function(t) {
var o = this, i = t.parent;
if (cc.isValid(i) && !cc.isValid(i.getChildByName("SkinUGCBtn"))) {
this._btnAdded = !0;
hs.ResLoader.loadByBundle(e.BUNDLE_NAME, e.PREFAB_BTN, cc.Prefab, function(e, n) {
if (e) ; else if (cc.isValid(i) && cc.isValid(t) && !cc.isValid(i.getChildByName("SkinUGCBtn"))) {
var r = cc.instantiate(n);
r.name = "SkinUGCBtn";
r.x = t.x - 65;
var a = t.getComponent(cc.Widget), s = r.getComponent(cc.Widget);
s && a && (s.top = a.top + 22);
i.addChild(r);
o._btnNode = r;
}
});
}
};
o.prototype.openSkinList = function() {
var t = this;
if (!this._loadingList) {
var o = hs.gameAlertLayer;
if (cc.isValid(o)) {
var i = o.getChildByName("SkinUGCList");
if (cc.isValid(i)) {
i.active = !0;
var n = i.getComponent(p.default);
cc.isValid(n) && n.refresh();
} else {
this._loadingList = !0;
hs.ResLoader.loadByBundle(e.BUNDLE_NAME, e.PREFAB_LIST, cc.Prefab, function(e, i) {
return a(t, void 0, void 0, function() {
var t;
return s(this, function(n) {
switch (n.label) {
case 0:
return [ 4, Promise.all([ f.skinUGCInfo.loadUgcColorTemplate(), f.skinUGCInfo.loadOriginalSkinConfig(), f.skinUGCInfo.loadPresetSkinConfigs() ]) ];

case 1:
n.sent();
this._loadingList = !1;
if (e) return [ 2 ];
if (!cc.isValid(o)) return [ 2 ];
if (cc.isValid(o.getChildByName("SkinUGCList"))) return [ 2 ];
t = cc.instantiate(i);
o.addChild(t);
return [ 2 ];
}
});
});
});
}
}
}
};
o.prototype.openEdit = function(t) {
var o = this;
if (!this._loadingEdit) {
var i = hs.gameAlertLayer;
if (cc.isValid(i)) {
this._loadingEdit = !0;
hs.ResLoader.loadByBundle(e.BUNDLE_NAME, e.PREFAB_EDIT, cc.Prefab, function(e, n) {
o._loadingEdit = !1;
if (e) ; else if (cc.isValid(i)) {
var r = cc.instantiate(n), a = r.getComponent(u.default);
cc.isValid(a) && a.show(t);
i.addChild(r);
}
});
}
}
};
o.prototype.openDelete = function(t) {
var o = this;
if (!this._loadingDelete) {
var i = hs.alertLayer;
if (cc.isValid(i) && !cc.isValid(i.getChildByName("SkinUGCDelete"))) {
this._loadingDelete = !0;
hs.ResLoader.loadByBundle(e.BUNDLE_NAME, e.PREFAB_DELETE, cc.Prefab, function(e, n) {
o._loadingDelete = !1;
if (e) ; else if (cc.isValid(i) && !cc.isValid(i.getChildByName("SkinUGCDelete"))) {
var r = cc.instantiate(n), a = r.getComponent(d.default);
a && a.show(t);
i.addChild(r);
}
});
}
}
};
o.prototype.dispatchSkinUpdate = function(t, o) {
var e = f.skinUGCInfo.getSkinById(t), i = e ? f.skinUGCInfo.getVersionedSkinId(e) : t;
hs.EventManager.dispatchModuleEvent(new hs.E_Skin_Update(i, o));
this._lastDispatchedSkinId = i;
};
o.prototype.refreshBtn = function() {
if (cc.isValid(this._btnNode)) {
var t = this._btnNode.getComponent(h.default);
cc.isValid(t) && t.refreshRedDot();
}
};
var e;
o.BUNDLE_NAME = "SkinUGCTrait";
o.PREFAB_BTN = "prefabs/SkinUGCBtn";
o.PREFAB_LIST = "prefabs/SkinUGCList";
o.PREFAB_ITEM = "prefabs/SkinUGCItem";
o.PREFAB_EDIT = "prefabs/SkinUGCEdit";
o.PREFAB_DELETE = "prefabs/SkinUGCDelete";
r([ hs.storageProperty({
key: "SkinUGCTrait_lastDispatchedSkinId"
}) ], o.prototype, "_lastDispatchedSkinId", void 0);
return e = r([ classId("SkinUGCTrait") ], o);
}(Trait);
e.SkinUGCTrait = _;
cc._RF.pop();
}, {
"../components/SkinUGCBtn": "SkinUGCBtn",
"../components/SkinUGCDelete": "SkinUGCDelete",
"../components/SkinUGCEdit": "SkinUGCEdit",
"../components/SkinUGCList": "SkinUGCList",
"./SkinUGCInfo": "SkinUGCInfo",
"./SkinUGCType": "SkinUGCType"
} ],
SkinUGCType: [ function(t, o, e) {
"use strict";
cc._RF.push(o, "a2057SpR49FNYPHNRHdun9W", "SkinUGCType");
Object.defineProperty(e, "__esModule", {
value: !0
});
e.EditStyle = void 0;
(function(t) {
t[t.Tile1 = 1] = "Tile1";
t[t.Tile2 = 2] = "Tile2";
t[t.Palette = 3] = "Palette";
})(e.EditStyle || (e.EditStyle = {}));
cc._RF.pop();
}, {} ]
}, {}, [ "SkinEditItem", "SkinUGCBtn", "SkinUGCDelete", "SkinUGCEdit", "SkinUGCItem", "SkinUGCList", "ColorTools", "HueTools", "LightAndSaturationTools", "SkinUGCInfo", "SkinUGCTrait", "SkinUGCType" ]);
//# sourceMappingURL=index.js.map
