//! Native APK Lab host library.
//!
//! The CLI binary is a thin formatting boundary. Domain modules return typed
//! values or typed errors, and side effects (subprocesses, filesystem writes)
//! stay in the module that owns the invariant.
//!
//! Tests build nested JSON fixtures; expansion depth needs more than the
//! default.
#![recursion_limit = "256"]

pub mod accounts;
pub mod accounts_tui;
pub mod acquisition;
pub mod analysis;
pub mod archives;
pub mod asm;
pub mod cli;
pub mod code_inspection;
pub mod comparison;
pub mod compatibility_ci;
pub mod deployment;
pub mod device;
pub mod dex_strings;
pub mod error;
pub mod fixtures;
pub mod il2cpp;
pub mod inspection;
pub mod manifest;
pub mod models;
pub mod morphe;
pub mod play;
pub mod process;
pub mod resources;
pub mod smali;
pub mod tools;
pub mod unity;
pub mod workspace;
