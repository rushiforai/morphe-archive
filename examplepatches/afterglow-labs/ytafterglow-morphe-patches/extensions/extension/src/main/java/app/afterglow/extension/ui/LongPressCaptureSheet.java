package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Dialog;
import android.os.Build;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;

/** The three actions of Afterglow's comment sheet; each acts on a verified capture. */
public final class LongPressCaptureSheet {
    private static WeakReference<Dialog> shown=new WeakReference<>(null);
    private LongPressCaptureSheet(){}
    public static boolean showComment(Activity activity,Runnable copyText,Runnable saveImage,Runnable copyImage){
        return show(activity,false,copyText,saveImage,copyImage,null);
    }
    public static boolean showPost(Activity activity,Runnable copyText,Runnable saveImage,Runnable copyImage,Runnable copyCurrentImage){
        return show(activity,true,copyText,saveImage,copyImage,copyCurrentImage);
    }
    private static boolean show(Activity activity,boolean post,Runnable copyText,Runnable saveImage,Runnable copyImage,Runnable copyCurrentImage){
        Dialog current=shown.get();if(current!=null&&current.isShowing())return false;
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return false;
        VaultViews views=new VaultViews(activity);LinearLayout content=views.column();views.pad(content,12,0,12,5);
        content.addView(views.label(post?"Post actions":"Comment actions",17,true));views.gap(content,12);
        Dialog dialog=views.sheet(content);
        content.addView(views.button(post?"Copy post text":"Copy comment text",()->{dialog.dismiss();copyText.run();}));
        if(post&&copyCurrentImage!=null)content.addView(views.button("Copy current image",()->{dialog.dismiss();copyCurrentImage.run();}));
        android.widget.TextView save=views.button(post?"Save post as image":"Save comment as image",()->{dialog.dismiss();if(saveImage!=null)saveImage.run();});
        save.setEnabled(saveImage!=null&&Build.VERSION.SDK_INT>=29);content.addView(save);
        android.widget.TextView copy=views.button(post?"Copy post as image":"Copy comment as image",()->{dialog.dismiss();if(copyImage!=null)copyImage.run();});
        copy.setEnabled(copyImage!=null);content.addView(copy);
        if(saveImage==null&&copyImage==null)content.addView(views.label("Full item image unavailable in this view.",12,false));
        dialog.setOnDismissListener(d->{if(shown.get()==dialog)shown=new WeakReference<>(null);});
        shown=new WeakReference<>(dialog);dialog.show();return true;
    }
}
