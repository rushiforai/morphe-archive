# Build-tool minimatch security remediation (2026-11-15)

## Advisory and root cause

Dependabot identified GHSA-g3hv-75wg-m249 (CVE-2026-118764,
Moderate) in `minimatch@10.2.5`, with patched versions >=11.0.1.

The vulnerable copy was not part of the shipped Android app. It came
from the following development-tool chain:

```
semantic-release@25.0.9
  -> @semantic-release/npm@13.1.5 (not used by our release configuration)
     -> npm@12.2.2
        -> bundled minimatch@10.2.5
```

npm 12.2.2 embeds its dependency tree in the published tarball, which
cannot be repaired using a normal root `overrides.minimatch` setting.
Forcing an incompatible major dependency into the npm CLI or downgrading
npm was not adopted.

## Implemented fix

`.releaserc` explicitly lists the plugins used to publish MPP assets
to GitHub and does not include `@semantic-release/npm` (npm-registry
publication).

To avoid installing the otherwise-unused npm publication plugin, the
root `devDependencies` now resolves `@semantic-release/npm` to the
small, reviewed local stub at
`.github/stubs/semantic-release-npm-disabled`. The stub exports no
publication hooks and throws a clear error if it is ever imported.
It uses the compatible package version `13.1.5`, satisfying the
transitive dependency without downloading the upstream npm plugin.

The `npm@12.2.2` override was removed because no dependency on the
npm CLI remains. Other security overrides remain unchanged.

`.github/scripts/verify-release-npm.cjs` now fails if the npm
CLI reappears, if a vulnerable minimatch copy is introduced, or if the
npm publication plugin is enabled in `.releaserc`.

## Verification

The following completed successfully in the isolated security branch:

- Regenerated `package-lock.json` using the supported Node 26 toolchain
- `npm ci --ignore-scripts --no-audit --no-fund`
- Verification of the local plugin link and no `npm` or vulnerable `minimatch`
- `import('semantic-release')`, preserving the core release CLI
- Version and resolution consistency via `npm ls`

The generated lockfile removes the unused npm CLI and its bundled
packages. No Android application code or published release was changed.

This is an intentionally scoped workaround for an unused upstream
plugin. If the project later needs npm registry publication, remove the
stub, install the real plugin and re-audit the entire dependency tree
before enabling it.

## References

- https://github.com/advisories/GHSA-g3hv-75wg-m249
- https://github.com/semantic-release/semantic-release/issues/1260
- https://github.com/npm/cli/releases
