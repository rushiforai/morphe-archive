import assert from "node:assert/strict";
import { copyFileSync, existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { digest, readJSON, root, run, writeJSON } from "./support.mjs";

const out = join(root, "local/issue8/auto-clone/options");
mkdirSync(out, { recursive: true });
const version = readJSON(join(root, "patches-bundle.json")).version;
const bundle = join(root, `build/release/gemini-microg-patches-${version}.mpp`);
assert.ok(existsSync(bundle), "Build the release MPP before running these tests");
const gemini = join(root, "inputs/gemini-base.apk");
const google = join(root, "inputs/google-base.apk");
const official = ["-p", join(root, "tools/patches.mpp"), "-e", "Clone app"];
const records = [];

function log(name, script, command) {
  const result = run("bash", [join(root, "scripts", script), ...command], 240_000);
  writeFileSync(join(out, name + ".log"), result.output);
  return result;
}
function checked(test, passed) {
  records.push({ test, passed });
  writeJSON(join(out, "results.json"), records);
  console.log(`${test}: ${passed ? "PASS" : "FAIL"}`);
  assert.ok(passed, test);
}

for (const [name, options] of [
  ["default-only", []],
  ["official-defaults", official],
  ["official-enabled", [...official, "-O", "packageName=Default", "-O", "updatePermissions=true", "-O", "updateProviders=true"]],
]) {
  const apk = join(out, name + ".apk");
  const report = join(out, name + ".json");
  checked(name + "-fixture-built", log(name + "-build", "patch-apk.sh", [gemini, apk, report, "-p", bundle, ...options]).status === 0);
  checked(name + "-clone-contract", log(name + "-verify", "verify-clone-contract.sh", [gemini, apk]).status === 0);
}

const wrong = join(out, "wrong-package.apk");
copyFileSync(gemini, wrong);
const previous = digest(wrong);
const custom = log("wrong-package", "patch-apk.sh", [gemini, wrong, join(out, "wrong-package.json"),
  "-p", bundle, ...official, "-O", "packageName=com.quicksearch.bond"]);
checked("custom-package-rejected", custom.status !== 0 && custom.output.includes("Unsupported clone package"));
checked("custom-package-preserved-output", digest(wrong) === previous);

for (const [i, patch] of ["Account ID Fallback for Clone", "Account Switch Lock Bypass", "Account Sync Binder Loop Fix"].entries()) {
  const name = `experiment-${i}`;
  const apk = join(out, name + ".apk");
  copyFileSync(gemini, apk);
  const hash = digest(apk);
  const result = log(name, "patch-apk.sh", [google, apk, join(out, name + ".json"), "--exclusive", "-p", bundle, "-e", patch]);
  checked(name + "-blocked-before-output", result.status !== 0 &&
    result.output.includes("Unsupported historical experiment") && digest(apk) === hash);
}
