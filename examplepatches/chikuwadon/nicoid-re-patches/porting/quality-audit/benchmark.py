#!/usr/bin/env python3
"""Paired host-only measurement. Does not measure Android frame times or battery use."""
from pathlib import Path
import argparse,subprocess,json,statistics
p=argparse.ArgumentParser();p.add_argument('--before',type=Path,required=True);p.add_argument('--after',type=Path,required=True);p.add_argument('--ecj',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args();root=Path(__file__).resolve().parent;a.output.mkdir(parents=True,exist_ok=True)
measurements={}
for mode,classes in [('before',a.before),('after',a.after)]:
 out=a.output/mode;out.mkdir(exist_ok=True)
 subprocess.run(['java','-jar',str(a.ecj),'-1.8','-warn:none','-cp',str(classes),'-d',str(out),str(root/'AuditHostBenchmark.java'),str(root/'FilterBenchmark.java')],check=True)
for test in ['AuditHostBenchmark','FilterBenchmark']:
 rows={'before':[],'after':[]}
 for trial in range(3):
  for mode,classes in [('before',a.before),('after',a.after)]:
   output=subprocess.check_output(['java','-Xms64m','-Xmx256m','-cp',str(a.output/mode)+':'+str(classes),'e.e.a.'+test],text=True);rows[mode].append(json.loads(output))
 assert len({r['checksum'] for mode in rows.values() for r in mode})==1,'Behavior differs'
 measurements[test]=rows
(a.output/'measurements.json').write_text(json.dumps(measurements,indent=2))
for name,rows in measurements.items():print(name,{mode:{k:statistics.median(r[k] for r in runs) for k in runs[0]} for mode,runs in rows.items()})
