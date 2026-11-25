"""Independent expected RTL telemetry edits, derived from original typed contracts."""
from rtl_contracts import CONTRACTS, TRACKING_POLICIES
from rtl_tracking_contracts import TRACKING_CONTRACTS, EXTRA_POLICIES, DISABLED_GETTER_EDITS

POLICIES = TRACKING_POLICIES | EXTRA_POLICIES


def basic_prefix(policy, signature):
    if policy.startswith('STOP_VOID'):
        return ['return-void']
    if policy.startswith('UNIT_Lk9d'):
        return ['sget-object v0, Lk9d;->a:Lk9d;', 'return-object v0']
    if policy.startswith('EMPTY_STRING'):
        return ['const-string v0, ""', 'return-object v0']
    if policy.startswith('EMPTY_MAP'):
        return ['sget-object v0, Lpw3;->h:Lpw3;', 'return-object v0']
    if policy.startswith('FALSE'):
        return ['const/4 v0, 0x0', 'return v0']
    if policy == 'TRUE_PERMANENT_MEASUREMENT_DEACTIVATION':
        return ['const/4 v0, 0x1', 'return v0']
    if policy == 'RETURN_ORIGINAL_P0_PLAYER_OR_SOURCE':
        return ['return-object p0']
    if policy == 'COMPLETED_TASK_NULL_Lzdc_P':
        return ['const/4 v0, 0x0', 'invoke-static {v0}, Lzdc;->P(Ljava/lang/Object;)Lwui;',
                'move-result-object v0', 'return-object v0']
    if policy in {'FORCE_BOOLEAN_P1_FALSE_RETAIN_SDK', 'FORCE_BOXED_BOOLEAN_P1_FALSE',
                  'FORCE_BOXED_OR_PRIMITIVE_P1_FALSE'}:
        return (['sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;']
                if 'Ljava/lang/Boolean;' in signature else ['const/4 p1, 0x0'])
    if policy == 'FORCE_STATIC_P0_FALSE':
        return ['const/4 p0, 0x0']
    if policy == 'NATIVE_NULL_JSON_FAILURE':
        return ['const/4 v0, 0x0', 'return-object v0']
    if policy == 'NATIVE_FAILURE_INT_MINUS1':
        return ['const/4 v0, -0x1', 'return v0']
    if policy in {'BOXED_TRUE', 'BOXED_FALSE_SUSPEND_RESULT'}:
        value = 'TRUE' if policy == 'BOXED_TRUE' else 'FALSE'
        return [f'sget-object v0, Ljava/lang/Boolean;->{value}:Ljava/lang/Boolean;', 'return-object v0']
    return None


def verify_basic(source):
    from verify_dumpert import absolute_registers, canonicalize
    rows = {(r[0], r[1]): r for r in CONTRACTS + TRACKING_CONTRACTS}
    checked = 0
    for (owner, signature), policy in POLICIES.items():
        expected = basic_prefix(policy, signature)
        if expected is None:
            continue
        row = rows[owner, signature]
        code = canonicalize(source.body(owner, signature))
        assert [absolute_registers(x, row[3]) for x in code[:len(expected)]] == [
            absolute_registers(x, row[3]) for x in expected], 'Missing RTL tracking prefix: ' + owner + signature
        checked += 1
    return checked


def verify_indexed(source):
    from verify_dumpert import canonicalize
    for edit in DISABLED_GETTER_EDITS:
        code = canonicalize(source.body(edit['owner'], edit['signature']))
        assert code[0] == edit['replacement'], 'Missing native disabled video-analytics getter'
    code = canonicalize(source.body('Lua;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'))
    assert code[32] in {'goto @47', 'goto/16 @47', 'goto/32 @47'}, 'Missing native null advertising-ID emission gate'


DMOI_PREFIX = [
    'new-instance v0, Ljava/lang/Throwable;', 'const-string v1, "DMOI tracking disabled"',
    'invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V',
    'new-instance v1, Luka;', 'invoke-direct {v1, v0}, Luka;-><init>(Ljava/lang/Throwable;)V',
    'new-instance v2, Lwka;', 'invoke-direct {v2, v1}, Lwka;-><init>(Ljava/lang/Object;)V',
    'invoke-interface {p2, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;',
    'return-void',
]

CONSENT_PREFIX = ['if-nez p2, @9', 'iget-object v0, p0, Lkc2;->i:Ldyb;',
    'const/4 v1, 0x0', 'sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;',
    'invoke-virtual {v0, v1, v2}, Ldyb;->m(Ljava/lang/Object;Ljava/lang/Object;)Z',
    'iget-object v0, p0, Lkc2;->j:Ldyb;',
    'sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;',
    'invoke-virtual {v0, v1, v2}, Ldyb;->m(Ljava/lang/Object;Ljava/lang/Object;)Z', 'return-void']
DSG_PREFIX = ['invoke-static/range {p0 .. p0}, Ldsg;->morpheFailMeasurement(Ldsg;)Z',
    'move-result v0', 'if-eqz v0, @4', 'return-void']
SWRVE = 'Lcom/swrve/sdk/SwrveEventsManagerImp;'
SWRVE_PREFIX = ['const/4 v1, 0x0', 'const/4 v2, 0x0',
    'invoke-static/range {p0 .. p1}, ' + SWRVE + '->morpheFilterEvents(' + SWRVE + 'Ljava/util/LinkedHashMap;)Ljava/util/LinkedHashMap;',
    'move-result-object p1']
CCT_GATE = ['invoke-static {v14}, Lgcd;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;',
    'move-result-object v14', 'invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z', 'move-result v0',
    'if-eqz v0, @115', 'const/4 v0, 0x3', 'const-wide/16 v7, -0x1', 'goto/32 @42']
HELPERS = {
    ('Lgcd;', 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'): 5,
    ('Ldsg;', 'morpheFailMeasurement(Ldsg;)Z'): 8,
    (SWRVE, 'morpheFilterEvents(' + SWRVE + 'Ljava/util/LinkedHashMap;)Ljava/util/LinkedHashMap;'): 14,
}


def restore_switch_padding(body, code, expected_count, skip):
    """DEX may add/drop one alignment nop before a terminal switch payload."""
    from rtl_vm import parse
    import re
    difference = expected_count - len(code)
    if not difference:
        return code
    program = parse(body)
    assert program.switches and abs(difference) == 1, 'Unexpected RTL switch alignment'
    assert all(program.labels[label] == len(program.instructions) for label in program.switches), 'Nonterminal RTL switch alignment'
    if difference < 0:
        assert code[-1] == 'nop', 'Only RTL alignment nop may be removed'
        code = code[:-1]
    else:
        code = code + ['nop']
    old = len(program.instructions) - skip
    return [re.sub(r'@' + str(old) + r'$', '@' + str(expected_count), line)
            if line.startswith(('packed-switch ', 'sparse-switch ')) else line for line in code]


def restore_tracking(body, owner, signature, locals_, tracking, consent):
    """Return independently restored original code and new→original target mapping."""
    import re
    from verify_dumpert import absolute_registers, canonicalize
    code = canonicalize(body)
    key = owner, signature
    policy = POLICIES.get(key)
    enabled = consent if owner == 'Lkc2;' else tracking
    if not enabled or policy is None:
        return code, lambda position: position
    prefix = basic_prefix(policy, signature)
    if owner == 'Lsy5;': prefix = DMOI_PREFIX
    elif owner == 'Lkc2;': prefix = CONSENT_PREFIX
    elif owner == 'Ldsg;': prefix = DSG_PREFIX
    elif owner == SWRVE: prefix = SWRVE_PREFIX
    if prefix:
        assert [absolute_registers(x, locals_) for x in code[:len(prefix)]] == [
            absolute_registers(x, locals_) for x in prefix], 'Missing RTL tracking prefix: ' + owner + signature
        code = canonicalize(body, len(prefix))
        row = next((r for r in CONTRACTS + TRACKING_CONTRACTS if r[:2] == key), None)
        # Only methods with switch payloads are subject to DEX alignment changes.
        if row and ('packed-switch ' in body or 'sparse-switch ' in body):
            code = restore_switch_padding(body, code, row[4], len(prefix))
        return code, lambda position: position - len(prefix)
    if owner == 'Lua;':
        assert code[32] in {'goto @47', 'goto/16 @47', 'goto/32 @47'}, 'Native missing-ID branch'
        code[32] = 'if-eqz p1, @47'
    elif policy == 'RETURN_REAL_DISABLED_SINGLETON_REPLACE_GETTER_INSTRUCTION':
        edit = next(e for e in DISABLED_GETTER_EDITS if (e['owner'], e['signature']) == key)
        assert absolute_registers(code[0], locals_) == absolute_registers(edit['replacement'], locals_)
        code[0] = edit['original']
    elif owner == 'Lgcd;':
        assert code[107:115] == CCT_GATE, 'Missing complete post-metrics CCT gate including fatal reset'
        assert code[115] == 'move-object v0, v6', 'Keep original CCT grouping entry'
        code = code[:107] + code[115:]
        def position(value):
            assert value <= 107 or value >= 115, 'Original branch enters injected CCT gate interior'
            return value - 8 if value >= 115 else value
        code = [re.sub(r'@(\d+)', lambda m: '@' + str(position(int(m[1]))), line)
                if line.startswith(('if-', 'goto', 'packed-switch', 'sparse-switch')) else line for line in code]
        return code, position
    else:
        raise AssertionError('Unimplemented RTL tracking contract: ' + str(key))
    return code, lambda position: position
