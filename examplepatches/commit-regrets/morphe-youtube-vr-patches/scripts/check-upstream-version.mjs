// scripts/check-upstream-version.mjs
// Checks Meta Quest Store for new releases of YouTube VR (com.google.android.apps.youtube.vr.oculus).
// Compares against pinned targets in patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt.
//
// Two sources: the graph.oculus.com channel answer (newest binary uploaded to LIVE) and the
// public store page (readable only signed out, lags the channel by days). The issue files off
// the newest release either source reports -- gating it on the page delayed every issue by days
// and never surfaced 1.92.11 (2026-11-24 policy change, after #40 and the DownQuest measurement).

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
// Shared with the release-notes plugin (scripts/supported-versions.mjs), so the upstream
// decision and the release notes can never disagree about what "supported" means.
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
// Meta's crawler UA gets the full server-rendered payload, which is where the binary lives. If
// Meta stops honouring it the script falls back to the channel answer and says so.
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
 * The binary the public store page advertises to a signed-out visitor, read out of its payload.
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
 * The newest build either source reports drives the decision -- the channel in practice.
 * `confirmed` is false when the page could not be read to corroborate.
 */
export function decide({ page, channel, supportedVersions }) {
  const newestSupported = supportedVersions.reduce(
    (newest, version) => (compareVersions(version, newest) > 0 ? version : newest),
    '0.0.0'
  );
  const isNewer = (version) => compareVersions(version, newestSupported) > 0;

  // Which of the two is behind decides what the summary may say.
  const pageLagsChannel = Boolean(page) && compareVersions(channel.version, page.version) > 0;
  const pageAheadOfChannel = Boolean(page) && compareVersions(page.version, channel.version) > 0;
  const newest = pageAheadOfChannel ? page : channel;

  return {
    hasUpdate: !supportedVersions.includes(newest.version) && isNewer(newest.version),
    confirmed: Boolean(page),
    page,
    channel,
    supportedVersions,
    newestSupported,
    pageLagsChannel,
    pageAheadOfChannel,
    // The newest release either source reports. Every consumer reads it from here, so the
    // issue title, body and summary can never disagree about which version is newest.
    newest,
    // Judged on the page alone, a page that had merely not caught up read as a rollback.
    isRollback: !supportedVersions.includes(newest.version) && !isNewer(newest.version),
  };
}

/**
 * The run summary's headline status. Pure, so the decision table can pin it. The page lagging
 * the channel is not news, so "Up to date" holds whenever the newest known release is supported.
 */
export function statusLine(result) {
  if (result.hasUpdate) {
    return `⚠️ **New version detected!**${result.confirmed ? '' : ' (unconfirmed — store page unreadable)'}`;
  }
  return '✅ **Up to date**';
}

/**
 * The run summary, pure so the decision table can pin it. The page gets a line only when it is
 * unreadable or an update it has not listed yet is being reported.
 */
export function summaryLines(result, pageWarning) {
  const { channel } = result;
  const newest = result.newest;
  const origin = result.pageAheadOfChannel
    ? 'store page'
    : `LIVE channel${channel.createdDate ? `, uploaded ${channel.createdDate.slice(0, 10)}` : ''}`;
  const lines = [
    '### Meta Quest Store Version Check',
    `- **Newest release**: ${describeBinary(newest)} — binary \`${newest.binaryId}\` — ${origin}`,
    `- **Supported in Code**: ${result.supportedVersions.map((v) => `\`${v}\``).join(', ')}`,
  ];
  if (result.hasUpdate && result.pageLagsChannel) {
    lines.push(
      `- ℹ️ The store page (signed out) still shows \`${result.page.version}\` — it has lagged the LIVE channel by days on every release; DownQuest can fetch the new build meanwhile`
    );
  }
  if (result.isRollback) {
    lines.push(
      `- ℹ️ The newest known release (\`${newest.version}\`, ${origin}) is older than the newest supported \`${result.newestSupported}\` — a rollback, so nothing is filed`
    );
  }
  if (pageWarning) {
    lines.push(`- ⚠️ Store page unreadable (\`${pageWarning}\`): checked against the LIVE channel only`);
  }
  lines.push(`- **Status**: ${statusLine(result)}`);
  return lines;
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
  const { page, supportedVersions } = result;
  const target = result.newest;
  return `### 🚀 Upstream Update Detected

A new version of **YouTube VR** is on the Meta Quest Store:
- **Version**: \`${target.version}\`
${target.versionCode ? `- **Version Code**: \`${target.versionCode}\`\n` : ''}- **Package Name**: \`com.google.android.apps.youtube.vr.oculus\`
- **Store Item ID**: \`${APP_ID}\`
- **Store Page**: ${STORE_PAGE_URL}
- **Currently Supported in Repo**: ${supportedVersions.map((v) => `\`${v}\``).join(', ')}
${
  result.pageLagsChannel
    ? `
> **Heads-up**: the signed-out store page still lists \`${page.version}\` — it has lagged the
> LIVE channel by days on every release, and DownQuest can fetch the new build before the page
> catches up (see docs/GETTING-THE-APK.md).
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

  let page = null;
  let pageWarning = null;
  try {
    page = await fetchStorefrontBinary();
    console.log(
      `Store page (signed out): ${page.version} (binary id: ${page.binaryId}, via ${page.source})`
    );
  } catch (err) {
    pageWarning = err instanceof Error ? err.message : String(err);
    console.log(`Could not read the store page (${pageWarning}); falling back to the channel answer`);
  }

  const supportedVersions = parseSupportedVersions();
  console.log(`Locally supported versions in Constants.kt: ${supportedVersions.join(', ')}`);

  const result = decide({ page, channel, supportedVersions });
  const effective = result.newest;

  setGithubOutput('has_update', result.hasUpdate.toString());
  setGithubOutput('latest_version', effective.version);
  setGithubOutput('latest_version_code', String(effective.versionCode ?? ''));
  setGithubOutput('release_channel', channel.channel);
  // `newest` can be the page's build, which carries no upload date; keep the two outputs
  // describing the same binary rather than pairing the page's version with the channel's date.
  setGithubOutput('created_date', effective.createdDate || '');
  setGithubOutput('supported_versions', supportedVersions.join(', '));
  setGithubOutput('issue_body_path', ISSUE_BODY_FILE);
  setGithubOutput('verdict_confirmed', result.confirmed.toString());

  const summary = summaryLines(result, pageWarning).join('\n');
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
