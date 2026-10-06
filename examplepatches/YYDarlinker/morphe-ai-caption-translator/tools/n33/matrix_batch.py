"""Actual 13 official options and separate zh-Hant DEFAULT host, each across 2x2x2 dimensions."""
from pathlib import Path
import argparse,json,subprocess,sys

ROOT=Path(__file__).resolve().parents[2]

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--serial',required=True);parser.add_argument('--output',required=True,type=Path);parser.add_argument('--themes',choices=['all','light','dark'],default='all');parser.add_argument('--scenario',choices=['matrix','presentation'],default='matrix');args=parser.parse_args()
    args.output.mkdir(parents=True,exist_ok=False)
    rows=[]
    for dark in ((False,True) if args.themes=='all' else (args.themes=='dark',)):
        for width in (320,420):
            for scale in (1.0,1.3):
                for traditional in (False,True):
                    label=f'{"hant-default" if traditional else "official-13"}-{width}-{scale}-{"dark" if dark else "light"}'
                    command=[sys.executable,str(ROOT/'tools/n33/run_android.py'),'--serial',args.serial,'--scenario',args.scenario,'--output',str(args.output/label),'--width',str(width),'--scale',str(scale)]
                    if dark:command+=['--dark']
                    if traditional:command+=['--caller','zh-Hant-TW','--locale','DEFAULT','--only-default']
                    result=subprocess.run(command,cwd=ROOT)
                    metadata=json.loads((args.output/label/'run.json').read_text(encoding='utf-8'))
                    rows.append(metadata)
                    (args.output/'progress.json').write_text(json.dumps(rows,indent=2),encoding='utf-8')
                    if result.returncode:return result.returncode
    (args.output/'complete.json').write_text(json.dumps(rows,indent=2),encoding='utf-8')
    dimensions=8 if args.themes=='all' else 4
    print(f'ACTUAL_MATRIX_COMPLETE official13x{dimensions}={13*dimensions} zhHantDefaultx{dimensions}={dimensions} distinct_patch_locales=14 extraDefaultCNx{dimensions}={dimensions}',flush=True)

if __name__=='__main__':raise SystemExit(main())
