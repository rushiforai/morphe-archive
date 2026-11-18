"""Independent15.0/1289 navigation producer preservation and hook oracle.

Hashes were frozen from the signed publisher API29 base, before any15 patch
application. The API32 base has identical DEX. No production plan tables are
read. This proves static hook placement and preserved producer bodies, not
Android execution or delivery to another app.
"""
import argparse
from pathlib import Path
import re
from verify_flitsmeister import canonical, digest

FEED = 'Lnl/johninnl/flitsmeister/NavigationBroadcasts;'
CALL = re.compile(r'^\s*invoke-static(?:/range)? \{[^}]*\}, ' + re.escape(FEED) + r'->[^\n]+\n', re.M)
ORIGINAL = {
    'Lbb0;->A(Landroid/location/Location;)V': '9b9718c193a4e4f13c772b54de3aa03ba6e928f9411d8c169260995f536c0ee3',
    'Lbb0;->onStart()V': '2597a0e06c6d6cb2a8425557eefa3b16be58ec3dc1955de44c0abd2dd9a7bc63',
    'Lbb0;->onStop()V': '5a9632bfd5e33ac0d0a3abd1cece8e6f792abfb1d911a17e4c9175152302ba68',
    'Lirf;->z()V': '2aefa487026a4768f3b55e2f3b0ca1adf4b12cd87111b331b8a10d45037fa942',
    'Lwd6;->B()V': '1d5072fa8edc31d38f3a62031a00dea11aa57d79ee7f26c966592025776d7d90',
    'Lwd6;->onStop()V': '09d4f599315c0495ea3092060dd2d3b68667d835ac4f79592e7637cc944a13a1',
    'Lm65;-><clinit>()V': '1f8e94d85f73ac4a3140215ba0d77c057b40dbf48e5688453d74761502f29b20',
    'Ll1k;->toString()Ljava/lang/String;': '0c55a84f5a0369c301cd22d641b1ba0a49391576d60a7579dd66b97629e0f767',
}
HOOKS = {
    'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onCreate()V': ('init15(Landroid/content/Context;)V', 'p0'),
    'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V': ('stopped()V', None),
    'Lbb0;->A(Landroid/location/Location;)V': ('location(Landroid/location/Location;)V', 'p1'),
    'Lbb0;->onStart()V': ('started()V', None),
    'Lbb0;->onStop()V': ('stopped()V', None),
    'Lirf;->z()V': ('road()V', None),
    'Lwd6;->B()V': ('zone15(Ljava/lang/Object;)V', 'p0'),
    'Lwd6;->onStop()V': ('zoneStopped()V', None),
}


def source(root: Path, cls: str) -> str:
    paths = list(root.glob(f'smali*/{cls[1:-1]}.smali'))
    assert len(paths) == 1, f'Expected one15 class {cls}, got {len(paths)}'
    return paths[0].read_text()


def method(root: Path, descriptor: str) -> str:
    cls, sig = descriptor.split('->')
    bodies = re.findall(r'^\.method[^\n]* ' + re.escape(sig) + r'\n.*?^\.end method', source(root, cls), re.M | re.S)
    assert len(bodies) == 1, f'Expected one15 method {descriptor}'
    return bodies[0]


def verify(root: Path, selected: bool) -> None:
    for descriptor, (signature, registers) in HOOKS.items():
        body = method(root, descriptor)
        hooks = CALL.findall(body + '\n')
        assert len(hooks) == int(selected), descriptor + ': one native hook exactly when selected'
        if hooks:
            assert FEED + '->' + signature in hooks[0], descriptor + ': expected hook'
            content = re.search(r'\{([^}]*)\}', hooks[0])[1].strip()
            assert content in ({registers, registers + ' .. ' + registers} if registers else {''}), descriptor + ': exact native parameter registers'
            instructions = canonical(body)
            call_at = next(i for i, line in enumerate(instructions) if FEED + '->' + signature in line)
            if descriptor == 'Lwd6;->B()V':
                assert instructions[call_at - 1] == 'sput-object v1, Lhff;->b:Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;', 'Capture native candidate before parameter register reuse'
            elif descriptor == 'Lirf;->z()V':
                assert instructions[call_at + 1] == 'return-void', 'All road completions pass through hook'
            else:
                assert call_at == 0, descriptor + ': lifecycle/location entry hook'
    for descriptor, expected in ORIGINAL.items():
        clean = CALL.sub('', method(root, descriptor) + '\n')
        assert digest(clean) == expected, descriptor + ': preserve complete original producer/value body'
    total = sum(len(CALL.findall(path.read_text())) for path in root.glob('smali*/**/*.smali') if '/nl/johninnl/' not in str(path))
    assert total == len(HOOKS) * int(selected), 'Closed15 native navigation callsite inventory'
    protocol = list(root.glob('smali*/nl/johninnl/navigation/NavigationProtocol.smali'))
    assert len(protocol) == int(selected), 'Shared primitive protocol only when selected'
    if selected:
        extension = source(root, FEED)
        init15 = method(root, FEED + '->init15(Landroid/content/Context;)V')
        assert re.search(r'sput-boolean[^\n]*->version15:Z', init15), 'Explicit15 reflection profile before init'
        assert FEED + '->init(Landroid/content/Context;)V' in init15
        for literal in ('brf', 'm65', 'u39', 'l1k', 'hff', 'v1'):
            assert f'"{literal}"' in extension, 'Retain15 reflected binding ' + literal
    print(f'PASS:15 navigation={selected};8 bounded hook sites;8 complete original producer/value contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--selected', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.selected)
