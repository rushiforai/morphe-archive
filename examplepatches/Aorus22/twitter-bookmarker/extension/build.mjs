// esbuild build pipeline for the Twitter Bookmarker MV3 extension.
//
// Entry points -> dist bundles (per-entry format, so three separate builds):
//   src/background/service-worker.ts -> dist/background/service-worker.js (esm, module worker)
//   src/content/index.ts             -> dist/content/content.js           (iife, content script)
//   src/popup/popup.ts               -> dist/popup/popup.js               (iife, popup page)
//
// Static assets copied verbatim into dist/: manifest.json, popup.html, popup.css,
// and the self-hosted popup font subsets.
//
// Usage:
//   node build.mjs           # clean + one-shot build
//   node build.mjs --watch   # rebuild on change (static assets re-copied too)

import { context as createContext, build as esbuild } from "esbuild";
import { cp, mkdir, rm, stat } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = path.dirname(fileURLToPath(import.meta.url));
const DIST = path.join(ROOT, "dist");
const WATCH = process.argv.includes("--watch");

/** Each entry declares its own output format; esbuild's `format` is not per-entry. */
const ENTRIES = [
  {
    in: "src/background/service-worker.ts",
    out: "background/service-worker.js",
    format: "esm",
  },
  {
    in: "src/content/index.ts",
    out: "content/content.js",
    format: "iife",
  },
  {
    in: "src/popup/popup.ts",
    out: "popup/popup.js",
    format: "iife",
  },
];

const STATIC_ASSETS = [
  ["manifest.json", "manifest.json"],
  ["src/popup/popup.html", "popup/popup.html"],
  ["src/popup/popup.css", "popup/popup.css"],
  // Self-hosted popup fonts (v2 Editorial typography). Vendored woff2 subsets
  // so the popup never reaches a CDN — see popup.css `@font-face`.
  ["src/popup/fonts/inter-latin-wght-normal.woff2", "popup/fonts/inter-latin-wght-normal.woff2"],
  [
    "src/popup/fonts/playfair-display-latin-400-normal.woff2",
    "popup/fonts/playfair-display-latin-400-normal.woff2",
  ],
  [
    "src/popup/fonts/playfair-display-latin-700-normal.woff2",
    "popup/fonts/playfair-display-latin-700-normal.woff2",
  ],
];

async function copyStaticAssets() {
  for (const [from, to] of STATIC_ASSETS) {
    const target = path.join(DIST, to);
    await mkdir(path.dirname(target), { recursive: true });
    await cp(path.join(ROOT, from), target);
  }
}

/** Re-copy static assets after a successful rebuild, but only for one build (avoids write races). */
const copyStaticOnRebuild = {
  name: "copy-static-on-rebuild",
  setup(build) {
    build.onEnd(async (result) => {
      if (result.errors.length > 0) return;
      await copyStaticAssets();
    });
  },
};

function optionsFor(entry, withStaticCopy) {
  return {
    entryPoints: [path.join(ROOT, entry.in)],
    outfile: path.join(DIST, entry.out),
    bundle: true,
    format: entry.format,
    platform: "browser",
    target: ["chrome114"],
    sourcemap: false,
    legalComments: "none",
    logLevel: "info",
    plugins: withStaticCopy ? [copyStaticOnRebuild] : [],
  };
}

async function main() {
  if (!WATCH) {
    await rm(DIST, { recursive: true, force: true });
  }
  await mkdir(DIST, { recursive: true });

  if (WATCH) {
    await copyStaticAssets();
    const contexts = await Promise.all(
      ENTRIES.map((entry, index) => createContext(optionsFor(entry, index === 0))),
    );
    await Promise.all(contexts.map((ctx) => ctx.watch()));
    console.log("[build] watching for changes...");
    return;
  }

  await copyStaticAssets();
  await Promise.all(ENTRIES.map((entry) => esbuild(optionsFor(entry, false))));

  // Fail loudly if a manifest-referenced bundle never materialized.
  for (const entry of ENTRIES) {
    await stat(path.join(DIST, entry.out));
  }
  console.log("[build] dist/ ready ->", DIST);
}

main().catch((error) => {
  console.error("[build] failed:", error);
  process.exitCode = 1;
});
