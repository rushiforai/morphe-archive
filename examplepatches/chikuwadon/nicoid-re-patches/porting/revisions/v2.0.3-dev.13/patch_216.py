"""v2.0.3-dev.13: compact download size, estimated totals, fixed menu label,
and per-user NicoLive media artwork resolution with safe fallbacks.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.3-dev.12/patch_215.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev12",PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=frozenset(set(previous.OVERRIDES)|{"NicoliveService.java"})

def once(src,old,new,why):
    n=src.count(old)
    if n!=1:
        raise AssertionError("%s: expected one anchor, found %d"%(why,n))
    return src.replace(old,new)

def downloads(src):
    # The progress bar remains its own view; the capacity no longer occupies
    # an additional third text row. The second text row is allowed to wrap.
    old='String amount=DownloadJobs115.format(r.bytes)+(r.total>0?" / "+DownloadJobs115.format(r.total):"")'
    new='''String amount=DownloadJobs115.format(r.bytes)+(r.total>0
     ?" / "+DownloadJobs115.format(r.total)
     :mode==0 && r.percent>0 && r.bytes>0 && r.percent<100
      ?" / 約"+DownloadJobs115.format(Math.max(r.bytes,(long)Math.ceil(r.bytes*100d/r.percent)))+"（推定）"
      :mode==0&&"ダウンロード中".equals(r.status)?" / 総容量取得中":"")'''
    src=once(src,old,new,"show known or estimated overall capacity")
    old='((TextView)row.getChildAt(3)).setText(amount);return row;'
    new='''TextView detail=(TextView)row.getChildAt(1);
      detail.setText(detail.getText()+" · "+amount);
      TextView oldCapacity=(TextView)row.getChildAt(3);
      oldCapacity.setText("");
      oldCapacity.setVisibility(View.GONE);
      return row;'''
    src=once(src,old,new,"move all size and speed into second text row")
    return src

def live_program(src):
    marker="public static final class Program {"
    src=once(src,marker,marker+'''
   // Kept separate from the thumbnail used in on-screen program listings.
   // The media notification tries actual broadcast artwork before avatars.
   public final ArrayList<String> mediaThumbnails=new ArrayList<String>();''',
       "program notification artwork candidates")
    # Do not assume the internals of Program.watch are unchanged by the
    # previous releases; insert immediately before this method's return.
    begin=src.index("public static Program watch(String html,String expected)")
    finish=src.index("static Program listing",begin)
    method=src[begin:finish]
    if method.count("return v;")!=1:
        raise AssertionError("NicoLive watch return anchor changed")
    addition='''
    // User broadcasts may have no huge thumbnail. Prefer larger program
    // art or OGP over the default user avatar for media notifications.
    try{
     String preferred=NicoliveData.historyThumbnail(html,expected);
     addMediaArtwork(v,preferred);
    }catch(Exception ignored){}
    addMediaArtwork(v,v.thumbnail);
    if(thumb!=null){
     for(String field:new String[]{"large","middle","thumbnailUrl","url","small"})
      addMediaArtwork(v,thumb.optString(field,""));
    }
    '''
    method=method.replace("return v;",addition+"return v;")
    src=src[:begin]+method+src[finish:]
    marker="public static final class Program {"
    methods='''  static void addMediaArtwork(Program p,String url){
   if(p==null||!NicoliveArtwork.isTrusted(url)||p.mediaThumbnails.contains(url))return;
   if(p.mediaThumbnails.size()<8)p.mediaThumbnails.add(url);
  }

'''
    src=once(src,marker,methods+marker,"trusted media-artwork candidates")
    return src

def live_service(src):
    before='''  void requestArtwork(NicoliveData.Program p){
   clearArtwork();
   if(p==null||p.thumbnail==null||!NicoliveArtwork.isTrusted(p.thumbnail))return;
   final int token=artworkToken;
   final String programId=p.id,url=p.thumbnail;
   artworkProgramId=programId;
   artworkTask=artworkWork.submit(()->{
    final Bitmap bitmap=NicoliveArtwork.fetch(url);
    main.post(()->{
     if(stopped||token!=artworkToken||program==null||!programId.equals(program.id))return;
     mediaArtwork=bitmap;
     if(bitmap!=null)updateNotification();
    });
   });
  }'''
    after='''  void requestArtwork(NicoliveData.Program p){
   clearArtwork();
   if(p==null)return;
   final ArrayList<String> candidates=new ArrayList<String>();
   for(String candidate:p.mediaThumbnails){
    if(NicoliveArtwork.isTrusted(candidate)&&!candidates.contains(candidate))
     candidates.add(candidate);
   }
   if(NicoliveArtwork.isTrusted(p.thumbnail)&&!candidates.contains(p.thumbnail))
    candidates.add(p.thumbnail);
   if(candidates.isEmpty()){
    NicoliveDiagnostics.record("ARTWORK","no trusted artwork candidate for current live program");
    return;
   }
   final int token=artworkToken;
   final String programId=p.id;
   artworkProgramId=programId;
   artworkTask=artworkWork.submit(()->{
    Bitmap found=null;
    int attempts=0;
    // A rejected/missing large image must not suppress all media artwork.
    for(String url:candidates){
     if(Thread.currentThread().isInterrupted())return;
     attempts++;
     found=NicoliveArtwork.fetch(url);
     if(found!=null)break;
    }
    final Bitmap bitmap=found;
    final int tried=attempts;
    main.post(()->{
     if(stopped||token!=artworkToken||program==null||!programId.equals(program.id))return;
     mediaArtwork=bitmap;
     // Never record URL, cookies, thumbnail query tokens or program IDs.
     NicoliveDiagnostics.record("ARTWORK","candidates="+candidates.size()
        +" attempted="+tried+" result="+(bitmap==null?"unavailable":"decoded"));
     if(bitmap!=null)updateNotification();
    });
   });
  }'''
    begin=src.index("void requestArtwork(NicoliveData.Program p){")
    end=src.index("PendingIntent action(",begin)
    current=src[begin:end]
    if current.count("artworkWork.submit(")!=1 or current.count("clearArtwork()")!=1:
        raise AssertionError("NicoLive requestArtwork structure changed")
    return src[:begin]+after.strip()+"\n  "+src[end:]

def stage(base,destination):
    base,destination=Path(base),Path(destination)
    previous.stage(base,destination)
    download=destination/"DownloadUi115.java"
    download.write_text(downloads(download.read_text(encoding="utf-8")),encoding="utf-8")
    data=destination/"NicoliveData.java"
    data.write_text(live_program(data.read_text(encoding="utf-8")),encoding="utf-8")
    service=destination/"NicoliveService.java"
    # Previous stage already applies NicoLive popup-corner/resize fixes.
    # Always extend the staged service, never the older v2.0.0 base class.
    existing=service if service.is_file() else base/"NicoliveService.java"
    service.write_text(live_service(existing.read_text(encoding="utf-8")),
                       encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
