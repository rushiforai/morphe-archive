"""Verify 15.0 Settings paid-offer filtering and real soundpack ownership.

All original hashes were captured from native publisher smali independently of
production MethodPlans. No production source or edit table is loaded here.
"""
import argparse
import hashlib
from pathlib import Path
import re

from verify_flitsmeister import canonical, digest, method, run_fragment

PACK = 'Lnl/flitsmeister/models/enums/SoundPacks;'
STATE = 'Lvei$a;'
OFFERS = 'Lomh;->a(Landroidx/compose/ui/Modifier;Lvei$a;Lvei;Lhdi;Landroidx/compose/runtime/Composer;I)V'
ORIGINAL = '5317295741c862d58ad6d668216f61fe4e0baab56a1b824df82ade4c9a101d1d'
# Whole original screen, speech toggles, selection controls/callbacks, real
# available/purchased readers, state refresh, download/purchase sheet, billing
# launch, and both soundpack and product catalogues must remain intact.
RETAINED = {'Lomh;->b(Landroidx/compose/ui/Modifier;Lhdi;Lvei;Lu39;Landroidx/compose/runtime/Composer;I)V': '74db839c1854b390e946d89295842793d9d4cd3143bb770c6a9657d0bb955eb2',
 'Lomh;->c(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/models/enums/SoundPacks;ZZZLu39;Landroidx/compose/runtime/Composer;I)V': '509f7266bfc19d95dd5bcad61d93cbf4dbad460655f88b5d5cb9f9872488fad5',
 'Lomh;->d(Landroidx/compose/ui/Modifier;Lnl/flitsmeister/models/enums/SoundPacks;Ljava/util/List;Ljava/util/List;Lu39;Landroidx/compose/runtime/Composer;II)V': 'ae0b6f3d6455cbb03ccc4b4a5c5a8dcf445256141a6e5f05b28e8abb4831e932',
 'Lomh;->e(Landroidx/compose/ui/Modifier;Lvei$a;Lvei;Lhdi;Landroidx/compose/runtime/Composer;I)V': '9c569792cce33af6a3ef550834ffd87daf446eb6c11982c0f388b7c538ee0088',
 'Lvei;-><init>(Landroid/app/Application;)V': '0e71c55a3ad272b2b2c2f9533fc73eb4249eebf11d4415b1a385ba25ecae1f8e',
 'Lvei;->a()Ljava/util/Set;': '47567ef0093613e730f550367405e21f118bd020980f89ffd4663bcc5d8d9e5e',
 'Lvei;->b()Ljava/util/Set;': '168df73da088d2edaa2874ad5f0fd55e667e129afc88f6c1eba4f2c07057fded',
 'Lvei;->c()Ljava/util/ArrayList;': '4518cfb266fb7996c3c6c3f06269dc42514edc947e6ed7f49365936b36e7634a',
 'Lvei;->d()Lnl/flitsmeister/models/enums/SoundPacks;': '358c782c1195060d40559ed7a806000232f4a6b692ea33fa640293eb0e9b689b',
 'Lvei;->e()Lnl/flitsmeister/models/enums/SoundPacks;': 'efce8636ab762553476551a75708d844c14ea949fee6d00fcaa78416bccd914f',
 'Lvei;->f()V': '22a4ca92d7367763bfb56168527449c94e666563d38b9bd6f9e9afe7bcdd0380',
 'Lhdi;-><init>(Landroid/app/Application;)V': 'dc1f9efa7417a718a89cf90a2ca05793b6d1e24713ee7fa66d9af278787c9dd5',
 'Lhdi;->a(Landroid/app/Activity;)V': 'c1ebb6a7d5f58f54a264b179423bd297bc35a9324d280913d1d7f4e227b388eb',
 'Lhdi;->b()V': '54c43bdcc347f1eb347c697d15cc7b7ea60dfadeb2dd26c3371f198b47cb0110',
 'Lhdi;->c(Lnl/flitsmeister/models/enums/SoundPacks;Ls39;)V': 'e4f3c13e51722f0240d3ffd038470eb37a7387d524b923227e33ddafccb995e1',
 'Lhdi;->d()V': 'e47cc008e311ce886606eb7faab074686a95fe5782d9092dc4adeb20b8119db4',
 'Lhdi;->e(Z)V': 'e585975035b58b99f8956bff0625615e69772768190795dc733d4a3bff08d97d',
 'Lmmh;-><init>(Lvei;Lnl/flitsmeister/models/enums/SoundPacks;Lhdi;)V': '834efa02777cce5ceb62e9279ea5745bc884b167bbf46f44c8c84cee1adf0d37',
 'Lmmh;->invoke()Ljava/lang/Object;': 'f23abdfaa7ad87db81831931811899338b743945ce43ace95b033af733fed185',
 'Lfmh;-><init>(ZLu39;Lnl/flitsmeister/models/enums/SoundPacks;Z)V': 'c4cc43b96d869396d993bb77b7e05ac37aa89e795a22e2afb5cc428a6e9b2b88',
 'Lfmh;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': '43b535bb083999ac67d618b79fa4b6f28389d3c36c21d1fac36b727312ad6607',
 'Ljmh;-><init>(Landroidx/lifecycle/ViewModel;I)V': 'e9327618a0f5cb04b033e6c1a139ed1ed0eb5b9389a2e2f971c577845f535486',
 'Ljmh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;': '1b2f0f255476c39b050badc1c694c05d8ff4e402ffae31d7acc09f8a2d9e6086',
 'Lp0a;->e(Landroid/app/Activity;Lnl/flitsmeister/models/data/purchase/Product;Lu39;)V': '80abc644f7e1ee58aeaeeea43450b9c00a0bc5842eddcb9cf6cccaf4c69375e8',
 'Lnl/flitsmeister/models/enums/SoundPacks;-><clinit>()V': '39665ecfeccc809ea0ea00dfd0833ecdb0bc0409de7bd984f2d86a8d41754f40',
 'Lnl/flitsmeister/models/data/purchase/Product;-><clinit>()V': '21b7e65a5c17ec1c32bf6e94f5476b3df2623ef67ffbaa79115b9d4c85bf7f80'}
# Download-success, revocation, state-field mapping and actual set difference
# establish that State.d means purchased minus downloaded (needs download).
RETAINED.update({'Lvei$a;-><init>(ZZLjava/util/Set;Ljava/util/Set;Ljava/util/Set;Lnl/flitsmeister/models/enums/SoundPacks;Lnl/flitsmeister/models/enums/SoundPacks;)V': '92837478010c1d7366225a8c36f9c0cd5a7d1eb8e073dcc6297bfcf50be29d30',
 'Lsvg;->c(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;': '8c0dfb5fb96889671618ab301ff75b7219067082f7320255517cc6429dda2359',
 'Lgx4;->invoke(Ljava/lang/Object;)Ljava/lang/Object;': '6d4ad7074d6430bfb0528fe34f1b6485a1a5369a6616dd39593944bca4ac1f11',
 'Lp0a;->c(Landroid/content/Context;Lnl/flitsmeister/models/enums/SoundPacks;Z)V': '3516e56b651ab42d98f8ac9039b6c1830abb7a0b096053c2a2a7b3e51c3af2ac',
 'Lbhg;->c(Landroid/content/Context;Lnl/flitsmeister/models/enums/SoundPacks;)Z': '5e04da7dde17e6a54360f3686550ede577dc9f95c1ae634a22d5dadf6be9d2b6',
 'Lldi$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;': '9d81c6e242e8dffde2fe2d04ec483ad6bd7cb8398b72121f329b2157958f5840',
 'Lldi$a$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;': '9f2f452da7788db8dd30cfb59e1909c2896a81735cc90be3d8a6c304d8388a22'})


def filter_fragment():
    """Independent emitted-DEX oracle: skip to original iterator index 153."""
    return [
        f'sget-object v6, {PACK}->DEFAULT:{PACK}',
        'if-eq v7, v6, @166',
        f'iget-object v6, v2, {STATE}->e:Ljava/util/Set;',
        'invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z',
        'move-result v6',
        'if-eqz v6, @153',
        'nop',
    ]


def verify_behavior(instructions):
    """Execute actual decoded guard for all five native catalogue entries."""
    count = 0
    for pack in ('DEFAULT', 'JE_BROER', 'BRABO', 'OLAV_MOL', 'ENZO_KNOL'):
        value = f'{PACK}->{pack}:{PACK}'
        for downloaded in (False, True):
            for purchased in (False, True):
                state = {
                    STATE + '->d:Ljava/util/Set;': {value} if purchased and not downloaded else set(),
                    STATE + '->e:Ljava/util/Set;': {value} if purchased else set(),
                }
                original_state = {key: values.copy() for key, values in state.items()}
                def boundary(ref, args):
                    assert ref == 'Ljava/util/Set;->contains(Ljava/lang/Object;)Z', 'Guard reaches billing/download or alters state'
                    return args[1] in args[0]
                registers = {f'v{i}': object() for i in range(24)}
                registers.update(v2=state, v7=value)
                before = registers.copy()
                result = run_fragment(instructions, 160, registers, boundary,
                                      stop=lambda pc, *_: pc in (153, 167))
                assert isinstance(result, tuple), 'Filter returns from the complete Settings screen'
                after, _, pc = result
                expected = pack == 'DEFAULT' or purchased
                assert (pc == 167) == expected, (pack, downloaded, purchased, pc)
                assert state == original_state, 'Soundpack ownership/availability was mutated'
                assert all(after[key] is val for key, val in before.items() if key != 'v6'), 'Filter clobbers a live renderer register'
                count += 1
    return count


def verify(root: Path, enabled: bool):
    body = method(root, OFFERS)
    assert body.splitlines()[0] == '.method public static final ' + OFFERS.split('->')[1], 'Offer method flags/signature'
    assert re.search(r'\.locals (\d+)', body)[1] == '18', 'Offer register layout'
    instructions = canonical(body)
    if enabled:
        assert len(instructions) == 224, 'Offer instruction count'
        assert instructions[160:167] == filter_fragment(), 'Paid-offer guard does not match the independently captured boundary'
        # Delete only the inserted guard and restore displaced branch indexes.
        retained = instructions[:160] + instructions[167:]
        def restore(match):
            index = int(match[1])
            return '@' + str(index if index < 160 else max(160, index - 7))
        restored = [re.sub(r'@(\d+)\b', restore, instruction) for instruction in retained]
        assert hashlib.sha256('\n'.join(restored).encode()).hexdigest() == ORIGINAL, 'Original offer renderer/lambda/composition changed'
        count = verify_behavior(instructions)
        print(f'PASS: 15.0 soundpack offers; {count} free/downloaded/purchased/unowned cases retain genuine state')
    else:
        assert digest(body) == ORIGINAL, 'Unselected Hide ads must retain original paid offers'
    for descriptor, expected in RETAINED.items():
        assert digest(method(root, descriptor)) == expected, 'Retain actual soundpack/billing contract: ' + descriptor
    print(f'PASS: soundpack offers hidden={enabled}; {len(RETAINED)} original selection, toggle, ownership, download and billing boundaries retained')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.enabled)
