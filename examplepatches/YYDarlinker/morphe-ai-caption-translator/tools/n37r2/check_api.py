"""Check newly emitted Android/Java instruction references against the installed official SDK API table."""
from pathlib import Path
import json,hashlib,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[2];E=ROOT/'.verification/n37r2';API=Path(r'C:/Users/14776/AppData/Local/Android/Sdk/platforms/android-35/data/api-versions.xml')
classes={c.attrib['name']:c for c in ET.parse(API).getroot().findall('class')}
def resolve(owner,kind,name,seen=None):
 seen=set() if seen is None else seen
 if owner in seen or owner not in classes:return None
 seen.add(owner);node=classes[owner];own=int(node.attrib.get('since','1'))
 if kind=='class':return own
 for item in node.findall(kind):
  if item.attrib['name']==name:return max(own,int(item.attrib.get('since',str(own))))
 for parent in [*node.findall('extends'),*node.findall('implements')]:
  since=resolve(parent.attrib['name'],kind,name,seen)
  if since is not None:return max(own,since)
 return None
before=set((E/'api-refs-before.tsv').read_text(encoding='utf-8').splitlines());after=set((E/'api-refs-after.tsv').read_text(encoding='utf-8').splitlines());added=sorted(after-before);checked=[]
for line in added:
 c,method,kind,owner,name=line.split('\t');api=resolve(owner[1:-1],kind,name)
 assert api is not None and api<=28,(c,method,kind,owner,name,api)
 checked.append({'class':c,'method':method,'reference_kind':kind,'reference':owner+'->'+name,'since':api})
assert added and any('CaptionHorizontalPlacement;' in r['class'] for r in checked)
report={'status':'PASS','min_api':28,'baseline':'n37 candidate-04 serialized MPE','candidate':'n37r2 candidate-01 serialized MPE','api_table':str(API),'api_table_sha256':hashlib.sha256(API.read_bytes()).hexdigest(),'new_instruction_references':len(checked),'max_since':max(r['since'] for r in checked),'checked':checked}
(E/'api-audit.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print('N37R2_API28_AUDIT_PASS',len(checked),'new refs max API',report['max_since'])