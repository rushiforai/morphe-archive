package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.*;
import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Looper;
import android.text.Layout;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.blockauthor.CurrentVideoAuthor;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE, qualifiers = "en-rUS")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class AuthorRegionBidiTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private static final int WIDTH = 720;
    private static final int HEIGHT = 80;
    private static final int NAME_ID = 0x7f0a0001;
    private static final int TIME_ID = 0x7f0a0002;
    private int flags;
    private boolean regionEnabled;
    private boolean rateEnabled;
    private Locale locale;

    @Before public void setUp() {
        flags = RuntimeEnvironment.getApplication().getApplicationInfo().flags;
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        locale = Locale.getDefault();
        Locale.setDefault(Locale.US);
        regionEnabled = SettingsStatus.authorRegionEnabled;
        rateEnabled = SettingsStatus.engagementRateEnabled;
        SettingsStatus.authorRegionEnabled = true;
        SettingsStatus.engagementRateEnabled = true;
        PausedProcess.set(false);
        AuthorRegion.restore();
        AuthorRegion.setViewIds(NAME_ID, TIME_ID);
    }

    @After public void clean() throws Exception {
        invoke(AuthorRegion.class, "stop");
        invoke(CurrentVideoAuthor.class, "resetForTests");
        PausedProcess.set(false);
        Settings.SHOW_AUTHOR_REGION.resetToDefault();
        Settings.SHOW_AUTHOR_HANDLE.resetToDefault();
        Settings.SHOW_ENGAGEMENT_RATE.resetToDefault();
        SettingsStatus.authorRegionEnabled = regionEnabled;
        SettingsStatus.engagementRateEnabled = rateEnabled;
        RuntimeEnvironment.getApplication().getApplicationInfo().flags = flags;
        Locale.setDefault(locale);
    }

    @Test public void naturalEnglishKeepsEverySuffixAfterItsCreator() {
        matrix(View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR, 1);
    }

    @Test public void explicitRtlKeepsEverySuffixTogetherAtTheNativeTrailingSide() {
        matrix(View.TEXT_DIRECTION_RTL, View.LAYOUT_DIRECTION_LTR, -1);
    }

    @Test public void explicitLtrDoesNotLetAMixedNameSplitItsSuffix() {
        matrix(View.TEXT_DIRECTION_LTR, View.LAYOUT_DIRECTION_RTL, 1);
    }

    @Test public void inheritedAndExplicitRtlFallbacksRemainNativeRtl() {
        matrix(View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_RTL, -1);
        matrix(View.TEXT_DIRECTION_FIRST_STRONG_RTL, View.LAYOUT_DIRECTION_LTR, -1);
    }

    @Test @Config(sdk = 30)
    public void api30UsesTheSameNativeGlyphOrder() {
        matrix(View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR, 1);
        matrix(View.TEXT_DIRECTION_RTL, View.LAYOUT_DIRECTION_LTR, -1);
    }

    @Test @Config(qualifiers = "ar-rSA")
    public void theLocaleHeuristicKeepsTheNativeRtlParagraph() {
        Locale.setDefault(new Locale("ar", "SA"));
        matrix(View.TEXT_DIRECTION_LOCALE, View.LAYOUT_DIRECTION_LTR, -1);
    }

    @Test public void formattedPercentagesKeepTheirNativeGlyphOrderInEitherParagraph() throws Exception {
        for(Locale formatLocale:new Locale[]{Locale.US,new Locale("ar","SA")}) {
            Locale.setDefault(formatLocale);
            String rate=EngagementRate.format(10_000,420);
            TextView reference=name(rate,View.TEXT_DIRECTION_FIRST_STRONG_LTR,View.LAYOUT_DIRECTION_LTR);
            layout(reference,WIDTH);
            RectF nativeBounds=bounds(reference,0,rate.length());
            for(int direction:new int[]{View.TEXT_DIRECTION_FIRST_STRONG_LTR,View.TEXT_DIRECTION_RTL}) {
                for(String country:new String[]{"US","🇺🇸"}) {
                    TextView name=name("محمد Alice",direction,View.LAYOUT_DIRECTION_LTR);
                    AuthorRegion.decorate(name,null,country+" · "+rate);
                    layout(name,WIDTH);
                    int offset=name.getText().toString().indexOf(rate);
                    RectF actualBounds=bounds(name,offset,offset+rate.length());
                    for(int at=0;at<rate.length();) {
                        int length=Character.charCount(Character.codePointAt(rate,at));
                        RectF expected=bounds(reference,at,at+length);
                        RectF actual=bounds(name,offset+at,offset+at+length);
                        assertEquals(rate,expected.left-nativeBounds.left,actual.left-actualBounds.left,.1f);
                        assertEquals(rate,expected.right-nativeBounds.left,actual.right-actualBounds.left,.1f);
                        at+=length;
                    }
                    assertGeometry(name,country+" · "+rate,direction==View.TEXT_DIRECTION_RTL?-1:1);
                    capture(name,"native-rate-"+formatLocale.toLanguageTag()+"-"+(country.equals("US")?"code":"flag")+"-direction-"+direction+".png");
                    AuthorRegion.restore();
                }
            }
        }
    }

    private static void matrix(int direction, int layoutDirection, int paragraph) {
        String rate = EngagementRate.format(10_000, 420);
        for (String original : new String[]{"محمد", "שלום", "Alice محمد", "محمد Alice", "🚀✨", "123★", "Alice",
                new String(Character.toChars(0x1EE00)), new String(Character.toChars(0x1EE00))+" Alice"}) {
            for (String marker : new String[]{"US", "🇺🇸", "US · " + rate, "🇺🇸 · " + rate, rate}) {
                TextView name = name(original, direction, layoutDirection);
                int gravity = name.getGravity();
                int alignment = name.getTextAlignment();
                AuthorRegion.decorate(name, null, marker);
                layout(name, WIDTH);
                assertEquals(direction, name.getTextDirection());
                assertEquals(layoutDirection, name.getLayoutDirection());
                assertEquals(gravity, name.getGravity());
                assertEquals(alignment, name.getTextAlignment());
                assertEquals(name.getText().toString(), paragraph, name.getLayout().getParagraphDirection(0));
                assertGeometry(name, marker, paragraph);
                AuthorRegion.restore();
                assertEquals(original, name.getText().toString());
            }
        }
    }

    @Test public void asciiNamesKeepTheirExactTextAndSpanOffsetsInEnglish() {
        for (int direction : new int[]{View.TEXT_DIRECTION_FIRST_STRONG, View.TEXT_DIRECTION_FIRST_STRONG_LTR,
                View.TEXT_DIRECTION_LTR, View.TEXT_DIRECTION_LOCALE, View.TEXT_DIRECTION_ANY_RTL}) {
            TextView name = name("Alice", direction, View.LAYOUT_DIRECTION_LTR);
            StyleSpan style = styled(name, "Alice");
            AuthorRegion.decorate(name, null, "US · 4.2%");
            assertEquals("Alice · US · 4.2%", name.getText().toString());
            assertSpan(name, style, 0, 5);
            AuthorRegion.restore();
        }
    }

    @Test public void styledRtlNamesKeepTheirSpansAndRestoreExactly() {
        TextView name = name("محمد علي", View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR);
        StyleSpan style = styled(name, "محمد علي");
        AuthorRegion.decorate(name, null, "🇺🇸 · 4.2%");
        layout(name, WIDTH);
        assertSpan(name, style, 1, 9);
        assertGeometry(name, "🇺🇸 · 4.2%", 1);
        CharSequence settled = name.getText();
        AuthorRegion.decorate(name, null, "🇺🇸 · 4.2%");
        assertSame(settled, name.getText());
        AuthorRegion.restore();
        assertEquals("محمد علي", name.getText().toString());
        assertSpan(name, style, 0, 8);
    }

    @Test public void replacementsAndRecyclingDoNotStackDirectionalControls() {
        TextView name = name("محمد", View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR);
        AuthorRegion.decorate(name, null, "US");
        AuthorRegion.decorate(name, null, "🇬🇧 · 4.2%");
        assertEquals(3, count(name.getText(), (char)0x2068));
        assertEquals(3, count(name.getText(), (char)0x2069));
        AuthorRegion.decorate(name, "river", "DE");
        assertEquals("@river · DE", name.getText().toString());
        AuthorRegion.decorate(name, "שלום", "US");
        layout(name, WIDTH);
        assertGeometry(name, "US", 1);
        AuthorRegion.decorate(name, "river", null);
        assertEquals("@river", name.getText().toString());
        AuthorRegion.restore();
        assertEquals("محمد", name.getText().toString());
        AuthorRegion.decorate(name, null, "US");
        StyleSpan rebound = styled(name, "שלום Alice");
        AuthorRegion.restore();
        assertEquals("שלום Alice", name.getText().toString());
        assertSpan(name, rebound, 0, 10);
        AuthorRegion.decorate(name, null, "GB");
        layout(name, WIDTH);
        assertGeometry(name, "GB", 1);
        TextView next = name("next", View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR);
        AuthorRegion.decorate(next, null, "CA");
        assertEquals("שלום Alice", name.getText().toString());
        assertSpan(name, rebound, 0, 10);
    }

    @Test public void aNativeDirectionChangeRebuildsOnlyTheNeededIsolation() {
        TextView name = name("Alice", View.TEXT_DIRECTION_FIRST_STRONG, View.LAYOUT_DIRECTION_LTR);
        AuthorRegion.decorate(name, null, "🇺🇸");
        layout(name, WIDTH);
        assertEquals("Alice · 🇺🇸", name.getText().toString());
        name.setTextDirection(View.TEXT_DIRECTION_RTL);
        layout(name, WIDTH);
        AuthorRegion.decorate(name, null, "🇺🇸");
        layout(name, WIDTH);
        assertGeometry(name, "🇺🇸", -1);
        name.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        layout(name, WIDTH);
        AuthorRegion.decorate(name, null, "🇺🇸");
        assertEquals("Alice · 🇺🇸", name.getText().toString());
    }

    @Test public void aFittedRtlNameRegrowsWithItsStyledNameAndCompleteSuffix() throws Exception {
        for (String original : new String[]{"ليلى أحمد محمد", "Alice محمد علي"}) {
            for (int direction : new int[]{View.TEXT_DIRECTION_FIRST_STRONG, View.TEXT_DIRECTION_RTL}) {
                for (boolean fixed : new boolean[]{false, true}) {
                    FrameLayout root = new FrameLayout(RuntimeEnvironment.getApplication());
                    LinearLayout row = new LinearLayout(root.getContext());
                    TextView name = name(original, direction, View.LAYOUT_DIRECTION_LTR);
                    name.setTextSize(TypedValue.COMPLEX_UNIT_PX, 24);
                    StyleSpan style = new StyleSpan(Typeface.BOLD);
                    SpannableString text = new SpannableString(original);
                    text.setSpan(style, 0, 4, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    name.setText(text);
                    String suffix = "🇺🇸 · 4.2%";
                    int whole = (int)Math.ceil(Layout.getDesiredWidth(TextUtils.concat(text, " · " + suffix), name.getPaint()));
                    row.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                    View badge = new View(root.getContext());
                    row.addView(badge, new LinearLayout.LayoutParams(480 - whole + 65, 10));
                    root.addView(row, new FrameLayout.LayoutParams(fixed ? ViewGroup.LayoutParams.MATCH_PARENT
                            : ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                    layout(root, 480);
                    AuthorRegion.decorate(name, null, suffix);
                    for (int pass=0; pass<3; pass++) { layout(root,480); AuthorRegion.decorate(name,null,suffix); }
                    layout(root,480);
                    String cut = name.getText().toString();
                    assertTrue(cut, cut.contains("…"));
                    assertEquals(0, name.getLayout().getEllipsisCount(0));
                    assertGeometry(name, suffix, direction == View.TEXT_DIRECTION_RTL ? -1 : 1);
                    assertSpan(name, style, 1, 5);
                    capture(name, "fitted-"+direction+"-"+fixed+"-"+(original.startsWith("Alice")?"mixed":"arabic")+".png");
                    CharSequence settled = name.getText();
                    AuthorRegion.decorate(name,null,suffix);
                    assertSame(settled,name.getText());
                    badge.getLayoutParams().width = Math.max(1,480 - whole - 40);
                    badge.requestLayout();
                    for(int pass=0;pass<3;pass++) { layout(root,480); AuthorRegion.decorate(name,null,suffix); }
                    layout(root,480);
                    assertTrue(name.getText().toString(), name.getText().toString().contains(original));
                    assertFalse(name.getText().toString().contains("…"));
                    assertEquals(0,name.getLayout().getEllipsisCount(0));
                    assertGeometry(name,suffix,direction == View.TEXT_DIRECTION_RTL ? -1 : 1);
                    assertSpan(name,style,1,5);
                    capture(name,"regrown-"+direction+"-"+fixed+"-"+(original.startsWith("Alice")?"mixed":"arabic")+".png");
                    AuthorRegion.restore();
                    assertEquals(original,name.getText().toString());
                    assertSpan(name,style,0,4);
                }
            }
        }
    }

    @Test public void aRowWithNoRoomForTheSuffixRemainsRestorable() {
        TextView name = name("محمد علي",View.TEXT_DIRECTION_FIRST_STRONG,View.LAYOUT_DIRECTION_LTR);
        AuthorRegion.decorate(name,null,"🇺🇸 · 4.2%");
        layout(name,30);
        assertNull(AuthorRegion.fit(name,"محمد علي","🇺🇸 · 4.2%"));
        AuthorRegion.decorate(name,null,"🇺🇸 · 4.2%");
        AuthorRegion.restore();
        assertEquals("محمد علي",name.getText().toString());
    }

    @Test public void fittingAwayTheRtlPartOfAMixedNameKeepsItsIsolationForRegrowth() {
        String original = "Alice with a longer name محمد";
        TextView name = name(original,View.TEXT_DIRECTION_FIRST_STRONG,View.LAYOUT_DIRECTION_LTR);
        FrameLayout row = new FrameLayout(name.getContext());
        row.addView(name,new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        AuthorRegion.decorate(name,null,"US");
        layout(row,200);
        AuthorRegion.decorate(name,null,"US");
        layout(row,200);
        String cut=name.getText().toString();
        assertTrue(cut,cut.contains("…"));
        assertFalse(cut,cut.contains("م"));
        assertEquals(0,name.getLayout().getEllipsisCount(0));
        assertEquals(0x2068,cut.charAt(0));
        assertGeometry(name,"US",1);
        layout(row,600);
        AuthorRegion.decorate(name,null,"US");
        layout(row,600);
        assertTrue(name.getText().toString(),name.getText().toString().contains(original));
        assertEquals(0,name.getLayout().getEllipsisCount(0));
        assertGeometry(name,"US",1);
        AuthorRegion.restore();
        assertEquals(original,name.getText().toString());
    }

    @Test public void offAndPauseRestoreTheOriginalStyledTextThroughApply() throws Exception {
        try(ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            LinearLayout row = new LinearLayout(controller.get());
            TextView name = name("محمد علي",View.TEXT_DIRECTION_RTL,View.LAYOUT_DIRECTION_LTR);
            name.setId(NAME_ID);
            StyleSpan style = styled(name,"محمد علي");
            TextView time = new TextView(controller.get());
            time.setId(TIME_ID);
            row.addView(name);
            row.addView(time);
            controller.get().setContentView(row);
            Settings.SHOW_AUTHOR_REGION.save(true);
            Settings.SHOW_AUTHOR_HANDLE.save(false);
            Settings.SHOW_ENGAGEMENT_RATE.save(false);
            AuthorRegion.install(controller.get());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Method update = CurrentVideoAuthor.class.getDeclaredMethod("update",Object.class);
            update.setAccessible(true);
            update.invoke(null,new Params());
            Method playing = CurrentVideoAuthor.class.getDeclaredMethod("onPlaying",String.class);
            playing.setAccessible(true);
            playing.invoke(null,"bidi");
            invoke(AuthorRegion.class,"apply");
            assertTrue(name.getText().toString(),name.getText().toString().contains("US"));
            Settings.SHOW_AUTHOR_REGION.save(false);
            invoke(AuthorRegion.class,"apply");
            assertEquals("محمد علي",name.getText().toString());
            assertSpan(name,style,0,8);
            Settings.SHOW_AUTHOR_REGION.save(true);
            invoke(AuthorRegion.class,"apply");
            assertTrue(name.getText().toString(),name.getText().toString().contains("US"));
            PausedProcess.set(true);
            invoke(AuthorRegion.class,"apply");
            assertEquals("محمد علي",name.getText().toString());
            assertSpan(name,style,0,8);
            assertEquals(View.TEXT_DIRECTION_RTL,name.getTextDirection());
            PausedProcess.set(false);
            invoke(AuthorRegion.class,"apply");
            assertTrue(name.getText().toString(),name.getText().toString().contains("US"));
        }
    }

    public static final class Clip { public final String aid="bidi"; public final String region="US"; }
    public static final class Params { public final Clip aweme = new Clip(); }

    @Test @Config(sdk=23) @GraphicsMode(GraphicsMode.Mode.LEGACY)
    public void theApi23FloorKeepsSpansSubstitutionAndRestoration() {
        TextView name = name("محمد علي",View.TEXT_DIRECTION_RTL,View.LAYOUT_DIRECTION_LTR);
        StyleSpan style = styled(name,"محمد علي");
        AuthorRegion.decorate(name,null,"🇺🇸 · 4.2%");
        assertSpan(name,style,1,9);
        AuthorRegion.decorate(name,"river","US");
        assertTrue(name.getText().toString(),name.getText().toString().contains("@river"));
        AuthorRegion.restore();
        assertEquals("محمد علي",name.getText().toString());
        assertSpan(name,style,0,8);
        assertEquals(View.TEXT_DIRECTION_RTL,name.getTextDirection());
        String supplementary=new String(Character.toChars(0x1EE00))+" Alice";
        name = name(supplementary,View.TEXT_DIRECTION_FIRST_STRONG,View.LAYOUT_DIRECTION_LTR);
        StyleSpan supplementaryStyle=styled(name,supplementary);
        CharSequence original = name.getText();
        AuthorRegion.decorate(name,null,"US");
        assertEquals(0x2068,name.getText().charAt(0));
        assertSpan(name,supplementaryStyle,1,supplementary.length()+1);
        AuthorRegion.restore();
        assertEquals(original.toString(),name.getText().toString());
        assertSpan(name,supplementaryStyle,0,supplementary.length());
    }

    @Test public void representativeNativeRenders() throws Exception {
        Locale.setDefault(new Locale("ar","SA"));
        String localizedRate=EngagementRate.format(10_000,420);
        Locale.setDefault(Locale.US);
        String[][] cases={{"محمد","🇺🇸"},{"שלום","US"},{"محمد Alice","🇺🇸 · 4.2%"},{"🚀✨","🇺🇸 · 4.2%"},
                {new String(Character.toChars(0x1EE00))+" Alice","US · 4.2%"},{"محمد Alice","US · "+localizedRate}};
        StringBuilder evidence=new StringBuilder("case\tdirection\tlayoutDirection\tparagraph\tnameLeft\tnameRight\tseparatorLeft\tseparatorRight\tsuffixLeft\tsuffixRight\tcountryLeft\tcountryRight\trateLeft\trateRight\n");
        for(int i=0;i<cases.length;i++) for(int direction:i==5?new int[]{View.TEXT_DIRECTION_LOCALE}
                :new int[]{View.TEXT_DIRECTION_FIRST_STRONG,View.TEXT_DIRECTION_RTL}) {
            if(i==5) Locale.setDefault(new Locale("ar","SA"));
            TextView name=name(cases[i][0],direction,View.LAYOUT_DIRECTION_LTR);
            AuthorRegion.decorate(name,null,cases[i][1]);
            layout(name,WIDTH);
            capture(name,"case-"+i+"-direction-"+direction+".png");
            String text=name.getText().toString();
            int creatorStart=text.indexOf(cases[i][0]);
            String[] fields=cases[i][1].split(" · ",-1);
            int markerStart=text.indexOf(fields[0]);
            int markerEnd=text.lastIndexOf(fields[fields.length-1])+fields[fields.length-1].length();
            int separator=text.indexOf(" · ");
            RectF creator=bounds(name,creatorStart,creatorStart+cases[i][0].length());
            RectF dot=bounds(name,separator+1,separator+2);
            RectF marker=bounds(name,markerStart,markerEnd);
            RectF country=bounds(name,markerStart,markerStart+fields[0].length());
            int rateStart=fields.length>1?text.lastIndexOf(fields[1]):-1;
            RectF rateBounds=rateStart>=0?bounds(name,rateStart,rateStart+fields[1].length()):new RectF();
            evidence.append(i).append('\t').append(name.getTextDirection()).append('\t')
                    .append(name.getLayoutDirection()).append('\t').append(name.getLayout().getParagraphDirection(0)).append('\t')
                    .append(creator.left).append('\t').append(creator.right).append('\t')
                    .append(dot.left).append('\t').append(dot.right).append('\t')
                    .append(marker.left).append('\t').append(marker.right).append('\t')
                    .append(country.left).append('\t').append(country.right).append('\t')
                    .append(rateBounds.left).append('\t').append(rateBounds.right).append('\n');
            AuthorRegion.restore();
        }
        String folder=System.getProperty("hushfeed.bidi.output");
        if(folder!=null) try(FileOutputStream stream=new FileOutputStream(new File(folder,"native-layout-evidence.tsv"))) {
            stream.write(evidence.toString().getBytes(StandardCharsets.UTF_8));
        }
    }

    private static TextView name(String text,int direction,int layoutDirection) {
        TextView name=new TextView(RuntimeEnvironment.getApplication());
        name.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        name.setSingleLine(true);
        name.setHorizontallyScrolling(false);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setTextDirection(direction);
        name.setLayoutDirection(layoutDirection);
        name.setTextAlignment(View.TEXT_ALIGNMENT_GRAVITY);
        name.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        name.setTextSize(TypedValue.COMPLEX_UNIT_PX,30);
        name.setTextColor(Color.WHITE);
        name.setBackgroundColor(Color.rgb(24,24,24));
        name.setText(text);
        return name;
    }
    private static StyleSpan styled(TextView name,String original) {
        SpannableString text=new SpannableString(original);
        StyleSpan style=new StyleSpan(Typeface.BOLD);
        text.setSpan(style,0,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        name.setText(text);
        return style;
    }
    private static void assertSpan(TextView name,StyleSpan style,int start,int end) {
        Spanned text=(Spanned)name.getText();
        assertSame(style,text.getSpans(0,text.length(),StyleSpan.class)[0]);
        assertEquals(start,text.getSpanStart(style));
        assertEquals(end,text.getSpanEnd(style));
        assertEquals(Spanned.SPAN_EXCLUSIVE_EXCLUSIVE,text.getSpanFlags(style));
    }
    private static void assertGeometry(TextView name,String marker,int paragraph) {
        String text=name.getText().toString();
        int tail=text.indexOf(" · ");
        String[] fields=marker.split(" · ",-1);
        int markerStart=text.indexOf(fields[0],tail+3);
        int markerEnd=text.lastIndexOf(fields[fields.length-1])+fields[fields.length-1].length();
        assertTrue(text,tail>=0);
        assertTrue(text,markerStart>=tail+3);
        int start=text.charAt(0)==0x2068?1:0;
        int end=tail>0&&text.charAt(tail-1)==0x2069?tail-1:tail;
        RectF creator=bounds(name,start,end);
        RectF suffix=bounds(name,tail,markerEnd);
        RectF dot=bounds(name,tail+1,tail+2);
        RectF country=bounds(name,markerStart,markerStart+fields[0].length());
        RectF markerBounds=bounds(name,markerStart,markerEnd);
        String message=text+" creator="+creator+" suffix="+suffix+" dot="+dot+" marker="+country;
        assertEquals(message,paragraph,name.getLayout().getParagraphDirection(0));
        assertTrue(message,paragraph==1?suffix.left>=creator.right-.1f:suffix.right<=creator.left+.1f);
        assertTrue(message,paragraph==1?dot.right<=markerBounds.left+.1f:markerBounds.right<=dot.left+.1f);
        if(fields.length>1) {
            int innerSeparator=text.indexOf(" · ",markerStart+fields[0].length());
            RectF innerDot=bounds(name,innerSeparator+1,innerSeparator+2);
            int rate=text.indexOf(fields[1],innerSeparator+3);
            RectF rateBounds=bounds(name,rate,rate+fields[1].length());
            assertTrue(message,paragraph==1?country.right<=innerDot.left+.1f:innerDot.right<=country.left+.1f);
            assertTrue(message,paragraph==1?innerDot.right<=rateBounds.left+.1f:rateBounds.right<=innerDot.left+.1f);
        }
    }
    private static RectF bounds(TextView name,int start,int end) {
        Path path=new Path();
        name.getLayout().getSelectionPath(start,end,path);
        RectF result=new RectF();
        path.computeBounds(result,true);
        return result;
    }
    private static void layout(View view,int width) {
        view.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(HEIGHT,view instanceof TextView?View.MeasureSpec.EXACTLY:View.MeasureSpec.AT_MOST));
        view.layout(0,0,width,view.getMeasuredHeight());
    }
    private static int count(CharSequence text,char value) {
        int count=0;
        for(int i=0;i<text.length();i++) if(text.charAt(i)==value) count++;
        return count;
    }
    private static void invoke(Class<?> type,String name) throws Exception {
        Method method=type.getDeclaredMethod(name);
        method.setAccessible(true);
        method.invoke(null);
    }
    private static void capture(TextView name,String label) throws Exception {
        String folder=System.getProperty("hushfeed.bidi.output");
        if(folder==null) return;
        File output=new File(folder,label);
        output.getParentFile().mkdirs();
        Bitmap bitmap=Bitmap.createBitmap(name.getWidth(),name.getHeight(),Bitmap.Config.ARGB_8888);
        name.draw(new Canvas(bitmap));
        try(FileOutputStream stream=new FileOutputStream(output)) {
            assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,stream));
        }
        bitmap.recycle();
    }
}
