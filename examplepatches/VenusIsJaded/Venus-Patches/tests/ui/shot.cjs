// Draws Venus pages with the real bootstrap.js and saves screenshots (see AGENTS.md, "Seeing the UI").
//   node tests/ui/shot.cjs <name> '<query>' [<name> '<query>' ...]     -> work/ui/shots/<name>.png
//   node tests/ui/shot.cjs --all [suffix] ['<extra query>']              -> every page, off and on
// Prints the page's console warnings, errors, dialogs and toasts. Set DPR=2 for sharper shots, WIDTH for another width.
const { chromium } = require("../../work/ui/node_modules/playwright-core");
const { execFileSync } = require("child_process");
const http = require("http"), fs = require("fs"), path = require("path");
const ROOT = path.resolve(__dirname, "../.."), UI = path.join(ROOT, "work/ui");
const PAGES = ["NODELETE:noDelete", "HIDEBLOCKED:hideBlocked", "MESSAGEHIGHLIGHT:messageHighlight", "TRANSLATE:translate", "GESTURES:gestures", "FREENITRO:freeNitro",
  "TENORGIFS:tenorGifs", "FIXEMBEDS:fixEmbeds", "PASTELIZE:pastelize", "PLATFORMINDICATORS:platformIndicators", "REVIEWDB:reviewDB",
  "USERNOTIF:userNotif", "ACCOUNTSWITCHER:accountSwitcher", "READALL:readAll", "HIDDENCHANNELS:hiddenChannels", "SERVERINFO:serverInfo",
  "HIDEBUTTONS:hideButtons", "MATERIALYOU:materialYou", "CUSTOMTHEMES:customThemes", "ICONPACKS:iconPacks", "QUESTS:quests", "BADGES:badges"];

function build() {
  if (!fs.existsSync(path.join(UI, "tokens.json"))) throw new Error("Run sh tests/ui/setup.sh first");
  fs.mkdirSync(path.join(UI, "i18n"), { recursive: true });
  for (const f of fs.readdirSync(path.join(ROOT, "patches/src/main/resources/venus/i18n"))) if (f.endsWith(".json"))
    fs.copyFileSync(path.join(ROOT, "patches/src/main/resources/venus/i18n", f), path.join(UI, "i18n", f));
  // installed= reads published themes from work/themes (python3 tests/themes_fetch.py).
  try { fs.rmSync(path.join(UI, "themes"), { force: true, recursive: true }); fs.symlinkSync(path.join(ROOT, "work/themes"), path.join(UI, "themes")); } catch (_) {}
  fs.writeFileSync(path.join(UI, "bootstrap.gen.js"), fs.readFileSync(path.join(ROOT, "patches/src/main/resources/venus/bootstrap.js"), "utf8")
    .replace("/*__FEATURES__*/", "window.__FEATURES"));
  // Two-layer icons (XIconPrimary + XIconSecondary) are drawn as one.
  const layered = fs.readdirSync(path.join(UI, "icons")).map(f => /images_(.+)primary\.png$/.exec(f)).filter(Boolean).map(m => m[1]);
  fs.writeFileSync(path.join(UI, "main.jsx"), `window.__venusLayered = new Set(${JSON.stringify(layered)});\n` +
    `import(${JSON.stringify(path.join(__dirname, "entry.jsx"))}).then(() => import("./bootstrap.gen.js")).then(() => window.__venusStart());\n`);
  execFileSync(path.join(UI, "node_modules/.bin/esbuild"), ["main.jsx", "--bundle", "--outfile=out.js", "--loader:.js=jsx", "--define:global=window",
    "--define:process.env.NODE_ENV=\"development\"", "--log-level=error", "--format=iife"], { cwd: UI, stdio: "inherit", env: Object.assign({}, process.env, { NODE_PATH: path.join(UI, "node_modules") }) });
  // Also under the names Discord's Fonts constants (1096) use, e.g. fontFamily "ggsans-Bold, NotoSans-Bold".
  const face = (w, f) => `@font-face{font-family:ggsans;font-weight:${w};src:url(fonts/ggsans-${f}.ttf)}` +
    `@font-face{font-family:"ggsans-${f}";src:url(fonts/ggsans-${f}.ttf)}`;
  fs.writeFileSync(path.join(UI, "index.html"), `<!doctype html><html><head><meta charset="utf-8"><style>${face(400, "Normal")}${face(500, "Medium")}` +
    `${face(600, "Semibold")}${face(700, "Bold")}${face(800, "ExtraBold")}body{margin:0;background:#000}*{font-family:ggsans,"Noto Color Emoji",sans-serif}` +
    `</style></head><body><div id="root"></div><script src="out.js"></script></body></html>`);
}

(async () => {
  build();
  let args = process.argv.slice(2), jobs = [];
  if (args[0] === "--all") {
    const suffix = args[1] || "all", extra = args[2] ? "&" + args[2] : "";
    for (const p of ["PLUGINS", "GENERAL", "LANGUAGE", "BACKUP"]) jobs.push([`${suffix}-${p}`, `page=VENUS_${p}${extra}`]);
    jobs.push([`${suffix}-PLUGINS-fresh`, `page=VENUS_PLUGINS&fresh=1${extra}`]);
    for (const pair of PAGES) { const [id, key] = pair.split(":"); jobs.push([`${suffix}-${id}-off`, `page=VENUS_${id}${extra}`], [`${suffix}-${id}-on`, `page=VENUS_${id}&on=${key}${extra}`]); }
  } else for (let i = 0; i < args.length; i += 2) jobs.push([args[i], args[i + 1] || ""]);
  const types = { ".html": "text/html", ".js": "text/javascript", ".json": "application/json", ".png": "image/png", ".ttf": "font/ttf" };
  const server = http.createServer((req, res) => {
    const file = path.join(UI, decodeURIComponent(req.url.split("?")[0]) === "/" ? "index.html" : decodeURIComponent(req.url.split("?")[0]));
    fs.readFile(file, (e, data) => { if (e) { res.writeHead(404); res.end(); return; } res.writeHead(200, { "Content-Type": types[path.extname(file)] || "application/octet-stream" }); res.end(data); });
  }).listen(0);
  fs.mkdirSync(path.join(UI, "shots"), { recursive: true });
  const browser = await chromium.launch({ args: ["--no-sandbox"] });
  const width = +(process.env.WIDTH || 412);
  for (const [name, query] of jobs) {
    const page = await browser.newPage({ viewport: { width, height: 900 }, deviceScaleFactor: +(process.env.DPR || 1) });
    const logs = [];
    page.on("console", m => { const t = m.text(); if (!/React DevTools|is not a prop|deprecated|Each child in a list/.test(t) && (m.type() !== "log" || /^(ALERT|DIALOG|TOAST)/.test(t))) logs.push(t.split("\n")[0]); });
    page.on("pageerror", e => logs.push("PAGE ERROR: " + e.message));
    await page.goto(`http://127.0.0.1:${server.address().port}/?${query}`);
    await page.waitForTimeout(+(process.env.WAIT || 700));
    const height = await page.evaluate(() => document.getElementById("root").scrollHeight);
    await page.setViewportSize({ width, height: Math.min(Math.max(height, 200), 8000) });
    await page.waitForTimeout(100);
    const out = path.join(UI, "shots", name + ".png");
    await page.screenshot({ path: out, fullPage: true });
    // MONET=1 also saves the native color tables Material You sent, next to the screenshot.
    if (process.env.MONET) fs.writeFileSync(out.replace(/\.png$/, ".monet.json"), JSON.stringify(await page.evaluate(() => window.__monet || [])));
    console.log(path.relative(ROOT, out) + (logs.length ? "\n  " + [...new Set(logs)].slice(0, 8).join("\n  ") : ""));
    await page.close();
  }
  await browser.close(); server.close();
})().catch(e => { console.error(e.message); process.exit(1); });
