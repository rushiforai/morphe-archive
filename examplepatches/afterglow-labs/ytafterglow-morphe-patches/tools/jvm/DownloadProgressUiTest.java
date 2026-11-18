package app.afterglow.extension.ui;
import android.app.Activity;import android.app.Dialog;import android.widget.*;import android.view.View;import app.afterglow.extension.downloads.*;import java.lang.reflect.*;import java.util.*;
public class DownloadProgressUiTest {
 static int checks;static DownloadManager manager=DownloadManager.INSTANCE;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
 static Object get(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 static void set(Object o,String name,Object value)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);f.set(o,value);}
 static void call(Object o,String name)throws Exception{Method m=o.getClass().getDeclaredMethod(name);m.setAccessible(true);m.invoke(o);}
 static void job(DownloadJob.State state,DownloadJob.Phase phase,long bytes){manager.jobs=new ArrayList<>(List.of(DownloadManager.job("job",state,phase,bytes)));}
 static void pulse(){manager.pulse();VaultViews.MAIN.idle();}
 public static void main(String[] args)throws Exception{
  job(DownloadJob.State.RUNNING,DownloadJob.Phase.VIDEO_TRANSFER,1000);
  Constructor<DownloadProgressSheet> c=DownloadProgressSheet.class.getDeclaredConstructor(Activity.class,String.class);c.setAccessible(true);DownloadProgressSheet sheet=c.newInstance(new Activity(),"job");call(sheet,"show");
  LinearLayout actions=(LinearLayout)get(sheet,"actions");TextView pause=(TextView)actions.getChildAt(0),title=(TextView)get(sheet,"title"),phase=(TextView)get(sheet,"phase");ProgressBar progress=(ProgressBar)get(sheet,"progress");
  int titleSets=title.assignments,phaseSets=phase.assignments,removed=actions.removals;
  check("Pause".contentEquals(pause.getText())&&actions.getChildCount()==2,"Actual running actions built");
  for(int i=1;i<=10;i++){job(DownloadJob.State.RUNNING,DownloadJob.Phase.VIDEO_TRANSFER,1000+i*100);pulse();VaultViews.MAIN.advance(50);}
  check(actions.getChildAt(0)==pause&&actions.removals==removed,"Progress burst preserves actual Pause view");check(title.assignments==titleSets&&phase.assignments==phaseSets,"Burst has no repeated text assignments");check(VaultViews.MAIN.size()==1,"Progress burst coalesces to one pending render");
  VaultViews.MAIN.advance(750);check(actions.getChildAt(0)==pause&&actions.removals==removed,"Coalesced render keeps action identity");check(title.assignments==titleSets&&phase.assignments==phaseSets+1,"Only changed phase text updates");
  int pWrites=progress.writes,phaseWrites=phase.assignments;pulse();VaultViews.MAIN.advance(1250);check(progress.writes==pWrites&&phase.assignments==phaseWrites&&title.assignments==titleSets,"Identical progress and labels are not reassigned");
  job(DownloadJob.State.PAUSED,DownloadJob.Phase.VIDEO_TRANSFER,2000);pulse();TextView resume=(TextView)actions.getChildAt(0);check(resume!=pause&&"Resume".contentEquals(resume.getText()),"Pause state immediately replaces controls once");resume.performClick();check(manager.resumes==1,"Mounted Resume action remains usable");
  job(DownloadJob.State.RUNNING,DownloadJob.Phase.VIDEO_TRANSFER,2000);pulse();pause=(TextView)actions.getChildAt(0);job(DownloadJob.State.RUNNING,DownloadJob.Phase.AUDIO_TRANSFER,2000);pulse();check(actions.getChildAt(0)==pause&&phase.getText().toString().contains("audio"),"Phase transition is immediate without rebuilding actions");
  job(DownloadJob.State.RUNNING,DownloadJob.Phase.AUDIO_TRANSFER,5000);pulse();check(VaultViews.MAIN.size()==1,"Pending progress before close");((Dialog)get(sheet,"dialog")).dismiss();VaultViews.MAIN.advance(1250);check(manager.listeners.isEmpty()&&VaultViews.MAIN.size()==0,"Dismiss removes listener and delayed render");
  VaultActivity vault=new VaultActivity();VaultViews views=new VaultViews(vault);set(vault,"manager",manager);set(vault,"library",manager.lib);set(vault,"items",manager.lib.items);set(vault,"views",views);set(vault,"queueSlot",new LinearLayout(vault));LinearLayout rails=new LinearLayout(vault);View sentinel=new View(vault);rails.addView(sentinel);set(vault,"librarySlot",rails);set(vault,"initialActionsStarted",true);call(vault,"onStart");
  LinearLayout container=(LinearLayout)get(vault,"queueContainer");Map<?,?> rows=(Map<?,?>)get(vault,"queueRows");Object row=rows.get("job");LinearLayout rowRoot=(LinearLayout)get(row,"root"),rowActions=(LinearLayout)get(row,"actions");View rowPause=rowActions.getChildAt(0);TextView rowTitle=(TextView)get(row,"title");int rowSets=rowTitle.assignments,containerRemovals=container.removals;
  for(int i=0;i<8;i++){job(DownloadJob.State.RUNNING,DownloadJob.Phase.AUDIO_TRANSFER,5100+i*100);pulse();VaultViews.MAIN.advance(100);}
  check(container.removals==containerRemovals&&rows.get("job")==row&&rowActions.getChildAt(0)==rowPause,"Vault progress keeps mounted row and buttons");check(rowTitle.assignments==rowSets,"Vault title never reset by progress");check(rails.getChildAt(0)==sentinel,"Vault library rails preserved while queue changes");
  VaultViews.MAIN.advance(450);check(container.removals==containerRemovals&&rowActions.getChildAt(0)==rowPause,"Vault coalesced render preserves identities");
  job(DownloadJob.State.PAUSED,DownloadJob.Phase.AUDIO_TRANSFER,5900);pulse();check(rows.get("job")==row&&get(row,"root")==rowRoot,"Vault state transition retains row");check("Resume".contentEquals(((TextView)rowActions.getChildAt(0)).getText()),"Vault state change updates actions immediately");rowActions.getChildAt(0).performClick();check(manager.resumes==2,"Vault Resume callback remains connected");
  manager.jobs.add(DownloadManager.job("second",DownloadJob.State.QUEUED,DownloadJob.Phase.METADATA,0));pulse();check(rows.get("job")==row&&rows.size()==2,"Adding job reuses existing row");
  call(vault,"onStop");pulse();check(manager.listeners.isEmpty()&&VaultViews.MAIN.size()==0,"Stopped Vault cancels refresh and listeners");
  System.out.println(checks+" actual progress-sheet/Vault view checks passed");
 }
}
