"""Check six direct 15.0 partner boundaries and the native footer resource.

The protected MainActivity footer visibility/listener calls are verified by the
separate recovered startup contract, not by this direct-leaf verifier.
"""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from verify_flitsmeister import canonical, digest, method

CUSTOMERS = 'Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;'
# Captured from the publisher original, before the Parking patch exists.
ORIGINALS = {'Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;->fetchCustomer-gIAlu-s(Ljava/lang/String;Lsn4;)Ljava/lang/Object;': ('06f5f94f6fa0ef6ee7bf474b3da489201d49df1379a1877c169a4ad4516baf7d',
                                                                                                                                                      ['public'],
                                                                                                                                                      4),
 'Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;->fetchInitialCustomer-IoAF18A(Lsn4;)Ljava/lang/Object;': ('cf5ef3bfb2b17c8fd379ef9709be2c9f64f13b18cccbef0f0d30ed0b484374b6',
                                                                                                                                           ['public'],
                                                                                                                                           4),
 'Lnyb;->k(Lnl/flitsmeister/models/data/account/UserAccountFM;ZLjava/lang/Long;Ls39;Landroidx/compose/runtime/Composer;I)V': ('1a3a3afbb09b63a9eead843744d1b1733664fa9a8a4a2aee1a2cb67f2eaacaf2',
                                                                                                                              ['final',
                                                                                                                               'public',
                                                                                                                               'static'],
                                                                                                                              33)}

PARTNER_MENUS = {'Lnyb;->e(Ls39;Landroidx/compose/runtime/Composer;I)V': ('124a0efa49b2cab5841636eafed9ed65aee2c47fb3ea4a320f1bcb05e5e32552',
                                                          ['final', 'public', 'static'],
                                                          27),
 'Lnyb;->q(ZLjava/lang/Boolean;Ls39;Landroidx/compose/runtime/Composer;I)V': ('40a4df3cc70185dcf5fe9c02ab2ad697b5cf7406328c186161e784392acf98e3',
                                                                              ['final', 'public', 'static'],
                                                                              29)}
MAIN_ACTIVITY = 'Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V'
SETTINGS_GENERAL = (
    'Lx1h;->d(Landroidx/compose/ui/Modifier;Ls39;Ls39;Ls39;Ls39;Ls39;Ls39;Z'
    'Lnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;'
    'Landroidx/compose/runtime/Composer;I)V'
)
# (partner services disabled, ads hidden): publisher whole-method contracts,
# replacing only Parking @343, Carwash @393 and optionally Ads @438 with NOP.
# My vehicle @327, Display @423, Language @455 and all Composer groups remain.
from flitsmeister15_settings_contracts import SETTINGS_HASHES
def verify_settings(root: Path, partners_disabled: bool, hide_ads: bool) -> None:
    body = method(root, SETTINGS_GENERAL)
    assert sorted(body.splitlines()[0].split()[1:-1]) == ['final', 'public', 'static']
    assert int(re.search(r'\.locals (\d+)', body)[1]) == 40
    assert digest(body) == SETTINGS_HASHES[partners_disabled, hide_ads], 'Parking/Carwash Settings entries or neighboring rows differ'


def verify(root: Path, disabled: bool, hide_pro: bool = False, hide_ads: bool = False) -> None:
    verify_settings(root, disabled, hide_ads)
    for descriptor, (original_hash, flags, locals_count) in (ORIGINALS | PARTNER_MENUS).items():
        body = method(root, descriptor)
        assert sorted(body.splitlines()[0].split()[1:-1]) == flags
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_count
        if not disabled:
            assert digest(body) == original_hash, 'Retain original Parking: ' + descriptor
        elif descriptor.startswith('Lnyb;'):
            assert canonical(body) == ['return-void'], 'Partner menu entry still renders: ' + descriptor
        else:
            instructions = canonical(body)
            assert instructions == [
                'new-instance v0, Ljava/lang/UnsupportedOperationException;',
                'const-string v1, "Parking is disabled by the selected patch"',
                'invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V',
                'new-instance v1, Leof$a;',
                'invoke-direct {v1, v0}, Leof$a;-><init>(Ljava/lang/Throwable;)V',
                'return-object v1',
            ], 'Customer fetch must return real Kotlin Result failure before network, crypto or storage: ' + descriptor
    if disabled:
        footer = ET.parse(root / 'res/layout/activity_main_bottomsheet_footer.xml').getroot()
        namespace = '{http://schemas.android.com/apk/res/android}'
        nodes = [node for node in footer.iter() if node.get(namespace + 'id') == '@id/parking']
        assert len(nodes) == 1
        parking = nodes[0]
        assert parking.get(namespace + 'visibility') == 'gone'
        for dimension in ('layout_width', 'layout_height'):
            assert parking.get(namespace + dimension) in ('0.0dip', '0.0dp', '0dp')
        assert parking.get(namespace + 'importantForAccessibility') == 'no'
    print(f'PASS: Partner services disabled={disabled}; menus, Settings entries, footer resource and customer-fetch contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--disabled', action='store_true')
    parser.add_argument('--hide-pro', action='store_true')
    parser.add_argument('--hide-ads', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.disabled, args.hide_pro, args.hide_ads)
