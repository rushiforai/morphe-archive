"""Check private genuine onboarding metadata without retaining signed actions/prose."""
import base64
import hashlib
import json
import os
from pathlib import Path


def summarize(payload):
    modal=payload['data']['screenByEntryPoint']['modalSheet']
    assert modal['__typename']=='OnboardingSheet'
    result=[]
    for screen in modal['screens']:
        row={'id':screen['id'],'blocks':len(screen['firstBlockPage']['blocks']),'variables':screen['variables'],'actions':screen.get('actions'),
             'bff_show':[{'eventType':v['eventType'],'data':v['data']} for v in screen['trackers']['show'] if v['__typename']=='BFFEvent'],
             'dismiss':[],'toggles':[],'login_targets':0}
        for b in screen['firstBlockPage']['blocks']:
            link=b.get('link') or {};target=link.get('target') or b.get('target') or {};flavor=link.get('linkFlavor') or {}
            if target.get('__typename')=='DismissTarget':
                row['dismiss'].append({'success':target['successTarget'],'failure':target['failureTarget'],
                    'activation_types':[v['__typename'] for v in (target.get('trackers') or {}).get('activate') or []]})
            if target.get('__typename')=='LoginTarget':row['login_targets']+=1
            if flavor.get('__typename')=='ToggleLinkFlavor':
                # Only the unsigned action shape/flags are summarized. Its
                # publisher-signed action and nested forward IDs stay private.
                operation,encoded,_=target['action'].split('/',2)
                args=json.loads(base64.b64decode(encoded))
                row['toggles'].append({'id':b['id'],'enabled':flavor['enabled'],'target':target['__typename'],
                    'permissions':target['permissions'],'operation':operation,'subscribe':args['subscribe'],
                    'inWncScreen':args['inWncScreen'],'inSettingsScreen':args['inSettingsScreen']})
        result.append(row)
    assert modal['screenIds']==[v['id'] for v in result]
    return result


def verify():
    path=Path(os.environ.get('NUNL_ONBOARDING_SOURCE',str(Path(os.environ.get('TMPDIR','/tmp'))/'re/nunl/onboarding-native-cookies.json')))
    if not path.is_file():
        assert os.environ.get('NUNL_REQUIRE_ONBOARDING_SOURCE')!='1','Required private original NU onboarding response missing'
        print('SKIP private NU onboarding metadata (set NUNL_ONBOARDING_SOURCE)');return
    saved=json.loads(Path(__file__).with_name('nunl_onboarding_evidence.json').read_text())
    raw=path.read_bytes();assert hashlib.sha256(raw).hexdigest()==saved['response_sha256'],'Original independently acquired onboarding response digest'
    actual=summarize(json.loads(raw));assert actual==saved['cards'],'Original card/button/default/action-shape evidence'
    from nunl_onboarding import PUSH,LOGIN,TOPIC
    assert [row['id'] for row in actual]==[PUSH,LOGIN,TOPIC],'Genuine source IDs agree with actual policy fixtures'
    push,login,topic=actual
    assert push['variables'] is None and push['actions'] is None and login['variables'] is None and login['actions'] is None,'No automatic on-show account/push mutation in received cards'
    assert len(push['toggles'])==3 and all(not v['enabled'] for v in push['toggles']),'Fresh genuine notification defaults are all OFF'
    assert all(v['permissions']==['NOTIFICATION'] and v['operation']=='followTagSubscriptionWithNotification' and v['subscribe'] for v in push['toggles']),'Positive permission/subscription is attached to explicit original toggle targets'
    assert len(push['dismiss'])==len(login['dismiss'])==1 and all(v['success'] is None and v['failure'] is None and v['activation_types']==['FirebaseTrackingEvent'] for c in [push,login] for v in c['dismiss']),'Both genuine continue buttons are plain Dismiss targets with analytics-only activation'
    assert login['login_targets']>=1 and topic['blocks']==4,'Keep genuine explicit login and topic-selection content'
    print('PASS genuine NU onboarding metadata: 3 OFF toggles, 2 ordinary dismiss buttons, original login/topics')
