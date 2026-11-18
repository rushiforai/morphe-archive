#!/usr/bin/env python3
"""Exercise exact raw-description and session boundaries; optionally inspect real native DEX."""
from pathlib import Path
import argparse
import os
import re
import subprocess
import tempfile

parser=argparse.ArgumentParser()
parser.add_argument('--apk',type=Path)
args=parser.parse_args()
root=Path(__file__).resolve().parents[1]
source=root/'extensions/extension/src/main/java/app/afterglow/extension'
with tempfile.TemporaryDirectory(prefix='afterglow-description-') as output:
    files=[source/'settings/ThemeJson.java',source/'menus/DescriptionHeaderPolicy.java',source/'menus/DescriptionHeaderSource.java',root/'tools/jvm/DescriptionHeaderTest.java']
    subprocess.run(['javac','-encoding','UTF-8','-d',output,*map(str,files)],check=True)
    subprocess.run(['java','-cp',output,'DescriptionHeaderTest'],check=True,timeout=20)
    subprocess.run(['python3',str(root/'tools/check_description_header_ui.py')],check=True,timeout=30)
    if args.apk:
        aapt=os.environ.get('AAPT2','/home/corey/Android/Sdk/build-tools/36.0.0/aapt2')
        resources=subprocess.run([aapt,'dump','resources',str(args.apk)],check=True,stdout=subprocess.PIPE,text=True).stdout
        expected={'id/footer':0x7f0b085f,'id/panel_content':0x7f0b0e5e,'id/engagement_panel_content':0x7f0b0753,'layout/constraint_default_engagement_panel':0x7f0e0197}
        for name,value in expected.items():
            match=re.search(r'\bresource (0x[0-9a-f]+) '+re.escape(name)+r'\s*$',resources,re.M)
            assert match and int(match.group(1),16)==value,('native resource name/id changed',name)
        layout=re.search(r'\bresource 0x7f0e0197 layout/constraint_default_engagement_panel\s*\n\s*\(\) \(file\) (\S+)',resources)
        assert layout,'named native panel layout file unavailable'
        xml=subprocess.run([aapt,'dump','xmltree',str(args.apk),'--file',layout.group(1)],check=True,stdout=subprocess.PIPE,text=True).stdout
        assert 'E: androidx.constraintlayout.widget.ConstraintLayout ' in xml and '=@0x7f0b0753' in xml,'native panel layout root changed'
        assert 'E: FrameLayout ' in xml and '=@0x7f0b085f' in xml,'native footer child changed'
        print('PASS 6 actual APK resource-name/ID/layout checks')
        jar=os.environ.get('MORPHE_DESKTOP_JAR','/mnt/c/Users/Corey/Downloads/morphe-desktop-1.20.0-all.jar')
        subprocess.run(['javac','-encoding','UTF-8','-cp',jar,'-d',output,str(root/'tools/jvm/DescriptionHeaderNativeTest.java')],check=True)
        subprocess.run(['java','-Xmx1g','-cp',os.pathsep.join([output,jar]),'DescriptionHeaderNativeTest',str(args.apk),str(root/'patches/src/main/kotlin/app/afterglow/patches/menus/DescriptionHeaderPatch.kt'),str(Path(output)/'description.dex')],check=True,timeout=90)
