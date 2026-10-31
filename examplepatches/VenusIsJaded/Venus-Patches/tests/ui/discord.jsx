// Stand-ins for the Discord 350.8 design-system components Venus pages are built from, so the real bootstrap.js can be
// drawn in a browser. Not Discord's code: sizes follow Discord's redesign, colors are the real tokens decoded from the
// APK (tests/ui/setup.sh) and icons are Discord's own PNGs. Close enough to judge layout, spacing, wording and states;
// Discord's exact row padding and ripple effects only show on a phone.
import * as React from "react";
import * as RN from "react-native-web";
import tokensAll from "../../work/ui/tokens.json";

// The phone width every frame is drawn at: the viewport shot.cjs opens (WIDTH=360 for a narrow phone, 412 by default).
export const W = window.innerWidth || 412;
export const themeName = new URLSearchParams(location.search).get("theme") || "dark";
export const T = tokensAll[themeName] || tokensAll.dark;
// Discord's real color tables (work/discord_colors.json), handed to Venus as modules 589/590/591 so a theme it compiles
// (Custom themes, Material You colors) shows on every stand-in. Read live: a theme rewrites them in place.
export const tables = { raw: null, sem: null };
const SLOT = { dark: "dark", light: "light", midnight: "midnight", darker: "darker" }[themeName] || "dark";
function live(n) {
  const entry = tables.sem && tables.sem[n] && tables.sem[n][SLOT];
  const raw = entry && tables.raw[entry.raw];
  if (typeof raw !== "string") return null;
  const op = entry.opacity == null ? 1 : entry.opacity;
  return op >= 0.999 ? raw.slice(0, 7) : raw.slice(0, 7) + Math.round(op * 255).toString(16).padStart(2, "0");
}
export const tok = n => live(n) || T[n] || "#ff00ff";

const ICON_PX = { xxs: 12, xs: 16, sm: 18, md: 24, lg: 32, refresh_sm: 20 };
const ICON_FILE = name => "icons/design_components_icon_native_redesign_generated_images_" + name.toLowerCase();
// Some icons ship as two layers (CircleMinusIconPrimary + ...Secondary); both are drawn in the icon's color.
const LAYERED = window.__venusLayered || new Set();
export function makeIcon(name) {
  const layers = LAYERED.has(name.toLowerCase()) ? [ICON_FILE(name) + "primary.png", ICON_FILE(name) + "secondary.png"] : [ICON_FILE(name) + ".png"];
  function Icon(props) {
    const px = props.size === "custom" && props.style ? props.style.width : ICON_PX[props.size || "md"] || 24;
    const color = props.color === "white" ? "#fff" : typeof props.color === "string" ? props.color : tok("INTERACTIVE_ICON_DEFAULT");
    return <RN.View style={{ width: px, height: px }}>{layers.map((file, i) =>
      <RN.View key={file} style={{ position: "absolute", left: 0, top: 0, width: px, height: px, backgroundColor: color, opacity: i ? 0.6 : 1,
        WebkitMaskImage: `url(${file})`, WebkitMaskSize: "contain", WebkitMaskRepeat: "no-repeat", WebkitMaskPosition: "center" }} />)}</RN.View>;
  }
  Icon.displayName = name;
  return Icon;
}

const SIZES = { text: { xxs: 10, xs: 12, sm: 14, md: 16, lg: 18 }, heading: { sm: 14, md: 16, lg: 20, xl: 24, xxl: 28 }, eyebrow: { xs: 12, sm: 12 } };
const WEIGHTS = { normal: "400", medium: "500", semibold: "600", bold: "700", extrabold: "800" };
function variantStyle(v) {
  const m = /^(text|heading|eyebrow)-(\w+)\/(\w+)$/.exec(v || "text-md/normal") || [0, "text", "md", "normal"];
  const size = (SIZES[m[1]] || SIZES.text)[m[2]] || 16;
  return { fontSize: size, lineHeight: Math.round(size * 1.3), fontWeight: WEIGHTS[m[3]] || "400" };
}
const TEXT_COLORS = { "text-strong": "TEXT_STRONG", "text-default": "TEXT_DEFAULT", "text-muted": "TEXT_MUTED", "text-subtle": "TEXT_SUBTLE",
  "interactive-text-active": "INTERACTIVE_TEXT_ACTIVE", "text-feedback-critical": "TEXT_FEEDBACK_CRITICAL", "text-brand": "TEXT_BRAND",
  "always-white": "WHITE", "text-link": "TEXT_LINK", "text-feedback-positive": "TEXT_FEEDBACK_POSITIVE", "text-feedback-warning": "TEXT_FEEDBACK_WARNING" };
export function Text(props) {
  if (props.color && !TEXT_COLORS[props.color]) console.warn("Unknown Text color " + props.color);
  const color = tok(TEXT_COLORS[props.color] || "TEXT_DEFAULT");
  return <RN.Text numberOfLines={props.lineClamp || props.numberOfLines} accessibilityRole={props.accessibilityRole}
    style={[{ fontFamily: "ggsans", color }, variantStyle(props.variant), props.style]}>{props.children}</RN.Text>;
}

export function FormSwitch(props) {
  const on = !!props.value;
  return <RN.Pressable disabled={props.disabled} onPress={() => props.onValueChange && props.onValueChange(!on)} accessibilityRole="switch"
    style={{ width: 40, height: 24, borderRadius: 12, padding: 2, opacity: props.disabled ? 0.4 : 1, justifyContent: "center",
      backgroundColor: on ? tok("SWITCH_BACKGROUND_SELECTED_DEFAULT") : themeName === "light" ? "#cfd0d4" : "#5a5b63" }}>
    <RN.View style={{ width: 20, height: 20, borderRadius: 10, backgroundColor: "#fff", transform: [{ translateX: on ? 16 : 0 }] }} />
  </RN.Pressable>;
}

export function TableRowIcon(props) {
  const I = props.IconComponent;
  return <RN.View style={{ width: 32, height: 32, borderRadius: 16, alignItems: "center", justifyContent: "center", backgroundColor: tok("BACKGROUND_MOD_SUBTLE") }}>
    {I ? <I size="sm" color={tok("ICON_DEFAULT")} /> : null}</RN.View>;
}
const ChevronRight = makeIcon("ChevronSmallRightIcon");
export function TableRow(props) {
  const danger = props.variant === "danger";
  return <RN.Pressable disabled={props.disabled || !props.onPress} onPress={props.onPress} onLongPress={props.onLongPress}
    style={{ flexDirection: "row", alignItems: "center", gap: 12, paddingHorizontal: 16, paddingVertical: 12, minHeight: 56, opacity: props.disabled ? 0.5 : 1 }}>
    {props.icon || null}
    <RN.View style={{ flex: 1, gap: 2 }}>
      <Text variant="text-md/semibold" color={danger ? "text-feedback-critical" : "text-strong"}>{props.label}</Text>
      {props.subLabel ? typeof props.subLabel === "string" ? <Text variant="text-sm/medium" color="text-muted">{props.subLabel}</Text> : props.subLabel : null}
    </RN.View>
    {props.trailing || null}
    {props.arrow ? <ChevronRight size="sm" /> : null}
  </RN.Pressable>;
}
export function TableRowGroupTitle(props) {
  return <RN.View style={{ paddingHorizontal: 4 }}><Text variant="text-sm/semibold" color="text-muted">{props.title}</Text></RN.View>;
}
export function TableRowGroup(props) {
  const kids = React.Children.toArray(props.children).filter(Boolean);
  return <RN.View style={{ gap: 8 }}>
    {props.title ? <TableRowGroupTitle title={props.title} /> : null}
    {kids.length ? <RN.View style={{ borderRadius: 16, overflow: "hidden", backgroundColor: tok("CARD_BACKGROUND_DEFAULT") }}>
      {kids.map((k, i) => <React.Fragment key={i}>{i ? <RN.View style={{ height: 1, marginLeft: 16, backgroundColor: tok("BORDER_SUBTLE") }} /> : null}{k}</React.Fragment>)}
    </RN.View> : null}
    {props.description ? <RN.View style={{ paddingHorizontal: 4 }}><Text variant="text-xs/medium" color="text-muted">{props.description}</Text></RN.View> : null}
  </RN.View>;
}
export function TableSwitchRow(props) {
  return <TableRow {...props} onPress={props.disabled ? undefined : () => props.onValueChange(!props.value)}
    trailing={<FormSwitch value={props.value} disabled={props.disabled} onValueChange={props.onValueChange} />} />;
}
export function TableCheckboxRow(props) {
  return <TableRow {...props} trailing={<RN.View style={{ width: 24, height: 24, borderRadius: 6, borderWidth: 2,
    borderColor: props.checked ? tok("BACKGROUND_BRAND") : tok("ICON_MUTED"), backgroundColor: props.checked ? tok("BACKGROUND_BRAND") : "transparent" }} />} />;
}
const RadioCtx = React.createContext(null);
export function TableRadioGroup(props) {
  return <RadioCtx.Provider value={props}><TableRowGroup title={props.title}>{props.children}</TableRowGroup></RadioCtx.Provider>;
}
export function TableRadioRow(props) {
  const g = React.useContext(RadioCtx), on = g && g.value === props.value;
  const dot = <RN.View style={{ width: 24, height: 24, borderRadius: 12, borderWidth: 2, borderColor: on ? tok("BACKGROUND_BRAND") : tok("ICON_MUTED"),
    alignItems: "center", justifyContent: "center" }}>{on ? <RN.View style={{ width: 12, height: 12, borderRadius: 6, backgroundColor: tok("BACKGROUND_BRAND") }} /> : null}</RN.View>;
  return <TableRow {...props} trailing={dot} onPress={props.disabled ? undefined : () => g && g.onChange(props.value)} />;
}
export function Button(props) {
  const v = props.variant || "primary", h = props.size === "sm" ? 32 : props.size === "lg" ? 48 : 40;
  const bg = v === "primary" ? tok("CONTROL_PRIMARY_BACKGROUND_DEFAULT") : v === "destructive" ? tok("CONTROL_CRITICAL_PRIMARY_BACKGROUND_DEFAULT") : tok("CONTROL_SECONDARY_BACKGROUND_DEFAULT");
  return <RN.Pressable disabled={props.disabled} onPress={props.onPress} style={{ height: h, paddingHorizontal: 16, borderRadius: h / 2, backgroundColor: bg,
    alignItems: "center", justifyContent: "center", opacity: props.disabled ? 0.5 : 1, flexGrow: props.grow ? 1 : undefined }}>
    <Text variant={props.size === "sm" ? "text-sm/semibold" : "text-md/semibold"} style={{ color: v === "secondary" ? tok("TEXT_STRONG") : "#fff" }}>{props.text}</Text>
  </RN.Pressable>;
}
export function TextInput(props) {
  return <RN.View style={{ gap: 8 }}>
    {props.label ? <Text variant="text-sm/medium" color="text-muted">{props.label}</Text> : null}
    <RN.TextInput value={props.value} placeholder={props.placeholder} editable={props.editable !== false && !props.isDisabled}
      onChangeText={t => props.onChange && props.onChange(t)} placeholderTextColor={tok("TEXT_MUTED")}
      style={{ height: 44, borderRadius: 12, paddingHorizontal: 14, fontFamily: "ggsans", fontSize: 16, color: tok("TEXT_DEFAULT"),
        backgroundColor: tok("INPUT_BACKGROUND_DEFAULT"), borderWidth: 1, borderColor: tok("BORDER_SUBTLE"), outlineStyle: "none" }} />
  </RN.View>;
}
const Mag = makeIcon("MagnifyingGlassIcon");
export function SearchField(props) {
  return <RN.View style={{ flexDirection: "row", alignItems: "center", gap: 8, height: 44, borderRadius: 22, paddingHorizontal: 14,
    backgroundColor: tok("INPUT_BACKGROUND_DEFAULT"), borderWidth: 1, borderColor: tok("BORDER_SUBTLE") }}>
    <Mag size="sm" color={tok("ICON_MUTED")} />
    <RN.TextInput value={props.value} placeholder={props.placeholder} onChangeText={t => props.onChange && props.onChange(t)} placeholderTextColor={tok("TEXT_MUTED")}
      style={{ flex: 1, fontFamily: "ggsans", fontSize: 16, color: tok("TEXT_DEFAULT"), outlineStyle: "none" }} />
  </RN.View>;
}
export function Stack(props) { return <RN.View style={[{ gap: props.spacing || 8 }, props.style]}>{props.children}</RN.View>; }
// createStyles turns token objects into this theme's colors, like Discord's own.
export function createStyles(spec) {
  const resolve = v => Array.isArray(v) ? v.map(resolve) : v && typeof v === "object" ? (v.__token ? tok(v.__token) : Object.fromEntries(Object.entries(v).map(([k, x]) => [k, resolve(x)]))) : v;
  const out = resolve(spec);
  return () => out;
}
export const colors = new Proxy({}, { get: (_, k) => typeof k === "string" && T[k] ? { __token: k } : undefined });

// Discord's SettingsList, enough to draw the Features list and its rows (toggle, pressable, route) from Venus's nodes.
// Like Discord's SettingsList (14971): the rows come through toSettingListItems (14974) and each is drawn by renderSettingItem
// (14973), the two places Venus changes, and the list redraws when SettingBlocklistStore (14838) changes.
export function makeSettingsList(registry) {
  return function SettingsList({ node }) {
    const [, bump] = React.useState(0);
    React.useEffect(() => { const store = global.__r(14838).default; return store && store.subscribe ? store.subscribe(() => bump(n => n + 1)) : undefined; }, []);
    const items = global.__r(14974).toSettingListItems, render = global.__r(14973).renderSettingItem;
    const list = typeof items === "function" ? items(node) : node;
    return <RN.View style={{ paddingHorizontal: 12, paddingVertical: 16, gap: 24 }}>
      {list.ListHeaderComponent || null}
      {list.sections.filter(section => section.settings.length).map((section, i) => <TableRowGroup key={section.label + i} title={section.label}>
        {section.settings.map(id => <React.Fragment key={id}>{typeof render === "function" ? render({ setting: id }) : <SettingRow node={registry()[id]} />}</React.Fragment>)}
      </TableRowGroup>)}
    </RN.View>;
  };
}
// renderSettingItem's stand-in: one row of the registry, by its key.
export function makeSettingItem(registry) { return props => props.row || <SettingRow node={registry()[props.setting]} />; }
// SettingBlocklistStore's stand-in: a tiny Zustand store.
export function makeBlocklistStore() {
  let state = { blocklist: new Set() };
  const subs = new Set();
  return { getState: () => state, setState: next => { state = Object.assign({}, state, next); subs.forEach(fn => fn()); }, subscribe: fn => { subs.add(fn); return () => subs.delete(fn); } };
}
function SettingRow({ node }) {
  if (!node) return null;
  const title = node.useTitle ? node.useTitle() : node.title;
  const desc = node.useDescription ? node.useDescription() : null;
  const icon = node.IconComponent ? <TableRowIcon IconComponent={node.IconComponent} /> : null;
  if (node.type === "toggle") {
    const value = node.useValue(), disabled = node.useIsDisabled ? node.useIsDisabled() : false;
    return <TableSwitchRow label={title} subLabel={desc} icon={icon} value={value} disabled={disabled} onValueChange={node.onValueChange} />;
  }
  const trailing = node.useTrailing ? node.useTrailing() : null;
  return <TableRow label={title} subLabel={desc} icon={icon} trailing={trailing} arrow={node.type === "route" || node.withArrow} onPress={node.onPress} />;
}
