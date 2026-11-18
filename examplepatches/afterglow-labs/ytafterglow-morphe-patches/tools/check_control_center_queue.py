#!/usr/bin/env python3
"""Exercise the real Control Center queue listener with deterministic Android callbacks."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
STUBS = {
    'android/view/View.java': '''package android.view; import java.util.*; public class View {
 public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
 private boolean attached; private List<OnAttachStateChangeListener> listeners=new ArrayList<>();
 public List<Runnable> pending=new ArrayList<>(); public int posts;public long delay;
 public boolean isAttachedToWindow(){return attached;}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listeners.add(l);}
 public boolean postDelayed(Runnable r,long ms){posts++;delay=ms;pending.add(r);return true;}
 public boolean removeCallbacks(Runnable r){return pending.removeIf(p->p==r);}
 public void attach(){attached=true;for(var l:listeners)l.onViewAttachedToWindow(this);}
 public void detach(){attached=false;for(var l:listeners)l.onViewDetachedFromWindow(this);}
 public void flush(){List<Runnable> jobs=new ArrayList<>(pending);pending.clear();for(var r:jobs)r.run();}
}''',
    'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View {
 private String text="";public int writes;public boolean focused=true;
 public CharSequence getText(){return text;} public void setText(CharSequence value){text=value.toString();writes++;}
}''',
    'app/afterglow/extension/downloads/DownloadManager.java': '''package app.afterglow.extension.downloads; import java.util.*; public class DownloadManager {
 public interface Listener{void onDownloadsChanged();}
 public boolean loaded=true;public String recovery;public List<DownloadJob> jobs=new ArrayList<>();
 public List<Listener> listeners=new ArrayList<>();public Library library=new Library();
 public boolean isLoaded(){return loaded;}public List<DownloadJob> snapshot(){return new ArrayList<>(jobs);}
 public String recoveryMessage(){return recovery;} public Library library(){return library;}
 public void addListener(Listener l){if(!listeners.contains(l))listeners.add(l);}public void removeListener(Listener l){listeners.remove(l);}
 public void changed(){for(var l:new ArrayList<>(listeners))l.onDownloadsChanged();}
 public static class Library{public List<LibraryItem> items=new ArrayList<>();public String recovery;
 public List<LibraryItem> snapshot(){return new ArrayList<>(items);}public String recoveryMessage(){return recovery;}}
}''',
    'app/afterglow/extension/downloads/QueueFixtures.java': '''package app.afterglow.extension.downloads; public class QueueFixtures {
 public static DownloadJob job(String id,DownloadJob.State state,DownloadJob.Phase phase,long bytes,long total){
 DownloadRequest request=new DownloadRequest("video"+id);request.title="Title "+id;
 return new DownloadJob(id,request,state,phase,bytes,total,1,bytes,"","",0);}
 public static LibraryItem item(String id,long created,boolean missing){return new LibraryItem(id,"video"+id,"Title "+id,"Channel","","","item.mp4","video/mp4","720p","","","",created,1,1,0,720,false,DownloadRequest.Kind.VIDEO,missing?LibraryItem.RepairState.MISSING:LibraryItem.RepairState.HEALTHY);}
}''',
}
with tempfile.TemporaryDirectory(prefix='afterglow-control-center-queue-') as directory:
    temp = Path(directory)
    sources = []
    for name, body in STUBS.items():
        path = temp/name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(body)
        sources.append(path)
    classes = temp/'classes'
    classes.mkdir()
    subprocess.run(['javac', '-encoding', 'UTF-8', '-sourcepath', str(EXT), '-d', str(classes),
                    *map(str, sources), str(ROOT/'tools/jvm/ControlCenterQueueTest.java')], check=True)
    subprocess.run(['java', '-cp', str(classes), 'app.afterglow.extension.ui.ControlCenterQueueTest'], check=True, timeout=30)
