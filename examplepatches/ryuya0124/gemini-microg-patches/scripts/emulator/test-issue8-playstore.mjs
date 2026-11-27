// Signed-in AVD regression. Only disposable test clones and the probe are changed.
import assert from "node:assert/strict";
import { writeFileSync } from "node:fs";
import { join, resolve } from "node:path";
import { args, bard, clone, digest, makeADB, passed, pause, probePackage, run, writeJSON } from "./support.mjs";
import { contains, makeUI } from "./ui.mjs";

const settings = args(["adb", "serial", "fixtures", "fixed-gemini", "fixed-google", "probe", "report-dir"], {
  "lower-update-apk": { type: "string" }, aapt2: { type: "string" },
});
assert.equal(settings.serial, "emulator-5584", "Refusing other devices");
const avd = "GeminiPatch_PlayStore_API31";
const adb = makeADB(settings, avd, 31);
const out = settings["report-dir"];
const aapt2 = settings.aapt2 ?? resolve(settings.adb, "../../build-tools/36.0.0/aapt2");
const entry = bard + "/com.google.android.apps.bard.shellapp.BardEntryPointActivity";
const fixture = name => join(settings.fixtures, name + ".apk");
const official = [clone, bard].map(pkg => pkg.replace(/\.morphe$/, ""));
const crash = ["logcat", "-d", "-b", "crash", "-v", "brief"];
const tests = [];

function command(...argv) {
  const result = adb(...argv.map(String));
  assert.ok(passed(result), `${argv.join(" ")} failed`);
  return result.stdout.trim();
}

assert.match(command("shell", "pm", "path", "com.android.vending"), /package:/);
const accountCounts = () => Array.from(command("shell", "dumpsys", "account").matchAll(/^\s*Accounts:\s*(\d+)/gm), match => Number(match[1]));
const counts = accountCounts();
assert.ok(counts.some(count => count > 0), "Sign into the dedicated Play Store AVD first");
const sha256 = { fixedGemini: digest(settings["fixed-gemini"]), fixedGoogle: digest(settings["fixed-google"]), probe: digest(settings.probe) };
const ui = makeUI(command, out, "/sdcard/issue8-store-test.xml");
const waitText = text => ui.waitFor(nodes => contains(nodes, text), "Missing UI text: " + text, 35_000);

function check(test, ok) {
  tests.push({ test, passed: Boolean(ok) });
  writeJSON(join(out, "results.json"), { avd, sha256, tests });
  console.log(`${test}: ${ok ? "PASS" : "FAIL"}`);
  assert.ok(ok, test);
}

function remove(pkg) {
  assert.ok([clone, bard].includes(pkg), "Only disposable clones may be removed");
  if (command("shell", "pm", "list", "packages", pkg).split(/\r?\n/).includes("package:" + pkg)) command("uninstall", pkg);
}

function apkPackage(path) {
  const result = run(aapt2, ["dump", "badging", path], 60_000);
  assert.ok(passed(result), "Unable to identify APK package");
  return result.stdout.match(/^package: name='([^']+)'/m)?.[1];
}

function install(pkg, ...apks) {
  for (const apk of apks) assert.equal(apkPackage(apk), pkg);
  remove(pkg);
  command(apks.length > 1 ? "install-multiple" : "install", "--no-incremental", ...apks);
}

function launch() {
  command("shell", "am", "force-stop", bard);
  command("shell", "am", "start", "-W", "-n", entry);
}

const version = pkg => Number(command("shell", "dumpsys", "package", pkg).match(/versionCode=(\d+)/)?.[1]);

function probe(name, target = bard, original = "345", expected = "scoped") {
  const result = command("shell", "am", "instrument", "-w", "-e", "target", target, "-e", "original", original,
    "-e", "expected", expected, probePackage + "/.UniversalVersionProbe");
  writeFileSync(join(out, name + ".txt"), result + "\n");
  check(name, result.includes("INSTRUMENTATION_RESULT: result=PASS") && result.includes("INSTRUMENTATION_CODE: -1"));
}

async function store(pkg, text, name) {
  command("shell", "am", "start", "-W", "-a", "android.intent.action.VIEW", "-d", "market://details?id=" + pkg, "-p", "com.android.vending");
  check(name, contains(await waitText(text), text));
}

async function googleResumed(name) {
  const deadline = Date.now() + 25_000;
  while (Date.now() < deadline) {
    const resumed = command("shell", "dumpsys", "activity", "activities").split(/\r?\n/);
    if (resumed.some(line => line.includes("mResumedActivity:") && line.includes(clone + "/"))) {
      check(name, true);
      return;
    }
    await pause(300);
  }
  check(name, false);
}

const officialBefore = official.map(version);
assert.ok(officialBefore.every(Number.isSafeInteger));
assert.equal(apkPackage(settings.probe), probePackage);
command("install", "--no-incremental", "-r", settings.probe);
install(clone, settings["fixed-google"]);
install(bard, fixture("gemini-universal"), fixture("gemini-xxhdpi"));
probe("baseline_foreign_google_version_corrupted", bard, "345", "broken");
launch();
await waitText("Update your Google app");
check("baseline_reported_update_screen_reproduced", true);
ui.tap(ui.snapshot(), node => node.text === "Go to Play Store");
await waitText("Item not found");
check("baseline_cta_actual_store_not_found", true);

install(bard, settings["fixed-gemini"]);
check("fixed_gemini_is_base_only", command("shell", "pm", "path", bard).split(/\r?\n/).length === 1);
probe("fixed_gemini_own_foreign_and_major_versions");
probe("fixed_google_own_foreign_and_major_versions", clone, "301831138");
command("logcat", "-b", "crash", "-c");
launch();
await googleResumed("both_update_blocked_launches_google");
check("both_installed_codes_remain_maximum", [clone, bard].every(pkg => version(pkg) === 2147483647));
await store(clone, "Item not found", "google_clone_has_no_store_listing");
await store(bard, "Item not found", "gemini_clone_has_no_store_listing");
await store(official[0], "Open", "official_google_store_listing_opens");
await store(official[1], "Open", "official_gemini_store_listing_opens");
check("official_packages_not_changed", official.every((pkg, i) => version(pkg) === officialBefore[i]));

const lower = settings["lower-update-apk"] ?? fixture("google-low");
assert.ok([clone, bard].includes(apkPackage(lower)), "Refusing to update an official app");
const downgrade = adb("install", "--no-incremental", "-r", lower);
writeFileSync(join(out, "downgrade.txt"), downgrade.output);
check("maximum_code_still_rejects_ordinary_lower_update", !passed(downgrade) && downgrade.output.includes("INSTALL_FAILED_VERSION_DOWNGRADE"));
install(clone, fixture("google-low"));
launch();
await waitText("Update your Google app");
check("genuinely_low_google_code_still_requires_update", true);
remove(clone);
launch();
await waitText("Download or enable the Google app");
check("missing_google_still_requires_install", true);
check("base_only_error_screens_do_not_crash", !command(...crash).includes("Process: " + bard));

install(clone, settings["fixed-google"]);
install(bard, fixture("gemini-normal"));
check("without_universal_gemini_code_unchanged", version(bard) === 345);
launch();
await googleResumed("google_only_update_blocked_launches_google");
install(clone, fixture("google-normal"));
install(bard, settings["fixed-gemini"]);
probe("gemini_only_update_blocking_preserves_normal_google");
launch();
await googleResumed("gemini_only_update_blocked_launches_google");
const crashes = command(...crash);
check("final_google_gemini_no_fatal_crash", [clone, bard].every(pkg => !crashes.includes("Process: " + pkg)));
check("signed_in_accounts_preserved", JSON.stringify(accountCounts()) === JSON.stringify(counts));
