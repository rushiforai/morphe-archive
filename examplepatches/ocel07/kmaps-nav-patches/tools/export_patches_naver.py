"""Export NAVER patch sites (apply_rate_patch.py P list + N1 location request) as ledger rows (kind PATCH).

usage: export_patches_naver.py <apply_rate_patch.py> --out patches.tsv
Each anchor becomes one row: class, method spec (as the patch script names it), first anchor line, n.
The patch id comes from ID below (class simple name -> inventory id; see docs/naver-rate-patch.md).
"""
import argparse, importlib.util, sys

ID = {
    'RealMapMatchingRunner$MapMatchingRunnable': 'R1/R3', 'RerouteBufferManager': 'M1', 'RerouteGuard': 'M2',
    'Periodic': 'M3', 'FixedStatusChecker': 'M4', 'ParallelRerouteChecker': 'M5', 'RouteLinkExplorer': 'M8',
    'LocalMatching': 'L1/L2', 'LocalTileChecker': 'L2', 'StartSpotInfo': 'T1', 'StartRefresher': 'T3', 'GoalSpotInfo': 'T4',
    'GpsAdjuster': 'S2/S4', 'GpsLocationStatusManager': 'S3', 'GpsStatusTracker': 'S6', 'GpsValidator': 'S7',
    'VirtualDriveController': 'V1', 'VirtualDriveBadGpsChecker': 'V5', 'LocalCalculator': 'V5',
    'MobileStopFilter': 'F1', 'VectorAngle': 'A1/A2/A3', 'RouteScoreCalculator': 'A3', 'Forwarder': 'P2',
    'AvnVirtualDrivingFilter': 'G2', 'SwitchBuffer': 'G4',
    'SectionSpeedCameraGuidanceGenerator$SectionCameraArea': 'guide-A1', 'Interpolator': 'guide-B1',
    'TrafficEventRepository': 'guide-A2', 'SessionCountingGuidanceManager': 'guide-A3',
    'SessionTripReportManager': 'guide-B2', 'NaviStore': 'guide-B3',
}
# N1: dex offset patch (probe_out/naver/patch_dex.py) -> recorded by class/method so the next version can re-find it
N1 = [('classes', 'com/naver/map/core/common/location/FusedLocationSource', '<init>(Landroid/content/Context;)V',
       'const-wide/16 v0, 0x3e8 -> LocationRequest.N1(J) (setInterval)'),
      ('classes', 'com/naver/map/core/common/location/SystemLocationSource', 'k()V',
       'const-wide/16 v6, 0x3e8 -> requestLocationUpdates minTime')]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('script')
    ap.add_argument('--out', required=True)
    a = ap.parse_args()
    spec = importlib.util.spec_from_file_location('arp', a.script)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    rows, seen = [], {}
    for dex, cls, meth, reps in m.P:
        for rep in reps:
            old = rep[0].strip().splitlines()[0].strip()
            k = (cls, meth, old)
            seen[k] = seen.get(k, 0) + 1
            short = cls.rsplit('/', 1)[-1]
            rows.append(('PATCH', cls, meth, old, str(seen[k]), dex, ID.get(short, '?'), rep[1].strip().splitlines()[0].strip()))
    for dex, cls, meth, what in N1:
        rows.append(('PATCH', cls, meth, what, '1', dex, 'N1', 'const 0x3e8 -> 0x7d (125 ms)'))
    with open(a.out, 'w', encoding='utf-8', newline='\n') as o:
        o.write('kind\tclass\tdesc\tdetail\tn\tdex\tpatch_id\tnew\n')
        for r in rows:
            o.write('\t'.join(x.replace('\t', ' ') for x in r) + '\n')
    print(len(rows), 'patch rows')


if __name__ == '__main__':
    sys.exit(main())
