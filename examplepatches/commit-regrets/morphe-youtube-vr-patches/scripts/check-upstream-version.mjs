// scripts/check-upstream-version.mjs
// Checks Meta Quest Store for new releases of YouTube VR (com.google.android.apps.youtube.vr.oculus).
// Compares against pinned targets in patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt.
//
// Two sources, because one of them is not what it looks like (measured 2026-10-15):
//
//   * `graph.oculus.com` with this app's own access token answers
//     `release_channels.nodes[].latest_supported_binary`, and for channel LIVE it returned
//     **1.89.09 / binary 28727061943646433**, created 2026-09-29.
//   * the public store page embeds *the same field name* for the same channel id
//     (545256815955045) and returned **1.88.10 / binary 28655433784142583**.
//
// Same channel, different binary: the authenticated view is the newest binary *uploaded* to the
// channel, the storefront's is the one actually *released* to users. The first run to trust the
// token's answer filed an issue for a version nobody could download yet -- the store page still
// offered 1.88.10, and the maintainer's checklist starts with "obtain the APK".
//
// So the verdict comes from the storefront, and the channel answer is reported next to it as the
// early signal it actually is ("uploaded, not released yet"). If the storefront cannot be read the
// decision falls back to the channel (the old behaviour) and says so, rather than going quiet and
// missing a release.

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
// The Constants.kt reader is shared with the release-notes plugin (scripts/supported-versions.mjs
// -- one parser, mirrored by SupportedVersionsPolicyTest), so the upstream decision and the
// release notes can never disagree about what "supported" means.
import {
  parseSupportedVersions as parseSupportedVersionsFrom,
  readSupportedVersionsFile,
} from './supported-versions.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const REPO_ROOT = path.resolve(__dirname, '..');

const APP_ID = '2002317119880945';
const STORE_ACCESS_TOKEN = 'OC|752908224809889|';
const GRAPHQL_ENDPOINT = 'https://graph.oculus.com/graphql';
const DOC_ID_RELEASE_CHANNELS = '3828663700542720';

const STORE_PAGE_URL = 'https://www.meta.com/en-gb/experiences/youtube/2002317119880945/';
// A browser user-agent gets HTTP 400 from this page, and anything else gets the cookie-consent
// shell (which carries no app data at all). Meta's own crawler UA gets the full server-rendered
// payload, which is where the released binary lives. Both measured 2026-10-15; if Meta ever stops
// honouring it the script falls back to the channel answer and says so.
const STORE_PAGE_UA = 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)';

const ISSUE_BODY_FILE = path.join(REPO_ROOT, 'scripts', 'upstream-update-issue.md');

async function fetchLatestStoreBinary() {
  const body = new URLSearchParams({
    access_token: STORE_ACCESS_TOKEN,
    doc_id: DOC_ID_RELEASE_CHANNELS,
    variables: JSON.stringify({ applicationID: APP_ID }),
  });

  const res = await fetch(GRAPHQL_ENDPOINT, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: body.toString(),
  });

  if (!res.ok) {
    throw new Error(`Meta Quest Store API returned HTTP ${res.status}: ${res.statusText}`);
  }

  const data = await res.json();
  const channels = data?.data?.node?.release_channels?.nodes;
  if (!channels || channels.length === 0) {
    throw new Error('No release channels found in Meta Quest Store response');
  }

  // Look for LIVE channel, fallback to first channel
  const liveChannel = channels.find((c) => c.channel_name === 'LIVE') || channels[0];
  const binary = liveChannel.latest_supported_binary;
  if (!binary || !binary.version) {
    throw new Error(`No latest_supported_binary found in channel "${liveChannel.channel_name}"`);
  }

  return {
    channel: liveChannel.channel_name,
    channelId: liveChannel.id,
    version: binary.version,
    versionCode: binary.version_code,
    createdDate: binary.created_date ? new Date(binary.created_date * 1000).toISOString() : null,
    binaryId: binary.id,
  };
}

/**
 * The binary a viewer would actually download, read out of the public store page.
 *
 * `viewer_release_channel` is preferred because that is literally "the channel this viewer gets";
 * the page's `app_store_item` node carries the same binary under a bare `latest_supported_binary`,
 * and is used as a fallback for when the payload's shape changes.
 */
export function extractStorefrontBinary(html) {
  // The app-store-item copy of the same binary, which is the one that carries `version_code`.
  const storeItem = firstVersionedBinary(html);
  const marker = '"viewer_release_channel":';
  const at = html.indexOf(marker);
  if (at >= 0) {
    // The channel object is small and its binary has no nested objects, so a window is enough.
    const viewer = firstVersionedBinary(html.slice(at, at + 2000));
    if (viewer) {
      return {
        ...viewer,
        // `viewer_release_channel`'s copy of the binary is just {__typename, version, id}: no
        // version code. The maintainer checklist asks for the code, so borrow it from the
        // store-item copy of the *same* binary id -- never from a different one.
        versionCode:
          viewer.versionCode ??
          (storeItem && storeItem.binaryId === viewer.binaryId ? storeItem.versionCode : null),
        source: 'viewer_release_channel',
      };
    }
  }
  return storeItem ? { ...storeItem, source: 'app_store_item' } : null;
}

/** The first `latest_supported_binary` in [scope] that carries a version. */
function firstVersionedBinary(scope) {
  for (const match of scope.matchAll(/"latest_supported_binary":\{([^{}]*)\}/g)) {
    const body = match[1];
    const version = /"version":"([^"]+)"/.exec(body);
    if (!version) {
      // Several of these carry no version at all (the privacy-info copy carries permissions).
      continue;
    }
    const code = /"version_code":(\d+)/.exec(body);
    const id = /"id":"([^"]+)"/.exec(body);
    return {
      version: version[1],
      versionCode: code ? Number(code[1]) : null,
      binaryId: id ? id[1] : null,
    };
  }
  return null;
}

async function fetchStorefrontBinary() {
  const res = await fetch(STORE_PAGE_URL, {
    headers: {
      'User-Agent': STORE_PAGE_UA,
      Accept: 'text/html,application/xhtml+xml',
      'Accept-Language': 'en-GB,en;q=0.9',
    },
  });
  if (!res.ok) {
    throw new Error(`store page returned HTTP ${res.status} ${res.statusText}`);
  }
  const html = await res.text();
  const binary = extractStorefrontBinary(html);
  if (!binary || !binary.version) {
    throw new Error('no released version found in the store page payload');
  }
  return binary;
}

/** Numeric, segment by segment: "1.10.0" is newer than "1.9.0". Missing parts count as zero. */
export function compareVersions(a, b) {
  const left = String(a).split('.').map((part) => Number.parseInt(part, 10) || 0);
  const right = String(b).split('.').map((part) => Number.parseInt(part, 10) || 0);
  for (let i = 0; i < Math.max(left.length, right.length); i++) {
    const diff = (left[i] || 0) - (right[i] || 0);
    if (diff !== 0) {
      return diff > 0 ? 1 : -1;
    }
  }
  return 0;
}

/**
 * What to report, given both answers. Pure, so it can be checked without the network.
 *
 * `released` is null when the storefront could not be read; the decision then falls back to the
 * channel's newest binary -- which is the behaviour that produced the false positive -- and
 * `confirmed` says so, so the issue and the summary can label it as unverified.
 */
export function decide({ released, channel, supportedVersions }) {
  const newestSupported = supportedVersions.reduce(
    (newest, version) => (compareVersions(version, newest) > 0 ? version : newest),
    '0.0.0'
  );

  const effective = released || channel;
  const supported = supportedVersions.includes(effective.version);
  const newer = compareVersions(effective.version, newestSupported) > 0;

  return {
    hasUpdate: !supported && newer,
    // Reported, never filed: an older build on the storefront is a rollback, not an update.
    isRollback: !supported && !newer,
    confirmed: Boolean(released),
    released,
    channel,
    supportedVersions,
    newestSupported,
    // "Uploaded to the channel but not on the storefront yet" -- the early signal.
    uploadedNotReleased: Boolean(released) && released.version !== channel.version,
  };
}

function parseSupportedVersions() {
  return parseSupportedVersionsFrom(readSupportedVersionsFile());
}

function setGithubOutput(key, value) {
  const outputFile = process.env.GITHUB_OUTPUT;
  if (outputFile) {
    fs.appendFileSync(outputFile, `${key}=${value}\n`, 'utf8');
  }
}

function appendGithubSummary(text) {
  const summaryFile = process.env.GITHUB_STEP_SUMMARY;
  if (summaryFile) {
    fs.appendFileSync(summaryFile, `${text}\n`, 'utf8');
  }
}

function describeBinary(binary) {
  if (!binary) {
    return 'unavailable';
  }
  const code = binary.versionCode ? ` (Code: \`${binary.versionCode}\`)` : '';
  return `\`${binary.version}\`${code}`;
}

function generateIssueBody(result) {
  const { released, channel, supportedVersions } = result;
  const target = released || channel;
  return `### 🚀 Upstream Update Detected

A new version of **YouTube VR** is on the Meta Quest Store:
- **Version**: \`${target.version}\`
${target.versionCode ? `- **Version Code**: \`${target.versionCode}\`\n` : ''}- **Package Name**: \`com.google.android.apps.youtube.vr.oculus\`
- **Store Item ID**: \`${APP_ID}\`
- **Store Page**: ${STORE_PAGE_URL}
- **Currently Supported in Repo**: ${supportedVersions.map((v) => `\`${v}\``).join(', ')}
${
  result.uploadedNotReleased
    ? `
> **Heads-up**: Meta's \`${channel.channel}\` channel already lists \`${channel.version}\` as its
> newest uploaded binary (id \`${channel.binaryId}\`${channel.createdDate ? `, created ${channel.createdDate}` : ''}).
> That is *not* what this issue is about — the storefront still serves \`${released.version}\`, and
> this issue tracks what a user can download.
`
    : ''
}
---

### Maintainer Checklist (from [\`docs/VERSIONING.md\`](docs/VERSIONING.md))

- [ ] **1. Obtain the APK**:
  - Back up the APK from headset using Quest Games Optimizer (QGO) or \`adb pull\` (see [\`docs/GETTING-THE-APK.md\`](docs/GETTING-THE-APK.md)).
- [ ] **2. Register in \`Constants.kt\`**:
  - Add \`AppTarget(version = "${target.version}", isExperimental = true, description = "Untested: ...")\` to [\`Constants.kt\`](patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt).
- [ ] **3. Test with diagnostics**:
  - Apply patch bundle with \`-OenableDiagnostics=true --force --continue-on-error\`.
  - Check which fingerprints fail in the patcher log.
- [ ] **4. Re-anchor fingerprints**:
  - Reference [\`docs/FINGERPRINTS.md\`](docs/FINGERPRINTS.md) and update matchers in \`patches/\`.
- [ ] **5. Verification**:
  - [ ] Bundle applies cleanly with zero failures.
  - [ ] Decompile patched dex and verify injected bytecode lands in correct target methods.
  - [ ] Headset test: Verify ad blocking, SponsorBlock segments, and playback work.
- [ ] **6. Release**:
  - Change target from \`isExperimental = true\` to verified target.
  - Commit and push to \`develop\` branch.
`;
}

async function main() {
  console.log('Querying Meta Quest Store for YouTube VR (App ID: ' + APP_ID + ')...');
  const channel = await fetchLatestStoreBinary();
  console.log(
    `Channel ${channel.channel} newest uploaded binary: ${channel.version} (version code: ${channel.versionCode}, id: ${channel.binaryId}${channel.createdDate ? `, created: ${channel.createdDate}` : ''})`
  );

  let released = null;
  let storefrontWarning = null;
  try {
    released = await fetchStorefrontBinary();
    console.log(
      `Storefront released binary: ${released.version} (binary id: ${released.binaryId}, via ${released.source})`
    );
  } catch (err) {
    storefrontWarning = err instanceof Error ? err.message : String(err);
    console.log(`Could not read the storefront (${storefrontWarning}); falling back to the channel answer`);
  }

  const supportedVersions = parseSupportedVersions();
  console.log(`Locally supported versions in Constants.kt: ${supportedVersions.join(', ')}`);

  const result = decide({ released, channel, supportedVersions });
  const effective = released || channel;

  setGithubOutput('has_update', result.hasUpdate.toString());
  setGithubOutput('latest_version', effective.version);
  setGithubOutput('latest_version_code', String(effective.versionCode ?? ''));
  setGithubOutput('release_channel', channel.channel);
  setGithubOutput('created_date', channel.createdDate || '');
  setGithubOutput('supported_versions', supportedVersions.join(', '));
  setGithubOutput('issue_body_path', ISSUE_BODY_FILE);
  setGithubOutput('verdict_confirmed', result.confirmed.toString());

  const summaryLines = [
    '### Meta Quest Store Version Check',
    `- **Storefront (released)**: ${describeBinary(released)}${released ? ` — binary \`${released.binaryId}\`` : ''}`,
    `- **Channel \`${channel.channel}\` (newest uploaded)**: ${describeBinary(channel)} — binary \`${channel.binaryId}\``,
    `- **Supported in Code**: ${supportedVersions.map((v) => `\`${v}\``).join(', ')}`,
  ];
  if (result.uploadedNotReleased) {
    summaryLines.push(
      `- ℹ️ The channel has \`${channel.version}\` uploaded but the storefront still serves \`${released.version}\` — not downloadable yet, so no issue is filed for it`
    );
  }
  if (result.isRollback) {
    summaryLines.push(
      `- ⚠️ The storefront serves \`${effective.version}\`, which is *older* than the newest supported \`${result.newestSupported}\` — a rollback, so no update is filed`
    );
  }
  if (storefrontWarning) {
    summaryLines.push(
      `- ⚠️ Storefront unreadable (\`${storefrontWarning}\`), so the verdict falls back to the channel answer and is **unconfirmed**`
    );
  }
  summaryLines.push(
    `- **Status**: ${
      result.hasUpdate
        ? `⚠️ **New version detected!**${result.confirmed ? '' : ' (unconfirmed — storefront unreadable)'}`
        : '✅ **Up to date**'
    }`
  );

  const summary = summaryLines.join('\n');
  console.log('\n' + summary);
  appendGithubSummary(summary);

  if (result.hasUpdate) {
    console.log(`\nNew upstream version ${effective.version} is not in Constants.kt!`);
    const issueBody = generateIssueBody(result);
    fs.writeFileSync(ISSUE_BODY_FILE, issueBody, 'utf8');
    console.log(`Wrote issue body template to: ${ISSUE_BODY_FILE}`);
  } else {
    console.log('\nYouTube VR is at the latest supported version in Constants.kt.');
    if (fs.existsSync(ISSUE_BODY_FILE)) {
      fs.unlinkSync(ISSUE_BODY_FILE);
    }
  }
}

// Importable for the checks in build/probe, still runs as the CI entry point.
if (process.argv[1] && path.resolve(process.argv[1]) === __filename) {
  main().catch((err) => {
    console.error('Error checking upstream version:', err);
    process.exit(1);
  });
}
