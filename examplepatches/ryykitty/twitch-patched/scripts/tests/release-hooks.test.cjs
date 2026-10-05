const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');
const { test } = require('node:test');

const root = path.resolve(__dirname, '../..');
const config = JSON.parse(fs.readFileSync(path.join(root, '.releaserc'), 'utf8'));
const githubOptions = config.plugins.find(
    (plugin) => Array.isArray(plugin) && plugin[0] === '@semantic-release/github',
)[1];
const pluginRoot = path.dirname(require.resolve('@semantic-release/github'));

async function loadHook(name) {
    return (await import(pathToFileURL(path.join(pluginRoot, 'lib', `${name}.js`)).href)).default;
}

function fixture() {
    const requests = [];
    class Octokit {
        async request(route) {
            requests.push(route);
            assert.equal(route, 'GET /repos/{owner}/{repo}');
            return { data: { full_name: 'test-owner/test-repository' } };
        }

        async graphql() {
            throw new Error('Issue access is unavailable');
        }
    }
    const context = {
        options: { repositoryUrl: 'https://github.com/test-owner/test-repository.git' },
        env: {},
        commits: [{ hash: '0123456789abcdef', message: 'feat: add a patch' }],
        nextRelease: { version: '1.0.0' },
        releases: [],
        branch: { name: 'main' },
        errors: [],
        logger: { log() {}, warn() {}, error() {} },
    };
    return { requests, context, Octokit };
}

test('release success completes without issue permissions', async () => {
    const success = await loadHook('success');
    const { requests, context, Octokit } = fixture();
    await success(githubOptions, context, { Octokit });
    assert.deepEqual(requests, ['GET /repos/{owner}/{repo}']);
});

test('release failures stay in workflow logs without issue creation', async () => {
    const fail = await loadHook('fail');
    const { requests, context, Octokit } = fixture();
    await fail(githubOptions, context, { Octokit });
    assert.deepEqual(requests, []);
});

test('previous comment setting reproduces the issue-access failure', async () => {
    const success = await loadHook('success');
    const { context, Octokit } = fixture();
    const { successCommentCondition, failCommentCondition, ...previousOptions } = githubOptions;
    await assert.rejects(
        success({ ...previousOptions, successComment: false }, context, { Octokit }),
        /Issue access is unavailable/,
    );
});

const logger = { log() {}, warn() {}, error() {} };
const pluginOptions = (name) => config.plugins.find(
    (plugin) => Array.isArray(plugin) && plugin[0] === name,
)[1];

function releaseContext(commits) {
    return {
        cwd: root,
        commits,
        logger,
        options: { repositoryUrl: 'https://github.com/ryykitty/twitch-patched' },
        lastRelease: { version: '1.0.1', gitTag: 'v1.0.1' },
        nextRelease: { version: '1.0.2', gitTag: 'v1.0.2' },
    };
}

test('app compatibility increments the patch version; documentation does not', async () => {
    const { analyzeCommits } = await import('@semantic-release/commit-analyzer');
    const options = pluginOptions('@semantic-release/commit-analyzer');
    const support = { hash: '1234567890abcdef', message: 'bump: add Twitch 31.4.2 compatibility' };
    const documentation = { hash: 'abcdef1234567890', message: 'docs: update compatibility information' };
    assert.equal(await analyzeCommits(options, releaseContext([support, documentation])), 'patch');
    assert.equal(await analyzeCommits(options, releaseContext([documentation])), null);
    const feature = { hash: '9876543210abcdef', message: 'feat: add a chat feature' };
    assert.equal(await analyzeCommits(options, releaseContext([support, feature])), 'minor');
});

test('release notes and Morphe metadata contain compatibility changes and matching asset versions', async () => {
    const { generateNotes } = await import('@semantic-release/release-notes-generator');
    const { prepare } = require('@MorpheApp/changelog');
    const os = require('node:os');
    const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'twitch-release-'));
    const commits = [
        { hash: '1234567890abcdef', message: 'bump: add Twitch 31.4.2 compatibility' },
        { hash: 'abcdef1234567890', message: 'docs: update compatibility information' },
    ];
    try {
        for (const version of ['1.0.2', '1.0.2-dev.1']) {
            const cwd = path.join(directory, version);
            fs.mkdirSync(cwd);
            const context = releaseContext(commits);
            context.cwd = cwd;
            context.nextRelease = { version, gitTag: `v${version}` };
            const notes = await generateNotes(pluginOptions('@semantic-release/release-notes-generator'), context);
            assert.match(notes, /### App Support/);
            assert.match(notes, /add Twitch 31\.4\.2 compatibility/);
            assert.doesNotMatch(notes, /update compatibility information/);
            context.nextRelease.notes = notes;
            await prepare(pluginOptions('@MorpheApp/changelog'), context);
            const bundle = JSON.parse(fs.readFileSync(path.join(cwd, 'patches-bundle.json'), 'utf8'));
            assert.equal(bundle.version, version);
            assert.equal(bundle.description, notes.trim());
            assert.equal(bundle.download_url,
                `https://github.com/ryykitty/twitch-patched/releases/download/v${version}/patches-${version}.mpp`);
            assert.equal(fs.readFileSync(path.join(cwd, 'CHANGELOG.md'), 'utf8').trim(), notes.trim());
        }
    } finally {
        fs.rmSync(directory, { recursive: true, force: true });
    }
});
