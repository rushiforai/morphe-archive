// Call stacks only; never logs dialog text, drafts, URLs or cookie values.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const D=Java.use('android.app.Dialog'),System=Java.use('java.lang.System');
    const Log=Java.use('android.util.Log'),Exception=Java.use('java.lang.Exception');
    ['show','dismiss'].forEach(name=>{const original=D[name].overload();original.implementation=function(){
        if(String(this.getClass().getName())!=='app.morphe.extension.chmate.HaiagaruDialog')return original.call(this);
        console.log('DIALOG_'+name+' id='+System.identityHashCode(this)+' before='+this.isShowing());
        if(name==='show')console.log(String(Log.getStackTraceString(Exception.$new())).split('\n').slice(0,13).join('\n'));
        const value=original.call(this);
        console.log('DIALOG_'+name+' id='+System.identityHashCode(this)+' after='+this.isShowing()+' attached='+this.getWindow().getDecorView().isAttachedToWindow());
        return value;
    };});
});
