#!/usr/bin/env node
// Adds a plain-text "summary" to patches-bundle.json.
//
// The site's releases table needs one plain sentence per release for its Contents cell. The release
// notes in `description` are Markdown, and the page does not render Markdown, so this reduces them to
// plain text once, at release time, and stores the result in the metadata the page already reads.
//
// It runs from .releaserc's prepareCmd, after the changelog plugin has written the metadata for the
// next version, and is safe to run again: an existing summary is kept. A release whose notes carry no
// usable text is left alone rather than given an invented summary, and the page falls back to a
// neutral line.
"use strict";

const fs = require("fs");

const FILE = "patches-bundle.json";
const LIMIT = 240;

function plainSummary(description, version) {
  let text = String(description || "");

  // Drop the leading "## [0.1.1](compare-url) (2026-11-22)" heading the changelog plugin writes.
  text = text.replace(/^\s*#{1,6}\s*\[[^\]]*\][^\n]*\n?/, "");
  text = text.replace(/^\s*#{1,6}\s*[^\n]*\n?/, "");

  // Links keep their text, emphasis and code marks go, list markers go.
  text = text
    .replace(/\[([^\]]+)\]\([^)]*\)/g, "$1")
    .replace(/`([^`]+)`/g, "$1")
    .replace(/\*\*|__|~~/g, "")
    .replace(/(^|\s)[*_](\S[^*_]*)[*_]/g, "$1$2")
    .replace(/^\s*[-*+]\s+/gm, "")
    .replace(/^\s*#{1,6}\s*/gm, "");

  // "Bug Fixes" reads better as a lead-in than as its own fragment.
  text = text.replace(/\s+/g, " ").trim();
  text = text.replace(/\s*\(([0-9a-f]{7,40})\)\s*/g, " ").trim();

  if (!text) return "";

  if (version && text.startsWith(version)) {
    text = text.slice(version.length).replace(/^[\s:,-]+/, "");
  }
  if (/^[(\[]?\d{4}-\d{2}-\d{2}/.test(text)) {
    text = text.replace(/^[(\[]?\d{4}-\d{2}-\d{2}[)\]]?[\s:,-]*/, "");
  }

  text = text.trim();
  if (!text) return "";
  text = text.charAt(0).toUpperCase() + text.slice(1);
  if (!/[.!?]$/.test(text)) text += ".";

  if (text.length > LIMIT) {
    const cut = text.slice(0, LIMIT);
    text = cut.slice(0, cut.lastIndexOf(" ")).replace(/[,;:]$/, "") + "...";
  }
  return text;
}

let data;
try {
  data = JSON.parse(fs.readFileSync(FILE, "utf8"));
} catch (error) {
  console.log(`release summary: no readable ${FILE} (${error.message}); leaving it alone`);
  process.exit(0);
}

if (typeof data.summary === "string" && data.summary.trim()) {
  console.log(`release summary: already set for ${data.version}`);
  process.exit(0);
}

const summary = plainSummary(data.description, String(data.version || ""));
if (!summary) {
  console.log(`release summary: no usable text for ${data.version}; the page will use its fallback`);
  process.exit(0);
}

// Keep the field order the mirror and the site already rely on, with summary after description.
const out = {
  created_at: data.created_at,
  description: data.description,
  summary: summary,
  download_url: data.download_url,
  signature_download_url: data.signature_download_url || "",
  version: data.version,
};
fs.writeFileSync(FILE, JSON.stringify(out, null, 2) + "\n");
console.log(`release summary: ${data.version} -> ${summary}`);
