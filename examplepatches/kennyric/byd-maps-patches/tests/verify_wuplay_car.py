"""Independent decoded-APK audit for the mobile car integration."""
import argparse
from pathlib import Path
import zipfile
from atv_smali import classes,methods
from verify_wuplay import without_instruction

OWNER='Lapp/wuplay/androidtv/AppContainer;-><init>(Lapp/wuplay/android/MobileApplication;Ljava/lang/Integer;)V'
SIGNER='const-string v3, "ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f"'

def verify(original,patched,original_apk,patched_apk):
    before,after=methods(original),methods(patched)
    old,new=classes(original),classes(patched)
    assert set(old)<=set(new),'Original classes removed'
    assert set(before)<=set(after),'Original methods removed'
    native_additions={key for key in set(after)-set(before) if key.split('->',1)[0] in old}
    expected_additions={
        'Landroidx/core/graphics/drawable/IconCompat;->getType()I',
        'Landroidx/core/graphics/drawable/IconCompat;->getUri()Landroid/net/Uri;',
        'Landroidx/core/graphics/drawable/IconCompat;->toBundle()Landroid/os/Bundle;',
        'Landroidx/core/graphics/drawable/IconCompat;->createFromBundle(Landroid/os/Bundle;)Landroidx/core/graphics/drawable/IconCompat;',
        'Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V',
    }
    assert native_additions==expected_additions,f'Unexpected native ABI additions: {native_additions ^ expected_additions}'
    changed=[key for key,value in before.items() if after[key]!=value]
    assert changed==[OWNER],f'Unexpected native method changes: {changed}'
    body=after[OWNER]
    assert body.count(SIGNER)==1,'Original registration metadata not retained exactly once'
    assert without_instruction(body,body.index(SIGNER))==before[OWNER],'Unrelated native container change'
    added=set(new)-set(old)
    allowed=('Lnl/johninnl/wuplaycar/','Landroidx/car/app/','Landroidx/core/app/Person')
    assert added and all(name.startswith(allowed) for name in added),f'Unexpected dependency classes: {sorted(name for name in added if not name.startswith(allowed))}'
    for name in ('WuplayCarService','NativePlayer','NativeData','CarVideoRenderer','ProfileAccess','CatalogWindow','NavigationStack','VideoViewport','HostPackages'):
        assert f'Lnl/johninnl/wuplaycar/{name};' in added,name
    with zipfile.ZipFile(original_apk) as a,zipfile.ZipFile(patched_apk) as b:
        native=[name for name in a.namelist() if name.startswith('lib/')]
        assert native and all(a.read(name)==b.read(name) for name in native),'Native library changed'
        for name in b.namelist():
            if name.endswith('.dex'):assert b.read(name)[:8]==b'dex\n037\x00','DEX version changed'
        for name in ('NOTICE.txt','Apache-2.0.txt'):
            assert b.getinfo('assets/morphe-wuplay-car/'+name).file_size>100,'Missing license asset'
    print(f'PASS: {len(old)} original classes, {len(before)} original methods preserved; one scoped metadata constant and five additive ABI bridges; {len(added)} allowed extension/Car/Person classes; native libraries and DEX037 preserved')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original',type=Path);parser.add_argument('patched',type=Path)
    parser.add_argument('original_apk',type=Path);parser.add_argument('patched_apk',type=Path)
    args=parser.parse_args();verify(args.original,args.patched,args.original_apk,args.patched_apk)
