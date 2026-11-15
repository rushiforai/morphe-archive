"""NAVER Map 6.10.0.16: run navigation map matching per GPS fix (8 Hz) with time-weighted counters.

usage: apply_rate_patch.py <smali root containing classes4/ classes5/ classes12/>
Every replacement must match exactly once inside the named method, otherwise the script aborts.
See docs/naver-rate-patch.md for the design and the item list.
"""
import os, re, shutil, sys

RG = 'Lcom/naver/maps/navi/mapmatching/RateGate;'
MMI = 'Lcom/naver/maps/navi/mapmatching/internal/'


def INC(r):
    return f'invoke-static {{{r}}}, {RG}->inc(I)I\n    move-result {r}'


def MS(r):
    return f'invoke-static {{{r}}}, {RG}->ms(I)I\n    move-result {r}'


def SEC(r):
    return f'invoke-static {{{r}}}, {RG}->sec(I)I\n    move-result {r}'


def ADDK(r, kreg, k):
    return f'const/16 {kreg}, {k}\n    invoke-static {{{r}, {kreg}}}, {RG}->addk(II)I\n    move-result {r}'


# (dex, class path, method name+descriptor start, [(old, new), ...])
P = []


def p(dex, cls, meth, *reps):
    P.append((dex, cls, meth, reps))


I = 'com/naver/maps/navi/mapmatching/internal/'
C4 = 'classes4'

# ---------------- R: runner gate (poll 50 ms, run only on a new fix or after 1 s) ----------------
p(C4, 'com/naver/maps/navi/mapmatching/RealMapMatchingRunner$MapMatchingRunnable', 'run()V',
  ('iget-object v0, p0, Lcom/naver/maps/navi/mapmatching/RealMapMatchingRunner$MapMatchingRunnable;->Z:Lcom/naver/maps/navi/mapmatching/RealMapMatchingRunner;\n'
   '    invoke-virtual {v0}, Lcom/naver/maps/navi/mapmatching/MapMatchingRunnerBase;->e()Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMGuidePoint;',
   'iget-object v0, p0, Lcom/naver/maps/navi/mapmatching/RealMapMatchingRunner$MapMatchingRunnable;->Z:Lcom/naver/maps/navi/mapmatching/RealMapMatchingRunner;\n'
   '    invoke-virtual {v0}, Lcom/naver/maps/navi/mapmatching/MapMatchingRunnerBase;->a()Lcom/naver/maps/navi/mapmatching/LocationSnapshot;\n'
   '    move-result-object v1\n'
   f'    invoke-static {{v1}}, {RG}->shouldRun(Lcom/naver/maps/navi/mapmatching/LocationSnapshot;)Z\n'
   '    move-result v1\n'
   '    if-eqz v1, :rg_skip\n'
   '    invoke-virtual {v0}, Lcom/naver/maps/navi/mapmatching/MapMatchingRunnerBase;->e()Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMGuidePoint;\n'
   '    :rg_skip'),
  ('const-wide/16 v1, 0x3e8', 'const-wide/16 v1, 0x32'))

# ---------------- M: route matching / reroute ----------------
p(C4, I + 'routeMatching/reroute/internal/RerouteBufferManager', 'c(',
  ('add-int/2addr v0, v1\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/RerouteBufferManager;->c:I',
   INC('v0') + '\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/RerouteBufferManager;->c:I'),
  ('add-int/2addr p2, p1\n    if-ge p3, p2', 'add-int/2addr p2, p1\n    ' + MS('p2') + '\n    if-ge p3, p2'))
p(C4, I + 'routeMatching/reroute/internal/RerouteBufferManager', 'e()V',
  ('const/4 v0, 0x5', 'const/16 v0, 0x1388'))
p(C4, I + 'routeMatching/reroute/RerouteGuard', 'a(Z)',
  ('const/4 v1, 0x3\n    if-le v0, v1', 'const/16 v1, 0xbb8\n    if-le v0, v1'),
  ('add-int/lit8 v0, v0, 0x1\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/RerouteGuard;->b:I\n    sget-object p1, Lcom/naver/maps/navi/v2/shared/api/model/DrivingStatus;->Refreshing',
   INC('v0') + '\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/RerouteGuard;->b:I\n    sget-object p1, Lcom/naver/maps/navi/v2/shared/api/model/DrivingStatus;->Refreshing'),
  ('add-int/lit8 v0, v0, 0x1\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/RerouteGuard;->b:I\n    sget-object p1, Lcom/naver/maps/navi/v2/shared/api/model/DrivingStatus;->RouteOff',
   INC('v0') + '\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/RerouteGuard;->b:I\n    sget-object p1, Lcom/naver/maps/navi/v2/shared/api/model/DrivingStatus;->RouteOff'),
  ('const/16 v0, 0x3c\n    if-lt p1, v0', 'const v0, 0xea60\n    if-lt p1, v0'),
  ('add-int/lit8 p1, p1, 0x1', INC('p1')))
p(C4, I + 'locationBank/component/periodic/Periodic', 'a(',
  ('const/16 p2, 0x37\n    if-le p1, p2, :cond_29\n    add-int/lit8 p1, p1, -0x5',
   'const p2, 0xd6d8\n    if-le p1, p2, :cond_29\n    ' + ADDK('p1', 'p2', '-0x5')),
  ('add-int/2addr p1, v0\n    iput p1, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/periodic/Periodic;->a:I\n    return-void',
   INC('p1') + '\n    iput p1, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/periodic/Periodic;->a:I\n    return-void'))
p(C4, I + 'locationBank/component/periodic/Periodic', 'e()V',
  ('const/16 v1, 0x32\n    if-le v0, v1, :cond_a\n    add-int/lit8 v0, v0, -0xa',
   'const v1, 0xc350\n    if-le v0, v1, :cond_a\n    ' + ADDK('v0', 'v1', '-0xa')))
p(C4, I + 'routeMatching/reroute/internal/FixedStatusChecker', 'b()V',
  ('add-int/2addr v0, v1\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/FixedStatusChecker;->d:I',
   INC('v0') + '\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/reroute/internal/FixedStatusChecker;->d:I'),
  ('const/4 v2, 0x3\n    if-ge v0, v2', 'const/16 v2, 0xbb8\n    if-ge v0, v2'))
p(C4, I + 'routeMatching/reroute/internal/ParallelRerouteChecker', 'f(',
  ('add-int/2addr p1, p2\n    goto :goto_24', INC('p1') + '\n    goto :goto_24'),
  ('const/4 v3, 0x2\n    if-lt v2, v3', 'const/16 v3, 0x7d0\n    if-lt v2, v3'))
p(C4, I + 'routeMatching/reroute/internal/ParallelRerouteChecker', 'g(',
  ('add-int/2addr v2, v0\n    iput v2, p0', INC('v2') + '\n    iput v2, p0'),
  ('const/4 v2, 0x5\n    if-lt p1, v2', 'const/16 v2, 0x1388\n    if-lt p1, v2'))
p(C4, I + 'routeMatching/matching/RouteLinkExplorer', 'a(Lcom/naver/maps/navi/mapmatching/internal/routeMatching/model/RouteCandidate;Lcom/naver/maps/navi/mapmatching/internal/routeMatching/model/RouteCandidate;)',
  ('const/16 v3, 0x8\n    goto :goto_29\n    :cond_28\n    move v3, v2',
   'const/16 v3, 0x1f40\n    goto :goto_29\n    :cond_28\n    const/16 v3, 0x7d0'),
  ('add-int/lit8 v4, v4, 0x1\n    iput v4, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/matching/RouteLinkExplorer;->k:I',
   INC('v4') + '\n    iput v4, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/matching/RouteLinkExplorer;->k:I'))

# ---------------- L: local matching ----------------
p(C4, I + 'localMatching/LocalMatching', 'g(',
  ('const/4 v2, 0x3\n    const-string v3, ")"\n    if-ge v0, v2', 'const/16 v2, 0xbb8\n    const-string v3, ")"\n    if-ge v0, v2'))
p(C4, I + 'localMatching/LocalMatching', 'r(',
  ('add-int/2addr v0, v3\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/localMatching/LocalMatching;->i:I',
   INC('v0') + '\n    iput v0, p0, Lcom/naver/maps/navi/mapmatching/internal/localMatching/LocalMatching;->i:I'),
  ('add-int/2addr p1, v3\n    iput p1, p0, Lcom/naver/maps/navi/mapmatching/internal/localMatching/LocalMatching;->h:I',
   INC('p1') + '\n    iput p1, p0, Lcom/naver/maps/navi/mapmatching/internal/localMatching/LocalMatching;->h:I'))
p(C4, I + 'localMatching/LocalTileChecker', 'a(I)I',
  ('move-result v0\n    add-int/2addr p1, v2', 'move-result v0\n    ' + SEC('p1') + '\n    add-int/2addr p1, v2'))

# ---------------- T: start / goal spots ----------------
p(C4, I + 'routeMatching/spot/StartSpotInfo', 'p(',
  ('invoke-virtual {p0, p1}, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/spot/StartSpotInfo;->a(Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;)I\n    move-result p1',
   'invoke-virtual {p0, p1}, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/spot/StartSpotInfo;->a(Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;)I\n    move-result p1\n    ' + MS('p1')),
  ('add-int/2addr p2, v1\n    iput p2, p0', INC('p2') + '\n    iput p2, p0'))
p(C4, I + 'routeMatching/spot/StartRefresher', 'b()Z',
  ('add-int/2addr v0, v2\n    iput v0, p0', INC('v0') + '\n    iput v0, p0'),
  ('const/4 v3, 0x3\n    if-lt v0, v3', 'const/16 v3, 0xbb8\n    if-lt v0, v3'))
p(C4, I + 'routeMatching/spot/GoalSpotInfo', 'b(ZZ)V',
  ('add-int/2addr p1, v0\n    iput p1, p0', INC('p1') + '\n    iput p1, p0'))
p(C4, I + 'routeMatching/spot/GoalSpotInfo', 'a(',
  ('iget p2, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/spot/GoalSpotInfo;->f:I\n    if-lt p2, p4, :cond_80',
   'iget p2, p0, Lcom/naver/maps/navi/mapmatching/internal/routeMatching/spot/GoalSpotInfo;->f:I\n    const/16 p4, 0xbb8\n    if-lt p2, p4, :cond_80'))

# ---------------- S: GPS signal ----------------
G = I + 'locationBank/component/gpsSignal/'
p(C4, G + 'GpsAdjuster', 'l(',
  ('add-int/lit8 v1, v1, 0x1\n    iput v1, v0', INC('v1') + '\n    iput v1, v0'))
p(C4, G + 'GpsAdjuster', 'p(',
  ('const-wide/16 v4, 0x1f4', 'const-wide/16 v4, 0x64'))
p(C4, G + 'GpsAdjuster', 'q(',
  ('const/4 v2, 0x2\n    if-lt v0, v2', 'const/16 v2, 0x7d0\n    if-lt v0, v2'),
  ('invoke-virtual {p2}, Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;->getSpeedMPS()D\n    move-result-wide p1',
   'invoke-virtual {p2}, Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;->getSpeedMPS()D\n    move-result-wide p1\n'
   f'    invoke-static {{}}, {RG}->dtSec()D\n    move-result-wide v4\n    mul-double/2addr p1, v4'))
p(C4, G + 'GpsLocationStatusManager', 'c()V',
  ('add-int/2addr v1, v0\n    iput v1, p0', INC('v1') + '\n    iput v1, p0'))
p(C4, G + 'GpsLocationStatusManager', 'e()V',
  ('const/16 v1, 0xa\n    if-lt v0, v1', 'const/16 v1, 0x2710\n    if-lt v0, v1'))
p(C4, G + 'GpsStatusTracker', 'b()V',
  ('const/4 v1, 0x3\n    if-le v0, v1', 'const/16 v1, 0xbb8\n    if-le v0, v1'))
p(C4, G + 'GpsStatusTracker', 'k(',
  ('const/4 v1, 0x3\n    if-ge v0, v1', 'const/16 v1, 0xbb8\n    if-ge v0, v1'))
p(C4, G + 'GpsStatusTracker', 'c(',
  ('add-int/lit8 v0, v0, 0x1', INC('v0')),
  ('add-int/lit8 p1, p1, 0x1', INC('p1')))
p(C4, G + 'GpsValidator', 'd(',
  ('const-wide v4, 0x3ff4cccccccccccdL    # 1.3\n    mul-double/2addr p1, v4',
   'const-wide v4, 0x3ff4cccccccccccdL    # 1.3\n    mul-double/2addr p1, v4\n'
   f'    invoke-static {{}}, {RG}->dtSec()D\n    move-result-wide v4\n    mul-double/2addr v2, v4\n    mul-double/2addr p1, v4'))

# ---------------- V: virtual drive ----------------
V = I + 'locationBank/component/virtualDrive/'
p(C4, V + 'VirtualDriveController', 'f(',
  ('const-wide/high16 v6, 0x3ff0000000000000L    # 1.0', f'invoke-static {{}}, {RG}->dtSec()D\n    move-result-wide v6'))
p(C4, V + 'VirtualDriveBadGpsChecker', 'b(',
  ('const/4 p3, 0x2\n    if-lt p1, p3, :cond_31\n    add-int/lit8 p1, p1, 0x3',
   'const/16 p3, 0x7d0\n    if-lt p1, p3, :cond_31\n    ' + ADDK('p1', 'p3', '0x3')),
  ('add-int/2addr p1, v0\n    iput p1, p0', INC('p1') + '\n    iput p1, p0'))
p(C4, I + 'localMatching/calculator/LocalCalculator', 'b(',
  ('move/from16 v2, p6', 'move/from16 v2, p6\n    ' + SEC('v2')))

# ---------------- F / A / P: buffers, vector angle, forwarder ----------------
p(C4, I + 'locationBank/component/stopFilter/MobileStopFilter', 'h(',
  ('iget-object p2, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/stopFilter/MobileStopFilter;->c:Lkotlin/collections/ArrayDeque;\n'
   '    const/16 p3, 0xa\n',
   f'invoke-static {{}}, {RG}->gateStopBuf()Z\n    move-result p3\n    if-eqz p3, :rg_nobuf\n'
   '    iget-object p2, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/stopFilter/MobileStopFilter;->c:Lkotlin/collections/ArrayDeque;\n'
   '    const/16 p3, 0xa\n'),
  ('Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/stopFilter/extensions/ArrayDequeExtensionsKt;->b(Lkotlin/collections/ArrayDeque;ILcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;)V\n    return-void',
   'Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/stopFilter/extensions/ArrayDequeExtensionsKt;->b(Lkotlin/collections/ArrayDeque;ILcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;)V\n    :rg_nobuf\n    return-void'))
VA = I + 'locationBank/component/vectorAngle/VectorAngle'
p(C4, VA, 'c(',
  ('add-int/2addr p2, p1\n    iput p2, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->c:I\n    const/4 p1, 0x5',
   INC('p2') + '\n    iput p2, p0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->c:I\n    const/16 p1, 0x1388'))
p(C4, VA, 'g(',
  ('add-int/lit8 v1, v1, 0x1\n    iput v1, v0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d:I',
   INC('v1') + '\n    iput v1, v0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d:I'),
  ('invoke-virtual {v0, v1, v2}, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d(Lkotlin/collections/ArrayDeque;Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMLatLng;)V',
   f'invoke-static {{}}, {RG}->gateVec()Z\n    move-result v3\n    if-eqz v3, :rg_novec\n'
   '    invoke-virtual {v0, v1, v2}, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d(Lkotlin/collections/ArrayDeque;Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMLatLng;)V\n'
   '    :rg_novec'))
# A3 second increment site (2026-10-11 fix): g() calls a() once the deque holds 5 points ("angle applied" path)
p(C4, VA, 'a(Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMNaviLocation;)',
  ('add-int/lit8 v1, v1, 0x1\n    iput v1, v0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d:I',
   INC('v1') + '\n    iput v1, v0, Lcom/naver/maps/navi/mapmatching/internal/locationBank/component/vectorAngle/VectorAngle;->d:I'))
p(C4, I + 'routeMatching/matching/RouteScoreCalculator', 'i(',
  ('const/4 v1, 0x3\n    if-ge v0, v1', 'const/16 v1, 0xbb8\n    if-ge v0, v1'))
p(C4, I + 'routeMatching/model/Forwarder', 'd()V',
  ('const-wide v2, 0x3fb999999999999aL    # 0.1\n    add-double/2addr v0, v2',
   f'const-wide v2, 0x3fb999999999999aL    # 0.1\n    invoke-static {{v2, v3}}, {RG}->scale(D)D\n    move-result-wide v2\n    add-double/2addr v0, v2'))

# ---------------- G: AVN / dual GPS (inactive on this head unit, kept consistent) ----------------
p(C4, I + 'gpsSelection/AvnVirtualDrivingFilter', 'i(Z)V',
  ('add-int/lit8 p1, p1, 0x1', INC('p1')))
p(C4, I + 'gpsSelection/AvnVirtualDrivingFilter', 'b(',
  ('const/16 p2, 0xa\n    if-lt p1, p2', 'const/16 p2, 0x2710\n    if-lt p1, p2'))
SB = I + 'gpsSelection/dualGps/SwitchBuffer'
p(C4, SB, 'a(',
  ('add-int/lit8 v2, v2, 0x1', INC('v2')),
  ('const/4 v3, 0x3\n    if-lt v2, v3', 'const/16 v3, 0xbb8\n    if-lt v2, v3'))
P.append((C4, SB, 'd(', (('add-int/lit8 p2, p2, 0x1', INC('p2'), 2),
                         ('const/4 v0, 0x3\n    if-lt p2, v0', 'const/16 v0, 0xbb8\n    if-lt p2, v0'))))
P.append((C4, SB, 'e(', (('add-int/lit8 v0, v0, 0x1', INC('v0'), 2),)))

# ---------------- guidance layer (classes5) ----------------
C5 = 'classes5'
p(C5, 'com/naver/maps/navi/v2/internal/guidance/controller/general/generator/SectionSpeedCameraGuidanceGenerator$SectionCameraArea', 'n(DDJ)D',
  ('move-result-wide p3\n    invoke-static {p3, p4}, Ljava/lang/Math;->floor(D)D',
   f'move-result-wide p3\n    invoke-static {{p3, p4}}, {RG}->perTick(D)D\n    move-result-wide p3\n    invoke-static {{p3, p4}}, Ljava/lang/Math;->floor(D)D'))
p(C5, 'com/naver/maps/navi/ui/map/animation/Interpolator', 'f()J',
  ('iget-wide v0, p0, Lcom/naver/maps/navi/ui/map/animation/Interpolator;->b:J\n    return-wide v0',
   f'iget-wide v0, p0, Lcom/naver/maps/navi/ui/map/animation/Interpolator;->b:J\n    invoke-static {{v0, v1}}, {RG}->animDur(J)J\n    move-result-wide v0\n    return-wide v0'))
TE = 'com/naver/maps/navi/v2/internal/remote/trafficevent/TrafficEventRepository'
p(C5, TE, '<init>(',
  ('invoke-virtual {p0}, Lcom/naver/maps/navi/v2/internal/remote/trafficevent/TrafficEventRepository;->p()I\n    move-result p1\n    iput p1, p0, Lcom/naver/maps/navi/v2/internal/remote/trafficevent/TrafficEventRepository;->e:I',
   'invoke-virtual {p0}, Lcom/naver/maps/navi/v2/internal/remote/trafficevent/TrafficEventRepository;->p()I\n    move-result p1\n    ' + MS('p1') +
   '\n    iput p1, p0, Lcom/naver/maps/navi/v2/internal/remote/trafficevent/TrafficEventRepository;->e:I'))
p(C5, TE, 'w()Z',
  ('add-int/2addr v0, v1\n    iput v0, p0', INC('v0') + '\n    iput v0, p0'),
  ('move-result v2\n    if-le v0, v2', 'move-result v2\n    ' + MS('v2') + '\n    if-le v0, v2'))
p(C5, TE, 'v(',
  ('move-result v0\n    if-le p1, v0', 'move-result v0\n    ' + MS('v0') + '\n    if-le p1, v0'))
p(C5, 'com/naver/maps/navi/v2/internal/guidance/controller/general/SessionCountingGuidanceManager', '',
  ('iget-wide v4, p0, Lcom/naver/maps/navi/v2/internal/guidance/controller/general/SessionCountingGuidanceManager;->d:D',
   f'iget-wide v4, p0, Lcom/naver/maps/navi/v2/internal/guidance/controller/general/SessionCountingGuidanceManager;->d:D\n    invoke-static {{v4, v5}}, {RG}->scale(D)D\n    move-result-wide v4'))
p(C5, 'com/naver/maps/navi/v2/internal/telemetry/SessionTripReportManager', 'f(Ljava/util/List;Lcom/naver/maps/navi/v2/shared/api/model/GuidePoint;Ljava/util/List;)V',
  (':cond_1c\n    iget-object v0, p0, Lcom/naver/maps/navi/v2/internal/telemetry/SessionTripReportManager;->c:',
   f':cond_1c\n    invoke-static {{}}, {RG}->gateTrip()Z\n    move-result v0\n    if-nez v0, :rg_trip\n    return-void\n    :rg_trip\n'
   '    iget-object v0, p0, Lcom/naver/maps/navi/v2/internal/telemetry/SessionTripReportManager;->c:'))

# ---------------- UI (classes12): driving track at 1 Hz ----------------
p('classes12', 'com/naver/map/core/navigation/NaviStore', 'M0(',
  ('if-eqz v0, :cond_2c9\n    iget-object v1, p0, Lcom/naver/map/core/navigation/NaviStore;->e1:Ljava/util/List;',
   f'if-eqz v0, :cond_2c9\n    invoke-static {{}}, {RG}->gateTrack()Z\n    move-result v1\n    if-eqz v1, :cond_2c9\n'
   '    iget-object v1, p0, Lcom/naver/map/core/navigation/NaviStore;->e1:Ljava/util/List;'))

def norm(body):
    """drop debug directives and blank lines so multi-line anchors match"""
    body = re.sub(r'(?m)^[ \t]*\.(line \d+|local [^\n]*|end local [^\n]*|restart local [^\n]*|prologue|epilogue)\n', '', body)
    return re.sub(r'(?m)^[ \t]*\n', '', body)


def method_span(txt, meth):
    """(start, end) of the method body whose '.method ...name(' line contains meth (unique)"""
    hits = []
    for m in re.finditer(r'(?m)^\.method [^\n]*$', txt):
        line = m.group(0)
        name = line.split()[-1]
        if (meth and name.startswith(meth)) or (not meth):
            end = txt.index('\n.end method', m.end())
            hits.append((m.start(), end))
    return hits


def main(root):
    total = 0
    for dex, cls, meth, reps in P:
        path = os.path.join(root, dex, cls + '.smali')
        txt = open(path, encoding='utf-8').read()
        spans = method_span(txt, meth)
        # strip .line noise inside methods so multi-line anchors match (debug lines only)
        new_txt = txt
        for old, new, *cnt in reps:
            cnt = cnt[0] if cnt else 1
            found = []
            for s, e in spans:
                found.append(norm(new_txt[s:e]).count(old))
            if sum(found) != cnt:
                sys.exit(f'FAIL {cls} {meth}: expected {cnt} match(es), got {found}\n--- {old}')
        # apply on normalized method bodies
        out, pos = [], 0
        for s, e in spans:
            body = norm(new_txt[s:e])
            for old, new, *cnt in reps:
                body = body.replace(old, new)
            out.append(new_txt[pos:s]); out.append(body); pos = e
        out.append(new_txt[pos:])
        new_txt = ''.join(out)
        open(path, 'w', encoding='utf-8', newline='\n').write(new_txt)
        total += sum((r[2] if len(r) > 2 else 1) for r in reps)
        print(f'ok  {dex}/{cls} {meth}  ({len(reps)} edits)')
    rg_dst = os.path.join(root, 'classes4', 'com/naver/maps/navi/mapmatching/RateGate.smali')
    shutil.copy(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'RateGate.smali'), rg_dst)
    print('RateGate added; total replacements', total)


if __name__ == '__main__':
    main(sys.argv[1])
