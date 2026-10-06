from pathlib import Path
import shutil,hashlib,json
R=Path.cwd();T=R/'.verification/n29/startup-before-tree'
assert not T.exists();T.mkdir()
for name in ['settings.gradle.kts','gradle.properties','gradlew.bat','gradlew']:
 shutil.copyfile(R/name,T/name)
shutil.copytree(R/'gradle',T/'gradle')
for module in ['patches','extensions/extension']:
 dest=T/module;dest.mkdir(parents=True,exist_ok=True)
 shutil.copyfile(R/module/'build.gradle.kts',dest/'build.gradle.kts')
 shutil.copytree(R/module/'src',dest/'src',ignore=shutil.ignore_patterns('bin'))
p='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java'
shutil.copyfile(R/'.verification/n29/before'/p,T/p)
(T/'provenance.json').write_text(json.dumps({'replay':'original N28C-R1 scheduler on same current A/C tree; only B reversed in isolated fixture','controller_before_sha256':hashlib.sha256((T/p).read_bytes()).hexdigest(),'current_controller_sha256':hashlib.sha256((R/p).read_bytes()).hexdigest()},indent=2))
print('Isolated original-scheduler replay prepared')
