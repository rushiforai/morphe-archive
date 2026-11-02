"""Belgian original contracts and independently translated Horizon edit policy."""
import json
from pathlib import Path
import re

from marktplaats_1619 import selected_edits as horizon_edits

DATA = json.loads(Path(__file__).with_name('tweedehands_1619_contracts.json').read_text())


def translate(value):
    value = re.sub(r'L[\w$/-]+;->[^\s,}]+',
                   lambda m: DATA['references_from_marktplaats'].get(m[0], m[0]), value)
    return re.sub(r'L[\w$/-]+;',
                  lambda m: DATA['types_from_marktplaats'].get(m[0], m[0]), value)


def selected_edits(selected):
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    hidden = tracking or 'Hide ads' in selected
    security = tracking or 'Disable ThreatMetrix' in selected
    original_selection = ({'Hide ads'} if hidden else set())
    original_selection |= {'Disable tracking'} if tracking else set()
    original_selection |= {'Disable ThreatMetrix'} if security else set()
    result = []
    for old in horizon_edits(original_selection):
        key = old['owner'] + '->' + old['signature']
        member = DATA['references_from_marktplaats'].get(key, translate(key))
        owner, signature = member.split('->', 1)
        edit = {**old, 'owner': owner, 'signature': signature,
                'original': [translate(line) for line in old['original']],
                'replacement': [translate(line) for line in old['replacement']]}
        if key == 'Lxg;->onActivityResumed(Landroid/app/Activity;)V':
            edit.update(index=152, replacement=['goto/16 @189'])
        if key == 'Lj11;->d(Lz21;I)V':
            edit['replacement'] = [line.replace('const-wide/16 v14,', 'const-wide/16 v13,')
                                   for line in edit['replacement']]
        result.append(edit)
    def insert(owner, signature, replacement, index=0):
        result.append(dict(owner=owner, signature=signature, index=index,
                           original=[], replacement=replacement))
    if selected:
        insert('Lo16;', 'c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;',
               ['const-string v0, "5BFB2470C28371C4273CA0232A57C120977619D3"'], index=92)
    if tracking:
        insert('Lo16;', 'c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;',
               ['const/4 p0, 0x0', 'goto/16 @31'], index=25)
        for owner, signature in [
            ('Lr03;', 'a()V'),
            ('Lcom/gemius/sdk/audience/AudienceEvent;', 'sendEvent()V'),
            ('Lcom/gemius/sdk/audience/AudienceEvent;', 'flushBuffer(Z)V'),
        ]:
            insert(owner, signature, ['return-void'])
        for owner, signature in [
            ('Lcom/horizon/android/core/tracking/config/a;', 'p()Z'),
            ('Lcom/gemius/sdk/Config;', 'isUserTrackingEnabled()Z'),
        ]:
            insert(owner, signature, ['const/4 v0, 0x0', 'return v0'])
        insert('Lr03;', 'b(Z)V', ['const/4 p1, 0x0'])
        insert('Lcom/gemius/sdk/Config;', 'setUserTrackingEnabled(Z)V', ['const/4 p0, 0x0'])
        insert('Lcom/sourcepoint/mobile_core/Coordinator;',
               'pvData(Lkotlinx/serialization/json/JsonObject;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
               ['sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;', 'return-object v0'])
        insert('Lcom/horizon/android/feature/vip/usecase/b;',
               'a(Lcom/horizon/android/core/datamodel/MpAd;Ljava/lang/String;ZLj43;)Z',
               ['const/4 v0, 0x0', 'return v0'])
        insert('Lcom/horizon/android/core/datamodel/AdFlags;', 'getHasCallTracking()Z',
               ['const/4 v0, 0x0', 'return v0'])
    if 'Skip consent screens' in selected:
        client, controller = 'Lhl3;', 'Lil3;'
        library = 'Lcom/sourcepoint/cmplibrary/SpConsentLib;'
        campaign = 'Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'
        insert(client, 'onUIReady(Landroid/view/View;)V', [
            f'iget-object v1, p0, {client}->d:{controller}',
            f'iget-object v2, v1, {controller}->h:{library}',
            'if-eqz v2, @12',
            f'iget-boolean v0, p0, {client}->morpheRejectedConsent:Z',
            'if-nez v0, @10',
            'const/4 v0, 0x1',
            f'iput-boolean v0, p0, {client}->morpheRejectedConsent:Z',
            f'sget-object v3, {campaign}->GDPR:{campaign}',
            f'invoke-interface {{v2, v3}}, {library}->rejectAll({campaign})V',
            f'invoke-virtual {{p0, p1}}, {client}->onUIFinished(Landroid/view/View;)V',
            'return-void',
            'const/4 v0, 0x0',
            f'iput-boolean v0, p0, {client}->a:Z',
            f'iget-object v1, v1, {controller}->i:Loff;',
            'sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;',
            'invoke-virtual {v1, v0}, Loff;->k(Ljava/lang/Object;)V',
            'return-void',
        ], index=1)
        insert(client, 'onError(Ljava/lang/Throwable;)V',
               ['const/4 v0, 0x0', f'iput-boolean v0, p0, {client}->morpheRejectedConsent:Z'], index=1)
        insert('Lcom/horizon/android/feature/consent/ui/ConsentEditorActivity;',
               'onCreate(Landroid/os/Bundle;)V',
               ['invoke-virtual {p0}, Landroid/app/Activity;->finish()V', 'return-void'], index=1)
        sdk = 'Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;'
        insert(sdk, 'renderNextMessageIfAny()V', [
            f'iget-boolean v0, p0, {sdk}->morpheRejectedWithoutUi:Z',
            'if-nez v0, @8',
            'const/4 v0, 0x1',
            f'iput-boolean v0, p0, {sdk}->morpheRejectedWithoutUi:Z',
            f'iget-object v0, p0, {sdk}->messagesToDisplay:Lkotlin/collections/ArrayDeque;',
            'invoke-virtual {v0}, Lkotlin/collections/ArrayDeque;->clear()V',
            f'sget-object v0, {campaign}->GDPR:{campaign}',
            f'invoke-virtual {{p0, v0}}, {sdk}->rejectAll({campaign})V',
            'return-void',
        ])
        insert(sdk, 'onError(Lcom/sourcepoint/cmplibrary/exception/ConsentLibExceptionK;)V',
               ['const/4 v0, 0x0', f'iput-boolean v0, p0, {sdk}->morpheRejectedWithoutUi:Z'], index=1)
    return result
