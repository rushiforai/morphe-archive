"""Verify VI5.13.52 original graphs and selected emitted article behavior."""
import argparse
import hashlib
import subprocess
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from brabant_smali import canonical
from brabant_effects import restore_edits, restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali, audit_call
from verify_parool import sdk_classes
from vi_contracts import ARTICLE_CONTRACTS, BASE_SHA256
from vi_article_edits import ARTICLE_EDITS
from vi_ads_contracts import ADS_CONTRACTS
from vi_ads_edits import ADS_EDITS
from vi_ads_vm import AdsFixture
from vi_player_contracts import PLAYER_SHA256, ADS_ANCHOR, ADS_REPLACEMENT, ANALYTICS_ANCHOR, ANALYTICS_REPLACEMENT, MANIFEST_SHA256
from vi_tracking_contracts import TRACKING_CONTRACTS
from vi_tracking_edits import TRACKING_EDITS
from vi_dispatch_vm import DispatchFixture,CCT,FILTER
from verify_vi_tracking import verify_provider_policies,verify_identifiers
from verify_vi_dispatch import verify_dispatch
from vi_consent_vm import ConsentFixture
from vi_consent_edits import CONSENT_EDITS
from verify_vi_consent import verify_consent
from verify_vi_ads import verify_ads
from vi_vm import Fixture, SENDER, HELPER, REDIRECT_HELPER
from verify_vi_redirects import verify_redirects
from vi_marketing_contracts import CONTRACTS as MARKETING_CONTRACTS,RESPONSE,FILTER as MARKETING_FILTER
from vi_marketing_edits import EDITS as MARKETING_EDITS
from verify_vi_marketing import MarketingFixture,verify_marketing
from verify_vi_articles import verify_scope, verify_generator, verify_routes, verify_sender, verify_sender_coroutine, verify_overlay, verify_cache

NAMES={'Read full articles','Hide ads','Disable tracking','Skip consent screens'}


def verify(root, selected, apk):
    assert selected<=NAMES, 'Unknown VI control'
    enabled='Read full articles' in selected
    ads='Hide ads' in selected
    tracking='Disable tracking' in selected
    consent='Skip consent screens' in selected
    assert not tracking or ads, 'VI tracking dependency missing'
    assert not consent or tracking, 'VI consent dependency missing'
    source=Smali(root);decl=DexDeclarations.from_apk(apk)
    if not selected:assert decl.source_sha256==BASE_SHA256, 'VI original APK identity'
    sdk,archive=sdk_classes()
    try:
        contracts=list({r[:2]:r for r in ARTICLE_CONTRACTS+ADS_CONTRACTS+TRACKING_CONTRACTS+MARKETING_CONTRACTS}.values())
        owned=(ARTICLE_EDITS if enabled else [])+(ADS_EDITS+MARKETING_EDITS if ads else [])+(TRACKING_EDITS if tracking else [])+(CONSENT_EDITS if consent else [])
        for row in contracts:
            owner,sig,flags,local,count,digest=row
            actual=decl.classes[owner].methods[sig]
            body=source.body(owner,sig);value=canonical(body)
            assert actual.access_flags==flags and int(re.search(r'\.locals (\d+)',body)[1])==local, 'VI original method ABI'
            edits=[e for e in owned if (e['owner'],e['signature'])==(owner,sig)]
            if edits:value=restore_alignment(restore_edits(value,edits,local),count)
            if tracking and owner=='Lnl/vi/core/ads/config/AdsIDFetcher$fetchAdID$1;' and sig=='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;':
                # The inserted unavailable-result path crosses the short-goto
                # encoding limit. Its original target and every handler remain.
                assert value.code[13] in {'goto @70','goto/16 @70'}
                value.code[13]='goto @70'
            assert len(value.code)==count and value.digest()==digest, 'VI retained original graph: '+owner+'->'+sig
        helper=decl.classes[SENDER].methods.get(HELPER)
        assert bool(helper)==enabled, 'VI article helper selection'
        actual={s for s in decl.classes[SENDER].methods if s.startswith('morphe')}
        assert actual==({HELPER,REDIRECT_HELPER} if enabled else set()), 'VI unexpected helper'
        for sig in actual:
            body=source.body(SENDER,sig)
            assert decl.classes[SENDER].methods[sig].access_flags==9 and re.search(r'\.locals (\d+)',body)[1]=='3'
            value=canonical(body)
            assert not value.switches and not value.handlers and not value.arrays
            for line in value.code:audit_call(line,SENDER,decl,sdk)
        cct_helper=decl.classes[CCT].methods.get(FILTER)
        assert bool(cct_helper)==tracking, 'VI measurement helper selection'
        if cct_helper:
            assert cct_helper.access_flags==9 and re.search(r'\.locals (\d+)',source.body(CCT,FILTER))[1]=='5'
            for line in canonical(source.body(CCT,FILTER)).code:audit_call(line,CCT,decl,sdk)
        marketing_helpers={s for s in decl.classes[RESPONSE].methods if s.startswith('morphe')}
        assert marketing_helpers==({MARKETING_FILTER} if ads else set()), 'VI marketing helper selection'
        if ads:
            body=source.body(RESPONSE,MARKETING_FILTER)
            assert decl.classes[RESPONSE].methods[MARKETING_FILTER].access_flags==9 and re.search(r'\.locals (\d+)',body)[1]=='4'
            value=canonical(body)
            assert not value.switches and not value.handlers and not value.arrays
            for line in value.code:audit_call(line,RESPONSE,decl,sdk)
        f=MarketingFixture(source,decl,sdk)
        verify_scope(f,enabled);verify_generator(f,enabled);verify_sender(f,enabled)
        verify_sender_coroutine(f,enabled)
        verify_redirects(f,enabled)
        verify_overlay(f,enabled);verify_cache(f,enabled)
        if enabled:verify_routes(f)
        verify_ads(f,ads)
        verify_marketing(f,ads)
        verify_provider_policies(f,tracking);verify_identifiers(f,tracking);verify_dispatch(f,tracking)
        verify_consent(f,consent)
    finally:archive.close()
    manifest=ET.parse(root/'AndroidManifest.xml').getroot()
    assert manifest.get('package')=='nl.vi'
    script=(root/'assets/jwplayer/jwplayer.js').read_text()
    modules=(root/'assets/jwplayer/manifest').read_text()
    if tracking:
        assert script.count(ANALYTICS_REPLACEMENT)==1, 'VI JW analytics activation gate missing'
        script=script.replace(ANALYTICS_REPLACEMENT,ANALYTICS_ANCHOR)
        assert 'local-player://jwpsrv.js\n' not in modules
        modules=modules.replace('local-player://jwplayer.core.js\n','local-player://jwplayer.core.js\nlocal-player://jwpsrv.js\n')
    assert hashlib.sha256(modules.encode()).hexdigest()==MANIFEST_SHA256, 'VI retained player modules changed'
    if ads:
        assert script.count(ADS_REPLACEMENT)==1, 'VI JW ad activation gate missing'
        script=script.replace(ADS_REPLACEMENT,ADS_ANCHOR)
    assert hashlib.sha256(script.encode()).hexdigest()==PLAYER_SHA256, 'VI retained JW player asset changed'
    if tracking:
        ns='{http://schemas.android.com/apk/res/android}'
        flags={e.get(ns+'name'):e.get(ns+'value') for e in manifest.find('application').findall('meta-data')}
        assert flags.get('firebase_analytics_collection_deactivated')=='true'
        for name in ('firebase_analytics_collection_enabled','google_analytics_adid_collection_enabled','google_analytics_automatic_screen_reporting_enabled','firebase_crashlytics_collection_enabled','firebase_performance_collection_enabled','firebase_sessions_enabled','delivery_metrics_exported_to_big_query_enabled','com.facebook.sdk.AutoLogAppEventsEnabled','com.facebook.sdk.AdvertiserIDCollectionEnabled'):
            assert flags.get(name)=='false', 'VI provider metadata: '+name
        permissions={e.get(ns+'name') for e in manifest.findall('uses-permission')}
        assert {'android.permission.INTERNET','android.permission.POST_NOTIFICATIONS','com.android.vending.BILLING'}<=permissions
        assert not any('AD_ID' in p or 'ADSERVICES' in p or 'AD_SERVICES' in p or 'INSTALL_REFERRER' in p for p in permissions)
        assert ET.parse(root/'res/xml/ga_ad_services_config.xml').getroot().find('attribution').get('allowAllToAccess')=='false'
    subprocess.run(['node',str(Path(__file__).with_name('verify_vi_player.cjs')),str(root),'tracking' if tracking else 'ads' if ads else 'original'],check=True)
    print('PASS VI:',', '.join(sorted(selected)) or 'original',f'({len(contracts)} method contracts)')


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('root',type=Path);p.add_argument('--apk',type=Path,required=True)
    p.add_argument('-e',action='append',default=[],choices=sorted(NAMES))
    args=p.parse_args();verify(args.root,set(args.e),args.apk)
