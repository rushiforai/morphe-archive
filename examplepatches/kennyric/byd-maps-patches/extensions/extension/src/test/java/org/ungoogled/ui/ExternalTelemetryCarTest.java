package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=33,manifest=Config.NONE)
public class ExternalTelemetryCarTest {
    Context app;Object first=new Object(),second=new Object();
    private void session(Object owner,boolean visible)throws Exception{ExternalTelemetry.class.getMethod("carSession",Context.class,Object.class,boolean.class).invoke(null,app,owner,visible);Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private void surface(Object owner,ViewGroup view)throws Exception{ExternalTelemetry.class.getMethod("carSurface",Object.class,ViewGroup.class).invoke(null,owner,view);Shadows.shadowOf(Looper.getMainLooper()).idle();}
    private boolean active()throws Exception{Field f=ExternalTelemetry.class.getDeclaredField("startup");f.setAccessible(true);Object client=f.get(null);return client!=null&&(Boolean)client.getClass().getMethod("activeSession").invoke(client);}
    @Before public void setup(){app=RuntimeEnvironment.getApplication();app.getSharedPreferences(Shapes.PREFS,0).edit().clear().commit();ExternalTelemetry.select(app,TelemetryStore.WAZE);}
    @After public void cleanup()throws Exception{ExternalTelemetry.carNavigation(app,first,false);ExternalTelemetry.carNavigation(app,second,false);ExternalTelemetry.navigating(false);try{session(first,false);session(second,false);}catch(NoSuchMethodException absent){}ExternalTelemetry.select(app,"");}
    @Test public void realCarLifecycleKeepsSelectedProviderActiveWithoutPhoneActivity()throws Exception{
        assertFalse(active());session(first,true);assertTrue(active());session(second,true);session(first,false);assertTrue(active());session(second,false);assertFalse(active());
    }
    @Test public void nativeCarGuidanceSurvivesPhoneCameraAndTemporarySurfaceChanges()throws Exception{
        ExternalTelemetry.carNavigation(app,first,true);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(active());
        Field field=ExternalTelemetry.class.getDeclaredField("navigating");field.setAccessible(true);assertTrue(field.getBoolean(null));
        ExternalTelemetry.navigating(false);surface(first,null);assertTrue(field.getBoolean(null));assertTrue(active());
        ExternalTelemetry.carNavigation(app,second,true);ExternalTelemetry.carNavigation(app,first,false);Shadows.shadowOf(Looper.getMainLooper()).idle();assertTrue(field.getBoolean(null));
        ExternalTelemetry.carNavigation(app,second,false);Shadows.shadowOf(Looper.getMainLooper()).idle();assertFalse(field.getBoolean(null));assertFalse(active());
    }
    @Test public void temporarySurfaceLossDoesNotEndCarSessionAndFinalCloseRemovesWidget()throws Exception{
        zone();
        FrameLayout root=new FrameLayout(app);root.layout(0,0,800,480);session(first,true);surface(first,root);assertEquals(1,root.getChildCount());
        surface(first,null);assertTrue(active());assertEquals(0,root.getChildCount());surface(first,root);assertEquals(1,root.getChildCount());session(first,false);assertFalse(active());assertEquals(0,root.getChildCount());
    }
    @Test public void widgetFitsActualCarSurfaceWhenNativeDecorExtendsBelowVisibleViewport()throws Exception{
        zone();
        FrameLayout root=new FrameLayout(app);root.layout(0,0,800,480);session(first,true);
        ExternalTelemetry.class.getMethod("carSurface",Object.class,ViewGroup.class,int.class,int.class).invoke(null,first,root,800,424);Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1,root.getChildCount());android.view.View value=root.getChildAt(0);FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)value.getLayoutParams();
        assertTrue("Warning panel must end above the real supplied surface bottom",lp.topMargin+value.getMeasuredHeight()<=424);
    }
    @Test public void unknownSafeAreaWithholdsWidgetUntilHostReportsIt()throws Exception{
        zone();
        FrameLayout root=new FrameLayout(app);root.layout(0,0,800,480);session(first,true);
        Method target=ExternalTelemetry.class.getMethod("carSurface",Object.class,ViewGroup.class,android.graphics.Rect.class);
        target.invoke(null,first,root,new android.graphics.Rect());Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(0,root.getChildCount());assertTrue(active());
        target.invoke(null,first,root,new android.graphics.Rect(40,20,780,424));Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(1,root.getChildCount());
        target.invoke(null,first,root,new android.graphics.Rect());Shadows.shadowOf(Looper.getMainLooper()).idle();assertEquals(0,root.getChildCount());assertTrue(active());
    }

    @Test public void nativeLayoutResizeRepositionsWarningWithoutAnotherGpsOrProviderUpdate()throws Exception{
        zone();FrameLayout root=new FrameLayout(app);root.layout(0,0,1280,480);session(first,true);surface(first,root);
        android.view.View pill=root.getChildAt(0);FrameLayout.LayoutParams before=(FrameLayout.LayoutParams)pill.getLayoutParams();
        int originalRight=before.leftMargin+pill.getMeasuredWidth();
        root.layout(0,0,700,300);root.getViewTreeObserver().dispatchOnPreDraw();
        FrameLayout.LayoutParams after=(FrameLayout.LayoutParams)pill.getLayoutParams();
        assertSame(pill,root.getChildAt(0));assertTrue(after.leftMargin+pill.getMeasuredWidth()<=700);assertTrue(after.topMargin+pill.getMeasuredHeight()<=300);
        assertEquals(after.leftMargin,pill.getLeft());assertEquals(after.topMargin,pill.getTop());
        assertTrue("This frame's actual pixels must already be inside the resized reservation",pill.getRight()<=700&&pill.getBottom()<=300);
        assertTrue(after.leftMargin+pill.getMeasuredWidth()<originalRight);
        session(first,false);assertEquals(0,root.getChildCount());
        root.getViewTreeObserver().dispatchOnPreDraw();assertEquals(0,root.getChildCount());
    }
    @Test public void constrainedCarPillsKeepTheirAspectRatioAndWithholdUnreadableSizes()throws Exception{
        zone();CompactSpeedView view=new CompactSpeedView(app);view.bindCar(ExternalTelemetry.view(),100d,false,false,"",java.util.Collections.emptyList());
        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(109,android.view.View.MeasureSpec.AT_MOST),android.view.View.MeasureSpec.makeMeasureSpec(200,android.view.View.MeasureSpec.AT_MOST));
        assertEquals(109,view.getMeasuredWidth());assertEquals("The supplied218:70pill scales uniformly at half width",35,view.getMeasuredHeight());
        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(108,android.view.View.MeasureSpec.AT_MOST),android.view.View.MeasureSpec.makeMeasureSpec(200,android.view.View.MeasureSpec.AT_MOST));
        assertEquals(0,view.getMeasuredWidth());assertEquals(0,view.getMeasuredHeight());
    }

    @Test public void phoneStackMovesBesideTheMapButtonColumnOnlyWhenItWouldCoverIt(){
        FrameLayout content=new FrameLayout(app);android.view.View tiles=new android.view.View(app);
        content.addView(tiles,new FrameLayout.LayoutParams(64,300));
        android.app.Activity host=org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();host.setContentView(content);
        content.measure(android.view.View.MeasureSpec.makeMeasureSpec(1080,android.view.View.MeasureSpec.EXACTLY),android.view.View.MeasureSpec.makeMeasureSpec(2000,android.view.View.MeasureSpec.EXACTLY));
        content.layout(0,0,1080,2000);tiles.layout(16,1400,80,1700);
        android.view.View previous=Shapes.navTiles;Shapes.navTiles=tiles;
        try{
            assertEquals("Warnings above the speed pill would cover the column",88,ExternalTelemetry.phoneColumnClearance(content,10,1500,218,152,8));
            assertEquals("The speed pill alone sits below it",10,ExternalTelemetry.phoneColumnClearance(content,10,1720,218,70,8));
            tiles.setVisibility(android.view.View.GONE);
            assertEquals("A hidden column does not move the stack",10,ExternalTelemetry.phoneColumnClearance(content,10,1500,218,152,8));
        }finally{Shapes.navTiles=previous;}
    }
    private void zone()throws Exception{
        org.robolectric.shadows.ShadowSystemClock.advanceBy(java.time.Duration.ofSeconds(5));long now=android.os.SystemClock.elapsedRealtime();
        Field f=ExternalTelemetry.class.getDeclaredField("store");f.setAccessible(true);TelemetryStore store=(TelemetryStore)f.get(null);
        java.util.Map<String,Object> p=TelemetryStoreTest.packet(TelemetryStore.WAZE,"car",1,now);
        p.put("zone_status","active");p.put("zone_session",1L);p.put("zone_segment_id","zone");p.put("zone_remaining_m",1200);p.put("zone_progress_percent",35d);p.put("zone_observation_start_elapsed_ms",now-4000);p.put("zone_observed_distance_m",100);p.put("zone_average_partial",true);p.put("zone_average_speed_kmh",90d);
        assertTrue(store.accept(p,TelemetryStore.WAZE,now));
    }
    @Test public void metricsAloneKeepTheNativeWidgetVisibleWithoutAddingOurOwnSpeedPair()throws Exception{
        FrameLayout root=new FrameLayout(app);root.layout(0,0,800,480);android.view.View nativeWidget=new android.view.View(app);root.addView(nativeWidget);
        session(first,true);surface(first,root);assertEquals(1,root.getChildCount());assertSame(nativeWidget,root.getChildAt(0));assertEquals(1,nativeWidget.getAlpha(),0);
        session(first,false);assertEquals(1,root.getChildCount());assertEquals(1,nativeWidget.getAlpha(),0);
    }
    @Test public void warningRightEdgeFollowsTheNativeSpeedBadgeAndRemainsInsideTheHostArea(){
        android.graphics.Rect viewport=new android.graphics.Rect(80,10,1280,480);
        android.graphics.Rect speed=new android.graphics.Rect(1080,370,1190,430);
        android.graphics.Rect area=ExternalTelemetry.carInfoArea(viewport,speed,new android.graphics.Rect(1030,445,1210,470),16);
        assertEquals("The same final margin aligns the two pill edges",speed.right,area.right-16);
        assertTrue("Warnings stay above the speed badge",area.bottom-16<=speed.top-16);
        area=ExternalTelemetry.carInfoArea(new android.graphics.Rect(80,10,1140,480),speed,null,16);
        assertEquals("A host overlay takes priority over the old speed-badge edge",1140,area.right);
        area=ExternalTelemetry.carInfoArea(viewport,null,null,16);assertEquals(viewport,area);
    }
    @Test public void nativeCardLocatorStopsBeforeTheLargerWatermarkContainer(){
        FrameLayout watermark=new FrameLayout(app),wrapper=new FrameLayout(app),card=new FrameLayout(app);android.view.View sign=new android.view.View(app),speed=new android.view.View(app);
        watermark.addView(wrapper);wrapper.addView(card);card.addView(sign);card.addView(speed);
        assertSame(card,ExternalTelemetry.carSpeedCard(wrapper,speed,sign));
        assertSame("Unknown native variants fall back to the dedicated speed wrapper",wrapper,ExternalTelemetry.carSpeedCard(wrapper,null,sign));
    }
    @Test @Config(qualifiers="w1280dp-h720dp-land-mdpi") public void nativeScalingAndTranslationAreIncludedInTheAlignmentBounds(){
        android.app.Activity activity=org.robolectric.Robolectric.buildActivity(android.app.Activity.class).setup().get();
        FrameLayout root=new FrameLayout(activity),card=new FrameLayout(activity);activity.setContentView(root);root.addView(card);root.layout(0,0,1190,460);card.layout(1052,330,1150,390);card.setPivotX(49);card.setPivotY(30);card.setTranslationX(-10);card.setScaleX(.95f);card.setScaleY(.95f);
        android.graphics.Rect drawn=ExternalTelemetry.occupiedCarView(root,card);assertNotNull(drawn);assertEquals(1138,drawn.right,1);assertEquals(1044,drawn.left,1);
        android.graphics.Rect area=ExternalTelemetry.carInfoArea(new android.graphics.Rect(12,12,1178,448),drawn,null,16);
        assertEquals("Warning face aligns to drawn pixels rather than the unscaled layout box",drawn.right,area.right-16);assertNotEquals(card.getRight(),area.right-16);activity.finish();
    }

}
