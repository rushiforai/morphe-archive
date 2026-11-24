/**
 * Explicit registry of first-party Rust projects.
 *
 * Audit commands and the dependency inventory both read this list so a new
 * host tool cannot be added to one path and silently omitted from the other.
 * Target-specific build arguments stay on the project that owns them rather
 * than being forced onto every host check.
 */
export interface RustCrossTarget {
  /** Cargo target triple built outside the host audit. */
  triple: string;
  /** Arguments the owning build uses for this target. */
  args: readonly string[];
  /** Build task that owns the cross compilation. */
  owner: string;
}

export interface RustProject {
  id: string;
  label: string;
  manifest: string;
  lockfile: string;
  /** Arguments appended to host-run cargo fmt/clippy/check/test commands. */
  hostArgs: readonly string[];
  /** Cross target built by another task, never applied to host audit commands. */
  crossTarget?: RustCrossTarget;
}

export const RUST_PROJECTS: readonly RustProject[] = [
  {
    id: 'apk-lab',
    label: 'APK Lab',
    manifest: 'tools/apk-lab/Cargo.toml',
    lockfile: 'tools/apk-lab/Cargo.lock',
    hostArgs: [],
  },
  {
    id: 'asset-prep',
    label: 'Asset Prep',
    manifest: 'tools/asset-prep/Cargo.toml',
    lockfile: 'tools/asset-prep/Cargo.lock',
    hostArgs: [],
  },
  {
    id: 'play-metadata',
    label: 'Play Metadata',
    manifest: 'tools/play-metadata/Cargo.toml',
    lockfile: 'tools/play-metadata/Cargo.lock',
    hostArgs: [],
  },
  {
    id: 'nhl-adblock-native',
    label: 'NHL AdBlock Native',
    manifest: 'extensions/nhl-adblock-native/Cargo.toml',
    lockfile: 'extensions/nhl-adblock-native/Cargo.lock',
    hostArgs: [],
    crossTarget: {
      triple: 'aarch64-linux-android',
      args: ['--release', '--target', 'aarch64-linux-android'],
      owner: 'patches/build.gradle.kts (buildNhlAdblockNative)',
    },
  },
] as const;

/** Builds the argument list for a host cargo command targeting `project`. */
export function cargoArgs(
  project: RustProject,
  command: readonly string[],
  extra: readonly string[] = [],
): string[] {
  return [
    ...command,
    '--manifest-path',
    project.manifest,
    ...project.hostArgs,
    ...extra,
  ];
}
