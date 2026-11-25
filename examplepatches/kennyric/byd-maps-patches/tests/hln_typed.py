"""Execute local HLN completions using the emitted methods and original constructors."""
from hln_onboarding import Obj, VM


class CompletionVM(VM):
    def switch_case_map(self):
        return {}

    def invoke(self, ref, values, kind):
        owner, signature = ref.split('->')
        if owner in {'Lk10;', 'Lq3g;'} and signature == '<init>(Ljava/lang/Object;)V':
            assert kind == 'invoke-direct'
            return self.call(owner[1:-1], signature, values)
        if owner == 'Ljava/util/ArrayList;' and signature == '<init>()V':
            values[0].fields['items'] = []
            return None
        return super().invoke(ref, values, kind)


def verify_completions(root, tracking, marketing):
    from hln_contracts import AMALIA, MARKETING_LIST, MARKETING_FLOW
    if tracking:
        result = CompletionVM(root).call(*AMALIA, [Obj('Lxz8;'), Obj('Lst;'), None])
        assert result.type == 'Lk10;' and result.fields['a'].type == 'Llbi;', 'HLN audio completion is real Success<Unit>'
    if marketing:
        args = [Obj('Lnq8;'), 'fixture', 'fixture', None, 'fixture', None, None, None]
        result = CompletionVM(root).call(*MARKETING_LIST, args)
        assert result.type == 'Ljava/util/ArrayList;' and result.fields['items'] == []
        flow = CompletionVM(root).call(*MARKETING_FLOW, args)
        assert flow.type == 'Lq3g;', 'HLN marketing native caller receives an actual Flow'
        value = flow.fields['_state$volatile']
        assert value.type == 'Ljava/util/ArrayList;' and value.fields['items'] == [], 'HLN first() receives one empty list'
