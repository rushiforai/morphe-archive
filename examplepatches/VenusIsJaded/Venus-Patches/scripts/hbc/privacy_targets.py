"""Print the HbcPrivacy target lists for the pinned bundle (functions located by name and module)."""
import sys, os, hashlib
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from hbc import Bundle
B = Bundle(sys.argv[1] if len(sys.argv) > 1 else 'work/348/assets/index.android.bundle'); h = B.h; b = h.b
G = {'analytics': [(34538,'increment',0),(34539,'distribution',0),(34540,'_flush',0),(23150,'track',1),(82662,'track',1),
     (82666,'drainEventsQueue',1),(82667,'submitEventsImmediately',1),(82668,'flushQueuedEvents',1),(82669,'sendTelemetryEvent',1),
     (82665,'scheduleDrain',0),(23153,'startRecordingAnalyticsEvents',0)],
     'telemetry': [(19593,'shouldCollectMetrics',0),(78572,'installWebsocketTelemetryHook',0),(25121,'append',0),(25124,'append',0)],
     'crash': [(80849,'send',1),(111344,'send',1)]}
for g, ts in G.items():
    print(f"    val {g} = listOf(")
    for i, n, p in ts:
        f = h.func(i); assert h.fname(i) == n and f['expanded'], (i, n)
        body = hashlib.sha256(b[f['offset']:f['offset'] + f['size']]).hexdigest()
        exp = hashlib.sha256(b[f['header']:f['header'] + 40]).hexdigest()
        print(f'        Target({i}, "{n}", {f["offset"]}, {f["size"]}, "{b[128+i*12:140+i*12].hex()}", "{body}", {"true" if p else "false"}, "{exp}"),')
    print("    )")
