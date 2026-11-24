//! Version-1 Google Play account storage.
//!
//! Native port of the retired Python implementation.
//!
//! The persisted contract is intentionally the same as the retired Python
//! implementation: a JSON object with an integer `version` of `1` and an
//! `accounts` array using `label`, `email`, `aasToken`, `device`, `locale`,
//! `timezone` and `enabled`. Emails are lower-cased and must be unique.
//!
//! Secret material never reaches `Debug` or diagnostics: [`Account`] has a
//! hand-written `Debug` that prints the redacted email and masks the token.

use serde::ser::SerializeStruct;
use serde::{Serialize, Serializer};
use serde_json::{Map, Value};
use std::fmt;
use std::fs;
use std::io::{self, Write};
use std::path::{Path, PathBuf};

use tempfile::NamedTempFile;

use crate::acquisition::{check_private_file, read_private_file};

pub const ACCOUNTS_VERSION: u32 = 1;
pub const DEFAULT_DEVICE: &str = "px_9a";
pub const DEFAULT_LOCALE: &str = "en_US";
pub const DEFAULT_TIMEZONE: &str = "UTC";
const FILE_MODE: u32 = 0o600;
const DIRECTORY_MODE: u32 = 0o700;
const REDACTED_TOKEN: &str = "[REDACTED]";

/// Typed account parsing or filesystem failure.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct AccountsError {
    message: String,
}

impl AccountsError {
    #[must_use]
    pub fn new(message: impl Into<String>) -> Self {
        Self {
            message: message.into(),
        }
    }
}

impl fmt::Display for AccountsError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&self.message)
    }
}

impl std::error::Error for AccountsError {}

impl From<io::Error> for AccountsError {
    fn from(error: io::Error) -> Self {
        Self::new(error.to_string())
    }
}

/// A single Google Play account.
#[derive(Clone, PartialEq, Eq)]
pub struct Account {
    pub label: String,
    pub email: String,
    pub aas_token: String,
    pub device: String,
    pub locale: String,
    pub timezone: String,
    pub enabled: bool,
}

impl Account {
    /// Parses and validates one object from the persisted schema.
    pub fn from_value(value: &Value) -> Result<Self, AccountsError> {
        let object = value
            .as_object()
            .ok_or_else(|| AccountsError::new("Account entry must be an object"))?;

        let label = required_string(object, "label", "Account label")?;
        let email = required_string(object, "email", "Account email")?;
        let aas_token = required_string(object, "aasToken", "Account aasToken")?;
        let device = optional_string(object, "device", DEFAULT_DEVICE, "Account device")?;
        let locale = optional_string(object, "locale", DEFAULT_LOCALE, "Account locale")?;
        let timezone = optional_string(object, "timezone", DEFAULT_TIMEZONE, "Account timezone")?;
        let enabled = match object.get("enabled") {
            None => true,
            Some(Value::Bool(value)) => *value,
            Some(_) => {
                return Err(AccountsError::new("Account enabled must be a boolean"));
            }
        };

        let normalized_email = email.to_lowercase();
        if !is_valid_email(&normalized_email) {
            return Err(AccountsError::new(format!(
                "Account email '{email}' is malformed"
            )));
        }

        Ok(Self {
            label,
            email: normalized_email,
            aas_token,
            device,
            locale,
            timezone,
            enabled,
        })
    }

    /// `us***@example.com` for a typical address, never the raw address.
    #[must_use]
    pub fn redacted_email(&self) -> String {
        let Some((user, domain)) = self.email.split_once('@') else {
            return "***".to_string();
        };
        let kept = if user.chars().count() <= 2 { 1 } else { 2 };
        let prefix: String = user.chars().take(kept).collect();
        format!("{prefix}***@{domain}")
    }

    /// Diagnostic form of this account. The token is always masked and the
    /// email is redacted so logs remain credential-free.
    #[must_use]
    pub fn redacted_summary(&self) -> String {
        format!(
            "[{}] {} ({})",
            self.label,
            self.redacted_email(),
            if self.enabled { "ENABLED" } else { "DISABLED" }
        )
    }

    /// Replaces a token and raw email with their redacted forms, then truncates.
    /// Redaction happens before truncation so a cut cannot expose a suffix.
    #[must_use]
    pub fn redact_diagnostic(&self, text: &str, limit: usize) -> String {
        let mut redacted = text.replace(&self.aas_token, REDACTED_TOKEN);
        if !self.email.is_empty() {
            redacted = redacted.replace(&self.email, &self.redacted_email());
        }
        truncate_chars(&redacted, limit)
    }
}

impl fmt::Debug for Account {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("Account")
            .field("label", &self.label)
            .field("email", &self.redacted_email())
            .field("aasToken", &REDACTED_TOKEN)
            .field("device", &self.device)
            .field("locale", &self.locale)
            .field("timezone", &self.timezone)
            .field("enabled", &self.enabled)
            .finish()
    }
}

impl Serialize for Account {
    fn serialize<S: Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        let mut state = serializer.serialize_struct("Account", 7)?;
        state.serialize_field("label", &self.label)?;
        state.serialize_field("email", &self.email)?;
        state.serialize_field("aasToken", &self.aas_token)?;
        state.serialize_field("device", &self.device)?;
        state.serialize_field("locale", &self.locale)?;
        state.serialize_field("timezone", &self.timezone)?;
        state.serialize_field("enabled", &self.enabled)?;
        state.end()
    }
}

/// The complete version-1 accounts document.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct AccountsFile {
    pub version: u32,
    pub accounts: Vec<Account>,
}

impl AccountsFile {
    #[must_use]
    pub fn new(accounts: Vec<Account>) -> Self {
        Self {
            version: ACCOUNTS_VERSION,
            accounts,
        }
    }

    /// Parses a JSON document. Duplicate emails are compared after lower-casing.
    pub fn from_json(json: &str, require_enabled: bool) -> Result<Self, AccountsError> {
        let value: Value = serde_json::from_str(json)
            .map_err(|error| AccountsError::new(format!("Invalid JSON payload: {error}")))?;
        Self::from_value(&value, require_enabled)
    }

    /// Validates an already-parsed JSON value.
    pub fn from_value(value: &Value, require_enabled: bool) -> Result<Self, AccountsError> {
        let object = value
            .as_object()
            .ok_or_else(|| AccountsError::new("Google Play accounts payload must be an object"))?;

        let version = object
            .get("version")
            .and_then(Value::as_u64)
            .ok_or_else(|| AccountsError::new("Unsupported schema version: missing"))?;
        if version != u64::from(ACCOUNTS_VERSION) {
            return Err(AccountsError::new(format!(
                "Unsupported schema version: {version}; only version 1 is supported"
            )));
        }

        let raw_accounts = object
            .get("accounts")
            .and_then(Value::as_array)
            .ok_or_else(|| AccountsError::new("'accounts' must be a list"))?;

        let mut accounts = Vec::with_capacity(raw_accounts.len());
        let mut seen = std::collections::HashSet::with_capacity(raw_accounts.len());
        for item in raw_accounts {
            let account = Account::from_value(item)?;
            if !seen.insert(account.email.clone()) {
                return Err(AccountsError::new(format!(
                    "Duplicate email found in accounts: {}",
                    account.email
                )));
            }
            accounts.push(account);
        }

        if require_enabled && !accounts.iter().any(|account| account.enabled) {
            return Err(AccountsError::new("No enabled accounts configured"));
        }

        Ok(Self {
            version: ACCOUNTS_VERSION,
            accounts,
        })
    }

    /// Pretty JSON used by the on-disk file (two-space indent plus newline).
    pub fn to_pretty_json(&self) -> Result<String, AccountsError> {
        let mut json = serde_json::to_string_pretty(self).map_err(|error| {
            AccountsError::new(format!("Failed to serialize accounts: {error}"))
        })?;
        json.push('\n');
        Ok(json)
    }

    /// Minified JSON, suitable for `APKEEP_ACCOUNTS` and GitHub secret input.
    pub fn to_minified_json(&self) -> Result<String, AccountsError> {
        serde_json::to_string(self)
            .map_err(|error| AccountsError::new(format!("Failed to serialize accounts: {error}")))
    }

    pub fn enabled(&self) -> impl Iterator<Item = &Account> {
        self.accounts.iter().filter(|account| account.enabled)
    }
}

fn required_string(
    object: &Map<String, Value>,
    key: &str,
    description: &str,
) -> Result<String, AccountsError> {
    match object.get(key) {
        Some(Value::String(value)) if !value.trim().is_empty() => Ok(value.trim().to_string()),
        Some(Value::String(_)) | None => Err(AccountsError::new(format!(
            "{description} must be a non-empty string"
        ))),
        Some(_) => Err(AccountsError::new(format!(
            "{description} must be a non-empty string"
        ))),
    }
}

fn optional_string(
    object: &Map<String, Value>,
    key: &str,
    default: &str,
    description: &str,
) -> Result<String, AccountsError> {
    match object.get(key) {
        None => Ok(default.to_string()),
        Some(Value::String(value)) if !value.trim().is_empty() => Ok(value.trim().to_string()),
        Some(Value::String(_)) | Some(_) => Err(AccountsError::new(format!(
            "{description} must be a non-empty string"
        ))),
    }
}

fn truncate_chars(text: &str, limit: usize) -> String {
    if text.chars().count() <= limit {
        return text.to_string();
    }
    text.chars().take(limit).collect()
}

/// Matches the Python contract: one `@`, no whitespace, and a dotted domain.
#[must_use]
pub fn is_valid_email(email: &str) -> bool {
    let mut parts = email.split('@');
    let Some(local) = parts.next() else {
        return false;
    };
    let Some(domain) = parts.next() else {
        return false;
    };
    if parts.next().is_some() {
        return false;
    }
    if local.is_empty() || domain.is_empty() {
        return false;
    }
    if local.chars().any(char::is_whitespace) || domain.chars().any(char::is_whitespace) {
        return false;
    }
    match domain.split_once('.') {
        Some((head, tail)) => !head.is_empty() && !tail.is_empty() && !tail.contains('@'),
        None => false,
    }
}

/// Resolves `${XDG_CONFIG_HOME:-$HOME/.config}/aidans-patches/google-play-accounts.json`,
/// honouring `APKEEP_ACCOUNTS_FILE` first.
pub fn default_accounts_file_path() -> Result<PathBuf, AccountsError> {
    if let Some(override_path) = non_empty_env("APKEEP_ACCOUNTS_FILE") {
        return absolute_path(expand_tilde(&override_path)?);
    }

    let base = if let Some(xdg) = non_empty_env("XDG_CONFIG_HOME") {
        absolute_path(expand_tilde(&xdg)?)?
    } else {
        let home = non_empty_env("HOME")
            .ok_or_else(|| AccountsError::new("Cannot determine home directory: HOME is unset"))?;
        absolute_path(expand_tilde(&home)?)?.join(".config")
    };

    Ok(base
        .join("aidans-patches")
        .join("google-play-accounts.json"))
}

/// Loads `APKEEP_ACCOUNTS` when present, otherwise the accounts file.
///
/// Returns `None` when no configuration source exists.
pub fn load_accounts(require_enabled: bool) -> Result<Option<AccountsFile>, AccountsError> {
    if let Some(raw) = non_empty_env("APKEEP_ACCOUNTS") {
        return AccountsFile::from_json(raw.trim(), require_enabled).map(Some);
    }
    load_accounts_from_path(&default_accounts_file_path()?, require_enabled)
}

/// Loads one explicit path. Missing files yield `None`.
pub fn load_accounts_from_path(
    path: &Path,
    require_enabled: bool,
) -> Result<Option<AccountsFile>, AccountsError> {
    let content = match read_private_file(path, "Accounts file") {
        Ok(content) => content,
        Err(error) if error.kind() == io::ErrorKind::NotFound => return Ok(None),
        Err(error) => return Err(AccountsError::new(error.to_string())),
    };
    AccountsFile::from_json(&content, require_enabled).map(Some)
}

/// Rejects symlinks and any group/world permission bit. Delegates to the
/// descriptor-based [`read_private_file`] so an attacker cannot swap the path
/// between a metadata check and the read.
pub fn check_accounts_file_permissions(path: &Path) -> Result<(), AccountsError> {
    check_private_file(path, "Accounts file").map_err(|error| AccountsError::new(error.to_string()))
}

/// Atomically writes the file with mode `0600`, creating parents with `0700`.
///
/// The destination is replaced only after a complete temporary file exists in
/// the same directory, so an interrupted write leaves any existing file intact.
pub fn save_accounts(
    accounts: &AccountsFile,
    target: Option<&Path>,
) -> Result<PathBuf, AccountsError> {
    let destination = match target {
        Some(path) => path.to_path_buf(),
        None => default_accounts_file_path()?,
    };

    if let Ok(metadata) = fs::symlink_metadata(&destination) {
        if metadata.file_type().is_symlink() {
            return Err(AccountsError::new(format!(
                "Cannot write to a symlinked accounts file: {}",
                destination.display()
            )));
        }
    }

    let parent = destination.parent().ok_or_else(|| {
        AccountsError::new(format!(
            "Accounts path has no parent directory: {}",
            destination.display()
        ))
    })?;
    fs::create_dir_all(parent)
        .map_err(|error| AccountsError::from_io("create accounts directory", parent, error))?;
    set_mode(parent, DIRECTORY_MODE)
        .map_err(|error| AccountsError::from_io("chmod accounts directory", parent, error))?;

    let payload = accounts.to_pretty_json()?;
    let mut temp = NamedTempFile::new_in(parent)
        .map_err(|error| AccountsError::from_io("create temporary accounts file", parent, error))?;
    temp.as_file()
        .set_permissions(permissions(FILE_MODE))
        .map_err(|error| {
            AccountsError::from_io("chmod temporary accounts file", temp.path(), error)
        })?;
    temp.write_all(payload.as_bytes()).map_err(|error| {
        AccountsError::from_io("write temporary accounts file", temp.path(), error)
    })?;
    temp.as_file().sync_all().map_err(|error| {
        AccountsError::from_io("sync temporary accounts file", temp.path(), error)
    })?;
    temp.persist(&destination).map_err(|error| {
        AccountsError::from_io("replace accounts file", &destination, error.error)
    })?;
    set_mode(&destination, FILE_MODE)
        .map_err(|error| AccountsError::from_io("chmod accounts file", &destination, error))?;

    Ok(destination)
}

impl AccountsError {
    fn from_io(context: &str, path: &Path, error: io::Error) -> Self {
        Self::new(format!("{context} {}: {error}", path.display()))
    }
}

#[cfg(unix)]
fn permissions(mode: u32) -> fs::Permissions {
    use std::os::unix::fs::PermissionsExt;
    fs::Permissions::from_mode(mode)
}

#[cfg(not(unix))]
fn permissions(_mode: u32) -> fs::Permissions {
    fs::Permissions::default()
}

fn set_mode(path: &Path, mode: u32) -> io::Result<()> {
    fs::set_permissions(path, permissions(mode))
}

fn non_empty_env(key: &str) -> Option<String> {
    let value = std::env::var(key).ok()?;
    if value.trim().is_empty() {
        None
    } else {
        Some(value)
    }
}

fn expand_tilde(raw: &str) -> Result<PathBuf, AccountsError> {
    if raw == "~" {
        let home = non_empty_env("HOME")
            .ok_or_else(|| AccountsError::new("Cannot expand '~': HOME is unset"))?;
        return Ok(PathBuf::from(home));
    }
    if let Some(rest) = raw.strip_prefix("~/") {
        let home = non_empty_env("HOME")
            .ok_or_else(|| AccountsError::new("Cannot expand '~': HOME is unset"))?;
        return Ok(PathBuf::from(home).join(rest));
    }
    Ok(PathBuf::from(raw))
}

fn absolute_path(path: PathBuf) -> Result<PathBuf, AccountsError> {
    std::path::absolute(&path)
        .map_err(|error| AccountsError::new(format!("Cannot resolve {}: {error}", path.display())))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn valid_value() -> Value {
        serde_json::json!({
            "version": 1,
            "accounts": [{
                "label": "personal",
                "email": "User@Example.COM",
                "aasToken": "aas_token_123",
                "device": "px_9a",
                "locale": "en_US",
                "timezone": "UTC",
                "enabled": true
            }]
        })
    }

    #[test]
    fn normalizes_email_and_defaults() {
        let file = AccountsFile::from_value(&valid_value(), true).unwrap();
        assert_eq!(file.accounts[0].email, "user@example.com");
        assert_eq!(file.accounts[0].device, "px_9a");
        assert!(file.accounts[0].enabled);
    }

    #[test]
    fn duplicate_emails_are_rejected_after_lowercasing() {
        let value = serde_json::json!({
            "version": 1,
            "accounts": [
                {"label": "a", "email": "user@example.com", "aasToken": "t1"},
                {"label": "b", "email": "USER@example.com", "aasToken": "t2"}
            ]
        });
        let error = AccountsFile::from_value(&value, true).unwrap_err();
        assert!(error.to_string().contains("Duplicate email"));
    }

    #[test]
    fn debug_output_masks_token_and_email() {
        let account = Account::from_value(&valid_value()["accounts"][0]).unwrap();
        let debug = format!("{account:?}");
        assert!(!debug.contains("aas_token_123"));
        assert!(!debug.contains("user@example.com"));
        assert!(debug.contains("[REDACTED]"));
    }
}
