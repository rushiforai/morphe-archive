#!/usr/bin/env python3
"""Host-only tests; no APK, Android device, user data or credentials required."""
from pathlib import Path
import subprocess,urllib.request,sys
r=Path(__file__).resolve().parents[2];out=r/'build/weather-tests';out.mkdir(parents=True,exist_ok=True);jar=out/'json-20250517.jar'
if not jar.exists():jar.write_bytes(urllib.request.urlopen('https://repo.maven.apache.org/maven2/org/json/json/20250517/json-20250517.jar',timeout=30).read())
source=r/'extensions/extension/src/main/java/app/template/extension/niagaralauncher'
subprocess.run(['javac','-cp',str(jar),'-d',str(out),str(source/'WeatherTemplate.java'),str(source/'WeatherData.java'),str(source/'WeatherSource.java'),str(source/'WeatherProviders.java'),str(source/'WeatherSelection.java'),str(Path(__file__).with_name('WeatherCoreTest.java')),str(Path(__file__).with_name('WeatherApiSmokeTest.java'))],check=True)
subprocess.run(['java','-cp',str(out)+':'+str(jar),'app.template.extension.niagaralauncher.WeatherCoreTest'],check=True)

if "--network" in sys.argv:
    subprocess.run(["java","-cp",str(out)+":"+str(jar),"app.template.extension.niagaralauncher.WeatherApiSmokeTest"],check=True)
