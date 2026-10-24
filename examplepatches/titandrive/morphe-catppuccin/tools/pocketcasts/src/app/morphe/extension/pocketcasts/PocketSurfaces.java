// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.extension.pocketcasts;

import android.content.res.ColorStateList;
import android.util.TypedValue;
import android.view.View;
import android.widget.TextView;
import java.lang.reflect.Field;

/** Scope artwork-derived surfaces to added themes, preserving stock behavior. */
public final class PocketSurfaces {
    private static int variant(View view) {
        TypedValue value=new TypedValue();
        return view.getContext().getTheme().resolveAttribute(0x7f04f000,value,true)?value.data:0;
    }
    private static int variant(Enum<?> theme) {
        String name=theme.name();
        return name.equals("CATPPUCCIN_LATTE")?1:name.equals("CATPPUCCIN_MACCHIATO")?2:name.equals("RADIOACTIVITY")?3:0;
    }
    private static int surface(int variant) { return variant==1?0xffe6e9ef:variant==2?0xff1e2030:0xff0d1b11; }
    private static int base(int variant) { return variant==1?0xffeff1f5:variant==2?0xff24273a:0xff162f1e; }
    private static int accent(int variant) { return variant==1?0xff8839ef:variant==2?0xffc6a0f6:0xff88ff66; }
    public static int notesSurfaceColor(View view,int original) {
        int variant=variant(view);
        return variant==0?original:base(variant);
    }
    public static View notesRoot(View view) {
        if(view!=null && variant(view)!=0) view.setBackgroundColor(base(variant(view)));
        return view;
    }
    public static int surfaceColor(View view,int original) {
        int variant=variant(view);
        return variant==0?original:surface(variant);
    }
    public static int featuredTextColor(TextView view,int original) {
        int variant=variant(view);
        if (variant==0) return original;
        int id=view.getId();
        if (id==0x7f0a0327) return accent(variant); // Featured/sponsored chip
        if (id==0x7f0a0324) return variant==1?0xff6c6f85:variant==2?0xffa5adcb:0xff469431;
        return variant==1?0xff4c4f69:variant==2?0xffcad3f5:0xff74f864;
    }
    public static ColorStateList featuredChipBackground(View view,ColorStateList original) {
        int variant=variant(view);
        if (variant==0) return original;
        return ColorStateList.valueOf(variant==1?0xffccd0da:variant==2?0xff363a4f:0xff27591a);
    }
    public static ColorStateList accentTint(View view,ColorStateList original) {
        int variant=variant(view);
        return variant==0?original:ColorStateList.valueOf(accent(variant));
    }
    public static void player(Object colors) {
        try {
            Field theme=colors.getClass().getDeclaredField("a");theme.setAccessible(true);
            int variant=variant((Enum<?>)theme.get(colors));
            if (variant==0) return;
            for (String name:new String[]{"c","d"}) {
                Field field=colors.getClass().getDeclaredField(name);field.setAccessible(true);
                field.setLong(colors,((long)(name.equals("c")?base(variant):surface(variant)))<<32);
            }
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Pocket Casts player palette changed",error); }
    }
    public static void chapterProgress(View view) {
        int variant=variant(view);
        if(variant==0) return;
        try {
            Field background=view.getClass().getDeclaredField("K");background.setAccessible(true);
            Field progress=view.getClass().getDeclaredField("L");progress.setAccessible(true);
            ((android.graphics.Paint)background.get(view)).setColor(surface(variant));
            ((android.graphics.Paint)progress.get(view)).setColor((accent(variant)&0x00ffffff)|0x33000000);
        } catch(ReflectiveOperationException error) { throw new IllegalStateException("Pocket Casts progress paints changed",error); }
    }
    private static volatile String fontStyle;
    private static String notesFont(android.content.Context context) {
        if(fontStyle!=null) return fontStyle;
        try(java.io.InputStream input=context.getAssets().open("catppuccin/pocketcasts-custom.ttf");
            java.io.ByteArrayOutputStream output=new java.io.ByteArrayOutputStream()) {
            byte[] buffer=new byte[8192];int count;
            while((count=input.read(buffer))!=-1) output.write(buffer,0,count);
            fontStyle="@font-face{font-family:PocketCustom;font-display:block;src:url(data:font/ttf;base64,"+
                android.util.Base64.encodeToString(output.toByteArray(),android.util.Base64.NO_WRAP)+
                ")}body,body *{font-family:PocketCustom!important}";
        } catch(java.io.IOException missing) { fontStyle=""; }
        return fontStyle;
    }
    public static void loadNotes(android.webkit.WebView view,String baseUrl,String html,String mime,String encoding,String historyUrl) {
        if(html!=null && html.contains("Roboto-Regular")) {
            String css=notesFont(view.getContext());
            int variant=variant(view);
            if(variant!=0) {
                String bg=String.format("#%06x",base(variant)&0xffffff);
                String text=variant==1?"#4c4f69":variant==2?"#cad3f5":"#74f864";
                String link=String.format("#%06x",accent(variant)&0xffffff);
                css+="html,body{background:"+bg+"!important;color:"+text+"!important}"+
                    "body *{color:inherit!important;background-color:transparent!important}"+
                    "a,a *{color:"+link+"!important}";
                view.setBackgroundColor(base(variant));
                android.view.ViewParent parent=view.getParent();
                if(parent instanceof View) ((View)parent).setBackgroundColor(base(variant));
            }
            if(!css.isEmpty()) html=html.replace("</head>","<style id='pocketcasts-custom'>"+css+"</style></head>");
        }
        view.loadDataWithBaseURL(baseUrl,html,mime,encoding,historyUrl);
    }

}
