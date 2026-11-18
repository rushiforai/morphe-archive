#!/usr/bin/env python3
"""Exercise the production local stores with Android's XML pull parser implementation."""
from pathlib import Path
import os
import plistlib
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
ANDROID = Path(os.environ.get('ANDROID_JAR', str(Path.home() / 'Android/Sdk/platforms/android-36/android.jar')))
cached = sorted((Path.home() / '.gradle/caches/modules-2/files-2.1/net.sf.kxml/kxml2').glob('*/*/kxml2-*.jar'))
KXML = Path(os.environ['KXML_JAR']) if 'KXML_JAR' in os.environ else (cached[-1] if cached else None)
if KXML is None:
    raise SystemExit('Set KXML_JAR to Android kxml2 for real property-list round trips.')
with tempfile.TemporaryDirectory(prefix='afterglow-destinations-') as directory:
    temp = Path(directory)
    (temp / 'Xml.java').write_text('package android.util; public final class Xml { public static org.xmlpull.v1.XmlPullParser newPullParser() { return new org.kxml2.io.KXmlParser(); } }')
    classes = temp / 'classes'; classes.mkdir()
    classpath = os.pathsep.join(map(str, [ANDROID, KXML]))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-classpath', classpath, '-sourcepath', str(EXT), '-d', str(classes),
                    str(temp / 'Xml.java'), str(ROOT / 'tools/jvm/DestinationStoresTest.java')], check=True)
    data = temp / 'data'
    subprocess.run(['java', '-cp', os.pathsep.join(map(str, [classes, KXML, ANDROID])),
                    'app.afterglow.extension.destinations.DestinationStoresTest', str(data)], check=True, timeout=60)
    ai = plistlib.loads((data / 'ai-export.plist').read_bytes())
    assert set(ai) == {'schemaVersion', 'saved', 'recent'} and ai['saved'][0]['text'] == 'saved'
    experiments = plistlib.loads((data / 'experiment-export.plist').read_bytes())
    assert set(experiments) == {'schemaVersion', 'name', 'overrides'}
    assert any(row['value'] == 2**63 - 1 for row in experiments['overrides'])
    print('PASS independent plistlib export schemas and signed integer precision')
