"""Verify ten direct 15.0 telemetry leaves and retained report/warning paths.

The separate protected BaseService upload/reset continuation is not covered here;
its independently recovered method contract must be verified by the startup port.
"""
from pathlib import Path

from verify_flitsmeister import canonical, digest, method

ORIGINALS = {'Laek;->onStart()V': '3c7e38f1452e00ce0c2ad1d1da3b6167ff56efede4c14d91d4c653706c844868',
 'Lbemobile/cits/sdk/core/manager/CITSRequestManager;->sendEventMonitoringAndEvaluation(Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;Lbemobile/cits/sdk/core/model/request/MonitoringEvent;Lbemobile/cits/sdk/core/model/request/MonitoringAlert;Ljava/lang/String;)V': '0b2ee6ccafa49bf90d20a5268a1ecf718cd0ecb9d0bb0ed44ad28e5f543e77ae',
 'Lbemobile/cits/sdk/core/service/task/CITSSensorSamplingTask;->onStart()V': '8cbda5f68bbf69d9a975d0be2d6e3ffe58abaccee0344be236569ff0e5fe56b4',
 'Lmc9$b;->run()V': '69f12248d521015fcebaedfcf517471ab1cbd724ec183a11f2dd6652b33d806b',
 'Lmc9;->onStart()V': '755c5fbc34dae337155a7de4e0358e5bda8cc68cc99c3992af93594e915f7eee',
 'Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->onStart()V': '9a6422b79c3ff2e94f2efa74218ec966946c15235fc432c665061ebf037924cf',
 'Lnl/flitsmeister/triphistory/domain/service/TripHistoryService;->onBaseReportEvent(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V': '7ca7e72842397260505c39491dad81bf9c1faa77890f4bc0864de5ed5c59031f',
 'Lpc9;->b(Ljava/lang/String;)Ll1k;': 'b6ff14a21a05c386f65fb55780b6b91109c4ee6723ffcde155efae7435a80d56',
 'Lqac$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;': '1de3b8a824437d7ae334ebc910fc2d6098051f510a08cf99ae93671b808561ab',
 'Lu61;->x(Lun4;)Ljava/lang/Object;': '3d2f9fd08d920d78acb49c828ddae950b1f5936e0a2031f7353cc8ae8b83032e'}
BOUNDED_HASHES = {'Lu61;->x(Lun4;)Ljava/lang/Object;': '49b6a53e853d777b67d4a46ef3169007447017edd42ad8e474aebac13ab96a0d'}
RETAINED = {'Lbemobile/cits/sdk/core/manager/CITSRequestManager;->sendEventConfirmation(Ljava/lang/String;Ljava/lang/String;I)V': 'f6d67dd07c92ad741ae94044397f8927846ad13666404adf7e416fe92c78a3e3',
 'Lbemobile/cits/sdk/core/service/task/GPSTask;->onLocationChanged(Landroid/location/Location;)V': '167dbba1fe52f7457288511d7159db9fc177c858414883c5ff2c195878f94e81',
 'Lbemobile/cits/sdk/core/service/task/GPSTask;->setLast25MLocation(Landroid/location/Location;)V': '7da6b2b6ae7a5c11ef4c962de4c5cd219d345ed46a881afc398bb9778f89e458',
 'Lbemobile/cits/sdk/core/service/task/GPSTask;->setLastKnownLocation(Landroid/location/Location;)V': 'f14a2e3650dcd020cf60908c66b6756c03713950bc2383f213a5991d5f594625',
 'Lbemobile/cits/sdk/core/service/task/GPSTask;->shouldLocationBeSentNow(Landroid/location/Location;Landroid/location/Location;)Z': '3ef88a0801607c8a854b60480b8d2d72cdde541111e47c8fc5707cbc0ce998d9',
 'Lelf;->b(Lnl/flitsmeister/fmcore/models/enums/ReportType;Landroid/location/Location;FLnl/flitsmeister/fmcore/models/data/report/UserData;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Boolean;Lq5f;)V': '29581271b1ee89aae4313d8131d9129ddea6be2bddd5df09a25fe1182ae4ec7f',
 'Lt4f;->d(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Ljava/lang/Boolean;Lq5f;Landroid/location/Location;ZLjava/util/List;)V': '93e65e8a376a0a949b77f6e73d0dbd97ae0df00178aa4c469d3e6ba17dede287'}


def verify(root: Path, enabled: bool) -> None:
    failures = []
    for descriptor, original_hash in ORIGINALS.items():
        body = method(root, descriptor)
        wanted = ['return-void']
        if descriptor.startswith('Lpc9;'):
            wanted = ['sget-object v0, Ll1k;->a:Ll1k;', 'return-object v0']
        elif descriptor.startswith('Lqac$a;'):
            wanted = ['invoke-static {v12}, Lhof;->b(Ljava/lang/Object;)V',
                      'sget-object v0, Ll1k;->a:Ll1k;', 'return-object v0']
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
