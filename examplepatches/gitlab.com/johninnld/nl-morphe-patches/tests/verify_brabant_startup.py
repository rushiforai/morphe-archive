"""Source-pinned startup/menu suppression and real manual notification routing."""
import hashlib
import json
import xml.etree.ElementTree as ET

from brabant_startup_contracts import STARTUP_CONTRACTS
from verify_brabant_tracking import TrackingFixture
from rtl_vm import Reference

ACTIVITY = ('Luj5;', 'onCreate(Landroid/os/Bundle;)V')
CLICK = ('La76;', 'onClick(Landroid/view/View;)V')
HOST = ('Lut;', 'u(Ld66;Lfq1;Lyn3;Lgq3;I)V')
MORE = 'Lnl/omroepbrabant/android/presentation/ui/xml/more/view/MoreFragment;'
LAUNCH_INIT = ('Lj50;', '<init>(Ljava/lang/Object;Lfp1;I)V')
STARTUP_EDITS = [
    dict(owner=ACTIVITY[0], signature=ACTIVITY[1], index=264,
         original=['if-lt v0, v1, @273'], replacement=['goto/32 @273']),
    dict(owner=CLICK[0], signature=CLICK[1], index=56,
         original=['invoke-virtual {p0}, '+MORE+'->j()Lm76;'],
         replacement=['return-void', 'invoke-virtual {p0}, '+MORE+'->j()Lm76;']),
    dict(owner=HOST[0], signature=HOST[1], index=0, original=[], replacement=['return-void']),
]


class StartupFixture(TrackingFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in STARTUP_CONTRACTS})
        self.native.add(LAUNCH_INIT)
        self.context = Reference({}, 'Landroid/content/Context;')
        self.vm = self.new('Lm76;')
        self.fragment = self.new(MORE)
        self.cookie_state = Reference({'value': False}, 'Lw29;')
        cookie_vm = self.new('Lbq1;', {'Lbq1;->c:Lw29;': self.cookie_state})
        self.fragment.value[MORE+'->k:Lgc1;'] = Reference({'value': cookie_vm}, 'Lgc1;')

    def invoke(self, target, args):
        if target == 'Le65;->getLifecycle()Lt55;': return Reference({}, 'Lt55;')
        if target == 'Lmx9;->I(Lt55;)Lu55;': return Reference({}, 'Lu55;')
        if target == 'Lw99;-><init>(ILfp1;)V':
            assert args[1] == 2; return None
        if target == 'Lbr6;->J(Lrr1;Lir1;Lur1;Loo3;I)Lp19;':
            self.scheduled.append(args[3]); return Reference({}, 'Lp19;')
        if target == MORE+'->j()Lm76;': return self.vm
        if target == 'Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;': return args[0].value['text']
        if target == 'Ljava/lang/Object;->toString()Ljava/lang/String;' and isinstance(args[0], str): return args[0]
        if target == 'Lm76;->i(Ljava/lang/String;)V': self.events.append(('menu-label', args[1])); return None
        if target == 'Lgc1;->getValue()Ljava/lang/Object;': return args[0].value['value']
        if target == 'Lw29;->n(Ljava/lang/Object;Ljava/lang/Object;)Z':
            assert args[1] == 0  # Native unconditional state update boundary.
            args[0].value['value'] = args[2].value
            self.events.append(('cookie-state', args[2].value)); return 1
        if target == 'Landroid/content/Intent;-><init>(Ljava/lang/String;)V': args[0].value['action'] = args[1]; return None
        if target == 'Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;':
            args[0].value[args[1]] = args[2]; return args[0]
        if target == 'Landroidx/fragment/app/o;->requireContext()Landroid/content/Context;': return self.context
        if target == 'Landroid/content/Context;->getPackageName()Ljava/lang/String;': return 'nl.omroepbrabant.android'
        if target == 'Landroidx/fragment/app/o;->startActivity(Landroid/content/Intent;)V':
            self.events.append(('os-settings', dict(args[1].value))); return None
        if target == 'Lgq3;->Y(I)Lgq3;':
            raise AssertionError('Brabant cookie host entered Compose before suppression')
        return super().invoke(target, args)


def verify_notifications(f, consent):
    for sdk in (32, 33, 36):
        f.statics['Landroid/os/Build$VERSION;->SDK_INT:I'] = sdk
        activity = f.new('Luj5;')
        before = dict(activity.value)
        f.scheduled.clear()
        f.run(*ACTIVITY, (activity, 0), start=262, stop_at=(273,),
              registers={'v4': activity, 'v3': 0, 'v7': 3})
        assert len(f.scheduled) == int(sdk >= 33 and not consent), 'Brabant automatic notification coroutine still scheduled'
        if f.scheduled:
            assert f.scheduled[0].value['Lj50;->a:I'] == 20
            assert f.scheduled[0].value['Lj50;->c:Ljava/lang/Object;'] is activity
        assert activity.value == before, 'Brabant startup mutated permission/preferences'


def click(f, selector):
    binding = f.new('Lxk3;', {
        'Lxk3;->q:Landroid/widget/TextView;': Reference({'text':'Pushberichten ontvangen'}, 'Landroid/widget/TextView;'),
        'Lxk3;->r:Landroid/widget/TextView;': Reference({'text':'Cookie instellingen'}, 'Landroid/widget/TextView;'),
    })
    listener = f.new('La76;', {'La76;->a:I': selector, 'La76;->b:'+MORE: f.fragment,
                             'La76;->c:Lxk3;': binding})
    return f.run(*CLICK, (listener, Reference({}, 'Landroid/view/View;')))[0]


def verify_cookie_click(f, consent):
    for stored in (False, True):
        f.events.clear(); f.cookie_state.value['value'] = stored
        assert click(f, 8) is None
        assert f.cookie_state.value['value'] == (stored if consent else True), 'Brabant cookie callback still changes dialog state'
        if consent: assert not f.events, 'Brabant disabled cookie click performed work'


def verify_cookie_host(f, consent):
    if not consent: return
    f.events.clear()
    assert f.run(*HOST, (0, f.new('Lfq1;'), Reference({}, 'Lyn3;'), Reference({}, 'Lgq3;'), 0))[0] is None
    assert not f.events, 'Brabant cookie host side effects'


def verify_manual(f):
    f.events.clear()
    assert click(f, 7) is None
    assert f.events == [('menu-label', 'Pushberichten ontvangen'), ('os-settings', {
        'action':'android.settings.APP_NOTIFICATION_SETTINGS',
        'android.provider.extra.APP_PACKAGE':'nl.omroepbrabant.android'})], 'Brabant manual notification Settings changed'


def layout_digest(node):
    def tree(n): return n.tag, sorted(n.attrib.items()), (n.text or '').strip(), [tree(c) for c in n]
    return hashlib.sha256(json.dumps(tree(node), separators=(',', ':')).encode()).hexdigest()


# Only the original privacy row's initial visibility may change.
LAYOUT_SHA256 = 'b042d9b439d04bd1305370f237ba13d0e72e39377d768518ead895127aba9c20'

def verify_resources(root, consent):
    paths = list((root/'res').glob('layout*/fragment_more.xml'))
    assert len(paths) == 1, 'Brabant More layout variants changed'
    layout = ET.parse(paths[0]).getroot()
    a = '{http://schemas.android.com/apk/res/android}'
    rows = [n for n in layout.iter() if n.get(a+'id') == '@id/privacy_policy']
    assert len(rows) == 1 and rows[0].tag == 'TextView'
    row = rows[0]
    assert row.get(a+'text') == '@string/more_fragment_settings_cookies'
    assert row.get(a+'visibility') == ('gone' if consent else None), 'Brabant cookie menu still visible before first draw'
    row.attrib.pop(a+'visibility', None)
    assert layout_digest(layout) == LAYOUT_SHA256, 'Brabant unrelated More layout changed'


def verify_startup(source, declarations, sdk_read, consent):
    f = StartupFixture(source, declarations, sdk_read)
    verify_notifications(f, consent)
    verify_cookie_click(f, consent)
    verify_cookie_host(f, consent)
    verify_manual(f)
