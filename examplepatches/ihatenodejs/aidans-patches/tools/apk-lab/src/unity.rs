//! Unity serialized-file heuristics.
//!
//! This is the same deliberately narrow scanner as the retired Python implementation, not a
//! general Unity parser. It reads the big-endian `SerializedFile` header,
//! tolerates unsupported or out-of-range object-table metadata, and finds
//! GameObject names by checking a little-endian length prefix followed by the
//! 4-byte-aligned string, `m_Tag`, and the `m_IsActive` byte.

use crate::error::Error;
use std::collections::HashSet;

/// Unity ClassID for GameObject.
pub const UNITY_CLASS_ID_GAMEOBJECT: i32 = 1;

const SERIALIZED_FILE_HEADER_BYTES: usize = 20;

/// Big-endian Unity `SerializedFile` header fields.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct UnitySerializedFileHeader {
    pub metadata_size: u32,
    pub file_size: u32,
    pub version: u32,
    pub data_offset: u32,
    pub endianness: u8,
}

/// One object-table entry. The oracle only recognizes table metadata bounds and
/// leaves the table empty; the type is retained for future callers.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct UnityObjectEntry {
    pub path_id: i64,
    pub offset: u64,
    pub size: u32,
    pub type_id: i32,
}

/// A parsed `SerializedFile` header plus whatever object-table entries the
/// supported heuristic could read.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct UnitySerializedFile {
    pub header: UnitySerializedFileHeader,
    pub objects: Vec<UnityObjectEntry>,
}

impl UnitySerializedFile {
    /// Parses the 20-byte big-endian header.
    ///
    /// An unsupported or out-of-range `data_offset` is not an error: like the
    /// Python oracle, the object table is simply left empty.
    pub fn new(data: &[u8]) -> Result<Self, Error> {
        if data.len() < SERIALIZED_FILE_HEADER_BYTES {
            return Err(Error::usage(format!(
                "Serialized file data too small ({} bytes, minimum 20)",
                data.len()
            )));
        }
        let header = UnitySerializedFileHeader {
            metadata_size: read_u32_be(data, 0),
            file_size: read_u32_be(data, 4),
            version: read_u32_be(data, 8),
            data_offset: read_u32_be(data, 12),
            endianness: data[16],
        };

        // The oracle only checks that `data_offset` is in range before it would
        // parse an object table, and has no supported table layout; entries are
        // therefore never appended.
        let objects = Vec::new();

        Ok(Self { header, objects })
    }
}

/// One confirmed GameObject string occurrence.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct GameObjectRecord {
    pub name: String,
    pub path_id: i64,
    pub file_offset: usize,
    pub is_active_offset: usize,
    pub is_active_value: u8,
    pub string_offset: usize,
}

fn scan_for_gameobject_at_name(
    data: &[u8],
    str_idx: usize,
    name_len: usize,
    name: &str,
    path_id: i64,
) -> Option<GameObjectRecord> {
    // 4-byte aligned padding for string bytes.
    let pad = (4 - (name_len % 4)) % 4;
    let tag_offset = str_idx.checked_add(name_len)?.checked_add(pad)?;
    let is_active_offset = tag_offset.checked_add(2)?;
    let is_active_val = *data.get(is_active_offset)?;
    if is_active_val > 1 {
        return None;
    }

    // Length prefix is at str_idx - 4; a shorter index clamps to zero.
    let file_offset = str_idx.saturating_sub(4);

    Some(GameObjectRecord {
        name: name.to_string(),
        path_id,
        file_offset,
        is_active_offset,
        is_active_value: is_active_val,
        string_offset: str_idx,
    })
}

/// Scans binary asset data for GameObject records.
///
/// With `target_name`, occurrences are located byte-for-byte; without it, the
/// oracle's printable 2..=128-byte candidate heuristic is used. Records are
/// de-duplicated by `is_active` offset in first-found order.
pub fn find_game_objects(data: &[u8], target_name: Option<&str>) -> Vec<GameObjectRecord> {
    let mut records = Vec::new();
    let mut seen_offsets = HashSet::new();

    if let Some(target_name) = target_name {
        let target_bytes = target_name.as_bytes();
        let target_len = target_bytes.len();
        let mut start = 0_usize;
        while let Some(idx) = find_subslice(data, target_bytes, start) {
            if idx >= 4 {
                let prefix_len = read_u32_le(data, idx - 4) as usize;
                if prefix_len == target_len {
                    if let Some(record) =
                        scan_for_gameobject_at_name(data, idx, target_len, target_name, 0)
                    {
                        if seen_offsets.insert(record.is_active_offset) {
                            records.push(record);
                        }
                    }
                }
            }
            start = idx + 1;
        }
    } else {
        for idx in 4..data.len().saturating_sub(8) {
            let prefix_len = read_u32_le(data, idx - 4) as usize;
            if (2..=128).contains(&prefix_len) {
                let Some(candidate_end) = idx.checked_add(prefix_len) else {
                    continue;
                };
                let Some(bounds_end) = candidate_end.checked_add(3) else {
                    continue;
                };
                if bounds_end >= data.len() {
                    continue;
                }
                let candidate_bytes = &data[idx..candidate_end];
                if !candidate_bytes.iter().all(|byte| (32..=126).contains(byte)) {
                    continue;
                }
                // Printable ASCII is always valid UTF-8.
                let Ok(candidate) = std::str::from_utf8(candidate_bytes) else {
                    continue;
                };
                if let Some(record) =
                    scan_for_gameobject_at_name(data, idx, prefix_len, candidate, 0)
                {
                    if seen_offsets.insert(record.is_active_offset) {
                        records.push(record);
                    }
                }
            }
        }
    }

    records
}

/// Checks a zip member path for the asset shapes the Python oracle recognizes.
pub fn is_unity_asset_path(filename: &str) -> bool {
    if !filename.starts_with("assets/bin/Data/") {
        return false;
    }
    let name_lower = filename.to_lowercase();
    name_lower.ends_with(".assets")
        || name_lower.ends_with("globalgamemanagers")
        || name_lower.ends_with("data.unity3d")
        || name_lower.contains(".assets.split")
}

fn read_u32_le(data: &[u8], offset: usize) -> u32 {
    let mut bytes = [0_u8; 4];
    bytes.copy_from_slice(&data[offset..offset + 4]);
    u32::from_le_bytes(bytes)
}

fn read_u32_be(data: &[u8], offset: usize) -> u32 {
    let mut bytes = [0_u8; 4];
    bytes.copy_from_slice(&data[offset..offset + 4]);
    u32::from_be_bytes(bytes)
}

/// Returns the first occurrence of `needle` at or after `start`.
fn find_subslice(haystack: &[u8], needle: &[u8], start: usize) -> Option<usize> {
    if start > haystack.len() {
        return None;
    }
    if needle.is_empty() {
        return Some(start);
    }
    haystack[start..]
        .windows(needle.len())
        .position(|window| window == needle)
        .map(|position| start + position)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn build_synthetic_gameobject_bytes(
        name: &str,
        is_active: u8,
        tag: u16,
        prefix_padding: usize,
    ) -> (Vec<u8>, usize) {
        let mut buf = vec![0_u8; prefix_padding];
        let name_bytes = name.as_bytes();
        let name_len = name_bytes.len();
        buf.extend_from_slice(&(name_len as u32).to_le_bytes());
        let string_offset = buf.len();
        buf.extend_from_slice(name_bytes);
        let pad = (4 - (name_len % 4)) % 4;
        buf.extend(std::iter::repeat_n(0_u8, pad));
        buf.extend_from_slice(&tag.to_le_bytes());
        buf.push(is_active);
        buf.extend(std::iter::repeat_n(0_u8, 16));
        (buf, string_offset)
    }

    #[test]
    fn exact_active_byte_offset() {
        let (data, str_offset) = build_synthetic_gameobject_bytes("Button_HelpCenter", 1, 0, 32);
        let records = find_game_objects(&data, Some("Button_HelpCenter"));
        assert_eq!(records.len(), 1);
        let record = &records[0];
        assert_eq!(record.name, "Button_HelpCenter");
        assert_eq!(record.is_active_value, 1);
        assert_eq!(record.is_active_offset, str_offset + 0x16);
        assert_eq!(record.string_offset, str_offset);
        assert_eq!(record.file_offset, str_offset - 4);
        assert_eq!(data[record.is_active_offset], 1);
    }

    #[test]
    fn name_filter_and_general_scan() {
        let (data, _) = build_synthetic_gameobject_bytes("Button_HelpCenter", 1, 0, 32);
        assert_eq!(find_game_objects(&data, Some("Button_HelpCenter")).len(), 1);
        assert!(find_game_objects(&data, Some("Button_NonExistent")).is_empty());
        assert!(find_game_objects(&data, None)
            .iter()
            .any(|record| record.name == "Button_HelpCenter"));
    }

    #[test]
    fn rejected_active_values_and_length_prefixes() {
        let (data, _) = build_synthetic_gameobject_bytes("Btn", 2, 0, 16);
        assert!(find_game_objects(&data, Some("Btn")).is_empty());
        assert!(find_game_objects(&data, None).is_empty());

        let (mut wrong_prefix, str_offset) = build_synthetic_gameobject_bytes("Btn", 1, 0, 16);
        wrong_prefix[str_offset - 4..str_offset].copy_from_slice(&4_u32.to_le_bytes());
        assert!(find_game_objects(&wrong_prefix, Some("Btn")).is_empty());
        assert!(find_game_objects(&wrong_prefix, None).is_empty());
    }

    #[test]
    fn out_of_range_scan_offset_returns_none() {
        // Name at the very end with no room for padding/tag/active byte.
        let data = b"\x03\x00\x00\x00Btn".to_vec();
        assert!(find_game_objects(&data, Some("Btn")).is_empty());
    }

    #[test]
    fn deduplicates_by_active_offset() {
        let mut buf = vec![0_u8; 16];
        buf.extend_from_slice(&2_u32.to_le_bytes());
        let string_offset = buf.len();
        buf.extend_from_slice(b"aa");
        buf.extend_from_slice(&[0, 0]); // padding to 4
        buf.extend_from_slice(&[0, 0]); // tag
        buf.push(1);
        buf.extend_from_slice(&[0; 8]);
        let records = find_game_objects(&buf, Some("aa"));
        assert_eq!(records.len(), 1);
        assert_eq!(records[0].is_active_offset, string_offset + 6);
    }

    #[test]
    fn header_is_big_endian_and_out_of_range_metadata_is_tolerated() {
        let mut bytes = Vec::new();
        bytes.extend_from_slice(&100_u32.to_be_bytes());
        bytes.extend_from_slice(&1000_u32.to_be_bytes());
        bytes.extend_from_slice(&17_u32.to_be_bytes());
        bytes.extend_from_slice(&128_u32.to_be_bytes());
        bytes.push(0);
        bytes.extend_from_slice(&[0; 200]);
        let serialized = UnitySerializedFile::new(&bytes).unwrap();
        assert_eq!(
            serialized.header,
            UnitySerializedFileHeader {
                metadata_size: 100,
                file_size: 1000,
                version: 17,
                data_offset: 128,
                endianness: 0,
            }
        );
        assert!(serialized.objects.is_empty());

        // data_offset == 0 and data_offset >= len are both tolerated.
        for data_offset in [0_u32, 0xFFFF_FFFF] {
            let mut bytes = bytes.clone();
            bytes[12..16].copy_from_slice(&data_offset.to_be_bytes());
            let parsed = UnitySerializedFile::new(&bytes).unwrap();
            assert_eq!(parsed.header.data_offset, data_offset);
            assert!(parsed.objects.is_empty());
        }
    }

    #[test]
    fn short_serialized_file_errors() {
        let error = UnitySerializedFile::new(&[0_u8; 19]).unwrap_err();
        assert!(error.to_string().contains("minimum 20"));
    }

    #[test]
    fn unity_asset_path_filter() {
        assert!(is_unity_asset_path("assets/bin/Data/sharedassets0.assets"));
        assert!(is_unity_asset_path(
            "assets/bin/Data/sharedassets0.assets.split71"
        ));
        assert!(is_unity_asset_path("assets/bin/Data/globalgamemanagers"));
        assert!(is_unity_asset_path("assets/bin/Data/data.unity3d"));
        assert!(is_unity_asset_path("assets/bin/Data/Data.UNITY3D"));
        assert!(!is_unity_asset_path("assets/other/foo.assets"));
        assert!(!is_unity_asset_path("assets/bin/Data/readme.txt"));
    }

    #[test]
    fn deterministic_random_binary_never_panics() {
        let mut state = 0x5EED_1234_u64;
        for length in 0..256_usize {
            let mut bytes = Vec::with_capacity(length);
            for _ in 0..length {
                state = state
                    .wrapping_mul(6_364_136_223_846_793_005)
                    .wrapping_add(1);
                bytes.push((state >> 33) as u8);
            }
            let _ = UnitySerializedFile::new(&bytes);
            let _ = find_game_objects(&bytes, None);
            let _ = find_game_objects(&bytes, Some("A"));
        }
    }
}
