"""Verify automatic first-party trajectory collection is stopped in emitted DEX."""
from pathlib import Path

from verify_flitsmeister import canonical, digest, method

ORIGINALS = {
    'Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->onStart()V':
        '9470e8d71ed03abb367c771b011c02d59e31f8a2a1bbb2e64e4047e02b23f11b',
    'Lad9;->onStart()V': 'c79c3d8ffcc8e521517f5ed4985006ba5f79d06be8bde0636266dcd46a2ddbce',
    'Lad9$b;->run()V': '4dc84f71cf83aae80f39d230832042fee5dc24bba9ddc8c271638b7234bf3483',
    'Ldd9;->b(Ljava/lang/String;)Ltvj;': 'c586377aea61944777ef0c3ef0ef2fa55c05b2470ce7efbaec4e7f7024feeb5f',
    'Li8c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;': 'c169eb6c1c338d458409fae96ca9a2cc4b2a623915bed06fb462b3e0beb74b65',
    'Lbemobile/cits/sdk/core/service/task/CITSSensorSamplingTask;->onStart()V': '07fb31eab9f44e524ed21916d28568dd39cce207d6dc0b58951b71407480b3c8',
    'Lbemobile/cits/sdk/core/manager/CITSRequestManager;->sendEventMonitoringAndEvaluation(Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;Lbemobile/cits/sdk/core/model/request/MonitoringEvent;Lbemobile/cits/sdk/core/model/request/MonitoringAlert;Ljava/lang/String;)V': 'd85a388724983a8cbf056c98b9ada1ee8a997edc667350c8d8832942706b4b97',
    'Lnl/flitsmeister/triphistory/domain/service/TripHistoryService;->onBaseReportEvent(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V': '1614dec5557c4f1c5a9b0d8ec3aeaeaf640664856d37754f1c5119b4111fb1ec',
    'Lm8k;->onStart()V': '985ee7d791104af84cac16edbda5758bb7942112801be7ce9f7d5b1caa33d244',
    'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onStartCommand(Landroid/content/Intent;II)I': '65a8b56d7b88d60ad923d4f4591932a27a42489b11e1c396384e2d506e739641',
    'Lp61;->x(Lvn4;)Ljava/lang/Object;': '0957e78195883e60d2ae671b23c36f1256b7993826938c533f10b026294d79a2',
}
BOUNDED_HASHES = {
    'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onStartCommand(Landroid/content/Intent;II)I': 'f4c56c8ab2822ebea4befe6c202b409cb4ca09a031bf0b23ec92103f89cf079b',
    'Lp61;->x(Lvn4;)Ljava/lang/Object;': '5a6f549d5182598f9bb9803eda6ef0ef672ae1a9a0118df70b24f79d9503da07',
}
RETAINED = {
    'Lbemobile/cits/sdk/core/service/task/GPSTask;->shouldLocationBeSentNow(Landroid/location/Location;Landroid/location/Location;)Z': 'aeedc5ed4e6d6b1e4221872efc69c9a364c01bdb2660a64cc4cc355a29423690',
    'Lfgf;->b(Lnl/flitsmeister/fmcore/models/enums/ReportType;Landroid/location/Location;FLnl/flitsmeister/fmcore/models/data/report/UserData;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Boolean;Ll0f;)V': '0c08db7159afde369a5468eec48b6298ee16ad9df4646fb38ff14f6e2ebe92d5',
    'Lpze;->d(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Ljava/lang/Boolean;Ll0f;Landroid/location/Location;ZLjava/util/List;)V': 'dfda251d9da566750f23e254c3c561e68a9061cedbb75ce1293d8c155a3dc8c8',
    'Lbemobile/cits/sdk/core/manager/CITSRequestManager;->sendEventConfirmation(Ljava/lang/String;Ljava/lang/String;I)V': '97e78d8abe2ae391aa124297b22110fd79cd18c6a187efcbd1ed8dd4601e886f',
    'Lbemobile/cits/sdk/core/service/task/GPSTask;->onLocationChanged(Landroid/location/Location;)V': '310c1ff4cc60efc58e1eba8bec1cc786b90a61ca4e08a0bca0454fa04ceb22a2',
    'Lbemobile/cits/sdk/core/service/task/GPSTask;->setLast25MLocation(Landroid/location/Location;)V': '9b5befc35dc11620c0758b24142a99924626b8b593f8a94a65b14df2d7fad8df',
    'Lbemobile/cits/sdk/core/service/task/GPSTask;->setLastKnownLocation(Landroid/location/Location;)V': 'bff4641c4ac96ce88129c6e659e7a7e1a57daba536c1ea9902e25c7c36b71a66',
}


def verify(root: Path, enabled: bool) -> None:
    failures = []
    for descriptor, original_hash in ORIGINALS.items():
        body = method(root, descriptor)
        wanted = ['return-void']
        if descriptor.startswith('Ldd9;'):
            wanted = ['sget-object v0, Ltvj;->a:Ltvj;', 'return-object v0']
        elif descriptor.startswith('Li8c;'):
            wanted = ['invoke-static {v12}, Lijf;->b(Ljava/lang/Object;)V',
                      'sget-object v0, Ltvj;->a:Ltvj;', 'return-object v0']
        if enabled and descriptor in BOUNDED_HASHES:
            valid = digest(body) == BOUNDED_HASHES[descriptor]
        else:
            valid = canonical(body) == wanted if enabled else digest(body) == original_hash
        if not valid:
            failures.append(descriptor)
    assert not failures, 'Automatic trajectory collection contracts differ: ' + ', '.join(failures)
    for descriptor, expected in RETAINED.items():
        assert digest(method(root, descriptor)) == expected, 'Retain explicit report/rating and local warning state: ' + descriptor
    print(f'PASS: automatic telemetry disabled={enabled}; {len(ORIGINALS)} collection/egress/identity contracts; explicit reports and local warning state retained')


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.enabled)
