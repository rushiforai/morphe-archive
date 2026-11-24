# turbojpeg-sys vendored source notice

This directory is a minimal local replacement for the crates.io
`turbojpeg-sys` 1.2.0 crate. The high-level `turbojpeg` 1.5.1 crate is used
unchanged; only this raw FFI wrapper is patched so that it compiles the exact
libjpeg-turbo version Pillow 11.3.0 was built against.

## Upstream wrapper

- High-level crate: `turbojpeg` 1.5.1
  (crates.io checksum `81313fcd64aaa30ddfd59eaa122968136b2dd9cd41d9619b126cf71e67a01702`;
  upstream tag `v1.5.1`, commit `7a9702af7f520709ed1b52a85d29960289268f87`)
- Raw crate: `turbojpeg-sys` 1.2.0
- Repository: https://github.com/honzasp/rust-turbojpeg
- Registry checksum: 49b5a974bc59382d35927e3a07eef2ba9a24fe7227cefe52ec44b508e1b90f86
- License: Unlicense OR MIT (see `LICENSE-MIT`)
- `bindings.rs` is the pregenerated binding file from that release, with only
  the header and 8-bit decode entrypoints renamed internally via `link_name`.
  `src/lib.rs` exposes their original ABI and preserves Pillow's nonfatal-warning
  behavior when `STOPONWARNING` is disabled. Fatal errors remain failures.

## Pinned native source

- Project: libjpeg-turbo
- Version: 3.1.1 (release tag `7723f50f3f66b9da74376e6d8badb6162464212c`)
- Archive: https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.1.1/libjpeg-turbo-3.1.1.tar.gz
- SHA-256: aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c
- Licenses: IJG and Modified BSD (3-clause). The official roll-up is
  reproduced in `LIBJPEG-TURBO-LICENSE.md`, with the IJG text in
  `LIBJPEG-TURBO-README.ijg`. The verified archive also contains the complete
  `LICENSE.md`, `README.ijg`, and source notices; it is downloaded and
  hash-checked by CMake at first build, never vendored here.

The build uses a CMake-managed download cache with `EXPECTED_HASH`, TLS
verification, and a timeout, then `FetchContent` for source integration,
matching the repository's existing `extensions/adobescan-pdf-native` source-pin
pattern. The cached archive is re-hashed on every configure; a transfer is
written to `.part` and renamed only after its hash matches.

## Local changes

- `build.rs`: invokes CMake, emits static link metadata, copies the
  pregenerated bindings.
- `CMakeLists.txt`: pins and verifies the official 3.1.1 archive and requests a
  static TurboJPEG library.
- `cmake/patch_libjpeg.cmake`: removes libjpeg-turbo's upstream fatal error
  when it is integrated with `add_subdirectory`/`FetchContent`. The patch
  changes build integration only, not codec behavior.

Build prerequisites: CMake 3.24+, a C compiler, and network access on the first
build to bootstrap the verified archive. NASM is optional; without it the
static library is built without SIMD (the existing repository toolchain
documentation already lists NASM/CMake). Later builds reuse the cached,
re-hashed archive and need no network.

No libjpeg-turbo source is stored in this repository, and no system or
registry dependency is modified.
