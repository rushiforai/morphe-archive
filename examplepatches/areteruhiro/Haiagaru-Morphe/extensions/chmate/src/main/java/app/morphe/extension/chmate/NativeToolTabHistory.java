package app.morphe.extension.chmate;

import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

/** Only the visible browser of this tool may consume its Back/Forward assignment. */
final class NativeToolTabHistory {
    static boolean navigate(View root,boolean forward){
        WebView browser=find(root);
        if(browser==null)return false;
        if(forward){if(!browser.canGoForward())return false;browser.goForward();}
        else{if(!browser.canGoBack())return false;browser.goBack();}
        return true;
    }
    private static WebView find(View root){
        if(root==null||!root.isShown()||!root.isAttachedToWindow())return null;
        if(root instanceof WebView)return (WebView)root;
        if(root instanceof ViewGroup){
            ViewGroup group=(ViewGroup)root;
            for(int i=group.getChildCount()-1;i>=0;i--){
                WebView found=find(group.getChildAt(i));if(found!=null)return found;
            }
        }
        return null;
    }
    private NativeToolTabHistory(){}
}
