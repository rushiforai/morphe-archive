"""Patch the effective Java sources after the archived revision stages them."""
from overlay_274 import replace_once


def apply(destination):
    ambient = destination / "AmbientLight.java"
    source = ambient.read_text(encoding="utf-8")
    start = source.index("            if (mode == NORMAL) {\n"
                         "                // TextureView fills the container")
    end = source.index("            for (int edge", start)
    source = source[:start] + '''            // Frame pixels can provide colors but never define the picture bounds.
            // A black scene within the decoded picture must stay untouched.
''' + source[end:]
    start = source.index("    // Some fullscreen sources contain their own black bars")
    end = source.index("    private static int darkMargin(", start)
    source = source[:start] + source[end:]
    source = replace_once(source,
        "            int save = sharedFade ? c.save() : -1;\n"
        "            if (sharedFade) c.clipRect(getBounds());",
        "            int save = c.save();\n"
        "            if (sharedFade) c.clipRect(getBounds());\n"
        "            if (!inner) c.clipOutRect(video);")
    source = replace_once(source, "            if (sharedFade) c.restoreToCount(save);",
                          "            c.restoreToCount(save);")
    ambient.write_text(source, encoding="utf-8")

    download = destination / "DownloadActions116.java"
    source = download.read_text(encoding="utf-8")
    start = source.index(" static void normalize(")
    end = source.index(" static void cache(", start)
    source = source[:start] + ''' static void normalize(Menu menu, List<ListActions.Action> actions, Activity host, Object row) {
  String id = videoId(row);
  if (!id.isEmpty()) {
   String title = ListActions.value(row, "title");
   CacheTitles117.remember(id, title);
   boolean hasSave = actions.stream().anyMatch(action -> action.id == MP4);
   boolean hasCache = actions.stream().anyMatch(action -> action.id == CACHE);
   if (!hasSave) {
    MenuItem item = menu.add(0, MP4, 0,
        PanelUi.tr(host, "動画・音声を保存", "Save video or audio", "儲存影片或音訊"));
    actions.add(new ListActions.Action(item, () -> DownloadUi115.choose(host, id, title)));
   }
   if (!hasCache && !ListActions.cacheList(host)) {
    MenuItem item = menu.add(0, CACHE, 0, UiStrings.translate("キャッシュ取得"));
    actions.add(new ListActions.Action(item, () -> cache(host, id, title)));
   }
   addQueueAction(menu, actions, host, row, MenuOptions119.NEXT);
   addQueueAction(menu, actions, host, row, MenuOptions119.APPEND);
  }
  VideoMenu274.publish(menu, actions, host);
 }

 private static void addQueueAction(Menu menu, List<ListActions.Action> actions, Activity host,
                                    Object row, int id) {
  if (actions.stream().anyMatch(action -> action.id == id)) return;
  MenuItem item = menu.add(0, id, 0, UiStrings.translate(MenuOptions119.LABELS.get(id)));
  actions.add(new ListActions.Action(item,
      () -> ManualQueue119.add(host, row, id == MenuOptions119.NEXT)));
 }

''' + source[end:]
    download.write_text(source, encoding="utf-8")
