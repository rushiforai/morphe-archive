use std::env;
use std::fs;
use std::path::PathBuf;

fn main() {
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=CMakeLists.txt");
    println!("cargo:rerun-if-changed=cmake/patch_libjpeg.cmake");
    println!("cargo:rerun-if-changed=bindings.rs");

    let manifest_dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR").expect("CARGO_MANIFEST_DIR"));
    let mut cmake = cmake::Config::new(&manifest_dir);
    cmake.define("CMAKE_INSTALL_DEFAULT_LIBDIR", "lib");
    if cfg!(feature = "require-simd") {
        cmake.define("REQUIRE_SIMD", "ON");
    }
    let install_dir = cmake.build();

    for candidate in ["lib", "lib64"] {
        let directory = install_dir.join(candidate);
        if directory.is_dir() {
            println!("cargo:rustc-link-search=native={}", directory.display());
        }
    }
    println!("cargo:rustc-link-lib=static=turbojpeg");

    let include_dir = install_dir.join("include");
    if include_dir.is_dir() {
        println!("cargo:include={}", include_dir.display());
    }

    let out_dir = PathBuf::from(env::var("OUT_DIR").expect("OUT_DIR"));
    fs::copy(
        manifest_dir.join("bindings.rs"),
        out_dir.join("bindings.rs"),
    )
    .expect("copy pregenerated TurboJPEG bindings");

    // Keep the pinned source identity visible in build logs and metadata.
    println!(
        "cargo:warning=turbojpeg-sys: building libjpeg-turbo 3.1.1 (sha256 aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c)"
    );
}
