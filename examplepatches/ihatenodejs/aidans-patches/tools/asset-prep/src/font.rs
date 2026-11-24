//! Byte-exact port of `.github/scripts/prepare_emoji_font.py`.
//!
//! The Python original rewrites four metric fields, injects a pinned cmap
//! Format 14 subtable, prunes CBLC/CBDT to strike 7 (96x96) and reassembles the
//! SFNT with sorted tags, four-byte table alignment, per-table checksums and
//! the global OpenType checksum adjustment.
//!
//! Nothing here uses a font library: the input tables are borrowed slices, the
//! 115 MB CBLC/CBDT bitmap data is never copied, and the output buffer is
//! allocated once at its final size.

use std::collections::{HashMap, HashSet};
use std::fs;
use std::path::{Path, PathBuf};

use crate::cache::{self, CacheOutcome};
use crate::{AssetError, Result};

/// Upstream font URL used by the original script.
pub const DEFAULT_URL: &str = "https://github.com/samuelngs/apple-emoji-ttf/releases/download/macos-26-20260722-484daf4e/AppleColorEmoji-Linux.ttf";
/// Pinned SHA-256 of the raw upstream font.
pub const EXPECTED_RAW_SHA256: &str =
    "e37c7af6265ac4a0af6d57bc65e86109a776d9966e8343334557f63da482516f";
/// Pinned size of the processed font.
pub const EXPECTED_PROCESSED_SIZE: u64 = 38_369_120;
/// Pinned SHA-256 of the processed font.
pub const EXPECTED_PROCESSED_SHA256: &str =
    "c75b8bb062f4001ecacfd62ec843918096e1dcd12a0260be9e13168021fa2208";
/// OpenType checksum magic (`OS/2` `checkSumAdjustment` target).
pub const OPENTYPE_CHECKSUM_MAGIC: u32 = 0xB1B0_AFBA;

const USER_AGENT: &str = "AidanPatchesBuild/1.0";
const DOWNLOAD_LIMIT: u64 = 512 * 1024 * 1024;
const VALUE_FLAGS: &[&str] = &["--output", "--cache-dir", "--url"];
const BOOLEAN_FLAGS: &[&str] = &[];

/// Pinned 757-byte Format 14 (Unicode Variation Sequences) subtable for U+FE0F
/// emoji presentation, identical to `FMT14_B64` in the Python original.
const FMT14_DATA: [u8; 757] = [
    0x00, 0x0e, 0x00, 0x00, 0x02, 0xf5, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x0f, 0x00, 0x00, 0x00,
    0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb7, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x2a,
    0x00, 0x00, 0x00, 0x30, 0x09, 0x00, 0x00, 0xa9, 0x00, 0x00, 0x00, 0xae, 0x00, 0x00, 0x20, 0x3c,
    0x00, 0x00, 0x20, 0x49, 0x00, 0x00, 0x21, 0x22, 0x00, 0x00, 0x21, 0x39, 0x00, 0x00, 0x21, 0x94,
    0x05, 0x00, 0x21, 0xa9, 0x01, 0x00, 0x23, 0x1a, 0x01, 0x00, 0x23, 0x28, 0x00, 0x00, 0x23, 0xcf,
    0x00, 0x00, 0x23, 0xe9, 0x0a, 0x00, 0x23, 0xf8, 0x02, 0x00, 0x24, 0xc2, 0x00, 0x00, 0x25, 0xaa,
    0x01, 0x00, 0x25, 0xb6, 0x00, 0x00, 0x25, 0xc0, 0x00, 0x00, 0x25, 0xfb, 0x03, 0x00, 0x26, 0x00,
    0x04, 0x00, 0x26, 0x0e, 0x00, 0x00, 0x26, 0x11, 0x00, 0x00, 0x26, 0x14, 0x01, 0x00, 0x26, 0x18,
    0x00, 0x00, 0x26, 0x1d, 0x00, 0x00, 0x26, 0x20, 0x00, 0x00, 0x26, 0x22, 0x01, 0x00, 0x26, 0x26,
    0x00, 0x00, 0x26, 0x2a, 0x00, 0x00, 0x26, 0x2e, 0x01, 0x00, 0x26, 0x38, 0x02, 0x00, 0x26, 0x40,
    0x00, 0x00, 0x26, 0x42, 0x00, 0x00, 0x26, 0x48, 0x0b, 0x00, 0x26, 0x5f, 0x01, 0x00, 0x26, 0x63,
    0x00, 0x00, 0x26, 0x65, 0x01, 0x00, 0x26, 0x68, 0x00, 0x00, 0x26, 0x7b, 0x00, 0x00, 0x26, 0x7e,
    0x01, 0x00, 0x26, 0x92, 0x05, 0x00, 0x26, 0x99, 0x00, 0x00, 0x26, 0x9b, 0x01, 0x00, 0x26, 0xa0,
    0x01, 0x00, 0x26, 0xa7, 0x00, 0x00, 0x26, 0xaa, 0x01, 0x00, 0x26, 0xb0, 0x01, 0x00, 0x26, 0xbd,
    0x01, 0x00, 0x26, 0xc4, 0x01, 0x00, 0x26, 0xc8, 0x00, 0x00, 0x26, 0xce, 0x01, 0x00, 0x26, 0xd1,
    0x00, 0x00, 0x26, 0xd3, 0x01, 0x00, 0x26, 0xe9, 0x01, 0x00, 0x26, 0xf0, 0x05, 0x00, 0x26, 0xf7,
    0x03, 0x00, 0x26, 0xfd, 0x00, 0x00, 0x27, 0x02, 0x00, 0x00, 0x27, 0x05, 0x00, 0x00, 0x27, 0x08,
    0x05, 0x00, 0x27, 0x0f, 0x00, 0x00, 0x27, 0x12, 0x00, 0x00, 0x27, 0x14, 0x00, 0x00, 0x27, 0x16,
    0x00, 0x00, 0x27, 0x1d, 0x00, 0x00, 0x27, 0x21, 0x00, 0x00, 0x27, 0x28, 0x00, 0x00, 0x27, 0x33,
    0x01, 0x00, 0x27, 0x44, 0x00, 0x00, 0x27, 0x47, 0x00, 0x00, 0x27, 0x4c, 0x00, 0x00, 0x27, 0x4e,
    0x00, 0x00, 0x27, 0x53, 0x02, 0x00, 0x27, 0x57, 0x00, 0x00, 0x27, 0x63, 0x01, 0x00, 0x27, 0x95,
    0x02, 0x00, 0x27, 0xa1, 0x00, 0x00, 0x27, 0xb0, 0x00, 0x00, 0x27, 0xbf, 0x00, 0x00, 0x29, 0x34,
    0x01, 0x00, 0x2b, 0x05, 0x02, 0x00, 0x2b, 0x1b, 0x01, 0x00, 0x2b, 0x50, 0x00, 0x00, 0x2b, 0x55,
    0x00, 0x00, 0x30, 0x30, 0x00, 0x00, 0x30, 0x3d, 0x00, 0x00, 0x32, 0x97, 0x00, 0x00, 0x32, 0x99,
    0x00, 0x01, 0xf0, 0x04, 0x00, 0x01, 0xf1, 0x70, 0x01, 0x01, 0xf1, 0x7e, 0x01, 0x01, 0xf2, 0x02,
    0x00, 0x01, 0xf2, 0x1a, 0x00, 0x01, 0xf2, 0x2f, 0x00, 0x01, 0xf2, 0x37, 0x00, 0x01, 0xf3, 0x0d,
    0x02, 0x01, 0xf3, 0x15, 0x00, 0x01, 0xf3, 0x1c, 0x00, 0x01, 0xf3, 0x21, 0x00, 0x01, 0xf3, 0x24,
    0x08, 0x01, 0xf3, 0x36, 0x00, 0x01, 0xf3, 0x78, 0x00, 0x01, 0xf3, 0x7d, 0x00, 0x01, 0xf3, 0x93,
    0x00, 0x01, 0xf3, 0x96, 0x01, 0x01, 0xf3, 0x99, 0x02, 0x01, 0xf3, 0x9e, 0x01, 0x01, 0xf3, 0xa7,
    0x00, 0x01, 0xf3, 0xac, 0x02, 0x01, 0xf3, 0xc2, 0x00, 0x01, 0xf3, 0xc4, 0x00, 0x01, 0xf3, 0xc6,
    0x00, 0x01, 0xf3, 0xca, 0x04, 0x01, 0xf3, 0xd4, 0x0c, 0x01, 0xf3, 0xed, 0x00, 0x01, 0xf3, 0xf3,
    0x00, 0x01, 0xf3, 0xf5, 0x00, 0x01, 0xf3, 0xf7, 0x00, 0x01, 0xf4, 0x08, 0x00, 0x01, 0xf4, 0x15,
    0x00, 0x01, 0xf4, 0x1f, 0x00, 0x01, 0xf4, 0x26, 0x00, 0x01, 0xf4, 0x3f, 0x00, 0x01, 0xf4, 0x41,
    0x01, 0x01, 0xf4, 0x46, 0x03, 0x01, 0xf4, 0x4d, 0x01, 0x01, 0xf4, 0x53, 0x00, 0x01, 0xf4, 0x6a,
    0x00, 0x01, 0xf4, 0x7d, 0x00, 0x01, 0xf4, 0xa3, 0x00, 0x01, 0xf4, 0xb0, 0x00, 0x01, 0xf4, 0xb3,
    0x00, 0x01, 0xf4, 0xbb, 0x00, 0x01, 0xf4, 0xbf, 0x00, 0x01, 0xf4, 0xcb, 0x00, 0x01, 0xf4, 0xda,
    0x00, 0x01, 0xf4, 0xdf, 0x00, 0x01, 0xf4, 0xe4, 0x02, 0x01, 0xf4, 0xea, 0x03, 0x01, 0xf4, 0xf7,
    0x00, 0x01, 0xf4, 0xf9, 0x02, 0x01, 0xf4, 0xfd, 0x00, 0x01, 0xf5, 0x08, 0x00, 0x01, 0xf5, 0x0d,
    0x00, 0x01, 0xf5, 0x12, 0x01, 0x01, 0xf5, 0x49, 0x01, 0x01, 0xf5, 0x50, 0x17, 0x01, 0xf5, 0x6f,
    0x01, 0x01, 0xf5, 0x73, 0x06, 0x01, 0xf5, 0x87, 0x00, 0x01, 0xf5, 0x8a, 0x03, 0x01, 0xf5, 0x90,
    0x00, 0x01, 0xf5, 0xa5, 0x00, 0x01, 0xf5, 0xa8, 0x00, 0x01, 0xf5, 0xb1, 0x01, 0x01, 0xf5, 0xbc,
    0x00, 0x01, 0xf5, 0xc2, 0x02, 0x01, 0xf5, 0xd1, 0x02, 0x01, 0xf5, 0xdc, 0x02, 0x01, 0xf5, 0xe1,
    0x00, 0x01, 0xf5, 0xe3, 0x00, 0x01, 0xf5, 0xe8, 0x00, 0x01, 0xf5, 0xef, 0x00, 0x01, 0xf5, 0xf3,
    0x00, 0x01, 0xf5, 0xfa, 0x00, 0x01, 0xf6, 0x10, 0x00, 0x01, 0xf6, 0x87, 0x00, 0x01, 0xf6, 0x8d,
    0x00, 0x01, 0xf6, 0x91, 0x00, 0x01, 0xf6, 0x94, 0x00, 0x01, 0xf6, 0x98, 0x00, 0x01, 0xf6, 0xad,
    0x00, 0x01, 0xf6, 0xb2, 0x00, 0x01, 0xf6, 0xb9, 0x01, 0x01, 0xf6, 0xbc, 0x00, 0x01, 0xf6, 0xcb,
    0x00, 0x01, 0xf6, 0xcd, 0x02, 0x01, 0xf6, 0xe0, 0x05, 0x01, 0xf6, 0xe9, 0x00, 0x01, 0xf6, 0xf0,
    0x00, 0x01, 0xf6, 0xf3, 0x00,
];

struct FontTable<'a> {
    tag: [u8; 4],
    data: &'a [u8],
}

/// Table data written into the final font without an intermediate bitmap copy.
enum TablePayload<'a> {
    Borrowed(&'a [u8]),
    Owned(Vec<u8>),
    /// Two borrowed ranges; the first must be four-byte aligned so the
    /// wrapping checksum of the concatenation is the sum of the part sums.
    Pair(&'a [u8], &'a [u8]),
}

impl<'a> TablePayload<'a> {
    fn len(&self) -> usize {
        match self {
            Self::Borrowed(data) => data.len(),
            Self::Owned(data) => data.len(),
            Self::Pair(first, second) => first.len() + second.len(),
        }
    }

    fn checksum(&self) -> u32 {
        match self {
            Self::Borrowed(data) => table_checksum(data),
            Self::Owned(data) => table_checksum(data),
            Self::Pair(first, second) => {
                debug_assert_eq!(first.len() % 4, 0);
                table_checksum(first).wrapping_add(table_checksum(second))
            }
        }
    }

    fn extend_into(&self, output: &mut Vec<u8>) {
        match self {
            Self::Borrowed(data) => output.extend_from_slice(data),
            Self::Owned(data) => output.extend_from_slice(data),
            Self::Pair(first, second) => {
                output.extend_from_slice(first);
                output.extend_from_slice(second);
            }
        }
    }
}

/// Apply the production font transform to a complete SFNT buffer.
///
/// Input tables are borrowed; only the small metric tables and the rebuilt
/// cmap/CBLC/CBDT tables are copied. The caller's buffer is never mutated.
pub fn transform_font(input: &[u8]) -> Result<Vec<u8>> {
    let (sfnt_version, tables) = parse_tables(input)?;

    let head = read_table(&tables, b"head")?;
    if head.len() < 54 {
        return Err(truncated("head table is shorter than 54 bytes"));
    }
    let mut head = head.to_vec();
    put_u32(&mut head, 8, 0);
    put_u16(&mut head, 18, 2048);

    let hhea = read_table(&tables, b"hhea")?;
    if hhea.len() < 8 {
        return Err(truncated("hhea table is shorter than 8 bytes"));
    }
    let mut hhea = hhea.to_vec();
    put_i16(&mut hhea, 4, 2048);
    put_i16(&mut hhea, 6, -640);

    let os2 = read_table(&tables, b"OS/2")?;
    if os2.len() < 78 {
        return Err(truncated("OS/2 table is shorter than 78 bytes"));
    }
    let mut os2 = os2.to_vec();
    put_i16(&mut os2, 68, 1920);
    put_i16(&mut os2, 70, -640);
    put_u16(&mut os2, 74, 2048);
    put_u16(&mut os2, 76, 640);

    let cmap = read_table(&tables, b"cmap")?;
    if cmap.len() < 28 {
        return Err(truncated("cmap table is shorter than its 28-byte header"));
    }
    let cmap_body = &cmap[28..];
    let fmt14_offset = 36usize
        .checked_add(cmap_body.len())
        .ok_or_else(|| AssetError::failure("cmap Format 14 offset overflow"))?;
    let fmt14_offset = u32::try_from(fmt14_offset)
        .map_err(|_| AssetError::failure("cmap Format 14 offset does not fit in 32 bits"))?;
    let mut new_cmap = Vec::with_capacity(36 + cmap_body.len() + FMT14_DATA.len() + 3);
    push_u16(&mut new_cmap, 0);
    push_u16(&mut new_cmap, 4);
    push_encoding_record(&mut new_cmap, 0, 4, 36);
    push_encoding_record(&mut new_cmap, 3, 1, 3604);
    push_encoding_record(&mut new_cmap, 3, 10, 36);
    push_encoding_record(&mut new_cmap, 0, 5, fmt14_offset);
    new_cmap.extend_from_slice(cmap_body);
    new_cmap.extend_from_slice(&FMT14_DATA);
    while new_cmap.len() % 4 != 0 {
        new_cmap.push(0);
    }

    let cblc = read_table(&tables, b"CBLC")?;
    let cbdt = read_table(&tables, b"CBDT")?;

    let strike7_start = 8 + 7 * 48;
    let strike7_end = strike7_start + 48;
    let strike7 = cblc
        .get(strike7_start..strike7_end)
        .ok_or_else(|| truncated("CBLC table does not contain eight 48-byte strikes"))?;
    let sub_offset = be_u32(strike7, 0, "CBLC strike subtable offset")? as usize;
    let sub_size = be_u32(strike7, 4, "CBLC strike subtable size")? as usize;
    let sub_count = be_u32(strike7, 8, "CBLC strike subtable count")? as usize;
    let subtable_bytes = slice_at(cblc, sub_offset, sub_size, "CBLC strike subtables")?;
    if sub_count > sub_size / 8 {
        return Err(truncated(
            "CBLC strike subtable count exceeds the subtable array",
        ));
    }

    let first_subtable_offset = be_u32(subtable_bytes, 4, "CBLC first subtable offset")? as usize;
    let first_header = slice_at(
        subtable_bytes,
        first_subtable_offset,
        8,
        "CBLC first subtable header",
    )?;
    let first_image_offset = be_u32(first_header, 4, "CBLC first image offset")?;
    let delta = i64::from(first_image_offset) - 4;
    let mut pruned_subtables = subtable_bytes.to_vec();
    for index in 0..sub_count {
        let entry = slice_at(
            pruned_subtables.as_slice(),
            index * 8,
            8,
            "CBLC index subtable",
        )?;
        let add_offset = be_u32(entry, 4, "CBLC index subtable offset")? as usize;
        let header = slice_at(
            pruned_subtables.as_slice(),
            add_offset,
            8,
            "CBLC image format header",
        )?;
        let image_offset = be_u32(header, 4, "CBLC image offset")?;
        let adjusted = u32::try_from(i64::from(image_offset) - delta).map_err(|_| {
            AssetError::failure("CBLC image offset rewrite is outside the 32-bit range")
        })?;
        put_u32(&mut pruned_subtables, add_offset + 4, adjusted);
    }

    let new_cblc_len = 8usize
        .checked_add(48)
        .and_then(|value| value.checked_add(sub_size))
        .ok_or_else(|| AssetError::failure("CBLC output size overflow"))?;
    let mut new_cblc = Vec::with_capacity(new_cblc_len);
    push_u16(&mut new_cblc, 3);
    push_u16(&mut new_cblc, 0);
    push_u32(&mut new_cblc, 1);
    let mut pruned_strike = strike7.to_vec();
    put_u32(&mut pruned_strike, 0, (8 + 48) as u32);
    new_cblc.extend_from_slice(&pruned_strike);
    new_cblc.extend_from_slice(&pruned_subtables);

    let first_image_offset = first_image_offset as usize;
    if cbdt.len() < 4 {
        return Err(truncated("CBDT table is shorter than its 4-byte header"));
    }
    if first_image_offset > cbdt.len() {
        return Err(truncated("CBDT first image offset is outside the table"));
    }

    let mut replacements: HashMap<[u8; 4], TablePayload<'_>> = HashMap::new();
    replacements.insert(*b"head", TablePayload::Owned(head));
    replacements.insert(*b"hhea", TablePayload::Owned(hhea));
    replacements.insert(*b"OS/2", TablePayload::Owned(os2));
    replacements.insert(*b"cmap", TablePayload::Owned(new_cmap));
    replacements.insert(*b"CBLC", TablePayload::Owned(new_cblc));
    replacements.insert(
        *b"CBDT",
        TablePayload::Pair(&cbdt[..4], &cbdt[first_image_offset..]),
    );

    let mut assembled: Vec<([u8; 4], TablePayload<'_>)> = tables
        .iter()
        .map(|table| match replacements.remove(&table.tag) {
            Some(data) => (table.tag, data),
            None => (table.tag, TablePayload::Borrowed(table.data)),
        })
        .collect();
    assembled.sort_by_key(|left| left.0);

    let table_count = assembled.len();
    let table_count_u16 =
        u16::try_from(table_count).map_err(|_| AssetError::failure("font has too many tables"))?;
    let mut entry_selector = 0u32;
    while (1u32 << (entry_selector + 1)) <= u32::from(table_count_u16) {
        entry_selector += 1;
    }
    let search_range = (1u32 << entry_selector) * 16;
    let range_shift = u32::from(table_count_u16) * 16 - search_range;

    let directory_end = 12usize
        .checked_add(
            table_count
                .checked_mul(16)
                .ok_or_else(|| AssetError::failure("font directory size overflow"))?,
        )
        .ok_or_else(|| AssetError::failure("font directory size overflow"))?;
    let mut output_len = directory_end;
    for (_, data) in &assembled {
        output_len = output_len
            .checked_add(data.len())
            .and_then(|value| value.checked_add((4 - data.len() % 4) % 4))
            .ok_or_else(|| AssetError::failure("font output size overflow"))?;
    }

    let mut output = Vec::with_capacity(output_len);
    output.extend_from_slice(&sfnt_version);
    push_u16(&mut output, table_count_u16);
    push_u16(
        &mut output,
        u16::try_from(search_range)
            .map_err(|_| AssetError::failure("font search range overflow"))?,
    );
    push_u16(
        &mut output,
        u16::try_from(entry_selector)
            .map_err(|_| AssetError::failure("font entry selector overflow"))?,
    );
    push_u16(
        &mut output,
        u16::try_from(range_shift).map_err(|_| AssetError::failure("font range shift overflow"))?,
    );
    output.resize(directory_end, 0);

    let mut head_offset = None;
    for (index, (tag, data)) in assembled.iter().enumerate() {
        let checksum = data.checksum();
        let offset = u32::try_from(output.len())
            .map_err(|_| AssetError::failure("font table offset does not fit in 32 bits"))?;
        let length = u32::try_from(data.len())
            .map_err(|_| AssetError::failure("font table length does not fit in 32 bits"))?;
        let record = 12 + index * 16;
        output[record..record + 4].copy_from_slice(tag);
        output[record + 4..record + 8].copy_from_slice(&checksum.to_be_bytes());
        output[record + 8..record + 12].copy_from_slice(&offset.to_be_bytes());
        output[record + 12..record + 16].copy_from_slice(&length.to_be_bytes());
        if tag == b"head" {
            head_offset = Some(output.len());
        }
        data.extend_into(&mut output);
        let padding = (4 - data.len() % 4) % 4;
        output.resize(output.len() + padding, 0);
    }

    let head_offset = head_offset
        .ok_or_else(|| AssetError::failure("font is missing the required head table"))?;
    let total_checksum = table_checksum(&output);
    let adjustment = OPENTYPE_CHECKSUM_MAGIC.wrapping_sub(total_checksum);
    put_u32(&mut output, head_offset + 8, adjustment);

    Ok(output)
}

/// Check the pinned processed font bytes exactly as the original cache validator.
pub fn verify_processed_font(bytes: &[u8]) -> bool {
    bytes.len() as u64 == EXPECTED_PROCESSED_SIZE
        && cache::sha256_hex(bytes) == EXPECTED_PROCESSED_SHA256
        && table_checksum(bytes) == OPENTYPE_CHECKSUM_MAGIC
}

/// Read and validate a cached processed font without trusting its name.
pub fn verify_processed_font_file(path: &Path) -> bool {
    match fs::metadata(path) {
        Ok(metadata) if metadata.len() == EXPECTED_PROCESSED_SIZE => {}
        _ => return false,
    }
    match fs::read(path) {
        Ok(bytes) => verify_processed_font(&bytes),
        Err(_) => false,
    }
}

/// CLI entry point: `asset-prep font --output ... --cache-dir ... [--url ...]`.
pub fn run(args: &[String]) -> Result<()> {
    let options = crate::cli::parse(args, VALUE_FLAGS, BOOLEAN_FLAGS)?;
    let output = PathBuf::from(options.required("--output")?);
    let cache_dir = PathBuf::from(options.required("--cache-dir")?);
    let url = options.get("--url").unwrap_or(DEFAULT_URL);

    fs::create_dir_all(&cache_dir)?;
    cache::ensure_parent(&output)?;

    let cached_processed = cache_dir.join("AppleColorEmoji-96.ttf");
    let cached_raw = cache_dir.join("AppleColorEmoji-Linux.ttf");

    if verify_processed_font_file(&cached_processed) {
        println!(
            "Found cached processed font at {}",
            cached_processed.display()
        );
    } else {
        let agent = cache::http_agent(None, USER_AGENT);
        match cache::ensure_cached(
            &agent,
            url,
            &cached_raw,
            EXPECTED_RAW_SHA256,
            None,
            DOWNLOAD_LIMIT,
        )? {
            CacheOutcome::Valid => {}
            CacheOutcome::Downloaded | CacheOutcome::ReplacedCorrupt => {
                println!("Downloaded and verified {}", cached_raw.display());
            }
        }

        let font = fs::read(&cached_raw)?;
        let processed = transform_font(&font)?;
        cache::write_atomic(&cached_processed, &processed)?;
        println!(
            "Transformed font saved to {} ({:.2} MB)",
            cached_processed.display(),
            processed.len() as f64 / 1024.0 / 1024.0
        );
    }

    cache::copy_file(&cached_processed, &output)?;
    println!("Successfully staged font to {}", output.display());
    Ok(())
}

/// Wrapping sum of big-endian 32-bit words, zero-padded to four bytes.
pub fn table_checksum(data: &[u8]) -> u32 {
    let mut total = 0u32;
    let mut chunks = data.chunks_exact(4);
    for chunk in &mut chunks {
        total = total.wrapping_add(u32::from_be_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
    }
    let remainder = chunks.remainder();
    if !remainder.is_empty() {
        let mut last = [0u8; 4];
        last[..remainder.len()].copy_from_slice(remainder);
        total = total.wrapping_add(u32::from_be_bytes(last));
    }
    total
}

fn parse_tables(input: &[u8]) -> Result<([u8; 4], Vec<FontTable<'_>>)> {
    let version_slice = slice_at(input, 0, 4, "SFNT version")?;
    let mut sfnt_version = [0u8; 4];
    sfnt_version.copy_from_slice(version_slice);
    let table_count = be_u16(input, 4, "SFNT table count")? as usize;
    if table_count == 0 {
        return Err(truncated("font declares zero tables"));
    }
    let directory_end = 12usize
        .checked_add(
            table_count
                .checked_mul(16)
                .ok_or_else(|| truncated("SFNT directory size overflow"))?,
        )
        .ok_or_else(|| truncated("SFNT directory size overflow"))?;
    if directory_end > input.len() {
        return Err(truncated("font directory is truncated"));
    }

    let mut tables = Vec::with_capacity(table_count);
    let mut seen = HashSet::with_capacity(table_count);
    for index in 0..table_count {
        let record = 12 + index * 16;
        let tag_slice = slice_at(input, record, 4, "SFNT table tag")?;
        let mut tag = [0u8; 4];
        tag.copy_from_slice(tag_slice);
        if !seen.insert(tag) {
            return Err(AssetError::failure(format!(
                "duplicate SFNT table tag {}",
                String::from_utf8_lossy(&tag)
            )));
        }
        let offset = be_u32(input, record + 8, "SFNT table offset")? as usize;
        let length = be_u32(input, record + 12, "SFNT table length")? as usize;
        let data = slice_at(input, offset, length, "SFNT table data")?;
        tables.push(FontTable { tag, data });
    }
    Ok((sfnt_version, tables))
}

fn read_table<'a>(tables: &[FontTable<'a>], tag: &[u8; 4]) -> Result<&'a [u8]> {
    tables
        .iter()
        .find(|table| table.tag == *tag)
        .map(|table| table.data)
        .ok_or_else(|| {
            AssetError::failure(format!(
                "font is missing the required {} table",
                String::from_utf8_lossy(tag)
            ))
        })
}

fn slice_at<'a>(data: &'a [u8], offset: usize, length: usize, what: &str) -> Result<&'a [u8]> {
    let end = offset
        .checked_add(length)
        .ok_or_else(|| truncated(&format!("{what} bounds overflow")))?;
    data.get(offset..end)
        .ok_or_else(|| truncated(&format!("{what} is outside the buffer")))
}

fn be_u16(data: &[u8], offset: usize, what: &str) -> Result<u16> {
    let bytes = slice_at(data, offset, 2, what)?;
    Ok(u16::from_be_bytes([bytes[0], bytes[1]]))
}

fn be_u32(data: &[u8], offset: usize, what: &str) -> Result<u32> {
    let bytes = slice_at(data, offset, 4, what)?;
    Ok(u32::from_be_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
}

fn put_u16(data: &mut [u8], offset: usize, value: u16) {
    data[offset..offset + 2].copy_from_slice(&value.to_be_bytes());
}

fn put_i16(data: &mut [u8], offset: usize, value: i16) {
    data[offset..offset + 2].copy_from_slice(&value.to_be_bytes());
}

fn put_u32(data: &mut [u8], offset: usize, value: u32) {
    data[offset..offset + 4].copy_from_slice(&value.to_be_bytes());
}

fn push_u16(data: &mut Vec<u8>, value: u16) {
    data.extend_from_slice(&value.to_be_bytes());
}

fn push_u32(data: &mut Vec<u8>, value: u32) {
    data.extend_from_slice(&value.to_be_bytes());
}

fn push_encoding_record(data: &mut Vec<u8>, platform: u16, encoding: u16, offset: u32) {
    push_u16(data, platform);
    push_u16(data, encoding);
    push_u32(data, offset);
}

fn truncated(message: &str) -> AssetError {
    AssetError::failure(format!("truncated font: {message}"))
}
