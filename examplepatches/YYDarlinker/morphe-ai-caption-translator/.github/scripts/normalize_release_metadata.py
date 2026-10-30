"""Normalize generated metadata and share the release identity across publication phases."""
import json, re, sys
from datetime import datetime, timezone
from pathlib import Path
p=Path("patches-bundle.json")
data=json.loads(p.read_text(encoding="utf-8"))
assert data["version"].removeprefix("v")==sys.argv[1].removeprefix("v")
ts=datetime.fromisoformat(data["created_at"].replace("Z","+00:00"))
if ts.tzinfo is not None: ts=ts.astimezone(timezone.utc).replace(tzinfo=None)
data["created_at"]=ts.isoformat(timespec="seconds")
properties=Path('gradle.properties')
text=properties.read_text(encoding='utf-8')
version=sys.argv[1].removeprefix('v')
assert re.findall(r'^version\s*=\s*(\S+)\s*$',text,re.M)==[version]
text,count=re.subn(r'^captionBuildId\s*=.*$',f'captionBuildId = release-{version}',text,flags=re.M)
assert count==1, 'release preparation requires exactly one captionBuildId property'
properties.write_text(text,encoding='utf-8')
p.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
