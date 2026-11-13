"""Harden active v2.0.1 sources without editing released snapshots.

Build stages earlier v2 source overlays, then correct event-log races and
comment reader progress handling. All edits are fail-fast and version scoped.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
REVISIONS=ROOT.parent
OLDER=REVISIONS/"v2.0.1-dev.3/patch_203.py"
spec=importlib.util.spec_from_file_location("_nicoid_previous_203", OLDER)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"NicoliveDiagnostics.java"})

def once(source,old,new,name):
    count=source.count(old)
    if count!=1:
        raise ValueError(f"{name}: expected exactly one source anchor; found {count}: {old[:100]}")
    return source.replace(old,new)

def data(source):
    name="NicoliveData.java"
    old="int pos=0;while(pos<data.length){int count=in.read(data,pos,data.length-pos);if(count<0)throw new EOFException();if(count>0)pos+=count;}return data;"
    new=("int pos=0,emptyReads=0;while(pos<data.length){"
         "int count=in.read(data,pos,data.length-pos);"
         "if(count<0)throw new EOFException();"
         "if(count==0){if(++emptyReads>8||Thread.currentThread().isInterrupted())"
         "throw new IOException(\"FRAME_STALLED\");continue;}"
         "emptyReads=0;pos+=count;}return data;")
    return once(source,old,new,name)

def diagnostics(source):
    name="NicoliveDiagnostics.java"
    source=once(source,'import java.util.concurrent.*;',
                'import java.util.concurrent.*;\nimport java.util.regex.Pattern;',name)
    source=once(source,'private static volatile boolean started,dirty;',
                'private static volatile boolean started,dirty;\n private static long eventRevision;',name)
    source=once(source,'   dirty=true;\n  }\n }',
                '   dirty=true;eventRevision++;\n  }\n }',name)
    source=once(source,'  String contents=snapshot();\n  try{',
                '  String contents;long snapshotRevision;\n  synchronized(LOCK){if(!dirty)return;snapshotRevision=eventRevision;contents=snapshot();}\n  try{',name)
    source=once(source,'   dirty=false;\n  }catch(IOException ignored){}',
                '   synchronized(LOCK){if(eventRevision==snapshotRevision)dirty=false;}\n  }catch(IOException ignored){}',name)
    regexes=(
       ("URL_PATTERN", r'(?i)(?:https?|wss?)://[^\\s]+', "[URL]"),
       ("SECRET_PATTERN", r'(?i)(?:cookie|token|signature|key)=\\S+', "[REDACTED]"),
       ("FILTER_PATTERN", r'[^a-zA-Z0-9_.,=;:() /\\[\\]{}+-]', "?"),
    )
    declarations='\n'.join(
        f' private static final Pattern {name}=Pattern.compile("{pattern}");'
        for name,pattern,_ in regexes)
    source=once(source,'private static final int MAX_EVENTS=4000,MAX_TEXT=262144;',
                'private static final int MAX_EVENTS=4000,MAX_TEXT=262144;\n'+declarations,name)
    for field,_,replacement in regexes:
        old=next((line.strip() for line in source.splitlines()
                  if line.strip().startswith('s=s.replaceAll(')
                     and replacement in line),None)
        if old is None:raise ValueError(f"{name}: missing original sanitizer {field}")
        source=once(source,old,f's={field}.matcher(s).replaceAll("{replacement}");',name)
    return source

def stage(base,destination):
    base=Path(base);destination=Path(destination)
    previous.stage(base,destination)
    target=destination/"NicoliveData.java"
    target.write_text(data(target.read_text(encoding="utf-8")),encoding="utf-8")
    original=base/"NicoliveDiagnostics.java"
    if not original.is_file():raise FileNotFoundError(original)
    (destination/original.name).write_text(diagnostics(original.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
