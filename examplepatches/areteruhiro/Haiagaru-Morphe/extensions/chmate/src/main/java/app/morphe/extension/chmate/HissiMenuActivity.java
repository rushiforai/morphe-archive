package app.morphe.extension.chmate;

import android.os.Bundle;

/** Standalone adapter for the same checker controller used by native tool tabs. */
public final class HissiMenuActivity extends HaiagaruComposeActivity {
    private HissiMenuController controller;
    @Override protected void onCreate(Bundle state){super.onCreate(state);if(NativeToolTabs.redirectSearch(this,state,false))return;controller=new HissiMenuController(this,getIntent(),false,this::finish,this::setContentView);controller.create(state);setIntent(controller.getIntent());if(!controller.navigationPending())NativeToolTabs.redirectSearch(this,state,true);}
    @Override protected void onResume(){super.onResume();if(controller!=null)controller.resume();}
    @Override protected void onPause(){if(controller!=null)controller.pause();super.onPause();}
    @Override protected void onSaveInstanceState(Bundle state){if(controller!=null)controller.save(state);super.onSaveInstanceState(state);}
    @Override protected void onDestroy(){if(controller!=null)controller.close();super.onDestroy();}
}
