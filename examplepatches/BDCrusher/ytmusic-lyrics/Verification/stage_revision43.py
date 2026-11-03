"""Stage only the exact verified owner-context candidate; retain earlier distributions."""
from pathlib import Path
import hashlib,json,re,shutil,xml.etree.ElementTree as ET
h=Path(__file__).resolve().parents[1];r=h/'Personal-Patches';w=h/'Verification/revision43';version='0.7.0-beta.5'
read=lambda p:json.loads(p.read_text(encoding='utf-8-sig'))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def dump(p,d):p.write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
bundle=r/f'lyrics-collection/build/libs/lyrics-collection-{version}.mpp';digest=sha(bundle);freeze=read(w/'source-freeze-r3.json');assert freeze['candidateSha256']==digest
for n,v in freeze['sourceSha256'].items():assert sha(h/n)==v,n
assert 'BUILD SUCCESSFUL' in (w/'build-fifth.log').read_text(encoding='utf-8')
assert 'PASS: matrix uses one unchanged bundle SHA256 '+digest in (w/'matrix-final-r3.log').read_text(encoding='utf-8')
for task in ['auditPersonalFeatures','auditModelEntry','auditDownloads40','auditDownloads41','auditDownloads42','auditDownloads43']:assert 'PASS: '+task in (w/'audits-verified-r3.log').read_text(encoding='utf-8')
prev=read(r/'dist/0.7.0-beta.4/verification.json');sources={p.name:p for p in (r/'extensions/music/src/main/java').rglob('*.java')};sources['ListenableFuture.java']=r/'extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java';indexed={sha(p):p for p in sources.values()}
checks={};excluded=[]
for key,d in prev['javaChecks'].items():
 hashes=d.get('sources',d.get('sourceSha256',d.get('actualSourceSha256',{})));assert hashes
 valid=hashes in indexed if isinstance(hashes,str) else all(sha(h/n if '/' in n or '\\' in n else sources[n])==v for n,v in hashes.items())
 if valid:checks[key]={**d,'evidenceProvenance':'Inherited beta.4 actual-source fixtures; every named source hash revalidated for this correction.'}
 else:excluded.append(key)
assert excluded==['downloadRoutingAndStorage'];inherited=sum(d['checks'] for d in checks.values());assert inherited==527
d=read(w/'downloads-final-r3/result.json');assert d['passed']
for n,v in d['sources'].items():assert sha(h/n)==v,n
d['checks']=int(re.search(r'PASS (\d+)',d['stdout']).group(1));assert d['checks']==129
d.update(evidenceFile='Verification/revision43/downloads-final-r3/result.json',evidenceSha256=sha(w/'downloads-final-r3/result.json'),evidenceProvenance='Fresh production parser/router/storage/owner/snapshot fixtures. Android native getter/UI/downloader seams explicitly simulated; compiled adapters separately audited.')
checks['downloadRoutingAndStorage']=d;total=inherited+d['checks'];assert total==656
runs={};features={};entry={};media={};download={};context={};owners={}
for case in read(w/'matrix-plan-r3.json')['cases']:
 folder=Path(case['directory']);run=read(folder/'verification.json');assert run['bundleSha256']==digest;key=case['target']+'/'+case['mode'];runs[key]=run
 if case['mode']=='features-missing-downloads':assert run['expectedFailure'];continue
 apk=Path(run['outputUnsignedApk']);assert sha(apk)==run['outputUnsignedApkSha256'] and run['sdkDexVerification'] and run['assetIdentity'] and run['duplicateClasses']==0
 for target,name in [(features,'personal-features-audit.json'),(media,'downloads40-audit.json'),(download,'downloads41-audit.json'),(context,'downloads42-audit.json'),(owners,'downloads43-audit.json')]:
  report=read(folder/name);assert report['passed'] and report['apkSha256']==sha(apk);target[key]=report
 assert features[key]['unresolvedRuntimeReferences']==features[key]['invalidInjectedCalls']==media[key]['privateInvokeFailures']==owners[key]['privateInvokeFailures']==0
 if features[key]['personalLyrics']:
  report=read(folder/'native-replay-audit.json');assert report['passed'] and report['apkSha256']==sha(apk);entry[key]=report
assert len(features)==len(media)==len(download)==len(context)==len(owners)==6 and len(entry)==4
catalog=read(h/'Verification/scratch/revision43-final-r3-catalog/categories.json');metadata=read(h/'Verification/scratch/revision43-final-r3-catalog/target-metadata.json');jam=read(h/'Verification/scratch/revision43-final-r3-jam-unsupported/verification.json')
assert catalog['bundleSha256']==metadata['bundleSha256']==jam['bundleSha256']==digest and metadata['passed'] and jam['expectedFailure']
assert {p['category'] for p in catalog['patches']}=={'Full Collection','Shaders','Playlist downloads'}
payload=read(w/'payload-r3.json');strict=read(w/'payload-strict-r3.json');assert payload['ok'] and not payload['duplicateClasses'] and not payload['outsideAllowedPrefixes'] and payload['inputs'][0]['sha256']==digest
assert strict['outsideAllowedPrefixes']==['Lcom/android/tools/r8/RecordTag;']
web={}
for n,v in prev['webSourceSha256'].items():
 if n.endswith('NOTICE.txt'):assert (r/n).read_text(encoding='utf-8').replace(version,'0.7.0-beta.4')==(r/'dist/0.7.0-beta.4/THIRD-PARTY-NOTICES.txt').read_text(encoding='utf-8')
 else:assert sha(r/n)==v,n
 web[n]=sha(r/n)
for n,v in prev['liveDirectProviders']['sourceSha256'].items():assert sha(sources[n])==v,n
tests=[]
for p in (r/'patches/build/test-results/test').glob('TEST-*.xml'):
 t=ET.parse(p).getroot();assert int(t.attrib.get('failures',0))==int(t.attrib.get('errors',0))==0;tests.append(dict(t.attrib))
assert tests
issues=[i.attrib for i in ET.parse(r/'extensions/music/build/reports/lint-results-release.xml').getroot().findall('issue')];assert not any(i['severity'] in ('Error','Fatal') for i in issues)
report=dict(prev);report.update(version=version,bundleSha256=digest,runs=runs,catalog=catalog,targetMetadata=metadata,jam94351Rejection=jam,compiledFeatureAudits=features,nativeLyricsAudits=entry,nativeDownloadAudits=media,downloadSettingsAudits=download,nativeDownloadContextAudits=context,nativeDownloadOwnerAudits=owners,javaChecks=checks,javaCheckTotal=total,freshJavaCheckTotal=129,inheritedJavaCheckTotal=inherited,excludedStaleEvidenceGroups=excluded,webSourceSha256=web,webNoticeVersionOnly=True,jvmTests=tests,lint={'errors':0,'warnings':sum(i['severity']=='Warning' for i in issues)},payloadIsolation={'uniqueSelectedClasses':payload['uniqueSelectedClasses'],'duplicateClasses':0,'morpheImplementationClassesInPersonalPayload':0,'compilerHelper':'Lcom/android/tools/r8/RecordTag;','nativeCompileOnlyContractsPreserved':True},sourceSha256={p.relative_to(r).as_posix():sha(p) for p in sorted((r/'extensions/music/src/main/java/app/bdcrusher/ytmusic').rglob('*.java'))},hookSourceSha256={p.relative_to(r).as_posix():sha(p) for folder in ['shared-lyrics-patches/src','lyrics-addon/src','patches/src/main/kotlin/app/bdcrusher'] for p in sorted((r/folder).rglob('*.kt'))},fullNativeModifiedSourceSha256={n:sha(r/n) for n in prev['fullNativeModifiedSourceSha256']},completenessReview={'previousRouteRegression':read(w/'previous-route/result.json'),'passed':True,'unfinishedMarkers':[],'sourceFreezeSha256':sha(w/'source-freeze-r3.json'),'nativeOfflineCommandSchema':'Encoded133724106 and empty443434441. Optional native tag getters plus actual presenter roots, native header entity kinds24/25, popup session and immutable pre-worker snapshot.','focusedCompatibility':'Six positive configurations and two expected missing-Downloads rejections. Prior broad matrix belongs to beta.2 only.'},phoneVerified=False,deviceOperations=False,realPlaylistDownloadsLaunched=False,globalToolsCopied=False)
dist=r/'dist'/version;assert not dist.exists();dist.mkdir();shutil.copy2(bundle,dist/f'bdcrusher-ytmusic-lyrics-{version}.mpp');dump(dist/'verification.json',report);dump(dist/'patches-list.json',catalog)
for n in ['SOURCE-PINS.json','LICENSE','NOTICE']:shutil.copy2(r/n,dist/n)
shutil.copy2(r/'patches/src/main/resources/bdcrusher-common/NOTICE.txt',dist/'THIRD-PARTY-NOTICES.txt');shutil.copy2(h/'Research/DOWNLOAD-OWNER-CONTEXT-0.7.0-BETA.5-2026-11-01.md',dist/'IMPLEMENTATION.md')
compat=f'''# Compatibility — {version}

Original arm64-v8a Music9.42.52/94252240 and9.43.51/94351240, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batching requires Downloads and Download playlist. External playlist handoff works without the optional batching patch or personal Lyrics. Jam stays9.42.52-only. MPP SHA256 `{digest}`.

Fixes missing click identity when endpoint.tag is absent. Native player/header roots and bound identities, URL-escaped playlist entity keys, scoped flyout sessions and immutable capture before worker dispatch replace tag-only resolution. Ambiguous or unsupported identities are rejected. Default account/eligibility handling is preserved. Existing preferences, files, credentials, lyrics and folder grants remain.

Build/JVM/lint, six two-target positive selections, two missing-Downloads rejections, catalog/Jam guard, feature/access/reference, native Lyrics, media/settings/tag and new owner/dispatcher DEX audits pass.656 source/harness checks:129 fresh,527 inherited by source hashes. Exact published beta.4 reproduces the absent-tag failure. Android/UI/native getter/downloader seams are simulated in source fixtures; concrete hooks are audited in target DEX. Browser/provider evidence is inherited only with unchanged sources.

Phone click ownership, prompt/handoff appearance, decoder/queue/SAF, Samsung graphics/navigation and recording-free lyric performance remain acceptance checks. No device/MuMu/sign/install/uninstall, real media download or cleanup operations. Existing native format/metadata/SponsorBlock sidecar limitations remain. No universal button or zero-stutter guarantee.

Refresh the existing GitHub source with Pre-release patches and Experimental app versions enabled, then repatch an original supported APK. Settings remain Morphe > Player > Downloads. In-app opens the audio prompt; External uses the selected app's review flow. Use the normal Enable debug logging / Export debug logs; no timer. Shared Toolkit runs in place.
'''
for a,b in [('Music9','Music 9'),('and9','and 9'),('stays9','stays 9'),('pass.656','pass. 656'),('checks:129','checks: 129'),(',527',', 527')]:compat=compat.replace(a,b)
(dist/'COMPATIBILITY.md').write_text(compat,encoding='utf-8');(dist/'SHA256SUMS.txt').write_text(''.join(sha(p)+'  '+p.name+'\n' for p in sorted(dist.iterdir()) if p.is_file()),encoding='utf-8')
print(json.dumps({'dist':str(dist),'bundleSha256':digest,'sourceChecks':total,'fresh':129,'inherited':527,'phoneVerified':False},indent=2))
