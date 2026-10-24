// Opens only the internal search form. Does not start a scan.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
    if(!/\.haiagaru\.resumefix226$/.test(pkg))throw Error('Isolated 226 app required');
    Java.scheduleOnMainThread(function(){
        const intent=Java.use('android.content.Intent').$new();intent.setClassName(pkg,'app.morphe.extension.chmate.HissiWacchoiSearchActivity');intent.addFlags(0x10000000);
        intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,'haiagaru.wacchoi.host','egg.5ch.io');
        intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,'haiagaru.wacchoi.board','android');
        app.startActivity(intent);console.log('SEARCH_FORM_OPENED no scan requested');
    });
});
