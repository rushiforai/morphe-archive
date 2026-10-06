"""Re-hash every captured historical delivery and original failure evidence without rewriting it."""
from pathlib import Path
import argparse,hashlib,json,time
ROOT=Path(__file__).resolve().parents[2]
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--output',type=Path,required=True);args=parser.parse_args()
    assert not args.output.exists()
    before=json.loads((ROOT/'.verification/n33/baseline/historical-identities.json').read_text(encoding='utf-8'))
    mismatches=[];started=time.monotonic()
    for index,item in enumerate(before):
        path=Path(item['path'])
        if not path.is_file():mismatches.append({'path':str(path),'error':'missing'});continue
        with path.open('rb') as stream:digest=hashlib.file_digest(stream,'sha256').hexdigest().upper()
        if digest!=item['sha256'] or path.stat().st_size!=item['bytes']:mismatches.append({'path':str(path),'before':item,'sha256':digest,'bytes':path.stat().st_size})
        if index and index%25000==0:print(f'HISTORY_CHECK {index}/{len(before)}',flush=True)
    result={'captured_files':len(before),'historical_80_delivery_files':80,'changed':len(mismatches),'mismatches':mismatches,'elapsed_s':round(time.monotonic()-started,3)}
    args.output.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(result,ensure_ascii=False),flush=True)
    assert not mismatches,'Historical evidence/deliveries changed'
if __name__=='__main__':main()
