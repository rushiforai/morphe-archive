#!/usr/bin/env python3
"""Check the inactive paused-subscriptions semantic discriminator, without renderer assumptions."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
with tempfile.TemporaryDirectory(prefix='afterglow-shorts-subscriptions-command-') as directory:
    subprocess.run(['javac', '-encoding', 'UTF-8', '-d', directory,
                    str(ROOT/'extensions/extension/src/main/java/app/afterglow/extension/interfaceui/ShortsSubscriptionsCommand.java'),
                    str(ROOT/'tools/jvm/ShortsSubscriptionsCommandTest.java')], check=True)
    subprocess.run(['java', '-cp', directory, 'app.afterglow.extension.interfaceui.ShortsSubscriptionsCommandTest'], check=True, timeout=30)
