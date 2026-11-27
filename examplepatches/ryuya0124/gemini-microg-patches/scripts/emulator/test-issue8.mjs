// Restrict all fixture replacement to the disposable Issue #8 emulators.
import assert from "node:assert/strict";
import { join } from "node:path";
import { args, bard, clone, google, instrumentPassed, makeADB, opened, passed, pause, probePackage, reports, widget, writeJSON } from "./support.mjs";

const a = args(["adb", "serial", "bad-apk", "baseline-apk", "dist", "probe", "report-dir"], {
  avd: { type: "string", default: "GeminiPatch_Issue8_API36" },
  "monolithic-google": { type: "boolean", default: false },
});
assert.ok(["GeminiPatch_Issue8_API31", "GeminiPatch_Issue8_API36"].includes(a.avd));
const sdk = a.avd.endsWith("API31") ? "31" : "36";
const adb = makeADB(a, a.avd, sdk);
const { tests, record } = reports(a["report-dir"], adb);
const activities = ["shell", "dumpsys", "activity", "activities"];
const broadcast = ["shell", "am", "broadcast", "-a", "app.geminipatch.CONTRACT_PROBE", "-n", widget];
const crash = ["logcat", "-d", "-b", "crash", "-v", "brief"];
const clear = ["logcat", "-b", "crash", "-c"];
const stop = ["shell", "am", "force-stop", clone];
const resumed = text => text.split(/\r?\n/).filter(line => /topResumedActivity=|mResumedActivity[:=]/.test(line));
const cloneResumed = text => resumed(text).some(line => line.includes(clone + "/"));
const duplicate = r => !passed(r) && r.output.includes("INSTALL_FAILED_DUPLICATE_PERMISSION") && r.output.includes("already owned by " + google);
const installGoogle = apk => a["monolithic-google"]
  ? ["install", "--no-incremental", "-r", apk]
  : ["install-multiple", "--no-incremental", "-r", apk, join(a.dist, "split_config.xxhdpi.apk")];
const probe = (name, expected, className) => record(name + expected,
  ["shell", "am", "instrument", "-w", "-e", "expected", expected, probePackage + "/." + className], instrumentPassed);
let completed = false;

try {
  record("original_system_package", ["shell", "pm", "path", google], r => /\/(product|system)\//.test(r.stdout));
  record("duplicate_permission_original_installed", ["install", "--no-incremental", a["bad-apk"]], duplicate);
  try {
    record("remove_original_for_user0", ["shell", "pm", "uninstall", "--user", "0", google], r => r.stdout.includes("Success"));
    record("duplicate_permission_after_user_removal", ["install", "--no-incremental", a["bad-apk"]], duplicate);
  } finally {
    record("restore_original_for_user0", ["shell", "cmd", "package", "install-existing", "--user", "0", google]);
  }
  record("install_v030_baseline_alongside_original", installGoogle(a["baseline-apk"]));
  record("install_permission_probe", ["install", "--no-incremental", "-r", a.probe]);
  probe("lens_client_", "denied", "ContractProbe");
  probe("process_cache_", "raw", "ProcessNameProbe");
  record("stop_baseline_before_widget", stop);
  record("clear_crash_for_baseline", clear);
  record("baseline_widget_probe", broadcast);
  await pause(3000);
  record("baseline_widget_crash_reproduced", crash, r => ["Process: " + clone, "ClassCastException", "GoogleSearchWidgetProvider"].every(term => r.stdout.includes(term)));
  record("install_fixed_clone_alongside_original", installGoogle(join(a.dist, "google-login.apk")));
  probe("lens_client_", "granted", "ContractProbe");
  probe("process_cache_", "normalized", "ProcessNameProbe");
  record("grant_fixture_accounts", ["shell", "pm", "grant", clone, "android.permission.GET_ACCOUNTS"]);
  record("install_fixed_gemini", ["install", "--no-incremental", "-r", join(a.dist, "gemini-login.apk")]);
  record("clear_baseline_crash_buffer", clear);
  record("stop_clone_before_launch", stop);
  try {
    record("disable_original_for_launch", ["shell", "pm", "disable-user", "--user", "0", google]);
    record("launch_gemini_without_enabled_original", ["shell", "am", "start", "-W", "-n", bard + "/com.google.android.apps.bard.shellapp.BardEntryPointActivity"], opened);
    for (let attempt = 0; attempt < 30; attempt++) {
      if (cloneResumed(adb(...activities).stdout)) break;
      await pause(300);
    }
    const state = record("foreground_after_launch", activities, r => passed(r) && cloneResumed(r.stdout));
    assert.ok(!resumed(state).some(line => line.includes("ErrorActivity")));
    record("widget_update_broadcast", broadcast);
    await pause(8000);
    record("no_clone_fatal_crash", crash, r => passed(r) && !r.stdout.includes("Process: " + clone));
  } finally {
    record("restore_original_enabled_state", ["shell", "pm", "default-state", "--user", "0", google]);
  }
  completed = true;
} finally {
  writeJSON(join(a["report-dir"], "results.json"), {
    passed: completed && tests.every(test => test.passed), timeUTC: new Date().toISOString(),
    serial: a.serial, avd: a.avd, sdk, monolithicGoogle: a["monolithic-google"], tests,
  });
}
