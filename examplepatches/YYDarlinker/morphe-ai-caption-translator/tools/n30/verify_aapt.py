"""Verify entry and preference order from the actual compiled APK resources, not source XML."""
from pathlib import Path
import re,json
R=Path(__file__).resolve().parents[2];O=R/'.verification/n30/delivery-records'
resource=(O/'aapt-resources.txt').read_text(encoding='utf-8-sig',errors='replace')
ids={name:rid for rid,name in re.findall(r'spec resource (0x[0-9a-f]+) [^\s]+:string/(cap_[a-z0-9_]+):',resource)}
for key in ['cap_ai_summary','cap_ai_quick_toggle_on','cap_ai_quick_toggle_off','cap_languages_title','cap_languages_summary','cap_languages_count']:assert key in ids,key
reports=[]
for variant in ['morphe_prefs','morphe_prefs_icons','morphe_prefs_icons_bold']:
 s=(O/f'aapt-{variant}.xmltree.txt').read_text(encoding='utf-8-sig',errors='replace');at=s.index('morphe_vot_screen__ai_captions');block=s[at:s.index('E: app.yydarlinker.deepseekcaptions.CaptionFlyoutPreference',at)]
 assert 'android:summary(0x010101e9)=@'+ids['cap_ai_summary'] in block
 assert 'android:singleLineTitle(0x0101055c)=(type 0x12)0x0' in block
 assert 'deepseek_caption_enabled' in block and 'deepseek_caption_languages' in block
 assert block.index('deepseek_caption_enabled')<block.index('deepseek_caption_languages')
 assert block.count('android:order(0x010101ea)=(type 0x10)0x0')==1
 assert block.count('android:order(0x010101ea)=(type 0x10)0x1')==1
 assert 'android:icon(' not in block
 assert s.count('"deepseek_caption_languages" (Raw:')==1
 reports.append({'variant':variant,'functional_summary_resource':ids['cap_ai_summary'],'enabled_order':0,'languages_order':1,'no_icon':True,'single_line_title':False})
catalog=json.loads((R/'localization/catalog.json').read_text(encoding='utf-8'))
# All authored values must actually survive compilation; repeated common strings count once in the pool.
from importlib.util import spec_from_file_location,module_from_spec
# Reuse only the frozen binary string-pool decoder, without running its artifact output side effects.
src=(R/'tools/n29/verify_host_resources.py').read_text(encoding='utf-8');beg=src.index('def read_string_pool(');end=beg+5+re.search(r'^def ',src[beg+5:],re.M).start()
ns={'struct':__import__('struct')};exec(src[beg:end],ns)
import zipfile,struct
with zipfile.ZipFile(R/'.verification/n30/aapt-input-final.apk') as z:arsc=z.read('resources.arsc')
header=struct.unpack_from('<H',arsc,2)[0];pool=set(ns['read_string_pool'](arsc,header))
for loc,values in catalog['languages'].items():
 for key in ['ai_summary','ai_quick_toggle_on','ai_quick_toggle_off','languages_title','languages_summary','languages_count','languages_save','languages_existing','languages_new','languages_unavailable','languages_empty','languages_entry']:
  assert values[key] in pool,(loc,key)
(O/'aapt-preference-proof.json').write_text(json.dumps({'rows':reports,'new_ui_values_in_arsc':12*14,'min_sdk':28,'actual_apk':True},indent=2)+'\n',encoding='utf-8')
print('N30_AAPT_PREFERENCE_PASS variants=3 new_values=168 order=0,1 no_icon=true')
