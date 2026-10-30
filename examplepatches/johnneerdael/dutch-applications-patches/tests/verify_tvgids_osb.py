"""Verify the native OSB checkpoint; this is not full Dart/SDK tracking coverage."""
import argparse
import hashlib
from pathlib import Path
from dex_declarations import DexDeclarations
from tvgids_ad_edits import AD_VIEW_EDITS
from tvgids_android_contracts import verify_android_baseline
from tvgids_android_vm import verify_ad_views
from tvgids_osb_edits import OSB_EDITS
from tvgids_osb_vm import OsbFixture,verify_osb
from tvgids_native_contracts import ORIGINAL_SHA
from verify_dumpert import Smali
from verify_parool import sdk_classes


def verify(root,apk,original,*,ads=False,osb=False,background=False):
    assert hashlib.sha256(original.read_bytes()).hexdigest()==ORIGINAL_SHA
    edits=(AD_VIEW_EDITS if ads else [])+(OSB_EDITS if osb else [])
    assert not background or ads,'Background checkpoint requires the prior ad policy'
    verify_android_baseline(root,apk,edits,ads=ads,original_apk=original,tracking=background)
    source=Smali(root);declarations=DexDeclarations.from_apk(apk);sdk,archive=sdk_classes()
    try:
        verify_ad_views(source,declarations,sdk,ads)
        for group in ('ids','events','location','queue','late','channel'):
            verify_osb(OsbFixture(source,declarations,sdk),osb,group)
    finally:archive.close()
    if ads:
        from verify_tvgids_boxes import verify_native_ad_paths
        verify_native_ad_paths(original,apk,tracking=background)
    else:
        from verify_tvgids import verify_original_native
        verify_original_native(apk)
    if background:
        import zipfile
        from tvgids_tracking_vm import run_background_continuation
        from tvgids_native_contracts import NATIVE_SHA
        assertions=0
        with zipfile.ZipFile(original) as before,zipfile.ZipFile(apk) as after:
            for abi in NATIVE_SHA:
                name=f'lib/{abi}/libapp.so'
                assertions+=run_background_continuation(abi,before.read(name),after.read(name))
        print(f'PASS background post-setup continuation and typed Future: {assertions} assertions across3ABIs')
    print('PASS TVgids tracking checkpoint; Comscore/Sentry and complete SDK coverage remain separate')


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('root',type=Path)
    p.add_argument('--apk',type=Path,required=True);p.add_argument('--original',type=Path,required=True)
    p.add_argument('--ads-disabled',action='store_true');p.add_argument('--osb-disabled',action='store_true')
    p.add_argument('--background-disabled',action='store_true')
    a=p.parse_args();verify(a.root,a.apk,a.original,ads=a.ads_disabled,osb=a.osb_disabled,background=a.background_disabled)
