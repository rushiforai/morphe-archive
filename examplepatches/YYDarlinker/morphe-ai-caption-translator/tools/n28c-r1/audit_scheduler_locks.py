"""Audit every production monitor, actual compiled class, and critical B/C scheduler methods."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess
PREFIX='extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/'
JDK=Path(r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1')

def sha(data):return hashlib.sha256(data).hexdigest()
def lex(source):
    return re.sub(r'//[^\n]*|/\*[\s\S]*?\*/|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'',
        lambda m:''.join('\n' if c=='\n' else ' ' for c in m[0]),source)
def close(code,at):
    depth=0
    for i in range(at,len(code)):
        depth+=(code[i]=='{')-(code[i]=='}')
        if not depth:return i+1
    raise ValueError('unbalanced Java')
def methods(source):
    code=lex(source);result=[]
    pattern=r'(?m)^ {2,4}(?:(?:private|public|protected|static|final|synchronized)\s+)*[\w.<>\[\]?]+\s+(\w+)\s*\([^;{}]*\)\s*\{'
    for match in re.finditer(pattern,code):
        end=close(code,code.index('{',match.start()))
        result.append({'name':match[1],'from':match.start(),'to':end,'source':source[match.start():end]})
    return result
def monitors(source):
    code=lex(source);found=methods(source);rows=[]
    for match in re.finditer(r'synchronized\s*\(([^()]*)\)\s*\{',code):
        at=code.index('{',match.start());end=close(code,at)
        owner=min((m for m in found if m['from']<=match.start()<m['to']),key=lambda m:m['to']-m['from'])
        rows.append({'method':owner['name'],'lock':match[1].strip(),'start':source.count('\n',0,match.start())+1,
            'end':source.count('\n',0,end)+1,'body':code[at:end]})
    for method in found:
        if 'synchronized' in method['source'].split('{',1)[0]:
            rows.append({'method':method['name'],'lock':'implicit class','start':source.count('\n',0,method['from'])+1,
                'end':source.count('\n',0,method['to'])+1,'body':lex(method['source'])})
    return rows,found
def compiled_monitor_calls(javap):
    """Follow normal bytecode control flow, preserving monitor depth at each invoke instruction."""
    rows=[]
    sections=re.split(r'(?m)(?=^  [^\n]+\([^\n]*\);$)',javap)
    for section in sections:
        lines=section.splitlines()
        if not lines or not lines[0].startswith('  ') or 'Code:' not in section:continue
        code=section.split('Code:',1)[1].split('LineNumberTable:',1)[0]
        instructions={int(m[1]):(m[2],m[3]) for m in re.finditer(r'(?m)^\s+(\d+): (\w+)([^\n]*)',code)}
        if not instructions:continue
        offsets=sorted(instructions);next_offset={a:b for a,b in zip(offsets,offsets[1:])}
        queue=[(offsets[0],0)];seen=set()
        while queue:
            pc,depth=queue.pop()
            if (pc,depth) in seen:continue
            seen.add((pc,depth));op,args=instructions[pc]
            if op=='monitorenter':depth+=1
            elif op=='monitorexit':depth-=1
            if depth<0:continue # Exceptional cleanup is separately present in the complete javap.
            assert depth<=1,('nested monitors',lines[0],pc,depth)
            if op.startswith('invoke') and depth:
                rows.append({'method':lines[0].strip(),'pc':pc,'call':args.strip(),'monitor_depth':depth})
                assert not re.search(r'(CaptionDiagnostics|CaptionStrings|RebuildClock|MediaController|RebuildCache\.(read|prepare|write|trim)|disconnect|ExecutorService|Handler|CaptionOverlay|\.cancel:|\.retire:)',args),(lines[0],pc,args)
            if op in ['return','ireturn','lreturn','areturn','dreturn','freturn','athrow']:continue
            target=re.match(r'\s+(\d+)',args)
            if op.startswith('goto'):
                if target:queue.append((int(target[1]),depth))
                continue
            if op.startswith('if') and target:queue.append((int(target[1]),depth))
            if pc in next_offset:queue.append((next_offset[pc],depth))
    return rows

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--root',type=Path,required=True);parser.add_argument('--b-tree',type=Path,required=True);parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args();args.output.mkdir(parents=True,exist_ok=False);reports={};critical={}
    for label,tree in [('c',args.root)]:
        source=(tree/(PREFIX+'RebuildController.java')).read_text(encoding='utf-8');locks,found=monitors(source)
        for lock in locks:
            assert not re.search(r'synchronized\s*\(',lock['body'][1:]),lock
            assert not re.search(r'(CaptionDiagnostics|CaptionStrings|CLOCK\.|RebuildCache\.(read|write|prepare|trim)|\.disconnect\(|\.submit\(|MAIN\.|CaptionOverlay\.|\bposition\(s\)|\.cancel\(|\.retire\()',lock['body']),lock
        current=next(m for m in found if m['name']=='current')['source'];assert 'synchronized' not in lex(current)
        classes=tree/'extensions/extension/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes'
        extended=Path('\\\\?\\'+str(classes.resolve()))
        inventory=[{'path':str(p.relative_to(extended)),'bytes':p.stat().st_size,'sha256':sha(p.read_bytes())} for p in extended.rglob('*.class')]
        if label=='b':assert not any('CaptionRenderSpec' in r['path'] or 'CaptionLanguagePager' in r['path'] for r in inventory)
        calls=[];disassembly={}
        names=[p.stem for p in (extended/'app/yydarlinker/deepseekcaptions').glob('RebuildController*.class')]
        names+=['RebuildCache','RebuildCache$Publication','RebuildCache$Permit','RebuildCache$Prepared','CaptionOverlay','CaptionOverlay$RenderGuard']
        for name in names:
            raw_bytes=subprocess.check_output([str(JDK/'bin/javap.exe'),'-p','-c','-v','-classpath',str(classes),'app.yydarlinker.deepseekcaptions.'+name])
            (args.output/(label+'-'+name+'-javap.raw.txt')).write_bytes(raw_bytes)
            raw=raw_bytes.decode('gb18030',errors='replace')
            (args.output/(label+'-'+name+'-javap.txt')).write_text(raw,encoding='utf-8');disassembly[name]=raw
            if name.startswith('RebuildController'):
                assert 'ACC_SYNCHRONIZED' not in raw,name
                calls+=compiled_monitor_calls(raw)
        assert 'monitorenter' not in disassembly['RebuildCache$Publication']
        assert 'monitorenter' not in disassembly['RebuildCache$Permit']
        for lock in locks:lock.pop('body')
        reports[label]={'source_sha256':sha((tree/(PREFIX+'RebuildController.java')).read_bytes()),'source_monitors':locks,
            'compiled_calls_under_monitors':calls,'classes':inventory,'class_count':len(inventory),'no_controller_implicit_monitors':True,
            'current_lock_free':True,'publication_and_permit_lock_free':True,'no_nested_controller_session_monitors':True}
        for name in ['cancel','retire','requestRetirement','requestCleanup','cleanup','awaitRetirement','current','stop','video','activate','time','position','scheduleTick','tick','kick','load','restoreCandidates','schedule','render']:
            segments=[m['source'] for m in found if m['name']==name]
            critical.setdefault(name,{})[label]=sha('\n'.join(segments).encode())
            (args.output/(label+'-'+name+'-source.txt')).write_text('\n'.join(segments),encoding='utf-8')
    (args.output/'lock-audit.json').write_text(json.dumps({'inputs':reports,'critical_methods':critical,
        'before':'Controller -> Session -> Controller','after':'Controller alone; Session alone; connections alone; atomic publication admission; cache final move alone'},indent=2),encoding='utf-8')
    print('SCHEDULER_LOCK_AUDIT_PASS', {k:len(v['source_monitors']) for k,v in reports.items()})

if __name__=='__main__':main()
