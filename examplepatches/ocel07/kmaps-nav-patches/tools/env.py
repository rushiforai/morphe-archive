"""Local tool paths. Override with environment variables UBX_JAVA (java executable, JDK 17+) and
UBX_JADX_JAR (jadx *-all.jar, which bundles smali/baksmali)."""
import os, shutil

_JAVA_DEFAULT = r'C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot\bin\java.exe'
JAVA = os.environ.get('UBX_JAVA') or (_JAVA_DEFAULT if os.path.isfile(_JAVA_DEFAULT) else shutil.which('java') or 'java')
JADX = os.environ.get('UBX_JADX_JAR', r'C:\Apps\jadx\lib\jadx-1.5.6-all.jar')
