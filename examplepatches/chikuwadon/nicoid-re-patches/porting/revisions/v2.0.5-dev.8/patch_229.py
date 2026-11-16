"""v2.0.5-dev.8: keep all prior settings and playback fixes, localize native UI."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.7/patch_228.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev7",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{
    "NicoliveUi.java","NicoliveActivity.java","AppBarPlacement202.java"
})

def once(text,old,new,label):
    if text.count(old)!=1:
        raise ValueError("%s: expected one anchor, found %d"%(label,text.count(old)))
    return text.replace(old,new)

def stage(base,destination):
    previous.stage(base,destination)
    base,destination=Path(base),Path(destination)
    # Existing live-broadcast UI text is not automatically translated by
    # UiText.preferences(), which only handles Android Preferences.
    ui=destination/"NicoliveUi.java"
    if not ui.is_file():ui.write_text((base/ui.name).read_text(encoding="utf-8"),encoding="utf-8")
    source=ui.read_text(encoding="utf-8")
    for old,new,label in (
      ("v.setText(s);","v.setText(UiStrings.translate(s));","Live TextView"),
      ("b.setText(s);","b.setText(UiStrings.translate(s));","Live Button"),
      ("button.setContentDescription(label);","button.setContentDescription(UiStrings.translate(label));","Live navigation accessibility"),
      ("b.setContentDescription(description);","b.setContentDescription(UiStrings.translate(description));","Live icon accessibility"),
      ("e.setHint(hint);","e.setHint(UiStrings.translate(hint));","Live search hint"),
    ):
      source=once(source,old,new,label)
    source=once(source,"static void dialog(AlertDialog d){UiDialogs.show(d);}",
        "static void dialog(AlertDialog d){UiDialogs.show(d);AppLocale251.translate(d.getWindow().getDecorView());}",
        "Localize native live alert titles, buttons and messages")
    ui.write_text(source,encoding="utf-8")

    activity=destination/"NicoliveActivity.java"
    if not activity.is_file():activity.write_text((base/activity.name).read_text(encoding="utf-8"),encoding="utf-8")
    source=activity.read_text(encoding="utf-8")
    for old,new,label in (
      ('String[] kinds={"すべて","ユーザー","公式","チャンネル"};',
       'String[] kinds={UiStrings.translate("すべて"),UiStrings.translate("ユーザー"),UiStrings.translate("公式"),UiStrings.translate("チャンネル")};',"Live filters"),
      ('sortButton.setText(activeSort().label+" ▾");',
       'sortButton.setText(UiStrings.translate(activeSort().label)+" ▾");',"Live sort title"),
      ('sortButton.setContentDescription("並べ替え / "+activeSort().label);',
       'sortButton.setContentDescription(UiStrings.translate("並べ替え")+" / "+UiStrings.translate(activeSort().label));',"Live sort accessibility"),
      ('sort.label).setCheckable(true)',
       'UiStrings.translate(sort.label)).setCheckable(true)',"Live sort popup"),
      ('String count="放送中 "+feedAdapter.getCount()+"件";',
       'String count=PanelUi.tr(NicoliveActivity.this,"放送中 ","Live ","直播中 ")+feedAdapter.getCount()+PanelUi.tr(NicoliveActivity.this,"件"," items"," 個節目");',"Live program count"),
      ('new String[]{"現在の一覧を更新","ニコ生の設定","公式サイトで開く"}',
       'new String[]{UiStrings.translate("現在の一覧を更新"),UiStrings.translate("ニコ生の設定"),UiStrings.translate("公式サイトで開く")}',"Live menu"),
    ):
      source=once(source,old,new,label)
    # Translate status and derived provider/time labels without touching
    # broadcast titles, video IDs, sorting keys or network parameters.
    source=once(source,"status.setText(label);",
        "status.setText(UiStrings.translate(label));","Live status text")
    source=once(source,"status.setText(\"取得中…\");",
        "status.setText(UiStrings.translate(\"取得中…\"));","Live loading status")
    source=once(source," String programLabel(NicoliveData.Program p){String type=p.provider.equals(\"official\")?\"公式\":p.provider.equals(\"channel\")?\"CH\":p.provider.equals(\"user\")||p.provider.equals(\"community\")?\"ユーザー\":\"生放送\";if(hubTab==2)return \"視聴履歴 / \"+type;if(hubTab==TIMETABLE&&!timetableOnAir&&p.begin>0){String time=TIMETABLE_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));String state=p.onAir()?\"放送中\":p.ended()?\"放送終了\":\"放送予定\";return type+\" / \"+time+\" / \"+state;}if(!p.onAir()){String state=p.ended()?\"放送終了\":\"放送予定\";if(p.begin>0)state+=\" / \"+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));return type+\" / \"+state;}if(p.begin>0&&prefs().getBoolean(START_TIME,false))return type+\" / \"+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN))+\" 開始\";long minutes=p.begin>0?Math.max(0,(System.currentTimeMillis()/1000-p.begin)/60):-1;return type+\" / \"+(minutes<0?\"放送中\":minutes<60?minutes+\"分経過\":minutes/60+\"時間\"+minutes%60+\"分経過\");}"," String programLabel(NicoliveData.Program p){String type=UiStrings.translate(p.provider.equals(\"official\")?\"公式\":p.provider.equals(\"channel\")?\"CH\":p.provider.equals(\"user\")||p.provider.equals(\"community\")?\"ユーザー\":\"生放送\");if(hubTab==2)return UiStrings.translate(\"視聴履歴\")+\" / \"+type;if(hubTab==TIMETABLE&&!timetableOnAir&&p.begin>0){String time=TIMETABLE_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));String state=UiStrings.translate(p.onAir()?\"放送中\":p.ended()?\"放送終了\":\"放送予定\");return type+\" / \"+time+\" / \"+state;}if(!p.onAir()){String state=UiStrings.translate(p.ended()?\"放送終了\":\"放送予定\");if(p.begin>0)state+=\" / \"+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));return type+\" / \"+state;}if(p.begin>0&&prefs().getBoolean(START_TIME,false))return type+\" / \"+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN))+PanelUi.tr(NicoliveActivity.this,\" 開始\",\" started\",\" 開始\");long minutes=p.begin>0?Math.max(0,(System.currentTimeMillis()/1000-p.begin)/60):-1;return type+\" / \"+(minutes<0?UiStrings.translate(\"放送中\"):minutes<60?minutes+PanelUi.tr(NicoliveActivity.this,\"分経過\",\" min elapsed\",\" 分鐘前開始\"):minutes/60+PanelUi.tr(NicoliveActivity.this,\"時間\",\" hr \",\" 小時 \")+minutes%60+PanelUi.tr(NicoliveActivity.this,\"分経過\",\" min elapsed\",\" 分鐘前開始\"));}","Live program labels")
    source=once(source,"String label=programs.isEmpty()?\"放送中の番組が見つかりません\":\"放送中 \"+programs.size()+\"件 / \"+query;","String label=programs.isEmpty()?UiStrings.translate(\"放送中の番組が見つかりません\"):PanelUi.tr(NicoliveActivity.this,\"放送中 \",\"Live \",\"直播中 \")+programs.size()+PanelUi.tr(NicoliveActivity.this,\"件 / \",\" items / \",\" 個節目／\")+query;","Live search count")
    source=once(source,"String count=\"公式・チャンネル \"+programs.size()+\"件\";","String count=PanelUi.tr(NicoliveActivity.this,\"公式・チャンネル \",\"Official and channel \",\"官方及頻道 \")+programs.size()+PanelUi.tr(NicoliveActivity.this,\"件\",\" programs\",\" 個節目\");","Official program count")
    source=once(source,"count+\" / 一部の一覧を取得できませんでした\"","count+\" / \"+UiStrings.translate(\"一部の一覧を取得できませんでした\")","Follow partial error")
    source=once(source,"count+\" / 一部取得できませんでした\"","count+\" / \"+UiStrings.translate(\"一部取得できませんでした\")","Timetable partial error")
    source=once(source,"\"ランキングの対象 / \"+rankingState.label","UiStrings.translate(\"ランキングの対象\")+\" / \"+UiStrings.translate(rankingState.label)","Ranking state accessibility")
    source=once(source,"String message=(requirement.isEmpty()?\"この番組\":requirement+\"の番組\")+\"は現在のアカウントで視聴できません。\";","String message=(requirement.isEmpty()?UiStrings.translate(\"この番組\"):UiStrings.translate(requirement)+UiStrings.translate(\"の番組\"))+UiStrings.translate(\"は現在のアカウントで視聴できません。\");","Live entitlement status")
    source=once(source,"message+=\"\\nログインが必要な場合があります。\";","message+=UiStrings.translate(\"\\nログインが必要な場合があります。\");","Live entitlement signin")
    source=once(source,"message+=\"\\n視聴権・購入状況・チャンネル会員資格を確認してください。\";","message+=UiStrings.translate(\"\\n視聴権・購入状況・チャンネル会員資格を確認してください。\");","Live entitlement detail")
    source=once(source,"latest.setText(\"新着 \"+newComments+\"件 / 最新コメントへ\")","latest.setText(PanelUi.tr(NicoliveActivity.this,\"新着 \",\"New \",\"新增 \")+newComments+PanelUi.tr(NicoliveActivity.this,\"件 / 最新コメントへ\",\" comments / Jump to latest\",\" 則留言／跳至最新\"))","Live new comments")
    source=once(source,"(pos+1)+\"位 / \"+programLabel(p)","(pos+1)+PanelUi.tr(NicoliveActivity.this,\"位 / \",\" / \",\"名／\")+programLabel(p)","Live ranking placement")
    source=once(source,"String.format(Locale.JAPAN,\"タイムシフト予約 %,d\",p.reservations)","String.format(Locale.JAPAN,UiStrings.translate(\"タイムシフト予約 %,d\"),p.reservations)","Live timeshift counts")
    count=source.count("stats.setContentDescription(\"来場 \"+p.views+\"、コメント \"+p.comments);")
    if count!=2:raise ValueError("Live accessibility stats: expected two call sites")
    source=source.replace("stats.setContentDescription(\"来場 \"+p.views+\"、コメント \"+p.comments);","stats.setContentDescription(PanelUi.tr(NicoliveActivity.this,\"来場 \",\"Viewers: \",\"觀眾：\")+p.views+PanelUi.tr(NicoliveActivity.this,\"、コメント \",\", comments: \",\"，留言：\")+p.comments);")
    activity.write_text(source,encoding="utf-8")

    chrome=destination/"AppBarPlacement202.java"
    if not chrome.is_file():chrome.write_text((base/chrome.name).read_text(encoding="utf-8"),encoding="utf-8")
    source=chrome.read_text(encoding="utf-8")
    source=once(source,
        "        strip.post(c::apply);",
        "        strip.post(c::apply);\n        strip.post(()->AppLocale251.translate(host.getWindow().getDecorView()));",
        "Translate existing app bar and tab labels without editing stored user tab names")
    chrome.write_text(source,encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
