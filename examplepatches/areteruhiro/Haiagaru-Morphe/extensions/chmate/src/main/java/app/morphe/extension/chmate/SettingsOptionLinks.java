package app.morphe.extension.chmate;
import android.content.*;import android.net.Uri;import android.text.*;import android.text.style.URLSpan;import android.view.View;import android.widget.TextView;import java.util.regex.*;

/** Only mark explicit setting commands. Rendering never builds settings or changes any option. */
public final class SettingsOptionLinks {
 private static final ThreadLocal<TextView> WRITING=new ThreadLocal<>();
 /** Also covers legacy native bindings which do not use processEmojiTextForView. */
 public static void onBound(Object object){
  if(!(object instanceof TextView)||object instanceof android.widget.EditText||object==WRITING.get())return;
  TextView view=(TextView)object;CharSequence source=view.getText();
  if(source instanceof Editable)return;
  CharSequence linked=apply(source);if(linked==source)return;
  TextView previous=WRITING.get();WRITING.set(view);
  try{view.setText(linked,TextView.BufferType.SPANNABLE);}
  finally{if(previous==null)WRITING.remove();else WRITING.set(previous);}
 }
 private static final Pattern LINKS=Pattern.compile("Haiagaru\\.設定\\.[^\\r\\n\\\"']{1,240}?\\.(?:true|false|open|開く|オン|オフ)(?![A-Za-z0-9_.])|haiagaru://settings\\?[^\\s<>\\\"']{1,2048}");
 static final class OptionLink extends XPostPreviewTouch.PostLink {
  OptionLink(String url){super(url);}
  @Override public void onClick(View view){Intent open=new Intent(view.getContext(),SettingLinkActivity.class).setAction(Intent.ACTION_VIEW).setData(Uri.parse(getURL()));if(!(view.getContext() instanceof android.app.Activity))open.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);view.getContext().startActivity(open);}
 }
 public static CharSequence apply(CharSequence source){
  if(!FeatureSwitches.enabled("settingsOptionLinksEnabled",true))return source;
  if(source==null)return null;if(TextUtils.indexOf(source,"Haiagaru.設定.")<0&&TextUtils.indexOf(source,"haiagaru://settings?")<0)return source;
  String text=source.toString();
  Matcher m=LINKS.matcher(text);SpannableStringBuilder result=null;
  while(m.find())try{
   SettingLinkRequest request=SettingLinkRequest.parse(m.group());boolean conflict=false;
   if(source instanceof Spanned){Spanned spanned=(Spanned)source;for(URLSpan span:spanned.getSpans(m.start(),m.end(),URLSpan.class)){
    if(span instanceof OptionLink||!span.getURL().startsWith("haiagaru://settings?")){conflict=true;break;}
   }}if(conflict)continue;
   if(result==null)result=new SpannableStringBuilder(source);
   for(URLSpan span:result.getSpans(m.start(),m.end(),URLSpan.class))result.removeSpan(span);
   result.setSpan(new OptionLink(request.url()),m.start(),m.end(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
  }catch(IllegalArgumentException ignored){}
  return result==null?source:result;
 }
 private SettingsOptionLinks(){}
}
