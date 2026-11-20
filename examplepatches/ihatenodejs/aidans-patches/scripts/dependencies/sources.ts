import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { semver } from 'bun';
import type { DependencyItem } from './model';
export type FetchFn = (url: string, init?: RequestInit) => Promise<Response>;

export interface SourceResolverOptions {
  fetch?: FetchFn;
  githubToken?: string;
  githubActor?: string;
  npmRegistry?: string;
}

export function compareSemver(vA: string, vB: string): number {
  const cleanA = vA.replace(/^[v^~=>< ]+/, '').trim();
  const cleanB = vB.replace(/^[v^~=>< ]+/, '').trim();
  try {
    return semver.order(cleanA, cleanB);
  } catch {
    return cleanA.localeCompare(cleanB, undefined, { numeric: true });
  }
}

export function parsePep440(v: string): number[] {
  const clean = v.replace(/^[v=><~^ ]+/, '').trim();
  const base = clean.split(/[+a-zA-Z-]/)[0];
  return base.split('.').map((p) => parseInt(p, 10) || 0);
}

export function comparePep440(vA: string, vB: string): number {
  const pA = parsePep440(vA);
  const pB = parsePep440(vB);
  const maxLen = Math.max(pA.length, pB.length);
  for (let i = 0; i < maxLen; i++) {
    const numA = pA[i] || 0;
    const numB = pB[i] || 0;
    if (numA > numB) return 1;
    if (numA < numB) return -1;
  }
  return 0;
}

export function loadGradleCredentials(): { user?: string; key?: string } {
  const candidates = [
    path.join(process.cwd(), 'local.properties'),
    path.join(process.cwd(), 'gradle.properties'),
    path.join(os.homedir(), '.gradle', 'gradle.properties'),
  ];
  let user: string | undefined;
  let key: string | undefined;
  for (const c of candidates) {
    if (fs.existsSync(c)) {
      try {
        const text = fs.readFileSync(c, 'utf8');
        for (const line of text.split('\n')) {
          if (line.startsWith('gpr.user='))
            user = user || line.split('=')[1].trim();
          if (line.startsWith('gpr.key='))
            key = key || line.split('=')[1].trim();
        }
      } catch {
        // Ignore file read error
      }
    }
  }
  return { user, key };
}

export class SourceManager {
  private fetch: FetchFn;
  private githubToken?: string;
  private githubActor?: string;
  private npmRegistry: string;
  private cache = new Map<string, Promise<unknown>>();
  private inFlightCount = 0;
  private queue: Array<() => void> = [];
  private static MAX_CONCURRENCY = 6;

  constructor(opts: SourceResolverOptions = {}) {
    this.fetch = opts.fetch || globalThis.fetch;
    const gpr = loadGradleCredentials();
    this.githubToken = opts.githubToken || process.env.GITHUB_TOKEN || gpr.key;
    this.githubActor =
      opts.githubActor ||
      process.env.GITHUB_ACTOR ||
      process.env.GPR_USER ||
      gpr.user ||
      'ihatenodejs';
    this.npmRegistry = (
      opts.npmRegistry ||
      process.env.npm_config_registry ||
      'https://registry.npmjs.org'
    ).replace(/\/$/, '');
  }

  private async schedule<T>(task: () => Promise<T>): Promise<T> {
    if (this.inFlightCount >= SourceManager.MAX_CONCURRENCY) {
      const { promise, resolve } = Promise.withResolvers<void>();
      this.queue.push(resolve);
      await promise;
    }
    this.inFlightCount++;
    try {
      return await task();
    } finally {
      this.inFlightCount--;
      const next = this.queue.shift();
      if (next) next();
    }
  }

  private fetchJson<T>(
    url: string,
    headers: Record<string, string> = {},
  ): Promise<T> {
    const cacheKey = `json:${url}`;
    if (this.cache.has(cacheKey)) {
      return this.cache.get(cacheKey) as Promise<T>;
    }
    const prom = this.schedule(async () => {
      const res = await this.fetch(url, {
        headers: {
          'User-Agent': 'aidans-patches-deps/1.0',
          ...headers,
        },
        signal: AbortSignal.timeout(20000),
      });
      if (!res.ok) {
        throw new Error(`HTTP ${res.status} ${res.statusText} fetching ${url}`);
      }
      return (await res.json()) as T;
    });
    this.cache.set(cacheKey, prom);
    return prom;
  }

  private fetchText(
    url: string,
    headers: Record<string, string> = {},
  ): Promise<string> {
    const cacheKey = `text:${url}`;
    if (this.cache.has(cacheKey)) {
      return this.cache.get(cacheKey) as Promise<string>;
    }
    const prom = this.schedule(async () => {
      const res = await this.fetch(url, {
        headers: {
          'User-Agent': 'aidans-patches-deps/1.0',
          ...headers,
        },
        signal: AbortSignal.timeout(20000),
      });
      if (!res.ok) {
        throw new Error(`HTTP ${res.status} ${res.statusText} fetching ${url}`);
      }
      return await res.text();
    });
    this.cache.set(cacheKey, prom);
    return prom;
  }

  // --- NPM ---
  async resolveNpm(
    name: string,
  ): Promise<{ latest: string; sourceUrl: string }> {
    const encoded = name.startsWith('@')
      ? `@${encodeURIComponent(name.slice(1))}`
      : encodeURIComponent(name);
    const url = `${this.npmRegistry}/${encoded}`;
    const data = await this.fetchJson<{
      'dist-tags'?: Record<string, string>;
      versions?: Record<string, unknown>;
    }>(url);
    const distTags = data['dist-tags'] || {};
    let latest = distTags.latest;
    if (!latest || latest.includes('-')) {
      const versions = Object.keys(data.versions || {}).filter(
        (v) => !v.includes('-'),
      );
      if (versions.length > 0) {
        versions.sort(compareSemver);
        latest = versions[versions.length - 1];
      }
    }
    if (!latest) {
      throw new Error(`No stable release found for npm package ${name}`);
    }
    return { latest, sourceUrl: `https://www.npmjs.com/package/${name}` };
  }

  // --- GitHub Branch (e.g. @MorpheApp/changelog #bundle) ---
  async resolveGitBranch(
    owner: string,
    repo: string,
    branch: string,
  ): Promise<{ latest: string; sourceUrl: string }> {
    const url = `https://api.github.com/repos/${owner}/${repo}/commits/${branch}`;
    const headers: Record<string, string> = {
      Accept: 'application/vnd.github.v3+json',
    };
    if (this.githubToken) headers.Authorization = `Bearer ${this.githubToken}`;
    const data = await this.fetchJson<{ sha?: string }>(url, headers);
    const sha = data.sha;
    if (!sha)
      throw new Error(
        `Could not resolve commit for branch ${branch} on ${owner}/${repo}`,
      );
    return {
      latest: sha,
      sourceUrl: `https://github.com/${owner}/${repo}/tree/${branch}`,
    };
  }

  // --- PyPI ---
  async resolvePypi(
    name: string,
    projectRequiresPython = '>=3.12',
  ): Promise<{
    latest: string;
    blocked?: boolean;
    reason?: string;
    sourceUrl: string;
  }> {
    const url = `https://pypi.org/pypi/${name}/json`;
    const data = await this.fetchJson<{
      releases?: Record<
        string,
        Array<{ yanked?: boolean; requires_python?: string }>
      >;
    }>(url);
    const releases = data.releases || {};
    const validVersions: string[] = [];
    const blockedVersions: string[] = [];

    for (const [ver, files] of Object.entries(releases)) {
      if (
        ver.includes('a') ||
        ver.includes('b') ||
        ver.includes('rc') ||
        ver.includes('dev')
      )
        continue;
      if (Array.isArray(files) && files.length > 0) {
        const isYanked = files.some((f) => f.yanked === true);
        if (isYanked) continue;
        const reqPy = files[0]?.requires_python;
        let isBlocked = false;
        if (reqPy) {
          const match = reqPy.match(/(?:>=|>|==)\s*3\.([0-9]+)/);
          if (match && parseInt(match[1], 10) > 12) {
            isBlocked = true;
          }
        }
        if (isBlocked) {
          blockedVersions.push(ver);
        } else {
          validVersions.push(ver);
        }
      }
    }
    validVersions.sort(comparePep440);
    const chosen = validVersions[validVersions.length - 1];
    blockedVersions.sort(comparePep440);
    const newestBlocked = blockedVersions[blockedVersions.length - 1];

    if (
      newestBlocked &&
      (!chosen || comparePep440(newestBlocked, chosen) > 0)
    ) {
      return {
        latest: newestBlocked,
        blocked: true,
        reason: `Latest release ${newestBlocked} requires newer Python than ${projectRequiresPython}`,
        sourceUrl: `https://pypi.org/project/${name}/`,
      };
    }

    if (!chosen) {
      throw new Error(
        `No stable non-yanked release found for PyPI package ${name}`,
      );
    }
    return { latest: chosen, sourceUrl: `https://pypi.org/project/${name}/` };
  }

  // --- Crates.io ---
  async resolveCrates(
    name: string,
  ): Promise<{ latest: string; sourceUrl: string }> {
    const url = `https://crates.io/api/v1/crates/${name}`;
    const data = await this.fetchJson<{
      versions?: Array<{ num: string; yanked: boolean }>;
    }>(url);
    const versions = data.versions || [];
    const stables = versions
      .filter((v) => !v.yanked && !v.num.includes('-'))
      .map((v) => v.num);
    if (stables.length === 0) {
      throw new Error(`No non-yanked stable releases found for crate ${name}`);
    }
    stables.sort(compareSemver);
    return {
      latest: stables[stables.length - 1],
      sourceUrl: `https://crates.io/crates/${name}`,
    };
  }

  // --- Maven (Central or GitHub Packages) ---
  async resolveMaven(
    group: string,
    artifact: string,
    repoUrl?: string,
  ): Promise<{ latest: string; sourceUrl: string }> {
    const groupPath = group.replace(/\./g, '/');
    let metadataUrl: string;
    const headers: Record<string, string> = {};

    if (repoUrl && repoUrl.includes('maven.pkg.github.com')) {
      if (!this.githubToken) {
        throw new Error(
          `GitHub Packages authentication required for ${group}:${artifact} (GITHUB_TOKEN/gpr.key not set)`,
        );
      }
      const token = Buffer.from(
        `${this.githubActor || 'token'}:${this.githubToken}`,
      ).toString('base64');
      headers.Authorization = `Basic ${token}`;
      metadataUrl = `${repoUrl.replace(/\/$/, '')}/${groupPath}/${artifact}/maven-metadata.xml`;
    } else {
      metadataUrl = `https://repo1.maven.org/maven2/${groupPath}/${artifact}/maven-metadata.xml`;
    }

    const xml = await this.fetchText(metadataUrl, headers);
    const releaseMatch = xml.match(/<release>([^<]+)<\/release>/);
    let chosen = releaseMatch ? releaseMatch[1] : null;

    if (
      !chosen ||
      chosen.includes('-SNAPSHOT') ||
      chosen.includes('-alpha') ||
      chosen.includes('-beta')
    ) {
      const versionMatches = [
        ...xml.matchAll(/<version>([^<]+)<\/version>/g),
      ].map((m) => m[1]);
      const stables = versionMatches.filter(
        (v) =>
          !v.includes('SNAPSHOT') &&
          !v.includes('alpha') &&
          !v.includes('beta') &&
          !v.includes('rc'),
      );
      if (stables.length > 0) {
        stables.sort(compareSemver);
        chosen = stables[stables.length - 1];
      }
    }

    if (!chosen) {
      throw new Error(
        `Could not parse stable release from maven-metadata.xml at ${metadataUrl}`,
      );
    }
    return { latest: chosen, sourceUrl: metadataUrl };
  }

  // --- GitHub Releases / Tags ---
  async resolveGitHubRelease(
    owner: string,
    repo: string,
    tagPrefix = '',
  ): Promise<{ latest: string; sourceUrl: string }> {
    const url = `https://api.github.com/repos/${owner}/${repo}/releases`;
    const headers: Record<string, string> = {
      Accept: 'application/vnd.github.v3+json',
    };
    if (this.githubToken) headers.Authorization = `Bearer ${this.githubToken}`;

    try {
      const releases = await this.fetchJson<
        Array<{ tag_name: string; draft: boolean; prerelease: boolean }>
      >(url, headers);
      const stableReleases = releases.filter(
        (r) =>
          !r.draft &&
          !r.prerelease &&
          (!tagPrefix || r.tag_name.startsWith(tagPrefix)),
      );
      if (stableReleases.length > 0) {
        const tag = stableReleases[0].tag_name;
        const ver = tag
          .replace(new RegExp(`^${tagPrefix}`), '')
          .replace(/^v/, '');
        return {
          latest: ver,
          sourceUrl: `https://github.com/${owner}/${repo}/releases/tag/${tag}`,
        };
      }
    } catch {
      // Fallback to tags
    }

    // Fallback: list tags
    const tagsUrl = `https://api.github.com/repos/${owner}/${repo}/tags`;
    const tags = await this.fetchJson<Array<{ name: string }>>(
      tagsUrl,
      headers,
    );
    const validTags = tags
      .map((t) => t.name as string)
      .filter(
        (t) =>
          !t.includes('alpha') &&
          !t.includes('beta') &&
          !t.includes('rc') &&
          (!tagPrefix || t.startsWith(tagPrefix)),
      );
    if (validTags.length === 0) {
      throw new Error(`No stable tags found for ${owner}/${repo}`);
    }
    validTags.sort(compareSemver);
    const newestTag = validTags[validTags.length - 1];
    const ver = newestTag
      .replace(new RegExp(`^${tagPrefix}`), '')
      .replace(/^v/, '');
    return {
      latest: ver,
      sourceUrl: `https://github.com/${owner}/${repo}/releases/tag/${newestTag}`,
    };
  }

  // --- Gradle Wrapper ---
  async resolveGradleWrapper(): Promise<{
    latest: string;
    sha256: string;
    sourceUrl: string;
  }> {
    const url = 'https://services.gradle.org/versions/current';
    const data = await this.fetchJson<{ version: string }>(url);
    const version = data.version;
    const shaUrl = `https://services.gradle.org/distributions/gradle-${version}-bin.zip.sha256`;
    const sha256 = (await this.fetchText(shaUrl)).trim();
    return {
      latest: version,
      sha256,
      sourceUrl: `https://gradle.org/releases/`,
    };
  }

  // --- Rust Toolchain ---
  async resolveRustStable(): Promise<{ latest: string; sourceUrl: string }> {
    const url = 'https://static.rust-lang.org/dist/channel-rust-stable.toml';
    const text = await this.fetchText(url);
    const m =
      text.match(/#\s*Rust\s*([0-9.]+)/) ||
      text.match(/pkg\.rust\.version\s*=\s*"([0-9.]+)/);
    const ver = m ? m[1] : '1.85.0';
    return {
      latest: ver,
      sourceUrl: 'https://github.com/rust-lang/rust/releases',
    };
  }

  // --- Adoptium Java ---
  async resolveJavaAdoptium(): Promise<{ latest: string; sourceUrl: string }> {
    const url = 'https://api.adoptium.net/v3/info/available_releases';
    const data = await this.fetchJson<{ available_lts_releases?: number[] }>(
      url,
    );
    const ga = data.available_lts_releases || [21, 25];
    const latestLts = String(Math.max(...ga));
    return {
      latest: latestLts,
      sourceUrl: 'https://adoptium.net/temurin/releases/',
    };
  }

  // --- Node LTS ---
  async resolveNodeLts(): Promise<{ latest: string; sourceUrl: string }> {
    const url = 'https://nodejs.org/dist/index.json';
    const releases =
      await this.fetchJson<Array<{ version?: string; lts: boolean | string }>>(
        url,
      );
    const ltsReleases = releases.filter((r) => Boolean(r.lts));
    const latestLts = ltsReleases[0]?.version?.replace(/^v/, '') || '22.14.0';
    return {
      latest: `lts/* (${latestLts})`,
      sourceUrl: 'https://nodejs.org/en/about/previous-releases',
    };
  }

  // --- Bun Latest ---
  async resolveBunLatest(): Promise<{ latest: string; sourceUrl: string }> {
    const rel = await this.resolveGitHubRelease('oven-sh', 'bun', 'bun-v');
    return { latest: `latest (${rel.latest})`, sourceUrl: rel.sourceUrl };
  }

  // --- NDK Latest ---
  async resolveNdk(): Promise<{
    label: string;
    revision: string;
    sourceUrl: string;
  }> {
    // Current stable LTS NDK is r28c (28.2.13676358)
    return {
      label: 'r28c',
      revision: '28.2.13676358',
      sourceUrl: 'https://developer.android.com/ndk/downloads',
    };
  }

  // --- Android Build Tools ---
  async resolveAndroidBuildTools(): Promise<{
    latest: string;
    sourceUrl: string;
  }> {
    return {
      latest: '36.0.0',
      sourceUrl: 'https://developer.android.com/tools/releases/build-tools',
    };
  }
}

export async function resolveDependencyItem(
  item: DependencyItem,
  sources: SourceManager,
): Promise<void> {
  const start = performance.now();
  try {
    // 1. JavaScript (NPM)
    if (item.ecosystem === 'npm') {
      if (item.declared.startsWith('git+')) {
        const branchMatch = item.declared.match(/#([a-zA-Z0-9_-]+)$/);
        const branch = branchMatch ? branchMatch[1] : 'bundle';
        const res = await sources.resolveGitBranch(
          'MorpheApp',
          'changelog',
          branch,
        );
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          if (item.resolved && item.resolved !== res.latest) {
            item.status = 'update';
          } else {
            item.status = 'current';
          }
        }
      } else if (item.declared === 'latest') {
        const res = await sources.resolveNpm(item.name);
        item.latest = `latest (${res.latest})`;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') item.status = 'moving';
      } else {
        const res = await sources.resolveNpm(item.name);
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          const compDeclared = compareSemver(res.latest, item.declared);
          const compResolved = item.resolved
            ? compareSemver(res.latest, item.resolved)
            : compDeclared;
          if (compDeclared > 0 || compResolved > 0) {
            item.status = 'update';
          } else if (compDeclared < 0) {
            item.status = 'ahead';
          } else {
            item.status = 'current';
          }
        }
      }
    }

    // 2. Python (PyPI)
    else if (item.ecosystem === 'pypi') {
      if (item.declared === 'latest' || item.declared === 'unbounded') {
        const res = await sources.resolvePypi(item.name);
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status = item.declared === 'latest' ? 'moving' : 'update';
        }
      } else {
        const res = await sources.resolvePypi(item.name);
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (res.blocked) {
          item.status = 'blocked';
          item.reason = res.reason;
        } else if (item.status !== 'held') {
          const comp = comparePep440(res.latest, item.declared);
          if (comp > 0) {
            item.status = 'update';
          } else if (comp < 0) {
            item.status = 'ahead';
          } else {
            item.status = 'current';
          }
        }
      }
    }

    // 3. Rust (crates.io)
    else if (item.ecosystem === 'crates') {
      const res = await sources.resolveCrates(item.name);
      item.latest = res.latest;
      item.sourceUrl = res.sourceUrl;
      if (item.status !== 'held') {
        const comp = compareSemver(res.latest, item.declared);
        if (comp > 0) {
          item.status = 'update';
        } else if (comp < 0) {
          item.status = 'ahead';
        } else {
          item.status = 'current';
        }
      }
    }

    // 4. Gradle (Morphe repo or Maven Central)
    else if (item.ecosystem === 'gradle') {
      if (item.status === 'unused') {
        // Leave unused entries as is
      } else if (item.name.includes('morphe')) {
        const res = await sources.resolveMaven(
          item.name === 'app.morphe.patches'
            ? 'app.morphe.patches'
            : 'app.morphe',
          item.name === 'app.morphe.patches'
            ? 'app.morphe.patches.gradle.plugin'
            : 'morphe-patcher',
          'https://maven.pkg.github.com/MorpheApp/registry',
        );
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status =
            compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
        }
      } else if (item.name.includes(':')) {
        const [group, artifact] = item.name.split(':');
        const res = await sources.resolveMaven(group, artifact);
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          const ord = compareSemver(res.latest, item.declared);
          item.status = ord > 0 ? 'update' : ord < 0 ? 'ahead' : 'current';
        }
      }
    }

    // 5. GitHub Actions & Hooks
    else if (item.ecosystem === 'action') {
      const [owner, repo] = item.name.split('/');
      const res = await sources.resolveGitHubRelease(owner, repo);
      item.latest = res.latest;
      item.sourceUrl = res.sourceUrl;
      if (item.status !== 'held') {
        const cleanDeclared = item.declared.replace(/^v/, '');
        const cleanLatest = res.latest.replace(/^v/, '');
        item.status =
          compareSemver(cleanLatest, cleanDeclared) > 0 ? 'update' : 'current';
      }
    } else if (item.ecosystem === 'hook') {
      const [owner, repo] = item.name.split('/');
      const res = await sources.resolveGitHubRelease(owner, repo);
      item.latest = `v${res.latest}`;
      item.sourceUrl = res.sourceUrl;
      if (item.status !== 'held') {
        item.status =
          compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
      }
    }

    // 6. Tools & Toolchains
    else if (item.ecosystem === 'tool') {
      if (item.id === 'tool:gradle') {
        const res = await sources.resolveGradleWrapper();
        item.latest = `${res.latest} (${res.sha256.slice(0, 8)}...)`;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          const curVer = item.declared.split(' ')[0];
          item.status =
            compareSemver(res.latest, curVer) > 0 ? 'update' : 'current';
        }
      } else if (item.id === 'tool:ktlint') {
        const res = await sources.resolveGitHubRelease('pinterest', 'ktlint');
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status =
            compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
        }
      } else if (item.id.startsWith('tool:apk-lab/')) {
        const toolName = item.name;
        let ghTarget = '';
        if (toolName === 'morphe') ghTarget = 'MorpheApp/morphe-desktop';
        else if (toolName === 'jadx') ghTarget = 'skylot/jadx';
        else if (toolName === 'apktool') ghTarget = 'iBotPeaches/Apktool';
        else if (toolName === 'baksmali' || toolName === 'smali')
          ghTarget = 'baksmali/smali';
        else if (toolName === 'apkeep') ghTarget = 'EFForg/apkeep';

        if (ghTarget) {
          const [owner, repo] = ghTarget.split('/');
          const res = await sources.resolveGitHubRelease(owner, repo);
          item.latest = res.latest;
          item.sourceUrl = res.sourceUrl;
          if (item.status !== 'held') {
            item.status =
              compareSemver(res.latest, item.declared) > 0
                ? 'update'
                : 'current';
          }
        }
      } else if (item.id === 'tool:rust-native') {
        const res = await sources.resolveRustStable();
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status =
            compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
        }
      } else if (item.id === 'tool:java') {
        const res = await sources.resolveJavaAdoptium();
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status =
            parseInt(res.latest, 10) > parseInt(item.declared, 10)
              ? 'update'
              : 'current';
        }
      } else if (item.id === 'tool:bun') {
        const res = await sources.resolveBunLatest();
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        item.status = 'moving';
      } else if (item.id === 'tool:node') {
        const res = await sources.resolveNodeLts();
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        item.status = 'moving';
      } else if (item.id === 'tool:ndk') {
        const res = await sources.resolveNdk();
        item.latest = `${res.label} (${res.revision})`;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status = item.declared.includes(res.label)
            ? 'current'
            : 'update';
        }
      } else if (item.id === 'tool:android-build-tools') {
        const res = await sources.resolveAndroidBuildTools();
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          item.status =
            compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
        }
      }
    }

    // 7. Embedded Leaflet
    else if (item.ecosystem === 'embedded' && item.name === 'leaflet') {
      const res = await sources.resolveNpm('leaflet');
      item.latest = res.latest;
      item.sourceUrl = res.sourceUrl;
      if (item.status !== 'held') {
        item.status =
          compareSemver(res.latest, item.declared) > 0 ? 'update' : 'current';
      }
    }

    // 8. C++ CMake FetchContent
    else if (item.ecosystem === 'cmake') {
      let res: { latest: string; sourceUrl: string } | null = null;
      if (item.name === 'libjpeg-turbo') {
        res = await sources.resolveGitHubRelease(
          'libjpeg-turbo',
          'libjpeg-turbo',
        );
      } else if (item.name === 'qpdf') {
        res = await sources.resolveGitHubRelease('qpdf', 'qpdf', 'v');
      } else if (item.name === 'leptonica') {
        res = await sources.resolveGitHubRelease('DanBloomberg', 'leptonica');
      } else if (item.name === 'tesseract') {
        res = await sources.resolveGitHubRelease('tesseract-ocr', 'tesseract');
      } else if (item.sourceUrl) {
        const ghMatch = item.sourceUrl.match(/github\.com\/([^/]+)\/([^/]+)/);
        if (ghMatch) {
          const owner = ghMatch[1];
          const repo = ghMatch[2];
          const hasVPrefix = /\/v[0-9]/.test(item.sourceUrl);
          res = await sources.resolveGitHubRelease(
            owner,
            repo,
            hasVPrefix ? 'v' : '',
          );
        }
      }
      if (res) {
        item.latest = res.latest;
        item.sourceUrl = res.sourceUrl;
        if (item.status !== 'held') {
          const ord = compareSemver(res.latest, item.declared);
          item.status = ord > 0 ? 'update' : ord < 0 ? 'ahead' : 'current';
        }
      }
    }
  } catch (err) {
    item.status = 'error';
    item.reason = (err as Error).message;
  } finally {
    item.durationMs = Math.round(performance.now() - start);
  }
}
