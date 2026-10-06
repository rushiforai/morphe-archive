"""Reuse frozen N28A resource checks; only output labels and paths change."""
from pathlib import Path
import hashlib,json,os
root=Path(__file__).resolve().parents[2];source=root/'tools/n28a/verify_host_resources.py'
code=source.read_text(encoding='utf-8').replace('n28a','n28c-r1').replace('N28A','N28C')
run=Path(os.environ.get('N28C_RUN_DIR') or root/'.verification/n28c-r1')
records=run/'delivery-records'
code=code.replace("records = root / 'build/n28c-r1-records'",'records = Path('+repr(str(records))+')')
exec(compile(code,str(source),'exec'),{'__file__':str(Path(__file__)),'__name__':'__main__'})
(records/'host-resource-audit-provenance.json').write_text(json.dumps({'source_tool':str(source),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'adaptation':'Output labels/paths only; original resource checks unchanged'},indent=2)+'\n',encoding='utf-8')
