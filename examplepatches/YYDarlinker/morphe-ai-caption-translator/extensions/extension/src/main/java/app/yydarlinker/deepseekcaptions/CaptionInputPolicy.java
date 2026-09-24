package app.yydarlinker.deepseekcaptions;
import android.text.InputType;
final class CaptionInputPolicy {
    // Not PASSWORD or VISIBLE_PASSWORD: those select OEM secure keyboards without clipboard.
    static int keyInputType(){return InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;}
}
