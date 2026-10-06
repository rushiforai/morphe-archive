"""Join actual ART controls with resource slots, translated templates and source call sites."""
from pathlib import Path
import argparse, json, re

ROOT=Path(__file__).resolve().parents[2]
SOURCE=ROOT/'extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions'

def locale(tag):
    if tag.startswith('zh'):return 'zh-rTW' if 'Hant' in tag or any(x in tag for x in ['TW','HK','MO']) else 'zh-rCN'
    return 'id' if tag.split('-')[0] in {'id','in'} else tag.split('-')[0]

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--matrix',required=True,type=Path);parser.add_argument('--actions',action='append',type=Path,default=[]);parser.add_argument('--output',required=True,type=Path);args=parser.parse_args()
    args.matrix=args.matrix.resolve();args.actions=[path.resolve() for path in args.actions];args.output=args.output.resolve()
    args.output.mkdir(parents=True,exist_ok=False)
    catalog=json.loads((ROOT/'localization/catalog.json').read_text(encoding='utf-8'))['languages']
    calls=[]
    for file in sorted(SOURCE.glob('*.java')):
        if file.name=='CaptionTranslationCatalog.java':continue
        for number,line in enumerate(file.read_text(encoding='utf-8').splitlines(),1):
            if re.search(r'CaptionStrings\.(?:get|settings|localize)|\bui(?:Text|Hint)\(|set(?:Text|Hint|ContentDescription)\(|\btext\("',line):
                keys=[key for key in re.findall(r'"([a-z][a-z0-9_]+)"',line) if key in catalog['en']]
                calls.append({'file':str(file.relative_to(ROOT)).replace('\\','/'),'line':number,'code':line.strip(),'resource_candidates':['cap_'+key for key in keys]})
    expressions={}
    def template(value):
        parts=[];position=0
        for match in re.finditer(r'%(?:\d+\$)?[sdf]',value):
            parts.extend([re.escape(value[position:match.start()]),'.*']);position=match.end()
        parts.append(re.escape(value[position:]));return re.compile('^'+''.join(parts)+'$',re.S)
    for language,values in catalog.items():
        expressions[language]={key:template(value) for key,value in values.items()}
    def candidates(language,value):
        if value in ['',None,'null']:return []
        return ['cap_'+key for key,pattern in expressions[language].items() if pattern.fullmatch(value)]
    observations=[];cases=[]
    for file in sorted(args.matrix.glob('*/ui.json')):
        evidence=json.loads(file.read_text(encoding='utf-8'));assert evidence['status']=='PASS'
        theme=next(event['value'] for event in evidence['events'] if event['event']=='observed_official_theme')
        matrix=next(event['value'] for event in evidence['events'] if event['event']=='runtime_matrix')
        for row in matrix:
            language=locale(row['resolved_ui_locale']);assert theme['dark']==(row['dark']=='true')
            case={'locale':language,'official_option':row['locale'],'resolved_ui_locale':row['resolved_ui_locale'],'caller_locale':row['caller_locale'],'width_dp':row['width_dp'],'fontScale':row['fontScale'],'theme':theme,'evidence':str(file.relative_to(ROOT)).replace('\\','/')}
            cases.append(case)
            for key,value in row['preference_inventory'].items():
                observations.append({**case,'control':key,'kind':'Preference metadata','actual':value,'title_is_rendered':not value['class'].endswith('SubtitleStylePreview'),'source_slots':{name:value[name] for name in ['titleSlot','summarySlot'] if name in value},'title_resources':candidates(language,value['title']),'summary_resources':candidates(language,value['summary'])})
            for index,control in enumerate(row['controls']):
                bindings={name:candidates(language,control[name]) for name in ['text','hint','description']}
                observations.append({**case,'control':control['key']+'/'+str(index),'kind':'actual child View','actual':control,'resource_candidates':bindings})
            observations.append({**case,'control':'language picker','kind':'real AlertDialog multi-choice adapter','actual':row['picker_names'],'source':'CaptionLanguagesPreference.languageLabel: Locale.getDisplayLanguage + cap_language_zh_hans/cap_language_zh_hant','save_resource':'cap_languages_save','cancel_resource':'cap_cancel'})
            observations.append({**case,'control':'maximum preview','kind':'actual production sampleLabel','actual':row['preview_sample'],'source':'cap_preview_sample / SubtitleStylePreview'})
            if 'actual_preview_canvas' in row:
                observations.append({**case,'control':'visible preview canvas','kind':'production View onDraw in actual window','actual':row['actual_preview_canvas'],'source':'SubtitleStylePreview.Preview.onDraw / cap_preview / cap_preview_sample'})
            for control in row.get('actual_picker_rows',[]):
                observations.append({**case,'control':control['key'],'kind':'native checkbox View in measured picker window','actual':control,'window_width_px':row['actual_picker_width'],'source':'CaptionLanguageSelection.CODES / CaptionLanguagesPreference.languageLabel'})
    actions=[]
    for directory in args.actions:
        file=directory/'ui.json';data=json.loads(file.read_text(encoding='utf-8'));assert data['status']=='PASS';actions.append({'evidence':str(file.relative_to(ROOT)).replace('\\','/'),'events':data['events']})
    explicit=[case for case in cases if case['official_option']!='DEFAULT'];traditional=[case for case in cases if case['locale']=='zh-rTW'];unique=sorted({case['locale'] for case in cases})
    assert len(explicit)==104 and len(traditional)==8 and len(unique)==14
    summary={'official_explicit_options':13,'official_explicit_cases':len(explicit),'traditional_default_cases':len(traditional),'traditional_resolved':sorted({case['resolved_ui_locale'] for case in traditional}),'patch_actual_locales':unique,'patch_actual_cases':len(explicit)+len(traditional),'extra_default_cn_cases':len(cases)-len(explicit)-len(traditional),'runtime_observations':len(observations),'source_call_sites':len(calls),'source_classes':len({call['file'] for call in calls}),'categories_have_original_absent_keys':True,'data_and_technical_report_text_are_preserved':True}
    for name,data in [('source-call-sites.json',calls),('actual-controls.json',observations),('actual-actions.json',actions),('coverage.json',summary)]:
        (args.output/name).write_text(json.dumps(data,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(summary,ensure_ascii=False))

if __name__=='__main__':main()
