//! Unity IL2CPP `global-metadata.dat` parsing and symbol lookup.
//!
//! Ports the supported layouts and query behavior of the retired Python implementation (v29 and
//! v31 metadata, subversion 0). Strings are addressed relative to the string
//! table and decoded as UTF-8 with replacement. Unsupported layouts are
//! reported, never guessed. Table iteration is bounded by both the declared
//! count and the remaining input bytes.

use crate::error::Error;
use regex::{Regex, RegexBuilder};
use serde::Serialize;

/// Magic constant for `global-metadata.dat`.
pub const IL2CPP_METADATA_MAGIC: u32 = 0xFAB1_1BAF;
const MINIMUM_METADATA_BYTES: usize = 256;

/// Header and record layout for one supported metadata version.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MetadataLayout {
    pub string_offset_header: usize,
    pub string_size_header: usize,
    pub methods_offset_header: usize,
    pub methods_size_header: usize,
    pub type_definitions_offset_header: usize,
    pub type_definitions_size_header: usize,
    pub method_record_size: usize,
    pub method_name_index_offset: usize,
    pub method_return_type_offset: usize,
    pub method_parameter_start_offset: usize,
    pub method_parameter_count_offset: usize,
    pub type_record_size: usize,
    pub type_name_index_offset: usize,
    pub type_namespace_index_offset: usize,
    pub type_method_start_offset: usize,
    pub type_method_count_offset: usize,
}

/// Returns the layout for `(version, subversion)`, or `None` when unsupported.
#[must_use]
pub fn supported_layout(version: u32, metadata_subversion: u32) -> Option<MetadataLayout> {
    match (version, metadata_subversion) {
        (29, 0) => Some(MetadataLayout {
            string_offset_header: 24,
            string_size_header: 28,
            methods_offset_header: 48,
            methods_size_header: 52,
            type_definitions_offset_header: 160,
            type_definitions_size_header: 164,
            method_record_size: 32,
            method_name_index_offset: 0,
            method_return_type_offset: 8,
            method_parameter_start_offset: 12,
            method_parameter_count_offset: 30,
            type_record_size: 88,
            type_name_index_offset: 0,
            type_namespace_index_offset: 4,
            type_method_start_offset: 36,
            type_method_count_offset: 64,
        }),
        (31, 0) => Some(MetadataLayout {
            string_offset_header: 24,
            string_size_header: 28,
            methods_offset_header: 48,
            methods_size_header: 52,
            type_definitions_offset_header: 160,
            type_definitions_size_header: 164,
            method_record_size: 36,
            method_name_index_offset: 0,
            method_return_type_offset: 8,
            method_parameter_start_offset: 16,
            method_parameter_count_offset: 34,
            type_record_size: 88,
            type_name_index_offset: 0,
            type_namespace_index_offset: 4,
            type_method_start_offset: 36,
            type_method_count_offset: 64,
        }),
        _ => None,
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Il2CppTypeDefinition {
    pub name: String,
    pub namespace: String,
    pub method_start_index: i32,
    pub method_count: u16,
    pub name_index: i32,
    pub namespace_index: i32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Il2CppMethodDefinition {
    pub name: String,
    pub return_type_idx: i32,
    pub parameter_start_index: i32,
    pub parameter_count: u16,
    pub name_index: i32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Il2CppMethodMatch {
    pub namespace: String,
    pub type_name: String,
    pub method_name: String,
    pub parameter_count: u16,
}

/// Header values exposed by the Python parser.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Il2CppHeaders {
    pub string_offset: u32,
    pub string_size: u32,
    pub methods_offset: u32,
    pub methods_size: u32,
    pub type_definitions_offset: u32,
    pub type_definitions_size: u32,
}

/// Parsed metadata. Borrows the input buffer.
#[derive(Debug, Clone)]
pub struct Il2CppMetadata<'a> {
    data: &'a [u8],
    pub metadata_subversion: u32,
    pub sanity: u32,
    pub version: u32,
    pub layout: MetadataLayout,
    pub headers: Il2CppHeaders,
    pub method_definitions: Vec<Il2CppMethodDefinition>,
    pub type_definitions: Vec<Il2CppTypeDefinition>,
}

impl<'a> Il2CppMetadata<'a> {
    /// Parses metadata using the given subversion (defaults to 0 in Python).
    pub fn new(data: &'a [u8], metadata_subversion: u32) -> Result<Self, Error> {
        if data.len() < MINIMUM_METADATA_BYTES {
            return Err(Error::usage(format!(
                "Metadata file too small ({} bytes, minimum 256)",
                data.len()
            )));
        }

        let sanity =
            read_u32(data, 0).ok_or_else(|| Error::usage("Metadata header is truncated"))?;
        if sanity != IL2CPP_METADATA_MAGIC {
            return Err(Error::usage(format!(
                "Invalid metadata file magic: 0x{sanity:08x} (expected 0x{IL2CPP_METADATA_MAGIC:08x})"
            )));
        }

        let version =
            read_u32(data, 4).ok_or_else(|| Error::usage("Metadata header is truncated"))?;
        let layout = supported_layout(version, metadata_subversion).ok_or_else(|| {
            Error::usage(format!(
                "Unsupported IL2CPP metadata layout: {version}.{metadata_subversion}"
            ))
        })?;

        let headers = Il2CppHeaders {
            string_offset: required_u32(data, layout.string_offset_header)?,
            string_size: required_u32(data, layout.string_size_header)?,
            methods_offset: required_u32(data, layout.methods_offset_header)?,
            methods_size: required_u32(data, layout.methods_size_header)?,
            type_definitions_offset: required_u32(data, layout.type_definitions_offset_header)?,
            type_definitions_size: required_u32(data, layout.type_definitions_size_header)?,
        };

        let mut metadata = Self {
            data,
            metadata_subversion,
            sanity,
            version,
            layout,
            headers,
            method_definitions: Vec::new(),
            type_definitions: Vec::new(),
        };
        metadata.parse_method_definitions()?;
        metadata.parse_type_definitions()?;
        Ok(metadata)
    }

    /// Reads a null-terminated string from the string table.
    ///
    /// Out-of-range indices and offsets yield `""`. If no terminator is found
    /// within the buffer, at most 256 bytes are considered, matching the oracle.
    #[must_use]
    pub fn get_string_from_index(&self, index: i32) -> String {
        if index < 0 {
            return String::new();
        }
        let Ok(index) = usize::try_from(index) else {
            return String::new();
        };
        if index >= self.headers.string_size as usize {
            return String::new();
        }
        let Some(abs_offset) = (self.headers.string_offset as usize).checked_add(index) else {
            return String::new();
        };
        if abs_offset >= self.data.len() {
            return String::new();
        }
        let end = match self.data[abs_offset..].iter().position(|byte| *byte == 0) {
            Some(relative) => abs_offset + relative,
            None => abs_offset.saturating_add(256).min(self.data.len()),
        };
        String::from_utf8_lossy(&self.data[abs_offset..end]).into_owned()
    }

    fn parse_method_definitions(&mut self) -> Result<(), Error> {
        let offset = self.headers.methods_offset as usize;
        let size = self.headers.methods_size as usize;
        if offset == 0 || size == 0 {
            return Ok(());
        }
        let record_size = self.layout.method_record_size;
        if !size.is_multiple_of(record_size) {
            return Err(Error::usage(format!(
                "Methods table size ({size} bytes) is not a multiple of record size ({record_size} bytes)"
            )));
        }

        let declared_count = size / record_size;
        let available_count =
            self.data.len().saturating_sub(offset.min(self.data.len())) / record_size;
        for index in 0..declared_count.min(available_count) {
            let Some(record_offset) = offset.checked_add(index.saturating_mul(record_size)) else {
                break;
            };
            let Some(name_idx) = read_i32(
                self.data,
                record_offset + self.layout.method_name_index_offset,
            ) else {
                break;
            };
            let Some(return_type_idx) = read_i32(
                self.data,
                record_offset + self.layout.method_return_type_offset,
            ) else {
                break;
            };
            let Some(parameter_start_index) = read_i32(
                self.data,
                record_offset + self.layout.method_parameter_start_offset,
            ) else {
                break;
            };
            let Some(parameter_count) = read_u16(
                self.data,
                record_offset + self.layout.method_parameter_count_offset,
            ) else {
                break;
            };
            let name = self.get_string_from_index(name_idx);
            self.method_definitions.push(Il2CppMethodDefinition {
                name,
                return_type_idx,
                parameter_start_index,
                parameter_count,
                name_index: name_idx,
            });
        }
        Ok(())
    }

    fn parse_type_definitions(&mut self) -> Result<(), Error> {
        let offset = self.headers.type_definitions_offset as usize;
        let size = self.headers.type_definitions_size as usize;
        if offset == 0 || size == 0 {
            return Ok(());
        }
        let record_size = self.layout.type_record_size;
        if !size.is_multiple_of(record_size) {
            return Err(Error::usage(format!(
                "Type definitions table size ({size} bytes) is not a multiple of record size ({record_size} bytes)"
            )));
        }

        let declared_count = size / record_size;
        let available_count =
            self.data.len().saturating_sub(offset.min(self.data.len())) / record_size;
        for index in 0..declared_count.min(available_count) {
            let Some(record_offset) = offset.checked_add(index.saturating_mul(record_size)) else {
                break;
            };
            let Some(name_idx) = read_i32(
                self.data,
                record_offset + self.layout.type_name_index_offset,
            ) else {
                break;
            };
            let Some(namespace_idx) = read_i32(
                self.data,
                record_offset + self.layout.type_namespace_index_offset,
            ) else {
                break;
            };
            let Some(method_start_index) = read_i32(
                self.data,
                record_offset + self.layout.type_method_start_offset,
            ) else {
                break;
            };
            let Some(method_count) = read_u16(
                self.data,
                record_offset + self.layout.type_method_count_offset,
            ) else {
                break;
            };
            let name = self.get_string_from_index(name_idx);
            let namespace = self.get_string_from_index(namespace_idx);
            self.type_definitions.push(Il2CppTypeDefinition {
                name,
                namespace,
                method_start_index,
                method_count,
                name_index: name_idx,
                namespace_index: namespace_idx,
            });
        }
        Ok(())
    }
}

/// Aggregates type/method joins and provides the oracle's search semantics.
#[derive(Debug, Clone)]
pub struct Il2CppSymbolMap<'a> {
    pub matches: Vec<Il2CppMethodMatch>,
    metadata: &'a Il2CppMetadata<'a>,
}

impl<'a> Il2CppSymbolMap<'a> {
    #[must_use]
    pub fn new(metadata: &'a Il2CppMetadata<'a>) -> Self {
        let mut matches = Vec::new();
        for type_definition in &metadata.type_definitions {
            for index in 0..type_definition.method_count {
                let method_index = i64::from(type_definition.method_start_index) + i64::from(index);
                if method_index < 0 {
                    continue;
                }
                let Ok(method_index) = usize::try_from(method_index) else {
                    continue;
                };
                let Some(method) = metadata.method_definitions.get(method_index) else {
                    continue;
                };
                matches.push(Il2CppMethodMatch {
                    namespace: type_definition.namespace.clone(),
                    type_name: type_definition.name.clone(),
                    method_name: method.name.clone(),
                    parameter_count: method.parameter_count,
                });
            }
        }
        Self { matches, metadata }
    }

    #[must_use]
    pub fn metadata(&self) -> &'a Il2CppMetadata<'a> {
        self.metadata
    }

    /// Filters methods by case-insensitive regex or substring.
    ///
    /// A query that Python's `re` accepts but the Rust `regex` engine does not
    /// (lookaround, backreferences, possessive quantifiers, conditionals) is a
    /// controlled `Unsupported` error instead of a silent substring fallback.
    pub fn search(&self, query: Option<&str>) -> Result<Vec<&Il2CppMethodMatch>, Error> {
        let query = match query {
            Some(query) if !query.is_empty() => query,
            _ => return Ok(self.matches.iter().collect()),
        };

        match compile_query(query) {
            QueryPattern::Unsupported(message) => Err(Error::usage(message)),
            QueryPattern::Regex(pattern) => {
                let q_lower = query.to_lowercase();
                Ok(self
                    .matches
                    .iter()
                    .filter(|candidate| {
                        let full_signature = format!(
                            "{}.{}.{}",
                            candidate.namespace, candidate.type_name, candidate.method_name
                        );
                        if pattern.is_match(&candidate.method_name)
                            || pattern.is_match(&candidate.type_name)
                            || pattern.is_match(&full_signature)
                        {
                            return true;
                        }
                        substring_match(candidate, &full_signature, &q_lower)
                    })
                    .collect())
            }
            QueryPattern::Substring => {
                let q_lower = query.to_lowercase();
                Ok(self
                    .matches
                    .iter()
                    .filter(|candidate| {
                        let full_signature = format!(
                            "{}.{}.{}",
                            candidate.namespace, candidate.type_name, candidate.method_name
                        );
                        substring_match(candidate, &full_signature, &q_lower)
                    })
                    .collect())
            }
        }
    }
}

fn substring_match(candidate: &Il2CppMethodMatch, full_signature: &str, q_lower: &str) -> bool {
    candidate.method_name.to_lowercase().contains(q_lower)
        || candidate.type_name.to_lowercase().contains(q_lower)
        || full_signature.to_lowercase().contains(q_lower)
}

/// How a query was interpreted, mirroring the oracle's regex-then-substring
/// fallback while making engine incompatibilities explicit.
#[derive(Debug)]
pub enum QueryPattern {
    Regex(Regex),
    Substring,
    Unsupported(String),
}

/// Compiles a query the way the oracle does, with an explicit incompatibility
/// report for Python-only regular-expression features.
#[must_use]
pub fn compile_query(query: &str) -> QueryPattern {
    if let Ok(regex) = RegexBuilder::new(query).case_insensitive(true).build() {
        return QueryPattern::Regex(regex);
    }
    if contains_python_only_regex(query) {
        return QueryPattern::Unsupported(format!(
            "Regex query uses Python-only features unsupported by the native engine: '{query}'"
        ));
    }
    QueryPattern::Substring
}

fn contains_python_only_regex(query: &str) -> bool {
    const MARKERS: [&str; 15] = [
        "(?=", "(?!", "(?<=", "(?<!", "(?#", "(?>", "(?(", "(?P=", "\\Z", "\\g<", "\\k<", "\\N{",
        "*+", "++", "?+",
    ];
    if MARKERS.iter().any(|marker| query.contains(marker)) {
        return true;
    }
    // Backreferences `\1`..`\99` and `{m,n}+` possessive repetition.
    let bytes = query.as_bytes();
    for window in bytes.windows(2) {
        if window[0] == b'\\' && window[1].is_ascii_digit() {
            return true;
        }
    }
    query.contains("}+")
}

/// One serializable analysis row, matching `analyze_il2cpp` dictionaries.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct Il2CppAnalysisRecord {
    pub namespace: String,
    #[serde(rename = "type")]
    pub type_name: String,
    pub method: String,
    pub parameters_count: u16,
}

/// Parses metadata bytes and returns matching rows.
pub fn analyze_metadata(
    data: &[u8],
    query: Option<&str>,
) -> Result<Vec<Il2CppAnalysisRecord>, Error> {
    let metadata = Il2CppMetadata::new(data, 0)?;
    let symbol_map = Il2CppSymbolMap::new(&metadata);
    Ok(symbol_map
        .search(query)?
        .into_iter()
        .map(|matched| Il2CppAnalysisRecord {
            namespace: matched.namespace.clone(),
            type_name: matched.type_name.clone(),
            method: matched.method_name.clone(),
            parameters_count: matched.parameter_count,
        })
        .collect())
}

fn read_u32(data: &[u8], offset: usize) -> Option<u32> {
    let bytes = data.get(offset..offset.checked_add(4)?)?;
    Some(u32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
}

fn required_u32(data: &[u8], offset: usize) -> Result<u32, Error> {
    read_u32(data, offset).ok_or_else(|| Error::usage("Metadata header is truncated"))
}

fn read_i32(data: &[u8], offset: usize) -> Option<i32> {
    read_u32(data, offset).map(|value| value as i32)
}

fn read_u16(data: &[u8], offset: usize) -> Option<u16> {
    let bytes = data.get(offset..offset.checked_add(2)?)?;
    Some(u16::from_le_bytes([bytes[0], bytes[1]]))
}

#[cfg(test)]
mod tests {
    use super::*;

    const STRING_DATA: &[u8] =
        b"\x00TestNamespace\x00BlackjackApplication\x00OpenShop\x00OtherMethod\x00";
    const STRING_OFFSET: u32 = 256;

    fn write_u32(buf: &mut [u8], offset: usize, value: u32) {
        buf[offset..offset + 4].copy_from_slice(&value.to_le_bytes());
    }

    fn write_i32(buf: &mut [u8], offset: usize, value: i32) {
        buf[offset..offset + 4].copy_from_slice(&value.to_le_bytes());
    }

    fn write_u16(buf: &mut [u8], offset: usize, value: u16) {
        buf[offset..offset + 2].copy_from_slice(&value.to_le_bytes());
    }

    fn build_synthetic_metadata(
        version: u32,
        corrupt_methods_size: Option<u32>,
        corrupt_types_size: Option<u32>,
    ) -> Vec<u8> {
        let string_offset = STRING_OFFSET as usize;
        let string_size = STRING_DATA.len();

        let methods_data = if version == 29 {
            let mut methods = vec![0_u8; 64];
            // Method 0: name=36 ("OpenShop"), return=0, param_start=0, count=1.
            write_i32(&mut methods, 0, 36);
            write_i32(&mut methods, 4, 0);
            write_i32(&mut methods, 8, 0);
            write_i32(&mut methods, 12, 0);
            write_i32(&mut methods, 16, -1);
            write_u32(&mut methods, 20, 0);
            write_u16(&mut methods, 24, 0);
            write_u16(&mut methods, 26, 0);
            write_u16(&mut methods, 28, 0);
            write_u16(&mut methods, 30, 1);
            // Method 1: name=45 ("OtherMethod"), count=0.
            write_i32(&mut methods, 32, 45);
            write_i32(&mut methods, 36, 0);
            write_i32(&mut methods, 40, 0);
            write_i32(&mut methods, 44, 0);
            write_i32(&mut methods, 48, -1);
            write_u32(&mut methods, 52, 0);
            write_u16(&mut methods, 56, 0);
            write_u16(&mut methods, 58, 0);
            write_u16(&mut methods, 60, 0);
            write_u16(&mut methods, 62, 0);
            methods
        } else if version == 31 {
            let mut methods = vec![0_u8; 72];
            // Method 0: sentinel at 12, param_start at 16, count at 34.
            write_i32(&mut methods, 0, 36);
            write_i32(&mut methods, 12, 0x1234_5678);
            write_i32(&mut methods, 20, -1);
            write_u16(&mut methods, 34, 1);
            // Method 1.
            write_i32(&mut methods, 36, 45);
            write_i32(&mut methods, 48, 0x1234_5678);
            write_i32(&mut methods, 56, -1);
            write_u16(&mut methods, 70, 0);
            methods
        } else {
            vec![0_u8; 64]
        };

        let methods_offset = string_offset + string_size + 4;
        let methods_size = corrupt_methods_size.unwrap_or(methods_data.len() as u32);
        let types_offset = methods_offset + methods_data.len() + 4;

        let mut type0 = vec![0_u8; 88];
        write_i32(&mut type0, 0, 15); // "BlackjackApplication"
        write_i32(&mut type0, 4, 1); // "TestNamespace"
        write_i32(&mut type0, 36, 0); // methodStart
        write_u16(&mut type0, 64, 2); // methodCount
        let types_size = corrupt_types_size.unwrap_or(type0.len() as u32);

        let total_len = types_offset + type0.len() + 16;
        let mut buf = vec![0_u8; total_len];
        write_u32(&mut buf, 0, IL2CPP_METADATA_MAGIC);
        write_u32(&mut buf, 4, version);
        write_u32(&mut buf, 24, STRING_OFFSET);
        write_u32(&mut buf, 28, string_size as u32);
        write_u32(&mut buf, 48, methods_offset as u32);
        write_u32(&mut buf, 52, methods_size);
        write_u32(&mut buf, 160, types_offset as u32);
        write_u32(&mut buf, 164, types_size);
        buf[string_offset..string_offset + string_size].copy_from_slice(STRING_DATA);
        buf[methods_offset..methods_offset + methods_data.len()].copy_from_slice(&methods_data);
        buf[types_offset..types_offset + type0.len()].copy_from_slice(&type0);
        buf
    }

    #[test]
    fn parses_v29_metadata_and_joins_symbols() {
        let raw = build_synthetic_metadata(29, None, None);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        assert_eq!(meta.sanity, IL2CPP_METADATA_MAGIC);
        assert_eq!(meta.version, 29);
        assert_eq!(meta.headers.string_offset, STRING_OFFSET);
        assert_eq!(meta.get_string_from_index(1), "TestNamespace");
        assert_eq!(meta.get_string_from_index(15), "BlackjackApplication");
        assert_eq!(meta.get_string_from_index(36), "OpenShop");
        assert_eq!(meta.method_definitions.len(), 2);
        assert_eq!(meta.method_definitions[0].name, "OpenShop");
        assert_eq!(meta.method_definitions[0].parameter_start_index, 0);
        assert_eq!(meta.method_definitions[0].parameter_count, 1);
        assert_eq!(meta.method_definitions[1].name, "OtherMethod");
        assert_eq!(meta.type_definitions.len(), 1);
        assert_eq!(meta.type_definitions[0].name, "BlackjackApplication");
        assert_eq!(meta.type_definitions[0].namespace, "TestNamespace");
        assert_eq!(meta.type_definitions[0].method_start_index, 0);
        assert_eq!(meta.type_definitions[0].method_count, 2);

        let symbols = Il2CppSymbolMap::new(&meta);
        let matches = symbols.search(Some("OpenShop")).unwrap();
        assert_eq!(matches.len(), 1);
        assert_eq!(matches[0].namespace, "TestNamespace");
        assert_eq!(matches[0].type_name, "BlackjackApplication");
        assert_eq!(matches[0].method_name, "OpenShop");
        assert_eq!(matches[0].parameter_count, 1);
    }

    #[test]
    fn parses_v31_offsets_not_v29_sentinels() {
        let raw = build_synthetic_metadata(31, None, None);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        assert_eq!(meta.version, 31);
        assert_eq!(meta.method_definitions.len(), 2);
        assert_eq!(meta.method_definitions[0].name, "OpenShop");
        assert_eq!(meta.method_definitions[0].parameter_start_index, 0);
        assert_eq!(meta.method_definitions[0].parameter_count, 1);
        assert_eq!(meta.type_definitions[0].method_count, 2);
    }

    #[test]
    fn unsupported_layouts_are_reported() {
        let raw = build_synthetic_metadata(28, None, None);
        assert!(Il2CppMetadata::new(&raw, 0)
            .unwrap_err()
            .to_string()
            .contains("Unsupported IL2CPP metadata layout: 28.0"));
        let raw = build_synthetic_metadata(29, None, None);
        assert!(Il2CppMetadata::new(&raw, 1)
            .unwrap_err()
            .to_string()
            .contains("Unsupported IL2CPP metadata layout: 29.1"));
    }

    #[test]
    fn table_sizes_must_be_whole_records() {
        let raw = build_synthetic_metadata(29, Some(33), None);
        assert!(Il2CppMetadata::new(&raw, 0)
            .unwrap_err()
            .to_string()
            .contains("Methods table size"));
        let raw = build_synthetic_metadata(29, None, Some(89));
        assert!(Il2CppMetadata::new(&raw, 0)
            .unwrap_err()
            .to_string()
            .contains("Type definitions table size"));
    }

    #[test]
    fn symbol_queries_match_python_semantics() {
        let raw = build_synthetic_metadata(29, None, None);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        let symbols = Il2CppSymbolMap::new(&meta);
        assert_eq!(symbols.search(None).unwrap().len(), 2);
        assert_eq!(symbols.search(Some("")).unwrap().len(), 2);
        assert_eq!(symbols.search(Some("OpenShop")).unwrap().len(), 1);
        assert_eq!(symbols.search(Some("Blackjack")).unwrap().len(), 2);
        assert_eq!(symbols.search(Some("NonExistentMethod")).unwrap().len(), 0);
        let regex_matches = symbols.search(Some("^Open.*")).unwrap();
        assert_eq!(regex_matches.len(), 1);
        assert_eq!(regex_matches[0].method_name, "OpenShop");
        // Case-insensitive.
        assert_eq!(symbols.search(Some("openshop")).unwrap().len(), 1);
        // Python-only constructs are explicit; ordinary invalid patterns fall
        // back to a literal substring just like Python's `re.error` path.
        assert!(symbols.search(Some("(?=Open)")).is_err());
        assert_eq!(symbols.search(Some("[OpenShop")).unwrap().len(), 0);
    }

    #[test]
    fn python_only_regex_is_explicitly_unsupported() {
        assert!(matches!(
            compile_query("(?!x)"),
            QueryPattern::Unsupported(_)
        ));
        assert!(matches!(
            compile_query("(a)\\1"),
            QueryPattern::Unsupported(_)
        ));
        assert!(matches!(compile_query("["), QueryPattern::Substring));
        assert!(matches!(compile_query("Open.*"), QueryPattern::Regex(_)));
    }

    #[test]
    fn invalid_magic_and_short_files_are_rejected() {
        let mut raw = build_synthetic_metadata(29, None, None);
        write_u32(&mut raw, 0, 0x1234_5678);
        assert!(Il2CppMetadata::new(&raw, 0)
            .unwrap_err()
            .to_string()
            .contains("Invalid metadata file magic"));
        assert!(Il2CppMetadata::new(b"short", 0)
            .unwrap_err()
            .to_string()
            .contains("too small"));
    }

    #[test]
    fn string_lookup_bounds_and_termination() {
        let raw = build_synthetic_metadata(29, None, None);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        assert_eq!(meta.get_string_from_index(-1), "");
        assert_eq!(meta.get_string_from_index(0), "");
        assert_eq!(meta.get_string_from_index(999_999), "");
        assert_eq!(meta.get_string_from_index(36), "OpenShop");
    }

    #[test]
    fn huge_declared_tables_stay_within_available_bytes() {
        let mut raw = build_synthetic_metadata(29, None, None);
        let methods_offset = read_u32(&raw, 48).unwrap() as usize;
        let expected = (raw.len() - methods_offset) / 32;
        // Multiple of the record size, but far larger than the input.
        write_u32(&mut raw, 52, 32 * 1_000_000);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        assert_eq!(meta.method_definitions.len(), expected);

        write_u32(&mut raw, 52, 32 * 100_000_000);
        let meta = Il2CppMetadata::new(&raw, 0).unwrap();
        assert_eq!(meta.method_definitions.len(), expected);
    }

    #[test]
    fn analyze_metadata_matches_analysis_records() {
        let raw = build_synthetic_metadata(29, None, None);
        let records = analyze_metadata(&raw, Some("OpenShop")).unwrap();
        assert_eq!(records.len(), 1);
        assert_eq!(records[0].type_name, "BlackjackApplication");
        assert_eq!(records[0].method, "OpenShop");
        let json = serde_json::to_value(&records[0]).unwrap();
        assert_eq!(json["type"], "BlackjackApplication");
        assert_eq!(json["method"], "OpenShop");
        assert_eq!(json["parameters_count"], 1);
    }

    #[test]
    fn deterministic_random_metadata_never_panics() {
        let mut state = 0x1CE_u64;
        for length in 0..384_usize {
            let mut bytes = Vec::with_capacity(length);
            for _ in 0..length {
                state = state
                    .wrapping_mul(6_364_136_223_846_793_005)
                    .wrapping_add(1);
                bytes.push((state >> 33) as u8);
            }
            if bytes.len() >= 8 {
                write_u32(&mut bytes, 0, IL2CPP_METADATA_MAGIC);
                write_u32(&mut bytes, 4, 29);
            }
            let _ = Il2CppMetadata::new(&bytes, 0);
        }
    }
}
