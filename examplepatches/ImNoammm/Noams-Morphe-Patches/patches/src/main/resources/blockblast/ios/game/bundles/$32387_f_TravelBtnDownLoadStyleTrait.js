window.__require = function t(e, i, a) {
function r(n, s) {
if (!i[n]) {
if (!e[n]) {
var c = n.split("/");
c = c[c.length - 1];
if (!e[c]) {
var p = "function" == typeof __require && __require;
if (!s && p) return p(c, !0);
if (o) return o(c, !0);
throw new Error("Cannot find module '" + n + "'");
}
n = c;
}
var l = i[n] = {
exports: {}
};
e[n][0].call(l.exports, function(t) {
return r(e[n][1][t] || t);
}, l, l.exports, t, e, i, a);
}
return i[n].exports;
}
for (var o = "function" == typeof __require && __require, n = 0; n < a.length; n++) r(a[n]);
return r;
}({
$32387_f_TravelBtnDownLoadStyleTrait: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "90034/1vRdLAIMbDfZu9QOu", "$32387_f_TravelBtnDownLoadStyleTrait");
var a, r = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
a(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), o = this && this.__decorate || function(t, e, i, a) {
var r, o = arguments.length, n = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, i) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, i, a); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (n = (o < 3 ? r(n) : o > 3 ? r(e, i, n) : r(e, i)) || n);
return o > 3 && n && Object.defineProperty(e, i, n), n;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
i.$32387_f_TravelBtnDownLoadStyleTrait = void 0;
var n = t("../componets/ParticleController"), s = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e._listenerInstalled = !1;
e._comp = null;
e._loadingNode = null;
e._particleCtr = null;
return e;
}
e.prototype.ensureJourneyLoadingPrefab = function() {
var t = this;
try {
if (!this._comp || !this._comp.node || !cc.isValid(this._comp.node)) return;
if (this._loadingNode && cc.isValid(this._loadingNode)) return;
hs.ResLoader.loadByBundle("$32387_f_TravelBtnDownLoadStyleTrait", "prefab/btn_JourneyLoading", cc.Prefab, function(e, i) {
if (e) ; else if (i && cc.isValid(t._comp.node)) {
var a = cc.instantiate(i);
t._loadingNode = a;
a.parent = t._comp.node;
a.x = 0;
a.y = 0;
a.active = !1;
var r = t._comp.node.getComponent(cc.Sprite), o = a.getComponent(cc.Sprite);
r && o && (o.spriteFrame = r.spriteFrame);
a.setSiblingIndex(0);
t._particleCtr = a.getComponent(n.default);
t._particleCtr && (t._particleCtr.isLooping = !1);
}
});
} catch (t) {}
};
e.prototype.updateParticleByProgress = function(t, e) {
var i;
if (this._particleCtr && !(e <= 0)) {
var a = Math.max(0, Math.min(1, t / e));
(null === (i = this._particleCtr.node) || void 0 === i ? void 0 : i.active) || (this._particleCtr.node.active = !0);
this._particleCtr.isLooping = !1;
this._particleCtr.setAnimationDuration(Math.max(.5, 3 * a));
this._particleCtr.setAnimationRange(a);
}
};
e.prototype.onActive = function(t) {
var e = this;
if (hs.tp.isHomePageSectionChapterBtnDefaultAddResToJourneyBtn(t)) {
this._comp = t.target;
this.ensureJourneyLoadingPrefab();
}
if (hs.tp.isHomePageSectionChapterBtnDefaultOnClick(t)) try {
var i = new hs.E_ChapterConfig_Load(function(t) {
try {
if (!e._comp || !e._comp.node || !cc.isValid(e._comp.node)) return;
var i = t || {
loadedCount: 0,
totalCount: 0
}, a = i.loadedCount, r = i.totalCount;
if (r > 0) {
e._comp.setState({
isRemoteLoad: !0,
loadingAnim: {
progress: a,
totalCount: r,
playAnim: !0
}
});
e.updateParticleByProgress(a, r);
}
} catch (t) {}
}, function() {
e._comp && e._comp.node && cc.isValid(e._comp.node) && e._comp.setState({
isRemoteLoad: !1
});
if (e._particleCtr) {
e._particleCtr.setAnimationRange(0);
e._particleCtr.setAnimationDuration(.5);
}
});
hs.EventManager.dispatchModuleEventAsync(i).then(function() {
e._comp && e._comp.node && cc.isValid(e._comp.node) && e._comp.setState({
isRemoteLoad: !1,
loadingAnim: {
progress: 0,
totalCount: 0,
playAnim: !1
}
});
if (e._particleCtr) {
e._particleCtr.setAnimationRange(1);
e._particleCtr.setAnimationDuration(.8);
}
});
} catch (t) {}
if (hs.tp.isHomePageSectionChapterBtnDefaultNextPeriodsComplete(t)) {
this._comp && this._comp.node && cc.isValid(this._comp.node) && this._comp.setState({
isRemoteLoad: !1
});
if (this._loadingNode && cc.isValid(this._loadingNode)) {
this._loadingNode.destroy();
this._loadingNode = null;
this._particleCtr = null;
}
}
};
return o([ classId("$32387_f_TravelBtnDownLoadStyleTrait") ], e);
}(Trait);
i.$32387_f_TravelBtnDownLoadStyleTrait = s;
cc._RF.pop();
}, {
"../componets/ParticleController": "ParticleController"
} ],
ParticleController: [ function(t, e, i) {
"use strict";
cc._RF.push(e, "bcc81HNPWFOV6d0odIoYiO0", "ParticleController");
var a, r = this && this.__extends || (a = function(t, e) {
return (a = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var i in e) Object.prototype.hasOwnProperty.call(e, i) && (t[i] = e[i]);
})(t, e);
}, function(t, e) {
a(t, e);
function i() {
this.constructor = t;
}
t.prototype = null === e ? Object.create(e) : (i.prototype = e.prototype, new i());
}), o = this && this.__decorate || function(t, e, i, a) {
var r, o = arguments.length, n = o < 3 ? e : null === a ? a = Object.getOwnPropertyDescriptor(e, i) : a;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) n = Reflect.decorate(t, e, i, a); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (n = (o < 3 ? r(n) : o > 3 ? r(e, i, n) : r(e, i)) || n);
return o > 3 && n && Object.defineProperty(e, i, n), n;
};
Object.defineProperty(i, "__esModule", {
value: !0
});
var n = t("../../../../../scripts/base/components/Component"), s = cc._decorator, c = s.ccclass, p = s.property, l = function(t) {
r(e, t);
function e() {
var e = null !== t && t.apply(this, arguments) || this;
e.particleMaterial = null;
e.isLooping = !0;
e.time = 0;
e.flowSpeed = 1;
e.flowDirection = 1;
e.currentDecayEnd = 0;
e.displayedDecayEnd = 0;
e.lastTargetDecayEnd = 0;
e.isTransitioning = !1;
e.transitionStartDecayEnd = 0;
e.transitionTime = 0;
e.transitionDuration = 0;
e.transitionSpeed = .6;
e.animationDuration = 3;
e.animationTime = 0;
return e;
}
e.prototype.onLoad = function() {
var t = this.getComponent(cc.Sprite);
if (t && t.getMaterial(0)) {
this.particleMaterial = t.getMaterial(0);
this.updateAspectRatio();
}
};
e.prototype.updateAspectRatio = function() {
if (this.particleMaterial) {
var t = this.node, e = t.width / t.height;
this.particleMaterial.setProperty("u_aspectRatio", e);
}
};
e.prototype.start = function() {
if (this.particleMaterial) {
this.particleMaterial.setProperty("u_dotSize", .008);
this.particleMaterial.setProperty("u_dotSpacing", .016);
this.particleMaterial.setProperty("u_colorStart", [ 1, 1, 1, 1 ]);
this.particleMaterial.setProperty("u_colorEnd", [ 1, 1, 1, 1 ]);
this.particleMaterial.setProperty("u_decayStart", 0);
this.particleMaterial.setProperty("u_decayEnd", 0);
this.particleMaterial.setProperty("u_decayPower", 1);
this.updateAspectRatio();
}
if (this.particleMaterial) {
this.setAnimationSpeed(2);
this.setAnimationAmplitude(.05);
}
};
e.prototype.setAnimationSpeed = function(t) {
this.particleMaterial && this.particleMaterial.setProperty("u_animSpeed", Math.max(0, t));
};
e.prototype.setAnimationAmplitude = function(t) {
this.particleMaterial && this.particleMaterial.setProperty("u_animAmplitude", Math.max(0, t));
};
e.prototype.update = function(t) {
this.animationTime += t;
this.time += t * this.flowSpeed * this.flowDirection;
if (this.particleMaterial) {
this.particleMaterial.setProperty("u_time", this.time);
this.updateCyclicDecayAnimation(t);
}
};
e.prototype.updateCyclicDecayAnimation = function(t) {
if (this.particleMaterial) {
var e = this.getCurrentDecayEnd() || 0;
if (Math.abs(e - this.lastTargetDecayEnd) > 1e-4) {
this.isTransitioning = !0;
this.transitionStartDecayEnd = this.displayedDecayEnd;
var i = Math.abs(e - this.transitionStartDecayEnd);
this.transitionDuration = Math.max(.001, i / Math.max(.001, this.transitionSpeed));
this.transitionTime = 0;
this.lastTargetDecayEnd = e;
}
if (this.isTransitioning) {
this.transitionTime += Math.max(0, t);
var a = Math.min(1, this.transitionTime / this.transitionDuration);
this.displayedDecayEnd = this.transitionStartDecayEnd + (this.lastTargetDecayEnd - this.transitionStartDecayEnd) * a;
if (a >= 1) {
this.displayedDecayEnd = this.lastTargetDecayEnd;
this.isTransitioning = !1;
}
} else this.displayedDecayEnd = this.lastTargetDecayEnd;
this.particleMaterial.setProperty("u_decayStart", 0);
this.particleMaterial.setProperty("u_decayEnd", Math.max(0, Math.min(1, this.displayedDecayEnd)));
this.particleMaterial.setProperty("u_decayPower", 2);
this.displayedDecayEnd >= 1 && this.node.destroy();
}
};
e.prototype.updateFlowingDecay = function() {
if (this.particleMaterial) {
var t = .5 + .1 * Math.sin(2 * this.time);
this.particleMaterial.setProperty("u_decayEnd", Math.max(.3, Math.min(.7, t)));
}
};
e.prototype.setDotSize = function(t) {
this.particleMaterial && this.particleMaterial.setProperty("u_dotSize", t);
};
e.prototype.setDotSpacing = function(t) {
this.particleMaterial && this.particleMaterial.setProperty("u_dotSpacing", t);
};
e.prototype.setColors = function(t, e) {
if (this.particleMaterial) {
this.particleMaterial.setProperty("u_colorStart", [ t.x, t.y, t.z, t.w ]);
this.particleMaterial.setProperty("u_colorEnd", [ e.x, e.y, e.z, e.w ]);
}
};
e.prototype.setDecayRange = function(t, e, i) {
void 0 === i && (i = 1);
if (this.particleMaterial) {
this.particleMaterial.setProperty("u_decayStart", t);
this.currentDecayEnd = e;
this.particleMaterial.setProperty("u_decayEnd", e);
this.particleMaterial.setProperty("u_decayPower", i);
}
};
e.prototype.setDiamondDecayIntensity = function(t) {
void 0 === t && (t = 1);
this.particleMaterial && this.particleMaterial.setProperty("u_decayPower", t);
};
e.prototype.setFlowAnimation = function(t, e) {
void 0 === t && (t = 1);
void 0 === e && (e = 1);
this.flowSpeed = t;
this.flowDirection = e;
};
e.prototype.setFlowEnabled = function(t) {
if (t) this.flowSpeed = 1; else {
this.flowSpeed = 0;
this.particleMaterial && this.particleMaterial.setProperty("u_decayEnd", this.currentDecayEnd);
}
};
e.prototype.refreshAspectRatio = function() {
this.updateAspectRatio();
};
e.prototype.setAnimationDuration = function(t) {
this.animationDuration = Math.max(.5, t);
};
e.prototype.resetAnimation = function() {
this.animationTime = 0;
};
e.prototype.pauseAnimation = function() {
this.flowSpeed = 0;
};
e.prototype.resumeAnimation = function() {
this.flowSpeed = 1;
};
e.prototype.setAnimationProgress = function(t) {
this.animationTime = t * this.animationDuration;
};
e.prototype.getCurrentDecayEnd = function() {
return this.currentDecayEnd;
};
e.prototype.setAnimationRange = function(t) {
this.currentDecayEnd = Math.max(0, Math.min(1, t));
};
o([ p(cc.Material) ], e.prototype, "particleMaterial", void 0);
o([ p() ], e.prototype, "isLooping", void 0);
return o([ c ], e);
}(n.default);
i.default = l;
cc._RF.pop();
}, {
"../../../../../scripts/base/components/Component": void 0
} ]
}, {}, [ "ParticleController", "$32387_f_TravelBtnDownLoadStyleTrait" ]);
//# sourceMappingURL=index.js.map
