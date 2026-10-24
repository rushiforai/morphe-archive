// Native cached thumbnail pixels before/after rebinding the same response.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!String(app.getPackageName()).endsWith('.haiagaru.resumefix242'))throw Error('242 verification only');
 Java.classFactory.loader=app.getClassLoader();
 const F=Java.use('app.morphe.extension.chmate.FilterPosition'),E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),RV=Java.use('androidx.recyclerview.widget.RecyclerView'),Group=Java.use('android.view.ViewGroup'),Row=Java.use('o.zzbhe'),Image=Java.use('o.zzbes');
 let fragment,list,adapter;
 Java.choose('jp.syoboi.a2chMate.ui.reslist.ResListFragment',{onMatch(f){if(f.getView()&&f.getView().isShown())fragment=Java.retain(f);},onComplete(){Java.scheduleOnMainThread(()=>{if(!fragment){console.log('FAIL no fragment');return;}list=Java.retain(Java.cast(F.findList(fragment.getView()),RV));adapter=Java.retain(Java.cast(E.adapter(fragment),Java.use('o.zzacr')));list.scrollToPosition(adapter.e(2));});}});
 function draw(view){const B=Java.use('android.graphics.Bitmap'),b=B.createBitmap(view.getWidth(),view.getHeight(),Java.use('android.graphics.Bitmap$Config').ARGB_8888.value);view.draw(Java.use('android.graphics.Canvas').$new(b));return b;}
 setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{let before,after;try{
  const holder=list.findViewHolderForAdapterPosition(adapter.e(2));if(!holder)throw Error('Response 2 not mounted');
  let row,image;function walk(v){if(Row.class.isInstance(v))row=Java.cast(v,Row);if(Image.class.isInstance(v))image=Java.cast(v,Image);if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)walk(g.getChildAt(i));}}walk(holder.itemView.value);
  if(!row||!image||image.getWidth()===0||image.getHeight()===0)throw Error('Loaded native thumbnail required');
  const url=String(image.getImageUrl()),parent=image.getParent(),hash=image.hashCode();before=draw(image);
  let identical=0;for(let n=0;n<5;n++){adapter.onBindViewHolder(holder,adapter.e(2));after=draw(image);if(before.sameAs(after)&&String(image.getImageUrl())===url&&image.hashCode()===hash&&Java.cast(image.getParent(),Java.use('java.lang.Object')).equals(parent))identical++;after.recycle();after=null;}
  if(identical!==5)throw Error('Thumbnail pixels changed during '+(5-identical)+' repeated binds');
  console.log('THUMBNAIL_PIXELS242_COMPLETE 5 native rebinds retain thumbnail pixels, URL and view');
 }catch(e){console.log('FAIL '+e.stack);}finally{if(before)before.recycle();if(after)after.recycle();}})),2200);
});
