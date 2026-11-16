"""v2.0.5-dev.9: initial panels, control glyphs, media folder labels and locale fixes."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.8/patch_229.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev8",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def once(s,old,new,description):
    count=s.count(old)
    if count!=1:raise ValueError("%s: expected one site, got %d"%(description,count))
    return s.replace(old,new)

def stage(base,destination):
    previous.stage(base,destination)
    destination=Path(destination)
    screen=destination/"NicoliveActivity.java"
    source=screen.read_text(encoding="utf-8")
    source=once(source,
        'addDateTab(row,day.equals(today)?"今日":DATE_TAB.format(day),day,false);',
        'addDateTab(row,day.equals(today)?"今日":day.format(DateTimeFormatter.ofPattern("M/d(E)",currentDateLocale())),day,false);',
        "Locale-sensitive live schedule weekdays")
    source=once(source,
        ' private void addDateTab(LinearLayout row,String label,LocalDate day,boolean onAir){',
        ''' private Locale currentDateLocale(){
  String selected=PreferenceManager.getDefaultSharedPreferences(this).getString("app_lang","0");
  if("1".equals(selected))return Locale.ENGLISH;
  if("2".equals(selected))return Locale.TRADITIONAL_CHINESE;
  if("-1".equals(selected))return Locale.getDefault();
  return Locale.JAPAN;
 }
 private void addDateTab(LinearLayout row,String label,LocalDate day,boolean onAir){''',
        "Locale from selected app language")
    source=once(source,
        'status.setText(programs.isEmpty()?"視聴履歴はありません":"視聴履歴");',
        'status.setText(UiStrings.translate(programs.isEmpty()?"視聴履歴はありません":"視聴履歴"));',
        "Translate live history section heading")
    screen.write_text(source,encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
