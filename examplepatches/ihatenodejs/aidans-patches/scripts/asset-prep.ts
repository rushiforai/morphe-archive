#!/usr/bin/env bun
import { fileURLToPath } from 'node:url';

// One host-target bootstrap for site checks, audit and icon automation. Explicit
// --target prevents an inherited CARGO_BUILD_TARGET from selecting Android.
const root = fileURLToPath(new URL('../', import.meta.url));
const hostProbe = Bun.spawnSync(['rustc', '-vV'], {
  cwd: root,
  stdout: 'pipe',
  stderr: 'pipe',
});
if (hostProbe.exitCode !== 0) {
  process.stderr.write(hostProbe.stderr);
  process.exit(hostProbe.exitCode || 1);
}
const host = hostProbe.stdout
  .toString()
  .split('\n')
  .find((line) => line.startsWith('host: '))
  ?.slice('host: '.length)
  .trim();
if (!host || !/^[a-zA-Z0-9_.-]+$/.test(host)) {
  console.error('rustc -vV did not report a valid host target');
  process.exit(1);
}
const child = Bun.spawn(
  [
    'cargo',
    'run',
    '--quiet',
    '--release',
    '--locked',
    '--manifest-path',
    'tools/asset-prep/Cargo.toml',
    '--target',
    host,
    '--',
    ...process.argv.slice(2),
  ],
  {
    cwd: root,
    stdin: 'inherit',
    stdout: 'inherit',
    stderr: 'inherit',
  },
);
process.exit(await child.exited);
