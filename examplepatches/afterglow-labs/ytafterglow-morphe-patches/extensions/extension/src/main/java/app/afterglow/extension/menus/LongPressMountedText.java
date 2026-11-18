package app.afterglow.extension.menus;

import android.view.View;
import android.view.ViewGroup;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/** Tracks native text bind generations without relying on the optional Elements root. */
public final class LongPressMountedText {
    private static final ReferenceQueue<Object> COLLECTED=new ReferenceQueue<>();
    private static final Map<Identity,Snapshot> SOURCES=new HashMap<>();
    private static final Map<View,List<Binding>> MOUNTS=new WeakHashMap<>();
    private static final AtomicInteger diagnostics=new AtomicInteger(),binds=new AtomicInteger(),missingSources=new AtomicInteger();
    private LongPressMountedText(){}
    private static boolean installed(){return InstalledTweaks.has("long-press-tools");}

    private static final class Identity extends WeakReference<Object> {
        final int hash;
        Identity(Object value,boolean stored){super(value,stored?COLLECTED:null);hash=System.identityHashCode(value);}
        @Override public int hashCode(){return hash;}
        @Override public boolean equals(Object other){return this==other||other instanceof Identity&&get()!=null&&get()==((Identity)other).get();}
    }
    /** Only immutable semantic data is retained; it cannot keep a native view tree alive. */
    private static final class Snapshot implements LongPressCaptureContext {
        final String identifier,path,text;
        final boolean postBody;
        Snapshot(LongPressCaptureContext context,CharSequence value,boolean body){
            identifier=context.afterglow_captureIdentifier();
            StringBuilder builder=context.afterglow_capturePath();path=builder==null?null:builder.toString();
            text=value.toString();postBody=body;
        }
        public View afterglow_captureRoot(){return null;}
        public Object afterglow_captureBinding(){return this;}
        public String afterglow_captureIdentifier(){return identifier;}
        public StringBuilder afterglow_capturePath(){return path==null?null:new StringBuilder(path);}
        boolean body(){return postBody&&LongPressCapturePolicy.postBody(path)||!LongPressCapturePolicy.commentIdentity(path).isEmpty();}
    }
    private static final class Binding {
        final WeakReference<Object> item,model,content;
        final Snapshot snapshot;
        Binding(Object item,Object model,Object content,Snapshot snapshot){
            this.item=new WeakReference<>(item);this.model=new WeakReference<>(model);
            this.content=new WeakReference<>(content);this.snapshot=snapshot;
        }
        boolean live(){return item.get()!=null&&model.get()!=null&&content.get()!=null;}
    }
    public static final class Selection {
        public final LongPressCapturePolicy.Entry entry;
        private final Binding binding;
        Selection(LongPressCapturePolicy.Entry entry,Binding binding){this.entry=entry;this.binding=binding;}
        public boolean sameIdentity(Selection other){return other!=null&&binding==other.binding;}
    }

    /** Called at the final native text observer for this exact source component. */
    public static void observeSource(Object source,Object context,CharSequence text,boolean postBody){
        if(!installed()||source==null||!(context instanceof LongPressCaptureContext)||text==null)return;
        try{
            Snapshot snapshot=new Snapshot((LongPressCaptureContext)context,text,postBody);
            synchronized(SOURCES){
                clean();
                // Fail open if a pathological tree exceeds the bounded provenance cache.
                if(SOURCES.size()>=4096)SOURCES.clear();
                SOURCES.put(new Identity(source,true),snapshot);
            }
        }catch(Throwable error){failure("Observe mounted text",error);}
    }
    private static Snapshot snapshotForModel(Object model){
        if(!(model instanceof LongPressMountedTextModel))return null;
        Object source=((LongPressMountedTextModel)model).afterglow_captureSource();if(source==null)return null;
        synchronized(SOURCES){clean();return SOURCES.get(new Identity(source,false));}
    }
    public static Object contextForModel(Object model){
        try{return installed()?snapshotForModel(model):null;}
        catch(Throwable error){failure("Read mounted context",error);return null;}
    }
    /** Native Lhiy.w calls this only after the exact model's bind returned successfully. */
    public static void mounted(View host,Object item,Object model,Object content){
        if(!installed()||host==null||item==null)return;
        try{
            Snapshot snapshot=snapshotForModel(model);
            synchronized(MOUNTS){
                // The same native item may move hosts during a mount update.
                for(Iterator<Map.Entry<View,List<Binding>>> iterator=MOUNTS.entrySet().iterator();iterator.hasNext();){
                    List<Binding> old=iterator.next().getValue();
                    old.removeIf(value->!value.live()||value.item.get()==item);
                    if(old.isEmpty())iterator.remove();
                }
                List<Binding> entries=MOUNTS.get(host);
                if(snapshot!=null&&model!=null&&content!=null){
                    if(entries==null){entries=new ArrayList<>();MOUNTS.put(host,entries);}
                    entries.add(new Binding(item,model,content,snapshot));
                }
                if(entries!=null&&entries.isEmpty())MOUNTS.remove(host);
            }
            if(snapshot!=null){int count=binds.incrementAndGet();if(count<=4||(count&(count-1))==0)
                trace("Text bound count="+count+" host="+host.getClass().getName()+" body="+snapshot.body());}
            else if(model instanceof LongPressMountedTextModel){int count=missingSources.incrementAndGet();if(count<=4||(count&(count-1))==0)
                trace("Text source unavailable count="+count+" model="+model.getClass().getName()+" host="+host.getClass().getName());}
        }catch(Throwable error){failure("Bind mounted text",error);}
    }
    /** The old model argument guards a late unbind against a newer same-item bind. */
    public static void unmounted(View host,Object item,Object model){
        if(host==null||item==null)return;
        try{synchronized(MOUNTS){
            List<Binding> entries=MOUNTS.get(host);if(entries==null)return;
            entries.removeIf(value->!value.live()||value.item.get()==item&&value.model.get()==model);
            if(entries.isEmpty())MOUNTS.remove(host);
        }}catch(Throwable error){failure("Unbind mounted text",error);}
    }
    public static Selection select(View root,List<? extends CharSequence> mountedText){
        if(!installed()||root==null)return null;
        try{
            List<Binding> bindings=bindings(root);if(bindings==null||bindings.isEmpty())return null;
            Binding body=null;Object token=new Object();LongPressCapturePolicy policy=new LongPressCapturePolicy(token);
            for(Binding binding:bindings){
                Snapshot value=binding.snapshot;
                policy.observe(token,value.identifier,value.path,value.text);
                if(value.postBody)policy.observePost(token,value.path,value.text);
                if(value.body()){
                    // Distinct native body mounts remain ambiguous even if their text is identical.
                    if(body!=null)return null;body=binding;
                }
            }
            LongPressCapturePolicy.Entry selected=policy.match(mountedText);
            return selected==null||body==null?null:new Selection(selected,body);
        }catch(Throwable error){failure("Select mounted text",error);return null;}
    }
    private static List<Binding> bindings(View root){
        List<Binding> result=new ArrayList<>();List<View> queue=new ArrayList<>();queue.add(root);
        synchronized(MOUNTS){
            for(int n=0;n<queue.size()&&n<512;n++){
                View view=queue.get(n);if(view.getVisibility()!=View.VISIBLE)continue;
                List<Binding> found=MOUNTS.get(view);
                if(found!=null){
                    for(Iterator<Binding> iterator=found.iterator();iterator.hasNext();){
                        Binding binding=iterator.next();if(!binding.live())iterator.remove();else result.add(binding);
                    }
                }
                if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)queue.add(group.getChildAt(i));}
            }
        }
        return queue.size()>512?null:result;
    }
    static boolean descendantOf(View view,View root){
        for(int depth=0;view!=null&&depth<64;depth++){
            if(view==root)return true;Object parent=view.getParent();view=parent instanceof View?(View)parent:null;
        }
        return false;
    }
    private static void clean(){Identity stale;while((stale=(Identity)COLLECTED.poll())!=null)SOURCES.remove(stale);}
    private static void trace(String message){if(DebugLog.shouldWrite("long-press")&&diagnostics.getAndIncrement()<48)DebugLog.write("long-press",message);}
    private static void failure(String action,Throwable error){try{trace(action+" unavailable: "+error.getClass().getSimpleName());}catch(Throwable ignored){}}
}
