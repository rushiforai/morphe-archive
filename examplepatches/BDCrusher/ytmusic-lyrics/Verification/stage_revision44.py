"""Stage the one exact verified combined native-download build. Never overwrite a distribution."""
from pathlib import Path
import json,hashlib,re,shutil,xml.etree.ElementTree as ET
h=Path(__file__).resolve().parents[1];r=h/'Personal-Patches';w=h/'Verification/revision44';version='0.8.0-beta.1'
read=lambda p:json.loads(p.read_text(encoding='utf-8-sig'))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def dump(p,d):p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
bundle=r/f'lyrics-collection/build/libs/lyrics-collection-{version}.mpp';digest=sha(bundle);freeze=read(w/'source-freeze-r3.json');assert freeze['candidateSha256']==digest
for n,v in freeze['sourceSha256'].items():assert sha(h/n)==v,n
assert 'BUILD SUCCESSFUL' in (w/'build-final-r4.log').read_text(encoding='utf-8')
assert 'PASS: matrix uses one unchanged bundle SHA256 '+digest in (w/'matrix-final-r3.log').read_text(encoding='utf-8')
for task in ['auditPersonalFeatures','auditModelEntry','auditDownloads40','auditDownloads41','auditDownloads42','auditDownloads43','auditDownloads44']:assert 'PASS: '+task in (w/'audits-final-r3.log').read_text(encoding='utf-8'),task
prev=read(r/'dist/0.7.0-beta.5/verification.json');sources={p.name:p for p in (r/'extensions/music/src/main/java').rglob('*.java')};sources['ListenableFuture.java']=r/'extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java';indexed={sha(p):p for p in sources.values()}
checks={};excluded=[]
replaced={'opusQuality','localByteTransport','nativeMediaCache','normalLogger','externalNative','nativePagesAndArtwork','playlistRouting','downloadRoutingAndStorage'}
for key,d in prev['javaChecks'].items():
 if key in replaced:excluded.append(key);continue
 hashes=d.get('sources',d.get('sourceSha256',d.get('actualSourceSha256',{})));assert hashes
 valid=hashes in indexed if isinstance(hashes,str) else all(sha(h/n if '/' in n or '\\' in n else sources[n])==v for n,v in hashes.items())
 assert valid,('stale inherited group',key)
 checks[key]={**d,'evidenceProvenance':'Inherited beta.5 production-source fixtures; every named source hash revalidated for this release.'}
inherited=sum(d['checks'] for d in checks.values())
freshMap={'downloadRoutingAndStorage':'downloads-final/result.json','mediaQualityAndRangeState':'media-policy/result.json','localByteTransport':'transport-r2/result.json','itemTransferAndResume':'transfer-r3/result.json','nativeMediaCache':'native-cache-final-r2/result.json','downloadCatalogue':'catalogue-r3/result.json','playlistRouting':'playlists-r5/verification.json','nativeWatchEntry':'native-entry/result.json','atomicSongMetadata':'atomic-metadata/result.json','normalLogger':'debug/verification.json','externalNative':'external-native/result.json','nativePagesAndArtwork':'page-io-r2/verification.json'}
fresh=0
for key,name in freshMap.items():
 p=w/name;d=read(p);hashes=d.get('sources',d.get('sourceSha256',{}));assert hashes
 for n,v in hashes.items():assert sha(h/n if '/' in n or '\\' in n else sources[n])==v,(key,n)
 count=d.get('checks');count=count if isinstance(count,int) else sum(map(int,re.findall(r'PASS (\d+)',d.get('stdout',''))));assert count>0
 d.update(checks=count,evidenceFile=p.relative_to(h).as_posix(),evidenceSha256=sha(p),evidenceProvenance='Fresh production-source fixtures with explicitly simulated platform/native/auth/codec/app-launch seams. Final APK contracts are separately audited.')
 checks[key]=d;fresh+=count
runs={};audits={key:{} for key in ['compiledFeatureAudits','nativeLyricsAudits','nativeDownloadAudits','downloadSettingsAudits','nativeDownloadContextAudits','nativeDownloadOwnerAudits','nativeReceiverAudits']}
files={'compiledFeatureAudits':'personal-features-audit.json','nativeLyricsAudits':'native-replay-audit.json','nativeDownloadAudits':'downloads40-audit.json','downloadSettingsAudits':'downloads41-audit.json','nativeDownloadContextAudits':'downloads42-audit.json','nativeDownloadOwnerAudits':'downloads43-audit.json','nativeReceiverAudits':'downloads44-audit.json'}
for case in read(w/'matrix-plan-r3.json')['cases']:
 folder=Path(case['directory']);run=read(folder/'verification.json');assert run['bundleSha256']==digest;key=case['target']+'/'+case['mode'];runs[key]=run
 if case['mode']=='features-missing-downloads':assert run['expectedFailure'];continue
 apk=Path(run['outputUnsignedApk']);assert sha(apk)==run['outputUnsignedApkSha256'] and run['sdkDexVerification'] and run['assetIdentity'] and run['duplicateClasses']==0
 for target,name in files.items():
  if target=='nativeLyricsAudits' and case['mode'].startswith('without-lyrics'):continue
  report=read(folder/name);assert report['passed'] and report['apkSha256']==sha(apk);audits[target][key]=report
 assert audits['compiledFeatureAudits'][key]['unresolvedRuntimeReferences']==audits['compiledFeatureAudits'][key]['invalidInjectedCalls']==0
assert len(runs)==14 and len(audits['compiledFeatureAudits'])==12 and len(audits['nativeLyricsAudits'])==10
catalog=read(h/'Verification/scratch/revision44-final-r3-catalog/categories.json');metadata=read(h/'Verification/scratch/revision44-final-r3-catalog/target-metadata.json');jam=read(h/'Verification/scratch/revision44-final-r3-jam-unsupported/verification.json')
assert catalog['bundleSha256']==metadata['bundleSha256']==jam['bundleSha256']==digest and metadata['passed'] and jam['expectedFailure'];assert {p['category'] for p in catalog['patches']}=={'Full Collection','Shaders','Playlist downloads'}
payload=read(w/'payload-r3.json');strict=read(w/'payload-strict-r3.json');assert payload['ok'] and not payload['duplicateClasses'] and not payload['outsideAllowedPrefixes'] and payload['inputs'][0]['sha256']==digest;assert strict['outsideAllowedPrefixes']==['Lcom/android/tools/r8/RecordTag;']
manifest=read(w/'manifest-audit-r3.json');assert manifest['passed'] and len(manifest['apks'])==12
web={}
for n,v in prev['webSourceSha256'].items():
 if n.endswith('NOTICE.txt'):assert (r/n).read_text(encoding='utf-8').replace(version,'0.7.0-beta.5')==(r/'dist/0.7.0-beta.5/THIRD-PARTY-NOTICES.txt').read_text(encoding='utf-8')
 else:assert sha(r/n)==v,n
 web[n]=sha(r/n)
for n,v in prev['liveDirectProviders']['sourceSha256'].items():assert sha(sources[n])==v,n
tests=[]
for p in (r/'patches/build/test-results/test').glob('TEST-*.xml'):
 t=ET.parse(p).getroot();assert int(t.attrib.get('failures',0))==int(t.attrib.get('errors',0))==0;tests.append(dict(t.attrib))
assert tests
issues=[i.attrib for i in ET.parse(r/'extensions/music/build/reports/lint-results-release.xml').getroot().findall('issue')];assert not any(i['severity'] in ('Error','Fatal') for i in issues)
report=dict(prev);report.update(version=version,bundleSha256=digest,runs=runs,catalog=catalog,targetMetadata=metadata,jam94351Rejection=jam,**audits,manifestAudit=manifest,javaChecks=checks,javaCheckTotal=fresh+inherited,freshJavaCheckTotal=fresh,inheritedJavaCheckTotal=inherited,excludedStaleEvidenceGroups=excluded,webSourceSha256=web,webNoticeVersionOnly=True,jvmTests=tests,lint={'errors':0,'warnings':sum(i['severity']=='Warning' for i in issues)},payloadIsolation=payload,compilerOnlyOutsideOwnedNamespace=strict['outsideAllowedPrefixes'],phoneVerified=False,sourceFreezeSha256=sha(w/'source-freeze-r3.json'),implementation='Research/NATIVE-DOWNLOADS-0.8.0-BETA.1-2026-11-02.md')
report['limitations']=['The native offline database/provider is not modified; owned files use the approved matching-component fallback inside Library Downloads.','Actual phone sheet/insets, Library presentation, native player/session/decoder, Audio/Video switching, queue and native offline network-action states require acceptance.','External-folder media remains read-only with the existing exact-ID and codec restrictions.','Existing Shaders/Samsung navigation and recording-free lyric smoothness remain phone acceptance; desktop results are not a zero-stutter guarantee.','No MuMu, signing, installation, real media downloads or cleanup were performed.']
report['completeness']={'sourceImplemented':True,'compiledAndSimulatedVerified':True,'nativeProviderFallbackUsed':True,'publicationPending':True,'phoneAcceptancePending':True,'noTimedDebugCapture':True,'previousHeaderReceiverRegressionReproducedOnBothTargets':True,'preservesAppData':True}
dist=r/'dist'/version;assert not dist.exists();dist.mkdir();shutil.copy2(bundle,dist/f'bdcrusher-ytmusic-lyrics-{version}.mpp');dump(dist/'verification.json',report);dump(dist/'patches-list.json',catalog)
for n in ['SOURCE-PINS.json','LICENSE','NOTICE']:shutil.copy2(r/n,dist/n)
shutil.copy2(r/'patches/src/main/resources/bdcrusher-common/NOTICE.txt',dist/'THIRD-PARTY-NOTICES.txt');shutil.copy2(h/'Research/NATIVE-DOWNLOADS-0.8.0-BETA.1-2026-11-02.md',dist/'IMPLEMENTATION.md')
compat=f'''# Compatibility — {version}

Original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batches require Downloads and Download playlist. Jam remains 9.42.52-only. Do not combine complete collections. MPP SHA256 `{digest}`.

Fixes the constructor receiver clobber and invalid-owner poisoning. Adds the Audio/Video sheet, dual-stream saved media, durable range recovery, shared progress/status icons and native-watch playback. Owned downloads render inside the existing Library Downloads destination using the approved native-component fallback. The native offline database/provider is not altered. Default account handling and native authorization rejection are preserved. Existing files, lyrics, credentials, preferences and chosen-folder grants remain.

Build/JVM/lint, **12 positive selections** and **2 missing-Downloads rejections**, catalog/Jam guards, compiled feature/access/reference, Lyrics, media, settings, target/context and receiver-flow audits pass. **{fresh+inherited} source/harness checks: {fresh} fresh, {inherited} inherited after source-hash validation.** The receiver audit reproduces the broken previous release on both targets. Android views/codecs/auth/client and launch boundaries are simulated in fixtures; actual APK contracts are audited separately. This is not phone acceptance.

Phone acceptance remains for quality-sheet appearance/insets, Library, native mini-player expansion, actual decoding/Audio-Video switching, queue shuffle/repeat, online/offline transitions and native offline network-action states. Existing Samsung navigation/Shaders and recording-free Lyrics performance remain device checks. No universal zero-stutter or pixel-parity claim. No MuMu, signing, installation, actual media downloading or cleanup.

Refresh the source with Pre-release patches and Experimental app versions enabled, then repatch an original supported APK. **Morphe → Player → Downloads → In-app** opens the quality sheet; External keeps the selected app's review flow. Enable Download playlist for whole-playlist batches. **Library → Downloads** opens the integrated destination. Use the existing Enable debug logging / Export debug logs; no timer.
'''
(dist/'COMPATIBILITY.md').write_text(compat,encoding='utf-8');(dist/'SHA256SUMS.txt').write_text(''.join(sha(p)+'  '+p.name+'\n' for p in sorted(dist.iterdir()) if p.is_file()),encoding='utf-8')
dump(w/'completeness-review.json',{'sourceImplemented':True,'compiledVerified':True,'sourceChecks':fresh+inherited,'fresh':fresh,'inherited':inherited,'publicationPending':True,'phoneAcceptancePending':True,'bundleSha256':digest,'dist':str(dist),'scope':'Approved combined native-download plan; provider fallback and device acceptance explicitly recorded.'})
print(json.dumps({'dist':str(dist),'bundleSha256':digest,'sourceChecks':fresh+inherited,'fresh':fresh,'inherited':inherited,'phoneVerified':False},indent=2))
