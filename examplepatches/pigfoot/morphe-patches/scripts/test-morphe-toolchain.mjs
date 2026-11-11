import { test } from 'node:test';
import assert from 'node:assert/strict';
import { stableVersion, latestPlugin, resolveToolchain } from './resolve-morphe-toolchain.mjs';
const tag = name => ({ name, commit: { sha: 'a'.repeat(40) } });
test('select newest numeric stable tag, not API ordering or lexical ordering', () => {
    assert.equal(latestPlugin([tag('v2.9.0'), tag('v3.0.0-dev.8'), tag('v2.10.0'), tag('v1.9.9')]).version, '2.10.0');
});
test('reject prerelease-only, malformed metadata and unqualified refs', () => {
    for (const x of [[tag('v3.0.0-dev.1')], {}, [{ name: 'v3.0.0' }]]) assert.throws(() => latestPlugin(x));
    for (const x of ['v2.3.0-dev.1', 'latest', '2.3.0\nx=1', 'v02.3.0']) assert.throws(() => stableVersion(x));
});
test('resolve current stable sources; do not send authorization to arbitrary hosts', async () => {
    const calls = [];
    const result = await resolveToolchain(async (url, options) => {
        calls.push({ url, options });
        return { ok: true, json: async () => url.endsWith('releases/latest')
            ? { tag_name: 'v2.3.0', draft: false, prerelease: false } : [tag('v2.1.0')] };
    }, 'fixture-not-a-credential');
    assert.equal(result.patcher.version, '2.3.0');
    assert.equal(result.plugin.version, '2.1.0');
    assert(calls.every(c => new URL(c.url).hostname === 'api.github.com'));
});
test('fail closed on API error or prerelease response instead of using cached versions', async () => {
    await assert.rejects(resolveToolchain(async () => ({ ok: false, status: 401 })), /HTTP 401/);
    await assert.rejects(resolveToolchain(async url => ({ ok: true, json: async () => url.endsWith('releases/latest')
        ? { tag_name: 'v3.0.0-dev.1', draft: false, prerelease: true } : [tag('v2.1.0')] })), /not stable/);
});
