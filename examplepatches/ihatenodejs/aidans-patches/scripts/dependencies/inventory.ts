import * as crypto from 'node:crypto';
import * as fs from 'node:fs';
import * as path from 'node:path';
import { TOML } from 'bun';
import type { DependencyItem, DependencyPolicy, ProposalInput } from './model';

export interface InventoryResult {
  items: DependencyItem[];
  inputs: ProposalInput[];
}

export function computeFileSha256(filePath: string): string {
  const content = fs.readFileSync(filePath);
  return crypto.createHash('sha256').update(content).digest('hex');
}

export function parsePythonRequirement(reqStr: string): {
  name: string;
  constraint: string;
} {
  const cleaned = reqStr.trim();
  const match = cleaned.match(/^([a-zA-Z0-9_.-]+)(.*)$/);
  if (!match) {
    return { name: cleaned, constraint: '' };
  }
  return { name: match[1], constraint: match[2].trim() };
}

export function parseBunLock(lockText: string): {
  packages?: Record<string, unknown>;
} & Record<string, unknown> {
  try {
    // Strip trailing commas before closing braces/brackets for Bun text lockfiles
    const sanitized = lockText.replace(/,\s*([\]}])/g, '$1');
    return JSON.parse(sanitized);
  } catch {
    return {};
  }
}

export function parseBunLockPackages(
  lockText: string,
): Record<string, unknown> {
  const parsed = parseBunLock(lockText);
  return (parsed.packages as Record<string, unknown>) || {};
}

export function extractKtlintVersion(auditText: string): string {
  const ktlintVersionMatch =
    auditText.match(/const\s+KTLINT_VERSION\s*=\s*'([^']+)'/) ||
    auditText.match(/KTLINT_([0-9_]+)_SHA256/) ||
    auditText.match(/ktlint\/releases\/download\/([0-9.]+)\//);
  return ktlintVersionMatch
    ? (ktlintVersionMatch[1] || '').replace(/_/g, '.')
    : '1.5.0';
}

export function collectInventory(
  repoRoot: string,
  policy: DependencyPolicy,
): InventoryResult {
  const items: DependencyItem[] = [];
  const inputFiles = new Set<string>();

  function registerInput(relPath: string) {
    const absPath = path.resolve(repoRoot, relPath);
    if (fs.existsSync(absPath)) {
      inputFiles.add(relPath);
    }
  }

  // 1. JavaScript manifests (package.json, worker/package.json, site/package.json)
  const jsManifests = [
    {
      manifest: 'package.json',
      lock: 'bun.lock',
      extraLock: 'package-lock.json',
    },
    { manifest: 'worker/package.json', lock: 'worker/bun.lock' },
    { manifest: 'site/package.json', lock: 'site/bun.lock' },
  ];

  for (const { manifest, lock, extraLock } of jsManifests) {
    const manifestAbs = path.resolve(repoRoot, manifest);
    if (!fs.existsSync(manifestAbs)) continue;
    registerInput(manifest);
    registerInput(lock);
    if (extraLock) registerInput(extraLock);

    const manifestJson = JSON.parse(fs.readFileSync(manifestAbs, 'utf8'));
    let bunLockPackages: Record<string, unknown> = {};
    const lockAbs = path.resolve(repoRoot, lock);
    if (fs.existsSync(lockAbs)) {
      try {
        const lockText = fs.readFileSync(lockAbs, 'utf8');
        // Strip trailing commas before closing braces/brackets for Bun text lockfiles
        const sanitized = lockText.replace(/,\s*([\]}])/g, '$1');
        bunLockPackages =
          (JSON.parse(sanitized).packages as Record<string, unknown>) || {};
      } catch {
        bunLockPackages = {};
      }
    }

    const sections = [
      'dependencies',
      'devDependencies',
      'optionalDependencies',
      'peerDependencies',
    ];
    for (const section of sections) {
      const deps = manifestJson[section] as Record<string, string> | undefined;
      if (!deps || typeof deps !== 'object') continue;

      for (const [name, declared] of Object.entries(deps)) {
        let resolved: string | null = null;
        const entry = bunLockPackages[name];
        if (Array.isArray(entry) && typeof entry[0] === 'string') {
          const spec = entry[0];
          if (spec.includes('@github:') || spec.includes('#')) {
            const commitMatch = spec.match(/#([a-f0-9]+)$/);
            resolved = commitMatch
              ? commitMatch[1]
              : (entry[2] as string) || null;
          } else {
            const atIdx = spec.lastIndexOf('@');
            if (atIdx > 0) {
              resolved = spec.slice(atIdx + 1);
            }
          }
        }

        const id = `npm:${manifest}#${section}/${name}`;
        items.push({
          id,
          ecosystem: 'npm',
          name,
          locations: [`${manifest} (${section})`],
          declared,
          resolved,
          latest: null,
          status: 'current',
        });
      }
    }
  }

  // 2. Python manifest (tools/apk-lab/pyproject.toml)
  const pyprojectRel = 'tools/apk-lab/pyproject.toml';
  const pyprojectAbs = path.resolve(repoRoot, pyprojectRel);
  const uvLockRel = 'tools/apk-lab/uv.lock';
  const uvLockAbs = path.resolve(repoRoot, uvLockRel);

  if (fs.existsSync(pyprojectAbs)) {
    registerInput(pyprojectRel);
    registerInput(uvLockRel);

    const pyprojectText = fs.readFileSync(pyprojectAbs, 'utf8');
    const pyprojectToml = TOML.parse(pyprojectText) as {
      project?: { dependencies?: string[] };
      'dependency-groups'?: { dev?: string[] };
      'build-system'?: { requires?: string[] };
    };

    const uvLockPackages: Record<string, string> = {};
    if (fs.existsSync(uvLockAbs)) {
      try {
        const uvLockText = fs.readFileSync(uvLockAbs, 'utf8');
        const uvToml = TOML.parse(uvLockText) as {
          package?: Array<{ name: string; version: string }>;
        };
        if (Array.isArray(uvToml.package)) {
          for (const pkg of uvToml.package) {
            if (pkg.name && pkg.version) {
              uvLockPackages[pkg.name] = pkg.version;
            }
          }
        }
      } catch {
        // uv.lock parse error handled
      }
    }

    // project.dependencies
    const projectDeps = pyprojectToml.project?.dependencies;
    if (Array.isArray(projectDeps)) {
      for (const req of projectDeps) {
        if (typeof req !== 'string') continue;
        const { name, constraint } = parsePythonRequirement(req);
        const resolved = uvLockPackages[name] || null;
        items.push({
          id: `pypi:${pyprojectRel}#dependencies/${name}`,
          ecosystem: 'pypi',
          name,
          locations: [`${pyprojectRel} ([project].dependencies)`],
          declared: constraint,
          resolved,
          latest: null,
          status: 'current',
        });
      }
    }

    // dependency-groups.dev
    const devDeps = pyprojectToml['dependency-groups']?.dev;
    if (Array.isArray(devDeps)) {
      for (const req of devDeps) {
        if (typeof req !== 'string') continue;
        const { name, constraint } = parsePythonRequirement(req);
        const resolved = uvLockPackages[name] || null;
        items.push({
          id: `pypi:${pyprojectRel}#dependency-groups.dev/${name}`,
          ecosystem: 'pypi',
          name,
          locations: [`${pyprojectRel} ([dependency-groups].dev)`],
          declared: constraint,
          resolved,
          latest: null,
          status: 'current',
        });
      }
    }

    // build-system.requires
    const buildRequires = pyprojectToml['build-system']?.requires;
    if (Array.isArray(buildRequires)) {
      for (const req of buildRequires) {
        if (typeof req !== 'string') continue;
        const { name, constraint } = parsePythonRequirement(req);
        items.push({
          id: `pypi:${pyprojectRel}#build-system.requires/${name}`,
          ecosystem: 'pypi',
          name,
          locations: [`${pyprojectRel} ([build-system].requires)`],
          declared: constraint || 'unbounded',
          resolved: null,
          latest: null,
          status: 'current',
        });
      }
    }
  }

  // 3. Rust manifests (tools/play-metadata/Cargo.toml, extensions/nhl-adblock-native/Cargo.toml)
  const cargoManifests = [
    {
      manifest: 'tools/play-metadata/Cargo.toml',
      lock: 'tools/play-metadata/Cargo.lock',
    },
    {
      manifest: 'extensions/nhl-adblock-native/Cargo.toml',
      lock: 'extensions/nhl-adblock-native/Cargo.lock',
    },
  ];

  for (const { manifest, lock } of cargoManifests) {
    const manifestAbs = path.resolve(repoRoot, manifest);
    if (!fs.existsSync(manifestAbs)) continue;
    registerInput(manifest);
    registerInput(lock);

    const cargoText = fs.readFileSync(manifestAbs, 'utf8');
    const cargoToml = TOML.parse(cargoText) as Record<string, unknown>;

    const lockPackages: Record<string, string> = {};
    const lockAbs = path.resolve(repoRoot, lock);
    if (fs.existsSync(lockAbs)) {
      try {
        const lockText = fs.readFileSync(lockAbs, 'utf8');
        const lockToml = TOML.parse(lockText) as {
          package?: Array<{ name: string; version: string }>;
        };
        if (Array.isArray(lockToml.package)) {
          for (const pkg of lockToml.package) {
            if (pkg.name && pkg.version) {
              lockPackages[pkg.name] = pkg.version;
            }
          }
        }
      } catch {
        // Lock parse error handled
      }
    }

    const sections = ['dependencies', 'dev-dependencies', 'build-dependencies'];
    for (const section of sections) {
      const deps = cargoToml[section] as Record<string, unknown> | undefined;
      if (!deps || typeof deps !== 'object') continue;

      for (const [name, val] of Object.entries(deps)) {
        let declared = '';
        if (typeof val === 'string') {
          declared = val;
        } else if (
          val &&
          typeof val === 'object' &&
          typeof val.version === 'string'
        ) {
          declared = val.version;
        } else {
          continue;
        }

        const resolved = lockPackages[name] || null;
        items.push({
          id: `crates:${manifest}#${section}/${name}`,
          ecosystem: 'crates',
          name,
          locations: [`${manifest} ([${section}])`],
          declared,
          resolved,
          latest: null,
          status: 'current',
        });
      }
    }
  }

  // 4. Gradle settings and catalog
  const settingsRel = 'settings.gradle.kts';
  const settingsAbs = path.resolve(repoRoot, settingsRel);
  if (fs.existsSync(settingsAbs)) {
    registerInput(settingsRel);
    const settingsContent = fs.readFileSync(settingsAbs, 'utf8');
    const pluginMatch = settingsContent.match(
      /id\(["']app\.morphe\.patches["']\)\s+version\s+["']([^"']+)["']/,
    );
    if (pluginMatch) {
      items.push({
        id: `gradle:${settingsRel}#plugins/app.morphe.patches`,
        ecosystem: 'gradle',
        name: 'app.morphe.patches',
        locations: [`${settingsRel} (pluginManagement)`],
        declared: pluginMatch[1],
        resolved: pluginMatch[1],
        latest: null,
        status: 'current',
      });
    }
  }

  const catalogRel = 'gradle/libs.versions.toml';
  const catalogAbs = path.resolve(repoRoot, catalogRel);
  if (fs.existsSync(catalogAbs)) {
    registerInput(catalogRel);
    const catalogContent = fs.readFileSync(catalogAbs, 'utf8');
    const catalogToml = TOML.parse(catalogContent) as Record<string, unknown>;
    const versions = (catalogToml.versions as Record<string, string>) || {};
    const libraries =
      (catalogToml.libraries as Record<
        string,
        {
          module?: string;
          version?: string | { ref?: string };
          'version.ref'?: string;
        }
      >) || {};

    const usedVersions = new Set<string>();
    for (const [libName, libVal] of Object.entries(libraries)) {
      if (typeof libVal === 'object' && libVal !== null) {
        const mod = libVal.module || '';
        const vRef =
          typeof libVal.version === 'object' && libVal.version !== null
            ? libVal.version.ref
            : typeof libVal['version.ref'] === 'string'
              ? libVal['version.ref']
              : undefined;
        const versionStr =
          typeof vRef === 'string'
            ? versions[vRef]
            : typeof libVal.version === 'string'
              ? libVal.version
              : undefined;
        if (typeof versionStr === 'string') {
          if (typeof vRef === 'string') usedVersions.add(vRef);
          items.push({
            id: `gradle:${catalogRel}#libraries/${libName}`,
            ecosystem: 'gradle',
            name: mod || libName,
            locations: [`${catalogRel} (libraries.${libName})`],
            declared: versionStr,
            resolved: versionStr,
            latest: null,
            status: 'current',
          });
        }
      }
    }

    // Check for unused version catalog entries
    for (const [vKey, vVal] of Object.entries(versions)) {
      if (typeof vVal === 'string' && !usedVersions.has(vKey)) {
        items.push({
          id: `gradle:${catalogRel}#versions/${vKey}`,
          ecosystem: 'gradle',
          name: vKey,
          locations: [`${catalogRel} (versions.${vKey})`],
          declared: vVal,
          resolved: vVal,
          latest: null,
          status: 'unused',
          reason: 'Unused version catalog entry without consuming library',
        });
      }
    }
  }

  // 5. Gradle wrapper
  const wrapperPropsRel = 'gradle/wrapper/gradle-wrapper.properties';
  const wrapperPropsAbs = path.resolve(repoRoot, wrapperPropsRel);
  if (fs.existsSync(wrapperPropsAbs)) {
    registerInput(wrapperPropsRel);
    registerInput('gradle/wrapper/gradle-wrapper.jar');
    registerInput('gradlew');
    registerInput('gradlew.bat');
    const wrapperContent = fs.readFileSync(wrapperPropsAbs, 'utf8');
    const urlMatch = wrapperContent.match(
      /distributionUrl=.*gradle-([0-9.]+)-(?:bin|all)\.zip/,
    );
    const shaMatch = wrapperContent.match(
      /distributionSha256Sum=([a-f0-9]{64})/,
    );
    const version = urlMatch ? urlMatch[1] : 'unknown';
    items.push({
      id: 'tool:gradle',
      ecosystem: 'tool',
      name: 'gradle-wrapper',
      locations: [wrapperPropsRel],
      declared: version,
      resolved: shaMatch
        ? `${version} (${shaMatch[1].slice(0, 8)}...)`
        : version,
      latest: null,
      status: 'current',
    });
  }

  // 6. APK Lab Tools (tools/apk-lab/tools.lock.json)
  const toolLockRel = 'tools/apk-lab/tools.lock.json';
  const toolLockAbs = path.resolve(repoRoot, toolLockRel);
  if (fs.existsSync(toolLockAbs)) {
    registerInput(toolLockRel);
    const toolLockJson = JSON.parse(fs.readFileSync(toolLockAbs, 'utf8'));
    const tools =
      (toolLockJson.tools as Record<string, { version?: string }>) || {};
    for (const [toolName, toolDef] of Object.entries(tools)) {
      if (typeof toolDef === 'object' && toolDef !== null) {
        items.push({
          id: `tool:apk-lab/${toolName}`,
          ecosystem: 'tool',
          name: toolName,
          locations: [`${toolLockRel} (tools.${toolName})`],
          declared: String(toolDef.version || ''),
          resolved: String(toolDef.version || ''),
          latest: null,
          status: 'current',
        });
      }
    }
  }

  // 7. ktlint in scripts/audit.ts
  const auditScriptRel = 'scripts/audit.ts';
  const auditScriptAbs = path.resolve(repoRoot, auditScriptRel);
  if (fs.existsSync(auditScriptAbs)) {
    registerInput(auditScriptRel);
    const auditText = fs.readFileSync(auditScriptAbs, 'utf8');
    const ktlintVersionMatch =
      auditText.match(/const\s+KTLINT_VERSION\s*=\s*'([^']+)'/) ||
      auditText.match(/KTLINT_([0-9_]+)_SHA256/) ||
      auditText.match(/ktlint\/releases\/download\/([0-9.]+)\//);
    const ktlintVersion = ktlintVersionMatch
      ? (ktlintVersionMatch[1] || '').replace(/_/g, '.')
      : '1.5.0';
    items.push({
      id: 'tool:ktlint',
      ecosystem: 'tool',
      name: 'ktlint',
      locations: [`${auditScriptRel} (KTLINT_VERSION)`],
      declared: ktlintVersion,
      resolved: ktlintVersion,
      latest: null,
      status: 'current',
    });
  }

  // 8. Workflows external actions and pre-commit hooks
  const workflowsDir = path.resolve(repoRoot, '.github/workflows');
  const actionLocations: Record<
    string,
    Array<{ file: string; line: number; ref: string }>
  > = {};
  const workflowInputs: Record<
    string,
    Array<{ file: string; line: number; val: string }>
  > = {};

  if (fs.existsSync(workflowsDir)) {
    const files = fs
      .readdirSync(workflowsDir)
      .filter((f) => f.endsWith('.yml') || f.endsWith('.yaml'));
    for (const file of files) {
      const relWorkflow = `.github/workflows/${file}`;
      registerInput(relWorkflow);
      const content = fs.readFileSync(path.resolve(workflowsDir, file), 'utf8');
      const lines = content.split('\n');
      for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        const usesMatch =
          line.match(/^\s*-\s+name:.*?\n\s+uses:\s*([^#\s]+)/) ||
          line.match(/^\s*uses:\s*([^#\s]+)/);
        if (usesMatch) {
          const fullRef = usesMatch[1];
          if (!fullRef.startsWith('./') && !fullRef.startsWith('docker://')) {
            const atIdx = fullRef.indexOf('@');
            if (atIdx > 0) {
              const actionName = fullRef.slice(0, atIdx);
              const ref = fullRef.slice(atIdx + 1);
              if (!actionLocations[actionName])
                actionLocations[actionName] = [];
              actionLocations[actionName].push({
                file: relWorkflow,
                line: i + 1,
                ref,
              });
            }
          }
        }

        // Check toolchain inputs
        const javaMatch = line.match(/java-version:\s*['"]?([0-9]+)['"]?/);
        if (javaMatch) {
          if (!workflowInputs['tool:java']) workflowInputs['tool:java'] = [];
          workflowInputs['tool:java'].push({
            file: relWorkflow,
            line: i + 1,
            val: javaMatch[1],
          });
        }
        const pyMatch = line.match(/python-version:\s*['"]?([0-9.]+)['"]?/);
        if (pyMatch) {
          if (!workflowInputs['tool:python'])
            workflowInputs['tool:python'] = [];
          workflowInputs['tool:python'].push({
            file: relWorkflow,
            line: i + 1,
            val: pyMatch[1],
          });
        }
        const bunMatch = line.match(
          /bun-version:\s*['"]?([a-zA-Z0-9_-]+)['"]?/,
        );
        if (bunMatch) {
          if (!workflowInputs['tool:bun']) workflowInputs['tool:bun'] = [];
          workflowInputs['tool:bun'].push({
            file: relWorkflow,
            line: i + 1,
            val: bunMatch[1],
          });
        }
        if (
          line.includes('setup-uv') ||
          (line.includes('version:') &&
            lines[Math.max(0, i - 1)].includes('setup-uv'))
        ) {
          // Handled via action or tool:uv
        }
        const nodeMatch = line.match(/node-version:\s*['"]?([^'"]+)['"]?/);
        if (nodeMatch) {
          if (!workflowInputs['tool:node']) workflowInputs['tool:node'] = [];
          workflowInputs['tool:node'].push({
            file: relWorkflow,
            line: i + 1,
            val: nodeMatch[1],
          });
        }
        const ndkMatch = line.match(/ndk-version:\s*['"]?([^'"]+)['"]?/);
        if (ndkMatch) {
          if (!workflowInputs['tool:ndk-label'])
            workflowInputs['tool:ndk-label'] = [];
          workflowInputs['tool:ndk-label'].push({
            file: relWorkflow,
            line: i + 1,
            val: ndkMatch[1],
          });
        }
      }
    }
  }

  // Pre-commit hooks (.pre-commit-config.yaml)
  const preCommitRel = '.pre-commit-config.yaml';
  const preCommitAbs = path.resolve(repoRoot, preCommitRel);
  if (fs.existsSync(preCommitAbs)) {
    registerInput(preCommitRel);
    const pcText = fs.readFileSync(preCommitAbs, 'utf8');
    const pcTomlOrYaml = pcText.split('\n');
    let currentRepo = '';
    for (let i = 0; i < pcTomlOrYaml.length; i++) {
      const line = pcTomlOrYaml[i];
      const repoMatch = line.match(/^\s*-\s+repo:\s*(\S+)/);
      if (repoMatch) {
        currentRepo = repoMatch[1];
      }
      const revMatch = line.match(/^\s*rev:\s*(\S+)/);
      if (revMatch && currentRepo && currentRepo !== 'local') {
        const repoClean = currentRepo.replace(/^https:\/\/github\.com\//, '');
        items.push({
          id: `hook:${repoClean}`,
          ecosystem: 'hook',
          name: repoClean,
          locations: [`${preCommitRel}:${i + 1}`],
          declared: revMatch[1],
          resolved: revMatch[1],
          latest: null,
          status: 'current',
        });
        currentRepo = '';
      }
    }
  }

  // Create items for GitHub Actions
  for (const [actionName, locs] of Object.entries(actionLocations)) {
    if (actionName === 'dtolnay/rust-toolchain') {
      // Coupled to Rust native toolchain
      continue;
    }
    const declaredRefs = [...new Set(locs.map((l) => l.ref))];
    const declared = declaredRefs.join(', ');
    items.push({
      id: `action:${actionName}`,
      ecosystem: 'action',
      name: actionName,
      locations: locs.map((l) => `${l.file}:${l.line}`),
      declared,
      resolved: declared,
      latest: null,
      status: 'current',
    });
  }

  // 9. Coupled toolchain pins
  // Rust Native Toolchain
  const nhlToolchainRel = 'extensions/nhl-adblock-native/rust-toolchain.toml';
  const nhlToolchainAbs = path.resolve(repoRoot, nhlToolchainRel);
  let rustNativeChannel = '1.97.1';
  if (fs.existsSync(nhlToolchainAbs)) {
    registerInput(nhlToolchainRel);
    const tcText = fs.readFileSync(nhlToolchainAbs, 'utf8');
    const tcToml = TOML.parse(tcText) as { toolchain?: { channel?: string } };
    rustNativeChannel = String(tcToml.toolchain?.channel || rustNativeChannel);
  }
  const rustActionLocs = (actionLocations['dtolnay/rust-toolchain'] || []).map(
    (l) => `${l.file}:${l.line}`,
  );
  if (fs.existsSync(nhlToolchainAbs) || rustActionLocs.length > 0) {
    items.push({
      id: 'tool:rust-native',
      ecosystem: 'tool',
      name: 'rust-toolchain-native',
      locations: [nhlToolchainRel, ...rustActionLocs],
      declared: rustNativeChannel,
      resolved: rustNativeChannel,
      latest: null,
      status: 'current',
    });
  }

  // Rust play-metadata toolchain (moving stable)
  const playToolchainRel = 'tools/play-metadata/rust-toolchain.toml';
  const playToolchainAbs = path.resolve(repoRoot, playToolchainRel);
  if (fs.existsSync(playToolchainAbs)) {
    registerInput(playToolchainRel);
    items.push({
      id: 'tool:rust-play-metadata',
      ecosystem: 'tool',
      name: 'rust-toolchain-play-metadata',
      locations: [playToolchainRel],
      declared: 'stable',
      resolved: 'stable',
      latest: null,
      status: 'moving',
      reason: 'Channel follows Rust stable release train',
    });
  }

  // NDK: patches/build.gradle.kts + workflow ndk-version
  const patchBuildRel = 'patches/build.gradle.kts';
  const patchBuildAbs = path.resolve(repoRoot, patchBuildRel);
  let ndkVersionNum = '28.2.13676358';
  if (fs.existsSync(patchBuildAbs)) {
    registerInput(patchBuildRel);
    const buildText = fs.readFileSync(patchBuildAbs, 'utf8');
    const m = buildText.match(/REQUIRED_NDK_VERSION\s*=\s*["']([^"']+)["']/);
    if (m) ndkVersionNum = m[1];
  }
  const ndkLabels = (workflowInputs['tool:ndk-label'] || []).map((x) => x.val);
  const ndkLabel = ndkLabels[0] || 'r28c';
  const ndkLocs = [
    `${patchBuildRel} (REQUIRED_NDK_VERSION)`,
    ...(workflowInputs['tool:ndk-label'] || []).map(
      (x) => `${x.file}:${x.line}`,
    ),
  ];
  if (fs.existsSync(patchBuildAbs) || ndkLabels.length > 0) {
    items.push({
      id: 'tool:ndk',
      ecosystem: 'tool',
      name: 'android-ndk',
      locations: ndkLocs,
      declared: `${ndkLabel} (${ndkVersionNum})`,
      resolved: `${ndkLabel} (${ndkVersionNum})`,
      latest: null,
      status: 'current',
    });
  }
  // Android build-tools in apk_lab/inspection.py
  const inspectionRel = 'tools/apk-lab/apk_lab/inspection.py';
  const inspectionAbs = path.resolve(repoRoot, inspectionRel);
  if (fs.existsSync(inspectionAbs)) {
    registerInput(inspectionRel);
    const inspText = fs.readFileSync(inspectionAbs, 'utf8');
    const btMatch = inspText.match(/"build-tools"\s*\/\s*"([0-9.]+)"/);
    const btVersion = btMatch ? btMatch[1] : '36.0.0';
    items.push({
      id: 'tool:android-build-tools',
      ecosystem: 'tool',
      name: 'android-build-tools',
      locations: [`${inspectionRel} (find_build_tools_bin)`],
      declared: btVersion,
      resolved: btVersion,
      latest: null,
      status: 'current',
    });
  }

  // Workflow language versions: tool:java, tool:python, tool:node, tool:bun
  if (workflowInputs['tool:java']?.length) {
    items.push({
      id: 'tool:java',
      ecosystem: 'tool',
      name: 'java-temurin',
      locations: workflowInputs['tool:java'].map((l) => `${l.file}:${l.line}`),
      declared: workflowInputs['tool:java'][0].val,
      resolved: workflowInputs['tool:java'][0].val,
      latest: null,
      status: 'current',
    });
  }
  if (workflowInputs['tool:python']?.length) {
    items.push({
      id: 'tool:python',
      ecosystem: 'tool',
      name: 'cpython',
      locations: workflowInputs['tool:python'].map(
        (l) => `${l.file}:${l.line}`,
      ),
      declared: workflowInputs['tool:python'][0].val,
      resolved: workflowInputs['tool:python'][0].val,
      latest: null,
      status: 'current',
    });
  }
  if (workflowInputs['tool:bun']?.length) {
    items.push({
      id: 'tool:bun',
      ecosystem: 'tool',
      name: 'bun-cli',
      locations: workflowInputs['tool:bun'].map((l) => `${l.file}:${l.line}`),
      declared: 'latest',
      resolved: 'latest',
      latest: null,
      status: 'moving',
      reason: 'Channel follows Bun latest releases in CI',
    });
  }
  if (workflowInputs['tool:node']?.length) {
    items.push({
      id: 'tool:node',
      ecosystem: 'tool',
      name: 'node-lts',
      locations: workflowInputs['tool:node'].map((l) => `${l.file}:${l.line}`),
      declared: 'lts/*',
      resolved: 'lts/*',
      latest: null,
      status: 'moving',
      reason: 'Channel follows Node.js LTS releases in release CI',
    });
  }

  // 10. Embedded CDN Leaflet in OsmMapView.java
  const osmMapRel =
    'extensions/extension/src/main/java/app/aidan/extension/aftership/OsmMapView.java';
  const osmMapAbs = path.resolve(repoRoot, osmMapRel);
  if (fs.existsSync(osmMapAbs)) {
    registerInput(osmMapRel);
    const osmText = fs.readFileSync(osmMapAbs, 'utf8');
    const leafletMatch = osmText.match(/unpkg\.com\/leaflet@([0-9.]+)\//);
    const leafletVer = leafletMatch ? leafletMatch[1] : '1.9.4';
    items.push({
      id: 'embedded:leaflet',
      ecosystem: 'embedded',
      name: 'leaflet',
      locations: [`${osmMapRel}:162`, `${osmMapRel}:163`],
      declared: leafletVer,
      resolved: leafletVer,
      latest: null,
      status: 'current',
    });
  }

  // 11. Workflow moving package installs
  const syncIconsRel = '.github/workflows/sync-app-icons.yml';
  if (fs.existsSync(path.resolve(repoRoot, syncIconsRel))) {
    registerInput(syncIconsRel);
    items.push({
      id: `pypi:${syncIconsRel}#pip/Pillow`,
      ecosystem: 'pypi',
      name: 'Pillow',
      locations: [`${syncIconsRel}:50`],
      declared: 'latest',
      resolved: 'latest',
      latest: null,
      status: 'moving',
      reason: 'Unversioned pip install in sync-app-icons workflow',
    });
  }

  const releaseWorkflowRel = '.github/workflows/release.yml';
  if (fs.existsSync(path.resolve(repoRoot, releaseWorkflowRel))) {
    registerInput(releaseWorkflowRel);
    items.push({
      id: `npm:${releaseWorkflowRel}#extra_plugins/@semantic-release/github`,
      ecosystem: 'npm',
      name: '@semantic-release/github',
      locations: [`${releaseWorkflowRel}:79`],
      declared: 'latest',
      resolved: 'latest',
      latest: null,
      status: 'moving',
      reason: 'Moving @latest plugin in semantic-release workflow',
    });
  }

  // 12. C++ Native CMake FetchContent
  const cmakeListsRel = 'extensions/adobescan-pdf-native/CMakeLists.txt';
  const cmakeListsAbs = path.resolve(repoRoot, cmakeListsRel);
  if (fs.existsSync(cmakeListsAbs)) {
    registerInput(cmakeListsRel);
    const cmakeContent = fs.readFileSync(cmakeListsAbs, 'utf8');
    const fetchBlockRegex =
      /FetchContent_Declare\s*\(\s*([a-zA-Z0-9_-]+)[\s\S]*?\)/g;
    let match: RegExpExecArray | null;
    while ((match = fetchBlockRegex.exec(cmakeContent)) !== null) {
      const block = match[0];
      const name = match[1];
      const urlMatch = block.match(/URL\s+([^\s)]+)/);
      if (urlMatch) {
        const url = urlMatch[1];
        const versionMatch = url.match(
          /(?:\/download\/|\/archive\/refs\/tags\/|\/tags\/)v?([0-9]+\.[0-9]+(?:\.[0-9]+)?(?:-[a-zA-Z0-9.]+)?)/,
        );
        const version = versionMatch ? versionMatch[1] : '';
        const lineIndex = cmakeContent.slice(0, match.index).split('\n').length;
        items.push({
          id: `cmake:${cmakeListsRel}#fetch/${name}`,
          ecosystem: 'cmake',
          name,
          locations: [`${cmakeListsRel}:${lineIndex}`],
          declared: version,
          resolved: version,
          latest: null,
          status: 'current',
          sourceUrl: url,
        });
      }
    }
  }

  // Policy hold application and validation
  registerInput('dependency-policy.json');
  const itemsById: Record<string, DependencyItem> = {};
  for (const item of items) {
    itemsById[item.id] = item;
  }

  for (const hold of policy.holds) {
    const item = itemsById[hold.id];
    if (!item) {
      throw new Error(
        `Policy hold references unknown dependency id: ${hold.id}`,
      );
    }
    if (item.declared !== hold.value && item.resolved !== hold.value) {
      throw new Error(
        `Policy hold for '${hold.id}' expects value '${hold.value}', but found declared '${item.declared}' (resolved '${item.resolved}')`,
      );
    }
    item.status = 'held';
    item.reason = hold.reason;
  }

  // Generate proposal inputs (files with SHA-256)
  const sortedInputPaths = Array.from(inputFiles).sort();
  const inputs: ProposalInput[] = sortedInputPaths.map((rel) => ({
    path: rel,
    sha256: computeFileSha256(path.resolve(repoRoot, rel)),
  }));

  return { items, inputs };
}
