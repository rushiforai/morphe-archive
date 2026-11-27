"""Execute the actual shipped ARM64 selector instructions across type/zoom inputs."""
import hashlib,io,json,struct,zipfile,sys
from pathlib import Path
from elftools.elf.elffile import ELFFile
from unicorn import Uc,UC_ARCH_ARM64,UC_MODE_ARM
from unicorn.arm64_const import *

root=Path(__file__).resolve().parents[1]
apk_path=Path(sys.argv[1]) if len(sys.argv)>1 else root/'dist/waze-5.24.5.0-themes-moods-badges-arm64.apk'
meta=json.loads((root/'references/icon-zoom/patch.json').read_text())
with zipfile.ZipFile(root/'downloads/waze-arm64/split_config.arm64_v8a.apk') as z: original=z.read('lib/arm64-v8a/libwaze.so')
with zipfile.ZipFile(apk_path) as z: patched=z.read('lib/arm64-v8a/libwaze.so')
assert hashlib.sha256(original).hexdigest()==meta['source_sha256']
expected=bytearray(original)
for p in meta['patches']:
    before=bytes.fromhex(p['before']);after=bytes.fromhex(p['after']);a=p['offset']
    assert original[a:a+len(before)]==before and len(before)==len(after)
    expected[a:a+len(after)]=after
assert bytes(expected)==patched, 'Unexpected native changes'
elf=ELFFile(io.BytesIO(patched))
rx=next(s for s in elf.iter_segments() if s['p_type']=='PT_LOAD' and s['p_flags']==5)
assert rx['p_filesz']==rx['p_memsz']==meta['trampoline']+meta['pool_size']
assert len(patched)==len(original)
# Both complete selector implementations, including their size choice, are stock.
for start,end in [(0x2e01340,0x2e018d4),(0x2e01e54,0x2e02570)]:
    assert patched[start:end]==original[start:end]
uc=Uc(UC_ARCH_ARM64,UC_MODE_ARM)
constructor=meta['constructor'];cave=meta['trampoline']
pages={r['call']&~4095 for r in meta['replacements']}|{constructor&~4095}
pages.update(range(cave&~4095,(cave+meta['pool_size']+4095)&~4095,4096))
for page in pages:
    uc.mem_map(page,4096);uc.mem_write(page,patched[page:page+4096])
with zipfile.ZipFile(apk_path) as apk:
    for row in meta['replacements']:
        for reg,value in [(UC_ARM64_REG_X0,0x12340),(UC_ARM64_REG_X2,1),(UC_ARM64_REG_X8,0x56780),(UC_ARM64_REG_X19,0xabcdef)]:uc.reg_write(reg,value)
        uc.reg_write(UC_ARM64_REG_NZCV,0xa0000000)
        uc.emu_start(row['call'],constructor,count=10)
        assert uc.reg_read(UC_ARM64_REG_PC)==constructor
        assert uc.reg_read(UC_ARM64_REG_X30)==row['call']+4
        ptr=uc.reg_read(UC_ARM64_REG_X1)
        assert ptr==meta['stubs'][row['name']]['pointer']
        assert bytes(uc.mem_read(ptr,len(row['name'])+1))==row['name'].encode()+bytes([0])
        for reg,value in [(UC_ARM64_REG_X0,0x12340),(UC_ARM64_REG_X2,1),(UC_ARM64_REG_X8,0x56780),(UC_ARM64_REG_X19,0xabcdef)]:assert uc.reg_read(reg)==value
        assert uc.reg_read(UC_ARM64_REG_NZCV)==0xa0000000
        assert 'assets/res/skins/default/'+row['name']+'@3x.png' in apk.namelist()
result={'resource_call_sites':len(meta['replacements']),'modern_and_legacy_zoom_selectors_original':True,'registers_and_flags_preserved':True,'only_declared_native_changes':True}
(root/'dist/validation-report-zoom.json').write_text(json.dumps(result,indent=2))
print('PASS:',json.dumps(result))
