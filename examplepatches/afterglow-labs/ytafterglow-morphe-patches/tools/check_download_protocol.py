#!/usr/bin/env python3
"""Exercise native download command routing and malformed player protobuf boundaries."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
with tempfile.TemporaryDirectory(prefix="afterglow-download-proto-") as output:
    subprocess.run(["javac","-encoding","UTF-8","-d",output,
                    str(ROOT/"extensions/extension/src/main/java/app/afterglow/extension/downloads/DownloadProto.java"),
                    str(ROOT/"extensions/extension/src/main/java/app/afterglow/extension/downloads/DownloadFormatPolicy.java"),
                    str(ROOT/"tools/jvm/DownloadProtoTest.java")],check=True)
    subprocess.run(["java","-cp",output,"app.afterglow.extension.downloads.DownloadProtoTest"],check=True)
