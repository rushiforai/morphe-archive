package app.morphe.extension.chmate;

import android.os.Build;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

/** Only called for the native reply/new-thread editor, never account sign-in. */
final class PostMailInput {
    static void apply(View root){
        if(root instanceof EditText){
            EditText field=(EditText)root;
            int input=field.getInputType(),variation=input&InputType.TYPE_MASK_VARIATION;
            boolean email=(input&InputType.TYPE_MASK_CLASS)==InputType.TYPE_CLASS_TEXT
                    &&(variation==InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS||variation==InputType.TYPE_TEXT_VARIATION_WEB_EMAIL_ADDRESS);
            String name="";try{name=field.getResources().getResourceEntryName(field.getId());}catch(RuntimeException ignored){}
            String hint=field.getHint()==null?"":field.getHint().toString().trim();
            boolean mailHint=hint.matches("(?i)(?:e-?mail|メール(?:欄)?)(?:[：:]|\\s)*");
            if(!email&&!mailHint&&!name.matches("(?i)(?:.*_)?(?:mail|email)(?:_.*)?"))return;
            // Raw input type keeps the existing key listener, draft text, selection and sage action.
            int plain=(input&~InputType.TYPE_MASK_VARIATION&~InputType.TYPE_TEXT_FLAG_AUTO_COMPLETE&~InputType.TYPE_TEXT_FLAG_AUTO_CORRECT)
                    |InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
            if(input!=plain)field.setRawInputType(plain);
            if(Build.VERSION.SDK_INT>=26){
                field.setAutofillHints((String[])null);
                field.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS);
                field.setImeOptions(field.getImeOptions()|EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
            }
        }else if(root instanceof ViewGroup){
            ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)apply(group.getChildAt(i));
        }
    }
    private PostMailInput(){}
}
