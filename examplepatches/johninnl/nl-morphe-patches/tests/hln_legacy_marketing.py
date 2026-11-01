"""Independent HLN legacy section-marketing contracts and emitted Flow execution.

Pins come from original 9.22.0 APK 44cf13c1...e2587, independently traced with
REA ev_a9dd5a3e1495bd489b513333d4ef55fc0d81476667d58da192199a92995e2587.
Store hashes only; do not bundle publisher bodies or runtime account data.
"""
import argparse
from pathlib import Path

from hln_onboarding import Obj, digest, method, source
from hln_typed import CompletionVM


TARGET = ('ydh', 'a(Landroid/app/Application;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lbt3;)Ljava/lang/Object;')
ORIGINAL = 'a9ccad226a1913296f173b24766eb3dbd1d0627e466591b65a5b6ef04c6da53d'
PREFIX = [
    'new-instance v0, Ljava/lang/IllegalAccessException;',
    'const-string v1, "TemptationView is disabled"',
    'invoke-direct {v0, v1}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V',
    'new-instance v1, Lgpe;',
    'invoke-direct {v1, v0}, Lgpe;-><init>(Ljava/lang/Throwable;)V',
    'new-instance v0, Ljpe;',
    'invoke-direct {v0, v1}, Ljpe;-><init>(Ljava/lang/Object;)V',
    'new-instance v1, Lrg;',
    'const/16 v2, 0x8',
    'invoke-direct {v1, v0, v2}, Lrg;-><init>(Ljava/lang/Object;B)V',
    'return-object v1',
]
RETAINED = [
    ('rg', '<init>(Ljava/lang/Object;B)V', '54ce660002594e2ad2deb13cb5ed522ea17dd5c1274cce5780f3129dbd3ead69'),
    ('rg', 'collect(Lsk6;Lzs3;)Ljava/lang/Object;', 'a38a7ac1fc5540cc899d5c10515d6fa55c534e827c2d791457f4e69a554c38d2'),
    ('jpe', '<init>(Ljava/lang/Object;)V', '58eced54d6d212ce56b22e028f9bb3d91a46d05fb1f88f42c4438d6d41856882'),
    ('gpe', '<init>(Ljava/lang/Throwable;)V', '2e5a37983a02951371b2b99d21c6f1e72dec1a77ef6a32ade65b7640a741283a'),
    ('via', 'y(Landroid/app/Application;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lbt3;)Ljava/lang/Object;', '808929b978f79e9befdfd5f75aaa86193c969b258aecfe78ffa9391a16d4dba3'),
    ('com/kubusapp/MainActivity', 'E(Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lbkg;)Ljava/lang/Object;', 'bf213b640d7489bbd9ae1ec82106883f248eab0e2b5e0feb432f6bba4a054d05'),
    ('sia', 'invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;', '6a6f1d6ec2078f6fe142c11f673e57162ce6de27a99150d696962d2ec031ca08'),
    ('sia', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'df9106f2692ecbe2f61a6d18942dad3c0a3a62fc002362dfed5c943f3ec31e73'),
    ('hia', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', '41ccb2ea84cedd2e923f00ac37b0d715e1bd6e2ef368e106df8e26403ddf906a'),
    ('s9f', 'B(Lcom/kubusapp/MainApplication;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Ljava/lang/String;Lbt3;)Ljava/lang/Object;', '24e3a570c0f462fdc42eee0b150112f61211be4136fa041f43b5a5114909c880'),
    ('c5f', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 'feee8b30219d662533e161d84a0fddbc4d91c601a48f2e7553b139f0db4b0836'),
    ('y33', 'U(Ljava/lang/String;Ljava/lang/String;Lbt3;)Ljava/lang/Object;', '873843850c5a795a5b985f349dbac44ff12d3af8e28dfc416a8b4274b2c5767e'),
    ('pw7', 'J(Lrk6;Lbt3;)Ljava/lang/Object;', '626959ff1da4369b6eecff1341a0f4ab6416a082ee08fae567615fee12768227'),
    ('qj8', 'invoke(Ljava/lang/Object;)Ljava/lang/Object;', '6ab02db78d3cd30c6232a1b443b2757b65ed7218f3a5f517c57a440578fd7d18'),
    ('t0g', '<init>()V', 'f25c83eb00e30b0452feef38ec297d0e3fee6984d7c693f1cc85451d32f44026'),
]


class LegacyMarketingVM(CompletionVM):
    """Execute actual wrapper constructors and finite Flow; stub platform only."""

    def __init__(self, root, suspended=False):
        super().__init__(root)
        self.suspended = suspended
        self.emitted = []
        self.sentinel = Obj('Lgw3;')
        self.static['Lgw3;->COROUTINE_SUSPENDED:Lgw3;'] = self.sentinel

    def invoke(self, ref, values, kind):
        owner, signature = ref.split('->')
        constructors = {'Lrg;': '<init>(Ljava/lang/Object;B)V',
                        'Ljpe;': '<init>(Ljava/lang/Object;)V',
                        'Lgpe;': '<init>(Ljava/lang/Throwable;)V'}
        if owner in constructors and signature == constructors[owner]:
            assert kind == 'invoke-direct'
            return self.call(owner[1:-1], signature, values)
        if ref == 'Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V':
            assert kind == 'invoke-direct'
            values[0].fields['message'] = values[1]
            return None
        if ref == 'Lsk6;->emit(Ljava/lang/Object;Lzs3;)Ljava/lang/Object;':
            assert kind == 'invoke-interface'
            self.emitted.append(values[1])
            return self.sentinel if self.suspended else self.static.setdefault('unit', Obj('Llbi;'))
        raise_if_external = ('Ljk1;', 'Lvdh;', 'Lpge;', 'Lrdh;')
        assert owner not in raise_if_external, 'Legacy marketing must stop before token, feature or network work: ' + ref
        return super().invoke(ref, values, kind)


def verify_completion(root, suspended=False):
    vm = LegacyMarketingVM(root, suspended)
    flow = vm.call(*TARGET, [Obj('Lydh;'), Obj('Landroid/app/Application;'), None, 'fixture-section', None])
    assert flow.type == 'Lrg;' and flow.fields['a'] == 8, 'Legacy marketing returns the supported finite Flow selector 8'
    wrapped = flow.fields['b']
    assert wrapped.type == 'Ljpe;', 'Legacy Flow retains inline Result wrapper'
    failure = wrapped.fields['a']
    assert failure.type == 'Lgpe;', 'Legacy Flow reports the original disabled failure, never success or auth state'
    error = failure.fields['a']
    assert error.type == 'Ljava/lang/IllegalAccessException;' and error.fields['message'] == 'TemptationView is disabled'
    result = vm.call('rg', 'collect(Lsk6;Lzs3;)Ljava/lang/Object;', [flow, Obj('Lsk6;'), None])
    assert len(vm.emitted) == 1 and vm.emitted[0] is wrapped, 'Finite Flow emits exactly the retained wrapper once'
    assert result is vm.sentinel if suspended else result.type == 'Llbi;', 'Finite Flow preserves suspended emission or completes with actual Unit'
    return flow


def verify_legacy_marketing(root, enabled):
    target = method(root, *TARGET)
    count = 0
    if enabled:
        assert target.instructions[:len(PREFIX)] == PREFIX, 'HLN missing legacy section marketing stop before token/network'
        count = len(PREFIX)
    assert digest(target.canonical(remove=range(count))) == ORIGINAL, 'HLN retain entire original legacy resolver behind prefix'
    for cls, sig, expected in RETAINED:
        assert digest(method(root, cls, sig).canonical()) == expected, 'HLN legacy completion/auth caller changed: ' + cls + '->' + sig
    assert '.implements Lrk6;' in source(root, 'rg'), 'Legacy completion must implement the real Flow interface'
    # The replacement must be the actual existing disabled branch, not a newly
    # invented result. Keep branch instructions and caller contracts independent.
    assert any(target.instructions[i:i+len(PREFIX)] == PREFIX for i in range(count, len(target.instructions)-len(PREFIX)+1)), 'HLN original feature-disabled completion changed'
    if enabled:
        verify_completion(root)
        verify_completion(root, suspended=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('decoded_root', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify_legacy_marketing(args.decoded_root, args.enabled)
    print('HLN legacy marketing verification passed: ' + ('suppressed' if args.enabled else 'original'))
