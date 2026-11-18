"""Private captures and system binaries stay under artifacts; outputs are evidence, not releases."""
from pathlib import Path
import json,struct,subprocess,hashlib
from elftools.elf.elffile import ELFFile
import lief
import argparse
parser=argparse.ArgumentParser(description="Reconstruct both Coffee ARM64 libraries from independent original-signed captures")
parser.add_argument('evidence',type=Path)
parser.add_argument('--first',default='native-2')
parser.add_argument('--second',default='native-3')
parser.add_argument('--serial',required=True)
args=parser.parse_args()
r=args.evidence;adb=str(Path.home()/'AppData/Local/Android/Sdk/platform-tools/adb.exe')
messages=[[json.loads(l).get('payload',{}) for l in (r/f'{i}-trace.jsonl').read_text().splitlines()] for i in [args.first,args.second]]
folder=r/'system-arm64';folder.mkdir(exist_ok=True)
all_reports=[]
for name in ['libunity.so','libil2cpp.so']:
 bases=[int(next(m['base'] for m in ms if m.get('kind')=='base' and m['name']==name),16) for ms in messages]
 assert bases[0]!=bases[1], 'Independent ASLR captures required'
 maps=next(m['maps'] for m in messages[0] if m.get('kind')=='maps' and m['name']==name)
 modules={}
 for line in maps.splitlines():
  parts=line.split()
  if len(parts)>=6 and '/arm64/' in parts[-1] and parts[-1].endswith('.so'):
   # Only the offset-zero mapping is an ELF base (LOAD alignment may add gaps).
   if int(parts[2],16)==0: modules[parts[-1]]=int(parts[0].split('-')[0],16)
 other_maps=next(m['maps'] for m in messages[1] if m.get('kind')=='maps' and m['name']==name)
 other_modules={parts[-1]:int(parts[0].split('-')[0],16) for row in other_maps.splitlines() if len(parts:=row.split())>=6 and parts[-1] in modules and int(parts[2],16)==0}
 symbols={};other_symbols={}
 for path,base in modules.items():
  if 'coffeebusiness' in path:continue
  target=folder/Path(path).name
  if not target.exists():subprocess.run([adb,'-s',args.serial,'pull',path,str(target)],check=True,capture_output=True)
  with target.open('rb') as f:
   elf=ELFFile(f);symtab=elf.get_section_by_name('.dynsym')
   if symtab:
    for s in symtab.iter_symbols():
     if s['st_shndx']!='SHN_UNDEF' and s['st_value']:symbols.setdefault(base+s['st_value'],[]).append(s.name);other_symbols.setdefault(other_modules[path]+s['st_value'],[]).append(s.name)
 libcbase=modules['/system/lib64/arm64/libc.so']
 assert hashlib.sha256((folder/'libc.so').read_bytes()).hexdigest()=='2ff4bf0e733a1103333d0742890d66e88d7aabe05c0f977f3b2d1ae470269b4c', 'Review IFUNC resolver targets for this Android image'
 # IFUNC destinations verified from this emulator libc's resolver instructions.
 for offset,symbol in [(0x443c0,'memmove'),(0x45380,'strnlen'),(0x447c0,'memrchr')]:symbols[libcbase+offset]=[symbol];other_symbols[other_modules['/system/lib64/arm64/libc.so']+offset]=[symbol]
 original=(r/name).read_bytes();patched=bytearray(original)
 with (r/name).open('rb') as f:
  elf=ELFFile(f);loads=[dict(s.header) for s in elf.iter_segments() if s['p_type']=='PT_LOAD']
 limit=max(s['p_vaddr']+s['p_memsz'] for s in loads)
 relative=[];imports=[];unknown=[];constants=0;text_changed=0
 for index,s in enumerate(loads):
  before=(r/f'{args.first}-{name}-before-{index}.bin').read_bytes()
  after=(r/f'{args.first}-{name}-after-{index}.bin').read_bytes()
  second=(r/f'{args.second}-{name}-after-{index}.bin').read_bytes()
  if before==after:continue
  if s['p_flags']&1:
   assert after==second,('code differs',name,index)
   for off,(a,b) in enumerate(zip(before,after)):
    if a!=b:patched[s['p_offset']+off]=b;text_changed+=1
   continue
  for off in range(0,len(before)-7,8):
   a=struct.unpack_from('<Q',before,off)[0];b=struct.unpack_from('<Q',after,off)[0];c=struct.unpack_from('<Q',second,off)[0]
   if a==b:continue
   addr=s['p_vaddr']+off;dest=s['p_offset']+off
   if bases[0]<=b<bases[0]+limit and b-bases[0]==c-bases[1]:
    relative.append((addr,b-bases[0]));struct.pack_into('<Q',patched,dest,0)
   elif b==c:struct.pack_into('<Q',patched,dest,b);constants+=1
   elif b in symbols and c in other_symbols and (shared:=set(symbols[b])&set(other_symbols[c])):
    imports.append((addr,next(symbol for symbol in symbols[b] if symbol in shared)));struct.pack_into('<Q',patched,dest,0)
   else:unknown.append({'offset':hex(addr),'value':hex(b),'value2':hex(c),'module':[p for p,bs in modules.items() if bs<=b<bs+0x200000]})
 report={'library':name,'code_bytes':text_changed,'constants':constants,'relative':len(relative),'imports':imports,'unknown':unknown}
 (r/f'{name}-analysis.json').write_text(json.dumps(report,indent=2));print(name,text_changed,constants,len(relative),len(imports),'unknown',unknown[:10],flush=True)
 if unknown:continue
 pre=r/f'{name}-prelink';pre.write_bytes(patched);binary=lief.parse(str(pre));relocs={x.address:x for x in binary.dynamic_relocations}
 for address,addend in relative:
  if address in relocs:
   reloc=relocs[address];assert reloc.type==lief.ELF.Relocation.TYPE.AARCH64_RELATIVE;reloc.addend=addend
  else:
   reloc=lief.ELF.Relocation(address,lief.ELF.Relocation.TYPE.AARCH64_RELATIVE,lief.ELF.Relocation.ENCODING.RELA);reloc.addend=addend;binary.add_dynamic_relocation(reloc)
 syms={s.name:s for s in binary.dynamic_symbols}
 for address,symbol in imports:
  assert address not in relocs
  if symbol not in syms:
   sym=lief.ELF.Symbol();sym.name=symbol;sym.type=lief.ELF.Symbol.TYPE.FUNC;sym.binding=lief.ELF.Symbol.BINDING.GLOBAL;sym.shndx=0;syms[symbol]=binary.add_dynamic_symbol(sym,lief.ELF.SymbolVersion.global_)
  reloc=lief.ELF.Relocation(address,lief.ELF.Relocation.TYPE.AARCH64_JUMP_SLOT,lief.ELF.Relocation.ENCODING.RELA);reloc.symbol=syms[symbol];binary.add_pltgot_relocation(reloc)
 binary.remove(lief.ELF.DynamicEntry.TAG.INIT);binary.write(str(r/f'{name}-restored'))
 report['input_sha256']=hashlib.sha256(original).hexdigest();report['output_sha256']=hashlib.sha256((r/f'{name}-restored').read_bytes()).hexdigest();all_reports.append(report)
(r/'native-restoration.json').write_text(json.dumps(all_reports,indent=2))
