package e.e.a;

/** Pure-Java round-trip checks for the settings and close-glyph regression. */
public final class UiStrings252Test {
 private static void eq(String expected,String actual,String caseName){
  if(!expected.equals(actual))throw new AssertionError(caseName+
    ": expected "+expected+" but got "+actual);
 }
 public static void main(String[] args){
  UiStrings.selectLanguage("0");
  eq("×",UiStrings.translate("×"),"Japanese close button");
  eq("✕",UiStrings.translate("✕"),"Japanese alternative close");
  UiStrings.selectLanguage("1");
  eq("×",UiStrings.translate("×"),"English close button");
  eq("Language",UiStrings.translate("言語"),"English language label");
  eq("Fullscreen",UiStrings.translate("全画面表示"),"English fullscreen control");
  eq("Related videos",UiStrings.translate("関連動画"),"English related panel");
  eq("Video and audio save folder",UiStrings.translate("動画・音声の保存先フォルダ"),"English media folder");
  eq("Change playback speed while long-pressing the video. Release to restore normal speed (disabled at the left edge).",
     UiStrings.translate("動画画面の長押し中だけ再生速度を変更します。指を離すと元に戻ります（左端で無効）"),
     "English long press explanation");
  UiStrings.selectLanguage("2");
  eq("×",UiStrings.translate("×"),"Traditional Chinese close button");
  eq("語言",UiStrings.translate("言語"),"Traditional Chinese language label");
  eq("全螢幕顯示",UiStrings.translate("全画面表示"),"Traditional Chinese fullscreen control");
  eq("相關影片",UiStrings.translate("関連動画"),"Traditional Chinese related panel");
  eq("影片與音訊儲存資料夾",UiStrings.translate("動画・音声の保存先フォルダ"),"Traditional Chinese media folder");
  UiStrings.selectLanguage("0");
  eq("×",UiStrings.translate("×"),"Close icon after language cycle");
  System.out.println("PASS: close glyph, settings, panels and locale round trips");
 }
}
