"""Check the effective general-ads preference and its Settings entry in actual 15.0 DEX.

The publisher-derived contracts retain informative/monitoring traffic items and
all neighboring Settings rows. This is not a claim of whole-app ad blocking.
"""
import argparse
import hashlib
from pathlib import Path
import re

from verify_flitsmeister import canonical, digest, method, run_fragment
from flitsmeister15_settings_contracts import SETTINGS_HASHES

SETTINGS_READER = 'Lgm8;->W(Landroid/content/Context;)Z'
ADS_GATE = 'Lim8;->a(Landroid/content/Context;)Z'
SETTINGS_ROWS = (
    'Lx1h;->d(Landroidx/compose/ui/Modifier;Ls39;Ls39;Ls39;Ls39;Ls39;Ls39;Z'
    'Lnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;'
    'Landroidx/compose/runtime/Composer;I)V'
)
# Captured independently from publisher smali, with the existing Unlock Pro
# variant of W recorded separately. The hidden-row oracle changes only the
# advertisements row's void renderer call (original instruction 437) to NOP.
ORIGINALS = {'Lgm8;->W(Landroid/content/Context;)Z': ('d056c15a10ed5db26f10f0fff30c9e026622441aeb71749ba8c424dbf72863ac',
                                          ['final', 'public'],
                                          0),
 'Lim8;->a(Landroid/content/Context;)Z': ('a27d356970418dfc95eeb7675953bc33d27bdeb78151f844fe06d5b81355468a',
                                          ['final', 'public', 'static'],
                                          1),
 'Lx1h;->d(Landroidx/compose/ui/Modifier;Ls39;Ls39;Ls39;Ls39;Ls39;Ls39;ZLnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;Landroidx/compose/runtime/Composer;I)V': ('40a58ff2253531d128da398c012de8d77b3117fb1b64c4f9d7ed3a7e63101e53',
                                                                                                                                                                                ['final',
                                                                                                                                                                                 'public',
                                                                                                                                                                                 'static'],
                                                                                                                                                                                40)}
UNLOCK_READER_HASH = 'cd5e8163d0dbbb468c3cc8735a19fe304a6b55e374e118530be17e9e564c2090'
HIDDEN_ROW_HASH = SETTINGS_HASHES[False, True]
TRAFFIC_CONTRACTS = {'Ldl8;->isEnabled(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Z': '27a06160fd5f133274e94daae2e3239c31676c5b4b7c8744810c4aac0139a267',
 'Ldl8;->isValidForNotifications(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Z': '2235615495fd961c54fc9940faa5efe715c172024caaa2572efaa5296ac3dc8f'}
LBA = 'Lnl/flitsmeister/lba/model/LBA;'
MONITORING = 'Lnl/flitsmeister/lba/model/LBADisplayType;->MONITORING:Lnl/flitsmeister/lba/model/LBADisplayType;'
CATALOG_ITEM = 'Lnl/flitsmeister/lba/api/LBADataApiService$Companion;->getLBAFromJson(Lorg/json/JSONObject;)' + LBA
IMAGES = 'Lnl/flitsmeister/lba/repository/LBAImageRepository;'
# descriptor: original body hash, flags, locals, insertion index, LBA register,
# scratch registers, denied-result type. All hashes are publisher captures.
COMMERCIAL_PATHS = {'Ldl8;->getNotificationForLBA(Landroid/content/Context;Lnl/flitsmeister/lba/model/LBA;)Landroid/app/Notification;': ('2ec291dd966befb0dea5dbfe0f7bd0d53a31e1c025dfe5bb7baf4124acbd5f1e',
                                                                                                                      ['final',
                                                                                                                       'public'],
                                                                                                                      10,
                                                                                                                      0,
                                                                                                                      'v12',
                                                                                                                      'v0',
                                                                                                                      'v1',
                                                                                                                      'object'),
 'Liha;->handle(Landroid/content/Intent;)V': ('95e7198f7068316c17b6d23d03e45fb3ef6652badd81718e3e1ffff719dfed7f',
                                              ['final', 'public'],
                                              3,
                                              28,
                                              'v4',
                                              'v1',
                                              'v2',
                                              'void'),
 'Lnl/flitsmeister/lba/api/LBADataApiService$Companion;->getLBAFromJson(Lorg/json/JSONObject;)Lnl/flitsmeister/lba/model/LBA;': ('681495138bb885850f65a248f74dd969c2b875091d84969de59c84d400f6b6f9',
                                                                                                                                 ['final',
                                                                                                                                  'private'],
                                                                                                                                 1,
                                                                                                                                 7,
                                                                                                                                 'v1',
                                                                                                                                 'v0',
                                                                                                                                 'v2',
                                                                                                                                 'catalog'),
 'Lnl/flitsmeister/lba/repository/LBAImageRepository;->downloadAndSaveBitmapToStorage(Lnl/flitsmeister/lba/model/LBA;Lnl/flitsmeister/lba/model/LBAImageType;)V': ('890824663c379898ef75971c51cd54d271049147d42a96c0a97de1f8512c721a',
                                                                                                                                                                   ['final',
                                                                                                                                                                    'private'],
                                                                                                                                                                   3,
                                                                                                                                                                   0,
                                                                                                                                                                   'v4',
                                                                                                                                                                   'v0',
                                                                                                                                                                   'v1',
                                                                                                                                                                   'void'),
 'Lnl/flitsmeister/lba/repository/LBAImageRepository;->getImage(Lnl/flitsmeister/lba/model/LBA;Lnl/flitsmeister/lba/model/LBAImageType;)Landroid/graphics/Bitmap;': ('8ebc1a05158e9389206b9a0028fc955a837aef3a65b2a3fd348a3f25f7ff19f9',
                                                                                                                                                                     ['final',
                                                                                                                                                                      'public'],
                                                                                                                                                                     2,
                                                                                                                                                                     0,
                                                                                                                                                                     'v3',
                                                                                                                                                                     'v0',
                                                                                                                                                                     'v1',
                                                                                                                                                                     'object'),
 'Lsib$c;->l(Lnl/flitsmeister/fmcore/models/data/map/objects/FMMapPin;)V': ('9c42ad71e750e556d4edbf95bfd9edd9a015ee5cd120eff19f960aa3f44255db',
                                                                            ['final', 'public'],
                                                                            5,
                                                                            30,
                                                                            'v6',
                                                                            'v1',
                                                                            'v2',
                                                                            'void')}


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
    from verify_flitsmeister15_soundpack_offers import verify as verify_soundpack_offers
    verify_soundpack_offers(root, enabled)
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
