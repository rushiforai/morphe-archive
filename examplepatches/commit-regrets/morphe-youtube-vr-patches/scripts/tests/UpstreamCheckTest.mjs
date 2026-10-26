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

const supported = ['1.88.10'];

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
check('1.88.10 equals 1.88.10', compareVersions('1.88.10', '1.88.10') === 0);
check('1.87.0 is older than 1.88.10', compareVersions('1.87.0', '1.88.10') === -1);
check('1.88.10 is newer than 1.88.9', compareVersions('1.88.10', '1.88.9') === 1);

// ---- the decision ----------------------------------------------------------
const channelAhead = {
  channel: 'LIVE',
  channelId: '545256815955045',
  version: '1.89.09',
  versionCode: 18909000,
  createdDate: '2026-09-29T19:32:58.000Z',
  binaryId: '28727061943646433',
};

// Today's real case: the channel has a build uploaded that the storefront does not serve yet.
// This is the false positive the checker filed an issue for on 2026-10-15.
const live = decide({ released, channel: channelAhead, supportedVersions: supported });
equal('channel ahead of storefront -> no update', live.hasUpdate, false);
equal('channel ahead of storefront -> confirmed', live.confirmed, true);
equal('channel ahead of storefront -> noted', live.uploadedNotReleased, true);

// A genuine release: the storefront serves something new, so it is downloadable.
const genuine = decide({
  released: { version: '1.89.09', versionCode: 18909000, binaryId: 'x' },
  channel: channelAhead,
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

// Storefront unreadable: fall back to the channel answer, but say it is unconfirmed.
const unreadable = decide({ released: null, channel: channelAhead, supportedVersions: supported });
equal('unreadable storefront -> still reports the channel', unreadable.hasUpdate, true);
equal('unreadable storefront -> unconfirmed', unreadable.confirmed, false);
equal('unreadable storefront -> nothing claimed as released', unreadable.released, null);

// A storefront that matches what we support, while the channel is also up to date.
const quiet = decide({
  released: { version: '1.88.10', versionCode: 18810000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.88.10' },
  supportedVersions: supported,
});
equal('everything current -> no update', quiet.hasUpdate, false);
equal('everything current -> nothing pending', quiet.uploadedNotReleased, false);

// An experimental target for a *different* version does not cover 1.89.09: this repo matches
// versions exactly (an unlisted version is skipped, not failed -- see docs/VERSIONING.md), so a
// build that is not listed is still worth reporting.
const withExperimental = decide({
  released: { version: '1.89.09', versionCode: 18909000, binaryId: 'x' },
  channel: channelAhead,
  supportedVersions: ['1.88.10', '1.89.0'],
});
equal('an experimental target for 1.89.0 does not cover 1.89.09', withExperimental.hasUpdate, true);

// ...but an exact experimental target does.
const exactExperimental = decide({
  released: { version: '1.89.0', versionCode: 18900000, binaryId: 'x' },
  channel: { ...channelAhead, version: '1.89.0' },
  supportedVersions: ['1.88.10', '1.89.0'],
});
equal('an exact experimental target is supported', exactExperimental.hasUpdate, false);

console.log(
  failures === 0
    ? 'UpstreamCheckTest: OK (every expectation held)'
    : `UpstreamCheckTest: ${failures} FAILURE(S)`
);
process.exit(failures === 0 ? 0 : 1);
