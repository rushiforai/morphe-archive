// The test clones are reset only on a dedicated Issue #8 AVD with no accounts.
import assert from "node:assert/strict";
import { writeFileSync } from "node:fs";
import { join, resolve } from "node:path";
import { args, bard, clone, digest, makeADB, passed, pause, run, writeJSON } from "./support.mjs";
import { contains, makeUI } from "./ui.mjs";

const a = args(["adb", "serial", "baseline-apk", "fixed-apk", "gemini-apk", "report-dir"], {
  "microg-apk": { type: "string" }, "verify-upgrade": { type: "boolean" }, aapt2: { type: "string" },
});
assert.match(a.serial, /^emulator-\d+$/, "Refusing physical devices");
const avd = run(a.adb, ["-s", a.serial, "emu", "avd", "name"]).stdout.split(/\r?\n/)[0];
assert.ok(["GeminiPatch_Issue8_API31", "GeminiPatch_Issue8_API36"].includes(avd));
const sdk = avd.slice(-2);
const adb = makeADB(a, avd, sdk);
const out = a["report-dir"];
const provider = "app.revanced.android.gms";
const accounts = "android.permission.GET_ACCOUNTS";
const extended = "app.revanced.gms.EXTENDED_ACCESS";
const title = "Account access for Gemini";
const entry = bard + "/com.google.android.apps.bard.shellapp.BardEntryPointActivity";
const tests = [];
const ui = makeUI(command, out, "/sdcard/issue8-permission-ui.xml");
const waitText = text => ui.waitFor(nodes => contains(nodes, text), "UI did not show " + text, 40_000);
const waitAbsent = text => ui.waitFor(nodes => !contains(nodes, text), "UI did not dismiss " + text, 25_000);
const hasID = (node, suffix) => node["resource-id"]?.endsWith(suffix);

function command(...argv) {
  const result = adb(...argv.map(String));
  if (!passed(result)) writeFileSync(join(out, "adb-last-error.txt"), result.output, { mode: 0o600 });
  assert.ok(passed(result), `${argv.join(" ")} failed`);
  return result.stdout.trim();
}

const counts = Array.from(command("shell", "dumpsys", "account").matchAll(/^\s*Accounts:\s*(\d+)/gm), match => Number(match[1]));
assert.ok(counts.length && counts.every(count => count === 0), "Refusing to clear test apps while Android accounts exist");
assert.match(command("shell", "pm", "path", provider), /package:/, "Install microG RE first");
const inputs = {};
const aapt2 = a.aapt2 ?? resolve(a.adb, "../../build-tools/36.0.0/aapt2");
for (const [key, pkg] of [["baseline", clone], ["fixed", clone], ["gemini", bard], ["microg", provider]]) {
  const path = a[key + "-apk"];
  if (!path) continue;
  const result = run(aapt2, ["dump", "badging", path], 60_000);
  assert.ok(passed(result), "Unable to identify " + key + " APK");
  assert.equal(result.stdout.match(/^package: name='([^']+)'/m)?.[1], pkg);
  inputs[key] = digest(path);
}

function check(test, ok) {
  tests.push({ test, passed: Boolean(ok) });
  writeJSON(join(out, "results.json"), { avd, sdk, inputs, tests });
  console.log(`${test}: ${ok ? "PASS" : "FAIL"}`);
  assert.ok(ok, test);
}

function directText(text) {
  ui.tap(ui.snapshot(), node => node.text === text);
}

async function permission(button) {
  const nodes = ui.snapshot();
  const suffix = `:id/permission_${button}_button`;
  const fallback = ":id/permission_deny_and_dont_ask_again_button";
  const id = button === "deny" && !nodes.some(node => hasID(node, suffix)) ? fallback : suffix;
  ui.tap(nodes, node => hasID(node, id));
  const messages = nodes.filter(node => hasID(node, ":id/permission_message"));
  assert.equal(messages.length, 1);
  await waitAbsent(messages[0].text);
}

function grants(contacts, extra) {
  const state = command("shell", "dumpsys", "package", clone);
  return state.includes(accounts + ": granted=true") === contacts && state.includes(extended + ": granted=true") === extra;
}

function launch() {
  command("shell", "am", "force-stop", clone);
  command("shell", "am", "force-stop", bard);
  command("shell", "am", "start", "-W", "-n", entry);
}

async function noPrompt(name) {
  for (let i = 0; i < 2; i++) {
    const nodes = ui.snapshot();
    check(name + "_" + i, !contains(nodes, title) && !nodes.some(node => hasID(node, ":id/permission_message")));
    await pause(500);
  }
}

const grant = name => command("shell", "pm", "grant", clone, name);
const clear = () => assert.match(command("shell", "pm", "clear", clone), /Success/);
function fresh(...granted) {
  clear();
  for (const name of granted) grant(name);
  launch();
}

async function allow(text) {
  await waitText(text);
  await permission("allow");
}

function removeClone() {
  if (command("shell", "pm", "list", "packages", clone).split(/\r?\n/).includes("package:" + clone)) command("uninstall", clone);
}

command("shell", "pm", "enable", "--user", "0", provider);
command("install", "--no-incremental", "-r", a["gemini-apk"]);
removeClone();
command("install", "--no-incremental", a["baseline-apk"]);
command("logcat", "-b", "crash", "-c");
fresh();
check("baseline_unexplained_contacts", contains(await waitText("access your contacts"), "access your contacts"));
await allow("access your contacts");
check("baseline_unknown_action_reproduced", contains(await waitText("unknown action"), "unknown action"));
await permission("deny");
check("baseline_extended_denied", grants(true, false));
launch();
check("baseline_reprompts_after_denial", contains(await waitText("unknown action"), "unknown action"));
await permission("deny");
if (a["verify-upgrade"]) {
  grant(accounts);
  grant(extended);
  const uid = () => command("shell", "pm", "list", "packages", "-U", clone);
  const previous = uid();
  command("install", "--no-incremental", "-r", a["fixed-apk"]);
  check("upgrade_keeps_existing_uid", uid() === previous);
  check("upgrade_keeps_existing_permission_grants", grants(true, true));
  launch();
  await noPrompt("authorized_upgrade_does_not_interrupt_startup");
}
removeClone();
command("install", "--no-incremental", a["fixed-apk"]);

fresh();
check("explanation_names_both_permissions", contains(await waitText(title), "Contacts and an unknown action"));
check("explanation_does_not_grant_permissions", grants(false, false));
directText("Not now");
await waitAbsent(title);
check("not_now_keeps_permissions_denied", grants(false, false));
launch();
await noPrompt("not_now_persists_across_restart");

fresh();
await waitText(title);
command("shell", "input", "keyevent", "BACK");
await waitAbsent(title);
launch();
await noPrompt("back_respects_decision");
check("back_keeps_permissions_denied", grants(false, false));

fresh();
await waitText(title);
command("shell", "input", "keyevent", "HOME");
command("shell", "am", "start", "-W", "-n", entry);
check("explanation_survives_background_resume", contains(await waitText(title), title));
directText("Continue");
await allow("access your contacts");
await allow("unknown action");
check("continue_allows_both_permissions", grants(true, true));
launch();
await noPrompt("granted_permissions_do_not_prompt_again");

fresh(accounts);
await waitText(title);
directText("Continue");
check("only_missing_extended_is_requested", !contains(await waitText("unknown action"), "access your contacts"));
await allow("unknown action");
check("accounts_pregranted_result", grants(true, true));

fresh(extended);
await waitText(title);
directText("Continue");
await allow("access your contacts");
check("only_missing_accounts_is_requested", grants(true, true));
await noPrompt("extended_pregranted_no_second_request");

fresh(accounts, extended);
await noPrompt("pregranted_no_explanation_or_request");

fresh();
await waitText(title);
directText("Continue");
await waitText("access your contacts");
await permission("deny");
await allow("unknown action");
check("system_accounts_denial_respected", grants(false, true));
launch();
await noPrompt("system_accounts_denial_not_repeated");

fresh();
await waitText(title);
directText("Continue");
await allow("access your contacts");
await waitText("unknown action");
await permission("deny");
check("system_extended_denial_respected", grants(true, false));
launch();
await noPrompt("system_extended_denial_not_repeated");
grant(extended);
launch();
await noPrompt("manual_settings_recovery");
check("manual_settings_grants_restored", grants(true, true));
command("shell", "pm", "revoke", clone, extended);
launch();
await noPrompt("later_revocation_not_overridden");
check("later_revocation_stays_denied", grants(true, false));

try {
  command("shell", "pm", "disable-user", "--user", "0", provider);
  fresh();
  await noPrompt("disabled_microg_no_unusable_request");
  check("disabled_microg_no_permissions_granted", grants(false, false));
} finally {
  command("shell", "pm", "enable", "--user", "0", provider);
}
launch();
check("microg_enabled_later_can_retry_setup", contains(await waitText(title), title));
directText("Not now");
await waitAbsent(title);
if (a["microg-apk"]) {
  try {
    command("uninstall", provider);
    fresh();
    await noPrompt("missing_microg_no_unusable_request");
    check("missing_microg_no_permissions_granted", grants(false, false));
  } finally {
    command("install", "--no-incremental", a["microg-apk"]);
  }
  launch();
  check("microg_installed_later_can_retry_setup", contains(await waitText(title), title));
  directText("Not now");
  await waitAbsent(title);
}
if (sdk === "36") {
  const locale = name => command("shell", "cmd", "locale", "set-app-locales", clone, "--user", "0", "--locales", name);
  try {
    clear();
    locale("ja-JP");
    launch();
    const japanese = "Geminiのアカウントへのアクセス";
    check("japanese_account_explanation", contains(await waitText(japanese), "「不明な操作」"));
    directText("後で");
    await waitAbsent(japanese);
    check("japanese_not_now_keeps_permissions_denied", grants(false, false));
  } finally {
    locale("en-US");
  }
  launch();
  await noPrompt("decision_survives_locale_change");
}
const crash = command("logcat", "-d", "-b", "crash", "-v", "brief");
writeFileSync(join(out, "crash-buffer.txt"), crash + "\n");
check("no_google_clone_fatal_crash", !crash.includes("Process: " + clone));
removeClone();
