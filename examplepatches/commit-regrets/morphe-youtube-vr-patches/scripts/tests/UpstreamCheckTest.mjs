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
} from '../check-upstream-version.mjs';

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

// The supported list this decision table assumes -- the repo's shipped two-normal-target policy
// (Constants.kt's AppTargets). The storefront fixture below is a saved 2026-10-15 page and is
// NOT regenerated, so its served version (1.88.10) drifts further behind the policy at every
// bump; the fixture-based expectations therefore have to be re-read at each bump (the
// fixture-storefront case is asserted as the rollback it becomes). The synthetic scenarios
// below pin the policy's real cases with the current version family.
const supported = ['1.90.05', '1.89.09'];

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
const channelAhead = {
  channel: 'LIVE',
  channelId: '545256815955045',
  version: '1.90.05',
  versionCode: 19005000,
  createdDate: '2026-10-29T19:32:58.000Z',
  binaryId: 'x',
};

// Today's real shape, with current versions: the channel has the newest supported build
// uploaded while the storefront still serves the previous one. This is the false positive the
// checker filed an issue for on 2026-10-15 (then: channel 1.89.09, storefront 1.88.10).
const live = decide({
  released: { version: '1.89.09', versionCode: 18909000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: supported,
});
equal('channel ahead of storefront -> no update', live.hasUpdate, false);
equal('channel ahead of storefront -> confirmed', live.confirmed, true);
equal('channel ahead of storefront -> noted', live.uploadedNotReleased, true);

// The saved fixture's storefront (1.88.10, fetched 2026-10-15) is now OLDER than the oldest
// supported version -- with the current policy it reads as a rollback against the channel's
// 1.90.05: no update filed, flagged as a rollback.
const fixtureRollback = decide({ released, channel: channelAhead, supportedVersions: supported });
equal('fixture storefront (1.88.10, dropped) -> no update', fixtureRollback.hasUpdate, false);
equal('fixture storefront (1.88.10, dropped) -> rollback', fixtureRollback.isRollback, true);

// A genuine release: the storefront serves something newer than every supported version.
const genuine = decide({
  released: { version: '1.91.00', versionCode: 19100000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.91.00', versionCode: 19100000 },
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

// Storefront unreadable: fall back to the channel answer, but say it is unconfirmed. The
// channel's build is one nobody supports yet, so it is still an update worth reporting.
const unreadable = decide({
  released: null,
  channel: { ...channelAhead, version: '1.91.00', versionCode: 19100000 },
  supportedVersions: supported,
});
equal('unreadable storefront -> still reports the channel', unreadable.hasUpdate, true);
equal('unreadable storefront -> unconfirmed', unreadable.confirmed, false);
equal('unreadable storefront -> nothing claimed as released', unreadable.released, null);

// A storefront that matches what we support, while the channel is also up to date.
const quiet = decide({
  released: { version: '1.90.05', versionCode: 19005000, binaryId: 'x' },
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

console.log(
  failures === 0
    ? 'UpstreamCheckTest: OK (every expectation held)'
    : `UpstreamCheckTest: ${failures} FAILURE(S)`
);
process.exit(failures === 0 ? 0 : 1);
