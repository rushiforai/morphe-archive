"""Check all Buienalarm controls against an independently decoded publisher input."""
import argparse
from contextlib import contextmanager
from pathlib import Path
import subprocess
import tempfile
import xml.etree.ElementTree as ET

from atv_smali import class_methods
from verify_decoded import verify as verify_ads
from verify_google_compatibility import verify as verify_google
from verify_privacy import method, verify as verify_privacy

NAMES = {'Fix Google services', 'Hide ads', 'Hide Premium banner', 'Disable tracking', 'Skip consent screens'}
CERTIFICATE = '057057399eda86a88f79726f9686cd224aa2ca98761a380deebb7d1df9e462b4'
A = '{http://schemas.android.com/apk/res/android}'


@contextmanager
def publisher_reference(reference):
    if reference.is_dir():
        yield reference
        return
    with tempfile.TemporaryDirectory(prefix='buienalarm-reference-') as scratch:
        root=Path(scratch)/'decoded'
        result=subprocess.run(['apktool','d','-f','-o',str(root),str(reference)],
                              stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
        assert result.returncode==0,'Decode publisher reference: '+result.stdout[-2000:]
        yield root


def verify_retained(root, original):
    for cls in ['com/revenuecat/purchases/identity/IdentityManager',
                'com/revenuecat/purchases/PostReceiptHelper', 'com/meteoplaza/api/android/a']:
        actual=list(root.glob('smali*/'+cls+'.smali'))
        expected=list(original.glob('smali*/'+cls+'.smali'))
        assert len(actual)==len(expected)==1,cls
        assert class_methods(actual[0])==class_methods(expected[0]),'Preserve identity, receipt callbacks and weather: '+cls
    for cls,sig in [('io/didomi/sdk/Didomi','setUserAgreeToAll()Z'),
                    ('io/didomi/sdk/Didomi','setUserDisagreeToAll()Z'),
                    ('io/didomi/sdk/Didomi','setCurrentUserStatus(Lio/didomi/sdk/models/CurrentUserStatus;)Z'),
                    ('w77','o(Landroidx/preference/Preference;)Z')]:
        assert method(root,cls,sig)==method(original,cls,sig),'Preserve consent storage/manual Privacy: '+sig
    for resource in ['res/xml/network_security_config.xml','res/xml/remote_config_defaults.xml']:
        assert ET.tostring(ET.parse(root/resource).getroot())==ET.tostring(ET.parse(original/resource).getroot()),resource


def verify(root, selected, original):
    assert selected<=NAMES,selected-NAMES
    tracking=bool(selected&{'Disable tracking','Skip consent screens'})
    consent='Skip consent screens' in selected
    ads=tracking or 'Hide ads' in selected
    verify_ads(root,ads,'Hide Premium banner' in selected)
    verify_retained(root,original)
    if selected:
        verify_google(root,CERTIFICATE)
    else:
        assert not list(root.glob('smali*/patches/buienalarm/extension/SignatureCompatibility.smali')),'Original has no injected compatibility helper'
    if tracking:
        verify_privacy(root,original,consent)
    else:
        # Test absence of tracking effects for Google-only, ads-only and
        # Premium-only output as well as the pristine publisher input.
        for cls,sig in [('bk2','a(Lny2;Ljava/lang/String;)V'),('du3','c(Lze8;)V'),
                        ('xe8','invoke()V'),('zf2','invoke()V'),('io','b(Lsoa;Lvq6;)V'),
                        ('q43','a(Ljava/lang/String;Landroid/os/Bundle;)V'),
                        ('u20','d(ILjava/lang/String;Ljava/lang/String;ZZ)V')]:
            assert method(root,cls,sig)==method(original,cls,sig),'Unselected telemetry body changed: '+cls
        metadata={node.get(A+'name'):node.get(A+'value') for node in ET.parse(root/'AndroidManifest.xml').iter('meta-data')}
        assert metadata.get('firebase_analytics_collection_deactivated')!='true'
        for asset in ['containers/GTM-P87V6J8.json','audience_network/classes.dex','omsdk-v1.js','openwrapsdk.js','gdpr-mobile-liveramp.json']:
            assert (root/'assets'/asset).read_bytes()==(original/'assets'/asset).read_bytes(),'Unselected tracking asset: '+asset
    if not consent:
        for cls,sig in [('a51','a()Z'),('org/yoki/android/buienalarm/activity/FirstRunActivity','D()V')]:
            assert method(root,cls,sig)==method(original,cls,sig),'Unselected consent flow changed'
    print('PASS Buienalarm: '+(', '.join(sorted(selected)) or 'original'))


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded',type=Path)
    parser.add_argument('--original',type=Path,required=True)
    parser.add_argument('-e',action='append',choices=sorted(NAMES),default=[])
    args=parser.parse_args()
    with publisher_reference(args.original) as original:
        verify(args.decoded,set(args.e),original)


if __name__=='__main__':
    main()
