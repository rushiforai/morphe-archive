package patches.maps.gearslip;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/** Ownership comes from a created car window, never from the time a model arrives. */
final class NativeCarScopes {
    private static final class Binding {
        final WeakReference<Object> owner;
        boolean ambiguous;
        Binding(Object owner){this.owner=new WeakReference<>(owner);}
        Object owner(){return ambiguous?null:owner.get();}
        void also(Object next){if(owner.get()!=next)ambiguous=true;}
    }
    private static final Map<Context,Binding> CONTEXTS=new WeakHashMap<>();
    private static final Map<Object,Binding> PRODUCERS=new WeakHashMap<>();
    private static final Map<Integer,Binding> DISPLAYS=new java.util.HashMap<>();
    private NativeCarScopes() {}

    static synchronized void window(Object owner,Context... contexts){
        if(owner==null)return;
        for(Context context:contexts){
            Set<Context> seen=Collections.newSetFromMap(new IdentityHashMap<>());
            for(Context node=context;node!=null&&seen.add(node);node=node instanceof ContextWrapper?((ContextWrapper)node).getBaseContext():null){
                if(application(node))break;
                Binding binding=CONTEXTS.get(node);if(binding==null)CONTEXTS.put(node,new Binding(owner));else binding.also(owner);
            }
        }
    }
    static synchronized void display(Object owner,int id){
        if(owner==null||id<=0)return;
        Binding binding=DISPLAYS.get(id);if(binding==null)DISPLAYS.put(id,new Binding(owner));else binding.also(owner);
    }
    static synchronized void producer(Object producer,Object owner){
        if(producer==null||owner==null)return;
        Binding binding=PRODUCERS.get(producer);if(binding==null)PRODUCERS.put(producer,new Binding(owner));else binding.also(owner);
    }
    static synchronized Object producerOwner(Object producer){Binding binding=PRODUCERS.get(producer);return binding==null?null:binding.owner();}
    static synchronized Object contextOwner(Context context){
        Set<Context> seen=Collections.newSetFromMap(new IdentityHashMap<>());
        for(Context node=context;node!=null&&seen.add(node);node=node instanceof ContextWrapper?((ContextWrapper)node).getBaseContext():null){
            if(application(node))break;
            Binding binding=CONTEXTS.get(node);if(binding!=null&&binding.owner()!=null)return binding.owner();
            if(Build.VERSION.SDK_INT>=30)try{
                android.view.Display display=node.getDisplay();
                if(display!=null&&display.getDisplayId()>0){binding=DISPLAYS.get(display.getDisplayId());if(binding!=null&&binding.owner()!=null)return binding.owner();}
            }catch(RuntimeException nonVisualContext){ /* A process context proves no window ownership. */ }
        }
        return null;
    }
    static Object owner(Context context,Object producer){
        Object owner=contextOwner(context);
        if(owner!=null){producer(producer,owner);return owner;}
        return producerOwner(producer);
    }
    /** Native uvs scene objects retain their window Context or View across asynchronous reads. */
    static Object sceneOwner(Object scene,Object producer)throws IllegalAccessException{
        Object found=null;
        for(Class<?> type=scene.getClass();type!=null&&type!=Object.class;type=type.getSuperclass())for(Field field:type.getDeclaredFields()){
            if(Modifier.isStatic(field.getModifiers()))continue;
            if(!Context.class.isAssignableFrom(field.getType())&&!View.class.isAssignableFrom(field.getType()))continue;
            field.setAccessible(true);Object value=field.get(scene);
            Context context=value instanceof View?((View)value).getContext():value instanceof Context?(Context)value:null;
            Object owner=contextOwner(context);if(owner!=null){if(found!=null&&found!=owner)return null;found=owner;}
        }
        if(found!=null){producer(producer,found);return found;}return producerOwner(producer);
    }
    private static boolean application(Context context){return context instanceof Application||context==context.getApplicationContext();}
}
