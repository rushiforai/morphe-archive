// Isolated service/worker regression. All page fetches are intercepted: no site is contacted.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!/\.haiagaru\.resumefix226$/.test(String(app.getPackageName())))throw Error('Isolated 226 package required');
    const Service=Java.use('app.morphe.extension.chmate.WacchoiSearchService');
    const Job=Java.use('app.morphe.extension.chmate.WacchoiBackgroundJob');
    const Intent=Java.use('android.content.Intent'),Thread=Java.use('java.lang.Thread');
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
    const keys=['wacchoiSearchEnabled','wacchoiSearchHistory'];
    const saved=keys.map(k=>[k,prefs.contains(k),prefs.getBoolean(k,true)]);
    const originalCurrent=Service.current.value;
    let checks=0,done=false;
    function check(value,label){if(!value)throw Error(label);checks++;console.log('PASS '+label);}
    const ids=[0,1,2,3].map(()=>String(Java.use('java.util.UUID').randomUUID()));
    function get(i){return Service.get(ids[i]);}
    function send(i,action){
        const intent=Intent.$new();intent.setClassName(String(app.getPackageName()),'app.morphe.extension.chmate.WacchoiSearchService');
        intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,'haiagaru.searchJobId',ids[i]);
        if(action)intent.setAction(action);
        else{
            for(const pair of [['boards','android'],['from','20261020'],['to','20261020'],['four','Ab12'],['startAt',String(i+2)]])
                intent.putExtra.overload('java.lang.String','java.lang.String').call(intent,pair[0],pair[1]);
            intent.putExtra.overload('java.lang.String','int').call(intent,'limit',10);
        }
        app.startForegroundService(intent);
    }
    function cleanup(){
        if(done)return;done=true;
        for(let i=0;i<3;i++){const job=get(i);if(job!==null)job.cancel();}
        setTimeout(()=>Java.perform(()=>{
            Java.scheduleOnMainThread(()=>{
                for(let i=0;i<3;i++){const job=get(i);if(job!==null&&!job.running.value){job.release();Service.JOBS.value.remove(ids[i]);}}
                Service.current.value=originalCurrent;
                const edit=prefs.edit();for(const old of saved){if(old[1])edit.putBoolean(old[0],old[2]);else edit.remove(old[0]);}edit.commit();
                Job.fetch.implementation=null;Job.fetchEdge.implementation=null;
                console.log('PARALLEL_FIXTURE_CLEANUP checks='+checks);
            });
        }),1500);
    }
    function main(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(error){console.log('FAIL '+error);cleanup();}})),delay);}
    Job.fetch.implementation=function(){Thread.sleep(15000);throw Java.use('java.lang.InterruptedException').$new('fixture end: no network');};
    Job.fetchEdge.implementation=Job.fetch.implementation;
    main(0,()=>{
        check(Service.jobs().size()===0,'no pre-existing background jobs');
        prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();
        for(let i=0;i<3;i++)send(i,null);
    });
    main(3000,()=>{
        for(let i=0;i<3;i++)check(get(i)!==null&&get(i).running.value,'independent running job '+i);
        check(get(0).manualStartAt.value===2&&get(1).manualStartAt.value===3&&get(2).manualStartAt.value===4,'manual start positions stay per-job');
        send(3,null);send(0,'stop');
    });
    main(5000,()=>{
        check(get(3)===null,'fourth concurrent scan is rejected');
        check(!get(0).running.value&&get(0).canResume(),'stopped job retains its cursor');
        check(get(1).running.value&&get(2).running.value,'stopping one job leaves other jobs running');
        send(0,'resume');
    });
    main(7500,()=>{
        check(get(0).running.value,'selected stopped job resumes');
        check(get(1).running.value&&get(2).running.value,'resume does not replace other jobs');
        for(let i=0;i<3;i++)send(i,'stop');
    });
    main(10000,()=>{
        for(let i=0;i<3;i++)check(!get(i).running.value,'worker exits cleanly '+i);
        console.log('PASS '+checks+' parallel scan service checks');cleanup();
    });
});
