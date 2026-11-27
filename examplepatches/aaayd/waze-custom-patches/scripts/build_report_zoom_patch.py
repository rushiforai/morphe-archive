"""Legacy 5.24.5.0 asset generator. New renderer discovery lives in ci/native_icons.py."""
import hashlib,io,json,re,struct,zipfile
from pathlib import Path
from capstone import Cs,CS_ARCH_ARM64,CS_MODE_ARM
from elftools.elf.elffile import ELFFile
from PIL import Image
root=Path(__file__).resolve().parents[1]
with zipfile.ZipFile(root/'downloads/waze-arm64/split_config.arm64_v8a.apk') as z: original=z.read('lib/arm64-v8a/libwaze.so')
digest=hashlib.sha256(original).hexdigest()
assert digest=='2b7cbd6c31b0cdac691dd0df6abf9639fa4feb2e9dd3923f99ce0774ca122c95'
# Recover each static resource table from its original string-constructor calls.
regs={};calls=[];groups=[]
for ins in Cs(CS_ARCH_ARM64,CS_MODE_ARM).disasm(original[0x2dfa698:0x2e00ba4],0x2dfa698):
    op=ins.op_str.split(', ')
    if ins.mnemonic in ('adrp','adr') and len(op)==2:regs[op[0]]=int(op[1][1:],16)
    elif ins.mnemonic=='add' and len(op)==3 and op[2].startswith('#'):regs[op[0]]=regs.get(op[1],-0x100000000)+int(op[2][1:],0)
    elif ins.mnemonic=='mov' and len(op)==2:regs[op[0]]=regs.get(op[1],-1)
    elif ins.mnemonic=='bl' and op[0]=='#0x2dfa63c':
        a=regs.get('x1',-1)
        if 0<a<0x3000000:calls.append(dict(call=ins.address,name=original[a:a+200].split(bytes([0]))[0].decode()))
    elif ins.mnemonic=='bl' and op[0]=='#0x2dfa658':
        if any(c['name']=='smallpin_hazard' for c in calls):groups.append(calls.copy())
        calls=[]
assert len(groups)==25
replacements=[];aliases={}
for group in groups:
    assert len(group) in (4,5,6)
    detail=next(c['name'] for c in reversed(group) if c['name'].startswith('bigpin_') or c['name'].startswith('alert_icons/trait_enriched/icon_'))
    texture=group[-1]['name'] if len(group) in (4,6) else None
    suffix=detail.rsplit('/',1)[-1].removeprefix('bigpin_')
    for c in group:
        if c['name'] not in ('tinypin_hazard','smallpin_hazard','map_pins_report_medium_small_hazard'):continue
        level={'tinypin_hazard':'tiny','smallpin_hazard':'small','map_pins_report_medium_small_hazard':'tex'}[c['name']]
        alias='morphe_'+level+'_'+suffix
        aliases[alias]=dict(template=c['name'],detail=detail,texture_source=texture,level=level)
        replacements.append(dict(call=c['call'],name=alias))
# Build native call stubs and NUL-terminated resource-name pool in existing RX padding.
cave=0x424c130;constructor=0x2dfa63c;pool=bytearray();patches=[];stubs={}
def branch(a,b,link=False):
    assert (b-a)%4==0 and -(1<<27)<=b-a<(1<<27)
    return (0x94000000 if link else 0x14000000)|(((b-a)//4)&0x3ffffff)
def patch(a,after,label):patches.append(dict(offset=a,before=original[a:a+len(after)].hex(),after=after.hex(),label=label))
for name in aliases:
    while len(pool)%4:pool.append(0)
    start=cave+len(pool);ptr=start+12;page_delta=(ptr>>12)-(start>>12)
    adrp=0x90000001|((page_delta&3)<<29)|(((page_delta>>2)&0x7ffff)<<5)
    add=0x91000021|((ptr&4095)<<10)
    pool.extend(struct.pack('<III',adrp,add,branch(start+8,constructor)))
    pool.extend(name.encode()+bytes([0]));stubs[name]=dict(stub=start,pointer=ptr)
while len(pool)%4:pool.append(0)
assert cave+len(pool)<0x4250000 and original[cave:cave+len(pool)]==bytes(len(pool))
for r in replacements:
    a=r['call'];assert struct.unpack_from('<I',original,a)[0]==branch(a,constructor,True)
    patch(a,struct.pack('<I',branch(a,stubs[r['name']]['stub'],True)),r['name'])
patch(cave,bytes(pool),'Per-size subtype resource-name stubs')
elf=ELFFile(io.BytesIO(original));segments=list(elf.iter_segments())
i,seg=next((i,s) for i,s in enumerate(segments) if s['p_type']=='PT_LOAD' and s['p_flags']==5)
assert seg['p_filesz']==seg['p_memsz']==cave
header=elf['e_phoff']+i*elf['e_phentsize'];end=cave+len(pool)
patch(header+32,struct.pack('<QQ',end,end),'Map resource-name pool into RX padding')
# Generate both stock and Google versions in each ORIGINAL small/tiny footprint.
base=root/'src/main/resources/iconpacks';rows=[]
with zipfile.ZipFile(root/'downloads/waze-arm64/base.apk') as z:
    names=set(z.namelist())
    def source(stem,density,google):
        choices=[stem+density+'.png',stem+'@3x.png',stem+'.png']
        if stem=='map_pins_report_hazards-on-road_albedo':choices.insert(0,stem+'3x.png')
        for rel in choices:
            if 'assets/res/skins/default/'+rel in names:
                path=base/'google_maps'/rel
                data=path.read_bytes() if google and path.is_file() else z.read('assets/res/skins/default/'+rel)
                return Image.open(io.BytesIO(data)).convert('RGBA')
        raise ValueError(stem)
    for alias,entry in aliases.items():
        template=entry['template']
        for density in ('','@2x','@3x'):
            template_path=template+density+'.png'
            if 'assets/res/skins/default/'+template_path not in names:continue
            stock=source(template,density,False);images=[]
            for google in (False,True):
                if entry['level']=='tex':
                    result=stock.copy()
                    if entry['texture_source']:
                        detail=source(entry['texture_source'],density,google)
                        assert detail.size==(256,256)
                        result.paste(detail.crop((17,17,239,239)),(17,17))
                    else:
                        detail=source(entry['detail'],density,google);detail=detail.crop(detail.getbbox());detail.thumbnail((222,222),Image.Resampling.LANCZOS)
                        result.alpha_composite(detail,((256-detail.width)//2,(256-detail.height)//2))
                else:
                    detail=source(entry['detail'],density,google);detail=detail.crop(detail.getbbox())
                    box=stock.getbbox();width,height=box[2]-box[0],box[3]-box[1]
                    detail.thumbnail((width,height),Image.Resampling.LANCZOS)
                    result=Image.new('RGBA',stock.size)
                    result.alpha_composite(detail,(box[0]+(width-detail.width)//2,box[1]+(height-detail.height)//2))
                path=base/('google_maps' if google else 'original_aliases')/(alias+density+'.png');path.parent.mkdir(parents=True,exist_ok=True);result.save(path);images.append(path.read_bytes())
            rows.append(dict(path=alias+density+'.png',size=list(stock.size),template=template_path,detail=entry['detail'],texture=entry['level']=='tex',original_sha256=hashlib.sha256(images[0]).hexdigest(),sha256=hashlib.sha256(images[1]).hexdigest(),fallback=images[0]==images[1]))
(base/'alias-paths.txt').write_text(''.join(r['path']+'\n' for r in rows))
pack=json.loads((root/'references/google-maps-icons/pack-manifest.json').read_text())
pack['aliases']=rows
(root/'references/google-maps-icons/pack-manifest.json').write_text(json.dumps(pack,indent=2))
(base/'paths.txt').write_text(''.join(r['path']+'\n' for r in pack['assets']+rows))
metadata=dict(source_sha256=digest,trampoline=cave,pool_size=len(pool),constructor=constructor,stubs=stubs,replacements=replacements,patches=patches,groups=groups)
(root/'references/icon-zoom/patch.json').write_text(json.dumps(metadata,indent=2))
lines=['source.sha256='+digest]+[f'patch.{p["offset"]:x}={p["before"]}:{p["after"]}' for p in patches]
(root/'src/main/resources/themes/native-report-zoom.properties').write_text('\n'.join(lines)+'\n')
print(f'Built {len(rows)} size-preserving assets; {len(replacements)} resource-name call sites; {len(pool)} native pool bytes. Original zoom selectors untouched.')
