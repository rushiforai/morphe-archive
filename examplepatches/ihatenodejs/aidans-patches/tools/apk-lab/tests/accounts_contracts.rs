//! Contract tests for native Google Play account storage and the account TUI.
//!
//! Every test that observes process environment holds `ENV_LOCK`, so an
//! isolated HOME/XDG tree cannot race another test in this binary.

use std::collections::VecDeque;
use std::env;
use std::ffi::OsString;
use std::fs;
use std::os::unix::fs::PermissionsExt;
use std::path::{Path, PathBuf};
use std::sync::{Mutex, MutexGuard};

use apk_lab::accounts::{
    check_accounts_file_permissions, default_accounts_file_path, load_accounts,
    load_accounts_from_path, save_accounts, Account, AccountsFile, DEFAULT_DEVICE, DEFAULT_LOCALE,
    DEFAULT_TIMEZONE,
};
use apk_lab::accounts_tui::{
    add_account, check_accounts, delete_account, exchange_oauth_for_aas_with,
    run_play_accounts_tui, sync_github_secret, view_accounts, AccountChecker, MetadataVersion,
    OAuthExchanger, SyncOptions, TuiError, Ui,
};
use serde_json::{json, Value};
use tempfile::TempDir;

static ENV_LOCK: Mutex<()> = Mutex::new(());

struct EnvGuard {
    _lock: MutexGuard<'static, ()>,
    saved: Vec<(&'static str, Option<OsString>)>,
}

impl EnvGuard {
    fn new(home: &Path, xdg: &Path) -> Self {
        let lock = ENV_LOCK.lock().unwrap_or_else(|error| error.into_inner());
        let keys = [
            "HOME",
            "XDG_CONFIG_HOME",
            "APKEEP_ACCOUNTS",
            "APKEEP_ACCOUNTS_FILE",
            "APKEEP_BIN",
            "GH_BIN",
            "PATH",
        ];
        let saved = keys
            .iter()
            .map(|key| (*key, env::var_os(key)))
            .collect::<Vec<_>>();
        env::set_var("HOME", home);
        env::set_var("XDG_CONFIG_HOME", xdg);
        for key in [
            "APKEEP_ACCOUNTS",
            "APKEEP_ACCOUNTS_FILE",
            "APKEEP_BIN",
            "GH_BIN",
        ] {
            env::remove_var(key);
        }
        Self { _lock: lock, saved }
    }

    fn set(&self, key: &'static str, value: impl AsRef<std::ffi::OsStr>) {
        env::set_var(key, value);
    }

    fn remove(&self, key: &'static str) {
        env::remove_var(key);
    }
}

impl Drop for EnvGuard {
    fn drop(&mut self) {
        for (key, value) in self.saved.drain(..) {
            match value {
                Some(value) => env::set_var(key, value),
                None => env::remove_var(key),
            }
        }
    }
}

fn fixture() -> (TempDir, EnvGuard) {
    let temp = TempDir::new().unwrap();
    let home = temp.path().join("home");
    let xdg = temp.path().join("xdg");
    fs::create_dir_all(&home).unwrap();
    fs::create_dir_all(&xdg).unwrap();
    let guard = EnvGuard::new(&home, &xdg);
    (temp, guard)
}

fn account(label: &str, email: &str, token: &str, enabled: bool) -> Account {
    Account {
        label: label.to_string(),
        email: email.to_string(),
        aas_token: token.to_string(),
        device: DEFAULT_DEVICE.to_string(),
        locale: DEFAULT_LOCALE.to_string(),
        timezone: DEFAULT_TIMEZONE.to_string(),
        enabled,
    }
}

fn valid_json() -> Value {
    json!({
        "version": 1,
        "accounts": [{
            "label": "personal",
            "email": "User@Example.COM",
            "aasToken": "aas_token_123",
            "device": "px_9a",
            "locale": "en_US",
            "timezone": "UTC",
            "enabled": true
        }, {
            "label": "backup",
            "email": "backup@example.com",
            "aasToken": "aas_token_456",
            "device": "px_8",
            "locale": "en_US",
            "timezone": "UTC",
            "enabled": false
        }]
    })
}

fn parse_file(path: &Path) -> Value {
    serde_json::from_str(&fs::read_to_string(path).unwrap()).unwrap()
}

// --- Schema and validation -------------------------------------------------

#[test]
fn schema_round_trips_with_exact_keys_and_normalized_email() {
    let (_temp, _guard) = fixture();
    let file = AccountsFile::from_value(&valid_json(), true).unwrap();
    assert_eq!(file.version, 1);
    assert_eq!(file.accounts.len(), 2);
    assert_eq!(file.accounts[0].label, "personal");
    assert_eq!(file.accounts[0].email, "user@example.com");
    assert_eq!(file.accounts[0].aas_token, "aas_token_123");
    assert!(file.accounts[0].enabled);
    assert_eq!(file.accounts[1].email, "backup@example.com");
    assert_eq!(file.accounts[1].device, "px_8");
    assert!(!file.accounts[1].enabled);

    let encoded = file.to_pretty_json().unwrap();
    assert!(encoded.contains("\"version\": 1"));
    let value: Value = serde_json::from_str(&encoded).unwrap();
    let mut top: Vec<&str> = value
        .as_object()
        .unwrap()
        .keys()
        .map(String::as_str)
        .collect();
    top.sort_unstable();
    assert_eq!(top, vec!["accounts", "version"]);
    let mut keys: Vec<&str> = value["accounts"][0]
        .as_object()
        .unwrap()
        .keys()
        .map(String::as_str)
        .collect();
    keys.sort_unstable();
    assert_eq!(
        keys,
        vec!["aasToken", "device", "email", "enabled", "label", "locale", "timezone"]
    );
    assert!(encoded.contains("\"aasToken\": \"aas_token_123\""));
}

#[test]
fn rejects_unsupported_version_duplicate_email_and_malformed_fields() {
    let (_temp, _guard) = fixture();

    let version_two = json!({"version": 2, "accounts": []});
    let error = AccountsFile::from_value(&version_two, true).unwrap_err();
    assert!(error.to_string().contains("Unsupported schema version"));

    let duplicate = json!({
        "version": 1,
        "accounts": [
            {"label": "first", "email": "user@example.com", "aasToken": "tok1"},
            {"label": "second", "email": "USER@example.com", "aasToken": "tok2"}
        ]
    });
    let error = AccountsFile::from_value(&duplicate, true).unwrap_err();
    assert!(error.to_string().contains("Duplicate email"));

    let malformed = json!({
        "version": 1,
        "accounts": [{"label": "bad", "email": "not-an-email", "aasToken": "tok"}]
    });
    let error = AccountsFile::from_value(&malformed, true).unwrap_err();
    assert!(error.to_string().contains("malformed"));

    for key in ["label", "email", "aasToken"] {
        let mut entry = json!({"label": "ok", "email": "u@test.com", "aasToken": "tok"});
        entry[key] = json!("   ");
        let payload = json!({"version": 1, "accounts": [entry]});
        assert!(AccountsFile::from_value(&payload, true).is_err(), "{key}");
    }
}

#[test]
fn disabled_accounts_are_retained_but_cannot_satisfy_require_enabled() {
    let (_temp, _guard) = fixture();
    let payload = json!({
        "version": 1,
        "accounts": [
            {"label": "disabled", "email": "user@example.com", "aasToken": "tok", "enabled": false}
        ]
    });
    let file = AccountsFile::from_value(&payload, false).unwrap();
    assert_eq!(file.accounts.len(), 1);
    assert_eq!(file.enabled().count(), 0);
    let error = AccountsFile::from_value(&payload, true).unwrap_err();
    assert!(error.to_string().contains("No enabled accounts"));
}

#[test]
fn account_debug_and_diagnostics_never_contain_secrets() {
    let (_temp, _guard) = fixture();
    let account = account("personal", "john.doe@example.com", "secret-token-42", true);
    let debug = format!("{account:?}");
    assert!(!debug.contains("secret-token-42"));
    assert!(!debug.contains("john.doe@example.com"));
    assert!(debug.contains("[REDACTED]"));

    let diagnostic = account.redact_diagnostic(
        "login failed for john.doe@example.com with secret-token-42 trailing",
        120,
    );
    assert!(!diagnostic.contains("secret-token-42"));
    assert!(!diagnostic.contains("john.doe@example.com"));
    assert!(diagnostic.contains("[REDACTED]"));
}

// --- Paths, permissions, atomic writes -------------------------------------

#[test]
fn path_precedence_file_xdg_and_home() {
    let (temp, guard) = fixture();
    let explicit = temp.path().join("explicit.json");
    guard.set("APKEEP_ACCOUNTS_FILE", &explicit);
    assert_eq!(default_accounts_file_path().unwrap(), explicit);

    guard.remove("APKEEP_ACCOUNTS_FILE");
    let via_xdg = default_accounts_file_path().unwrap();
    assert_eq!(
        via_xdg,
        temp.path()
            .join("xdg")
            .join("aidans-patches")
            .join("google-play-accounts.json")
    );

    guard.remove("XDG_CONFIG_HOME");
    let via_home = default_accounts_file_path().unwrap();
    assert_eq!(
        via_home,
        temp.path()
            .join("home")
            .join(".config")
            .join("aidans-patches")
            .join("google-play-accounts.json")
    );
}

#[test]
fn apkeep_accounts_env_wins_over_file() {
    let (temp, guard) = fixture();
    let file_path = temp.path().join("accounts.json");
    let file = AccountsFile::new(vec![account(
        "file",
        "file@example.com",
        "file-token",
        true,
    )]);
    save_accounts(&file, Some(&file_path)).unwrap();

    guard.set("APKEEP_ACCOUNTS_FILE", &file_path);
    guard.set(
        "APKEEP_ACCOUNTS",
        serde_json::to_string(&json!({
            "version": 1,
            "accounts": [
                {"label": "env", "email": "env@example.com", "aasToken": "env-token"}
            ]
        }))
        .unwrap(),
    );

    let loaded = load_accounts(true).unwrap().unwrap();
    assert_eq!(loaded.accounts.len(), 1);
    assert_eq!(loaded.accounts[0].label, "env");
}

#[test]
fn save_uses_0600_file_and_0700_directory_atomically() {
    let (temp, _guard) = fixture();
    let target = temp.path().join("nested").join("dir").join("accounts.json");
    let file = AccountsFile::from_value(&valid_json(), true).unwrap();

    let saved = save_accounts(&file, Some(&target)).unwrap();
    assert_eq!(saved, target);
    assert_eq!(
        fs::metadata(&target).unwrap().permissions().mode() & 0o777,
        0o600
    );
    assert_eq!(
        fs::metadata(target.parent().unwrap())
            .unwrap()
            .permissions()
            .mode()
            & 0o777,
        0o700
    );
    assert!(fs::read_to_string(&target).unwrap().ends_with('\n'));

    let loaded = load_accounts_from_path(&target, true).unwrap().unwrap();
    assert_eq!(loaded, file);

    // Replace keeps a single complete document rather than appending.
    let replaced = AccountsFile::new(vec![account("only", "only@example.com", "t", true)]);
    save_accounts(&replaced, Some(&target)).unwrap();
    let value = parse_file(&target);
    assert_eq!(value["accounts"].as_array().unwrap().len(), 1);
}

#[test]
fn rejects_insecure_permissions_and_symlinks_preserving_existing_files() {
    let (temp, _guard) = fixture();
    let insecure = temp.path().join("insecure.json");
    fs::write(&insecure, "{}").unwrap();
    fs::set_permissions(&insecure, fs::Permissions::from_mode(0o644)).unwrap();
    let error = check_accounts_file_permissions(&insecure).unwrap_err();
    assert!(error.to_string().contains("insecure permissions"));

    let real = temp.path().join("real.json");
    let original = AccountsFile::new(vec![account("real", "real@example.com", "t", true)]);
    save_accounts(&original, Some(&real)).unwrap();
    let original_bytes = fs::read(&real).unwrap();

    let link = temp.path().join("link.json");
    std::os::unix::fs::symlink(&real, &link).unwrap();
    let error = check_accounts_file_permissions(&link).unwrap_err();
    assert!(error.to_string().contains("symlink"));
    assert!(load_accounts_from_path(&link, true).is_err());

    let attempt = AccountsFile::new(vec![account("other", "other@example.com", "t", true)]);
    let error = save_accounts(&attempt, Some(&link)).unwrap_err();
    assert!(error.to_string().contains("symlink"));
    assert_eq!(fs::read(&real).unwrap(), original_bytes);
}

#[test]
fn rejects_non_regular_account_files() {
    let (temp, _guard) = fixture();
    let directory = temp.path().join("accounts-directory");
    fs::create_dir(&directory).unwrap();
    let error = load_accounts_from_path(&directory, true).unwrap_err();
    assert!(
        error.to_string().contains("regular file"),
        "unexpected error: {error}"
    );
    let error = check_accounts_file_permissions(&directory).unwrap_err();
    assert!(
        error.to_string().contains("regular file"),
        "unexpected error: {error}"
    );
}

// --- TUI synthetic input ---------------------------------------------------

#[derive(Default)]
struct ScriptedUi {
    texts: VecDeque<Option<String>>,
    passwords: VecDeque<Option<String>>,
    selects: VecDeque<Option<usize>>,
    confirms: VecDeque<Option<bool>>,
    messages: Vec<String>,
    prompts: Vec<String>,
}

impl ScriptedUi {
    fn with_selects(values: &[Option<usize>]) -> Self {
        Self {
            selects: values.iter().copied().collect(),
            ..Self::default()
        }
    }

    fn joined(&self) -> String {
        self.messages.join("\n")
    }
}

impl Ui for ScriptedUi {
    fn text(&mut self, prompt: &str, _default: Option<&str>) -> Result<Option<String>, TuiError> {
        self.prompts.push(prompt.to_string());
        Ok(self.texts.pop_front().flatten())
    }

    fn password(&mut self, prompt: &str) -> Result<Option<String>, TuiError> {
        self.prompts.push(prompt.to_string());
        Ok(self.passwords.pop_front().flatten())
    }

    fn select(&mut self, prompt: &str, _choices: &[String]) -> Result<Option<usize>, TuiError> {
        self.prompts.push(prompt.to_string());
        Ok(self.selects.pop_front().flatten())
    }

    fn confirm(&mut self, prompt: &str, _default: bool) -> Result<Option<bool>, TuiError> {
        self.prompts.push(prompt.to_string());
        Ok(self.confirms.pop_front().flatten())
    }

    fn message(&mut self, text: &str) {
        self.messages.push(text.to_string());
    }
}

#[derive(Default)]
struct FakeChecker {
    succeed: bool,
    reason: String,
    seen: Mutex<Vec<String>>,
}

impl AccountChecker for FakeChecker {
    fn check(&self, account: &Account, package: &str) -> Result<MetadataVersion, String> {
        self.seen.lock().unwrap().push(account.label.clone());
        if self.succeed {
            Ok(MetadataVersion {
                package_name: package.to_string(),
                version_name: "1.2.3".to_string(),
                version_code: 123,
            })
        } else {
            Err(self.reason.clone())
        }
    }
}

#[test]
fn tui_view_masks_tokens_and_redacts_email() {
    let (_temp, _guard) = fixture();
    let file = AccountsFile::new(vec![account(
        "my-label",
        "personal@example.com",
        "secret_token_12345",
        true,
    )]);
    let mut ui = ScriptedUi::default();
    view_accounts(&mut ui, Some(&file));
    let output = ui.joined();
    assert!(output.contains("my-label"));
    assert!(output.contains("pe***@example.com"));
    assert!(!output.contains("personal@example.com"));
    assert!(!output.contains("secret_token_12345"));
    assert!(output.contains("Token: [REDACTED]"));
}

#[test]
fn tui_add_uses_defaults_and_writes_normalized_account() {
    let (temp, guard) = fixture();
    let target = temp.path().join("accounts.json");
    guard.set("APKEEP_ACCOUNTS_FILE", &target);

    let mut ui = ScriptedUi {
        texts: [
            Some("personal".to_string()),
            Some("User@Example.COM".to_string()),
            Some(String::new()),
            Some(String::new()),
            Some(String::new()),
        ]
        .into_iter()
        .collect(),
        passwords: [Some("aas-token-value".to_string())].into_iter().collect(),
        selects: [Some(1)].into_iter().collect(),
        ..ScriptedUi::default()
    };

    let updated = add_account(&mut ui, None).unwrap().unwrap();
    assert_eq!(updated.accounts.len(), 1);
    assert_eq!(updated.accounts[0].email, "user@example.com");
    assert_eq!(updated.accounts[0].device, "px_9a");
    assert_eq!(updated.accounts[0].locale, "en_US");
    assert_eq!(updated.accounts[0].timezone, "UTC");

    let value = parse_file(&target);
    assert_eq!(value["accounts"][0]["aasToken"], "aas-token-value");
    assert_eq!(value["accounts"][0]["email"], "user@example.com");
    assert_eq!(
        fs::metadata(&target).unwrap().permissions().mode() & 0o777,
        0o600
    );
    assert!(ui.joined().contains("saved to"));
    assert!(!ui.joined().contains("aas-token-value"));
}

#[test]
fn tui_add_cancellation_back_and_duplicate_rejection() {
    let (temp, guard) = fixture();
    let target = temp.path().join("accounts.json");
    guard.set("APKEEP_ACCOUNTS_FILE", &target);

    let mut cancelled = ScriptedUi {
        texts: [None].into_iter().collect(),
        ..ScriptedUi::default()
    };
    assert!(add_account(&mut cancelled, None).unwrap().is_none());
    assert!(cancelled.joined().contains("Canceled: label required"));
    assert!(!target.exists());

    let existing = AccountsFile::new(vec![account(
        "personal",
        "user@example.com",
        "old-token",
        true,
    )]);
    let mut duplicate = ScriptedUi {
        texts: [
            Some("second".to_string()),
            Some("USER@example.com".to_string()),
            Some(String::new()),
            Some(String::new()),
            Some(String::new()),
        ]
        .into_iter()
        .collect(),
        passwords: [Some("new-token".to_string())].into_iter().collect(),
        selects: [Some(1)].into_iter().collect(),
        ..ScriptedUi::default()
    };
    let error = add_account(&mut duplicate, Some(&existing)).unwrap_err();
    assert!(error.to_string().contains("already exists"));
}

#[test]
fn tui_delete_requires_confirmation_and_state_transitions() {
    let (temp, guard) = fixture();
    let target = temp.path().join("accounts.json");
    guard.set("APKEEP_ACCOUNTS_FILE", &target);
    let original = AccountsFile::new(vec![
        account("acc1", "acc1@test.com", "t1", true),
        account("acc2", "acc2@test.com", "t2", true),
    ]);
    save_accounts(&original, Some(&target)).unwrap();

    let mut cancel = ScriptedUi {
        selects: [Some(0)].into_iter().collect(),
        confirms: [Some(false)].into_iter().collect(),
        ..ScriptedUi::default()
    };
    assert!(delete_account(&mut cancel, Some(&original))
        .unwrap()
        .is_none());
    assert!(cancel.joined().contains("Deletion canceled."));
    assert_eq!(parse_file(&target)["accounts"].as_array().unwrap().len(), 2);

    let mut confirm = ScriptedUi {
        selects: [Some(0)].into_iter().collect(),
        confirms: [Some(true)].into_iter().collect(),
        ..ScriptedUi::default()
    };
    let updated = delete_account(&mut confirm, Some(&original))
        .unwrap()
        .unwrap();
    assert_eq!(updated.accounts.len(), 1);
    assert_eq!(updated.accounts[0].label, "acc2");
    let saved = load_accounts_from_path(&target, false).unwrap().unwrap();
    assert_eq!(saved.accounts.len(), 1);
    assert_eq!(saved.accounts[0].email, "acc2@test.com");

    let mut back = ScriptedUi {
        selects: [None].into_iter().collect(),
        ..ScriptedUi::default()
    };
    assert!(delete_account(&mut back, Some(&updated)).unwrap().is_none());
    assert_eq!(parse_file(&target)["accounts"].as_array().unwrap().len(), 1);
}

#[test]
fn tui_check_uses_real_checker_and_redacts_failures() {
    let (_temp, _guard) = fixture();
    let file = AccountsFile::new(vec![
        account("acc1", "acc1@test.com", "token_secret_123", true),
        account("acc2", "acc2@test.com", "token_secret_456", true),
        account("off", "off@test.com", "token_secret_789", false),
    ]);

    let checker = FakeChecker {
        succeed: false,
        reason: "auth failed for token_secret_123 / acc1@test.com".to_string(),
        seen: Mutex::new(Vec::new()),
    };
    let mut ui = ScriptedUi::default();
    check_accounts(&mut ui, Some(&file), &checker);
    let output = ui.joined();
    assert!(!output.contains("token_secret_123"));
    assert!(!output.contains("acc1@test.com"));
    assert!(output.contains("[REDACTED]"));
    assert!(output.contains("0 success, 2 failures"));
    assert_eq!(*checker.seen.lock().unwrap(), vec!["acc1", "acc2"]);

    let checker = FakeChecker {
        succeed: true,
        reason: String::new(),
        seen: Mutex::new(Vec::new()),
    };
    let mut success = ScriptedUi::default();
    check_accounts(&mut success, Some(&file), &checker);
    assert!(success
        .joined()
        .contains("Authenticated successfully (tested com.adobe.scan.android v1.2.3)"));
    assert!(success.joined().contains("2 success, 0 failures"));
}

#[test]
fn oauth_exchange_uses_injected_seam_and_never_spawns_argv() {
    let (temp, guard) = fixture();
    let marker = temp.path().join("apkeep-invoked");
    let script = temp.path().join("apkeep");
    fs::write(
        &script,
        format!(
            "#!/bin/sh\nprintf '%s\\n' \"$@\" > '{}'\n",
            marker.display()
        ),
    )
    .unwrap();
    fs::set_permissions(&script, fs::Permissions::from_mode(0o755)).unwrap();
    guard.set("APKEEP_BIN", &script);

    let exchanger = FakeExchanger::success("aas_et/exchanged-token");
    let mut ui = ScriptedUi::default();
    let token = exchange_oauth_for_aas_with(
        &mut ui,
        DEFAULT_DEVICE,
        "user@example.com",
        "oauth-token-value",
        &exchanger,
    )
    .unwrap();
    assert_eq!(token.as_deref(), Some("aas_et/exchanged-token"));
    assert!(
        !marker.exists(),
        "OAuth exchange must not invoke a subprocess: {:?}",
        fs::read_to_string(&marker)
    );
    assert_eq!(
        exchanger.seen.lock().unwrap().as_slice(),
        &[(
            DEFAULT_DEVICE.to_string(),
            "user@example.com".to_string(),
            "oauth-token-value".to_string()
        )]
    );
}

#[test]
fn oauth_exchange_failure_redacts_encoded_forms_and_offers_fallback() {
    let (_temp, _guard) = fixture();
    let oauth_token = "oauth+token/Value";
    let error = format!(
        "exchange rejected for {oauth_token} ({}, {}) and user@example.com (user%40example.com)",
        "oauth%2Btoken%2FValue", "oauth%2btoken%2fValue"
    );
    let exchanger = FakeExchanger::failure(error);
    let mut ui = ScriptedUi {
        passwords: [Some("fallback-aas-token".to_string())]
            .into_iter()
            .collect(),
        ..ScriptedUi::default()
    };

    let token = exchange_oauth_for_aas_with(
        &mut ui,
        DEFAULT_DEVICE,
        "user@example.com",
        oauth_token,
        &exchanger,
    )
    .unwrap();
    assert_eq!(token.as_deref(), Some("fallback-aas-token"));
    let output = ui.joined();
    for leaked in [
        oauth_token,
        "oauth%2Btoken%2FValue",
        "oauth%2btoken%2fValue",
        "user@example.com",
        "user%40example.com",
    ] {
        assert!(!output.contains(leaked), "leaked {leaked:?} in {output}");
    }
    assert!(output.contains("[REDACTED_TOKEN]"), "{output}");
    assert!(output.contains("[OAUTH_TOKEN]"), "{output}");
}

struct FakeExchanger {
    result: Result<String, String>,
    seen: Mutex<Vec<(String, String, String)>>,
}

impl FakeExchanger {
    fn success(token: &str) -> Self {
        Self {
            result: Ok(token.to_string()),
            seen: Mutex::new(Vec::new()),
        }
    }

    fn failure(message: impl Into<String>) -> Self {
        Self {
            result: Err(message.into()),
            seen: Mutex::new(Vec::new()),
        }
    }
}

impl OAuthExchanger for FakeExchanger {
    fn exchange(&self, device: &str, email: &str, oauth_token: &str) -> Result<String, String> {
        self.seen.lock().unwrap().push((
            device.to_string(),
            email.to_string(),
            oauth_token.to_string(),
        ));
        self.result.clone()
    }
}

#[test]
fn tui_menu_exits_on_cancel_and_explicit_exit() {
    let (_temp, _guard) = fixture();
    let checker = FakeChecker::default();

    let mut cancelled = ScriptedUi::with_selects(&[None]);
    run_play_accounts_tui(&mut cancelled, &checker).unwrap();
    assert!(cancelled.joined().contains("Exiting."));

    let mut explicit = ScriptedUi::with_selects(&[Some(5)]);
    run_play_accounts_tui(&mut explicit, &checker).unwrap();
    assert!(explicit.joined().contains("Exiting."));
}

// --- GitHub secret synchronization -----------------------------------------

fn fake_gh(temp: &Path, capture_stdin: &Path, capture_args: &Path) -> PathBuf {
    let script = temp.join("gh");
    let body = format!(
        "#!/bin/sh\nprintf '%s\\n' \"$@\" > '{}'\nif [ \"$1\" = auth ]; then exit 0; fi\ncat > '{}'\nprintf ok\n",
        capture_args.display(),
        capture_stdin.display()
    );
    fs::write(&script, body).unwrap();
    fs::set_permissions(&script, fs::Permissions::from_mode(0o755)).unwrap();
    script
}

#[test]
fn sync_writes_secret_to_stdin_only() {
    let (temp, _guard) = fixture();
    let capture_stdin = temp.path().join("stdin.txt");
    let capture_args = temp.path().join("args.txt");
    let gh = fake_gh(temp.path(), &capture_stdin, &capture_args);

    let file = AccountsFile::new(vec![account(
        "acc1",
        "acc1@test.com",
        "token_abc_secret",
        true,
    )]);
    let mut ui = ScriptedUi::default();
    let options = SyncOptions {
        gh_bin: Some(gh),
        repository: "ihatenodejs/aidans-patches".to_string(),
    };
    sync_github_secret(&mut ui, Some(&file), &options).unwrap();

    let stdin = fs::read_to_string(&capture_stdin).unwrap();
    assert!(stdin.contains("token_abc_secret"));
    assert!(stdin.contains("acc1@test.com"));
    let parsed: Value = serde_json::from_str(&stdin).unwrap();
    assert_eq!(parsed["version"], 1);
    assert_eq!(parsed["accounts"][0]["aasToken"], "token_abc_secret");

    let args = fs::read_to_string(&capture_args).unwrap();
    assert!(args.contains("secret"));
    assert!(args.contains("APKEEP_ACCOUNTS"));
    assert!(args.contains("ihatenodejs/aidans-patches"));
    assert!(!args.contains("token_abc_secret"));
    assert!(!args.contains("acc1@test.com"));
    assert!(ui.joined().contains("Successfully synchronized"));
}

#[test]
fn sync_reports_unauthenticated_gh_without_mutation() {
    let (temp, _guard) = fixture();
    let script = temp.path().join("gh");
    fs::write(&script, "#!/bin/sh\nexit 1\n").unwrap();
    fs::set_permissions(&script, fs::Permissions::from_mode(0o755)).unwrap();

    let file = AccountsFile::new(vec![account("acc1", "acc1@test.com", "token", true)]);
    let mut ui = ScriptedUi::default();
    let options = SyncOptions {
        gh_bin: Some(script),
        repository: "ihatenodejs/aidans-patches".to_string(),
    };
    sync_github_secret(&mut ui, Some(&file), &options).unwrap();
    assert!(ui.joined().contains("not authenticated"));
}
