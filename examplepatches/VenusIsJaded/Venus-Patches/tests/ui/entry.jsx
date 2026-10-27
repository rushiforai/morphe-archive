// Boots the real Venus runtime (patches/src/main/resources/venus/bootstrap.js, every feature patched in) on a tiny
// stand-in for Metro, then draws one Venus settings page in a 412 dp wide phone frame. Driven by the URL:
//   page=VENUS_PLUGINS        the route to draw (VENUS_PLUGINS, VENUS_GENERAL, VENUS_BACKUP, VENUS_LANGUAGE, VENUS_<FEATURE>)
//   on=noDelete,quests        features (or any boolean settings) turned on
//   set={"readAllMode":"dms"} any other saved settings, as JSON
//   fresh=1                   a fresh install: nothing saved yet (shows Start with the essentials)
//   theme=dark|light|midnight|darker   lang=de   search=pin   (search: typed into the Features search bar)
//   tap=Custom                 taps the element with that accessibility label or text once the page is drawn
//   scene=serverMenu|readAll   instead of a settings page, a Discord screen with what Venus adds to it, on made-up
//                              data (tests/ui/scenes.jsx); sheets Venus opens (Server info, Read all) slide up over it
import * as React from "react";
import * as ReactDOM from "react-dom/client";
import * as RNW from "react-native-web";
import * as D from "./discord.jsx";
import * as S from "./scenes.jsx";
import colorsAll from "../../work/discord_colors.json";

const q = new URLSearchParams(location.search);
// Every feature patched in, like selecting every patch in Morphe.
window.__FEATURES = new Proxy({}, { get: (_, k) => typeof k === "string" && k !== "then" });

// Screenshots show the finished state: animations jump to where they end (Venus never depends on them finishing).
const jump = (value, cfg) => ({ start(cb) { try { value.setValue(cfg.toValue); } catch (_) {} if (cb) cb({ finished: true }); }, stop() {} });
const Animated = Object.assign({}, RNW.Animated, { timing: jump, spring: jump,
  sequence: list => ({ start(cb) { list.forEach(a => a.start()); if (cb) cb({ finished: true }); }, stop() {} }) });
const RN = Object.assign({}, RNW, { Animated, Modal: RNW.Modal || (() => null),
  Alert: { alert: (title, body) => console.log("ALERT " + title + " | " + body) },
  LayoutAnimation: { configureNext() {}, create() {}, Presets: {} },
  AccessibilityInfo: { isReduceMotionEnabled: () => ({ then: f => { f(false); return { then() {}, catch() {} }; } }), addEventListener() {} } });

// Discord's file module: the saved settings file comes from the URL, language packs from the repo.
const on = (q.get("on") || "").split(",").filter(Boolean);
const saved = Object.assign({ language: q.get("lang") || "en", setupDone: true }, Object.fromEntries(on.map(k => [k, true])), JSON.parse(q.get("set") || "{}"));
const settingsText = q.get("fresh") === "1" ? null : JSON.stringify(saved);
// installed=<file in work/themes>[,<file>...]: those published themes are installed (the first one in use), as if added
// from their links, so every page and scene draws in that theme's compiled colors (and wallpaper).
const installed = (q.get("installed") || "").split(",").filter(Boolean);
const themesText = installed.length ? Promise.all(installed.map(f => fetch("themes/" + f).then(r => r.text()).then(t => {
  const spec = JSON.parse(t.replace(/^\uFEFF/, "")); spec.url = spec.id = "https://example.com/" + f; return spec; })))
  .then(list => JSON.stringify({ version: 1, active: list[0].id, themes: list })) : null;
const files = { getConstants: () => ({ DocumentsDirPath: "/docs", CacheDirPath: "/cache" }), getSize() {},
  fileExists: path => Promise.resolve(/venus-patches\.json$/.test(path) ? !!settingsText : /venus-themes\.json$/.test(path) && !!themesText),
  readFile: path => /venus-patches\.json$/.test(path) ? Promise.resolve(settingsText) : /venus-themes\.json$/.test(path) && themesText ? themesText : Promise.reject(new Error("none")),
  writeFile: () => Promise.resolve(), getVideoDimensions: () => Promise.resolve(),
  readAsset: name => fetch("i18n/" + name.split(":").pop() + ".json").then(r => r.text()) };

const me = { id: "123456789012345678", username: "venus", globalName: "Venus", avatar: null };
const store = extra => Object.assign({ addChangeListener() {}, removeChangeListener() {} }, extra);
const go = route => { const next = new URLSearchParams(location.search); next.set("page", route); location.search = next.toString(); };
const modules = {
  17: React, 19: RN, 1162: { default: files },
  5088: { Text: D.Text }, 5379: { Button: D.Button }, 6897: { FormSwitch: D.FormSwitch }, 6188: { TableRowIcon: D.TableRowIcon },
  6180: { TableRow: D.TableRow }, 6265: { TableRowGroup: D.TableRowGroup, TableRowGroupTitle: D.TableRowGroupTitle }, 6896: { TableSwitchRow: D.TableSwitchRow },
  6263: { TableRadioGroup: D.TableRadioGroup }, 6262: { TableRadioRow: D.TableRadioRow }, 6177: { TableCheckboxRow: D.TableCheckboxRow },
  6739: { SearchField: D.SearchField }, 6286: { TextInput: D.TextInput }, 5377: { Stack: D.Stack }, 5092: { createStyles: D.createStyles },
  587: { default: { colors: D.colors } }, 4831: { useThemeContext: () => ({ theme: D.themeName }) },
  1390: { default: store({ getCurrentUser: () => me, getUser: id => id === me.id ? me : null }) },
  4760: { default: store({ getFriendIDs: () => [], getRelationships: () => ({}) }) },
  1503: { useStackNavigation: () => ({ navigate: go }) }, 14974: { onRouteSettingOnPress: ({ screen }) => go(screen.route) },
  5300: { default: { show: o => console.log("DIALOG " + o.title + " | " + o.body) } },
  4809: { default: { open: (key, o) => console.log("TOAST " + (o && o.text)) } },
  6889: { Clipboard: { setString() {}, getString: () => Promise.resolve("") } },
};
Object.assign(modules, S.modules(store, me));
const icons = {};
const fallback = new Proxy({}, { get: (_, k) => typeof k === "string" && /Icon$/.test(k) ? icons[k] || (icons[k] = D.makeIcon(k)) : undefined });

// Metro, minimally: __d runs a factory once and keeps its module; __r reads what Venus left in module.exports.
const defined = {};
global.__r = id => defined[id] ? defined[id].exports : id in modules ? modules[id] : fallback;
global.__d = (factory, id) => { const module = { exports: {} }; defined[id] = module; factory(global, global.__r, null, null, module); };

let registry = null;
// A green wallpaper's Android 12 palettes, for Material You colors (monet=0 acts like a phone without them).
const MONET = JSON.stringify({"accent1":["#ffffff","#f6ffef","#c9ffbe","#b8f1ad","#9cd593","#82b97a","#689e62","#4f834a","#376934","#1e511e","#023909","#002203","#000000"],"accent2":["#ffffff","#f6ffef","#e4f6dc","#d6e8ce","#baccb3","#9fb098","#85957f","#6b7c66","#53634f","#3b4b38","#253423","#111f0f","#000000"],"accent3":["#ffffff","#f4feff","#caf9fe","#bcebf0","#a0cfd4","#85b3b8","#6b989d","#527e83","#38656a","#1e4d52","#00363b","#002022","#000000"],"neutral1":["#ffffff","#fafdf4","#eff2e9","#e0e4da","#c4c8bf","#a9aca4","#8e928a","#747871","#5b6058","#444841","#2d322b","#191d17","#000000"],"neutral2":["#ffffff","#f8fef1","#edf3e6","#dee5d8","#c2c8bd","#a7ada2","#8c9388","#73796f","#5a6057","#424940","#2c322a","#171d16","#000000"]});
// Native color tables Material You sends ("map:..." / "off") are kept for inspection in window.__monet.
window.__monet = [];
window.__tok = name => D.tok(name);
window.__tables = D.tables;
files.getFileHash = uri => {
  if (/^venus-monet-v1:(map:|off)/.test(uri)) { window.__monet.push(uri.slice(15)); return Promise.resolve("on"); }
  return Promise.resolve(/^venus-monet-v1:colors$/.test(uri) && q.get("monet") !== "0" ? MONET : "");
};
let rerender = () => {};
function colorTables() {
  const d = colorsAll;
  D.tables.raw = Object.assign({}, d.raw);
  D.tables.sem = JSON.parse(JSON.stringify(d.sem));
  modules[591] = { _private: { RawColors: D.tables.raw } };
  modules[589] = { _private: { SemanticColors: D.tables.sem } };
  modules[590] = { _private: { SemanticColorExperiments: JSON.parse(JSON.stringify(d.exp || {})) } };
  modules[1205] = { default: store({ emitChange() { rerender(); } }) };
}
function boot() {
  colorTables();
  modules[14839] = { SETTING_RENDERER_CONFIG: { ACCOUNT: { type: "route", IconComponent: D.makeIcon("UserCircleIcon") } } };
  modules[14971] = { SettingsList: D.makeSettingsList(() => registry) };
  modules[10664] = { createList: x => x };
  const define = (id, exports) => global.__d((g, r, i, a, module) => { module.exports = exports; }, id, []);
  define(120, { default: () => {} });
  [17, 19, 1162, 6265, 6896, 14971, 10664, 14839, 591, 589, 590, 1205].concat(S.hooked).forEach(id => define(id, modules[id]));
  defined[120].exports.default();
  registry = defined[14839].exports.SETTING_RENDERER_CONFIG;
}

window.__venusStart = function () {
  boot();
  if (q.get("scene")) {
    // Redrawn whenever a theme recompiles the color tables (ThemeStore.emitChange), like Discord's screens.
    function SceneFrame() { const [n, bump] = React.useState(0); rerender = () => bump(x => x + 1); return <S.Scene key={n} name={q.get("scene")} defined={defined} registry={registry} />; }
    ReactDOM.createRoot(document.getElementById("root")).render(<SceneFrame />); return;
  }
  const page = q.get("page") || "VENUS_PLUGINS", node = registry[page];
  const Page = node && node.screen && node.screen.getComponent();
  if (q.get("search")) setTimeout(() => { const input = document.querySelector("input"); if (input) { const set = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, "value").set; set.call(input, q.get("search")); input.dispatchEvent(new Event("input", { bubbles: true })); } }, 300);
  function Frame() {
    const [, bump] = React.useState(0);
    rerender = () => bump(n => n + 1);
    const title = node && node.useTitle ? node.useTitle() : page;
    return <RNW.View style={{ width: 412, minHeight: "100vh", backgroundColor: D.tok("BACKGROUND_BASE_LOW") }}>
      <RNW.View style={{ height: 56, flexDirection: "row", alignItems: "center", gap: 16, paddingHorizontal: 16 }}>
        {React.createElement(D.makeIcon("ArrowLargeLeftIcon"), { size: "md", color: D.tok("INTERACTIVE_ICON_DEFAULT") })}
        <D.Text variant="heading-lg/bold" color="text-strong">{title}</D.Text>
      </RNW.View>
      {Page ? <Page /> : <D.Text color="text-feedback-critical">No page called {page}</D.Text>}
    </RNW.View>;
  }
  ReactDOM.createRoot(document.getElementById("root")).render(<Frame />);
  window.__venus = global.__venusPatches;
};

// tap=<text>: taps the first element whose accessibility label or text is exactly that, after the page draws.
if (q.get("tap")) setTimeout(() => {
  const want = q.get("tap"), all = Array.from(document.querySelectorAll("#root [aria-label], #root div[tabindex], #root [role]"));
  const hit = all.find(e => e.getAttribute("aria-label") === want) || all.find(e => (e.innerText || "").trim() === want);
  if (hit) hit.click(); else console.warn("tap: nothing labelled " + want);
}, 400);
