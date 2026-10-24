// Isolated 191: compare every cached result with the preserved original parser.
setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!app.getPackageName().toString().endsWith('.settingsfix191'))throw Error('191 test app required');
 const P=Java.use('o.r8lambda4fIVmDse184MJavTVTXSBZQF_UA');
 let checks=0;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 const parser=P.$new(),dates=[];
 for(let i=0;i<1000;i++)dates.push('2026/10/21(水) 01:'+String(Math.floor(i/60)).padStart(2,'0')+':'+String(i%60).padStart(2,'0')+'.'+String(i%1000).padStart(3,'0'));
 const expected=dates.map(d=>parser.haiagaruNativeDrawDate(d).toString());
 for(let i=0;i<dates.length;i++)if(parser.b(dates[i]).toString()!==expected[i])throw Error('native mismatch '+i);
 check(true,'1000 full dates retain exact native result');
 for(const value of ['2026/10/21(水) 01:00:00.000 ID:abc','2026/10/21(水) 01:00:00','invalid','26/10/21 01:02:03']){
  check(parser.b(value).toString()===parser.haiagaruNativeDrawDate(value).toString(),'native behavior '+value);
 }
 const Clock=Java.use('android.os.SystemClock');let started=Number(Clock.elapsedRealtimeNanos());
 for(let pass=0;pass<5;pass++)for(const date of dates)parser.haiagaruNativeDrawDate(date);
 const original=(Number(Clock.elapsedRealtimeNanos())-started)/1000000;
 started=Number(Clock.elapsedRealtimeNanos());
 for(let pass=0;pass<5;pass++){const p=P.$new();for(const date of dates)p.b(date);}
 const cached=(Number(Clock.elapsedRealtimeNanos())-started)/1000000;
 console.log('TIMING native='+original.toFixed(1)+'ms cached='+cached.toFixed(1)+'ms (Frida overhead included)');
 console.log('PASS '+checks+' actual native date checks');
}),1500);
