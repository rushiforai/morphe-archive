#!/usr/bin/env python3
"""Verify one unchanged common-action receiver capture from both native provider probes."""
import argparse
import json
import math
import re
from pathlib import Path

def verify(rows, sessions):
    summary={}
    for provider in ('com.waze','nl.flitsmeister'):
        events=[r for r in rows if r['extras'].get('source_package')==provider]
        assert events, f'Missing provider {provider}'
        session=sessions[provider]
        events=[r for r in events if r['extras']['publisher_session_id']==session]
        assert events, f'Missing explicit probe session {session}'
        previous=0
        for row in events:
            n=row['extras']
            assert row['sender_package']==provider and row['sender_uid']!=row['receiver_uid'], 'Authenticated independent UID'
            assert n['schema_version']==1 and n['sequence']>previous
            previous=n['sequence']
            for prefix,field in [('current_speed','current_speed_kmh'),('road_speed_limit','road_speed_limit_kmh')]:
                state=n[prefix+'_status']
                if state!='valid': assert field not in n
                if field in n:
                    assert math.isfinite(n[field]) and n[field]>=0
                    timestamp='road_updated_elapsed_ms' if prefix=='road_speed_limit' else 'current_speed_updated_elapsed_ms'
                    ttl='road_max_age_ms' if prefix=='road_speed_limit' else 'current_speed_max_age_ms'
                    assert 0<=n['sent_elapsed_ms']-n[timestamp]<=n[ttl]
            if n['zone_status']!='active':
                assert not any(k in n for k in ['zone_remaining_m','zone_progress_percent','zone_average_speed_kmh'])
            if 'zone_average_speed_kmh' in n:
                assert n['zone_average_partial'] is True
                assert n['zone_average_method']=='observed_distance_over_elapsed_time'
                elapsed=n['zone_updated_elapsed_ms']-n['zone_observation_start_elapsed_ms']
                assert elapsed>=3000 and n['zone_observed_distance_m']>=30
                assert abs(n['zone_average_speed_kmh']-n['zone_observed_distance_m']*3600/elapsed)<0.000001
        snapshots=[r['extras'] for r in events]
        assert any(n.get('current_speed_kmh',0)>0 for n in snapshots), 'Positive normalized current speed'
        assert any(n.get('current_speed_kmh',-1)==0 for n in snapshots), 'Stationary zero is valid'
        assert any(abs(n.get('road_speed_limit_kmh',0)-104.60736)<0.0001 for n in snapshots), 'Mph limit normalization'
        assert any('zone_average_speed_kmh' in n for n in snapshots), 'Observed average delivered'
        ids={n.get('zone_segment_id') for n in snapshots if n.get('zone_segment_id')}
        assert len(ids)>=2, 'Native segment reset'
        zone_sessions={}
        for n in snapshots:
            if n.get('zone_status')=='active':
                session_id=n['zone_session']
                if session_id not in zone_sessions: assert 'zone_average_speed_kmh' not in n, 'No inherited previous-segment average'
                zone_sessions[session_id]=True
        last=snapshots[-1]
        assert last['zone_status'] in ('inactive','disabled')
        assert 'current_speed_kmh' not in last and 'road_speed_limit_kmh' not in last
        summary[provider]={'events':len(events),'session':session,'cross_uid_authenticated':True,'segments':sorted(ids),'current_speed_and_partial_average':True,'clearing':True}
    return summary

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('capture',type=Path)
    parser.add_argument('--waze-log',type=Path,required=True)
    parser.add_argument('--flitsmeister-log',type=Path,required=True)
    args=parser.parse_args()
    sessions={}
    for provider,path in [('com.waze',args.waze_log),('nl.flitsmeister',args.flitsmeister_log)]:
        matches=re.findall(r'^PUBLISHER_SESSION ([0-9a-f-]{36})$',path.read_text(),re.M)
        assert len(matches)==1, f'Expected an explicit publisher session from {path}'
        sessions[provider]=matches[0]
    print(json.dumps(verify([json.loads(l) for l in args.capture.read_text().splitlines() if l.strip()],sessions),indent=2))
