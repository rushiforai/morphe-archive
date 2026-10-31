"""Pin real consent decisions while suppressing only their native warning leaf.

Original HLN 9.22.0: APK 44cf13c1...e2587. REA exact renderer evidence:
ev_aab1639359a616871b793a37e735f50605da25d8cc82bb7b8d5bb0ae6981cd6d.
"""
import argparse
from pathlib import Path
import re

from hln_onboarding import VM, digest, method, source


WALL = ('haj', 'h(ILtg3;Lt07;Lk8b;)V')
ORIGINAL = '70d8d8a3017a7e8d8130b2403faefd2fe10cc7dff8bd1e9943faadbed8da784c'
RETAINED = [
    ('haj', 'l(Lcom/kubus/module/network/model/RecommendationBlockTeaser;Ljava/lang/String;Lw07;Lk8b;Lh9f;Ltg3;I)V', 'ae2b77568df9cd9433835078963c3e9ab8370064486c240018c0d7c98ea1bda1'),
    ('a63', 'invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;', '3f7e67200ac6eaf171c94ff7535cf05233ccb23337c8fea5e6cc1a9afee6d04a'),
    ('h9f', 'y()Z', '29ad13c31d965eda802412cd5725e567dcb589232fcb474fbc144794cada8373'),
    ('h9f', 'x()V', 'f0a4d1c1f76a92b56a2860d5fd4d599adec2f08b1090a4e7ea10d50905f5bb0e'),
    ('h9f', 'z(Ljava/lang/String;)V', '9bb0f8b6a77138133375e1eb93deb81f9b94f69c8d40a3f7e6f5a164f591e4e5'),
    ('h9f', 'A(Z)V', 'cb2edaabacc623d02209187501957374c8cfbf9759a13d0d540f45a93fdc8f1a'),
    ('y5e', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', '50b5d6bc6d830ffc6c39ee8e202f5dc3eadfc851896d048a141900e8b007608a'),
    ('v8f', 'a(Lv8f;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/ArrayList;I)Lv8f;', '1db765cf7546ba93338a226003e89d3d9d20aecc484f241fe23382e6c10b7de3'),
]
CONSENT_CLASSES = [
    ('be/dpgmedia/privacy/privacygatesdk/ConsentProviderImpl', 10, '5f84c3abb8f09935a0f1f9771d3b91f2ab584d49951b2f62a52081411a6ce935'),
    ('net/persgroep/privacy/privacygate/consentprovider/PGConsentProvidedInterface', 9, '5f9769bbeebfadbabd19b573de19fea0167218066e7ad849c61e14041f93df7f'),
    ('mud', 7, '92223e8aa836e5aa5ce164c89e910f62cafd750632dedd0e8f76a63d1f869d3e'),
]


class WarningLeafVM(VM):
    def switch_case_map(self):
        return {}

    def invoke(self, ref, values, kind):
        raise AssertionError('Personalisation warning must stop before Compose, callbacks or consent work: ' + ref)


def verify_personalisation(root, enabled):
    wall = method(root, *WALL)
    count = 0
    if enabled:
        assert wall.instructions[0] == 'return-void', 'HLN missing personalisation warning UI stop'
        count = 1
    assert digest(wall.canonical(remove=range(count))) == ORIGINAL, 'HLN retain complete original personalisation warning behind STOP'
    for cls, sig, expected in RETAINED:
        assert digest(method(root, cls, sig).canonical()) == expected, 'HLN recommendation/consent method changed: ' + cls + '->' + sig
    for cls, count_, expected in CONSENT_CLASSES:
        signatures = re.findall(r'^\.method[^\n]* (\S+)\n', source(root, cls), re.M)
        contract = {sig: method(root, cls, sig).canonical() for sig in signatures}
        assert len(contract) == count_ and digest(contract) == expected, 'HLN authentic consent provider/purpose class changed: ' + cls
    if enabled:
        vm = WarningLeafVM(root)
        assert vm.call(*WALL, [0, None, None, None]) is None
        assert vm.steps == 1 and not vm.events, 'Warning STOP must precede composer startGroup and every state/callback access'


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('decoded_root', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify_personalisation(args.decoded_root, args.enabled)
    print('HLN personalisation verification passed: ' + ('warning hidden, consent retained' if args.enabled else 'original'))
