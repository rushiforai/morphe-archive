"""Summarize applied-view transitions, not SELECTED/event-duration or physical screen exposure."""
from pathlib import Path
import json,re
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.verification/n34'
ui=json.loads((OUT/'android/owned-final-04/ui.json').read_text(encoding='utf-8'))
raw=next(v['value'] for v in ui['events'] if v['event']=='final_dex_display_diagnostics')
rows=[]
for line in raw.splitlines():
 if ' | REBUILD_DISPLAY_RESULT | ' not in line:continue
 detail=line.split(' | REBUILD_DISPLAY_RESULT | ',1)[1]
 fields={}
 for piece in detail.split(';'):
  if '=' in piece:
   key,value=piece.split('=',1);fields[key]=value
 if fields.get('ui_applied')=='true':rows.append(fields)
visible={};intervals=[]
for row in rows:
 identity=row.get('id','')
 if row.get('visible')=='true':visible.setdefault(identity,row)
 elif identity in visible:
  first=visible.pop(identity)
  intervals.append({'id':identity,'window':first.get('window'),'applied_start_position_ms':int(first['render_position']),
   'applied_end_position_ms':int(row['render_position']),'observed_wall_interval_ms':int(row['applied_wall_ms'])-int(first['applied_wall_ms']),
   'observed_uptime_interval_ms':int(row['applied_uptime_ms'])-int(first['applied_uptime_ms']),
   'end_reason':row.get('reason'),'text':first.get('text'),'not_physical_video_exposure_duration':True})
result={'scope':'Final delivered DEX/resources SDK35 synthetic media host; UI applied observations, not a physical recording or full source-duration coverage claim.',
 'rows':rows,'same_identity_closed_visible_intervals':intervals,'open_ended_observations':[v['id'] for v in visible.values()],
 'no_event_duration_sum':True,'no_overlapping_union_window_sum':True,'SELECTED_not_used':True}
(OUT/'actual-ui-applied-visibility-observations.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
print('APPLIED_VISIBILITY_OBSERVATIONS',len(rows),'closed intervals',len(intervals))
