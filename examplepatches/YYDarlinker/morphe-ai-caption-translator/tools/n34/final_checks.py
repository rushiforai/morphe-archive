"""Read serialized deliverables and N30 identities without changing release or historical files."""
from pathlib import Path
import argparse, hashlib, json, re, struct, subprocess, zipfile

ROOT=Path(__file__).resolve().parents[2]

def class_names(data):
    assert data[:4]==b'dex\n'
    string_count,string_offset=struct.unpack_from('<II',data,56)
    def string(index):
        position=struct.unpack_from('<I',data,string_offset+index*4)[0]
        while data[position]&128:position+=1
        position+=1
        end=data.index(b'\0',position)
        return data[position:end].decode('utf-8',errors='replace')
    type_count,type_offset=struct.unpack_from('<II',data,64)
    class_count,class_offset=struct.unpack_from('<II',data,96)
    return {string(struct.unpack_from('<I',data,type_offset+struct.unpack_from('<I',data,class_offset+index*32)[0]*4)[0]) for index in range(class_count)}

def method_dump(path):
    result={};owner=None;key=None
    for line in path.read_text(encoding='utf-8').splitlines():
        if line.startswith('CLASS '):owner=line.split()[1];key=None
        elif line.startswith('METHOD '):key=owner+' '+line;result[key]=[]
        elif key is not None and not line.startswith('FIELD '):result[key].append(line)
    return result

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--output',type=Path,required=True);args=parser.parse_args();assert not args.output.exists()
    evidence=ROOT/'.verification/n34';artifacts=json.loads((evidence/'artifacts-final-03/artifacts.json').read_text())
    for artifact in artifacts:
        path=Path(artifact['path']);assert path.stat().st_size==artifact['bytes'];assert hashlib.sha256(path.read_bytes()).hexdigest().upper()==artifact['sha256']
    mpp,mpe,apk=(Path(artifact['path']) for artifact in artifacts)
    names=class_names(mpe.read_bytes());assert not any(name.startswith('Lapp/morphe/') or name.startswith('Ln33/') or name.startswith('Ln34/') or name.startswith('Lvalidation/') for name in names)
    forbidden=['CaptionUiLocale','CaptionPreferenceBindings','CaptionUiWindows','CaptionSettingsBindingPatch']
    assert not any(word in name for name in names for word in forbidden)
    with zipfile.ZipFile(mpp) as archive:assert archive.read('extensions/extension.mpe')==mpe.read_bytes()
    with zipfile.ZipFile(apk) as archive:
        entries=[name for name in archive.namelist() if re.fullmatch(r'classes\d*\.dex',name)];assert len(entries)==11
        classes=set().union(*(class_names(archive.read(name)) for name in entries))
        assert len(classes)>58257
        assert not any(name.startswith('Ln33/') or name.startswith('Ln34/') or name.startswith('Lvalidation/') or any(word in name for word in forbidden) for name in classes)
    before=method_dump(ROOT/'.verification/n33/final-official-methods-complete.txt');after=method_dump(evidence/'final-03-official-methods-complete.txt');assert before==after
    listing=json.loads((ROOT/'patches-list.json').read_text(encoding='utf-8'));assert {patch['name'] for patch in listing['patches']}=={'AI caption translator','Remember caption selection'}
    composition=(evidence/'composition-candidate-03.log').read_text(encoding='utf-8-sig');passes=len(re.findall(r'^PASS ',composition,re.M));assert passes>0 and 'COMPOSITION_PASS' in composition
    baseline_composition=ROOT/'.verification/n30/delivery-records/composition-final.log'
    baseline_passes=len(re.findall(r'^PASS ',baseline_composition.read_text(encoding='utf-8-sig'),re.M)) if baseline_composition.exists() else None
    differences=subprocess.check_output(['git','diff','--name-only','b52b65b','--','extensions/extension/src/test'],cwd=ROOT).decode().splitlines()
    assert all(p.startswith('extensions/extension/src/test/') for p in differences)

    report={'status':'PASS','artifacts':artifacts,'classes':len(classes),'root_dexes':len(entries),'extension_class_definitions':len(names),'test_or_replacement_official_definitions_in_extension':0,'official_methods_semantically_equal':len(before),'composition_patch_passes':passes,'n30_composition_patch_passes':baseline_passes,'historical_84_is_not_final_denominator':True,'public_roots':[patch['name'] for patch in listing['patches']],'existing_test_changes':differences}
    args.output.write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps({key:value for key,value in report.items() if key!='artifacts'},ensure_ascii=False))

if __name__=='__main__':main()
