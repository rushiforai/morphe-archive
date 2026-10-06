"""Copy only independently exported N31 string values; add N33 authored text slots."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]

def main():
    path = ROOT / 'localization/catalog.json'
    current = json.loads(path.read_text(encoding='utf-8'))
    words = json.loads((ROOT / '.verification/n33-planner/n31-text-only-catalog.json').read_text(encoding='utf-8'))
    # The planner export contains JSON text only. No implementation, fixtures or build inputs are read.
    for locale, values in current['languages'].items():
        values.update(words['languages'][locale])
    current['source_keys'].update(words['source_keys'])
    current['source_keys']['Invalid API URL: use an HTTP(S) OpenAI-compatible base URL without credentials or fragments']='api_address_invalid'
    current['source_keys']['模型不能为空']='model_empty'
    additions = {
        'en': ['Chinese (Simplified)', 'Chinese (Traditional)', 'Paste', 'Select all', '%1$s; keeping the last valid value'],
        'zh-rCN': ['中文（简体）', '中文（繁体）', '粘贴', '全选', '%1$s；保留上次有效值'],
        'zh-rTW': ['中文（簡體）', '中文（繁體）', '貼上', '全選', '%1$s；保留上次有效值'],
        'es': ['Chino (simplificado)', 'Chino (tradicional)', 'Pegar', 'Seleccionar todo', '%1$s; se conserva el último valor válido'],
        'fr': ['Chinois (simplifié)', 'Chinois (traditionnel)', 'Coller', 'Tout sélectionner', '%1$s ; dernière valeur valide conservée'],
        'de': ['Chinesisch (vereinfacht)', 'Chinesisch (traditionell)', 'Einfügen', 'Alles auswählen', '%1$s; der letzte gültige Wert bleibt erhalten'],
        'pt': ['Chinês (simplificado)', 'Chinês (tradicional)', 'Colar', 'Selecionar tudo', '%1$s; o último valor válido é mantido'],
        'ru': ['Китайский (упрощённый)', 'Китайский (традиционный)', 'Вставить', 'Выбрать всё', '%1$s; сохранено последнее допустимое значение'],
        'ja': ['中国語（簡体字）', '中国語（繁体字）', '貼り付け', 'すべて選択', '%1$s。前回の有効な値を保持します'],
        'ko': ['중국어(간체)', '중국어(번체)', '붙여넣기', '모두 선택', '%1$s. 마지막 유효한 값을 유지합니다'],
        'ar': ['الصينية (المبسطة)', 'الصينية (التقليدية)', 'لصق', 'تحديد الكل', '%1$s؛ تم الاحتفاظ بآخر قيمة صالحة'],
        'hi': ['चीनी (सरलीकृत)', 'चीनी (पारंपरिक)', 'चिपकाएँ', 'सभी चुनें', '%1$s; पिछला मान्य मान रखा गया है'],
        'id': ['Tionghoa (Sederhana)', 'Tionghoa (Tradisional)', 'Tempel', 'Pilih semua', '%1$s; nilai valid terakhir dipertahankan'],
        'vi': ['Tiếng Trung (Giản thể)', 'Tiếng Trung (Phồn thể)', 'Dán', 'Chọn tất cả', '%1$s; giữ giá trị hợp lệ gần nhất'],
    }
    keys = ['language_zh_hans', 'language_zh_hant', 'paste', 'select_all', 'value_retained']
    for locale, values in additions.items():
        current['languages'][locale].update(zip(keys, values))
    model_empty={'en':'The endpoint returned no selectable model IDs','zh-rCN':'接口没有返回可选择的模型 ID','zh-rTW':'介面未傳回可選擇的模型 ID','es':'El servidor no devolvió ningún ID de modelo seleccionable','fr':"Le serveur n’a renvoyé aucun identifiant de modèle sélectionnable",'de':'Der Endpunkt hat keine auswählbaren Modell-IDs zurückgegeben','pt':'O servidor não retornou IDs de modelos selecionáveis','ru':'Сервер не вернул доступных для выбора идентификаторов моделей','ja':'選択できるモデル ID が返されませんでした','ko':'선택 가능한 모델 ID가 반환되지 않았습니다','ar':'لم تُرجع نقطة النهاية معرّفات نماذج قابلة للاختيار','hi':'एंडपॉइंट ने चुनने योग्य मॉडल ID नहीं लौटाए','id':'Endpoint tidak mengembalikan ID model yang dapat dipilih','vi':'Máy chủ không trả về ID mô hình có thể chọn'}
    for locale,value in model_empty.items():current['languages'][locale]['model_ids_empty']=value
    current['languages']['zh-rCN']['ai_summary']='启用后，在 YouTube 的“自动翻译”语言列表中选择目标语言，即可使用已配置的 AI 服务实时翻译视频字幕。'
    current['languages']['zh-rCN']['languages_summary']='将所选语言添加到 YouTube 的“自动翻译”语言列表，可同时选择多种语言。'
    # Complete native tier words: no ellipsis, abbreviation, smaller font or hidden truncation.
    compact_tiers={
        'en':['Tiny','Small','Standard','Large','Huge'],
        'es':['Mínimo','Pequeño','Normal','Grande','Máximo'],
        'fr':['Minime','Petit','Normal','Grand','Maximal'],
        'de':['Winzig','Klein','Normal','Groß','Riesig'],
        'pt':['Mínimo','Pequeno','Normal','Grande','Máximo'],
        'ru':['Мини','Малый','Норма','Крупный','Макси'],
        'id':['Terkecil','Kecil','Normal','Besar','Terbesar'],
        'vi':['Tí hon','Nhỏ','Chuẩn','Lớn','Cực lớn'],
        'hi':['न्यून','छोटा','मानक','बड़ा','अधिकतम'],
    }
    tier_keys=['size_tier_xs','size_tier_s','size_tier_standard','size_tier_l','size_tier_xl']
    for locale,names in compact_tiers.items():current['languages'][locale].update(zip(tier_keys,names))
    current['keys'] = sorted(current['languages']['en'])
    path.write_text(json.dumps(current, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(f'Prepared {len(current["keys"])} keys x {len(current["languages"])} locales')

if __name__ == '__main__':
    main()
