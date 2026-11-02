#!/usr/bin/env python3
from pathlib import Path
import tempfile,subprocess,sys
r=Path(__file__).resolve().parents[1]
sources={
'android/os/Bundle.java':'package android.os;import java.util.*;public class Bundle{Map<String,String> data=new HashMap<>();public void putString(String k,String v){data.put(k,v);}public String getString(String k,String d){String s=data.get(k);return s==null?d:s;}}',
'org/json/JSONObject.java':'package org.json;import java.util.*;public class JSONObject{Map<String,String> data=new HashMap<>();public JSONObject put(String k,String v){data.put(k,v);return this;}public String optString(String k,String d){String s=data.get(k);return s==null?d:s;}}',
'com/sauzask/nicoid/NicoidDownloadCache.java':'package com.sauzask.nicoid;public class NicoidDownloadCache{public static String t="sm3";}',
'e/e/a/TitlesTest.java':'''package e.e.a;import org.json.*;import android.os.Bundle;public class TitlesTest{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Cache title "+checks);}public static void main(String[] args){check(CacheTitles117.title(new JSONObject().put("videoTitle","correct").put("title","other"),"sm1").equals("correct"));check(CacheTitles117.title(new JSONObject().put("videoTitle","").put("title","legacy"),"sm1").equals("legacy"));check(CacheTitles117.title(new JSONObject().put("videoTitle","null").put("title","valid"),"sm1").equals("valid"));check(CacheTitles117.title(new JSONObject().put("videoTitle","sm1").put("title","real"),"sm1").equals("real"));check(CacheTitles117.title(new JSONObject(),"sm1").equals("sm1"));CacheTitles117.remember("sm1","title");check(CacheTitles117.known("sm1").equals("title"));CacheTitles117.remember("sm1","sm1");check(CacheTitles117.known("sm1").equals("title"));Bundle bundle=new Bundle();bundle.putString("videoId","sm2");bundle.putString("videoTitle","active title");CacheTitles117.bundle(bundle);check(CacheTitles117.known("sm2").equals("active title"));Bundle fallback=new Bundle();fallback.putString("title","from metadata");CacheTitles117.bundle(fallback);check(CacheTitles117.known("sm3").equals("from metadata"));CacheTitles117.bundle(null);check(CacheTitles117.known("sm3").equals("from metadata"));for(int n=0;n<300;n++)CacheTitles117.remember("sm"+(100+n),"Title "+n);check(CacheTitles117.TITLES.size()==256);check(CacheTitles117.known("sm100").equals("sm100"));check(CacheTitles117.known("sm399").equals("Title 299"));System.out.println("CacheTitlesTest: "+checks+" checks passed");}}'''
}
with tempfile.TemporaryDirectory() as d:
 t=Path(d)
 for name,s in sources.items():
  p=t/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
 tools=Path(sys.argv[1]).resolve().parent
 subprocess.run(['java','-jar',str(tools/'ecj.jar'),'-1.8','-warn:none','-cp',str(tools/'helpers.jar'),'-d',str(t/'classes'),*map(str,t.rglob('*.java')),str(r/'src/e/e/a/CacheTitles117.java')],check=True)
 subprocess.run(['java','-cp',str(t/'classes')+':'+str(tools/'helpers.jar'),'e.e.a.TitlesTest'],check=True)
