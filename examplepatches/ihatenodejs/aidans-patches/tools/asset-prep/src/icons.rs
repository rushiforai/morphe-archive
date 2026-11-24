//! Pillow-compatible 128x128 RGBA icon transformation and write decision.
//!
//! This module intentionally supports only the formats the icon sync pipeline
//! consumes: PNG, JPEG and WebP. Unknown inputs produce [`IconError`] rather
//! than being guessed at or dropped.
//!
//! The arithmetic is a focused Rust port of the relevant Pillow 11.3.0 code:
//!
//! * `src/libImaging/Resample.c` (LANCZOS coefficient generation and two-pass
//!   8-bit resampling),
//! * `src/libImaging/Convert.c` (mode to RGBA conversion and the `RGBa`
//!   premultiply/unpremultiply step used by `Image.resize`),
//! * `src/libImaging/JpegDecode.c` and `Unpack.c` (CMYK inversion and
//!   image-mode selection). JPEG decoding itself uses the pinned
//!   libjpeg-turbo 3.1.1 build that the Pillow 11.3.0 oracle links against.
//! * `src/libImaging/Unpack.c` and `src/PIL/PngImagePlugin.py` (PNG sample
//!   expansion, including 16-bit truncation and tRNS handling),
//! * `src/PIL/Image.py` (`resize` and `convert` control flow).
//!
//! Pillow is MIT-CMU licensed; see `PILLOW-LICENSE.txt` next to this crate.

use std::fmt;
use std::fs;
use std::io::Cursor;
use std::path::Path;

use image::{DynamicImage, ImageFormat, ImageReader};
use turbojpeg::{Decompressor, Image, PixelFormat};

/// Edge length of every produced icon.
pub const ICON_SIZE: u32 = 128;

const ICON_PIXELS: usize = (ICON_SIZE as usize) * (ICON_SIZE as usize);
const ICON_BYTES: usize = ICON_PIXELS * 4;

/// Upper bound on an encoded input accepted from the network.
const MAX_INPUT_BYTES: usize = 64 * 1024 * 1024;
/// Upper bound on either source dimension.
const MAX_DIMENSION: u32 = 8192;
/// Upper bound on decoded source pixels (64 MiB of RGBA).
const MAX_PIXELS: u32 = 16 * 1024 * 1024;
/// Upper bound on raw decoder output (16-bit RGBA is 8 bytes per pixel).
const MAX_RAW_BYTES: usize = 128 * 1024 * 1024;

/// Pillow's `PRECISION_BITS` for 8-bit resampling.
const PRECISION_BITS: i32 = 22;
/// Fixed-point scale for coefficients.
const COEFF_SCALE: f64 = (1u32 << PRECISION_BITS) as f64;
/// LANCZOS support radius.
const LANCZOS_SUPPORT: f64 = 3.0;

/// A successfully transformed icon.
#[derive(Clone, Debug)]
pub struct IconImage {
    /// Width of the produced icon. Always [`ICON_SIZE`].
    pub width: u32,
    /// Height of the produced icon. Always [`ICON_SIZE`].
    pub height: u32,
    /// Tightly packed RGBA8 pixels, exactly `128 * 128 * 4` bytes.
    pub rgba: Vec<u8>,
    /// Optimized 128x128 RGBA PNG, used for genuine writes.
    pub png: Vec<u8>,
}

/// Result of comparing a candidate icon with the file on disk.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum IconWriteDecision {
    /// The existing valid PNG already decodes to identical 128x128 RGBA pixels.
    Unchanged,
    /// The file did not exist and was created.
    Created,
    /// The file existed but was missing, corrupt, differently sized, or
    /// pixel-different, and was replaced.
    Updated,
}

/// Controlled failure for icon decoding, transformation, encoding or writing.
#[derive(Debug)]
pub enum IconError {
    /// No bytes were supplied.
    EmptyInput,
    /// Encoded input exceeds the configured input byte limit.
    InputTooLarge { length: usize, limit: usize },
    /// Content detection did not recognize a supported image format.
    UnsupportedFormat,
    /// Decoding failed (corrupt, truncated or unsupported bit layout).
    Decode(String),
    /// The decoded image exceeds the configured dimension/pixel bounds.
    ImageTooLarge { width: u32, height: u32 },
    /// PNG encoding failed.
    Encode(String),
    /// Filesystem access failed.
    Io(std::io::Error),
}

impl fmt::Display for IconError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            IconError::EmptyInput => write!(f, "empty icon input"),
            IconError::InputTooLarge { length, limit } => write!(
                f,
                "icon input is {length} bytes, exceeding the {limit} byte limit"
            ),
            IconError::UnsupportedFormat => {
                write!(f, "unsupported icon format (expected PNG, JPEG or WebP)")
            }
            IconError::Decode(message) => write!(f, "failed to decode icon: {message}"),
            IconError::ImageTooLarge { width, height } => write!(
                f,
                "decoded icon is {width}x{height}, exceeding the configured bounds"
            ),
            IconError::Encode(message) => write!(f, "failed to encode icon: {message}"),
            IconError::Io(err) => write!(f, "icon file operation failed: {err}"),
        }
    }
}

impl std::error::Error for IconError {
    fn source(&self) -> Option<&(dyn std::error::Error + 'static)> {
        match self {
            IconError::Io(err) => Some(err),
            _ => None,
        }
    }
}

impl From<std::io::Error> for IconError {
    fn from(err: std::io::Error) -> Self {
        IconError::Io(err)
    }
}

struct DecodedImage {
    width: u32,
    height: u32,
    rgba: Vec<u8>,
}

/// Apply the production icon transform to an encoded image.
///
/// The input may be PNG, JPEG or WebP. On success the result is always
/// [`ICON_SIZE`] x [`ICON_SIZE`] RGBA8, and `png` holds an encoded RGBA PNG of
/// the same pixels.
pub fn transform_icon(input: &[u8]) -> Result<IconImage, IconError> {
    if input.is_empty() {
        return Err(IconError::EmptyInput);
    }
    if input.len() > MAX_INPUT_BYTES {
        return Err(IconError::InputTooLarge {
            length: input.len(),
            limit: MAX_INPUT_BYTES,
        });
    }

    let decoded = match detect_format(input) {
        Some(InputFormat::Png) => decode_png(input)?,
        Some(InputFormat::Jpeg) => decode_jpeg(input)?,
        Some(InputFormat::WebP) => decode_with_image(input, ImageFormat::WebP)?,
        None => return Err(IconError::UnsupportedFormat),
    };

    validate_dimensions(decoded.width, decoded.height)?;
    if decoded.rgba.len() != decoded.width as usize * decoded.height as usize * 4 {
        return Err(IconError::Decode(
            "decoder produced an inconsistent RGBA buffer".to_owned(),
        ));
    }

    let rgba = resize_to_icon(decoded.rgba, decoded.width, decoded.height);
    let png = encode_png(&rgba)?;

    Ok(IconImage {
        width: ICON_SIZE,
        height: ICON_SIZE,
        rgba,
        png,
    })
}

/// Write `candidate` to `path` unless the existing PNG already contains the
/// exact same 128x128 RGBA pixels.
///
/// Equality is decided by decoding the existing file, never by hashing the
/// encoded PNG. On [`IconWriteDecision::Unchanged`] the existing bytes and
/// modification time are left untouched. The parent directory must already
/// exist; this function does not create directories.
pub fn write_icon_if_changed(
    path: &Path,
    candidate: &IconImage,
) -> Result<IconWriteDecision, IconError> {
    if candidate.width != ICON_SIZE
        || candidate.height != ICON_SIZE
        || candidate.rgba.len() != ICON_BYTES
    {
        return Err(IconError::Encode(
            "candidate icon is not a 128x128 RGBA image".to_owned(),
        ));
    }

    match fs::read(path) {
        Ok(existing) => {
            let unchanged = decode_png_strict(&existing)
                .map(|decoded| {
                    decoded.width == ICON_SIZE
                        && decoded.height == ICON_SIZE
                        && decoded.rgba == candidate.rgba
                })
                .unwrap_or(false);
            if unchanged {
                return Ok(IconWriteDecision::Unchanged);
            }
            fs::write(path, &candidate.png)?;
            Ok(IconWriteDecision::Updated)
        }
        Err(err) if err.kind() == std::io::ErrorKind::NotFound => {
            fs::write(path, &candidate.png)?;
            Ok(IconWriteDecision::Created)
        }
        Err(err) => Err(IconError::Io(err)),
    }
}

#[derive(Clone, Copy)]
enum InputFormat {
    Png,
    Jpeg,
    WebP,
}

fn detect_format(input: &[u8]) -> Option<InputFormat> {
    const PNG_SIGNATURE: [u8; 8] = [0x89, b'P', b'N', b'G', 0x0d, 0x0a, 0x1a, 0x0a];
    if input.starts_with(&PNG_SIGNATURE) {
        return Some(InputFormat::Png);
    }
    if input.starts_with(&[0xff, 0xd8, 0xff]) {
        return Some(InputFormat::Jpeg);
    }
    if input.len() >= 12 && &input[0..4] == b"RIFF" && &input[8..12] == b"WEBP" {
        return Some(InputFormat::WebP);
    }
    None
}

/// Walk the top-level JPEG marker structure and require a real EOI after the
/// primary image's scan data.
///
/// A byte-pair search for `FF D9` is not sufficient: an APP1/EXIF thumbnail or
/// any other segment payload can contain that sequence while the primary scan
/// is truncated. This walker skips segment payloads (including embedded
/// thumbnails), tracks entropy-coded data and stuffed bytes, and only accepts
/// an EOI marker that terminates the primary image. Trailing bytes after EOI
/// are ignored, matching Pillow/libjpeg.
fn validate_jpeg_stream(input: &[u8]) -> Result<(), IconError> {
    fn truncated() -> IconError {
        IconError::Decode("truncated JPEG stream".to_owned())
    }

    if input.len() < 2 || !input.starts_with(&[0xff, 0xd8]) {
        return Err(IconError::Decode(
            "JPEG is missing its SOI marker".to_owned(),
        ));
    }

    let mut position = 2usize;
    loop {
        // libjpeg resynchronizes across extraneous bytes between markers and
        // reports a nonfatal warning. Do not turn that accepted input into a
        // structural failure; segment payloads are still skipped by length.
        while position < input.len() && input[position] != 0xff {
            position += 1;
        }
        if position >= input.len() {
            return Err(truncated());
        }
        // Skip fill bytes; a marker is the last 0xFF prefix plus its code.
        while position < input.len() && input[position] == 0xff {
            position += 1;
        }
        if position >= input.len() {
            return Err(truncated());
        }
        let marker = input[position];
        position += 1;

        match marker {
            0xd9 => return Ok(()),
            0xd8 => {
                return Err(IconError::Decode(
                    "JPEG contains an unexpected nested SOI marker".to_owned(),
                ))
            }
            // TEM and restart markers are standalone and carry no length.
            0x01 | 0xd0..=0xd7 => continue,
            0x00 => continue,
            _ => {}
        }

        if position + 2 > input.len() {
            return Err(truncated());
        }
        let segment_length =
            usize::from(u16::from_be_bytes([input[position], input[position + 1]]));
        if segment_length < 2 || position + segment_length > input.len() {
            return Err(truncated());
        }
        let segment_end = position + segment_length;
        position = segment_end;

        if marker == 0xda {
            // Entropy-coded data runs until the next real marker. `FF 00`
            // is a stuffed data byte and `FF D0..D7` are restart markers.
            loop {
                if position >= input.len() {
                    return Err(truncated());
                }
                if input[position] != 0xff {
                    position += 1;
                    continue;
                }
                let mut next = position + 1;
                while next < input.len() && input[next] == 0xff {
                    next += 1;
                }
                if next >= input.len() {
                    return Err(truncated());
                }
                match input[next] {
                    0x00 => {
                        // Stuffed 0xFF data byte.
                        position = next + 1;
                    }
                    0xd0..=0xd7 => {
                        // Restart marker.
                        position = next + 1;
                    }
                    _ => {
                        // The next marker starts at the first 0xFF and is
                        // handled by the outer loop (which tolerates fill).
                        break;
                    }
                }
            }
        }
    }
}

fn validate_dimensions(width: u32, height: u32) -> Result<(), IconError> {
    if width == 0 || height == 0 {
        return Err(IconError::Decode(
            "image has a zero width or height".to_owned(),
        ));
    }
    let pixels = u64::from(width) * u64::from(height);
    if width > MAX_DIMENSION || height > MAX_DIMENSION || pixels > u64::from(MAX_PIXELS) {
        return Err(IconError::ImageTooLarge { width, height });
    }
    Ok(())
}

// ---------------------------------------------------------------------------
// Decoding
// ---------------------------------------------------------------------------

fn decode_png(input: &[u8]) -> Result<DecodedImage, IconError> {
    decode_png_with_completeness(input, false)
}

/// Decode the existing on-disk PNG strictly through IEND.
///
/// The transform input follows Pillow, which reads image data and ignores a
/// bad/truncated IEND. The write-decision path is stricter by contract: only a
/// complete PNG with a valid IEND can qualify for the no-op exception.
fn decode_png_strict(input: &[u8]) -> Result<DecodedImage, IconError> {
    decode_png_with_completeness(input, true)
}

fn decode_png_with_completeness(
    input: &[u8],
    require_complete: bool,
) -> Result<DecodedImage, IconError> {
    let mut decoder = png::Decoder::new_with_limits(
        Cursor::new(input),
        png::Limits {
            bytes: MAX_RAW_BYTES,
        },
    );
    decoder.set_transformations(png::Transformations::IDENTITY);

    let mut reader = decoder
        .read_info()
        .map_err(|err| IconError::Decode(format!("PNG header: {err}")))?;

    let (width, height, bit_depth, color_type, palette, trns) = {
        let info = reader.info();
        (
            info.width,
            info.height,
            info.bit_depth as u8,
            info.color_type,
            info.palette.as_ref().map(|bytes| bytes.to_vec()),
            info.trns.as_ref().map(|bytes| bytes.to_vec()),
        )
    };

    validate_dimensions(width, height)?;

    let buffer_size = reader
        .output_buffer_size()
        .ok_or_else(|| IconError::Decode("PNG frame is too large to address".to_owned()))?;
    if buffer_size > MAX_RAW_BYTES {
        return Err(IconError::ImageTooLarge { width, height });
    }

    let frame = reader.info().frame_control.as_ref();
    if frame.is_some_and(|frame| frame.width != width || frame.height != height) {
        return Err(IconError::Decode(
            "PNG decoder returned unexpected dimensions".to_owned(),
        ));
    }
    let line_size = reader
        .output_line_size(width)
        .ok_or_else(|| IconError::Decode("PNG row is too large to address".to_owned()))?;
    let mut raw = vec![0u8; buffer_size];
    let data_error = |err| IconError::Decode(format!("PNG data: {err}"));

    if require_complete {
        reader.next_frame(&mut raw).map_err(data_error)?;
        reader
            .finish()
            .map_err(|err| IconError::Decode(format!("PNG end: {err}")))?;
    } else if reader.info().interlaced {
        // Pillow stops after the image pixels. Polling for another row would
        // flush IDAT and require a trailing chunk header that Pillow ignores.
        let mut row = vec![0u8; line_size];
        let bits_per_pixel = color_type.samples() as u8 * bit_depth;
        for (x, y, dx, dy) in [
            (0, 0, 8, 8),
            (4, 0, 8, 8),
            (0, 4, 4, 8),
            (2, 0, 4, 4),
            (0, 2, 2, 4),
            (1, 0, 2, 2),
            (0, 1, 1, 2),
        ] {
            if width <= x || height <= y {
                continue;
            }
            let columns = (width - x).div_ceil(dx);
            let rows = (height - y).div_ceil(dy);
            let row_bytes = (columns as usize * bits_per_pixel as usize).div_ceil(8);
            for _ in 0..rows {
                match reader.read_row(&mut row).map_err(data_error)? {
                    Some(png::InterlaceInfo::Adam7(info)) => {
                        png::expand_interlaced_row(
                            &mut raw,
                            line_size,
                            &row[..row_bytes],
                            &info,
                            bits_per_pixel,
                        );
                    }
                    _ => return Err(IconError::Decode("incomplete Adam7 PNG frame".to_owned())),
                }
            }
        }
    } else {
        for row in raw.chunks_exact_mut(line_size).take(height as usize) {
            if !matches!(
                reader.read_row(row).map_err(data_error)?,
                Some(png::InterlaceInfo::Null(_))
            ) {
                return Err(IconError::Decode("incomplete PNG frame".to_owned()));
            }
        }
    }

    let rgba = png_raw_to_rgba(PngFrame {
        width,
        height,
        bit_depth,
        color_type,
        raw: &raw,
        line_size,
        palette: palette.as_deref(),
        trns: trns.as_deref(),
    })?;

    Ok(DecodedImage {
        width,
        height,
        rgba,
    })
}

struct PngFrame<'a> {
    width: u32,
    height: u32,
    bit_depth: u8,
    color_type: png::ColorType,
    raw: &'a [u8],
    line_size: usize,
    palette: Option<&'a [u8]>,
    trns: Option<&'a [u8]>,
}

#[allow(clippy::needless_range_loop)] // packed samples are addressed by pixel index
fn png_raw_to_rgba(frame: PngFrame<'_>) -> Result<Vec<u8>, IconError> {
    let PngFrame {
        width,
        height,
        bit_depth,
        color_type,
        raw,
        line_size,
        palette,
        trns,
    } = frame;
    let width_usize = width as usize;
    let height_usize = height as usize;
    let expected = line_size
        .checked_mul(height_usize)
        .ok_or_else(|| IconError::Decode("PNG buffer size overflow".to_owned()))?;
    if expected > raw.len() {
        return Err(IconError::Decode(
            "PNG decoder returned a short pixel buffer".to_owned(),
        ));
    }

    let minimum_row_bytes = match (color_type, bit_depth) {
        (png::ColorType::Grayscale, 1) | (png::ColorType::Indexed, 1) => width_usize.div_ceil(8),
        (png::ColorType::Grayscale, 2) | (png::ColorType::Indexed, 2) => width_usize.div_ceil(4),
        (png::ColorType::Grayscale, 4) | (png::ColorType::Indexed, 4) => width_usize.div_ceil(2),
        (png::ColorType::Grayscale, 8) | (png::ColorType::Indexed, 8) => width_usize,
        (png::ColorType::Grayscale, 16) => width_usize.saturating_mul(2),
        (png::ColorType::GrayscaleAlpha, 8) => width_usize.saturating_mul(2),
        (png::ColorType::GrayscaleAlpha, 16) => width_usize.saturating_mul(4),
        (png::ColorType::Rgb, 8) => width_usize.saturating_mul(3),
        (png::ColorType::Rgb, 16) => width_usize.saturating_mul(6),
        (png::ColorType::Rgba, 8) => width_usize.saturating_mul(4),
        (png::ColorType::Rgba, 16) => width_usize.saturating_mul(8),
        _ => 0,
    };
    if line_size < minimum_row_bytes {
        return Err(IconError::Decode(
            "PNG decoder returned an inconsistent row width".to_owned(),
        ));
    }

    let mut out = Vec::with_capacity(
        width_usize
            .checked_mul(height_usize)
            .and_then(|pixels| pixels.checked_mul(4))
            .ok_or_else(|| IconError::Decode("icon buffer size overflow".to_owned()))?,
    );

    match color_type {
        png::ColorType::Grayscale => {
            let transparency = trns.and_then(read_be16);
            for y in 0..height_usize {
                let row = &raw[y * line_size..(y + 1) * line_size];
                for x in 0..width_usize {
                    let value = match bit_depth {
                        8 => row[x],
                        1 => match packed_sample(row, x, 1) {
                            0 => 0,
                            _ => 255,
                        },
                        2 => packed_sample(row, x, 2) * 85,
                        4 => packed_sample(row, x, 4) * 17,
                        16 => {
                            let offset = x * 2;
                            let high = row[offset];
                            let low = row[offset + 1];
                            if high == 0 {
                                low
                            } else {
                                255
                            }
                        }
                        other => {
                            return Err(IconError::Decode(format!(
                                "unsupported PNG grayscale bit depth {other}"
                            )))
                        }
                    };
                    let alpha = match transparency {
                        Some(sample) if value == (sample & 0xff) as u8 => 0,
                        _ => 255,
                    };
                    out.extend_from_slice(&[value, value, value, alpha]);
                }
            }
        }
        png::ColorType::GrayscaleAlpha => {
            if bit_depth != 8 && bit_depth != 16 {
                return Err(IconError::Decode(format!(
                    "unsupported PNG grayscale-alpha bit depth {bit_depth}"
                )));
            }
            let step = if bit_depth == 16 { 4 } else { 2 };
            let sixteen_bit = bit_depth == 16;
            for y in 0..height_usize {
                let row = &raw[y * line_size..(y + 1) * line_size];
                for x in 0..width_usize {
                    let offset = x * step;
                    let (gray, alpha) = if sixteen_bit {
                        (row[offset], row[offset + 2])
                    } else {
                        (row[offset], row[offset + 1])
                    };
                    out.extend_from_slice(&[gray, gray, gray, alpha]);
                }
            }
        }
        png::ColorType::Rgb => {
            if bit_depth != 8 && bit_depth != 16 {
                return Err(IconError::Decode(format!(
                    "unsupported PNG RGB bit depth {bit_depth}"
                )));
            }
            let transparency = trns.and_then(|bytes| {
                if bytes.len() >= 6 {
                    Some([
                        (read_be16(&bytes[0..2]).unwrap_or(0) & 0xff) as u8,
                        (read_be16(&bytes[2..4]).unwrap_or(0) & 0xff) as u8,
                        (read_be16(&bytes[4..6]).unwrap_or(0) & 0xff) as u8,
                    ])
                } else {
                    None
                }
            });
            let step = if bit_depth == 16 { 6 } else { 3 };
            let high_only = bit_depth == 16;
            for y in 0..height_usize {
                let row = &raw[y * line_size..(y + 1) * line_size];
                for x in 0..width_usize {
                    let offset = x * step;
                    let (red, green, blue) = if high_only {
                        (row[offset], row[offset + 2], row[offset + 4])
                    } else {
                        (row[offset], row[offset + 1], row[offset + 2])
                    };
                    let alpha = match transparency {
                        Some([tr, tg, tb]) if red == tr && green == tg && blue == tb => 0,
                        _ => 255,
                    };
                    out.extend_from_slice(&[red, green, blue, alpha]);
                }
            }
        }
        png::ColorType::Rgba => {
            if bit_depth != 8 && bit_depth != 16 {
                return Err(IconError::Decode(format!(
                    "unsupported PNG RGBA bit depth {bit_depth}"
                )));
            }
            if bit_depth == 8 {
                for y in 0..height_usize {
                    let row = &raw[y * line_size..(y + 1) * line_size];
                    out.extend_from_slice(&row[..width_usize * 4]);
                }
            } else {
                for y in 0..height_usize {
                    let row = &raw[y * line_size..(y + 1) * line_size];
                    for x in 0..width_usize {
                        let offset = x * 8;
                        out.extend_from_slice(&[
                            row[offset],
                            row[offset + 2],
                            row[offset + 4],
                            row[offset + 6],
                        ]);
                    }
                }
            }
        }
        png::ColorType::Indexed => {
            let palette = palette.ok_or_else(|| {
                IconError::Decode("indexed PNG is missing its palette".to_owned())
            })?;
            let table = build_palette_rgba(palette, trns);
            for y in 0..height_usize {
                let row = &raw[y * line_size..(y + 1) * line_size];
                for x in 0..width_usize {
                    let index = match bit_depth {
                        8 => row[x],
                        1 | 2 | 4 => packed_sample(row, x, bit_depth),
                        other => {
                            return Err(IconError::Decode(format!(
                                "unsupported indexed PNG bit depth {other}"
                            )))
                        }
                    } as usize;
                    out.extend_from_slice(&table[index]);
                }
            }
        }
    }

    Ok(out)
}

fn read_be16(bytes: &[u8]) -> Option<u16> {
    if bytes.len() < 2 {
        None
    } else {
        Some(u16::from_be_bytes([bytes[0], bytes[1]]))
    }
}

fn packed_sample(row: &[u8], x: usize, bit_depth: u8) -> u8 {
    match bit_depth {
        1 => (row[x / 8] >> (7 - (x % 8))) & 0x01,
        2 => (row[x / 4] >> (6 - 2 * (x % 4))) & 0x03,
        4 => {
            let byte = row[x / 2];
            if x.is_multiple_of(2) {
                (byte >> 4) & 0x0f
            } else {
                byte & 0x0f
            }
        }
        _ => row[x],
    }
}

fn build_palette_rgba(palette: &[u8], trns: Option<&[u8]>) -> [[u8; 4]; 256] {
    let mut table = [[0u8, 0, 0, 255]; 256];
    for (index, entry) in table.iter_mut().enumerate() {
        let offset = index * 3;
        if offset + 3 <= palette.len() {
            entry[0] = palette[offset];
            entry[1] = palette[offset + 1];
            entry[2] = palette[offset + 2];
        }
    }

    if let Some(alpha) = trns {
        let zeros = alpha.iter().filter(|&&value| value == 0).count();
        let simple = zeros == 1 && alpha.iter().all(|&value| value == 0 || value == 255);
        if simple {
            if let Some(index) = alpha.iter().position(|&value| value == 0) {
                table[index][3] = 0;
            }
        } else {
            for (index, &value) in alpha.iter().take(256).enumerate() {
                table[index][3] = value;
            }
        }
    }

    table
}

/// Decode a JPEG using the pinned libjpeg-turbo backend.
///
/// Pillow's `JpegImagePlugin` decodes 1-component images as `L`, 3-component
/// images as `RGB` and 4-component images as `CMYK` (then `Image.convert`
/// maps CMYK to RGBA with Pillow's own integer arithmetic). TurboJPEG is
/// configured to produce those same raw component buffers: grayscale, RGB, or
/// the Adobe-convention CMYK bytes that Pillow's `CMYK;I` unpack step inverts.
fn decode_jpeg(input: &[u8]) -> Result<DecodedImage, IconError> {
    validate_jpeg_stream(input)?;

    let mut decompressor = Decompressor::new()
        .map_err(|err| IconError::Decode(format!("JPEG decoder init: {err}")))?;
    let header = decompressor
        .read_header(input)
        .map_err(|err| IconError::Decode(format!("JPEG header: {err}")))?;

    let width = u32::try_from(header.width)
        .map_err(|_| IconError::Decode("JPEG width does not fit in u32".to_owned()))?;
    let height = u32::try_from(header.height)
        .map_err(|_| IconError::Decode("JPEG height does not fit in u32".to_owned()))?;
    validate_dimensions(width, height)?;

    let format = match header.colorspace {
        turbojpeg::Colorspace::Gray => PixelFormat::GRAY,
        turbojpeg::Colorspace::RGB | turbojpeg::Colorspace::YCbCr => PixelFormat::RGB,
        turbojpeg::Colorspace::CMYK | turbojpeg::Colorspace::YCCK => PixelFormat::CMYK,
    };
    let components = format.size();
    let pitch = header
        .width
        .checked_mul(components)
        .ok_or_else(|| IconError::Decode("JPEG row size overflow".to_owned()))?;
    let buffer_len = pitch
        .checked_mul(header.height)
        .ok_or_else(|| IconError::Decode("JPEG buffer size overflow".to_owned()))?;
    if buffer_len > MAX_RAW_BYTES {
        return Err(IconError::ImageTooLarge { width, height });
    }

    let mut rgba = Vec::new();
    let mut image = Image {
        pixels: vec![0u8; buffer_len],
        width: header.width,
        pitch,
        height: header.height,
        format,
    };
    decompressor
        .decompress(input, image.as_deref_mut())
        .map_err(|err| IconError::Decode(format!("JPEG data: {err}")))?;

    match format {
        PixelFormat::GRAY => {
            rgba.reserve(header.width * header.height * 4);
            for &value in &image.pixels {
                rgba.extend_from_slice(&[value, value, value, 255]);
            }
        }
        PixelFormat::RGB => {
            rgba.reserve(header.width * header.height * 4);
            for pixel in image.pixels.chunks_exact(3) {
                rgba.extend_from_slice(&[pixel[0], pixel[1], pixel[2], 255]);
            }
        }
        PixelFormat::CMYK => {
            rgba.reserve(header.width * header.height * 4);
            for pixel in image.pixels.chunks_exact(4) {
                // Pillow unpacks `CMYK;I` by inverting every channel, then
                // `Convert.c:cmyk2rgb` maps the stored CMYK to RGB.
                let cyan = 255 - pixel[0];
                let magenta = 255 - pixel[1];
                let yellow = 255 - pixel[2];
                let black = 255 - pixel[3];
                let not_black = i32::from(255 - black);
                rgba.extend_from_slice(&[
                    clip_cmyk(not_black - muldiv255_i32(cyan, not_black)),
                    clip_cmyk(not_black - muldiv255_i32(magenta, not_black)),
                    clip_cmyk(not_black - muldiv255_i32(yellow, not_black)),
                    255,
                ]);
            }
        }
        other => {
            return Err(IconError::Decode(format!(
                "unsupported JPEG output pixel format {other:?}"
            )))
        }
    }

    if rgba.len() != width as usize * height as usize * 4 {
        return Err(IconError::Decode(
            "JPEG decoder produced an inconsistent RGBA buffer".to_owned(),
        ));
    }

    Ok(DecodedImage {
        width,
        height,
        rgba,
    })
}

/// Pillow's `MULDIV255` from `src/libImaging/ImagingUtils.h`.
fn muldiv255_i32(value: u8, alpha: i32) -> i32 {
    let product = i32::from(value) * alpha + 128;
    ((product >> 8) + product) >> 8
}

/// Pillow's `CLIP8` from `src/libImaging/ImagingUtils.h`.
fn clip_cmyk(value: i32) -> u8 {
    value.clamp(0, 255) as u8
}

#[allow(clippy::field_reassign_with_default)] // image::Limits is non-exhaustive
fn decode_with_image(input: &[u8], format: ImageFormat) -> Result<DecodedImage, IconError> {
    let mut limits = image::Limits::default();
    limits.max_image_width = Some(MAX_DIMENSION);
    limits.max_image_height = Some(MAX_DIMENSION);
    limits.max_alloc = Some(MAX_RAW_BYTES as u64);

    let mut reader = ImageReader::with_format(Cursor::new(input), format);
    reader.limits(limits);
    let image = reader
        .decode()
        .map_err(|err| IconError::Decode(err.to_string()))?;

    let width = image.width();
    let height = image.height();
    validate_dimensions(width, height)?;
    let rgba = dynamic_to_rgba(image)?;
    Ok(DecodedImage {
        width,
        height,
        rgba,
    })
}

/// Mirror Pillow's `convert("RGBA")` for the modes the JPEG/WebP decoders emit.
fn dynamic_to_rgba(image: DynamicImage) -> Result<Vec<u8>, IconError> {
    match image {
        DynamicImage::ImageLuma8(buffer) => {
            let source = buffer.as_raw();
            let mut out = Vec::with_capacity(source.len() * 4);
            for &value in source {
                out.extend_from_slice(&[value, value, value, 255]);
            }
            Ok(out)
        }
        DynamicImage::ImageLumaA8(buffer) => {
            let source = buffer.as_raw();
            let mut out = Vec::with_capacity(source.len() * 2);
            for pixel in source.chunks_exact(2) {
                out.extend_from_slice(&[pixel[0], pixel[0], pixel[0], pixel[1]]);
            }
            Ok(out)
        }
        DynamicImage::ImageRgb8(buffer) => {
            let source = buffer.as_raw();
            let mut out = Vec::with_capacity(source.len() / 3 * 4);
            for pixel in source.chunks_exact(3) {
                out.extend_from_slice(&[pixel[0], pixel[1], pixel[2], 255]);
            }
            Ok(out)
        }
        DynamicImage::ImageRgba8(buffer) => Ok(buffer.into_raw()),
        other => Err(IconError::Decode(format!(
            "unsupported decoded pixel type {:?}",
            other.color()
        ))),
    }
}

// ---------------------------------------------------------------------------
// Resampling (Pillow 11.3.0 port)
// ---------------------------------------------------------------------------

fn resize_to_icon(mut current: Vec<u8>, width: u32, height: u32) -> Vec<u8> {
    // Pillow returns a plain copy before the RGBA -> RGBa premultiplication
    // step when the source already has the requested size and full box.
    if width == ICON_SIZE && height == ICON_SIZE {
        return current;
    }

    premultiply(&mut current);
    let mut current_width = width as usize;
    let current_height = height as usize;

    if current_width != ICON_SIZE as usize {
        current = resample_horizontal(&current, current_width, current_height);
        current_width = ICON_SIZE as usize;
    }
    if current_height != ICON_SIZE as usize {
        current = resample_vertical(&current, current_width, current_height);
    }

    debug_assert_eq!(current_width, ICON_SIZE as usize);
    unpremultiply(&mut current);
    current
}

fn muldiv255(value: u8, alpha: u8) -> u8 {
    let tmp = u32::from(value) * u32::from(alpha) + 128;
    (((tmp >> 8) + tmp) >> 8) as u8
}

fn premultiply(pixels: &mut [u8]) {
    for pixel in pixels.chunks_exact_mut(4) {
        let alpha = pixel[3];
        pixel[0] = muldiv255(pixel[0], alpha);
        pixel[1] = muldiv255(pixel[1], alpha);
        pixel[2] = muldiv255(pixel[2], alpha);
    }
}

fn unpremultiply(pixels: &mut [u8]) {
    for pixel in pixels.chunks_exact_mut(4) {
        let alpha = pixel[3];
        if alpha != 0 && alpha != 255 {
            for channel in &mut pixel[..3] {
                let value = (255 * u32::from(*channel)) / u32::from(alpha);
                *channel = value.min(255) as u8;
            }
        }
    }
}

fn sinc(x: f64) -> f64 {
    if x == 0.0 {
        1.0
    } else {
        let x = x * std::f64::consts::PI;
        x.sin() / x
    }
}

fn lanczos_filter(x: f64) -> f64 {
    if (-LANCZOS_SUPPORT..LANCZOS_SUPPORT).contains(&x) {
        sinc(x) * sinc(x / LANCZOS_SUPPORT)
    } else {
        0.0
    }
}

struct Kernel {
    bounds: Vec<(usize, usize)>,
    coefficients: Vec<i32>,
    width: usize,
}

fn precompute_coefficients(in_size: usize, out_size: usize) -> Kernel {
    let scale = in_size as f64 / out_size as f64;
    let filter_scale = scale.max(1.0);
    let support = LANCZOS_SUPPORT * filter_scale;
    let ksize = support.ceil() as usize * 2 + 1;

    let mut bounds = Vec::with_capacity(out_size);
    let mut coefficients = vec![0i32; out_size * ksize];
    let mut weights = vec![0.0f64; ksize];
    let inv_filter_scale = 1.0 / filter_scale;

    for xx in 0..out_size {
        let center = (xx as f64 + 0.5) * scale;

        let mut xmin = (center - support + 0.5) as i64;
        if xmin < 0 {
            xmin = 0;
        }
        let mut xmax = (center + support + 0.5) as i64;
        if xmax > in_size as i64 {
            xmax = in_size as i64;
        }
        xmax -= xmin;
        let xmin = xmin as usize;
        let xmax = xmax.max(0) as usize;

        weights[xmax..].fill(0.0);
        let mut sum = 0.0f64;
        for (x, slot) in weights.iter_mut().take(xmax).enumerate() {
            let weight = lanczos_filter((x as f64 + xmin as f64 - center + 0.5) * inv_filter_scale);
            *slot = weight;
            sum += weight;
        }
        if sum != 0.0 {
            for weight in weights.iter_mut().take(xmax) {
                *weight /= sum;
            }
        }

        let base = xx * ksize;
        for (x, weight) in weights.iter().enumerate() {
            let scaled = if *weight < 0.0 {
                (-0.5 + *weight * COEFF_SCALE) as i32
            } else {
                (0.5 + *weight * COEFF_SCALE) as i32
            };
            coefficients[base + x] = scaled;
        }
        bounds.push((xmin, xmax));
    }

    Kernel {
        bounds,
        coefficients,
        width: ksize,
    }
}

fn clip8(accumulator: i32) -> u8 {
    (accumulator >> PRECISION_BITS).clamp(0, 255) as u8
}

fn resample_horizontal(source: &[u8], width: usize, height: usize) -> Vec<u8> {
    let kernel = precompute_coefficients(width, ICON_SIZE as usize);
    let out_width = ICON_SIZE as usize;
    let mut out = vec![0u8; out_width * height * 4];

    for y in 0..height {
        for xx in 0..out_width {
            let (xmin, xmax) = kernel.bounds[xx];
            let coefficients = &kernel.coefficients[xx * kernel.width..(xx + 1) * kernel.width];
            let mut accumulators = [1i32 << (PRECISION_BITS - 1); 4];
            for (x, &coefficient) in coefficients.iter().take(xmax).enumerate() {
                let source_offset = (y * width + x + xmin) * 4;
                for (accumulator, &value) in accumulators
                    .iter_mut()
                    .zip(&source[source_offset..source_offset + 4])
                {
                    *accumulator =
                        accumulator.wrapping_add(i32::from(value).wrapping_mul(coefficient));
                }
            }
            let out_offset = (y * out_width + xx) * 4;
            for (&accumulator, destination) in accumulators
                .iter()
                .zip(&mut out[out_offset..out_offset + 4])
            {
                *destination = clip8(accumulator);
            }
        }
    }

    out
}

fn resample_vertical(source: &[u8], width: usize, height: usize) -> Vec<u8> {
    let kernel = precompute_coefficients(height, ICON_SIZE as usize);
    let out_height = ICON_SIZE as usize;
    let mut out = vec![0u8; width * out_height * 4];

    for yy in 0..out_height {
        let (ymin, ymax) = kernel.bounds[yy];
        let coefficients = &kernel.coefficients[yy * kernel.width..(yy + 1) * kernel.width];
        for xx in 0..width {
            let mut accumulators = [1i32 << (PRECISION_BITS - 1); 4];
            for (y, &coefficient) in coefficients.iter().take(ymax).enumerate() {
                let source_offset = ((y + ymin) * width + xx) * 4;
                for (accumulator, &value) in accumulators
                    .iter_mut()
                    .zip(&source[source_offset..source_offset + 4])
                {
                    *accumulator =
                        accumulator.wrapping_add(i32::from(value).wrapping_mul(coefficient));
                }
            }
            let out_offset = (yy * width + xx) * 4;
            for (&accumulator, destination) in accumulators
                .iter()
                .zip(&mut out[out_offset..out_offset + 4])
            {
                *destination = clip8(accumulator);
            }
        }
    }

    out
}

// ---------------------------------------------------------------------------
// PNG encoding
// ---------------------------------------------------------------------------

fn encode_png(rgba: &[u8]) -> Result<Vec<u8>, IconError> {
    let mut out = Vec::new();
    {
        let mut encoder = png::Encoder::new(&mut out, ICON_SIZE, ICON_SIZE);
        encoder.set_color(png::ColorType::Rgba);
        encoder.set_depth(png::BitDepth::Eight);
        encoder.set_compression(png::Compression::High);
        let mut writer = encoder
            .write_header()
            .map_err(|err| IconError::Encode(err.to_string()))?;
        writer
            .write_image_data(rgba)
            .map_err(|err| IconError::Encode(err.to_string()))?;
        writer
            .finish()
            .map_err(|err| IconError::Encode(err.to_string()))?;
    }
    Ok(out)
}
