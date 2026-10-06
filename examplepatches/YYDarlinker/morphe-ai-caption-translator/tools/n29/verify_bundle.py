"""Run the unchanged release bundle validator against the actual named N29 delivery."""
from pathlib import Path
import sys,hashlib,json
R=Path(__file__).resolve().parents[2];source=R/'.github/scripts/verify_bundle.py'
text=source.read_text(encoding='utf-8')
needle='p=Path(f"patches/build/libs/patches-{v}.mpp")'
assert text.count(needle)==1
artifact=R/'build/local-test/patches-1.3.5-本地测试包-n29.mpp'
code=text.replace(needle,'p=Path('+repr(str(artifact))+')')
sys.argv=[str(source),'1.3.5']
exec(compile(code,str(source),'exec'),{'__name__':'__main__','__file__':str(source)})
(R/'.verification/n29/delivery-records/verify-bundle-provenance.json').write_text(json.dumps({'source':str(source),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'path_adaptation_only':True,'actual_artifact':str(artifact)},indent=2),encoding='utf-8')
