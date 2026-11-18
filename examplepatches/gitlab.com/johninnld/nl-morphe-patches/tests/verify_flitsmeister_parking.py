"""Check Parking menu suppression and fail-closed customer fetches in actual DEX."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from verify_flitsmeister import canonical, digest, method

CUSTOMERS = 'Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;'
# Captured from the publisher original, before the Parking patch exists.
ORIGINALS = {
    'Lvwb;->k(Lnl/flitsmeister/models/data/account/UserAccountFM;ZLjava/lang/Long;Lz39;Landroidx/compose/runtime/Composer;I)V':
        ('216a44516ff199c6bb7d9690b6463cb86aa6747959c3ed006efc76edf341ba55', ['final', 'public', 'static'], 33),
    CUSTOMERS + '->fetchInitialCustomer-IoAF18A(Ltn4;)Ljava/lang/Object;':
        ('1b4d68c6d28a4f866d63d78d576883c545b603b0490c45f0a6dc3dfe15633e18', ['public'], 4),
    CUSTOMERS + '->fetchCustomer-gIAlu-s(Ljava/lang/String;Ltn4;)Ljava/lang/Object;':
        ('0659fd16bc4c475332486aa8293740dcacc8e8613cbdc89741f7c7812cee6aca', ['public'], 4),
}

PARTNER_MENUS = {
    'Lvwb;->e(Lz39;Landroidx/compose/runtime/Composer;I)V':
        ('291fc5c19e2681e501808b02a35d38987cb78027731e7004e86a8f1067f6214a', ['final', 'public', 'static'], 27),
    'Lvwb;->q(ZLjava/lang/Boolean;Lz39;Landroidx/compose/runtime/Composer;I)V':
        ('0936f1095b50f1d48d031a56c639f76114f807f4029ca4e3e0b4f43fa5750d8d', ['final', 'public', 'static'], 29),
}
MAIN_ACTIVITY = 'Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V'
SETTINGS_GENERAL = (
    'Ljxg;->d(Landroidx/compose/ui/Modifier;Lz39;Lz39;Lz39;Lz39;Lz39;Lz39;Z'
    'Lnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;'
    'Landroidx/compose/runtime/Composer;I)V'
)
# (partner services disabled, ads hidden): publisher whole-method contracts,
# replacing only Parking @343, Carwash @393 and optionally Ads @438 with NOP.
# My vehicle @327, Display @423, Language @455 and all Composer groups remain.
SETTINGS_HASHES = {
    (False, False): '03c4dae2584bcaef85a1a3423c09c9d25f2ffce2848f19d7add44419c393828a',
    (False, True): '83a2899921485e6f70ebc6bcd7d422e394ee4b78d491140663238ef7039c3249',
    (True, False): 'a38ff4774e8e633fe3177ccebf7e104b34665f420530a7fb21e3ffe86e9dce7d',
    (True, True): 'd51715f6cae50ca29e1e8406d9becfa4d1c1e4ad70eb4b6369543876c006e370',
}
# Original and notice-selected bodies, with only Parking visibility/listener
# calls 87 and 90 replaced by NOP. This also retains every unrelated callback.
FOOTER_ACTIVITY_HASHES = [
    '68795f0e5c1862232c1768282154eadfc08db3bea0dd7395431bcbcb5ab80db9',
    '05b6d38298d8449b08c1a2a3a031c9583c917265277c5c1aba957cb56c943947',
]


def verify_footer(root: Path, hide_pro: bool) -> None:
    assert digest(method(root, MAIN_ACTIVITY)) == FOOTER_ACTIVITY_HASHES[int(hide_pro)], 'Parking shortcut must not be made visible/clickable again at startup'


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
        elif descriptor.startswith('Lvwb;'):
            assert canonical(body) == ['return-void'], 'Partner menu entry still renders: ' + descriptor
        else:
            instructions = canonical(body)
            assert instructions == [
                'new-instance v0, Ljava/lang/UnsupportedOperationException;',
                'const-string v1, "Parking is disabled by the selected patch"',
                'invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V',
                'new-instance v1, Lfjf$a;',
                'invoke-direct {v1, v0}, Lfjf$a;-><init>(Ljava/lang/Throwable;)V',
                'return-object v1',
            ], 'Customer fetch must return real Kotlin Result failure before network, crypto or storage: ' + descriptor
    if disabled:
        verify_footer(root, hide_pro)
        footer = ET.parse(root / 'res/layout/activity_main_bottomsheet_footer.xml').getroot()
        namespace = '{http://schemas.android.com/apk/res/android}'
        nodes = [node for node in footer.iter() if node.get(namespace + 'id') == '@id/parking']
        assert len(nodes) == 1
        parking = nodes[0]
        assert parking.get(namespace + 'visibility') == 'gone'
        for dimension in ('layout_width', 'layout_height'):
            assert parking.get(namespace + dimension) in ('0.0dip', '0.0dp', '0dp')
        assert parking.get(namespace + 'importantForAccessibility') == 'no'
    print(f'PASS: Partner services disabled={disabled}; menus, Settings entries, Parking shortcut and customer-fetch contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--disabled', action='store_true')
    parser.add_argument('--hide-pro', action='store_true')
    parser.add_argument('--hide-ads', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.disabled, args.hide_pro, args.hide_ads)
