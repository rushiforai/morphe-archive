// Draws Venus pages with the real bootstrap.js and saves screenshots (see AGENTS.md, "Seeing the UI").
//   node tests/ui/shot.cjs <name> '<query>' [<name> '<query>' ...]     -> work/ui/shots/<name>.png
//   node tests/ui/shot.cjs --all [suffix] ['<extra query>']              -> every page, off and on
//   node tests/ui/shot.cjs --scenes [suffix] ['<extra query>']           -> every Discord scene (scenes.jsx)
// Prints the page's console warnings, errors, dialogs and toasts. Set DPR=2 for sharper shots, WIDTH for another width.
// STRICT=1 exits with 1 when any shot had a page error, a React error or a stand-in warning (tests/test_all.sh uses it).
const { chromium } = require("../../work/ui/node_modules/playwright-core");
const { execFileSync } = require("child_process");
const http = require("http"), fs = require("fs"), path = require("path");
const ROOT = path.resolve(__dirname, "../.."), UI = path.join(ROOT, "work/ui");
// Every option page, read from bootstrap.js's withOptions(group, key, "VENUS_ID", ...) calls, so --all never misses a new one.
const PAGES = [...fs.readFileSync(path.join(ROOT, "patches/src/main/resources/venus/bootstrap.js"), "utf8")
  .matchAll(/withOptions\("[a-z]+",\s*"(\w+)",\s*"VENUS_(\w+)"/g)].map(m => m[2] + ":" + m[1]);
// Every scene, read from SCENE_SETTINGS in scenes.jsx.
const SCENES = [...(/SCENE_SETTINGS = \{([\s\S]*?)\n\};/.exec(fs.readFileSync(path.join(__dirname, "scenes.jsx"), "utf8")) || [, ""])[1]
  .matchAll(/(?:^|[\s,])(\w+): \{/g)].map(m => m[1]);

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
  } else if (args[0] === "--scenes") {
    const suffix = args[1] || "scene", extra = args[2] ? "&" + args[2] : "";
    for (const name of SCENES) jobs.push([`${suffix}-${name}`, `scene=${name}${extra}`]);
  } else for (let i = 0; i < args.length; i += 2) jobs.push([args[i], args[i + 1] || ""]);
  if (!jobs.length) throw new Error("Nothing to draw: node tests/ui/shot.cjs <name> '<query>' | --all | --scenes");
  const types = { ".html": "text/html", ".js": "text/javascript", ".json": "application/json", ".png": "image/png", ".ttf": "font/ttf" };
  const server = http.createServer((req, res) => {
    const want = decodeURIComponent(req.url.split("?")[0]);
    let file = path.join(UI, want === "/" ? "index.html" : want);
    // On Android, an image uri that's a bare name (no scheme, no extension) is a drawable from the APK, e.g. Nitro links'
    // sample "modules_guilds_bar_native_images_wumpus_wave". Serve those from the icons tests/ui/setup.sh extracted.
    if (/^\/[a-z0-9_]+$/.test(want)) file = path.join(UI, "icons", want.slice(1) + ".png");
    fs.readFile(file, (e, data) => { if (e) { res.writeHead(404); res.end(); return; } res.writeHead(200, { "Content-Type": types[path.extname(file)] || "application/octet-stream" }); res.end(data); });
  }).listen(0);
  fs.mkdirSync(path.join(UI, "shots"), { recursive: true });
  const browser = await chromium.launch({ args: ["--no-sandbox"] });
  const width = +(process.env.WIDTH || 412);
  const failed = new Set();
  for (const [name, query] of jobs) {
    const page = await browser.newPage({ viewport: { width, height: 900 }, deviceScaleFactor: +(process.env.DPR || 1) });
    const logs = [];
    page.on("console", m => { const t = m.text(); if (!/React DevTools|is not a prop|deprecated|Each child in a list/.test(t) && (m.type() !== "log" || /^(ALERT|DIALOG|TOAST)/.test(t))) logs.push(t.split("\n")[0]); });
    page.on("pageerror", e => logs.push("PAGE ERROR: " + e.message));
    // A broken page: an exception, React's own error, or a stand-in reporting something it couldn't do.
    page.on("console", m => { if (m.type() === "error" && !/React DevTools|is not a prop|deprecated|Each child in a list|unique "key"|^Failed to load resource/.test(m.text()) || m.type() === "warning" && /^(No |tap: |Unknown )/.test(m.text())) failed.add(name); });
    page.on("pageerror", () => failed.add(name));
    // A file the preview should have (an icon, a font, a drawable) that it doesn't is a failure; an outside service that
    // answers 429 or 5xx (icon pack repositories, ReviewDB) is only reported: it says nothing about the page.
    page.on("response", r => { if (r.status() < 400) return; const local = r.url().startsWith(`http://127.0.0.1:${server.address().port}/`);
      logs.push((local ? "MISSING " : "REMOTE ") + r.status() + " " + r.url().replace(/^http:\/\/127\.0\.0\.1:\d+/, "").slice(0, 110)); if (local) failed.add(name); });
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
  if (failed.size) { console.log(`${failed.size} of ${jobs.length} with errors: ${[...failed].join(", ")}`); if (process.env.STRICT) process.exit(1); }
})().catch(e => { console.error(e.message); process.exit(1); });
