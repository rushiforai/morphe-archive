// Removes test APKs only after identifying the dedicated Issue #8 API 31 AVD.
import { args, clone, digest, instrumentPassed, makeADB, opened, passed, pause, probePackage, reports, widget } from "./support.mjs";

const a = args(["adb", "serial", "baseline-apk", "fixed-apk", "probe", "report-dir"]);
const avd = "GeminiPatch_Issue8_API31";
const adb = makeADB(a, avd, 31);
const { record } = reports(a["report-dir"], adb, {
  time: new Date().toISOString(),
  serial: a.serial,
  avd,
  apkSha256: { baseline: digest(a["baseline-apk"]), fixed: digest(a["fixed-apk"]), probe: digest(a.probe) },
});
const verifyError = r => r.stdout.includes("java.lang.VerifyError") && r.stdout.includes("register index out of range (1 >= 1)");
const broadcast = ["shell", "am", "broadcast", "-a", "app.geminipatch.CONTRACT_PROBE", "-n", widget];
const probe = ["shell", "am", "instrument", "-w", "-e", "expected", "normalized", probePackage + "/.ProcessNameProbe"];
const crash = ["logcat", "-d", "-b", "crash", "-v", "brief"];
const clear = ["logcat", "-b", "crash", "-c"];

if (adb("shell", "pm", "path", clone).stdout.includes("package:")) record("remove_previous_test_clone", ["uninstall", clone]);
record("install_manager_v032", ["install", "--no-incremental", a["baseline-apk"]]);
record("install_probe", ["install", "--no-incremental", "-r", a.probe]);
record("clear_baseline_crash_buffer", clear);
record("start_baseline_widget", broadcast);
await pause(3000);
record("manager_v032_verifyerror_reproduced", crash, r => r.stdout.includes("Process: " + clone) && verifyError(r));
record("baseline_provider_rejected", probe, verifyError);
record("install_manager_fixed", ["install", "--no-incremental", "-r", a["fixed-apk"]]);
record("fixed_first_cached_seeded_process_names", probe, instrumentPassed);
record("stop_fixed_before_widget", ["shell", "am", "force-stop", clone]);
record("clear_fixed_crash_buffer", clear);
record("start_fixed_widget", broadcast);
record("launch_fixed_google", ["shell", "am", "start", "-W", "-n", clone + "/com.google.android.googlequicksearchbox.SearchActivity"], opened);
await pause(5000);
record("fixed_google_has_no_runtime_crash", crash, r => !r.stdout.includes("Process: " + clone));
record("fixed_google_process_running", ["shell", "pidof", clone + ":googleapp"], r => passed(r) && /^\d+$/.test(r.stdout.trim()));
record("remove_manager_signed_test_clone", ["uninstall", clone]);
