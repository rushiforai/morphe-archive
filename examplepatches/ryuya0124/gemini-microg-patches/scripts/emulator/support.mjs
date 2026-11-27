import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import { parseArgs } from "node:util";

export const root = fileURLToPath(new URL("../../", import.meta.url));
export const google = "com.google.android.googlequicksearchbox";
export const clone = google + ".morphe";
export const bard = "com.google.android.apps.bard.morphe";
export const widget = clone + "/com.google.android.apps.gsa.staticplugins.searchwidget.GoogleSearchWidgetProvider";
export const probePackage = "app.geminipatch.contractprobe";
export const pause = ms => new Promise(resolve => setTimeout(resolve, ms));
export const digest = path => createHash("sha256").update(readFileSync(path)).digest("hex");
export const readJSON = path => JSON.parse(readFileSync(path, "utf8"));
export const writeJSON = (path, value) => writeFileSync(path, JSON.stringify(value, null, 2) + "\n");
export const passed = result => result.status === 0;
export const instrumentPassed = result => passed(result) &&
  result.output.includes("INSTRUMENTATION_RESULT: result=PASS") &&
  result.output.includes("INSTRUMENTATION_CODE: -1");
export const opened = result => passed(result) && result.stdout.includes("Status: ok");

export function args(required, extra = {}) {
  const { values } = parseArgs({
    options: { ...Object.fromEntries(required.map(name => [name, { type: "string" }])), ...extra },
  });
  for (const name of required) assert.ok(values[name], `Missing --${name}`);
  return values;
}

export function run(file, argv, timeout = 180_000) {
  const result = spawnSync(file, argv, { cwd: root, encoding: "utf8", timeout, maxBuffer: 20 << 20 });
  if (result.error) throw result.error;
  return { ...result, output: result.stdout + result.stderr };
}

export function makeADB(settings, avd, sdk, { requireShell = true } = {}) {
  assert.ok(/^emulator-\d+$/.test(settings.serial), "Refusing physical devices");
  const adb = (...argv) => run(settings.adb, ["-s", settings.serial, ...argv]);
  assert.equal(adb("shell", "getprop", "ro.kernel.qemu").stdout.trim(), "1");
  assert.equal(adb("emu", "avd", "name").stdout.split(/\r?\n/)[0], avd);
  assert.equal(adb("shell", "getprop", "ro.build.version.sdk").stdout.trim(), String(sdk));
  if (requireShell) assert.ok(adb("shell", "id").stdout.includes("uid=2000(shell)"));
  return adb;
}

export function reports(directory, adb, state = null) {
  mkdirSync(directory, { recursive: true });
  const tests = [];
  function record(name, command, predicate = passed) {
    const result = adb(...command);
    writeFileSync(join(directory, name + ".txt"), result.output);
    const ok = Boolean(predicate(result));
    tests.push({ test: name, passed: ok, returnCode: result.status });
    if (state) writeJSON(join(directory, "results.json"), { ...state, tests });
    console.log(`${name}: ${ok ? "PASS" : "FAIL"}`);
    assert.ok(ok, `${name}: see ${join(directory, name + ".txt")}\n${result.output.slice(0, 1500)}`);
    return result.output;
  }
  return { tests, record };
}
