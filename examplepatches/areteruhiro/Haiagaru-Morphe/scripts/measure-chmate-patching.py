import argparse,copy,hashlib,json,pathlib,subprocess,time,re,datetime,statistics
p=argparse.ArgumentParser();p.add_argument('--java',required=True);p.add_argument('--cli',required=True);p.add_argument('--bundle',required=True);p.add_argument('--apk',required=True);p.add_argument('--options',required=True);p.add_argument('--keystore',required=True);p.add_argument('--out',required=True);p.add_argument('--cases',default='baseline,core,full');a=p.parse_args()
out=pathlib.Path(a.out);out.mkdir(parents=True,exist_ok=True)
if (out/"summary.json").exists(): p.error("Use a new output directory to preserve earlier measurements")
base=json.loads(pathlib.Path(a.options).read_text(encoding='utf-8-sig'))
# Measurements include log delivery latency; stage boundaries are the CLI's logged starts.
markers=[('decode','Decoding all resources'),('sanitize','Sanitizing unpatched strings'),('patches','Executing patches'),('dex_write','Compiling patched dex files'),('dex_strip','Stripping '),('resources','Compiling modified resources'),('align','Aligning APK'),('sign','Signing APK'),('saved','Saved to ')]
runs=[]
for ordinal,case in enumerate(a.cases.split(','),1):
 assert case in ('baseline','core','full')
 options=copy.deepcopy(base);patches=options[0]['patches'];enabled={'Change ChMate package name'}
 if case in ('core','full'):enabled.add('Haiagaru')
 if case=='full':enabled.update(k for k,v in patches.items() if v.get('enabled'))
 for k,v in patches.items():v['enabled']=k in enabled
 prefix=out/f'{ordinal:02d}-{case}';opt=prefix.with_suffix('.options.json');opt.write_text(json.dumps(options,ensure_ascii=False,indent=2),encoding='utf-8')
 jfr=prefix.with_suffix('.jfr').resolve();result=prefix.with_suffix('.result.json');apk=prefix.with_suffix('.apk');log=prefix.with_suffix('.jsonl');raw=prefix.with_suffix('.log')
 cmd=[a.java,'-Xmx1000m','-XX:TieredStopAtLevel=1','-XX:+UseSerialGC','-XX:ActiveProcessorCount=2',f'-XX:StartFlightRecording=filename={jfr},settings=profile,dumponexit=true','-jar',a.cli,'patch','-p',a.bundle,'--options-file',str(opt),'--keystore',a.keystore,'--result-file',str(result),'-o',str(apk),a.apk]
 start=time.perf_counter();events=[];print('START '+case,flush=True)
 with log.open('w',encoding='utf-8') as f,raw.open('w',encoding='utf-8') as r:
  process=subprocess.Popen(cmd,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,encoding='utf-8',errors='replace',bufsize=1)
  for line in process.stdout:
   elapsed=time.perf_counter()-start;message=line.rstrip();event={'seconds':round(elapsed,4),'message':message};events.append(event);f.write(json.dumps(event,ensure_ascii=False)+'\n');f.flush();r.write(f'{elapsed:9.3f} {message}\n');r.flush()
  code=process.wait()
 duration=time.perf_counter()-start;starts=[]
 for phase,marker in markers:
  hit=next((e for e in events if marker in e['message']),None)
  if hit:starts.append((phase,hit['seconds']))
 starts.sort(key=lambda x:x[1]);phases={'startup':starts[0][1] if starts else duration}
 for i,(name,t) in enumerate(starts):phases[name]=round((starts[i+1][1] if i+1<len(starts) else duration)-t,3)
 run={'case':case,'ordinal':ordinal,'exitCode':code,'seconds':round(duration,3),'phases':phases,'enabled':sorted(enabled),'apkBytes':apk.stat().st_size if apk.exists() else None,'jfr':str(jfr),'events':len(events)};runs.append(run)
 metadata={'createdAt':datetime.datetime.now(datetime.timezone.utc).isoformat(),'runs':runs,'inputs':{key:{'path':str(pathlib.Path(value).resolve()),'sha256':hashlib.sha256(pathlib.Path(value).read_bytes()).hexdigest()} for key,value in [('bundle',a.bundle),('apk',a.apk),('cli',a.cli)]},'javaFlags':['Xmx1000m','TieredStopAtLevel=1','UseSerialGC','ActiveProcessorCount=2'],'profiling':'JFR profile enabled equally for every run','limits':'PC CLI comparison, log-observed phase boundaries; not Android manager timings'}
 (out/'summary.json').write_text(json.dumps(metadata,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(run,ensure_ascii=False),flush=True)
 if code:raise SystemExit('Patch failed; see '+str(raw))
