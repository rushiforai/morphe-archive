package e.e.a;
import android.text.*;import android.text.style.*;import android.view.*;import android.view.inputmethod.EditorInfo;import android.widget.EditText;
public final class NumericInput114 {
 static void configure(EditText input){input.setSingleLine(true);input.setTextSize(16);input.setInputType(InputType.TYPE_CLASS_NUMBER);input.setTransformationMethod(null);input.setImeOptions(EditorInfo.IME_ACTION_NEXT|EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING|EditorInfo.IME_FLAG_NO_EXTRACT_UI);input.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);input.setAutofillHints((String[])null);input.setPrivateImeOptions("com.google.android.inputmethod.latin.noPersonalizedLearning=true,com.google.android.inputmethod.latin.noMicrophoneKey");}
 static CharSequence hint(String text){SpannableString hint=new SpannableString(text);int at=text.indexOf('（');if(at<0)at=text.indexOf('(');if(at>=0)hint.setSpan(new AbsoluteSizeSpan(12,true),at,text.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);return hint;}
}
