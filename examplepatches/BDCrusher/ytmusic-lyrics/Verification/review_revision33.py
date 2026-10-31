"""Retain final implementation and compiled-hook review against the exact candidate."""
from pathlib import Path
import hashlib,json,re
h=Path(__file__).resolve().parents[1];r=h/'Personal-Patches';v=h/'Verification'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
read=lambda p:json.loads(p.read_text(encoding='utf-8-sig'))
files=[]
for folder in ['extensions/music/src/main/java/app/bdcrusher/ytmusic','shared-lyrics-patches/src','lyrics-addon/src','web/src']:
 files += [p for p in (r/folder).rglob('*') if p.is_file() and p.suffix in ('.java','.kt','.js','.ts')]
markers=[]
for p in files:
 for number,line in enumerate(p.read_text(encoding='utf-8').splitlines(),1):
  if re.search(r'\bTODO\b|\bFIXME\b|not implemented|UnsupportedOperationException',line):markers.append({'path':p.relative_to(h).as_posix(),'line':number})
assert not markers,markers
positive=[Path(p) for p in (v/'revision33-final-feature-manifest.txt').read_text().splitlines()]
personal=[Path(p) for p in (v/'revision33-final-entry-manifest.txt').read_text().splitlines()]
assert len(positive)==16 and len(personal)==12
for apk in positive:
 d=read(apk.parent/'personal-features-audit.json');assert d['passed'] and d['apkSha256']==sha(apk) and d['unresolvedRuntimeReferences']==0
for apk in personal:
 d=read(apk.parent/'native-replay-audit.json');assert d['passed'] and d['apkSha256']==sha(apk)
strict=read(v/'revision33-final-payload-strict.json');assert strict['outsideAllowedPrefixes']==['Lcom/android/tools/r8/RecordTag;']
report={'passed':True,'reviewedImplementationFiles':len(files),'unfinishedMarkers':markers,'selectedNativeBridgeGuardsReplaced':True,'inactiveBridgeGuards':'Only exact-target ShaderRuntime nativePanelId/nativePanelView bridge guards; compiled selected hooks are audited without THROW.','compilerGeneratedHelper':'Only reviewed D8 RecordTag; no duplicate Morphe implementation classes.','compiledReferencesAuditedApks':len(positive),'nativeLyricsAuditedApks':len(personal),'implementationSourceSha256':{p.relative_to(r).as_posix():sha(p) for p in files},'regression':'WHmexVwElEE','rawFragmentedFileLoopAttempts':'failed observations retained separately; supplementary normalized desktop fixture is not Android muxer execution','phoneVerified':False}
target=v/'revision33-completeness-review.json';assert not target.exists();target.write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
print(json.dumps({'passed':True,'reviewedFiles':len(files),'compiledApks':len(positive),'phoneVerified':False}))
