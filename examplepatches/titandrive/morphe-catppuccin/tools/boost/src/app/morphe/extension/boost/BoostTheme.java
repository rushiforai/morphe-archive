// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.extension.boost;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

/** Helpers for the supported native 1.14.x theme registry. No retained Activity. */
public final class BoostTheme {
    private BoostTheme() {}

    // Replaced by the patch with the verified native preference getter.
    public static int mode() { return 0; }

    private static int color(int original, int latte, int macchiato) {
        int mode = mode();
        return mode == 17 ? latte : mode == 18 ? macchiato : original;
    }
    public static void selectTheme(Activity activity, int requested) {
        if (requested == 17 || requested == 18) {
            android.preference.PreferenceManager.getDefaultSharedPreferences(activity).edit()
                .putBoolean("pref_dynamic_colors", false).apply();
        }
    }
    public static int link(int original) { return color(original, 0xff1e66f5, 0xff8aadf4); }
    // Keep URL history private to this installation; never retain a screen.
    private static final java.util.WeakHashMap<android.widget.TextView, Boolean> linkViews = new java.util.WeakHashMap<>();
    private static android.content.SharedPreferences linkHistory;
    private static android.content.SharedPreferences history(android.content.Context context) {
        if (linkHistory == null) linkHistory = context.getApplicationContext()
            .getSharedPreferences("catppuccin_visited_links", android.content.Context.MODE_PRIVATE);
        return linkHistory;
    }
    private static String linkKey(String url) {
        if (url == null || !(url.startsWith("https://") || url.startsWith("http://"))) return null;
        try {
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(url.getBytes("UTF-8"));
            StringBuilder key = new StringBuilder(64);
            for (byte value : digest) key.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            return key.toString();
        } catch (java.security.GeneralSecurityException | java.io.UnsupportedEncodingException ignored) { return null; }
    }
    public static void visitLink(android.content.Context context, String url) {
        if (!enabled()) return;
        String key = linkKey(url);
        if (key == null) return;
        android.content.SharedPreferences prefs = history(context);
        java.util.Set<String> visited = new java.util.LinkedHashSet<>(prefs.getStringSet("urls", java.util.Collections.<String>emptySet()));
        visited.remove(key);
        visited.add(key);
        while (visited.size() > 4096) visited.remove(visited.iterator().next());
        prefs.edit().putStringSet("urls", visited).apply();
        for (android.widget.TextView view : new java.util.ArrayList<>(linkViews.keySet())) {
            if (view != null) view.invalidate();
        }
    }
    public static CharSequence links(android.widget.TextView view, CharSequence text) {
        if (!enabled() || !(text instanceof android.text.Spanned)) return text;
        android.text.Spanned source = (android.text.Spanned) text;
        android.text.style.URLSpan[] spans = source.getSpans(0, text.length(), android.text.style.URLSpan.class);
        if (spans.length == 0) return text;
        android.text.SpannableString result = new android.text.SpannableString(text);
        android.content.SharedPreferences prefs = history(view.getContext());
        for (android.text.style.URLSpan span : spans) {
            if (span instanceof VisitedLinkSpan) continue;
            String key = linkKey(span.getURL());
            if (key == null) continue; // Spoiler spans keep their original behavior.
            int start = source.getSpanStart(span), end = source.getSpanEnd(span), flags = source.getSpanFlags(span);
            result.removeSpan(span);
            result.setSpan(new VisitedLinkSpan(span, key, prefs), start, end, flags);
        }
        linkViews.put(view, Boolean.TRUE);
        return result;
    }
    private static final class VisitedLinkSpan extends android.text.style.URLSpan {
        private final android.text.style.URLSpan original;
        private final String key;
        private final android.content.SharedPreferences prefs;
        VisitedLinkSpan(android.text.style.URLSpan original, String key, android.content.SharedPreferences prefs) {
            super(original.getURL()); this.original = original; this.key = key; this.prefs = prefs;
        }
        @Override public void updateDrawState(android.text.TextPaint paint) {
            original.updateDrawState(paint);
            if (enabled()) paint.setColor(prefs.getStringSet("urls", java.util.Collections.<String>emptySet()).contains(key) ? secondary(0) : link(0));
        }
        @Override public void onClick(View widget) {
            visitLink(widget.getContext(), getURL());
            original.onClick(widget);
        }
    }
    public static int accent(int original) { return color(original, 0xff8839ef, 0xffc6a0f6); }
    public static int text(int original) { return color(original, 0xff4c4f69, 0xffcad3f5); }
    public static int title(int original) { return color(original, 0xff4c4f69, 0xff8aadf4); }
    public static int secondary(int original) { return color(original, 0xff6c6f85, 0xffa5adcb); }
    public static int header(int original) { return color(original, 0xffccd0da, 0xff1e2030); }
    public static int indentWidth(View view, int original) {
        return enabled() && original>0 ? Math.max(1,Math.round(3*view.getResources().getDisplayMetrics().density)) : original;
    }
    public static int divider(View view, int original) {
        return color(original, 0xff9ca0b0, 0xff363a4f);
    }
    public static int sticky(int original) { return color(original, 0xff40a02b, 0xffa6da95); }
    public static int surface(int original) { return color(original, 0xffe6e9ef, 0xff24273a); }
    public static boolean material(boolean original) { int m=mode(); return m==17 || m==18 || original; }
    public static boolean dynamic(boolean original) { int m=mode(); return m==17 || m==18 ? false : original; }
    public static boolean amoled(boolean original) { return dynamic(original); }
    public static int toolbarMode(int original) { return color(original, 100, 200); }
    public static int themeIndex(int original, int requested) { return requested==17 || requested==18 ? requested : original; }

    public static void tintMenu(Menu menu) {
        if (menu == null || (mode()!=17 && mode()!=18)) return;
        for (int i=0; i<menu.size(); i++) {
            MenuItem item=menu.getItem(i);
            Drawable icon=item.getIcon();
            if (icon!=null) { icon=icon.mutate(); icon.setTint(accent(0)); item.setIcon(icon); }
        }
    }

    public static void media(Activity activity) {
        int m=mode();
        if (m!=17 && m!=18) return;
        activity.getTheme().applyStyle(m==17 ? 0x7f141000 : 0x7f141001, true);
        activity.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(surface(0)));
        activity.getWindow().setStatusBarColor(header(0));
        activity.getWindow().setNavigationBarColor(header(0));
        View root=activity.findViewById(android.R.id.content);
        if (root!=null) { root.setBackgroundColor(surface(0)); mediaView(root); }
    }

    public static View mediaView(View view) {
        if (view==null || (mode()!=17 && mode()!=18)) return view;
        String name="";
        if(view.getId()!=View.NO_ID) {
            try { name=view.getResources().getResourceEntryName(view.getId()); }
            catch(android.content.res.Resources.NotFoundException ignored) {}
        }
        // Only media containers, never image pixels or drawable content.
        if(name.equals("container") || name.equals("main_content") || name.equals("bottom_sheet") || name.equals("video_view") || name.equals("video_cover") || name.equals("exo_shutter"))
            view.setBackgroundColor(surface(0));
        if(name.equals("toolbar") || name.equals("media_toolbar") || name.equals("bottom_bar")) {
            view.setBackgroundColor(android.graphics.Color.TRANSPARENT);view.setElevation(0);
            textChildren(view,text(0));
        }
        if(view instanceof android.widget.ImageView && (name.contains("download") || name.contains("hd") || name.equals("action_original")))
            ((android.widget.ImageView)view).setImageTintList(ColorStateList.valueOf(accent(0)));
        if(view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group=(android.view.ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++) mediaView(group.getChildAt(i));
        }
        return view;
    }
    private static boolean enabled() { int m=mode(); return m==17 || m==18; }
    public static int[] depth(int[] original) {
        if(!enabled()) return original;
        return mode()==17
            ? new int[]{0,0xff8839ef,0xffd20f39,0xfffe640b,0xffdf8e1d,0xff40a02b,0xff179299,0xff04a5e5,0xff209fb5,0xff1e66f5,0xff7287fd}
            : new int[]{0,0xffc6a0f6,0xffed8796,0xfff5a97f,0xffeed49f,0xffa6da95,0xff8bd5ca,0xff91d7e3,0xff7dc4e4,0xff8aadf4,0xffb7bdf8};
    }
    public static int badgeText(int original) {
        return enabled() && original==android.graphics.Color.WHITE
            ? color(original,0xffeff1f5,0xff24273a) : original;
    }
    public static void username(android.widget.TextView view, Drawable background, int role) {
        if(enabled() && background!=null) {
            int[] latte={0xff8839ef,0xff1e66f5,0xff7287fd,0xff40a02b,0xffd20f39};
            int[] mac={0xffc6a0f6,0xff8aadf4,0xffeed49f,0xffa6da95,0xffed8796};
            background=background.mutate();background.setTint((mode()==17?latte:mac)[role]);
        }
        view.setBackground(background);
    }
    public static int flairColor(int original) {
        if(!enabled() || android.graphics.Color.alpha(original)==0) return original;
        float[] hsv=new float[3];android.graphics.Color.colorToHSV(original,hsv);
        int[] latte={0xffd20f39,0xfffe640b,0xffdf8e1d,0xff40a02b,0xff179299,0xff04a5e5,0xff209fb5,0xff1e66f5,0xff7287fd,0xff8839ef,0xffea76cb,0xff9ca0b0};
        int[] mac={0xffed8796,0xfff5a97f,0xffeed49f,0xffa6da95,0xff8bd5ca,0xff91d7e3,0xff7dc4e4,0xff8aadf4,0xffb7bdf8,0xffc6a0f6,0xfff5bde6,0xff8087a2};
        float h=hsv[0];int slot=hsv[1]<0.15f?11:h<15?0:h<45?1:h<75?2:h<155?3:h<180?4:h<195?5:h<210?6:h<245?7:h<265?8:h<290?9:h<345?10:0;
        return (original & 0xff000000) | ((mode()==17?latte:mac)[slot] & 0xffffff);
    }
    public static void flair(View view) {
        if(!enabled() || !(view.getBackground() instanceof android.graphics.drawable.GradientDrawable)) return;
        android.graphics.drawable.GradientDrawable bg=(android.graphics.drawable.GradientDrawable)view.getBackground().mutate();
        ColorStateList list=bg.getColor();if(list==null || android.graphics.Color.alpha(list.getDefaultColor())==0) return;
        int c=flairColor(list.getDefaultColor());bg.setColor(c);
        double luminance=0.2126*linear(android.graphics.Color.red(c)/255.0)+0.7152*linear(android.graphics.Color.green(c)/255.0)+0.0722*linear(android.graphics.Color.blue(c)/255.0);
        int light=color(0,0xffeff1f5,0xffcad3f5), dark=color(0,0xff4c4f69,0xff24273a);
        double l=lum(light),d=lum(dark);
        int fg=(Math.max(l,luminance)+0.05)/(Math.min(l,luminance)+0.05) > (Math.max(d,luminance)+0.05)/(Math.min(d,luminance)+0.05)?light:dark;
        textChildren(view,fg);
    }
    private static double linear(double c){return c<=0.04045?c/12.92:Math.pow((c+0.055)/1.055,2.4);}
    private static double lum(int c){return 0.2126*linear(android.graphics.Color.red(c)/255.0)+0.7152*linear(android.graphics.Color.green(c)/255.0)+0.0722*linear(android.graphics.Color.blue(c)/255.0);}
    private static void textChildren(View v,int c){
        if(v instanceof android.widget.TextView)((android.widget.TextView)v).setTextColor(c);
        if(v instanceof android.view.ViewGroup){android.view.ViewGroup g=(android.view.ViewGroup)v;for(int i=0;i<g.getChildCount();i++)textChildren(g.getChildAt(i),c);}
    }
    public static void postCard(View view) {
        if(!enabled() || !(view instanceof android.widget.FrameLayout) ||
            !view.getClass().getName().equals("com.google.android.material.card.MaterialCardView")) return;
        android.widget.FrameLayout card=(android.widget.FrameLayout)view;
        android.view.ViewGroup.LayoutParams params=card.getLayoutParams();
        if(params instanceof android.view.ViewGroup.MarginLayoutParams) {
            android.view.ViewGroup.MarginLayoutParams margins=(android.view.ViewGroup.MarginLayoutParams)params;
            if(margins.leftMargin==0 && margins.rightMargin==0) {
                margins.topMargin=0;margins.bottomMargin=0;card.setLayoutParams(margins);
            }
        }
        // A single bottom divider, without a top edge or side borders.
        View line=new View(card.getContext());
        line.setBackgroundColor(divider(line,0));
        line.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        line.setLayoutParams(new android.widget.FrameLayout.LayoutParams(
            android.view.ViewGroup.LayoutParams.MATCH_PARENT,
            Math.max(1,Math.round(card.getResources().getDisplayMetrics().density)),android.view.Gravity.BOTTOM));
        card.addView(line);
    }
    public static void postPanel(View view) {
        if(!enabled() || view==null || view.getId()==View.NO_ID)return;
        String n=view.getResources().getResourceEntryName(view.getId());
        if(!n.equals("submission_header_selftext_container") && !n.equals("submission_preview_selftext")) return;
        Drawable d=view.getBackground();
        if(d instanceof android.graphics.drawable.GradientDrawable)((android.graphics.drawable.GradientDrawable)d.mutate()).setColor(surface(0));
        else view.setBackgroundColor(surface(0));
    }
    public static void pattern(android.widget.ImageView view) {
        if(!enabled() || view==null)return;
        float[] matrix=mode()==17
            ? new float[]{.02228f,.07477f,.00753f,0,193.65f,.02228f,.07477f,.00753f,0,197.65f,.01949f,.06542f,.00659f,0,208.94f,0,0,0,1,0}
            : new float[]{.05986f,.20095f,.02024f,0,2.18f,.06265f,.21029f,.02116f,0,2.88f,.07239f,.243f,.02448f,0,14.35f,0,0,0,1,0};
        view.setColorFilter(new android.graphics.ColorMatrixColorFilter(matrix));
    }

}
