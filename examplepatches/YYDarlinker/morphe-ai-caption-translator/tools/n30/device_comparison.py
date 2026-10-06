"""Separate actual N29 device observations from deterministic N30 controlled replay."""
from pathlib import Path
import json,re
R=Path(__file__).resolve().parents[2];O=R/'.verification/n30/delivery-records'
events=json.loads((R/'.verification/n29-device-review/events.json').read_text(encoding='utf-8'))
def num(s,k):
 m=re.search(r'(?:^|;)'+k+r'=([0-9]+)',s);return int(m[1]) if m else None
by=lambda stage:[r for r in events if r[1]==stage]
responses=by('REBUILD_HTTP_RESPONSE'); failures=by('REBUILD_HTTP_FAILURE')
rt=[num(r[2],'network_round_trip_ms') for r in responses];rt=[n for n in rt if n is not None]
device={'source':'222525 actual device, deduplicated','events':len(events),'request_count':len(by('REBUILD_HTTP_BEGIN')),'success_response_count':len(responses),'connection_failure_count':len(failures),'socket_exception_count':sum('SocketException' in r[2] for r in failures),'success_rtt_ms':rt,'max_success_rtt_ms':max(rt),'native_not_found':len(by('NATIVE_RENDERER_VIEW_NOT_FOUND')),'tree_summary_lines':len(by('NATIVE_RENDERER_VIEW_TREE')),'transition_stable':len(by('PLAYER_TRANSITION_STABLE')),'device_after':'not captured: user short retest pending'}
raw=Path(r'D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261002-222525.txt').read_text(encoding='utf-8')
match=re.search(r'Tokens: ([0-9,]+) = input ([0-9,]+) \+ output ([0-9,]+)',raw)
assert match
device['audit_reported_attempts']=41;device['audit_reported_successes']=38
device['provider_reported_tokens']={k:int(v.replace(',','')) for k,v in zip(['total','input','output'],match.groups())}
device['capture_note']='Bounded deduplicated event history is 40 begins/37 responses; since-reset audit is 41 attempts/38 successful; do not silently conflate scopes.'
(O/'n29-device-before.json').write_text(json.dumps(device,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print('DEVICE_BEFORE',device['request_count'],device['socket_exception_count'],device['max_success_rtt_ms'])
