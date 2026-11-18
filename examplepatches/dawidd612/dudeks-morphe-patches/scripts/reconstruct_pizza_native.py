"""Reconstruct Pizza 5.57.3 ARM64 initialization from original-process evidence.
Usage: python scripts/reconstruct_pizza_native.py EVIDENCE_DIRECTORY
Requires lief==1.0.0 and pyelftools==0.33; see docs/pizza-bootstrap.md.
"""
from pathlib import Path
import json,struct,collections
from elftools.elf.elffile import ELFFile
import lief
import sys
r=Path(sys.argv[1])
messages=[json.loads(l).get('payload',{}) for l in (r/'dump-native-messages.jsonl').read_text().splitlines()]
first=[json.loads(l).get('payload',{}) for l in (r/'dump-native-messages-first.jsonl').read_text().splitlines()]
base=int([m['base'] for m in messages if m.get('kind')=='native-base'][-1],16)
base_first=int([m['base'] for m in first if m.get('kind')=='native-base'][-1],16)
original=(r/'libcocos2dcpp.so').read_bytes();patched=bytearray(original)
with (r/'libcocos2dcpp.so').open('rb') as f:
 elf=ELFFile(f);loads=[dict(s.header) for s in elf.iter_segments() if s['p_type']=='PT_LOAD']
def fileoff(address):
 for s in loads:
  if s['p_vaddr']<=address<s['p_vaddr']+s['p_filesz']:return s['p_offset']+address-s['p_vaddr']
 raise ValueError(hex(address))
# Exact executable bytes agree across two independent original process starts.
a=(r/'native-before-6.bin').read_bytes();b=(r/'native-after-6.bin').read_bytes();assert b==(r/'native-after-6-first.bin').read_bytes()
text_changed=sum(x!=y for x,y in zip(a,b))
for i,(x,y) in enumerate(zip(a,b)):
 if x!=y:patched[i]=y
# Restore data constants; express original ASLR-dependent pointers as ELF relocs.
a=(r/'native-before-1.bin').read_bytes();b=(r/'native-after-1.bin').read_bytes();b_first=(r/'native-after-1-first.bin').read_bytes()
relative=[];constant=0
for offset in range(0,len(a)-7,8):
 before=struct.unpack_from('<Q',a,offset)[0];after=struct.unpack_from('<Q',b,offset)[0];previous=struct.unpack_from('<Q',b_first,offset)[0]
 if before==after:continue
 address=0x2205f80+offset
 if base<=after<base+0x2345000 and after-base==previous-base_first:
  relative.append((address,after-base));struct.pack_into('<Q',patched,fileoff(address),0)
 elif after==previous:
  struct.pack_into('<Q',patched,fileoff(address),after);constant+=1
 else:raise AssertionError(f'Unclassified runtime-dependent data at {address:x}: {after:x} {previous:x}')
(r/'native-restored-prelink.so').write_bytes(patched)
imports=json.loads((r/'native-imports-resolved.json').read_text())
unknown=json.loads((r/'native-imports-unknown.json').read_text());assert len(unknown)==1 and unknown[0]['offset']==0x2201080
imports.append(dict(offset=0x2201080,symbols=[['/system/lib64/arm64/libc.so','memmove']]))
binary=lief.parse(str(r/'native-restored-prelink.so'))
relocations={x.address:x for x in binary.dynamic_relocations}
for address,addend in relative:
 if address in relocations:
  reloc=relocations[address];assert reloc.type==lief.ELF.Relocation.TYPE.AARCH64_RELATIVE;reloc.addend=addend
 else:
  reloc=lief.ELF.Relocation(address,lief.ELF.Relocation.TYPE.AARCH64_RELATIVE,lief.ELF.Relocation.ENCODING.RELA);reloc.addend=addend;binary.add_dynamic_relocation(reloc)
symbols={s.name:s for s in binary.dynamic_symbols}
for entry in imports:
 name=entry['symbols'][0][1]
 if name not in symbols:
  sym=lief.ELF.Symbol();sym.name=name;sym.type=lief.ELF.Symbol.TYPE.FUNC;sym.binding=lief.ELF.Symbol.BINDING.GLOBAL;sym.shndx=0
  symbols[name]=binary.add_dynamic_symbol(sym,lief.ELF.SymbolVersion.global_)
 reloc=lief.ELF.Relocation(entry['offset'],lief.ELF.Relocation.TYPE.AARCH64_JUMP_SLOT,lief.ELF.Relocation.ENCODING.RELA);reloc.symbol=symbols[name];binary.add_pltgot_relocation(reloc)
assert binary.get(lief.ELF.DynamicEntry.TAG.INIT).value==0x2278000
binary.remove(lief.ELF.DynamicEntry.TAG.INIT)
binary.write(str(r/'libcocos2dcpp-restored.so'))
report={'restored_executable_bytes':text_changed,'data_relative_relocations':len(relative),'constant_qwords':constant,'restored_imports':len(imports),'removed_constructor':'DT_INIT=0x2278000','method':'original-runtime snapshots; two-run constant/ASLR verification'}
(r/'native-reconstruction.json').write_text(json.dumps(report,indent=2));print(report)
