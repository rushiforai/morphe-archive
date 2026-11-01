"""Check the effective general-ads preference and its Settings entry in actual DEX.

The publisher-derived contracts retain informative/monitoring traffic items and
all neighboring Settings rows. This is not a claim of whole-app ad blocking.
"""
import argparse
import hashlib
from pathlib import Path
import re

from verify_flitsmeister import canonical, digest, method, run_fragment
from verify_flitsmeister_parking import SETTINGS_HASHES

SETTINGS_READER = 'Lgm8;->W(Landroid/content/Context;)Z'
ADS_GATE = 'Lim8;->a(Landroid/content/Context;)Z'
SETTINGS_ROWS = (
    'Ljxg;->d(Landroidx/compose/ui/Modifier;Lz39;Lz39;Lz39;Lz39;Lz39;Lz39;Z'
    'Lnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;'
    'Landroidx/compose/runtime/Composer;I)V'
)
# Captured independently from publisher smali, with the existing Unlock Pro
# variant of W recorded separately. The hidden-row oracle changes only the
# advertisements row's void renderer call (original instruction 438) to NOP.
ORIGINALS = {
    SETTINGS_READER: ('875362039c79220ef0e2d75f6b358b429f76f6b52793d85385cf6620cffc8178', ['final', 'public'], 0),
    ADS_GATE: ('60a8eb48c18f2b5fa596d366981514c4b3f7ec243a02334ca85bc1ba7479934e', ['final', 'public', 'static'], 1),
    SETTINGS_ROWS: ('03c4dae2584bcaef85a1a3423c09c9d25f2ffce2848f19d7add44419c393828a', ['final', 'public', 'static'], 40),
}
UNLOCK_READER_HASH = '4addee4ff87bd8040ccf429fc98085e6ac90d230340c1d87902b4c6c245f084e'
HIDDEN_ROW_HASH = SETTINGS_HASHES[False, True]
TRAFFIC_CONTRACTS = {
    'Lcl8;->isEnabled(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Z':
        '27a06160fd5f133274e94daae2e3239c31676c5b4b7c8744810c4aac0139a267',
    'Lcl8;->isValidForNotifications(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Z':
        '4938a1c72e2957a5d53b5fc6b383c73ffd984cac27909c560ea57ccb193d5432',
}
LBA = 'Lnl/flitsmeister/lba/model/LBA;'
MONITORING = 'Lnl/flitsmeister/lba/model/LBADisplayType;->MONITORING:Lnl/flitsmeister/lba/model/LBADisplayType;'
CATALOG_ITEM = 'Lnl/flitsmeister/lba/api/LBADataApiService$Companion;->getLBAFromJson(Lorg/json/JSONObject;)' + LBA
IMAGES = 'Lnl/flitsmeister/lba/repository/LBAImageRepository;'
# descriptor: original body hash, flags, locals, insertion index, LBA register,
# scratch registers, denied-result type. All hashes are publisher captures.
COMMERCIAL_PATHS = {
    CATALOG_ITEM: ('0831fff7e13b0cafaf1b5d6b26bdeccb46ee9c1173f13e869dc1f49bc68e1587', ['final', 'private'], 1, 7, 'v1', 'v0', 'v2', 'catalog'),
    IMAGES + '->getImage(' + LBA + 'Lnl/flitsmeister/lba/model/LBAImageType;)Landroid/graphics/Bitmap;':
        ('fe898822cae4f9ed33c5237ed0441247cfe465da087e29333544b724b35ebd31', ['final', 'public'], 2, 0, 'v3', 'v0', 'v1', 'object'),
    IMAGES + '->downloadAndSaveBitmapToStorage(' + LBA + 'Lnl/flitsmeister/lba/model/LBAImageType;)V':
        ('d139dabf30306acae9598ee82c9421a2580446bc93fb2f767aef6161579d4605', ['final', 'private'], 3, 0, 'v4', 'v0', 'v1', 'void'),
    'Lcl8;->getNotificationForLBA(Landroid/content/Context;' + LBA + ')Landroid/app/Notification;':
        ('f1245699611d29bcdf2424027671d7235dfbceba04e5cd494a8105c7b201c047', ['final', 'public'], 10, 0, 'v12', 'v0', 'v1', 'object'),
    'Liha;->handle(Landroid/content/Intent;)V':
        ('681355f199a2ed493e5bc1d56f7edad9a5f326659fbf585d2874512b2c97912e', ['final', 'public'], 3, 28, 'v4', 'v1', 'v2', 'void'),
    'Lghb$c;->l(Lnl/flitsmeister/fmcore/models/data/map/objects/FMMapPin;)V':
        ('f2d2ab07ac33d009c8bfa2bf1762582bcedef355b6578612c3d50a9857f2776b', ['final', 'public'], 5, 30, 'v6', 'v1', 'v2', 'void'),
}


def verify_commercial_paths(root: Path, enabled: bool) -> None:
    for descriptor, (original, flags, locals_count, start, lba, temp, other, kind) in COMMERCIAL_PATHS.items():
        body = method(root, descriptor)
        assert sorted(body.splitlines()[0].split()[1:-1]) == flags, descriptor
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_count, descriptor
        instructions = canonical(body)
        if not enabled:
            assert digest(body) == original, 'Retain original commercial boundary: ' + descriptor
            continue
        width = 9 if kind in ('catalog', 'object') else 8
        join = start + width
        fragment = ([f'if-eqz {lba}, @{join}'] if kind == 'catalog' else []) + [
            f'invoke-virtual {{{lba}}}, {LBA}->getInformative()Z',
            f'move-result {temp}',
            f'if-nez {temp}, @{join}',
            f'invoke-virtual {{{lba}}}, {LBA}->getDisplayType()Lnl/flitsmeister/lba/model/LBADisplayType;',
            f'move-result-object {temp}',
            f'sget-object {other}, {MONITORING}',
            f'if-eq {temp}, {other}, @{join}',
        ]
        fragment += ([f'const/4 {lba}, 0x0'] if kind == 'catalog' else
                     ['return-void'] if kind == 'void' else [f'const/4 {temp}, 0x0', f'return-object {temp}'])
        assert instructions[start:join] == fragment, 'Commercial LBA reaches catalog, image, notification or dialog work: ' + descriptor
        # Remove only the new guard and undo its label displacement. Pin all
        # original success/error paths, including unrelated map-pin handlers.
        retained = instructions[:start] + instructions[join:]
        def original_target(match):
            target = int(match[1])
            return '@' + str(target if target < start else max(start, target - width))
        retained = [re.sub(r'@(\d+)\b', original_target, line) for line in retained]
        actual = hashlib.sha256('\n'.join(retained).encode()).hexdigest()
        assert actual == original, 'Unrelated LBA/safety behavior changed: ' + descriptor
        for informative, monitoring in ((False, False), (True, False), (False, True), (True, True)):
            def boundary(ref, values):
                if ref == LBA + '->getInformative()Z': return informative
                if ref == LBA + '->getDisplayType()Lnl/flitsmeister/lba/model/LBADisplayType;':
                    return MONITORING if monitoring else 'TEXT'
                raise AssertionError('Guard performs extra work: ' + ref)
            result = run_fragment(instructions, start, {lba: 'real-lba'}, boundary,
                                  stop=lambda pc, *_: pc == join)
            allowed = informative or monitoring
            if kind == 'catalog':
                assert isinstance(result, tuple) and result[0][lba] == ('real-lba' if allowed else 0)
            else:
                assert isinstance(result, tuple) == allowed, 'Preserve informative/monitoring only: ' + descriptor
                if not allowed: assert result == (None if kind == 'void' else 0)
    print(f'PASS: Commercial LBA suppression={enabled}; catalog, image downloads/cache, notifications and both dialog routes')


def verify(root: Path, enabled: bool, unlock: bool = False, partners_disabled: bool = False) -> None:
    failures = []
    for descriptor, (original_hash, flags, locals_count) in ORIGINALS.items():
        body = method(root, descriptor)
        assert sorted(body.splitlines()[0].split()[1:-1]) == flags, descriptor
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_count, descriptor
        if enabled and descriptor != SETTINGS_ROWS:
            # No preference/provider call remains, so saved true/false and
            # genuine Pro/non-Pro accounts all receive the same false result.
            if canonical(body) != ['const/4 v0, 0x0', 'return v0']:
                failures.append('general ads can remain enabled: ' + descriptor)
        else:
            expected = SETTINGS_HASHES[partners_disabled, enabled] if descriptor == SETTINGS_ROWS else original_hash
            if not enabled and unlock and descriptor == SETTINGS_READER:
                expected = UNLOCK_READER_HASH
            if digest(body) != expected:
                failures.append('Settings entry or neighboring contract differs: ' + descriptor)
    for descriptor, expected in TRAFFIC_CONTRACTS.items():
        assert digest(method(root, descriptor)) == expected, 'Retain informative/monitoring traffic routes: ' + descriptor
    assert not failures, '; '.join(failures)
    verify_commercial_paths(root, enabled)
    print(f'PASS: Hide ads={enabled}; general-ad readers, Settings entry and retained traffic contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--enabled', action='store_true')
    parser.add_argument('--unlock', action='store_true')
    parser.add_argument('--partners-disabled', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.enabled, args.unlock, args.partners_disabled)
