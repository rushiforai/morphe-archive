"""Execute selected West ad boundaries with actual original consumer instructions."""
from brabant_effects import restore_alignment, restore_edits
from brabant_smali import canonical
from brabant_vm import Fixture as NativeFixture
from rtl_vm import Reference, equal, is_zero
from west_ads_contracts import ADS_CONTRACTS, ADS_EDITS

PINCH = 'Lnl/pinch/optoutadvertising/sdk/ui/OptOutAdView;'
MODEL = 'Lnl/stichtingrpo/news/views/epoxy/models/OptOutAdvertisementModel;'
CALLBACK = 'Lnl/stichtingrpo/news/views/epoxy/models/OptOutAdvertisementModel$bind$1$4$3;'
EMBED = 'Lcom/bluebillywig/bbnativeshared/model/EmbedObject;'
VERTICAL = 'Lnl/stichtingrpo/news/vertical_video/VerticalVideoActivity;'


class Fixture(NativeFixture):
    def __init__(self, source, declarations, sdk_read):
        super().__init__(source, declarations, sdk_read)
        self.rows = {(r[0], r[1]): r for r in ADS_CONTRACTS}
        self.native.update({('Lzk8;', '<init>(ZZZ)V'),
                            (EMBED, 'getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;'),
                            (EMBED, 'getAdServicesData()Ljava/util/List;'),
                            (MODEL, 'access$getCurrentAdResultHandler$p(' + MODEL + ')Lz7;'),
                            (MODEL, 'getLoadFailedAction()Lty2;')})

    def invoke(self, target, args):
        if target == 'Lms3;->f(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0] == args[1]) if isinstance(args[0], str) and isinstance(args[1], str) else int(equal(*args))
        if target == 'Lpi7;->k(Ljava/lang/Object;Ljava/lang/Object;)Z':
            assert is_zero(args[1]); args[0].value['value'] = args[2]
            self.events.append(('reset', args[2])); return 1
        if target == 'Lz7;->onFailure(Ljava/lang/Throwable;)V':
            self.events.append(('failure', args[0], args[1]))
            return self.run(args[0].descriptor, 'onFailure(Ljava/lang/Throwable;)V', args)[0]
        if target == 'Lty2;->c()Ljava/lang/Object;':
            self.events.append(('load-failed-action', args[0])); return None
        if target == 'Ljj4;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;':
            return ''.join(args)
        if target == 'Ljw7;->e(Ljava/lang/String;[Ljava/lang/Object;)V': return None
        if target == 'Lnl/stichtingrpo/news/databinding/ListComponentOutbrainBinding;->getRoot()Lnl/stichtingrpo/news/views/SmartFeedWidget;':
            return args[0].value['root']
        if target in {'Lkd2;-><init>(I)V', 'Lyp7;-><init>(Lty2;)V', 'Lp91;-><init>()V'}:
            self.defaults(args[0]); return None
        if target == 'Lu97;->c(Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V':
            self.events.append(('native-shorts-options', *args)); return None
        return super().invoke(target, args)


def verify_ads(source, declarations, sdk_read, verify_graphs=True):
    f = Fixture(source, declarations, sdk_read)
    # Whole native graphs outside declared ownership must remain identical.
    for row in ADS_CONTRACTS if verify_graphs else ():
        owner, signature, flags, locals_, count, digest = row
        value = canonical(source.body(owner, signature))
        edits = [e for e in ADS_EDITS if (e['owner'], e['signature']) == (owner, signature)]
        if edits:
            value = restore_edits(value, edits, locals_)
        value = restore_alignment(value, count)
        assert len(value.code) == count and value.digest() == digest, 'West retained ad graph: ' + owner + signature
    # Parent eligibility avoids native placement spacing; direct cached builder
    # paths are separately inert. The original parent O/V layouts are hash-bound.
    for signature in ('U(Ly43;Lt9;)Z', 'X(Ly43;Lt9;)Z'):
        assert is_zero(f.run('Ly43;', signature, [None, None])[0])
    assert is_zero(f.run('Lot9;', 'e(Lqm5;Let5;Lxp5;)Z', [None, None, None, None])[0])
    for signature in ('T(Lt43;Ly43;Let5;Lxp5;Lki6;)V', 'W(Lia5;Ly43;Lxp5;Lka5;Let5;Z)V'):
        f.run('Ly43;', signature)
    # Only the standalone x9 arm reaches native false; mixed content arms remain
    # pinned, including return routing through the surrounding controller.
    assert is_zero(f.run('Lnl/stichtingrpo/news/base/BaseController;', 'buildComponent(Lh01;Let5;)Z', start=21)[0])
    # Each bind receives one reset then one real app failure callback. Its native
    # handler calls the current model's failure action and hides both dividers.
    for current in (True, False):
        top, bottom = f.new('Landroid/view/View;'), f.new('Landroid/view/View;')
        binding = f.new('Lnl/stichtingrpo/news/databinding/ListComponentOptOutAdvertisementBinding;', {
            'Lnl/stichtingrpo/news/databinding/ListComponentOptOutAdvertisementBinding;->topDivider:Landroid/view/View;': top,
            'Lnl/stichtingrpo/news/databinding/ListComponentOptOutAdvertisementBinding;->bottomDivider:Landroid/view/View;': bottom})
        model = f.new(MODEL, {MODEL + '->loadFailedAction:Lty2;': f.new('Lty2;')})
        callback = f.new(CALLBACK, {CALLBACK + '->this$0:' + MODEL: model,
                                  CALLBACK + '->$adUnitId:Ljava/lang/String;': 'original-ad-unit',
                                  CALLBACK + '->$binding:Lnl/stichtingrpo/news/databinding/ListComponentOptOutAdvertisementBinding;': binding})
        model.value[MODEL + '->currentAdResultHandler:Lz7;'] = callback if current else None
        flow = f.new('Lpi7;')
        view = f.new(PINCH, {PINCH + '->c:Lix0;': f.new('Lix0;', {'Lix0;->b:Ljava/lang/Object;': flow})})
        before = len(f.events)
        f.run(PINCH, 'e(Lz7;)V', [view, callback])
        events = f.events[before:]
        assert [e[0] for e in events].count('reset') == 1
        assert [e[0] for e in events].count('failure') == 1
        assert events[0][0] == 'reset'
        assert [e[0] for e in events].count('load-failed-action') == int(current)
        assert top.value['visibility'] == bottom.value['visibility'] == 8
        state = flow.value['value']
        assert state.descriptor == 'Lzk8;' and all(is_zero(v) for v in state.value.values())
    # Original optional ad models use nullable absence. Cached Outbrain root is
    # GONE before SDK/widget initialization rather than reporting a loaded ad.
    for signature in ('getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;', 'getAdServicesData()Ljava/util/List;'):
        assert is_zero(f.run(EMBED, signature, [f.new(EMBED)])[0])
    widget = f.new('Lnl/stichtingrpo/news/views/SmartFeedWidget;')
    binding = Reference({'root': widget}, 'Lnl/stichtingrpo/news/databinding/ListComponentOutbrainBinding;')
    f.run('Lnl/stichtingrpo/news/views/epoxy/models/OutbrainModel;', 'bind(Lnl/stichtingrpo/news/databinding/ListComponentOutbrainBinding;)V', [None, binding])
    assert widget.value['visibility'] == 8
    # Keep the unrelated c flag true while selecting native no-ad routes for all
    # vertical insertion, index, preparation and callback consumers.
    f.run('Lgp2;', '<clinit>()V')
    assert is_zero(f.statics['Lgp2;->b:Z']) and f.statics['Lgp2;->c:Z'] == 1
    for size in (0, 1, 4, 9):
        videos = Reference([f.new('Lea5;') for _ in range(size)], 'Ljava/util/ArrayList;')
        for index in ({0, size - 1} if size else {0}):
            activity = f.new(VERTICAL)
            result, frame = f.run(VERTICAL, 'onCreate(Landroid/os/Bundle;)V', start=50, stop_at={94},
                                  registers={'p0': activity, 'v0': videos, 'v3': index})
            assert result == 94 and activity.value[VERTICAL + '->J:Ljava/util/List;'] is videos
            assert f.run(VERTICAL, 'D(I)I', [activity, index])[0] == index
    # Execute all regular/renderer/shorts original controller selection arms.
    # The retained shorts coordinator still receives the exact content/options;
    # none of these inputs can construct a commercial x25 controller.
    for player_type in ('regular', 'renderer', 'shorts', 'outstream'):
        core = f.new('Lr96;')
        embed = f.new(EMBED)
        options = Reference({'playerType': player_type}, 'Ljava/util/LinkedHashMap;')
        reached, frame = f.run('Lr96;', 'i(Lse2;Ljava/util/Map;)V', start=641, stop_at={799}, registers={
            'v0': core, 'v1': embed, 'v2': options, 'v5': 0, 'v6': 2, 'v8': 0})
        assert reached == 799 and is_zero(core.value['Lr96;->p0:La8;']) and is_zero(core.value['Lr96;->q0:Lx25;'])
        if player_type == 'shorts':
            assert core.value['Lr96;->P0:Lu97;'].descriptor == 'Lu97;'
            assert any(e[0] == 'native-shorts-options' and e[2] is embed and e[3] is options for e in f.events)
        # Retain the view's original non-ad attachment branch for renderer and
        # outstream; normal nullable schedules/services also take this route.
        view = f.new('Lv70;', {'Lv70;->H1:Ljava/lang/String;': player_type})
        reached, _ = f.run('Lv70;', 'i(Lse2;Ljava/util/Map;)V', start=1221, stop_at={1281},
                           registers={'v0': view, 'v2': embed})
        assert reached == 1281

    # Explicit late ad services never allocate/reset an existing content core.
    player = f.new('Lv70;', {'Lv70;->f:Lr96;': f.new('Lr96;')})
    core = player.value['Lv70;->f:Lr96;']
    options = Reference({'adServicesData': Reference([f.new('Lcom/bluebillywig/bbnativeshared/model/AdUnit;')], 'Ljava/util/ArrayList;')}, 'Ljava/util/LinkedHashMap;')
    f.run('Lv70;', 'H(Lpn;Ljava/util/Map;)V', start=653,
          registers={'v2': options, 'v3': player})
    assert player.value['Lv70;->f:Lr96;'] is core
    # Preserve copied canRequestAds caller input while handing the native core
    # false; the remaining TCF/statistics path belongs to the tracking control.
    options = Reference({'canRequestAds': f.true}, 'Ljava/util/LinkedHashMap;')
    player.value['Lv70;->C1:Z'] = 1
    _, frame = f.run('Lv70;', 'l(Ljava/lang/String;Ljava/util/Map;)V', [player, 'content-url', options], stop_at={16})
    assert frame['v5'].value['canRequestAds'] is f.false and options.value['canRequestAds'] is f.true


if __name__ == '__main__':
    import argparse
    from pathlib import Path
    from dex_declarations import DexDeclarations
    from verify_dumpert import Smali
    from verify_parool import sdk_classes
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path, required=True)
    args = parser.parse_args()
    sdk_read, sdk_archive = sdk_classes()
    try:
        verify_ads(Smali(args.root), DexDeclarations.from_apk(args.apk), sdk_read)
    finally:
        sdk_archive.close()
    print('PASS West ad native graphs and failure/list/player fixtures')
