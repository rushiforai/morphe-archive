import fs from 'node:fs/promises';
import { pathToFileURL } from 'node:url';

const stable = /^v?(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$/;
export function stableVersion(tag) {
    if (typeof tag !== 'string' || !stable.test(tag)) throw new Error(`Not a stable version: ${tag}`);
    return tag.replace(/^v/, '');
}
export function latestPlugin(tags) {
    if (!Array.isArray(tags)) throw new Error('Invalid upstream tags response');
    const candidates = tags.filter(t => typeof t?.name === 'string' && stable.test(t.name));
    candidates.sort((a, b) => {
        const av = stableVersion(a.name).split('.').map(Number);
        const bv = stableVersion(b.name).split('.').map(Number);
        for (let i = 0; i < 3; i++) if (av[i] !== bv[i]) return bv[i] - av[i];
        return 0;
    });
    if (!candidates.length) throw new Error('No stable Gradle plugin tag found');
    const tag = candidates[0];
    if (!/^[a-f0-9]{40}$/.test(tag.commit?.sha ?? '')) throw new Error('Missing plugin commit SHA');
    return { version: stableVersion(tag.name), tag: tag.name, commit: tag.commit.sha };
}
export async function resolveToolchain(fetcher = fetch, token = process.env.GITHUB_TOKEN) {
    const headers = { Accept: 'application/vnd.github+json', 'X-GitHub-Api-Version': '2022-11-28' };
    if (token) headers.Authorization = `Bearer ${token}`;
    async function api(path) {
        const r = await fetcher(`https://api.github.com/repos/MorpheApp/${path}`, {
            headers, signal: AbortSignal.timeout(30000),
        });
        if (!r.ok) throw new Error(`Upstream version discovery failed: HTTP ${r.status}`);
        return r.json();
    }
    const [release, tags] = await Promise.all([
        api('morphe-patcher/releases/latest'),
        api('morphe-patches-gradle-plugin/tags?per_page=100'),
    ]);
    if (release.draft !== false || release.prerelease !== false) throw new Error('Patcher release is not stable');
    const patcher = { version: stableVersion(release.tag_name), tag: release.tag_name,
        url: `https://github.com/MorpheApp/morphe-patcher/releases/tag/${release.tag_name}` };
    return { policy: 'latest-stable-per-build', patcher, plugin: latestPlugin(tags) };
}
async function main() {
    const result = await resolveToolchain();
    await fs.writeFile('morphe-toolchain.json', JSON.stringify(result, null, 2) + '\n');
    if (process.env.GITHUB_ENV) {
        await fs.appendFile(process.env.GITHUB_ENV,
            `MORPHE_PATCHER_VERSION=${result.patcher.version}\nMORPHE_PLUGIN_VERSION=${result.plugin.version}\n`);
    }
    console.log(`Latest stable Morphe Patcher ${result.patcher.version}; Gradle plugin ${result.plugin.version}`);
}
if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
    main().catch(error => { console.error(error.message); process.exitCode = 1; });
}
