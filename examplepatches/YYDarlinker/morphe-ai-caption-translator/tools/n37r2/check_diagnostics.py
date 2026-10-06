"""Match each actual native observation to the product's emitted after-layout diagnostic."""
from pathlib import Path
import json
ROOT=Path(__file__).resolve().parents[2];E=ROOT/'.verification/n37r2'
rows=json.loads((E/'native-01/matrix.json').read_text(encoding='utf-8'))['rows'];records=[]
for line in (E/'native-01/diagnostics.txt').read_text(encoding='utf-8').splitlines():
 if ' | CAPTION_HORIZONTAL_PLACEMENT | ' not in line:continue
 fields=dict(p.split('=',1) for p in line.split(' | ',2)[2].split(';') if '=' in p);records.append(fields)
assert len(records)>=86
keys=['player_type','app_layout_direction','caption_text_direction','caption_outer_layout_direction','video_rect','caption_outer_rect','expected_center_x','actual_center_x','center_error_px','session','owner_epoch','render_epoch']
for f in records:assert all(k in f for k in keys) and abs(float(f['center_error_px']))<=1,f
for row in rows:
 matches=[f for f in records if f['session']==row['session']];assert matches,row['session']
 assert any(abs(float(f['center_error_px'])-row['center_error_px'])<.01 and f['video_rect']==row['video_rect'] for f in matches),row
 assert all(f['caption_outer_layout_direction']=='0' for f in matches)
 assert all(f['caption_text_direction']==str(row['caption_text_direction']) for f in matches)
single=[r['lines'] for r in rows if r['shape']==0];double=[r['lines'] for r in rows if r['shape']==1];assert set(single)=={1};assert set(double)=={2}
report={'status':'PASS','emitted_records':len(records),'sessions_covered':len(rows),'all_required_fields_per_record':True,'actual_rect_matches_native_observation':True,'single_line_shapes':len(single),'two_line_shapes':len(double),'max_emitted_center_error_px':max(abs(float(f['center_error_px'])) for f in records)}
(E/'native-01/diagnostic-checks.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report,indent=2))