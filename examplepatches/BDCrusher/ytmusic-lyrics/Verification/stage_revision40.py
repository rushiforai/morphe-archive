"""Freeze only the locally verified 0.7 candidate; no publication or device operations."""
from pathlib import Path
import hashlib,json,shutil,re,xml.etree.ElementTree as ET
h=Path(__file__).resolve().parents[1];r=h/'Personal-Patches';w=h/'Verification/revision40';version='0.7.0-beta.1'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
read=lambda p:json.loads(p.read_text(encoding='utf-8-sig'))
def dump(p,d):p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
bundle=r/f'lyrics-collection/build/libs/lyrics-collection-{version}.mpp';digest=sha(bundle)
freeze=read(w/'source-freeze-r1.json');assert freeze['candidateSha256']==digest
for n,value in freeze['sourceSha256'].items():assert sha(h/n)==value,n
assert 'BUILD SUCCESSFUL' in (w/'build-eighteenth.log').read_text()
assert 'PASS: matrix uses one unchanged bundle SHA256 '+digest in (w/'matrix-final-r1.log').read_text()
assert 'PASS: 14 compiled native download/cache/artwork audits' in (w/'audits-final-r1.log').read_text()
prev=read(r/'dist/0.6.1-beta.1/verification.json');reconciled=read(w/'evidence-reconciliation-r2.json');assert reconciled['inheritedCheckTotal']==207 and not reconciled['unfinishedMarkers']
sources={p.name:p for p in (r/'extensions/music/src/main/java').rglob('*.java')};sources['ListenableFuture.java']=r/'extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java'
java=dict(reconciled['inheritedChecks'])
checks=[('opusQuality','quality/result.json','AudioQuality.java'),('localByteTransport','transport-r3/result.json',None),('nativeMediaCache','native-cache-r5/result.json',None),('externalNative','external-native-r2/result.json',None),('sponsorBlockChapters','chapters/result.json','DownloadChapters.java'),('shaderOwnership','shader/verification.json',None),('foregroundViewport','viewport/result.json','LyricsViewport.java'),('animatedCover','cover/result.json','AnimatedCoverSurface.java'),('playlistRouting','playlists-r3/verification.json',None),('nativePagesAndArtwork','page-io/verification.json',None),('externalFolder','external-files/verification.json',None)]
freshTotal=0
for key,name,single in checks:
 d=read(w/name);assert d.get('passed',True)
 if 'checks' not in d:d['checks']=int(re.search(r'PASS (\d+)',d['stdout']).group(1))
 hashes=d.get('sources',d.get('sourceSha256',{}))
 if isinstance(hashes,str):hashes={single:hashes}
 assert hashes
 for n,value in hashes.items():
  source=h/n if '/' in n or '\\' in n else sources[n]
  assert sha(source)==value,(name,n)
 d.update(passed=True,evidenceFile='Verification/revision40/'+name,evidenceSha256=sha(w/name),evidenceProvenance='Fresh actual-source harness; explicit platform/native/transport seams simulated, see scope and fixture source.')
 java[key]=d;freshTotal+=d['checks']
assert freshTotal==320 and sum(d['checks'] for d in java.values())==527
runs={};audits={};entries={};media={}
for c in read(w/'matrix-plan-r1.json')['cases']:
 folder=Path(c['directory']);d=read(folder/'verification.json');assert d['bundleSha256']==digest;key=c['target']+'/'+c['mode'];runs[key]=d
 if c['mode']=='features-missing-downloads':assert d['expectedFailure'];continue
 apk=Path(d['outputUnsignedApk']);assert sha(apk)==d['outputUnsignedApkSha256'] and d['sdkDexVerification'] and d['assetIdentity'] and d['duplicateClasses']==0
 a=read(folder/'personal-features-audit.json');assert a['passed'] and a['apkSha256']==sha(apk) and a['unresolvedRuntimeReferences']==0 and a['invalidInjectedCalls']==0;audits[key]=a
 m=read(folder/'downloads40-audit.json');assert m['passed'] and m['apkSha256']==sha(apk) and m['privateInvokeFailures']==0;media[key]=m
 if a['personalLyrics']:
  e=read(folder/'native-replay-audit.json');assert e['passed'] and e['apkSha256']==sha(apk);entries[key]=e
assert len(audits)==len(media)==14 and len(entries)==8
catalog=read(h/'Verification/scratch/revision40-final-r1-catalog/categories.json');metadata=read(h/'Verification/scratch/revision40-final-r1-catalog/target-metadata.json');jam=read(h/'Verification/scratch/revision40-final-r1-jam-unsupported/verification.json')
assert catalog['bundleSha256']==metadata['bundleSha256']==jam['bundleSha256']==digest and metadata['passed'] and jam['expectedFailure']
assert {p['category'] for p in catalog['patches']}=={'Full Collection','Shaders','Playlist downloads'}
payload=read(w/'payload-r1.json');strict=read(w/'payload-strict.json');assert payload['ok'] and not payload['duplicateClasses'] and not payload['outsideAllowedPrefixes'] and payload['inputs'][0]['sha256']==digest;assert strict['outsideAllowedPrefixes']==['Lcom/android/tools/r8/RecordTag;']
tests=[]
for p in (r/'patches/build/test-results/test').glob('TEST-*.xml'):
 t=ET.parse(p).getroot();assert int(t.attrib.get('failures',0))==int(t.attrib.get('errors',0))==0;tests.append(dict(t.attrib))
assert tests
issues=[i.attrib for i in ET.parse(r/'extensions/music/build/reports/lint-results-release.xml').getroot().findall('issue')];assert not any(i['severity'] in ('Error','Fatal') for i in issues)
native=set(prev['fullNativeModifiedSourceSha256'])|set('''extensions/music/src/main/java/app/morphe/extension/music/patches/DownloadsPatch.java
extensions/music/src/main/java/app/morphe/extension/music/patches/downloads/LocalDownloadManager.java
extensions/music/src/main/java/app/morphe/extension/music/patches/downloads/LocalDownloadsFragment.java
extensions/music/src/main/java/app/morphe/extension/music/sponsorblock/MusicSponsorBlockConfig.java
extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/spoof/requests/StreamingDataRequest.java
extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/sponsorblock/SegmentPlaybackController.java
patches/src/main/kotlin/app/morphe/patches/music/interaction/downloads/DownloadsPatch.kt
patches/src/main/kotlin/app/morphe/patches/music/layout/sponsorblock/SponsorBlockPatch.kt'''.splitlines())
for n,value in prev['liveDirectProviders']['sourceSha256'].items():assert sha(sources[n])==value,n
report={'version':version,'bundleSha256':digest,'experimentalTargets':prev['experimentalTargets'],'patcher':prev['patcher'],'patcherDependencies':prev['patcherDependencies'],'jamCompatibility':prev['jamCompatibility'],'jam94351Rejection':jam,'runs':runs,'catalog':catalog,'targetMetadata':metadata,'compiledFeatureAudits':audits,'nativeLyricsAudits':entries,'nativeDownloadAudits':media,'javaChecks':java,'javaCheckTotal':527,'freshJavaCheckTotal':320,'inheritedJavaCheckTotal':207,'excludedStaleEvidenceGroups':reconciled['replacedStaleGroups'],'browserChecks':prev['browserChecks'],'browserEvidenceProvenance':reconciled['webEvidence'],'webSourceSha256':reconciled['webSourceSha256'],'webNoticeVersionOnly':True,'liveDirectProviders':prev['liveDirectProviders'],'liveProviderEvidenceProvenance':'Inherited previous public Java lookups with exact source hashes; no new live/media download requests in this revision.','jvmTests':tests,'lint':{'errors':0,'warnings':sum(i['severity']=='Warning' for i in issues)},'payloadIsolation':{'uniqueSelectedClasses':payload['uniqueSelectedClasses'],'duplicateClasses':0,'morpheImplementationClassesInPersonalPayload':0,'compilerHelper':'Lcom/android/tools/r8/RecordTag;','nativeCompileOnlyContractsPreserved':True},'sourceSha256':{p.relative_to(r).as_posix():sha(p) for p in sorted((r/'extensions/music/src/main/java/app/bdcrusher/ytmusic').rglob('*.java'))},'hookSourceSha256':{p.relative_to(r).as_posix():sha(p) for n in ['shared-lyrics-patches/src','lyrics-addon/src','patches/src/main/kotlin/app/bdcrusher'] for p in sorted((r/n).rglob('*.kt'))},'fullNativeModifiedSourceSha256':{n:sha(r/n) for n in sorted(native)},'completenessReview':{'passed':True,'unfinishedMarkers':[],'sourceFreezeSha256':sha(w/'source-freeze-r1.json'),'selectedNativeGuardsReplaced':True,'nativePairedEntryCoverage':'8 paired and 9 player methods on inspected 9.43 profile; exact per-target counts in nativeDownloadAudits','nativeClockEvidence':'Original native player response factories use clock.b(); production clock.b delegates to SystemClock.elapsedRealtime. Retained native-9.43.51-player-clock/native-clock bytecode evidence.'},'phoneVerified':False,'deviceOperations':False,'realPlaylistDownloadsLaunched':False,'globalToolsCopied':False,'limitations':['Native offline byte delivery/next-player adaptation is implemented and structurally audited, but requires real phone decoder/queue/SAF acceptance.','External folder indexing must finish; native next metadata must have been prepared online. Native external adapter supports seekable WebM/Opus and M4A/AAC-LC only.','Native row status uses accessible subtitle symbols/text rather than a verified stock circular badge renderer.','SponsorBlock chapters are sidecars with existing colored seekbar/skip integration, without embedded media chapter tags or a new native chapter picker.','Slow cover readback retains a frame for moving Kawarp mesh; native cover decoding still loops.','Recording-free stutter, visible Samsung transparency, main/Lyrics graphics/video, large fonts/themes and Recents timing remain phone acceptance. No universal zero-stutter claim.','Underlying source/service access restrictions and prior combined verification challenge timeout remain; failed lookups do not erase saved lyrics.']}
dist=r/'dist'/version;assert not dist.exists();dist.mkdir();shutil.copy2(bundle,dist/f'bdcrusher-ytmusic-lyrics-{version}.mpp');dump(dist/'verification.json',report);dump(dist/'patches-list.json',catalog)
for n in ['SOURCE-PINS.json','LICENSE','NOTICE']:shutil.copy2(r/n,dist/n)
shutil.copy2(r/'patches/src/main/resources/bdcrusher-common/NOTICE.txt',dist/'THIRD-PARTY-NOTICES.txt');shutil.copy2(h/'Research/DOWNLOADS-AND-FOREGROUND-0.7.0-BETA.1-2026-11-01.md',dist/'IMPLEMENTATION.md')
compat=f'''# Compatibility - {version}

Exact original arm64-v8a YouTube Music **9.42.52 / 94252240** and **9.43.51 / 94351240**, minSDK26. Use this Full Collection alone; Shaders and Download playlist are optional. Download playlist requires Downloads. Jam remains 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh and repatch the original APK. MPP SHA256: `{digest}`.

Themed Opus quality/size/remember selection, playlist batching and original-playlist native playback adapters, read-only supported YTDLnis files, static artwork routing, storage totals and SponsorBlock sidecars are implemented. Shaders follow visible native player/sheet ownership, restore header/theme paints, fit complete covers and limit expensive readbacks. The foreground Lyrics sheet extends behind transparent system navigation. Existing lyrics engine/recovery/library/settings and normal debug switch/export remain intact.

Build/JVM/lint, 14 positive two-target APK configurations, 2 expected missing-Downloads rejections, catalog/Jam guards, 14 feature/reference/invocation audits, 8 native Lyrics audits and 14 native download/media/artwork audits pass. 527 source/harness checks: 320 fresh, 207 inherited only after exact source hashes match. Changed-source and old-disposal evidence groups are excluded from inheritance. Browser/provider results are explicitly inherited with unchanged source hashes; NOTICE version change reviewed separately.

Phone native decoding/queue behavior, visible Samsung three-button/gesture transparency, shaders/video, recording-free smoothness and Recents behavior still need acceptance. No device/MuMu/sign/install/uninstall or real media download operations. No zero-stutter claim. External files require completed indexing, exact IDs, seekable WebM/Opus or M4A/AAC-LC and online-prepared native metadata. Download status is native subtitle text/symbols. SponsorBlock sidecars retain the original timeline; no embedded chapter tags/new chapter picker.

Settings: existing Morphe > Player > Downloads mode, quality, Ask each time, Save SponsorBlock chapters and storage. Playlist downloads manages batches/chosen folder. Shaders has its own settings. Keep existing preferences, credentials, offsets, permanent lyrics and folder grants. Use the normal Enable debug logging / Export debug logs for further issues, without screen recording; no timer.
'''
(dist/'COMPATIBILITY.md').write_text(compat,encoding='utf-8');(dist/'SHA256SUMS.txt').write_text(''.join(sha(p)+'  '+p.name+'\n' for p in sorted(dist.iterdir()) if p.is_file()),encoding='utf-8')
print(json.dumps({'dist':str(dist),'bundleSha256':digest,'sourceChecks':527,'fresh':320,'inherited':207,'phoneVerified':False},indent=2))
