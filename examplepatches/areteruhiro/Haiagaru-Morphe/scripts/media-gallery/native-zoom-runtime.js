let zoomFixture;
rpc.exports.nativeZoom=function(enlarge){return main(()=>{
 const a=current(),Nav=Java.use(P+'MediaViewerNavigation'),Group=Java.use('android.view.ViewGroup');let image;
 const names={'o.qhbExternalSyntheticLambda0':['C','B','aa'],'o.TTVideoLandingPageActivity4':['D','C','aa'],'o.zzbfo':['mScale','startScale','mFitScale']};
 function walk(v){if(!v.isShown())return;const name=String(v.getClass().getName());if(names[name])image=Java.cast(v,Java.use(name));if(Group.class.isInstance(v)){const group=Java.cast(v,Group);for(let i=0;i<group.getChildCount();i++)walk(group.getChildAt(i));}}
 walk(a.getWindow().getDecorView());if(!image)throw Error('current native image canvas missing');
 const fields=names[String(image.getClass().getName())],values=fields.map(n=>field(image,n).getFloat(image));
 if(!zoomFixture)zoomFixture={image:Java.retain(image),scale:values[0]};
 if(enlarge)image.setPosition(0,0,Math.max(values[1],values[2])*1.5,false);
 else if(zoomFixture)image.setPosition(0,0,zoomFixture.scale,false);
 const method=Nav.class.getDeclaredMethod('zoomed',Java.array('java.lang.Class',[Java.use('android.view.View').class]));method.setAccessible(true);
 return {canvas:String(image.getClass().getName()),values,blocked:String(method.invoke(null,Java.array('java.lang.Object',[image])))==='true'};
});};
rpc.exports.restoreZoom=function(){return main(()=>{if(zoomFixture){zoomFixture.image.setPosition(0,0,zoomFixture.scale,false);zoomFixture=null;}return true;});};
