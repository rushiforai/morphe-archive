"""Reuse the N28A resource/unsigned APK audit against N28B paths without editing that tool."""
from pathlib import Path
import hashlib,json
root=Path(__file__).resolve().parents[2]
source=root/'tools/n28a/verify_host_resources.py'
code=source.read_text(encoding='utf-8').replace('n28a','n28b').replace('N28A','N28B')
exec(compile(code,str(source),'exec'),{'__file__':str(Path(__file__)),'__name__':'__main__'})
(root/'build/n28b-records/host-resource-audit-provenance.json').write_text(json.dumps({
    'source_tool':str(source),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
    'adaptation':'Only N28A→N28B output labels/paths; original resource checks unchanged'},indent=2)+'\n',encoding='utf-8')
