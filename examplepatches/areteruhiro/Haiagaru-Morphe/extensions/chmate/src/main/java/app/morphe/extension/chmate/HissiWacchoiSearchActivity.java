package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/** Standalone lifecycle adapter; the same controller also runs in a real native Fragment. */
public final class HissiWacchoiSearchActivity extends HaiagaruComposeActivity {
    public static final String EXTRA_HALF=HissiWacchoiSearchController.EXTRA_HALF;
    public static final String HALF_UPPER=HissiWacchoiSearchController.HALF_UPPER;
    private HissiWacchoiSearchController controller;
    @Override protected void onCreate(Bundle state){super.onCreate(state);if(NativeToolTabs.redirectSearch(this,state,true))return;controller=new HissiWacchoiSearchController(this,getIntent(),false,this::finish,this::setContentView);controller.create(state);}
    @Override protected void onResume(){super.onResume();if(controller!=null)controller.resume();}
    @Override protected void onPause(){if(controller!=null)controller.pause();super.onPause();}
    @Override protected void onNewIntent(Intent intent){super.onNewIntent(intent);setIntent(intent);if(NativeToolTabs.redirectSearch(this,null,true))return;if(controller!=null)controller.newIntent(intent);}
    @Override protected void onSaveInstanceState(Bundle state){if(controller!=null)controller.save(state);super.onSaveInstanceState(state);}
    @Override protected void onDestroy(){if(controller!=null)controller.close();super.onDestroy();}
    public static void openFromToolbar(Activity activity,boolean upper){HissiWacchoiSearchController.openFromToolbar(activity,upper);}
    public static void openFromToolbar(Activity activity,Object fragment,boolean upper){HissiWacchoiSearchController.openFromToolbar(activity,fragment,upper);}
}
