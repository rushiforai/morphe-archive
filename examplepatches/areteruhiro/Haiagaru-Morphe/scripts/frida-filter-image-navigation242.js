// Uses the visible thread's real filter and native image-list callback; no post or data deletion.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const Filters=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');let target=null;
    function field(o,name){let cls=o.getClass();while(cls){try{const f=cls.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(e){cls=cls.getSuperclass();}}throw Error(name);}
    Java.scheduleOnMainThread(()=>{try{
        const listField=Filters.class.getDeclaredField('OWNERS');listField.setAccessible(true);
        const owners=Java.cast(listField.get(null),Java.use('java.util.List'));
        for(let i=owners.size()-1;i>=0;i--){
            const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
            const method=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[]));
            const view=method.invoke(owner,Java.array('java.lang.Object',[]));
            if(view&&Java.cast(view,Java.use('android.view.View')).isShown()){target=Java.retain(owner);break;}
        }
        if(!target)throw Error('No visible thread');
        if(!Filters.open(target))throw Error('Filter did not open');
        console.log('PASS real toolbar filter opened');
    }catch(e){console.log('FAIL FILTER_OPEN '+e.stack);}});
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        if(!target)return;
        const state=Filters.state(Filters.adapter(target));
        const ref=Java.cast(field(state,'dialog'),Java.use('java.lang.ref.WeakReference'));
        const dialog=Java.cast(ref.get(),Java.use('app.morphe.extension.chmate.HaiagaruDialog'));
        const list=dialog.getListView();
        if(!list.getOnItemLongClickListener().onItemLongClick(list,null,2,2))throw Error('Image long-click unhandled');
        console.log('PASS actual image long-click callback dispatched');
        const keep=Java.retain(dialog);
        setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
            console.log('FILTER_AFTER_NAV showing='+keep.isShowing()+' attached='+keep.getWindow().getDecorView().isAttachedToWindow());
        })),1500);
    }catch(e){console.log('FAIL FILTER_IMAGE '+e.stack);}})),1500);
});
