package org.ungoogled.ui;

import static org.junit.Assert.*;
import android.graphics.Rect;
import android.view.View;
import android.widget.FrameLayout;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=33,manifest=Config.NONE)
public class CarSpeedPlacementTest {
    private final FrameLayout root=new FrameLayout(RuntimeEnvironment.getApplication());
    private final FrameLayout parent=new FrameLayout(root.getContext());
    private final View card=new View(root.getContext());
    private final CarSpeedPlacement placement=new CarSpeedPlacement();
    public CarSpeedPlacementTest(){root.addView(parent);parent.addView(card);root.layout(0,0,1280,480);parent.layout(0,0,1280,480);card.layout(1100,390,1230,460);}

    @Test public void playerResizeMovesTheExistingCardAndClosingRestoresItsNativeAnchor(){
        assertEquals(new Rect(1100,390,1230,460),placement.place(root,card,new Rect(0,0,1280,480)));
        Rect reserved=new Rect(400,20,1000,370);
        for(int i=0;i<8;i++)assertEquals("No accumulated offset on repeated frames",new Rect(870,300,1000,370),placement.place(root,card,reserved));
        assertEquals(new Rect(1100,390,1230,460),placement.place(root,card,new Rect(0,0,1280,480)));
        assertEquals(1,parent.getChildCount());assertSame(card,parent.getChildAt(0));
    }
    @Test public void unknownOrTooSmallReservationsWithholdRatherThanCoverHostControls(){
        card.setAlpha(.8f);
        assertNull(placement.place(root,card,new Rect()));assertEquals(0,card.getAlpha(),0);
        assertNull(placement.place(root,card,new Rect(0,0,100,50)));
        assertNotNull(placement.place(root,card,new Rect(0,0,1280,480)));assertEquals(.8f,card.getAlpha(),0);
    }
    @Test public void aSpeedPillConcealsTheCardWithoutLosingItsNativeAlpha(){
        card.setAlpha(.9f);
        assertNull("A concealed card reserves no area of its own",placement.place(root,card,new Rect(0,0,1280,480),true));
        assertEquals(0,card.getAlpha(),0);
        for(int i=0;i<4;i++)placement.place(root,card,new Rect(0,0,1280,480),true);
        assertEquals("No alpha flicker on repeated frames",0,card.getAlpha(),0);
        assertNotNull(placement.place(root,card,new Rect(0,0,1280,480),false));assertEquals(.9f,card.getAlpha(),0);
        placement.place(root,card,new Rect(0,0,1280,480),true);placement.restore();assertEquals(.9f,card.getAlpha(),0);
    }
    @Test public void nativeAnimationChangesRemainAuthoritativeAndAreRestoredOnDetach(){
        placement.place(root,card,new Rect(400,20,1000,370));
        card.setTranslationX(-20);card.setTranslationY(-10);card.setAlpha(.7f);
        placement.place(root,card,new Rect(400,20,1000,370));
        placement.restore();assertEquals(-20,card.getTranslationX(),0);assertEquals(-10,card.getTranslationY(),0);assertEquals(.7f,card.getAlpha(),0);
    }
    @Test public void scaledParentsUseSurfaceCoordinatesAndKeepOriginalNativeTransforms(){
        parent.setPivotX(0);parent.setPivotY(0);parent.setScaleX(.8f);parent.setScaleY(.8f);
        Rect actual=placement.place(root,card,new Rect(100,20,900,340));
        assertNotNull(actual);assertTrue(new Rect(100,20,900,340).contains(actual));assertEquals(104,actual.width());assertEquals(56,actual.height());
        placement.restore();assertEquals(0,card.getTranslationX(),0);assertEquals(.8f,parent.getScaleX(),0);
    }
    @Test public void replacementDoesNotInheritThePreviousWindowsOffsets(){
        placement.place(root,card,new Rect(400,20,1000,370));
        View replacement=new View(root.getContext());parent.addView(replacement);replacement.layout(50,50,180,120);
        assertEquals(new Rect(50,50,180,120),placement.place(root,replacement,new Rect(0,0,1280,480)));
        assertEquals(0,card.getTranslationX(),0);assertEquals(0,card.getTranslationY(),0);
        placement.restore();
    }
    @Test public void tightNativeWrapperDoesNotClipTheMovedCardAndRegainsItsClipping(){
        parent.layout(1100,390,1230,460);card.layout(0,0,130,70);assertTrue(parent.getClipChildren());
        assertEquals(new Rect(870,300,1000,370),placement.place(root,card,new Rect(400,20,1000,370)));
        assertFalse(parent.getClipChildren());
        placement.place(root,card,new Rect(0,0,1280,480));assertTrue(parent.getClipChildren());
        placement.place(root,card,new Rect(400,20,1000,370));placement.restore();assertTrue(parent.getClipChildren());
    }
}
