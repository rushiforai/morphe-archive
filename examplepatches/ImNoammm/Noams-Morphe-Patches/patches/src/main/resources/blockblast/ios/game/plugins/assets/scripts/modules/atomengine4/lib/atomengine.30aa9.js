!function(t, e) {
"object" == typeof exports && "undefined" != typeof module ? e(exports) : "function" == typeof define && define.amd ? define([ "exports" ], e) : e((t = "undefined" != typeof globalThis ? globalThis : t || self).ae = {});
}(this, function(t) {
"use strict";
var e = function(t, n) {
return (e = Object.setPrototypeOf || {
__proto__: []
} instanceof Array && function(t, e) {
t.__proto__ = e;
} || function(t, e) {
for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && (t[n] = e[n]);
})(t, n);
};
function n(t, n) {
if ("function" != typeof n && null !== n) throw new TypeError("Class extends value " + String(n) + " is not a constructor or null");
function o() {
this.constructor = t;
}
e(t, n), t.prototype = null === n ? Object.create(n) : (o.prototype = n.prototype, 
new o());
}
var o, r, i = function() {
return (i = Object.assign || function(t) {
for (var e, n = 1, o = arguments.length; n < o; n++) for (var r in e = arguments[n]) Object.prototype.hasOwnProperty.call(e, r) && (t[r] = e[r]);
return t;
}).apply(this, arguments);
};
function a(t, e) {
var n = {};
for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && e.indexOf(o) < 0 && (n[o] = t[o]);
if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
var r = 0;
for (o = Object.getOwnPropertySymbols(t); r < o.length; r++) e.indexOf(o[r]) < 0 && Object.prototype.propertyIsEnumerable.call(t, o[r]) && (n[o[r]] = t[o[r]]);
}
return n;
}
function s(t, e, n, o) {
var r, i = arguments.length, a = i < 3 ? e : null === o ? o = Object.getOwnPropertyDescriptor(e, n) : o;
if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) a = Reflect.decorate(t, e, n, o); else for (var s = t.length - 1; s >= 0; s--) (r = t[s]) && (a = (i < 3 ? r(a) : i > 3 ? r(e, n, a) : r(e, n)) || a);
return i > 3 && a && Object.defineProperty(e, n, a), a;
}
function l(t, e) {
if ("object" == typeof Reflect && "function" == typeof Reflect.metadata) return Reflect.metadata(t, e);
}
function u(t, e, n, o) {
return new (n || (n = Promise))(function(r, i) {
function a(t) {
try {
l(o.next(t));
} catch (t) {
i(t);
}
}
function s(t) {
try {
l(o.throw(t));
} catch (t) {
i(t);
}
}
function l(t) {
var e;
t.done ? r(t.value) : (e = t.value, e instanceof n ? e : new n(function(t) {
t(e);
})).then(a, s);
}
l((o = o.apply(t, e || [])).next());
});
}
function c(t, e) {
var n, o, r, i = {
label: 0,
sent: function() {
if (1 & r[0]) throw r[1];
return r[1];
},
trys: [],
ops: []
}, a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
return this;
}), a;
function s(s) {
return function(l) {
return function(s) {
if (n) throw new TypeError("Generator is already executing.");
for (;a && (a = 0, s[0] && (i = 0)), i; ) try {
if (n = 1, o && (r = 2 & s[0] ? o.return : s[0] ? o.throw || ((r = o.return) && r.call(o), 
0) : o.next) && !(r = r.call(o, s[1])).done) return r;
switch (o = 0, r && (s = [ 2 & s[0], r.value ]), s[0]) {
case 0:
case 1:
r = s;
break;

case 4:
return i.label++, {
value: s[1],
done: !1
};

case 5:
i.label++, o = s[1], s = [ 0 ];
continue;

case 7:
s = i.ops.pop(), i.trys.pop();
continue;

default:
if (!((r = (r = i.trys).length > 0 && r[r.length - 1]) || 6 !== s[0] && 2 !== s[0])) {
i = 0;
continue;
}
if (3 === s[0] && (!r || s[1] > r[0] && s[1] < r[3])) {
i.label = s[1];
break;
}
if (6 === s[0] && i.label < r[1]) {
i.label = r[1], r = s;
break;
}
if (r && i.label < r[2]) {
i.label = r[2], i.ops.push(s);
break;
}
r[2] && i.ops.pop(), i.trys.pop();
continue;
}
s = e.call(t, i);
} catch (t) {
s = [ 6, t ], o = 0;
} finally {
n = r = 0;
}
if (5 & s[0]) throw s[1];
return {
value: s[0] ? s[1] : void 0,
done: !0
};
}([ s, l ]);
};
}
}
function d(t) {
var e = "function" == typeof Symbol && Symbol.iterator, n = e && t[e], o = 0;
if (n) return n.call(t);
if (t && "number" == typeof t.length) return {
next: function() {
return t && o >= t.length && (t = void 0), {
value: t && t[o++],
done: !t
};
}
};
throw new TypeError(e ? "Object is not iterable." : "Symbol.iterator is not defined.");
}
function h(t, e) {
var n = "function" == typeof Symbol && t[Symbol.iterator];
if (!n) return t;
var o, r, i = n.call(t), a = [];
try {
for (;(void 0 === e || e-- > 0) && !(o = i.next()).done; ) a.push(o.value);
} catch (t) {
r = {
error: t
};
} finally {
try {
o && !o.done && (n = i.return) && n.call(i);
} finally {
if (r) throw r.error;
}
}
return a;
}
function p(t, e, n) {
if (n || 2 === arguments.length) for (var o, r = 0, i = e.length; r < i; r++) !o && r in e || (o || (o = Array.prototype.slice.call(e, 0, r)), 
o[r] = e[r]);
return t.concat(o || Array.prototype.slice.call(e));
}
"function" == typeof SuppressedError && SuppressedError, function(t) {
t[t.BindAtomDuplicate = 1010] = "BindAtomDuplicate", t[t.VariantOfDuplicate = 1011] = "VariantOfDuplicate", 
t[t.AttachToDuplicate = 1012] = "AttachToDuplicate", t[t.EntityRendererDuplicate = 1013] = "EntityRendererDuplicate", 
t[t.OnChainDuplicate = 1014] = "OnChainDuplicate", t[t.RouteFromDuplicate = 1015] = "RouteFromDuplicate", 
t[t.RouteToDuplicate = 1016] = "RouteToDuplicate", t[t.OrderDecoratorDuplicate = 1017] = "OrderDecoratorDuplicate", 
t[t.BindAtomRequired = 1020] = "BindAtomRequired", t[t.DomainBindingRequired = 1021] = "DomainBindingRequired", 
t[t.RouteEndpointRequired = 1022] = "RouteEndpointRequired", t[t.OrderTargetRequired = 1023] = "OrderTargetRequired", 
t[t.AttachToRequired = 1024] = "AttachToRequired", t[t.OnChainRequired = 1025] = "OnChainRequired", 
t[t.RoutePhaseRequired = 1026] = "RoutePhaseRequired", t[t.BindAtomTypeNotAllowed = 1030] = "BindAtomTypeNotAllowed", 
t[t.DomainTargetInvalid = 1031] = "DomainTargetInvalid", t[t.OrderTargetTypeInvalid = 1032] = "OrderTargetTypeInvalid", 
t[t.VariantOfNotVariantAtom = 1033] = "VariantOfNotVariantAtom", t[t.AttachToNotExtensionAtom = 1034] = "AttachToNotExtensionAtom", 
t[t.EntityDataNotLogicAtom = 1035] = "EntityDataNotLogicAtom", t[t.OnChainNotLogicAtom = 1036] = "OnChainNotLogicAtom", 
t[t.OnChainTargetNotChainable = 1037] = "OnChainTargetNotChainable", t[t.SignalStartConflict = 1040] = "SignalStartConflict", 
t[t.SignalEndConflict = 1041] = "SignalEndConflict", t[t.RouteReceiveConflict = 1042] = "RouteReceiveConflict", 
t[t.RouteDispatchConflict = 1043] = "RouteDispatchConflict", t[t.RouteTransformConflict = 1044] = "RouteTransformConflict", 
t[t.RouteFilterConflict = 1045] = "RouteFilterConflict", t[t.ReservedPropertyConflict = 1050] = "ReservedPropertyConflict", 
t[t.StorageReplaceDenied = 3010] = "StorageReplaceDenied", t[t.StorageDeleteDenied = 3011] = "StorageDeleteDenied", 
t[t.RoutePhaseOutOfScope = 3012] = "RoutePhaseOutOfScope", t[t.RoutePhasePropertyDenied = 3013] = "RoutePhasePropertyDenied", 
t[t.ChainBindingRequired = 3014] = "ChainBindingRequired", t[t.ChainPhaseOutOfScope = 3015] = "ChainPhaseOutOfScope", 
t[t.EntityDestroyDenied = 3018] = "EntityDestroyDenied", t[t.BoundaryBindingForbidden = 4010] = "BoundaryBindingForbidden", 
t[t.OrderScopeConflict = 4020] = "OrderScopeConflict", t[t.SignalDomainConflict = 4021] = "SignalDomainConflict", 
t[t.SelfBinding = 4030] = "SelfBinding", t[t.TransformEidInvalid = 5010] = "TransformEidInvalid", 
t[t.BroadcastFilterForbidden = 5011] = "BroadcastFilterForbidden", t[t.EntityDataConfigInvalid = 5012] = "EntityDataConfigInvalid", 
t[t.WorldFeaturesEmpty = 5013] = "WorldFeaturesEmpty", t[t.WorldEntityNoId = 5014] = "WorldEntityNoId", 
t[t.GraphicsRequired = 5015] = "GraphicsRequired", t[t.DownloadOnlyRootWorld = 5016] = "DownloadOnlyRootWorld", 
t[t.FeatureGalaxyAmbiguous = 5017] = "FeatureGalaxyAmbiguous", t[t.RenderGroupAssign = 6011] = "RenderGroupAssign", 
t[t.RenderPropertyNotExist = 6012] = "RenderPropertyNotExist", t[t.RenderEventNotRegistered = 6013] = "RenderEventNotRegistered", 
t[t.AtomClassNotRegistered = 7010] = "AtomClassNotRegistered", t[t.AtomInstanceNotFound = 7011] = "AtomInstanceNotFound", 
t[t.AtomTypeQueryFailed = 7012] = "AtomTypeQueryFailed", t[t.TopologicalConflict = 7020] = "TopologicalConflict", 
t[t.TopologicalCycle = 7021] = "TopologicalCycle", t[t.PriorityConstraintDuplicate = 7030] = "PriorityConstraintDuplicate", 
t[t.DomainRenderNotRegistered = 7040] = "DomainRenderNotRegistered", t[t.DomainRenderNoMatch = 7041] = "DomainRenderNoMatch", 
t[t.InheritanceForbidden = 8010] = "InheritanceForbidden", t[t.AtomClassParamMissing = 8011] = "AtomClassParamMissing", 
t[t.AtomNameInvalid = 8012] = "AtomNameInvalid", t[t.UnsupportedNodeType = 8013] = "UnsupportedNodeType", 
t[t.WarnSignalDomainCollect = 9010] = "WarnSignalDomainCollect", t[t.WarnRootControlledProperty = 9011] = "WarnRootControlledProperty";
}(r || (r = {}));
var f, m = ((o = {})[r.BindAtomDuplicate] = "同一原子被多个属性绑定", o[r.VariantOfDuplicate] = "@variantOf 重复标记", 
o[r.AttachToDuplicate] = "@attachTo 重复标记", o[r.EntityRendererDuplicate] = "@entityRenderer 重复标记", 
o[r.OnChainDuplicate] = "@onChain 重复标记", o[r.RouteFromDuplicate] = "@routeFrom 重复标记", 
o[r.RouteToDuplicate] = "@routeTo 重复标记", o[r.OrderDecoratorDuplicate] = "排序装饰器重复标记", 
o[r.BindAtomRequired] = "装饰器需要配合 @bindAtom 使用", o[r.DomainBindingRequired] = "SignalAtom 必须恰好绑定一个 EntityDomainAtom", 
o[r.RouteEndpointRequired] = "SignalRouterAtom 缺少 @routeFrom 或 @routeTo", o[r.OrderTargetRequired] = "OrderAtom 缺少 @orderBefore 或 @orderAfter", 
o[r.AttachToRequired] = "DomainExtensionAtom 必须声明 @attachTo", o[r.OnChainRequired] = "LogicAtom 必须声明 @onChain", 
o[r.RoutePhaseRequired] = "@onChain 绑定路由器时必须指定路由阶段装饰器", o[r.BindAtomTypeNotAllowed] = "@bindAtom 绑定的原子类型不允许", 
o[r.DomainTargetInvalid] = "装饰器目标必须是 EntityDomainAtom", o[r.OrderTargetTypeInvalid] = "排序目标必须是 LogicAtom / RenderAtom / SignalRouterAtom / VariantAtom", 
o[r.VariantOfNotVariantAtom] = "@variantOf 仅限 VariantAtom 使用", o[r.AttachToNotExtensionAtom] = "@attachTo 仅限 DomainExtensionAtom 使用", 
o[r.EntityDataNotLogicAtom] = "@entityData 仅限 LogicAtom 使用", o[r.OnChainNotLogicAtom] = "@onChain 仅限 LogicAtom 使用", 
o[r.OnChainTargetNotChainable] = "@onChain 目标必须是可链接原子类型", o[r.SignalStartConflict] = "@signalStart 与已有阶段冲突", 
o[r.SignalEndConflict] = "@signalEnd 与已有阶段冲突", o[r.RouteReceiveConflict] = "@routeReceive 与已有路由阶段冲突", 
o[r.RouteDispatchConflict] = "@routeDispatch 与已有路由阶段冲突", o[r.RouteTransformConflict] = "@routeTransform 与已有路由阶段冲突", 
o[r.RouteFilterConflict] = "@routeFilter 与已有路由阶段冲突", o[r.ReservedPropertyConflict] = "@bindAtom 属性名与基类保留属性冲突", 
o[r.StorageReplaceDenied] = "禁止整体替换 runtime/storage，请修改具体字段", o[r.StorageDeleteDenied] = "禁止删除 runtime/storage", 
o[r.RoutePhaseOutOfScope] = "不在路由执行阶段内，禁止写入", o[r.RoutePhasePropertyDenied] = "当前路由阶段不允许写入此属性", 
o[r.ChainBindingRequired] = "需要 @onChain 声明才能修改", o[r.ChainPhaseOutOfScope] = "不在生成链执行阶段内，禁止修改", 
o[r.EntityDestroyDenied] = "实体不在当前域查询范围内，禁止销毁", o[r.BoundaryBindingForbidden] = "LogicAtom 禁止直接 @onChain 绑定边界原子", 
o[r.OrderScopeConflict] = "排序的两个原子不在同一执行链上", o[r.SignalDomainConflict] = "路由绑定的实体域与信号域冲突", 
o[r.SelfBinding] = "原子绑定了自身", o[r.TransformEidInvalid] = "路由转换产生了不在目标域内的实体 ID", 
o[r.BroadcastFilterForbidden] = "Broadcast 路由器禁止绑定 @routeFilter", o[r.EntityDataConfigInvalid] = "@entityData 与 defineEntityData() 必须同时使用", 
o[r.WorldFeaturesEmpty] = "世界未配置任何特性", o[r.WorldEntityNoId] = "世界实体缺少 worldId", 
o[r.GraphicsRequired] = "Graphics 组件未配置", o[r.DownloadOnlyRootWorld] = "下载专用世界不能是根世界（无父世界），会无法自动销毁导致资源泄漏", 
o[r.FeatureGalaxyAmbiguous] = "特性被配置到跨越多个非 G0 星系的世界，无法确定一致性组", o[r.RenderGroupAssign] = "渲染属性分组不能直接赋值，请设置具体子属性", 
o[r.RenderPropertyNotExist] = "渲染节点属性不存在", o[r.RenderEventNotRegistered] = "渲染事件不在标准列表中", 
o[r.AtomClassNotRegistered] = "原子类未注册", o[r.AtomInstanceNotFound] = "原子实例不存在", o[r.AtomTypeQueryFailed] = "原子类型查询失败（类未注册）", 
o[r.TopologicalConflict] = "优先级约束与已有约束冲突", o[r.TopologicalCycle] = "拓扑排序检测到循环依赖", 
o[r.PriorityConstraintDuplicate] = "重复添加相同的优先级约束", o[r.DomainRenderNotRegistered] = "域未注册渲染原子", 
o[r.DomainRenderNoMatch] = "域所有渲染变体的 renderCondition() 均不满足", o[r.InheritanceForbidden] = "原子类禁止继承", 
o[r.AtomClassParamMissing] = "@atomClass 缺少 atomName 参数", o[r.AtomNameInvalid] = "原子名不符合命名规范", 
o[r.UnsupportedNodeType] = "不支持的渲染节点类型", o[r.WarnSignalDomainCollect] = "信号执行期间禁止收集实体域", 
o[r.WarnRootControlledProperty] = "根节点受控属性被显式设置", o), v = ((f = {})[r.BindAtomDuplicate] = "error", 
f[r.VariantOfDuplicate] = "error", f[r.AttachToDuplicate] = "error", f[r.EntityRendererDuplicate] = "error", 
f[r.OnChainDuplicate] = "error", f[r.RouteFromDuplicate] = "error", f[r.RouteToDuplicate] = "error", 
f[r.OrderDecoratorDuplicate] = "error", f[r.BindAtomRequired] = "error", f[r.DomainBindingRequired] = "throw", 
f[r.RouteEndpointRequired] = "throw", f[r.OrderTargetRequired] = "throw", f[r.AttachToRequired] = "throw", 
f[r.OnChainRequired] = "throw", f[r.RoutePhaseRequired] = "throw", f[r.BindAtomTypeNotAllowed] = "error", 
f[r.DomainTargetInvalid] = "error", f[r.OrderTargetTypeInvalid] = "error", f[r.VariantOfNotVariantAtom] = "error", 
f[r.AttachToNotExtensionAtom] = "error", f[r.EntityDataNotLogicAtom] = "error", 
f[r.OnChainNotLogicAtom] = "error", f[r.OnChainTargetNotChainable] = "throw", f[r.SignalStartConflict] = "error", 
f[r.SignalEndConflict] = "error", f[r.RouteReceiveConflict] = "error", f[r.RouteDispatchConflict] = "error", 
f[r.RouteTransformConflict] = "error", f[r.RouteFilterConflict] = "error", f[r.ReservedPropertyConflict] = "error", 
f[r.StorageReplaceDenied] = "error", f[r.StorageDeleteDenied] = "error", f[r.RoutePhaseOutOfScope] = "error", 
f[r.RoutePhasePropertyDenied] = "error", f[r.ChainBindingRequired] = "error", f[r.ChainPhaseOutOfScope] = "error", 
f[r.EntityDestroyDenied] = "error", f[r.BoundaryBindingForbidden] = "error", f[r.OrderScopeConflict] = "error", 
f[r.SignalDomainConflict] = "error", f[r.SelfBinding] = "error", f[r.TransformEidInvalid] = "warn", 
f[r.BroadcastFilterForbidden] = "error", f[r.EntityDataConfigInvalid] = "error", 
f[r.WorldFeaturesEmpty] = "throw", f[r.WorldEntityNoId] = "error", f[r.GraphicsRequired] = "throw", 
f[r.DownloadOnlyRootWorld] = "throw", f[r.FeatureGalaxyAmbiguous] = "error", f[r.RenderGroupAssign] = "error", 
f[r.RenderPropertyNotExist] = "error", f[r.RenderEventNotRegistered] = "error", 
f[r.AtomClassNotRegistered] = "throw", f[r.AtomInstanceNotFound] = "throw", f[r.AtomTypeQueryFailed] = "error", 
f[r.TopologicalConflict] = "throw", f[r.TopologicalCycle] = "throw", f[r.PriorityConstraintDuplicate] = "error", 
f[r.DomainRenderNotRegistered] = "error", f[r.DomainRenderNoMatch] = "error", f[r.InheritanceForbidden] = "error", 
f[r.AtomClassParamMissing] = "error", f[r.AtomNameInvalid] = "error", f[r.UnsupportedNodeType] = "throw", 
f[r.WarnSignalDomainCollect] = "warn", f[r.WarnRootControlledProperty] = "warn", 
f);
function y(t, e, n) {
var o, r = null !== (o = null == n ? void 0 : n.action) && void 0 !== o ? o : v[t], i = function(t, e) {
var n, o, r = null !== (n = m[t]) && void 0 !== n ? n : "未知错误", i = "[AE".concat(t, "] ").concat(r), a = null !== (o = e.reason) && void 0 !== o ? o : e.context, s = Object.entries(e).filter(function(t) {
var e = h(t, 2), n = e[0];
return void 0 !== e[1] && "reason" !== n && "context" !== n;
});
if (!a && 0 === s.length) return i;
var l = [];
return s.length > 0 && l.push(s.map(function(t) {
var e = h(t, 2), n = e[0], o = e[1];
return "".concat(n, "=").concat(o);
}).join(", ")), a && l.push("→ ".concat(a)), l.length > 0 ? "".concat(i, " | ").concat(l.join(" ")) : i;
}(t, e);
if ("throw" === r) throw new Error(i);
}
function _(t) {
var e = t.atomFeatureName;
return e && "atomFeatureName" !== e ? e : void 0;
}
var g, A, C, R = new Set([ "id", "worldId", "worldIdList", "atomFeatureName", "sort", "silent", "skipLoadWorlds", "compressedBundleWorlds", "downloadOnly" ]), S = function() {
function t(t) {
var e, n, o, r, i, a, s, l;
this._rawEntriesByWorld = new Map(), this._featureSetCache = new Map(), this._skipLoadWorlds = new Set(), 
this._compressedWorldSet = new Set(), this._downloadOnlyWorldSet = new Set(), this._configOverrides = null, 
this._allEntries = t;
var u = this._expandWorldIdList(t);
this._debugInfo = {
featureCountAtCreate: t.length,
expandedEntryCountAtCreate: u.length,
downloadOnlyMarkEntryCounts: new Map()
};
try {
for (var c = d(u), h = c.next(); !h.done; h = c.next()) if ((y = h.value).worldId) {
var p = y.worldId;
y.downloadOnly && this._downloadOnlyWorldSet.add(p);
var f = this._rawEntriesByWorld.get(p);
f ? f.push(y) : this._rawEntriesByWorld.set(p, [ y ]);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
h && !h.done && (n = c.return) && n.call(c);
} finally {
if (e) throw e.error;
}
}
try {
for (var m = d(t), v = m.next(); !v.done; v = m.next()) {
var y;
if ((y = v.value).skipLoadWorlds) try {
for (var _ = (i = void 0, d(y.skipLoadWorlds)), g = _.next(); !g.done; g = _.next()) {
var A = g.value;
this._skipLoadWorlds.add(A);
}
} catch (t) {
i = {
error: t
};
} finally {
try {
g && !g.done && (a = _.return) && a.call(_);
} finally {
if (i) throw i.error;
}
}
if (y.compressedBundleWorlds) try {
for (var C = (s = void 0, d(y.compressedBundleWorlds)), R = C.next(); !R.done; R = C.next()) A = R.value, 
this._compressedWorldSet.add(A);
} catch (t) {
s = {
error: t
};
} finally {
try {
R && !R.done && (l = C.return) && l.call(C);
} finally {
if (s) throw s.error;
}
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
v && !v.done && (r = m.return) && r.call(m);
} finally {
if (o) throw o.error;
}
}
}
return t.prototype.hasFeatures = function(t) {
var e, n;
return (null !== (n = null === (e = this._rawEntriesByWorld.get(t)) || void 0 === e ? void 0 : e.length) && void 0 !== n ? n : 0) > 0;
}, t.prototype.getWorldFeaturesDebugParams = function(t) {
var e, n = this._rawEntriesByWorld.get(t), o = "", r = String(t);
r.endsWith("_WorldAtom") && (o = r.slice(0, -10)), r.endsWith("_World") && (o = r.slice(0, -6));
var i = this._debugInfo.downloadOnlyMarkEntryCounts.get(t);
return {
featureListAtCreate: this._debugInfo.featureCountAtCreate,
expandedEntriesAtCreate: this._debugInfo.expandedEntryCountAtCreate,
rawEntryCount: null !== (e = null == n ? void 0 : n.length) && void 0 !== e ? e : 0,
isDownloadOnlyWorld: this._downloadOnlyWorldSet.has(t) ? "true" : "false",
downloadOnlyMarkedAtRuntime: void 0 !== i ? "true" : "false",
rawEntryCountAtMark: i,
guessedFeatureName: o,
hasGuessedFeatureInUniverse: o ? this.hasFeatureInUniverse(o) ? "true" : "false" : void 0
};
}, t.prototype.getWorldIds = function() {
return this._rawEntriesByWorld.keys();
}, t.prototype.getFeatureSet = function(t) {
var e = this._featureSetCache.get(t);
return e || (e = this._parseFeatureSet(t), this._featureSetCache.set(t, e)), e;
}, t.prototype.getFeatureEntry = function(t, e) {
return this.getFeatureSet(t).get(e);
}, t.prototype.shouldSkipNonSilentLoadAtoms = function(t) {
return this._skipLoadWorlds.has(t);
}, t.prototype.isDownloadOnlyWorld = function(t) {
return this._downloadOnlyWorldSet.has(t);
}, t.prototype.markDownloadOnlyWorld = function(t) {
var e;
this._downloadOnlyWorldSet.add(t);
var n = this._rawEntriesByWorld.get(t);
this._debugInfo.downloadOnlyMarkEntryCounts.set(t, null !== (e = null == n ? void 0 : n.length) && void 0 !== e ? e : 0);
}, t.prototype.getUniverseFeatureNames = function() {
var t, e;
if (!this._universeFeatureNames) {
this._universeFeatureNames = new Set();
try {
for (var n = d(this._allEntries), o = n.next(); !o.done; o = n.next()) {
var r = _(o.value);
r && this._universeFeatureNames.add(r);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
o && !o.done && (e = n.return) && e.call(n);
} finally {
if (t) throw t.error;
}
}
}
return this._universeFeatureNames;
}, t.prototype.hasFeatureInUniverse = function(t) {
return this.getUniverseFeatureNames().has(t);
}, t.prototype._ensureCompressedFeatureNames = function() {
var t, e, n, o;
if (!this._compressedFeatureNames) {
this._compressedFeatureNames = new Set();
try {
for (var r = d(this._compressedWorldSet), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
try {
for (var s = (n = void 0, d(this.getFeatureSet(a).keys())), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
this._compressedFeatureNames.add(u);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
l && !l.done && (o = s.return) && o.call(s);
} finally {
if (n) throw n.error;
}
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (t) throw t.error;
}
}
}
return this._compressedFeatureNames;
}, t.prototype.isFeatureCompressed = function(t) {
return 0 !== this._compressedWorldSet.size && this._ensureCompressedFeatureNames().has(t);
}, t.prototype.markFeaturesCompressed = function(t) {
var e, n;
if (0 !== this._compressedWorldSet.size) {
var o = this._ensureCompressedFeatureNames();
try {
for (var r = d(t), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
o.add(a);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
}
}, t.prototype.getFeatureNamesForWorlds = function(t) {
var e, n, o, r, i = new Set();
try {
for (var a = d(t), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
try {
for (var u = (o = void 0, d(this.getFeatureSet(l).keys())), c = u.next(); !c.done; c = u.next()) {
var f = c.value;
i.add(f);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (r = u.return) && r.call(u);
} finally {
if (o) throw o.error;
}
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
return p([], h(i), !1);
}, t.prototype.parseGalaxy = function(t) {
var e = t.indexOf("_"), n = -1 === e ? t : t.slice(0, e);
return /^G\d+$/.test(n) ? n : void 0;
}, t.prototype.getGalaxyOfWorld = function(t) {
return this.parseGalaxy(t);
}, t.prototype.collectFeatureWorldAssociations = function() {
var t, e, n, o;
if (this._featureWorldAssoc) return this._featureWorldAssoc;
var r = new Map();
try {
for (var i = d(this._rawEntriesByWorld), a = i.next(); !a.done; a = i.next()) {
var s = h(a.value, 2), l = s[0], u = s[1];
try {
for (var c = (n = void 0, d(u)), p = c.next(); !p.done; p = c.next()) {
var f = _(p.value);
if (f) {
var m = r.get(f);
m || (m = new Set(), r.set(f, m)), m.add(l);
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
p && !p.done && (o = c.return) && o.call(c);
} finally {
if (n) throw n.error;
}
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
a && !a.done && (e = i.return) && e.call(i);
} finally {
if (t) throw t.error;
}
}
return this._featureWorldAssoc = r, r;
}, t.prototype.groupOf = function(t) {
var e, n, o = this.parseGalaxy(t), i = this.collectFeatureWorldAssociations().get(t);
if (!i || 0 === i.size) return o;
var a = !1, s = new Set();
try {
for (var l = d(i), u = l.next(); !u.done; u = l.next()) {
var c = u.value, f = this.parseGalaxy(c);
"G0" === f ? a = !0 : void 0 !== f && s.add(f);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (n = l.return) && n.call(l);
} finally {
if (e) throw e.error;
}
}
return a ? "G0" : (void 0 !== o && s.add(o), s.size > 1 && y(r.FeatureGalaxyAmbiguous, {
feature: t,
galaxies: p([], h(s), !1).join(",")
}, {
action: "error"
}), null != o ? o : p([], h(s), !1)[0]);
}, t.prototype.collectFeaturesByGroup = function() {
var t, e;
if (this._featuresByGroup) return this._featuresByGroup;
var n = new Map();
try {
for (var o = d(this.getUniverseFeatureNames()), r = o.next(); !r.done; r = o.next()) {
var i = r.value, a = this.groupOf(i);
if (void 0 !== a) {
var s = n.get(a);
s || (s = new Set(), n.set(a, s)), s.add(i);
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
r && !r.done && (e = o.return) && e.call(o);
} finally {
if (t) throw t.error;
}
}
return this._featuresByGroup = n, n;
}, t.prototype.applyOverrides = function(t, e) {
var n = this._ensureConfigOverrides().get(t);
n && this._deepMerge(e, n);
}, t.prototype._expandWorldIdList = function(t) {
var e, n, o, r, s = [];
try {
for (var l = d(t), u = l.next(); !u.done; u = l.next()) {
var c = u.value, h = c.worldIdList;
if (h && 0 !== h.length) {
c.worldIdList, c.worldId;
var p = a(c, [ "worldIdList", "worldId" ]);
try {
for (var f = (o = void 0, d(h)), m = f.next(); !m.done; m = f.next()) {
var v = m.value;
s.push(i(i({}, p), {
worldId: v
}));
}
} catch (t) {
o = {
error: t
};
} finally {
try {
m && !m.done && (r = f.return) && r.call(f);
} finally {
if (o) throw o.error;
}
}
} else s.push(c);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (n = l.return) && n.call(l);
} finally {
if (e) throw e.error;
}
}
return s;
}, t.prototype._parseFeatureSet = function(t) {
var e, n, o, r = null !== (o = this._rawEntriesByWorld.get(t)) && void 0 !== o ? o : [], i = new Map();
try {
for (var a = d(r), s = a.next(); !s.done; s = a.next()) {
var l = s.value, u = _(l);
u && i.set(u, l);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
return i;
}, t.prototype._ensureConfigOverrides = function() {
return this._configOverrides || (this._configOverrides = this._parseConfigOverrides()), 
this._configOverrides;
}, t.prototype._parseConfigOverrides = function() {
var t, e, n = [];
try {
for (var o = d(this._allEntries), r = o.next(); !r.done; r = o.next()) {
var i = r.value;
this._collectConfigEntry(i, n);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
r && !r.done && (e = o.return) && e.call(o);
} finally {
if (t) throw t.error;
}
}
n.sort(function(t, e) {
return e.sort - t.sort || e.id - t.id;
});
var a = this._mergeConfigs(n);
n.map(function(t) {
return "    id=".concat(t.id, " sort=").concat(t.sort, " ").concat(t.atomName).concat(t.path.length ? "." + t.path.join(".") : "", " = ").concat(JSON.stringify(t.value));
});
return a;
}, t.prototype._collectConfigEntry = function(t, e) {
var n = t.sort, o = void 0 === n ? 0 : n, r = t.id, i = void 0 === r ? 0 : r;
for (var a in t) if (!R.has(a) && "G" === a[0] && /_.*_/.test(a)) {
var s = a.split("."), l = s[0], u = s.slice(1), c = t[a];
e.push({
id: i,
sort: o,
atomName: l,
path: u,
value: c
});
}
}, t.prototype._mergeConfigs = function(t) {
for (var e = new Map(), n = new Map(), o = t.length - 1; o >= 0; o--) {
var r = t[o], i = r.id, a = r.atomName, s = r.path, l = r.value, u = e.get(a);
u || (u = {}, e.set(a, u));
var c = n.get(a);
c || (c = new Map(), n.set(a, c)), this._mergeAtPath(u, s, l, i, c);
}
return this._warnConflicts(n), e;
}, t.prototype._mergeAtPath = function(t, e, n, o, r) {
if (0 === e.length) n && "object" == typeof n && !Array.isArray(n) && this._deepMergeWithConflict(t, n, "", o, r); else {
for (var i = t, a = 0; a < e.length - 1; a++) {
var s = e[a];
i[s] && "object" == typeof i[s] || (i[s] = {}), i = i[s];
}
var l = e[e.length - 1], u = e.join("."), c = i[l];
n && "object" == typeof n && !Array.isArray(n) ? (c && "object" == typeof c && !Array.isArray(c) || (i[l] = {}), 
this._deepMergeWithConflict(i[l], n, u, o, r)) : (this._recordConflict(r, u, o, n), 
i[l] = n);
}
}, t.prototype._deepMergeWithConflict = function(t, e, n, o, r) {
for (var i in e) {
var a = n ? "".concat(n, ".").concat(i) : i, s = e[i], l = t[i];
s && "object" == typeof s && !Array.isArray(s) ? (l && "object" == typeof l && !Array.isArray(l) || (t[i] = {}), 
this._deepMergeWithConflict(t[i], s, a, o, r)) : (this._recordConflict(r, a, o, s), 
t[i] = s);
}
}, t.prototype._recordConflict = function(t, e, n, o) {
var r = t.get(e);
r || (r = [], t.set(e, r)), r.push({
id: n,
value: o
});
}, t.prototype._warnConflicts = function(t) {
var e, n, o, r;
try {
for (var i = d(t), a = i.next(); !a.done; a = i.next()) {
var s = h(a.value, 2), l = (s[0], s[1]);
try {
for (var u = (o = void 0, d(l)), c = u.next(); !c.done; c = u.next()) {
var p = h(c.value, 2), f = (p[0], p[1]);
f.length > 1 && f.map(function(t, e) {
return "  ".concat(e + 1, '. id="').concat(t.id, '" value=').concat(JSON.stringify(t.value));
}).join("\n");
}
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (r = u.return) && r.call(u);
} finally {
if (o) throw o.error;
}
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
}, t.prototype._deepMerge = function(t, e) {
for (var n in e) {
var o = e[n], r = t[n];
o && "object" == typeof o && !Array.isArray(o) ? (r && "object" == typeof r && !Array.isArray(r) || (t[n] = {}), 
this._deepMerge(t[n], o)) : t[n] = o;
}
}, t;
}(), T = function(t, e, n) {
return Object.defineProperty(t, e, {
value: n,
enumerable: !1,
writable: !0,
configurable: !0
});
}, b = function() {
return {
aliveCount: 0,
dense: [],
sparse: [],
maxId: 0,
versioning: !1,
versionBits: 8,
entityMask: 16777215,
versionShift: 24,
versionMask: 255 << 24
};
}, w = function(t, e) {
var n = function(t, e) {
return e & t.entityMask;
}(t, e), o = t.sparse[n];
return void 0 !== o && o < t.aliveCount && t.dense[o] === e;
}, F = Symbol.for("bitecs_internal"), E = function() {
var t = [], e = [], n = function(n) {
return t[e[n]] === n;
};
return {
add: function(o) {
n(o) || (e[o] = t.push(o) - 1);
},
remove: function(o) {
if (n(o)) {
var r = e[o], i = t.pop();
i !== o && (t[r] = i, e[i] = r);
}
},
has: n,
sparse: e,
dense: t,
reset: function() {
t.length = 0, e.length = 0;
},
sort: function(n) {
t.sort(n);
for (var o = 0; o < t.length; o++) e[t[o]] = o;
}
};
}, N = "undefined" != typeof SharedArrayBuffer ? SharedArrayBuffer : ArrayBuffer, x = function(t) {
void 0 === t && (t = 1e3);
var e = [], n = 0, o = new Uint32Array(new N(4 * t)), r = function(t) {
return t < e.length && e[t] < n && o[e[t]] === t;
};
return {
add: function(t) {
if (!r(t)) {
if (n >= o.length) {
var i = new Uint32Array(new N(8 * o.length));
i.set(o), o = i;
}
o[n] = t, e[t] = n, n++;
}
},
remove: function(t) {
if (r(t)) {
n--;
var i = e[t], a = o[n];
o[i] = a, e[a] = i;
}
},
has: r,
sparse: e,
get dense() {
return new Uint32Array(o.buffer, 0, n);
},
reset: function() {
n = 0, e.length = 0;
},
sort: function(t) {
var r = Array.from(o.subarray(0, n));
r.sort(t);
for (var i = 0; i < r.length; i++) o[i] = r[i];
for (i = 0; i < n; i++) e[o[i]] = i;
}
};
}, I = function() {
var t = new Set();
return {
subscribe: function(e) {
return t.add(e), function() {
t.delete(e);
};
},
notify: function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return Array.from(t).reduce(function(t, o) {
var r = o.apply(void 0, p([ e ], h(n), !1));
return r && "object" == typeof r ? i(i({}, t), r) : t;
}, {});
}
};
}, D = Symbol.for("bitecs-relation"), M = Symbol.for("bitecs-pairTarget"), W = Symbol.for("bitecs-isPairComponent"), P = Symbol.for("bitecs-relationData"), O = function() {
var t = {
pairsMap: new Map(),
initStore: void 0,
exclusiveRelation: !1,
autoRemoveSubject: !1,
onTargetRemoved: void 0,
onAdd: void 0,
onRemove: void 0
}, e = function(n) {
if (void 0 === n) throw Error("Relation target is undefined");
var o = "*" === n ? j : n;
if (!t.pairsMap.has(o)) {
var r = {};
T(r, D, e), T(r, M, o), T(r, W, !0), t.pairsMap.set(o, r);
}
return t.pairsMap.get(o);
};
return T(e, P, t), e;
}, L = function(t) {
return t[P].exclusiveRelation = !0, t;
}, G = function(t) {
return t[P].autoRemoveSubject = !0, t;
}, B = function(t) {
return function(e) {
return e[P].onTargetRemoved = t, e;
};
}, k = function(t) {
return function(e) {
return e[P].onAdd = t, e;
};
}, V = function(t) {
return function(e) {
return e[P].onRemove = t, e;
};
}, U = function(t, e) {
if (void 0 === t) throw Error("Relation is undefined");
return t(e);
}, z = function(t, e, n) {
var o, r, i = oe(t, e), a = [];
try {
for (var s = d(i), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
u[D] !== n || u[M] === j || q(u[M]) || a.push(u[M]);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
l && !l.done && (r = s.return) && r.call(s);
} finally {
if (o) throw o.error;
}
}
return a;
}, H = Symbol.for("bitecs-wildcard"), j = (A = Symbol.for("bitecs-global-wildcard"), 
globalThis[A] || (globalThis[A] = (g = O(), Object.defineProperty(g, H, {
value: !0,
enumerable: !1,
writable: !1,
configurable: !1
}), g)), globalThis[A]), Y = (C = Symbol.for("bitecs-global-isa"), globalThis[C] || (globalThis[C] = O()), 
globalThis[C]);
function q(t) {
return !!t && Object.getOwnPropertySymbols(t).includes(P);
}
var X, Q = 4294967295;
function J(t, e) {
var n = t.depths;
if (e < n.length) return n;
var o = Math.max(e + 1, 2 * n.length, n.length + 1024), r = new Uint32Array(o);
return r.fill(Q), r.set(n), t.depths = r, r;
}
function K(t, e, n, o) {
var r = t.depthToEntities;
if (void 0 !== o && o !== Q) {
var i = r.get(o);
i && (i.remove(e), 0 === i.dense.length && r.delete(o));
}
n !== Q && (r.has(n) || r.set(n, x()), r.get(n).add(e));
}
function Z(t, e, n, o) {
t.depths[e] = n, K(t, e, n, o), function(t, e) {
e > t.maxDepth && (t.maxDepth = e);
}(t, n);
}
function $(t, e) {
t[F].hierarchyQueryCache.delete(e);
}
function tt(t, e) {
var n = t[F];
return n.hierarchyActiveRelations.has(e) || (n.hierarchyActiveRelations.add(e), 
et(t, e), function(t, e) {
var n, o, r, i, a, s, l = At(t, [ U(e, j) ]);
try {
for (var u = d(l), c = u.next(); !c.done; c = u.next()) rt(t, e, m = c.value);
} catch (t) {
n = {
error: t
};
} finally {
try {
c && !c.done && (o = u.return) && o.call(u);
} finally {
if (n) throw n.error;
}
}
var h = new Set();
try {
for (var p = d(l), f = p.next(); !f.done; f = p.next()) {
var m = f.value;
try {
for (var v = (a = void 0, d(z(t, m, e))), y = v.next(); !y.done; y = v.next()) {
var _ = y.value;
h.has(_) || (h.add(_), rt(t, e, _));
}
} catch (t) {
a = {
error: t
};
} finally {
try {
y && !y.done && (s = v.return) && s.call(v);
} finally {
if (a) throw a.error;
}
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
f && !f.done && (i = p.return) && i.call(p);
} finally {
if (r) throw r.error;
}
}
}(t, e)), n.hierarchyData.get(e);
}
function et(t, e) {
var n = t[F];
if (!n.hierarchyData.has(e)) {
var o = Math.max(1024, 2 * n.entityIndex.dense.length), r = new Uint32Array(o);
r.fill(Q), n.hierarchyData.set(e, {
depths: r,
dirty: E(),
depthToEntities: new Map(),
maxDepth: 0
});
}
}
function nt(t, e, n, o) {
var r, i;
if (void 0 === o && (o = new Set()), o.has(n)) return 0;
o.add(n);
var a = z(t, n, e);
if (0 === a.length) return 0;
if (1 === a.length) return ot(t, e, a[0], o) + 1;
var s = 1 / 0;
try {
for (var l = d(a), u = l.next(); !u.done; u = l.next()) {
var c = ot(t, e, u.value, o);
if (c < s && 0 === (s = c)) break;
}
} catch (t) {
r = {
error: t
};
} finally {
try {
u && !u.done && (i = l.return) && i.call(l);
} finally {
if (r) throw r.error;
}
}
return s === 1 / 0 ? 0 : s + 1;
}
function ot(t, e, n, o) {
var r = t[F];
et(t, e);
var i = r.hierarchyData.get(e), a = i.depths;
if ((a = J(i, n))[n] === Q) {
var s = nt(t, e, n, o);
return Z(i, n, s), s;
}
return a[n];
}
function rt(t, e, n) {
return ot(t, e, n, new Set());
}
function it(t, e, n, o, r) {
var i, a;
if (void 0 === r && (r = E()), !r.has(n)) {
r.add(n);
var s = At(t, [ e(n) ]);
try {
for (var l = d(s), u = l.next(); !u.done; u = l.next()) {
var c = u.value;
o.add(c), it(t, e, c, o, r);
}
} catch (t) {
i = {
error: t
};
} finally {
try {
u && !u.done && (a = l.return) && a.call(l);
} finally {
if (i) throw i.error;
}
}
}
}
function at(t, e, n, o, r) {
void 0 === r && (r = new Set());
var i = t[F];
if (i.hierarchyActiveRelations.has(e)) {
et(t, e);
var a = i.hierarchyData.get(e);
if (r.has(n)) a.dirty.add(n); else {
r.add(n);
var s = a.depths, l = a.dirty, u = void 0 !== o ? rt(t, e, o) + 1 : 0;
if (!(u > 64)) {
var c = s[n];
Z(a, n, u, c === Q ? void 0 : c), c !== u && (it(t, e, n, l, E()), $(t, e));
}
}
}
}
function st(t, e, n) {
var o = t[F];
if (o.hierarchyActiveRelations.has(e)) {
var r = o.hierarchyData.get(e);
r.depths, lt(t, e, n, J(r, n), E()), $(t, e);
}
}
function lt(t, e, n, o, r) {
var i, a;
if (!r.has(n)) {
r.add(n);
var s = t[F].hierarchyData.get(e);
if (n < o.length) {
var l = o[n];
l !== Q && (s.depths[n] = Q, K(s, n, Q, l));
}
var u = At(t, [ e(n) ]);
try {
for (var c = d(u), h = c.next(); !h.done; h = c.next()) lt(t, e, h.value, o, r);
} catch (t) {
i = {
error: t
};
} finally {
try {
h && !h.done && (a = c.return) && a.call(c);
} finally {
if (i) throw i.error;
}
}
}
}
function ut(t, e) {
var n, o, r = t[F].hierarchyData.get(e);
if (r) {
var i = r.dirty, a = r.depths;
if (0 !== i.dense.length) {
try {
for (var s = d(i.dense), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
a[u] === Q && Z(r, u, nt(t, e, u));
}
} catch (t) {
n = {
error: t
};
} finally {
try {
l && !l.done && (o = s.return) && o.call(s);
} finally {
if (n) throw n.error;
}
}
i.reset();
}
}
}
var ct = Symbol.for("bitecs-opType"), dt = Symbol.for("bitecs-opTerms"), ht = Symbol.for("bitecs-hierarchyType"), pt = Symbol.for("bitecs-hierarchyRel"), ft = Symbol.for("bitecs-hierarchyDepth"), mt = Symbol.for("bitecs-modifierType"), vt = ((X = {})[mt] = "nested", 
X), yt = function(t, e) {
var n = t[F], o = function(e) {
return ct in e ? "".concat(e[ct].toLowerCase(), "(").concat(e[dt].map(o).sort().join(","), ")") : (r = e, 
n.componentMap.has(r) || Ft(t, r), n.componentMap.get(r).id).toString();
var r;
};
return e.map(o).sort().join("-");
}, _t = function(t, e, n) {
void 0 === n && (n = {});
var o = t[F], r = yt(t, e), i = [], a = function(e) {
ct in e ? e[dt].forEach(a) : (o.componentMap.has(e) || Ft(t, e), i.push(e));
};
e.forEach(a);
var s = [], l = [], u = [], c = function(e, n) {
n.forEach(function(n) {
o.componentMap.has(n) || Ft(t, n), e.push(n);
});
};
e.forEach(function(e) {
if (ct in e) {
var n = e, r = n[ct], i = n[dt];
if ("Not" === r) c(l, i); else if ("Or" === r) c(u, i); else {
if ("And" !== r) throw new Error("Nested combinator ".concat(r, " not supported yet - use simple queries for best performance"));
c(s, i);
}
} else o.componentMap.has(e) || Ft(t, e), s.push(e);
});
var d = i.map(function(t) {
return o.componentMap.get(t);
}), f = p([], h(new Set(d.map(function(t) {
return t.generationId;
}))), !1), m = function(t, e) {
return t[e.generationId] = (t[e.generationId] || 0) | e.bitflag, t;
}, v = s.map(function(t) {
return o.componentMap.get(t);
}).reduce(m, {}), y = l.map(function(t) {
return o.componentMap.get(t);
}).reduce(m, {}), _ = u.map(function(t) {
return o.componentMap.get(t);
}).reduce(m, {}), g = d.reduce(m, {}), A = Object.assign(n.buffered ? x() : E(), {
allComponents: i,
orComponents: u,
notComponents: l,
masks: v,
notMasks: y,
orMasks: _,
hasMasks: g,
generations: f,
toRemove: E(),
addObservable: I(),
removeObservable: I(),
queues: {}
});
o.queries.add(A), o.queriesHashMap.set(r, A), d.forEach(function(t) {
t.queries.add(A);
}), l.length && o.notQueries.add(A);
for (var C = o.entityIndex, R = 0; R < C.aliveCount; R++) {
var S = C.dense[R];
Et(t, S, ee) || Ct(t, A, S) && Rt(A, S);
}
return A;
};
function gt(t, e, n) {
void 0 === n && (n = {});
var o = t[F], r = yt(t, e), i = o.queriesHashMap.get(r);
return i ? n.buffered && !("buffer" in i.dense) && (i = _t(t, e, {
buffered: !0
})) : i = _t(t, e, n), n.buffered, i.dense;
}
function At(t, e) {
for (var n, o, r = [], i = 2; i < arguments.length; i++) r[i - 2] = arguments[i];
var a = e.find(function(t) {
return t && "object" == typeof t && ht in t;
}), s = e.filter(function(t) {
return !(t && "object" == typeof t && ht in t);
}), l = !1, u = !0, c = r.some(function(t) {
return t && "object" == typeof t && mt in t;
});
try {
for (var f = d(r), m = f.next(); !m.done; m = f.next()) {
var v = m.value;
if (c && v && "object" == typeof v && mt in v) {
var y = v;
"buffer" === y[mt] && (l = !0), "nested" === y[mt] && (u = !1);
} else if (!c) {
var _ = v;
void 0 !== _.buffered && (l = _.buffered), void 0 !== _.commit && (u = _.commit);
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
m && !m.done && (o = f.return) && o.call(f);
} finally {
if (n) throw n.error;
}
}
if (a) {
var g = a, A = g[pt], C = g[ft];
return void 0 !== C ? function(t, e, n, o) {
void 0 === o && (o = {});
var r = tt(t, e);
ut(t, e);
var i = r.depthToEntities.get(n);
return i ? (o.buffered, i.dense) : o.buffered ? new Uint32Array(0) : [];
}(t, A, C, {
buffered: l
}) : function(t, e, n, o) {
void 0 === o && (o = {});
var r = t[F];
tt(t, e);
var i = yt(t, p([ e ], h(n), !1)), a = r.hierarchyQueryCache.get(e);
if (a && a.hash === i) return a.result;
ut(t, e), gt(t, n, o);
var s = r.queriesHashMap.get(yt(t, n)), l = r.hierarchyData.get(e).depths;
s.sort(function(t, e) {
var n = l[t], o = l[e];
return n !== o ? n - o : t - e;
});
var u = (o.buffered, s.dense);
return r.hierarchyQueryCache.set(e, {
hash: i,
result: u
}), u;
}(t, A, s, {
buffered: l
});
}
return u && Tt(t), gt(t, s, {
buffered: l
});
}
function Ct(t, e, n) {
for (var o = t[F], r = e.masks, i = e.notMasks, a = e.orMasks, s = e.generations, l = 0 === Object.keys(a).length, u = 0; u < s.length; u++) {
var c = s[u], d = r[c], h = i[c], p = a[c], f = o.entityMasks[c][n];
if (h && 0 != (f & h)) return !1;
if (d && (f & d) !== d) return !1;
p && 0 != (f & p) && (l = !0);
}
return l;
}
var Rt = function(t, e) {
t.toRemove.remove(e), t.addObservable.notify(e), t.add(e);
}, St = function(t) {
for (var e = 0; e < t.toRemove.dense.length; e++) {
var n = t.toRemove.dense[e];
t.remove(n);
}
t.toRemove.reset();
}, Tt = function(t) {
var e = t[F];
e.dirtyQueries.size && (e.dirtyQueries.forEach(St), e.dirtyQueries.clear());
}, bt = function(t, e, n) {
var o = t[F];
e.has(n) && !e.toRemove.has(n) && (e.toRemove.add(n), o.dirtyQueries.add(e), e.removeObservable.notify(n));
}, wt = function(t, e) {
var n = t[F], o = yt(t, e), r = n.queriesHashMap.get(o);
r && (n.queries.delete(r), n.queriesHashMap.delete(o));
}, Ft = function(t, e) {
if (!e) throw new Error("bitECS - Cannot register null or undefined component");
var n = t[F], o = new Set(), r = {
id: n.componentCount++,
generationId: n.entityMasks.length - 1,
bitflag: n.bitflag,
ref: e,
queries: o,
setObservable: I(),
getObservable: I()
};
return n.componentMap.set(e, r), n.bitflag *= 2, n.bitflag >= Math.pow(2, 31) && (n.bitflag = 1, 
n.entityMasks.push([])), r;
}, Et = function(t, e, n) {
var o = t[F], r = o.componentMap.get(n);
if (!r) return !1;
var i = r.generationId, a = r.bitflag;
return (o.entityMasks[i][e] & a) === a;
}, Nt = function(t, e, n) {
var o = t[F].componentMap.get(n);
if (o && Et(t, e, n)) return o.getObservable.notify(e);
}, xt = function(t, e, n, o, r) {
var i, a, s, l;
if (void 0 === r && (r = new Set()), !r.has(o)) {
r.add(o), It(e, n, Y(o));
try {
for (var u = d(oe(e, o)), c = u.next(); !c.done; c = u.next()) {
var h = c.value;
if (h !== ee && !Et(e, n, h)) {
It(e, n, h);
var p = t.componentMap.get(h);
if (null == p ? void 0 : p.setObservable) {
var f = Nt(e, o, h);
p.setObservable.notify(n, f);
}
}
}
} catch (t) {
i = {
error: t
};
} finally {
try {
c && !c.done && (a = u.return) && a.call(u);
} finally {
if (i) throw i.error;
}
}
try {
for (var m = d(z(e, o, Y)), v = m.next(); !v.done; v = m.next()) {
var y = v.value;
xt(t, e, n, y, r);
}
} catch (t) {
s = {
error: t
};
} finally {
try {
v && !v.done && (l = m.return) && l.call(m);
} finally {
if (s) throw s.error;
}
}
}
}, It = function(t, e, n) {
var o, r;
if (!re(t, e)) throw new Error("Cannot add component - entity ".concat(e, " does not exist in the world."));
var i = t[F], a = "component" in n ? n.component : n, s = "data" in n ? n.data : void 0;
i.componentMap.has(a) || Ft(t, a);
var l = i.componentMap.get(a);
if (Et(t, e, a)) return void 0 !== s && l.setObservable.notify(e, s), !1;
var u = l.generationId, c = l.bitflag, h = l.queries;
if (i.entityMasks[u][e] |= c, Et(t, e, ee) || h.forEach(function(n) {
n.toRemove.remove(e), Ct(t, n, e) ? Rt(n, e) : bt(t, n, e);
}), i.entityComponents.get(e).add(a), void 0 !== s && l.setObservable.notify(e, s), 
a[W]) {
var p = a[D], f = a[M];
if (Dt(t, e, U(p, j), U(j, f)), "number" == typeof f) {
var m = f;
Dt(t, m, U(j, e), U(j, p)), i.entitiesWithRelations.add(m), i.entitiesWithRelations.add(e);
}
i.entitiesWithRelations.add(f);
var v = p[P];
if (!0 === v.exclusiveRelation && f !== j) {
var y = z(t, e, p)[0];
null != y && y !== f && te(t, e, p(y));
}
if (p === Y) {
var _ = z(t, e, Y);
try {
for (var g = d(_), A = g.next(); !A.done; A = g.next()) {
var C = A.value;
xt(i, t, e, C);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
A && !A.done && (r = g.return) && r.call(g);
} finally {
if (o) throw o.error;
}
}
}
at(t, p, e, "number" == typeof f ? f : void 0), v.onAdd && "number" == typeof f && v.onAdd(e, f);
}
return !0;
};
function Dt(t, e) {
for (var n = [], o = 2; o < arguments.length; o++) n[o - 2] = arguments[o];
(Array.isArray(n[0]) ? n[0] : n).forEach(function(n) {
It(t, e, n);
});
}
var Mt, Wt, Pt, Ot, Lt, Gt, Bt, kt, Vt, Ut, zt, Ht, jt, Yt, qt, Xt, Qt, Jt, Kt, Zt, $t, te = function(t, e) {
for (var n = [], o = 2; o < arguments.length; o++) n[o - 2] = arguments[o];
var r = t[F];
if (!re(t, e)) throw new Error("Cannot remove component - entity ".concat(e, " does not exist in the world."));
n.forEach(function(n) {
if (Et(t, e, n)) {
var o = r.componentMap.get(n), i = o.generationId, a = o.bitflag, s = o.queries;
if (r.entityMasks[i][e] &= ~a, s.forEach(function(n) {
n.toRemove.remove(e), Ct(t, n, e) ? Rt(n, e) : bt(t, n, e);
}), r.entityComponents.get(e).delete(n), n[W]) {
var l = n[M], u = n[D];
if (st(t, u, e), te(t, e, U(j, l)), "number" == typeof l) {
var c = l;
re(t, c) && (te(t, c, U(j, e)), te(t, c, U(j, u)));
}
0 === z(t, e, u).length && te(t, e, U(u, j));
var d = u[P];
d.onRemove && "number" == typeof l && d.onRemove(e, l);
}
}
});
}, ee = {}, ne = function(t, e) {
var n = t[F];
if (w(n.entityIndex, e)) for (var o = [ e ], r = new Set(), i = function() {
var e, i, a, s, l, u, c, f, m, v, y = o.shift();
if (r.has(y)) return "continue";
r.add(y);
var _ = [];
if (n.entitiesWithRelations.has(y)) {
var g = function(e) {
var r, i;
if (!re(t, e)) return "continue";
var a = function(n) {
if (!n[W]) return "continue";
var r = n[D][P];
_.push(function() {
return te(t, e, U(j, y));
}), n[M] === y && (_.push(function() {
return te(t, e, n);
}), r.autoRemoveSubject && o.push(e), r.onTargetRemoved && _.push(function() {
return r.onTargetRemoved(e, y);
}));
};
try {
for (var s = (r = void 0, d(n.entityComponents.get(e))), l = s.next(); !l.done; l = s.next()) a(l.value);
} catch (t) {
r = {
error: t
};
} finally {
try {
l && !l.done && (i = s.return) && i.call(s);
} finally {
if (r) throw r.error;
}
}
};
try {
for (var A = (e = void 0, d(At(t, [ j(y) ], vt))), C = A.next(); !C.done; C = A.next()) g(C.value);
} catch (t) {
e = {
error: t
};
} finally {
try {
C && !C.done && (i = A.return) && i.call(A);
} finally {
if (e) throw e.error;
}
}
n.entitiesWithRelations.delete(y);
}
try {
for (var R = (a = void 0, d(_)), S = R.next(); !S.done; S = R.next()) (0, S.value)();
} catch (t) {
a = {
error: t
};
} finally {
try {
S && !S.done && (s = R.return) && s.call(R);
} finally {
if (a) throw a.error;
}
}
try {
for (var T = (l = void 0, d(o)), b = T.next(); !b.done; b = T.next()) {
var w = b.value;
ne(t, w);
}
} catch (t) {
l = {
error: t
};
} finally {
try {
b && !b.done && (u = T.return) && u.call(T);
} finally {
if (l) throw l.error;
}
}
try {
for (var F = (c = void 0, d(n.queries)), E = F.next(); !E.done; E = F.next()) {
var N = E.value;
bt(t, N, y);
}
} catch (t) {
c = {
error: t
};
} finally {
try {
E && !E.done && (f = F.return) && f.call(F);
} finally {
if (c) throw c.error;
}
}
var x = n.entityComponents.get(y);
if (x) {
var I = [];
try {
for (var O = (m = void 0, d(x)), L = O.next(); !L.done; L = O.next()) {
var G = L.value;
G[W] && I.push(G);
}
} catch (t) {
m = {
error: t
};
} finally {
try {
L && !L.done && (v = O.return) && v.call(O);
} finally {
if (m) throw m.error;
}
}
I.length > 0 && te.apply(void 0, p([ t, y ], h(I), !1));
}
!function(t, e) {
var n = t.sparse[e];
if (!(void 0 === n || n >= t.aliveCount)) {
var o = t.aliveCount - 1, r = t.dense[o];
if (t.sparse[r] = n, t.dense[n] = r, t.sparse[e] = o, t.dense[o] = e, t.versioning) {
var i = function(t, e) {
var n = function(t, e) {
return e >>> t.versionShift & (1 << t.versionBits) - 1;
}(t, e) + 1 & (1 << t.versionBits) - 1;
return e & t.entityMask | n << t.versionShift;
}(t, e);
t.dense[o] = i;
}
t.aliveCount--;
}
}(n.entityIndex, y), n.entityComponents.delete(y);
for (var B = 0; B < n.entityMasks.length; B++) n.entityMasks[B][y] = 0;
}; o.length > 0; ) i();
}, oe = function(t, e) {
var n = t[F];
if (void 0 === e) throw new Error("getEntityComponents: entity id is undefined.");
if (!w(n.entityIndex, e)) throw new Error("getEntityComponents: entity ".concat(e, " does not exist in the world."));
return Array.from(n.entityComponents.get(e));
}, re = function(t, e) {
return w(t[F].entityIndex, e);
};
t.RouteMode = void 0, (Wt = t.RouteMode || (t.RouteMode = {})).Direct = "direct", 
Wt.Broadcast = "broadcast", t.ReceiveAction = void 0, (Pt = t.ReceiveAction || (t.ReceiveAction = {})).Queue = "queue", 
Pt.Replace = "replace", Pt.Discard = "discard", t.DispatchAction = void 0, (Ot = t.DispatchAction || (t.DispatchAction = {})).FireOnce = "fireOnce", 
Ot.Defer = "defer", Ot.Cancel = "cancel", t.FilterAction = void 0, (Lt = t.FilterAction || (t.FilterAction = {})).FireOnce = "fireOnce", 
Lt.FireRepeat = "fireRepeat", Lt.Defer = "defer", Lt.Cancel = "cancel", t.RoutePhase = void 0, 
(Gt = t.RoutePhase || (t.RoutePhase = {}))[Gt.Receive = 1] = "Receive", Gt[Gt.Transform = 2] = "Transform", 
Gt[Gt.Dispatch = 3] = "Dispatch", Gt[Gt.Filter = 4] = "Filter", (Mt = {})[t.RoutePhase.Receive] = "receiveAction", 
Mt[t.RoutePhase.Transform] = "transformedEidList", Mt[t.RoutePhase.Dispatch] = "dispatchAction", 
Mt[t.RoutePhase.Filter] = "filterAction";
var ie = {
getBindValue: function(t) {
return t.atomState;
}
};
function ae(t, e) {
if ("function" != typeof t.atomState) throw new TypeError('[AtomEngine] 原子 "'.concat(t.atomName, '" 的函数实现不可调用'));
return t.atomState.apply(t, p([], h(e), !1));
}
function se(t) {
var e;
return (null === (e = t.variantChain) || void 0 === e ? void 0 : e.resolve()) || t;
}
var le = ((Bt = {}).EntityDomainAtom = {
getBindValue: function(t, e, n) {
return e.isComponentQuery(n) ? Object.create(t, {
collect: {
value: t.collectByComponent.bind(t)
},
has: {
value: t.hasByComponent.bind(t)
},
count: {
value: t.countByComponent.bind(t)
}
}) : t;
}
}, Bt.EntityRelationAtom = {
getBindValue: function(t) {
return t;
}
}, Bt.FunctionAtom = {
getBindValue: function(t) {
return function() {
for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
return ae(se(t), e);
};
}
}, Bt.SignalAtom = {
getBindValue: function(t) {
return t;
}
}, Bt.AudioAtom = {
getBindValue: function(t) {
return t;
}
}, Bt.WorldInputAtom = {
getBindValue: function(t) {
return t;
}
}, Bt.DomainExtensionAtom = {
getBindValue: function(t) {
return t;
}
}, Bt);
function ue(t, e) {
var n, o;
void 0 === e && (e = {});
var r = le[t];
return {
getBindValue: null !== (o = null !== (n = e.getBindValue) && void 0 !== n ? n : null == r ? void 0 : r.getBindValue) && void 0 !== o ? o : ie.getBindValue
};
}
var ce = ((kt = {}).RenderAtom = ((Vt = {}).EntityDomainAtom = ue("EntityDomainAtom"), 
Vt.DomainExtensionAtom = ue("DomainExtensionAtom"), Vt.LogicAtom = ue("LogicAtom"), 
Vt.LoadAtom = ue("LoadAtom"), Vt.RenderAtom = ue("RenderAtom"), Vt.ConfigAtom = ue("ConfigAtom"), 
Vt.SignalRouterAtom = ue("SignalRouterAtom"), Vt.InputAtom = ue("InputAtom"), Vt.FunctionAtom = ue("FunctionAtom"), 
Vt.EntityRelationAtom = ue("EntityRelationAtom"), Vt), kt.SignalAtom = ((Ut = {}).EntityDomainAtom = ue("EntityDomainAtom"), 
Ut), kt.SignalRouterAtom = ((zt = {}).SignalAtom = ue("SignalAtom"), zt.InputAtom = ue("InputAtom"), 
zt.WorldInputAtom = ue("WorldInputAtom"), zt), kt.LogicAtom = ((Ht = {}).NativeAtom = ue("NativeAtom"), 
Ht.LogicAtom = ue("LogicAtom"), Ht.OutputAtom = ue("OutputAtom"), Ht.LoadAtom = ue("LoadAtom"), 
Ht.InputAtom = ue("InputAtom"), Ht.FunctionAtom = ue("FunctionAtom"), Ht.ConfigAtom = ue("ConfigAtom"), 
Ht.WorldAtom = ue("WorldAtom"), Ht.RenderAtom = ue("RenderAtom"), Ht.SignalAtom = ue("SignalAtom"), 
Ht.SignalRouterAtom = ue("SignalRouterAtom"), Ht.WorldInputAtom = ue("WorldInputAtom"), 
Ht.EntityDomainAtom = ue("EntityDomainAtom"), Ht.EntityRelationAtom = ue("EntityRelationAtom"), 
Ht.DomainExtensionAtom = ue("DomainExtensionAtom"), Ht.AudioAtom = ue("AudioAtom"), 
Ht), kt.ConfigAtom = ((jt = {}).ConfigAtom = ue("ConfigAtom"), jt), kt.EntityDomainAtom = ((Yt = {}).EntityComponentAtom = ue("EntityComponentAtom"), 
Yt.EntityDomainAtom = ue("EntityDomainAtom"), Yt.EntityRelationAtom = ue("EntityRelationAtom"), 
Yt), kt.DomainExtensionAtom = ((qt = {}).EntityDomainAtom = ue("EntityDomainAtom"), 
qt.EntityComponentAtom = ue("EntityComponentAtom"), qt), kt.FunctionAtom = ((Xt = {}).NativeAtom = ue("NativeAtom"), 
Xt.LogicAtom = ue("LogicAtom"), Xt.OutputAtom = ue("OutputAtom"), Xt.LoadAtom = ue("LoadAtom"), 
Xt.InputAtom = ue("InputAtom"), Xt.FunctionAtom = ue("FunctionAtom"), Xt.ConfigAtom = ue("ConfigAtom"), 
Xt.WorldAtom = ue("WorldAtom"), Xt.RenderAtom = ue("RenderAtom"), Xt.SignalRouterAtom = ue("SignalRouterAtom"), 
Xt.WorldInputAtom = ue("WorldInputAtom"), Xt.EntityDomainAtom = ue("EntityDomainAtom"), 
Xt.EntityRelationAtom = ue("EntityRelationAtom"), Xt.DomainExtensionAtom = ue("DomainExtensionAtom"), 
Xt.AudioAtom = ue("AudioAtom"), Xt), kt.VariantAtom = ((Qt = {}).NativeAtom = ue("NativeAtom"), 
Qt.LogicAtom = ue("LogicAtom"), Qt.OutputAtom = ue("OutputAtom"), Qt.LoadAtom = ue("LoadAtom"), 
Qt.InputAtom = ue("InputAtom"), Qt.FunctionAtom = {
getBindValue: function(t, e, n) {
var o = t;
return n && (null == e ? void 0 : e.isVariantSource(n)) ? function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return ae(o, t);
} : function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return ae(se(o), t);
};
}
}, Qt.ConfigAtom = ue("ConfigAtom"), Qt.WorldAtom = ue("WorldAtom"), Qt.RenderAtom = ue("RenderAtom"), 
Qt.SignalAtom = ue("SignalAtom"), Qt.SignalRouterAtom = ue("SignalRouterAtom"), 
Qt.WorldInputAtom = ue("WorldInputAtom"), Qt.EntityDomainAtom = ue("EntityDomainAtom"), 
Qt.EntityRelationAtom = ue("EntityRelationAtom"), Qt.DomainExtensionAtom = ue("DomainExtensionAtom"), 
Qt.AudioAtom = ue("AudioAtom"), Qt), kt.InputAtom = ((Jt = {}).EntityDomainAtom = ue("EntityDomainAtom"), 
Jt), kt.WorldInputAtom = ((Kt = {}).EntityDomainAtom = ue("EntityDomainAtom"), Kt), 
kt.OrderAtom = ((Zt = {}).OrderAtom = ue("OrderAtom"), Zt.LogicAtom = ue("LogicAtom"), 
Zt.RenderAtom = ue("RenderAtom"), Zt.VariantAtom = ue("VariantAtom"), Zt.SignalRouterAtom = ue("SignalRouterAtom"), 
Zt), kt.LoadAtom = (($t = {}).ConfigAtom = ue("ConfigAtom"), $t.LogicAtom = ue("LogicAtom"), 
$t.LoadAtom = ue("LoadAtom"), $t.FunctionAtom = ue("FunctionAtom"), $t), kt.WorldAtom = {}, 
kt.EntityComponentAtom = {}, kt.EntityRelationAtom = {}, kt.OutputAtom = {}, kt), de = {
getBindValue: function(t, e, n) {
var o = t.atomWorld.getAtomIns(e), r = ce[t.atomType][o.atomType].getBindValue(o, t, n);
return r[ye] || T(r, ye, o.atomName), r[_e] || T(r, _e, o.atomType), r;
},
canBind: function(t, e) {
var n;
return Boolean(null === (n = ce[t]) || void 0 === n ? void 0 : n[e]);
}
}, he = new Map();
function pe(t) {
var e;
return null !== (e = t.__atomName) && void 0 !== e ? e : t.name;
}
var fe = function(t, e) {
he.set(t, e);
};
fe("SignalAtom", function(t) {
var e = t.filterDepsByType("EntityDomainAtom");
1 !== e.length && y(r.DomainBindingRequired, {
atom: t.atomName,
reason: "当前绑定数量: ".concat(e.length, "，需要恰好 1 个")
});
}), fe("SignalRouterAtom", function(t) {
var e = t.getRouteFromAtomName(), n = t.getRouteToAtomName();
e && n || y(r.RouteEndpointRequired, {
atom: t.atomName,
routeFrom: null != e ? e : "未标记",
routeTo: null != n ? n : "未标记"
});
}), fe("OrderAtom", function(t) {
var e = t.getOrderBeforeAtomName(), n = t.getOrderAfterAtomName();
e && n || y(r.OrderTargetRequired, {
atom: t.atomName,
orderBefore: null != e ? e : "未标记",
orderAfter: null != n ? n : "未标记"
});
}), fe("DomainExtensionAtom", function(t) {
var e = t.constructor, n = e.__bindingMeta;
if (n) if (n.attachToProperty) {
var o = n.propToAtom.get(n.attachToProperty);
if (o) {
var i = t.getDepAtomType(o);
"EntityDomainAtom" !== i && y(r.DomainTargetInvalid, {
class: pe(e),
decorator: "@attachTo",
actual: i
});
}
} else y(r.AttachToRequired, {
atom: t.atomName
});
});
var me, ve, ye = Symbol.for("atomengine.atomName"), _e = Symbol.for("atomengine.atomType"), ge = Symbol.for("atomengine.inheritableAtom"), Ae = function() {
function t() {
this.atomType = this.constructor.atomType, this.atomWorld = null, this.atomName = null, 
this._isReady = !1;
}
return Object.defineProperty(t, "atomType", {
get: function() {
return null;
},
enumerable: !1,
configurable: !0
}), t.prototype.getDependencies = function() {
return this.constructor.__dependencies;
}, t.prototype.getFeatureName = function() {
return this.constructor.__atomFeatureName;
}, t.prototype.getDepAtomType = function(t) {
return this.atomWorld.getAtomType(t);
}, t.prototype.findDepByType = function(t) {
var e = this;
return this.getDependencies().find(function(n) {
return e.atomWorld.getAtomType(n) === t;
});
}, t.prototype.filterDepsByType = function(t) {
var e = this;
return this.getDependencies().filter(function(n) {
return e.atomWorld.getAtomType(n) === t;
});
}, t.prototype.isDepType = function(t, e) {
return this.atomWorld.getAtomType(t) === e;
}, t.prototype.isComponentQuery = function(t) {
var e, n, o;
return null !== (o = null === (n = null === (e = this.constructor.__bindingMeta) || void 0 === e ? void 0 : e.componentQueryProps) || void 0 === n ? void 0 : n.has(t)) && void 0 !== o && o;
}, t.prototype.isVariantSource = function(t) {
var e;
return (null === (e = this.constructor.__bindingMeta) || void 0 === e ? void 0 : e.variantSourceProperty) === t;
}, t.prototype.getBoundAtomName = function(t) {
var e;
return null === (e = this.constructor.__bindingMeta) || void 0 === e ? void 0 : e.propToAtom.get(t);
}, t.prototype.ready = function() {
if (!this._isReady) {
this._isReady = !0;
for (var t = this.getDependencies(), e = 0; e < t.length; e++) {
var n = this.atomWorld.getAtomIns(t[e]).ready();
if (n) return this._readyAsync(n, t, e + 1);
}
return this.onReady();
}
}, t.prototype._readyAsync = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
return [ 4, t ];

case 1:
if (a.sent(), !this.atomWorld) return [ 2 ];
o = n, a.label = 2;

case 2:
return o < e.length ? (r = this.atomWorld.getAtomIns(e[o]).ready()) ? [ 4, r ] : [ 3, 4 ] : [ 3, 5 ];

case 3:
if (a.sent(), !this.atomWorld) return [ 2 ];
a.label = 4;

case 4:
return o++, [ 3, 2 ];

case 5:
return (i = this.onReady()) ? [ 4, i ] : [ 3, 7 ];

case 6:
a.sent(), a.label = 7;

case 7:
return [ 2 ];
}
});
});
}, t.prototype.onReady = function() {}, t.prototype.collectLoad = function() {}, 
t.prototype.registerToChain = function() {
return null;
}, t.prototype.unregisterFromChain = function() {
return !1;
}, t.prototype.getChain = function() {
return null;
}, t.prototype.getTopologicalChain = function() {
return null;
}, t.prototype.init = function(t, e) {
var n, o;
this.atomName = t, this.atomWorld = e, nn(this);
try {
for (var r = d(this.getDependencies()), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
this.atomWorld._createAtom(a, t);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (n) throw n.error;
}
}
this.collectLoad();
}, t.prototype.dispose = function() {
this.atomState = null, this.atomWorld = null;
}, t;
}(), Ce = function() {
function t(t) {
this.atoms = [], this.constraints = new Map(), this.needsSorting = !0, this.sortedCache = null, 
this.instanceCache = null, this._atomWorld = t;
}
return t.prototype.hasAtoms = function() {
return this.atoms.length > 0;
}, t.prototype.addAtom = function(t) {
this.atoms.includes(t) || (this.atoms.push(t), this.markDirty(), this.onAtomRegistered(t));
}, t.prototype.removeAtom = function(t) {
var e, n, o = this.atoms.indexOf(t);
-1 !== o && (this.atoms.splice(o, 1), this.markDirty(), this.onAtomUnregistered(t)), 
this.constraints.delete(t);
try {
for (var r = d(this.constraints.values()), i = r.next(); !i.done; i = r.next()) i.value.delete(t);
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
return 0 === this.atoms.length;
}, t.prototype.onAtomRegistered = function() {}, t.prototype.onAtomUnregistered = function() {}, 
t.prototype.addConstraint = function(t, e) {
var n, o;
if (null === (n = this.constraints.get(e)) || void 0 === n ? void 0 : n.has(t)) y(r.PriorityConstraintDuplicate, {
higher: t,
lower: e
}); else {
(null === (o = this.constraints.get(t)) || void 0 === o ? void 0 : o.has(e)) && y(r.TopologicalConflict, {
higher: t,
lower: e,
reason: "已存在 ".concat(e, " -> ").concat(t, "，尝试添加 ").concat(t, " -> ").concat(e)
});
var i = this.constraints.get(e);
i || (i = new Set(), this.constraints.set(e, i)), i.add(t), this.markDirty();
}
}, t.prototype.removeConstraint = function(t, e) {
var n = this.constraints.get(e);
n && (n.delete(t), 0 === n.size && this.constraints.delete(e)), this.markDirty();
}, t.prototype.markDirty = function() {
this.needsSorting = !0, this.instanceCache = null;
}, t.prototype.getInstances = function() {
var t = this;
return this.needsSorting && (this.sortedCache = this.topologicalSort(), this.needsSorting = !1, 
this.instanceCache = null), this.instanceCache || (this.instanceCache = this.sortedCache.map(function(e) {
return t._atomWorld.atomInstanceMap.get(e);
})), this.instanceCache;
}, t.prototype.compareAtoms = function(t, e) {
return t.localeCompare(e);
}, t.prototype.topologicalSort = function() {
var t, e, n, o, i, a, s, l, u, c, f, m, v, _, g, A, C = this.atoms, R = new Set(C);
if (C.length <= 1) return p([], h(C), !1);
var S = new Map(), T = new Map();
try {
for (var b = d(C), w = b.next(); !w.done; w = b.next()) {
var F = w.value;
S.set(F, []), T.set(F, 0);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
w && !w.done && (e = b.return) && e.call(b);
} finally {
if (t) throw t.error;
}
}
try {
for (var E = d(C), N = E.next(); !N.done; N = E.next()) {
var x = N.value, I = this.getExtraDependencies(x);
try {
for (var D = (i = void 0, d(I)), M = D.next(); !M.done; M = D.next()) {
var W = M.value;
R.has(W) && (S.get(W).push(x), T.set(x, T.get(x) + 1));
}
} catch (t) {
i = {
error: t
};
} finally {
try {
M && !M.done && (a = D.return) && a.call(D);
} finally {
if (i) throw i.error;
}
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
N && !N.done && (o = E.return) && o.call(E);
} finally {
if (n) throw n.error;
}
}
try {
for (var P = d(C), O = P.next(); !O.done; O = P.next()) {
x = O.value;
var L = this.constraints.get(x);
if (L) try {
for (var G = (u = void 0, d(L)), B = G.next(); !B.done; B = G.next()) {
var k = B.value;
R.has(k) && (S.get(k).push(x), T.set(x, T.get(x) + 1));
}
} catch (t) {
u = {
error: t
};
} finally {
try {
B && !B.done && (c = G.return) && c.call(G);
} finally {
if (u) throw u.error;
}
}
}
} catch (t) {
s = {
error: t
};
} finally {
try {
O && !O.done && (l = P.return) && l.call(P);
} finally {
if (s) throw s.error;
}
}
var V = new Set(), U = [];
try {
for (var z = d(C), H = z.next(); !H.done; H = z.next()) {
var j = H.value;
0 === T.get(j) && V.add(j);
}
} catch (t) {
f = {
error: t
};
} finally {
try {
H && !H.done && (m = z.return) && m.call(z);
} finally {
if (f) throw f.error;
}
}
for (;V.size > 0; ) {
var Y = null;
try {
for (var q = (v = void 0, d(V)), X = q.next(); !X.done; X = q.next()) {
var Q = X.value;
(!Y || this.compareAtoms(Q, Y) < 0) && (Y = Q);
}
} catch (t) {
v = {
error: t
};
} finally {
try {
X && !X.done && (_ = q.return) && _.call(q);
} finally {
if (v) throw v.error;
}
}
V.delete(Y), U.push(Y);
try {
for (var J = (g = void 0, d(S.get(Y))), K = J.next(); !K.done; K = J.next()) {
var Z = K.value, $ = T.get(Z) - 1;
T.set(Z, $), 0 === $ && V.add(Z);
}
} catch (t) {
g = {
error: t
};
} finally {
try {
K && !K.done && (A = J.return) && A.call(J);
} finally {
if (g) throw g.error;
}
}
}
if (U.length !== C.length) {
var tt = C.filter(function(t) {
return !U.includes(t);
});
y(r.TopologicalCycle, {
nodes: tt.join(", ")
});
}
return U;
}, t;
}(), Re = function(t) {
function e(e, n) {
var o = t.call(this, e) || this;
return o._ownerAtomName = n, o;
}
return n(e, t), e.prototype.getExtraDependencies = function() {
return [];
}, e.prototype.execute = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s, l, u, h, p, f, m, v, y;
return c(this, function(c) {
switch (c.label) {
case 0:
c.trys.push([ 0, 7, 8, 9 ]), e = d(this.getInstances()), n = e.next(), c.label = 1;

case 1:
return n.done ? [ 3, 6 ] : (u = n.value, (o = u.ready()) ? [ 4, o ] : [ 3, 3 ]);

case 2:
c.sent(), c.label = 3;

case 3:
return (r = this._readyVariantChain(u.variantChain)) ? [ 4, r ] : [ 3, 5 ];

case 4:
c.sent(), c.label = 5;

case 5:
return n = e.next(), [ 3, 1 ];

case 6:
return [ 3, 9 ];

case 7:
return i = c.sent(), p = {
error: i
}, [ 3, 9 ];

case 8:
try {
n && !n.done && (f = e.return) && f.call(e);
} finally {
if (p) throw p.error;
}
return [ 7 ];

case 9:
a = null != t ? t : this._atomWorld.rootEid, this._atomWorld.currentGenChainOwner = this._ownerAtomName;
try {
for (s = d(this.getInstances()), l = s.next(); !l.done; l = s.next()) u = l.value, 
(h = null === (y = u.variantChain) || void 0 === y ? void 0 : y.resolve()) ? h.atomState(a, u.atomState) : u.onExecute(a, u.atomState);
} catch (t) {
m = {
error: t
};
} finally {
try {
l && !l.done && (v = s.return) && v.call(s);
} finally {
if (m) throw m.error;
}
}
return this._atomWorld.currentGenChainOwner = null, [ 2 ];
}
});
});
}, e.prototype._readyVariantChain = function(t) {
if (t) for (var e = t.getInstances(), n = 0; n < e.length; n++) {
var o = e[n].ready();
if (o) return this._readyVariantChainAsync(o, e, n + 1);
}
}, e.prototype._readyVariantChainAsync = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r;
return c(this, function(i) {
switch (i.label) {
case 0:
return [ 4, t ];

case 1:
i.sent(), o = n, i.label = 2;

case 2:
return o < e.length ? (r = e[o].ready()) ? [ 4, r ] : [ 3, 4 ] : [ 3, 5 ];

case 3:
i.sent(), i.label = 4;

case 4:
return o++, [ 3, 2 ];

case 5:
return [ 2 ];
}
});
});
}, e.prototype.topologicalSort = function() {
var e = t.prototype.topologicalSort.call(this);
return e.length, e;
}, e;
}(Ce), Se = globalThis, Te = Se.__errorHandler;
function be(t, e, n, o) {
var r, i, a, s, l;
if (Te) {
var u;
if (o.includes("atomengine") && (u = Se.__atomEngineCurrentWorld)) {
var c = null !== (r = Se.__atomEngineCurrentRenderAtom) && void 0 !== r ? r : "-";
n = "[AtomEngine logic=".concat(null !== (i = u.currentExecutingLogicAtom) && void 0 !== i ? i : "-", " domain=").concat(null !== (a = u.currentSignalEntityDomain) && void 0 !== a ? a : "-", " genChainOwner=").concat(null !== (s = u.currentGenChainOwner) && void 0 !== s ? s : "-", " renderAtom=").concat(c, " worldId=").concat(u.config.worldId, " worldPath=").concat(u.config.worldPath, " featuresVersion=").concat(null !== (l = u.appliedFeaturesVersion) && void 0 !== l ? l : "-", "] ").concat(n);
}
Te(t, e, n, o);
}
}
function we(t) {
var e = Se.__atomEngineCurrentWorld;
return Se.__atomEngineCurrentWorld = t, e;
}
function Fe(t) {
Se.__atomEngineCurrentWorld === t && (Se.__atomEngineCurrentWorld = void 0);
}
function Ee(t) {
Se.__atomEngineCurrentRenderAtom = t;
}
Object.defineProperty(Se, "__errorHandler", {
configurable: !0,
get: function() {
return be;
},
set: function(t) {
Te = t;
}
});
var Ne, xe = new Map(), Ie = new Map(), De = new Set([ "FunctionAtom", "ConfigAtom", "EntityDomainAtom", "EntityComponentAtom", "EntityRelationAtom", "AudioAtom", "WorldAtom", "DomainExtensionAtom" ]);
function Me(t) {
return t.__bindingMeta || (t.__bindingMeta = {
propToAtom: new Map(),
entityRenderer: null,
componentQueryProps: null,
routeFromProperty: null,
routeToProperty: null,
routeMode: null,
orderBeforeProperty: null,
orderAfterProperty: null,
chainRegistration: null,
variantSourceProperty: null,
chainWritableProperties: null,
signalPhase: null,
routePhase: null,
attachToProperty: null,
entityDataProperty: null
}), t.__bindingMeta;
}
function We(t, e) {
var n = xe.get(t);
if (!n) {
var o = Be(t), i = e ? Be(e) : void 0, a = Se.__atomEngineCurrentWorld, s = function(t) {
var e, n;
return void 0 === t ? "unknown" : String(null !== (n = null === (e = null == a ? void 0 : a.loadedFeatureNames) || void 0 === e ? void 0 : e.has(t)) && void 0 !== n ? n : "unknown");
};
y(r.AtomClassNotRegistered, {
atom: t,
requestedBy: e,
targetFeatureLoaded: s(o),
requesterFeatureLoaded: s(i),
worldId: null == a ? void 0 : a.config.worldId,
featuresVersion: null == a ? void 0 : a.appliedFeaturesVersion
});
}
return n;
}
if ("undefined" != typeof performance && "function" == typeof performance.now) Ne = function() {
return performance.now();
}; else {
var Pe = Date.now(), Oe = 0;
Ne = function() {
var t = Date.now() - Pe;
return t >= Oe && (Oe = t), Oe;
};
}
var Le = Ne;
function Ge(t) {
var e = t.lastIndexOf("_");
return -1 === e ? (y(r.AtomNameInvalid, {
atom: t,
reason: "缺少下划线分隔符"
}), t) : t.substring(0, e);
}
function Be(t) {
var e = t.lastIndexOf("_");
return -1 === e ? void 0 : t.substring(0, e);
}
function ke(t, e) {
De.has(t.atomType) || function(t, e) {
var n = t.__atomFeatureName, o = Ie.get(n);
o ? o.push(e) : Ie.set(n, [ e ]);
}(t, e);
}
function Ve(t) {
t.__dependencies || (t.__dependencies = []);
}
function Ue(t, e) {
Ve(t), t.__dependencies.includes(e) || t.__dependencies.push(e);
}
function ze(t) {
return function(e) {
return Ve(e), e.__atomName = t, e.__atomFeatureName = Ge(t), ke(e, t), xe.set(t, e), 
e;
};
}
function He(t) {
return function(e, n) {
var o = e.constructor, r = Me(o);
Ue(o, t), r.propToAtom.set(n, t), Object.defineProperty(e, n, {
get: function() {
var e = de.getBindValue(this, t, n);
return Object.defineProperty(this, n, {
value: e,
writable: !1,
enumerable: !1,
configurable: !1
}), e;
},
set: function() {},
enumerable: !1,
configurable: !0
});
};
}
function je(t, e) {
Me(t.constructor).entityRenderer = e;
}
function Ye(t, e) {
Me(t.constructor).chainRegistration = {
ownerProperty: e,
chainType: null,
chainField: null,
chainCtor: null
};
}
function qe(e) {
Me(e.constructor).routePhase = t.RoutePhase.Receive;
}
function Xe(t, e) {
Me(t.constructor).routeFromProperty = e;
}
function Qe(t) {
return function(e, n) {
var o = Me(e.constructor);
o.routeToProperty = n, o.routeMode = t;
};
}
function Je(t, e) {
return function(t, n) {
var o = Me(t.constructor);
e(o, n);
};
}
var Ke = Je(0, function(t, e) {
return t.orderBeforeProperty = e;
}), Ze = Je(0, function(t, e) {
return t.orderAfterProperty = e;
}), $e = {
start: {
chainType: "SignalStart",
chainField: "beginChain"
},
trigger: {
chainType: "SignalTrigger",
chainField: "triggerChain"
},
end: {
chainType: "SignalEnd",
chainField: "endChain"
}
}, tn = ((me = {})[t.RoutePhase.Receive] = {
chainType: "RouteReceive",
chainField: "receiveChain"
}, me[t.RoutePhase.Transform] = {
chainType: "RouteTransform",
chainField: "transformChain"
}, me[t.RoutePhase.Dispatch] = {
chainType: "RouteDispatch",
chainField: "dispatchChain"
}, me[t.RoutePhase.Filter] = {
chainType: "RouteFilter",
chainField: "filterChain"
}, me), en = ((ve = {}).ConfigAtom = {
chainType: "ConfigGen",
chainField: "genChain"
}, ve.RenderAtom = {
chainType: "RenderGen",
chainField: "genChain"
}, ve);
function nn(t) {
var e, n, o = t.constructor, i = o.__bindingMeta;
if (i) {
var a = pe(o), s = i.chainRegistration;
if (s && null === s.chainType) {
var l = i.propToAtom.get(s.ownerProperty);
if (l) {
var u = t.getDepAtomType(l);
if ("SignalAtom" === u) {
var c = null !== (e = i.signalPhase) && void 0 !== e ? e : "trigger", d = $e[c];
s.chainType = d.chainType, s.chainField = d.chainField, s.chainCtor = null;
} else if ("SignalRouterAtom" === u) {
if (!(c = i.routePhase)) return void y(r.RoutePhaseRequired, {
class: a,
property: s.ownerProperty,
target: l
});
d = tn[c], s.chainType = d.chainType, s.chainField = d.chainField, s.chainCtor = null;
} else {
if (!(d = en[u])) return void y(r.OnChainTargetNotChainable, {
class: a,
target: l,
actual: null != u ? u : "类未注册（检查模块是否被 import/加载执行）"
});
s.chainType = d.chainType, s.chainField = d.chainField, s.chainCtor = Re, (null !== (n = i.chainWritableProperties) && void 0 !== n ? n : i.chainWritableProperties = new Set()).add(s.ownerProperty);
}
}
}
}
}
var on, rn, an = "G_FAtom_RootDomain", sn = "G_FAtom_WorldDomain", ln = "G_FAtom_Update", un = "G_FAtom_Pointer", cn = "G_FAtom_Keyboard", dn = "G_FAtom_WindowSize", hn = "G_FAtom_CanvasResize", pn = "G_FAtom_Scroll", fn = "G_FAtom_SizeInput", mn = "G_FAtom_PositionInput", vn = "G_FAtom_Edit", yn = "G_FAtom_Animation", _n = "G_FAtom_WorldCreate", gn = "G_FAtom_WorldLoadProgress", An = "G_FAtom_PageHide", Cn = "G_FAtom_PageShow", Rn = "G_FAtom_RealTime", Sn = "G_FAtom_SaveProgress", Tn = "G_FAtom_AutoSaveSignal", bn = "G_FAtom_AutoSaveRouter", wn = "G_FAtom_TweenRunnerSignal", Fn = "G_FAtom_TweenRunner", En = "G_FAtom_ChildOf", Nn = "G_FAtom_Transform", xn = "G_FAtom_BoxComponent", In = "G_FAtom_WorldState", Dn = "G_FAtom_DomainOf", Mn = "G_FAtom_StopTween", Wn = "G_FAtom_OriginalCtrlInput", Pn = "G_FAtom_AlgorithmOfferResult", On = "G_FAtom_ReloadConfigInput", Ln = "G_FAtom_Silent", Gn = "G_FAtom_JsonData", Bn = "G_FAtom_PreButtonClick", kn = "G_FAtom_PreTouchStart", Vn = "G_FAtom_PreTouchEnd", Un = "G_FAtom_RichTextClick", zn = function() {
function t(t) {
this._bundleTotal = 0, this._bundleCompleted = 0, this._atomTotal = null, this._atomCompleted = 0, 
this._error = null, this._cancelled = !1, this._lastNotified = 0, this._world = t;
}
return Object.defineProperty(t.prototype, "progress", {
get: function() {
return .3 * (this._bundleTotal > 0 ? this._bundleCompleted / this._bundleTotal : 1) + .7 * (null === this._atomTotal ? 0 : this._atomTotal > 0 ? this._atomCompleted / this._atomTotal : 1);
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "isDone", {
get: function() {
return this._bundleCompleted >= this._bundleTotal && null !== this._atomTotal && this._atomCompleted >= this._atomTotal && !this._error && !this._cancelled;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(t.prototype, "completed", {
get: function() {
return this._bundleCompleted + this._atomCompleted;
},
enumerable: !1,
configurable: !0
}), t.prototype.addBundleItems = function(t) {
void 0 === t && (t = 1), this._bundleTotal += t;
}, t.prototype.completeBundle = function(t) {
void 0 === t && (t = 1), this._bundleCompleted += t, this._tryNotify();
}, t.prototype.addItems = function(t) {
var e;
void 0 === t && (t = 1), this._atomTotal = (null !== (e = this._atomTotal) && void 0 !== e ? e : 0) + t;
}, t.prototype.startAtomPhase = function() {
var t;
null !== (t = this._atomTotal) && void 0 !== t || (this._atomTotal = 0), this._tryNotify();
}, t.prototype.complete = function(t) {
void 0 === t && (t = 1), this._atomCompleted += t, this._tryNotify();
}, t.prototype.fail = function(t) {
var e;
this._error = t;
var n = this._world.config;
null === (e = n.onLoadError) || void 0 === e || e.call(n, t), this._notifyParent(!1, t);
var o = n.parentWorld, r = n.entityInParent;
if (o && !o.disposed && r) {
var i = o.getAtomIns(sn);
i.has(r) && i.destroy(r);
}
}, t.prototype._tryNotify = function() {
if (!this._error && !this._cancelled) {
var t = this.progress;
(this.isDone || t - this._lastNotified >= .02 || t >= 1) && (this._lastNotified = t, 
this._notifyProgress());
}
}, t.prototype._notifyProgress = function() {
var t, e = this._world.config;
e.parentWorld, null === (t = e.onLoadProgress) || void 0 === t || t.call(e, this.progress, this.completed), 
this._notifyParent(this.isDone);
}, t.prototype._notifyParent = function(t, e, n) {
var o, r = this._world.config, i = r.parentWorld, a = r.entityInParent;
if (i && a && !i.disposed) {
var s = i.getAtomIns(gn);
s.data.worldId = this._world.config.worldId, s.data.progress = t ? 1 : this.progress, 
s.data.isDone = t, s.data.isCancelled = null != n && n, s.data.error = null !== (o = null == e ? void 0 : e.message) && void 0 !== o ? o : "", 
this._world.universe.host.notifyWorldLoadState(i.config.worldId, s.data), i.getAtomIns(sn).has(a) && s.emit(a);
}
}, t.prototype.cancel = function() {
this.isDone || this._error || this._cancelled || (this._cancelled = !0, this._notifyParent(!1, void 0, !0));
}, t;
}();
t.G_FAtom = void 0, ((on = t.G_FAtom || (t.G_FAtom = {})).FeatureName || (on.FeatureName = {})).Name = "G_FAtom", 
function(t) {
t[t.RenderCreate = 0] = "RenderCreate", t[t.RenderDestroy = 1] = "RenderDestroy", 
t[t.RelationAdd = 2] = "RelationAdd", t[t.RelationRemove = 3] = "RelationRemove", 
t[t.WorldCreate = 4] = "WorldCreate", t[t.WorldDestroy = 5] = "WorldDestroy", t[t.WorldRestart = 6] = "WorldRestart";
}(rn || (rn = {}));
var Hn, jn, Yn, qn, Xn, Qn, Jn, Kn, Zn, $n, to = function() {
function e(t) {
this.universe = null, this.config = {
worldId: "",
worldPath: "",
randomSeed: 0,
parentWorld: null,
entityInParent: 0,
initialWidth: 0,
initialHeight: 0,
multiTouch: !1
}, this.isPaused = !1, this.disposed = !1, this.isDownloadOnly = !1, this._creationOrder = [], 
this.frameTimeIncrement = 1 / 60, this.performanceCutoff = 1, this.minimumUpdateInterval = 1 / 60, 
this.renderTimeScale = 1, this._childWorlds = new Map(), this.atomSnapshots = {}, 
this.pendingRouterSignals = [], this.randomSeed = 0, this.ecsWorld = function() {
for (var t, e, n = [], o = 0; o < arguments.length; o++) n[o] = arguments[o];
return n.forEach(function(n) {
"object" == typeof n && "dense" in n && "sparse" in n && "aliveCount" in n ? t = n : "object" == typeof n && (e = n);
}), function(t, e) {
return T(t || {}, F, {
entityIndex: e || b(),
entityMasks: [ [] ],
entityComponents: new Map(),
bitflag: 1,
componentMap: new Map(),
componentCount: 0,
queries: new Set(),
queriesHashMap: new Map(),
notQueries: new Set(),
dirtyQueries: new Set(),
entitiesWithRelations: new Set(),
hierarchyData: new Map(),
hierarchyActiveRelations: new Set(),
hierarchyQueryCache: new Map()
});
}(e, t);
}(), this.ready = !1, this.autoResizeBox = !1, this.accumulatedTimeParameter = 0, 
this.atomInstanceMap = new Map(), this.signalRouters = new Map(), this.dirtyEntityComponents = new Map(), 
this.domainToLogicMap = new Map(), this.storageAtoms = new Set(), this.dirtyStorageAtoms = new Set(), 
this._shouldSaveProgress = !1, this.expandedEntityDirtyAtomsCache = null, this.prevMultiTouch = void 0, 
this.worldChanges = [], this.pendingInputs = [], this.pendingReadyAtoms = [], this.currentSignalEntityDomain = null, 
this.currentExecutingLogicAtom = null, this.currentGenChainOwner = null, this.universe = t;
}
return e.prototype.isSignalEntityDomain = function(t) {
return this.currentSignalEntityDomain === t;
}, e.prototype.initFromConfig = function(t) {
this.config = i({}, t), this.config.randomSeed = t.randomSeed || Math.floor(2147483646 * Math.random()) + 1;
}, e.prototype._computeTimeSteps = function(t, e, n) {
if ((t += n) < e) return [ 0, t ];
var o = Math.min(Math.floor(t / e), this.performanceCutoff), r = t - o * e;
return [ o, Math.min(r, this.minimumUpdateInterval) ];
}, e.prototype.worldUpdate = function(t) {
var e = -1 === t ? this.frameTimeIncrement : t, n = h(this._computeTimeSteps(this.accumulatedTimeParameter, this.frameTimeIncrement, e), 2), o = n[0], r = n[1];
this.accumulatedTimeParameter = r;
for (var i = 0; i < o; i++) this.updateSignal.emit(), this._processAllSignals();
this._shouldSaveProgress && (this._shouldSaveProgress = !1, this.universe.saveAllStorage(this.dirtyStorageAtoms), 
this.dirtyStorageAtoms.clear());
}, e.prototype.markSaveProgress = function() {
this._shouldSaveProgress = !0;
}, e.prototype.markEntityComponentDirty = function(t, e) {
var n = this.dirtyEntityComponents.get(t);
n || (n = new Set(), this.dirtyEntityComponents.set(t, n)), n.add(e);
}, e.prototype.markStorageDirty = function(t) {
this.storageAtoms.has(t) && this.dirtyStorageAtoms.add(t);
}, e.prototype.expandEntityDirtyAtoms = function(t) {
var e, n, o, r;
if (this.expandedEntityDirtyAtomsCache) return this.expandedEntityDirtyAtomsCache;
var i = new Map(), a = function(t) {
var e = i.get(t);
return e || (e = new Set(), i.set(t, e)), e;
};
try {
for (var s = d(this.dirtyEntityComponents), l = s.next(); !l.done; l = s.next()) {
var u = h(l.value, 2), c = u[0], p = u[1], f = a(c);
try {
for (var m = (o = void 0, d(p)), v = m.next(); !v.done; v = m.next()) {
var y = v.value;
f.add(y);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
v && !v.done && (r = m.return) && r.call(m);
} finally {
if (o) throw o.error;
}
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (n = s.return) && n.call(s);
} finally {
if (e) throw e.error;
}
}
return this.expandedEntityDirtyAtomsCache = i, i;
}, e.prototype.markRelationChange = function(t, e, n, o) {
if ("number" != typeof e || "number" != typeof n) throw new Error("[AtomEngine] markRelationChange: invalid eid | relation=".concat(t, " | source=").concat(String(e), " | target=").concat(String(n), " | isAdd=").concat(o));
this.worldChanges.push({
type: o ? rn.RelationAdd : rn.RelationRemove,
relationName: t,
source: e,
target: n
});
}, e.prototype.markRenderCreate = function(t, e) {
this.worldChanges.push({
type: rn.RenderCreate,
eid: t,
domainName: e
});
}, e.prototype.markRenderDestroy = function(t) {
this.worldChanges.push({
type: rn.RenderDestroy,
eid: t
});
}, e.prototype.markWorldCreate = function(t) {
this.worldChanges.push({
type: rn.WorldCreate,
eid: t
});
}, e.prototype.markWorldDestroy = function(t) {
this.worldChanges.push({
type: rn.WorldDestroy,
eid: t
});
}, e.prototype.markWorldRestart = function(t) {
this.worldChanges.push({
type: rn.WorldRestart,
eid: t
});
}, e.prototype.stopTween = function(t) {
this.hasAtomIns(Mn) && this.getAtomIns(Mn).atomState(t);
}, e.prototype.getAtomData = function(t, e) {
var n = this.atomInstanceMap.get(t);
return "EntityDomainAtom" === e ? n : null == n ? void 0 : n.atomState;
}, e.prototype.hasAtomIns = function(t) {
return this.atomInstanceMap.has(t);
}, e.prototype.getAtomIns = function(t) {
var e = this.atomInstanceMap.get(t);
return e || y(r.AtomInstanceNotFound, {
atom: t
}), e;
}, e.prototype.getAtomType = function(t) {
var e = xe.get(t);
if (e) return e.atomType;
y(r.AtomTypeQueryFailed, {
atom: t
});
}, e.prototype._processAllSignals = function() {
for (;this.pendingInputs.length > 0; ) {
var t = this.pendingInputs.shift(), e = this.getAtomIns(t.signalName);
Object.assign(e.atomState, t.inputData), e.trigger(t.eidList);
}
var n = this.pendingRouterSignals;
for (this.pendingRouterSignals = []; n.length > 0; ) (t = n.shift()).fromRouterName ? this.getAtomIns(t.fromRouterName).handleSignal(t) : (e = this.getAtomIns(t.signalName)).trigger(t.eidList);
}, e.prototype.pushInput = function(t, e, n) {
this.pendingInputs.push({
signalName: t.atomName,
eidList: [ e ],
fromRouterName: null,
inputData: n
});
}, e.prototype.registerFeatures = function(t) {
this.loadTracker = new zn(this);
var e = this.universe.featureResolver;
this.isDownloadOnly = e.isDownloadOnlyWorld(this.config.worldId), this.isDownloadOnly && !this.config.parentWorld && y(r.DownloadOnlyRootWorld, {
worldId: this.config.worldId
}), e.hasFeatures(this.config.worldId) || y(r.WorldFeaturesEmpty, i({
worldId: this.config.worldId
}, e.getWorldFeaturesDebugParams(this.config.worldId))), this._loadAndInitPromise = this._loadAndInit(t);
}, e.prototype._triggerSilentPreloads = function() {
var t, e, n = this.universe.featureResolver.getFeatureSet(this.config.worldId), o = [];
try {
for (var r = d(n), i = r.next(); !i.done; i = r.next()) {
var a = h(i.value, 2), s = a[0];
a[1].silent && o.push(s);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (t) throw t.error;
}
}
0 !== o.length && this.universe.asset.preloadFeatures(o).catch(function() {});
}, e.prototype._loadAndInit = function(e) {
return u(this, void 0, void 0, function() {
var n, o, r, i, a, s, l, u, p, f, m, v, y, _, g, A, C, R, S, T, b, w, F, E, N, x, I, D, M, W = this;
return c(this, function(c) {
switch (c.label) {
case 0:
n = this.universe.featureResolver, o = this.config.worldId, r = n.getFeatureSet(o), 
c.label = 1;

case 1:
return c.trys.push([ 1, 5, , 6 ]), we(this), [ 4, this.universe.asset.ensureSessionPlan(o) ];

case 2:
if (c.sent(), this.disposed) return [ 2 ];
we(this), i = new Map();
try {
for (a = d(r), s = a.next(); !s.done; s = a.next()) l = h(s.value, 2), u = l[0], 
(!(p = l[1]).silent || this.universe.asset.isResourcesDownloaded(u)) && i.set(u, p);
} catch (t) {
w = {
error: t
};
} finally {
try {
s && !s.done && (F = a.return) && F.call(a);
} finally {
if (w) throw w.error;
}
}
return this.loadTracker.addBundleItems(i.size), [ 4, this.universe.asset.retainFeatures(i, function() {
W.loadTracker.completeBundle();
}) ];

case 3:
if (f = c.sent(), m = this.universe.asset.getAppliedFeaturesVersion(f), this.appliedFeaturesVersion = m, 
void 0 !== m && this.universe.host.track("g_game_applied_start", {
features_version: m
}), this.disposed) return [ 2 ];
we(this);
try {
for (v = d([ Dn, En ]), y = v.next(); !y.done; y = v.next()) T = y.value, this._createAtom(T, "核心原子");
} catch (t) {
E = {
error: t
};
} finally {
try {
y && !y.done && (N = v.return) && N.call(v);
} finally {
if (E) throw E.error;
}
}
f.add(t.G_FAtom.FeatureName.Name), this.loadedFeatureNames = f;
try {
for (_ = d(f), g = _.next(); !g.done; g = _.next()) {
A = g.value, C = Ie.get(A) || [];
try {
for (D = void 0, R = d(C), S = R.next(); !S.done; S = R.next()) T = S.value, this._createAtom(T, "特性 ".concat(A));
} catch (t) {
D = {
error: t
};
} finally {
try {
S && !S.done && (M = R.return) && M.call(R);
} finally {
if (D) throw D.error;
}
}
}
} catch (t) {
x = {
error: t
};
} finally {
try {
g && !g.done && (I = _.return) && I.call(_);
} finally {
if (x) throw x.error;
}
}
return this.loadTracker.startAtomPhase(), [ 4, this._initAndStart(e) ];

case 4:
return c.sent(), Fe(this), [ 3, 6 ];

case 5:
return b = c.sent(), this.loadTracker.fail(b), [ 3, 6 ];

case 6:
return [ 2 ];
}
});
});
}, e.prototype._initAndStart = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s, l;
return c(this, function(u) {
switch (u.label) {
case 0:
u.trys.push([ 0, 9, , 10 ]), we(this), 0 === this.randomSeed && (this.randomSeed = this.config.randomSeed), 
u.label = 1;

case 1:
u.trys.push([ 1, 6, 7, 8 ]), e = d(this.pendingReadyAtoms), n = e.next(), u.label = 2;

case 2:
return n.done ? [ 3, 5 ] : (o = n.value, (r = o.ready()) ? [ 4, r ] : [ 3, 4 ]);

case 3:
if (u.sent(), this.disposed) return [ 2 ];
we(this), u.label = 4;

case 4:
return n = e.next(), [ 3, 2 ];

case 5:
return [ 3, 8 ];

case 6:
return i = u.sent(), s = {
error: i
}, [ 3, 8 ];

case 7:
try {
n && !n.done && (l = e.return) && l.call(e);
} finally {
if (s) throw s.error;
}
return [ 7 ];

case 8:
return this.pendingReadyAtoms = [], this.isDownloadOnly ? (this.universe.asset.markWorldDownloaded(this.config.worldId), 
this._autoDestroyDownloadOnly(), Fe(this), [ 2 ]) : (this._start(), this.ready = !0, 
this.universe.asset.markWorldDownloaded(this.config.worldId), this._triggerSilentPreloads(), 
null == t || t(), Fe(this), [ 3, 10 ]);

case 9:
return a = u.sent(), this.loadTracker.fail(a), [ 3, 10 ];

case 10:
return [ 2 ];
}
});
});
}, e.prototype._start = function() {
this.updateSignal = this.getAtomIns(ln), this.config.parentWorld && (this.prevMultiTouch = this.universe.render.setMultiTouch(this.config.multiTouch), 
this.universe.asset.downloadCtrl(.5));
var t = this.getAtomIns(an);
this.rootEid = t.create();
var e = this.config, n = e.initialWidth, o = e.initialHeight;
if (n > 0 || o > 0) {
var r = this.getAtomIns(dn);
r.data.width = n, r.data.height = o;
}
var i = this.getAtomIns(_n);
i.data.appliedFeaturesVersion = this.appliedFeaturesVersion, i.emit(this.rootEid);
}, e.prototype._autoDestroyDownloadOnly = function() {
var t = this.config, e = t.parentWorld, n = t.entityInParent;
if (e && !e.disposed && n) {
var o = e.getAtomIns(sn);
o.has(n) && o.destroy(n);
}
}, e.prototype._createAtom = function(t, e) {
if (!this.atomInstanceMap.has(t)) {
var n = new (We(t, e))();
this.atomInstanceMap.set(t, n), n.init(t, this), this.pendingReadyAtoms.push(n), 
this._creationOrder.push(t);
}
}, e.prototype.addChildWorld = function(t, e) {
this._childWorlds.set(t, e);
}, e.prototype.removeChildWorld = function(t) {
this._childWorlds.delete(t);
}, e.prototype.getChildWorld = function(t) {
return this._childWorlds.get(t);
}, e.prototype.forEachChildWorld = function(t) {
var e, n;
try {
for (var o = d(this._childWorlds.entries()), r = o.next(); !r.done; r = o.next()) {
var i = h(r.value, 2), a = i[0];
t(i[1], a);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, e.prototype.resolveChildWorldConfig = function(t) {
var e = this.getAtomIns(sn), n = e.worldState, o = n.worldId[t];
if (!o) return y(r.WorldEntityNoId, {
entity: String(t)
}), null;
var i = n.randomSeed[t] || Math.floor(2147483646 * Math.random()) + 1, a = n.multiTouch[t];
return {
worldId: o,
worldPath: "".concat(this.config.worldPath, "/").concat(o),
randomSeed: i,
parentWorld: this,
entityInParent: t,
initialWidth: e.box.width[t],
initialHeight: e.box.height[t],
multiTouch: a
};
}, e.prototype.dispose = function() {
var t, e, n, o, r, i, a, s = "开始销毁";
try {
if (s = "还原多点触摸状态", this.universe && this.config.parentWorld && this.universe.render.setMultiTouch(this.prevMultiTouch), 
s = "标记世界已销毁", this.disposed = !0, s = "取消未完成的加载", !this.ready && this.loadTracker && this.loadTracker.cancel(), 
this.universe) {
this.dirtyStorageAtoms.size > 0 && (s = "保存脏 storage 数据", this.universe.saveAllStorage(this.dirtyStorageAtoms)), 
s = "检查下载控制";
var l = !0;
this.universe.forEachWorld(function(t) {
t.disposed || !t.config.parentWorld || t.isDownloadOnly || (l = !1);
}), l && this.universe.asset.downloadCtrl(0), s = "读取世界特性";
var u = this.universe.featureResolver.getFeatureSet(this.config.worldId), c = p([], h(u.keys()), !1);
if (u.size > 0) {
s = "释放特性 [".concat(c.join(", "), "]");
var d = this.universe.asset;
if (!this.ready && this._loadAndInitPromise) {
this.config.worldId;
this._loadAndInitPromise.finally(function() {
try {
d.releaseFeatures(u);
} catch (t) {}
});
} else d.releaseFeatures(u);
}
s = "清理渲染资源", this.universe.destroyWorldRender(this), s = "通知宿主世界销毁", this.universe.host.notifyWorldDestroy(this.config.worldId);
}
s = "逆序销毁原子，共 ".concat(this._creationOrder.length, " 个");
for (var f = this._creationOrder.length - 1; f >= 0; f--) {
var m = this._creationOrder[f];
a = m, s = "销毁原子 ".concat(m, " (").concat(this._creationOrder.length - f, "/").concat(this._creationOrder.length, ")");
var v = this.atomInstanceMap.get(m);
v && (v.dispose(), this.atomInstanceMap.delete(m));
}
a = void 0, this._creationOrder = [], s = "断开外部引用", (null === (t = null == this ? void 0 : this.universe) || void 0 === t ? void 0 : t.host) && this.universe.host.clearAdRequestWorld(this), 
this.universe = null, this.config.parentWorld = null, this._childWorlds.clear(), 
s = "清理原子实例和路由缓存", this.atomInstanceMap.clear(), this.signalRouters.clear(), this.domainToLogicMap.clear(), 
this.storageAtoms.clear(), s = "清理运行时状态", this.dirtyStorageAtoms.clear(), this.dirtyEntityComponents.clear(), 
this.expandedEntityDirtyAtomsCache = null, this.worldChanges.length = 0, this.pendingInputs.length = 0, 
this.pendingReadyAtoms.length = 0, s = "清理运行时快照", this.atomSnapshots = {}, this.pendingRouterSignals.length = 0, 
this.randomSeed = 0, s = "清理 bitecs ECS World", delete this.ecsWorld[F];
} catch (t) {
if (t instanceof Error) {
var y = null !== (n = null === (e = this.config.parentWorld) || void 0 === e ? void 0 : e.config.worldId) && void 0 !== n ? n : "-", _ = this.universe ? "alive" : "cleared", g = [ "worldId=".concat(this.config.worldId), "worldPath=".concat(this.config.worldPath), "stage=".concat(s), "disposingAtom=".concat(null != a ? a : "-"), "ready=".concat(this.ready), "disposed=".concat(this.disposed), "parentWorld=".concat(y), "entityInParent=".concat(this.config.entityInParent), "universe=".concat(_), "atoms=".concat(this.atomInstanceMap.size), "creationOrder=".concat(this._creationOrder.length), "currentLogic=".concat(null !== (o = this.currentExecutingLogicAtom) && void 0 !== o ? o : "-"), "currentDomain=".concat(null !== (r = this.currentSignalEntityDomain) && void 0 !== r ? r : "-"), "genChainOwner=".concat(null !== (i = this.currentGenChainOwner) && void 0 !== i ? i : "-") ].join(" ");
t.message = "[AtomEngine][销毁] 世界销毁失败: ".concat(g, " ---\x3e ").concat(t.message);
}
throw t;
} finally {
Fe(this);
}
}, e;
}();
function eo(t, e) {
for (var n = [], o = 2; o < arguments.length; o++) n[o - 2] = arguments[o];
return {
type: t,
props: e,
children: n.length ? n : void 0
};
}
t.WidgetAlignMode = void 0, (Hn = t.WidgetAlignMode || (t.WidgetAlignMode = {})).Once = "Once", 
Hn.OnWindowResize = "OnWindowResize", Hn.Always = "Always", t.LayoutResizeMode = void 0, 
(jn = t.LayoutResizeMode || (t.LayoutResizeMode = {})).None = "None", jn.Container = "Container", 
jn.Children = "Children", t.LayoutAxisDirection = void 0, (Yn = t.LayoutAxisDirection || (t.LayoutAxisDirection = {})).Horizontal = "Horizontal", 
Yn.Vertical = "Vertical", t.LayoutVerticalDirection = void 0, (qn = t.LayoutVerticalDirection || (t.LayoutVerticalDirection = {})).TopToBottom = "TopToBottom", 
qn.BottomToTop = "BottomToTop", t.LayoutHorizontalDirection = void 0, (Xn = t.LayoutHorizontalDirection || (t.LayoutHorizontalDirection = {})).LeftToRight = "LeftToRight", 
Xn.RightToLeft = "RightToLeft", t.ButtonTransition = void 0, (Qn = t.ButtonTransition || (t.ButtonTransition = {})).None = "None", 
Qn.Color = "Color", Qn.Sprite = "Sprite", Qn.Scale = "Scale", t.TextHorizontalAlign = void 0, 
(Jn = t.TextHorizontalAlign || (t.TextHorizontalAlign = {}))[Jn.LEFT = 0] = "LEFT", 
Jn[Jn.CENTER = 1] = "CENTER", Jn[Jn.RIGHT = 2] = "RIGHT", t.LabelCacheMode = void 0, 
(Kn = t.LabelCacheMode || (t.LabelCacheMode = {}))[Kn.NONE = 0] = "NONE", Kn[Kn.BITMAP = 1] = "BITMAP", 
Kn[Kn.CHAR = 2] = "CHAR", t.RenderNodeType = void 0, (Zn = t.RenderNodeType || (t.RenderNodeType = {})).Node = "Node", 
Zn.Sprite = "Sprite", Zn.Text = "Text", Zn.Spine = "Spine", Zn.Graphics = "Graphics", 
Zn.TraceGraphics = "TraceGraphics", Zn.Mask = "Mask", Zn.ScrollView = "ScrollView", 
Zn.Camera = "Camera", Zn.Streak = "Streak", Zn.Particle = "Particle", Zn.EditBox = "EditBox", 
Zn.Mesh = "Mesh", Zn.Texture2D = "Texture2D", Zn.RichText = "RichText", t.LayoutType = void 0, 
($n = t.LayoutType || (t.LayoutType = {})).Horizontal = "Horizontal", $n.Vertical = "Vertical", 
$n.Grid = "Grid";
var no, oo, ro, io = {
name: function(t, e) {
return t.setName(e);
},
cameraLayer: function(t, e) {
return t.setCameraLayer(e);
},
x: function(t, e) {
return t.setX(e);
},
y: function(t, e) {
return t.setY(e);
},
z: function(t, e) {
return t.setZ(e);
},
angle: function(t, e) {
return t.setAngle(e);
},
scale: function(t, e) {
return t.setScale(e);
},
quatX: function(t, e) {
return t.setQuatX(e);
},
quatY: function(t, e) {
return t.setQuatY(e);
},
quatZ: function(t, e) {
return t.setQuatZ(e);
},
quatW: function(t, e) {
return t.setQuatW(e);
},
scaleX: function(t, e) {
return t.setScaleX(e);
},
scaleY: function(t, e) {
return t.setScaleY(e);
},
scaleZ: function(t, e) {
return t.setScaleZ(e);
},
alpha: function(t, e) {
return t.setAlpha(e);
},
rgb: function(t, e) {
return t.setRgb(e);
},
active: function(t, e) {
return t.setActiveBase(e);
},
width: function(t, e) {
return t.setWidth(e);
},
height: function(t, e) {
return t.setHeight(e);
},
anchorX: function(t, e) {
return t.setAnchorX(e);
},
anchorY: function(t, e) {
return t.setAnchorY(e);
},
anchorZ: function(t, e) {
return t.setAnchorZ(e);
},
zIndex: function(t, e) {
return t.setZIndex(e);
},
depth: function(t, e) {
return t.setDepth(e);
},
event: {
buttonClick: function(t, e) {
return t.setButtonClick(e);
},
touchStart: function(t, e) {
return t.setOnTouchStart(e);
},
touchMove: function(t, e) {
return t.setOnTouchMove(e);
},
touchEnd: function(t, e) {
return t.setOnTouchEnd(e);
},
touchCancel: function(t, e) {
return t.setOnTouchCancel(e);
},
sizeChanged: function(t, e) {
return t.setOnSizeChanged(e);
},
positionChanged: function(t, e) {
return t.setOnPositionChanged(e);
}
},
eventOptions: {
touchStart: function(t, e) {
return t.setTouchStartOption(e);
},
touchMove: function(t, e) {
return t.setTouchMoveOption(e);
},
touchEnd: function(t, e) {
return t.setTouchEndOption(e);
},
touchCancel: function(t, e) {
return t.setTouchCancelOption(e);
}
},
blockInputEvents: function(t, e) {
return t.setBlockInputEvents(e);
},
widget: {
enabled: function(t, e) {
return t.setWidgetEnabled(e);
},
safeArea: function(t, e) {
return t.setSafeAreaEnabled(e);
},
isAlignTop: function(t, e) {
return t.setWidgetAlignTop(e);
},
isAlignBottom: function(t, e) {
return t.setWidgetAlignBottom(e);
},
isAlignLeft: function(t, e) {
return t.setWidgetAlignLeft(e);
},
isAlignRight: function(t, e) {
return t.setWidgetAlignRight(e);
},
isAlignHorizontalCenter: function(t, e) {
return t.setWidgetAlignHorizontalCenter(e);
},
isAlignVerticalCenter: function(t, e) {
return t.setWidgetAlignVerticalCenter(e);
},
isAbsoluteTop: function(t, e) {
return t.setWidgetAbsoluteTop(e);
},
isAbsoluteBottom: function(t, e) {
return t.setWidgetAbsoluteBottom(e);
},
isAbsoluteLeft: function(t, e) {
return t.setWidgetAbsoluteLeft(e);
},
isAbsoluteRight: function(t, e) {
return t.setWidgetAbsoluteRight(e);
},
isAbsoluteHorizontalCenter: function(t, e) {
return t.setWidgetAbsoluteHorizontalCenter(e);
},
isAbsoluteVerticalCenter: function(t, e) {
return t.setWidgetAbsoluteVerticalCenter(e);
},
top: function(t, e) {
return t.setWidgetTop(e);
},
bottom: function(t, e) {
return t.setWidgetBottom(e);
},
left: function(t, e) {
return t.setWidgetLeft(e);
},
right: function(t, e) {
return t.setWidgetRight(e);
},
horizontalCenter: function(t, e) {
return t.setWidgetHorizontalCenter(e);
},
verticalCenter: function(t, e) {
return t.setWidgetVerticalCenter(e);
},
alignMode: function(t, e) {
return t.setWidgetAlignMode(e);
}
},
layout: {
enabled: function(t, e) {
return t.setLayoutEnabled(e);
},
type: function(t, e) {
return t.setLayoutType(e);
},
resizeMode: function(t, e) {
return t.setLayoutResizeMode(e);
},
spacingX: function(t, e) {
return t.setLayoutSpacingX(e);
},
spacingY: function(t, e) {
return t.setLayoutSpacingY(e);
},
paddingLeft: function(t, e) {
return t.setLayoutPaddingLeft(e);
},
paddingRight: function(t, e) {
return t.setLayoutPaddingRight(e);
},
paddingTop: function(t, e) {
return t.setLayoutPaddingTop(e);
},
paddingBottom: function(t, e) {
return t.setLayoutPaddingBottom(e);
},
startAxis: function(t, e) {
return t.setLayoutStartAxis(e);
},
verticalDirection: function(t, e) {
return t.setLayoutVerticalDirection(e);
},
horizontalDirection: function(t, e) {
return t.setLayoutHorizontalDirection(e);
},
affectedByScale: function(t, e) {
return t.setLayoutAffectedByScale(e);
}
},
button: {
enabled: function(t, e) {
return t.setButtonEnabled(e);
},
interactable: function(t, e) {
return t.setButtonInteractable(e);
},
enableAutoGrayEffect: function(t, e) {
return t.setButtonEnableAutoGrayEffect(e);
},
transition: function(t, e) {
return t.setButtonTransition(e);
},
duration: function(t, e) {
return t.setButtonDuration(e);
},
zoomScale: function(t, e) {
return t.setButtonZoomScale(e);
},
normalColor: function(t, e) {
return t.setButtonNormalColor(e);
},
normalAlpha: function(t, e) {
return t.setButtonNormalAlpha(e);
},
pressedColor: function(t, e) {
return t.setButtonPressedColor(e);
},
pressedAlpha: function(t, e) {
return t.setButtonPressedAlpha(e);
},
hoverColor: function(t, e) {
return t.setButtonHoverColor(e);
},
hoverAlpha: function(t, e) {
return t.setButtonHoverAlpha(e);
},
disabledColor: function(t, e) {
return t.setButtonDisabledColor(e);
},
disabledAlpha: function(t, e) {
return t.setButtonDisabledAlpha(e);
},
normalSprite: function(t, e) {
return t.setButtonNormalSprite(e);
},
pressedSprite: function(t, e) {
return t.setButtonPressedSprite(e);
},
hoverSprite: function(t, e) {
return t.setButtonHoverSprite(e);
},
disabledSprite: function(t, e) {
return t.setButtonDisabledSprite(e);
},
target: function(t, e) {
return t.setButtonTarget(e);
}
},
material: function(t, e) {
return t.setMaterial(e);
}
}, ao = function() {
function t(t) {
this.universe = t, this.root = null, this._lastPageHideTimeMs = 0, this.shouldRestoreContext = !1;
}
return t.prototype.getSafeAreaRect = function() {
var t = 1280 / 716, e = this.getWinSize(), n = this.universe.getRootWindowSize(), o = Math.max(e.width, e.height), r = Math.min(e.width, e.height), i = Math.max(n.width, n.height), a = Math.min(n.width, n.height);
if (!(r / o <= 760 / 1334 && (o / r > t || i / a > t))) return {
x: 0,
y: 0,
width: e.width,
height: e.height,
offset: 0
};
var s = .037 * Math.max(o, i);
return e.height >= e.width ? {
x: 0,
y: 0,
width: e.width,
height: e.height - s,
offset: s
} : {
x: s,
y: 0,
width: e.width - s,
height: e.height,
offset: s
};
}, t.prototype.onPageHide = function() {
this._lastPageHideTimeMs = Date.now(), this.universe.emitInputToAllWorlds(An, {}), 
this.universe.update(-1), this.universe.forceSaveAllStorage();
}, t.prototype.onPageShow = function() {
this.shouldRestoreContext && this.universe.onContextRestore();
var t = Date.now(), e = this._lastPageHideTimeMs > 0 ? Math.max(0, t - this._lastPageHideTimeMs) : 0;
this._lastPageHideTimeMs = 0, this.universe.emitInputToAllWorlds(Cn, {
durationMs: e
});
}, t.prototype.onCanvasResize = function() {
this.universe.emitInputToAllWorlds(hn, {});
}, t;
}();
function so(e) {
switch (e) {
case t.PixelFormat.RGBA8888:
return 4;

case t.PixelFormat.RGB888:
return 3;

case t.PixelFormat.RGB565:
case t.PixelFormat.RGBA4444:
case t.PixelFormat.AI88:
return 2;

case t.PixelFormat.A8:
case t.PixelFormat.I8:
return 1;

default:
return 4;
}
}
t.PixelFormat = void 0, (no = t.PixelFormat || (t.PixelFormat = {}))[no.RGBA8888 = 0] = "RGBA8888", 
no[no.RGB888 = 1] = "RGB888", no[no.RGB565 = 2] = "RGB565", no[no.RGBA4444 = 3] = "RGBA4444", 
no[no.A8 = 4] = "A8", no[no.I8 = 5] = "I8", no[no.AI88 = 6] = "AI88", t.TextureFilter = void 0, 
(oo = t.TextureFilter || (t.TextureFilter = {}))[oo.Nearest = 0] = "Nearest", oo[oo.Linear = 1] = "Linear", 
t.TextureWrapMode = void 0, (ro = t.TextureWrapMode || (t.TextureWrapMode = {}))[ro.Repeat = 0] = "Repeat", 
ro[ro.ClampToEdge = 1] = "ClampToEdge", ro[ro.MirroredRepeat = 2] = "MirroredRepeat";
var lo, uo = {
texWidth: function(t, e) {
return t.setTexWidth(e);
},
texHeight: function(t, e) {
return t.setTexHeight(e);
},
format: function(t, e) {
return t.setFormat(e);
},
filterMin: function(t, e) {
return t.setFilterMin(e);
},
filterMag: function(t, e) {
return t.setFilterMag(e);
},
wrapS: function(t, e) {
return t.setWrapS(e);
},
wrapT: function(t, e) {
return t.setWrapT(e);
},
pixels: function(t, e) {
return t.setPixels(e);
}
};
t.CameraLayer = void 0, (lo = t.CameraLayer || (t.CameraLayer = {}))[lo.Host = 1] = "Host", 
lo[lo.Background = 2] = "Background", lo[lo.GameWorld = 4] = "GameWorld", lo[lo.UI = 8] = "UI", 
lo[lo.Gizmos = 16] = "Gizmos", lo[lo.Everything = 31] = "Everything";
var co, ho, po = function() {
function e(e) {
if (this._mapping = new Map([ [ t.CameraLayer.UI, t.CameraLayer.UI ], [ t.CameraLayer.GameWorld, t.CameraLayer.GameWorld ], [ t.CameraLayer.Background, t.CameraLayer.Background ], [ t.CameraLayer.Gizmos, t.CameraLayer.Gizmos ], [ t.CameraLayer.Host, t.CameraLayer.Host ] ]), 
e) for (var n in e) {
var o = Number(n);
this._mapping.set(o, e[o]);
}
}
return e.prototype.getPhysicalIndex = function(t) {
var e, n = null !== (e = this._mapping.get(t)) && void 0 !== e ? e : t;
return Math.log2(n);
}, e.prototype.toPhysicalMask = function(t) {
var e, n, o = 0;
try {
for (var r = d(this._mapping), i = r.next(); !i.done; i = r.next()) {
var a = h(i.value, 2), s = a[0], l = a[1];
t & s && (o |= l);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
return o;
}, e;
}();
t.ProjectionType = void 0, (co = t.ProjectionType || (t.ProjectionType = {}))[co.Perspective = 0] = "Perspective", 
co[co.Orthographic = 1] = "Orthographic", t.CameraClearFlags = void 0, (ho = t.CameraClearFlags || (t.CameraClearFlags = {}))[ho.None = 0] = "None", 
ho[ho.Color = 1] = "Color", ho[ho.Depth = 2] = "Depth", ho[ho.Stencil = 4] = "Stencil", 
ho[ho.ColorAndDepth = 3] = "ColorAndDepth", ho[ho.All = 7] = "All";
var fo, mo = {
viewport: {
x: function(t, e) {
return t.setViewportX(e);
},
y: function(t, e) {
return t.setViewportY(e);
},
width: function(t, e) {
return t.setViewportWidth(e);
},
height: function(t, e) {
return t.setViewportHeight(e);
}
},
cullingMask: function(t, e) {
return t.setCullingMask(e);
},
cameraDepth: function(t, e) {
return t.setCameraDepth(e);
},
projection: function(t, e) {
return t.setProjection(e);
},
fov: function(t, e) {
return t.setFov(e);
},
orthoHeight: function(t, e) {
return t.setOrthoHeight(e);
},
near: function(t, e) {
return t.setNear(e);
},
far: function(t, e) {
return t.setFar(e);
},
cameraRgb: function(t, e) {
return t.setCameraRgb(e);
},
cameraAlpha: function(t, e) {
return t.setCameraAlpha(e);
},
clearFlags: function(t, e) {
return t.setClearFlags(e);
},
zoomRatio: function(t, e) {
return t.setZoomRatio(e);
},
alignWithScreen: function(t, e) {
return t.setAlignWithScreen(e);
},
renderStages: function(t, e) {
return t.setRenderStages(e);
}
}, vo = "remote://";
t.LoaderAssetType = void 0, (fo = t.LoaderAssetType || (t.LoaderAssetType = {})).SpriteFrame = "SpriteFrame", 
fo.SpriteAtlas = "SpriteAtlas", fo.Font = "Font", fo.SkeletonData = "SkeletonData", 
fo.Texture = "Texture", fo.AudioClip = "AudioClip", fo.Material = "Material", fo.Effect = "Effect", 
fo.Json = "Json", fo.DragonBonesAsset = "DragonBonesAsset", fo.DragonBonesAtlasAsset = "DragonBonesAtlasAsset", 
fo.Particle = "Particle", fo.Buffer = "Buffer";
var yo = function() {
function t(t) {
this._refCounts = new Map(), this._featureDeps = new Map(), this._loadingFeatures = new Map(), 
this._preRelease = !1, this._bundleOpChain = Promise.resolve(), this._pendingStageTasks = new Map(), 
this._stageWorkerRunning = !1, this._mainLoadDepth = 0, this._activatedGroups = new Map(), 
this._groupActivatePromises = new Map(), this.universe = t;
}
return t.prototype.setRemoteBundleUrl = function(t) {
this._remoteBundleUrl = t;
}, t.prototype.setRemoteAssetUrl = function(t) {
this._remoteAssetUrl = t;
}, t.prototype.setPreRelease = function(t) {
this._preRelease = t;
}, t.prototype.ensureSessionPlan = function(t) {
return u(this, void 0, void 0, function() {
var e;
return c(this, function(n) {
switch (n.label) {
case 0:
return this._remoteBundleUrl ? void 0 === (e = this.universe.featureResolver.getGalaxyOfWorld(t)) ? [ 2 ] : [ 4, this._ensureGroupActivated(e) ] : [ 2 ];

case 1:
return n.sent(), [ 2 ];
}
});
});
}, t.prototype._ensureGroupActivated = function(t) {
return u(this, void 0, void 0, function() {
var e, n = this;
return c(this, function(o) {
switch (o.label) {
case 0:
return this._activatedGroups.has(t) ? [ 2 ] : ((e = this._groupActivatePromises.get(t)) || (e = this._activateGroup(t).catch(function(e) {
throw n._groupActivatePromises.delete(t), e;
}), this._groupActivatePromises.set(t, e)), [ 4, e ]);

case 1:
return o.sent(), [ 2 ];
}
});
});
}, t.prototype._activateGroup = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o;
return c(this, function(r) {
switch (r.label) {
case 0:
return e = this._ensureGroupVersionsLoaded(), n = e[t], (o = null == n ? void 0 : n.active) && 0 !== Object.keys(o).length ? [ 3, 2 ] : [ 4, this._freezeFreshSnapshot(t, e, "首次激活（在线发现）") ];

case 1:
return r.sent(), [ 2 ];

case 2:
return n.pending && this._isSnapshotReady(n.pending) ? (e[t] = {
active: n.pending
}, this.saveGroupVersions(e), this._activatedGroups.set(t, n.pending), this._discoverAndStagePending(t), 
[ 2 ]) : this._isActiveComplete(t, o) ? (this._activatedGroups.set(t, o), this._discoverAndStagePending(t), 
[ 2 ]) : this.universe.host.getNetworkState() ? [ 4, this._freezeFreshSnapshot(t, e, "不完整 active 在线重发现为连贯最新") ] : [ 3, 4 ];

case 3:
return r.sent(), [ 3, 5 ];

case 4:
this._activatedGroups.set(t, o), r.label = 5;

case 5:
return [ 2 ];
}
});
});
}, t.prototype._freezeFreshSnapshot = function(t, e) {
return u(this, void 0, void 0, function() {
var n;
return c(this, function(o) {
switch (o.label) {
case 0:
return [ 4, this._discoverGroupSnapshot(t) ];

case 1:
return n = o.sent(), e[t] = {
active: n
}, this.saveGroupVersions(e), this._activatedGroups.set(t, n), [ 2 ];
}
});
});
}, t.prototype._isActiveComplete = function(t, e) {
var n, o, r, i, a, s = this.universe.featureResolver;
try {
for (var l = d(null !== (a = s.collectFeaturesByGroup().get(t)) && void 0 !== a ? a : []), u = l.next(); !u.done; u = l.next()) if (!(u.value in e)) return !1;
} catch (t) {
n = {
error: t
};
} finally {
try {
u && !u.done && (o = l.return) && o.call(l);
} finally {
if (n) throw n.error;
}
}
for (var c in e) try {
for (var h = (r = void 0, d(e[c].deps)), p = h.next(); !p.done; p = h.next()) {
var f = p.value;
if (s.groupOf(f) === t && !(f in e)) return !1;
}
} catch (t) {
r = {
error: t
};
} finally {
try {
p && !p.done && (i = h.return) && i.call(h);
} finally {
if (r) throw r.error;
}
}
return !0;
}, t.prototype._discoverGroupSnapshot = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s, l = this;
return c(this, function(f) {
switch (f.label) {
case 0:
if (e = this.universe.featureResolver, 0 === (n = p([], h(null !== (s = e.collectFeaturesByGroup().get(t)) && void 0 !== s ? s : []), !1)).length) return [ 2, {} ];
if (!this.universe.host.getNetworkState()) return [ 2, {} ];
o = {}, r = n, i = function() {
var n, i;
return c(this, function(s) {
switch (s.label) {
case 0:
return 0 === (n = r.filter(function(t) {
return !(t in o);
})).length ? [ 2, "break" ] : (i = new Set(), [ 4, a._runWithConcurrency(n, 6, function(n) {
return u(l, void 0, void 0, function() {
var r, a, s, l, u, h;
return c(this, function(c) {
switch (c.label) {
case 0:
return [ 4, this.fetchFeatureManifestRaw(n) ];

case 1:
if (void 0 === (r = c.sent()).version) throw new Error("版本冻结 ".concat(n, " bundleMeta 缺少 version"));
o[n] = {
version: r.version,
deps: r.deps
};
try {
for (a = d(r.deps), s = a.next(); !s.done; s = a.next()) l = s.value, e.groupOf(l) !== t || l in o || i.add(l);
} catch (t) {
u = {
error: t
};
} finally {
try {
s && !s.done && (h = a.return) && h.call(a);
} finally {
if (u) throw u.error;
}
}
return [ 2 ];
}
});
});
}) ]);

case 1:
return s.sent(), r = p([], h(i), !1), [ 2 ];
}
});
}, a = this, f.label = 1;

case 1:
return r.length > 0 ? [ 5, i() ] : [ 3, 3 ];

case 2:
return "break" === f.sent() ? [ 3, 3 ] : [ 3, 1 ];

case 3:
return [ 2, o ];
}
});
});
}, t.prototype._discoverAndStagePending = function(t) {
var e = this;
this.universe.host.getNetworkState() && this._discoverGroupSnapshot(t).then(function(n) {
var o, r, i, a = e._activatedGroups.get(t);
if (a) {
var s = e._ensureGroupVersionsLoaded(), l = null !== (i = s[t]) && void 0 !== i ? i : s[t] = {};
if (e._snapshotEquals(n, a)) l.pending && (delete l.pending, e.saveGroupVersions(s)); else {
l.active = a, l.pending = n, e.saveGroupVersions(s);
try {
for (var u = d(Object.entries(n)), c = u.next(); !c.done; c = u.next()) {
var p = h(c.value, 2), f = p[0], m = p[1];
e.hasLocalBundlePackage(f, m.version) || e.enqueueStageTask({
featureName: f,
version: m.version,
deps: m.deps
});
}
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (r = u.return) && r.call(u);
} finally {
if (o) throw o.error;
}
}
e._kickStageWorker();
}
}
}).catch(function() {});
}, t.prototype._isSnapshotReady = function(t) {
for (var e in t) if (!this.hasLocalBundlePackage(e, t[e].version)) return !1;
return !0;
}, t.prototype._snapshotEquals = function(t, e) {
var n, o, r, i = Object.keys(t);
if (i.length !== Object.keys(e).length) return !1;
try {
for (var a = d(i), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
if ((null === (r = e[l]) || void 0 === r ? void 0 : r.version) !== t[l].version) return !1;
}
} catch (t) {
n = {
error: t
};
} finally {
try {
s && !s.done && (o = a.return) && o.call(a);
} finally {
if (n) throw n.error;
}
}
return !0;
}, t.prototype._runWithConcurrency = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i, a, s = this;
return c(this, function(l) {
switch (l.label) {
case 0:
for (o = 0, r = function() {
return u(s, void 0, void 0, function() {
var e;
return c(this, function(r) {
switch (r.label) {
case 0:
return o < t.length ? (e = o++, [ 4, n(t[e]) ]) : [ 3, 2 ];

case 1:
return r.sent(), [ 3, 0 ];

case 2:
return [ 2 ];
}
});
});
}, i = [], a = 0; a < Math.min(e, t.length); a++) i.push(r());
return [ 4, Promise.all(i) ];

case 1:
return l.sent(), [ 2 ];
}
});
});
}, t.prototype._ensureGroupVersionsLoaded = function() {
if (this._groupVersions) return this._groupVersions;
var t = this.loadGroupVersions();
if (0 === Object.keys(t).length) {
var e = this._migrateFromLegacyVersionState();
Object.keys(e).length > 0 && (t = e, this.saveGroupVersions(t));
}
return this._groupVersions = t, t;
}, t.prototype._migrateFromLegacyVersionState = function() {
var t, e, n, o = this.loadVersionState(), r = this.universe.featureResolver, i = {};
for (var a in o) {
var s = o[a];
if (void 0 !== s.appliedVersion) {
var l = r.groupOf(a);
if (void 0 !== l) {
var u = null !== (t = i[l]) && void 0 !== t ? t : i[l] = {
active: {}
};
(null !== (e = u.active) && void 0 !== e ? e : u.active = {})[a] = {
version: s.appliedVersion,
deps: null !== (n = s.appliedDeps) && void 0 !== n ? n : []
};
}
}
}
return i;
}, t.prototype.getSessionFeatureVersion = function(t) {
var e;
if (this._remoteBundleUrl) {
var n = this.universe.featureResolver.groupOf(t);
if (void 0 !== n) {
var o = null === (e = this._activatedGroups.get(n)) || void 0 === e ? void 0 : e[t];
if (o) return {
version: o.version,
deps: o.deps
};
}
}
}, t.prototype.getAppliedFeaturesVersion = function(t) {
var e = this;
if (this._remoteBundleUrl && 0 !== t.size) {
var n = this.universe.featureResolver;
return p([], h(t), !1).sort().map(function(t) {
var o, r, i = n.groupOf(t), a = void 0 !== i ? null === (r = null === (o = e._activatedGroups.get(i)) || void 0 === o ? void 0 : o[t]) || void 0 === r ? void 0 : r.version : void 0;
return "".concat(t, "#").concat(a);
}).join("_");
}
}, t.prototype.enqueueBundleOp = function(t) {
var e = this._bundleOpChain.then(t, t);
return this._bundleOpChain = e.catch(function() {}), e;
}, t.prototype.enqueueStageTask = function(t) {
var e = this._pendingStageTasks.get(t.featureName);
e && e.version >= t.version || this._pendingStageTasks.set(t.featureName, {
version: t.version,
deps: t.deps
});
}, t.prototype._kickStageWorker = function() {
this._stageWorkerRunning || 0 !== this._pendingStageTasks.size && (this._stageWorkerRunning = !0, 
u(this, void 0, void 0, function() {
var t, e, n, o, r, i, a, s;
return c(this, function(l) {
switch (l.label) {
case 0:
return this._pendingStageTasks.size > 0 ? [ 4, this._waitMainLoadIdle() ] : [ 3, 8 ];

case 1:
if (l.sent(), (t = this._pendingStageTasks.entries().next()).done) return [ 3, 8 ];
if (e = h(t.value, 2), n = e[0], o = e[1], this._pendingStageTasks.delete(n), r = this.universe.featureResolver.groupOf(n), 
void 0 !== (i = void 0 !== r ? null === (s = null === (a = this._activatedGroups.get(r)) || void 0 === a ? void 0 : a[n]) || void 0 === s ? void 0 : s.version : void 0) && i >= o.version) return [ 3, 0 ];
if (this.hasLocalBundlePackage(n, o.version)) return [ 3, 0 ];
l.label = 2;

case 2:
if (l.trys.push([ 2, 6, , 7 ]), !this.universe.host.getNetworkState()) throw new Error("stage 跳过(离线)");
return "web-desktop" !== this.getSystemName() ? [ 3, 3 ] : [ 3, 5 ];

case 3:
return [ 4, this.stageFeaturePackage(n, o.version) ];

case 4:
l.sent(), l.label = 5;

case 5:
return this.markBundlePackageReady(n, o.version), [ 3, 7 ];

case 6:
return l.sent(), [ 3, 7 ];

case 7:
return [ 3, 0 ];

case 8:
return this._stageWorkerRunning = !1, [ 2 ];
}
});
}));
}, t.prototype._bumpMainLoad = function() {
if (0 === this._mainLoadDepth) {
var t, e = new Promise(function(e) {
return t = e;
});
this._mainLoadIdleSignal = {
promise: e,
resolve: t
};
}
this._mainLoadDepth++;
}, t.prototype._dropMainLoad = function() {
var t;
this._mainLoadDepth--, 0 === this._mainLoadDepth && (null === (t = this._mainLoadIdleSignal) || void 0 === t || t.resolve(), 
this._mainLoadIdleSignal = void 0);
}, t.prototype._waitMainLoadIdle = function() {
return u(this, void 0, void 0, function() {
var t;
return c(this, function(e) {
switch (e.label) {
case 0:
return this._mainLoadDepth > 0 ? [ 4, null === (t = this._mainLoadIdleSignal) || void 0 === t ? void 0 : t.promise ] : [ 3, 2 ];

case 1:
return e.sent(), [ 3, 0 ];

case 2:
return [ 2 ];
}
});
});
}, t.prototype.buildBundleUrl = function(t) {
if (!this._remoteBundleUrl) return t;
var e = this.getPlatformName(), n = this.getSystemName();
return "".concat(this._remoteBundleUrl).concat(e, "/").concat(t, "/").concat(n);
}, t.prototype.buildRemoteUrl = function(e, n) {
if (n.startsWith(vo)) {
var o = n.slice(9), r = this._remoteAssetUrl || t.DefaultRemoteUrl;
return {
isRemote: !0,
resolvedPath: "".concat(r, "remote/").concat(e, "/").concat(o)
};
}
return {
isRemote: !1,
resolvedPath: n
};
}, t.prototype.retainFeature = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s = this;
return c(this, function() {
return (e = _(t)) ? (n = this._loadingFeatures.get(e)) ? [ 2, n.then(function(t) {
var n, o = (null !== (n = s._refCounts.get(e)) && void 0 !== n ? n : 0) + 1;
return s._refCounts.set(e, o), t;
}) ] : (o = null !== (i = this._refCounts.get(e)) && void 0 !== i ? i : 0) > 0 ? (this._refCounts.set(e, o + 1), 
[ 2, null !== (a = this._featureDeps.get(e)) && void 0 !== a ? a : [] ]) : (r = this.doLoadFeature(t).then(function(t) {
return s._refCounts.set(e, 1), s._featureDeps.set(e, t), t;
}).finally(function() {
s._loadingFeatures.delete(e);
}), this._loadingFeatures.set(e, r), [ 2, r ]) : [ 2, [] ];
});
});
}, t.prototype.retainFeatures = function(t, e) {
return u(this, void 0, void 0, function() {
var n, o, r, i, a, s, l, u, f, m, v, y, _, g, A, C, R, S, T, b, w;
return c(this, function(c) {
switch (c.label) {
case 0:
n = [], this._bumpMainLoad(), c.label = 1;

case 1:
c.trys.push([ 1, , 18, 19 ]), c.label = 2;

case 2:
c.trys.push([ 2, 7, 8, 9 ]), o = d(t.values()), r = o.next(), c.label = 3;

case 3:
return r.done ? [ 3, 6 ] : (i = r.value, [ 4, this.retainFeature(i) ]);

case 4:
a = c.sent(), n.push.apply(n, p([], h(a), !1)), null == e || e(), c.label = 5;

case 5:
return r = o.next(), [ 3, 3 ];

case 6:
return [ 3, 9 ];

case 7:
return s = c.sent(), C = {
error: s
}, [ 3, 9 ];

case 8:
try {
r && !r.done && (R = o.return) && R.call(o);
} finally {
if (C) throw C.error;
}
return [ 7 ];

case 9:
if (!(n.length > 0)) return [ 3, 17 ];
l = new Set(n.map(function(t) {
return t.atomFeatureName;
})), c.label = 10;

case 10:
c.trys.push([ 10, 15, 16, 17 ]), u = d(l), f = u.next(), c.label = 11;

case 11:
return f.done ? [ 3, 14 ] : (m = f.value, [ 4, this.retainFeature({
atomFeatureName: m
}) ]);

case 12:
c.sent(), c.label = 13;

case 13:
return f = u.next(), [ 3, 11 ];

case 14:
return [ 3, 17 ];

case 15:
return v = c.sent(), S = {
error: v
}, [ 3, 17 ];

case 16:
try {
f && !f.done && (T = u.return) && T.call(u);
} finally {
if (S) throw S.error;
}
return [ 7 ];

case 17:
y = new Set(t.keys());
try {
for (_ = d(n), g = _.next(); !g.done; g = _.next()) A = g.value, y.add(A.atomFeatureName);
} catch (t) {
b = {
error: t
};
} finally {
try {
g && !g.done && (w = _.return) && w.call(_);
} finally {
if (b) throw b.error;
}
}
return this.onFeaturesRetained(y), [ 2, y ];

case 18:
return this._dropMainLoad(), this._kickStageWorker(), [ 7 ];

case 19:
return [ 2 ];
}
});
});
}, t.prototype._decrementRef = function(t) {
var e, n = null !== (e = this._refCounts.get(t)) && void 0 !== e ? e : 0;
return 0 !== n && (n > 1 ? (this._refCounts.set(t, n - 1), !1) : (this._refCounts.set(t, 0), 
!0));
}, t.prototype.releaseFeature = function(t) {
this._decrementRef(t) && (this.doReleaseFeatureAssets(t), this.doRemoveFeatureBundle(t), 
this._refCounts.delete(t), this._featureDeps.delete(t));
}, t.prototype.releaseFeatures = function(t) {
var e, n, o, r, i = [], a = [];
try {
for (var s = d(t.keys()), l = s.next(); !l.done; l = s.next()) {
var u = l.value, c = this._featureDeps.get(u);
c && c.length > 0 && a.push.apply(a, p([], h(c), !1)), this._decrementRef(u) && i.push(u);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (n = s.return) && n.call(s);
} finally {
if (e) throw e.error;
}
}
if (a.length > 0) {
var f = new Set(a.map(function(t) {
return t.atomFeatureName;
}));
try {
for (var m = d(f), v = m.next(); !v.done; v = m.next()) {
var y = v.value;
this._decrementRef(y) && i.push(y);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
v && !v.done && (r = m.return) && r.call(m);
} finally {
if (o) throw o.error;
}
}
}
this._executeTwoPhaseUnload(i);
}, t.prototype.forceReleaseAll = function() {
this._executeTwoPhaseUnload(p([], h(this._refCounts.keys()), !1));
}, t.prototype._executeTwoPhaseUnload = function(t) {
if (0 !== t.length) {
for (var e = t.length, n = t.join(", "), o = 0; o < e; o++) {
var r = t[o];
try {
this.doReleaseFeatureAssets(r);
} catch (t) {
throw t instanceof Error && (t.message = "[AtomEngine][卸载] Phase1 doReleaseFeatureAssets 失败: featureName=".concat(r, " index=").concat(o + 1, "/").concat(e, " toUnload=[").concat(n, "] ---\x3e ").concat(t.message)), 
t;
}
}
for (o = 0; o < e; o++) {
r = t[o];
try {
this.doRemoveFeatureBundle(r);
} catch (t) {
throw t instanceof Error && (t.message = "[AtomEngine][卸载] Phase2 doRemoveFeatureBundle 失败: featureName=".concat(r, " index=").concat(o + 1, "/").concat(e, " toUnload=[").concat(n, "] ---\x3e ").concat(t.message)), 
t;
}
this._refCounts.delete(r), this._featureDeps.delete(r);
}
}
}, t.prototype.isFeatureLoaded = function(t) {
var e;
return (null !== (e = this._refCounts.get(t)) && void 0 !== e ? e : 0) > 0;
}, t.prototype.assetCacheKey = function(t, e) {
return "".concat(t, "_").concat(e);
}, t.DefaultRemoteUrl = "https://starlink-live.hungrystudio.pp.ua/atomEngine/", 
t;
}(), _o = "|";
function go(t) {
var e = t, n = e.split(_o);
return n.length < 2 ? {
featureName: "",
assetPath: e
} : {
featureName: n[0],
assetPath: n[1]
};
}
var Ao, Co, Ro = function(e) {
function o() {
var t = e.apply(this, p([], h(arguments), !1)) || this;
return t.genChain = null, t;
}
return n(o, e), Object.defineProperty(o, "atomType", {
get: function() {
return "ConfigAtom";
},
enumerable: !1,
configurable: !0
}), o.prototype.collectLoad = function() {
this.atomWorld.loadTracker.addItems();
}, o.prototype._loadConfig = function() {
return u(this, void 0, void 0, function() {
var t, e;
return c(this, function(n) {
switch (n.label) {
case 0:
return t = this.atomWorld.universe, (e = t.configDataStore.get(this.atomName)) || (e = {}, 
t.configDataStore.set(this.atomName, e)), this.atomState = e, [ 4, this._generateConfigInto(e) ];

case 1:
return n.sent(), [ 2 ];
}
});
});
}, o.prototype._generateConfigInto = function(e) {
return u(this, void 0, void 0, function() {
var n, o, r, i, a, s, l;
return c(this, function(u) {
switch (u.label) {
case 0:
return n = this.defineConfig(), Object.assign(e, n), this.atomWorld ? (this.atomWorld.universe.featureResolver.applyOverrides(this.atomName, e), 
(o = n.JsonAsset) ? (r = go(o), i = r.featureName, a = r.assetPath, [ 4, this.atomWorld.universe.asset.loadAsset(i, a, t.LoaderAssetType.Json) ]) : [ 3, 2 ]) : [ 2 ];

case 1:
if (s = u.sent(), !this.atomWorld) return [ 2 ];
if (null == s ? void 0 : s.json) {
for (l in e) delete e[l];
Object.assign(e, s.json);
}
u.label = 2;

case 2:
return this.genChain ? [ 4, this.genChain.execute() ] : [ 3, 4 ];

case 3:
u.sent(), u.label = 4;

case 4:
return [ 2 ];
}
});
});
}, o.prototype.onReady = function() {
return u(this, void 0, void 0, function() {
return c(this, function(t) {
switch (t.label) {
case 0:
return [ 4, this._loadConfig() ];

case 1:
return t.sent(), this.atomWorld ? (this.atomWorld.loadTracker.complete(), [ 2 ]) : [ 2 ];
}
});
});
}, o.prototype.reloadAsync = function() {
return u(this, void 0, void 0, function() {
return c(this, function(t) {
switch (t.label) {
case 0:
return [ 4, this._generateConfigInto(this.atomState) ];

case 1:
return t.sent(), [ 2 ];
}
});
});
}, o.prototype.registerToChain = function(t) {
return this.genChain || (this.genChain = new Re(this.atomWorld, this.atomName)), 
this.genChain.addAtom(t), this.genChain;
}, o.prototype.unregisterFromChain = function(t) {
if (!this.genChain) return !1;
var e = this.genChain.removeAtom(t);
return e && (this.genChain = null), e;
}, o.prototype.getChain = function() {
return this.genChain;
}, o.prototype.url = function(t) {
return function(e, n) {
return "".concat(n || t).concat(_o).concat(e);
};
}, o[ge] = !0, o;
}(Ae), So = function() {
function e(t) {
this.worldId = "", this.isActive = !0, this.nodeName = "", this._assetLoadingUrls = {}, 
this._currentMaterial = null, this._lastMaterialParams = null, this._eventBindings = new Map(), 
this.universe = t;
}
return e.prototype.restoreMaterial = function() {
if (this._lastMaterialParams) if (this._currentMaterial) {
try {
this.applyMaterial(this._currentMaterial);
} catch (t) {
return void (this._currentMaterial = null);
}
this.applyMaterialProperties(this._currentMaterial, this._lastMaterialParams, !0);
} else this.setMaterial(this._lastMaterialParams);
}, e.prototype.restoreTexture = function() {}, e.prototype.initRender = function(t, e) {
this.eid = t, this.worldId = e;
}, e.prototype.applyWorldTimeScale = function() {}, e.prototype.disposeRender = function() {
var t = this;
this.eid = 0, this._assetLoadingUrls = {}, this._currentMaterial = null, this._lastMaterialParams = null, 
this._eventBindings.forEach(function(e, n) {
e.listener && t.offNative(n, e.listener, e.appliedCapture);
}), this._eventBindings.clear();
}, e.prototype.bindTouchEvent = function(t, e) {
var n = this;
this.bindBaseEvent(t, e, function(e) {
return n.createNativeListener(t, e);
});
}, e.prototype.bindSizeInputEvent = function(t, e) {
var n = this;
this.bindBaseEvent(t, e, function(t) {
return function() {
var e = {
width: n.getWidth(),
height: n.getHeight(),
eid: n.eid,
worldId: n.worldId
};
n.universe.handleSizeInputEvent(e), t(e);
};
});
}, e.prototype.bindPositionInputEvent = function(t, e) {
var n = this;
this.bindBaseEvent(t, e, function(t) {
return function() {
var e = {
x: n.getX(),
y: n.getY(),
eid: n.eid,
worldId: n.worldId
};
n.universe.handlePositionInputEvent(e), t(e);
};
});
}, e.prototype.bindBaseEvent = function(t, e, n) {
var o = this._getOrCreateBinding(t);
o.callback = e, o.listenerCreator = n, this._rebindEvent(t);
}, e.prototype.bindTouchEventOption = function(t, e) {
this._getOrCreateBinding(t).options = !0 === e ? {
capture: !0
} : !1 !== e && void 0 !== e ? e : void 0, this._rebindEvent(t);
}, e.prototype._getOrCreateBinding = function(t) {
var e = this._eventBindings.get(t);
return e || (e = {
callback: null,
appliedCapture: !1
}, this._eventBindings.set(t, e)), e;
}, e.prototype._rebindEvent = function(t) {
var e, n, o = this._eventBindings.get(t);
if (o) if (o.listener && (this.offNative(t, o.listener, o.appliedCapture), o.listener = void 0), 
o.callback && o.listenerCreator) {
var r = !0 === (null === (e = o.options) || void 0 === e ? void 0 : e.capture), i = !0 === (null === (n = o.options) || void 0 === n ? void 0 : n.stopPropagation), a = o.listenerCreator(o.callback), s = i ? this.wrapStopPropagation(a) : a;
o.listener = s, o.appliedCapture = r, this.onNative(t, s, r);
} else o.callback || o.options || this._eventBindings.delete(t);
}, e.prototype.loadAsset = function(t, e, n, o, r) {
var i = this;
this._assetLoadingUrls[t] = e;
var a = go(e), s = a.featureName, l = a.assetPath, u = this.universe.asset.tryGetCachedAsset(s, l, n), c = function(n) {
i._assetLoadingUrls[t] === e && (null == r || r(n));
}, d = function(n) {
try {
if (i._assetLoadingUrls[t] !== e) return;
o(n);
} catch (t) {
c(t);
}
};
void 0 === u ? this.universe.asset.loadAsset(s, l, n).then(function(t) {
return d(t);
}, c) : d(u);
}, e.prototype.setMaterial = function(e) {
var n = this;
this.nativeRenderer && (this._lastMaterialParams = e, this._assetLoadingUrls.material === e.url && this._currentMaterial ? this.applyMaterialProperties(this._currentMaterial, e) : (this._currentMaterial = null, 
this.loadAsset("material", e.url, t.LoaderAssetType.Material, function(t) {
try {
n.applyMaterial(t);
} catch (t) {
return void (n._currentMaterial = null);
}
n._currentMaterial = t;
try {
n.applyMaterialProperties(t, e);
} catch (t) {}
})));
}, e.prototype.applyMaterialProperties = function(e, n, o) {
var r = this;
if (void 0 === o && (o = !1), e) {
var i = function(e) {
if ("url" === e) return "continue";
var i = n[e];
"string" == typeof i && i.includes(_o) ? a.loadAsset("material_prop_".concat(e), i, t.LoaderAssetType.Texture, function(t) {
r._setMaterialProperty(e, t, o && n.url);
}) : a._setMaterialProperty(e, i, o && n.url);
}, a = this;
for (var s in n) i(s);
}
}, e.prototype._setMaterialProperty = function(t, e, n) {
if (n) try {
this.setMaterialProperty(t, e);
} catch (t) {} else this.setMaterialProperty(t, e);
}, e.prototype.setActiveBase = function(t) {
this.isActive = t, this.setActive(t);
}, e;
}(), To = {
v2: new cc.Vec2(),
v3: new cc.Vec3(),
color: new cc.Color(),
quat: new cc.Quat(),
_v2Pool: [],
_v3Pool: [],
_v4Pool: [],
getV2s: function(t) {
for (var e = this._v2Pool; e.length < t; ) e.push(cc.v2());
return e;
},
getV3s: function(t) {
for (var e = this._v3Pool; e.length < t; ) e.push(cc.v3());
return e;
},
getV4s: function(t) {
for (var e = this._v4Pool; e.length < t; ) e.push(new cc.Color());
return e;
}
}, bo = function(e) {
function o(n) {
var o = e.call(this, n) || this;
return o._quat = new cc.Quat(), o._width = 0, o._height = 0, o._depth = 0, o._cameraLayerExplicitlySet = !1, 
o._cameraLayer = t.CameraLayer.GameWorld, o.widgetComp = null, o.layoutComp = null, 
o.buttonComp = null, o.blockInputComp = null, o.safeAreaComp = null, o.nativeRenderer = void 0, 
o.nativeNode = new cc.Node(), o.nativeNode._cocosNodeRef = o, o.setCameraLayer(t.CameraLayer.Host, !1), 
o;
}
return n(o, e), o.prototype.applyMaterial = function(t) {
var e = this.nativeRenderer;
(null == e ? void 0 : e.setMaterial) && e.setMaterial(0, t);
}, o.prototype.setMaterialProperty = function(t, e) {
var n, o, r = this.nativeRenderer, i = null === (n = null == r ? void 0 : r.getMaterial) || void 0 === n ? void 0 : n.call(r, 0);
i && (null === (o = i.setProperty) || void 0 === o || o.call(i, t, e));
}, o.prototype.onNative = function(t, e, n) {
this.nativeNode.on(t, e, this, n);
}, o.prototype.offNative = function(t, e, n) {
this.nativeNode.off(t, e, this, n);
}, o.prototype.wrapStopPropagation = function(t) {
return function(e) {
null == e || e.stopPropagation(), t(e);
};
}, o.prototype.createNativeListener = function(t, e) {
var n = this;
return function(o) {
var r = o.getLocation(), i = o.getDelta(), a = n.nativeNode.convertToNodeSpaceAR(r), s = cc.view.getVisibleOrigin(), l = cc.macro.ENABLE_MULTI_TOUCH ? o.getTouches().map(function(t) {
var e = t.getLocation(), o = t.getDelta(), r = n.nativeNode.convertToNodeSpaceAR(e);
return {
x: e.x - s.x,
y: e.y - s.y,
dx: o.x,
dy: o.y,
touchId: t.getID(),
eid: n.eid,
localX: r.x,
localY: r.y
};
}) : [], u = {
x: r.x - s.x,
y: r.y - s.y,
dx: i.x,
dy: i.y,
touchId: o.getID(),
eid: n.eid,
localX: a.x,
localY: a.y,
eventType: t,
worldId: n.worldId,
multiTouchs: l
};
n.universe.handlePointerEvent(u), e(u);
};
}, o.prototype.setButtonClick = function(t) {
this.ensureButton();
var e = this.nativeNode.getComponent(wo);
e || (e = this.nativeNode.addComponent(wo)), e.callback = t;
var n = new cc.Component.EventHandler();
n.target = this.nativeNode, n.component = "AEButtonProxy", n.handler = "onClick", 
this.ensureButton().clickEvents = [ n ];
}, o.prototype.setOnTouchStart = function(t) {
this.bindTouchEvent(cc.Node.EventType.TOUCH_START, t);
}, o.prototype.setOnTouchMove = function(t) {
this.bindTouchEvent(cc.Node.EventType.TOUCH_MOVE, t);
}, o.prototype.setOnTouchEnd = function(t) {
this.bindTouchEvent(cc.Node.EventType.TOUCH_END, t);
}, o.prototype.setOnTouchCancel = function(t) {
this.bindTouchEvent(cc.Node.EventType.TOUCH_CANCEL, t);
}, o.prototype.setOnSizeChanged = function(t) {
this.bindSizeInputEvent(cc.Node.EventType.SIZE_CHANGED, t);
}, o.prototype.setOnPositionChanged = function(t) {
this.bindPositionInputEvent(cc.Node.EventType.POSITION_CHANGED, t);
}, o.prototype.setTouchStartOption = function(t) {
this.bindTouchEventOption(cc.Node.EventType.TOUCH_START, t);
}, o.prototype.setTouchMoveOption = function(t) {
this.bindTouchEventOption(cc.Node.EventType.TOUCH_MOVE, t);
}, o.prototype.setTouchEndOption = function(t) {
this.bindTouchEventOption(cc.Node.EventType.TOUCH_END, t);
}, o.prototype.setTouchCancelOption = function(t) {
this.bindTouchEventOption(cc.Node.EventType.TOUCH_CANCEL, t);
}, o.prototype.getName = function() {
return this.nodeName;
}, o.prototype.getX = function() {
return this.nativeNode.x;
}, o.prototype.getY = function() {
return this.nativeNode.y;
}, o.prototype.getZ = function() {
return this.nativeNode.z;
}, o.prototype.getWidth = function() {
return this.nativeNode.width;
}, o.prototype.getHeight = function() {
return this.nativeNode.height;
}, o.prototype.setName = function(t) {
this.nodeName = t, isNaN(this.eid) || (t += ":eid=" + this.eid), this.nativeNode.name = t;
}, o.prototype.setCameraLayer = function(t, e) {
void 0 === e && (e = !0);
var n = t, o = this.universe.layerMapping.getPhysicalIndex(n);
this.nativeNode.groupIndex = o, this._cameraLayer = n, this._cameraLayerExplicitlySet = e, 
e && this._applyLayerRecursively(this.nativeNode, n, o);
}, o.prototype._applyLayerRecursively = function(t, e, n) {
for (var o = t.children, r = 0; r < o.length; r++) {
var i = o[r], a = i._cocosNodeRef;
a && (a._cameraLayerExplicitlySet || (i.groupIndex = n, a._cameraLayer = e, a._cameraLayerExplicitlySet = !1, 
this._applyLayerRecursively(i, e, n)));
}
}, o.prototype.addChild = function(t) {
var e, n, o = this.nativeNode, r = null == t ? void 0 : t.nativeNode;
if (r) {
var i = r.parent;
if (i) {
if (i === o) return void this._trackNodeFailure("CocosNode.addChild 重复挂载", "child=".concat(t.nodeName, " eid=").concat(String(t.eid), " parent=").concat(this.nodeName, " eid=").concat(String(this.eid)));
try {
t.removeFromParent();
} catch (e) {
return void this._trackNodeFailure("CocosNode.addChild 摘除异常", "child=".concat(t.nodeName, " eid=").concat(String(t.eid)) + " oldParent=".concat(i.name, " newParent=").concat(this.nodeName, " eid=").concat(String(this.eid)), e);
}
if (r.parent) return void this._trackNodeFailure("CocosNode.addChild 摘除失败", "child=".concat(t.nodeName, " eid=").concat(String(t.eid)) + " oldParent=".concat(r.parent.name, " newParent=").concat(this.nodeName, " eid=").concat(String(this.eid)));
}
try {
o.addChild(r);
} catch (e) {
return void this._trackNodeFailure("CocosNode.addChild 挂载异常", "child=".concat(t.nodeName, " parent=").concat(this.nodeName, " oldParent=").concat(null !== (n = null == i ? void 0 : i.name) && void 0 !== n ? n : "none"), e);
}
if (!t._cameraLayerExplicitlySet) {
var a = this.universe.layerMapping.getPhysicalIndex(this._cameraLayer);
r.groupIndex = a, t._cameraLayer = this._cameraLayer, this._applyLayerRecursively(r, this._cameraLayer, a);
}
} else this._trackNodeFailure("CocosNode.addChild 原生节点缺失", "child=".concat(null !== (e = null == t ? void 0 : t.nodeName) && void 0 !== e ? e : "undefined", " parent=").concat(this.nodeName));
}, o.prototype._trackNodeFailure = function(t, e, n) {
var o = n instanceof Error ? n.message : void 0 === n ? "" : String(n);
this.universe.host.track("atomengine_game_common_execution_failed", {
error_type: t,
error_message: o ? "".concat(e, " | cause=").concat(o) : e
});
}, o.prototype.removeChild = function(t) {
this.nativeNode.removeChild(t.nativeNode);
}, o.prototype.removeFromParent = function() {
this.nativeNode.removeFromParent(!1);
}, o.prototype.getParent = function() {
var t = this.nativeNode.parent;
if (t) {
return t._cocosNodeRef;
}
}, o.prototype.getWorldPosition = function() {
var t = this.nativeNode.convertToWorldSpaceAR(cc.v3(0, 0, 0));
return {
x: t.x,
y: t.y,
z: t.z
};
}, o.prototype.convertToLocalSpace = function(t) {
var e = this.nativeNode.convertToNodeSpaceAR(cc.v3(t.x, t.y, t.z));
return {
x: e.x,
y: e.y,
z: e.z
};
}, o.prototype.destroyNative = function() {
this.nativeNode._cocosNodeRef = void 0, cc.isValid(this.nativeNode) && this.nativeNode.destroy();
}, o.prototype.setX = function(t) {
this.nativeNode.x = t;
}, o.prototype.setY = function(t) {
this.nativeNode.y = t;
}, o.prototype.setZ = function(t) {
this.nativeNode.z = t;
}, o.prototype.setAngle = function(t) {
this.nativeNode.angle = t;
}, o.prototype.setQuatX = function(t) {
this._quat.x = t, this.updateRotation();
}, o.prototype.setQuatY = function(t) {
this._quat.y = t, this.updateRotation();
}, o.prototype.setQuatZ = function(t) {
this._quat.z = t, this.updateRotation();
}, o.prototype.setQuatW = function(t) {
this._quat.w = t, this.updateRotation();
}, o.prototype.updateRotation = function() {
this.nativeNode.setRotation(this._quat);
}, o.prototype.setScale = function(t) {
this.nativeNode.scale = t;
}, o.prototype.setScaleX = function(t) {
this.nativeNode.scaleX = t;
}, o.prototype.setScaleY = function(t) {
this.nativeNode.scaleY = t;
}, o.prototype.setScaleZ = function() {}, o.prototype.setAnchorX = function(t) {
this.nativeNode.anchorX = t;
}, o.prototype.setAnchorY = function(t) {
this.nativeNode.anchorY = t;
}, o.prototype.setAnchorZ = function() {}, o.prototype.setZIndex = function(t) {
this.nativeNode.zIndex = t;
}, o.prototype.setDepth = function(t) {
this._depth = t;
}, o.prototype.setWidth = function(t) {
this._width = t, this.nativeNode.width = t;
}, o.prototype.setHeight = function(t) {
this._height = t, this.nativeNode.height = t;
}, o.prototype.opacityToAlpha = function(t) {
return Math.floor(255 * t);
}, o.prototype.setAlpha = function(t) {
this.nativeNode.opacity = this.opacityToAlpha(t);
}, o.prototype.setActive = function(t) {
this.nativeNode.active = t;
}, o.prototype.setBlockInputEvents = function(t) {
t ? (this.blockInputComp || (this.blockInputComp = this.nativeNode.addComponent(cc.BlockInputEvents)), 
this.blockInputComp.enabled = !0) : this.blockInputComp && (this.blockInputComp.enabled = !1);
}, o.prototype.setWidgetEnabled = function(t) {
this.ensureWidget().enabled = t;
}, o.prototype.ensureWidget = function() {
return this.widgetComp || (this.widgetComp = this.nativeNode.addComponent(cc.Widget)), 
this.widgetComp;
}, o.prototype.setWidgetAlignTop = function(t) {
this.ensureWidget().isAlignTop = t;
}, o.prototype.setWidgetAlignBottom = function(t) {
this.ensureWidget().isAlignBottom = t;
}, o.prototype.setWidgetAlignLeft = function(t) {
this.ensureWidget().isAlignLeft = t;
}, o.prototype.setWidgetAlignRight = function(t) {
this.ensureWidget().isAlignRight = t;
}, o.prototype.setWidgetAlignHorizontalCenter = function(t) {
this.ensureWidget().isAlignHorizontalCenter = t;
}, o.prototype.setWidgetAlignVerticalCenter = function(t) {
this.ensureWidget().isAlignVerticalCenter = t;
}, o.prototype.setWidgetAbsoluteTop = function(t) {
this.ensureWidget().isAbsoluteTop = t;
}, o.prototype.setWidgetAbsoluteBottom = function(t) {
this.ensureWidget().isAbsoluteBottom = t;
}, o.prototype.setWidgetAbsoluteLeft = function(t) {
this.ensureWidget().isAbsoluteLeft = t;
}, o.prototype.setWidgetAbsoluteRight = function(t) {
this.ensureWidget().isAbsoluteRight = t;
}, o.prototype.setWidgetAbsoluteHorizontalCenter = function(t) {
this.ensureWidget().isAbsoluteHorizontalCenter = t;
}, o.prototype.setWidgetAbsoluteVerticalCenter = function(t) {
this.ensureWidget().isAbsoluteVerticalCenter = t;
}, o.prototype.setWidgetTop = function(t) {
var e = this.ensureWidget();
e.isAlignTop = !0, e.top = t;
}, o.prototype.setWidgetBottom = function(t) {
var e = this.ensureWidget();
e.isAlignBottom = !0, e.bottom = t;
}, o.prototype.setWidgetLeft = function(t) {
var e = this.ensureWidget();
e.isAlignLeft = !0, e.left = t;
}, o.prototype.setWidgetRight = function(t) {
var e = this.ensureWidget();
e.isAlignRight = !0, e.right = t;
}, o.prototype.setWidgetHorizontalCenter = function(t) {
var e = this.ensureWidget();
e.isAlignHorizontalCenter = !0, e.horizontalCenter = t;
}, o.prototype.setWidgetVerticalCenter = function(t) {
var e = this.ensureWidget();
e.isAlignVerticalCenter = !0, e.verticalCenter = t;
}, o.prototype.setWidgetAlignMode = function(e) {
var n, o = ((n = {})[t.WidgetAlignMode.Once] = cc.Widget.AlignMode.ONCE, n[t.WidgetAlignMode.OnWindowResize] = cc.Widget.AlignMode.ON_WINDOW_RESIZE, 
n[t.WidgetAlignMode.Always] = cc.Widget.AlignMode.ALWAYS, n);
this.ensureWidget().alignMode = o[e];
}, o.prototype.ensureSafeArea = function() {
return this.safeAreaComp || (this.ensureWidget(), this.safeAreaComp = this.nativeNode.addComponent(cc.SafeArea)), 
this.safeAreaComp;
}, o.prototype.setSafeAreaEnabled = function(t) {
this.ensureSafeArea().enabled = t;
}, o.prototype.ensureLayout = function() {
return this.layoutComp || (this.layoutComp = this.nativeNode.addComponent(cc.Layout)), 
this.layoutComp;
}, o.prototype.setLayoutType = function(e) {
var n, o = ((n = {})[t.LayoutType.Horizontal] = cc.Layout.Type.HORIZONTAL, n[t.LayoutType.Vertical] = cc.Layout.Type.VERTICAL, 
n[t.LayoutType.Grid] = cc.Layout.Type.GRID, n);
this.ensureLayout().type = o[e];
}, o.prototype.setLayoutResizeMode = function(e) {
var n, o = ((n = {})[t.LayoutResizeMode.None] = cc.Layout.ResizeMode.NONE, n[t.LayoutResizeMode.Container] = cc.Layout.ResizeMode.CONTAINER, 
n[t.LayoutResizeMode.Children] = cc.Layout.ResizeMode.CHILDREN, n);
this.ensureLayout().resizeMode = o[e];
}, o.prototype.setLayoutSpacingX = function(t) {
this.ensureLayout().spacingX = t;
}, o.prototype.setLayoutSpacingY = function(t) {
this.ensureLayout().spacingY = t;
}, o.prototype.setLayoutPaddingLeft = function(t) {
this.ensureLayout().paddingLeft = t;
}, o.prototype.setLayoutPaddingRight = function(t) {
this.ensureLayout().paddingRight = t;
}, o.prototype.setLayoutPaddingTop = function(t) {
this.ensureLayout().paddingTop = t;
}, o.prototype.setLayoutPaddingBottom = function(t) {
this.ensureLayout().paddingBottom = t;
}, o.prototype.setLayoutStartAxis = function(e) {
var n, o = ((n = {})[t.LayoutAxisDirection.Horizontal] = cc.Layout.AxisDirection.HORIZONTAL, 
n[t.LayoutAxisDirection.Vertical] = cc.Layout.AxisDirection.VERTICAL, n);
this.ensureLayout().startAxis = o[e];
}, o.prototype.setLayoutVerticalDirection = function(e) {
var n, o = ((n = {})[t.LayoutVerticalDirection.TopToBottom] = cc.Layout.VerticalDirection.TOP_TO_BOTTOM, 
n[t.LayoutVerticalDirection.BottomToTop] = cc.Layout.VerticalDirection.BOTTOM_TO_TOP, 
n);
this.ensureLayout().verticalDirection = o[e];
}, o.prototype.setLayoutHorizontalDirection = function(e) {
var n, o = ((n = {})[t.LayoutHorizontalDirection.LeftToRight] = cc.Layout.HorizontalDirection.LEFT_TO_RIGHT, 
n[t.LayoutHorizontalDirection.RightToLeft] = cc.Layout.HorizontalDirection.RIGHT_TO_LEFT, 
n);
this.ensureLayout().horizontalDirection = o[e];
}, o.prototype.setLayoutAffectedByScale = function(t) {
this.ensureLayout().affectedByScale = t;
}, o.prototype.setLayoutEnabled = function(t) {
this.ensureLayout().enabled = t;
}, o.prototype.ensureButton = function() {
return this.buttonComp || (this.buttonComp = this.nativeNode.addComponent(cc.Button), 
this.buttonComp.target = this.nativeNode), this.buttonComp;
}, o.prototype.setRgbColor = function(t, e) {
e.r = t >>> 16 & 255, e.g = t >>> 8 & 255, e.b = 255 & t;
}, o.prototype.setRgb = function(t) {
this.setRgbColor(t, To.color), To.color.a = this.nativeNode.color.a, this.nativeNode.color = To.color;
}, o.prototype.setButtonInteractable = function(t) {
this.ensureButton().interactable = t;
}, o.prototype.setButtonEnableAutoGrayEffect = function(t) {
this.ensureButton().enableAutoGrayEffect = t;
}, o.prototype.setButtonTransition = function(e) {
var n, o = ((n = {})[t.ButtonTransition.None] = cc.Button.Transition.NONE, n[t.ButtonTransition.Color] = cc.Button.Transition.COLOR, 
n[t.ButtonTransition.Sprite] = cc.Button.Transition.SPRITE, n[t.ButtonTransition.Scale] = cc.Button.Transition.SCALE, 
n);
this.ensureButton().transition = o[e];
}, o.prototype.setButtonDuration = function(t) {
this.ensureButton().duration = t;
}, o.prototype.setButtonZoomScale = function(t) {
this.ensureButton().zoomScale = t;
}, o.prototype.setButtonNormalColor = function(t) {
var e = this.ensureButton();
this.setRgbColor(t, To.color), To.color.a = e.normalColor.a, e.normalColor = To.color.clone();
}, o.prototype.setButtonNormalAlpha = function(t) {
var e = this.ensureButton();
To.color.set(e.normalColor), To.color.a = this.opacityToAlpha(t), e.normalColor = To.color.clone();
}, o.prototype.setButtonPressedColor = function(t) {
var e = this.ensureButton();
this.setRgbColor(t, To.color), To.color.a = e.pressedColor.a, e.pressedColor = To.color.clone();
}, o.prototype.setButtonPressedAlpha = function(t) {
var e = this.ensureButton();
To.color.set(e.pressedColor), To.color.a = this.opacityToAlpha(t), e.pressedColor = To.color.clone();
}, o.prototype.setButtonHoverColor = function(t) {
var e = this.ensureButton();
this.setRgbColor(t, To.color), To.color.a = e.hoverColor.a, e.hoverColor = To.color.clone();
}, o.prototype.setButtonHoverAlpha = function(t) {
var e = this.ensureButton();
To.color.set(e.hoverColor), To.color.a = this.opacityToAlpha(t), e.hoverColor = To.color.clone();
}, o.prototype.setButtonDisabledColor = function(t) {
var e = this.ensureButton();
this.setRgbColor(t, To.color), To.color.a = e.disabledColor.a, e.disabledColor = To.color.clone();
}, o.prototype.setButtonDisabledAlpha = function(t) {
var e = this.ensureButton();
To.color.set(e.disabledColor), To.color.a = this.opacityToAlpha(t), e.disabledColor = To.color.clone();
}, o.prototype.setButtonNormalSprite = function(e) {
var n = this;
this.loadAsset("btnNormal", e, t.LoaderAssetType.SpriteFrame, function(t) {
n.ensureButton().normalSprite = t;
});
}, o.prototype.setButtonPressedSprite = function(e) {
var n = this;
this.loadAsset("btnPressed", e, t.LoaderAssetType.SpriteFrame, function(t) {
n.ensureButton().pressedSprite = t;
});
}, o.prototype.setButtonHoverSprite = function(e) {
var n = this;
this.loadAsset("btnHover", e, t.LoaderAssetType.SpriteFrame, function(t) {
n.ensureButton().hoverSprite = t;
});
}, o.prototype.setButtonDisabledSprite = function(e) {
var n = this;
this.loadAsset("btnDisabled", e, t.LoaderAssetType.SpriteFrame, function(t) {
n.ensureButton().disabledSprite = t;
});
}, o.prototype.setButtonTarget = function(t) {
var e = this, n = this.ensureButton();
if (t) {
var o = 0, r = function() {
if (cc.isValid(e.nativeNode)) {
var i = e._findNodeInDescendants(e.nativeNode, t);
i ? n.target = i : o < 5 && (o++, cc.director.once(cc.Director.EVENT_AFTER_UPDATE, r));
}
};
r();
} else n.target = this.nativeNode;
}, o.prototype._findNodeInDescendants = function(t, e) {
for (var n = t.children, o = 0; o < n.length; o++) {
var r = n[o], i = r._cocosNodeRef;
if (i && i.nodeName === e || r.name === e) return r;
var a = this._findNodeInDescendants(r, e);
if (a) return a;
}
}, o.prototype.setButtonEnabled = function(t) {
this.ensureButton().enabled = t;
}, o;
}(So), wo = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.onClick = function() {
this.callback && this.callback();
}, s([ cc._decorator.ccclass("AEButtonProxy") ], e);
}(cc.Component);
t.TextOverflow = void 0, (Ao = t.TextOverflow || (t.TextOverflow = {}))[Ao.NONE = 0] = "NONE", 
Ao[Ao.CLAMP = 1] = "CLAMP", Ao[Ao.SHRINK = 2] = "SHRINK", Ao[Ao.RESIZE_HEIGHT = 3] = "RESIZE_HEIGHT", 
t.TextVerticalAlign = void 0, (Co = t.TextVerticalAlign || (t.TextVerticalAlign = {}))[Co.TOP = 0] = "TOP", 
Co[Co.CENTER = 1] = "CENTER", Co[Co.BOTTOM = 2] = "BOTTOM";
var Fo, Eo, No = {
text: function(t, e) {
return t.setText(e);
},
fontSize: function(t, e) {
return t.setFontSize(e);
},
horizontalAlign: function(t, e) {
return t.setHorizontalAlign(e);
},
verticalAlign: function(t, e) {
return t.setVerticalAlign(e);
},
overflow: function(t, e) {
return t.setOverflow(e);
},
enableBold: function(t, e) {
return t.setEnableBold(e);
},
enableItalic: function(t, e) {
return t.setEnableItalic(e);
},
fontFamily: function(t, e) {
return t.setFontFamily(e);
},
lineHeight: function(t, e) {
return t.setLineHeight(e);
},
enableWrapText: function(t, e) {
return t.setEnableWrapText(e);
},
font: function(t, e) {
return t.setFont(e);
},
spacingX: function(t, e) {
return t.setSpacingX(e);
},
cacheMode: function(t, e) {
return t.setCacheMode(e);
},
enableUnderline: function(t, e) {
return t.setEnableUnderline(e);
},
underlineHeight: function(t, e) {
return t.setUnderlineHeight(e);
},
outline: {
rgb: function(t, e) {
return t.setOutlineRgb(e);
},
alpha: function(t, e) {
return t.setOutlineAlpha(e);
},
width: function(t, e) {
return t.setOutlineWidth(e);
}
},
shadow: {
rgb: function(t, e) {
return t.setShadowRgb(e);
},
alpha: function(t, e) {
return t.setShadowAlpha(e);
},
offset: function(t, e) {
return t.setShadowOffset(e[0], e[1]);
},
blur: function(t, e) {
return t.setShadowBlur(e);
}
}
}, xo = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n.nativeRenderer = n.nativeNode.getComponent(cc.Label) || n.nativeNode.addComponent(cc.Label), 
n.nativeRenderer.verticalAlign = cc.Label.VerticalAlign.CENTER, n;
}
return n(o, e), o.prototype.setText = function(t) {
this.nativeRenderer.string = t;
}, o.prototype.setFontSize = function(t) {
this.nativeRenderer.fontSize = t, this.nativeRenderer.lineHeight < t && (this.nativeRenderer.lineHeight = t);
}, o.prototype.setHorizontalAlign = function(e) {
switch (e) {
case t.TextHorizontalAlign.LEFT:
this.nativeRenderer.horizontalAlign = cc.Label.HorizontalAlign.LEFT;
break;

case t.TextHorizontalAlign.CENTER:
this.nativeRenderer.horizontalAlign = cc.Label.HorizontalAlign.CENTER;
break;

case t.TextHorizontalAlign.RIGHT:
this.nativeRenderer.horizontalAlign = cc.Label.HorizontalAlign.RIGHT;
}
}, o.prototype.setVerticalAlign = function(e) {
switch (e) {
case t.TextVerticalAlign.TOP:
this.nativeRenderer.verticalAlign = cc.Label.VerticalAlign.TOP;
break;

case t.TextVerticalAlign.CENTER:
this.nativeRenderer.verticalAlign = cc.Label.VerticalAlign.CENTER;
break;

case t.TextVerticalAlign.BOTTOM:
this.nativeRenderer.verticalAlign = cc.Label.VerticalAlign.BOTTOM;
}
}, o.prototype.setOverflow = function(e) {
switch (e) {
case t.TextOverflow.NONE:
this.nativeRenderer.overflow = cc.Label.Overflow.NONE;
break;

case t.TextOverflow.CLAMP:
this.nativeRenderer.overflow = cc.Label.Overflow.CLAMP;
break;

case t.TextOverflow.SHRINK:
this.nativeRenderer.overflow = cc.Label.Overflow.SHRINK;
break;

case t.TextOverflow.RESIZE_HEIGHT:
this.nativeRenderer.overflow = cc.Label.Overflow.RESIZE_HEIGHT;
}
}, o.prototype.setEnableBold = function(t) {
this.nativeRenderer.enableBold = t;
}, o.prototype.setEnableItalic = function(t) {
this.nativeRenderer.enableItalic = t;
}, o.prototype.setFontFamily = function(t) {
this.nativeRenderer.fontFamily = t;
}, o.prototype.setLineHeight = function(t) {
this.nativeRenderer.lineHeight = t;
}, o.prototype.setEnableWrapText = function(t) {
this.nativeRenderer.enableWrapText = t;
}, o.prototype.setFont = function(e) {
var n = this;
this.loadAsset("font", e, t.LoaderAssetType.Font, function(t) {
n.nativeRenderer.font = t, n.nativeNode._renderFlag |= 96;
});
}, o.prototype.setAlpha = function(t) {
var n, o;
e.prototype.setAlpha.call(this, t), (null === (o = (n = this.nativeRenderer)._nativeTTF) || void 0 === o ? void 0 : o.call(n)) && this.nativeRenderer.setVertsDirty();
}, o.prototype.setSpacingX = function(t) {
this.nativeRenderer.spacingX = t;
}, o.prototype.setCacheMode = function(e) {
switch (e) {
case t.LabelCacheMode.NONE:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.NONE;
break;

case t.LabelCacheMode.BITMAP:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.BITMAP;
break;

case t.LabelCacheMode.CHAR:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.CHAR;
}
}, o.prototype.setEnableUnderline = function(t) {
this.nativeRenderer.enableUnderline = t;
}, o.prototype.setUnderlineHeight = function(t) {
this.nativeRenderer.underlineHeight = t;
}, o.prototype.ensureOutline = function() {
return this._outlineComp || (this._outlineComp = this.nativeNode.getComponent(cc.LabelOutline) || this.nativeNode.addComponent(cc.LabelOutline)), 
this._outlineComp;
}, o.prototype.setOutlineRgb = function(t) {
var e = this.ensureOutline();
this.setRgbColor(t, To.color), To.color.a = e.color.a, e.color = To.color;
}, o.prototype.setOutlineAlpha = function(t) {
var e = this.ensureOutline();
To.color.set(e.color), To.color.a = this.opacityToAlpha(t), e.color = To.color;
}, o.prototype.setOutlineWidth = function(t) {
this.ensureOutline().width = t;
}, o.prototype.ensureShadow = function() {
return this._shadowComp || (this._shadowComp = this.nativeNode.getComponent(cc.LabelShadow) || this.nativeNode.addComponent(cc.LabelShadow)), 
this._shadowComp;
}, o.prototype.setShadowRgb = function(t) {
var e = this.ensureShadow();
this.setRgbColor(t, To.color), To.color.a = e.color.a, e.color = To.color;
}, o.prototype.setShadowAlpha = function(t) {
var e = this.ensureShadow();
To.color.set(e.color), To.color.a = this.opacityToAlpha(t), e.color = To.color;
}, o.prototype.setShadowOffset = function(t, e) {
this.ensureShadow().offset = new cc.Vec2(t, e);
}, o.prototype.setShadowBlur = function(t) {
this.ensureShadow().blur = t;
}, o;
}(bo);
t.SpineControl = void 0, (Fo = t.SpineControl || (t.SpineControl = {}))[Fo.Pause = 1] = "Pause", 
Fo[Fo.Resume = 2] = "Resume", Fo[Fo.Stop = 3] = "Stop", t.SpineAnimationCacheMode = void 0, 
(Eo = t.SpineAnimationCacheMode || (t.SpineAnimationCacheMode = {}))[Eo.Realtime = 0] = "Realtime", 
Eo[Eo.SharedCache = 1] = "SharedCache", Eo[Eo.PrivateCache = 2] = "PrivateCache";
var Io = {
spineUrl: function(t, e) {
return t.setSpineUrl(e);
},
animation: {
name: function(t, e) {
return t.setAnimationName(e);
},
index: function(t, e) {
return t.setAnimationIndex(e);
},
loop: function(t, e) {
return t.setAnimationLoop(e);
}
},
skin: function(t, e) {
return t.setSkin(e);
},
timeScale: function(t, e) {
return t.setTimeScale(e);
},
premultipliedAlpha: function(t, e) {
return t.setPremultipliedAlpha(e);
},
enableBatch: function(t, e) {
return t.setEnableBatch(e);
},
animationCacheMode: function(t, e) {
return t.setAnimationCacheMode(e);
},
spineCtrl: function(t, e) {
return t.setSpineCtrl(e);
},
enabled: function(t, e) {
return t.setSpineEnabled(e);
}
}, Do = {
complete: function(t, e) {
return t.setAnimationComplete(e);
},
frame: function(t, e) {
return t.setAnimationFrameEvent(e);
}
};
function Mo(t) {
var e, n;
if (!t) return [];
var o = [];
try {
for (var r = d(Object.entries(t)), a = r.next(); !a.done; a = r.next()) {
var s = h(a.value, 2), l = s[0], u = s[1];
o.push(i(i({}, u), {
_boneName: l,
_bindAlpha: u.bindAlpha
}));
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
return o;
}
var Wo, Po, Oo, Lo = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._pendingAnimationIndex = 0, n._pendingBoneAttachments = [], n._baseTimeScale = 1, 
n._worldTimeScale = 1, n.nativeRenderer = n.nativeNode.getComponent(sp.Skeleton) || n.nativeNode.addComponent(sp.Skeleton), 
n.nativeRenderer.premultipliedAlpha = !1, n.nativeRenderer.loop = !0, n;
}
return n(o, e), Object.defineProperty(o.prototype, "_attachUtil", {
get: function() {
var t;
return null === (t = this.nativeRenderer) || void 0 === t ? void 0 : t.attachUtil;
},
enumerable: !1,
configurable: !0
}), o.prototype.initRender = function(t, n) {
e.prototype.initRender.call(this, t, n), this._baseTimeScale = 1, this._worldTimeScale = this.universe.getWorldRenderTimeScale(n), 
this.nativeRenderer.timeScale = this._baseTimeScale * this._worldTimeScale, this.nativeRenderer.enabled = !0;
}, o.prototype.setSpineEnabled = function(t) {
this.nativeRenderer.enabled = t;
}, o.prototype._hasValidTextureRefs = function(t) {
var e = t.textures;
return Boolean(e) && e.every(function(t) {
return Boolean(t);
});
}, o.prototype.restoreTexture = function() {
var t, e = this.nativeRenderer.skeletonData;
if (!e || !this._hasValidTextureRefs(e)) {
this.nativeRenderer.skeletonData = void 0;
var n = null !== (t = this._spineUrl) && void 0 !== t ? t : this._spineAttemptUrl;
n && (this._spineUrl = void 0, this.setSpineUrl(n));
}
}, o.prototype.setSpineUrl = function(e) {
var n = this;
this._spineUrl !== e && (this._spineAttemptUrl = e, this._spineUrl = e, this.loadAsset("spine", e, t.LoaderAssetType.SkeletonData, function(t) {
if (t) {
if (!n._hasValidTextureRefs(t)) return void (n._spineUrl = void 0);
var e = n.nativeRenderer.skeletonData === t;
if (e || (n.nativeRenderer.skeletonData = t, n.nativeRenderer._updateMaterial()), 
n._pendingSkin && n.nativeRenderer.setSkin(n._pendingSkin), n._applyAnimation(), 
e) return;
n._applyPendingBoneAttachments(), n._width > 0 && (n.nativeNode.width = n._width), 
n._height > 0 && (n.nativeNode.height = n._height);
}
}, function() {
n._spineUrl = void 0;
}));
}, o.prototype.setAnimationName = function(t) {
this._pendingAnimationName = t, this._applyAnimation();
}, o.prototype.setAnimationIndex = function(t) {
this._pendingAnimationIndex = t;
}, o.prototype.setAnimationLoop = function(t) {
if (this.nativeRenderer.loop = t, !this.nativeRenderer.isAnimationCached()) {
var e = this.nativeRenderer.getCurrent(this._pendingAnimationIndex);
if (e) {
if (!t && e.loop) {
var n = e.animationStart, o = e.animationEnd - n;
o > 0 && e.trackTime > e.animationEnd && (e.trackTime = n + (e.trackTime - n) % o);
}
e.loop = t;
}
}
}, o.prototype._applyAnimation = function() {
this.nativeRenderer.skeletonData && this._pendingAnimationName && (this.nativeRenderer.setAnimation(this._pendingAnimationIndex, this._pendingAnimationName, this.nativeRenderer.loop), 
this.nativeRenderer.defaultAnimation = this._pendingAnimationName);
}, o.prototype.setSkin = function(t) {
this._pendingSkin = t, this.nativeRenderer.skeletonData && this.nativeRenderer.setSkin(t);
}, o.prototype.setTimeScale = function(t) {
this._baseTimeScale = t, this.nativeRenderer.timeScale = t * this._worldTimeScale;
}, o.prototype.applyWorldTimeScale = function(t) {
this._worldTimeScale = t, this.nativeRenderer.timeScale = this._baseTimeScale * t;
}, o.prototype.setPremultipliedAlpha = function(t) {
this.nativeRenderer.premultipliedAlpha = t;
}, o.prototype.setEnableBatch = function(t) {
this.nativeRenderer.enableBatch = t;
}, o.prototype.setAnimationCacheMode = function(e) {
var n;
switch (e) {
case t.SpineAnimationCacheMode.Realtime:
n = sp.Skeleton.AnimationCacheMode.REALTIME;
break;

case t.SpineAnimationCacheMode.SharedCache:
n = sp.Skeleton.AnimationCacheMode.SHARED_CACHE;
break;

case t.SpineAnimationCacheMode.PrivateCache:
n = sp.Skeleton.AnimationCacheMode.PRIVATE_CACHE;
break;

default:
return;
}
this.nativeRenderer.setAnimationCacheMode(n);
}, o.prototype.setSpineCtrl = function(e) {
e === t.SpineControl.Pause ? this.nativeRenderer.paused = !0 : e === t.SpineControl.Resume ? this.nativeRenderer.paused = !1 : e === t.SpineControl.Stop && (this._stopAnimation(), 
this.nativeRenderer.paused = !1);
}, o.prototype._stopAnimation = function() {
var t = this.nativeRenderer;
if (t.isAnimationCached()) return t._isAniComplete = !0, t._animationQueue.length = 0, 
t._headAniInfo = null, t._accTime = 0, void (t._playCount = 0);
t.clearTracks();
}, o.prototype.setAnimationComplete = function(t) {
this.nativeRenderer.setCompleteListener(function() {
t && t();
});
}, o.prototype.setAnimationFrameEvent = function(t) {
var e = this;
this.nativeRenderer.setEventListener(function(n, o) {
var r = {
frameEventName: o.data.name,
eid: e.eid,
worldId: e.worldId
};
e.universe.handleSpineFrameEvent(r), t && t(r);
});
}, o.prototype.setMaterialProperty = function(t, n) {
e.prototype.setMaterialProperty.call(this, t, n), this.nativeRenderer._updateMaterial();
}, o.prototype.attachToBone = function(t, e, n) {
this.nativeRenderer.skeletonData ? this._attachToBoneInternal(t, e, n) : this._pendingBoneAttachments.push({
childNode: t,
boneName: e,
bindAlpha: n
});
}, o.prototype._attachToBoneInternal = function(t, e, n) {
var o = this._attachUtil;
if (o) {
var r = o.getAttachedNodes(e);
r && 0 !== r.length || (r = o.generateAttachedNodes(e)), r && r.length > 0 && (t.nativeNode.setParent(r[0]), 
n && (this._alphaSyncComp || (this._alphaSyncComp = this.nativeNode.getComponent(Go) || this.nativeNode.addComponent(Go)), 
this._alphaSyncComp.skeleton = this.nativeRenderer, this._alphaSyncComp.attachments.some(function(e) {
return e.childNode === t;
}) || this._alphaSyncComp.attachments.push({
childNode: t,
slotName: n
})));
}
}, o.prototype._applyPendingBoneAttachments = function() {
var t = this;
0 !== this._pendingBoneAttachments.length && this._pendingBoneAttachments.splice(0).forEach(function(e) {
var n = e.childNode, o = e.boneName, r = e.bindAlpha;
t._attachToBoneInternal(n, o, r);
});
}, o.prototype._detachAllBoneChildren = function() {
var t, e, n, o, r, i, a = this._attachUtil;
if (a) {
var s = a._attachedRootNode;
if (s) {
var l = [];
try {
for (var u = d(s.children), c = u.next(); !c.done; c = u.next()) {
var h = c.value;
try {
for (var p = (n = void 0, d(h.children)), f = p.next(); !f.done; f = p.next()) {
var m = f.value;
l.push(m);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
f && !f.done && (o = p.return) && o.call(p);
} finally {
if (n) throw n.error;
}
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
c && !c.done && (e = u.return) && e.call(u);
} finally {
if (t) throw t.error;
}
}
try {
for (var v = d(l), y = v.next(); !y.done; y = v.next()) (m = y.value).setParent(this.nativeNode);
} catch (t) {
r = {
error: t
};
} finally {
try {
y && !y.done && (i = v.return) && i.call(v);
} finally {
if (r) throw r.error;
}
}
}
}
}, o.prototype.disposeRender = function() {
var t;
this._pendingBoneAttachments.length = 0, this._alphaSyncComp && (this._alphaSyncComp.attachments.length = 0, 
this._alphaSyncComp.skeleton = void 0), this._detachAllBoneChildren(), null === (t = this._attachUtil) || void 0 === t || t.destroyAllAttachedNodes(), 
this.nativeRenderer.setCompleteListener(null), this.nativeRenderer.setEventListener(null), 
this._stopAnimation(), this.nativeRenderer.loop = !0, this.nativeRenderer.paused = !1, 
this.nativeRenderer.enabled = !0, this.nativeRenderer.skeletonData = void 0, this._spineUrl = void 0, 
this._spineAttemptUrl = void 0, this._pendingAnimationName = void 0, this._pendingAnimationIndex = 0, 
this._pendingSkin = void 0, e.prototype.disposeRender.call(this);
}, o;
}(bo), Go = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.attachments = [], e;
}
return n(e, t), e.prototype.lateUpdate = function() {
var t = this.skeleton;
if (t && t.skeletonData && 0 !== this.attachments.length) for (var e = 0; e < this.attachments.length; e++) {
var n = this.attachments[e], o = n.childNode.nativeNode;
if (o && cc.isValid(o)) {
var r = t.findSlot(n.slotName);
r && (o.opacity = Math.floor(255 * r.color.a));
}
}
}, s([ cc._decorator.ccclass("AESpineAlphaSync") ], e);
}(cc.Component);
t.GraphicsCmd = void 0, (Wo = t.GraphicsCmd || (t.GraphicsCmd = {})).MoveTo = "moveTo", 
Wo.LineTo = "lineTo", Wo.BezierCurveTo = "bezierCurveTo", Wo.QuadraticCurveTo = "quadraticCurveTo", 
Wo.Arc = "arc", Wo.Circle = "circle", Wo.Rect = "rect", Wo.RoundRect = "roundRect", 
Wo.Ellipse = "ellipse", Wo.Close = "close", Wo.Fill = "fill", Wo.Stroke = "stroke", 
Wo.Clear = "clear", Wo.FillColor = "fillColor", Wo.FillAlpha = "fillAlpha", Wo.StrokeColor = "strokeColor", 
Wo.StrokeAlpha = "strokeAlpha", Wo.StrokeWidth = "strokeWidth", Wo.LineJoin = "lineJoin", 
Wo.LineCap = "lineCap", Wo.SetUseModel = "setUseModel", t.GraphicsLineJoin = void 0, 
(Po = t.GraphicsLineJoin || (t.GraphicsLineJoin = {})).Miter = "Miter", Po.Round = "Round", 
Po.Bevel = "Bevel", t.GraphicsLineCap = void 0, (Oo = t.GraphicsLineCap || (t.GraphicsLineCap = {})).Butt = "Butt", 
Oo.Round = "Round", Oo.Square = "Square";
var Bo = {
autoClear: function(t, e) {
return t.setAutoClear(e);
},
draw: function(t, e) {
return t.draw(e);
}
};
function ko(t) {
var e, n;
if (t) {
var o = t;
void 0 !== o._graphicsUseModelOrig && (null === (n = null === (e = o._graphicsUseModelAsm) || void 0 === e ? void 0 : e.setUseModel) || void 0 === n || n.call(e, o._graphicsUseModelOrig), 
o._graphicsUseModelOrig = void 0, o._graphicsUseModelAsm = void 0);
}
}
var Vo = function(e) {
function o(t) {
var n = this;
return t || y(r.GraphicsRequired, {}), (n = e.call(this) || this).graphics = t, 
n._strokeColor = new cc.Color(255, 255, 255), n._fillColor = new cc.Color(255, 255, 255), 
n;
}
return n(o, e), o.prototype.moveTo = function(t, e) {
this.graphics.moveTo(t, e);
}, o.prototype.lineTo = function(t, e) {
this.graphics.lineTo(t, e);
}, o.prototype.close = function() {
this.graphics.close();
}, o.prototype.closePath = function() {
this.graphics.close();
}, o.prototype.rect = function(t, e, n, o) {
this.graphics.rect(t, e, n, o);
}, o.prototype.circle = function(t, e, n) {
this.graphics.circle(t, e, n);
}, o.prototype.roundRect = function(t, e, n, o, r) {
this.graphics.roundRect(t, e, n, o, r);
}, o.prototype.ellipse = function(t, e, n, o) {
this.graphics.ellipse(t, e, n, o);
}, o.prototype.arc = function(t, e, n, o, r, i) {
this.graphics.arc(t, e, n, o, r, i);
}, o.prototype.bezierCurveTo = function(t, e, n, o, r, i) {
this.graphics.bezierCurveTo(t, e, n, o, r, i);
}, o.prototype.quadraticCurveTo = function(t, e, n, o) {
this.graphics.quadraticCurveTo(t, e, n, o);
}, o.prototype.stroke = function() {
this.graphics.stroke();
}, o.prototype.fill = function() {
this.graphics.fill();
}, o.prototype.fillRect = function(t, e, n, o) {
this.graphics.fillRect(t, e, n, o);
}, o.prototype.clear = function() {
this.graphics.clear();
}, o.prototype.setRgbColor = function(t, e) {
e.r = t >>> 16 & 255, e.g = t >>> 8 & 255, e.b = 255 & t;
}, Object.defineProperty(o.prototype, "strokeColor", {
get: function() {
return Number(this._strokeColor.toHEX("#rrggbb").substring(1));
},
set: function(t) {
this.setRgbColor(t, this._strokeColor), this._strokeColor.a = this.graphics.strokeColor.a, 
this.graphics.strokeColor = this._strokeColor;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(o.prototype, "strokeAlpha", {
get: function() {
return this._strokeColor.a / 255;
},
set: function(t) {
this._strokeColor.a = Math.floor(255 * t), this.graphics.strokeColor = this._strokeColor;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(o.prototype, "strokeWidth", {
get: function() {
return this.graphics.lineWidth;
},
set: function(t) {
this.graphics.lineWidth = t;
},
enumerable: !1,
configurable: !0
}), o.prototype.setFillColor = function(t) {
this.setRgbColor(t, this._fillColor), this._fillColor.a = this.graphics.fillColor.a, 
this.graphics.fillColor = this._fillColor;
}, o.prototype.setFillAlpha = function(t) {
this.graphics.fillColor.a = Math.floor(255 * t);
}, o.prototype.setStrokeColor = function(t) {
this.strokeColor = t;
}, o.prototype.setStrokeAlpha = function(t) {
this.strokeAlpha = t;
}, o.prototype.setStrokeWidth = function(t) {
this.strokeWidth = t;
}, o.prototype.setLineJoin = function(e) {
e === t.GraphicsLineJoin.Bevel ? this.graphics.lineJoin = cc.Graphics.LineJoin.BEVEL : e === t.GraphicsLineJoin.Round ? this.graphics.lineJoin = cc.Graphics.LineJoin.ROUND : this.graphics.lineJoin = cc.Graphics.LineJoin.MITER;
}, o.prototype.setLineCap = function(e) {
e === t.GraphicsLineCap.Round ? this.graphics.lineCap = cc.Graphics.LineCap.ROUND : e === t.GraphicsLineCap.Square ? this.graphics.lineCap = cc.Graphics.LineCap.SQUARE : this.graphics.lineCap = cc.Graphics.LineCap.BUTT;
}, o.prototype.setUseModel = function(t) {
t ? function(t) {
var e, n;
if (t) {
var o = t, r = o._assembler;
(null == r ? void 0 : r.setUseModel) && (o._graphicsUseModelAsm !== r && (o._graphicsUseModelOrig = null !== (n = null === (e = r.getUseModel) || void 0 === e ? void 0 : e.call(r)) && void 0 !== n && n, 
o._graphicsUseModelAsm = r), r.setUseModel(!0));
}
}(this.graphics) : ko(this.graphics);
}, o;
}(function() {
function e() {}
return e.prototype.setUseModel = function() {}, e.prototype.execute = function(e) {
if (e && 0 !== e.length) for (var n = 0, o = e.length; n < o; n++) {
var r = e[n];
switch (r[0]) {
case t.GraphicsCmd.MoveTo:
this.moveTo(r[1], r[2]);
break;

case t.GraphicsCmd.LineTo:
this.lineTo(r[1], r[2]);
break;

case t.GraphicsCmd.Rect:
this.rect(r[1], r[2], r[3], r[4]);
break;

case t.GraphicsCmd.Circle:
this.circle(r[1], r[2], r[3]);
break;

case t.GraphicsCmd.RoundRect:
this.roundRect(r[1], r[2], r[3], r[4], r[5]);
break;

case t.GraphicsCmd.Ellipse:
this.ellipse(r[1], r[2], r[3], r[4]);
break;

case t.GraphicsCmd.Arc:
this.arc(r[1], r[2], r[3], r[4], r[5], Boolean(r[6]));
break;

case t.GraphicsCmd.BezierCurveTo:
this.bezierCurveTo(r[1], r[2], r[3], r[4], r[5], r[6]);
break;

case t.GraphicsCmd.QuadraticCurveTo:
this.quadraticCurveTo(r[1], r[2], r[3], r[4]);
break;

case t.GraphicsCmd.Close:
this.close();
break;

case t.GraphicsCmd.Fill:
this.fill();
break;

case t.GraphicsCmd.Stroke:
this.stroke();
break;

case t.GraphicsCmd.Clear:
this.clear();
break;

case t.GraphicsCmd.FillColor:
this.setFillColor(r[1]);
break;

case t.GraphicsCmd.FillAlpha:
this.setFillAlpha(r[1]);
break;

case t.GraphicsCmd.StrokeColor:
this.setStrokeColor(r[1]);
break;

case t.GraphicsCmd.StrokeAlpha:
this.setStrokeAlpha(r[1]);
break;

case t.GraphicsCmd.StrokeWidth:
this.setStrokeWidth(r[1]);
break;

case t.GraphicsCmd.LineJoin:
this.setLineJoin(r[1]);
break;

case t.GraphicsCmd.LineCap:
this.setLineCap(r[1]);
break;

case t.GraphicsCmd.SetUseModel:
this.setUseModel(r[1]);
}
}
}, e;
}()), Uo = function(t) {
function e(e) {
var n = t.call(this, e) || this;
return n.autoClear = !0, n.nativeRenderer = n.nativeNode.getComponent(cc.Graphics) || n.nativeNode.addComponent(cc.Graphics), 
n.driver = new Vo(n.nativeRenderer), n;
}
return n(e, t), e.prototype.setAutoClear = function(t) {
this.autoClear = t;
}, e.prototype.draw = function(t) {
this.autoClear && this.nativeRenderer.clear(), this.driver.execute(t);
}, e.prototype.setMaterialProperty = function(e, n) {
t.prototype.setMaterialProperty.call(this, e, n), this.nativeRenderer.markForRender(!0);
}, e.prototype.disposeRender = function() {
cc.isValid(this.nativeRenderer) && ko(this.nativeRenderer), t.prototype.disposeRender.call(this);
}, e.prototype.destroyNative = function() {
cc.isValid(this.nativeRenderer) && ko(this.nativeRenderer), t.prototype.destroyNative.call(this);
}, e;
}(bo), zo = cc._decorator.ccclass, Ho = cc.Graphics.LineJoin, jo = cc.Graphics.LineCap, Yo = Math.PI, qo = Math.max, Xo = Math.ceil, Qo = Math.acos, Jo = cc.Enum({
PT_CORNER: 1,
PT_LEFT: 2,
PT_BEVEL: 4,
PT_INNERBEVEL: 8
}), Ko = cc.gfx, Zo = new Ko.VertexFormat([ {
name: Ko.ATTR_POSITION,
type: Ko.ATTR_TYPE_FLOAT32,
num: 2
}, {
name: Ko.ATTR_COLOR,
type: Ko.ATTR_TYPE_UINT8,
num: 4,
normalize: !0
}, {
name: "a_dist",
type: Ko.ATTR_TYPE_FLOAT32,
num: 1
}, {
name: "a_lines",
type: Ko.ATTR_TYPE_FLOAT32,
num: 1
} ]);
Zo.name = "vfmtPosColorSdfLines";
var $o = {
getConstructor: function() {
return function(t) {
function e(e) {
var n = t.call(this, e) || this;
return n.lines = 0, n;
}
return n(e, t), e.prototype.getVfmt = function() {
return Zo;
}, e.prototype.getVfmtFloatCount = function() {
return 5;
}, e.prototype._expandStroke = function(t) {
var e, n, o, r, i = .5 * t.lineWidth, a = t.lineCap, s = t.lineJoin, l = t.miterLimit, u = t._impl, c = (e = i, 
n = Yo, o = u._tessTol, r = 2 * Qo(e / (e + o)), qo(2, Xo(n / r)));
this._calculateJoins(u, i, s, l);
for (var d = u._paths, h = 0, p = u._pathOffset, f = u._pathLength; p < f; p++) {
var m = (A = d[p]).points.length;
s === Ho.ROUND ? h += 2 * (m + A.nbevel * (c + 2) + 1) : h += 2 * (m + 5 * A.nbevel + 1), 
A.closed || (a === jo.ROUND ? h += 2 * (2 * c + 2) : h += 12);
}
var v = this.genBuffer(t, h), y = v.meshbuffer, _ = y._vData, g = y._iData;
for (p = u._pathOffset, f = u._pathLength; p < f; p++) {
var A, C = (A = d[p]).points, R = (m = C.length, v.vertexStart), S = void 0, T = void 0, b = void 0, w = void 0, F = A.closed;
if (F ? (S = C[m - 1], T = C[0], b = 0, w = m) : (S = C[0], T = C[1], b = 1, w = m - 1), 
T = T || S, this.lines = 0, !F) {
(M = T.sub(S)).normalizeSelf();
var E = M.x, N = M.y;
a === jo.BUTT ? this._buttCapStart(S, E, N, i, 0) : a === jo.SQUARE ? this._buttCapStart(S, E, N, i, i) : a === jo.ROUND && this._roundCapStart(S, E, N, i, c);
}
this.lines += T.sub(S).mag();
for (var x = b; x < w; ++x) s === Ho.ROUND ? this._roundJoin(S, T, i, i, c) : 0 != (T.flags & (Jo.PT_BEVEL | Jo.PT_INNERBEVEL)) ? this._bevelJoin(S, T, i, i) : (this._vset(T.x + T.dmx * i, T.y + T.dmy * i, 1), 
this._vset(T.x - T.dmx * i, T.y - T.dmy * i, -1)), S = T, T = C[x + 1], this.lines += T.sub(S).mag();
if (F) {
var I = this.getVfmtFloatCount(), D = R * I;
this._vset(_[D], _[D + 1], 1), this._vset(_[D + I], _[D + I + 1], -1);
} else {
var M;
(M = T.sub(S)).normalizeSelf(), E = M.x, N = M.y, a === jo.BUTT ? this._buttCapEnd(T, E, N, i, 0) : a === jo.SQUARE ? this._buttCapEnd(T, E, N, i, i) : a === jo.ROUND && this._roundCapEnd(T, E, N, i, c);
}
for (var W = v.indiceStart, P = R + 2, O = v.vertexStart; P < O; P++) g[W++] = P - 2, 
g[W++] = P - 1, g[W++] = P;
v.indiceStart = W;
}
}, e.prototype._vset = function(t, e, n) {
void 0 === n && (n = 0);
var o = this._buffer, r = o.meshbuffer, i = o.vertexStart * this.getVfmtFloatCount(), a = r._vData, s = r._uintVData;
a[i] = t, a[i + 1] = e, s[i + 2] = this._curColor, a[i + 3] = n, a[i + 4] = this.lines, 
o.vertexStart++, r._dirty = !0;
}, e;
}(cc.Graphics.__assembler__);
}
}, tr = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ zo ], e);
}(cc.Graphics);
cc.Assembler.register(tr, $o);
var er, nr = function(t) {
function e(e) {
var n = t.call(this, e) || this;
return n.nativeRenderer = n.nativeNode.getComponent(tr) || n.nativeNode.addComponent(tr), 
n.driver = new Vo(n.nativeRenderer), n;
}
return n(e, t), e;
}(Uo);
t.MaskType = void 0, (er = t.MaskType || (t.MaskType = {})).Rect = "Rect", er.Ellipse = "Ellipse", 
er.Image = "Image", er.Graphics = "Graphics";
var or, rr, ir = {
type: function(t, e) {
return t.setMaskType(e);
},
inverted: function(t, e) {
return t.setMaskInverted(e);
},
maskImage: function(t, e) {
return t.setMaskImage(e);
},
maskTexture: function(t, e) {
return t.setMaskTexture(e);
},
alphaThreshold: function(t, e) {
return t.setMaskAlphaThreshold(e);
},
maskGraphics: function(t, e) {
return t.setMaskGraphics(e);
},
enabled: function(t, e) {
return t.setMaskEnabled(e);
}
};
function ar(e) {
switch (e) {
case t.BlendFactor.One:
return cc.macro.BlendFactor.ONE;

case t.BlendFactor.Zero:
return cc.macro.BlendFactor.ZERO;

case t.BlendFactor.SrcAlpha:
return cc.macro.BlendFactor.SRC_ALPHA;

case t.BlendFactor.SrcColor:
return cc.macro.BlendFactor.SRC_COLOR;

case t.BlendFactor.DstAlpha:
return cc.macro.BlendFactor.DST_ALPHA;

case t.BlendFactor.DstColor:
return cc.macro.BlendFactor.DST_COLOR;

case t.BlendFactor.OneMinusSrcAlpha:
return cc.macro.BlendFactor.ONE_MINUS_SRC_ALPHA;

case t.BlendFactor.OneMinusSrcColor:
return cc.macro.BlendFactor.ONE_MINUS_SRC_COLOR;

case t.BlendFactor.OneMinusDstAlpha:
return cc.macro.BlendFactor.ONE_MINUS_DST_ALPHA;

case t.BlendFactor.OneMinusDstColor:
return cc.macro.BlendFactor.ONE_MINUS_DST_COLOR;

default:
return cc.macro.BlendFactor.SRC_ALPHA;
}
}
function sr(e) {
switch (e) {
case t.PixelFormat.RGBA8888:
return cc.Texture2D.PixelFormat.RGBA8888;

case t.PixelFormat.RGB888:
return cc.Texture2D.PixelFormat.RGB888;

case t.PixelFormat.RGB565:
return cc.Texture2D.PixelFormat.RGB565;

case t.PixelFormat.RGBA4444:
return cc.Texture2D.PixelFormat.RGBA4444;

case t.PixelFormat.A8:
return cc.Texture2D.PixelFormat.A8;

case t.PixelFormat.I8:
return cc.Texture2D.PixelFormat.I8;

case t.PixelFormat.AI88:
return cc.Texture2D.PixelFormat.AI8;

default:
return cc.Texture2D.PixelFormat.RGBA8888;
}
}
function lr(e) {
switch (e) {
case t.TextureFilter.Nearest:
return cc.Texture2D.Filter.NEAREST;

case t.TextureFilter.Linear:
default:
return cc.Texture2D.Filter.LINEAR;
}
}
function ur(e) {
switch (e) {
case t.TextureWrapMode.Repeat:
return cc.Texture2D.WrapMode.REPEAT;

case t.TextureWrapMode.ClampToEdge:
return cc.Texture2D.WrapMode.CLAMP_TO_EDGE;

case t.TextureWrapMode.MirroredRepeat:
return cc.Texture2D.WrapMode.MIRRORED_REPEAT;

default:
return cc.Texture2D.WrapMode.CLAMP_TO_EDGE;
}
}
t.BlendFactor = void 0, (or = t.BlendFactor || (t.BlendFactor = {}))[or.One = 0] = "One", 
or[or.Zero = 1] = "Zero", or[or.SrcAlpha = 2] = "SrcAlpha", or[or.SrcColor = 3] = "SrcColor", 
or[or.DstAlpha = 4] = "DstAlpha", or[or.DstColor = 5] = "DstColor", or[or.OneMinusSrcAlpha = 6] = "OneMinusSrcAlpha", 
or[or.OneMinusSrcColor = 7] = "OneMinusSrcColor", or[or.OneMinusDstAlpha = 8] = "OneMinusDstAlpha", 
or[or.OneMinusDstColor = 9] = "OneMinusDstColor";
var cr, dr = ((rr = {})[t.MaskType.Rect] = cc.Mask.Type.RECT, rr[t.MaskType.Ellipse] = cc.Mask.Type.ELLIPSE, 
rr[t.MaskType.Image] = cc.Mask.Type.IMAGE_STENCIL, rr[t.MaskType.Graphics] = void 0, 
rr), hr = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n.nativeRenderer = n.nativeNode.getComponent(cc.Mask) || n.nativeNode.addComponent(cc.Mask), 
n;
}
return n(o, e), o.prototype.setMaskType = function(e) {
var n = this;
this.nativeRenderer.enabledInHierarchy || !cc.isValid(this.nativeRenderer) ? this.nativeRenderer.type !== dr[e] && (this.nativeRenderer.type = dr[e], 
e === t.MaskType.Image && (this._maskImageUrl ? this._loadMaskImage(this._maskImageUrl) : this._pendingTextureData && this._applyTextureData(this._pendingTextureData))) : this.nativeRenderer.scheduleOnce(function() {
return n.setMaskType(e);
});
}, o.prototype.setMaskInverted = function(t) {
this.nativeRenderer.inverted = t;
}, o.prototype.setMaskImage = function(t) {
if (!t) return this._pendingTextureData = void 0, this._clearDynamicTexture(), this.nativeRenderer.spriteFrame = void 0, 
void (this._maskImageUrl = void 0);
this._maskImageUrl !== t && (this._maskImageUrl = t, this._pendingTextureData = void 0, 
this._clearDynamicTexture(), this.nativeRenderer.type === cc.Mask.Type.IMAGE_STENCIL && this._loadMaskImage(t));
}, o.prototype._loadMaskImage = function(e) {
var n = this;
this.loadAsset("maskSprite", e, t.LoaderAssetType.SpriteFrame, function(t) {
n._maskImageUrl === e && (n.nativeRenderer.spriteFrame = t);
});
}, o.prototype.setMaskTexture = function(t) {
if (!t) return this._maskImageUrl = void 0, this._pendingTextureData = void 0, this._clearDynamicTexture(), 
void (this.nativeRenderer.spriteFrame = void 0);
this._maskImageUrl = void 0, this._pendingTextureData = t, this.nativeRenderer.type === cc.Mask.Type.IMAGE_STENCIL && this._applyTextureData(t);
}, o.prototype._applyTextureData = function(e) {
var n, o, r = null !== (n = e.format) && void 0 !== n ? n : t.PixelFormat.RGBA8888;
if (!e.pixels || !e.pixels.length || e.width <= 0 || e.height <= 0) this._rejectTextureDataApply(); else {
var i = e.width * e.height * so(r);
if (e.pixels.length !== i) return "[CocosMaskNode] pixels 大小不匹配: 期望 ".concat(i, " 字节 "), 
"(".concat(e.width, "x").concat(e.height, ", ").concat(t.PixelFormat[r], "), 实际 ").concat(e.pixels.length, " 字节"), 
void this._rejectTextureDataApply();
var a = sr(r), s = lr(null !== (o = e.filter) && void 0 !== o ? o : t.TextureFilter.Linear);
if (this._dynamicTex) this._dynamicTex.initWithData(e.pixels, a, e.width, e.height), 
this._dynamicTex.setFilters(s, s), this._dynamicSpriteFrame.setTexture(this._dynamicTex), 
this.nativeRenderer.spriteFrame = this._dynamicSpriteFrame; else {
var l = new cc.Texture2D();
l.packable = !1, l.setFilters(s, s), l.initWithData(e.pixels, a, e.width, e.height), 
this._dynamicTex = l, this._dynamicSpriteFrame = new cc.SpriteFrame(l), this.nativeRenderer.spriteFrame = this._dynamicSpriteFrame;
}
}
}, o.prototype._clearDynamicTexture = function() {
this._dynamicTex && (this._dynamicSpriteFrame && (this.nativeRenderer.spriteFrame === this._dynamicSpriteFrame && (this.nativeRenderer.spriteFrame = void 0), 
this._dynamicSpriteFrame = void 0), this._dynamicTex.destroy(), this._dynamicTex = void 0);
}, o.prototype._rejectTextureDataApply = function() {
this._pendingTextureData = void 0, this._clearDynamicTexture(), this.nativeRenderer.spriteFrame = void 0;
}, o.prototype.setMaskAlphaThreshold = function(t) {
this.nativeRenderer.alphaThreshold = t;
}, o.prototype.setMaskGraphics = function(t) {
var e = this, n = this.nativeRenderer._graphics;
if (n) {
this._driver || (this._driver = new Vo(n));
var o = function() {
e.nativeRenderer.enabledInHierarchy && (e._driver.execute(t), e.nativeRenderer.setVertsDirty());
};
this.nativeRenderer._updateGraphics = o, o();
} else this.nativeRenderer.scheduleOnce(function() {
return e.setMaskGraphics(t);
});
}, o.prototype.setMaskEnabled = function(t) {
this.nativeRenderer.enabled = t;
}, o.prototype.disposeRender = function() {
cc.isValid(this.nativeRenderer) && (this.nativeRenderer.unscheduleAllCallbacks(), 
ko(this.nativeRenderer._graphics)), this._pendingTextureData = void 0, this._clearDynamicTexture(), 
this._driver = void 0, e.prototype.disposeRender.call(this);
}, o.prototype.destroyNative = function() {
cc.isValid(this.nativeRenderer) && (ko(this.nativeRenderer._graphics), this.nativeRenderer._spriteFrame = void 0), 
this._pendingTextureData = void 0, this._clearDynamicTexture(), e.prototype.destroyNative.call(this);
}, o;
}(bo);
t.ScrollControl = void 0, (cr = t.ScrollControl || (t.ScrollControl = {}))[cr.Normal = 0] = "Normal", 
cr[cr.Refresh = 1] = "Refresh";
var pr, fr, mr, vr = {
horizontal: function(t, e) {
return t.setScrollViewHorizontal(e);
},
vertical: function(t, e) {
return t.setScrollViewVertical(e);
},
inertia: function(t, e) {
return t.setScrollViewInertia(e);
},
elastic: function(t, e) {
return t.setScrollViewElastic(e);
},
bounceDuration: function(t, e) {
return t.setScrollViewBounceDuration(e);
},
brake: function(t, e) {
return t.setScrollViewBrake(e);
},
content: {
name: function(t, e) {
return t.setScrollViewContentName(e);
},
x: function(t, e) {
return t.setScrollViewContentX(e);
},
y: function(t, e) {
return t.setScrollViewContentY(e);
},
itemCount: function(t, e) {
return t.setItemCount(e);
},
itemHeight: function(t, e) {
return t.setItemHeight(e);
},
bufferSize: function(t, e) {
return t.setBufferSize(e);
},
itemRender: function(t, e) {
return t.setOnItemRender(e);
},
scrollCtrl: function(t, e) {
return t.setScrollCtrl(e);
},
scrollTarget: function(t, e) {
e >= 0 && t.scrollToIndex(e);
}
}
}, yr = {
scrollBegan: function(t, e) {
return t.setOnScrollBegan(e);
},
scrollEnded: function(t, e) {
return t.setOnScrollEnded(e);
},
scrolling: function(t, e) {
return t.setOnScrolling(e);
}
};
t.RenderType = void 0, (pr = t.RenderType || (t.RenderType = {}))[pr.Simple = 0] = "Simple", 
pr[pr.Sliced = 1] = "Sliced", pr[pr.Tiled = 2] = "Tiled", pr[pr.Filled = 3] = "Filled", 
pr[pr.Mesh = 4] = "Mesh", t.SpriteFillType = void 0, (fr = t.SpriteFillType || (t.SpriteFillType = {}))[fr.Horizontal = 0] = "Horizontal", 
fr[fr.Vertical = 1] = "Vertical", fr[fr.Radial = 2] = "Radial", t.SizeMode = void 0, 
(mr = t.SizeMode || (t.SizeMode = {}))[mr.Custom = 0] = "Custom", mr[mr.Trimmed = 1] = "Trimmed", 
mr[mr.Raw = 2] = "Raw";
var _r, gr, Ar, Cr = {
img: function(t, e) {
return t.setImage(e);
},
atlas: function(t, e) {
return t.setAtlas(e);
},
frameName: function(t, e) {
return t.setFrameName(e);
},
defaultImg: function(t, e) {
return t.setDefaultImage(e);
},
renderType: function(t, e) {
return t.setRenderType(e);
},
sizeMode: function(t, e) {
return t.setSizeMode(e);
},
dstBlendFactor: function(t, e) {
return t.setDstBlendFactor(e);
},
srcBlendFactor: function(t, e) {
return t.setSrcBlendFactor(e);
},
trim: function(t, e) {
return t.setTrim(e);
},
fillType: function(t, e) {
return t.setFillType(e);
},
fillCenterX: function(t, e) {
return t.setFillCenterX(e);
},
fillCenterY: function(t, e) {
return t.setFillCenterY(e);
},
fillStart: function(t, e) {
return t.setFillStart(e);
},
fillRange: function(t, e) {
return t.setFillRange(e);
},
hideUntilLoaded: function(t, e) {
return t.setHideUntilLoaded(e);
}
}, Rr = {
fadeTime: function(t, e) {
return t.setFadeTime(e);
},
minSeg: function(t, e) {
return t.setMinSeg(e);
},
stroke: function(t, e) {
return t.setStroke(e);
},
texture: function(t, e) {
return t.setTexture(e);
},
streakColor: function(t, e) {
return t.setStreakColor(e);
},
fastMode: function(t, e) {
return t.setFastMode(e);
},
srcBlendFactor: function(t, e) {
return t.setSrcBlendFactor(e);
},
dstBlendFactor: function(t, e) {
return t.setDstBlendFactor(e);
}
};
t.ParticlePositionType = void 0, (_r = t.ParticlePositionType || (t.ParticlePositionType = {}))[_r.Free = 0] = "Free", 
_r[_r.Relative = 1] = "Relative", _r[_r.Grouped = 2] = "Grouped", t.ParticleEmitterMode = void 0, 
(gr = t.ParticleEmitterMode || (t.ParticleEmitterMode = {}))[gr.Gravity = 0] = "Gravity", 
gr[gr.Radius = 1] = "Radius", t.ParticleControl = void 0, (Ar = t.ParticleControl || (t.ParticleControl = {}))[Ar.Normal = 0] = "Normal", 
Ar[Ar.Stop = 1] = "Stop", Ar[Ar.Reset = 2] = "Reset";
var Sr, Tr, br, wr = {
file: function(t, e) {
return t.setFile(e);
},
particleImg: function(t, e) {
return t.setParticleAsset(e);
},
duration: function(t, e) {
return t.setDuration(e);
},
emissionRate: function(t, e) {
return t.setEmissionRate(e);
},
life: function(t, e) {
return t.setLife(e);
},
totalParticles: function(t, e) {
return t.setTotalParticles(e);
},
startRgb: function(t, e) {
return t.setStartRgb(e);
},
startAlpha: function(t, e) {
return t.setStartAlpha(e);
},
startRgbVar: function(t, e) {
return t.setStartRgbVar(e);
},
startAlphaVar: function(t, e) {
return t.setStartAlphaVar(e);
},
endRgb: function(t, e) {
return t.setEndRgb(e);
},
endAlpha: function(t, e) {
return t.setEndAlpha(e);
},
endRgbVar: function(t, e) {
return t.setEndRgbVar(e);
},
endAlphaVar: function(t, e) {
return t.setEndAlphaVar(e);
},
particleAngle: function(t, e) {
return t.setParticleAngle(e);
},
startSize: function(t, e) {
return t.setStartSize(e);
},
endSize: function(t, e) {
return t.setEndSize(e);
},
startSpin: function(t, e) {
return t.setStartSpin(e);
},
endSpin: function(t, e) {
return t.setEndSpin(e);
},
posVar: function(t, e) {
return t.setPosVar(e.x, e.y);
},
positionType: function(t, e) {
return t.setPositionType(e);
},
emitterMode: function(t, e) {
return t.setEmitterMode(e);
},
gravity: function(t, e) {
return t.setGravity(e.x, e.y);
},
speed: function(t, e) {
return t.setSpeed(e);
},
tangentialAccel: function(t, e) {
return t.setTangentialAccel(e);
},
radialAccel: function(t, e) {
return t.setRadialAccel(e);
},
rotationIsDir: function(t, e) {
return t.setRotationIsDir(e);
},
startRadius: function(t, e) {
return t.setStartRadius(e);
},
endRadius: function(t, e) {
return t.setEndRadius(e);
},
rotatePerS: function(t, e) {
return t.setRotatePerS(e);
},
srcBlendFactor: function(t, e) {
return t.setSrcBlendFactor(e);
},
dstBlendFactor: function(t, e) {
return t.setDstBlendFactor(e);
},
particleCtrl: function(t, e) {
return t.setParticleCtrl(e);
}
};
t.EditBoxInputMode = void 0, (Sr = t.EditBoxInputMode || (t.EditBoxInputMode = {}))[Sr.ANY = 0] = "ANY", 
Sr[Sr.EMAIL_ADDR = 1] = "EMAIL_ADDR", Sr[Sr.NUMERIC = 2] = "NUMERIC", Sr[Sr.PHONENUMBER = 3] = "PHONENUMBER", 
Sr[Sr.URL = 4] = "URL", Sr[Sr.DECIMAL = 5] = "DECIMAL", Sr[Sr.SINGLE_LINE = 6] = "SINGLE_LINE", 
t.EditBoxInputFlag = void 0, (Tr = t.EditBoxInputFlag || (t.EditBoxInputFlag = {}))[Tr.PASSWORD = 0] = "PASSWORD", 
Tr[Tr.SENSITIVE = 1] = "SENSITIVE", Tr[Tr.INITIAL_CAPS_WORD = 2] = "INITIAL_CAPS_WORD", 
Tr[Tr.INITIAL_CAPS_SENTENCE = 3] = "INITIAL_CAPS_SENTENCE", Tr[Tr.INITIAL_CAPS_ALL_CHARACTERS = 4] = "INITIAL_CAPS_ALL_CHARACTERS", 
Tr[Tr.LOWERCASE_ALL_CHARACTERS = 5] = "LOWERCASE_ALL_CHARACTERS", t.EditBoxReturnType = void 0, 
(br = t.EditBoxReturnType || (t.EditBoxReturnType = {}))[br.DEFAULT = 0] = "DEFAULT", 
br[br.DONE = 1] = "DONE", br[br.SEND = 2] = "SEND", br[br.SEARCH = 3] = "SEARCH", 
br[br.GO = 4] = "GO";
var Fr, Er = {
text: function(t, e) {
return t.setText(e);
},
backgroundImage: function(t, e) {
return t.setBackgroundImage(e);
},
returnType: function(t, e) {
return t.setReturnType(e);
},
inputFlag: function(t, e) {
return t.setInputFlag(e);
},
inputMode: function(t, e) {
return t.setInputMode(e);
},
fontSize: function(t, e) {
return t.setFontSize(e);
},
lineHeight: function(t, e) {
return t.setLineHeight(e);
},
fontRgb: function(t, e) {
return t.setFontRgb(e);
},
fontAlpha: function(t, e) {
return t.setFontAlpha(e);
},
placeholder: function(t, e) {
return t.setPlaceholder(e);
},
placeholderFontSize: function(t, e) {
return t.setPlaceholderFontSize(e);
},
placeholderFontRgb: function(t, e) {
return t.setPlaceholderFontRgb(e);
},
placeholderFontAlpha: function(t, e) {
return t.setPlaceholderFontAlpha(e);
},
backgroundRgb: function(t, e) {
return t.setBackgroundRgb(e);
},
backgroundAlpha: function(t, e) {
return t.setBackgroundAlpha(e);
},
maxLength: function(t, e) {
return t.setMaxLength(e);
}
}, Nr = {
editBegin: function(t, e) {
return t.setOnEditBegin(e);
},
editChange: function(t, e) {
return t.setOnEditChange(e);
},
editEnd: function(t, e) {
return t.setOnEditEnd(e);
}
};
t.ShadowCastingMode = void 0, (Fr = t.ShadowCastingMode || (t.ShadowCastingMode = {}))[Fr.Off = 0] = "Off", 
Fr[Fr.On = 1] = "On";
var xr, Ir = {
mesh: function(t, e) {
return t.setMesh(e);
},
shadowCastingMode: function(t, e) {
return t.setShadowCastingMode(e);
},
receiveShadows: function(t, e) {
return t.setReceiveShadows(e);
}
}, Dr = {
text: function(t, e) {
return t.setText(e);
},
fontSize: function(t, e) {
return t.setFontSize(e);
},
horizontalAlign: function(t, e) {
return t.setHorizontalAlign(e);
},
maxWidth: function(t, e) {
return t.setMaxWidth(e);
},
lineHeight: function(t, e) {
return t.setLineHeight(e);
},
fontFamily: function(t, e) {
return t.setFontFamily(e);
},
font: function(t, e) {
return t.setFont(e);
},
useSystemFont: function(t, e) {
return t.setUseSystemFont(e);
},
cacheMode: function(t, e) {
return t.setCacheMode(e);
},
imageAtlas: function(t, e) {
return t.setImageAtlas(e);
},
handleTouchEvent: function(t, e) {
return t.setHandleTouchEvent(e);
}
}, Mr = {
click: function(t, e) {
return t.setOnClick(e);
}
}, Wr = function(t, e) {
return i(i(i({}, io), t), {
event: i(i({}, io.event), e)
});
}, Pr = ((xr = {})[t.RenderNodeType.Node] = Wr({}), xr[t.RenderNodeType.Sprite] = Wr(Cr), 
xr[t.RenderNodeType.Text] = Wr(No), xr[t.RenderNodeType.Spine] = Wr(Io, Do), xr[t.RenderNodeType.Graphics] = Wr(Bo), 
xr[t.RenderNodeType.TraceGraphics] = Wr(Bo), xr[t.RenderNodeType.Mask] = Wr(ir), 
xr[t.RenderNodeType.ScrollView] = Wr(vr, yr), xr[t.RenderNodeType.Camera] = Wr(mo), 
xr[t.RenderNodeType.Streak] = Wr(Rr), xr[t.RenderNodeType.Particle] = Wr(wr), xr[t.RenderNodeType.EditBox] = Wr(Er, Nr), 
xr[t.RenderNodeType.Mesh] = Wr(Ir), xr[t.RenderNodeType.Texture2D] = Wr(uo), xr[t.RenderNodeType.RichText] = Wr(Dr, Mr), 
xr);
function Or(t) {
return Pr[t];
}
var Lr, Gr, Br = new Set([ "name", "event", "slots" ]);
function kr(t, e, n, o, r) {
for (var i in e) if (!(null == o ? void 0 : o.has(i))) {
var a = e[i], s = n[i];
if ("function" == typeof s) {
var l = a;
Array.isArray(a) && a.length >= 1 && "function" == typeof a[0] && (l = a[0](r)), 
s(t, l);
} else "object" == typeof s && null !== s && "object" == typeof a && null !== a && kr(t, a, s, void 0, r);
}
}
function Vr(t, e, n, o) {
var r, i, a = e(t.type);
if (void 0 !== n && void 0 !== o && a.initRender(n, o), t.props.name && (a.nodeName = t.props.name, 
a.setName(t.props.name)), kr(a, t.props, Or(t.type), Br, n), t.children) try {
for (var s = d(t.children), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
a.addChild(Vr(u, e, n, o));
}
} catch (t) {
r = {
error: t
};
} finally {
try {
l && !l.done && (i = s.return) && i.call(s);
} finally {
if (r) throw r.error;
}
}
return a;
}
function Ur(t, e, n, o) {
var r = e - t;
return r <= 0 ? (o.min = 0, o.max = 0, o) : (o.max = Math.max(0, n), o.min = Math.min(0, n - r), 
o);
}
function zr(t, e, n) {
return -(Math.max(t - e.max, 0) + Math.min(t - e.min, 0)) * n;
}
function Hr(t, e) {
return Math.max(e.min, Math.min(e.max, t));
}
function jr(t, e) {
return t > e.max || t < e.min;
}
function Yr(t, e, n, o, r, i, a) {
var s = jr(t, n), l = zr(t, n, i), u = e * Math.exp(-r * o) + l * o, c = t + u * o;
s && (t > n.max && c <= n.max ? (c = n.max, u = 0) : t < n.min && c >= n.min && (c = n.min, 
u = 0));
var d = Math.abs(u) < a && !jr(c, n);
return d && (u = 0, c = Hr(c, n)), [ c, u, d ];
}
function qr(t, e, n, o) {
var r = t > n.max, i = t < n.min;
return r && e > 0 || i && e < 0 ? e * o : e;
}
function Xr(e, n, o) {
var r = Math.abs(e), i = Math.abs(n);
return r < o && i < o ? t.ScrollDirectionLock.None : r > i ? t.ScrollDirectionLock.Horizontal : t.ScrollDirectionLock.Vertical;
}
function Qr(t, e, n, o, r) {
return n <= 0 || o <= 0 ? [ 0, -1 ] : [ Math.max(0, Math.floor(-t / n) - r), Math.min(o - 1, Math.ceil((-t + e) / n) + r) ];
}
function Jr(t, e) {
return t * e;
}
t.ScrollPhase = void 0, (Lr = t.ScrollPhase || (t.ScrollPhase = {}))[Lr.Idle = 0] = "Idle", 
Lr[Lr.Dragging = 1] = "Dragging", Lr[Lr.Decelerating = 2] = "Decelerating", Lr[Lr.Animating = 3] = "Animating", 
t.ScrollDirectionLock = void 0, (Gr = t.ScrollDirectionLock || (t.ScrollDirectionLock = {}))[Gr.None = 0] = "None", 
Gr[Gr.Horizontal = 1] = "Horizontal", Gr[Gr.Vertical = 2] = "Vertical";
var Kr, Zr = function() {
function e(e) {
this.horizontal = !1, this.vertical = !0, this.inertia = !0, this.elastic = !0, 
this.brake = .75, this.bounceDuration = .23, this.initialContentX = 0, this.initialContentY = 0, 
this._itemCount = 0, this._itemHeight = 100, this._bufferSize = 2, this._offsetX = 0, 
this._offsetY = 0, this._velocityX = 0, this._velocityY = 0, this._phase = t.ScrollPhase.Idle, 
this._visibleStart = -1, this._visibleEnd = -1, this._lastTouchX = 0, this._lastTouchY = 0, 
this._totalDragX = 0, this._totalDragY = 0, this._directionLock = t.ScrollDirectionLock.None, 
this._slopExceeded = !1, this._lastPhase = t.ScrollPhase.Idle, this._velIndex = 0, 
this._velCount = 0, this._animStartOffset = 0, this._animTargetOffset = 0, this._animDuration = .3, 
this._animElapsed = 0, this._cachedSize = {
width: 0,
height: 0
}, this._cachedPos = {
x: 0,
y: 0
}, this._cachedDelta = {
dx: 0,
dy: 0
}, this._cachedBoundsX = {
min: 0,
max: 0
}, this._cachedBoundsY = {
min: 0,
max: 0
}, this._host = e, this._velSamples = [];
for (var n = 0; n < 5; n++) this._velSamples[n] = {
dx: 0,
dy: 0,
dt: 0
};
}
return Object.defineProperty(e.prototype, "itemCount", {
get: function() {
return this._itemCount;
},
set: function(t) {
this._itemCount = t, this._invalidateVisible();
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "itemHeight", {
get: function() {
return this._itemHeight;
},
set: function(t) {
this._itemHeight = t, this._invalidateVisible();
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "bufferSize", {
get: function() {
return this._bufferSize;
},
set: function(t) {
this._bufferSize = t, this._invalidateVisible();
},
enumerable: !1,
configurable: !0
}), e.prototype._invalidateVisible = function() {
this._visibleStart = -1, this._visibleEnd = -1;
}, Object.defineProperty(e.prototype, "offsetX", {
get: function() {
return this._offsetX;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "offsetY", {
get: function() {
return this._offsetY;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "velocityX", {
get: function() {
return this._velocityX;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "velocityY", {
get: function() {
return this._velocityY;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "phase", {
get: function() {
return this._phase;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "isVirtualMode", {
get: function() {
return this.itemCount > 0;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "visibleStart", {
get: function() {
return this._visibleStart;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "visibleEnd", {
get: function() {
return this._visibleEnd;
},
enumerable: !1,
configurable: !0
}), e.prototype.invalidateVisibleRange = function() {
this._invalidateVisible();
}, e.prototype.resetScrollState = function() {
this._offsetX = 0, this._offsetY = 0, this._velocityX = 0, this._velocityY = 0, 
this._phase = t.ScrollPhase.Idle;
}, e.prototype.syncOffsetFromContentPosition = function(t, e) {
this._offsetX = t - this.initialContentX, this._offsetY = this.initialContentY - e, 
this._velocityX = 0, this._velocityY = 0;
}, e.prototype.getContentSize = function() {
var t = this._cachedSize;
if (this.isVirtualMode) {
var e = Jr(this.itemCount, this.itemHeight);
this.horizontal ? (t.width = e, t.height = this._host.getViewportHeight()) : (t.width = this._host.getViewportWidth(), 
t.height = e);
} else {
var n = this._host.getNonVirtualContentSize();
t.width = n.width, t.height = n.height;
}
return t;
}, e.prototype.getContentPosition = function() {
var t = this._cachedPos;
return t.x = this.initialContentX + this._offsetX, t.y = this.initialContentY - this._offsetY, 
t;
}, e.prototype._computeBoundsX = function() {
var t = this.getContentSize(), e = this.initialContentX - this._host.getContentTopBaseX();
return Ur(this._host.getViewportWidth(), t.width, e, this._cachedBoundsX);
}, e.prototype._computeBoundsY = function() {
var t = this.getContentSize(), e = this.initialContentY - this._host.getContentTopBaseY();
return Ur(this._host.getViewportHeight(), t.height, e, this._cachedBoundsY);
}, e.prototype.onDragStart = function(e, n) {
this._phase = t.ScrollPhase.Dragging, this._velocityX = 0, this._velocityY = 0, 
this._lastTouchX = e, this._lastTouchY = n, this._totalDragX = 0, this._totalDragY = 0, 
this._directionLock = t.ScrollDirectionLock.None, this._slopExceeded = !1, this._velIndex = 0, 
this._velCount = 0;
}, e.prototype.onDragMove = function(e, n, o) {
var r = e - this._lastTouchX, i = -(n - this._lastTouchY);
if (this._totalDragX += r, this._totalDragY += i, !this._slopExceeded) {
if (Math.abs(this._totalDragX) + Math.abs(this._totalDragY) < 7) {
this._lastTouchX = e, this._lastTouchY = n;
var a = this._cachedDelta;
return a.dx = 0, a.dy = 0, a;
}
this._slopExceeded = !0;
}
this._directionLock === t.ScrollDirectionLock.None && (this._directionLock = Xr(this._totalDragX, this._totalDragY, 5)), 
this._directionLock === t.ScrollDirectionLock.Horizontal && (i = 0), this._directionLock === t.ScrollDirectionLock.Vertical && (r = 0), 
this.horizontal || (r = 0), this.vertical || (i = 0);
var s = this._computeBoundsX(), l = this._computeBoundsY();
if (this.elastic ? (r = qr(this._offsetX, r, s, .5), i = qr(this._offsetY, i, l, .5)) : (r = Hr(this._offsetX + r, s) - this._offsetX, 
i = Hr(this._offsetY + i, l) - this._offsetY), this._offsetX += r, this._offsetY += i, 
this.inertia) {
var u = this._velSamples[this._velIndex];
u.dx = r, u.dy = i, u.dt = o, this._velIndex = (this._velIndex + 1) % 5, this._velCount < 5 && this._velCount++;
}
this._lastTouchX = e, this._lastTouchY = n;
var c = this._cachedDelta;
return c.dx = r, c.dy = i, c;
}, e.prototype.onDragEnd = function() {
this._computeAverageVelocity();
var e = jr(this._offsetX, this._computeBoundsX()), n = jr(this._offsetY, this._computeBoundsY()), o = Math.abs(this._velocityX) > .5 || Math.abs(this._velocityY) > .5;
return (e || n) && this.elastic || o && this.inertia ? this._phase = t.ScrollPhase.Decelerating : this._phase = t.ScrollPhase.Idle, 
this._phase;
}, e.prototype.onFrameUpdate = function(e) {
e = Math.min(e, .1), this._phase === t.ScrollPhase.Decelerating ? this._updatePhysics(e) : this._phase === t.ScrollPhase.Animating && this._updateAnimation(e);
var n = this._lastPhase !== t.ScrollPhase.Idle && this._phase === t.ScrollPhase.Idle;
return this._lastPhase = this._phase, n;
}, e.prototype.scrollToIndex = function(e, n) {
if (this.isVirtualMode) {
var o = Hr(-e * this.itemHeight, this.horizontal ? this._computeBoundsX() : this._computeBoundsY());
n ? (this._animStartOffset = this.horizontal ? this._offsetX : this._offsetY, this._animTargetOffset = o, 
this._animElapsed = 0, this._phase = t.ScrollPhase.Animating, this._velocityX = 0, 
this._velocityY = 0) : this.horizontal ? (this._offsetX = o, this._velocityX = 0) : (this._offsetY = o, 
this._velocityY = 0);
}
}, e.prototype.computeNewVisibleRange = function() {
if (!this.isVirtualMode) return null;
var t = this.horizontal ? this._host.getViewportWidth() : this._host.getViewportHeight(), e = h(Qr(this.horizontal ? this._offsetX : this._offsetY, t, this.itemHeight, this.itemCount, this.bufferSize), 2), n = e[0], o = e[1];
return n === this._visibleStart && o === this._visibleEnd ? null : (this._visibleStart = n, 
this._visibleEnd = o, [ n, o ]);
}, e.prototype.reset = function() {
this._offsetX = 0, this._offsetY = 0, this._velocityX = 0, this._velocityY = 0, 
this._phase = t.ScrollPhase.Idle, this._lastPhase = t.ScrollPhase.Idle, this._directionLock = t.ScrollDirectionLock.None, 
this._slopExceeded = !1, this._totalDragX = 0, this._totalDragY = 0, this._velIndex = 0, 
this._velCount = 0, this._visibleStart = -1, this._visibleEnd = -1, this.horizontal = !1, 
this.vertical = !0, this.inertia = !0, this.elastic = !0, this.brake = .75, this.bounceDuration = .23, 
this.initialContentX = 0, this.initialContentY = 0, this._itemCount = 0, this._itemHeight = 100, 
this._bufferSize = 2;
}, e.prototype._updatePhysics = function(e) {
var n = this._computeBoundsX(), o = this._computeBoundsY(), r = 2 + 13 * this.brake, i = 15 / (this.bounceDuration * this.bounceDuration), a = !0, s = !0;
if (this.horizontal) {
var l = h(Yr(this._offsetX, this._velocityX, n, e, r, i, .5), 3), u = l[0], c = l[1], d = l[2];
this._offsetX = u, this._velocityX = c, a = d;
}
if (this.vertical) {
var p = h(Yr(this._offsetY, this._velocityY, o, e, r, i, .5), 3);
u = p[0], c = p[1], d = p[2], this._offsetY = u, this._velocityY = c, s = d;
}
a && s && (this._phase = t.ScrollPhase.Idle);
}, e.prototype._updateAnimation = function(e) {
this._animElapsed += e;
var n = Math.min(this._animElapsed / this._animDuration, 1), o = 1 - Math.pow(1 - n, 3), r = this._animStartOffset + (this._animTargetOffset - this._animStartOffset) * o;
this.horizontal ? this._offsetX = r : this._offsetY = r, n >= 1 && (this._phase = t.ScrollPhase.Idle);
}, e.prototype._computeAverageVelocity = function() {
if (0 !== this._velCount) {
for (var t = 0, e = 0, n = 0, o = 0; o < this._velCount; o++) {
var r = this._velSamples[o];
t += r.dx, e += r.dy, n += r.dt;
}
n > 0 && (this._velocityX = t / n, this._velocityY = e / n), this._velIndex = 0, 
this._velCount = 0;
}
}, e;
}(), $r = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._contentNode = null, n._contentName = "", n._scheduled = !1, n._boundUpdate = function(t) {
return n.update(t);
}, n._cachedHostSize = {
width: 0,
height: 0
}, n._contentBindRetries = 0, n._contentBindScheduled = !1, n._boundTryBindContent = function() {
return n._tryBindContent();
}, n._onScrollBegan = null, n._onScrollEnded = null, n._onScrolling = null, n._scrollBeganEmitted = !1, 
n._dispatchingCancel = !1, n._savedContentState = null, n._onItemRender = null, 
n._itemPool = [], n._activeItems = new Map(), n._nodeFactory = function(t) {
return n.universe.render.createRenderNode(t);
}, n._cachedScrollData = {
contentX: 0,
contentY: 0,
eid: 0,
eventType: "",
worldId: ""
}, n._driver = new Zr(n), n._bindTouchEvents(), n;
}
return n(o, e), o.prototype.getViewportWidth = function() {
return this.nativeNode.width;
}, o.prototype.getViewportHeight = function() {
return this.nativeNode.height;
}, o.prototype.getContentTopBaseY = function() {
var t = (1 - this.nativeNode.anchorY) * this.nativeNode.height, e = this._contentNode;
return e ? t - (1 - e.anchorY) * e.height : t;
}, o.prototype.getContentTopBaseX = function() {
var t = -this.nativeNode.anchorX * this.nativeNode.width, e = this._contentNode;
return e ? t + e.anchorX * e.width : t;
}, o.prototype.getNonVirtualContentSize = function() {
var t = this._cachedHostSize;
return this._contentNode ? (t.width = this._contentNode.width, t.height = this._contentNode.height) : (t.width = 0, 
t.height = 0), t;
}, o.prototype._bindTouchEvents = function() {
var t = this.nativeNode;
t.on(cc.Node.EventType.TOUCH_START, this._onTouchStart, this, !0), t.on(cc.Node.EventType.TOUCH_MOVE, this._onTouchMove, this, !0), 
t.on(cc.Node.EventType.TOUCH_END, this._onTouchEnd, this, !0), t.on(cc.Node.EventType.TOUCH_CANCEL, this._onTouchEnd, this, !0), 
t.on(cc.Node.EventType.SIZE_CHANGED, this._onViewportSizeChanged, this);
}, o.prototype._onViewportSizeChanged = function() {
this.eid && this._contentNode && this._driver.isVirtualMode && this._onItemRender && (this._driver.invalidateVisibleRange(), 
this._syncContentPosition());
}, o.prototype._onTouchStart = function(t) {
if (!this._dispatchingCancel && this.eid && (this._isReady() || (this._findContentNode(), 
this._isReady()))) {
var e = t.getLocation();
this._driver.onDragStart(e.x, e.y), this._scrollBeganEmitted = !1, this._ensureScheduled();
}
}, o.prototype._onTouchMove = function(e) {
if (!this._dispatchingCancel && this._driver.phase === t.ScrollPhase.Dragging && this._isReady()) {
var n = e.getLocation(), o = cc.director.getDeltaTime() || 1 / 60, r = this._driver.onDragMove(n.x, n.y, o), i = r.dx, a = r.dy, s = 0 !== i || 0 !== a;
s && !this._scrollBeganEmitted && (this._scrollBeganEmitted = !0, this._emitScrollEvent("scroll-began", this._onScrollBegan), 
this._cancelChildTouch(e)), s && (this._syncContentPosition(), this._emitScrollEvent("scrolling", this._onScrolling), 
e.stopPropagation());
}
}, o.prototype._onTouchEnd = function(e) {
this._dispatchingCancel || this._driver.phase === t.ScrollPhase.Dragging && this._isReady() && (this._driver.onDragEnd() === t.ScrollPhase.Idle ? (this._scrollBeganEmitted && (this._emitScrollEvent("scroll-ended", this._onScrollEnded), 
e.stopPropagation()), this._unschedule()) : e.stopPropagation());
}, o.prototype._cancelChildTouch = function(t) {
var e = t.target;
if (e && e !== this.nativeNode && cc.isValid(e)) {
var n = new cc.Event.EventTouch(t.getTouches(), !0);
n.type = cc.Node.EventType.TOUCH_CANCEL, n.touch = t.touch, this._dispatchingCancel = !0;
try {
e.dispatchEvent(n);
} finally {
this._dispatchingCancel = !1;
}
}
}, o.prototype._ensureScheduled = function() {
this._scheduled || (cc.director.getScheduler().schedule(this._boundUpdate, this.nativeNode, 0, cc.macro.REPEAT_FOREVER, 0, !1), 
this._scheduled = !0);
}, o.prototype._unschedule = function() {
this._scheduled && (cc.director.getScheduler().unschedule(this._boundUpdate, this.nativeNode), 
this._scheduled = !1);
}, o.prototype.update = function(e) {
if (this.eid) {
var n = this._driver.phase, o = n === t.ScrollPhase.Decelerating || n === t.ScrollPhase.Animating, r = this._driver.onFrameUpdate(e);
o && (this._syncContentPosition(), this._emitScrollEvent("scrolling", this._onScrolling)), 
r && (this._emitScrollEvent("scroll-ended", this._onScrollEnded), this._unschedule());
} else this._unschedule();
}, o.prototype._isReady = function() {
return Boolean(this._contentNode) && (!this._driver.isVirtualMode || null !== this._onItemRender);
}, o.prototype._findContentNode = function() {
var t;
if (this._contentName && !this._contentNode) for (var e = this.nativeNode.children, n = 0; n < e.length; n++) {
var o = e[n], r = o._cocosNodeRef;
if ((null !== (t = null == r ? void 0 : r.nodeName) && void 0 !== t ? t : o.name) === this._contentName) {
this._contentNode = o, this._activateContentNode();
break;
}
}
}, o.prototype._applyVirtualLayout = function() {
this._contentNode && (this._savedContentState || (this._savedContentState = {
anchorX: this._contentNode.anchorX,
anchorY: this._contentNode.anchorY,
width: this._contentNode.width,
height: this._contentNode.height
}), this._driver.horizontal ? (this._contentNode.anchorX = 0, this._contentNode.anchorY = .5) : (this._contentNode.anchorX = .5, 
this._contentNode.anchorY = 1));
}, o.prototype._restoreContentState = function() {
this._contentNode && this._savedContentState && (this._contentNode.anchorX = this._savedContentState.anchorX, 
this._contentNode.anchorY = this._savedContentState.anchorY, this._contentNode.width = this._savedContentState.width, 
this._contentNode.height = this._savedContentState.height), this._savedContentState = null;
}, o.prototype._activateContentNode = function() {
this._driver.isVirtualMode && this._applyVirtualLayout(), this._validateContentGeometry(), 
this._driver.resetScrollState(), this._syncContentPosition();
}, o.prototype._validateContentGeometry = function() {}, o.prototype._syncContentPosition = function() {
if (this._contentNode) {
var t = this._driver.getContentPosition();
if (this._contentNode.x = t.x, this._contentNode.y = t.y, this._driver.isVirtualMode) {
var e = this._driver.getContentSize();
this._contentNode.width = e.width, this._contentNode.height = e.height, this._onItemRender && this._updateVisibleItems();
}
}
}, o.prototype._emitScrollEvent = function(t, e) {
var n = this._cachedScrollData;
if (this._contentNode) n.contentX = this._contentNode.x, n.contentY = this._contentNode.y; else {
var o = this._driver.getContentPosition();
n.contentX = o.x, n.contentY = o.y;
}
n.eid = this.eid, n.eventType = t, n.worldId = this.worldId, this.universe.handleScrollEvent(n), 
e && e(n);
}, o.prototype._updateVisibleItems = function() {
var t, e;
if (this._contentNode) {
var n = this._driver.computeNewVisibleRange();
if (n) {
var o = h(n, 2), r = o[0], i = o[1];
try {
for (var a = d(this._activeItems), s = a.next(); !s.done; s = a.next()) {
var l = h(s.value, 2), u = l[0], c = l[1];
(u < r || u > i) && (c.active = !1, this._itemPool.push(c), this._activeItems.delete(u));
}
} catch (e) {
t = {
error: e
};
} finally {
try {
s && !s.done && (e = a.return) && e.call(a);
} finally {
if (t) throw t.error;
}
}
for (var p = r; p <= i; p++) this._activeItems.has(p) || this._createOrReuseItem(p);
}
} else this._driver.itemCount;
}, o.prototype._createOrReuseItem = function(t) {
var e = this._itemPool.pop();
e || ((e = new cc.Node("item_".concat(t))).anchorX = .5, e.anchorY = 1, this._contentNode.addChild(e)), 
e.active = !0, e.name = "item_".concat(t);
var n = this._driver;
if (e.width = n.horizontal ? n.itemHeight : this.nativeNode.width, e.height = n.horizontal ? this.nativeNode.height : n.itemHeight, 
n.horizontal ? (e.x = t * n.itemHeight, e.y = 0) : (e.x = 0, e.y = -t * n.itemHeight), 
this._activeItems.set(t, e), this._onItemRender) {
var o = this._onItemRender(t, this.eid);
if (!o) return;
if (e.children.length > 0) this._updateContentTree(e.children[0], o, this.eid); else {
var r = Vr(o, this._nodeFactory, this.eid, this.worldId);
e.addChild(r.nativeNode);
}
}
}, o.prototype._updateContentTree = function(t, e, n, o) {
var r, i, a = t._cocosNodeRef;
if (a) if (o) try {
for (var s = d(o), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
this._applyDirtyField(a, e.props, Or(e.type), u, n);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
l && !l.done && (i = s.return) && i.call(s);
} finally {
if (r) throw r.error;
}
} else kr(a, e.props, Or(e.type), Br, n);
if (e.children) for (var c = t.children, h = 0; h < e.children.length && h < c.length; h++) this._updateContentTree(c[h], e.children[h], n, o);
}, o.prototype._applyDirtyField = function(t, e, n, o, r) {
var i = o.split(".");
if (!Br.has(i[0])) {
for (var a = e, s = n, l = 0; l < i.length - 1; l++) {
var u = i[l], c = a[u], d = s[u];
if (!c || "object" != typeof c || !d || "object" != typeof d) return;
a = c, s = d;
}
var h = i[i.length - 1];
if (h in a) {
var p = s[h];
if (p) {
var f = a[h];
if ("function" == typeof p) {
var m = f;
Array.isArray(f) && f.length >= 1 && "function" == typeof f[0] && (m = f[0](r)), 
p(t, m);
} else "object" == typeof p && "object" == typeof f && null !== f && kr(t, f, p, void 0, r);
}
}
}
}, o.prototype._disposeChildRenderNodes = function(t) {
for (var e = t.children, n = 0; n < e.length; n++) this._disposeRenderNodeTree(e[n]);
}, o.prototype._disposeRenderNodeTree = function(t) {
for (var e = t.children, n = 0; n < e.length; n++) this._disposeRenderNodeTree(e[n]);
var o = t._cocosNodeRef;
o && (o.disposeRender(), t._cocosNodeRef = void 0);
}, o.prototype.applyWorldTimeScale = function(t) {
var e, n;
try {
for (var o = d(this._activeItems.values()), r = o.next(); !r.done; r = o.next()) {
var i = r.value;
this._applyWorldTimeScaleToTree(i, t);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
for (var a = 0; a < this._itemPool.length; a++) this._applyWorldTimeScaleToTree(this._itemPool[a], t);
}, o.prototype._applyWorldTimeScaleToTree = function(t, e) {
var n = t._cocosNodeRef;
n && n.applyWorldTimeScale(e);
for (var o = t.children, r = 0; r < o.length; r++) this._applyWorldTimeScaleToTree(o[r], e);
}, o.prototype._cleanupContainerChildren = function(t) {
this._disposeChildRenderNodes(t);
for (var e = t.children, n = e.length - 1; n >= 0; n--) {
var o = e[n];
o.removeFromParent(), cc.isValid(o) && o.destroy();
}
}, o.prototype._clearVirtualItems = function() {
var t, e, n, o;
try {
for (var r = d(this._activeItems.values()), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
this._cleanupContainerChildren(a), a.removeFromParent(), cc.isValid(a) && a.destroy();
}
} catch (e) {
t = {
error: e
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (t) throw t.error;
}
}
try {
for (var s = d(this._itemPool), l = s.next(); !l.done; l = s.next()) a = l.value, 
this._cleanupContainerChildren(a), a.removeFromParent(), cc.isValid(a) && a.destroy();
} catch (t) {
n = {
error: t
};
} finally {
try {
l && !l.done && (o = s.return) && o.call(s);
} finally {
if (n) throw n.error;
}
}
this._activeItems.clear(), this._itemPool = [], this._driver.invalidateVisibleRange();
}, o.prototype.setScrollViewHorizontal = function(t) {
var e = this._driver.horizontal;
this._driver.horizontal = t, t !== e && this._contentNode && (this._driver.syncOffsetFromContentPosition(this._contentNode.x, this._contentNode.y), 
this._driver.isVirtualMode && (this._clearVirtualItems(), this._applyVirtualLayout()), 
this._syncContentPosition());
}, o.prototype.setScrollViewVertical = function(t) {
var e = this._driver.vertical;
this._driver.vertical = t, t !== e && this._contentNode && (this._driver.syncOffsetFromContentPosition(this._contentNode.x, this._contentNode.y), 
this._driver.isVirtualMode && (this._clearVirtualItems(), this._applyVirtualLayout()), 
this._syncContentPosition());
}, o.prototype.setScrollViewInertia = function(t) {
this._driver.inertia = t;
}, o.prototype.setScrollViewElastic = function(t) {
this._driver.elastic = t;
}, o.prototype.setScrollViewBounceDuration = function(t) {
this._driver.bounceDuration = t;
}, o.prototype.setScrollViewBrake = function(t) {
this._driver.brake = t;
}, o.prototype.setScrollViewContentName = function(t) {
t === this._contentName && this._contentNode || (this._cancelContentBind(), this._contentName = t, 
this._clearVirtualItems(), this._restoreContentState(), this._contentNode = null, 
this._tryBindContent());
}, o.prototype._tryBindContent = function() {
this._contentBindScheduled = !1, this._contentName && !this._contentNode && cc.isValid(this.nativeNode) && (this._findContentNode(), 
this._contentNode ? this._contentBindRetries = 0 : (this._contentBindRetries++, 
this._contentBindScheduled = !0, cc.director.once(cc.Director.EVENT_AFTER_UPDATE, this._boundTryBindContent)));
}, o.prototype._cancelContentBind = function() {
this._contentBindScheduled && (cc.director.off(cc.Director.EVENT_AFTER_UPDATE, this._boundTryBindContent), 
this._contentBindScheduled = !1), this._contentBindRetries = 0;
}, o.prototype.setScrollViewContentX = function(t) {
this._driver.initialContentX = t, this._driver.isVirtualMode && this._onItemRender ? this._syncContentPosition() : this._contentNode && (this._driver.resetScrollState(), 
this._contentNode.x = t);
}, o.prototype.setScrollViewContentY = function(t) {
this._driver.initialContentY = t, this._driver.isVirtualMode && this._onItemRender ? this._syncContentPosition() : this._contentNode && (this._driver.resetScrollState(), 
this._contentNode.y = t);
}, o.prototype.setOnScrollBegan = function(t) {
this._onScrollBegan = t;
}, o.prototype.setOnScrollEnded = function(t) {
this._onScrollEnded = t;
}, o.prototype.setOnScrolling = function(t) {
this._onScrolling = t;
}, o.prototype.rebuildScrollViewContent = function(t) {
if (t && t.nativeNode) {
var e = t.nativeNode;
e !== this._contentNode && this._restoreContentState(), this._contentNode = e, this._activateContentNode();
}
}, o.prototype.setItemCount = function(t) {
var e = this._driver.isVirtualMode;
this._driver.itemCount = t;
var n = this._driver.isVirtualMode;
e && !n ? (this._clearVirtualItems(), this._restoreContentState(), this._activateContentNode()) : !e && n && (this._applyVirtualLayout(), 
this._syncContentPosition()), n && this._onItemRender && this._updateVisibleItems();
}, o.prototype.setItemHeight = function(t) {
this._driver.itemHeight = t, this._driver.isVirtualMode && this._onItemRender && this._updateVisibleItems();
}, o.prototype.setBufferSize = function(t) {
this._driver.bufferSize = t, this._driver.isVirtualMode && this._onItemRender && this._updateVisibleItems();
}, o.prototype.setOnItemRender = function(t) {
this._onItemRender = t, this._driver.isVirtualMode && this._onItemRender && this._updateVisibleItems();
}, o.prototype.scrollToIndex = function(t, e) {
void 0 === e && (e = !1), this._driver.isVirtualMode && this._onItemRender && (this._driver.scrollToIndex(t, e), 
e ? this._ensureScheduled() : this._syncContentPosition());
}, o.prototype.setScrollCtrl = function(e) {
Array.isArray(e) ? e.length > 0 && this._refreshActiveItems(new Set(e)) : e === t.ScrollControl.Refresh && this._refreshActiveItems();
}, o.prototype._refreshActiveItems = function(t) {
var e, n;
if (this._onItemRender) try {
for (var o = d(this._activeItems), r = o.next(); !r.done; r = o.next()) {
var i = h(r.value, 2), a = i[0], s = i[1], l = this._onItemRender(a, this.eid);
l && s.children.length > 0 && this._updateContentTree(s.children[0], l, this.eid, t);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, o.prototype.disposeRender = function() {
this._unschedule(), this._cancelContentBind(), this._driver.phase !== t.ScrollPhase.Idle && this._scrollBeganEmitted && this._emitScrollEvent("scroll-ended", this._onScrollEnded), 
this._clearVirtualItems(), this._restoreContentState(), this._contentNode = null, 
this._contentName = "", this._onItemRender = null, this._onScrollBegan = null, this._onScrollEnded = null, 
this._onScrolling = null, this._scrollBeganEmitted = !1, this._dispatchingCancel = !1, 
this._driver.reset(), e.prototype.disposeRender.call(this);
}, o.prototype.destroyNative = function() {
this._unschedule(), this._cancelContentBind(), this.nativeNode.off(cc.Node.EventType.TOUCH_START, this._onTouchStart, this, !0), 
this.nativeNode.off(cc.Node.EventType.TOUCH_MOVE, this._onTouchMove, this, !0), 
this.nativeNode.off(cc.Node.EventType.TOUCH_END, this._onTouchEnd, this, !0), this.nativeNode.off(cc.Node.EventType.TOUCH_CANCEL, this._onTouchEnd, this, !0), 
this.nativeNode.off(cc.Node.EventType.SIZE_CHANGED, this._onViewportSizeChanged, this), 
this._contentNode = null, this._onScrollBegan = null, this._onScrollEnded = null, 
this._onScrolling = null, this._activeItems.clear(), this._itemPool = [], e.prototype.destroyNative.call(this);
}, o;
}(bo), ti = function(e) {
function o(n) {
var o = e.call(this, n) || this;
return o._projection = t.ProjectionType.Orthographic, o._fov = 60, o._orthoHeight = 10, 
o._near = .1, o._far = 1e3, o._viewportRect = new cc.Rect(0, 0, 1, 1), o.nativeRenderer = o.nativeNode.getComponent(cc.Camera) || o.nativeNode.addComponent(cc.Camera), 
o.setCameraDepth(0), o.setCullingMask(t.CameraLayer.Everything), o.setProjection(t.ProjectionType.Orthographic), 
o.setOrthoHeight(o._orthoHeight), o.setNear(o._near), o.setFar(o._far), o.setClearFlags(t.CameraClearFlags.All), 
o;
}
return n(o, e), o.prototype.setCameraDepth = function(t) {
this.nativeRenderer.depth = t;
}, o.prototype.setViewportX = function(t) {
this._viewportRect.x = t, this.nativeRenderer.rect = this._viewportRect;
}, o.prototype.setViewportY = function(t) {
this._viewportRect.y = t, this.nativeRenderer.rect = this._viewportRect;
}, o.prototype.setViewportWidth = function(t) {
this._viewportRect.width = t, this.nativeRenderer.rect = this._viewportRect;
}, o.prototype.setViewportHeight = function(t) {
this._viewportRect.height = t, this.nativeRenderer.rect = this._viewportRect;
}, o.prototype.setCullingMask = function(t) {
this.nativeRenderer.cullingMask = this.universe.layerMapping.toPhysicalMask(t);
}, o.prototype.setProjection = function(e) {
this._projection = e, this.nativeRenderer.ortho = e === t.ProjectionType.Orthographic, 
this._updateProjection();
}, o.prototype.setFov = function(e) {
this._fov = e, this._projection === t.ProjectionType.Perspective && (this.nativeRenderer.fov = e);
}, o.prototype.setOrthoHeight = function(e) {
this._orthoHeight = e, this._projection === t.ProjectionType.Orthographic && (this.nativeRenderer.orthoSize = e / 2);
}, o.prototype.setNear = function(t) {
this._near = t;
}, o.prototype.setFar = function(t) {
this._far = t;
}, o.prototype.setCameraRgb = function(t) {
this.setRgbColor(t, To.color), To.color.a = this.nativeRenderer.backgroundColor.a, 
this.nativeRenderer.backgroundColor = To.color;
}, o.prototype.setCameraAlpha = function(t) {
To.color.set(this.nativeRenderer.backgroundColor), To.color.a = this.opacityToAlpha(t), 
this.nativeRenderer.backgroundColor = To.color;
}, o.prototype.setClearFlags = function(e) {
var n = 0;
e & t.CameraClearFlags.Color && (n |= cc.Camera.ClearFlags.COLOR), e & t.CameraClearFlags.Depth && (n |= cc.Camera.ClearFlags.DEPTH), 
e & t.CameraClearFlags.Stencil && (n |= cc.Camera.ClearFlags.STENCIL), this.nativeRenderer.clearFlags = n;
}, o.prototype.setZoomRatio = function(t) {
this.nativeRenderer.zoomRatio = t;
}, o.prototype.setAlignWithScreen = function(t) {
this.nativeRenderer.alignWithScreen = t;
}, o.prototype.setRenderStages = function(t) {
this.nativeRenderer.renderStages = t;
}, o.prototype.destroyNative = function() {
this.nativeRenderer && cc.isValid(this.nativeNode) && (this.nativeRenderer.enabled = !1), 
e.prototype.destroyNative.call(this);
}, o.prototype._updateProjection = function() {
this._projection === t.ProjectionType.Perspective ? this.nativeRenderer.fov = this._fov : this.nativeRenderer.orthoSize = this._orthoHeight / 2;
}, o;
}(bo);
t.KeyCode = void 0, (Kr = t.KeyCode || (t.KeyCode = {}))[Kr.A = 65] = "A", Kr[Kr.B = 66] = "B", 
Kr[Kr.C = 67] = "C", Kr[Kr.D = 68] = "D", Kr[Kr.E = 69] = "E", Kr[Kr.F = 70] = "F", 
Kr[Kr.G = 71] = "G", Kr[Kr.H = 72] = "H", Kr[Kr.I = 73] = "I", Kr[Kr.J = 74] = "J", 
Kr[Kr.K = 75] = "K", Kr[Kr.L = 76] = "L", Kr[Kr.M = 77] = "M", Kr[Kr.N = 78] = "N", 
Kr[Kr.O = 79] = "O", Kr[Kr.P = 80] = "P", Kr[Kr.Q = 81] = "Q", Kr[Kr.R = 82] = "R", 
Kr[Kr.S = 83] = "S", Kr[Kr.T = 84] = "T", Kr[Kr.U = 85] = "U", Kr[Kr.V = 86] = "V", 
Kr[Kr.W = 87] = "W", Kr[Kr.X = 88] = "X", Kr[Kr.Y = 89] = "Y", Kr[Kr.Z = 90] = "Z", 
Kr[Kr.Num0 = 48] = "Num0", Kr[Kr.Num1 = 49] = "Num1", Kr[Kr.Num2 = 50] = "Num2", 
Kr[Kr.Num3 = 51] = "Num3", Kr[Kr.Num4 = 52] = "Num4", Kr[Kr.Num5 = 53] = "Num5", 
Kr[Kr.Num6 = 54] = "Num6", Kr[Kr.Num7 = 55] = "Num7", Kr[Kr.Num8 = 56] = "Num8", 
Kr[Kr.Num9 = 57] = "Num9", Kr[Kr.ArrowLeft = 37] = "ArrowLeft", Kr[Kr.ArrowUp = 38] = "ArrowUp", 
Kr[Kr.ArrowRight = 39] = "ArrowRight", Kr[Kr.ArrowDown = 40] = "ArrowDown", Kr[Kr.Escape = 27] = "Escape", 
Kr[Kr.Space = 32] = "Space", Kr[Kr.Enter = 13] = "Enter", Kr[Kr.Tab = 9] = "Tab", 
Kr[Kr.Backspace = 8] = "Backspace", Kr[Kr.Delete = 46] = "Delete", Kr[Kr.Insert = 45] = "Insert", 
Kr[Kr.PrintScreen = 44] = "PrintScreen", Kr[Kr.ScrollLock = 145] = "ScrollLock", 
Kr[Kr.Pause = 19] = "Pause", Kr[Kr.ContextMenu = 93] = "ContextMenu", Kr[Kr.Shift = 16] = "Shift", 
Kr[Kr.Ctrl = 17] = "Ctrl", Kr[Kr.Alt = 18] = "Alt", Kr[Kr.CapsLock = 20] = "CapsLock", 
Kr[Kr.Meta = 91] = "Meta", Kr[Kr.NumLock = 144] = "NumLock", Kr[Kr.MobileBack = 6] = "MobileBack", 
Kr[Kr.Home = 36] = "Home", Kr[Kr.End = 35] = "End", Kr[Kr.PageUp = 33] = "PageUp", 
Kr[Kr.PageDown = 34] = "PageDown", Kr[Kr.F1 = 112] = "F1", Kr[Kr.F2 = 113] = "F2", 
Kr[Kr.F3 = 114] = "F3", Kr[Kr.F4 = 115] = "F4", Kr[Kr.F5 = 116] = "F5", Kr[Kr.F6 = 117] = "F6", 
Kr[Kr.F7 = 118] = "F7", Kr[Kr.F8 = 119] = "F8", Kr[Kr.F9 = 120] = "F9", Kr[Kr.F10 = 121] = "F10", 
Kr[Kr.F11 = 122] = "F11", Kr[Kr.F12 = 123] = "F12", Kr[Kr.Semicolon = 186] = "Semicolon", 
Kr[Kr.Equal = 187] = "Equal", Kr[Kr.Comma = 188] = "Comma", Kr[Kr.Minus = 189] = "Minus", 
Kr[Kr.Period = 190] = "Period", Kr[Kr.Slash = 191] = "Slash", Kr[Kr.Backquote = 192] = "Backquote", 
Kr[Kr.BracketLeft = 219] = "BracketLeft", Kr[Kr.Backslash = 220] = "Backslash", 
Kr[Kr.BracketRight = 221] = "BracketRight", Kr[Kr.Quote = 222] = "Quote", Kr[Kr.Numpad0 = 96] = "Numpad0", 
Kr[Kr.Numpad1 = 97] = "Numpad1", Kr[Kr.Numpad2 = 98] = "Numpad2", Kr[Kr.Numpad3 = 99] = "Numpad3", 
Kr[Kr.Numpad4 = 100] = "Numpad4", Kr[Kr.Numpad5 = 101] = "Numpad5", Kr[Kr.Numpad6 = 102] = "Numpad6", 
Kr[Kr.Numpad7 = 103] = "Numpad7", Kr[Kr.Numpad8 = 104] = "Numpad8", Kr[Kr.Numpad9 = 105] = "Numpad9", 
Kr[Kr.NumpadMultiply = 106] = "NumpadMultiply", Kr[Kr.NumpadAdd = 107] = "NumpadAdd", 
Kr[Kr.NumpadSubtract = 109] = "NumpadSubtract", Kr[Kr.NumpadDecimal = 110] = "NumpadDecimal", 
Kr[Kr.NumpadDivide = 111] = "NumpadDivide";
var ei, ni = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._frameName = "", n._hideUntilLoaded = !1, n._hiddenForLoad = !1, n._isLoading = !1, 
n._onPendingFrameLoaded = function() {
var t = n._pendingFrame;
n._pendingFrame = void 0, t && t.textureLoaded() && (n.nativeRenderer.spriteFrame = t);
}, n.nativeRenderer = n.nativeNode.getComponent(cc.Sprite) || n.nativeNode.addComponent(cc.Sprite), 
n;
}
return n(o, e), o.prototype.setAtlas = function(t) {
this._atlasUrl = t, this._atlas = void 0, this._updateSpriteFrame();
}, o.prototype.setFrameName = function(t) {
this._frameName = t || "", this._updateSpriteFrame();
}, o.prototype.setImage = function(t) {
this._spriteUrl = t, this._updateSpriteFrame();
}, o.prototype.setDefaultImage = function(e) {
var n = this;
this._defaultImgUrl !== e && (this._defaultImgUrl = e, this._defaultSpriteFrame = void 0, 
e && this.loadAsset("defaultImg", e, t.LoaderAssetType.SpriteFrame, function(t) {
n._defaultSpriteFrame = t, n.nativeRenderer.spriteFrame || n._applyFrame(t);
}));
}, o.prototype.setHideUntilLoaded = function(t) {
this._hideUntilLoaded = t, this._syncHideState();
}, o.prototype._setLoading = function(t) {
this._isLoading !== t && (this._isLoading = t, this._syncHideState());
}, o.prototype._syncHideState = function() {
var t = this._hideUntilLoaded && this._isLoading;
t && !this._hiddenForLoad ? (this.nativeRenderer.enabled = !1, this._hiddenForLoad = !0) : !t && this._hiddenForLoad && (this.nativeRenderer.enabled = !0, 
this._hiddenForLoad = !1);
}, o.prototype._applyFrame = function(t) {
var e;
if (t && cc.isValid(t)) {
if (this._pendingFrame && this._pendingFrame !== t && (this._pendingFrame.off("load", this._onPendingFrameLoaded, this), 
this._pendingFrame = void 0), !t.textureLoaded()) return this._pendingFrame !== t && (null === (e = this._pendingFrame) || void 0 === e || e.off("load", this._onPendingFrameLoaded, this), 
this._pendingFrame = t, t.once("load", this._onPendingFrameLoaded, this)), void t.ensureLoadTexture();
this.nativeRenderer.spriteFrame = t;
}
}, o.prototype.setWidth = function(t) {
t > 0 && (this.nativeRenderer.sizeMode = cc.Sprite.SizeMode.CUSTOM), e.prototype.setWidth.call(this, t);
}, o.prototype.setHeight = function(t) {
t > 0 && (this.nativeRenderer.sizeMode = cc.Sprite.SizeMode.CUSTOM), e.prototype.setHeight.call(this, t);
}, o.prototype._showDefault = function() {
this._defaultSpriteFrame && this._applyFrame(this._defaultSpriteFrame);
}, o.prototype.restoreTexture = function() {
var t = this.nativeRenderer.spriteFrame;
t && !t.textureLoaded() && (this.nativeRenderer.spriteFrame = null), this._updateSpriteFrame();
}, o.prototype._updateSpriteFrame = function() {
var e = this;
if (this._atlasUrl && this._frameName) {
if (!this._atlas) return this._showDefault(), this._setLoading(!0), void this._loadAtlas();
var n = this._atlas.getSpriteFrame(this._frameName);
return n ? this._applyFrame(n) : ('[CocosSpriteNode] SpriteFrame "'.concat(this._frameName, '" not found in atlas "').concat(this._atlasUrl, '"'), 
this._showDefault()), void this._setLoading(!1);
}
this._spriteUrl ? (this._showDefault(), this._setLoading(!0), this.loadAsset("image", this._spriteUrl, t.LoaderAssetType.SpriteFrame, function(t) {
e._applyFrame(t), e._setLoading(!1);
}, function() {
return e._setLoading(!1);
})) : this._setLoading(!1);
}, o.prototype._loadAtlas = function() {
var e = this;
this._atlasUrl && this.loadAsset("atlas", this._atlasUrl, t.LoaderAssetType.SpriteAtlas, function(t) {
e._atlas = t, e._updateSpriteFrame();
}, function() {
return e._setLoading(!1);
});
}, o.prototype.setRenderType = function(e) {
var n, o = ((n = {})[t.RenderType.Simple] = cc.Sprite.Type.SIMPLE, n[t.RenderType.Sliced] = cc.Sprite.Type.SLICED, 
n[t.RenderType.Tiled] = cc.Sprite.Type.TILED, n[t.RenderType.Filled] = cc.Sprite.Type.FILLED, 
n[t.RenderType.Mesh] = cc.Sprite.Type.MESH, n);
this.nativeRenderer.type = o[e];
}, o.prototype.setSizeMode = function(e) {
var n, o = ((n = {})[t.SizeMode.Custom] = cc.Sprite.SizeMode.CUSTOM, n[t.SizeMode.Trimmed] = cc.Sprite.SizeMode.TRIMMED, 
n[t.SizeMode.Raw] = cc.Sprite.SizeMode.RAW, n);
this.nativeRenderer.sizeMode = o[e];
}, o.prototype.setTrim = function(t) {
this.nativeRenderer.trim = t;
}, o.prototype.setFillType = function(e) {
var n, o = ((n = {})[t.SpriteFillType.Horizontal] = cc.Sprite.FillType.HORIZONTAL, 
n[t.SpriteFillType.Vertical] = cc.Sprite.FillType.VERTICAL, n[t.SpriteFillType.Radial] = cc.Sprite.FillType.RADIAL, 
n);
this.nativeRenderer.fillType = o[e];
}, o.prototype.setFillCenterX = function(t) {
var e = this.nativeRenderer.fillCenter;
To.v2.x = t, To.v2.y = e.y, this.nativeRenderer.fillCenter = To.v2;
}, o.prototype.setFillCenterY = function(t) {
var e = this.nativeRenderer.fillCenter;
To.v2.x = e.x, To.v2.y = t, this.nativeRenderer.fillCenter = To.v2;
}, o.prototype.setFillStart = function(t) {
this.nativeRenderer.fillStart = t;
}, o.prototype.setFillRange = function(t) {
this.nativeRenderer.fillRange = t;
}, o.prototype.setSrcBlendFactor = function(t) {
this.nativeRenderer.srcBlendFactor = ar(t);
}, o.prototype.setDstBlendFactor = function(t) {
this.nativeRenderer.dstBlendFactor = ar(t);
}, o.prototype.disposeRender = function() {
this._pendingFrame && (this._pendingFrame.off("load", this._onPendingFrameLoaded, this), 
this._pendingFrame = void 0), this.nativeRenderer.spriteFrame = null, this._atlasUrl = void 0, 
this._spriteUrl = void 0, this._frameName = "", this._atlas = void 0, this._defaultImgUrl = void 0, 
this._defaultSpriteFrame = void 0, this._hiddenForLoad && (this.nativeRenderer.enabled = !0), 
this._hideUntilLoaded = !1, this._hiddenForLoad = !1, this._isLoading = !1, e.prototype.disposeRender.call(this);
}, o;
}(bo), oi = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._textureUrl = "", n.nativeRenderer = n.nativeNode.getComponent(cc.MotionStreak) || n.nativeNode.addComponent(cc.MotionStreak), 
n;
}
return n(o, e), o.prototype.setFadeTime = function(t) {
this.nativeRenderer.fadeTime = t;
}, o.prototype.setMinSeg = function(t) {
this.nativeRenderer.minSeg = t;
}, o.prototype.setStroke = function(t) {
this.nativeRenderer.stroke = t;
}, o.prototype.setStreakColor = function(t) {
this.setRgbColor(t, To.color), this.nativeRenderer.color = To.color;
}, o.prototype.setFastMode = function(t) {
this.nativeRenderer.fastMode = t;
}, o.prototype.reset = function() {
this.nativeRenderer.reset();
}, o.prototype.setTexture = function(e) {
var n = this;
if (!e) return this.nativeRenderer.texture = null, void (this._textureUrl = "");
this._textureUrl !== e && (this._textureUrl = e, this.loadAsset("texture", e, t.LoaderAssetType.Texture, function(t) {
n._textureUrl === e && (n.nativeRenderer.texture = t);
}));
}, o.prototype.setSrcBlendFactor = function(t) {
this.nativeRenderer.srcBlendFactor = ar(t);
}, o.prototype.setDstBlendFactor = function(t) {
this.nativeRenderer.dstBlendFactor = ar(t);
}, o;
}(bo), ri = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._particleImgUrl = "", n._fileUrl = "", n.nativeRenderer = n.nativeNode.getComponent(cc.ParticleSystem) || n.nativeNode.addComponent(cc.ParticleSystem), 
n._startColor = new cc.Color(255, 255, 255, 255), n._startColorVar = new cc.Color(0, 0, 0, 0), 
n._endColor = new cc.Color(255, 255, 255, 255), n._endColorVar = new cc.Color(0, 0, 0, 0), 
n.nativeRenderer.custom = !0, n;
}
return n(o, e), o.prototype.setParticleAsset = function(e) {
var n = this;
if (!e) return this.nativeRenderer.spriteFrame = null, void (this._particleImgUrl = "");
this._particleImgUrl !== e && (this._particleImgUrl = e, this.loadAsset("particleImg", e, t.LoaderAssetType.SpriteFrame, function(t) {
n._particleImgUrl === e && (n.nativeRenderer.spriteFrame = t);
}));
}, o.prototype.setFile = function(e) {
var n = this;
if (!e) return this.nativeRenderer.file = null, void (this._fileUrl = "");
this._fileUrl !== e && (this._fileUrl = e, this.loadAsset("file", e, t.LoaderAssetType.Particle, function(t) {
n._fileUrl === e && (n.nativeRenderer.file = t);
}));
}, o.prototype.setDuration = function(t) {
this.nativeRenderer.duration = t;
}, o.prototype.setEmissionRate = function(t) {
this.nativeRenderer.emissionRate = t;
}, o.prototype.setLife = function(t) {
this.setPropWithVar("life", t);
}, o.prototype.setTotalParticles = function(t) {
this.nativeRenderer.totalParticles = t;
}, o.prototype.setStartRgb = function(t) {
this.setRgbColor(t, this._startColor), this.nativeRenderer.startColor = this._startColor;
}, o.prototype.setStartAlpha = function(t) {
this._startColor.a = this.opacityToAlpha(t), this.nativeRenderer.startColor = this._startColor;
}, o.prototype.setStartRgbVar = function(t) {
this.setRgbColor(t, this._startColorVar), this.nativeRenderer.startColorVar = this._startColorVar;
}, o.prototype.setStartAlphaVar = function(t) {
this._startColorVar.a = this.opacityToAlpha(t), this.nativeRenderer.startColorVar = this._startColorVar;
}, o.prototype.setEndRgb = function(t) {
this.setRgbColor(t, this._endColor), this.nativeRenderer.endColor = this._endColor;
}, o.prototype.setEndAlpha = function(t) {
this._endColor.a = this.opacityToAlpha(t), this.nativeRenderer.endColor = this._endColor;
}, o.prototype.setEndRgbVar = function(t) {
this.setRgbColor(t, this._endColorVar), this.nativeRenderer.endColorVar = this._endColorVar;
}, o.prototype.setEndAlphaVar = function(t) {
this._endColorVar.a = this.opacityToAlpha(t), this.nativeRenderer.endColorVar = this._endColorVar;
}, o.prototype.setParticleAngle = function(t) {
this.setPropWithVar("angle", t);
}, o.prototype.setStartSize = function(t) {
this.setPropWithVar("startSize", t);
}, o.prototype.setEndSize = function(t) {
this.setPropWithVar("endSize", t);
}, o.prototype.setStartSpin = function(t) {
this.setPropWithVar("startSpin", t);
}, o.prototype.setEndSpin = function(t) {
this.setPropWithVar("endSpin", t);
}, o.prototype.setPosVar = function(t, e) {
this.nativeRenderer.posVar = cc.v2(t, e);
}, o.prototype.setPositionType = function(e) {
var n, o, r = ((n = {})[t.ParticlePositionType.Free] = cc.ParticleSystem.PositionType.FREE, 
n[t.ParticlePositionType.Relative] = cc.ParticleSystem.PositionType.RELATIVE, n[t.ParticlePositionType.Grouped] = cc.ParticleSystem.PositionType.GROUPED, 
n);
this.nativeRenderer.positionType = null !== (o = r[e]) && void 0 !== o ? o : cc.ParticleSystem.PositionType.FREE;
}, o.prototype.setEmitterMode = function(e) {
var n, o, r = ((n = {})[t.ParticleEmitterMode.Gravity] = cc.ParticleSystem.EmitterMode.GRAVITY, 
n[t.ParticleEmitterMode.Radius] = cc.ParticleSystem.EmitterMode.RADIUS, n);
this.nativeRenderer.emitterMode = null !== (o = r[e]) && void 0 !== o ? o : cc.ParticleSystem.EmitterMode.GRAVITY;
}, o.prototype.setGravity = function(t, e) {
this.nativeRenderer.gravity = cc.v2(t, e);
}, o.prototype.setSpeed = function(t) {
this.setPropWithVar("speed", t);
}, o.prototype.setTangentialAccel = function(t) {
this.setPropWithVar("tangentialAccel", t);
}, o.prototype.setRadialAccel = function(t) {
this.setPropWithVar("radialAccel", t);
}, o.prototype.setRotationIsDir = function(t) {
this.nativeRenderer.rotationIsDir = t;
}, o.prototype.setStartRadius = function(t) {
this.setPropWithVar("startRadius", t);
}, o.prototype.setEndRadius = function(t) {
this.setPropWithVar("endRadius", t);
}, o.prototype.setRotatePerS = function(t) {
this.setPropWithVar("rotatePerS", t);
}, o.prototype.setSrcBlendFactor = function(t) {
this.nativeRenderer.srcBlendFactor = ar(t);
}, o.prototype.setDstBlendFactor = function(t) {
this.nativeRenderer.dstBlendFactor = ar(t);
}, o.prototype.setParticleCtrl = function(e) {
e === t.ParticleControl.Stop ? this.nativeRenderer.stopSystem() : e === t.ParticleControl.Reset && this.nativeRenderer.resetSystem();
}, o.prototype.setPropWithVar = function(t, e) {
Array.isArray(e) ? (this.nativeRenderer[t] = e[0], this.nativeRenderer[t + "Var"] = e[1]) : (this.nativeRenderer[t] = e, 
this.nativeRenderer[t + "Var"] = 0);
}, o;
}(bo), ii = function(e) {
function o(n) {
var o = e.call(this, n) || this;
o.backgroundNode = new cc.Node("BACKGROUND_SPRITE"), o.textLabelNode = new cc.Node("TEXT_LABEL"), 
o.placeholderLabelNode = new cc.Node("PLACEHOLDER_LABEL"), o.backgroundSprite = o.backgroundNode.addComponent(cc.Sprite);
var r = new Uint8Array(new Array(16).fill(255)), i = new cc.Texture2D();
i.initWithData(r, cc.Texture2D.PixelFormat.RGBA8888, 2, 2);
var a = new cc.SpriteFrame();
return a.setTexture(i), o.backgroundSprite.spriteFrame = a, o.backgroundNode.color = cc.Color.GRAY, 
o.textLabel = o.textLabelNode.addComponent(cc.Label), o.textLabel.overflow = cc.Label.Overflow.CLAMP, 
o.textLabel.enableWrapText = !1, o.placeholderLabel = o.placeholderLabelNode.addComponent(cc.Label), 
o.placeholderLabel.overflow = cc.Label.Overflow.CLAMP, o.placeholderLabel.enableWrapText = !1, 
o.addFullWidget(o.backgroundNode), o.addFullWidget(o.textLabelNode), o.addFullWidget(o.placeholderLabelNode), 
o.nativeNode.addChild(o.backgroundNode), o.nativeNode.addChild(o.textLabelNode), 
o.nativeNode.addChild(o.placeholderLabelNode), o.nativeRenderer = o.nativeNode.addComponent(cc.EditBox), 
o.nativeRenderer.background = o.backgroundSprite, o.nativeRenderer.textLabel = o.textLabel, 
o.nativeRenderer.placeholderLabel = o.placeholderLabel, o.setInputMode(t.EditBoxInputMode.SINGLE_LINE), 
o;
}
return n(o, e), o.prototype.addFullWidget = function(t) {
var e = t.addComponent(cc.Widget);
e.isAlignTop = !0, e.isAlignBottom = !0, e.isAlignLeft = !0, e.isAlignRight = !0, 
e.top = 0, e.bottom = 0, e.left = 0, e.right = 0, e.alignMode = cc.Widget.AlignMode.ALWAYS;
}, o.prototype.setText = function(t) {
this.nativeRenderer.string = t;
}, o.prototype.setBackgroundImage = function(e) {
var n = this;
this.loadAsset("editbox_bg", e, t.LoaderAssetType.SpriteFrame, function(t) {
t && (n.backgroundSprite.spriteFrame = t, n.nativeRenderer.backgroundImage = t);
});
}, o.prototype.setReturnType = function(e) {
var n, o = ((n = {})[t.EditBoxReturnType.DEFAULT] = cc.EditBox.KeyboardReturnType.DEFAULT, 
n[t.EditBoxReturnType.DONE] = cc.EditBox.KeyboardReturnType.DONE, n[t.EditBoxReturnType.SEND] = cc.EditBox.KeyboardReturnType.SEND, 
n[t.EditBoxReturnType.SEARCH] = cc.EditBox.KeyboardReturnType.SEARCH, n[t.EditBoxReturnType.GO] = cc.EditBox.KeyboardReturnType.GO, 
n);
this.nativeRenderer.returnType = o[e];
}, o.prototype.setInputFlag = function(e) {
var n, o = ((n = {})[t.EditBoxInputFlag.PASSWORD] = cc.EditBox.InputFlag.PASSWORD, 
n[t.EditBoxInputFlag.SENSITIVE] = cc.EditBox.InputFlag.SENSITIVE, n[t.EditBoxInputFlag.INITIAL_CAPS_WORD] = cc.EditBox.InputFlag.INITIAL_CAPS_WORD, 
n[t.EditBoxInputFlag.INITIAL_CAPS_SENTENCE] = cc.EditBox.InputFlag.INITIAL_CAPS_SENTENCE, 
n[t.EditBoxInputFlag.INITIAL_CAPS_ALL_CHARACTERS] = cc.EditBox.InputFlag.INITIAL_CAPS_ALL_CHARACTERS, 
n[t.EditBoxInputFlag.LOWERCASE_ALL_CHARACTERS] = cc.EditBox.InputFlag.INITIAL_CAPS_ALL_CHARACTERS, 
n);
this.nativeRenderer.inputFlag = o[e];
}, o.prototype.setInputMode = function(e) {
var n, o = ((n = {})[t.EditBoxInputMode.ANY] = cc.EditBox.InputMode.ANY, n[t.EditBoxInputMode.EMAIL_ADDR] = cc.EditBox.InputMode.EMAIL_ADDR, 
n[t.EditBoxInputMode.NUMERIC] = cc.EditBox.InputMode.NUMERIC, n[t.EditBoxInputMode.PHONENUMBER] = cc.EditBox.InputMode.PHONE_NUMBER, 
n[t.EditBoxInputMode.URL] = cc.EditBox.InputMode.URL, n[t.EditBoxInputMode.DECIMAL] = cc.EditBox.InputMode.DECIMAL, 
n[t.EditBoxInputMode.SINGLE_LINE] = cc.EditBox.InputMode.SINGLE_LINE, n);
this.nativeRenderer.inputMode = o[e];
}, o.prototype.setFontSize = function(t) {
this.nativeRenderer.fontSize = t;
}, o.prototype.setLineHeight = function(t) {
this.nativeRenderer.lineHeight = t;
}, o.prototype.setFontRgb = function(t) {
this.setRgbColor(t, To.color), To.color.a = this.nativeRenderer.fontColor.a, this.nativeRenderer.textLabel.node.color = To.color;
}, o.prototype.setFontAlpha = function(t) {
To.color.set(this.nativeRenderer.fontColor), To.color.a = this.opacityToAlpha(t), 
this.nativeRenderer.textLabel.node.color = To.color;
}, o.prototype.setPlaceholder = function(t) {
this.nativeRenderer.placeholder = t;
}, o.prototype.setPlaceholderFontSize = function(t) {
this.nativeRenderer.placeholderFontSize = t;
}, o.prototype.setPlaceholderFontRgb = function(t) {
this.setRgbColor(t, To.color), To.color.a = this.nativeRenderer.placeholderFontColor.a, 
this.nativeRenderer.placeholderLabel.node.color = To.color;
}, o.prototype.setPlaceholderFontAlpha = function(t) {
To.color.set(this.nativeRenderer.placeholderFontColor), To.color.a = this.opacityToAlpha(t), 
this.nativeRenderer.placeholderLabel.node.color = To.color;
}, o.prototype.setBackgroundRgb = function(t) {
this.setRgbColor(t, To.color), To.color.a = this.backgroundNode.color.a, this.backgroundNode.color = To.color;
}, o.prototype.setBackgroundAlpha = function(t) {
this.backgroundNode.opacity = this.opacityToAlpha(t);
}, o.prototype.setMaxLength = function(t) {
this.nativeRenderer.maxLength = t;
}, o.prototype._bindEditBoxEvent = function(t, e) {
var n = this;
this.bindBaseEvent(t, e, function(e) {
return function() {
var o = {
text: n.nativeRenderer.string,
eid: n.eid,
eventType: t,
worldId: n.worldId
};
n.universe.handleEditBoxEvent(o), null == e || e();
};
});
}, o.prototype.setOnEditBegin = function(t) {
this._bindEditBoxEvent("editing-did-began", t);
}, o.prototype.setOnEditChange = function(t) {
this._bindEditBoxEvent("text-changed", t);
}, o.prototype.setOnEditEnd = function(t) {
this._bindEditBoxEvent("editing-did-ended", t);
}, o;
}(bo), ai = function(t) {
function e(e) {
var n = t.call(this, e) || this;
return n._pendingUpdate = !1, n._cachedVertexCount = -1, n._cachedIndexCount = -1, 
n._cachedFormatKey = "", n.nativeRenderer = n.nativeNode.getComponent(cc.MeshRenderer) || n.nativeNode.addComponent(cc.MeshRenderer), 
n.nativeRenderer.enableAutoBatch = !1, n;
}
return n(e, t), e.prototype.setMesh = function(t) {
this._currentCustomMeshData !== t && (this._currentCustomMeshData = t, this._updateMesh());
}, e.prototype.setShadowCastingMode = function(t) {
this.nativeRenderer.shadowCastingMode = t;
}, e.prototype.setReceiveShadows = function(t) {
this.nativeRenderer.receiveShadows = t;
}, e.prototype._updateMesh = function() {
var t, e, n, o, r, i, a = this, s = this._currentCustomMeshData;
if (!s || !s.positions || !s.indices) return this.nativeRenderer.mesh = null, void this._resetMeshCache();
if (!this.nativeRenderer._assembler) {
if (this._pendingUpdate) return;
return this._pendingUpdate = !0, void cc.director.once(cc.Director.EVENT_AFTER_UPDATE, function() {
a._pendingUpdate = !1, cc.isValid(a.nativeNode) && a._updateMesh();
});
}
var l = cc.gfx;
if (l) {
var u = l.ATTR_POSITION || "a_position", c = l.ATTR_UV0 || "a_uv0", h = s.positions.length / 3, p = s.indices.length, f = Object.keys(s).filter(function(t) {
return "positions" !== t && "uvs" !== t && "indices" !== t && Array.isArray(s[t]);
}), m = "";
try {
for (var v = d(f), y = v.next(); !y.done; y = v.next()) {
var _ = y.value, g = s[_].length / h;
m += "".concat(_, ":").concat(g, "|");
}
} catch (e) {
t = {
error: e
};
} finally {
try {
y && !y.done && (e = v.return) && e.call(v);
} finally {
if (t) throw t.error;
}
}
var A, C = this._cachedMesh;
if (void 0 !== C && h === this._cachedVertexCount && p === this._cachedIndexCount && m === this._cachedFormatKey) A = C; else {
C && (this.nativeRenderer.mesh = null, C.destroy(), this._cachedMesh = void 0);
var R = [ {
name: u,
type: l.ATTR_TYPE_FLOAT32,
num: 3
}, {
name: c,
type: l.ATTR_TYPE_FLOAT32,
num: 2
} ];
try {
for (var S = d(f), T = S.next(); !T.done; T = S.next()) {
_ = T.value, g = s[_].length / h;
var b = _.startsWith("a_") ? _ : "a_".concat(_);
R.push({
name: b,
type: l.ATTR_TYPE_FLOAT32,
num: g
});
}
} catch (t) {
n = {
error: t
};
} finally {
try {
T && !T.done && (o = S.return) && o.call(S);
} finally {
if (n) throw n.error;
}
}
var w = new l.VertexFormat(R);
(A = new cc.Mesh()).init(w, h, !0), this._cachedMesh = A, this._cachedVertexCount = h, 
this._cachedIndexCount = p, this._cachedFormatKey = m;
}
A.setVertices(u, s.positions), A.setVertices(c, s.uvs);
try {
for (var F = d(f), E = F.next(); !E.done; E = F.next()) b = (_ = E.value).startsWith("a_") ? _ : "a_".concat(_), 
A.setVertices(b, s[_]);
} catch (t) {
r = {
error: t
};
} finally {
try {
E && !E.done && (i = F.return) && i.call(F);
} finally {
if (r) throw r.error;
}
}
A.setIndices(s.indices, 0, !0), this.nativeRenderer.mesh = A;
}
}, e.prototype._resetMeshCache = function() {
this._cachedMesh && this._cachedMesh.destroy(), this._cachedMesh = void 0, this._cachedVertexCount = -1, 
this._cachedIndexCount = -1, this._cachedFormatKey = "";
}, e.prototype.disposeRender = function() {
this.nativeRenderer.mesh = null, this._resetMeshCache(), this._currentCustomMeshData = null, 
this._pendingUpdate = !1, t.prototype.disposeRender.call(this);
}, e;
}(bo), si = function(e) {
function o(n) {
var o = e.call(this, n) || this;
return o._nativeTex = null, o._texW = 0, o._texH = 0, o._texFmt = t.PixelFormat.RGBA8888, 
o._filterMin = t.TextureFilter.Linear, o._filterMag = t.TextureFilter.Linear, o._wrapS = t.TextureWrapMode.ClampToEdge, 
o._wrapT = t.TextureWrapMode.ClampToEdge, o._spriteFrame = null, o.nativeRenderer = o.nativeNode.getComponent(cc.Sprite) || o.nativeNode.addComponent(cc.Sprite), 
o.nativeRenderer.sizeMode = cc.Sprite.SizeMode.CUSTOM, o;
}
return n(o, e), o.prototype.setTexWidth = function(t) {
this._texW = t;
}, o.prototype.setTexHeight = function(t) {
this._texH = t;
}, o.prototype.setFormat = function(t) {
this._texFmt = t;
}, o.prototype.setFilterMin = function(t) {
this._filterMin = t, this._nativeTex && this._nativeTex.setFilters(lr(this._filterMin), lr(this._filterMag));
}, o.prototype.setFilterMag = function(t) {
this._filterMag = t, this._nativeTex && this._nativeTex.setFilters(lr(this._filterMin), lr(this._filterMag));
}, o.prototype.setWrapS = function(t) {
this._wrapS = t, this._nativeTex && this._nativeTex.setWrapMode(ur(this._wrapS), ur(this._wrapT));
}, o.prototype.setWrapT = function(t) {
this._wrapT = t, this._nativeTex && this._nativeTex.setWrapMode(ur(this._wrapS), ur(this._wrapT));
}, o.prototype.setPixels = function(e) {
if (!e || !e.length || this._texW <= 0 || this._texH <= 0) this._clearTexture(); else {
var n = this._texW * this._texH * so(this._texFmt);
if (e.length !== n) return "[CocosTexture2DNode] pixels 大小不匹配: 期望 ".concat(n, " 字节 "), 
"(".concat(this._texW, "x").concat(this._texH, ", ").concat(t.PixelFormat[this._texFmt], "), 实际 ").concat(e.length, " 字节"), 
void this._clearTexture();
if (this._nativeTex) this._nativeTex.initWithData(e, sr(this._texFmt), this._texW, this._texH), 
this._refreshSpriteFrame(); else {
var o = new cc.Texture2D();
o.packable = !1, o.setFilters(lr(this._filterMin), lr(this._filterMag)), o.setWrapMode(ur(this._wrapS), ur(this._wrapT)), 
o.initWithData(e, sr(this._texFmt), this._texW, this._texH), this._nativeTex = o, 
this._bindSpriteFrame();
}
}
}, o.prototype._bindSpriteFrame = function() {
this._nativeTex && (this._spriteFrame = new cc.SpriteFrame(this._nativeTex), this.nativeRenderer.spriteFrame = this._spriteFrame, 
this._width > 0 && (this.nativeNode.width = this._width), this._height > 0 && (this.nativeNode.height = this._height));
}, o.prototype._refreshSpriteFrame = function() {
this._nativeTex && this._spriteFrame && (this._spriteFrame.setTexture(this._nativeTex), 
this.nativeRenderer.spriteFrame = this._spriteFrame);
}, o.prototype._clearTexture = function() {
this._nativeTex && (this._spriteFrame && (this.nativeRenderer.spriteFrame === this._spriteFrame && (this.nativeRenderer.spriteFrame = null), 
this._spriteFrame = null), this._nativeTex.destroy(), this._nativeTex = null);
}, o.prototype.disposeRender = function() {
this._clearTexture(), e.prototype.disposeRender.call(this);
}, o.prototype.destroyNative = function() {
this._clearTexture(), e.prototype.destroyNative.call(this);
}, o;
}(bo), li = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n.nativeRenderer = n.nativeNode.getComponent(cc.RichText) || n.nativeNode.addComponent(cc.RichText), 
n;
}
return n(o, e), o.prototype.setText = function(t) {
this.nativeRenderer.string = t;
}, o.prototype.setFontSize = function(t) {
this.nativeRenderer.fontSize = t;
}, o.prototype.setHorizontalAlign = function(e) {
switch (e) {
case t.TextHorizontalAlign.LEFT:
this.nativeRenderer.horizontalAlign = cc.macro.TextAlignment.LEFT;
break;

case t.TextHorizontalAlign.CENTER:
this.nativeRenderer.horizontalAlign = cc.macro.TextAlignment.CENTER;
break;

case t.TextHorizontalAlign.RIGHT:
this.nativeRenderer.horizontalAlign = cc.macro.TextAlignment.RIGHT;
}
}, o.prototype.setMaxWidth = function(t) {
this.nativeRenderer.maxWidth = t;
}, o.prototype.setLineHeight = function(t) {
this.nativeRenderer.lineHeight = t;
}, o.prototype.setFontFamily = function(t) {
this.nativeRenderer.fontFamily = t;
}, o.prototype.setFont = function(e) {
var n = this;
this.loadAsset("font", e, t.LoaderAssetType.Font, function(t) {
n.nativeRenderer.font = t;
});
}, o.prototype.setUseSystemFont = function(t) {
this.nativeRenderer.useSystemFont = t;
}, o.prototype.setCacheMode = function(e) {
switch (e) {
case t.LabelCacheMode.NONE:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.NONE;
break;

case t.LabelCacheMode.BITMAP:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.BITMAP;
break;

case t.LabelCacheMode.CHAR:
this.nativeRenderer.cacheMode = cc.Label.CacheMode.CHAR;
}
}, o.prototype.setImageAtlas = function(e) {
var n = this;
this.loadAsset("imageAtlas", e, t.LoaderAssetType.SpriteAtlas, function(t) {
n.nativeRenderer.imageAtlas = t;
});
}, o.prototype.setHandleTouchEvent = function(t) {
this.nativeRenderer.handleTouchEvent = t;
}, o.prototype.setOnClick = function(t) {
var e = this, n = this.nativeNode.getComponent(ui);
n || (n = this.nativeNode.addComponent(ui)), n.callback = t ? function(n) {
var o = {
param: null != n ? n : "",
eid: e.eid,
worldId: e.worldId
};
e.universe.handleRichTextClickEvent(o), t(o);
} : void 0;
}, o;
}(bo), ui = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.callback = void 0, e;
}
return n(e, t), e.prototype.onClick = function(t, e) {
var n;
null === (n = this.callback) || void 0 === n || n.call(this, e);
}, s([ cc._decorator.ccclass("AERichTextClickProxy") ], e);
}(cc.Component), ci = function(e) {
function o() {
var t = e.apply(this, p([], h(arguments), !1)) || this;
return t.root = null, t.shouldRestoreContext = cc.sys.os === cc.sys.OS_ANDROID, 
t._preheatCache = new Map(), t;
}
return n(o, e), o.prototype.createRenderNode = function(e) {
switch (e) {
case t.RenderNodeType.Node:
return new bo(this.universe);

case t.RenderNodeType.Text:
return new xo(this.universe);

case t.RenderNodeType.Sprite:
return new ni(this.universe);

case t.RenderNodeType.Streak:
return new oi(this.universe);

case t.RenderNodeType.Particle:
return new ri(this.universe);

case t.RenderNodeType.EditBox:
return new ii(this.universe);

case t.RenderNodeType.Mesh:
return new ai(this.universe);

case t.RenderNodeType.Spine:
return new Lo(this.universe);

case t.RenderNodeType.Graphics:
return new Uo(this.universe);

case t.RenderNodeType.TraceGraphics:
return new nr(this.universe);

case t.RenderNodeType.Mask:
return new hr(this.universe);

case t.RenderNodeType.ScrollView:
return new $r(this.universe);

case t.RenderNodeType.Camera:
return new ti(this.universe);

case t.RenderNodeType.Texture2D:
return new si(this.universe);

case t.RenderNodeType.RichText:
return new li(this.universe);

default:
return void y(r.UnsupportedNodeType, {
type: String(e)
});
}
}, o.prototype.createRootNode = function(e, n) {
var o = new bo(this.universe);
o.setName("AtomEngineRoot"), o.setWidgetTop(0), o.setWidgetBottom(0), o.setWidgetLeft(0), 
o.setWidgetRight(0), o.setWidgetAlignMode(t.WidgetAlignMode.Always), this.root = o.nativeNode, 
this.root.on(cc.Node.EventType.SIZE_CHANGED, this.onWindowResize, this), cc.systemEvent.on(cc.SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this), 
cc.systemEvent.on(cc.SystemEvent.EventType.KEY_UP, this.onKeyUp, this), cc.game.on(cc.game.EVENT_HIDE, this.onPageHide, this), 
cc.game.on(cc.game.EVENT_SHOW, this.onPageShow, this), cc.view.on("canvas-resize", this.onCanvasResize, this);
var r = null != e ? e : cc.winSize.width, i = null != n ? n : cc.winSize.height;
return this.universe.handleWindowResize(r, i), o;
}, o.prototype.destroyRootNode = function() {
this.root && (this.root.off(cc.Node.EventType.SIZE_CHANGED, this.onWindowResize, this), 
cc.systemEvent.off(cc.SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this), cc.systemEvent.off(cc.SystemEvent.EventType.KEY_UP, this.onKeyUp, this), 
cc.game.off(cc.game.EVENT_HIDE, this.onPageHide, this), cc.game.off(cc.game.EVENT_SHOW, this.onPageShow, this), 
cc.view.off("canvas-resize", this.onCanvasResize, this), this.root = null);
}, o.prototype.onWindowResize = function() {
this.root && this.universe.handleWindowResize(this.root.width, this.root.height);
}, o.prototype.onKeyDown = function(t) {
var e = t.keyCode;
this.universe.handleKeyboardEvent(e, !0);
}, o.prototype.onKeyUp = function(t) {
var e = t.keyCode;
this.universe.handleKeyboardEvent(e, !1);
}, o.prototype.getWinSize = function() {
var t = cc.winSize;
return {
width: t.width,
height: t.height
};
}, o.prototype.getDesignSize = function() {
var t = cc.view.getDesignResolutionSize();
return {
width: t.width,
height: t.height
};
}, o.prototype.captureGameImage = function(e) {
var n, o, r, i = cc.director.getScene(), a = this.getWinSize(), s = Math.max(1, Math.round(null !== (n = null == e ? void 0 : e.width) && void 0 !== n ? n : a.width)), l = Math.max(1, Math.round(null !== (o = null == e ? void 0 : e.height) && void 0 !== o ? o : a.height)), u = this.universe.layerMapping.toPhysicalMask(null !== (r = null == e ? void 0 : e.cullingMask) && void 0 !== r ? r : t.CameraLayer.Everything), c = cc.Camera.cameras.filter(function(t) {
return t.enabledInHierarchy && !t.targetTexture && 0 != (t.cullingMask & u);
}).sort(function(t, e) {
return t.depth - e.depth;
});
return c.length > 0 ? this._captureWithSceneCameras(c, i, s, l, e) : this._captureWithTempCamera(i, s, l, e);
}, o.prototype._captureWithSceneCameras = function(t, e, n, o, r) {
var i, a, s, l, u, c = cc.Camera.ClearFlags.COLOR | cc.Camera.ClearFlags.DEPTH | cc.Camera.ClearFlags.STENCIL, h = this._resolveCaptureBackground(r), p = [];
try {
(u = new cc.RenderTexture()).initWithSize(n, o, cc.RenderTexture.DepthStencilFormat.RB_FMT_D24S8);
for (var f = 0; f < t.length; f++) {
var m = t[f];
p.push({
camera: m,
targetTexture: m.targetTexture,
clearFlags: m.clearFlags,
backgroundColor: m.backgroundColor.clone()
}), m.targetTexture = u, 0 === f && (m.clearFlags = c, h && (m.backgroundColor = h));
}
try {
for (var v = d(t), y = v.next(); !y.done; y = v.next()) (m = y.value).render(e);
} catch (t) {
i = {
error: t
};
} finally {
try {
y && !y.done && (a = v.return) && a.call(v);
} finally {
if (i) throw i.error;
}
}
return this._readPixelsFlipped(u, n, o);
} finally {
try {
for (var _ = d(p), g = _.next(); !g.done; g = _.next()) {
var A = g.value;
cc.isValid(A.camera) && (A.camera.targetTexture = A.targetTexture, A.camera.clearFlags = A.clearFlags, 
A.camera.backgroundColor = A.backgroundColor);
}
} catch (t) {
s = {
error: t
};
} finally {
try {
g && !g.done && (l = _.return) && l.call(_);
} finally {
if (s) throw s.error;
}
}
cc.isValid(u) && u.destroy();
}
}, o.prototype._captureWithTempCamera = function(e, n, o, r) {
var i, a, s, l, u;
try {
return (s = new cc.RenderTexture()).initWithSize(n, o, cc.RenderTexture.DepthStencilFormat.RB_FMT_D24S8), 
(u = (l = new cc.Node("__AtomScreenshotCamera")).addComponent(cc.Camera)).cullingMask = this.universe.layerMapping.toPhysicalMask(null !== (i = null == r ? void 0 : r.cullingMask) && void 0 !== i ? i : t.CameraLayer.Everything), 
u.clearFlags = cc.Camera.ClearFlags.COLOR | cc.Camera.ClearFlags.DEPTH | cc.Camera.ClearFlags.STENCIL, 
u.backgroundColor = null !== (a = this._resolveCaptureBackground(r)) && void 0 !== a ? a : new cc.Color(0, 0, 0, 0), 
u.alignWithScreen = !0, u.targetTexture = s, l.parent = e, u.render(e), this._readPixelsFlipped(s, n, o);
} finally {
u && cc.isValid(l) && (u.enabled = !1), cc.isValid(l) && l.destroy(), cc.isValid(s) && s.destroy();
}
}, o.prototype._resolveCaptureBackground = function(t) {
var e, n;
if (void 0 !== (null == t ? void 0 : t.backgroundColor) || void 0 !== (null == t ? void 0 : t.backgroundAlpha)) {
var o = null !== (e = null == t ? void 0 : t.backgroundColor) && void 0 !== e ? e : 0, r = void 0 !== (null == t ? void 0 : t.backgroundColor) ? 1 : 0, i = Math.max(0, Math.min(1, null !== (n = null == t ? void 0 : t.backgroundAlpha) && void 0 !== n ? n : r));
return new cc.Color(o >> 16 & 255, o >> 8 & 255, 255 & o, Math.round(255 * i));
}
}, o.prototype._readPixelsFlipped = function(e, n, o) {
var r = e.readPixels();
return {
width: n,
height: o,
pixels: this._flipPixelsVertically(r, n, o),
format: t.PixelFormat.RGBA8888
};
}, o.prototype._flipPixelsVertically = function(t, e, n) {
for (var o = 4 * e, r = new Uint8Array(t.length), i = 0; i < n; i++) {
var a = i * o, s = (n - 1 - i) * o;
r.set(t.subarray(a, a + o), s);
}
return r;
}, o.prototype.setMultiTouch = function(t) {
if (void 0 !== t) {
var e = cc.macro.ENABLE_MULTI_TOUCH;
return cc.macro.ENABLE_MULTI_TOUCH = t, e;
}
}, o.prototype.updateRootNodeAlignment = function() {
var t, e;
if (this.root) {
var n = this.root.getComponent(cc.Widget);
n && n.updateAlignment();
try {
for (var o = d(this.root.children), r = o.next(); !r.done; r = o.next()) {
var i = r.value.getComponent(cc.Widget);
i && i.updateAlignment();
}
} catch (e) {
t = {
error: e
};
} finally {
try {
r && !r.done && (e = o.return) && e.call(o);
} finally {
if (t) throw t.error;
}
}
this.onWindowResize();
}
}, o.prototype.preheatSpineSharedCache = function(t, e) {
return u(this, void 0, void 0, function() {
var n, o, r, i = this;
return c(this, function() {
if (!(t instanceof sp.SkeletonData)) throw new Error("[AtomEngine] preheatSpineSharedCache: 资源类型不是 sp.SkeletonData，请检查 paths.SkeletonData 是否指向 Spine 资源");
return (n = t._uuid) && (o = this._preheatCache.get(n)) ? [ 2, o ] : (r = this._doPreheat(t, e), 
n && (this._preheatCache.set(n, r), r.catch(function() {
return i._preheatCache.delete(n);
})), [ 2, r ]);
});
});
}, o.prototype._doPreheat = function(t, e) {
return u(this, void 0, void 0, function() {
var n, o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
if (n = new cc.Node("__spine_preheat__"), (o = n.addComponent(sp.Skeleton)).setAnimationCacheMode(sp.Skeleton.AnimationCacheMode.SHARED_CACHE), 
o.skeletonData = t, !(r = t.getRuntimeData())) throw o.skeletonData = void 0, n.destroy(), 
new Error("[AtomEngine] preheatSpineSharedCache: getRuntimeData 失败，纹理可能未就绪");
if (0 === (i = r.animations.map(function(t) {
return t.name;
})).length) return o.skeletonData = void 0, n.destroy(), null == e || e(1), [ 2 ];
a.label = 1;

case 1:
return a.trys.push([ 1, , 3, 4 ]), [ 4, this._preheatAnimations(o, i, e) ];

case 2:
return a.sent(), [ 3, 4 ];

case 3:
return o.skeletonData = void 0, n.destroy(), [ 7 ];

case 4:
return [ 2 ];
}
});
});
}, o.prototype._preheatAnimations = function(t, e, n) {
return new Promise(function(r, i) {
var a = e.length, s = 0, l = function() {
try {
for (var u = performance.now(); s < a && (t.updateAnimationCache(e[s]), s++, null == n || n(s / a), 
!(performance.now() - u >= o.PREHEAT_FRAME_BUDGET_MS)); ) ;
if (s >= a) return void r();
cc.director.once(cc.Director.EVENT_AFTER_UPDATE, l);
} catch (t) {
i(t);
}
};
l();
});
}, o.PREHEAT_FRAME_BUDGET_MS = 8, o;
}(ao), di = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.setItem = function(t, e) {
cc.sys.localStorage.setItem(t, e);
}, e.prototype.getItem = function(t) {
return cc.sys.localStorage.getItem(t);
}, e.prototype.removeItem = function(t) {
cc.sys.localStorage.removeItem(t);
}, e.prototype.hasItem = function(t) {
return null !== cc.sys.localStorage.getItem(t);
}, e.prototype.clear = function() {
cc.sys.localStorage.clear();
}, e;
}(function() {
function t() {}
return t.prototype.readRawItem = function(t) {
return this.getItem(t);
}, t.prototype.saveStorage = function(t, e) {
this.setItem("ae_storage_" + t, JSON.stringify(e));
}, t.prototype.loadStorage = function(t) {
var e = this.getItem("ae_storage_" + t);
return e ? JSON.parse(e) : null;
}, t.prototype.clearStorage = function() {
this.clear();
}, t.prototype.saveJsonEntry = function(t, e) {
this.setItem("ae_json_" + t, JSON.stringify(e));
}, t.prototype.loadJsonEntry = function(t) {
var e = this.getItem("ae_json_" + t);
return e ? JSON.parse(e) : null;
}, t.prototype.removeJsonEntry = function(t) {
this.removeItem("ae_json_" + t);
}, t;
}()), hi = "atom_preloaded_assets", pi = "atom_group_versions", fi = "atom_staged_ready", mi = "atom_downloaded_worlds", vi = ((ei = {})[t.LoaderAssetType.SpriteFrame] = cc.SpriteFrame, 
ei[t.LoaderAssetType.SpriteAtlas] = cc.SpriteAtlas, ei[t.LoaderAssetType.Font] = cc.Font, 
ei[t.LoaderAssetType.SkeletonData] = sp.SkeletonData, ei[t.LoaderAssetType.DragonBonesAsset] = dragonBones.DragonBonesAsset, 
ei[t.LoaderAssetType.DragonBonesAtlasAsset] = dragonBones.DragonBonesAtlasAsset, 
ei[t.LoaderAssetType.Particle] = cc.ParticleAsset, ei[t.LoaderAssetType.Texture] = cc.Texture2D, 
ei[t.LoaderAssetType.AudioClip] = cc.AudioClip, ei[t.LoaderAssetType.Material] = cc.Material, 
ei[t.LoaderAssetType.Json] = cc.JsonAsset, ei[t.LoaderAssetType.Buffer] = cc.BufferAsset, 
ei[t.LoaderAssetType.Effect] = cc.EffectAsset, ei), yi = function(e) {
function o(t) {
var n = e.call(this, t) || this;
return n._bundles = new Map(), n._remoteAssetCache = new Map(), n._bundleSyncWarned = new Set(), 
n._stagedReady = {}, n._stagedReadyLoaded = !1, n._preloadCache = {}, n._preloadCacheLoaded = !1, 
n._savePending = !1, n._downloadedWorlds = {}, n._downloadedWorldsLoaded = !1, n._fallbackInFlight = new Map(), 
n;
}
return n(o, e), o.prototype._loadRemoteWithTimeout = function(t, e) {
return void 0 === e && (e = 18e4), new Promise(function(n, o) {
var r = !1, i = setTimeout(function() {
r || (r = !0);
}, e);
cc.assetManager.loadRemote(t, function(t, e) {
r = !0, clearTimeout(i), t ? o(t) : n(e);
});
});
}, o.prototype._ensureStagedReadyLoaded = function() {
if (!this._stagedReadyLoaded) {
this._stagedReadyLoaded = !0;
var t = cc.sys.localStorage.getItem(fi);
t && (this._stagedReady = JSON.parse(t));
}
}, o.prototype.markBundlePackageReady = function(t, e) {
this._ensureStagedReadyLoaded(), this._stagedReady[t] !== e && (this._stagedReady[t] = e, 
cc.sys.localStorage.setItem(fi, JSON.stringify(this._stagedReady)));
}, o.prototype._dirCacheKey = function(t) {
return "dir:".concat(t);
}, o.prototype._isPreloaded = function(t, e) {
var n, o;
return this._ensureCacheLoaded(), Boolean(null === (o = null === (n = this._preloadCache[t]) || void 0 === n ? void 0 : n.assets) || void 0 === o ? void 0 : o[e]);
}, o.prototype._isPathCoveredByDir = function(t, e) {
var n, o = null === (n = this._preloadCache[t]) || void 0 === n ? void 0 : n.assets;
if (!o) return !1;
for (var r in o) if (r.startsWith("dir:")) {
var i = r.slice(4);
if ("" === i || e === i || e.startsWith(i + "/")) return !0;
}
return !1;
}, o.prototype._markPreloaded = function(t, e) {
this._ensureCacheLoaded(), this._preloadCache[t].assets[e] = !0, this._scheduleSave();
}, o.prototype._initFeaturePreloadCache = function(t, e) {
this._ensureCacheLoaded();
var n = this._preloadCache[t];
n ? n.version !== e ? (n.version = e, n.assets = {}, delete n.bundleDownloaded, 
delete n.resourcesDownloaded, delete n.compressed, delete n.deps, this._invalidateDependents(t), 
this._scheduleSave()) : n.assets || (n.assets = {}, this._scheduleSave()) : (this._preloadCache[t] = {
version: e,
assets: {}
}, this._scheduleSave());
}, o.prototype._invalidateDependents = function(t) {
var e, n, o;
try {
for (var r = d(Object.values(this._preloadCache)), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
(null === (o = a.deps) || void 0 === o ? void 0 : o.includes(t)) && (delete a.bundleDownloaded, 
delete a.resourcesDownloaded);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
}, o.prototype._ensureCacheLoaded = function() {
if (!this._preloadCacheLoaded) {
this._preloadCacheLoaded = !0;
var t = cc.sys.localStorage.getItem(hi);
t && (this._preloadCache = JSON.parse(t));
}
}, o.prototype._scheduleSave = function(t) {
var e = this;
if (void 0 === t && (t = !1), t) return this._savePending = !1, void cc.sys.localStorage.setItem(hi, JSON.stringify(this._preloadCache));
this._savePending || (this._savePending = !0, setTimeout(function() {
e._savePending = !1, cc.sys.localStorage.setItem(hi, JSON.stringify(e._preloadCache));
}, 500));
}, o.prototype._ensureDownloadedWorldsLoaded = function() {
if (!this._downloadedWorldsLoaded) {
this._downloadedWorldsLoaded = !0;
var t = cc.sys.localStorage.getItem(mi);
t && (this._downloadedWorlds = JSON.parse(t));
}
}, o.prototype.markWorldDownloaded = function(t) {
this._ensureDownloadedWorldsLoaded(), this._downloadedWorlds[t] || (this._downloadedWorlds[t] = !0, 
cc.sys.localStorage.setItem(mi, JSON.stringify(this._downloadedWorlds)));
}, o.prototype.isWorldDownloaded = function(t) {
return this._ensureDownloadedWorldsLoaded(), !0 === this._downloadedWorlds[t];
}, o.prototype.clearWorldDownloaded = function(t) {
this._ensureDownloadedWorldsLoaded(), this._downloadedWorlds[t] && (delete this._downloadedWorlds[t], 
cc.sys.localStorage.setItem(mi, JSON.stringify(this._downloadedWorlds)));
}, o.prototype.isBundleDownloaded = function(t) {
var e;
return this.hasLocalBundlePackage(t, null === (e = this.getSessionFeatureVersion(t)) || void 0 === e ? void 0 : e.version);
}, o.prototype.isResourcesDownloaded = function(t) {
var e;
this._ensureCacheLoaded();
var n = this._preloadCache[t];
if (!(null == n ? void 0 : n.resourcesDownloaded)) return !1;
var o = null === (e = this.getSessionFeatureVersion(t)) || void 0 === e ? void 0 : e.version;
return void 0 === o || n.version === o;
}, o.prototype.isAssetDownloaded = function(t, e, n) {
var o, r, i, a, s, l = this.buildRemoteUrl(t, e), u = l.isRemote, c = l.resolvedPath;
if (u) {
var d = this.assetCacheKey(c, n);
return !!(null === (o = this._remoteAssetCache.get(t)) || void 0 === o ? void 0 : o.has(d)) || Boolean(null === (r = cc.assetManager.cacheManager) || void 0 === r ? void 0 : r.getCache(c));
}
this._ensureCacheLoaded();
var h = null === (i = this.getSessionFeatureVersion(t)) || void 0 === i ? void 0 : i.version;
return (void 0 === h || (null === (a = this._preloadCache[t]) || void 0 === a ? void 0 : a.version) === h) && (!!(null === (s = this._preloadCache[t]) || void 0 === s ? void 0 : s.resourcesDownloaded) || !!this._isPreloaded(t, this.assetCacheKey(e, n)) || this._isPathCoveredByDir(t, e));
}, o.prototype.isDirDownloaded = function(t, e) {
var n, o, r;
this._ensureCacheLoaded();
var i = null === (n = this.getSessionFeatureVersion(t)) || void 0 === n ? void 0 : n.version;
return (void 0 === i || (null === (o = this._preloadCache[t]) || void 0 === o ? void 0 : o.version) === i) && (!!(null === (r = this._preloadCache[t]) || void 0 === r ? void 0 : r.resourcesDownloaded) || this._isPathCoveredByDir(t, e));
}, o.prototype.preloadBundles = function(t, e) {
return u(this, void 0, void 0, function() {
var n, o, r, i, a, s, l, u, h, p, f, m, v, y, _, g, A;
return c(this, function(c) {
switch (c.label) {
case 0:
this._ensureCacheLoaded(), n = [], c.label = 1;

case 1:
c.trys.push([ 1, 17, 18, 19 ]), o = d(t), r = o.next(), c.label = 2;

case 2:
if (r.done) return [ 3, 16 ];
i = r.value, c.label = 3;

case 3:
return c.trys.push([ 3, 13, , 14 ]), this.isBundleDownloaded(i) ? (null == e || e(), 
[ 3, 15 ]) : [ 4, this._loadBundleWithMeta(i) ];

case 4:
a = c.sent().deps, s = a.map(function(t) {
return t.atomFeatureName;
}), c.label = 5;

case 5:
c.trys.push([ 5, 10, 11, 12 ]), g = void 0, l = d(s), u = l.next(), c.label = 6;

case 6:
return u.done ? [ 3, 9 ] : (h = u.value, [ 4, this._loadBundleWithMeta(h) ]);

case 7:
c.sent(), this._preloadCache[h].bundleDownloaded = !0, c.label = 8;

case 8:
return u = l.next(), [ 3, 6 ];

case 9:
return [ 3, 12 ];

case 10:
return p = c.sent(), g = {
error: p
}, [ 3, 12 ];

case 11:
try {
u && !u.done && (A = l.return) && A.call(l);
} finally {
if (g) throw g.error;
}
return [ 7 ];

case 12:
return this._preloadCache[i].bundleDownloaded = !0, [ 3, 14 ];

case 13:
return f = c.sent(), m = "".concat(i, ": ").concat(f instanceof Error ? f.message : f), 
n.push(m), [ 3, 14 ];

case 14:
null == e || e(), c.label = 15;

case 15:
return r = o.next(), [ 3, 2 ];

case 16:
return [ 3, 19 ];

case 17:
return v = c.sent(), y = {
error: v
}, [ 3, 19 ];

case 18:
try {
r && !r.done && (_ = o.return) && _.call(o);
} finally {
if (y) throw y.error;
}
return [ 7 ];

case 19:
if (this._scheduleSave(!0), n.length > 0) throw new Error("preloadBundles 部分失败(".concat(n.length, "/").concat(t.length, "): ").concat(n.join("; ")));
return [ 2 ];
}
});
});
}, o.prototype.preloadFeatures = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a;
return c(this, function(s) {
switch (s.label) {
case 0:
s.trys.push([ 0, 5, 6, 7 ]), e = d(t), n = e.next(), s.label = 1;

case 1:
return n.done ? [ 3, 4 ] : (o = n.value, [ 4, this._preloadFeatureWithDeps(o) ]);

case 2:
s.sent(), s.label = 3;

case 3:
return n = e.next(), [ 3, 1 ];

case 4:
return [ 3, 7 ];

case 5:
return r = s.sent(), i = {
error: r
}, [ 3, 7 ];

case 6:
try {
n && !n.done && (a = e.return) && a.call(e);
} finally {
if (i) throw i.error;
}
return [ 7 ];

case 7:
return [ 2 ];
}
});
});
}, o.prototype._preloadFeatureWithDeps = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s, l, u, h, p;
return c(this, function(c) {
switch (c.label) {
case 0:
return this._ensureCacheLoaded(), this.isResourcesDownloaded(t) ? [ 2 ] : [ 4, this._loadBundleWithMeta(t) ];

case 1:
return e = c.sent(), n = e.bundle, o = e.deps, [ 4, this._preloadDirNative(n, "", t) ];

case 2:
if (c.sent(), !((r = o.map(function(t) {
return t.atomFeatureName;
})).length > 0)) return [ 3, 11 ];
c.label = 3;

case 3:
c.trys.push([ 3, 9, 10, 11 ]), i = d(r), a = i.next(), c.label = 4;

case 4:
return a.done ? [ 3, 8 ] : (s = a.value, [ 4, this._loadBundleWithMeta(s) ]);

case 5:
return l = c.sent().bundle, [ 4, this._preloadDirNative(l, "", s) ];

case 6:
c.sent(), this._preloadCache[s].bundleDownloaded = !0, this._preloadCache[s].resourcesDownloaded = !0, 
c.label = 7;

case 7:
return a = i.next(), [ 3, 4 ];

case 8:
return [ 3, 11 ];

case 9:
return u = c.sent(), h = {
error: u
}, [ 3, 11 ];

case 10:
try {
a && !a.done && (p = i.return) && p.call(i);
} finally {
if (h) throw h.error;
}
return [ 7 ];

case 11:
return this._preloadCache[t].bundleDownloaded = !0, this._preloadCache[t].resourcesDownloaded = !0, 
this._scheduleSave(!0), [ 2 ];
}
});
});
}, o.prototype._resolveFallbackManifest = function(t) {
var e = this, n = this._fallbackInFlight.get(t);
if (n) return n;
var o = u(e, void 0, void 0, function() {
var e, n, o;
return c(this, function(r) {
switch (r.label) {
case 0:
if (!this.universe.host.getNetworkState()) return [ 3, 4 ];
r.label = 1;

case 1:
return r.trys.push([ 1, 3, , 4 ]), [ 4, this.fetchFeatureManifestRaw(t) ];

case 2:
return [ 2, {
version: (e = r.sent()).version,
deps: e.deps
} ];

case 3:
return r.sent(), [ 3, 4 ];

case 4:
return this._ensureCacheLoaded(), [ 2, {
version: null == (n = this._preloadCache[t]) ? void 0 : n.version,
deps: null !== (o = null == n ? void 0 : n.deps) && void 0 !== o ? o : []
} ];
}
});
}).finally(function() {
return e._fallbackInFlight.delete(t);
});
return this._fallbackInFlight.set(t, o), o;
}, o.prototype._loadBundleWithMeta = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i, a, s, l, u, d, h, p, f;
return c(this, function(c) {
switch (c.label) {
case 0:
return (e = this._bundles.get(t)) ? (this._ensureCacheLoaded(), n = this._preloadCache[t], 
[ 2, {
bundle: e,
version: null == n ? void 0 : n.version,
deps: (null !== (h = null == n ? void 0 : n.deps) && void 0 !== h ? h : []).map(function(t) {
return {
atomFeatureName: t
};
})
} ]) : (r = [], this._remoteBundleUrl ? (i = this.getSessionFeatureVersion(t)) ? (o = i.version, 
r = (null !== (p = i.deps) && void 0 !== p ? p : []).map(function(t) {
return {
atomFeatureName: t
};
}), [ 3, 3 ]) : [ 3, 1 ] : [ 3, 3 ]);

case 1:
return [ 4, this._resolveFallbackManifest(t) ];

case 2:
a = c.sent(), o = a.version, r = a.deps.map(function(t) {
return {
atomFeatureName: t
};
}), c.label = 3;

case 3:
return [ 4, this._loadBundleRaw(t, o) ];

case 4:
return s = c.sent(), l = s.bundle, u = s.useCompressed, this._remoteBundleUrl ? [ 3, 6 ] : [ 4, new Promise(function(t) {
l.load("bundleMeta", cc.JsonAsset, function(e, n) {
t(e ? null : n.json);
});
}) ];

case 5:
(d = c.sent()) && (r = null !== (f = d.dependencies) && void 0 !== f ? f : [], d.createTime, 
d.buildTime), c.label = 6;

case 6:
return this._bundles.set(t, l), this._initFeaturePreloadCache(t, o), this._preloadCache[t].deps = r.map(function(t) {
return t.atomFeatureName;
}), this._preloadCache[t].compressed = Boolean(u), u && r.length > 0 && this.universe.featureResolver.markFeaturesCompressed(r.map(function(t) {
return t.atomFeatureName;
})), [ 2, {
bundle: l,
version: o,
deps: r
} ];
}
});
});
}, o.prototype._shouldUseCompressed = function(t) {
var e;
if (!this._remoteBundleUrl) return !1;
this._ensureCacheLoaded();
var n = null === (e = this._preloadCache[t]) || void 0 === e ? void 0 : e.compressed;
return void 0 !== n ? n : this.universe.featureResolver.isFeatureCompressed(t);
}, o.prototype._loadBundleRaw = function(t, e) {
return u(this, void 0, void 0, function() {
var n = this;
return c(this, function() {
return [ 2, this.enqueueBundleOp(function() {
return u(n, void 0, void 0, function() {
var n, o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
return n = this._getBundleOpts(t, e), o = n.path, r = n.bundleOpts, i = n.useCompressed, 
[ 4, new Promise(function(t, e) {
cc.assetManager.loadBundle(o, r, function(n, o) {
n ? e(n) : t(o);
});
}) ];

case 1:
return [ 2, {
bundle: a.sent(),
useCompressed: i
} ];
}
});
});
}) ];
});
});
}, o.prototype._getBundleOpts = function(t, e) {
var n = this.buildBundleUrl(t), o = {
bundleName: t
};
void 0 !== e && (o.version = String(e));
var r = void 0 !== e && this._shouldUseCompressed(t);
return r && (o.hspkg = !0, o.hspkgUrl = "".concat(n, "/").concat(t, ".").concat(e, ".hspkg")), 
{
path: n,
bundleOpts: o,
useCompressed: r
};
}, o.prototype.onFeaturesRetained = function(t) {
var e, n;
this._ensureCacheLoaded();
try {
for (var o = d(t), r = o.next(); !r.done; r = o.next()) {
var i = r.value;
this._preloadCache[i] && (this._preloadCache[i].bundleDownloaded = !0);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
this._scheduleSave(!0);
}, o.prototype.doLoadFeature = function(t) {
return u(this, void 0, void 0, function() {
return c(this, function(e) {
switch (e.label) {
case 0:
return [ 4, this._loadBundleWithMeta(t.atomFeatureName) ];

case 1:
return [ 2, e.sent().deps ];
}
});
});
}, o.prototype.fetchFeatureManifestRaw = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
return this._remoteBundleUrl ? (e = this._preRelease ? "bundleMetaPre.json" : "bundleMeta.json", 
n = "".concat(this.buildBundleUrl(t), "/").concat(e, "?t=").concat(Date.now()), 
[ 4, this._loadRemoteWithTimeout(n) ]) : [ 2, {
deps: []
} ];

case 1:
return o = a.sent(), [ 2, {
version: (r = o.json).version,
deps: (null !== (i = r.dependencies) && void 0 !== i ? i : []).map(function(t) {
return t.atomFeatureName;
})
} ];
}
});
});
}, o.prototype.downloadCtrl = function(t) {
var e = cc.assetManager;
"loadSmoothness" in e && e.loadSmoothness !== t && (e.loadSmoothness = t);
}, o.prototype.getPlatformName = function() {
return "creator2";
}, o.prototype.getSystemName = function() {
if (cc.sys.isNative) {
if (cc.sys.os === cc.sys.OS_IOS) return "ios";
if (cc.sys.os === cc.sys.OS_ANDROID) return "android";
}
return "web-desktop";
}, o.prototype.doReleaseFeatureAssets = function(t) {
var e, n, o = this._bundles.get(t);
if (o) try {
o.releaseAll();
} catch (e) {
var r = e instanceof Error ? e.message : String(e);
this.universe.host.track("atomengine_game_common_execution_failed", {
error_type: "bundle.releaseAll 内部异常",
error_message: "".concat(t, " ---\x3e ").concat(r)
});
}
var i = this._remoteAssetCache.get(t);
if (i) {
try {
for (var a = d(i.values()), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
l instanceof cc.Asset && cc.assetManager.releaseAsset(l);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
this._remoteAssetCache.delete(t);
}
}, o.prototype.doRemoveFeatureBundle = function(t) {
var e, n, o = this._bundles.get(t);
if (o) {
cc.assetManager.removeBundle(o), this._bundles.delete(t);
var r = "".concat(o.name, "/");
try {
for (var i = d(this._bundleSyncWarned), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
s.startsWith(r) && this._bundleSyncWarned.delete(s);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
}
}, o.prototype.hasLocalBundlePackage = function(t, e) {
this._ensureCacheLoaded();
var n = this._preloadCache[t];
if (void 0 === e || (null == n ? void 0 : n.version) === e) {
if (this._bundles.has(t)) return !0;
if (null == n ? void 0 : n.bundleDownloaded) return !0;
}
return void 0 !== e && (this._ensureStagedReadyLoaded(), this._stagedReady[t] === e);
}, o.prototype.stageFeaturePackage = function(t, e) {
return u(this, void 0, void 0, function() {
var n = this;
return c(this, function() {
return [ 2, this.enqueueBundleOp(function() {
return u(n, void 0, void 0, function() {
var n, o, r;
return c(this, function(i) {
switch (i.label) {
case 0:
return n = this._getBundleOpts(t, e), o = n.path, r = n.bundleOpts, [ 4, new Promise(function(t, e) {
cc.assetManager.preloadBundle(o, r, function(n, o) {
n ? e(n) : o.preloadAll(function(n) {
o.release(), n ? e(n) : t();
});
});
}) ];

case 1:
return i.sent(), [ 2 ];
}
});
});
}) ];
});
});
}, o.prototype.loadGroupVersions = function() {
var t = cc.sys.localStorage.getItem(pi);
return t ? JSON.parse(t) : {};
}, o.prototype.saveGroupVersions = function(t) {
cc.sys.localStorage.setItem(pi, JSON.stringify(t));
}, o.prototype.loadVersionState = function() {
var t = cc.sys.localStorage.getItem("atom_feature_versions");
return t ? JSON.parse(t) : {};
}, o.prototype._bundleSyncGet = function(t, e, n) {
try {
return t.get(e, n);
} catch (n) {
var o = "".concat(t.name, "/").concat(e);
return void (this._bundleSyncWarned.has(o) || this._bundleSyncWarned.add(o));
}
}, o.prototype.tryGetCachedAsset = function(t, e, n) {
var o, r = this.buildRemoteUrl(t, e), i = r.isRemote, a = r.resolvedPath;
if (i) {
var s = this.assetCacheKey(a, n);
return null === (o = this._remoteAssetCache.get(t)) || void 0 === o ? void 0 : o.get(s);
}
var l = this._bundles.get(t);
if (l) {
var u = vi[n];
if (u) return this._bundleSyncGet(l, e, u);
}
}, o.prototype.loadAsset = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i, a, s, l, u = this;
return c(this, function() {
return o = this.buildRemoteUrl(t, e), r = o.isRemote, i = o.resolvedPath, r ? [ 2, this._loadRemoteAsset(t, i, n) ] : (a = this._bundles.get(t)) ? (s = vi[n]) ? (l = this._bundleSyncGet(a, e, s)) ? [ 2, l ] : [ 2, new Promise(function(o, r) {
a.load(e, s, function(i, a) {
i ? r(new Error("加载资源失败 [".concat(t, "/").concat(e, "]: ").concat(i.message))) : (u._markPreloaded(t, u.assetCacheKey(e, n)), 
o(a));
});
}) ] : [ 2, Promise.reject(new Error("不支持的资源类型: ".concat(n))) ] : [ 2, Promise.reject(new Error("特性未加载: ".concat(t))) ];
});
});
}, o.prototype._loadRemoteAsset = function(t, e, n) {
var o = this, r = this.assetCacheKey(e, n), i = this._remoteAssetCache.get(t);
i || (i = new Map(), this._remoteAssetCache.set(t, i));
var a = i.get(r);
return void 0 !== a ? Promise.resolve(a) : this._loadRemoteWithTimeout(e).then(function(t) {
var e = o._normalizeRemoteAsset(t, n);
return i.set(r, e), e;
});
}, o.prototype._normalizeRemoteAsset = function(e, n) {
switch (n) {
case t.LoaderAssetType.Json:
return e;

case t.LoaderAssetType.SpriteFrame:
if (e instanceof cc.Texture2D) {
var o = new cc.SpriteFrame();
return o.setTexture(e), o;
}
return e;

default:
return e;
}
}, o.prototype.loadDir = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i, a, s, l, d, h, p = this;
return c(this, function(f) {
switch (f.label) {
case 0:
return (o = this._bundles.get(t)) ? (r = o.getDirWithPath(e), i = 0, a = r.length, 
l = function() {
return u(p, void 0, void 0, function() {
var e;
return c(this, function(n) {
switch (n.label) {
case 0:
e = function() {
var e;
return c(this, function(n) {
switch (n.label) {
case 0:
return (e = r[i++]) ? [ 4, new Promise(function(n) {
o.load(e.path, e.ctor, function(o) {
o && (null != s || (s = new Error("加载资源失败 [".concat(t, "/").concat(e.path, "]: ").concat(o.message)))), 
n();
});
}) ] : [ 2, "continue" ];

case 1:
return n.sent(), [ 2 ];
}
});
}, n.label = 1;

case 1:
return i < a && !s ? [ 5, e() ] : [ 3, 3 ];

case 2:
return n.sent(), [ 3, 1 ];

case 3:
return [ 2 ];
}
});
});
}, d = this._resolveConcurrency(n, 8), (h = 0 === d ? a : Math.min(d, a)) <= 0 ? [ 2 ] : [ 4, Promise.all(Array.from({
length: h
}, l)) ]) : [ 2, Promise.reject(new Error("特性未加载: ".concat(t))) ];

case 1:
if (f.sent(), s) throw s;
return this._markPreloaded(t, this._dirCacheKey(e)), [ 2 ];
}
});
});
}, o.prototype.preloadAsset = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i, a, s, l, u = this;
return c(this, function(c) {
switch (c.label) {
case 0:
return o = this.buildRemoteUrl(t, e), r = o.isRemote, i = o.resolvedPath, r ? [ 4, this._loadRemoteAsset(t, i, n) ] : [ 3, 2 ];

case 1:
return c.sent(), [ 2 ];

case 2:
if (a = this.assetCacheKey(e, n), this._isPreloaded(t, a)) return [ 2 ];
if (!(s = vi[n])) throw new Error("不支持的资源类型: ".concat(n));
return [ 4, this._loadBundleWithMeta(t) ];

case 3:
return l = c.sent().bundle, [ 2, new Promise(function(n, o) {
l.preload(e, s, function(r) {
r ? o(new Error("预加载资源失败 [".concat(t, "/").concat(e, "]: ").concat(r.message))) : (u._markPreloaded(t, a), 
n());
});
}) ];
}
});
});
}, o.prototype.preloadDir = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r, i, a, s;
return c(this, function(l) {
switch (l.label) {
case 0:
return o = this._dirCacheKey(e), this._isPreloaded(t, o) ? [ 2 ] : [ 4, this._loadBundleWithMeta(t) ];

case 1:
return r = l.sent().bundle, i = "".concat(t, "/").concat(e), 0 !== (a = this._resolveConcurrency(n, -4)) ? [ 3, 3 ] : [ 4, this._preloadDirNative(r, e, i) ];

case 2:
return l.sent(), [ 3, 5 ];

case 3:
return s = r.getDirWithPath(e), [ 4, this._preloadWithConcurrency(r, s, a, i) ];

case 4:
l.sent(), l.label = 5;

case 5:
return this._markPreloaded(t, o), [ 2 ];
}
});
});
}, o.prototype._resolveConcurrency = function(t, e) {
var n = null != t ? t : e;
return 0 === n ? 0 : n > 0 ? n : this.universe.host.isLowEndDevice() ? -n : 0;
}, o.prototype._preloadDirNative = function(t, e, n) {
return new Promise(function(o, r) {
t.preloadDir(e, function(t) {
t ? r(new Error("预加载目录失败 [".concat(n, "]: ").concat(t.message))) : o();
});
});
}, o.prototype._preloadWithConcurrency = function(t, e, n, o) {
return u(this, void 0, void 0, function() {
var r, i, a, s, l = this;
return c(this, function(d) {
switch (d.label) {
case 0:
return r = 0, i = e.length, s = function() {
return u(l, void 0, void 0, function() {
var n;
return c(this, function(s) {
switch (s.label) {
case 0:
n = function() {
var n;
return c(this, function(i) {
switch (i.label) {
case 0:
return n = e[r++], [ 4, new Promise(function(e) {
t.preload(n.path, n.ctor, function(t) {
t && (null != a || (a = new Error("预加载失败 [".concat(o, "/").concat(n.path, "]: ").concat(t.message)))), 
e();
});
}) ];

case 1:
return i.sent(), [ 2 ];
}
});
}, s.label = 1;

case 1:
return r < i && !a ? [ 5, n() ] : [ 3, 3 ];

case 2:
return s.sent(), [ 3, 1 ];

case 3:
return [ 2 ];
}
});
});
}, [ 4, Promise.all(Array.from({
length: n
}, s)) ];

case 1:
if (d.sent(), a) throw a;
return [ 2 ];
}
});
});
}, o;
}(yo), _i = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.playEffect = function(t, e, n) {
if (!t) return -1;
var o = cc.audioEngine.playEffect(t, n);
return cc.audioEngine.setVolume(o, e), o;
}, e.prototype.stopEffect = function(t) {
t >= 0 && cc.audioEngine.stopEffect(t);
}, e.prototype.setEffectsVolume = function(t) {
cc.audioEngine.setEffectsVolume(t);
}, e.prototype.stopAllEffects = function() {
cc.audioEngine.stopAllEffects();
}, e.prototype.playMusic = function(t, e, n) {
t && (cc.audioEngine.playMusic(t, e), cc.audioEngine.setMusicVolume(n));
}, e.prototype.stopMusic = function() {
cc.audioEngine.stopMusic();
}, e.prototype.pauseMusic = function() {
cc.audioEngine.pauseMusic();
}, e.prototype.resumeMusic = function() {
cc.audioEngine.resumeMusic();
}, e.prototype.setMusicVolume = function(t) {
cc.audioEngine.setMusicVolume(t);
}, e;
}(function() {}), gi = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.tryGetNativeModule = function(t) {
var e = window.jsb;
if (!(null == e ? void 0 : e.getNativeModule)) return null;
var n = e.getNativeModule(t);
return n && 0 !== Object.keys(n).length ? n : null;
}, o.prototype.loadWasmBinary = function(e) {
return u(this, void 0, void 0, function() {
return c(this, function(n) {
switch (n.label) {
case 0:
return [ 4, this.universe.asset.loadAsset(e.featureName, e.path, t.LoaderAssetType.Buffer) ];

case 1:
return [ 2, n.sent()._buffer ];
}
});
});
}, o;
}(function() {
function t(t) {
this.universe = t, this._modules = new Map();
}
return t.prototype.getModule = function(t) {
return u(this, void 0, void 0, function() {
var e, n, o, r, i;
return c(this, function(a) {
switch (a.label) {
case 0:
return (e = this._modules.get(t.moduleName)) ? [ 2, e ] : (n = this.tryGetNativeModule(t.moduleName)) ? (this._modules.set(t.moduleName, n), 
[ 2, n ]) : [ 4, this.loadWasmBinary(t) ];

case 1:
if (o = a.sent(), !t.emscriptenInit) return [ 3, 6 ];
a.label = 2;

case 2:
return a.trys.push([ 2, 4, , 5 ]), [ 4, t.emscriptenInit({
wasmBinary: o
}) ];

case 3:
return r = a.sent(), [ 3, 5 ];

case 4:
return a.sent(), r = {}, [ 3, 5 ];

case 5:
return [ 3, 9 ];

case 6:
return a.trys.push([ 6, 8, , 9 ]), [ 4, WebAssembly.instantiate(o) ];

case 7:
return i = a.sent(), r = i.instance.exports, [ 3, 9 ];

case 8:
return a.sent(), r = {}, [ 3, 9 ];

case 9:
return this._modules.set(t.moduleName, r), [ 2, r ];
}
});
});
}, t;
}()), Ai = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.restartApplication = function() {
cc.sys.isBrowser ? location.reload() : cc.game.restart();
}, e;
}(function() {});
function Ci(t) {
return Boolean(t) && t.ready && !t.isPaused;
}
var Ri = function() {
function t(t) {
this.storageDataStore = new Map(), this.configDataStore = new Map(), this._worlds = new Map(), 
this._mainWorld = null, this._worldInstanceMaps = new Map(), this._worldLogicSubscribers = new Map(), 
this._worldRootNodes = new Map(), this.fieldWatchers = new Map(), this._onReady = null, 
this._onLoadProgress = null, this._onLoadError = null, this.disableSaveStorage = !1;
var e = t.mainWorldId, n = t.universeFeatureList, o = t.remoteBundleUrl, r = t.remoteAssetUrl, i = t.preRelease, a = t.onReady, s = t.host, l = t.initialWidth, u = void 0 === l ? 0 : l, c = t.initialHeight, d = void 0 === c ? 0 : c, h = t.onLoadProgress, p = t.onLoadError, f = t.layerMapping, m = e;
this.layerMapping = new po(f), this._onReady = a, this._onLoadProgress = null != h ? h : null, 
this._onLoadError = null != p ? p : null, this.featureResolver = new S(n), this.render = new ci(this), 
this.storage = new di(), this.asset = new yi(this), this.audio = new _i(), this.native = new gi(this), 
this.runtime = new Ai(), this.host = s, this.host.universe = this, o && this.asset.setRemoteBundleUrl(o), 
r && this.asset.setRemoteAssetUrl(r), i && this.asset.setPreRelease(i), this._createMainWorld(m, u, d);
}
return t.create = function(e) {
return new t(e);
}, t.prototype.forEachWorld = function(t) {
var e, n;
try {
for (var o = d(this._worlds.values()), r = o.next(); !r.done; r = o.next()) t(r.value);
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, t.prototype.getWorldRenderTimeScale = function(t) {
var e, n;
return null !== (n = null === (e = this._worlds.get(t)) || void 0 === e ? void 0 : e.renderTimeScale) && void 0 !== n ? n : 1;
}, t.prototype.applyWorldRenderTimeScale = function(t) {
var e = this.getWorldRenderTimeScale(t), n = this._worldInstanceMaps.get(t);
if (n) for (var o in n) {
var r = n[Number(o)];
if (r) for (var i = r.nodes, a = 0; a < i.length; a++) i[a].applyWorldTimeScale(e);
}
}, t.prototype._createMainWorld = function(t, e, n) {
var o, r, i = this;
this._mainWorld = this._createWorld({
worldId: t,
worldPath: t,
randomSeed: 0,
parentWorld: null,
entityInParent: 0,
initialWidth: e,
initialHeight: n,
multiTouch: !1,
onLoadProgress: null !== (o = this._onLoadProgress) && void 0 !== o ? o : void 0,
onLoadError: null !== (r = this._onLoadError) && void 0 !== r ? r : void 0
}, function() {
var t;
i.host.setMainWorld(i._mainWorld), null === (t = i._onReady) || void 0 === t || t.call(i);
});
}, t.prototype._getInputAtomInWorld = function(t, e) {
var n = this._worlds.get(t);
if (Ci(n)) return n.getAtomIns(e);
}, t.prototype.handlePointerEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, un);
if (e) {
var n = e.data;
n.x = t.x, n.y = t.y, n.dx = t.dx, n.dy = t.dy, n.touchId = t.touchId, n.localX = t.localX, 
n.localY = t.localY, n.multiTouchs = t.multiTouchs, e.emit(t.eid);
}
}, t.prototype.handleScrollEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, pn);
if (e) {
var n = e.data;
n.contentX = t.contentX, n.contentY = t.contentY, e.emit(t.eid);
}
}, t.prototype.handleSizeInputEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, fn);
if (e) {
var n = e.data;
n.width = t.width, n.height = t.height, e.emit(t.eid);
}
}, t.prototype.handlePositionInputEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, mn);
if (e) {
var n = e.data;
n.x = t.x, n.y = t.y, e.emit(t.eid);
}
}, t.prototype.handleRichTextClickEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, Un);
e && (e.data.param = t.param);
}, t.prototype.handleEditBoxEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, vn);
e && (e.data.text = t.text, e.emit(t.eid));
}, t.prototype.handleSpineFrameEvent = function(t) {
var e = this._getInputAtomInWorld(t.worldId, yn);
e && (e.data.frameEventName = t.frameEventName, e.emit(t.eid));
}, t.prototype.handleKeyboardEvent = function(t, e) {
var n, o;
try {
for (var r = d(this._worlds.values()), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
if (Ci(a)) {
var s = a.getAtomIns(cn), l = s.data;
l.keyCode = t, l.isDown = e, s.emit();
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (n) throw n.error;
}
}
}, t.prototype.handleWindowResize = function(t, e) {
var n = this._mainWorld;
if (null == n ? void 0 : n.ready) {
var o = n.getAtomIns(dn), r = o.data.width, i = o.data.height;
r === t && i === e || (o.data.width = t, o.data.height = e, o.emit());
}
}, t.prototype.getRootWindowSize = function() {
var t = this._mainWorld;
return (null == t ? void 0 : t.ready) ? this._getRootWindowSize(t) : {
width: 0,
height: 0
};
}, t.prototype.createRootNode = function(t, e) {
return this._rootNode = this.render.createRootNode(t, e), this._worldRootNodes.set(this._mainWorld.config.worldId, this._rootNode), 
this._rootNode;
}, t.prototype.onFieldWrite = function(t, e, n) {
var o, r, i, a, s = "".concat(t, ":").concat(e.join(".")), l = this.fieldWatchers.get(s);
if (l) try {
for (var u = d(l), c = u.next(); !c.done; c = u.next()) {
var h = c.value, p = h.instance;
if ((void 0 === n || p.eid === n) && !(A = p.renderAtom.atomWorld).disposed) {
var f = p._dirtyPreciseOps;
if (f) {
var m = p.renderAtom.atomName, v = 0 === f.size;
if (!v) {
var y = A.dirtyEntityComponents.get(p.eid);
v = !(null == y ? void 0 : y.has(m));
}
v && A.markEntityComponentDirty(p.eid, m), f.add(h.opIndex);
}
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
c && !c.done && (r = u.return) && r.call(u);
} finally {
if (o) throw o.error;
}
}
if ("storage" === e[0]) try {
for (var _ = d(this._worlds.values()), g = _.next(); !g.done; g = _.next()) {
var A;
!(A = g.value).disposed && A.hasAtomIns(t) && A.markStorageDirty(t);
}
} catch (t) {
i = {
error: t
};
} finally {
try {
g && !g.done && (a = _.return) && a.call(_);
} finally {
if (i) throw i.error;
}
}
}, t.prototype.update = function(t) {
var e, n;
try {
for (var o = d(this._worlds.values()), r = o.next(); !r.done; r = o.next()) {
var i = r.value;
if (i.ready && !i.disposed) {
var a = we(i);
i.isPaused || i.worldUpdate(t), this._rootNode && (this._processWorldChanges(i), 
this._syncWorldRenderData(i)), a && !a.disposed ? we(a) : Fe(i);
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, t.prototype.switchInstanceEid = function(t, e) {
var n, o;
if (t.eid !== e) {
t.eid = e;
try {
for (var r = d(t.nodes), i = r.next(); !i.done; i = r.next()) i.value.eid = e;
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (n) throw n.error;
}
}
t.renderAtom.refreshInstance(t, e);
}
}, t.prototype._createWorld = function(t, e) {
var n = new to(this), o = t.worldId;
return n.initFromConfig(t), this._worldInstanceMaps.set(o, {}), this._worldLogicSubscribers.set(o, new Map()), 
this._worlds.set(o, n), n.registerFeatures(e), n;
}, t.prototype._processWorldChanges = function(t) {
var e, n, o = t.worldChanges;
if (0 !== o.length) {
var r = this._worldInstanceMaps.get(t.config.worldId);
try {
for (var i = d(o), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
switch (s.type) {
case rn.RenderCreate:
this._createRenderInstance(t, r, s.eid, s.domainName);
break;

case rn.RenderDestroy:
this._destroyRenderInstance(t, r, s.eid);
break;

case rn.RelationAdd:
s.relationName === En && this._addChild(t, r, s.source, s.target);
break;

case rn.RelationRemove:
if (s.relationName === En) {
var l = t.getAtomIns(En);
re(t.ecsWorld, s.target) && l.getParent(s.target) || (l.mountSlots.delete(s.target), 
this._removeChild(r, s.target));
}
break;

case rn.WorldCreate:
this._worldCreate(t, s.eid);
break;

case rn.WorldDestroy:
this._worldDestroy(t, s.eid);
break;

case rn.WorldRestart:
this._worldRestart(t, s.eid);
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
o.length = 0;
}
}, t.prototype._getRootWindowSize = function(t) {
for (var e = t; e.config.parentWorld; ) e = e.config.parentWorld;
if (e.disposed || !e.hasAtomIns(dn)) return {
width: 0,
height: 0
};
var n = e.getAtomIns(dn);
return {
width: n.data.width,
height: n.data.height
};
}, t.prototype._worldCreate = function(t, e) {
var n = this, o = t.getAtomIns(sn), r = 0 === o.box.width[e] && 0 === o.box.height[e], i = this._getRootWindowSize(t);
r && (o.box.width.set(e, i.width), o.box.height.set(e, i.height));
var a = t.resolveChildWorldConfig(e);
if (a) {
var s = this._worldInstanceMaps.get(t.config.worldId);
if ((null == s ? void 0 : s[e]) && (this._worldRootNodes.set(a.worldId, s[e].rootNode), 
r)) {
var l = s[e];
l.renderAtom.refreshInstance(l, e);
}
var u = this._createWorld(a, function() {
var e = n._getRootWindowSize(t), o = u.getAtomIns(dn);
o.data.width = e.width, o.data.height = e.height, o.emit(u.rootEid);
});
u.autoResizeBox = r, t.addChildWorld(e, u);
}
}, t.prototype.onContextRestore = function() {
var t, e;
try {
for (var n = d(this._worldInstanceMaps.values()), o = n.next(); !o.done; o = n.next()) {
var r = o.value;
for (var i in r) {
var a = r[i];
a && a.renderAtom.onContextRestore(a);
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
o && !o.done && (e = n.return) && e.call(n);
} finally {
if (t) throw t.error;
}
}
}, t.prototype.destroyWorldRender = function(t) {
var e = t.config.worldId, n = this._worldInstanceMaps.get(e);
if (n) for (var o in n) {
var r = n[Number(o)];
r && r.renderAtom.destroyRender(r);
}
this._worldInstanceMaps.delete(e), this._worldLogicSubscribers.delete(e), this._worldRootNodes.delete(e);
}, t.prototype._worldDestroy = function(t, e) {
var n = t.getChildWorld(e);
n && (this._destroyWorldTree(n), t.removeChildWorld(e));
}, t.prototype._destroyWorldTree = function(t) {
var e, n, o = [];
t.forEachChildWorld(function(t, e) {
o.push(e);
});
try {
for (var r = d(o), i = r.next(); !i.done; i = r.next()) {
var a = i.value, s = t.getChildWorld(a);
s && this._destroyWorldTree(s);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
this._unmountChildWorldRoot(t), t.dispose(), this._worlds.delete(t.config.worldId);
}, t.prototype._worldRestart = function(t, e) {
var n = this, o = t.getChildWorld(e);
if (o && o.ready) {
var r = o.config.worldId, i = t.resolveChildWorldConfig(e);
if (i) {
o.isPaused = !0;
var a = o.autoResizeBox;
o.config.parentWorld && this.render.setMultiTouch(o.prevMultiTouch);
var s = this._worldInstanceMaps.get(r), l = new Map(this.featureResolver.getFeatureSet(r));
this._worlds.delete(r), this._worldInstanceMaps.delete(r), this._worldLogicSubscribers.delete(r);
var u = this._createWorld(i, function() {
var e, r, i = [];
o.forEachChildWorld(function(t, e) {
i.push(e);
});
try {
for (var a = d(i), c = a.next(); !c.done; c = a.next()) {
var h = c.value, p = o.getChildWorld(h);
p && n._destroyWorldTree(p);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
c && !c.done && (r = a.return) && r.call(a);
} finally {
if (e) throw e.error;
}
}
if (s) for (var f in s) {
var m = s[Number(f)];
m && m.renderAtom.destroyRender(m);
}
l.size > 0 && n.asset.releaseFeatures(l), n.host.clearAdRequestWorld(o), o.universe = null, 
o.dispose();
var v = n._getRootWindowSize(t), y = u.getAtomIns(dn);
y.data.width = v.width, y.data.height = v.height, y.emit(u.rootEid);
});
u.autoResizeBox = a, t.removeChildWorld(e), t.addChildWorld(e, u);
}
}
}, t.prototype.restartWorld = function(t) {
var e = this._worlds.get(t);
if (e) {
var n = e.config.parentWorld;
n && n.markWorldRestart(e.config.entityInParent);
}
}, t.prototype._unmountChildWorldRoot = function(t) {
var e = this._worldInstanceMaps.get(t.config.worldId), n = null == e ? void 0 : e[t.rootEid];
n && n.rootNode.removeFromParent();
}, t.prototype._createRenderInstance = function(t, e, n, o) {
var i, a;
if (re(t.ecsWorld, n)) if (e[n]) ; else {
var s = t.getAtomIns(o).renderVariantChain;
if (s) {
var l = s.resolve();
if (l) {
var u = l.createRender(this.render, n), c = this._worldLogicSubscribers.get(t.config.worldId);
try {
for (var h = d(l.getLogicDependencies()), p = h.next(); !p.done; p = h.next()) {
var f = p.value, m = c.get(f);
m || (m = new Set(), c.set(f, m)), m.add(n);
}
} catch (t) {
i = {
error: t
};
} finally {
try {
p && !p.done && (a = h.return) && a.call(h);
} finally {
if (i) throw i.error;
}
}
if (e[n] = u, n === t.rootEid) {
var v = this._worldRootNodes.get(t.config.worldId);
if (!v) throw new Error("[AtomEngine] world root node missing | worldId=".concat(t.config.worldId, " | rootEid=").concat(String(n)));
v.addChild(u.rootNode);
}
} else y(r.DomainRenderNoMatch, {
domain: o
});
} else y(r.DomainRenderNotRegistered, {
domain: o
});
}
}, t.prototype._destroyRenderInstance = function(t, e, n) {
var o, r, i = e[n];
if (i) {
var a = this._worldLogicSubscribers.get(t.config.worldId);
try {
for (var s = d(i.renderAtom.getLogicDependencies()), l = s.next(); !l.done; l = s.next()) {
var u = l.value, c = a.get(u);
c && c.delete(n);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
l && !l.done && (r = s.return) && r.call(s);
} finally {
if (o) throw o.error;
}
}
i.renderAtom.destroyRender(i), delete e[n];
}
}, t.prototype._addChild = function(t, e, n, o) {
var r = e[o];
if (r) {
var i = t.getAtomIns(En);
if (re(t.ecsWorld, o) && i.getParent(o) === n) {
var a, s = i.mountSlots.get(o);
if (s) {
var l = e[n];
a = null == l ? void 0 : l.renderAtom.getSlotNode(l, s);
}
null != a || (a = this._getParentNode(t, e, n)), r.rootNode.getParent() !== a && (r.rootNode.removeFromParent(), 
a.addChild(r.rootNode));
}
}
}, t.prototype._removeChild = function(t, e) {
var n = t[e];
n && n.rootNode.removeFromParent();
}, t.prototype._getParentNode = function(t, e, n) {
var o, r = e[n];
return r ? r.rootNode : null !== (o = this._worldRootNodes.get(t.config.worldId)) && void 0 !== o ? o : this._rootNode;
}, t.prototype.computeReparentLocalPosition = function(t, e, n, o) {
var r, i, a = this._worldInstanceMaps.get(t);
if (a) {
var s = a[e];
if (s) {
var l, u = s.rootNode.getWorldPosition(), c = a[n];
return o && c && (l = c.renderAtom.getSlotNode(c, o)), null != l || (l = null !== (i = null !== (r = null == c ? void 0 : c.rootNode) && void 0 !== r ? r : this._worldRootNodes.get(t)) && void 0 !== i ? i : this._rootNode), 
l.convertToLocalSpace(u);
}
}
}, t.prototype.getSlotData = function(t, e, n) {
var o, r, i = this._worldInstanceMaps.get(t), a = null == i ? void 0 : i[e];
if (a) r = a.renderAtom; else {
var s = this._worlds.get(t);
if (!s) return;
var l = s.getAtomIns(Dn).atomState.name[e];
if (!l) return;
if (!(r = null === (o = s.getAtomIns(l).renderVariantChain) || void 0 === o ? void 0 : o.resolve())) return;
}
var u = r.findSlotPath(n);
if (u) return {
path: u,
propsMap: r.atomState
};
}, t.prototype._syncWorldRenderData = function(t) {
var e, n, o = this._worldInstanceMaps.get(t.config.worldId), r = this._worldLogicSubscribers.get(t.config.worldId), i = t.updateSignal.data.framecount;
this._syncChildWorldBoxFromWindowSize(t, o, i);
var a = t.expandEntityDirtyAtoms(r);
try {
for (var s = d(a), l = s.next(); !l.done; l = s.next()) {
var u = h(l.value, 2), c = u[0], p = u[1], f = o[c];
f && f._lastRefreshFrame !== i && (f._lastRefreshFrame = i, f.renderAtom.refreshInstance(f, c), 
p.has(xn) && this._syncChildWorldWindowSize(t, c));
}
} catch (t) {
e = {
error: t
};
} finally {
try {
l && !l.done && (n = s.return) && n.call(s);
} finally {
if (e) throw e.error;
}
}
t.dirtyEntityComponents.clear(), t.expandedEntityDirtyAtomsCache = null;
}, t.prototype._syncChildWorldBoxFromWindowSize = function(t, e, n) {
var o = this._getRootWindowSize(t), r = o.width, i = o.height, a = t.getAtomIns(sn);
t.forEachChildWorld(function(t, o) {
if (t.ready) {
var s = a.box.width[o], l = a.box.height[o], u = t.getAtomIns(dn);
if (u.data.width === r && u.data.height === i || (u.data.width = r, u.data.height = i, 
u.emit(t.rootEid)), (s !== r || l !== i) && t.autoResizeBox) {
a.box.width.set(o, r), a.box.height.set(o, i);
var c = null == e ? void 0 : e[o];
c && c._lastRefreshFrame !== n && (c._lastRefreshFrame = n, c.renderAtom.refreshInstance(c, o));
}
}
});
}, t.prototype._syncChildWorldWindowSize = function(t, e) {
var n = t.getChildWorld(e);
if (null == n ? void 0 : n.ready) {
var o = t.getAtomIns(sn), r = o.box.width[e], i = o.box.height[e], a = this._getRootWindowSize(t);
r === a.width && i === a.height || n.autoResizeBox && (n.autoResizeBox = !1);
}
}, t.prototype.saveAllStorage = function(t) {
var e, n;
if (!this.disableSaveStorage) try {
for (var o = d(t), r = o.next(); !r.done; r = o.next()) {
var i = r.value, a = this.storageDataStore.get(i);
void 0 !== a && this.storage.saveStorage(i, a);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, t.prototype.forceSaveAllStorage = function() {
this.storageDataStore.size > 0 && this.saveAllStorage(new Set(this.storageDataStore.keys()));
}, t.prototype.broadcastWorldInput = function(t) {
var e, n, o = t.atomWorld, r = t.atomName, i = JSON.stringify(t.atomState);
try {
for (var a = d(this._worlds.values()), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
l !== o && l.ready && l.hasAtomIns(r) && l.getAtomIns(r).receive(JSON.parse(i));
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
}, t.prototype.sendToParentWorldInput = function(t) {
var e = t.atomWorld, n = e.config.parentWorld;
if (n) {
var o = t.atomName;
if (n.hasAtomIns(o)) {
var r = JSON.parse(JSON.stringify(t.atomState));
n.getAtomIns(o).receive(r, e.config.entityInParent);
}
}
}, t.prototype.emitInputToAllWorlds = function(t, e) {
var n, o;
try {
for (var r = d(this._worlds.values()), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
if (a.ready && !a.disposed) if (a.isPaused) ; else if (a.hasAtomIns(t)) {
var s = a.getAtomIns(t);
Object.assign(s.data, e), s.emit();
}
}
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (n) throw n.error;
}
}
}, t.prototype.dispose = function() {
var t, e, n, o, r, i;
try {
this.forceSaveAllStorage(), this.audio.stopAllEffects(), this.audio.stopMusic();
var a = [];
try {
for (var s = d(this._worlds.values()), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
a.push(u);
}
} catch (e) {
t = {
error: e
};
} finally {
try {
l && !l.done && (e = s.return) && e.call(s);
} finally {
if (t) throw t.error;
}
}
var c = function(t) {
for (var e = 0, n = t.config.parentWorld; n; ) e++, n = n.config.parentWorld;
return e;
};
a.sort(function(t, e) {
return c(e) - c(t);
}), this.asset.forceReleaseAll();
try {
for (var f = d(a), m = f.next(); !m.done; m = f.next()) {
var v = (u = m.value).config.worldId, y = this._worldInstanceMaps.get(v);
if (y) for (var _ in y) {
var g = y[Number(_)];
g && g.renderAtom.destroyRender(g);
}
u.dispose();
}
} catch (t) {
n = {
error: t
};
} finally {
try {
m && !m.done && (o = f.return) && o.call(f);
} finally {
if (n) throw n.error;
}
}
this._rootNode && (this.render.destroyRootNode(), this._rootNode = null), this._worlds.clear(), 
this._mainWorld = null, this._worldInstanceMaps.clear(), this._worldLogicSubscribers.clear(), 
this._worldRootNodes.clear(), this.fieldWatchers.clear(), this.storageDataStore.clear(), 
this.configDataStore.clear(), this._onReady = null;
} catch (t) {
var A = p([], h(this._worlds.keys()), !1), C = null !== (i = null === (r = this._mainWorld) || void 0 === r ? void 0 : r.config.worldId) && void 0 !== i ? i : "cleared", R = p([], h(this._worldInstanceMaps.entries()), !1).map(function(t) {
var e = h(t, 2), n = e[0], o = e[1];
return "".concat(n, ":").concat(Object.keys(o).length);
}).join(",");
"remainingWorlds=[".concat(A.join(","), "], mainWorld=").concat(C, ", rootNodeAlive=").concat(Boolean(this._rootNode), ", renderInstances={").concat(R, "}");
}
}, t;
}();
function Si(t, e) {
var n, o, r = {};
try {
for (var i = d(Object.keys(e)), a = i.next(); !a.done; a = i.next()) {
var s = a.value, l = [];
Object.defineProperty(l, "set", {
value: function(t, e) {
this[t] = e;
},
writable: !0,
enumerable: !1,
configurable: !0
}), r[s] = l;
}
} catch (t) {
n = {
error: t
};
} finally {
try {
a && !a.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return Ft(t, r), r;
}
function Ti(t, e, n, o) {
for (var r in o) {
var i = o[r];
n[r][e] = Array.isArray(i) || i instanceof Uint8Array ? i.slice() : i;
}
It(t, e, n);
}
var bi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "EntityComponentAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
this.defaultValues = this.defineComponent(), this.atomState = function(t, e) {
var n, o, r = {};
try {
for (var i = d(Object.keys(e)), a = i.next(); !a.done; a = i.next()) {
var s = a.value, l = [];
Object.defineProperty(l, "set", {
value: function(t, e) {
this[t] = e;
},
writable: !0,
enumerable: !1,
configurable: !0
}), r[s] = l;
}
} catch (t) {
n = {
error: t
};
} finally {
try {
a && !a.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return Ft(t, r), r;
}(this.atomWorld.ecsWorld, this.defaultValues), this.atomWorld.atomSnapshots[this.atomName] = this.atomState;
}, e[ge] = !0, e;
}(Ae), wi = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e._tagComponent = null, e._tagQuery = null, e._componentQuery = null, e._componentQueryTerms = null, 
e._allComponentAtoms = null, e._domainOf = null, e.renderVariantChain = null, e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "EntityDomainAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype._createStructure = function() {
if (this._domainOf = this.atomWorld.getAtomIns(Dn).atomState, this._tagComponent = {}, 
Ft(this.atomWorld.ecsWorld, this._tagComponent), this._tagQuery = _t(this.atomWorld.ecsWorld, [ this._tagComponent ]), 
this._allComponentAtoms = [], this._collectAllComponentAtoms(this._allComponentAtoms, new Set()), 
this._allComponentAtoms.length > 0) {
var t = this._allComponentAtoms.map(function(t) {
return t.atomState;
});
this._componentQueryTerms = t, this._componentQuery = _t(this.atomWorld.ecsWorld, t);
} else this._componentQuery = this._tagQuery;
this.atomState = this._tagComponent;
}, e.prototype.onReady = function() {
this._createStructure();
}, e.prototype.dispose = function() {
var e = this._componentQuery === this._tagQuery;
this._tagQuery && (wt(this.atomWorld.ecsWorld, [ this._tagComponent ]), this._tagQuery = null), 
this._componentQuery && !e && wt(this.atomWorld.ecsWorld, this._componentQueryTerms), 
this._componentQuery = null, this._tagComponent = null, this._allComponentAtoms = null, 
this._componentQueryTerms = null, t.prototype.dispose.call(this);
}, e.prototype.create = function() {
var t = this.atomWorld, e = function(t) {
var e = t[F], n = function(t) {
if (t.aliveCount < t.dense.length) {
var e = t.dense[t.aliveCount], n = e;
return t.sparse[n] = t.aliveCount, t.aliveCount++, e;
}
var o = ++t.maxId;
return t.dense.push(o), t.sparse[o] = t.aliveCount, t.aliveCount++, o;
}(e.entityIndex);
return e.notQueries.forEach(function(e) {
Ct(t, e, n) && Rt(e, n);
}), e.entityComponents.set(n, new Set()), n;
}(t.ecsWorld);
return this._domainOf.name[e] = this.atomName, this._applyToEntity(e), this.renderVariantChain && t.markRenderCreate(e, this.atomName), 
this.atomName === sn && t.markWorldCreate(e), e;
}, e.prototype.destroy = function(t) {
var e = this.atomWorld;
this.has(t) || y(r.EntityDestroyDenied, {
entity: String(t),
owner: this._domainOf.name[t] || "unknown"
});
var n = this._domainOf.name[t], o = e.getAtomIns(n);
ne(e.ecsWorld, t), e.stopTween(t), o.renderVariantChain && e.markRenderDestroy(t), 
n === sn && e.markWorldDestroy(t);
}, e.prototype.collect = function() {
var t, e;
return this.atomWorld.isSignalEntityDomain(this.atomName) && y(r.WarnSignalDomainCollect, {
domain: this.atomName,
source: null !== (t = this.atomWorld.currentExecutingLogicAtom) && void 0 !== t ? t : "unknown",
method: "collect",
signalDomain: null !== (e = this.atomWorld.currentSignalEntityDomain) && void 0 !== e ? e : "unknown"
}), Tt(this.atomWorld.ecsWorld), this._tagQuery.dense;
}, e.prototype.has = function(t) {
return Tt(this.atomWorld.ecsWorld), this._tagQuery.has(t);
}, e.prototype.count = function() {
return Tt(this.atomWorld.ecsWorld), this._tagQuery.dense.length;
}, e.prototype.collectByComponent = function() {
var t, e;
return this.atomWorld.isSignalEntityDomain(this.atomName) && y(r.WarnSignalDomainCollect, {
domain: this.atomName,
source: null !== (t = this.atomWorld.currentExecutingLogicAtom) && void 0 !== t ? t : "unknown",
method: "collectByComponent",
signalDomain: null !== (e = this.atomWorld.currentSignalEntityDomain) && void 0 !== e ? e : "unknown"
}), Tt(this.atomWorld.ecsWorld), this._componentQuery.dense;
}, e.prototype.hasByComponent = function(t) {
return Tt(this.atomWorld.ecsWorld), this._componentQuery.has(t);
}, e.prototype.countByComponent = function() {
return Tt(this.atomWorld.ecsWorld), this._componentQuery.dense.length;
}, e.prototype._collectAllComponentAtoms = function(t, e) {
var n, o;
if (!e.has(this.atomName)) {
e.add(this.atomName);
try {
for (var r = d(this.getDependencies()), i = r.next(); !i.done; i = r.next()) {
var a = i.value, s = this.atomWorld.getAtomIns(a);
this.isDepType(a, "EntityComponentAtom") ? t.push(s) : this.isDepType(a, "EntityDomainAtom") && s._collectAllComponentAtoms(t, e);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
i && !i.done && (o = r.return) && o.call(r);
} finally {
if (n) throw n.error;
}
}
}
}, e.prototype._applyToEntity = function(t) {
var e, n, o = this.atomWorld.ecsWorld;
It(o, t, this._tagComponent);
try {
for (var r = d(this._allComponentAtoms), i = r.next(); !i.done; i = r.next()) {
var a = i.value, s = a.atomState;
Et(o, t, s) || Ti(o, t, s, a.defaultValues);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
this._initLogicEntityData(t);
}, e.prototype._initLogicEntityData = function(t) {
var e, n, o = this.atomWorld.domainToLogicMap.get(this.atomName);
if (o) {
var r = this.atomWorld.ecsWorld;
try {
for (var i = d(o), a = i.next(); !a.done; a = i.next()) {
var s = a.value, l = this.atomWorld.getAtomIns(s), u = l.entityDataDefaults;
u && l.atomState.entity && Ti(r, t, l.atomState.entity, u);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
}
}, e[ge] = !0, e;
}(Ae), Fi = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e._ctx = null, e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "EntityRelationAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.defineRelation = function() {
return {
exclusive: !0,
autoRemoveSubject: !1
};
}, e.prototype._createRelation = function() {
var t = this.defineRelation(), e = {
world: this.atomWorld
}, n = this.atomName;
this._ctx = e, this.atomState = function() {
for (var t, e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
if (1 === e.length && "object" == typeof e[0]) {
var o = e[0], r = o.store, i = o.exclusive, a = o.autoRemoveSubject, s = o.onTargetRemoved, l = o.onAdd, u = o.onRemove;
return [ r && (t = r, function(e) {
return e[P].initStore = t, e;
}), i && L, a && G, s && B(s), l && k(l), u && V(u) ].filter(Boolean).reduce(function(t, e) {
return e(t);
}, O());
}
return e.reduce(function(t, e) {
return e(t);
}, O());
}(i(i({}, t), {
onAdd: function(t, o) {
var r;
null === (r = e.world) || void 0 === r || r.markRelationChange(n, o, t, !0);
},
onRemove: function(t, o) {
var r;
null === (r = e.world) || void 0 === r || r.markRelationChange(n, o, t, !1);
},
onTargetRemoved: t.autoRemoveSubject ? function(t) {
var n = e.world;
if (n) {
var o = n.getAtomIns(Dn).atomState.name[t];
if (o) {
var r = n.getAtomIns(o);
(null == r ? void 0 : r.renderVariantChain) && n.markRenderDestroy(t), o === sn && n.markWorldDestroy(t);
}
n.stopTween(t);
}
} : void 0
}));
}, e.prototype.onReady = function() {
this._createRelation();
}, e.prototype.dispose = function() {
this._ctx && (this._ctx.world = null), this._ctx = null, t.prototype.dispose.call(this);
}, e.prototype.set = function(t, e) {
return !(!e || !t) && It(this.atomWorld.ecsWorld, e, U(this.atomState, t));
}, e.prototype.remove = function(t, e) {
return te(this.atomWorld.ecsWorld, e, U(this.atomState, t)), !0;
}, e.prototype.getSource = function(t) {
return z(this.atomWorld.ecsWorld, t, this.atomState)[0];
}, e.prototype.getTargets = function(t) {
return At(this.atomWorld.ecsWorld, [ U(this.atomState, t) ]);
}, e.prototype.has = function(t, e) {
return void 0 !== e ? Et(this.atomWorld.ecsWorld, e, U(this.atomState, t)) : this.getTargets(t).length > 0;
}, e[ge] = !0, e;
}(Ae), Ei = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "DomainExtensionAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
var t, e, n, o, r = null === (n = this.constructor.__bindingMeta) || void 0 === n ? void 0 : n.attachToProperty;
if (r) {
var i = null === (o = this.constructor.__bindingMeta) || void 0 === o ? void 0 : o.propToAtom.get(r);
if (i) {
var a = this.atomWorld.getAtomIns(i);
try {
for (var s = d(this.getDependencies()), l = s.next(); !l.done; l = s.next()) {
var u = l.value;
if (this.isDepType(u, "EntityComponentAtom")) {
var c = this.atomWorld.getAtomIns(u);
a._allComponentAtoms.includes(c) || a._allComponentAtoms.push(c);
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
l && !l.done && (e = s.return) && e.call(s);
} finally {
if (t) throw t.error;
}
}
}
}
}, e[ge] = !0, e;
}(Ae), Ni = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.variantChain = null, e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "FunctionAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
if (this.atomState = this.defineFunction(), this.variantChain) for (var t = this.variantChain.getInstances(), e = 0; e < t.length; e++) {
var n = t[e].ready();
if (n) return this._readyVariantsAsync(n, t, e + 1);
}
}, e.prototype._readyVariantsAsync = function(t, e, n) {
return u(this, void 0, void 0, function() {
var o, r;
return c(this, function(i) {
switch (i.label) {
case 0:
return [ 4, t ];

case 1:
if (i.sent(), !this.atomWorld) return [ 2 ];
o = n, i.label = 2;

case 2:
return o < e.length ? (r = e[o].ready()) ? [ 4, r ] : [ 3, 4 ] : [ 3, 5 ];

case 3:
if (i.sent(), !this.atomWorld) return [ 2 ];
i.label = 4;

case 4:
return o++, [ 3, 2 ];

case 5:
return [ 2 ];
}
});
});
}, e[ge] = !0, e;
}(Ae), xi = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.variantChain = null, e._chain = null, e.entityDataDefaults = null, e.entityDataDomain = null, 
e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "LogicAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.defineStorageData = function() {
return null;
}, e.prototype.defineRuntimeData = function() {
return null;
}, e.prototype.defineEntityData = function() {
return null;
}, e.prototype.executeAll = function(t) {
var e, n, o, r;
if ("function" != typeof this.onExecute) throw new TypeError("[AtomEngine] this.onExecute is not a function." + "atomName=".concat(this.atomName) + "constructor=".concat(null === (e = this.constructor) || void 0 === e ? void 0 : e.name, " ") + "proto=".concat(null === (o = null === (n = Object.getPrototypeOf(this)) || void 0 === n ? void 0 : n.constructor) || void 0 === o ? void 0 : o.name, " ") + "onExecute=".concat(String(this.onExecute)));
for (var i = this.atomWorld.ecsWorld, a = null === (r = this.variantChain) || void 0 === r ? void 0 : r.resolve(), s = 0, l = t.length; s < l; s++) {
var u = t[s];
re(i, u) && (a ? a.atomState(u, this.atomState) : this.onExecute(u, this.atomState));
}
}, e.prototype.getChainRegistration = function() {
var t;
return null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.chainRegistration;
}, e.prototype.getEntityDataDomainName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.entityDataProperty;
return e ? this.getBoundAtomName(e) : null;
}, e.prototype.init = function(e, n) {
t.prototype.init.call(this, e, n), this._registerToChain();
var o = this.getEntityDataDomainName();
if (o) {
this.entityDataDomain = o;
var r = n.domainToLogicMap.get(o);
r || (r = [], n.domainToLogicMap.set(o, r)), r.push(e);
}
}, e.prototype.dispose = function() {
if (this._unregisterFromChain(), this.atomWorld.storageAtoms.delete(this.atomName), 
this.entityDataDomain) {
var e = this.atomWorld.domainToLogicMap.get(this.entityDataDomain);
if (e) {
var n = e.indexOf(this.atomName);
-1 !== n && e.splice(n, 1);
}
}
t.prototype.dispose.call(this);
}, e.prototype._registerToChain = function() {
var t = this.getChainRegistration();
if (t) {
var e = this.getBoundAtomName(t.ownerProperty);
if (e) {
var n = this.atomWorld.getAtomIns(e);
this._chain = n.registerToChain(this.atomName, t.chainType);
}
}
}, e.prototype._unregisterFromChain = function() {
var t = this.getChainRegistration();
if (t) {
var e = this.getBoundAtomName(t.ownerProperty);
e && this.atomWorld.getAtomIns(e).unregisterFromChain(this.atomName, t.chainType);
}
}, e.prototype._loadOrCreateStorage = function() {
var t = this.defineStorageData();
if (!t) return null;
var e = this.atomWorld.universe, n = e.storageDataStore.get(this.atomName);
if (void 0 === n) {
var o = e.storage.loadStorage(this.atomName);
n = null != o ? o : t, e.storageDataStore.set(this.atomName, n);
}
return this.atomWorld.storageAtoms.add(this.atomName), n;
}, e.prototype.onReady = function() {
var t = this._loadOrCreateStorage();
t && this._wrapStorageWithTracking(t, [ "storage" ]);
var e = null;
if (this.entityDataDomain) {
var n = this.defineEntityData();
this.entityDataDefaults = n, e = Si(this.atomWorld.ecsWorld, n);
}
this.atomState = {
runtime: this.defineRuntimeData(),
storage: t,
entity: e
}, null !== this.atomState.runtime && (this.atomWorld.atomSnapshots[this.atomName] = this.atomState.runtime);
}, e.prototype._wrapStorageWithTracking = function(t, e) {
for (var n in t) {
var o = t[n], r = p(p([], h(e), !1), [ n ], !1);
"function" == typeof o || n.startsWith("_") || (o && "object" == typeof o && !Array.isArray(o) ? this._wrapStorageWithTracking(o, r) : this._installStorageFieldInterceptor(t, n, r));
}
}, e.prototype._installStorageFieldInterceptor = function(t, e, n) {
var o = Object.getOwnPropertyDescriptor(t, e);
if (!(null == o ? void 0 : o.set) || !o.set.__isAtomInterceptor) {
var r = t[e], i = this.atomWorld.universe, a = this.atomName, s = function(t) {
r = t, i.onFieldWrite(a, n);
};
s.__isAtomInterceptor = !0, Object.defineProperty(t, e, {
get: function() {
return r;
},
set: s,
enumerable: !0,
configurable: !0
});
}
}, e.prototype.getTopologicalChain = function() {
return this._chain;
}, e[ge] = !0, e;
}(Ae), Ii = new Set([ "InputAtom", "OutputAtom", "WorldInputAtom" ]);
fe("LogicAtom", function(e) {
var n = e.constructor, o = n.__bindingMeta, i = e.getChainRegistration();
if (i || y(r.OnChainRequired, {
class: pe(n),
atom: e.atomName
}), i) {
var a = e.getBoundAtomName(i.ownerProperty);
if (a) {
var s = e.getDepAtomType(a);
Ii.has(s) && y(r.BoundaryBindingForbidden, {
class: pe(n),
boundaryType: s,
target: a
});
}
}
if ((null == o ? void 0 : o.routePhase) === t.RoutePhase.Filter && o.chainRegistration) {
var l = o.propToAtom.get(o.chainRegistration.ownerProperty);
l && e.atomWorld.getAtomIns(l).mode === t.RouteMode.Broadcast && y(r.BroadcastFilterForbidden, {
atom: e.atomName,
router: l
});
}
var u = Boolean(null == o ? void 0 : o.entityDataProperty);
u !== Object.getPrototypeOf(e).hasOwnProperty("defineEntityData") && y(r.EntityDataConfigInvalid, {
atom: e.atomName,
reason: u ? "@entityData 装饰器需要重写 defineEntityData() 方法" : "重写 defineEntityData() 需要配合 @entityData 装饰器指定挂载的域"
});
});
var Di, Mi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.getExtraDependencies = function() {
return [];
}, e.prototype.getTargetAtomName = function(t) {
var e = this._atomWorld.atomInstanceMap.get(t), n = e.constructor.__bindingMeta.variantSourceProperty;
return e.getBoundAtomName(n);
}, e.prototype.resolve = function() {
for (var t = this.getInstances(), e = 0, n = t.length; e < n; e++) {
var o = t[e];
if ("function" == typeof o.atomState && o.variantCondition()) return o;
}
return null;
}, e.prototype.topologicalSort = function() {
var e = t.prototype.topologicalSort.call(this);
return e.length, e;
}, e;
}(Ce), Wi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "VariantAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.variantCondition = function() {
return !0;
}, e.prototype.getVariantSourceAtomName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.variantSourceProperty;
return e ? this.getBoundAtomName(e) : void 0;
}, e.prototype.onReady = function() {
this.atomState = this.defineFunction();
}, e.prototype.init = function(e, n) {
t.prototype.init.call(this, e, n);
var o = this.getVariantSourceAtomName(), r = n.getAtomIns(o);
r.variantChain || (r.variantChain = new Mi(n)), r.variantChain.addAtom(e);
}, e.prototype.dispose = function() {
var e = this.getVariantSourceAtomName(), n = this.atomWorld.getAtomIns(e);
n.variantChain.removeAtom(this.atomName) && (n.variantChain = null), t.prototype.dispose.call(this);
}, e.prototype.getTopologicalChain = function() {
var t = this.getVariantSourceAtomName();
return t ? this.atomWorld.getAtomIns(t).variantChain : null;
}, e[ge] = !0, e;
}(Ae), Pi = function(t) {
function e(e) {
return t.call(this, e) || this;
}
return n(e, t), e.prototype.getExtraDependencies = function(t) {
return this._atomWorld.getAtomIns(t).getDependencies();
}, e.prototype.execute = function(t, e) {
if (0 !== this.atoms.length) {
this._atomWorld.currentSignalEntityDomain = e;
for (var n = this.getInstances(), o = 0, r = n.length; o < r; o++) {
var i = n[o];
this._atomWorld.currentExecutingLogicAtom = i.atomName, i.executeAll(t);
}
this._atomWorld.currentExecutingLogicAtom = null, this._atomWorld.currentSignalEntityDomain = null;
}
}, e;
}(Ce), Oi = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e._domain = null, e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "SignalAtom";
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "domain", {
get: function() {
var t, e;
if (!this._domain) {
var n = this.constructor.__bindingMeta;
try {
for (var o = d(n.propToAtom), r = o.next(); !r.done; r = o.next()) {
var i = h(r.value, 2), a = i[0], s = i[1];
if (this.isDepType(s, "EntityDomainAtom")) {
this._domain = this[a];
break;
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
r && !r.done && (e = o.return) && e.call(o);
} finally {
if (t) throw t.error;
}
}
}
return this._domain;
},
enumerable: !1,
configurable: !0
}), e.prototype.init = function(e, n) {
t.prototype.init.call(this, e, n), this.beginChain = new Pi(n), this.triggerChain = new Pi(n), 
this.endChain = new Pi(n);
}, e.prototype.trigger = function(t) {
if (0 !== t.length) {
var e = this.domain.atomName;
this.beginChain.execute(t, e), this.triggerChain.execute(t, e), this._propagateSuccessorSignals(t), 
this.endChain.execute(t, e);
}
}, e.prototype._propagateSuccessorSignals = function(t) {
var e, n, o = this.atomWorld.signalRouters.get(this.atomName);
if (o) {
var r = o.getInstances();
try {
for (var i = d(r), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
s.handleSignal({
fromRouterName: s.atomName,
signalName: s.to.atomName,
eidList: p([], h(t), !1)
});
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
}
}, e.prototype.registerToChain = function(t, e) {
var n = this.getChain(e);
return n && n.addAtom(t), n;
}, e.prototype.unregisterFromChain = function(t, e) {
var n = this.getChain(e);
return !!n && n.removeAtom(t);
}, e.prototype.getChain = function(t) {
switch (t) {
case "SignalStart":
return this.beginChain;

case "SignalTrigger":
return this.triggerChain;

case "SignalEnd":
return this.endChain;

default:
return null;
}
}, e[ge] = !0, e;
}(Ae), Li = function(t) {
function e(e, n, o) {
var r = t.call(this, e) || this;
return r._router = n, r._phase = o, r;
}
return n(e, t), e.prototype.getExtraDependencies = function(t) {
return this._atomWorld.getAtomIns(t).getDependencies();
}, e.prototype.execute = function(t) {
if (0 !== this.atoms.length) {
this._router.currentPhase = this._phase;
for (var e = this.getInstances(), n = 0, o = e.length; n < o; n++) {
var r = e[n];
this._atomWorld.currentExecutingLogicAtom = r.atomName, r.executeAll(t);
}
this._atomWorld.currentExecutingLogicAtom = null, this._router.currentPhase = null;
}
}, e;
}(Ce), Gi = function(t) {
function e(e) {
return t.call(this, e) || this;
}
return n(e, t), e.prototype.getExtraDependencies = function() {
return [];
}, e;
}(Ce), Bi = function(e) {
function o() {
var t = e.apply(this, p([], h(arguments), !1)) || this;
return t._signalVersion = 0, t.currentPhase = null, t._routerChain = null, t;
}
return n(o, e), Object.defineProperty(o, "atomType", {
get: function() {
return "SignalRouterAtom";
},
enumerable: !1,
configurable: !0
}), o.prototype.defineDecisionState = function() {
return {
receiveAction: t.ReceiveAction.Queue,
dispatchAction: t.DispatchAction.FireOnce,
filterAction: {},
transformedEidList: null
};
}, o.prototype.onReady = function() {
this.atomState = this.defineDecisionState();
}, o.prototype.getRouteFromAtomName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.routeFromProperty;
return e ? this.getBoundAtomName(e) : void 0;
}, o.prototype.getRouteToAtomName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.routeToProperty;
return e ? this.getBoundAtomName(e) : void 0;
}, o.prototype.init = function(n, o) {
var i, a, s, l, u;
e.prototype.init.call(this, n, o);
var c = this.getRouteFromAtomName(), h = this.getRouteToAtomName();
this.from = this.atomWorld.getAtomIns(c), this.to = this.atomWorld.getAtomIns(h), 
this.mode = null === (s = this.constructor.__bindingMeta) || void 0 === s ? void 0 : s.routeMode, 
this.receiveChain = new Li(o, this, t.RoutePhase.Receive), this.transformChain = new Li(o, this, t.RoutePhase.Transform), 
this.dispatchChain = new Li(o, this, t.RoutePhase.Dispatch), this.filterChain = new Li(o, this, t.RoutePhase.Filter);
var p = this.getDependencies();
if (p.length > 0) {
var f = "InputAtom" === this.from.atomType ? null : null === (l = this.from.domain) || void 0 === l ? void 0 : l.atomName, m = null === (u = this.to.domain) || void 0 === u ? void 0 : u.atomName;
try {
for (var v = d(p), _ = v.next(); !_.done; _ = v.next()) {
var g = _.value;
this.isDepType(g, "EntityDomainAtom") && (g !== f && g !== m || y(r.SignalDomainConflict, {
class: pe(this.constructor),
domain: g,
reason: "已通过 from/to 信号隐含域信息 (toSignalDomain: ".concat(m, ")")
}));
}
} catch (t) {
i = {
error: t
};
} finally {
try {
_ && !_.done && (a = v.return) && a.call(v);
} finally {
if (i) throw i.error;
}
}
}
if ("InputAtom" === this.from.atomType) {
var A = o.universe.featureResolver.getFeatureSet(o.config.worldId), C = this.getFeatureName();
if (!A.has(C) && C !== t.G_FAtom.FeatureName.Name) return;
}
var R = this.from.atomName, S = o.signalRouters.get(R);
S || (S = new Gi(o), o.signalRouters.set(R, S)), S.addAtom(n), this._routerChain = S;
}, o.prototype.dispose = function() {
var t = this.atomWorld, n = this.atomName;
this._routerChain && (this._routerChain.removeAtom(n) && t.signalRouters.delete(this.from.atomName), 
this._routerChain = null), t.pendingRouterSignals = t.pendingRouterSignals.filter(function(t) {
return t.fromRouterName !== n;
}), e.prototype.dispose.call(this);
}, o.prototype.getTopologicalChain = function() {
return this._routerChain;
}, o.prototype.registerToChain = function(t, e) {
var n = this.getChain(e);
return n && n.addAtom(t), n;
}, o.prototype.unregisterFromChain = function(t, e) {
var n = this.getChain(e);
return !!n && n.removeAtom(t);
}, o.prototype.getChain = function(t) {
switch (t) {
case "RouteReceive":
return this.receiveChain;

case "RouteTransform":
return this.transformChain;

case "RouteDispatch":
return this.dispatchChain;

case "RouteFilter":
return this.filterChain;

default:
return null;
}
}, o.prototype.handleSignal = function(e) {
var n, o;
if (void 0 === e.routerVersion || e.routerVersion === this._signalVersion) {
e.inputData && "InputAtom" === this.from.atomType && Object.assign(this.from.atomState, e.inputData);
var i, a = null !== (n = e.startPhase) && void 0 !== n ? n : t.RoutePhase.Receive, s = e.eidList, l = this.atomState;
if (a <= t.RoutePhase.Receive) switch (l.receiveAction = t.ReceiveAction.Queue, 
this.receiveChain.execute([ this.atomWorld.rootEid ]), l.receiveAction) {
case t.ReceiveAction.Discard:
return;

case t.ReceiveAction.Replace:
this._signalVersion++;
}
if (a <= t.RoutePhase.Transform) {
if (this.transformChain.hasAtoms()) {
if (l.transformedEidList = s, this.transformChain.execute([ this.atomWorld.rootEid ]), 
!l.transformedEidList || 0 === l.transformedEidList.length) return;
s = l.transformedEidList;
}
if (this.mode === t.RouteMode.Direct) {
var u = this.to.domain, c = s.length;
if (0 === (s = s.filter(function(t) {
return u.has(t);
})).length) return;
s.length < c && y(r.TransformEidInvalid, {
atom: this.atomName,
domain: u.atomName
});
}
}
if (a <= t.RoutePhase.Dispatch) {
l.dispatchAction = t.DispatchAction.FireOnce, this.dispatchChain.execute([ this.atomWorld.rootEid ]);
var d = l.dispatchAction;
if (d === t.DispatchAction.Cancel) return;
if (d === t.DispatchAction.Defer) return e.eidList = s, e.startPhase = t.RoutePhase.Dispatch, 
e.routerVersion = this._signalVersion, void this.atomWorld.pendingRouterSignals.push(e);
}
var f = null;
if (this.filterChain.hasAtoms()) {
l.filterAction = {}, this.filterChain.execute(s);
var m = this.atomWorld.ecsWorld;
i = [];
for (var v = 0, _ = s.length; v < _; v++) {
var g = s[v];
if (re(m, g)) {
var A = null !== (o = l.filterAction[g]) && void 0 !== o ? o : t.FilterAction.Cancel;
A !== t.FilterAction.Cancel && (A === t.FilterAction.FireOnce ? i.push(g) : A === t.FilterAction.FireRepeat ? (i.push(g), 
f || (f = []), f.push(g)) : A === t.FilterAction.Defer && (f || (f = []), f.push(g)));
}
}
} else i = s;
if (i.length > 0) {
var C;
(C = this.mode === t.RouteMode.Broadcast ? p([], h(this.to.domain.collect()), !1) : i).length > 0 && this.atomWorld.getAtomIns(e.signalName).trigger(C);
}
f && (e.eidList = f, e.startPhase = t.RoutePhase.Filter, e.routerVersion = this._signalVersion, 
this.atomWorld.pendingRouterSignals.push(e));
}
}, o[ge] = !0, o;
}(Ae), ki = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "OrderAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.getOrderBeforeAtomName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.orderBeforeProperty;
return e ? this.getBoundAtomName(e) : void 0;
}, e.prototype.getOrderAfterAtomName = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.orderAfterProperty;
return e ? this.getBoundAtomName(e) : void 0;
}, e.prototype.init = function(e, n) {
t.prototype.init.call(this, e, n);
var o = this.getOrderBeforeAtomName(), i = this.getOrderAfterAtomName(), a = this.atomWorld.getAtomIns(o), s = this.atomWorld.getAtomIns(i), l = a.getTopologicalChain();
l && l === s.getTopologicalChain() ? (l.addConstraint(o, i), this.atomState = {
chain: l,
before: o,
after: i
}) : y(r.OrderScopeConflict, {
class: pe(this.constructor),
before: o,
after: i
});
}, e.prototype.dispose = function() {
var e = this.atomState;
(null == e ? void 0 : e.chain) ? (e.chain.removeConstraint(e.before, e.after), t.prototype.dispose.call(this)) : t.prototype.dispose.call(this);
}, e[ge] = !0, e;
}(Ae), Vi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "WorldAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.defineWorld = function() {
return {
worldId: this.atomName
};
}, e.prototype.onReady = function() {
this.atomState = this.defineWorld();
}, e[ge] = !0, e;
}(Ae), Ui = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "WorldInputAtom";
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "data", {
get: function() {
return this.atomState;
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
this.atomState = i(i({}, this.defineInputData()), {
childWorldEid: void 0
});
}, e.prototype.emit = function(t) {
t && (this.atomState = t), this.atomWorld.universe.broadcastWorldInput(this);
}, e.prototype.emitToParent = function(t) {
t && (this.atomState = t), this.atomWorld.universe.sendToParentWorldInput(this);
}, e.prototype.receive = function(t, e) {
this.atomState = t, this.atomState.childWorldEid = e, this.atomWorld.pushInput(this, this.atomWorld.rootEid, this.atomState);
}, e[ge] = !0, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
e;
}(Oi), zi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e.prototype, "world", {
get: function() {
return this.atomWorld;
},
enumerable: !1,
configurable: !0
}), e.prototype.triggerRouter = function(t, e) {
this.atomWorld.universe.forEachWorld(function(n) {
var o = n.atomInstanceMap.get(t);
if (o) {
var r = p([], h(void 0 === e ? o.to.domain.collect() : e), !1);
n.pendingRouterSignals.push({
fromRouterName: o.atomName,
signalName: o.to.atomName,
eidList: r
});
}
});
}, e[ge] = !0, e;
}(Ni), Hi = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), Object.defineProperty(o, "atomType", {
get: function() {
return "AudioAtom";
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(o.prototype, "_audio", {
get: function() {
var t, e;
return null === (e = null === (t = this.atomWorld) || void 0 === t ? void 0 : t.universe) || void 0 === e ? void 0 : e.audio;
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(o.prototype, "_asset", {
get: function() {
var t, e;
return null === (e = null === (t = this.atomWorld) || void 0 === t ? void 0 : t.universe) || void 0 === e ? void 0 : e.asset;
},
enumerable: !1,
configurable: !0
}), o.prototype.playEffect = function(e) {
return u(this, arguments, void 0, function(e, n, o) {
var r, i, a, s, l;
return void 0 === n && (n = 1), void 0 === o && (o = !1), c(this, function(u) {
switch (u.label) {
case 0:
r = go(e), u.label = 1;

case 1:
return u.trys.push([ 1, 3, , 4 ]), [ 4, null === (a = this._asset) || void 0 === a ? void 0 : a.loadAsset(r.featureName, r.assetPath, t.LoaderAssetType.AudioClip) ];

case 2:
return (i = u.sent()) ? [ 2, null !== (l = null === (s = this._audio) || void 0 === s ? void 0 : s.playEffect(i, n, o)) && void 0 !== l ? l : -1 ] : [ 2, -1 ];

case 3:
return u.sent(), [ 2, -1 ];

case 4:
return [ 2 ];
}
});
});
}, o.prototype.stopEffect = function(t) {
var e;
null === (e = this._audio) || void 0 === e || e.stopEffect(t);
}, o.prototype.setEffectsVolume = function(t) {
var e;
null === (e = this._audio) || void 0 === e || e.setEffectsVolume(t);
}, o.prototype.stopAllEffects = function() {
var t;
null === (t = this._audio) || void 0 === t || t.stopAllEffects();
}, o.prototype.playMusic = function(e, n, o) {
var r, i = this;
void 0 === n && (n = !0), void 0 === o && (o = 1), this._currentMusicUrl = e;
var a = go(e);
null === (r = this._asset) || void 0 === r || r.loadAsset(a.featureName, a.assetPath, t.LoaderAssetType.AudioClip).then(function(t) {
var r;
i._currentMusicUrl === e && (null === (r = i._audio) || void 0 === r || r.playMusic(t, n, o));
}).catch(function() {});
}, o.prototype.stopMusic = function() {
var t;
this._currentMusicUrl = void 0, null === (t = this._audio) || void 0 === t || t.stopMusic();
}, o.prototype.pauseMusic = function() {
var t;
null === (t = this._audio) || void 0 === t || t.pauseMusic();
}, o.prototype.resumeMusic = function() {
var t;
null === (t = this._audio) || void 0 === t || t.resumeMusic();
}, o.prototype.setMusicVolume = function(t) {
var e;
null === (e = this._audio) || void 0 === e || e.setMusicVolume(t);
}, o[ge] = !0, o;
}(Ae), ji = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Node, e ], h(n), !1));
}, Yi = function() {
function t(t) {
void 0 === t && (t = 1 / 0), this.pool = [], this.maxSize = t;
}
return t.prototype.acquire = function() {
var t;
return null !== (t = this.pool.pop()) && void 0 !== t ? t : null;
}, t.prototype.release = function(t) {
var e, n;
if (this.pool.length < this.maxSize) this.pool.push(t); else try {
for (var o = d(t.nodes), r = o.next(); !r.done; r = o.next()) r.value.destroyNative();
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, t.prototype.dispose = function() {
var t, e, n, o;
try {
for (var r = d(this.pool), i = r.next(); !i.done; i = r.next()) {
var a = i.value;
try {
for (var s = (n = void 0, d(a.nodes)), l = s.next(); !l.done; l = s.next()) l.value.destroyNative();
} catch (t) {
n = {
error: t
};
} finally {
try {
l && !l.done && (o = s.return) && o.call(s);
} finally {
if (n) throw n.error;
}
}
}
} catch (e) {
t = {
error: e
};
} finally {
try {
i && !i.done && (e = r.return) && e.call(r);
} finally {
if (t) throw t.error;
}
}
this.pool.length = 0;
}, t;
}(), qi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.getExtraDependencies = function() {
return [];
}, e.prototype.getTargetDomainName = function(t) {
var e = this._atomWorld.atomInstanceMap.get(t), n = e.constructor.__bindingMeta.entityRenderer;
return e.getBoundAtomName(n);
}, e.prototype.compareAtoms = function(t, e) {
var n = this._atomWorld.atomInstanceMap.get(t), o = this._atomWorld.atomInstanceMap.get(e), r = void 0 === n.renderCondition(), i = void 0 === o.renderCondition();
return r && !i ? 1 : !r && i ? -1 : t.localeCompare(e);
}, e.prototype.resolve = function() {
for (var t = this.getInstances(), e = 0, n = t.length; e < n; e++) {
var o = t[e];
if (!1 !== o.renderCondition()) return o;
}
return null;
}, e.prototype.topologicalSort = function() {
var e = t.prototype.topologicalSort.call(this);
return e.length, e;
}, e;
}(Ce), Xi = new Set([ "x", "y", "z", "quatX", "quatY", "quatZ", "quatW", "scaleX", "scaleY", "scaleZ", "angle", "scale", "width", "height", "depth", "anchorX", "anchorY", "anchorZ" ]), Qi = function() {
this.preciseUpdateOps = [], this.logicDependencies = [], this.totalNodes = 0, this.renderConfig = null, 
this.nodeInitOps = [], this.nodeEventOps = [], this.boneAttachments = [], this.scrollViewContent = null;
}, Ji = function(e) {
function o() {
var t = e.apply(this, p([], h(arguments), !1)) || this;
return t.pool = null, t._compiledRender = null, t._renderConfig = null, t._domain = null, 
t.genChain = null, t;
}
return n(o, e), Object.defineProperty(o, "atomType", {
get: function() {
return "RenderAtom";
},
enumerable: !1,
configurable: !0
}), o.prototype.renderCondition = function() {}, o.prototype.poolMaxSize = function() {
return 1 / 0;
}, o.prototype.getEntityRendererDomain = function() {
var t, e = null === (t = this.constructor.__bindingMeta) || void 0 === t ? void 0 : t.entityRenderer;
return e ? this.getBoundAtomName(e) : void 0;
}, o.prototype.getDependencies = function() {
var t = e.prototype.getDependencies.call(this);
return t.includes(Nn) || t.push(Nn), t.includes(xn) || t.push(xn), t;
}, o.prototype.init = function(t, n) {
e.prototype.init.call(this, t, n);
var o = this.getEntityRendererDomain();
o && (this._domain = this.atomWorld.getAtomIns(o), this._domain.renderVariantChain || (this._domain.renderVariantChain = new qi(n)), 
this._domain.renderVariantChain.addAtom(t));
}, o.prototype.onReady = function() {
return u(this, void 0, void 0, function() {
return c(this, function(t) {
switch (t.label) {
case 0:
return this._renderConfig = this.defineRender(), this.atomState = this._buildPropsMap(this._renderConfig), 
this.genChain ? [ 4, this.genChain.execute() ] : [ 3, 2 ];

case 1:
t.sent(), t.label = 2;

case 2:
return this._normalizeSpineSlots(this._renderConfig, this.atomState), this._compiledRender = this._compile(this._renderConfig), 
this.pool = new Yi(this.poolMaxSize()), [ 2 ];
}
});
});
}, o.prototype.dispose = function() {
var t, n;
(null === (t = this._domain) || void 0 === t ? void 0 : t.renderVariantChain) && this._domain.renderVariantChain.removeAtom(this.atomName) && (this._domain.renderVariantChain = null), 
this._domain = null, null === (n = this.pool) || void 0 === n || n.dispose(), this.pool = null, 
this._compiledRender = null, this._renderConfig = null, e.prototype.dispose.call(this);
}, o.prototype.getTopologicalChain = function() {
var t, e;
return null !== (e = null === (t = this._domain) || void 0 === t ? void 0 : t.renderVariantChain) && void 0 !== e ? e : null;
}, o.prototype.refreshInstance = function(t, e) {
var n;
(null === (n = t._dirtyPreciseOps) || void 0 === n ? void 0 : n.size) > 0 && this._refreshPrecise(t, e);
}, o.prototype._refreshPrecise = function(t, e) {
var n = this._compiledRender, o = t._dirtyPreciseOps;
this._withInstanceContext(t, function() {
var r, i, a = t.nodes;
try {
for (var s = d(o), l = s.next(); !l.done; l = s.next()) {
var u = l.value, c = n.preciseUpdateOps[u], h = a[c.nodeIndex];
c.setter(h, c.getter(e));
}
} catch (t) {
r = {
error: t
};
} finally {
try {
l && !l.done && (i = s.return) && i.call(s);
} finally {
if (r) throw r.error;
}
}
}), o.clear();
}, o.prototype.getLogicDependencies = function() {
return this._compiledRender.logicDependencies;
}, o.prototype.createRender = function(t, e) {
var n = this, o = this.pool.acquire();
if (o) return this._reuseInstance(o, e), o;
var r = {
rootNode: null,
nodes: [],
renderAtom: this,
_lastRefreshFrame: -1,
eid: e
};
return this._withInstanceContext(r, function() {
r.rootNode = n._createNodeTree(t, n._compiledRender.renderConfig, r, e);
}), this._rebuildScrollViewContent(r), this._registerPreciseTracking(r), r;
}, o.prototype._reuseInstance = function(t, e) {
var n = this;
t.eid = e, t._lastRefreshFrame = -1, t._valueCache = void 0, t.nodeCache = void 0, 
t._dirtyPreciseOps && (t._dirtyPreciseOps.clear(), t._preciseValueCache = void 0), 
this._withInstanceContext(t, function() {
for (var o = t.nodes, r = 0; r < o.length; r++) n._initNode(o[r], r, e);
}), this._rebuildBoneAttachments(t), this._rebuildScrollViewContent(t), this._registerPreciseTracking(t);
}, o.prototype._rebuildBoneAttachments = function(t) {
var e, n, o = this._compiledRender;
if (0 !== o.boneAttachments.length) {
var r = t.nodes;
try {
for (var i = d(o.boneAttachments), a = i.next(); !a.done; a = i.next()) {
var s = a.value, l = r[s.parentIndex], u = r[s.childIndex];
l.attachToBone(u, s.boneName, s.bindAlpha);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
a && !a.done && (n = i.return) && n.call(i);
} finally {
if (e) throw e.error;
}
}
}
}, o.prototype._rebuildScrollViewContent = function(t) {
var e = this._compiledRender.scrollViewContent;
if (e) {
var n = t.nodes, o = n[e.scrollViewIndex], r = n[e.contentIndex];
o.rebuildScrollViewContent(r);
}
}, o.prototype._initNode = function(t, e, n) {
var o = this;
Ee(this.atomName), t.initRender(n, this.atomWorld.config.worldId);
var r = this._compiledRender, i = r.nodeInitOps[e];
if (i) for (var a = 0; a < i.length; a++) {
var s = i[a];
s.setter(t, s.getter(n));
}
var l = r.nodeEventOps[e];
if (l) {
var u = function(e) {
var r, i = l[e];
switch (i.eventName) {
case "buttonClick":
r = c.atomWorld.getAtomIns(Bn);
break;

case "touchStart":
r = c.atomWorld.getAtomIns(kn);
break;

case "touchEnd":
r = c.atomWorld.getAtomIns(Vn);
}
i.setter(t, function(t) {
if (o.atomWorld) {
var e = i.getter(n);
e && (null == r || r.emit(n), o.atomWorld.pendingRouterSignals.push({
fromRouterName: e.atomName,
signalName: e.to.atomName,
eidList: [ n ],
inputData: t
}));
}
});
}, c = this;
for (a = 0; a < l.length; a++) u(a);
}
Ee(void 0);
}, o.prototype._createNodeTree = function(t, e, n, o) {
var r, i, a = t.createRenderNode(e.type), s = n.nodes.length;
if (n.nodes.push(a), this._initNode(a, s, o), e.children) try {
for (var l = d(e.children), u = l.next(); !u.done; u = l.next()) {
var c = u.value, h = this._createNodeTree(t, c, n, o);
c._boneName && "attachToBone" in a ? a.attachToBone(h, c._boneName, c._bindAlpha) : a.addChild(h);
}
} catch (t) {
r = {
error: t
};
} finally {
try {
u && !u.done && (i = l.return) && i.call(l);
} finally {
if (r) throw r.error;
}
}
return a;
}, o.prototype.onContextRestore = function(t) {
var e, n;
try {
for (var o = d(t.nodes), r = o.next(); !r.done; r = o.next()) {
var i = r.value;
try {
i.restoreMaterial();
} catch (t) {}
try {
i.restoreTexture();
} catch (t) {}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
}, o.prototype.destroyRender = function(t) {
this._prepareForPooling(t), this.pool.release(t);
}, o.prototype._prepareForPooling = function(t) {
var e, n;
this._unregisterPreciseTracking(t);
try {
for (var o = d(t.nodes), r = o.next(); !r.done; r = o.next()) r.value.disposeRender();
} catch (t) {
e = {
error: t
};
} finally {
try {
r && !r.done && (n = o.return) && n.call(o);
} finally {
if (e) throw e.error;
}
}
t.rootNode.removeFromParent();
}, o.prototype.getNode = function(t) {
var e = this._currentInstance;
if (e) {
var n = this._ensureNodeCache(e)[t];
if (n) return {
x: n.getX(),
y: n.getY(),
width: n.getWidth(),
height: n.getHeight()
};
}
}, o.prototype.getSlotNode = function(t, e) {
return this._ensureNodeCache(t)[e];
}, o.prototype.findSlotPath = function(t) {
if (this._renderConfig) {
if (this._renderConfig.props.name === t) return [];
var e = [];
return this._findSlotDFS(this._renderConfig, t, e) ? e : void 0;
}
}, o.prototype._findSlotDFS = function(t, e, n) {
var o, r;
if (!t.children) return !1;
try {
for (var i = d(t.children), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
if (n.push(s.props.name), s.props.name === e) return !0;
if (this._findSlotDFS(s, e, n)) return !0;
n.pop();
}
} catch (t) {
o = {
error: t
};
} finally {
try {
a && !a.done && (r = i.return) && r.call(i);
} finally {
if (o) throw o.error;
}
}
return !1;
}, o.prototype._withInstanceContext = function(t, e) {
var n = this._currentInstance;
this._currentInstance = t;
try {
e();
} finally {
this._currentInstance = n;
}
}, o.prototype._ensureNodeCache = function(t) {
var e, n;
if (!t.nodeCache) {
var o = {};
try {
for (var r = d(t.nodes), i = r.next(); !i.done; i = r.next()) {
var a = i.value, s = a.getName();
s && void 0 === o[s] && (o[s] = a);
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
t.nodeCache = o;
}
return t.nodeCache;
}, o.prototype._buildPropsMap = function(t) {
var e = {}, n = function(t) {
var o, r;
if (t && (e[t.props.name] = t.props, t.children)) try {
for (var i = d(t.children), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
n(s);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
a && !a.done && (r = i.return) && r.call(i);
} finally {
if (o) throw o.error;
}
}
};
return n(t), e;
}, o.prototype._normalizeSpineSlots = function(e, n) {
var o, r, i, a, s, l, u, c;
if (e.children) try {
for (var f = d(e.children), m = f.next(); !m.done; m = f.next()) {
var v = m.value;
this._normalizeSpineSlots(v, n);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
m && !m.done && (r = f.return) && r.call(f);
} finally {
if (o) throw o.error;
}
}
if (e.type === t.RenderNodeType.Spine) {
var y = [];
if (e.children) try {
for (var _ = d(e.children), g = _.next(); !g.done; g = _.next()) (v = g.value)._boneName ? (null === (u = v.props) || void 0 === u ? void 0 : u.name) && delete n[v.props.name] : y.push(v);
} catch (t) {
i = {
error: t
};
} finally {
try {
g && !g.done && (a = _.return) && a.call(_);
} finally {
if (i) throw i.error;
}
}
var A = Mo(e.props.slots);
try {
for (var C = d(A), R = C.next(); !R.done; R = C.next()) (null === (c = (v = R.value).props) || void 0 === c ? void 0 : c.name) && (n[v.props.name] = v.props);
} catch (t) {
s = {
error: t
};
} finally {
try {
R && !R.done && (l = C.return) && l.call(C);
} finally {
if (s) throw s.error;
}
}
var S = p(p([], h(A), !1), h(y), !1);
e.children = S.length > 0 ? S : void 0, delete e.props.slots;
}
}, o.prototype._compile = function(e) {
var n, o, r = this, i = new Qi();
i.renderConfig = e;
try {
for (var a = d(this.getDependencies()), s = a.next(); !s.done; s = a.next()) {
var l = s.value;
"LogicAtom" === this.getDepAtomType(l) && i.logicDependencies.push(l);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
s && !s.done && (o = a.return) && o.call(a);
} finally {
if (n) throw n.error;
}
}
var u = 0, c = function(e, n) {
var o, a, s, l, h, p = u++;
if (r._compileNodeProps(i, e, p, n), e.children) {
var f = e.type === t.RenderNodeType.ScrollView ? null === (l = null === (s = e.props) || void 0 === s ? void 0 : s.content) || void 0 === l ? void 0 : l.name : void 0;
try {
for (var m = d(e.children), v = m.next(); !v.done; v = m.next()) {
var y = v.value;
if (y._boneName) {
var _ = u;
i.boneAttachments.push({
childIndex: _,
parentIndex: p,
boneName: y._boneName,
bindAlpha: y._bindAlpha
});
}
f && (null === (h = y.props) || void 0 === h ? void 0 : h.name) === f && (i.scrollViewContent = {
scrollViewIndex: p,
contentIndex: u
}), c(y, !1);
}
} catch (t) {
o = {
error: t
};
} finally {
try {
v && !v.done && (a = m.return) && a.call(m);
} finally {
if (o) throw o.error;
}
}
}
};
return c(e, !0), i.totalNodes = u, i;
}, o.prototype._compileNodeProps = function(t, e, n, o) {
if (o) {
for (var i in e.props) Xi.has(i) && y(r.WarnRootControlledProperty, {
atom: this.atomName,
property: i,
reason: "根节点的变换/尺寸属性应由 G_FAtom_Transform / G_FAtom_BoxComponent 控制，请勿在 defineRender 中显式设置"
});
this._injectTransformSync(t, e, n), this._injectBoxSync(t, e, n);
}
this._walkProps(t, e, n, e.props, Or(e.type), "");
}, o.prototype._walkProps = function(t, e, n, o, r, i) {
for (var a in o) {
var s = o[a], l = i ? "".concat(i, ".").concat(a) : a, u = null == r ? void 0 : r[a];
if (this._isPlainObject(s) && u && "object" == typeof u) this._walkProps(t, e, n, s, u, l); else if ("event" !== i) {
var c = this._resolveSetter(u, l, e.type);
this._compileValue(t, n, c, s, a);
} else this._compileEvent(t, e, n, a, s);
}
}, o.prototype._resolveSetter = function(t, e, n) {
return t && "object" == typeof t && y(r.RenderGroupAssign, {
node: n,
property: e
}), t || y(r.RenderPropertyNotExist, {
node: n,
property: e
}), t;
}, o.prototype._isDynamicBinding = function(t) {
return Array.isArray(t) && "function" == typeof t[0];
}, o.prototype._makeFieldKey = function(t, e) {
return "".concat(t, ":").concat(e.join("."));
}, o.prototype._compileValue = function(t, e, n, o, r) {
var i, a, s, l;
this._isDynamicBinding(o) ? 1 === o.length ? (null !== (i = (s = t.nodeInitOps)[e]) && void 0 !== i ? i : s[e] = []).push({
nodeIndex: e,
setter: n,
getter: o[0]
}) : this._compilePreciseBinding(t, e, n, o, r) : (null !== (a = (l = t.nodeInitOps)[e]) && void 0 !== a ? a : l[e] = []).push({
nodeIndex: e,
setter: n,
getter: function() {
return o;
}
});
}, o.prototype._compilePreciseBinding = function(t, e, n, o) {
var r, i, a, s, l, u = h(o), c = u[0], p = u.slice(1), f = [];
try {
for (var m = d(p), v = m.next(); !v.done; v = m.next()) {
var y = h(v.value), _ = y[0], g = y.slice(1), A = null !== (a = _.atomName) && void 0 !== a ? a : _[ye];
if (A) {
var C = {
atomName: A,
fieldPath: g
};
f.push(C);
var R = this.atomWorld.getAtomIns(A);
"EntityComponentAtom" === (null == R ? void 0 : R.atomType) && this._injectComponentSetMethod(R, C);
}
}
} catch (t) {
r = {
error: t
};
} finally {
try {
v && !v.done && (i = m.return) && i.call(m);
} finally {
if (r) throw r.error;
}
}
var S = {
nodeIndex: e,
setter: n,
getter: c,
dependencies: f
};
t.preciseUpdateOps.push(S), (null !== (s = (l = t.nodeInitOps)[e]) && void 0 !== s ? s : l[e] = []).push({
nodeIndex: e,
setter: n,
getter: c
});
}, o.prototype._isPlainObject = function(t) {
if ("object" != typeof t || null === t) return !1;
var e = Object.getPrototypeOf(t);
return e === Object.prototype || null === e;
}, o.prototype._compileEvent = function(t, e, n, o, i) {
var a, s, l = Or(e.type).event, u = l ? l[o] : void 0, c = null;
u && "function" == typeof u && (c = u), c || y(r.RenderEventNotRegistered, {
node: e.type,
event: o
});
var d = this.atomWorld.getAtomIns(i[ye]);
(null !== (a = (s = t.nodeEventOps)[n]) && void 0 !== a ? a : s[n] = []).push({
eventName: o,
setter: c,
getter: function() {
return d;
}
});
}, o.prototype._injectTransformSync = function(t, e, n) {
this._injectComponentBindings(t, e, n, Nn, 0);
}, o.prototype._injectBoxSync = function(t, e, n) {
this._injectComponentBindings(t, e, n, xn);
}, o.prototype._injectComponentBindings = function(t, e, n, o, r) {
var i = this.atomWorld.getAtomIns(o);
if (i) {
var a = i.atomState, s = this.atomWorld.ecsWorld, l = function(o) {
if (o in e.props) return "continue";
var l = Or(e.type)[o];
if (!l) return "continue";
u._compilePreciseBinding(t, n, function(t, e) {
void 0 !== e && l(t, e);
}, [ function(t) {
if (!Et(s, t, a)) return r;
var e = a[o];
return e ? e[t] : r;
}, [ i, o ] ], o);
}, u = this;
for (var c in a) l(c);
}
}, o.prototype._registerPreciseTracking = function(t) {
var e, n, o = this._compiledRender;
if (0 !== o.preciseUpdateOps.length) {
t._dirtyPreciseOps = new Set();
for (var r = 0; r < o.preciseUpdateOps.length; r++) {
var i = o.preciseUpdateOps[r];
try {
for (var a = (e = void 0, d(i.dependencies)), s = a.next(); !s.done; s = a.next()) {
var l = s.value, u = this._makeFieldKey(l.atomName, l.fieldPath), c = this.atomWorld.universe, h = c.fieldWatchers.get(u);
h || (h = new Set(), c.fieldWatchers.set(u, h)), this._setupFieldInterceptor(l), 
h.add({
instance: t,
opIndex: r
});
}
} catch (t) {
e = {
error: t
};
} finally {
try {
s && !s.done && (n = a.return) && n.call(a);
} finally {
if (e) throw e.error;
}
}
}
}
}, o.prototype._unregisterPreciseTracking = function(t) {
var e, n, o, r, i, a;
if (t._dirtyPreciseOps) {
var s = this._compiledRender;
try {
for (var l = d(s.preciseUpdateOps), u = l.next(); !u.done; u = l.next()) {
var c = u.value;
try {
for (var h = (o = void 0, d(c.dependencies)), p = h.next(); !p.done; p = h.next()) {
var f = p.value, m = this._makeFieldKey(f.atomName, f.fieldPath), v = this.atomWorld.universe, y = v.fieldWatchers.get(m);
if (y) {
try {
for (var _ = (i = void 0, d(y)), g = _.next(); !g.done; g = _.next()) {
var A = g.value;
A.instance === t && y.delete(A);
}
} catch (t) {
i = {
error: t
};
} finally {
try {
g && !g.done && (a = _.return) && a.call(_);
} finally {
if (i) throw i.error;
}
}
0 === y.size && v.fieldWatchers.delete(m);
}
}
} catch (t) {
o = {
error: t
};
} finally {
try {
p && !p.done && (r = h.return) && r.call(h);
} finally {
if (o) throw o.error;
}
}
}
} catch (t) {
e = {
error: t
};
} finally {
try {
u && !u.done && (n = l.return) && n.call(l);
} finally {
if (e) throw e.error;
}
}
t._dirtyPreciseOps = void 0, t._preciseValueCache = void 0;
}
}, o.prototype._injectComponentSetMethod = function(t, e) {
var n, o = t.atomState;
if (o) {
for (var r = 0; r < e.fieldPath.length; r++) {
var i = e.fieldPath[r];
if (void 0 === (o = o[i])) return;
}
if (!(null === (n = o.set) || void 0 === n ? void 0 : n.__isAtomInterceptor)) {
var a = this.atomWorld.universe, s = function(t, n) {
o[t] = n, a.onFieldWrite(e.atomName, e.fieldPath, t);
};
s.__isAtomInterceptor = !0, Object.defineProperty(o, "set", {
value: s,
writable: !1,
enumerable: !1,
configurable: !0
});
}
}
}, o.prototype._setupFieldInterceptor = function(t) {
var e, n = this.atomWorld.getAtomIns(t.atomName);
if (n && "EntityComponentAtom" !== n.atomType) {
var o = n.atomState;
if (o) for (var r = function(n) {
var r = t.fieldPath[n];
if (!(r in o)) return {
value: void 0
};
if (n < t.fieldPath.length - 1) return o = o[r], "continue";
var a = Object.getOwnPropertyDescriptor(o, r);
if (null === (e = null == a ? void 0 : a.set) || void 0 === e ? void 0 : e.__isAtomInterceptor) return {
value: void 0
};
var s = o[r], l = i.atomWorld.universe, u = function(e) {
s = e, l.onFieldWrite(t.atomName, t.fieldPath);
};
u.__isAtomInterceptor = !0, Object.defineProperty(o, r, {
get: function() {
return s;
},
set: u,
enumerable: !0,
configurable: !0
});
}, i = this, a = 0; a < t.fieldPath.length; a++) {
var s = r(a);
if ("object" == typeof s) return s.value;
}
}
}, o.prototype.registerToChain = function(t) {
return this.genChain || (this.genChain = new Re(this.atomWorld, this.atomName)), 
this.genChain.addAtom(t), this.genChain;
}, o.prototype.unregisterFromChain = function(t) {
if (!this.genChain) return !1;
var e = this.genChain.removeAtom(t);
return e && (this.genChain = null), e;
}, o.prototype.getChain = function() {
return this.genChain;
}, o[ge] = !0, o;
}(Ae), Ki = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), Object.defineProperty(o, "atomType", {
get: function() {
return "LoadAtom";
},
enumerable: !1,
configurable: !0
}), o.prototype.collectLoad = function() {
this.atomWorld.loadTracker.addItems(o.LOAD_WEIGHT);
}, o.prototype.executeLoadDef = function(e, n) {
return u(this, void 0, void 0, function() {
var r, i, a, s, l, u, p, f, m, v, y, _, g, A, C, R, S, T, b, w, F, E, N, x, I, D, M, W, P, O, L, G, B, k, V, U, z, H, j, Y, q, X, Q, J, K, Z, $, tt, et, nt, ot, rt, it, at, st, lt, ut, ct, dt, ht, pt, ft = this;
return c(this, function(c) {
switch (c.label) {
case 0:
if (!this.atomWorld) return [ 2 ];
if (r = e.paths, i = void 0 === r ? {} : r, a = e.directories, s = void 0 === a ? [] : a, 
l = e.concurrency, u = e.downloadWorldBundles, p = e.onlyDownload || this.atomWorld.isDownloadOnly, 
f = this.atomWorld.universe.asset, m = (null == u ? void 0 : u.length) ? this.atomWorld.universe.featureResolver.getFeatureNamesForWorlds(u) : [], 
v = !p && !0 === e.preheat, y = v && null !== (pt = i[t.LoaderAssetType.SkeletonData]) && void 0 !== pt ? pt : [], 
_ = Object.values(i).reduce(function(t, e) {
var n;
return t + (null !== (n = null == e ? void 0 : e.length) && void 0 !== n ? n : 0);
}, 0), g = m.length + _ + s.length, A = y.length > 0 ? 1 - o.PREHEAT_PROGRESS_RATIO : 1, 
C = A, R = 0, S = function() {
null == n || n(g > 0 ? R / g * A : A);
}, !(m.length > 0)) return [ 3, 13 ];
c.label = 1;

case 1:
c.trys.push([ 1, 9, 10, 11 ]), T = d(null != u ? u : []), b = T.next(), c.label = 2;

case 2:
if (b.done) return [ 3, 8 ];
w = b.value, c.label = 3;

case 3:
return c.trys.push([ 3, 5, , 6 ]), [ 4, f.ensureSessionPlan(w) ];

case 4:
case 5:
return c.sent(), [ 3, 6 ];

case 6:
if (!this.atomWorld) return [ 2 ];
c.label = 7;

case 7:
return b = T.next(), [ 3, 2 ];

case 8:
return [ 3, 11 ];

case 9:
return F = c.sent(), it = {
error: F
}, [ 3, 11 ];

case 10:
try {
b && !b.done && (at = T.return) && at.call(T);
} finally {
if (it) throw it.error;
}
return [ 7 ];

case 11:
return [ 4, f.preloadBundles(m, function() {
ft.atomWorld && (R++, S());
}) ];

case 12:
if (c.sent(), !this.atomWorld) return [ 2 ];
c.label = 13;

case 13:
for (D in E = p ? f.preloadDir.bind(f) : f.loadDir.bind(f), N = v ? new Map() : null, 
I = [], x = i) I.push(D);
M = 0, c.label = 14;

case 14:
if (!(M < I.length)) return [ 3, 26 ];
if (!((D = I[M]) in x)) return [ 3, 25 ];
if (!(P = i[W = D])) return [ 3, 25 ];
O = W, c.label = 15;

case 15:
c.trys.push([ 15, 23, 24, 25 ]), st = void 0, L = d(P), G = L.next(), c.label = 16;

case 16:
return G.done ? [ 3, 22 ] : (j = G.value, B = go(j), q = B.featureName, k = B.assetPath, 
p ? [ 4, f.preloadAsset(q, k, O) ] : [ 3, 18 ]);

case 17:
return c.sent(), [ 3, 20 ];

case 18:
return [ 4, f.loadAsset(q, k, O) ];

case 19:
V = c.sent(), N && O === t.LoaderAssetType.SkeletonData && V && N.set(j, V), c.label = 20;

case 20:
if (!this.atomWorld) return [ 2 ];
R++, S(), c.label = 21;

case 21:
return G = L.next(), [ 3, 16 ];

case 22:
return [ 3, 25 ];

case 23:
return U = c.sent(), st = {
error: U
}, [ 3, 25 ];

case 24:
try {
G && !G.done && (lt = L.return) && lt.call(L);
} finally {
if (st) throw st.error;
}
return [ 7 ];

case 25:
return M++, [ 3, 14 ];

case 26:
c.trys.push([ 26, 31, 32, 33 ]), z = d(s), H = z.next(), c.label = 27;

case 27:
return H.done ? [ 3, 30 ] : (j = H.value, Y = go(j), q = Y.featureName, X = Y.assetPath, 
[ 4, E(q, X, l) ]);

case 28:
if (c.sent(), !this.atomWorld) return [ 2 ];
R++, S(), c.label = 29;

case 29:
return H = z.next(), [ 3, 27 ];

case 30:
return [ 3, 33 ];

case 31:
return Q = c.sent(), ut = {
error: Q
}, [ 3, 33 ];

case 32:
try {
H && !H.done && (ct = z.return) && ct.call(z);
} finally {
if (ut) throw ut.error;
}
return [ 7 ];

case 33:
if (!(N && N.size > 0)) return [ 3, 41 ];
J = this.atomWorld.universe.render, K = Array.from(N.entries()), Z = K.length, $ = 0, 
c.label = 34;

case 34:
c.trys.push([ 34, 39, 40, 41 ]), tt = d(K), et = tt.next(), c.label = 35;

case 35:
return et.done ? [ 3, 38 ] : (nt = h(et.value, 2), ot = nt[1], this.atomWorld ? [ 4, J.preheatSpineSharedCache(ot, function(t) {
null == n || n(C + ($ + t) / Z * o.PREHEAT_PROGRESS_RATIO);
}) ] : [ 2 ]);

case 36:
if (c.sent(), !this.atomWorld) return [ 2 ];
$++, null == n || n(C + $ / Z * o.PREHEAT_PROGRESS_RATIO), c.label = 37;

case 37:
return et = tt.next(), [ 3, 35 ];

case 38:
return [ 3, 41 ];

case 39:
return rt = c.sent(), dt = {
error: rt
}, [ 3, 41 ];

case 40:
try {
et && !et.done && (ht = tt.return) && ht.call(tt);
} finally {
if (dt) throw dt.error;
}
return [ 7 ];

case 41:
return null == n || n(1), [ 2 ];
}
});
});
}, o.prototype.onReady = function() {
return u(this, void 0, void 0, function() {
var t, e, n, r, i, a = this;
return c(this, function(s) {
switch (s.label) {
case 0:
return !(t = this.atomState = this.defineLoad()) || t.silent ? (this.atomWorld.loadTracker.complete(o.LOAD_WEIGHT), 
[ 2 ]) : (e = this.atomWorld.config.worldId, this.atomWorld.universe.featureResolver.shouldSkipNonSilentLoadAtoms(e) ? (this.atomWorld.loadTracker.complete(o.LOAD_WEIGHT), 
[ 2 ]) : (n = 0, r = 0, [ 4, this.executeLoadDef(t, function(t) {
if (a.atomWorld) {
n = o.LOAD_WEIGHT * t;
var e = Math.floor(n - r);
e > 0 && (a.atomWorld.loadTracker.complete(e), r += e);
}
}) ]));

case 1:
return s.sent(), (i = o.LOAD_WEIGHT - r) > 0 && this.atomWorld && this.atomWorld.loadTracker.complete(i), 
this.atomWorld, [ 2 ];
}
});
});
}, o[ge] = !0, o.LOAD_WEIGHT = 20, o.PREHEAT_PROGRESS_RATIO = .1, o;
}(Ae), Zi = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ ze("G_FAtom_AudioPlayer") ], e);
}(Hi), $i = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ He("G_FAtom_Transform"), l("design:type", Object) ], e.prototype, "transform", void 0), 
s([ ze(an) ], e);
}(wi), ta = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ He(Nn), l("design:type", Object) ], e.prototype, "transform", void 0), 
s([ He(xn), l("design:type", Object) ], e.prototype, "box", void 0), s([ He(In), l("design:type", Object) ], e.prototype, "worldState", void 0), 
s([ ze(sn) ], e);
}(wi), ea = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineRender = function() {
return ji({
name: "Root",
blockInputEvents: !0,
widget: {
top: 0,
bottom: 0,
left: 0,
right: 0,
alignMode: t.WidgetAlignMode.Always
}
});
}, s([ je, He("G_FAtom_RootDomain"), l("design:type", Object) ], o.prototype, "root", void 0), 
s([ ze("G_FAtom_RootRender") ], o);
}(Ji), na = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineRender = function() {
return ji({
name: "WorldContainer"
});
}, s([ je, He(sn), l("design:type", Object) ], e.prototype, "world", void 0), s([ ze("G_FAtom_WorldRender") ], e);
}(Ji), oa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineComponent = function() {
return {
x: 0,
y: 0,
z: 0,
quatX: 0,
quatY: 0,
quatZ: 0,
quatW: 1,
scaleX: 1,
scaleY: 1,
scaleZ: 1
};
}, s([ ze(Nn) ], e);
}(bi), ra = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineComponent = function() {
return {
width: 0,
height: 0,
depth: 0,
anchorX: .5,
anchorY: .5,
anchorZ: .5
};
}, s([ ze(xn) ], e);
}(bi), ia = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineComponent = function() {
return {
receiveInput: 1,
worldId: "",
randomSeed: 0,
multiTouch: void 0
};
}, s([ ze(In) ], e);
}(bi), aa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineComponent = function() {
return {
name: ""
};
}, s([ ze(Dn) ], e);
}(bi), sa = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.mountSlots = new Map(), e;
}
return n(e, t), e.prototype.defineRelation = function() {
return {
exclusive: !0,
autoRemoveSubject: !0
};
}, e.prototype.addChild = function(t, e, n) {
return this.getParent(e) === t && this.remove(t, e), n ? this.mountSlots.set(e, n) : this.mountSlots.delete(e), 
this.set(t, e);
}, e.prototype.removeChild = function(t, e) {
return this.mountSlots.delete(e), this.remove(t, e);
}, e.prototype.getParent = function(t) {
return this.getSource(t);
}, e.prototype.getChildren = function(t) {
return this.getTargets(t);
}, e.prototype.hasParent = function(t) {
return void 0 !== this.getParent(t);
}, e.prototype.hasChild = function(t, e) {
return this.has(t, e);
}, s([ ze(En) ], e);
}(Fi), la = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "InputAtom";
},
enumerable: !1,
configurable: !0
}), Object.defineProperty(e.prototype, "data", {
get: function() {
return this.atomState;
},
enumerable: !1,
configurable: !0
}), e.prototype.fill = function(t) {
Object.assign(this.atomState, t);
}, e.prototype.onReady = function() {
this.atomState = i(i({}, this.defineInputData()), {
eid: 0
});
}, e.prototype.emit = function(t) {
var e = null != t ? t : this.atomState.eid || this.atomWorld.rootEid;
this.atomState.eid = e, this.atomWorld.pushInput(this, e, i({}, this.atomState));
}, e.prototype.emitByRouter = function(t, e) {
var n = null != e ? e : this.atomState.eid || this.atomWorld.rootEid;
this.atomState.eid = n;
var o = this.atomWorld.getAtomIns(t);
this.atomWorld.pendingRouterSignals.push({
fromRouterName: t,
signalName: o.to.atomName,
eidList: [ n ],
inputData: i({}, this.atomState)
});
}, e[ge] = !0, e;
}(Oi), ua = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
x: 0,
y: 0,
dx: 0,
dy: 0,
touchId: 0,
eid: 0,
localX: 0,
localY: 0,
multiTouchs: []
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ ze(un) ], e);
}(la), ca = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
contentX: 0,
contentY: 0,
eid: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(pn) ], e);
}(la), da = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
width: 0,
height: 0,
eid: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(fn) ], e);
}(la), ha = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
x: 0,
y: 0,
eid: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(mn) ], e);
}(la), pa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
text: "",
eid: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(vn) ], e);
}(la), fa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
frameEventName: "",
eid: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(yn) ], e);
}(la), ma = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
keyCode: 0,
isDown: !1
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(cn) ], e);
}(la), va = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
width: 0,
height: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(dn) ], e);
}(la), ya = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(hn) ], e);
}(la), _a = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
var t = Le(), e = Date.now() / 1e3, n = this.atomWorld.universe.storage, o = n.loadStorage(this.atomName);
if (o) {
var r = o.lastWorldStartTime;
e < r && (e = r);
}
return n.saveStorage(this.atomName, {
lastWorldStartTime: e
}), {
worldTime: 0,
framecount: 0,
deltaTime: this.atomWorld.frameTimeIncrement,
renderDeltaTime: this.atomWorld.frameTimeIncrement * this.atomWorld.renderTimeScale,
worldStartTime: e,
worldStartPerformance: t
};
}, e.prototype.emit = function() {
this.data.worldTime += this.atomWorld.frameTimeIncrement, this.data.framecount += 1, 
this.data.deltaTime = this.atomWorld.frameTimeIncrement, this.data.renderDeltaTime = this.atomWorld.frameTimeIncrement * this.atomWorld.renderTimeScale, 
t.prototype.emit.call(this);
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(ln) ], e);
}(la), ga = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
rootEid: 0,
appliedFeaturesVersion: void 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(_n) ], e);
}(la), Aa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_WorldResume") ], e);
}(la), Ca = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze("G_FAtom_UIEvent") ], e);
}(la), Ra = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ ze(Bn) ], e);
}(la), Sa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ ze(kn) ], e);
}(la), Ta = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ ze(Vn) ], e);
}(la), ba = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
param: ""
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ ze(Un) ], e);
}(la), wa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze("G_FAtom_TweenEvent") ], e);
}(la), Fa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
x: 0,
y: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze("G_FAtom_UniverseOffsetInput") ], e);
}(la);
t.OriginalCtrlOperation = void 0, (Di = t.OriginalCtrlOperation || (t.OriginalCtrlOperation = {})).Create = "create", 
Di.Destroy = "destroy", Di.Restart = "restart";
var Ea, Na, xa, Ia = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineInputData = function() {
return {
operation: t.OriginalCtrlOperation.Create,
worldId: ""
};
}, s([ He(an), l("design:type", Object) ], o.prototype, "rootDomain", void 0), s([ ze(Wn) ], o);
}(la), Da = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(An) ], e);
}(la), Ma = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
durationMs: 0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(Cn) ], e);
}(la), Wa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "OutputAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
var t = this.defineFunction();
this.atomState = function() {
for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
return t.apply(void 0, p([], h(e), !1));
};
}, e[ge] = !0, e;
}(Ni), Pa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.markSaveProgress();
};
}, s([ ze(Sn) ], e);
}(Wa), Oa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.showBanner();
};
}, s([ ze("G_FAtom_ADShowBanner") ], e);
}(Ni), La = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.hideBanner();
};
}, s([ ze("G_FAtom_ADHideBanner") ], e);
}(Ni), Ga = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
var e = t.atomWorld.universe.host;
e.setAdRequestWorld(t.atomWorld), e.showRewardVideo();
};
}, s([ ze("G_FAtom_ADShowRewardVideo") ], e);
}(Ni), Ba = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
var e = t.atomWorld.universe.host;
e.setAdRequestWorld(t.atomWorld), e.showInterstitial();
};
}, s([ ze("G_FAtom_ADShowInterstitial") ], e);
}(Ni), ka = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
var e = t.atomWorld.universe.host;
e.setAdRequestWorld(t.atomWorld), e.showFullscreenAd();
};
}, s([ ze("G_FAtom_ADShowFullscreenAd") ], e);
}(Ni), Va = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.loadRewardAd();
};
}, s([ ze("G_FAtom_ADLoadRewardAd") ], e);
}(Ni), Ua = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.loadInterstitialAd();
};
}, s([ ze("G_FAtom_ADLoadInterstitialAd") ], e);
}(Ni), za = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.loadFullscreenAd();
};
}, s([ ze("G_FAtom_ADLoadFullscreenAd") ], e);
}(Ni), Ha = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.loadAllAds();
};
}, s([ ze("G_FAtom_ADLoadAllAds") ], e);
}(Ni), ja = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.canShowAd();
};
}, s([ ze("G_FAtom_ADCanShowAd") ], e);
}(Ni), Ya = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.isAdLoading();
};
}, s([ ze("G_FAtom_ADIsAdLoading") ], e);
}(Ni), qa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
return t.atomWorld.universe.host.getAdReadyState(e);
};
}, s([ ze("G_FAtom_ADGetAdReadyState") ], e);
}(Ni), Xa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
void 0 === e && (e = 1), void 0 === n && (n = 15), t.atomWorld.universe.host.vibrate(e, n);
};
}, s([ ze("G_FAtom_Vibrate") ], e);
}(Wa), Qa = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getNetworkState();
};
}, s([ ze("G_FAtom_GetNetworkState") ], e);
}(Ni), Ja = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getNetworkType();
};
}, s([ ze("G_FAtom_GetNetworkType") ], e);
}(Ni), Ka = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.render.getWinSize();
};
}, s([ ze("G_FAtom_GetWinSize") ], e);
}(Ni), Za = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.render.getDesignSize();
};
}, s([ ze("G_FAtom_GetDesignSize") ], e);
}(Ni), $a = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.render.getSafeAreaRect();
};
}, s([ ze("G_FAtom_GetSafeArea") ], e);
}(Ni), ts = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
return t.atomWorld.universe.render.captureGameImage(e);
};
}, s([ ze("G_FAtom_CaptureGameImage") ], e);
}(Ni), es = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getUniverseOffset();
};
}, s([ ze("G_FAtom_GetUniverseOffset") ], e);
}(Ni), ns = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getDeviceInfo();
};
}, s([ ze("G_FAtom_GetDeviceInfo") ], e);
}(Wa), os = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getTotalRAM();
};
}, s([ ze("G_FAtom_GetTotalRAM") ], e);
}(Wa), rs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getAvailableRAM();
};
}, s([ ze("G_FAtom_GetAvailableRAM") ], e);
}(Wa), is = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getCPUCores();
};
}, s([ ze("G_FAtom_GetCPUCores") ], e);
}(Wa), as = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getCPUMaxFreq();
};
}, s([ ze("G_FAtom_GetCPUMaxFreq") ], e);
}(Wa), ss = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.isLowEndDevice();
};
}, s([ ze("G_FAtom_IsLowEndDevice") ], e);
}(Wa), ls = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(Tn) ], e);
}(Oi), us = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), s([ Xe, He(ln), l("design:type", Object) ], o.prototype, "update", void 0), 
s([ Qe(t.RouteMode.Direct), He(Tn), l("design:type", Object) ], o.prototype, "signal", void 0), 
s([ ze(bn) ], o);
}(Bi), cs = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineRuntimeData = function() {
return {
lastSaveTime: 0,
interval: 1
};
}, o.prototype.onExecute = function(e, n) {
var o = this.atomWorld.updateSignal.data.worldTime;
o - n.runtime.lastSaveTime >= n.runtime.interval ? n.runtime.lastSaveTime = o : this.router.receiveAction = t.ReceiveAction.Discard;
}, s([ qe, Ye, He(bn), l("design:type", Object) ], o.prototype, "router", void 0), 
s([ ze("G_FAtom_AutoSaveReceive") ], o);
}(xi), ds = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineRuntimeData = function() {
return {};
}, e.prototype.onExecute = function() {
this.saveProgress();
}, s([ Ye, He(Tn), l("design:type", Object) ], e.prototype, "signal", void 0), s([ He(Sn), l("design:type", Object) ], e.prototype, "saveProgress", void 0), 
s([ ze("G_FAtom_AutoSaveLogic") ], e);
}(xi), hs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {};
}, e.prototype.receive = function(e, n) {
t.prototype.receive.call(this, e, n), this.atomWorld.getAtomIns(sn).destroy(this.data.childWorldEid);
}, e[ge] = !0, s([ ze("G_FAtom_ExitRequest") ], e);
}(Ui), ps = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld;
return function(e, n) {
if (e > n) return e;
var o = 16807 * (Math.abs(t.randomSeed) % 2147483646 || 1) % 2147483647;
return t.randomSeed = o, e + (o - 1) / 2147483646 * (n - e);
};
}, s([ ze("G_FAtom_MathRandom") ], e);
}(Ni), fs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
return Math.floor(t.random(e, n + 1));
};
}, s([ He("G_FAtom_MathRandom"), l("design:type", Object) ], e.prototype, "random", void 0), 
s([ ze("G_FAtom_MathRandomInt") ], e);
}(Ni), ms = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.abs(t);
};
}, s([ ze("G_FAtom_MathAbs") ], e);
}(Ni), vs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.sign(t);
};
}, s([ ze("G_FAtom_MathSign") ], e);
}(Ni), ys = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.ceil(t);
};
}, s([ ze("G_FAtom_MathCeil") ], e);
}(Ni), _s = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.floor(t);
};
}, s([ ze("G_FAtom_MathFloor") ], e);
}(Ni), gs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.round(t);
};
}, s([ ze("G_FAtom_MathRound") ], e);
}(Ni), As = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.trunc(t);
};
}, s([ ze("G_FAtom_MathTrunc") ], e);
}(Ni), Cs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e) {
return Math.pow(t, e);
};
}, s([ ze("G_FAtom_MathPow") ], e);
}(Ni), Rs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.sqrt(t);
};
}, s([ ze("G_FAtom_MathSqrt") ], e);
}(Ni), Ss = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.cbrt(t);
};
}, s([ ze("G_FAtom_MathCbrt") ], e);
}(Ni), Ts = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return Math.hypot.apply(Math, p([], h(t), !1));
};
}, s([ ze("G_FAtom_MathHypot") ], e);
}(Ni), bs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.exp(t);
};
}, s([ ze("G_FAtom_MathExp") ], e);
}(Ni), ws = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.expm1(t);
};
}, s([ ze("G_FAtom_MathExpm1") ], e);
}(Ni), Fs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.log(t);
};
}, s([ ze("G_FAtom_MathLog") ], e);
}(Ni), Es = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.log10(t);
};
}, s([ ze("G_FAtom_MathLog10") ], e);
}(Ni), Ns = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.log2(t);
};
}, s([ ze("G_FAtom_MathLog2") ], e);
}(Ni), xs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.log1p(t);
};
}, s([ ze("G_FAtom_MathLog1p") ], e);
}(Ni), Is = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.sin(t);
};
}, s([ ze("G_FAtom_MathSin") ], e);
}(Ni), Ds = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.cos(t);
};
}, s([ ze("G_FAtom_MathCos") ], e);
}(Ni), Ms = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.tan(t);
};
}, s([ ze("G_FAtom_MathTan") ], e);
}(Ni), Ws = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.asin(t);
};
}, s([ ze("G_FAtom_MathAsin") ], e);
}(Ni), Ps = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.acos(t);
};
}, s([ ze("G_FAtom_MathAcos") ], e);
}(Ni), Os = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.atan(t);
};
}, s([ ze("G_FAtom_MathAtan") ], e);
}(Ni), Ls = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e) {
return Math.atan2(t, e);
};
}, s([ ze("G_FAtom_MathAtan2") ], e);
}(Ni), Gs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.sinh(t);
};
}, s([ ze("G_FAtom_MathSinh") ], e);
}(Ni), Bs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.cosh(t);
};
}, s([ ze("G_FAtom_MathCosh") ], e);
}(Ni), ks = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.tanh(t);
};
}, s([ ze("G_FAtom_MathTanh") ], e);
}(Ni), Vs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.asinh(t);
};
}, s([ ze("G_FAtom_MathAsinh") ], e);
}(Ni), Us = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.acosh(t);
};
}, s([ ze("G_FAtom_MathAcosh") ], e);
}(Ni), zs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.atanh(t);
};
}, s([ ze("G_FAtom_MathAtanh") ], e);
}(Ni), Hs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return Math.max.apply(Math, p([], h(t), !1));
};
}, s([ ze("G_FAtom_MathMax") ], e);
}(Ni), js = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function() {
for (var t = [], e = 0; e < arguments.length; e++) t[e] = arguments[e];
return Math.min.apply(Math, p([], h(t), !1));
};
}, s([ ze("G_FAtom_MathMin") ], e);
}(Ni), Ys = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.clz32(t);
};
}, s([ ze("G_FAtom_MathClz32") ], e);
}(Ni), qs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e) {
return Math.imul(t, e);
};
}, s([ ze("G_FAtom_MathImul") ], e);
}(Ni), Xs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return Math.fround(t);
};
}, s([ ze("G_FAtom_MathFround") ], e);
}(Ni), Qs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
return t.max(n, t.min(o, e));
};
}, s([ He("G_FAtom_MathMin"), l("design:type", Object) ], e.prototype, "min", void 0), 
s([ He("G_FAtom_MathMax"), l("design:type", Object) ], e.prototype, "max", void 0), 
s([ ze("G_FAtom_MathClamp") ], e);
}(Ni), Js = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e, n) {
return t + (e - t) * n;
};
}, s([ ze("G_FAtom_MathLerp") ], e);
}(Ni), Ks = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o, r) {
return t.hypot(o - e, r - n);
};
}, s([ He("G_FAtom_MathHypot"), l("design:type", Object) ], e.prototype, "hypot", void 0), 
s([ ze("G_FAtom_MathDistance") ], e);
}(Ni), Zs = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return t * (Math.PI / 180);
};
}, s([ ze("G_FAtom_MathDegToRad") ], e);
}(Ni), $s = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
return t * (180 / Math.PI);
};
}, s([ ze("G_FAtom_MathRadToDeg") ], e);
}(Ni), tl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e, n) {
return t === e ? 0 : (n - t) / (e - t);
};
}, s([ ze("G_FAtom_MathInverseLerp") ], e);
}(Ni), el = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
var r = t.clamp((o - e) / (n - e), 0, 1);
return r * r * (3 - 2 * r);
};
}, s([ He("G_FAtom_MathClamp"), l("design:type", Object) ], e.prototype, "clamp", void 0), 
s([ ze("G_FAtom_MathSmoothstep") ], e);
}(Ni), nl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
return t.abs(n - e) <= o ? n : e + Math.sign(n - e) * o;
};
}, s([ He("G_FAtom_MathAbs"), l("design:type", Object) ], e.prototype, "abs", void 0), 
s([ ze("G_FAtom_MathMoveTowards") ], e);
}(Ni), ol = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e) {
return 0 === e ? 0 : t - Math.floor(t / e) * e;
};
}, s([ ze("G_FAtom_MathRepeat") ], e);
}(Ni), rl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
if (0 === n) return 0;
var o = t.repeat(e, 2 * n);
return n - t.abs(o - n);
};
}, s([ He("G_FAtom_MathRepeat"), l("design:type", Object) ], e.prototype, "repeat", void 0), 
s([ He("G_FAtom_MathAbs"), l("design:type", Object) ], e.prototype, "abs", void 0), 
s([ ze("G_FAtom_MathPingPong") ], e);
}(Ni), il = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
return t.abs(e - n) < t.max(1e-6 * t.max(t.abs(e), t.abs(n)), 1e-6);
};
}, s([ He("G_FAtom_MathAbs"), l("design:type", Object) ], e.prototype, "abs", void 0), 
s([ He("G_FAtom_MathMax"), l("design:type", Object) ], e.prototype, "max", void 0), 
s([ ze("G_FAtom_MathApproximately") ], e);
}(Ni), al = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o, r, i) {
var a = t.inverseLerp(n, o, e);
return t.lerp(r, i, a);
};
}, s([ He("G_FAtom_MathInverseLerp"), l("design:type", Object) ], e.prototype, "inverseLerp", void 0), 
s([ He("G_FAtom_MathLerp"), l("design:type", Object) ], e.prototype, "lerp", void 0), 
s([ ze("G_FAtom_MathRemap") ], e);
}(Ni), sl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t, e) {
return 0 === e ? t : Math.round(t / e) * e;
};
}, s([ ze("G_FAtom_MathSnap") ], e);
}(Ni), ll = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
return t.repeat(e + 180, 360) - 180;
};
}, s([ He("G_FAtom_MathRepeat"), l("design:type", Object) ], e.prototype, "repeat", void 0), 
s([ ze("G_FAtom_MathWrapAngle") ], e);
}(Ni), ul = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o, r, i, a) {
return t.hypot(r - e, i - n, a - o);
};
}, s([ He("G_FAtom_MathHypot"), l("design:type", Object) ], e.prototype, "hypot", void 0), 
s([ ze("G_FAtom_MathDistance3D") ], e);
}(Ni), cl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
var o = t.repeat(n - e, 360);
return o > 180 && (o -= 360), o;
};
}, s([ He("G_FAtom_MathRepeat"), l("design:type", Object) ], e.prototype, "repeat", void 0), 
s([ ze("G_FAtom_MathDeltaAngle") ], e);
}(Ni), dl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
var r = t.deltaAngle(e, n);
return t.moveTowards(e, e + r, o);
};
}, s([ He("G_FAtom_MathDeltaAngle"), l("design:type", Object) ], e.prototype, "deltaAngle", void 0), 
s([ He("G_FAtom_MathMoveTowards"), l("design:type", Object) ], e.prototype, "moveTowards", void 0), 
s([ ze("G_FAtom_MathMoveTowardsAngle") ], e);
}(Ni), hl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
if (void 0 === n && (n = 1), e > 0 && n > 0) {
var o = 1 / e;
t.atomWorld.frameTimeIncrement = o, t.atomWorld.performanceCutoff = n, t.atomWorld.minimumUpdateInterval = n * o;
}
};
}, s([ ze("G_FAtom_SetFrameRate") ], e);
}(Ni), pl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
e > 0 && (t.atomWorld.renderTimeScale = e, t.atomWorld.universe.applyWorldRenderTimeScale(t.atomWorld.config.worldId));
};
}, s([ ze("G_FAtom_SetAnimationSpeed") ], e);
}(Ni), fl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return function(t) {
for (var e = 5381, n = 0; n < t.length; n++) e = (e << 5) + e + t.charCodeAt(n);
return e >>> 0;
};
}, s([ ze("G_FAtom_StringHash") ], e);
}(Ni), ml = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return t.atomWorld.universe.host.getLaunchParams();
};
}, s([ ze("G_FAtom_GetLaunchParams") ], e);
}(Ni), vl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
var e = new Date(t.realTime()), n = e.getFullYear(), o = String(e.getMonth() + 1).padStart(2, "0"), r = String(e.getDate()).padStart(2, "0");
return "".concat(n, "-").concat(o, "-").concat(r);
};
}, s([ He(Rn), l("design:type", Object) ], e.prototype, "realTime", void 0), s([ ze("G_FAtom_GetCurrentDate") ], e);
}(Ni), yl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
return 1e3 * (t.update.worldStartTime + t.update.worldTime);
};
}, s([ He("G_FAtom_Update"), l("design:type", Object) ], e.prototype, "update", void 0), 
s([ ze("G_FAtom_DateNow") ], e);
}(Ni), _l = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
return Le;
}, s([ ze("G_FAtom_PerformanceNow") ], e);
}(Ni), gl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
var n, o, r, i, a, s, l, u = 1e3 * t.update.worldStartTime + (Le() - t.update.worldStartPerformance);
if (!e) return u;
var c = new Date(u);
return new Date(null !== (n = e.year) && void 0 !== n ? n : c.getFullYear(), (null !== (o = e.month) && void 0 !== o ? o : c.getMonth() + 1) - 1, null !== (r = e.day) && void 0 !== r ? r : c.getDate(), null !== (i = e.hour) && void 0 !== i ? i : c.getHours(), null !== (a = e.minute) && void 0 !== a ? a : c.getMinutes(), null !== (s = e.second) && void 0 !== s ? s : c.getSeconds(), null !== (l = e.millisecond) && void 0 !== l ? l : c.getMilliseconds()).getTime();
};
}, s([ He("G_FAtom_Update"), l("design:type", Object) ], e.prototype, "update", void 0), 
s([ ze(Rn) ], e);
}(Ni);
t.TweenStepType = void 0, (Na = t.TweenStepType || (t.TweenStepType = {}))[Na.To = 0] = "To", 
Na[Na.By = 1] = "By", Na[Na.Delay = 2] = "Delay", Na[Na.Router = 3] = "Router", 
Na[Na.Parallel = 4] = "Parallel", Na[Na.Repeat = 5] = "Repeat", Na[Na.Destroy = 6] = "Destroy", 
t.TweenEasing = void 0, (xa = t.TweenEasing || (t.TweenEasing = {}))[xa.Linear = 0] = "Linear", 
xa[xa.QuadIn = 1] = "QuadIn", xa[xa.QuadOut = 2] = "QuadOut", xa[xa.QuadInOut = 3] = "QuadInOut", 
xa[xa.CubicIn = 4] = "CubicIn", xa[xa.CubicOut = 5] = "CubicOut", xa[xa.CubicInOut = 6] = "CubicInOut", 
xa[xa.QuartIn = 7] = "QuartIn", xa[xa.QuartOut = 8] = "QuartOut", xa[xa.QuartInOut = 9] = "QuartInOut", 
xa[xa.QuintIn = 10] = "QuintIn", xa[xa.QuintOut = 11] = "QuintOut", xa[xa.QuintInOut = 12] = "QuintInOut", 
xa[xa.SineIn = 13] = "SineIn", xa[xa.SineOut = 14] = "SineOut", xa[xa.SineInOut = 15] = "SineInOut", 
xa[xa.ExpoIn = 16] = "ExpoIn", xa[xa.ExpoOut = 17] = "ExpoOut", xa[xa.ExpoInOut = 18] = "ExpoInOut", 
xa[xa.CircIn = 19] = "CircIn", xa[xa.CircOut = 20] = "CircOut", xa[xa.CircInOut = 21] = "CircInOut", 
xa[xa.ElasticIn = 22] = "ElasticIn", xa[xa.ElasticOut = 23] = "ElasticOut", xa[xa.ElasticInOut = 24] = "ElasticInOut", 
xa[xa.BackIn = 25] = "BackIn", xa[xa.BackOut = 26] = "BackOut", xa[xa.BackInOut = 27] = "BackInOut", 
xa[xa.BounceIn = 28] = "BounceIn", xa[xa.BounceOut = 29] = "BounceOut", xa[xa.BounceInOut = 30] = "BounceInOut";
var Al = ((Ea = {})[t.TweenEasing.Linear] = function(t) {
return t;
}, Ea[t.TweenEasing.QuadIn] = function(t) {
return t * t;
}, Ea[t.TweenEasing.QuadOut] = function(t) {
return t * (2 - t);
}, Ea[t.TweenEasing.QuadInOut] = function(t) {
return t < .5 ? 2 * t * t : (4 - 2 * t) * t - 1;
}, Ea[t.TweenEasing.CubicIn] = function(t) {
return t * t * t;
}, Ea[t.TweenEasing.CubicOut] = function(t) {
return --t * t * t + 1;
}, Ea[t.TweenEasing.CubicInOut] = function(t) {
return t < .5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
}, Ea[t.TweenEasing.QuartIn] = function(t) {
return t * t * t * t;
}, Ea[t.TweenEasing.QuartOut] = function(t) {
return 1 - --t * t * t * t;
}, Ea[t.TweenEasing.QuartInOut] = function(t) {
return t < .5 ? 8 * t * t * t * t : 1 - 8 * --t * t * t * t;
}, Ea[t.TweenEasing.QuintIn] = function(t) {
return t * t * t * t * t;
}, Ea[t.TweenEasing.QuintOut] = function(t) {
return 1 + --t * t * t * t * t;
}, Ea[t.TweenEasing.QuintInOut] = function(t) {
return t < .5 ? 16 * t * t * t * t * t : 1 + 16 * --t * t * t * t * t;
}, Ea[t.TweenEasing.SineIn] = function(t) {
return 1 - Math.cos(t * Math.PI / 2);
}, Ea[t.TweenEasing.SineOut] = function(t) {
return Math.sin(t * Math.PI / 2);
}, Ea[t.TweenEasing.SineInOut] = function(t) {
return .5 * (1 - Math.cos(Math.PI * t));
}, Ea[t.TweenEasing.ExpoIn] = function(t) {
return 0 === t ? 0 : Math.pow(2, 10 * (t - 1));
}, Ea[t.TweenEasing.ExpoOut] = function(t) {
return 1 === t ? 1 : 1 - Math.pow(2, -10 * t);
}, Ea[t.TweenEasing.ExpoInOut] = function(t) {
return 0 === t || 1 === t ? t : (t *= 2) < 1 ? .5 * Math.pow(2, 10 * (t - 1)) : .5 * (2 - Math.pow(2, -10 * (t - 1)));
}, Ea[t.TweenEasing.CircIn] = function(t) {
return 1 - Math.sqrt(1 - t * t);
}, Ea[t.TweenEasing.CircOut] = function(t) {
return Math.sqrt(1 - --t * t);
}, Ea[t.TweenEasing.CircInOut] = function(t) {
return (t *= 2) < 1 ? -.5 * (Math.sqrt(1 - t * t) - 1) : .5 * (Math.sqrt(1 - (t -= 2) * t) + 1);
}, Ea[t.TweenEasing.ElasticIn] = function(t) {
return 0 === t || 1 === t ? t : -Math.pow(2, 10 * (t - 1)) * Math.sin(5 * (t - 1.1) * Math.PI);
}, Ea[t.TweenEasing.ElasticOut] = function(t) {
return 0 === t || 1 === t ? t : Math.pow(2, -10 * t) * Math.sin(5 * (t - .1) * Math.PI) + 1;
}, Ea[t.TweenEasing.ElasticInOut] = function(t) {
return 0 === t || 1 === t ? t : (t *= 2) < 1 ? -.5 * Math.pow(2, 10 * (t - 1)) * Math.sin(5 * (t - 1.1) * Math.PI) : .5 * Math.pow(2, -10 * (t - 1)) * Math.sin(5 * (t - 1.1) * Math.PI) + 1;
}, Ea[t.TweenEasing.BackIn] = function(t) {
return t * t * (2.70158 * t - 1.70158);
}, Ea[t.TweenEasing.BackOut] = function(t) {
return --t * t * (2.70158 * t + 1.70158) + 1;
}, Ea[t.TweenEasing.BackInOut] = function(t) {
var e = 2.5949095;
return (t *= 2) < 1 ? t * t * ((e + 1) * t - e) * .5 : .5 * ((t -= 2) * t * ((e + 1) * t + e) + 2);
}, Ea[t.TweenEasing.BounceIn] = function(e) {
return 1 - Al[t.TweenEasing.BounceOut](1 - e);
}, Ea[t.TweenEasing.BounceOut] = function(t) {
return t < 1 / 2.75 ? 7.5625 * t * t : t < 2 / 2.75 ? 7.5625 * (t -= 1.5 / 2.75) * t + .75 : t < 2.5 / 2.75 ? 7.5625 * (t -= 2.25 / 2.75) * t + .9375 : 7.5625 * (t -= 2.625 / 2.75) * t + .984375;
}, Ea[t.TweenEasing.BounceInOut] = function(e) {
return e < .5 ? .5 * Al[t.TweenEasing.BounceIn](2 * e) : .5 * Al[t.TweenEasing.BounceOut](2 * e - 1) + .5;
}, Ea), Cl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
if (null != e && Array.isArray(n)) {
var r = t.runner.runtime, i = r.tasksMap[e];
i || (i = [], r.tasksMap[e] = i), i.push({
eid: e,
steps: n,
tag: o,
currentStepIndex: 0,
elapsedTime: 0,
isFinished: !1,
stepData: void 0
});
}
};
}, s([ He(Fn), l("design:type", Object) ], e.prototype, "runner", void 0), s([ ze("G_FAtom_Tween") ], e);
}(Ni), Rl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
if (void 0 !== e) {
var o = t.runner.runtime;
if (null !== e) {
if (!(a = o.tasksMap[e])) return;
if (n) {
for (var r = a.length - 1; r >= 0; r--) a[r].tag === n && a.splice(r, 1);
0 === a.length && delete o.tasksMap[e];
} else delete o.tasksMap[e];
} else if (n) for (var i in o.tasksMap) {
var a;
for (r = (a = o.tasksMap[i]).length - 1; r >= 0; r--) a[r].tag === n && a.splice(r, 1);
0 === a.length && delete o.tasksMap[i];
}
}
};
}, s([ He(Fn), l("design:type", Object) ], e.prototype, "runner", void 0), s([ ze(Mn) ], e);
}(Ni), Sl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
progress: 0,
isDone: !1,
error: ""
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(Ln) ], e);
}(la), Tl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = {}, n = function(n, o, r, i) {
if (!t.atomWorld.disposed) {
var a = e[n];
if (a) {
var s = t.atomWorld.getAtomIns(Ln), l = s.data;
l.progress = o, l.isDone = r, l.error = i, s.emitByRouter(a), (r || i) && delete e[n];
}
}
};
return function(o, r) {
var i = o[ye], a = t.atomWorld.getAtomIns(i).atomState;
if (null == a ? void 0 : a.silent) {
if (r) {
var s = r[ye];
e[i] = s;
}
!function(e, o) {
u(t, void 0, void 0, function() {
var t, r;
return c(this, function(i) {
switch (i.label) {
case 0:
if (!this.atomWorld) return [ 2 ];
n(e, 0, !1, ""), i.label = 1;

case 1:
return i.trys.push([ 1, 3, , 4 ]), [ 4, this.atomWorld.getAtomIns(e).executeLoadDef(o, function(t) {
n(e, t, !1, "");
}) ];

case 2:
return i.sent(), this.atomWorld ? (n(e, 1, !0, ""), [ 3, 4 ]) : [ 2 ];

case 3:
return t = i.sent(), r = t instanceof Error ? t.message : String(t), r = "[AtomEngine] SilentLoad Failed: loadAtomName=".concat(e, " paths=").concat(JSON.stringify(o.paths), " directories=").concat(JSON.stringify(o.directories), " ---\x3e ").concat(r), 
this.atomWorld ? (n(e, 0, !1, r), [ 3, 4 ]) : [ 2 ];

case 4:
return [ 2 ];
}
});
});
}(i, a);
}
};
}, s([ He(Ln), l("design:type", Object) ], e.prototype, "input", void 0), s([ ze("G_FAtom_SilentLoad") ], e);
}(Ni), bl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
url: "",
jsonData: "",
error: ""
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(Gn) ], e);
}(la), wl = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineFunction = function() {
var e = this;
return function(n, o) {
var r = o[ye];
u(e, void 0, void 0, function() {
var e, o, i, a, s, l, u, d, h;
return c(this, function(c) {
switch (c.label) {
case 0:
e = "", o = "", c.label = 1;

case 1:
return c.trys.push([ 1, 3, , 4 ]), i = go(n), a = i.featureName, s = i.assetPath, 
[ 4, this.atomWorld.universe.asset.loadAsset(a, s, t.LoaderAssetType.Json) ];

case 2:
return l = c.sent(), !this.atomWorld || this.atomWorld.disposed ? [ 2 ] : (o = l.json, 
[ 3, 4 ]);

case 3:
return u = c.sent(), e = u instanceof Error ? u.message : String(u), [ 3, 4 ];

case 4:
return !this.atomWorld || this.atomWorld.disposed || (d = this.atomWorld.getAtomIns(Gn), 
(h = d.data).url = n, h.jsonData = o, h.error = e, d.emitByRouter(r)), [ 2 ];
}
});
});
};
}, s([ He(Gn), l("design:type", Object) ], o.prototype, "input", void 0), s([ ze("G_FAtom_ReadJsonAsset") ], o);
}(Ni), Fl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
return t.atomWorld.universe.asset.isBundleDownloaded(e);
};
}, s([ ze("G_FAtom_IsBundleDownloaded") ], e);
}(Ni), El = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
var o = go(e), r = o.featureName, i = o.assetPath;
return t.atomWorld.universe.asset.isAssetDownloaded(r, i, n);
};
}, s([ ze("G_FAtom_IsAssetDownloaded") ], e);
}(Ni), Nl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
var n = go(e), o = n.featureName, r = n.assetPath;
return t.atomWorld.universe.asset.isDirDownloaded(o, r);
};
}, s([ ze("G_FAtom_IsDirDownloaded") ], e);
}(Ni), xl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.loadedFeatureNames;
return function(e) {
return t.has(e);
};
}, s([ ze("G_FAtom_HasFeature") ], e);
}(Ni), Il = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.featureResolver;
return function(e) {
return t.hasFeatureInUniverse(e);
};
}, s([ ze("G_FAtom_HasUniverseFeature") ], e);
}(Ni), Dl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.storage;
return function(e, n) {
t.saveJsonEntry(e, n);
};
}, s([ ze("G_FAtom_SaveJson") ], e);
}(Ni), Ml = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.storage;
return function(e) {
return t.loadJsonEntry(e);
};
}, s([ ze("G_FAtom_LoadJson") ], e);
}(Ni), Wl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.storage;
return function(e) {
t.removeJsonEntry(e);
};
}, s([ ze("G_FAtom_RemoveJson") ], e);
}(Ni), Pl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.storage;
return function(e) {
return t.readRawItem(e);
};
}, s([ ze("G_FAtom_GetStorageItem") ], e);
}(Ni), Ol = function(t, e, n, o, r, i, a, s, l, u, c) {
var d = e + e, h = n + n, p = o + o, f = e * d, m = e * h, v = e * p, y = n * h, _ = n * p, g = o * p, A = r * d, C = r * h, R = r * p;
return t[0] = (1 - (y + g)) * l, t[1] = (m + R) * l, t[2] = (v - C) * l, t[3] = 0, 
t[4] = (m - R) * u, t[5] = (1 - (f + g)) * u, t[6] = (_ + A) * u, t[7] = 0, t[8] = (v + C) * c, 
t[9] = (_ - A) * c, t[10] = (1 - (f + y)) * c, t[11] = 0, t[12] = i, t[13] = a, 
t[14] = s, t[15] = 1, t;
}, Ll = function(t, e, n) {
var o = e[0], r = e[1], i = e[2], a = e[3], s = e[4], l = e[5], u = e[6], c = e[7], d = e[8], h = e[9], p = e[10], f = e[11], m = e[12], v = e[13], y = e[14], _ = e[15], g = n[0], A = n[1], C = n[2], R = n[3];
return t[0] = g * o + A * s + C * d + R * m, t[1] = g * r + A * l + C * h + R * v, 
t[2] = g * i + A * u + C * p + R * y, t[3] = g * a + A * c + C * f + R * _, g = n[4], 
A = n[5], C = n[6], R = n[7], t[4] = g * o + A * s + C * d + R * m, t[5] = g * r + A * l + C * h + R * v, 
t[6] = g * i + A * u + C * p + R * y, t[7] = g * a + A * c + C * f + R * _, g = n[8], 
A = n[9], C = n[10], R = n[11], t[8] = g * o + A * s + C * d + R * m, t[9] = g * r + A * l + C * h + R * v, 
t[10] = g * i + A * u + C * p + R * y, t[11] = g * a + A * c + C * f + R * _, g = n[12], 
A = n[13], C = n[14], R = n[15], t[12] = g * o + A * s + C * d + R * m, t[13] = g * r + A * l + C * h + R * v, 
t[14] = g * i + A * u + C * p + R * y, t[15] = g * a + A * c + C * f + R * _, t;
}, Gl = function(t, e) {
var n = e[0], o = e[1], r = e[2], i = e[3], a = e[4], s = e[5], l = e[6], u = e[7], c = e[8], d = e[9], h = e[10], p = e[11], f = e[12], m = e[13], v = e[14], y = e[15], _ = n * s - o * a, g = n * l - r * a, A = n * u - i * a, C = o * l - r * s, R = o * u - i * s, S = r * u - i * l, T = c * m - d * f, b = c * v - h * f, w = c * y - p * f, F = d * v - h * m, E = d * y - p * m, N = h * y - p * v, x = _ * N - g * E + A * F + C * w - R * b + S * T;
if (x) return x = 1 / x, t[0] = (s * N - l * E + u * F) * x, t[1] = (r * E - o * N - i * F) * x, 
t[2] = (m * S - v * R + y * C) * x, t[3] = (h * R - d * S - p * C) * x, t[4] = (l * w - a * N - u * b) * x, 
t[5] = (n * N - r * w + i * b) * x, t[6] = (v * A - f * S - y * g) * x, t[7] = (c * S - h * A + p * g) * x, 
t[8] = (a * E - s * w + u * T) * x, t[9] = (o * w - n * E - i * T) * x, t[10] = (f * R - m * A + y * _) * x, 
t[11] = (d * A - c * R - p * _) * x, t[12] = (s * b - a * F - l * T) * x, t[13] = (n * F - o * b + r * T) * x, 
t[14] = (m * g - f * C - v * _) * x, t[15] = (c * C - d * g + h * _) * x, t;
}, Bl = function(t, e, n) {
var o = n.x, r = n.y, i = n.z, a = e[3] * o + e[7] * r + e[11] * i + e[15];
a = a || 1, t.x = (e[0] * o + e[4] * r + e[8] * i + e[12]) / a, t.y = (e[1] * o + e[5] * r + e[9] * i + e[13]) / a, 
t.z = (e[2] * o + e[6] * r + e[10] * i + e[14]) / a;
}, kl = function(t) {
return t.fill(0), t[0] = t[5] = t[10] = t[15] = 1, t;
}, Vl = new Float32Array(16), Ul = new Float32Array(16), zl = new Float32Array(16);
function Hl(t, e, n) {
return void 0 === t ? n : Array.isArray(t) && "function" == typeof t[0] ? t[0](e) : t;
}
function jl(t, e, n) {
var o, r, i, a, s, l, u, c = Hl(e.x, n, 0), d = Hl(e.y, n, 0), h = Hl(e.z, n, 0);
if (void 0 !== e.angle) {
var p = Hl(e.angle, n, 0) * Math.PI / 360;
o = 0, r = 0, i = Math.sin(p), a = Math.cos(p);
} else o = Hl(e.quatX, n, 0), r = Hl(e.quatY, n, 0), i = Hl(e.quatZ, n, 0), a = Hl(e.quatW, n, 1);
void 0 !== e.scale ? s = l = u = Hl(e.scale, n, 1) : (s = Hl(e.scaleX, n, 1), l = Hl(e.scaleY, n, 1), 
u = Hl(e.scaleZ, n, 1)), Ol(t, o, r, i, a, c, d, h, s, l, u);
}
function Yl(t, e, n, o) {
var r, i;
kl(o);
try {
for (var a = d(t), s = a.next(); !s.done; s = a.next()) {
var l = e[s.value];
l && (jl(zl, l, n), Ll(o, o, zl));
}
} catch (t) {
r = {
error: t
};
} finally {
try {
s && !s.done && (i = a.return) && i.call(a);
} finally {
if (r) throw r.error;
}
}
}
function ql(t, e, n, o, r) {
for (var i, a, s, l, u = [], c = t; void 0 !== c; ) {
u.push(c);
var d = o.getParent(c);
if (c === e || void 0 === d) break;
c = d;
}
kl(r);
for (var h = u.length - 1; h >= 0; h--) {
var p = u[h];
if (Ol(Vl, n.quatX[p] || 0, n.quatY[p] || 0, n.quatZ[p] || 0, null !== (i = n.quatW[p]) && void 0 !== i ? i : 1, n.x[p] || 0, n.y[p] || 0, n.z[p] || 0, null !== (a = n.scaleX[p]) && void 0 !== a ? a : 1, null !== (s = n.scaleY[p]) && void 0 !== s ? s : 1, null !== (l = n.scaleZ[p]) && void 0 !== l ? l : 1), 
Ll(r, r, Vl), h > 0) {
var f = o.mountSlots.get(u[h - 1]);
if (f) {
var m = o.atomWorld.universe.getSlotData(o.atomWorld.config.worldId, p, f);
m && m.path.length && (Yl(m.path, m.propsMap, p, Ul), Ll(r, r, Ul));
}
}
}
}
var Xl, Ql, Jl, Kl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = new Float32Array(16);
return function(n) {
return ql(n, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, e), {
x: e[12],
y: e[13],
z: e[14]
};
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ He(En), l("design:type", Object) ], e.prototype, "childOf", void 0), 
s([ ze("G_FAtom_GetWorldPosition") ], e);
}(Ni), Zl = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = new Float32Array(16), n = {
x: 0,
y: 0,
z: 0
};
return function(o, r) {
var a = r || {
x: 0,
y: 0,
z: 0
};
return ql(o, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, e), Bl(n, e, a), 
i({}, n);
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ He(En), l("design:type", Object) ], e.prototype, "childOf", void 0), 
s([ ze("G_FAtom_ConvertToWorld") ], e);
}(Ni), $l = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = new Float32Array(16), n = new Float32Array(16), o = new Float32Array(16), r = {
x: 0,
y: 0,
z: 0
}, a = {
x: 0,
y: 0,
z: 0
};
return function(s, l, u) {
return ql(l, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, e), Bl(r, e, u), 
ql(s, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, n), Gl(o, n) && Bl(a, o, r), 
i({}, a);
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ He(En), l("design:type", Object) ], e.prototype, "childOf", void 0), 
s([ ze("G_FAtom_ConvertToNode") ], e);
}(Ni), tu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = new Float32Array(16), n = new Float32Array(16), o = new Float32Array(16), r = new Float32Array(16), a = {
x: 0,
y: 0,
z: 0
}, s = {
x: 0,
y: 0,
z: 0
};
return function(l, u, c, d) {
ql(c, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, e), Bl(a, e, d), ql(l, t.atomWorld.rootEid, t.rootDomain.transform, t.childOf, n);
var h = t.atomWorld.universe.getSlotData(t.atomWorld.config.worldId, l, u);
return h && (Yl(h.path, h.propsMap, l, o), Ll(n, n, o)), Gl(r, n) && Bl(s, r, a), 
i({}, s);
};
}, s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), s([ He(En), l("design:type", Object) ], e.prototype, "childOf", void 0), 
s([ ze("G_FAtom_ConvertToSlot") ], e);
}(Ni), eu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
if (null == o ? void 0 : o.keepWorldPosition) {
var r = t.atomWorld.universe.computeReparentLocalPosition(t.atomWorld.config.worldId, e, n, o.slotName);
r && (t.rootDomain.transform.x.set(e, r.x), t.rootDomain.transform.y.set(e, r.y), 
t.rootDomain.transform.z.set(e, r.z));
}
t.childOf.addChild(n, e, null == o ? void 0 : o.slotName);
};
}, s([ He(En), l("design:type", Object) ], e.prototype, "childOf", void 0), s([ He(an), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_ChangeParent") ], e);
}(Ni), nu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.destroyUniverse(e);
};
}, s([ ze("G_FAtom_DestroyUniverse") ], e);
}(Wa), ou = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
void 0 === e && (e = !1), e && t.atomWorld.universe.forceSaveAllStorage(), t.atomWorld.universe.runtime.restartApplication();
};
}, s([ ze("G_FAtom_RestartApplication") ], e);
}(Wa), ru = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.restartWorld(e);
};
}, s([ ze("G_FAtom_RestartWorld") ], e);
}(Wa), iu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
t.atomWorld.universe.host.setRenderMountMode(e, n), t.atomWorld.universe.render.updateRootNodeAlignment();
};
}, s([ ze("G_FAtom_SetRenderMountMode") ], e);
}(Wa), au = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.dismissEntryRedDot(e);
};
}, s([ ze("G_FAtom_DismissEntryRedDot") ], e);
}(Wa), su = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
t.atomWorld.universe.host.setUniverseParentSize(e, n, o);
};
}, s([ ze("G_FAtom_SetUniverseParentSize") ], e);
}(Wa), lu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.openHostView(e);
};
}, s([ ze("G_FAtom_OpenHostView") ], e);
}(Wa), uu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.showNativeToast(e);
};
}, s([ ze("G_FAtom_ShowNativeToast") ], e);
}(Wa), cu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.showTips(e);
};
}, s([ ze("G_FAtom_ShowTips") ], e);
}(Wa), du = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.showXingYunLoading();
};
}, s([ ze("G_FAtom_ShowXingYunLoading") ], e);
}(Wa), hu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.hideXingYunLoading();
};
}, s([ ze("G_FAtom_HideXingYunLoading") ], e);
}(Wa), pu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.showXingYunLoadingFailed();
};
}, s([ ze("G_FAtom_ShowXingYunLoadingFailed") ], e);
}(Wa), fu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.showXingYunLoadingNoNet();
};
}, s([ ze("G_FAtom_ShowXingYunLoadingNoNet") ], e);
}(Wa), mu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.showXingYunNoNetPopup();
};
}, s([ ze("G_FAtom_ShowXingYunNoNetPopup") ], e);
}(Wa), vu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function() {
t.atomWorld.universe.host.hideXingYunNoNetPopup();
};
}, s([ ze("G_FAtom_HideXingYunNoNetPopup") ], e);
}(Wa), yu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(wn) ], e);
}(Oi), _u = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), s([ Xe, He(ln), l("design:type", Object) ], o.prototype, "update", void 0), 
s([ Qe(t.RouteMode.Direct), He(wn), l("design:type", Object) ], o.prototype, "signal", void 0), 
s([ ze("G_FAtom_TweenRunnerRouter") ], o);
}(Bi), gu = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineRuntimeData = function() {
return {
tasksMap: {}
};
}, o.prototype.onExecute = function(t, e) {
var n = this.update.renderDeltaTime, o = e.runtime.tasksMap;
for (var r in o) {
var i = Number(r), a = o[i];
if (a) for (var s = a.length - 1; s >= 0; s--) {
var l = a[s], u = {
elapsedTime: l.elapsedTime,
data: l.stepData
}, c = l.steps[l.currentStepIndex];
this._runStep(l.eid, n, u, c) ? this._nextStep(l) : (l.elapsedTime = u.elapsedTime, 
l.stepData = u.data), l.isFinished && a.splice(s, 1);
}
a && 0 !== a.length || delete o[i];
}
}, o.prototype._runStep = function(e, n, o, r) {
switch (o.elapsedTime += n, r[0]) {
case t.TweenStepType.To:
return this._handleInterpolation(e, o, r, !1);

case t.TweenStepType.By:
return this._handleInterpolation(e, o, r, !0);

case t.TweenStepType.Delay:
return o.elapsedTime >= r[1];

case t.TweenStepType.Router:
return this._handleRouterStep(e, r), !0;

case t.TweenStepType.Destroy:
return this._handleDestroyStep(e, r), !0;

case t.TweenStepType.Parallel:
return this._handleParallel(e, n, o, r);

case t.TweenStepType.Repeat:
return this._handleRepeat(e, n, o, r);

default:
return !0;
}
}, o.prototype._handleInterpolation = function(e, n, o, r) {
var i = h(o, 5), a = i[1], s = i[2], l = i[3], u = i[4], c = void 0 === u ? t.TweenEasing.Linear : u;
if (!n.data) {
var d = {}, p = this._collectLeafPaths(s);
for (var f in p) d[f] = this._getDeepValue(a, f.split("."), e);
n.data = d;
}
var m = n.data, v = l > 0 ? Math.min(1, n.elapsedTime / l) : 1, y = v;
for (var f in c !== t.TweenEasing.Linear && (y = Al[c](v)), m) {
var _ = f.split("."), g = m[f], A = this._getNestedValue(s, _);
if ("number" == typeof A && "number" == typeof g) {
var C = r ? A : A - g;
this._setDeepValue(a, _, e, g + C * y);
} else v >= 1 && this._setDeepValue(a, _, e, A);
}
return v >= 1;
}, o.prototype._handleParallel = function(t, e, n, o) {
var r = h(o, 2)[1];
n.data || (n.data = {
subStates: r.map(function() {
return {
elapsedTime: 0,
data: void 0,
finished: !1
};
})
});
for (var i = n.data, a = !0, s = 0; s < r.length; s++) {
var l = i.subStates[s];
if (!l.finished) {
var u = {
elapsedTime: l.elapsedTime,
data: l.data
};
this._runStep(t, e, u, r[s]) ? l.finished = !0 : (l.elapsedTime = u.elapsedTime, 
l.data = u.data, a = !1);
}
}
return a;
}, o.prototype._handleRepeat = function(t, e, n, o) {
var r = h(o, 3), i = r[1], a = r[2];
n.data || (n.data = {
iter: 0,
subIdx: 0,
subElapsed: 0,
subData: void 0
});
for (var s = n.data, l = e; s.iter < i || 0 === i; ) {
var u = a[s.subIdx], c = {
elapsedTime: s.subElapsed,
data: s.subData
};
if (!this._runStep(t, l, c, u)) return s.subElapsed = c.elapsedTime, s.subData = c.data, 
!1;
if (s.subIdx++, s.subElapsed = 0, s.subData = void 0, l = 0, s.subIdx >= a.length && (s.iter++, 
s.subIdx = 0), i > 0 && s.iter >= i) return !0;
}
return !0;
}, o.prototype._handleRouterStep = function(t, e) {
var n = h(e), o = n[1], r = n.slice(2), i = o[ye], a = this.atomWorld.getAtomIns(i);
0 === r.length && r.push(t), this.atomWorld.pendingRouterSignals.push({
fromRouterName: i,
signalName: a.to.atomName,
eidList: r
});
}, o.prototype._handleDestroyStep = function(t, e) {
var n, o, r = h(e).slice(1);
0 === r.length && r.push(t);
var i = this.atomWorld.getAtomIns(Dn).atomState.name;
try {
for (var a = d(r), s = a.next(); !s.done; s = a.next()) {
var l = s.value, u = i[l];
this.atomWorld.getAtomIns(u).destroy(l);
}
} catch (t) {
n = {
error: t
};
} finally {
try {
s && !s.done && (o = a.return) && o.call(a);
} finally {
if (n) throw n.error;
}
}
}, o.prototype._nextStep = function(t) {
t.currentStepIndex++, t.elapsedTime = 0, t.stepData = void 0, t.currentStepIndex >= t.steps.length && (t.isFinished = !0);
}, o.prototype._collectLeafPaths = function(t, e) {
void 0 === e && (e = "");
var n = {};
for (var o in t) {
var r = t[o], i = e ? "".concat(e, ".").concat(o) : o;
r && "object" == typeof r && !Array.isArray(r) ? Object.assign(n, this._collectLeafPaths(r, i)) : n[i] = r;
}
return n;
}, o.prototype._resolvePath = function(t, e, n) {
var o, r = t, i = e;
if ("EntityComponentAtom" === t[_e]) {
var a = e[0], s = t[a];
if (!s) return;
if (1 === e.length) return {
parent: t,
key: a,
isComponent: !0
};
if (2 === e.length && (null === (o = s[e[1]]) || void 0 === o ? void 0 : o.set)) return {
parent: s,
key: e[1],
isComponent: !0
};
r = s[n], i = e.slice(1);
}
for (var l = 0; l < i.length - 1; l++) if ("object" != typeof (r = null == r ? void 0 : r[i[l]]) || null === r) return;
var u = i[i.length - 1];
return r ? {
parent: r,
key: u,
isComponent: !1
} : void 0;
}, o.prototype._getNestedValue = function(t, e) {
var n, o, r = t;
try {
for (var i = d(e), a = i.next(); !a.done; a = i.next()) {
var s = a.value;
r = null == r ? void 0 : r[s];
}
} catch (t) {
n = {
error: t
};
} finally {
try {
a && !a.done && (o = i.return) && o.call(i);
} finally {
if (n) throw n.error;
}
}
return r;
}, o.prototype._getDeepValue = function(t, e, n) {
var o, r = this._resolvePath(t, e, n);
if (r) {
var i = r.parent, a = r.key;
return r.isComponent ? null === (o = i[a]) || void 0 === o ? void 0 : o[n] : i[a];
}
}, o.prototype._setDeepValue = function(t, e, n, o) {
var r = this._resolvePath(t, e, n);
if (r) {
var i = r.parent, a = r.key;
r.isComponent ? i[a].set(n, o) : i[a] = o;
}
}, s([ Ye, He(wn), l("design:type", Object) ], o.prototype, "signal", void 0), s([ He(ln), l("design:type", Object) ], o.prototype, "update", void 0), 
s([ ze(Fn) ], o);
}(xi), Au = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.host;
return function(e, n) {
void 0 === n && (n = {}), t.track(e, n);
};
}, s([ ze("G_FAtom_Track") ], e);
}(Wa), Cu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.host;
return function(e) {
t.setThinkingDataEnabled(e);
};
}, s([ ze("G_FAtom_SetThinkingDataEnabled") ], e);
}(Wa), Ru = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this.atomWorld.universe.host;
return function(e) {
t.reportGameRuntime(e);
};
}, s([ ze("G_FAtom_ReportGameRuntime") ], e);
}(Wa), Su = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
t.atomWorld.universe.host.setUserPreferences(e);
};
}, s([ ze("G_FAtom_SetUserPreferences") ], e);
}(Wa), Tu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
var n = t.atomWorld.universe.host, o = t.atomWorld;
n.requestAlgorithmOffer(e).then(function(t) {
n.onAlgorithmOfferResult(t, o);
}).catch(function(r) {
n.onAlgorithmOfferResult(t.createErrorResponse(e, r), o);
});
};
}, e.prototype.createErrorResponse = function(t, e) {
return {
requestId: t.requestId,
requestedAlgorithmId: t.algorithmId,
blockIds: [],
blockNames: [],
blockPoses: [],
blockShapes: [],
sdkBackend: "EXCEPTION",
isSdkFallback: !0,
errorCode: 1,
errorMsg: e instanceof Error ? e.message : String(e || ""),
extra: null
};
}, s([ ze("G_FAtom_RequestAlgorithmOffer") ], e);
}(Wa), bu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
requestId: "",
requestedAlgorithmId: 0,
actualAlgorithmType: 0,
blockIds: [],
blockNames: [],
blockPoses: [],
blockShapes: [],
sdkBackend: "UNKNOWN",
isSdkFallback: !1,
errorCode: 0,
errorMsg: "",
extra: null
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze(Pn) ], e);
}(la), wu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e) {
return t.atomWorld.universe.host.getBlockShape(e);
};
}, s([ ze("G_FAtom_GetBlockShape") ], e);
}(Ni), Fu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
return t.atomWorld.universe.host.checkLive(e, n, o);
};
}, s([ ze("G_FAtom_CheckLive") ], e);
}(Ni), Eu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n) {
t.atomWorld.universe.host.registerAlgorithmBoardCallbacks(e, n);
};
}, s([ ze("G_FAtom_RegisterAlgorithmBoardCallbacks") ], e);
}(Ni), Nu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this;
return function(e, n, o) {
t.atomWorld.universe.host.registerAlgorithmSnapshotCallbacks(e, n, o);
};
}, s([ ze("G_FAtom_RegisterAlgorithmSnapshotCallbacks") ], e);
}(Ni);
t.RenderMountMode = void 0, (Xl = t.RenderMountMode || (t.RenderMountMode = {})).Embedded = "embedded", 
Xl.Fullscreen = "fullscreen", t.AdResultState = void 0, (Ql = t.AdResultState || (t.AdResultState = {}))[Ql.Success = 1] = "Success", 
Ql[Ql.Fail = 2] = "Fail", Ql[Ql.Timeout = 3] = "Timeout", t.AdType = void 0, (Jl = t.AdType || (t.AdType = {})).Reward = "reward", 
Jl.Interstitial = "inter", Jl.Fullscreen = "fullscreen", Jl.Banner = "banner", t.HostViewType = void 0, 
(t.HostViewType || (t.HostViewType = {})).XingYunGameList = "xingyun_game_list";
var xu = function() {
function t() {
this.universe = null, this._mainWorld = null, this._adRequestWorld = null, this._universeOffset = {
x: 0,
y: 0
};
}
return t.prototype.setMainWorld = function(t) {
this._mainWorld = t;
}, t.prototype.setAdRequestWorld = function(t) {
this._adRequestWorld = t;
}, t.prototype.clearAdRequestWorld = function(t) {
this._adRequestWorld === t && (this._adRequestWorld = null);
}, t.prototype.getUniverseOffset = function() {
return this._universeOffset;
}, t.prototype.isWorldBundlesDownloaded = function(t) {
var e, n;
if (!this.universe.asset.isWorldDownloaded(t)) return !1;
var o = this.universe.featureResolver.getFeatureSet(t);
try {
for (var r = d(o), i = r.next(); !i.done; i = r.next()) {
var a = h(i.value, 2), s = a[0];
if (!a[1].silent && !this.universe.asset.isBundleDownloaded(s)) return this.universe.asset.clearWorldDownloaded(t), 
!1;
}
} catch (t) {
e = {
error: t
};
} finally {
try {
i && !i.done && (n = r.return) && n.call(r);
} finally {
if (e) throw e.error;
}
}
return !0;
}, t.prototype.markWorldDownloadOnly = function(t) {
this.universe.featureResolver.markDownloadOnlyWorld(t);
}, t.prototype.requestAlgorithmOffer = function() {
return null;
}, t.prototype.getBlockShape = function() {}, t.prototype.checkLive = function() {
return !1;
}, t.prototype.registerAlgorithmBoardCallbacks = function() {}, t.prototype.registerAlgorithmSnapshotCallbacks = function() {}, 
t.prototype._emit = function(t, e) {
if (this._mainWorld) {
var n = this._mainWorld.getAtomIns(t);
Object.assign(n.data, e), n.emit();
}
}, t.prototype.originalCtrlWorld = function(t) {
this._emit(Wn, t);
}, t.prototype.onAlgorithmOfferResult = function(t, e) {
if ((void 0 === e && (e = this._mainWorld), e) && e.hasAtomIns(Pn)) {
var n = e.getAtomIns(Pn);
Object.assign(n.data, t), n.emit();
}
}, t.prototype.onAdResult = function(e) {
var n, o, r = null !== (n = this._adRequestWorld) && void 0 !== n ? n : this._mainWorld;
if (r && r.hasAtomIns(t.ATOM_AD_RESULT)) {
var i = r.getAtomIns(t.ATOM_AD_RESULT), a = i.data;
a.adType = e.adType, a.state = e.state, a.typeCode = null !== (o = e.typeCode) && void 0 !== o ? o : "", 
i.emit();
}
}, t.prototype.onRewardAdReady = function(e) {
this.universe.emitInputToAllWorlds(t.ATOM_REWARD_AD_READY, {
ready: e
});
}, t.prototype.onInterstitialAdReady = function(e) {
this.universe.emitInputToAllWorlds(t.ATOM_INTERSTITIAL_AD_READY, {
ready: e
});
}, t.prototype.onFullscreenAdReady = function(e) {
this.universe.emitInputToAllWorlds(t.ATOM_FULLSCREEN_AD_READY, {
ready: e
});
}, t.prototype.updateUniverseOffset = function(e, n) {
this._universeOffset.x = e, this._universeOffset.y = n, this.universe.emitInputToAllWorlds(t.ATOM_UNIVERSE_OFFSET_INPUT, {
x: e,
y: n
});
}, t.prototype.setHostActive = function(e) {
this._emit(t.ATOM_HOST_ACTIVE, {
active: e
});
}, t.ATOM_AD_RESULT = "G_FAtom_ADResult", t.ATOM_REWARD_AD_READY = "G_FAtom_ADRewardAdReady", 
t.ATOM_INTERSTITIAL_AD_READY = "G_FAtom_ADInterstitialAdReady", t.ATOM_FULLSCREEN_AD_READY = "G_FAtom_ADFullscreenAdReady", 
t.ATOM_UNIVERSE_OFFSET_INPUT = "G_FAtom_UniverseOffsetInput", t.ATOM_HOST_ACTIVE = "G_FAtom_HostActive", 
t;
}(), Iu = function(e) {
function o() {
return null !== e && e.apply(this, arguments) || this;
}
return n(o, e), o.prototype.defineInputData = function() {
return {
adType: t.AdType.Reward,
state: t.AdResultState.Success,
typeCode: ""
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], o.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_ADResult") ], o);
}(la), Du = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
ready: !1
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_ADRewardAdReady") ], e);
}(la), Mu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
ready: !1
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_ADInterstitialAdReady") ], e);
}(la), Wu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
ready: !1
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "rootDomain", void 0), 
s([ ze("G_FAtom_ADFullscreenAdReady") ], e);
}(la), Pu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
worldId: "",
progress: 0,
isDone: !1,
isCancelled: !1,
error: ""
};
}, s([ He(sn), l("design:type", Object) ], e.prototype, "worldDomain", void 0), 
s([ ze(gn) ], e);
}(la), Ou = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
active: !0
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze("G_FAtom_HostActive") ], e);
}(la), Lu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineInputData = function() {
return {
configAtomName: ""
};
}, s([ He("G_FAtom_RootDomain"), l("design:type", Object) ], e.prototype, "root", void 0), 
s([ ze(On) ], e);
}(la), Gu = function(t) {
function e() {
return null !== t && t.apply(this, arguments) || this;
}
return n(e, t), e.prototype.defineFunction = function() {
var t = this, e = {};
return function(n, o) {
var r = n[ye], i = t.atomWorld.getAtomIns(r);
if (o) {
var a = o[ye];
e[r] = a;
}
i.reloadAsync().then(function() {
if (!t.atomWorld.disposed) {
var n = e[r];
if (n) {
var o = t.atomWorld.getAtomIns(On);
o.data.configAtomName = r, o.emitByRouter(n), delete e[r];
}
}
});
};
}, s([ He(On), l("design:type", Object) ], e.prototype, "input", void 0), s([ ze("G_FAtom_ReloadConfig") ], e);
}(Ni), Bu = !1;
!function() {
if (globalThis.jsb && !Bu && "object" == typeof WebAssembly) {
var t = WebAssembly.compile, e = WebAssembly.instantiate;
WebAssembly.compile = function(e) {
return new Promise(function(n, o) {
if (e) try {
n(new WebAssembly.Module(e));
} catch (r) {
t.call(WebAssembly, e).then(n).catch(o);
} else o(new Error("WebAssembly.compile: Invalid buffer source!"));
});
}, WebAssembly.instantiate = function(t, n) {
return t instanceof WebAssembly.Module ? e.call(WebAssembly, t, n) : WebAssembly.compile(t).then(function(t) {
return e.call(WebAssembly, t, n).then(function(e) {
return {
instance: e,
module: t
};
});
});
}, Bu = !0;
}
}();
var ku = function(t) {
function e() {
var e = t.apply(this, p([], h(arguments), !1)) || this;
return e.exports = {}, e;
}
return n(e, t), Object.defineProperty(e, "atomType", {
get: function() {
return "NativeAtom";
},
enumerable: !1,
configurable: !0
}), e.prototype.onReady = function() {
return u(this, void 0, void 0, function() {
var t, e;
return c(this, function(n) {
switch (n.label) {
case 0:
return t = this.defineModule(), e = this, [ 4, this.atomWorld.universe.native.getModule(t) ];

case 1:
return e.exports = n.sent(), this.atomWorld ? (this.atomState = this.defineFunction(), 
[ 2 ]) : [ 2 ];
}
});
});
}, e[ge] = !0, e;
}(Ae);
t.AssetFoundation = yo, t.AssetMeta = {
image: function() {},
autoAtlas: function() {}
}, t.AssetUrlSeparator = _o, t.AtomUniverse = Ri, t.AudioAtom = Hi, t.BaseSetters = io, 
t.Camera = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Camera, e ], h(n), !1));
}, t.CameraSetters = mo, t.ConfigAtom = Ro, t.DomainExtensionAtom = Ei, t.EasingFunctions = Al, 
t.EditBox = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.EditBox, e ], h(n), !1));
}, t.EditBoxEventSetters = Nr, t.EditBoxSetters = Er, t.EntityComponentAtom = bi, 
t.EntityDomainAtom = wi, t.EntityRelationAtom = Fi, t.FunctionAtom = Ni, t.GMAtom = zi, 
t.G_FAtom_ADCanShowAd = ja, t.G_FAtom_ADFullscreenAdReady = Wu, t.G_FAtom_ADGetAdReadyState = qa, 
t.G_FAtom_ADHideBanner = La, t.G_FAtom_ADInterstitialAdReady = Mu, t.G_FAtom_ADIsAdLoading = Ya, 
t.G_FAtom_ADLoadAllAds = Ha, t.G_FAtom_ADLoadFullscreenAd = za, t.G_FAtom_ADLoadInterstitialAd = Ua, 
t.G_FAtom_ADLoadRewardAd = Va, t.G_FAtom_ADResult = Iu, t.G_FAtom_ADRewardAdReady = Du, 
t.G_FAtom_ADShowBanner = Oa, t.G_FAtom_ADShowFullscreenAd = ka, t.G_FAtom_ADShowInterstitial = Ba, 
t.G_FAtom_ADShowRewardVideo = Ga, t.G_FAtom_AlgorithmOfferResult = bu, t.G_FAtom_Animation = fa, 
t.G_FAtom_AudioPlayer = Zi, t.G_FAtom_AutoSaveLogic = ds, t.G_FAtom_AutoSaveReceive = cs, 
t.G_FAtom_AutoSaveRouter = us, t.G_FAtom_AutoSaveSignal = ls, t.G_FAtom_BoxComponent = ra, 
t.G_FAtom_CanvasResize = ya, t.G_FAtom_CaptureGameImage = ts, t.G_FAtom_ChangeParent = eu, 
t.G_FAtom_CheckLive = Fu, t.G_FAtom_ChildOf = sa, t.G_FAtom_ConvertToNode = $l, 
t.G_FAtom_ConvertToSlot = tu, t.G_FAtom_ConvertToWorld = Zl, t.G_FAtom_DateNow = yl, 
t.G_FAtom_DestroyUniverse = nu, t.G_FAtom_DismissEntryRedDot = au, t.G_FAtom_DomainOf = aa, 
t.G_FAtom_Edit = pa, t.G_FAtom_ExitRequest = hs, t.G_FAtom_GetAvailableRAM = rs, 
t.G_FAtom_GetBlockShape = wu, t.G_FAtom_GetCPUCores = is, t.G_FAtom_GetCPUMaxFreq = as, 
t.G_FAtom_GetCurrentDate = vl, t.G_FAtom_GetDesignSize = Za, t.G_FAtom_GetDeviceInfo = ns, 
t.G_FAtom_GetLaunchParams = ml, t.G_FAtom_GetNetworkState = Qa, t.G_FAtom_GetNetworkType = Ja, 
t.G_FAtom_GetSafeArea = $a, t.G_FAtom_GetStorageItem = Pl, t.G_FAtom_GetTotalRAM = os, 
t.G_FAtom_GetUniverseOffset = es, t.G_FAtom_GetWinSize = Ka, t.G_FAtom_GetWorldPosition = Kl, 
t.G_FAtom_HasFeature = xl, t.G_FAtom_HasUniverseFeature = Il, t.G_FAtom_HideXingYunLoading = hu, 
t.G_FAtom_HideXingYunNoNetPopup = vu, t.G_FAtom_HostActive = Ou, t.G_FAtom_IsAssetDownloaded = El, 
t.G_FAtom_IsBundleDownloaded = Fl, t.G_FAtom_IsDirDownloaded = Nl, t.G_FAtom_IsLowEndDevice = ss, 
t.G_FAtom_JsonData = bl, t.G_FAtom_Keyboard = ma, t.G_FAtom_LoadJson = Ml, t.G_FAtom_MathAbs = ms, 
t.G_FAtom_MathAcos = Ps, t.G_FAtom_MathAcosh = Us, t.G_FAtom_MathApproximately = il, 
t.G_FAtom_MathAsin = Ws, t.G_FAtom_MathAsinh = Vs, t.G_FAtom_MathAtan = Os, t.G_FAtom_MathAtan2 = Ls, 
t.G_FAtom_MathAtanh = zs, t.G_FAtom_MathCbrt = Ss, t.G_FAtom_MathCeil = ys, t.G_FAtom_MathClamp = Qs, 
t.G_FAtom_MathClz32 = Ys, t.G_FAtom_MathCos = Ds, t.G_FAtom_MathCosh = Bs, t.G_FAtom_MathDegToRad = Zs, 
t.G_FAtom_MathDeltaAngle = cl, t.G_FAtom_MathDistance = Ks, t.G_FAtom_MathDistance3D = ul, 
t.G_FAtom_MathExp = bs, t.G_FAtom_MathExpm1 = ws, t.G_FAtom_MathFloor = _s, t.G_FAtom_MathFround = Xs, 
t.G_FAtom_MathHypot = Ts, t.G_FAtom_MathImul = qs, t.G_FAtom_MathInverseLerp = tl, 
t.G_FAtom_MathLerp = Js, t.G_FAtom_MathLog = Fs, t.G_FAtom_MathLog10 = Es, t.G_FAtom_MathLog1p = xs, 
t.G_FAtom_MathLog2 = Ns, t.G_FAtom_MathMax = Hs, t.G_FAtom_MathMin = js, t.G_FAtom_MathMoveTowards = nl, 
t.G_FAtom_MathMoveTowardsAngle = dl, t.G_FAtom_MathPingPong = rl, t.G_FAtom_MathPow = Cs, 
t.G_FAtom_MathRadToDeg = $s, t.G_FAtom_MathRandom = ps, t.G_FAtom_MathRandomInt = fs, 
t.G_FAtom_MathRemap = al, t.G_FAtom_MathRepeat = ol, t.G_FAtom_MathRound = gs, t.G_FAtom_MathSign = vs, 
t.G_FAtom_MathSin = Is, t.G_FAtom_MathSinh = Gs, t.G_FAtom_MathSmoothstep = el, 
t.G_FAtom_MathSnap = sl, t.G_FAtom_MathSqrt = Rs, t.G_FAtom_MathTan = Ms, t.G_FAtom_MathTanh = ks, 
t.G_FAtom_MathTrunc = As, t.G_FAtom_MathWrapAngle = ll, t.G_FAtom_OpenHostView = lu, 
t.G_FAtom_OriginalCtrlInput = Ia, t.G_FAtom_PageHide = Da, t.G_FAtom_PageShow = Ma, 
t.G_FAtom_PerformanceNow = _l, t.G_FAtom_Pointer = ua, t.G_FAtom_PositionInput = ha, 
t.G_FAtom_PreButtonClick = Ra, t.G_FAtom_PreTouchEnd = Ta, t.G_FAtom_PreTouchStart = Sa, 
t.G_FAtom_ReadJsonAsset = wl, t.G_FAtom_RealTime = gl, t.G_FAtom_RegisterAlgorithmBoardCallbacks = Eu, 
t.G_FAtom_RegisterAlgorithmSnapshotCallbacks = Nu, t.G_FAtom_ReloadConfig = Gu, 
t.G_FAtom_ReloadConfigInput = Lu, t.G_FAtom_RemoveJson = Wl, t.G_FAtom_ReportGameRuntime = Ru, 
t.G_FAtom_RequestAlgorithmOffer = Tu, t.G_FAtom_RestartApplication = ou, t.G_FAtom_RestartWorld = ru, 
t.G_FAtom_RichTextClick = ba, t.G_FAtom_RootDomain = $i, t.G_FAtom_RootRender = ea, 
t.G_FAtom_SaveJson = Dl, t.G_FAtom_SaveProgress = Pa, t.G_FAtom_Scroll = ca, t.G_FAtom_SetAnimationSpeed = pl, 
t.G_FAtom_SetFrameRate = hl, t.G_FAtom_SetRenderMountMode = iu, t.G_FAtom_SetThinkingDataEnabled = Cu, 
t.G_FAtom_SetUniverseParentSize = su, t.G_FAtom_SetUserPreferences = Su, t.G_FAtom_ShowNativeToast = uu, 
t.G_FAtom_ShowTips = cu, t.G_FAtom_ShowXingYunLoading = du, t.G_FAtom_ShowXingYunLoadingFailed = pu, 
t.G_FAtom_ShowXingYunLoadingNoNet = fu, t.G_FAtom_ShowXingYunNoNetPopup = mu, t.G_FAtom_Silent = Sl, 
t.G_FAtom_SilentLoad = Tl, t.G_FAtom_SizeInput = da, t.G_FAtom_StopTween = Rl, t.G_FAtom_StringHash = fl, 
t.G_FAtom_Track = Au, t.G_FAtom_Transform = oa, t.G_FAtom_Tween = Cl, t.G_FAtom_TweenEvent = wa, 
t.G_FAtom_TweenRunner = gu, t.G_FAtom_TweenRunnerRouter = _u, t.G_FAtom_TweenRunnerSignal = yu, 
t.G_FAtom_UIEvent = Ca, t.G_FAtom_UniverseOffsetInput = Fa, t.G_FAtom_Update = _a, 
t.G_FAtom_Vibrate = Xa, t.G_FAtom_WindowSize = va, t.G_FAtom_WorldCreate = ga, t.G_FAtom_WorldDomain = ta, 
t.G_FAtom_WorldLoadProgress = Pu, t.G_FAtom_WorldRender = na, t.G_FAtom_WorldResume = Aa, 
t.G_FAtom_WorldState = ia, t.Graphics = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Graphics, e ], h(n), !1));
}, t.GraphicsSetters = Bo, t.HostFoundation = xu, t.LayerMapping = po, t.LoadAtom = Ki, 
t.LogicAtom = xi, t.Mask = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Mask, e ], h(n), !1));
}, t.MaskSetters = ir, t.Mesh = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Mesh, e ], h(n), !1));
}, t.MeshSetters = Ir, t.NativeAtom = ku, t.Node = ji, t.OrderAtom = ki, t.Particle = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Particle, e ], h(n), !1));
}, t.ParticleSetters = wr, t.RemoteCdnProtocol = vo, t.RenderAtom = Ji, t.RenderNodeSetters = Pr, 
t.RichText = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.RichText, e ], h(n), !1));
}, t.RichTextEventSetters = Mr, t.RichTextSetters = Dr, t.ScrollView = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.ScrollView, e ], h(n), !1));
}, t.ScrollViewEventSetters = yr, t.ScrollViewSetters = vr, t.SignalAtom = Oi, t.SignalRouterAtom = Bi, 
t.Spine = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
var r = Mo(e.slots);
return eo.apply(void 0, p(p([ t.RenderNodeType.Spine, e ], h(r), !1), h(n), !1));
}, t.SpineEventSetters = Do, t.SpineSetters = Io, t.Sprite = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Sprite, e ], h(n), !1));
}, t.SpriteSetters = Cr, t.Streak = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Streak, e ], h(n), !1));
}, t.StreakSetters = Rr, t.TOP_LEVEL_SKIP = Br, t.Text = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Text, e ], h(n), !1));
}, t.TextSetters = No, t.Texture2D = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.Texture2D, e ], h(n), !1));
}, t.Texture2DSetters = uo, t.TopologicalChain = Ce, t.TraceGraphics = function(e) {
for (var n = [], o = 1; o < arguments.length; o++) n[o - 1] = arguments[o];
return eo.apply(void 0, p([ t.RenderNodeType.TraceGraphics, e ], h(n), !1));
}, t.VariantAtom = Wi, t.WorldAtom = Vi, t.WorldInputAtom = Ui, t.addComponentWithDefaults = Ti, 
t.applyBoundaryResistance = qr, t.applyConfigProps = kr, t.atomBind = de, t.atomClass = ze, 
t.atomClassMap = xe, t.attachTo = function(t, e) {
Me(t.constructor).attachToProperty = e;
}, t.autoRegisterAtomType = ke, t.bindAtom = He, t.bytesPerPixel = so, t.clampOffset = Hr, 
t.cocosTemp = To, t.componentQuery = function(t, e) {
var n, o = Me(t.constructor);
(null !== (n = o.componentQueryProps) && void 0 !== n ? n : o.componentQueryProps = new Set()).add(e);
}, t.computeBoundaryForce = zr, t.computeBounds = Ur, t.computeTotalContentSize = Jr, 
t.computeVisibleRange = Qr, t.createEntityDataComponent = Si, t.createNodeTreeFromConfig = Vr, 
t.detectDirectionLock = Xr, t.entityData = function(t, e) {
Me(t.constructor).entityDataProperty = e;
}, t.entityRenderer = je, t.expandSlots = Mo, t.featureAtomMap = Ie, t.getAtomClass = We, 
t.getBindingMeta = Me, t.getRenderNodeSetters = Or, t.injectDependency = Ue, t.isOutOfBounds = jr, 
t.mapCocosKeyCode = function(t) {
return t;
}, t.node = eo, t.onChain = Ye, t.orderAfter = Ze, t.orderBefore = Ke, t.parseAssetUrl = go, 
t.parseFeatureName = Ge, t.performanceNow = Le, t.resolveChainRegistration = nn, 
t.routeDispatch = function(e) {
Me(e.constructor).routePhase = t.RoutePhase.Dispatch;
}, t.routeFilter = function(e) {
Me(e.constructor).routePhase = t.RoutePhase.Filter;
}, t.routeFrom = Xe, t.routeReceive = qe, t.routeTo = Qe, t.routeTransform = function(e) {
Me(e.constructor).routePhase = t.RoutePhase.Transform;
}, t.signalEnd = function(t) {
Me(t.constructor).signalPhase = "end";
}, t.signalStart = function(t) {
Me(t.constructor).signalPhase = "start";
}, t.updateAxisPhysics = Yr, t.variantOf = function(t, e) {
Me(t.constructor).variantSourceProperty = e;
};
}), ae.AE_VERSION = "4.11.22";