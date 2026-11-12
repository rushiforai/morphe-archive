package e.e.a;
import android.app.*;import android.content.*;import android.graphics.*;import android.graphics.drawable.*;import android.view.*;import android.widget.*;

final class NicoliveUi {
 static int dp(Context c,float n){return Math.round(n*c.getResources().getDisplayMetrics().density);}
 static boolean ja(Context c){return c.getResources().getConfiguration().locale.getLanguage().equals("ja");}
 static int accent(Context c){return UiDialogs.accent(c);}
 static int videoAccent(Context c){int color=accent(c);return Color.rgb((int)(Color.red(color)*.6f+255*.4f),(int)(Color.green(color)*.6f+255*.4f),(int)(Color.blue(color)*.6f+255*.4f));}
 static void selected(Button button,boolean selected){button.setSelected(selected);button.setTextColor(selected?accent(button.getContext()):DynamicTheme.secondaryTextColor(button));button.setBackground(new TabLine(selected?accent(button.getContext()):Color.TRANSPARENT,dp(button.getContext(),2)));}
 static final class TabLine extends Drawable {
  final Paint paint=new Paint();final int height;
  TabLine(int color,int h){paint.setColor(color);height=h;}
  public void draw(Canvas c){Rect b=getBounds();c.drawRect(b.left,b.bottom-height,b.right,b.bottom,paint);}
  public void setAlpha(int a){paint.setAlpha(a);}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
 static CharSequence statistics(Context c,long views,long comments){
  android.text.SpannableStringBuilder b=new android.text.SpannableStringBuilder();
  if(views>=0)stat(b,c,"person",views);if(comments>=0){if(b.length()>0)b.append("   ");stat(b,c,"chat-stat",comments);}return b;
 }
 static void stat(android.text.SpannableStringBuilder b,Context c,String icon,long value){int at=b.length();b.append("\ufffc ").append(String.format(java.util.Locale.US,"%,d",value));Glyph g=new Glyph(icon,DynamicTheme.secondaryTextColor(new TextView(c)));g.setBounds(0,0,dp(c,14),dp(c,14));b.setSpan(new android.text.style.ImageSpan(g,android.text.style.ImageSpan.ALIGN_BASELINE),at,at+1,android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
 static TextView text(Context c,String s,int size){TextView v=new TextView(c);v.setText(s);v.setTextSize(size);v.setTypeface(Typeface.DEFAULT,Typeface.NORMAL);v.setTextColor(DynamicTheme.textColor(v));v.setGravity(Gravity.CENTER_VERTICAL);return v;}
 static LinearLayout column(Context c){LinearLayout l=new LinearLayout(c);l.setOrientation(1);DynamicTheme.background(l);return l;}
 static LinearLayout row(Context c){LinearLayout l=new LinearLayout(c);l.setGravity(Gravity.CENTER_VERTICAL);return l;}
 static Button button(Context c,String s){Button b=new Button(c);b.setText(s);b.setAllCaps(false);b.setTextSize(13);b.setTypeface(Typeface.DEFAULT,0);b.setMinHeight(0);b.setMinimumHeight(0);b.setPadding(dp(c,8),0,dp(c,8),0);b.setTextColor(accent(c));b.setBackgroundColor(Color.TRANSPARENT);b.setElevation(0);return b;}
 static GradientDrawable panel(Context c,int radius){
  GradientDrawable panel=new GradientDrawable();
  int surface=UiDialogs.surface(c),tint=ThemeChoice.isNight(c)?Color.WHITE:Color.BLACK;
  panel.setColor(Color.rgb((Color.red(surface)*93+Color.red(tint)*7)/100,
   (Color.green(surface)*93+Color.green(tint)*7)/100,(Color.blue(surface)*93+Color.blue(tint)*7)/100));
  panel.setCornerRadius(dp(c,radius));
  return panel;
 }
 static View navigationButton(Context c,String label,String icon,boolean selected){
  LinearLayout button=new LinearLayout(c);
  button.setOrientation(LinearLayout.VERTICAL);
  button.setGravity(Gravity.CENTER);
  button.setSelected(selected);
  button.setFocusable(true);
  button.setContentDescription(label);
  button.setAccessibilityDelegate(new View.AccessibilityDelegate(){
   @Override public void onInitializeAccessibilityNodeInfo(View view,android.view.accessibility.AccessibilityNodeInfo node){
    super.onInitializeAccessibilityNodeInfo(view,node);
    node.setClassName(Button.class.getName());
   }
  });
  int color=selected?accent(c):DynamicTheme.secondaryTextColor(button);
  ImageView image=new ImageView(c);
  image.setImageDrawable(new Glyph(icon,color));
  image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
  button.addView(image,new LinearLayout.LayoutParams(dp(c,20),dp(c,20)));
  TextView text=text(c,label,11);
  text.setAutoSizeTextTypeUniformWithConfiguration(8,11,1,android.util.TypedValue.COMPLEX_UNIT_SP);
  text.setGravity(Gravity.CENTER);
  text.setMaxLines(1);
  text.setTextColor(color);
  text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
  LinearLayout.LayoutParams caption=new LinearLayout.LayoutParams(-1,dp(c,20));
  caption.topMargin=dp(c,2);
  button.addView(text,caption);
  return button;
 }
 static ImageButton icon(Context c,String name,String description){ImageButton b=new ImageButton(c);b.setImageDrawable(new Glyph(name,accent(c)));b.setContentDescription(description);b.setBackgroundColor(Color.TRANSPARENT);b.setPadding(dp(c,12),dp(c,12),dp(c,12),dp(c,12));b.setElevation(0);b.setLayoutParams(new LinearLayout.LayoutParams(dp(c,48),dp(c,48)));return b;}
 static EditText input(Context c,String hint){EditText e=new EditText(c);e.setTag("nicoid-managed-input");e.setSingleLine(true);e.setTextSize(16);e.setTextColor(DynamicTheme.textColor(e));e.setHintTextColor(DynamicTheme.secondaryTextColor(e));e.setHint(hint);e.setPadding(dp(c,8),dp(c,4),dp(c,8),dp(c,4));e.setBackgroundTintList(android.content.res.ColorStateList.valueOf(accent(c)));return e;}
 static void dialog(AlertDialog d){UiDialogs.show(d);}
 static String time(long seconds){return seconds<3600?String.format(java.util.Locale.ROOT,"%02d:%02d",seconds/60,seconds%60):String.format(java.util.Locale.ROOT,"%d:%02d:%02d",seconds/3600,(seconds/60)%60,seconds%60);}
 static class Glyph extends Drawable {
  final String name;final Paint p=new Paint(3);Glyph(String n,int color){name=n;p.setColor(color);p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(1.8f);p.setStrokeCap(Paint.Cap.ROUND);p.setStrokeJoin(Paint.Join.ROUND);}
  void line(Canvas c,float a,float b,float x,float y){c.drawLine(a,b,x,y,p);}
  public void draw(Canvas raw){Canvas c=raw;int save=c.save();Rect b=getBounds();c.translate(b.left,b.top);c.scale(b.width()/24f,b.height()/24f);
   if(name.equals("back")){line(c,17,4,7,12);line(c,7,12,17,20);}
   else if(name.equals("note")){c.drawCircle(12,12,10,p);line(c,12,6,12,13);c.drawPoint(12,17,p);}
   else if(name.equals("more")){p.setStyle(Paint.Style.FILL);c.drawCircle(12,5,1.8f,p);c.drawCircle(12,12,1.8f,p);c.drawCircle(12,19,1.8f,p);p.setStyle(Paint.Style.STROKE);}
   else if(name.equals("close")){line(c,5,5,19,19);line(c,19,5,5,19);}
   else if(name.equals("pause")){line(c,8,5,8,19);line(c,16,5,16,19);}
   else if(name.equals("play")){Path path=new Path();path.moveTo(7,4);path.lineTo(19,12);path.lineTo(7,20);path.close();c.drawPath(path,p);}
   else if(name.equals("search")){c.drawCircle(10,10,6,p);line(c,15,15,21,21);}
   else if(name.equals("expand")){line(c,3,9,3,3);line(c,3,3,9,3);line(c,15,3,21,3);line(c,21,3,21,9);line(c,21,15,21,21);line(c,21,21,15,21);line(c,9,21,3,21);line(c,3,21,3,15);}
   else if(name.equals("popup")){c.drawRoundRect(2,4,22,20,1,1,p);c.drawRect(11,11,21,19,p);}
   else if(name.equals("send")){Path path=new Path();path.moveTo(3,3);path.lineTo(22,12);path.lineTo(3,21);path.lineTo(7,12);path.close();c.drawPath(path,p);line(c,7,12,21,12);}
   else if(name.equals("people")){c.drawCircle(9,7,3,p);c.drawArc(2,12,16,24,180,180,false,p);c.drawArc(13,4,20,11,-95,185,false,p);c.drawArc(12,12,23,24,-75,75,false,p);}
   else if(name.equals("history")){c.drawArc(3,3,21,21,-155,305,false,p);line(c,3,3,3,9);line(c,3,9,9,9);line(c,12,7,12,12);line(c,12,12,16,14);}
   else if(name.equals("schedule")){c.drawCircle(12,12,9,p);line(c,12,7,12,12);line(c,12,12,16,14);}
   else if(name.equals("ranking")){c.drawRect(3,13,7,20,p);c.drawRect(10,5,14,20,p);c.drawRect(17,10,21,20,p);}
   else if(name.equals("calendar")){c.drawRoundRect(3,5,21,21,2,2,p);line(c,7,3,7,7);line(c,17,3,17,7);line(c,3,10,21,10);c.drawPoint(8,14,p);c.drawPoint(12,14,p);c.drawPoint(16,14,p);c.drawPoint(8,17,p);c.drawPoint(12,17,p);c.drawPoint(16,17,p);}
   else if(name.equals("person")){p.setStyle(Paint.Style.FILL);c.drawCircle(12,7,4,p);Path path=new Path();path.moveTo(7,12);path.cubicTo(3,15,3,21,5,21);path.lineTo(19,21);path.cubicTo(21,21,21,15,17,12);path.quadTo(12,16,7,12);c.drawPath(path,p);p.setStyle(Paint.Style.STROKE);}
   else if(name.equals("chat-stat")){p.setStyle(Paint.Style.FILL);c.drawRoundRect(3,3,21,18,2,2,p);Path path=new Path();path.moveTo(6,17);path.lineTo(6,22);path.lineTo(12,17);path.close();c.drawPath(path,p);p.setStyle(Paint.Style.STROKE);}
   else if(name.equals("comments-off")){c.drawRoundRect(3,4,21,18,2,2,p);line(c,3,2,22,22);}
   else if(name.equals("comments")){c.drawRoundRect(3,4,21,18,2,2,p);line(c,6,18,6,22);line(c,6,22,12,18);line(c,7,9,17,9);line(c,7,13,14,13);}
   else if(name.equals("settings")){c.drawCircle(12,12,3,p);for(int i=0;i<8;i++){double a=i*Math.PI/4;line(c,12+(float)Math.cos(a)*7,12+(float)Math.sin(a)*7,12+(float)Math.cos(a)*10,12+(float)Math.sin(a)*10);}}
   else if(name.equals("refresh")){c.drawArc(4,4,20,20,35,285,false,p);line(c,19,3,20,9);line(c,20,9,14,8);}
   else {c.drawCircle(12,12,3,p);c.drawArc(5,5,19,19,-45,90,false,p);c.drawArc(1,1,23,23,-45,90,false,p);c.drawArc(5,5,19,19,135,90,false,p);c.drawArc(1,1,23,23,135,90,false,p);}
   c.restoreToCount(save);
  }
  public void setAlpha(int a){p.setAlpha(a);}public void setColorFilter(ColorFilter f){p.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
 }
}
