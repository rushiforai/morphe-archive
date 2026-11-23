#!/usr/bin/env python3
"""Regression test: Morphe ReleaseAsset LocalDateTime.parse rejects Z and offsets."""
from datetime import datetime
from pathlib import Path
import json
import re
import subprocess
import sys
import tempfile

ROOT=Path(__file__).resolve().parent.parent
with tempfile.TemporaryDirectory(prefix="morphe-metadata-") as t:
    output=Path(t)/"patches-bundle.json"
    version="0.3.999"
    result=subprocess.run(
        [sys.executable,str(ROOT/"tools/write_release_metadata.py"),
         "--version",version,
         "--tag","v"+version,
         "--asset","RealmeLink-Plus_build999.mpp",
         "--out",str(output)],
        check=True,capture_output=True,text=True,
    )
    data=json.loads(output.read_text(encoding="utf-8"))
    assert data["version"]==version
    assert data["download_url"]=="https://github.com/Rafaello0/RealmeLink-Plus/releases/download/v0.3.999/RealmeLink-Plus_build999.mpp"
    dt=data["created_at"]
    assert re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}",dt),repr(dt)
    datetime.strptime(dt,"%Y-%m-%dT%H:%M:%S")
    assert not dt.endswith("Z") and "+" not in dt
    if (ROOT/"patches-bundle.json").exists():
        old=json.loads((ROOT/"patches-bundle.json").read_text(encoding="utf-8"))
        odt=old["created_at"]
        assert re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}",odt),repr(odt)
print("PASS: metadata uses Morphe-compatible ISO_LOCAL_DATE_TIME")
