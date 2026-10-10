window.__require = function t(e, n, i) {
function o(r, a) {
if (!n[r]) {
if (!e[r]) {
var c = r.split("/");
c = c[c.length - 1];
if (!e[c]) {
var l = "function" == typeof __require && __require;
if (!a && l) return l(c, !0);
if (s) return s(c, !0);
throw new Error("Cannot find module '" + r + "'");
}
r = c;
}
var h = n[r] = {
exports: {}
};
e[r][0].call(h.exports, function(t) {
return o(e[r][1][t] || t);
}, h, h.exports, t, e, n, i);
}
return n[r].exports;
}
for (var s = "function" == typeof __require && __require, r = 0; r < i.length; r++) o(i[r]);
return o;
}({
SkinBtn: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "4b9feKozZ5HxKC25TwjimM+", "SkinBtn");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
}, r = this && this.__awaiter || function(t, e, n, i) {
return new (n || (n = Promise))(function(o, s) {
function r(t) {
try {
c(i.next(t));
} catch (t) {
s(t);
}
}
function a(t) {
try {
c(i.throw(t));
} catch (t) {
s(t);
}
}
function c(t) {
t.done ? o(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(r, a);
var e;
}
c((i = i.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var n, i, o, s, r = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return s = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
return this;
}), s;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (n = 1, i && (o = 2 & s[0] ? i.return : s[0] ? i.throw || ((o = i.return) && o.call(i), 
0) : i.next) && !(o = o.call(i, s[1])).done) return o;
(i = 0, o) && (s = [ 2 & s[0], o.value ]);
switch (s[0]) {
case 0:
case 1:
o = s;
break;

case 4:
r.label++;
return {
value: s[1],
done: !1
};

case 5:
r.label++;
i = s[1];
s = [ 0 ];
continue;

case 7:
s = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(o = r.trys, o = o.length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
r = 0;
continue;
}
if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
r.label = s[1];
break;
}
if (6 === s[0] && r.label < o[1]) {
r.label = o[1];
o = s;
break;
}
if (o && r.label < o[2]) {
r.label = o[2];
r.ops.push(s);
break;
}
o[2] && r.ops.pop();
r.trys.pop();
continue;
}
s = e.call(t, r);
} catch (t) {
s = [ 6, t ];
i = 0;
} finally {
n = o = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var c = t("../config/SkinSwitchTraitsPrefabConfig"), l = t("../vo/SkinSwitchTraitInfo"), h = t("./SkinListScripts"), p = cc._decorator, u = p.ccclass, d = p.property, f = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.redDot = null;
e.btn = null;
e.spNode = null;
e.defaultNd = null;
e.enterType = 0;
e.callBack = null;
return e;
}
e.prototype.onLoad = function() {
var t = this;
l.skinSwitchTraitInfo.onSkinBtnRedDot(function() {
t.redDot.active = l.skinSwitchTraitInfo.getIsHaveNewSkin();
});
};
e.prototype.render = function() {
this.redDot.active = l.skinSwitchTraitInfo.getIsHaveNewSkin();
this.enterType = this.state.enterType;
storage.getItem("classGuideStep", 0) < 3 && hs.gameInfo.gameMode == hs.GameMode.Class ? this.setBtnState(!1) : this.setBtnState(!0);
this.updateSkinBtn();
};
e.prototype.updateSkinBtn = function() {
if (hs.skinInfo.currentSkinId == hs.skinInfo.originSkinId) {
this.defaultNd.active = !0;
this.spNode.node.active = !1;
} else {
this.defaultNd.active = !1;
this.spNode.node.active = !0;
this.renderSkinBtnColor();
}
};
e.prototype.renderSkinBtnColor = function() {};
e.prototype.setRedState = function(t) {
this.redDot.active = t;
};
e.prototype.setBtnState = function(t) {
this.btn && cc.isValid(this.btn) && this.btn.enabled != t && (this.btn.enabled = t);
};
e.prototype.setCallBack = function(t) {
this.callBack = t;
};
e.prototype.onClick = function() {
return r(this, void 0, void 0, function() {
var t, e;
return a(this, function(n) {
switch (n.label) {
case 0:
0 == this.enterType || (1 != this.enterType || hs.gameInfo.gameMode != hs.GameMode.Class) && (1 == this.enterType && hs.gameInfo.gameMode == hs.GameMode.Chapter || this.enterType);
this.redDot.active = !1;
l.skinSwitchTraitInfo.getSkinData();
return [ 4, hs.UI.show(c.SkinSwitchTraitsPrefabConfig.SkinList, hs.gameAlertLayer) ];

case 1:
t = n.sent();
(e = t.getComponent(h.default)).setState({
shouldUpdate: !e.state.shouldUpdate
});
return [ 2 ];
}
});
});
};
s([ d(cc.Node) ], e.prototype, "redDot", void 0);
s([ d(cc.Button) ], e.prototype, "btn", void 0);
s([ d(hs.CommonMaterialUpdate) ], e.prototype, "spNode", void 0);
s([ d(cc.Node) ], e.prototype, "defaultNd", void 0);
return s([ classId("SkinBtn"), u, classMethodWatch() ], e);
}(hs.Component);
n.default = f;
cc._RF.pop();
}, {
"../config/SkinSwitchTraitsPrefabConfig": "SkinSwitchTraitsPrefabConfig",
"../vo/SkinSwitchTraitInfo": "SkinSwitchTraitInfo",
"./SkinListScripts": "SkinListScripts"
} ],
SkinItemScrpts: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "34a37nwtE9MdqtjDE6x5iQ6", "SkinItemScrpts");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var r = t("../vo/SkinSwitchTraitInfo"), a = cc._decorator, c = a.ccclass, l = a.property, h = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.icon = null;
e.txt_name = null;
e.node_use = null;
e.node_new = null;
e.node_lock = null;
e.node_use_q = null;
e.layout_name = null;
e.dragonAnim_new = null;
e.dragonAnim_select = null;
e.spriteAtlas1 = null;
e.spriteAtlas = null;
e.skinId = 0;
e.skinData = null;
e.isUse = !1;
e.isLock = !1;
e.isSelect = !1;
e.enterType = "";
e.parentScript = null;
e.startTouchPos = null;
return e;
}
e.prototype.onLoad = function() {
var t = this;
r.skinSwitchTraitInfo.onSelectSkin(function(e) {
t.setSelectSkinId(e.id);
}, this);
r.skinSwitchTraitInfo.onFreshSkinItemNewEvent.event(function(e) {
if (e.id === t.skinId) {
var n = r.skinSwitchTraitInfo.getSkinDataById(t.skinId);
t.freshNewState(n.isNew);
}
}, this);
};
e.prototype.render = function() {
this.enterType = this.state.enterType;
this.skinData = this.state.skinData;
this.skinId = this.skinData.ID;
"SelectSkin" == this.enterType ? this.setSelectSkinState() : this.refreshState();
this.setSelectSkinId(null);
this.setIcon();
};
e.prototype.setSelectSkinState = function() {
this.node_use.active = !1;
this.node_new.active = !1;
this.isLock = !1;
this.node_lock.active = !1;
this.node_use_q.active = !1;
};
e.prototype.setIcon = function() {
this.txt_name.string = this.skinData.name;
var t;
t = this.skinId >= 1020 ? this.spriteAtlas.getSpriteFrame(this.skinData.iconName) : this.spriteAtlas1.getSpriteFrame(this.skinData.iconName);
this.icon.spriteFrame = t;
};
e.prototype.refreshState = function() {
var t = r.skinSwitchTraitInfo.getSkinDataById(this.skinId);
if (t) {
this.isUse = t.isUsed;
this.node_use.active = this.isUse;
this.node_use_q.active = this.isUse;
this.txt_name.node.opacity = this.isUse ? 255 : 178;
this.isLock = !t.isUnlock;
this.node_lock.active = this.isLock;
this.layout_name.updateLayout();
t.isNew ? this.freshNewState(!0) : this.freshNewState(!1);
}
};
e.prototype.freshNewState = function(t) {
var e = this;
if (t) {
this.node_new.active = !0;
this.dragonAnim_new.node.active = !0;
this.dragonAnim_new.addEventListener(dragonBones.EventObject.COMPLETE, function(t) {
t && t.animationState && t.animationState.name && (e.dragonAnim_new.node.active = !1);
}, this);
this.dragonAnim_new.playAnimation("effect1", 1);
} else {
this.dragonAnim_new.node.active = !1;
this.node_new.active = !1;
}
};
e.prototype.setSelectSkinId = function(t) {
t || (t = Number(hs.skinInfo.currentSkinId));
this.isSelect = t === this.skinId;
if ("SelectSkin" != this.enterType) if (this.isSelect) {
this.dragonAnim_select.node.active = !0;
this.dragonAnim_select.playAnimation("effect2", 1);
this.node_use.active = !1;
} else {
this.dragonAnim_select.node.active = !1;
this.node_use.active = this.isUse;
} else {
this.node_use.active = this.isSelect;
this.node_use_q.active = this.isSelect;
this.txt_name.node.opacity = 255;
}
};
e.prototype.onClickCheckBtn = function() {
r.skinSwitchTraitInfo.setSelectSkinId(this.skinId);
r.skinSwitchTraitInfo.onSelectSkinEvent.fire({
id: this.skinId
});
this.node_new.active;
};
s([ l(cc.Sprite) ], e.prototype, "icon", void 0);
s([ l(cc.Label) ], e.prototype, "txt_name", void 0);
s([ l(cc.Node) ], e.prototype, "node_use", void 0);
s([ l(cc.Node) ], e.prototype, "node_new", void 0);
s([ l(cc.Node) ], e.prototype, "node_lock", void 0);
s([ l(cc.Node) ], e.prototype, "node_use_q", void 0);
s([ l(cc.Layout) ], e.prototype, "layout_name", void 0);
s([ l(dragonBones.ArmatureDisplay) ], e.prototype, "dragonAnim_new", void 0);
s([ l(dragonBones.ArmatureDisplay) ], e.prototype, "dragonAnim_select", void 0);
s([ l(cc.SpriteAtlas) ], e.prototype, "spriteAtlas1", void 0);
s([ l(cc.SpriteAtlas) ], e.prototype, "spriteAtlas", void 0);
return s([ c ], e);
}(hs.Component);
n.default = h;
cc._RF.pop();
}, {
"../vo/SkinSwitchTraitInfo": "SkinSwitchTraitInfo"
} ],
SkinListScripts: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "d701fFzEK9C9JxIPaOUz5vD", "SkinListScripts");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
}, r = this && this.__awaiter || function(t, e, n, i) {
return new (n || (n = Promise))(function(o, s) {
function r(t) {
try {
c(i.next(t));
} catch (t) {
s(t);
}
}
function a(t) {
try {
c(i.throw(t));
} catch (t) {
s(t);
}
}
function c(t) {
t.done ? o(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(r, a);
var e;
}
c((i = i.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var n, i, o, s, r = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return s = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
return this;
}), s;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (n = 1, i && (o = 2 & s[0] ? i.return : s[0] ? i.throw || ((o = i.return) && o.call(i), 
0) : i.next) && !(o = o.call(i, s[1])).done) return o;
(i = 0, o) && (s = [ 2 & s[0], o.value ]);
switch (s[0]) {
case 0:
case 1:
o = s;
break;

case 4:
r.label++;
return {
value: s[1],
done: !1
};

case 5:
r.label++;
i = s[1];
s = [ 0 ];
continue;

case 7:
s = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(o = r.trys, o = o.length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
r = 0;
continue;
}
if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
r.label = s[1];
break;
}
if (6 === s[0] && r.label < o[1]) {
r.label = o[1];
o = s;
break;
}
if (o && r.label < o[2]) {
r.label = o[2];
r.ops.push(s);
break;
}
o[2] && r.ops.pop();
r.trys.pop();
continue;
}
s = e.call(t, r);
} catch (t) {
s = [ 6, t ];
i = 0;
} finally {
n = o = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}
}, c = this && this.__read || function(t, e) {
var n = "function" == typeof Symbol && t[Symbol.iterator];
if (!n) return t;
var i, o, s = n.call(t), r = [];
try {
for (;(void 0 === e || e-- > 0) && !(i = s.next()).done; ) r.push(i.value);
} catch (t) {
o = {
error: t
};
} finally {
try {
i && !i.done && (n = s.return) && n.call(s);
} finally {
if (o) throw o.error;
}
}
return r;
}, l = this && this.__spread || function() {
for (var t = [], e = 0; e < arguments.length; e++) t = t.concat(c(arguments[e]));
return t;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var h, p = t("../config/SkinSwitchTraitsPrefabConfig"), u = t("../vo/SkinSwitchTraitInfo"), d = t("./SkinUpItemScrpts"), f = cc._decorator, S = f.ccclass, k = f.property;
(function(t) {
t[t.none = 0] = "none";
t[t.complete = 1] = "complete";
t[t.delay = 2] = "delay";
t[t.click = 3] = "click";
})(h || (h = {}));
var y = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.colse_btn = null;
e.bgColse_btn = null;
e.bottom_use = null;
e.bottom_apply = null;
e.bottom_share = null;
e.bottom_desc = null;
e.bottom_desc_txt = null;
e.out_bg = null;
e.in_bg = null;
e.allNode = null;
e.close_bg = null;
e.share_desc_txt = null;
e.top_title = null;
e.list_view_noName = null;
e.skinItemPrefab = null;
e.skinItemNoNamePrefab = null;
e.curUseId = Number(hs.skinInfo.currentSkinId);
e.backtime = 0;
e.enterType = 0;
e.callBack = null;
e.expIdArray = [];
e.hideType = 0;
return e;
}
e.prototype.onLoad = function() {
return r(this, void 0, Promise, function() {
var t, e = this;
return a(this, function(n) {
switch (n.label) {
case 0:
u.skinSwitchTraitInfo.onSelectSkin(function(t) {
e.freshBottomUI(t.id);
});
t = this.getItemHeight();
return [ 4, this.list_view_noName.init({
prefabUrl: p.SkinSwitchTraitsPrefabConfig.SkinUpItem.url,
bundleName: p.SkinSwitchTraitsPrefabConfig.SkinUpItem.bundleName,
itemHeight: t,
itemComponent: d.default,
bufferCount: 2,
visibilityThreshold: .9,
visibilityLeaveThreshold: .1,
onItemVisibilityChange: function(t, n) {
var i, o = e.getSkinListData()[t];
if (n) {
for (var s = [], r = 0; r < o.length; r++) {
var a = o[r][0].ID;
e.expIdArray.includes(a) || s.push(a);
}
s.length > 0 && (i = e.expIdArray).push.apply(i, l(s));
} else {
var c = e.getSkinListData()[t];
for (r = 0; r < c.length; r++) {
a = c[r][0].ID;
if (u.skinSwitchTraitInfo.getSkinNewState(a)) {
u.skinSwitchTraitInfo.setOldSkin(a);
u.skinSwitchTraitInfo.onFreshSkinItemNewEvent.fire({
id: a
});
}
}
}
}
}) ];

case 1:
n.sent();
u.skinSwitchTraitInfo.skinListBarrier.open();
return [ 2 ];
}
});
});
};
e.prototype.getItemHeight = function() {
return 440;
};
e.prototype.render = function() {
return r(this, void 0, void 0, function() {
var t;
return a(this, function(e) {
switch (e.label) {
case 0:
return u.skinSwitchTraitInfo.skinListBarrier.isOpen ? [ 3, 2 ] : [ 4, u.skinSwitchTraitInfo.skinListBarrier.wait() ];

case 1:
e.sent();
e.label = 2;

case 2:
for (t = 0; t < this.expIdArray.length; t++) u.skinSwitchTraitInfo.setOldSkin(this.expIdArray[t]);
this.hideType = h.none;
this.expIdArray = [];
u.skinSwitchTraitInfo.getSkinData();
this.curUseId = Number(hs.skinInfo.currentSkinId);
u.skinSwitchTraitInfo.setSelectSkinId(this.curUseId);
this.showSkinList();
this.freshBottomUI(this.curUseId);
this.showStartAni();
this.list_view_noName.node.active = !0;
this.list_view_noName.refresh(!0);
this.onSkinSetLayerRender();
return [ 2 ];
}
});
});
};
e.prototype.setEnterType = function(t) {
this.enterType = t;
};
e.prototype.showStartAni = function() {
this.colse_btn.enabled = !0;
this.bgColse_btn.enabled = !0;
this.allNode.scale = .3;
cc.tween(this.allNode).to(.2, {
scale: 1.1
}).to(.03, {
scale: 1
}).start();
};
e.prototype.showEndAni = function(t) {
var e = this;
this.hideType = t;
this.allNode.scale = .3;
cc.tween(this.allNode).to(.13, {
scale: .001
}).call(function() {
e.closeLayer();
}).start();
};
e.prototype.getSkinListData = function() {
var t = [], e = [], n = u.skinSwitchTraitInfo.getSkinPoolJson(), i = u.skinSwitchTraitInfo.getNowSkinData(), o = l(n).sort(function(t, e) {
var n = i[t.ID], o = i[e.ID];
return n.isUsed ? -1 : o.isUsed ? 1 : n.isUnlock && !o.isUnlock ? -1 : (!n.isUnlock && o.isUnlock, 
1);
}), s = 0;
o.forEach(function(n) {
s++;
var r = i[n.ID];
if (r && (1 == n.isShow || r.isUnlock)) {
var a = [ n, "" ];
r.isUsed;
e.push(a);
if (2 == e.length) {
t.push(e);
e = [];
0;
} else if (s == o.length) {
t.push(e);
0;
}
}
});
return t;
};
e.prototype.showSkinList = function() {
var t = this.getSkinListData();
cc.isValid(this.list_view_noName) && this.list_view_noName.setState({
dataSource: t
});
};
e.prototype.getIsShowDesc = function(t) {
return t == u.skinSwitchTraitInfo.skinLouckTypeEnum.Louck_round || t == u.skinSwitchTraitInfo.skinLouckTypeEnum.Louck_score || t == u.skinSwitchTraitInfo.skinLouckTypeEnum.Louck_login;
};
e.prototype.freshBottomUI = function(t) {
var e, n;
return r(this, void 0, void 0, function() {
var i, o, s, r, c, l, h;
return a(this, function() {
i = t || Number(hs.skinInfo.currentSkinId);
o = u.skinSwitchTraitInfo.getSkinDataById(i);
s = u.skinSwitchTraitInfo.getSkinConfigById(i);
if (!o || !s) return [ 2 ];
this.bottom_desc.active = !1;
this.bottom_use.active = !1;
this.bottom_apply.active = !1;
this.bottom_share.active = !1;
if (u.skinSwitchTraitInfo.selectSkinId == Number(hs.skinInfo.currentSkinId)) this.bottom_use.active = !0; else if (o.isUnlock) this.bottom_apply.active = !0; else if (s.unlock_type == u.skinSwitchTraitInfo.skinLouckTypeEnum.Louck_achieve) ; else if (this.getIsShowDesc(s.unlock_type)) {
this.bottom_desc.active = !0;
this.bottom_desc_txt.node.active = !0;
this.bottom_desc_txt.string = u.skinSwitchTraitInfo.replaceString(s.desc_en, [ s.unlock_num ]);
if ((r = this.bottom_desc.getChildByName("SkinSetLayerUnlockDesc")) && cc.isValid(r)) if ((c = null === (e = r.getComponent(hs.SkinSetupDescComponent)) || void 0 === e ? void 0 : e.descLabel) && hs.skinInfo.skinEnabled) {
r.active = !0;
c.string = u.skinSwitchTraitInfo.replaceString(s.desc_en, [ s.unlock_num ]);
this.bottom_desc_txt.node.active = !1;
} else r.active = !1;
} else if (s.unlock_type == u.skinSwitchTraitInfo.skinLouckTypeEnum.Louck_share) {
this.bottom_share.active = !0;
this.share_desc_txt.node.active = !0;
this.share_desc_txt.string = u.skinSwitchTraitInfo.replaceString(s.desc_en, [ s.unlock_num ]);
if ((l = this.bottom_share.getChildByName("SkinSetLayerShareDesc")) && cc.isValid(l)) if ((h = null === (n = l.getComponent(hs.SkinSetupDescComponent)) || void 0 === n ? void 0 : n.descLabel) && hs.skinInfo.skinEnabled) {
l.active = !0;
h.string = u.skinSwitchTraitInfo.replaceString(s.desc_en, [ s.unlock_num ]);
this.share_desc_txt.node.active = !1;
} else l.active = !1;
}
return [ 2 ];
});
});
};
e.prototype.onChangeSkin = function() {
var t = this, e = u.skinSwitchTraitInfo.selectSkinId.toString();
this.colse_btn.enabled = !1;
this.bgColse_btn.enabled = !1;
hs.EventManager.dispatchModuleEvent(new hs.E_Skin_Update("" + e));
this.scheduleOnce(function() {
t.node.active && t.hideType != h.none && t.showEndAni(h.delay);
}, 3);
};
e.prototype.setCallBack = function(t) {
this.callBack = t;
};
e.prototype.onColse = function() {
this.showEndAni(h.click);
};
e.prototype.setExpSkinOldState = function() {
for (var t = 0; t < this.expIdArray.length; t++) u.skinSwitchTraitInfo.getSkinLockState(this.expIdArray[t]) && u.skinSwitchTraitInfo.setOldSkin(this.expIdArray[t]);
};
e.prototype.btnShareClick = function(t, e) {
if (new Date().getTime() - this.backtime > 1e3) {
this.backtime = new Date().getTime();
var n = {
type: e,
from: 2
};
if (hs.deviceInfo.data) {
var i = hs.deviceInfo.data.network, o = new Set([ "WIFI", "4G", "5G" ]);
l(o).some(function(t) {
return i.includes(t);
}) && hs.NativeShare.callNativeShareAppClick(JSON.stringify(n));
}
this.setExpSkinOldState();
u.skinSwitchTraitInfo.setSkinShareState();
this.list_view_noName.refresh();
}
};
e.prototype.closeLayer = function() {
for (var t = 0; t < this.expIdArray.length; t++) u.skinSwitchTraitInfo.setOldSkin(this.expIdArray[t]);
u.skinSwitchTraitInfo.onSkinBtnRedDotEvent.fire();
u.skinSwitchTraitInfo.setSkinLocalData();
hs.UI.hideUI(p.SkinSwitchTraitsPrefabConfig.SkinList);
};
e.prototype.onSkinSetLayerRender = function() {};
s([ k(cc.Button) ], e.prototype, "colse_btn", void 0);
s([ k(cc.Button) ], e.prototype, "bgColse_btn", void 0);
s([ k(cc.Node) ], e.prototype, "bottom_use", void 0);
s([ k(cc.Node) ], e.prototype, "bottom_apply", void 0);
s([ k(cc.Node) ], e.prototype, "bottom_share", void 0);
s([ k(cc.Node) ], e.prototype, "bottom_desc", void 0);
s([ k(cc.Label) ], e.prototype, "bottom_desc_txt", void 0);
s([ k(cc.Node) ], e.prototype, "out_bg", void 0);
s([ k(cc.Node) ], e.prototype, "in_bg", void 0);
s([ k(cc.Node) ], e.prototype, "allNode", void 0);
s([ k(cc.Node) ], e.prototype, "close_bg", void 0);
s([ k(cc.Label) ], e.prototype, "share_desc_txt", void 0);
s([ k(cc.Label) ], e.prototype, "top_title", void 0);
s([ k(hs.VirtualList) ], e.prototype, "list_view_noName", void 0);
s([ k(cc.Prefab) ], e.prototype, "skinItemPrefab", void 0);
s([ k(cc.Prefab) ], e.prototype, "skinItemNoNamePrefab", void 0);
return s([ classId("SkinListScripts"), S, classMethodWatch() ], e);
}(hs.Component);
n.default = y;
cc._RF.pop();
}, {
"../config/SkinSwitchTraitsPrefabConfig": "SkinSwitchTraitsPrefabConfig",
"../vo/SkinSwitchTraitInfo": "SkinSwitchTraitInfo",
"./SkinUpItemScrpts": "SkinUpItemScrpts"
} ],
SkinShaderChangeSkinBtn: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "f149dMITFRNQbkVHrcarjfs", "SkinShaderChangeSkinBtn");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var r = cc._decorator, a = r.ccclass, c = r.property, l = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.spNode = null;
e.ndNew = null;
e.defaultNd = null;
return e;
}
e.prototype.render = function() {
var t = this.state.colorData;
t && this.updateMaterialData(t);
};
e.prototype.updateMaterialData = function(t) {
if (hs.skinInfo.currentSkinId == hs.skinInfo.originSkinId) this.showDefault(); else {
if (!t) return;
this.defaultNd.active = !1;
this.spNode.node.active = !0;
this.spNode.setMaterial();
this.spNode.node.opacity = t.opacity;
this.spNode.setAllParams(t.color);
}
};
e.prototype.showDefault = function() {
this.defaultNd.active = !0;
this.spNode.node.active = !1;
};
s([ c(hs.CommonMaterialUpdate) ], e.prototype, "spNode", void 0);
s([ c(cc.Node) ], e.prototype, "ndNew", void 0);
s([ c(cc.Node) ], e.prototype, "defaultNd", void 0);
return s([ a ], e);
}(hs.Component);
n.default = l;
cc._RF.pop();
}, {} ],
SkinSwitchTraitInfo: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "202ff2TuBtE4ol5+HIsc37i", "SkinSwitchTraitInfo");
Object.defineProperty(n, "__esModule", {
value: !0
});
n.skinSwitchTraitInfo = void 0;
var i, o, s, r = t("../../../../../scripts/modules/skin/vo/SkinInfo");
(function(t) {
t[t.Lobby = 0] = "Lobby";
t[t.Game = 1] = "Game";
t[t.Setting = 2] = "Setting";
})(i || (i = {}));
(function(t) {
t[t.SkinConfig_Default = 1e3] = "SkinConfig_Default";
t[t.SkinConfig_Random = 1e4] = "SkinConfig_Random";
})(o || (o = {}));
(function(t) {
t[t.Louck_origin = 0] = "Louck_origin";
t[t.Louck_round = 1] = "Louck_round";
t[t.Louck_score = 2] = "Louck_score";
t[t.Louck_achieve = 3] = "Louck_achieve";
t[t.Louck_login = 4] = "Louck_login";
t[t.Louck_share = 5] = "Louck_share";
})(s || (s = {}));
var a = function() {
function t() {
this.skinEntry = i;
this.skinLouckTypeEnum = s;
this.skinPoolJson = null;
this.localSkinData = {};
this.skinUnlockData = null;
this._selectSkinId = Number(r.skinInfo.currentSkinId);
this._skinListBarrier = new hs.Barrier();
this._onSelectSkin = new hs.Emitter();
this.onSelectSkin = this._onSelectSkin.event;
this._onSkinBtnRedDot = new hs.Emitter();
this.onSkinBtnRedDot = this._onSkinBtnRedDot.event;
this._onFreshSkinItemNew = new hs.Emitter();
this.onFreshSkinItemNew = this._onFreshSkinItemNew.event;
}
Object.defineProperty(t.prototype, "onSelectSkinEvent", {
get: function() {
return this._onSelectSkin;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "onSkinBtnRedDotEvent", {
get: function() {
return this._onSkinBtnRedDot;
},
enumerable: !1,
configurable: !0
});
Object.defineProperty(t.prototype, "onFreshSkinItemNewEvent", {
get: function() {
return this._onFreshSkinItemNew;
},
enumerable: !1,
configurable: !0
});
t.prototype.getSkinPoolJson = function() {
return this.skinPoolJson;
};
Object.defineProperty(t.prototype, "selectSkinId", {
get: function() {
return this._selectSkinId;
},
enumerable: !1,
configurable: !0
});
t.prototype.setSelectSkinId = function(t) {
this._selectSkinId = t;
};
t.prototype.setSkinPoolJson = function(t) {
this.skinPoolJson = t;
};
t.prototype.getSkinConfigById = function(t) {
return this.skinPoolJson.find(function(e) {
return e.ID === t;
});
};
Object.defineProperty(t.prototype, "skinListBarrier", {
get: function() {
return this._skinListBarrier;
},
enumerable: !1,
configurable: !0
});
t.prototype.getSkinDataById = function(t) {
return this.localSkinData[t];
};
t.prototype.getNowSkinData = function() {
this.getSkinLocalData();
return this.localSkinData;
};
t.prototype.getSkinData = function() {
this.getSkinLocalData();
for (var t = this.skinPoolJson, e = 0; e < t.length; e++) {
var n = t[e].ID, i = this.localSkinData[n], o = null;
i && i.isUnlock || (o = this.setOneSkinData(t[e])) && (this.localSkinData[n] = o);
}
this.setUseId();
this.setSkinLocalData();
return this.localSkinData;
};
t.prototype.setUseId = function() {
var t = Number(r.skinInfo.currentSkinId);
for (var e in this.localSkinData) {
var n = this.localSkinData[e];
n.isUsed = n.ID === t;
}
};
t.prototype.setOldSkin = function(t) {
for (var e in this.localSkinData) {
var n = this.localSkinData[e];
t == n.ID && n.isUnlock && (n.isNew = !1);
}
this.setSkinLocalData();
};
t.prototype.getSkinNewState = function(t) {
for (var e in this.localSkinData) {
var n = this.localSkinData[e];
if (t == n.ID && n.isUnlock) return n.isNew;
}
return !1;
};
t.prototype.getIsHaveNewSkin = function() {
var t = !1;
for (var e in this.localSkinData) if (this.localSkinData[e].isNew) {
t = !0;
break;
}
return t;
};
t.prototype.getSkinLockState = function(t) {
for (var e in this.localSkinData) {
var n = this.localSkinData[e];
if (t == n.ID) return n.isUnlock;
}
return !1;
};
t.prototype.setOneSkinData = function(t) {
var e = null;
if (t.unlock_type == s.Louck_origin) (e = this.getFirstLockData(t.ID, !0)).isNew = !1; else if (t.unlock_type == s.Louck_round) {
var n = this.skinUnlockData.roundNum >= t.unlock_num;
e = this.getFirstLockData(t.ID, n);
} else if (t.unlock_type == s.Louck_score) {
n = storage.getItem("classHighScore", 0) >= t.unlock_num;
e = this.getFirstLockData(t.ID, n);
} else if (t.unlock_type == s.Louck_achieve) {
n = !1;
e = this.getFirstLockData(t.ID, n);
} else if (t.unlock_type == s.Louck_login) {
n = this.skinUnlockData.loginDays >= t.unlock_num;
e = this.getFirstLockData(t.ID, n);
} else if (t.unlock_type == s.Louck_share) {
n = this.skinUnlockData.shareNum >= t.unlock_num;
e = this.getFirstLockData(t.ID, n);
}
return e;
};
t.prototype.setSkinLoginDays = function() {
this.skinUnlockData || this.getSkinUnlockData();
var t = this.skinUnlockData.loginDate, e = hs.getFullYear() + "-" + hs.getMonth() + "-" + hs.getDate();
if (!t || t != e) {
this.skinUnlockData.loginDate = e;
this.skinUnlockData.loginDays++;
this.setSkinUnlockData();
this.onSkinBtnRedDotEvent.fire();
}
};
t.prototype.setSkinGameRoundNum = function() {
this.skinUnlockData.roundNum++;
this.getSkinData();
this.setSkinUnlockData();
this.onSkinBtnRedDotEvent.fire();
};
t.prototype.setSkinShareState = function() {
this.skinUnlockData.shareNum++;
this.getSkinData();
this.setSkinUnlockData();
};
t.prototype.setSkinScoreState = function() {
this.getSkinData();
this.onSkinBtnRedDotEvent.fire();
};
t.prototype.getFirstLockData = function(t, e) {
return e ? {
ID: t,
isNew: !0,
isUnlock: !0,
isUsed: !1
} : {
ID: t,
isNew: !1,
isUnlock: !1,
isUsed: !1
};
};
t.prototype.getAllUnlockSkinIdAry = function() {
var t = [], e = this.getNowSkinData();
for (var n in e) {
var i = e[n];
i.isUnlock && t.push(i.ID);
}
return t;
};
t.prototype.getSkinLocalData = function() {
this.localSkinData = storage.getItem("SkinLocalData", {});
};
t.prototype.setSkinLocalData = function() {
storage.setItem("SkinLocalData", this.localSkinData);
};
t.prototype.getSkinUnlockData = function() {
this.skinUnlockData = storage.getItem("UnLockSkinData", {
loginDays: 0,
roundNum: 0,
shareNum: 0,
loginDate: ""
});
};
t.prototype.setSkinUnlockData = function() {
storage.setItem("UnLockSkinData", this.skinUnlockData);
};
t.prototype.replaceString = function(t, e) {
for (var n = t, i = 0; i < e.length; i++) {
var o = "{" + i + "}";
n.includes(o) && (n = n.replace(new RegExp(o.replace(/{/g, "\\{").replace(/}/g, "\\}"), "g"), e[i].toString()));
}
return n;
};
return t;
}();
n.skinSwitchTraitInfo = new a();
cc._RF.pop();
}, {
"../../../../../scripts/modules/skin/vo/SkinInfo": void 0
} ],
SkinSwitchTraitsPrefabConfig: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "cdc8c+XQOBNgJPKPYxpB0Ob", "SkinSwitchTraitsPrefabConfig");
Object.defineProperty(n, "__esModule", {
value: !0
});
n.PrefabConfigType = n.satisfies = n.SkinSwitchTraitsPrefabConfig = void 0;
n.SkinSwitchTraitsPrefabConfig = {
SkinBtn: {
name: "SkinShaderChangeSkinBtn",
url: "prefabs/SkinShaderChangeSkinBtn",
bundleName: "SkinSwitchTrait"
},
SkinList: {
name: "skinListNode",
url: "prefabs/skinListNode",
bundleName: "SkinSwitchTrait"
},
SkinUpItem: {
name: "skinUpItem",
url: "prefabs/skinUpItem",
bundleName: "SkinSwitchTrait"
}
};
cc._RF.pop();
}, {} ],
SkinSwitchTrait: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "c3016RdlYlDM761+ffxFW5L", "SkinSwitchTrait");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
}, r = this && this.__awaiter || function(t, e, n, i) {
return new (n || (n = Promise))(function(o, s) {
function r(t) {
try {
c(i.next(t));
} catch (t) {
s(t);
}
}
function a(t) {
try {
c(i.throw(t));
} catch (t) {
s(t);
}
}
function c(t) {
t.done ? o(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(r, a);
var e;
}
c((i = i.apply(t, e || [])).next());
});
}, a = this && this.__generator || function(t, e) {
var n, i, o, s, r = {
label: 0,
sent: function() {
if (1 & o[0]) throw o[1];
return o[1];
},
trys: [],
ops: []
};
return s = {
next: a(0),
throw: a(1),
return: a(2)
}, "function" == typeof Symbol && (s[Symbol.iterator] = function() {
return this;
}), s;
function a(t) {
return function(e) {
return c([ t, e ]);
};
}
function c(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;r; ) try {
if (n = 1, i && (o = 2 & s[0] ? i.return : s[0] ? i.throw || ((o = i.return) && o.call(i), 
0) : i.next) && !(o = o.call(i, s[1])).done) return o;
(i = 0, o) && (s = [ 2 & s[0], o.value ]);
switch (s[0]) {
case 0:
case 1:
o = s;
break;

case 4:
r.label++;
return {
value: s[1],
done: !1
};

case 5:
r.label++;
i = s[1];
s = [ 0 ];
continue;

case 7:
s = r.ops.pop();
r.trys.pop();
continue;

default:
if (!(o = r.trys, o = o.length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
r = 0;
continue;
}
if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
r.label = s[1];
break;
}
if (6 === s[0] && r.label < o[1]) {
r.label = o[1];
o = s;
break;
}
if (o && r.label < o[2]) {
r.label = o[2];
r.ops.push(s);
break;
}
o[2] && r.ops.pop();
r.trys.pop();
continue;
}
s = e.call(t, r);
} catch (t) {
s = [ 6, t ];
i = 0;
} finally {
n = o = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}
};
Object.defineProperty(n, "__esModule", {
value: !0
});
n.SkinSwitchTrait = void 0;
var c = t("../components/SkinBtn"), l = t("../components/SkinListScripts"), h = t("../config/SkinSwitchTraitsPrefabConfig"), p = t("../vo/SkinSwitchTraitInfo"), u = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.skinBtnScript_class = null;
e.skinBtnScript_chapter = null;
e.switchSkinPoolBarrier = new hs.Barrier();
e.isAddSkinEnterBtn = !1;
return e;
}
e.prototype.onCreate = function() {
this.preLoadRes();
p.skinSwitchTraitInfo.setSkinLoginDays();
this.addSkinEnterBtn(null);
};
e.prototype.onActive = function(t) {
hs.tp.isSkinSwitch_proxyOnOpenChapterGame(t) && this.skinBtnScript_chapter && cc.isValid(this.skinBtnScript_chapter.node) && this.skinBtnScript_chapter.setState({
isRender: !this.skinBtnScript_chapter.state.isRender
});
hs.tp.isSkinSwitch_proxyOnOpenClassGame(t) && this.skinBtnScript_class && cc.isValid(this.skinBtnScript_class.node) && this.skinBtnScript_class.setState({
isRender: !this.skinBtnScript_class.state.isRender
});
if (hs.tp.isSkinSwitch_proxyOnGameEnd(t)) {
p.skinSwitchTraitInfo.setSkinGameRoundNum();
hs.UI.hideUI(h.SkinSwitchTraitsPrefabConfig.SkinList);
}
if (hs.tp.isClassTopInfoInitCompelte(t) || hs.tp.isChapterTopInfoBtnInitCompelte(t)) {
var e = t.args[0];
cc.isValid(e) && this.addSkinEnterBtn(e);
}
(hs.tp.isSkinSwitch_proxyOnCloseChapterGame(t) || hs.tp.isSkinSwitch_proxyOnCloseClassGame(t)) && hs.UI.hideUI(h.SkinSwitchTraitsPrefabConfig.SkinList);
if (hs.tp.isClassGuide_ProxyOnGuideChangeTrait(t)) {
var n = hs.classGuideInfo, i = n.totalStep;
n.step === i && this.skinBtnScript_class && cc.isValid(this.skinBtnScript_class.node) && this.skinBtnScript_class.setState({
btnState: !0
});
}
hs.tp.isClassScoreTip_ProxyOnClassScoreUpdate(t) && p.skinSwitchTraitInfo.setSkinScoreState();
if (hs.tp.isIsOpenChangeSkinTraitChangeSkinBlockCompelet(t)) {
var o = Cinst(l.default);
o && cc.isValid(o.node) && o.node.active && o.showEndAni(2);
hs.gameInfo.gameMode === hs.GameMode.Class ? this.skinBtnScript_class && cc.isValid(this.skinBtnScript_class.node) && this.skinBtnScript_class.setState({
isRender: !this.skinBtnScript_class.state.isRender
}) : hs.gameInfo.gameMode === hs.GameMode.Chapter && this.skinBtnScript_chapter && cc.isValid(this.skinBtnScript_chapter.node) && this.skinBtnScript_chapter.setState({
isRender: !this.skinBtnScript_chapter.state.isRender
});
}
(hs.tp.isCleanSceneRandomSkinTraitHideDontTouchLayer(t) || hs.tp.isCleanSceneUseSequenceSkinTraitHideDontTouchLayer(t)) && (hs.gameInfo.gameMode === hs.GameMode.Class ? cc.isValid(this.skinBtnScript_class) && cc.isValid(this.skinBtnScript_class.node) && this.skinBtnScript_class.setState({
btnState: !0
}) : hs.gameInfo.gameMode === hs.GameMode.Chapter && cc.isValid(this.skinBtnScript_chapter) && cc.isValid(this.skinBtnScript_chapter.node) && this.skinBtnScript_chapter.setState({
btnState: !0
}));
(hs.tp.isCleanSceneRandomSkinTraitShowDontTouchLayer(t) || hs.tp.isCleanSceneUseSequenceSkinTraitShowDontTouchLayer(t)) && (hs.gameInfo.gameMode === hs.GameMode.Class ? cc.isValid(this.skinBtnScript_class) && cc.isValid(this.skinBtnScript_class.node) && this.skinBtnScript_class.setState({
btnState: !1
}) : hs.gameInfo.gameMode === hs.GameMode.Chapter && cc.isValid(this.skinBtnScript_chapter) && cc.isValid(this.skinBtnScript_chapter.node) && this.skinBtnScript_chapter.setState({
btnState: !1
}));
if (hs.tp.isIsOpenChangeSkinTraitOnSkinSetBtnRender(t)) {
var s = t.args[0];
this.onSkinSetBtnRender(s);
}
hs.tp.isIsOpenChangeSkinTraitOnSkinSetLayerRender(t) && this.onSkinSetLayerRender(t.args[0]);
this.changeSkinAtlasParent(t);
};
e.prototype.changeSkinAtlasParent = function(t) {
if (hs.tp.isSkinAtlasChangeBlockParent(t) || hs.tp.isSkinAtlasGetBlockRenderRootNode(t)) {
var e = this.getOrCreateNodeInScene("SkinSwitchTrait_BlockRTT");
cc.isValid(e) && (t.returnValue = e);
}
if (hs.tp.isSkinAtlasChangeBoardParent(t) || hs.tp.isSkinAtlasGetBoardRenderRootNode(t)) {
e = this.getOrCreateNodeInScene("SkinSwitchTrait_BoardRTT");
cc.isValid(e) && (t.returnValue = e);
}
if (hs.tp.isSkinAtlasChangeBgParent(t) || hs.tp.isSkinAtlasGetBgRenderRootNode(t)) {
e = this.getOrCreateNodeInScene("SkinSwitchTrait_BgRTT");
cc.isValid(e) && (t.returnValue = e);
}
};
e.prototype.getOrCreateNodeInScene = function(t) {
var e = cc.director.getScene();
if (cc.isValid(e)) {
var n = e.getChildByName(t);
if (!cc.isValid(n)) {
(n = new cc.Node(t)).zIndex = cc.macro.MAX_ZINDEX;
e.addChild(n);
}
return n;
}
};
e.prototype.addSkinEnterBtn = function(t) {
var e, n;
return r(this, void 0, void 0, function() {
var i, o = this;
return a(this, function(s) {
switch (s.label) {
case 0:
return this.switchSkinPoolBarrier.isOpen ? [ 3, 2 ] : [ 4, this.switchSkinPoolBarrier.wait() ];

case 1:
s.sent();
s.label = 2;

case 2:
t || this.isAddSkinEnterBtn || (hs.gameInfo.gameMode === hs.GameMode.Class ? t = null === (e = Cinst(hs.ClassTopInfo)) || void 0 === e ? void 0 : e.setBtn.node : hs.gameInfo.gameMode === hs.GameMode.Chapter && (t = null === (n = Cinst(hs.ChapterTopInfoBtn)) || void 0 === n ? void 0 : n.setup.node));
if (!cc.isValid(t)) return [ 2 ];
this.isAddSkinEnterBtn = !0;
i = t.parent;
hs.ResLoader.loadByBundle(h.SkinSwitchTraitsPrefabConfig.SkinBtn.bundleName, h.SkinSwitchTraitsPrefabConfig.SkinBtn.url, cc.Prefab, function(e, n) {
var s, r;
if (!e && cc.isValid(i) && cc.isValid(t) && n) {
var a = i.getChildByName("SkinBtn");
if (cc.isValid(a)) ; else {
var l = cc.instantiate(n);
l.x = t.x - 130;
l.getComponent(cc.Widget).top = t.getComponent(cc.Widget).top + 32;
i.addChild(l);
if (hs.gameInfo.gameMode === hs.GameMode.Class) {
o.skinBtnScript_class = l.getComponent(c.default);
null === (s = o.skinBtnScript_class) || void 0 === s || s.setState({
enterType: p.skinSwitchTraitInfo.skinEntry.Game
});
} else if (hs.gameInfo.gameMode === hs.GameMode.Chapter) {
o.skinBtnScript_chapter = l.getComponent(c.default);
null === (r = o.skinBtnScript_chapter) || void 0 === r || r.setState({
enterType: p.skinSwitchTraitInfo.skinEntry.Game
});
}
}
}
});
return [ 2 ];
}
});
});
};
e.prototype.getAllUnlockSkinIdAry = function() {
return p.skinSwitchTraitInfo.getAllUnlockSkinIdAry();
};
e.prototype.preLoadRes = function() {
var t = this;
hs.ResLoader.loadByBundle(h.SkinSwitchTraitsPrefabConfig.SkinBtn.bundleName, h.SkinSwitchTraitsPrefabConfig.SkinBtn.url, cc.Prefab, function() {});
hs.ResLoader.loadByBundle(h.SkinSwitchTraitsPrefabConfig.SkinUpItem.bundleName, h.SkinSwitchTraitsPrefabConfig.SkinUpItem.url, cc.Prefab, function() {});
hs.ResLoader.loadByBundle(h.SkinSwitchTraitsPrefabConfig.SkinList.bundleName, h.SkinSwitchTraitsPrefabConfig.SkinList.url, cc.Prefab, function() {});
var e = "configs/skin/skinSystemPool/" + (this.props.skinPoolPath || "defultSkinPool");
hs.ResLoader.load(e, cc.JsonAsset, function(e, n) {
if (!e && n) {
p.skinSwitchTraitInfo.setSkinPoolJson(n.json);
p.skinSwitchTraitInfo.getSkinData();
t.switchSkinPoolBarrier.open();
}
});
};
e.prototype.onSkinSetBtnRender = function(t) {
return r(this, void 0, void 0, function() {
var e, n, i, o;
return a(this, function(s) {
switch (s.label) {
case 0:
return hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 2 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ];

case 1:
s.sent();
s.label = 2;

case 2:
return t && cc.isValid(t.node) ? [ 4, hs.nextFrame() ] : [ 2 ];

case 3:
s.sent();
if (!(e = hs.skinInfo.setupBtnSkinInfo)) return [ 2 ];
n = hs.skinInfo.skinEnabled;
t.spNode.node.active = n;
t.defaultNd.active = !n;
i = t.node;
(o = i.getComponent(hs.SkinSetupBtnComponent)) && o.setState({
colorData: e
});
return [ 2 ];
}
});
});
};
e.prototype.onSkinSetLayerRender = function(t) {
var e, n, i, o, s, c, l;
return r(this, void 0, void 0, function() {
var r, h, p, u, d, f, S, k, y, _, v, g, m, b, I, w, C, D, T, B, L, N, P;
return a(this, function(a) {
switch (a.label) {
case 0:
return t && cc.isValid(t.node) ? hs.skinLoadInfo.skinResLoadedBarrier.isOpen ? [ 3, 2 ] : [ 4, hs.skinLoadInfo.skinResLoadedBarrier.wait() ] : [ 2 ];

case 1:
a.sent();
a.label = 2;

case 2:
if (!(r = hs.skinInfo.setupSkinInfo)) return [ 2 ];
this.loadSkinSetLayer(t);
h = r.setup_outer_frame, p = r.setup_inner_frame, u = r.setup_close_btn, d = r.skin_setup_msg;
f = hs.skinInfo.skinEnabled;
if (S = null === (e = t.out_bg) || void 0 === e ? void 0 : e.getChildByName("SkinSetLayerOuterFrame")) {
S.x = 0;
S.y = 0;
S.width = 930;
S.height = 1405;
(k = S.getComponent(hs.SkinSetupBgOuterFrameComponent)) && k.setState({
colorData: h
});
S.active = f;
}
(y = null === (n = t.out_bg) || void 0 === n ? void 0 : n.getComponent(cc.Sprite)) && (y.enabled = !f);
(_ = null === (i = t.in_bg) || void 0 === i ? void 0 : i.getComponent(cc.Sprite)) && (_.enabled = !f);
if (v = null === (o = t.in_bg) || void 0 === o ? void 0 : o.getChildByName("SkinSetLayerInnerFrame")) {
v.x = 0;
v.y = 0;
v.width = 800;
v.height = 995;
(g = v.getComponent(hs.SkinSetupBgInnerFrameComponent)) && g.setState({
colorData: p
});
v.active = f;
}
m = t.close_bg;
b = null == m ? void 0 : m.parent;
if (I = null == b ? void 0 : b.getChildByName("SkinSetLayerCloseBtn")) {
I.width = null == m ? void 0 : m.width;
I.height = null == m ? void 0 : m.height;
I.scale = null == m ? void 0 : m.scale;
(w = I.getComponent(hs.SkinSetupCloseBtnComponent)) && w.setState({
colorData: u
});
I.active = f;
}
m && (m.active = !f);
C = t.top_title.node;
if (D = C.parent.getChildByName("SkinSetLayerTitle")) {
(P = D.getComponent(hs.SkinSetupDescComponent)) && P.setState({
colorData: d,
text: "Skin",
fontSize: 58
});
D.position = C.position;
D.active = f;
}
C && (C.active = !f);
T = t.share_desc_txt.node;
if (B = T.parent.getChildByName("SkinSetLayerShareDesc")) {
(P = B.getComponent(hs.SkinSetupDescComponent)) && P.setState({
colorData: d,
text: null === (s = t.share_desc_txt) || void 0 === s ? void 0 : s.string,
fontSize: 42
});
B.x = T.x;
B.y = T.y - 20;
B.active = f;
}
T && (T.active = !f);
L = t.bottom_desc_txt.node;
if (N = null === (c = t.bottom_desc) || void 0 === c ? void 0 : c.getChildByName("SkinSetLayerUnlockDesc")) {
(P = N.getComponent(hs.SkinSetupDescComponent)) && P.setState({
colorData: d,
text: null === (l = t.bottom_desc_txt) || void 0 === l ? void 0 : l.string,
fontSize: 42
});
N.x = L.x;
N.y = L.y - 20;
N.active = f;
P.descLabel.node.width = L.width;
P.descLabel.node.height = L.height;
P.descLabel.overflow = t.bottom_desc_txt.overflow;
P.descLabel.verticalAlign = t.bottom_desc_txt.verticalAlign;
P.descLabel.horizontalAlign = t.bottom_desc_txt.horizontalAlign;
}
L && (L.active = !f);
return [ 2 ];
}
});
});
};
e.prototype.loadSkinSetLayer = function(t) {
var e, n, i, o, s, r = t.node, a = hs.skinInfo.setupSkinInfo;
if (r && t && a) {
var c = hs.skinLoadInfo.skinResList, l = c.setupBgOuter, h = c.setupBgInner, p = c.setupCloseBtn, u = c.setupDesc, d = l.asset, f = null === (e = t.out_bg) || void 0 === e ? void 0 : e.getChildByName("SkinSetLayerOuterFrame");
if (!f && d) {
(f = cc.instantiate(d)).name = "SkinSetLayerOuterFrame";
null === (n = t.out_bg) || void 0 === n || n.addChild(f);
}
var S = h.asset, k = null === (i = t.in_bg) || void 0 === i ? void 0 : i.getChildByName("SkinSetLayerInnerFrame");
if (!k && S) {
(k = cc.instantiate(S)).name = "SkinSetLayerInnerFrame";
null === (o = t.in_bg) || void 0 === o || o.addChild(k);
}
var y = p.asset, _ = null === (s = t.close_bg) || void 0 === s ? void 0 : s.parent, v = null == _ ? void 0 : _.getChildByName("SkinSetLayerCloseBtn");
if (!v && y) {
(v = cc.instantiate(y)).name = "SkinSetLayerCloseBtn";
_.addChild(v);
v.zIndex = -97;
}
var g = u.asset, m = t.top_title.node.parent, b = m.getChildByName("SkinSetLayerTitle");
if (!b) {
(b = cc.instantiate(g)).name = "SkinSetLayerTitle";
m.addChild(b);
}
var I = t.share_desc_txt.node.parent, w = I.getChildByName("SkinSetLayerShareDesc");
if (!w) {
(w = cc.instantiate(g)).name = "SkinSetLayerShareDesc";
I.addChild(w);
}
var C = t.bottom_desc, D = C.getChildByName("SkinSetLayerUnlockDesc");
if (!D) {
(D = cc.instantiate(g)).name = "SkinSetLayerUnlockDesc";
C.addChild(D);
}
}
};
return s([ classId("SkinSwitchTrait") ], e);
}(Trait);
n.SkinSwitchTrait = u;
cc._RF.pop();
}, {
"../components/SkinBtn": "SkinBtn",
"../components/SkinListScripts": "SkinListScripts",
"../config/SkinSwitchTraitsPrefabConfig": "SkinSwitchTraitsPrefabConfig",
"../vo/SkinSwitchTraitInfo": "SkinSwitchTraitInfo"
} ],
SkinUpItemScrpts: [ function(t, e, n) {
"use strict";
cc._RF.push(e, "cd8e23wJW5FxrdNZ3LOvVLQ", "SkinUpItemScrpts");
var i, o = this && this.__extends || (i = function(t, e) {
return (i = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, e);
}, function(t, e) {
i(t, e);
function n() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (n.prototype = e.prototype, new n());
}), s = this && this.__decorate || function(t, e, n, i) {
var o, s = arguments.length, r = s < 3 ? e : null === i ? i = Object.getOwnPropertyDescriptor(e, n) : i;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) r = Reflect.decorate(t, e, n, i); else for (var a = t.length - 1; a >= 0; a--) (o = t[a]) && (r = (s < 3 ? o(r) : s > 3 ? o(e, n, r) : o(e, n)) || r);
return s > 3 && r && Object.defineProperty(e, n, r), r;
};
Object.defineProperty(n, "__esModule", {
value: !0
});
var r = t("./SkinItemScrpts"), a = cc._decorator, c = a.ccclass, l = a.property, h = function(t) {
o(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.contentNode = null;
e.skinItemPrefab = null;
e.skinItemNoNamePrefab = null;
return e;
}
e.prototype.renderItem = function(t) {
if (t && !(t.length <= 0)) {
this.node.active = !0;
var e = this.skinItemPrefab;
this.getIsNoname() && (e = this.skinItemNoNamePrefab);
if (this.contentNode.childrenCount <= 0) for (var n = 0; n < t.length; n++) {
var i = t[n], o = cc.instantiate(e);
this.contentNode.addChild(o);
o.getComponent(r.default).setState({
skinData: i[0],
enterType: i[1]
});
} else for (n = 0; n < this.contentNode.childrenCount; n++) {
var s = this.contentNode.children[n];
if (i = t[n]) {
s.active = !0;
s.getComponent(r.default).setState({
skinData: i[0],
enterType: i[1]
});
} else s.active = !1;
}
}
};
e.prototype.getIsNoname = function() {
return !1;
};
e.prototype.render = function() {};
s([ l(cc.Node) ], e.prototype, "contentNode", void 0);
s([ l(cc.Prefab) ], e.prototype, "skinItemPrefab", void 0);
s([ l(cc.Prefab) ], e.prototype, "skinItemNoNamePrefab", void 0);
return s([ classId("SkinUpItemScrpts"), c, classMethodWatch() ], e);
}(hs.Component);
n.default = h;
cc._RF.pop();
}, {
"./SkinItemScrpts": "SkinItemScrpts"
} ]
}, {}, [ "SkinBtn", "SkinItemScrpts", "SkinListScripts", "SkinShaderChangeSkinBtn", "SkinUpItemScrpts", "SkinSwitchTraitsPrefabConfig", "SkinSwitchTrait", "SkinSwitchTraitInfo" ]);
//# sourceMappingURL=index.js.map
