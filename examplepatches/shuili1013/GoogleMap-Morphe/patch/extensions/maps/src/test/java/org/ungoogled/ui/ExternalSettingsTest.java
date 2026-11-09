package org.ungoogled.ui;
import static org.junit.Assert.*;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=33,manifest=Config.NONE,qualifiers="mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ExternalSettingsTest {
    @Test public void sourceDialogSelectsFlitsmeisterAndControlsRenderAtPhoneWidth() throws Exception {
        CustomizationActivity activity=Robolectric.buildActivity(CustomizationActivity.class).setup().get();
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);body.setBackgroundColor(0xffffffff);
        activity.buildExternalDataControls(body);activity.setContentView(body);
        body.getChildAt(0).performClick();AlertDialog dialog=ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(dialog);assertEquals(4,dialog.getListView().getCount());
        dialog.getListView().performItemClick(dialog.getListView().getChildAt(3),3,3);
        assertEquals(TelemetryStore.FLITSMEISTER,ExternalTelemetry.source(activity));
        TextView selection=(TextView)((LinearLayout)((LinearLayout)body.getChildAt(0)).getChildAt(0)).getChildAt(1);
        assertTrue(selection.getText().toString().contains("Flitsmeister"));
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(1));
        body.measure(View.MeasureSpec.makeMeasureSpec(411,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1200,View.MeasureSpec.AT_MOST));body.layout(0,0,411,body.getMeasuredHeight());
        assertTrue(body.getHeight()>400);assertTrue(body.getHeight()<1200);save(body,"external-source-settings.png");
        ExternalTelemetry.select(activity,"");activity.finish();
    }
    @Test public void sourceSwitchRebindsWarningControlsToWazeWithoutChangingFmChoices() {
        CustomizationActivity activity=Robolectric.buildActivity(CustomizationActivity.class).setup().get();
        nl.johninnl.navigation.alerts.WarningPreferences fm=ExternalTelemetry.warningPreferences(activity,TelemetryStore.FLITSMEISTER);
        fm.mode(nl.johninnl.navigation.alerts.WarningAudioOwner.Mode.SILENT);fm.confirm();
        ExternalTelemetry.select(activity,TelemetryStore.FLITSMEISTER);
        LinearLayout body=new LinearLayout(activity);body.setOrientation(LinearLayout.VERTICAL);activity.buildExternalDataControls(body);
        body.getChildAt(0).performClick();AlertDialog dialog=ShadowAlertDialog.getLatestAlertDialog();dialog.getListView().performItemClick(null,2,2);
        assertEquals(TelemetryStore.WAZE,ExternalTelemetry.source(activity));
        LinearLayout controls=(LinearLayout)body.getChildAt(2);LinearLayout output=(LinearLayout)controls.getChildAt(0);
        TextView label=(TextView)((LinearLayout)output.getChildAt(0)).getChildAt(0);assertEquals("De-Waze warning audio",label.getText().toString());
        output.performClick();AlertDialog outputs=ShadowAlertDialog.getLatestAlertDialog();assertNotNull(outputs);
        outputs.getListView().performItemClick(null,1,1);
        assertEquals(nl.johninnl.navigation.alerts.WarningAudioOwner.Mode.TONE,ExternalTelemetry.warningPreferences(activity).mode());
        assertFalse(ExternalTelemetry.warningPreferences(activity).reviewed());assertTrue(fm.reviewed());assertEquals(nl.johninnl.navigation.alerts.WarningAudioOwner.Mode.SILENT,fm.mode());
        ExternalTelemetry.select(activity,"");activity.finish();
    }
    @Test public void mapsCarTextUsesNativeNotificationVariantsWithoutChangingPhoneText() throws Exception {
        CustomizationActivity activity=Robolectric.buildActivity(CustomizationActivity.class).setup().get();ExternalTelemetry.select(activity,TelemetryStore.WAZE);ExternalTelemetry.warningPreferences(activity).categories(127);
        java.lang.reflect.Field field=ExternalTelemetry.class.getDeclaredField("nativeWarnings");field.setAccessible(true);nl.johninnl.navigation.alerts.WarningView warnings=(nl.johninnl.navigation.alerts.WarningView)field.get(null);warnings.clear();
        long now=android.os.SystemClock.elapsedRealtime();android.os.Bundle b=new android.os.Bundle();b.putInt("protocol_version",1);b.putString("provider_session",java.util.UUID.randomUUID().toString());b.putLong("sequence",1);b.putString("operation","UPSERT");b.putString("warning_id","notification");b.putLong("revision",1);b.putLong("announcement_index",0);b.putString("phase","notice");b.putString("native_type","NOTIFICATION");b.putString("category","road_feature");b.putInt("priority",1);b.putString("message","Phone cyclist details");b.putString("language_tag","en");b.putString("message_origin","native_text");b.putString("relevance","notice");b.putString("relationship","unknown");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("state_until_elapsed_ms",now+30000);b.putBoolean("native_car_available",true);b.putString("native_car_title","Cyclist ahead");b.putString("native_car_body","Use caution");
        warnings.events(java.util.Collections.singletonList(nl.johninnl.navigation.alerts.WarningCodec.decode(b,now)));ExternalTelemetry.warningChoicesChanged();
        assertEquals("De-Waze\nCyclist ahead: Use caution",ExternalTelemetry.compactCarWarning());assertEquals("De-Waze\nPhone cyclist details",ExternalTelemetry.compactWarning());
        warnings.clear();b.putBoolean("native_car_available",false);warnings.events(java.util.Collections.singletonList(nl.johninnl.navigation.alerts.WarningCodec.decode(b,now)));ExternalTelemetry.warningChoicesChanged();
        assertEquals("",ExternalTelemetry.compactCarWarning());assertEquals("De-Waze\nPhone cyclist details",ExternalTelemetry.compactWarning());
        warnings.clear();ExternalTelemetry.select(activity,"");activity.finish();
    }
    @Test public void averageSpeedWidgetRendersMetricAndImperialObservedPortions() throws Exception {
        TelemetryStore store=new TelemetryStore();store.select(TelemetryStore.FLITSMEISTER);Map<String,Object> p=TelemetryStoreTest.packet(TelemetryStore.FLITSMEISTER,"fm",1,5000);
        p.put("zone_status","active");p.put("zone_session",1L);p.put("zone_segment_id","z");p.put("zone_remaining_m",1200);p.put("zone_progress_percent",35d);p.put("zone_progress_estimated",true);p.put("zone_observation_start_elapsed_ms",1000L);p.put("zone_observed_distance_m",100);p.put("zone_average_partial",true);p.put("zone_average_speed_kmh",90d);store.accept(p,TelemetryStore.FLITSMEISTER,5000);
        for(boolean imperial:new boolean[]{false,true}){
            CompactSpeedView view=new CompactSpeedView(RuntimeEnvironment.getApplication());view.bind(store.view(5000),90d,imperial,false,"≈300 m · Camera");
            view.measure(View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(300,View.MeasureSpec.AT_MOST));view.layout(0,0,view.getMeasuredWidth(),view.getMeasuredHeight());
            assertTrue(view.getContentDescription().toString().contains("Observed partial average"));save(view,imperial?"compact-zone-imperial.png":"compact-zone-metric.png");
        }
    }
    private static void save(View view,String name) throws Exception {
        Bitmap image=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);view.draw(new Canvas(image));
        File file=new File("build/telemetry-ui/"+name);file.getParentFile().mkdirs();try(FileOutputStream out=new FileOutputStream(file)){assertTrue(image.compress(Bitmap.CompressFormat.PNG,100,out));}
    }
}
