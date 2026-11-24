//! Native Play delivery provider boundary.
//!
//! The acquisition orchestrator uses these types for direct AAS, OAuth, and
//! dispenser authentication. Tests inject deterministic backends; production
//! uses the `gpapi` implementation. Tokens, email addresses, and dispenser auth
//! material are never logged, printed, or serialized.
//!
//! The provider boundary is deliberately small: [`PlayBackend`] opens one
//! authenticated session per enabled account, and [`PlaySession`] resolves
//! details before downloading. The version check therefore happens before any
//! bytes are requested, so a mismatched version never triggers a download.

use serde::{Deserialize, Serialize};
use std::future::Future;
use std::io::Read;
use std::path::Path;
use std::pin::Pin;
use std::time::Duration;

use crate::error::Error;

/// Hard upper bound for one dispenser HTTP response body.
///
/// The dispenser returns a small JSON document; anything larger is hostile or
/// broken and must not be buffered without limit.
pub const MAX_DISPENSER_RESPONSE_BYTES: usize = 1024 * 1024;

/// Reads a dispenser response body without ever buffering more than `limit`
/// bytes. One extra byte is probed to distinguish an exact-limit body from an
/// oversized one; an endless stream therefore stops at `limit + 1` reads.
///
/// # Errors
///
/// Returns an infrastructure error when the stream exceeds `limit`, fails to
/// read, or is not valid UTF-8.
pub fn read_dispenser_response(mut reader: impl Read, limit: usize) -> Result<String, Error> {
    let mut bytes = Vec::new();
    let mut buffer = [0_u8; 8 * 1024];
    loop {
        if bytes.len() == limit {
            let mut probe = [0_u8; 1];
            return match reader.read(&mut probe) {
                Ok(0) => String::from_utf8(bytes).map_err(|error| {
                    Error::infrastructure(format!(
                        "dispenser response was not valid UTF-8: {error}"
                    ))
                }),
                Ok(_) => Err(Error::infrastructure(format!(
                    "dispenser response exceeded the {limit}-byte limit"
                ))),
                Err(error) => Err(Error::infrastructure(format!(
                    "dispenser response body could not be read: {error}"
                ))),
            };
        }
        let remaining = limit - bytes.len();
        let want = remaining.min(buffer.len());
        match reader.read(&mut buffer[..want]) {
            Ok(0) => {
                return String::from_utf8(bytes).map_err(|error| {
                    Error::infrastructure(format!(
                        "dispenser response was not valid UTF-8: {error}"
                    ))
                })
            }
            Ok(read) => bytes.extend_from_slice(&buffer[..read]),
            Err(error) => {
                return Err(Error::infrastructure(format!(
                    "dispenser response body could not be read: {error}"
                )))
            }
        }
    }
}

const DISPENSER_USER_AGENT: &str = "com.aurora.store-4.6.1-70";
const DEFAULT_DEVICE: &str = "px_9a";
const DEFAULT_LOCALE: &str = "en_US";
const DEFAULT_TIMEZONE: &str = "UTC";

/// Fixed Android profile sent to the Aurora dispenser, compiled into the
/// binary so runtime does not read another checkout or an account record.
///
/// The values are a pinned Pixel 4a property set; the dispenser rejects
/// abbreviated profiles with HTTP 500.
const DISPENSER_PROFILE: &str = include_str!("aurora-profile.json");

type BoxFuture<'a, T> = Pin<Box<dyn Future<Output = T> + 'a>>;

/// Stable message for a gpapi failure.
///
/// Only [`Error::kind`](gpapi::error::Error::kind) is inspected, when the
/// underlying boxed error is a gpapi error. Raw `Display` output is deliberately
/// never interpolated because reqwest errors can embed request URLs containing
/// OAuth or AAS material.
#[must_use]
pub fn gpapi_error_message(stage: &str, error: &(dyn std::error::Error + 'static)) -> String {
    use gpapi::error::ErrorKind;

    let kind = error
        .downcast_ref::<gpapi::error::Error>()
        .map(gpapi::error::Error::kind);
    let detail = match kind {
        Some(ErrorKind::FileExists) => "the destination file already exists",
        Some(ErrorKind::DirectoryExists) => "the destination directory already exists",
        Some(ErrorKind::DirectoryMissing) => "the destination directory is missing",
        Some(ErrorKind::InvalidApp) => "the application id was rejected",
        Some(ErrorKind::Authentication) => "authentication was rejected",
        Some(ErrorKind::TermsOfService) => "the account requires Terms of Service acceptance",
        Some(ErrorKind::PermissionDenied) => "the account lacks permission for this request",
        Some(ErrorKind::InvalidResponse) => "the provider returned an invalid response",
        Some(ErrorKind::LoginRequired) => "the session requires a login",
        Some(ErrorKind::IO(_)) => "a local file operation failed",
        Some(ErrorKind::Str(_) | ErrorKind::Other(_)) | None => "the provider reported a failure",
    };
    format!("{stage}: {detail}")
}

/// Maps a ureq failure to a stable message without its URL or request body.
fn dispenser_http_error(error: &ureq::Error, timeout: Duration) -> String {
    match error {
        ureq::Error::Timeout(_) => {
            format!("dispenser HTTP request exceeded the {timeout:?} timeout")
        }
        ureq::Error::StatusCode(status) => {
            format!("dispenser HTTP request was rejected with status {status}")
        }
        ureq::Error::HostNotFound => "dispenser host could not be resolved".to_string(),
        ureq::Error::Io(error) => {
            format!(
                "dispenser HTTP request failed: network error ({:?})",
                error.kind()
            )
        }
        _ => "dispenser HTTP request failed".to_string(),
    }
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Mode {
    #[default]
    Aas,
    Oauth,
    Dispenser,
}

/// One account from the untouched `apkeep`-compatible accounts document.
///
/// No `Debug` implementation: the type holds an AAS token and an email.
#[derive(Clone, Deserialize)]
pub struct AccountConfig {
    pub label: String,
    pub email: String,
    #[serde(rename = "aasToken", default)]
    pub aas_token: String,
    #[serde(default = "default_device")]
    pub device: String,
    #[serde(default = "default_locale")]
    pub locale: String,
    #[serde(default = "default_timezone")]
    pub timezone: String,
    #[serde(default = "default_enabled")]
    pub enabled: bool,
}

fn default_device() -> String {
    DEFAULT_DEVICE.to_string()
}

fn default_locale() -> String {
    DEFAULT_LOCALE.to_string()
}

fn default_timezone() -> String {
    DEFAULT_TIMEZONE.to_string()
}

fn default_enabled() -> bool {
    true
}

#[derive(Deserialize)]
pub struct AccountsFile {
    pub version: u32,
    pub accounts: Vec<AccountConfig>,
}

#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct VersionInfo {
    pub version_name: String,
    pub version_code: u64,
}

/// Authentication material supplied to the provider boundary. `oauth_token`
/// is only present in OAuth mode and is never retained in a report. `timeout`
/// is the remaining attempt budget; the blocking dispenser call enforces it so
/// an unresponsive HTTP peer cannot outlive the attempt deadline.
#[derive(Clone, Copy)]
pub struct AuthContext<'a> {
    pub mode: Mode,
    pub oauth_token: Option<&'a str>,
    pub dispenser_url: &'a str,
    pub timeout: Duration,
}

/// Provider seam. `open` performs authentication and returns one session so
/// that OAuth tokens (which are single-use) are consumed exactly once and the
/// details/version check share the same authenticated connection as download.
pub trait PlayBackend {
    fn open<'a>(
        &'a self,
        account: &'a AccountConfig,
        auth: &'a AuthContext<'a>,
    ) -> BoxFuture<'a, Result<Box<dyn PlaySession + 'a>, String>>;
}

pub trait PlaySession {
    fn details<'a>(&'a mut self, package: &'a str) -> BoxFuture<'a, Result<VersionInfo, String>>;

    fn download<'a>(
        &'a mut self,
        package: &'a str,
        version_code: Option<i64>,
        dest: &'a Path,
    ) -> BoxFuture<'a, Result<(), String>>;
}

/// Blocking HTTP boundary for the dispenser, injectable in tests. `timeout` is
/// the remaining attempt budget and must bound the whole request, including
/// reading the response body.
pub trait DispenserHttp {
    fn post(
        &self,
        url: &str,
        user_agent: &str,
        body: &str,
        timeout: Duration,
    ) -> Result<String, String>;
}

struct UreqDispenserHttp;

impl DispenserHttp for UreqDispenserHttp {
    fn post(
        &self,
        url: &str,
        user_agent: &str,
        body: &str,
        timeout: Duration,
    ) -> Result<String, String> {
        let agent: ureq::Agent = ureq::Agent::config_builder()
            .timeout_global(Some(timeout))
            .build()
            .into();
        let mut response = agent
            .post(url)
            .header("user-agent", user_agent)
            .header("content-type", "application/json")
            .send(body)
            .map_err(|error| dispenser_http_error(&error, timeout))?;
        let reader = response
            .body_mut()
            .with_config()
            .limit(MAX_DISPENSER_RESPONSE_BYTES as u64 + 1)
            .reader();
        read_dispenser_response(reader, MAX_DISPENSER_RESPONSE_BYTES)
            .map_err(|error| error.message())
    }
}

pub struct GpapiBackend {
    http: Box<dyn DispenserHttp>,
}

impl GpapiBackend {
    pub fn new() -> Self {
        Self {
            http: Box::new(UreqDispenserHttp),
        }
    }

    /// Injects a deterministic dispenser transport for tests and other
    /// development harnesses. Production code uses [`GpapiBackend::new`].
    pub fn with_http(http: Box<dyn DispenserHttp>) -> Self {
        Self { http }
    }

    fn dispense(&self, url: &str, timeout: Duration) -> Result<String, String> {
        dispense_auth_token(self.http.as_ref(), url, timeout)
    }
}

impl Default for GpapiBackend {
    fn default() -> Self {
        Self::new()
    }
}

struct GpapiSession {
    api: gpapi::Gpapi,
}

impl PlayBackend for GpapiBackend {
    fn open<'a>(
        &'a self,
        account: &'a AccountConfig,
        auth: &'a AuthContext<'a>,
    ) -> BoxFuture<'a, Result<Box<dyn PlaySession + 'a>, String>> {
        Box::pin(async move {
            let mut api =
                std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| build_gpapi(account)))
                    .map_err(|_| "provider rejected the configured device profile".to_string())?;

            match auth.mode {
                Mode::Aas => api.set_aas_token(account.aas_token.as_str()),
                Mode::Oauth => {
                    let oauth_token = auth
                        .oauth_token
                        .ok_or_else(|| "OAuth mode requires an OAuth token".to_string())?;
                    api.request_aas_token(oauth_token).await.map_err(|error| {
                        gpapi_error_message("OAuth token exchange failed", &error)
                    })?;
                }
                Mode::Dispenser => {
                    let auth_token = self.dispense(auth.dispenser_url, auth.timeout)?;
                    api.set_auth_token(auth_token);
                }
            }

            if let Err(error) = api.login().await {
                if auth.mode != Mode::Dispenser
                    || !matches!(error.kind(), gpapi::error::ErrorKind::TermsOfService)
                {
                    return Err(gpapi_error_message("Play login failed", &error));
                }
                api.accept_tos().await.map_err(|error| {
                    gpapi_error_message("Play Terms of Service acceptance failed", error.as_ref())
                })?;
                // gpapi documents accept_tos as making the API ready; a second
                // login would request the same ToS token again.
            }

            Ok(Box::new(GpapiSession { api }) as Box<dyn PlaySession + 'a>)
        })
    }
}

fn build_gpapi(account: &AccountConfig) -> gpapi::Gpapi {
    let mut api = gpapi::Gpapi::new(account.device.as_str(), account.email.as_str());
    api.set_locale(account.locale.as_str());
    api.set_timezone(account.timezone.as_str());
    api
}

impl PlaySession for GpapiSession {
    fn details<'a>(&'a mut self, package: &'a str) -> BoxFuture<'a, Result<VersionInfo, String>> {
        Box::pin(async move {
            let response = self
                .api
                .details(package)
                .await
                .map_err(|error| {
                    gpapi_error_message("Play details request failed", error.as_ref())
                })?
                .ok_or_else(|| "Play details response was empty".to_string())?;

            let app = response
                .item
                .and_then(|item| item.details)
                .and_then(|details| details.app_details)
                .ok_or_else(|| "Play details response did not contain app details".to_string())?;

            let version_name = app.version_string.unwrap_or_default();
            let version_code = app.version_code.unwrap_or(0);
            if version_code <= 0 {
                return Err("Play details response did not contain a positive version code".into());
            }

            Ok(VersionInfo {
                version_name,
                version_code: version_code as u64,
            })
        })
    }

    fn download<'a>(
        &'a mut self,
        package: &'a str,
        version_code: Option<i64>,
        dest: &'a Path,
    ) -> BoxFuture<'a, Result<(), String>> {
        Box::pin(async move {
            self.api
                .download(package, version_code, true, false, false, dest, None)
                .await
                .map(|_| ())
                .map_err(|error| gpapi_error_message("Play download failed", &error))
        })
    }
}

fn dispense_auth_token(
    http: &dyn DispenserHttp,
    url: &str,
    timeout: Duration,
) -> Result<String, String> {
    let body = http.post(url, DISPENSER_USER_AGENT, DISPENSER_PROFILE, timeout)?;
    let parsed: serde_json::Value = serde_json::from_str(&body)
        .map_err(|error| format!("dispenser response was not valid JSON: {error}"))?;
    parsed
        .get("authToken")
        .and_then(|value| value.as_str())
        .map(str::trim)
        .filter(|token| !token.is_empty())
        .map(str::to_string)
        .ok_or_else(|| "dispenser response did not contain a non-empty authToken".to_string())
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::acquisition::DEFAULT_DISPENSER_URL;

    struct FakeHttp {
        result: Result<String, String>,
    }

    impl DispenserHttp for FakeHttp {
        fn post(
            &self,
            _url: &str,
            _user_agent: &str,
            _body: &str,
            _timeout: Duration,
        ) -> Result<String, String> {
            self.result.clone()
        }
    }

    #[test]
    fn account_config_applies_serde_defaults() {
        let account: AccountConfig =
            serde_json::from_str(r#"{"label":"primary","email":"primary@example.invalid"}"#)
                .unwrap();

        assert_eq!(account.label, "primary");
        assert_eq!(account.email, "primary@example.invalid");
        assert!(account.aas_token.is_empty());
        assert_eq!(account.device, DEFAULT_DEVICE);
        assert_eq!(account.locale, DEFAULT_LOCALE);
        assert_eq!(account.timezone, DEFAULT_TIMEZONE);
        assert!(account.enabled);
    }

    #[test]
    fn accounts_file_reads_explicit_fields() {
        let file: AccountsFile = serde_json::from_str(
            r#"{
                "version": 1,
                "accounts": [{
                    "label": "primary",
                    "email": "primary@example.invalid",
                    "aasToken": "aas_et/token",
                    "device": "custom_device",
                    "locale": "fr_FR",
                    "timezone": "Europe/Paris",
                    "enabled": false
                }]
            }"#,
        )
        .unwrap();

        assert_eq!(file.version, 1);
        assert_eq!(file.accounts.len(), 1);
        let account = &file.accounts[0];
        assert_eq!(account.aas_token, "aas_et/token");
        assert_eq!(account.device, "custom_device");
        assert_eq!(account.locale, "fr_FR");
        assert_eq!(account.timezone, "Europe/Paris");
        assert!(!account.enabled);
    }

    #[test]
    fn mode_serializes_lowercase() {
        for (mode, expected) in [
            (Mode::Aas, "\"aas\""),
            (Mode::Oauth, "\"oauth\""),
            (Mode::Dispenser, "\"dispenser\""),
        ] {
            assert_eq!(serde_json::to_string(&mode).unwrap(), expected);
        }
        assert_eq!(Mode::default(), Mode::Aas);
    }

    #[test]
    fn dispenser_profile_is_valid_json() {
        let parsed: serde_json::Value = serde_json::from_str(DISPENSER_PROFILE).unwrap();
        assert!(parsed.is_object());
    }

    #[test]
    fn dispenser_returns_trimmed_auth_token() {
        let http = FakeHttp {
            result: Ok(r#"{"authToken":"  ya29.test-token  "}"#.to_string()),
        };
        assert_eq!(
            dispense_auth_token(&http, DEFAULT_DISPENSER_URL, Duration::from_secs(5)).unwrap(),
            "ya29.test-token"
        );
    }

    #[test]
    fn malformed_dispenser_json_is_rejected() {
        let http = FakeHttp {
            result: Ok("not json".to_string()),
        };
        let error =
            dispense_auth_token(&http, DEFAULT_DISPENSER_URL, Duration::from_secs(5)).unwrap_err();
        assert!(error.contains("valid JSON"), "unexpected error: {error}");
    }

    #[test]
    fn dispenser_without_auth_token_is_rejected() {
        let http = FakeHttp {
            result: Ok(r#"{"token":"ignored"}"#.to_string()),
        };
        let error =
            dispense_auth_token(&http, DEFAULT_DISPENSER_URL, Duration::from_secs(5)).unwrap_err();
        assert!(error.contains("authToken"), "unexpected error: {error}");
    }

    #[test]
    fn dispenser_with_blank_auth_token_is_rejected() {
        let http = FakeHttp {
            result: Ok(r#"{"authToken":"   "}"#.to_string()),
        };
        let error =
            dispense_auth_token(&http, DEFAULT_DISPENSER_URL, Duration::from_secs(5)).unwrap_err();
        assert!(error.contains("authToken"), "unexpected error: {error}");
    }

    #[test]
    fn dispenser_http_failure_is_rejected() {
        let http = FakeHttp {
            result: Err("connection refused".to_string()),
        };
        let error =
            dispense_auth_token(&http, DEFAULT_DISPENSER_URL, Duration::from_secs(5)).unwrap_err();
        assert!(error.contains("connection refused"));
    }

    #[test]
    fn backend_construction_uses_injected_http() {
        let backend = GpapiBackend::with_http(Box::new(FakeHttp {
            result: Ok(r#"{"authToken":"ya29.test-token"}"#.to_string()),
        }));
        assert_eq!(
            backend
                .dispense(DEFAULT_DISPENSER_URL, Duration::from_secs(5))
                .unwrap(),
            "ya29.test-token"
        );

        let _default: GpapiBackend = GpapiBackend::default();
    }
}
