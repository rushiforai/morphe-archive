"""Fresh logs, immutable input hashes, fixed watchdog, and identity-confirmed worker cleanup."""
from pathlib import Path
import argparse,hashlib,json,os,shutil,subprocess,time,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[2]
JDK=Path(r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1')

def digest(p):
    with p.open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest()

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--tree',type=Path,default=ROOT)
    parser.add_argument('--output',required=True,type=Path)
    parser.add_argument('--tests',action='append',default=[])
    parser.add_argument('--limit',type=int,default=600)
    parser.add_argument('--probe',action='store_true')
    parser.add_argument('--extra-source',type=Path)
    args=parser.parse_args();tree=args.tree.resolve();out=args.output.resolve();out.mkdir(parents=True,exist_ok=False)
    source=ROOT/'tools/n28c/SchedulerWatchdog.java';classes=out/'agent-classes';classes.mkdir()
    subprocess.run([str(JDK/'bin/javac.exe'),'-d',str(classes),str(source)],check=True)
    manifest=out/'agent-manifest.mf';manifest.write_text('Premain-Class: SchedulerWatchdog\n\n')
    agent=out/'watchdog.jar'
    subprocess.run([str(JDK/'bin/jar.exe'),'cfm',str(agent),str(manifest),'-C',str(classes),'.'],check=True)
    inputs={str(p.relative_to(tree)):digest(p) for folder in ['extensions/extension/src/main','extensions/extension/src/test'] for p in (tree/folder).rglob('*') if p.is_file()}
    input_sha=hashlib.sha256(json.dumps(inputs,sort_keys=True).encode()).hexdigest()
    (out/'inputs.json').write_text(json.dumps({'tree':str(tree),'input_sha':input_sha,'files':inputs},indent=2))
    env=os.environ.copy();env.update(JAVA_HOME=str(JDK),ANDROID_HOME=r'C:\Users\14776\AppData\Local\Android\Sdk')
    env['PATH']=str(JDK/'bin')+';'+env['PATH']
    for name in ['N28A_EVIDENCE_DIR','N28B_EVIDENCE_DIR','N28C_EVIDENCE_DIR']:env[name]=str(out)
    command=['cmd','/c',str(tree/'gradlew.bat'),':extensions:extension:testDebugUnitTest','--offline','--console=plain',
        '-I',str(ROOT/'tools/n28c/scheduler-test.init.gradle'),'-Pscheduler.agent='+str(agent),'-Pscheduler.output='+str(out),
        '-Pscheduler.tests='+(','.join(args.tests) or 'ALL'),'-Pscheduler.inputSha='+input_sha,
        '-Pcomposition.patcherJar='+str(ROOT/'.verification/toolchain/morphe-patcher-1.14.1-all.jar'),
        '-Dorg.gradle.jvmargs=-Xmx3g -XX:MaxMetaspaceSize=1g']
    for test in args.tests:command+=['--tests',test]
    if args.probe:command+=['-Pscheduler.probeDir='+str(ROOT/'.verification/n28c-deadlock/probe')]
    if args.extra_source:command+=['-Pscheduler.probeDir='+str(args.extra_source.resolve())]
    started=time.monotonic();killed=False;reason=''
    with (out/'gradle.log').open('wb') as log:
        process=subprocess.Popen(command,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
        while process.poll() is None:
            if (out/'deadlock.detected').exists() or time.monotonic()-started>args.limit:
                reason='DEADLOCK' if (out/'deadlock.detected').exists() else 'BUILD_HARD_TIMEOUT'
                (out/'failure.request').write_text(reason)
                worker=out/'worker.pid'
                if worker.exists():
                    pid=worker.read_text().strip()
                    identity=subprocess.run([str(JDK/'bin/jcmd.exe'),pid,'VM.command_line'],capture_output=True,timeout=10)
                    (out/'worker-command-line.txt').write_bytes(identity.stdout+identity.stderr)
                    if identity.returncode==0 and str(agent).encode() in identity.stdout and b'GradleWorkerMain' in identity.stdout:
                        dump=subprocess.run([str(JDK/'bin/jcmd.exe'),pid,'Thread.print','-l'],capture_output=True,timeout=10)
                        (out/'jcmd-full-threads.txt').write_bytes(dump.stdout+dump.stderr)
                        subprocess.run(['powershell','-NoProfile','-Command','Stop-Process -Id '+pid+' -Force'],check=True)
                        killed=True
                    else:reason+=':WORKER_IDENTITY_NOT_CONFIRMED'
                break
            time.sleep(.1)
        try:code=process.wait(timeout=30)
        except subprocess.TimeoutExpired:process.terminate();code=process.wait()
    results=out/'xml';results.mkdir()
    if (out/'worker.pid').exists():
        shutil.copytree(tree/'extensions/extension/build/test-results/testDebugUnitTest',results,dirs_exist_ok=True)
    suites=[]
    for p in results.glob('TEST-*.xml'):
        element=ET.parse(p).getroot();suites.append({'name':element.attrib['name'],**{k:int(element.attrib.get(k,0)) for k in ['tests','failures','errors','skipped']}})
    totals={k:sum(s[k] for s in suites) for k in ['tests','failures','errors','skipped']}
    result={'tree':str(tree),'tests':args.tests or ['ALL'],'input_sha':input_sha,'exit':code,'reason':reason,'elapsed_s':round(time.monotonic()-started,3),
        'worker_cleanup_identity_confirmed':killed,'totals':totals,'suites':suites,'argv':command}
    (out/'result.json').write_text(json.dumps(result,indent=2));print(json.dumps({k:v for k,v in result.items() if k not in ['argv','suites']},indent=2))
    return code or (1 if reason else 0)

if __name__=='__main__':raise SystemExit(main())
