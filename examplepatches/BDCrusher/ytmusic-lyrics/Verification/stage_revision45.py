"""Stage the verified Library verifier hotfix; preserve older distributions."""
from pathlib import Path
import hashlib
import json
import shutil
import xml.etree.ElementTree as ET

home = Path(__file__).resolve().parents[1]
repo = home / 'Personal-Patches'
work = home / 'Verification/revision45'
version = '0.8.0-beta.2'
read = lambda path: json.loads(path.read_text(encoding='utf-8-sig'))
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
def dump(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')

bundle = repo / f'lyrics-collection/build/libs/lyrics-collection-{version}.mpp'
digest = sha(bundle)
freeze = read(work / 'source-freeze.json')
assert freeze['candidateSha256'] == digest
for name, expected in freeze['sourceSha256'].items():
    assert sha(home / name) == expected, name
assert set(freeze['changedSinceBeta1']) == {
    'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/common/DebugLogPolicy.java',
    'Personal-Patches/gradle.properties',
    'Personal-Patches/patches/src/main/kotlin/app/bdcrusher/ytmusic/playlists/DownloadsHostPatch.kt',
    'Personal-Patches/patches/src/main/resources/bdcrusher-common/NOTICE.txt'}
assert 'BUILD SUCCESSFUL' in (work / 'build.log').read_text(encoding='utf-8')
assert 'PASS: matrix uses one unchanged bundle SHA256 ' + digest in (work / 'matrix.log').read_text(encoding='utf-8')
tasks = ['auditPersonalFeatures', 'auditModelEntry', 'auditDownloads40', 'auditDownloads41',
         'auditDownloads42', 'auditDownloads43', 'auditDownloads44', 'auditReferenceReturns45']
for task in tasks:
    assert 'PASS: ' + task in (work / 'audits.log').read_text(encoding='utf-8'), task

previous = read(repo / 'dist/0.8.0-beta.1/verification.json')
sources = {path.name: path for path in (repo / 'extensions/music/src/main/java').rglob('*.java')}
sources['ListenableFuture.java'] = repo / 'extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java'
checks = {}
for key, evidence in previous['javaChecks'].items():
    if key == 'normalLogger':
        continue
    hashes = evidence.get('sources', evidence.get('sourceSha256', evidence.get('actualSourceSha256', {})))
    assert hashes, key
    if isinstance(hashes, str):
        assert hashes in {sha(path) for path in sources.values()}, key
    else:
        for name, expected in hashes.items():
            assert sha(home / name if '/' in name or '\\' in name else sources[name]) == expected, (key, name)
    checks[key] = dict(evidence, evidenceProvenance='Inherited beta.1 fixture evidence; all named production-source hashes revalidated for beta.2.')
inherited = sum(item['checks'] for item in checks.values())
debug = read(work / 'debug/verification.json')
assert debug['passed'] and debug['checks'] == 39
for name, expected in debug['sourceSha256'].items():
    assert sha(sources[name]) == expected, name
checks['normalLogger'] = dict(debug, evidenceFile='Verification/revision45/debug/verification.json',
                              evidenceSha256=sha(work / 'debug/verification.json'),
                              evidenceProvenance='Fresh production-source fixtures; Android boundaries explicitly simulated.')
assert inherited == 781

files = {'compiledFeatureAudits': 'personal-features-audit.json', 'nativeLyricsAudits': 'native-replay-audit.json',
         'nativeDownloadAudits': 'downloads40-audit.json', 'downloadSettingsAudits': 'downloads41-audit.json',
         'nativeDownloadContextAudits': 'downloads42-audit.json', 'nativeDownloadOwnerAudits': 'downloads43-audit.json',
         'nativeReceiverAudits': 'downloads44-audit.json', 'referenceReturnAudits': 'reference-returns45-audit.json'}
audits = {key: {} for key in files}
runs = {}
for case in read(work / 'matrix-plan.json')['cases']:
    folder = Path(case['directory']); result = read(folder / 'verification.json')
    assert result['bundleSha256'] == digest
    key = case['target'] + '/' + case['mode']; runs[key] = result
    if case['mode'] == 'features-missing-downloads':
        assert result['expectedFailure']; continue
    apk = Path(result['outputUnsignedApk']); apk_hash = sha(apk)
    assert result['outputUnsignedApkSha256'] == apk_hash
    assert result['sdkDexVerification'] and result['assetIdentity'] and result['duplicateClasses'] == 0
    for group, name in files.items():
        if group == 'nativeLyricsAudits' and case['mode'].startswith('without-lyrics'):
            continue
        evidence = read(folder / name)
        assert evidence['passed'] and evidence['apkSha256'] == apk_hash, (key, group)
        audits[group][key] = evidence
    assert audits['referenceReturnAudits'][key]['contentBranchCases'] == 4
    assert not audits['referenceReturnAudits'][key]['failures']
assert len(runs) == 10 and len(audits['referenceReturnAudits']) == 8 and len(audits['nativeLyricsAudits']) == 6
regressions = [read(Path(name).parent / 'reference-returns45-released-regression-final.json')
               for name in (work / 'released-manifest.txt').read_text().splitlines() if name]
assert len(regressions) == 2 and all(item['releasedRegressionReproduced'] for item in regressions)
assert all(len(item['failures']) == 1 and 'bd_downloadContent' in item['failures'][0] for item in regressions)
catalog = read(home / 'Verification/scratch/revision45-catalog/categories.json')
metadata = read(home / 'Verification/scratch/revision45-catalog/target-metadata.json')
jam = read(home / 'Verification/scratch/revision45-jam-unsupported/verification.json')
assert catalog['bundleSha256'] == metadata['bundleSha256'] == jam['bundleSha256'] == digest
assert metadata['passed'] and jam['expectedFailure']
assert {item['category'] for item in catalog['patches']} == {'Full Collection', 'Shaders', 'Playlist downloads'}
payload = read(work / 'owned-payload.json'); full_payload = read(work / 'payload.json')
for item in [payload, full_payload]:
    assert item['ok'] and not item['duplicateClasses'] and not item['outsideAllowedPrefixes']
    assert item['inputs'][0]['sha256'] == digest
manifest = read(work / 'manifest-audit.json')
assert manifest['passed'] and len(manifest['apks']) == 8
web = {}
for name, expected in previous['webSourceSha256'].items():
    if name.endswith('NOTICE.txt'):
        assert (repo / name).read_text(encoding='utf-8').replace(version, '0.8.0-beta.1') == (repo / 'dist/0.8.0-beta.1/THIRD-PARTY-NOTICES.txt').read_text(encoding='utf-8')
    else:
        assert sha(repo / name) == expected, name
    web[name] = sha(repo / name)
tests = []
for path in (repo / 'patches/build/test-results/test').glob('TEST-*.xml'):
    test = ET.parse(path).getroot()
    assert int(test.attrib.get('failures', 0)) == int(test.attrib.get('errors', 0)) == 0
    tests.append(dict(test.attrib))
assert tests
issues = [item.attrib for item in ET.parse(repo / 'extensions/music/build/reports/lint-results-release.xml').getroot().findall('issue')]
assert not any(item['severity'] in ('Error', 'Fatal') for item in issues)
report = dict(previous)
report.update(version=version, bundleSha256=digest, runs=runs, **audits, catalog=catalog, targetMetadata=metadata,
              jam94351Rejection=jam, manifestAudit=manifest, javaChecks=checks, javaCheckTotal=820,
              freshJavaCheckTotal=39, inheritedJavaCheckTotal=inherited, webSourceSha256=web,
              excludedStaleEvidenceGroups=['beta.1 normalLogger evidence replaced by fresh beta.2 version-context checks'],
              jvmTests=tests, lint={'errors': 0, 'warnings': sum(item['severity'] == 'Warning' for item in issues)},
              payloadIsolation=payload, fullMusicPayloadIsolation=full_payload, phoneVerified=False,
              sourceFreezeSha256=sha(work / 'source-freeze.json'), changedProductionFiles=freeze['changedSinceBeta1'],
              releasedLibraryVerifierRegression=regressions,
              implementation='Research/LIBRARY-VERIFIER-FIX-0.8.0-BETA.2-2026-11-02.md')
report['completeness'] = {'knownCrashSourceCorrected': True, 'releasedRegressionReproducedOnBothTargets': True,
                          'compiledAndSimulatedVerified': True, 'publicationPending': True,
                          'phoneAcceptancePending': True, 'preservesAppData': True}
report['verificationLimits'] = ['The earlier SDK serialization/reference/access passes did not detect this invalid return. The new scoped data-flow audit does.',
                               'Dexlib plus SDK hierarchy analysis and branch fixtures are not the full ART verifier.',
                               'Actual Library reopening and broader player/UI/offline acceptance remain phone checks.']
dist = repo / 'dist' / version
assert not dist.exists(); dist.mkdir()
shutil.copy2(bundle, dist / f'bdcrusher-ytmusic-lyrics-{version}.mpp')
dump(dist / 'verification.json', report); dump(dist / 'patches-list.json', catalog)
for name in ['SOURCE-PINS.json', 'LICENSE', 'NOTICE']:
    shutil.copy2(repo / name, dist / name)
shutil.copy2(repo / 'patches/src/main/resources/bdcrusher-common/NOTICE.txt', dist / 'THIRD-PARTY-NOTICES.txt')
shutil.copy2(home / report['implementation'], dist / 'IMPLEMENTATION.md')
compat = f'''# Compatibility — {version}

Fixes the **Library VerifyError introduced in 0.8.0-beta.1**. The native content bridge now has separate typed ViewGroup and explicit null returns, with safe fallback for missing/non-container content. Existing Audio/Video downloads, playlist routing and native-player integration are retained; files, lyrics, settings, credentials and chosen-folder grants are unchanged.

Exact experimental original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batching requires Downloads plus Download playlist. Jam remains 9.42.52-only. Do not combine complete collections. MPP SHA256 `{digest}`.

Build/JVM/lint, **8 positive configurations**, **2 missing-Downloads rejections**, catalog/Jam guards and **8 compiled audit groups** pass. New control-flow/register-type analysis reproduces beta.1's bad reference return on both targets and checks all selected bridge returns in the corrected outputs. Four actual-DEX content fixtures per output cover absent root, missing/wrong content and valid container. This is scoped desktop analysis, not complete ART verification.

**820 source/harness checks: 39 fresh normal-logger checks, 781 inherited after exact source-hash validation.** Other production files match beta.1 except the bridge, version, logger version and notice version. Existing renderer/retrieval/playback fixture evidence is inherited rather than described as fresh device testing.

Reopening Library on the Samsung phone remains required acceptance. Native playback/decoder/queue, Audio/Video switching, offline actions, sheet/Downloads appearance, Samsung navigation, Shaders and recording-free lyric smoothness remain phone checks. The approved matching-component catalogue stays inside Library Downloads; the stock offline database is untouched. No MuMu/device, signing, installation, actual media downloading or cleanup operations occurred.

Refresh the beta source with Pre-release patches and Experimental app versions enabled and **repatch a supported original APK**. Refreshing the feed alone does not fix an installed APK. The playlist-header download button uses your configured mode: In-app shows one Audio/Video sheet for the batch; External sends the playlist URL to the selected app; Default retains native handling. Enable Download playlist during patch selection for in-app batching, not as an extra per-download menu step. Existing Enable debug logging / Export debug logs remains available without a timer.
'''
(dist / 'COMPATIBILITY.md').write_text(compat, encoding='utf-8')
(dist / 'SHA256SUMS.txt').write_text(''.join(sha(path) + '  ' + path.name + '\n' for path in sorted(dist.iterdir()) if path.is_file()), encoding='utf-8')
dump(work / 'completeness-review.json', {'knownCrashSourceCorrected': True, 'compiledVerified': True,
     'sourceChecks': 820, 'fresh': 39, 'inherited': inherited, 'publicationPending': True,
     'phoneAcceptancePending': True, 'bundleSha256': digest, 'dist': str(dist)})
print(json.dumps({'dist': str(dist), 'bundleSha256': digest, 'sourceChecks': 820,
                  'fresh': 39, 'inherited': inherited, 'phoneVerified': False}, indent=2))
