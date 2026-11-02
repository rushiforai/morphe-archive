// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

// The extension's pure functions: node --test tools/vscode-extension/test/*.test.js (no dependencies).
'use strict';

const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const extension = require('../extension.js');

const SPOOF_CLIENT = `using BaconReader.E2E.Infrastructure;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Account;

/// <summary>"Spoof client": BaconReader talks to Reddit as another app.</summary>
public sealed class SpoofClientTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.SpoofClient)]
    [TestDescription("""
        @phone
        Scenario: BaconReader patched with Spoof client logs in to Reddit as RedReader
          Given BaconReader is patched with "Spoof client"
          When I open BaconReader
          Then the feed shows no posts
        """)]
    public async Task BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader(Screen screen)
    {
        // Given
        await Phone.Launcher.OpenBaconReaderAsync();
    }

    [Theory, PlayOnPhone, PlayOnDesktop]
    [TestDescription("""
        @phone @desktop
        Scenario: Both screens
          Given BaconReader is installed
        """)]
    public async Task BothScreens(Screen screen)
    {
    }

    private static string Describe() => "not a scenario";
}
`;

const RELEASE = [
  'pr-7-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif',
  'pr-12-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif',
  'pr-12-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4',
  'pr-12-v2-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif',
  'pr-12-v2-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4',
  'pr-30-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.gif',
  'pr-30-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4',
  'pr-30-v1-embed-comment-images-shows-a-gif-in-a-comment-as-an-image-phone.gif',
  'pr-40-v1-both-screens-desktop.gif',
  'pr-40-v1-both-screens-desktop.mp4',
  'pr-41-v1-both-screens-phone.mp4',
  'pr-41-v1-both-screens-desktop.mp4',
].map((name) => ({ name, url: `https://github.com/o/r/releases/download/prs-resources/${name}` }));

const read = { state: 'read', assets: RELEASE };

async function findRecordingsOf(scenario, assets) {
  const digests = {};
  for (const screen of scenario.screens) {
    digests[screen] = await extension.digestText(extension.toGifPath(scenario.domain, extension.toGifName(scenario.method, screen)));
  }
  return extension.findRecordings(scenario, assets, digests);
}

async function findSpoofClient() {
  const [scenario] = extension.findScenarios(SPOOF_CLIENT);
  return { scenario, recordings: await findRecordingsOf(scenario, RELEASE) };
}

test('kebab-cases like Humanizer 3.0.10 (its output for the scenarios so far and some edge cases)', () => {
  const cases = [
    ['BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader', 'bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader'],
    ['EmbedCommentImagesShowsAGifInACommentAsAnImage', 'embed-comment-images-shows-a-gif-in-a-comment-as-an-image'],
    ['BaconReaderLoggedInShowsThePostsRedditHasInAll', 'bacon-reader-logged-in-shows-the-posts-reddit-has-in-all'],
    ['BaconReaderPatchedWithE2eFakeRedditOpens', 'bacon-reader-patched-with-e2e-fake-reddit-opens'],
    ['ReapersTitheGives3StacksForAKillOf3', 'reapers-tithe-gives3-stacks-for-a-kill-of3'],
    ['HTTPServerX', 'http-server-x'],
    ['ABC', 'abc'],
    ['A1B2', 'a1-b2'],
    ['AÉtoile', 'a-étoile'],
  ];
  for (const [method, kebab] of cases) {
    assert.equal(extension.toKebabCase(method), kebab, method);
  }
});

test('reads a scenario file: its scenarios, their titles, screens, class, domain and where the CodeLens goes', () => {
  const [spoof, both, ...others] = extension.findScenarios(SPOOF_CLIENT);
  assert.equal(others.length, 0, 'the private method has no [TestDescription]: it is no scenario');
  assert.deepEqual({ ...spoof }, {
    method: 'BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader',
    title: 'BaconReader patched with Spoof client logs in to Reddit as RedReader',
    className: 'SpoofClientTests',
    domain: 'Startup/Account',
    screens: ['phone'],
    attributesLine: 8,
    nameLine: 17,
  });
  assert.deepEqual(both.screens, ['phone', 'desktop'], 'its [PlayOn<Screen>] attributes, in their order');
  assert.equal(both.attributesLine, 23);
});

test('finds the scenario the cursor is in: the last one starting on or above its line, else the first', () => {
  const [spoof, both] = extension.findScenarios(SPOOF_CLIENT);
  assert.equal(extension.findScenarioAround([spoof, both], 2), spoof, 'above every scenario: the first');
  assert.equal(extension.findScenarioAround([spoof, both], 8), spoof);
  assert.equal(extension.findScenarioAround([spoof, both], 22), spoof);
  assert.equal(extension.findScenarioAround([spoof, both], 23), both);
  assert.equal(extension.findScenarioAround([spoof, both], 40), both);
  assert.equal(extension.findScenarioAround([], 3), null);
});

test('a file outside Scenarios has the domain folder "Unsorted", and a file with no scenario has none', () => {
  assert.equal(extension.toDomainFolder('BaconReader.E2E.Infrastructure'), 'Unsorted');
  assert.equal(extension.toDomainFolder('BaconReader.E2E.Scenarios.LoggedIn.Comments.ShowTables'), 'LoggedIn/Comments/ShowTables');
  assert.deepEqual(extension.findScenarios('namespace X;\npublic sealed class A { public void B() { } }\n'), []);
});

test('the player link is the repository\'s site\'s player page', () => {
  assert.equal(extension.toPlayerUrl('JoanComasFdz/baconreader-morphe-patches', 'pr-1-v1-a-phone.mp4'),
    'https://joancomasfdz.github.io/baconreader-morphe-patches/e2e-player.html?v=pr-1-v1-a-phone.mp4');
});

test('the commands, settings and panel are named after package.json\'s prefix', () => {
  const ids = extension.toIds('baconreaderMorphe.e2eRecordings');
  assert.equal(ids.playHere, 'baconreaderMorphe.e2eRecordings.playHere');
  assert.equal(ids.settings, 'baconreaderMorphe.e2eRecordings');
  const manifest = JSON.parse(fs.readFileSync(path.join(__dirname, '..', 'package.json'), 'utf8'));
  const prefix = manifest.e2eRecordings.prefix;
  const named = extension.toIds(prefix);
  assert.deepEqual(manifest.contributes.commands.map((command) => command.command).sort(),
    [named.play, named.playHere, named.refresh, named.signIn].sort());
  assert.deepEqual(Object.keys(manifest.contributes.configuration.properties).sort(),
    [`${named.settings}.release`, `${named.settings}.repository`]);
});

test('finds a scenario\'s recordings, newest PR first, each version with the assets it has', async () => {
  const { recordings } = await findSpoofClient();
  assert.deepEqual(recordings.map((r) => `${r.pr}-${r.version}`), ['30-1', '12-2', '12-1', '7-1']);
  assert.deepEqual(Object.keys(recordings[0].runs), ['phone']);
  assert.equal(recordings[0].runs.phone.mp4.name, 'pr-30-v1-bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone.mp4');
  assert.deepEqual(Object.keys(recordings[3].runs.phone), ['gif'], 'PR #7 has a GIF, no MP4');
});

test('a scenario played on two screens has a run per screen it was recorded on', async () => {
  const [, both] = extension.findScenarios(SPOOF_CLIENT);
  const recordings = await findRecordingsOf(both, RELEASE);
  assert.deepEqual(recordings.map((r) => [`${r.pr}-${r.version}`, Object.keys(r.runs)]), [
    ['41-1', ['phone', 'desktop']],
    ['40-1', ['desktop']],
  ]);
});

test('names a run past 200 characters like the workflow: its start, then the hash of its GIF path', async () => {
  const method = 'AScenarioWhoseNameGoesOnAndOn'.repeat(5) + 'PastTwoHundredCharacters';
  const gif = extension.toGifName(method, 'phone');
  const hash = await extension.digestText(extension.toGifPath('Comments', gif));
  // What tools/e2e's ReleaseNaming.NameAsset writes for the same GIF (ReleaseNamingTests checks the same name).
  const expected = 'pr-112-v3-' + 'a-scenario-whose-name-goes-on-and-on-'.repeat(4) + 'a-scenario-whose-name-goes-on-ceafb6b5';
  assert.equal(extension.nameAsset(112, 3, gif, '.gif', hash), `${expected}.gif`);
  assert.equal(extension.nameAsset(112, 3, gif, '.mp4', hash), `${expected}.mp4`);
  assert.equal(extension.nameAsset(7, 1, 'short-phone', '.gif', hash), 'pr-7-v1-short-phone.gif');
});

test('the CodeLens plays each screen of the newest recording, then names it', async () => {
  const { recordings } = await findSpoofClient();
  assert.deepEqual(extension.describeLenses(read, recordings), [
    { title: '$(device-mobile) Play phone recording', play: 'phone' },
    { title: 'PR #30 · V1' },
  ]);
  const [, both] = extension.findScenarios(SPOOF_CLIENT);
  assert.deepEqual(extension.describeLenses(read, await findRecordingsOf(both, RELEASE)), [
    { title: '$(device-mobile) Play phone recording', play: 'phone' },
    { title: '$(device-desktop) Play desktop recording', play: 'desktop' },
    { title: 'PR #41 · V1' },
  ]);
  assert.deepEqual(extension.describeLenses(read, []), [{ title: 'No recording yet' }]);
  assert.deepEqual(extension.describeLenses({ state: 'reading' }, []), [{ title: '$(sync~spin) Reading the e2e recordings…' }]);
  assert.deepEqual(extension.describeLenses({ state: 'failed', reason: "GitHub's hourly limit is used up", canSignIn: true }, []), [
    { title: "$(warning) No e2e recordings: GitHub's hourly limit is used up" },
    { title: 'Refresh', action: 'refresh' },
    { title: 'Sign in to GitHub', action: 'signIn' },
  ]);
});

test('the panel holds every version and opens on the one and the screen chosen', async () => {
  const { scenario, recordings } = await findSpoofClient();
  const page = extension.writePanel(scenario, recordings, { pr: 12, version: 2, screen: 'phone' }, 'JoanComasFdz/baconreader-morphe-patches', 'prs-resources', 'abc', 'vscode-resource:');
  const data = JSON.parse(/\}\)\((\{.*\})\);<\/script>/s.exec(page)[1]);
  assert.deepEqual(data.versions.map((v) => v.label), ['PR #30 · V1', 'PR #12 · V2', 'PR #12 · V1', 'PR #7 · V1']);
  assert.equal(data.version, 1);
  assert.equal(data.screen, 'phone');
  assert.equal(data.about, 'SpoofClientTests · Startup/Account');
  assert.deepEqual(data.versions[0].screens.map((s) => s.label), ['Phone']);
  assert.match(page, /script-src 'nonce-abc'/);
});

test('the .vsix manifest names the same name, publisher and version as package.json', () => {
  const manifest = JSON.parse(fs.readFileSync(path.join(__dirname, '..', 'package.json'), 'utf8'));
  const vsix = fs.readFileSync(path.join(__dirname, '..', 'vsix', 'extension.vsixmanifest'), 'utf8');
  assert.match(vsix, new RegExp(`<Identity Language="en-US" Id="${manifest.name}" Version="${manifest.version.replace(/\./g, '\\.')}" Publisher="${manifest.publisher}" />`));
  assert.match(vsix, new RegExp(`<DisplayName>${manifest.displayName}</DisplayName>`));
});
