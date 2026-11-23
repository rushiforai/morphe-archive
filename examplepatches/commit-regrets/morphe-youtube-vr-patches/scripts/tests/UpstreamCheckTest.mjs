// scripts/tests/UpstreamCheckTest.mjs
// Headless check of the upstream version checker's two pure halves: reading the released binary out
// of the public store page, and deciding what to report. The live run only ever exercises one
// combination (today: a channel ahead of the storefront), and the combinations that matter most --
// a genuine release, a rollback, an unreadable page -- cannot be produced on demand. So they are
// asserted here against a saved copy of the real page.
//
// Run: node scripts/tests/UpstreamCheckTest.mjs
// The storefront fixture is scripts/tests/meta-store.html, fetched 2026-10-15 with Meta's crawler UA
// (see the script's STORE_PAGE_UA comment for why that UA and not a browser one).

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

// The supported list this decision table assumes -- read from the checkout's Constants.kt by the
// same shared parser the checker itself imports, so the two can never disagree and the list
// needs no hand-edit at a version bump. The storefront fixture below is a saved 2026-10-15 page
// and is NOT regenerated, so its served version (1.88.10) drifts further behind the policy at
// every bump; the fixture cases stay truthful across bumps because they assert only what the
// latest-two policy guarantees (1.88.10 stays dropped). The synthetic scenarios DERIVE their
// versions from the parsed list (newest supported, and that minor bumped) precisely so they
// cannot age out the way a pinned one did -- measured twice on 2026-11-22, when the 1.92.11
// target landed and silently un-updated the then-pinned 1.92.00 cases, and when the same day's
// flip dropped 1.90.05 and turned the "everything current" case into a rollback that still
// passed.
const supported = parseSupportedVersions(readSupportedVersionsFile());
check('supported list parsed from Constants.kt is non-empty', supported.length > 0);

// ---- reading the storefront -------------------------------------------------
const html = fs.readFileSync(FIXTURE, 'utf8');
const released = extractStorefrontBinary(html);
equal('storefront version', released?.version, '1.88.10');
equal('storefront version code', released?.versionCode, 18810000);
equal('storefront binary id', released?.binaryId, '28655433784142583');
equal('storefront source', released?.source, 'viewer_release_channel');

// The window-based `viewer_release_channel` read is the fast path; the fallback has to work too,
// because that is what runs if Meta reorders the payload.
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
// Derived fixtures: newestSupported feeds the channel/everything-current shapes, and
// futureVersion (its minor bumped) feeds the genuine-release shapes. Both move with the
// supported list, so no AppTarget change can silently re-assign what a case means.
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

// Today's real shape: the channel has the newest supported build uploaded while the storefront
// still serves a build we have dropped. This is the false positive the checker filed an issue
// for on 2026-10-15 (then: channel 1.89.09, storefront 1.88.10) -- the shape whose summary must
// NOT claim the uploaded build is unobtainable. 1.89.09 is pinned deliberately: the latest-two
// policy guarantees a dropped version never returns, so "below every supported version" holds
// forever.
const live = decide({
  released: { version: '1.89.09', versionCode: 18909000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('channel ahead of storefront -> no update', live.hasUpdate, false);
equal('channel ahead of storefront -> confirmed', live.confirmed, true);
equal('channel ahead of storefront -> noted', live.uploadedNotReleased, true);

// The saved fixture's storefront (1.88.10, fetched 2026-10-15) is OLDER than the oldest
// supported version -- a rollback against the channel's newest: no update filed, flagged as a
// rollback.
const fixtureRollback = decide({ released, channel: channelAhead, supportedVersions: supported });
equal('fixture storefront (1.88.10, dropped) -> no update', fixtureRollback.hasUpdate, false);
equal('fixture storefront (1.88.10, dropped) -> rollback', fixtureRollback.isRollback, true);

// A genuine release: the storefront serves something newer than every supported version --
// derived, so this case cannot age out the way its pinned predecessor did.
const genuine = decide({
  released: { version: futureVersion, binaryId: 'x' },
  channel: { ...channelAhead, version: futureVersion },
  supportedVersions: supported,
});
equal('storefront serves a new version -> update', genuine.hasUpdate, true);
equal('storefront serves a new version -> confirmed', genuine.confirmed, true);
equal('storefront serves a new version -> nothing pending', genuine.uploadedNotReleased, false);

// A rollback: the storefront serves something *older* than what we support. Not an update.
const rollback = decide({
  released: { version: '1.87.00', versionCode: 18700000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.87.00' },
  supportedVersions: supported,
});
equal('older storefront version -> no update', rollback.hasUpdate, false);
equal('older storefront version -> flagged as rollback', rollback.isRollback, true);

// The realistic rollback: the page serves a dropped build while the channel still has the
// newest supported one uploaded. Both flags fire -- and the headline must be the lagging-page
// one, not "Up to date": the plain rollback fixture above (channel == released) can never
// reach that branch, which is why this case exists.
const realisticRollback = decide({
  released: { version: '1.87.00', versionCode: 18700000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('rollback with channel ahead -> no update', realisticRollback.hasUpdate, false);
equal('rollback with channel ahead -> flagged as rollback', realisticRollback.isRollback, true);
equal('rollback with channel ahead -> channel ahead is noted', realisticRollback.uploadedNotReleased, true);
check(
  'rollback with channel ahead -> lagging-page status, not "Up to date"',
  statusLine(realisticRollback).includes('has not caught up')
);

// The reverse direction: the page serves the newest supported build while the channel answer
// still lists an older one. "The page has not caught up" would be backwards here -- the
// page-ahead flag takes over, and the headline reads "Up to date" (the page's build is
// supported).
const pageAhead = decide({
  released: { version: newestSupported, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.89.09' },
  supportedVersions: supported,
});
equal('page ahead of channel -> no update', pageAhead.hasUpdate, false);
equal('page ahead of channel -> not flagged as uploaded-not-released', pageAhead.uploadedNotReleased, false);
equal('page ahead of channel -> flagged', pageAhead.pageAheadOfChannel, true);
const pageAheadSummary = summaryLines(pageAhead, null);
check(
  'page-ahead summary uses the page-ahead label',
  pageAheadSummary.some((line) => line.includes('the page is ahead of the channel data'))
);
check(
  'page-ahead summary never claims the page is behind',
  pageAheadSummary.every((line) => !line.includes('has not caught up'))
);
check('page-ahead summary reads Up to date', pageAheadSummary.some((line) => line.includes('Up to date')));

// Storefront unreadable: fall back to the channel answer, but say it is unconfirmed. The
// channel's build is one nobody supports yet, so it is still an update worth reporting.
const unreadable = decide({
  released: null,
  channel: { ...channelAhead, version: futureVersion },
  supportedVersions: supported,
});
equal('unreadable storefront -> still reports the channel', unreadable.hasUpdate, true);
equal('unreadable storefront -> unconfirmed', unreadable.confirmed, false);
equal('unreadable storefront -> nothing claimed as released', unreadable.released, null);

// A storefront that matches what we support, with the channel agreeing: the one shape that is
// allowed to read "Up to date". (Derived from the list, so the flip that dropped 1.90.05
// cannot turn this into a rollback that passes vacuously again.)
const quiet = decide({
  released: { version: newestSupported, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('everything current -> no update', quiet.hasUpdate, false);
equal('everything current -> nothing pending', quiet.uploadedNotReleased, false);

// An experimental target for a *different* version does not cover 1.91.02: this repo matches
// versions exactly (an unlisted version is skipped, not failed -- see docs/VERSIONING.md), so a
// build that is not listed is still worth reporting. ('1.91.00' would not do here: it compares
// numerically EQUAL to '1.91.0', so the not-newer branch would mask the membership difference.)
const withExperimental = decide({
  released: { version: '1.91.02', versionCode: 19102000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.91.02', versionCode: 19102000 },
  supportedVersions: ['1.90.05', '1.91.0'],
});
equal('an experimental target for 1.91.0 does not cover 1.91.02', withExperimental.hasUpdate, true);

// ...but an exact experimental target does.
const exactExperimental = decide({
  released: { version: '1.91.0', versionCode: 19100000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.91.0', versionCode: 19100000 },
  supportedVersions: ['1.90.05', '1.91.0'],
});
equal('an exact experimental target is supported', exactExperimental.hasUpdate, false);

// ---- the run summary's headline status --------------------------------------
// "Up to date" must not print while the channel is ahead of the storefront: a build exists that
// the repo has not re-anchored, and the page lagging does not prove it is unobtainable --
// measured 2026-11-22, 1.92.11 was fetched with the DownQuest extension while the page still
// listed 1.91.10 (the state the summary used to call "not downloadable yet").
check('channel ahead -> status is not "Up to date"', !statusLine(live).includes('Up to date'));
check(
  'channel ahead -> status flags the lagging page',
  statusLine(live).includes('has not caught up')
);
equal('genuine update -> warning status', statusLine(genuine).includes('New version detected!'), true);
equal(
  'unreadable storefront -> the warning is marked unconfirmed',
  statusLine(unreadable).includes('unconfirmed'),
  true
);
equal('quiet -> up to date', statusLine(quiet).includes('Up to date'), true);
// A rollback still reads "Up to date" in the headline: the repo has nothing new to support,
// and the rollback itself is flagged by its own summary line above the status.
equal('rollback -> up to date headline', statusLine(rollback).includes('Up to date'), true);

// ---- the run summary --------------------------------------------------------
// The summary builder is pure so its wording can be pinned. The channel-ahead line used to
// claim the uploaded build was "not downloadable yet" -- a claim nothing in the script can
// verify, and one the 2026-11-22 DownQuest fetch disproved (the build WAS downloadable while
// the page still served the older version). These assertions are that fix's regression guard.
const aheadSummary = summaryLines(live, null);
check(
  'no summary line ever claims "not downloadable yet"',
  aheadSummary.every((line) => !line.includes('not downloadable yet'))
);
check(
  'channel-ahead summary states the lag is not proof of unobtainability',
  aheadSummary.some((line) => line.includes('is not proof the binary is unobtainable'))
);
check(
  'channel-ahead summary shows the lagging-page status',
  aheadSummary.some((line) => line.includes('has not caught up'))
);
check(
  'channel-ahead summary names both versions',
  aheadSummary.some((line) => line.includes(newestSupported) && line.includes('1.89.09'))
);
const rollbackSummary = summaryLines(fixtureRollback, null);
check('rollback summary flags the rollback', rollbackSummary.some((line) => line.includes('a rollback')));
const unreadableSummary = summaryLines(unreadable, 'store page returned HTTP 400 400');
check(
  'unreadable summary is marked unconfirmed',
  unreadableSummary.some((line) => line.includes('unconfirmed'))
);
check('unreadable summary carries the reason', unreadableSummary.some((line) => line.includes('HTTP 400')));
const quietSummary = summaryLines(quiet, null);
check('quiet summary reads Up to date', quietSummary.some((line) => line.includes('Up to date')));

console.log(
  failures === 0
    ? 'UpstreamCheckTest: OK (every expectation held)'
    : `UpstreamCheckTest: ${failures} FAILURE(S)`
);
process.exit(failures === 0 ? 0 : 1);
