"""Generate Japanese inventories from the Android settings-control catalog exports."""
import csv,json,pathlib,collections
root=pathlib.Path(__file__).resolve().parents[1]
groups=collections.OrderedDict()
for version in ('191','226','242'):
 data=json.loads((root/f'build/settings-links{version}-final.json').read_text(encoding='utf-8'))
 unique=set()
 for row in data['settings']:
  key=(row['category'],row['label'])
  if key in unique:raise AssertionError(f'ambiguous catalog {version}: {key}')
  unique.add(key)
  if not all(link['clickable'] for link in row['links'].values()):raise AssertionError(f'unclickable command {key}')
  entry=groups.setdefault(key,{'row':row,'versions':[],'available':[]})
  entry['versions'].append(version)
  if row['available']:entry['available'].append(version)
out=root/'docs/settings-links-list.md'
lines=['# 設定リンク一覧','',
 '191・226・242の実際の「設定リンクを作成」から取得した対応項目です。設定名・カテゴリ名は日本語です。',
 'URL／AndroidインテントURLを含む全形式は [CSV一覧](settings-links-list.csv) を参照してください。',
 '本文へ表示しただけでは変更せず、タップ後の確認画面で「適用」を押した場合に変更します。',
 '数値・文字列・操作ボタンは設定画面を開く操作だけに対応します。親設定などで無効な項目は先に設定画面で有効にしてください。',
 '個別ダイアログ内の子項目は一覧に含まれない場合があります。その場合は元の設定を開いて操作してください。','']
category=None
csv_rows=[]
for entry in groups.values():
 row=entry['row'];versions='／'.join(entry['versions']);availability='現在変更可能' if entry['versions']==entry['available'] else '親設定・版・パッチ構成等による'
 if row['category']!=category:
  category=row['category'];lines+=['## '+row['categoryTitle'],'','| 設定名 | 対応版 | 開く | オン | オフ |','|---|---|---|---|---|']
 def command(action):
  link=row['links'].get(action)
  return '`'+link['command'].replace('|','\\|')+'`' if link else '—'
 lines.append('| '+row['label'].replace('|','\\|')+' | '+versions+' | '+command('open')+' | '+command('on')+' | '+command('off')+' |')
 for action,link in row['links'].items():
  # Portable intent: no test-package pin. The same custom-scheme handler is used.
  intent=link['intent'].replace(';package='+data['package'],'')
  import re
  intent=re.sub(r';package=jp\.co\.airfront\.android\.a2chMate\.haiagaru\.reporter(?:191|226|242)','',intent)
  csv_rows.append([versions,row['categoryTitle'],row['label'],{'open':'開く','on':'オン','off':'オフ'}[action],availability,link['command'],link['url'],intent])
out.write_text('\n'.join(lines)+'\n',encoding='utf-8')
with (root/'docs/settings-links-list.csv').open('w',encoding='utf-8-sig',newline='') as file:
 writer=csv.writer(file);writer.writerow(['対応版','カテゴリ','設定名','操作','条件','書き込み用文字列','設定URL','AndroidインテントURL']);writer.writerows(csv_rows)
print(f'PASS Japanese inventory: {len(groups)} settings / {len(csv_rows)} actions, commands clickable, no ambiguous names')
