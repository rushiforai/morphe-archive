//! Host preparation of pinned build resources and exact application icon pixels.
//!
//! Icon arithmetic follows Pillow 11.3.0 (`src/libImaging`, MIT-CMU); see
//! `PILLOW-LICENSE.txt`. JPEG decoding uses the hash-pinned libjpeg-turbo 3.1.1
//! build documented in `vendor/turbojpeg-sys/NOTICE.md`.

pub mod cache;
pub mod cli;
mod error;
pub mod font;
pub mod icon_sync;
pub mod icons;
pub mod ocr;
pub mod pdfbox;

pub use error::{AssetError, Result};

pub use icons::{
    transform_icon, write_icon_if_changed, IconError, IconImage, IconWriteDecision, ICON_SIZE,
};
