use adblock::engine::Engine;
use adblock::lists::{parse_filters, ParseOptions};
use adblock::regex_manager::RegexManagerDiscardPolicy;
use adblock::request::Request;
use serde::Serialize;
use std::collections::HashSet;
use std::fs;
use std::time::Duration;

use crate::preprocessor::preprocess_list;

const ENGINE_FORMAT_VERSION: u32 = 1;
const MAX_URL_LEN: usize = 16 * 1024;
const MAX_JSON_OUTPUT_LEN: usize = 256 * 1024;

#[derive(Serialize)]
#[serde(rename_all = "camelCase")]
struct CosmeticResourcesOutput {
    hide_selectors: Vec<String>,
    exceptions: Vec<String>,
    generichide: bool,
}

pub struct EngineWrapper {
    pub engine: Engine,
}

impl EngineWrapper {
    /// Compiles an engine from a list of file paths with optional binary caching.
    pub fn compile(list_paths: &[String], cache_path: Option<&str>) -> Result<Self, String> {
        let mut combined_content = String::new();
        for path in list_paths {
            let content = fs::read_to_string(path)
                .map_err(|e| format!("Failed to read filter list file '{}': {}", path, e))?;
            let (accepted, _) = preprocess_list(&content)?;
            combined_content.push_str(&accepted);
            combined_content.push('\n');
        }

        let content_hash = seahash::hash(combined_content.as_bytes());

        // Attempt cache load if cache_path is provided
        if let Some(cpath) = cache_path {
            if let Ok(cache_data) = fs::read(cpath) {
                if cache_data.len() > 12 {
                    let version = u32::from_le_bytes(cache_data[0..4].try_into().unwrap());
                    let stored_hash = u64::from_le_bytes(cache_data[4..12].try_into().unwrap());
                    if version == ENGINE_FORMAT_VERSION && stored_hash == content_hash {
                        let mut engine = Engine::default();
                        if engine.deserialize(&cache_data[12..]).is_ok() {
                            engine.set_regex_discard_policy(RegexManagerDiscardPolicy {
                                cleanup_interval: Duration::from_secs(30),
                                discard_unused_time: Duration::from_secs(180),
                            });
                            return Ok(Self { engine });
                        }
                    }
                }
            }
        }

        // Cache miss or invalid: compile from clean filter set
        let (net, cos) = parse_filters(combined_content.lines(), false, ParseOptions::default());
        let engine = Engine::new_with_parsed_rules(net, cos);

        engine.set_regex_discard_policy(RegexManagerDiscardPolicy {
            cleanup_interval: Duration::from_secs(30),
            discard_unused_time: Duration::from_secs(180),
        });

        // Persist cache if cache_path is provided
        if let Some(cpath) = cache_path {
            let serialized = engine.serialize();
            let mut cache_payload = Vec::with_capacity(12 + serialized.len());
            cache_payload.extend_from_slice(&ENGINE_FORMAT_VERSION.to_le_bytes());
            cache_payload.extend_from_slice(&content_hash.to_le_bytes());
            cache_payload.extend_from_slice(&serialized);

            // Write atomically via temporary file
            let tmp_path = format!("{}.tmp", cpath);
            if fs::write(&tmp_path, &cache_payload).is_ok() {
                let _ = fs::rename(&tmp_path, cpath);
            }
        }

        Ok(Self { engine })
    }

    /// Creates an engine directly from clean list text in memory (useful for testing).
    pub fn from_rules(rules: &str) -> Result<Self, String> {
        let (accepted, _) = preprocess_list(rules)?;
        let (net, cos) = parse_filters(accepted.lines(), false, ParseOptions::default());
        let engine = Engine::new_with_parsed_rules(net, cos);
        engine.set_regex_discard_policy(RegexManagerDiscardPolicy {
            cleanup_interval: Duration::from_secs(30),
            discard_unused_time: Duration::from_secs(180),
        });
        Ok(Self { engine })
    }

    /// Matches a network request. Returns 1 for block, 0 for allow.
    pub fn match_request(
        &self,
        request_url: &str,
        document_url: &str,
        resource_type: &str,
        method: &str,
    ) -> i32 {
        if request_url.len() > MAX_URL_LEN || document_url.len() > MAX_URL_LEN {
            return 0; // Bounded bypass
        }

        let req = match Request::new(request_url, document_url, resource_type, method) {
            Ok(r) => r,
            Err(_) => return 0,
        };

        let result = self.engine.check_network_request(&req);
        if result.should_block() {
            1
        } else {
            0
        }
    }

    /// Returns JSON cosmetic resources for a document URL: `{hideSelectors, exceptions, generichide}`.
    pub fn cosmetics(&self, document_url: &str) -> Result<String, String> {
        if document_url.len() > MAX_URL_LEN {
            return Ok(r#"{"hideSelectors":[],"exceptions":[],"generichide":false}"#.to_string());
        }

        let res = self.engine.url_cosmetic_resources(document_url);
        let output = CosmeticResourcesOutput {
            hide_selectors: res.hide_selectors.into_iter().collect(),
            exceptions: res.exceptions.into_iter().collect(),
            generichide: res.generichide,
        };

        let mut json = serde_json::to_string(&output).map_err(|e| e.to_string())?;
        if json.len() > MAX_JSON_OUTPUT_LEN {
            json = r#"{"hideSelectors":[],"exceptions":[],"generichide":false}"#.to_string();
        }
        Ok(json)
    }

    /// Returns generic CSS selector array for given classes and IDs on a document.
    pub fn generic_selectors(
        &self,
        document_url: &str,
        classes: &[String],
        ids: &[String],
    ) -> Result<String, String> {
        if document_url.len() > MAX_URL_LEN {
            return Ok("[]".to_string());
        }

        let res = self.engine.url_cosmetic_resources(document_url);
        if res.generichide {
            return Ok("[]".to_string());
        }

        let exceptions: HashSet<String> = res.exceptions;
        let selectors = self
            .engine
            .hidden_class_id_selectors(classes, ids, &exceptions);

        let mut json = serde_json::to_string(&selectors).map_err(|e| e.to_string())?;
        if json.len() > MAX_JSON_OUTPUT_LEN {
            json = "[]".to_string();
        }
        Ok(json)
    }
}
