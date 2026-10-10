package e.e.a;

import android.app.AlertDialog;
import android.content.*;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.*;
import android.widget.*;

/** One palette for native dialogs, generated forms and action lists. */
public final class UiDialogs {
    static Context owner(Context context) {
        for (int n=0; n<12 && context instanceof ContextWrapper && !(context instanceof android.app.Activity); n++) {
            Context base=((ContextWrapper)context).getBaseContext();
            if(base==null || base==context) break;
            context=base;
        }
        return context;
    }
    public static int accent(Context context) { return ThemeChoice.accent(owner(context)); }
    public static int surface(Context context) {
        Context c=owner(context); boolean dark=ThemeChoice.isNight(c);
        if(Build.VERSION.SDK_INT>=31 && android.preference.PreferenceManager.getDefaultSharedPreferences(c).getBoolean("material_you_mode",false)) {
            int id=c.getResources().getIdentifier(dark?"system_neutral1_900":"system_neutral1_50","color","android");
            if(id!=0) return c.getResources().getColor(id,c.getTheme());
        }
        return dark?0xff191b20:0xfffafafa;
    }
    public static void style(AlertDialog dialog) {
        if(dialog.getWindow()==null) return;
        Context c=owner(dialog.getContext()); int accent=accent(c);
        GradientDrawable background=new GradientDrawable();background.setColor(surface(c));background.setCornerRadius(24*c.getResources().getDisplayMetrics().density);
        dialog.getWindow().setBackgroundDrawable(background);
        for(int which:new int[]{-1,-2,-3}) if(dialog.getButton(which)!=null) dialog.getButton(which).setTextColor(accent);
        boolean dark=ThemeChoice.isNight(owner(c));
        inputs(dialog.getWindow().getDecorView(),accent,dark);

    }
    private static void inputs(View v,int accent,boolean dark) {
        ColorStateList tint=ColorStateList.valueOf(accent);
        if(v instanceof AbsListView) {
            AbsListView list=(AbsListView)v;list.setBackgroundColor(surface(owner(v.getContext())));
            AbsListView.OnScrollListener listener=new AbsListView.OnScrollListener(){public void onScrollStateChanged(AbsListView view,int state){}public void onScroll(AbsListView view,int first,int count,int total){for(int n=0;n<view.getChildCount();n++)inputs(view.getChildAt(n),accent,dark);}};
            list.setOnScrollListener(listener);list.post(()->listener.onScroll(list,0,list.getChildCount(),list.getCount()));
        }
        if(v instanceof TextView) ((TextView)v).setTextColor(v instanceof Button?accent:dark?0xffeeeeee:0xff202124);
        String name="";try{if(v.getId()!=View.NO_ID)name=v.getResources().getResourceEntryName(v.getId());}catch(Exception ignored){}
        if(name.equals("parentPanel")||name.equals("topPanel")||name.equals("contentPanel")||name.equals("buttonPanel")||name.equals("customPanel"))v.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        if(v instanceof EditText) {
            EditText e=(EditText)v;e.setTextColor(dark?0xffeeeeee:0xff202124);e.setHintTextColor(dark?0xffb7bac3:0xff666a73);e.setBackgroundTintList(tint);
            if(Build.VERSION.SDK_INT>=29) {
                android.graphics.drawable.Drawable cursor=e.getTextCursorDrawable();if(cursor!=null){cursor=cursor.mutate();cursor.setTint(accent);e.setTextCursorDrawable(cursor);}
            }
        }
        if(v instanceof SeekBar) {((SeekBar)v).setProgressTintList(tint);((SeekBar)v).setThumbTintList(tint);}
        if(v instanceof CompoundButton) ((CompoundButton)v).setButtonTintList(tint);
        if(v instanceof CheckedTextView) ((CheckedTextView)v).setCheckMarkTintList(tint);
        if(v instanceof ViewGroup) {ViewGroup g=(ViewGroup)v;for(int n=0;n<g.getChildCount();n++) inputs(g.getChildAt(n),accent,dark);}
    }
    public static void show(AlertDialog dialog) { dialog.show();PlaybackSession.styleDialog(dialog);style(dialog); }
    public static AlertDialog showBuilder(AlertDialog.Builder builder) {AlertDialog d=builder.create();show(d);return d;}
}
