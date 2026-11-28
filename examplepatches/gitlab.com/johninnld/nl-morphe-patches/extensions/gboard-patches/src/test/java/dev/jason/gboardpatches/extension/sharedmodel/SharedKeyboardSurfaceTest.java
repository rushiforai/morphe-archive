package dev.jason.gboardpatches.extension.sharedmodel;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.*;
import android.widget.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedKeyboardSurfaceTest {
 private Activity activity;private FrameLayout root,nativeFrame;private ViewSwitcher switcher;private TextView message;
 @Before public void create(){activity=Robolectric.buildActivity(Activity.class).setup().get();install(0xff123456);}
 private void install(int color){
  SharedKeyboardSurface.clear();root=new FrameLayout(activity);switcher=new ViewSwitcher(activity);switcher.setId(0x7f0b2a8b);nativeFrame=new FrameLayout(activity);
  message=new TextView(activity);message.setId(0x7f0b0436);message.setText("Native message");message.setTextColor(color);message.setTextSize(19);message.setTypeface(Typeface.create("serif",Typeface.BOLD_ITALIC));nativeFrame.addView(message);
  TextView chip=new TextView(activity);chip.setText("Native action");chip.setTextColor(color);chip.setClickable(true);GradientDrawable background=new GradientDrawable();background.setColor(color);background.setCornerRadius(42);chip.setBackground(background);nativeFrame.addView(chip);
  switcher.addView(nativeFrame);switcher.addView(new FrameLayout(activity));root.addView(switcher);activity.setContentView(root);SharedKeyboardSurface.bind(null,root);
 }
 @After public void cleanup(){SharedKeyboardSurface.clear();activity.finish();}
 @Test public void cachedWritingViewRebindsAfterReturningFromTheKeyboard(){
  assertTrue(SharedKeyboardSurface.available());
  SharedKeyboardSurface.clear();assertFalse(SharedKeyboardSurface.available());
  SharedKeyboardSurface.bindVisible(root);assertTrue(SharedKeyboardSurface.available());
  LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Translating to French…");
  assertEquals(message.getTextColors(),((TextView)body.getChildAt(0)).getTextColors());
 }
 @Test public void hiddenCachedWritingViewCannotBecomeAnActiveSurface(){
  SharedKeyboardSurface.clear();root.setVisibility(View.GONE);
  SharedKeyboardSurface.bindVisible(root);assertFalse(SharedKeyboardSurface.available());
  root.setVisibility(View.VISIBLE);SharedKeyboardSurface.bindVisible(root);assertTrue(SharedKeyboardSurface.available());
 }
 @Test public void repeatedVisibleChecksDoNotDismissTheCurrentOperation(){
  LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Working…");
  SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());
  SharedKeyboardSurface.bindVisible(root);assertTrue(panel.isShowing());panel.dismiss();
 }
 @Test public void extraActionsIdentifyTheirTaskWhileTheModelRuns(){
  assertEquals("Translating to French…",SharedTextActions.progressLabel("translate","fr"));
  assertEquals("Translating to Ukrainian…",SharedTextActions.progressLabel("translate","uk"));
  assertEquals("Suggesting changes…",SharedTextActions.progressLabel("suggest_instructions",null));
  assertEquals("Drafting your reply…",SharedTextActions.progressLabel("reply",null));
 }
 @Test public void completedLocalEditsReturnToTyping(){
  for(String operation:new String[]{"proofread","rephrase","translate","edit"}){
   assertTrue(operation,SharedTextActions.returnsToTyping(operation));
  }
  assertFalse(SharedTextActions.returnsToTyping("reply"));
 }
 @Test public void textInheritsActualNativeThemeRatherThanAFixedPalette(){TextView copy=SharedKeyboardSurface.styledText(message,"Local result");assertEquals(message.getTextColors(),copy.getTextColors());assertEquals(message.getTypeface(),copy.getTypeface());assertEquals(message.getTextSize(),copy.getTextSize(),0.01f);}
 @Test public void aThemeRebindUsesTheNewNativeTextStyle(){install(0xffab7812);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Local result");assertEquals(0xffab7812,((TextView)body.getChildAt(0)).getCurrentTextColor());}
 @Test public void extraSurfacePreservesBothNativeSwitcherChildrenAndRestoresVisibility(){LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Local result");SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());assertEquals(2,switcher.getChildCount());assertEquals(View.INVISIBLE,message.getVisibility());panel.dismiss();assertEquals(2,switcher.getChildCount());assertEquals(View.VISIBLE,message.getVisibility());assertEquals(2,nativeFrame.getChildCount());}
 @Test public void dismissDoesNotResurrectTheNativeBodyAfterAKeyboardTransition(){installModern();View nativeBody=root.getChildAt(0);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());assertEquals(View.INVISIBLE,nativeBody.getVisibility());nativeBody.setVisibility(View.GONE);panel.dismiss();assertEquals(View.GONE,nativeBody.getVisibility());}
 @Test public void lifecycleClearReleasesTheOverlayWithoutRestoringObsoleteNativeViews(){installModern();View nativeBody=root.getChildAt(0);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());nativeBody.setVisibility(View.GONE);SharedKeyboardSurface.clear();assertFalse(panel.isShowing());assertEquals(View.GONE,nativeBody.getVisibility());}
 @Test public void dismissCancelsOnlyItsOwnedSurfaceOnce(){LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);int[] calls={0};panel.setOnDismissListener(()->calls[0]++);assertTrue(panel.show());panel.dismiss();panel.dismiss();assertEquals(1,calls[0]);}
 @Test public void nativeSurfaceBackgroundIsNotCompositedTwice(){GradientDrawable background=new GradientDrawable();background.setColor(0x40123456);nativeFrame.setBackground(background);LinearLayout body=SharedKeyboardSurface.body();assertNull(body.getBackground());SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());assertSame(background,nativeFrame.getBackground());panel.dismiss();assertSame(background,nativeFrame.getBackground());}
 @Test public void nativeBackgroundOpacitySurvivesCloning(){TextView original=(TextView)nativeFrame.getChildAt(1);original.getBackground().setAlpha(73);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.button(body,"Apply",()->{});assertEquals(73,body.getChildAt(0).getBackground().getAlpha());}
 @Test public void buttonsCloneTheNativeDrawableWithoutSharingItsMutableInstance(){LinearLayout body=SharedKeyboardSurface.body();TextView original=(TextView)nativeFrame.getChildAt(1);SharedKeyboardSurface.button(body,"Apply",()->{});TextView copy=(TextView)body.getChildAt(0);assertEquals(original.getTextColors(),copy.getTextColors());assertNotSame(original.getBackground(),copy.getBackground());assertNotNull(copy.getBackground());}
 private void installModern(){
  SharedKeyboardSurface.clear();root=new FrameLayout(activity);FrameLayout modern=new FrameLayout(activity);modern.setId(0x7f0b2a8c);FrameLayout results=new FrameLayout(activity);results.setId(0x7f0b0430);nativeFrame=new FrameLayout(activity);GradientDrawable surface=new GradientDrawable();surface.setColor(0xff123456);surface.setCornerRadius(36);nativeFrame.setBackground(surface);
  message=new TextView(activity);message.setId(0x7f0b042e);message.setTextColor(0xffcceeff);message.setPadding(12,16,12,16);nativeFrame.addView(message);Button primary=new Button(activity);primary.setId(0x7f0b0458);primary.setTextColor(0xffcceeff);primary.setMinHeight(48);GradientDrawable primaryShape=new GradientDrawable();primaryShape.setColor(0xff135577);primaryShape.setCornerRadius(42);primary.setBackground(primaryShape);primary.setVisibility(View.GONE);nativeFrame.addView(primary,new FrameLayout.LayoutParams(120,52));results.addView(nativeFrame,new FrameLayout.LayoutParams(300,240));modern.addView(results,new FrameLayout.LayoutParams(300,240));
  LinearLayout footer=new LinearLayout(activity);footer.setId(0x7f0b045e);TextView button=new TextView(activity);button.setText("Native action");button.setTextColor(0xffcceeff);button.setClickable(true);GradientDrawable shape=new GradientDrawable();shape.setColor(0xff135577);shape.setCornerRadius(42);button.setBackground(shape);footer.addView(button);modern.addView(footer);root.addView(modern);View hidden=new View(activity);hidden.setVisibility(View.GONE);root.addView(hidden);activity.setContentView(root);root.measure(View.MeasureSpec.makeMeasureSpec(480,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY));root.layout(0,0,480,800);SharedKeyboardSurface.bind(null,root);
 }
 @Test public void modernBodyNeedsNoViewSwitcherOrCompletedResponse(){installModern();nativeFrame.removeView(nativeFrame.findViewById(0x7f0b0458));assertTrue(SharedKeyboardSurface.available());LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Working…");SharedKeyboardSurface.button(body,"Cancel",()->{});assertEquals(0xffcceeff,((TextView)body.getChildAt(0)).getCurrentTextColor());assertEquals(12,body.getChildAt(0).getPaddingLeft());assertNotSame(nativeFrame.getBackground(),body.getBackground());}
 @Test public void modernOverlaySurvivesResultRowReplacementAndRestoresNativeVisibility(){installModern();View modern=root.getChildAt(0),hidden=root.getChildAt(1);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Working…");SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);assertTrue(panel.show());assertEquals(View.INVISIBLE,modern.getVisibility());assertEquals(View.GONE,hidden.getVisibility());FrameLayout results=(FrameLayout)modern.findViewById(0x7f0b0430);results.removeAllViews();assertEquals(3,root.getChildCount());panel.dismiss();assertEquals(View.VISIBLE,modern.getVisibility());assertEquals(View.GONE,hidden.getVisibility());assertEquals(2,root.getChildCount());}
 @Test public void copiedButtonResolvesTheNativeSelectedTextAndTintTogether(){installModern();TextView source=(TextView)((ViewGroup)root.findViewById(0x7f0b045e)).getChildAt(0);android.content.res.ColorStateList colors=new android.content.res.ColorStateList(new int[][]{new int[]{android.R.attr.state_selected},new int[]{}},new int[]{0xff112233,0xffeeeeff});source.setTextColor(colors);source.setBackgroundTintList(colors);source.setSelected(true);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.button(body,"Apply",()->{});TextView copy=(TextView)body.getChildAt(0);assertEquals(source.getCurrentTextColor(),copy.getCurrentTextColor());assertEquals(0xff112233,copy.getBackgroundTintList().getColorForState(copy.getDrawableState(),copy.getBackgroundTintList().getDefaultColor()));}
 @Test public void completedOperationKeepsItsThemeAndControlsAfterNativeRowsAreRecycled(){installModern();LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Working…");SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);SharedKeyboardSurface.button(body,"Cancel",panel::dismiss);assertTrue(panel.show());ViewGroup results=(ViewGroup)root.findViewById(0x7f0b0430);results.removeAllViews();assertFalse(SharedKeyboardSurface.available());assertNotNull(root.getChildAt(2).getBackground());assertNull(body.getBackground());panel.replaceContent();panel.label("Hello Paul. I cannot come on Friday.");panel.button("Apply",panel::dismiss);assertTrue(panel.isShowing());assertEquals("Hello Paul. I cannot come on Friday.",((TextView)body.getChildAt(0)).getText().toString());assertEquals(0xffcceeff,((TextView)body.getChildAt(0)).getCurrentTextColor());assertNotNull(body.getChildAt(1).getBackground());assertTrue(body.getChildAt(1).performClick());assertFalse(panel.isShowing());}
 @Test public void rebindingTheSameNativeViewCancelsOldStylesAndReadsTheNewTheme(){LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,"Working…");SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);SharedKeyboardSurface.button(body,"Cancel",panel::dismiss);int[] dismissed={0};panel.setOnDismissListener(()->dismissed[0]++);assertTrue(panel.show());message.setTextColor(0xffddee11);SharedKeyboardSurface.bind(null,root);assertFalse(panel.isShowing());assertEquals(1,dismissed[0]);assertEquals(View.VISIBLE,message.getVisibility());LinearLayout fresh=SharedKeyboardSurface.body();SharedKeyboardSurface.label(fresh,"Result");assertEquals(0xffddee11,((TextView)fresh.getChildAt(0)).getCurrentTextColor());}
 @Test public void materialCheckedFillStateSurvivesOnAnAccessibleActionButton(){installModern();ViewGroup footer=(ViewGroup)root.findViewById(0x7f0b045e);footer.removeAllViews();CheckedTextView source=new CheckedTextView(activity);source.setId(0x7f0b0458);source.setText("Native filled action");source.setClickable(true);source.setCheckMarkDrawable((android.graphics.drawable.Drawable)null);source.setChecked(true);android.content.res.ColorStateList fill=new android.content.res.ColorStateList(new int[][]{new int[]{android.R.attr.state_checked},new int[]{}},new int[]{0xff55ccff,0xff123456});source.setTextColor(fill);GradientDrawable shape=new GradientDrawable();shape.setColor(0xff123456);shape.setCornerRadius(42);source.setBackground(shape);source.setBackgroundTintList(fill);footer.addView(source);LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.button(body,"Apply",()->{});TextView copy=(TextView)body.getChildAt(0);assertTrue(copy instanceof Button);assertEquals(source.getCurrentTextColor(),copy.getCurrentTextColor());assertEquals(0xff55ccff,copy.getBackgroundTintList().getColorForState(copy.getDrawableState(),copy.getBackgroundTintList().getDefaultColor()));}
 @Test public void actionsUseThePaintedKeyboardFooterInsteadOfAnUnshownDefaultTint(){installModern();TextView primary=(TextView)nativeFrame.findViewById(0x7f0b0458);primary.setTextColor(0xff112233);primary.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xff9977ff));TextView footer=(TextView)((ViewGroup)root.findViewById(0x7f0b045e)).getChildAt(0);footer.setTextColor(0xffccddee);footer.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xff003344));LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.button(body,"Apply",()->{});TextView copy=(TextView)body.getChildAt(0);assertEquals(footer.getCurrentTextColor(),copy.getCurrentTextColor());assertNotEquals(primary.getCurrentTextColor(),copy.getCurrentTextColor());assertEquals(footer.getBackgroundTintList(),copy.getBackgroundTintList());assertEquals(View.GONE,primary.getVisibility());}

 @Test public void capturedScreenNeedsAnExplicitReadActionBeforeAnalysis(){android.graphics.Bitmap image=android.graphics.Bitmap.createBitmap(2,2,android.graphics.Bitmap.Config.ARGB_8888);int[] reads={0};SharedKeyboardSurface.Panel panel=SharedScreenContext.confirmation(image,()->reads[0]++);assertTrue(panel.show());assertEquals(0,reads[0]);assertTrue(panel.content.getChildAt(2).performClick());assertEquals(1,reads[0]);panel.dismiss();image.recycle();}

 @Test public void staleSelectionCannotStartAnActionWhenTheSurfaceBecomesAvailable(){
  SharedWritingActivationTest.Ime ime=new SharedWritingActivationTest.Ime();
  EditorSnapshot snapshot=EditorSnapshot.capture(ime,GboardSharedWritingRuntime.currentRevision());
  assertNotNull(snapshot);
  SharedKeyboardSurface.clear();
  int[] actions={0};
  SharedKeyboardSurface.whenAvailable(activity,snapshot,()->actions[0]++);
  ime.connection.selection=0;
  installModern();
  assertTrue(SharedKeyboardSurface.available());
  Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
  assertEquals(0,actions[0]);
 }
}
