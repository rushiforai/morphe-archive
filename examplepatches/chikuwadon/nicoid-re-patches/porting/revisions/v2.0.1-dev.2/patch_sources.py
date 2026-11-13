"""Version-scoped, fail-fast Java source overlays for v2.0.1-dev.2.

The released 2.0.0 tree and the device-verified 2.0.1-dev.1 snapshot remain immutable.
Only files listed in OVERRIDES are regenerated under the temporary build directory.
"""
from pathlib import Path

OVERRIDES = frozenset((
    "NicoliveActivity.java", "NicoliveBrowser.java", "NicoliveData.java",
))

def once(source, old, new, filename):
    count = source.count(old)
    if count != 1:
        raise ValueError(f"{filename}: expected exactly one replacement anchor, found {count}: {old[:90]}")
    return source.replace(old, new)

def activity(source):
    file = "NicoliveActivity.java"
    source = once(source, "browser=new NicoliveBrowser();",
                  "browser=new NicoliveBrowser();browser.setContext(this);", file)
    source = once(source, "void base(){renderedProgram=null;",
                  "void base(){listGestures.reset();renderedProgram=null;", file)
    source = once(source, "void onStop(){ExitModeOptions.clear(this);",
                  "void onStop(){listGestures.reset();if(postNotice!=null)postNotice.cancel();ExitModeOptions.clear(this);", file)
    source = once(source, 'private String pendingPopupId="",deniedProgramId="";',
                  'private String pendingPopupId="",deniedProgramId="";\n  private Toast postNotice;', file)
    old = """   if(hubTab==2){confirmHistoryRemoval(program);return true;}
   if(hubTab==RESERVATIONS){confirmReservationRemoval(program);return true;}
   if(!program.scheduled())return false;
   confirmReservation(program);
   return true;"""
    new = """    showProgramActions(program);
    return true;"""
    source = once(source, old, new, file)
    menu = """  private void showProgramActions(NicoliveData.Program program) {
    final ArrayList<String> labels = new ArrayList<>();
    final ArrayList<Runnable> callbacks = new ArrayList<>();
    if(program.onAir()) {
      labels.add("通常再生");callbacks.add(()->watch(program.id));
      labels.add("ポップアップ再生");callbacks.add(()->openPopupFromHub(program.id));
    } else {
      labels.add("公式サイトで開く");callbacks.add(()->openTimetableProgram(program.id));
    }
    if(hubTab==2) {
      labels.add("視聴履歴から削除");callbacks.add(()->confirmHistoryRemoval(program));
    } else if(hubTab==RESERVATIONS) {
      labels.add("タイムシフト予約を取り消す");callbacks.add(()->confirmReservationRemoval(program));
    } else if(program.scheduled()) {
      labels.add("タイムシフト予約");callbacks.add(()->confirmReservation(program));
    }
    NicoliveUi.dialog(UiDialogs.builder(this).setTitle("番組の操作")
      .setItems(labels.toArray(new String[0]),(dialog,which)->callbacks.get(which).run()).create());
  }

"""
    source = once(source, " void openSelectedProgram(String id){", menu+" void openSelectedProgram(String id){", file)
    old = '@Override public void posted(boolean success,String message){if(success){if(input!=null&&pendingDraft.equals(input.getText().toString()))input.setText("");draft="";pendingDraft="";}else Toast.makeText(this,message,Toast.LENGTH_LONG).show();changed();}'
    new = '''@Override public void posted(boolean success,String message){
    if(success){
      if(input!=null&&pendingDraft.equals(input.getText().toString()))input.setText("");
      draft="";pendingDraft="";
    }
    if(postNotice!=null)postNotice.cancel();
    postNotice=Toast.makeText(this,success?"コメントを投稿しました":message,Toast.LENGTH_SHORT);
    postNotice.show();
    changed();
  }'''
    source = once(source, old, new, file)
    return source

def browser(source):
    file = "NicoliveBrowser.java"
    source = once(source,
        "volatile int generation,imageGeneration;Future<?> loading;",
        """volatile int generation,imageGeneration;Future<?> loading;
  private volatile Context appContext;
  final java.util.concurrent.ConcurrentHashMap<String,Long> missingHistory = new java.util.concurrent.ConcurrentHashMap<>();
  void setContext(Context context){appContext=context.getApplicationContext();}""", file)
    source = once(source,
        ''' void historyImage(NicoliveData.Program program,ImageView view){
  if(program.programThumbnail){image(program.thumbnail,view);return;}
  image("history:"+program.id,program.thumbnail,program.id,view);
 }''',
        '''void historyImage(NicoliveData.Program program,ImageView view){
   if(program.programThumbnail){image(program.thumbnail,view);return;}
   Long failedAt=missingHistory.get(program.id);
   if(failedAt!=null && android.os.SystemClock.elapsedRealtime()-failedAt < 180000L){
     image(program.thumbnail,view);
     return;
   }
   image("history:"+program.id,program.thumbnail,program.id,view);
  }''', file)
    old = '''    if(programId!=null){
     try{
      byte[] html=bytes("https://live.nicovideo.jp/watch/"+programId,"",2097152,false);
      decoded=decodeImage(NicoliveData.historyThumbnail(new String(html,java.nio.charset.StandardCharsets.UTF_8),programId));
     }catch(Exception ignored){}
    }'''
    new = '''     if(programId!=null){
      try{
       // Only the trusted watch host receives the current session cookie.
       Context context=appContext;
       String accountCookie=context==null?"":cookie(context);
       byte[] html=bytes("https://live.nicovideo.jp/watch/"+programId,accountCookie,2097152,false);
       String resolved=NicoliveData.historyThumbnail(
           new String(html,java.nio.charset.StandardCharsets.UTF_8),programId);
       decoded=decodeImage(resolved);
      }catch(Exception ignored){}
      if(decoded==null && token==imageGeneration) {
        if(missingHistory.size()>128)missingHistory.clear();
        missingHistory.put(programId,android.os.SystemClock.elapsedRealtime());
      } else if(decoded!=null) missingHistory.remove(programId);
     }'''
    source = once(source, old, new, file)
    source = once(source, '''void close(){closed=true;++generation;''',
                          '''void close(){missingHistory.clear();appContext=null;closed=true;++generation;''', file)
    # Preserve 15/20 s for feed data; avoid image stalls holding network threads for 35 s.
    source = once(source, '''c.setConnectTimeout(15000);c.setReadTimeout(20000);''',
        '''c.setConnectTimeout(feed?15000:8000);c.setReadTimeout(feed?20000:10000);''', file)
    return source

def data(source):
    file = "NicoliveData.java"
    old = ''' static String historyThumbnail(String html,String id)throws Exception{
  JSONObject program=embedded(html,"embedded-data","data-props").getJSONObject("program");
  if(!id.equals(program.optString("nicoliveProgramId")))throw new IOException("PROGRAM_MISMATCH");
  return broadcastThumbnail(program.optJSONObject("thumbnail"));
 }'''
    new = '''  static String historyThumbnail(String html,String id)throws Exception{
   JSONObject program=embedded(html,"embedded-data","data-props").getJSONObject("program");
   if(!id.equals(program.optString("nicoliveProgramId")))throw new IOException("PROGRAM_MISMATCH");
   JSONObject thumbnail=program.optJSONObject("thumbnail");
   String image=broadcastThumbnail(thumbnail);
   if(!image.isEmpty())return image;
   // User programs often have no "huge" variants. Prefer a landscape image or OGP
   // before a small icon that may just be a generic placeholder.
   if(thumbnail!=null){
    for(String field:new String[]{"large","middle","thumbnailUrl","url"}){
     image=thumbnail.optString(field,"");
     if(trustedThumbnail(image))return image;
    }
   }
   java.util.regex.Matcher metas=java.util.regex.Pattern.compile(
      "(?is)<meta\\\\b[^>]*>").matcher(html);
   while(metas.find()){
    String tag=metas.group();
    try{
     String key=attr(tag,"property");
     if(!"og:image".equalsIgnoreCase(key))continue;
     image=attr(tag,"content");
     if(trustedThumbnail(image))return image;
    }catch(IOException ignored){}
   }
   return thumbnail==null?"":trustedThumbnail(thumbnail.optString("small"))
       ?thumbnail.optString("small"):"";
  }
  private static boolean trustedThumbnail(String url){
   try{
    URI uri=new URI(url);
    String host=uri.getHost();
    return "https".equalsIgnoreCase(uri.getScheme())&&host!=null
      &&(host.equals("nicovideo.jp")||host.endsWith(".nicovideo.jp")
        ||host.equals("nimg.jp")||host.endsWith(".nimg.jp"));
   }catch(Exception invalid){return false;}
  }'''
    source=once(source,old,new,file)
    return source

def stage(original, destination):
    original=Path(original);destination=Path(destination)
    destination.mkdir(parents=True,exist_ok=True)
    transforms={"NicoliveActivity.java":activity,"NicoliveBrowser.java":browser,
                "NicoliveData.java":data}
    for name, fn in transforms.items():
        source=original/name
        if not source.is_file():raise ValueError(f"Missing immutable source: {source}")
        target=destination/name
        target.write_text(fn(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(destination/name for name in sorted(OVERRIDES))
