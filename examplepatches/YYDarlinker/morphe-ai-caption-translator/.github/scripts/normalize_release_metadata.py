"""Normalize generated timestamps to the exact Manager DTO, never hand-edit release URLs."""
import json, sys
from datetime import datetime, timezone
from pathlib import Path
p=Path("patches-bundle.json")
data=json.loads(p.read_text(encoding="utf-8"))
assert data["version"].removeprefix("v")==sys.argv[1].removeprefix("v")
ts=datetime.fromisoformat(data["created_at"].replace("Z","+00:00"))
if ts.tzinfo is not None: ts=ts.astimezone(timezone.utc).replace(tzinfo=None)
data["created_at"]=ts.isoformat(timespec="seconds")
p.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
