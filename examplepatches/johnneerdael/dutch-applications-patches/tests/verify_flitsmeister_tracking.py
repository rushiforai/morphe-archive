"""Verify tracking controls in independently decoded Flitsmeister 14.17 DEX.

Publisher hashes were captured before TrackingPatch existed. This module never
loads production patch plans. It checks both enabled and disabled selections,
including typed return values, synchronous job completion and retained Firebase
initialization/token Tasks. First-party telemetry has its own companion verifier.
"""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from verify_flitsmeister import canonical, digest, method

# descriptor: (publisher body SHA-256, access flags, locals, required behavior)
ORIGINALS = {'Lcom/google/android/gms/measurement/internal/zzic;->zzC()I': ('f53e83083c4bb1b7b6d03936bb11edb434ac20d7a9ac8c28c3d29e2fff148bb4',
                                                                ['final', 'public'],
                                                                3,
                                                                'deactivated'),
 'Lcom/google/android/gms/measurement/internal/zzal;->zzu()Z': ('5be4608619e6f8c5bfc838c7825d603dcaf59da1651d1d224b612e5fd83462b1',
                                                                ['final', 'public'],
                                                                1,
                                                                'false'),
 'Lcom/google/android/gms/measurement/internal/zzal;->zzv()Z': ('3c255463b32c547e44f2a893c1fa090360f84014845e7b4d0bdb67f702f3f60b',
                                                                ['final', 'public'],
                                                                1,
                                                                'false'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzX(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZLjava/lang/Long;Ljava/lang/Long;)V': ('bcb80046f6254054789d6fe8800a0a1e5be942bb4088257dbdcf78b731f1a152',
                                                                                                                                                         ['final',
                                                                                                                                                          'private'],
                                                                                                                                                         9,
                                                                                                                                                         'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V': ('38e04cd1efc0830a08ba41b2bf90f420b46d0a1fffc7409a9fbfc60e323374d0',
                                                                                                                       ['final',
                                                                                                                        'public'],
                                                                                                                       6,
                                                                                                                       'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzl(Landroid/os/Bundle;)V': ('47c705c08c2caec5db7c96cfba985ed4508ce464c749b99aa822981f3e47af55',
                                                                                   ['final', 'public'],
                                                                                   1,
                                                                                   'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzo(Ljava/lang/String;)V': ('152ddc5ceb1d355ed15b7f8544c1ac7f8b8d6ea734b3f2dc608556da48126e88',
                                                                                  ['final', 'public'],
                                                                                  1,
                                                                                  'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzp(Lcom/google/android/gms/internal/measurement/zzdd;Ljava/lang/String;Ljava/lang/String;)V': ('1b3aaaba316f5da99db824ae1ab6b930cecf670a4255e505e433a77215a12f76',
                                                                                                                                                      ['final',
                                                                                                                                                       'public'],
                                                                                                                                                      1,
                                                                                                                                                      'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzL(Landroid/os/Bundle;)V': ('f4857e0be60dd0dbda2ad367659bce3187d31f93244af29cd2d8ada23ee9e796',
                                                                                   ['final', 'public'],
                                                                                   1,
                                                                                   'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzu(Ljava/lang/String;)V': ('fcf7411241087f2f0e72f2159a6a6e1abb5ae04895d13c5a36367d55e1d040f0',
                                                                                  ['final', 'public'],
                                                                                  1,
                                                                                  'void'),
 'Lcom/google/android/gms/internal/measurement/zzez;->zzv(Ljava/lang/String;)V': ('319f8c90be7ff833a98861ac4e4dee2c2e6ef63cba7b7ebeaaff6b567b61c3db',
                                                                                  ['final', 'public'],
                                                                                  1,
                                                                                  'void'),
 'Lko;->a(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V': ('7fa9c2a683566b4059e0d3c13890e14f56d827b2fd42b84888c6d4f3d50f6a7f',
                                                                          ['final', 'public', 'static'],
                                                                          8,
                                                                          'void'),
 'Lxp5;->a()Z': ('f76dc1b0eb50f98b738c092b0cf8ab0e5c540419b3571edf732361b9337262ae',
                 ['declared-synchronized', 'final', 'public'],
                 3,
                 'false'),
 'Lgb8;->b(Ljava/lang/String;)V': ('fe6795049e98459493f4f635caa2202dd34f3cff3c3979914216fee7cb4f5b72',
                                   ['final', 'public'],
                                   4,
                                   'void'),
 'Lgb8;->c(Ljava/lang/Throwable;)V': ('188dc80d50f0306a84ce03a19c82e5b562c7279f3e0b0061934e13c95a3321d0',
                                      ['final', 'public'],
                                      2,
                                      'void'),
 'Lgb8;->d(Ljava/lang/String;Ljava/lang/String;)V': ('b8c362008311f11f7217dec8f1209de3d0a1756c2319b32e70f77a9e5b242d12',
                                                     ['final', 'public'],
                                                     2,
                                                     'void'),
 'Lgb8;->e(Ljava/lang/String;Z)V': ('d8f6f589d4c3fcaeeec5a7dd6c966960c1d8a006c462b6e274f899a797bc524b',
                                    ['final', 'public'],
                                    2,
                                    'void'),
 'Lbe4;->f()Ljava/lang/Boolean;': ('bd1a3e687c359b28cdff879dec1c45371c00f2f4a5fb0795a9ca8726eea70e8b',
                                   ['final', 'public'],
                                   3,
                                   'boxed_false'),
 'Lbe4;->n()Z': ('ffafe0daa9071aa6dcad47fb1dc3874bc7db8565765ede71bddeecaf0c858a65', ['final', 'public'], 6, 'false'),
 'Lcom/google/firebase/perf/config/RemoteConfigManager;->triggerRemoteConfigFetchIfNecessary()V': ('991b086bdf948de53f7c5a1b7ed8a591df9a8711b2b26d04f077e30095407f56',
                                                                                                   ['private'],
                                                                                                   2,
                                                                                                   'void'),
 'Laya;->c()Ljava/lang/Boolean;': ('22d2cabc8463f40b549f63ac38eaa0a2cdc3f8feaa97f7f418446c515fd0e6c7',
                                   ['final', 'public'],
                                   2,
                                   'boxed_false'),
 'Lj6f;->c()Ljava/lang/Boolean;': ('6ba36577b90a77e26d3024cfc24ae0d9e8c02574d17827b7dd2f920f6c20a252',
                                   ['final', 'public'],
                                   0,
                                   'boxed_false'),
 'Lj6f;->a(Ltn4;)Ljava/lang/Object;': ('345205b0e702b2cfaed643b125eff676046b550594578d11bf9be2cee89e9968',
                                       ['final', 'public'],
                                       13,
                                       'unit'),
 'Lbqg;->a(Lwpg;)V': ('d20d1e48f7fcd8271271b5da63a50f3cfeb8e6ba2ce12207c76ba580a5f56d10', ['final', 'public'], 3, 'void'),
 'Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;': ('20c10f59239666203e93b4d0b1e2a12c39cee592d26732fafb8d32f42d8ce83c',
                                                                                                                                                                                  ['public',
                                                                                                                                                                                   'static'],
                                                                                                                                                                                  9,
                                                                                                                                                                                  'ad_id'),
 'Lcom/useinsider/insider/Insider;->init(Landroid/app/Application;Ljava/lang/String;)V': ('b0906723244ec9ba1f8b15745bf927612e6cb940325df10a21fcb9fcceef355a',
                                                                                          ['public'],
                                                                                          2,
                                                                                          'void'),
 'Lcom/useinsider/insider/Insider;->f()Z': ('2863e6b3fe8b7aaf2f135b849ad2b7b093c986a226f715c51f1a9fea8d1fd870',
                                            ['public'],
                                            1,
                                            'false'),
 'Lcom/useinsider/insider/v;->c()Z': ('4ce280db8ad31cfe85c0821c8e0e8bec7d233b03bc6b9cece576d62541e625a4',
                                      ['final', 'public'],
                                      10,
                                      'false'),
 'Lcom/useinsider/insider/Insider;->tagEvent(Ljava/lang/String;)Lcom/useinsider/insider/InsiderEvent;': ('50ebc7ef761b1d235e0d949f1b2878c505c8c7f6aed2398d8f59b1eda9f0522b',
                                                                                                         ['public'],
                                                                                                         1,
                                                                                                         'event'),
 'Lcom/useinsider/insider/Insider;->putException(Ljava/lang/Exception;)V': ('43864a7814ea5ade6af6a4be6942c050ffcb04b1d05078ac970cd5af75762bbb',
                                                                            ['declared-synchronized', 'public'],
                                                                            1,
                                                                            'void'),
 'Lcom/useinsider/insider/InsiderEvent;->build()V': ('1a51a37f4715ff0732b621dc9f7445f2a6eb30105ea59f5bb01e9ea9e83bae21',
                                                     ['public'],
                                                     4,
                                                     'void'),
 'Lcom/useinsider/insider/InsiderGeofence;->initialize(Landroid/content/Context;)V': ('d6e7a59a0c68d2a5a8b8d05fcd206105444335bce83be0dd6c2b7a15691826ae',
                                                                                      ['public', 'static'],
                                                                                      1,
                                                                                      'void'),
 'Lcom/useinsider/insider/InsiderGeofenceReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': ('6174e57212b87d0e3a9ccda441995170befb68ffb94bafc408b227e3339efbcf',
                                                                                                                     ['final',
                                                                                                                      'public'],
                                                                                                                     3,
                                                                                                                     'void'),
 'Lcom/useinsider/insider/SessionPayloadJobService;->onStartJob(Landroid/app/job/JobParameters;)Z': ('04b46c1c4eb7fd532e71024cf52576547999ef0d6da82a5e2ee3362c31fb2cdb',
                                                                                                     ['final', 'public'],
                                                                                                     2,
                                                                                                     'false'),
 'Lcom/useinsider/insider/SessionPayloadJobService;->b(Landroid/content/Context;)V': ('9acf5ca4b64b63bcb15f81b11a75f244126324d8a96d78b96599544464fddd33',
                                                                                      ['public', 'static'],
                                                                                      4,
                                                                                      'void'),
 'Lcom/useinsider/insider/InsiderAmplificationService;->onStartJob(Landroid/app/job/JobParameters;)Z': ('ad6139425c2d645899d7596ce38b983d744c4810f59450227bf9c8588cc1156d',
                                                                                                        ['final', 'public'],
                                                                                                        2,
                                                                                                        'false'),
 'Lcom/useinsider/insider/InsiderAmplificationService;->onStopJob(Landroid/app/job/JobParameters;)Z': ('fcc08ea580343c28587ad109fcd4bf1ad22504ab4db6b6fd59406f33853604d7',
                                                                                                       ['final', 'public'],
                                                                                                       0,
                                                                                                       'false'),
 'Le4l;->d()V': ('ee2a7027c3b7d22d1717650c56975b56d10afdfe6558e4adf395bb531115800c',
                 ['declared-synchronized', 'final', 'public'],
                 2,
                 'void'),
 'Lcom/useinsider/insider/o;->d(Ljava/lang/String;Lorg/json/JSONObject;Landroid/content/Context;ZLe8l;)Lyzk;': ('02736778a0acdcdc54f92831630ce5047825eb6007c5acf58e882c62f29d8a7f',
                                                                                                                ['public',
                                                                                                                 'static'],
                                                                                                                21,
                                                                                                                'insider_response'),
 'Lz80;->j(Ljava/lang/String;Ljava/util/Map;)V': ('4724d98ddd850ba749a108f33f334a1e421a000f92a56207a0b761df0f23e15e',
                                                  ['final', 'public'],
                                                  7,
                                                  'void'),
 'Lj5a;->a(Ljava/lang/Object;Ljava/lang/String;)V': ('60ffa147a782c718251c0bc63b2f034f9030c93b28e9018f5de0b6f1806294bf',
                                                     ['final', 'public'],
                                                     4,
                                                     'void'),
 'Lj5a;->c(Luo;)V': ('0dcabb7f31822b6cfda7319b8f42d3601908922ce3e22d4490c975fd999755dc', ['final', 'public'], 8, 'void')}
ORIGINALS.update({'Ll6c;->a()Z': ('4b46d5499a25ba5818a145ffad00f7ebb74bb5bd2f7eabe1ad192abc11ca453d', ['public', 'static'], 6, 'false'),
 'Ll6c;->c(Landroid/os/Bundle;Ljava/lang/String;)V': ('137c63c2ac25a0bb5fe9ef24368cc891d5c53db79a58c11b4be1fd971dabf6f4',
                                                      ['public', 'static'],
                                                      5,
                                                      'void')})

RETAINED = {'Lcom/useinsider/insider/Insider;->getCurrentUser()Lcom/useinsider/insider/InsiderUser;': '9f5446b649b49b502309848eac738d61fa692a15ed7d7f54871dec1cd0f9004e',
 'Lcom/useinsider/insider/InsiderUser;-><init>()V': '3c032cb92339a14ccfe861b62bfc9df7f458e2b1ef61e1dd31f49687b8144fb7',
 'Lcom/google/firebase/provider/FirebaseInitProvider;->onCreate()Z': 'a1b8b929583c36a292d289dd32e15d14817e023457bb877743bb0cbf9e0ab1ef',
 'Lcom/google/firebase/messaging/FirebaseMessaging;->getToken()Lcom/google/android/gms/tasks/Task;': '87143eddf6818ae154b286259b01c20f82db7238df409d95f50aa471dab5c86c',
 'Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V': '09db63826ead5d6e3c876fe8fdd288310af2608b4f2ec6f80ed65adcc0daaffb',
 'Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;': '7aa112e9b2ce7b290f39ff3ab6a81201e00d3ab689c229749e3583de3194a4e7'}


# These settings also cover Measurement implementations loaded from Play services.
COLLECTION_METADATA = {'firebase_analytics_collection_deactivated': 'true',
 'firebase_analytics_collection_enabled': 'false',
 'google_analytics_adid_collection_enabled': 'false',
 'google_analytics_automatic_screen_reporting_enabled': 'false',
 'firebase_crashlytics_collection_enabled': 'false',
 'firebase_performance_collection_deactivated': 'true',
 'firebase_performance_collection_enabled': 'false',
 'firebase_sessions_enabled': 'false'}

REMOVED_PERMISSIONS = {
    'com.google.android.gms.permission.AD_ID',
    'android.permission.ACCESS_ADSERVICES_AD_ID',
    'android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
}


def expected(kind: str) -> list[str]:
    if kind == 'void':
        return ['return-void']
    if kind in ('false', 'deactivated'):
        return ['const/4 v0, ' + ('0x1' if kind == 'deactivated' else '0x0'), 'return v0']
    if kind == 'boxed_false':
        return ['sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;', 'return-object v0']
    if kind == 'unit':
        return ['sget-object v0, Ltvj;->a:Ltvj;', 'return-object v0']
    if kind == 'event':
        return [
            'new-instance v0, Lcom/useinsider/insider/InsiderEvent;',
            'const-string v1, ""',
            'invoke-direct {v0, v1}, Lcom/useinsider/insider/InsiderEvent;-><init>(Ljava/lang/String;)V',
            'return-object v0',
        ]
    if kind == 'ad_id':
        return [
            'new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;',
            'const-string v1, "00000000-0000-0000-0000-000000000000"',
            'const/4 v2, 0x1',
            'invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V',
            'return-object v0',
        ]
    if kind == 'insider_response':
        # A real, synchronous successful response object: callers can complete
        # their callbacks and do not schedule a network-failure retry. No null
        # Task, missing callback, shared HTTP client or Android API is changed.
        return [
            'new-instance v0, Lyzk;',
            'const-string v1, ""',
            'const/16 v2, 0xcc',
            'invoke-direct {v0, v1, v2}, Lyzk;-><init>(Ljava/lang/String;I)V',
            'return-object v0',
        ]
    raise AssertionError('Unknown tracking contract: ' + kind)


def verify(root: Path, enabled: bool) -> None:
    failures = []
    namespace = '{http://schemas.android.com/apk/res/android}'
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    application = manifest.find('application')
    assert application is not None
    for name in REMOVED_PERMISSIONS:
        nodes = [node for node in manifest.findall('uses-permission') if node.get(namespace + 'name') == name]
        assert len(nodes) == (0 if enabled else 1), 'Advertising permission contract: ' + name
        if nodes:
            assert nodes[0].attrib == {namespace + 'name': name}, name
    for name, value in COLLECTION_METADATA.items():
        nodes = [node for node in application.findall('meta-data') if node.get(namespace + 'name') == name]
        if enabled:
            if len(nodes) != 1 or nodes[0].get(namespace + 'value') != value:
                failures.append('SDK collection metadata: ' + name)
        elif nodes:
            failures.append('Unexpected SDK collection metadata with control disabled: ' + name)
    for descriptor, (original_hash, flags, locals_count, kind) in ORIGINALS.items():
        body = method(root, descriptor)
        assert sorted(body.splitlines()[0].split()[1:-1]) == flags, descriptor
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_count, descriptor
        valid = canonical(body) == expected(kind) if enabled else digest(body) == original_hash
        if not valid:
            failures.append(descriptor)
    for descriptor, original_hash in RETAINED.items():
        assert digest(method(root, descriptor)) == original_hash, 'Retained SDK contract changed: ' + descriptor
    assert not failures, 'Tracking controls differ (' + str(len(failures)) + '): ' + '; '.join(failures)
    print(f'PASS: Disable tracking={enabled}; {len(ORIGINALS)} SDK collection/event/identity/job contracts; {len(RETAINED)} retained contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.enabled)
