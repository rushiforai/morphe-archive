"""Original manual consent writes/readback with an explicit TCF decoder boundary.

TCF inputs below are fixture labels, not real consent strings or grants. Native
bit iteration, IAB storage, Google-consent conversion and channel replies run as
shipped. Android preference editors stage changes until actual apply/commit.
"""
import json
from rtl_vm import Reference, VmThrown
from tvgids_osb_vm import OsbFixture, OSB, QUEUE, TCF
from tvgids_consent_contracts import CONSENT_CONTRACTS

STORE = 'osb-shared-preferences'


class ConsentFixture(OsbFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in CONSENT_CONTRACTS})
        self.native.update(r[:2] for r in CONSENT_CONTRACTS)
        self.commits = []

    def bits(self, items):
        return self.new('Lq20;', {'Lq20;->a:Ljava/util/BitSet;': Reference(set(items), 'Ljava/util/BitSet;')})

    def invoke(self, target, args):
        owner, sig = target.split('->', 1)
        if target == TCF+'->g(Ljava/lang/String;[Luz0;)Ljp5;':
            assert args[0] in ('fixture-grant', 'fixture-reject', 'fixture-old', 'fixture-invalid')
            self.osb_calls.append(('decode-consent', args[0]))
            if args[0] == 'fixture-invalid': raise VmThrown(self.new('Lo70;'))
            grant = args[0] == 'fixture-grant'
            return self.new('Lmp5;', {'version': 1 if args[0] == 'fixture-old' else 3, 'grant': grant})
        if owner == TCF:
            grant = args[0].value['grant']
            if sig == 'h()I': return args[0].value['version']
            if sig == 'd()I': return 7
            if sig == 'e()I': return 4
            if sig == 'o()Ljava/lang/String;': return 'NL'
            if sig in ('k()Z', 'i()Z'): return 0
            if sig == 'a()Ljava/util/List;':
                restriction = self.new('Ltm4;', {'Ltm4;->a:I': 2, 'Ltm4;->c:Lq20;': self.bits((1, 3))})
                return Reference([restriction] if grant else [], 'Ljava/util/ArrayList;')
            if sig.endswith(')Lq20;'):
                sets = {'c': (1, 3, 4, 7), 'j': (2, 6), 'l': (5,), 'p': (1,), 'b': (2,), 'f': (1, 3), 'm': (2,), 'n': (1,)}
                assert sig[0] in sets
                return self.bits(sets[sig[0]] if grant else ())
        if target == 'Ljava/util/BitSet;->isEmpty()Z': return int(not args[0].value)
        if target == 'Ljava/util/BitSet;->get(I)Z': return int(args[1] in args[0].value)
        if target == 'Ljava/util/BitSet;->nextSetBit(I)I': return min((i for i in args[0].value if i >= args[1]), default=-1)
        if target == 'Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;': return Reference(args[0], 'Ljava/lang/Integer;')
        if target == 'Ljava/lang/Integer;->intValue()I': return args[0].value
        if target == 'Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z': return int(any(x.value == args[1].value for x in args[0].value))
        if target == 'Ljava/util/HashSet;->add(Ljava/lang/Object;)Z': args[0].value.append(args[1]); return 1
        if sig == 'iterator()Ljava/util/Iterator;' and owner in ('Ljava/util/HashSet;', 'Ljava/util/List;'):
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if target == 'Ljava/util/Iterator;->hasNext()Z': return int(args[0].value['index'] < len(args[0].value['items']))
        if target == 'Ljava/util/Iterator;->next()Ljava/lang/Object;':
            value = args[0].value; item = value['items'][value['index']]; value['index'] += 1; return item
        if target == 'Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;': return Reference(list(args[0].value), 'Ljava/util/ArrayList;')
        if target == 'Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':
            old = args[0].value.get(args[1], 0); args[0].value[args[1]] = args[2]; return old
        if target == 'Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V': args[0].value = dict(args[1].value); return None
        if target == 'Lhg4;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;':
            return Reference(self.prefs.setdefault('default', {}), 'Landroid/content/SharedPreferences;')
        if target == 'Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':
            return Reference({'store': args[0].value, 'remove': set(), 'put': {}}, 'Landroid/content/SharedPreferences$Editor;')
        if owner == 'Landroid/content/SharedPreferences$Editor;':
            editor = args[0].value
            if sig.startswith('put'):
                editor['remove'].discard(args[1]); editor['put'][args[1]] = args[2]; return args[0]
            if sig.startswith('remove('): editor['put'].pop(args[1], None); editor['remove'].add(args[1]); return args[0]
            if sig in ('apply()V', 'commit()Z'):
                for name in editor['remove']: editor['store'].pop(name, None)
                editor['store'].update(editor['put']); self.commits.append(sig)
                editor['put'].clear(); editor['remove'].clear(); return 1 if sig == 'commit()Z' else None
        return super().invoke(target, args)


def verify_consent(f, disabled):
    state, queue = f.state()
    f.prefs = {STORE: {'osb-remote-cmp': 2}, 'default': {'unrelated-preference': 'keep'}}
    for method, value in (('setConsentByString', 'fixture-grant'), ('setConsent', 'fixture-reject')):
        f.commits.clear()
        args = {'consentString': value} if method == 'setConsentByString' else {'consentList': Reference({'tcString': value}, 'Ljava/util/HashMap;')}
        replies = f.channel(state, method, args)
        assert replies == [('success', 'success')], 'Original manual write did not complete once'
        assert f.commits == ['commit()Z', 'apply()V', 'apply()V'], 'Genuine consent writes were skipped'
        stored = f.run(OSB, 'e()[Ljava/lang/String;', (state,)).value
        assert stored == [value], 'Stored raw choice was lost or fabricated'
        iab = f.prefs['default']; grant = value == 'fixture-grant'
        assert iab['unrelated-preference'] == 'keep'
        assert iab['IABTCF_TCString'] == value and iab['IABTCF_CmpSdkID'] == 7 and iab['IABTCF_CmpSdkVersion'] == 3
        assert iab['IABTCF_gdprApplies'] == 1 and iab['IABTCF_PublisherCC'] == 'NL'
        assert iab['IABTCF_PurposeConsents'] == ('10110010000' if grant else '00000000000')
        assert iab['IABTCF_VendorConsents'] == ('101' if grant else '')
        assert iab.get('IABTCF_PublisherRestrictions2') == ('101' if grant else None)
        google = json.loads(f.prefs[STORE]['osb-cmp-google-consent'])
        assert all(google[k] == ('GRANTED' if grant else 'DENIED') for k in ('AD_STORAGE', 'AD_USER_DATA', 'AD_PERSONALIZATION'))
        # This analytics default is the original converter's behavior, retained
        # as local state. The privacy policy must remain blocked either way.
        assert google['ANALYTICS_STORAGE'] == 'GRANTED'
        valid = f.channel(state, 'isIABConsentValid', {'tcString': value})
        assert len(valid) == 1 and valid[0][0] == 'success' and valid[0][1].value is True
        f.osb_calls.clear()
        f.run(OSB, 'g(ILjava/util/Map;)V', (state, 3, Reference({}, 'Ljava/util/HashMap;')))
        if disabled: assert not f.osb_calls, 'Manual consent re-enabled a tracking admission'
    # Preserve the real invalid-input policy: consent fields are removed but
    # gdprApplies jurisdiction remains. Raw input is still stored by the
    # original API and validity returns false; the patch fabricates no grant.
    before_google = f.prefs[STORE]['osb-cmp-google-consent']
    assert f.channel(state, 'setConsentByString', {'consentString': 'fixture-invalid'}) == [('success', 'success')]
    assert f.prefs['default'] == {'unrelated-preference': 'keep', 'IABTCF_gdprApplies': 1}
    assert f.prefs[STORE]['osb-cmp-google-consent'] == before_google
    assert f.run(OSB, 'e()[Ljava/lang/String;', (state,)).value == ['fixture-invalid']
    for raw in ('fixture-invalid', 'fixture-old'):
        reply = f.channel(state, 'isIABConsentValid', {'tcString': raw})
        assert len(reply) == 1 and reply[0][0] == 'success' and reply[0][1].value is False
    print('PASS genuine manual consent storage/readback', 'tracking disabled' if disabled else 'original')
