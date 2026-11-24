use asset_prep::{font, icon_sync, ocr, pdfbox, AssetError, Result};
use std::process::ExitCode;

const USAGE: &str = "Usage: asset-prep <command> [options]\n\nCommands:\n  font    --output PATH --cache-dir PATH [--url URL]\n  ocr     --output PATH --cache-dir PATH\n  pdfbox  --output PATH --gradle-home PATH [--version VERSION] [--aar PATH]\n  icons   (--check-only | --download-missing | --sync-all)\n          [--patches-list PATH] [--icons-dir PATH]\n\nBuild: cargo build --release --locked --manifest-path tools/asset-prep/Cargo.toml";

fn run(args: &[String]) -> Result<()> {
    let Some((command, options)) = args.split_first() else {
        return Err(AssetError::usage(USAGE));
    };
    if matches!(command.as_str(), "--version" | "-V") && options.is_empty() {
        println!("asset-prep {}", env!("CARGO_PKG_VERSION"));
        return Ok(());
    }
    if matches!(command.as_str(), "--help" | "-h")
        || (matches!(command.as_str(), "font" | "ocr" | "pdfbox" | "icons")
            && options
                .iter()
                .any(|argument| matches!(argument.as_str(), "--help" | "-h")))
    {
        println!("{USAGE}");
        return Ok(());
    }
    match command.as_str() {
        "font" => font::run(options),
        "ocr" => ocr::run(options),
        "pdfbox" => pdfbox::run(options),
        "icons" => icon_sync::run(options),
        _ => Err(AssetError::usage(format!(
            "unknown command: {command}\n{USAGE}"
        ))),
    }
}

fn main() -> ExitCode {
    let args: Vec<_> = std::env::args().skip(1).collect();
    match run(&args) {
        Ok(()) => ExitCode::SUCCESS,
        Err(error) => {
            eprintln!("{error}");
            ExitCode::from(error.exit_code() as u8)
        }
    }
}
