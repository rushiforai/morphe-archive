"""Export focused scheduler, compositor, decoder and trace-health evidence as JSON."""
from pathlib import Path
import argparse,json,sys

p=argparse.ArgumentParser()
p.add_argument('trace',type=Path)
p.add_argument('--python-tools',type=Path,required=True)
p.add_argument('--processor',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--pid',type=int,required=True)
a=p.parse_args()
if a.pid <= 0:
    p.error('--pid must be positive')
a.output=a.output.resolve()
if a.output.exists() and (not a.output.is_dir() or any(a.output.iterdir())):
    p.error('--output must be a new or empty directory; previous query evidence will not be overwritten')
sys.path.insert(0,str(a.python_tools.resolve()))
from perfetto.trace_processor import TraceProcessor,TraceProcessorConfig
a.output.mkdir(parents=True,exist_ok=True)
queries={
'health':"SELECT name,idx,value,severity FROM stats WHERE value != 0 AND severity IN ('error','data_loss')",
'bounds':'SELECT * FROM trace_bounds',
'clocks':"SELECT * FROM clock_snapshot WHERE clock_name='REALTIME'",
'app_threads':f'''SELECT t.tid,t.name,COUNT(*) slices,ROUND(SUM(s.dur)/1e9,3) cpu_s,
 ROUND(MAX(s.dur)/1e6,3) max_run_ms FROM sched s JOIN thread t USING(utid)
 JOIN process p USING(upid) WHERE p.pid={a.pid} AND s.dur>0 GROUP BY t.utid ORDER BY cpu_s DESC''',
'process_cpu':'''SELECT p.pid,p.name,ROUND(SUM(s.dur)/1e9,3) cpu_s FROM sched s
 JOIN thread t USING(utid) JOIN process p USING(upid) WHERE s.dur>0 GROUP BY p.upid ORDER BY cpu_s DESC LIMIT 30''',
'app_runnable_stalls':f'''SELECT t.tid,t.name,ts.ts,ROUND(ts.dur/1e6,3) ms,ts.state,ts.blocked_function
 FROM thread_state ts JOIN thread t USING(utid) JOIN process p USING(upid)
 WHERE p.pid={a.pid} AND ts.dur>10000000 AND ts.state IN ('R','R+') ORDER BY ts.dur DESC LIMIT 60''',
'app_blocked_stalls':f'''SELECT t.tid,t.name,ts.ts,ROUND(ts.dur/1e6,3) ms,ts.state,ts.blocked_function
 FROM thread_state ts JOIN thread t USING(utid) JOIN process p USING(upid)
 WHERE p.pid={a.pid} AND ts.dur>10000000 AND ts.state LIKE 'D%' ORDER BY ts.dur DESC LIMIT 60''',
'app_states':f'''SELECT t.tid,t.name,ts.state,COUNT(*) n,ROUND(SUM(ts.dur)/1e9,3) total_s,
 ROUND(MAX(ts.dur)/1e6,3) max_ms FROM thread_state ts JOIN thread t USING(utid)
 JOIN process p USING(upid) WHERE p.pid={a.pid} AND ts.dur>0 GROUP BY t.utid,ts.state''',
'app_slice_gaps':f'''WITH events AS (
 SELECT s.ts,s.dur,s.name,t.tid,t.name AS thread_name,
 LAG(s.ts) OVER(PARTITION BY t.utid,s.name ORDER BY s.ts) AS prev_ts
 FROM slice s JOIN thread_track tr ON s.track_id=tr.id JOIN thread t USING(utid)
 JOIN process p USING(upid) WHERE p.pid={a.pid} AND s.name IN
 ('queueBuffer','HIDL::IComponent::queue::client','HIDL::IComponentListener::onWorkDone::server'))
 SELECT *,ROUND((ts-prev_ts)/1e6,3) gap_ms FROM events WHERE ts-prev_ts>20000000
 ORDER BY ts''',
'app_flush_gc':f'''SELECT s.ts,s.dur,s.name,t.tid,t.name AS thread_name
 FROM slice s JOIN thread_track tr ON s.track_id=tr.id JOIN thread t USING(utid)
 JOIN process p USING(upid) WHERE p.pid={a.pid} AND
 (s.name LIKE '%flush%' OR s.name LIKE '% GC' OR s.name LIKE '%suspended%') ORDER BY s.ts''',
'app_slices':f'''SELECT s.name,COUNT(*) n,ROUND(SUM(s.dur)/1e6,3) total_ms,
 ROUND(MAX(s.dur)/1e6,3) max_ms FROM slice s JOIN thread_track tr ON s.track_id=tr.id
 JOIN thread t USING(utid) JOIN process p USING(upid) WHERE p.pid={a.pid} AND s.dur>0
 GROUP BY s.name ORDER BY total_ms DESC LIMIT 60''',
'compositor_slices':'''SELECT s.name,COUNT(*) n,ROUND(SUM(s.dur)/1e6,3) total_ms,
 ROUND(MAX(s.dur)/1e6,3) max_ms FROM slice s JOIN thread_track tr ON s.track_id=tr.id
 JOIN thread t USING(utid) JOIN process p USING(upid) WHERE p.name LIKE '%surfaceflinger' AND s.dur>0
 GROUP BY s.name ORDER BY total_ms DESC LIMIT 80''',
'frames_schema':'PRAGMA table_info(actual_frame_timeline_slice)',
'frames':'''SELECT process.pid,layer_name,jank_type,present_type,COUNT(*) n,
 ROUND(MAX(actual_frame_timeline_slice.dur)/1e6,3) max_ms
 FROM actual_frame_timeline_slice LEFT JOIN process USING(upid)
 GROUP BY process.pid,layer_name,jank_type,present_type ORDER BY n DESC LIMIT 50''',
'counter_tracks':'''SELECT id,name,type FROM counter_track WHERE name LIKE '%freq%' OR name LIKE '%mem%' OR name LIKE '%gpu%' LIMIT 80''',
'steam_logs':f'''SELECT ts,prio,tag,msg FROM android_logs WHERE utid IN
 (SELECT utid FROM thread JOIN process USING(upid) WHERE pid={a.pid})
 AND (msg LIKE '%SVLFEC%' OR msg LIKE '%Reset%' OR msg LIKE '%metadata%' OR msg LIKE '%stuck%' OR msg LIKE '%Panic%') ORDER BY ts''',
}
with TraceProcessor(trace=str(a.trace.resolve()),config=TraceProcessorConfig(bin_path=str(a.processor.resolve()))) as tp:
    for name,sql in queries.items():
        try:
            rows=[vars(row) for row in tp.query(sql)]
            (a.output/f'{name}.json').write_text(json.dumps(rows,indent=2),encoding='utf-8')
            print(name,len(rows),flush=True)
        except Exception as e:
            (a.output/f'{name}.error.txt').write_text(str(e),encoding='utf-8')
            print(name,'ERROR',str(e)[:150],flush=True)
