"""Check Android discovery payload in the version-resolved Bstation bundle."""
from pathlib import Path
import hashlib
import sys
import zipfile

repo = Path(__file__).resolve().parents[1]
version = next(line.split('=', 1)[1].strip() for line in
               (repo / 'gradle.properties').read_text().splitlines() if line.startswith('version'))
path = Path(sys.argv[1]) if len(sys.argv) > 1 else repo / f'patches/build/libs/patches-{version}.mpp'
with zipfile.ZipFile(path) as bundle:
    assert bundle.testzip() is None, 'Invalid bundle ZIP'
    dex = bundle.read('classes.dex')
    assert dex[:4] == b'dex\n' and dex[7] == 0, 'Invalid DEX header'
    for owner, getter in (
        ('ads/RemoveAdsPatchKt', 'getRemoveAdsPatch'),
        ('ui/CleanInterfacePatchKt', 'getCleanInterfacePatch'),
        ('player/CleanPlayerPatchKt', 'getCleanPlayerPatch'),
        ('content/RemoveUserContentPatchKt', 'getRemoveUserContentPatch'),
        ('tracking/DisableTrackingPatchKt', 'getDisableTrackingPatch'),
        ('gmscore/GmsCoreSupportPatchKt', 'getGmsCoreSupportPatch'),
    ):
        assert f'Lid/ikuradachi/patches/bstation/{owner};'.encode() + b'\0' in dex, owner
        assert getter.encode() + b'\0' in dex, getter
    for obsolete in (
        'getFeedAdsPatch', 'getFloatingAdsPatch', 'getInnerPushPatch', 'getRatingPromptsPatch',
        'getSplashAdsPatch', 'getUnderPlayerAdsPatch', 'getHideUserInteractionsPatch',
        'getOverlayAdsPatch', 'getPlayerOutroPatch', 'getPlayerRecommendPatch',
        'getPlayerWatermarkPatch', 'getCleanMePagePatch', 'getDebloatSearchPagePatch',
        'getHideBottomNavItemsPatch', 'getHideHomeSearchBarPatch', 'getHideHomeTabBarItemsPatch',
        'getPureDiscoverSearchBarPatch',
    ):
        assert obsolete.encode() + b'\0' not in dex, f'Stale registration: {obsolete}'
print(f'PASS: Android DEX contains six current registrations; SHA-256 {hashlib.sha256(path.read_bytes()).hexdigest()}')
