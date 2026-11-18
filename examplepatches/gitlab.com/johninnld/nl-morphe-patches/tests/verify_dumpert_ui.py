"""Owned display edits, independent of the production patch implementation."""

PREMIUM = 'Lnl/livewall/dumpert/premium/R$string;'
APP = 'Lnl/livewall/dumpert/R$string;'
STRING_RESOURCE = 'Landroidx/compose/ui/res/StringResources_androidKt;->stringResource(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;'

UI_EDITS = {
    'AD_UI_PANE': {
        641: ('sget v1, ' + PREMIUM + '->manage_premium_state_title:I',
              'sget v1, ' + PREMIUM + '->purchase_screen_title:I'),
        686: ('sget v1, ' + PREMIUM + '->manage_premium_state_price:I', 'const-string v1, ""'),
        687: ('invoke-static {v1, v5, v0}, ' + STRING_RESOURCE, 'nop'),
        688: ('move-result-object v1', 'nop'),
        731: ('sget v1, ' + PREMIUM + '->manage_premium_state_description:I',
              'sget v1, ' + APP + '->premium_account:I'),
    },
    'AD_UI_HEADER': {
        234: ('sget v7, ' + APP + '->free_account:I', 'sget v7, ' + APP + '->premium_account:I'),
    },
}


def restore_ui(code, policy, locals_, absolute_registers):
    """Verify only owned substitutions; leave all other code for original hash checks."""
    result = list(code)
    for position, (original, selected) in UI_EDITS[policy].items():
        assert absolute_registers(result[position], locals_) == absolute_registers(selected, locals_), \
            f'Missing {policy} display change at {position}'
        result[position] = original
    return result


def verify_ui_resources(source):
    import re
    for owner, field, value in ((PREMIUM, 'purchase_screen_title', '0x7f120395'),
                                (APP, 'premium_account', '0x7f12038b')):
        # Resource patching removes final from R fields, retaining their IDs.
        assert re.search(r'^\.field public static (?:final )?' + field + r':I = ' + value + r'$',
                         source.text(owner), re.M), 'Native localized display resource changed: ' + field


def verify_ui_flows(source, canonical, execute):
    """Exercise original paid-product fallback and actual signed-in subtitle branches."""
    from dumpert_ui_contracts import UI_CONTRACTS
    def code(name):
        row = next(r for r in UI_CONTRACTS if r[1].startswith(name + '('))
        return canonical(source.body(row[0], row[1]))

    # Run real native product selection; a real active product takes precedence.
    pane = code('SubscriptionSettingsPaneLayout')
    product, active = object(), object()
    for current, expected in ((None, product), (active, active)):
        chosen = []
        def product_call(target, args):
            assert 'IapProduct;->get' in target
            chosen.append(args[0])
            return 'real title' if '->getTitle()' in target else 'real description'
        registers = {'v28': product, 'v29': current}
        execute(pane[:309] + ['return-object v2'], registers, product_call, start=301)
        assert len(chosen) == 2 and all(item is expected for item in chosen), 'Preserve actual paid product identity'
        assert registers['v1'] == 'real title' and registers['v2'] == 'real description'
    assert pane[166] == 'if-nez v4, @202' and 'loading_product_text:I' in pane[171], 'Preserve null-product loading branch'
    assert pane[296] == 'if-eqz v30, @380', 'Preserve real premium branch input'

    header = code('SettingsLoggedInHeaderBlock')
    for premium in (0, 1):
        registers = {'v0': object(), 'v1': premium, 'v5': object()}
        def header_call(target, args):
            if '->getUsername()' in target:
                return 'real username'
            if '->stringResource(' in target:
                return args[0]
            assert 'Composer' in target, 'Only original composition calls expected'
        execute(header[:238] + ['return-object v7'], registers, header_call, start=216)
        assert registers['v4'] == 'real username', 'Preserve genuine account username'
        assert registers['v7'] == APP + '->premium_account:I', 'Both local subtitles use native ad-free copy'
