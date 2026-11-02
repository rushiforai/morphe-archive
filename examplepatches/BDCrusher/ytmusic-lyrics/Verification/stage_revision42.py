"""Stage exact verified download-routing/settings bytes, preserving prior distributions."""
from pathlib import Path
import hashlib,json,re,shutil,xml.etree.ElementTree as ET
h=Path(__file__).resolve().parents[1];r=h/'Personal-Patches';w=h/'Verification/revision42';version='0.7.0-beta.4'
read=lambda p:json.loads(p.read_text(encoding='utf-8-sig'))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def dump(p,d):p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
bundle=r/f'lyrics-collection/build/libs/lyrics-collection-{version}.mpp';digest=sha(bundle);freeze=read(w/'source-freeze-r2.json');assert freeze['candidateSha256']==digest
for n,value in freeze['sourceSha256'].items():assert sha(h/n)==value,n
assert 'BUILD SUCCESSFUL' in (w/'build-third.log').read_text(encoding='utf-8')
assert 'PASS: matrix uses one unchanged bundle SHA256 '+digest in (w/'matrix-final-r2.log').read_text(encoding='utf-8')
for task in ['auditPersonalFeatures','auditModelEntry','auditDownloads40','auditDownloads41','auditDownloads42']:assert 'PASS: '+task in (w/'audits-final-r2.log').read_text(encoding='utf-8')
prev=read(r/'dist/0.7.0-beta.3/verification.json');sources={p.name:p for p in (r/'extensions/music/src/main/java').rglob('*.java')};sources['ListenableFuture.java']=r/'extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java';indexed={sha(p):p for p in sources.values()}
checks={};excluded=[]
for key,d in prev['javaChecks'].items():
 hashes=d.get('sources',d.get('sourceSha256',d.get('actualSourceSha256',{})));assert hashes
 if isinstance(hashes,str):valid=hashes in indexed
 else:valid=all(sha(h/n if '/' in n or '\\' in n else sources[n])==value for n,value in hashes.items())
 if valid:checks[key]={**d,'evidenceProvenance':'Inherited 0.7.0-beta.3 actual-source fixtures; every named source hash revalidated for this correction.'}
 else:excluded.append(key)
assert excluded==['playlistRouting','downloadRoutingAndStorage'];inherited=sum(d['checks'] for d in checks.values());assert inherited==478
for key,path in [('playlistRouting',h/'Verification/revision40/playlists-rev42/verification.json'),('downloadRoutingAndStorage',w/'downloads-r2/result.json')]:
 d=read(path);assert d['passed'];hashes=d.get('sources',d.get('sourceSha256'));assert isinstance(hashes,dict)
 for n,value in hashes.items():assert sha(h/n if '/' in n or '\\' in n else sources[n])==value,n
 if 'checks' not in d:d['checks']=int(re.search(r'PASS (\d+)',d['stdout']).group(1))
 d.update(evidenceFile=path.relative_to(h).as_posix(),evidenceSha256=sha(path),evidenceProvenance='Fresh actual-source fixtures; explicit Android/transport/app-launch seams simulated.')
 checks[key]=d
fresh=sum(checks[n]['checks'] for n in ['playlistRouting','downloadRoutingAndStorage']);assert fresh==137 and sum(d['checks'] for d in checks.values())==615
runs={};features={};entry={};media={};download={};context={}
for case in read(w/'matrix-plan-r2.json')['cases']:
 folder=Path(case['directory']);d=read(folder/'verification.json');assert d['bundleSha256']==digest;key=case['target']+'/'+case['mode'];runs[key]=d
 if case['mode']=='features-missing-downloads':assert d['expectedFailure'];continue
 apk=Path(d['outputUnsignedApk']);assert sha(apk)==d['outputUnsignedApkSha256'] and d['sdkDexVerification'] and d['assetIdentity'] and d['duplicateClasses']==0
 for target,name in [(features,'personal-features-audit.json'),(media,'downloads40-audit.json'),(download,'downloads41-audit.json'),(context,'downloads42-audit.json')]:
  report=read(folder/name);assert report['passed'] and report['apkSha256']==sha(apk);target[key]=report
 assert features[key]['unresolvedRuntimeReferences']==features[key]['invalidInjectedCalls']==media[key]['privateInvokeFailures']==0
 if features[key]['personalLyrics']:
  report=read(folder/'native-replay-audit.json');assert report['passed'] and report['apkSha256']==sha(apk);entry[key]=report
assert len(features)==len(media)==len(download)==len(context)==6 and len(entry)==4
catalog=read(h/'Verification/scratch/revision42-final-r2-catalog/categories.json');metadata=read(h/'Verification/scratch/revision42-final-r2-catalog/target-metadata.json');jam=read(h/'Verification/scratch/revision42-final-r2-jam-unsupported/verification.json')
assert catalog['bundleSha256']==metadata['bundleSha256']==jam['bundleSha256']==digest and metadata['passed'] and jam['expectedFailure']
assert {p['category'] for p in catalog['patches']}=={'Full Collection','Shaders','Playlist downloads'}
payload=read(w/'payload-r2.json');strict=read(w/'payload-strict-r2.json');assert payload['ok'] and not payload['duplicateClasses'] and not payload['outsideAllowedPrefixes'] and payload['inputs'][0]['sha256']==digest
assert strict['outsideAllowedPrefixes']==['Lcom/android/tools/r8/RecordTag;']
web={}
for n,value in prev['webSourceSha256'].items():
 if n.endswith('NOTICE.txt'):
  old=(r/'dist/0.7.0-beta.3/THIRD-PARTY-NOTICES.txt').read_text(encoding='utf-8');assert (r/n).read_text(encoding='utf-8').replace(version,'0.7.0-beta.3')==old
 else:assert sha(r/n)==value,n
 web[n]=sha(r/n)
for n,value in prev['liveDirectProviders']['sourceSha256'].items():assert sha(sources[n])==value,n
tests=[]
for p in (r/'patches/build/test-results/test').glob('TEST-*.xml'):
 t=ET.parse(p).getroot();assert int(t.attrib.get('failures',0))==int(t.attrib.get('errors',0))==0;tests.append(dict(t.attrib))
assert tests
issues=[i.attrib for i in ET.parse(r/'extensions/music/build/reports/lint-results-release.xml').getroot().findall('issue')];assert not any(i['severity'] in ('Error','Fatal') for i in issues)
report=dict(prev);report.update(version=version,bundleSha256=digest,runs=runs,catalog=catalog,targetMetadata=metadata,jam94351Rejection=jam,compiledFeatureAudits=features,nativeLyricsAudits=entry,nativeDownloadAudits=media,downloadSettingsAudits=download,nativeDownloadContextAudits=context,javaChecks=checks,javaCheckTotal=615,freshJavaCheckTotal=137,inheritedJavaCheckTotal=478,excludedStaleEvidenceGroups=excluded,browserEvidenceProvenance='Inherited unchanged executable/style/host fixtures by exact source hashes. NOTICE version-only change separately reviewed; no new browser/phone performance claim.',webSourceSha256=web,webNoticeVersionOnly=True,jvmTests=tests,lint={'errors':0,'warnings':sum(i['severity']=='Warning' for i in issues)},payloadIsolation={'uniqueSelectedClasses':payload['uniqueSelectedClasses'],'duplicateClasses':0,'morpheImplementationClassesInPersonalPayload':0,'compilerHelper':'Lcom/android/tools/r8/RecordTag;','nativeCompileOnlyContractsPreserved':True},sourceSha256={p.relative_to(r).as_posix():sha(p) for p in sorted((r/'extensions/music/src/main/java/app/bdcrusher/ytmusic').rglob('*.java'))},hookSourceSha256={p.relative_to(r).as_posix():sha(p) for root in ['shared-lyrics-patches/src','lyrics-addon/src','patches/src/main/kotlin/app/bdcrusher'] for p in sorted((r/root).rglob('*.kt'))},fullNativeModifiedSourceSha256={n:sha(r/n) for n in prev['fullNativeModifiedSourceSha256']},completenessReview={'previousRouteRegression':read(w/'previous-route-r2/result.json'),'passed':True,'unfinishedMarkers':[],'sourceFreezeSha256':sha(w/'source-freeze-r2.json'),'nativeOfflineCommandSchema':'Encoded133724106 and empty443434441; APK-selected video/playlist tag getters from scoped native offline helper owner. Guards replaced and access audited on both originals.','focusedCompatibility':'Six fresh positive configurations, two expected missing-Downloads rejections. Prior14-case matrix belongs to beta.2 only.'},phoneVerified=False,deviceOperations=False,realPlaylistDownloadsLaunched=False,globalToolsCopied=False)
dist=r/'dist'/version;assert not dist.exists();dist.mkdir();shutil.copy2(bundle,dist/f'bdcrusher-ytmusic-lyrics-{version}.mpp');dump(dist/'verification.json',report);dump(dist/'patches-list.json',catalog)
for n in ['SOURCE-PINS.json','LICENSE','NOTICE']:shutil.copy2(r/n,dist/n)
shutil.copy2(r/'patches/src/main/resources/bdcrusher-common/NOTICE.txt',dist/'THIRD-PARTY-NOTICES.txt');shutil.copy2(h/'Research/EMPTY-DOWNLOAD-ACTIONS-0.7.0-BETA.4-2026-11-01.md',dist/'IMPLEMENTATION.md')
compat=f'''# Compatibility - {version}

Exact original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection alone; Shaders and Download playlist optional. In-app playlists require Downloads and Download playlist. Jam remains 9.42.52-only. MPP SHA256 `{digest}`.

Adds the client-generated empty download-action path shown in the phone log. APK-selected native context getters resolve the clicked recording/playlist without reflection or Now Playing substitution. External playlist context retains folder/batch tracking. Selected In-app/External mode gets explicit unresolved-identity feedback and bounded normal-debug diagnostics instead of silent Premium fallthrough. Default account/eligibility behavior stays native. Beta.3 quality/storage fixes remain.

Build/JVM/lint, six positive two-target configurations, two missing-Downloads rejections, catalog/Jam guards, six feature/reference/access audits, four native Lyrics audits, six media audits, six settings audits and six new native-context audits pass. 615 source/harness checks:137 fresh,478 inherited after source-hash validation. The exact previous published source reproduces return-to-native for the empty action; two native getter factory seams are simulated only in the source fixture and replaced/audited in compiled APKs. Browser/provider evidence inherited from unchanged code, NOTICE version reviewed separately.

Actual phone tag types, handoff/prompt appearance, native decoding/queue/SAF, Samsung graphics/navigation and recording-free lyrics remain phone acceptance. Unsupported identities report their unresolved state; no all-client-tag or zero-stutter guarantee. No devices/MuMu/sign/install/uninstall, actual media downloads or cleanup. Existing data/preferences/credentials/permanent lyrics/downloaded music/folder grants preserved.

Refresh with prerelease/experimental versions enabled and repatch an original APK. Morphe > Player > Downloads: choose In-app for the audio prompt or External for the selected app. Existing Enable debug logging / Export debug logs, no timer. Shared Toolkit in place; no global copies. Raw phone logs/vendor inputs remain private.
'''
(dist/'COMPATIBILITY.md').write_text(compat,encoding='utf-8');(dist/'SHA256SUMS.txt').write_text(''.join(sha(p)+'  '+p.name+'\n' for p in sorted(dist.iterdir()) if p.is_file()),encoding='utf-8')
print(json.dumps({'dist':str(dist),'bundleSha256':digest,'sourceChecks':615,'fresh':137,'inherited':478,'phoneVerified':False},indent=2))
