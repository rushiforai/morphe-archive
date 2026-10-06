from pathlib import Path
root=Path(r'E:\Projects\morphe-caption-v2'); source=root/'tools/n30/verify_host_resources.py'; code=source.read_text(encoding='utf-8-sig')
replacements={
"mpp = root / f'build/local-test/patches-1.3.5-{name}-n30.mpp'":"mpp = root / 'build/local-test/patches-1.3.5-local-n37-candidate-04.mpp'",
"mpe = root / f'build/local-test/extension-1.3.5-{name}-n30.mpe'":"mpe = root / 'build/local-test/extension-1.3.5-local-n37-candidate-04.mpe'",
"apk = root / f'build/n30-composition-final/YouTube-21.16.256-{name}-n30-unsigned.apk'":"apk = root / '.verification/n37/composition-candidate-04/patched-unsigned.apk'",
"records = root / '.verification/n30/delivery-records'":"records = root / '.verification/n37/resources-02'"}
for old,new in replacements.items():assert code.count(old)==1;code=code.replace(old,new)
exec(compile(code,str(source),'exec'),{'__file__':str(source),'__name__':'__main__'})
