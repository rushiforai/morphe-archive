package app.yydarlinker.deepseekcaptions;

import android.graphics.Paint;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.view.View;
import android.widget.TextView;
import java.util.Arrays;
import java.util.Locale;

/** Immutable target presentation contract; never inferred from UI locale or text script. */
final class CaptionRenderSpec {
  static final String POLICY_VERSION = "n29-presentation-v3";
  static final CaptionRenderSpec LEGACY = new CaptionRenderSpec("zh-Hans",
      CaptionLanguageProfile.fromCode("zh-Hans"), true);
  final String targetCode, presentationPolicy;
  final CaptionLanguageProfile profile;
  final Locale locale;
  final CaptionLanguageProfile.Direction direction;
  final boolean legacy;
  final int maxLines = 2;
  private final TextPaint measurementPaint;
  private final TextDirectionHeuristic measurementDirection;
  static long layoutCalls; // Diagnostic counters, never layout or scheduling authority.

  CaptionRenderSpec(String target, CaptionLanguageProfile profile, boolean chinese) {
    this(target,profile,chinese,null,null);
  }
  private CaptionRenderSpec(String target,CaptionLanguageProfile profile,boolean chinese,
      TextPaint paint,TextDirectionHeuristic heuristic) {
    measurementPaint=paint;measurementDirection=heuristic;
    targetCode=target; this.profile=profile; legacy=chinese;
    locale=Locale.forLanguageTag(target.equals("UNKNOWN") ? "und" : target);
    direction=profile.direction;
    presentationPolicy=legacy ? "legacy_n26" : POLICY_VERSION;
  }
  CaptionRenderSpec withPaint(TextView view) {
    TextPaint paint=new TextPaint(view.getPaint());
    paint.setTextSize(1); // Size is an explicit plan key and is set separately by layout().
    int direction=view.getTextDirection();TextDirectionHeuristic actual;
    switch(direction) {
      case View.TEXT_DIRECTION_LTR:actual=TextDirectionHeuristics.LTR;break;
      case View.TEXT_DIRECTION_RTL:actual=TextDirectionHeuristics.RTL;break;
      case View.TEXT_DIRECTION_ANY_RTL:actual=TextDirectionHeuristics.ANYRTL_LTR;break;
      case View.TEXT_DIRECTION_LOCALE:actual=TextDirectionHeuristics.LOCALE;break;
      case View.TEXT_DIRECTION_FIRST_STRONG_RTL:actual=TextDirectionHeuristics.FIRSTSTRONG_RTL;break;
      case View.TEXT_DIRECTION_FIRST_STRONG_LTR:actual=TextDirectionHeuristics.FIRSTSTRONG_LTR;break;
      default:actual=view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL
          ? TextDirectionHeuristics.FIRSTSTRONG_RTL : TextDirectionHeuristics.FIRSTSTRONG_LTR;
    }
    return new CaptionRenderSpec(targetCode,profile,legacy,paint,actual);
  }
  boolean sameMeasurement(CaptionRenderSpec other) {
    return other!=null && targetCode.equals(other.targetCode) && legacy==other.legacy
        && measurementDirection==other.measurementDirection
        && (measurementPaint==null ? other.measurementPaint==null
            : other.measurementPaint!=null && measurementPaint.equalsForTextMeasurement(other.measurementPaint));
  }
  TextDirectionHeuristic heuristic() {
    return direction==CaptionLanguageProfile.Direction.RTL ? TextDirectionHeuristics.RTL
        : direction==CaptionLanguageProfile.Direction.LTR ? TextDirectionHeuristics.LTR
        : TextDirectionHeuristics.FIRSTSTRONG_LTR;
  }
  void apply(TextView view) {
    // Restore the historical defaults when an RTL event is followed by legacy/status text.
    view.setTextDirection(legacy ? View.TEXT_DIRECTION_INHERIT
        : direction==CaptionLanguageProfile.Direction.RTL ? View.TEXT_DIRECTION_RTL
        : direction==CaptionLanguageProfile.Direction.LTR ? View.TEXT_DIRECTION_LTR
        : View.TEXT_DIRECTION_FIRST_STRONG_LTR);
    view.setLayoutDirection(legacy ? View.LAYOUT_DIRECTION_INHERIT
        : direction==CaptionLanguageProfile.Direction.RTL ? View.LAYOUT_DIRECTION_RTL
        : View.LAYOUT_DIRECTION_LTR);
    if(!legacy) view.setTextLocale(locale);
  }
  StaticLayout layout(String value, float sizePx, int width) {
    layoutCalls++;
    TextPaint paint=measurementPaint==null ? new TextPaint(Paint.ANTI_ALIAS_FLAG) : new TextPaint(measurementPaint);
    if(measurementPaint==null) {paint.setTypeface(Typeface.DEFAULT);if(!legacy)paint.setTextLocale(locale);}
    paint.setTextSize(sizePx);
    StaticLayout.Builder builder=StaticLayout.Builder.obtain(value,0,value.length(),paint,Math.max(1,width))
        .setIncludePad(false).setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
        .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE);
    if(measurementDirection!=null || !legacy) builder.setTextDirection(
        measurementDirection==null ? heuristic() : measurementDirection).setAlignment(Layout.Alignment.ALIGN_CENTER);
    return builder.build(); // No maxLines/ellipsis: measure the complete text before approving it.
  }
  boolean fits(String value, float sizePx, int width, int lines) {
    StaticLayout layout=layout(value,sizePx,width);
    return fits(value,layout,width,lines);
  }
  boolean fits(String value, Layout layout, int width, int lines) {
    if(layout==null || layout.getLineCount()>lines || layout.getLineCount()<1) return false;
    if(layout.getLineEnd(layout.getLineCount()-1)!=value.length()) return false;
    int[] boundaries=CaptionUnicode.characterBoundaries(value,locale);
    for(int i=0;i<layout.getLineCount();i++) {
      if(layout.getEllipsisCount(i)>0 || layout.getLineMax(i)>width+.01f
          || Arrays.binarySearch(boundaries,layout.getLineStart(i))<0
          || Arrays.binarySearch(boundaries,layout.getLineEnd(i))<0) return false;
    }
    return true;
  }
  float actualWidth(Layout layout) {
    float width=0;
    for(int i=0;i<layout.getLineCount();i++) width=Math.max(width,layout.getLineMax(i));
    return width;
  }
  int readingUnits(String text) { return CaptionUnicode.readingUnits(text,profile,locale); }
  double lineUnits(String text) { return CaptionUnicode.lineHalfUnits(text,profile,locale)/2.0; }
  double lineUnits(String text,Layout layout) {
    double units=0;
    for(int i=0;i<layout.getLineCount();i++) units=Math.max(units,
        lineUnits(text.substring(layout.getLineStart(i),layout.getLineEnd(i))));
    return units;
  }
  String fields(String text, long duration, float sizePx, int width) {
    StaticLayout measured=layout(text,sizePx,width);
    double units=lineUnits(text,measured);
    return "target_code="+targetCode+";profile_id="+profile.id+";direction="+direction
        +";reading_units="+readingUnits(text)+";line_units="+units+";max_lines="+maxLines
        +";actual_width_px="+actualWidth(measured)+";available_width_px="+width
        +";line_count="+measured.getLineCount()+";soft_reading_target="+profile.referenceCps
        +";soft_cpl_target="+profile.referenceCpl+";soft_page_target_ms="+profile.softPageDurationMs
        +";duration_ms="+duration+";presentation_policy="+presentationPolicy;
  }
  String watches(String text,long duration,float sizePx,int width) {
    String result="";
    if(readingUnits(text)*1000L>Math.max(1,duration)*profile.referenceCps) result="reading_speed";
    StaticLayout measured=layout(text,sizePx,width);
    for(int i=0;i<measured.getLineCount();i++)
      if(lineUnits(text.substring(measured.getLineStart(i),measured.getLineEnd(i)))>profile.referenceCpl) {
        result+=(result.isEmpty()?"":",")+"line_units"; break;
      }
    if(duration>profile.softPageDurationMs) result+=(result.isEmpty()?"":",")+"page_duration";
    return result;
  }
}
