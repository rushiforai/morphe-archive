// scripts/tests/UpstreamCheckTest.mjs
// Headless check of the upstream version checker's two pure halves: reading the store page's
// binary out of the public page, and deciding what to report. The combinations the live run
// cannot produce on demand (a genuine release, a rollback, an unreadable page) are asserted
// here against scripts/tests/meta-store.html, a saved 2026-10-15 copy of the real page.
// Run: node scripts/tests/UpstreamCheckTest.mjs

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import {
  compareVersions,
  decide,
  extractStorefrontBinary,
  statusLine,
  summaryLines,
} from '../check-upstream-version.mjs';
import {
  parseSupportedVersions,
  readSupportedVersionsFile,
} from '../supported-versions.mjs';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const FIXTURE = path.join(__dirname, 'meta-store.html');

let failures = 0;

function check(what, ok) {
  if (!ok) {
    failures++;
  }
  console.log((ok ? '  ok   ' : '  FAIL ') + what);
}

function equal(what, got, want) {
  check(`${what}: want ${JSON.stringify(want)} (got ${JSON.stringify(got)})`, got === want);
}

// The supported list is read from the checkout's Constants.kt by the same shared parser the
// checker imports. The fixture (1.88.10) is never regenerated, and the synthetic scenarios
// derive their versions from the parsed list -- pinned versions silently un-updated these cases
// twice on 2026-11-22; derivation cannot age out.
const supported = parseSupportedVersions(readSupportedVersionsFile());
check('supported list parsed from Constants.kt is non-empty', supported.length > 0);

// ---- reading the page -------------------------------------------------------
const html = fs.readFileSync(FIXTURE, 'utf8');
const page = extractStorefrontBinary(html);
equal('page version', page?.version, '1.88.10');
equal('page version code', page?.versionCode, 18810000);
equal('page binary id', page?.binaryId, '28655433784142583');
equal('page source', page?.source, 'viewer_release_channel');

// The window-based `viewer_release_channel` read is the fast path; the fallback runs if Meta
// reorders the payload.
const withoutViewerChannel = html.replace(/"viewer_release_channel":/, '"viewer_release_channel_moved":');
const fallback = extractStorefrontBinary(withoutViewerChannel);
equal('fallback source', fallback?.source, 'app_store_item');
equal('fallback version', fallback?.version, '1.88.10');
equal('no binary in garbage', extractStorefrontBinary('<html>nothing here</html>'), null);

// ---- version comparison ----------------------------------------------------
check('1.10.0 is newer than 1.9.0', compareVersions('1.10.0', '1.9.0') === 1);
check('1.90.05 equals 1.90.05', compareVersions('1.90.05', '1.90.05') === 0);
check('1.90.05 is newer than 1.89.09', compareVersions('1.90.05', '1.89.09') === 1);
check('1.87.0 is older than 1.90.05', compareVersions('1.87.0', '1.90.05') === -1);
check('1.90.05 is newer than 1.90.04', compareVersions('1.90.05', '1.90.04') === 1);

// ---- the decision ----------------------------------------------------------
// Derived fixtures: they move with the supported list, so no AppTarget change can silently
// re-assign what a case means.
const newestSupported = supported.length > 0
  ? supported.reduce((a, b) => (compareVersions(b, a) > 0 ? b : a))
  : '0.0.0';
const futureParts = newestSupported.split('.').map((part) => Number.parseInt(part, 10) || 0);
const futureVersion = `${futureParts[0]}.${futureParts[1] + 1}.00`;
check(
  'the derived future version is above the newest supported',
  compareVersions(futureVersion, newestSupported) === 1
);

const channelAhead = {
  channel: 'LIVE',
  channelId: '545256815955045',
  version: newestSupported,
  createdDate: '2026-10-29T19:32:58.000Z',
  binaryId: 'x',
};

// Today's real shape: channel on the newest supported build, page lagging on a dropped one.
// Nothing upstream is unsupported, so it reads "Up to date" with no lag line. 1.89.09 is pinned
// deliberately: the latest-two policy guarantees a dropped version never returns.
const live = decide({
  page: { version: '1.89.09', versionCode: 18909000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('channel ahead of page -> no update', live.hasUpdate, false);
equal('channel ahead of page -> confirmed', live.confirmed, true);
equal('channel ahead of page -> lag noted', live.pageLagsChannel, true);
equal('channel ahead of page -> not a rollback', live.isRollback, false);

const fixtureLag = decide({ page, channel: channelAhead, supportedVersions: supported });
equal('fixture page (1.88.10, dropped) -> no update', fixtureLag.hasUpdate, false);
equal('fixture page (1.88.10, dropped) -> not a rollback', fixtureLag.isRollback, false);

const genuine = decide({
  page: { version: futureVersion, binaryId: 'x' },
  channel: { ...channelAhead, version: futureVersion },
  supportedVersions: supported,
});
equal('page serves a new version -> update', genuine.hasUpdate, true);
equal('page serves a new version -> confirmed', genuine.confirmed, true);
equal('page serves a new version -> sources agree', genuine.pageLagsChannel, false);

// The page alone sees it, the channel answer having not caught up: still an update.
const genuinePageOnly = decide({
  page: { version: futureVersion, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('page alone serves a new version -> update', genuinePageOnly.hasUpdate, true);
equal('page alone serves a new version -> page ahead', genuinePageOnly.pageAheadOfChannel, true);

// The 2026-11-24 policy change: the issue files off the channel instead of waiting days for
// the page, and the page-lag note rides along.
const channelOnly = decide({
  page: { version: newestSupported, binaryId: 'x' },
  channel: { ...channelAhead, version: futureVersion },
  supportedVersions: supported,
});
equal('channel alone has a new build -> update', channelOnly.hasUpdate, true);
equal('channel alone has a new build -> page lags (noted)', channelOnly.pageLagsChannel, true);
equal('channel alone has a new build -> page readable so confirmed', channelOnly.confirmed, true);

const rollback = decide({
  page: { version: '1.87.00', versionCode: 18700000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.87.00' },
  supportedVersions: supported,
});
equal('older everywhere -> no update', rollback.hasUpdate, false);
equal('older everywhere -> flagged as rollback', rollback.isRollback, true);

// Exists because the plain rollback case (page == channel) is the only other shape that reaches
// the rollback branch.
const pageFarBehind = decide({
  page: { version: '1.87.00', versionCode: 18700000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('page far behind -> no update', pageFarBehind.hasUpdate, false);
equal('page far behind -> not a rollback', pageFarBehind.isRollback, false);
equal('page far behind -> up to date', statusLine(pageFarBehind).includes('Up to date'), true);

// The reverse direction: "the page has not caught up" would be backwards here.
const pageAhead = decide({
  page: { version: newestSupported, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.89.09' },
  supportedVersions: supported,
});
equal('page ahead of channel -> no update', pageAhead.hasUpdate, false);
equal('page ahead of channel -> not flagged as lagging', pageAhead.pageLagsChannel, false);
equal('page ahead of channel -> flagged', pageAhead.pageAheadOfChannel, true);

// Page ahead of the channel with BOTH builds older than supported: the newest known release is
// the page's build alone, so the rollback summary must not claim "every source serves" it --
// the wording that shipped first got exactly this state wrong (found by the 2026-11-24 audit).
const pageAheadRollback = decide({
  page: { version: '1.90.03', versionCode: 19003000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.89.09' },
  supportedVersions: supported,
});
equal('page-ahead rollback -> no update', pageAheadRollback.hasUpdate, false);
equal('page-ahead rollback -> flagged as rollback', pageAheadRollback.isRollback, true);

// The channel's build is unsupported, so it is still an update worth reporting.
const unreadable = decide({
  page: null,
  channel: { ...channelAhead, version: futureVersion },
  supportedVersions: supported,
});
equal('unreadable page -> still reports the channel', unreadable.hasUpdate, true);
equal('unreadable page -> unconfirmed', unreadable.confirmed, false);
equal('unreadable page -> nothing claimed from the page', unreadable.page, null);

const quiet = decide({
  page: { version: newestSupported, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('everything current -> no update', quiet.hasUpdate, false);
equal('everything current -> sources agree', quiet.pageLagsChannel, false);

// This repo matches versions exactly, and '1.91.00' compares numerically EQUAL to '1.91.0',
// so the not-newer branch would mask the membership difference -- hence 1.91.02.
const withExperimental = decide({
  page: { version: '1.91.02', versionCode: 19102000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.91.02', versionCode: 19102000 },
  supportedVersions: ['1.90.05', '1.91.0'],
});
equal('an experimental target for 1.91.0 does not cover 1.91.02', withExperimental.hasUpdate, true);

const exactExperimental = decide({
  page: { version: '1.91.0', versionCode: 19100000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.91.0', versionCode: 19100000 },
  supportedVersions: ['1.90.05', '1.91.0'],
});
equal('an exact experimental target is supported', exactExperimental.hasUpdate, false);

// ---- the run summary's headline status --------------------------------------
equal('channel ahead, all supported -> up to date', statusLine(live).includes('Up to date'), true);
check(
  'channel ahead, all supported -> no lag in the status',
  !statusLine(live).includes('has not caught up')
);
equal('channel-only update -> warning status', statusLine(channelOnly).includes('New version detected!'), true);
check(
  'channel-only update -> page readable so no unconfirmed tag',
  !statusLine(channelOnly).includes('unconfirmed')
);
equal('genuine update -> warning status', statusLine(genuine).includes('New version detected!'), true);
equal(
  'unreadable page -> the warning is marked unconfirmed',
  statusLine(unreadable).includes('unconfirmed'),
  true
);
equal('quiet -> up to date', statusLine(quiet).includes('Up to date'), true);
equal('rollback -> up to date headline', statusLine(rollback).includes('Up to date'), true);

// ---- the run summary --------------------------------------------------------
// QUIET_LINES is the contract: four lines unless something needs explaining.
const QUIET_LINES = 4;
const liveSummary = summaryLines(live, null);
equal('all supported -> four-line summary', liveSummary.length, QUIET_LINES);
check(
  'all supported -> leads with the channel build',
  liveSummary[1].includes(`\`${newestSupported}\``) && liveSummary[1].includes('LIVE channel')
);
check(
  'all supported -> the lagging page is not reported',
  liveSummary.every((line) => !line.includes('1.89.09'))
);
check('all supported -> reads Up to date', liveSummary.some((line) => line.includes('Up to date')));

const channelOnlySummary = summaryLines(channelOnly, null);
equal('channel-only update -> one line more', channelOnlySummary.length, QUIET_LINES + 1);
check(
  'channel-only update -> the lag line names what the page still shows',
  channelOnlySummary.some((line) => line.includes('still shows') && line.includes(`\`${newestSupported}\``))
);
check(
  'channel-only update -> leads with the channel build',
  channelOnlySummary[1].includes(`\`${futureVersion}\``) && channelOnlySummary[1].includes('LIVE channel')
);
check(
  'no summary line ever claims "not downloadable"',
  [...channelOnlySummary, ...liveSummary].every((line) => !/not downloadable/i.test(line))
);

const rollbackSummary = summaryLines(rollback, null);
check('rollback summary flags the rollback', rollbackSummary.some((line) => line.includes('a rollback')));
check('rollback summary reads Up to date', rollbackSummary.some((line) => line.includes('Up to date')));

const pageAheadRollbackSummary = summaryLines(pageAheadRollback, null);
check(
  'page-ahead rollback -> names the page as the origin',
  pageAheadRollbackSummary.some((line) => line.includes('store page') && line.includes('a rollback'))
);
check(
  'no rollback line claims "Every source" for a single-source newest',
  pageAheadRollbackSummary.every((line) => !line.includes('Every source'))
);
check(
  'no rollback line claims "not downloadable"',
  pageAheadRollbackSummary.every((line) => !/not downloadable/i.test(line))
);

const unreadableSummary = summaryLines(unreadable, 'store page returned HTTP 400 400');
check(
  'unreadable summary is marked unconfirmed',
  unreadableSummary.some((line) => line.includes('unconfirmed'))
);
check('unreadable summary carries the reason', unreadableSummary.some((line) => line.includes('HTTP 400')));

const quietSummary = summaryLines(quiet, null);
equal('quiet -> four-line summary', quietSummary.length, QUIET_LINES);
check('quiet summary reads Up to date', quietSummary.some((line) => line.includes('Up to date')));

const pageAheadSummary = summaryLines(pageAhead, null);
equal('page ahead -> four-line summary', pageAheadSummary.length, QUIET_LINES);
check(
  'page ahead -> leads with the page build',
  pageAheadSummary[1].includes(`\`${newestSupported}\``) && pageAheadSummary[1].includes('store page')
);
check(
  'page ahead -> never claims the page is behind',
  pageAheadSummary.every((line) => !line.includes('has not caught up'))
);
const pageOnlySummary = summaryLines(genuinePageOnly, null);
check(
  'page alone -> leads with the page build',
  pageOnlySummary[1].includes(`\`${futureVersion}\``) && pageOnlySummary[1].includes('store page')
);

console.log(
  failures === 0
    ? 'UpstreamCheckTest: OK (every expectation held)'
    : `UpstreamCheckTest: ${failures} FAILURE(S)`
);
process.exit(failures === 0 ? 0 : 1);
