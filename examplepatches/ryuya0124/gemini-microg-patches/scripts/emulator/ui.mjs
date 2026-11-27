import assert from "node:assert/strict";
import { mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { pause } from "./support.mjs";

const entities = { amp: "&", lt: "<", gt: ">", quot: '"', apos: "'" };
const decode = text => text.replace(/&(#x[0-9a-f]+|#\d+|amp|lt|gt|quot|apos);/gi, (_, code) => {
  if (code.startsWith("#x")) return String.fromCodePoint(parseInt(code.slice(2), 16));
  if (code.startsWith("#")) return String.fromCodePoint(Number(code.slice(1)));
  return entities[code];
});

export function makeUI(command, reportDir, devicePath) {
  mkdirSync(reportDir, { recursive: true });
  let count = 0;

  function snapshot() {
    command("shell", "uiautomator", "dump", devicePath);
    const xml = command("shell", "cat", devicePath);
    writeFileSync(join(reportDir, `ui-${String(++count).padStart(3, "0")}.xml`), xml, { mode: 0o600 });
    assert.match(xml, /<hierarchy\b/);
    return Array.from(xml.matchAll(/<node\b([^>]+)>/g), ([, attributes]) => Object.fromEntries(
      Array.from(attributes.matchAll(/([\w-]+)="([^"]*)"/g), ([, key, value]) => [key, decode(value)]),
    ));
  }

  async function waitFor(condition, message, timeout) {
    const deadline = Date.now() + timeout;
    while (Date.now() < deadline) {
      const nodes = snapshot();
      if (condition(nodes)) return nodes;
      await pause(300);
    }
    assert.fail(message);
  }

  function tap(nodes, condition) {
    const hits = nodes.filter(node => condition(node) && node.bounds !== "[0,0][0,0]");
    assert.equal(hits.length, 1, "Expected exactly one visible matching UI element");
    assert.match(hits[0].bounds, /^\[-?\d+,-?\d+\]\[-?\d+,-?\d+\]$/);
    const [x1, y1, x2, y2] = hits[0].bounds.match(/-?\d+/g).map(Number);
    command("shell", "input", "tap", Math.floor((x1 + x2) / 2), Math.floor((y1 + y2) / 2));
  }

  return { snapshot, waitFor, tap };
}

export const contains = (nodes, text) => nodes.some(node => node.text?.includes(text));
