// Synthetic native menu test: no saved archives, DAT edits, posts, or network requests.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.archivemenu191')throw Error('Wrong package');
 Java.scheduleOnMainThread(function(){
  try{
   const menu=Java.use('o.m6fExternalSyntheticLambda0').$new(app);
   const board=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo').$new.overload('java.lang.String','java.lang.String','java.lang.Long','int','java.lang.Integer','java.lang.String')
    .call(Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),'example.invalid','fixture',Java.use('java.lang.Long').valueOf(1234567890),0,null,null);
   const response=Java.use('o.processAdDisplayErrorPostbackForUserError').$new(42,'fixture','sage','2026/10/17 ID:fixture','fixture');
   Java.use('app.morphe.extension.chmate.ResponseArchive').append(null,menu,response,board);
   const rows=[];
   for(let i=0;i<menu.size();i++){const item=menu.getItem(i);rows.push({id:item.getItemId(),title:String(item.getTitle())});}
   console.log('MODEL '+JSON.stringify(rows));
   const expected=['保存済みレスを見る','このレスをアーカイブに保存'];
   expected.forEach(label=>{if(!rows.some(row=>row.title===label))throw Error('Missing label '+label);});
   const adapter=Java.use('o.m6f').$new(app,2131558525,menu);
   const Text=Java.use('android.widget.TextView'),Group=Java.use('android.view.ViewGroup');
   function texts(v,out){if(Text.class.isInstance(v))out.push(String(Java.cast(v,Text).getText()));if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let i=0;i<g.getChildCount();i++)texts(g.getChildAt(i),out);}}
   for(let i=0;i<adapter.getCount();i++){
    const out=[],row=adapter.getView(i,null,Java.use('android.widget.FrameLayout').$new(app));texts(row,out);
    const id=Java.cast(adapter.getItem(i),Java.use('android.view.MenuItem')).getItemId();
    console.log('ROW '+JSON.stringify({id:id,texts:out}));
    if(id===0x7e484a01 && !out.includes('レスを保存'))throw Error('Save label not compact');
    if(id===0x7e484b01 && !out.includes('投稿者を強調'))throw Error('Highlight label not compact');
    row.measure(0x40000000|191,0);row.layout(0,0,191,row.getMeasuredHeight());
    function checkLayout(v){
     if(Text.class.isInstance(v)){
      const t=Java.cast(v,Text),layout=t.getLayout();
      if(layout!==null && /レスを保存|投稿者を強調|保存済みレスを見る/.test(String(t.getText()))){
       for(let line=0;line<layout.getLineCount();line++)if(layout.getEllipsisCount(line)>0)throw Error('Ellipsized label');
       if(layout.getLineEnd(layout.getLineCount()-1)<t.getText().length())throw Error('Clipped label');
       console.log('PASS full label at 191px grid width');
      }
     }
     if(Group.class.isInstance(v)){const g=Java.cast(v,Group);for(let n=0;n<g.getChildCount();n++)checkLayout(g.getChildAt(n));}
    }
    checkLayout(row);
   }
   console.log('FIXTURE_COMPLETE');
  }catch(e){console.log('FAIL '+e);if(e.$h)console.log(Java.use('android.util.Log').getStackTraceString(e));}
 });
});
