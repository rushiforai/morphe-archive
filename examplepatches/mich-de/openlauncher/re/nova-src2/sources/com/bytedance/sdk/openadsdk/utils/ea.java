package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RotateDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.Pair;
import androidx.compose.ui.node.LayoutNode;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ea {
    private static final Map<String, Pair<? extends Drawable, Integer>> ycx = new HashMap();

    /* renamed from: zb, reason: collision with root package name */
    private static Integer f27140zb = null;

    public static Drawable ycx(Context context, String str) {
        return ycx(context, str, true);
    }

    public static Drawable ycx(Context context, String str, boolean z11) {
        Pair<? extends Drawable, Integer> pair;
        f27140zb = Integer.valueOf(com.bytedance.sdk.openadsdk.core.pmi.dj().ea());
        Map<String, Pair<? extends Drawable, Integer>> map = ycx;
        map.size();
        if (!map.containsKey(str) || (pair = map.get(str)) == null) {
            ycx();
            return ycx(str, context, z11);
        }
        Drawable drawable = (Drawable) pair.first;
        map.put(str, new Pair<>(drawable, Integer.valueOf(((Integer) pair.second).intValue() + 1)));
        return drawable;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static Drawable ycx(String str, Context context, boolean z11) {
        char c11;
        Drawable layerDrawable;
        Drawable drawableYcx;
        str.getClass();
        switch (str.hashCode()) {
            case -2137782317:
                if (!str.equals("tt_leftbackicon_selector_for_dark")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -2023672829:
                if (str.equals("tt_dislike_dialog_bg")) {
                    c11 = 1;
                    break;
                }
                break;
            case -2010340681:
                if (str.equals("tt_leftbackbutton_titlebar_photo_preview")) {
                    c11 = 2;
                    break;
                }
                break;
            case -1888785259:
                if (str.equals("tt_seek_progress")) {
                    c11 = 3;
                    break;
                }
                break;
            case -1883903877:
                if (str.equals("tt_dislike_middle_seletor")) {
                    c11 = 4;
                    break;
                }
                break;
            case -1881901373:
                if (str.equals("tt_ad_cover_btn_begin_bg")) {
                    c11 = 5;
                    break;
                }
                break;
            case -1818605128:
                if (str.equals("tt_leftbackicon_selector")) {
                    c11 = 6;
                    break;
                }
                break;
            case -1724866088:
                if (str.equals("tt_seek_thumb_normal")) {
                    c11 = 7;
                    break;
                }
                break;
            case -1698792361:
                if (str.equals("tt_stop_movebar_textpage")) {
                    c11 = '\b';
                    break;
                }
                break;
            case -1500492368:
                if (str.equals("tt_backup_btn_1")) {
                    c11 = '\t';
                    break;
                }
                break;
            case -1308443384:
                if (str.equals("tt_ad_report_info_bg")) {
                    c11 = '\n';
                    break;
                }
                break;
            case -1222892514:
                if (str.equals("tt_playable_btn_bk")) {
                    c11 = 11;
                    break;
                }
                break;
            case -1163545839:
                if (str.equals("tt_dislike_bottom_seletor")) {
                    c11 = '\f';
                    break;
                }
                break;
            case -1150582740:
                if (str.equals("tt_seek_thumb_fullscreen")) {
                    c11 = '\r';
                    break;
                }
                break;
            case -1147412691:
                if (str.equals("tt_custom_dialog_bg")) {
                    c11 = 14;
                    break;
                }
                break;
            case -1107858393:
                if (str.equals("tt_ad_loading_three_mid")) {
                    c11 = 15;
                    break;
                }
                break;
            case -1086629490:
                if (str.equals("tt_custom_dialog_bg_new")) {
                    c11 = 16;
                    break;
                }
                break;
            case -876774215:
                if (str.equals("tt_close_move_detail")) {
                    c11 = 17;
                    break;
                }
                break;
            case -875200849:
                if (str.equals("tt_mute_btn_bg")) {
                    c11 = 18;
                    break;
                }
                break;
            case -847552402:
                if (str.equals("tt_seek_thumb")) {
                    c11 = 19;
                    break;
                }
                break;
            case -561153052:
                if (str.equals("tt_reward_countdown_bg")) {
                    c11 = 20;
                    break;
                }
                break;
            case -508263579:
                if (str.equals("tt_play_movebar_textpage")) {
                    c11 = 21;
                    break;
                }
                break;
            case -473198695:
                if (str.equals("tt_refreshing_video_textpage")) {
                    c11 = 22;
                    break;
                }
                break;
            case -404284879:
                if (str.equals("tt_playable_progress_style")) {
                    c11 = 23;
                    break;
                }
                break;
            case -292612462:
                if (str.equals("tt_seek_thumb_fullscreen_selector")) {
                    c11 = 24;
                    break;
                }
                break;
            case -226695937:
                if (str.equals("tt_ad_landing_loading_three_mid")) {
                    c11 = 25;
                    break;
                }
                break;
            case -154809169:
                if (str.equals("tt_pangle_ad_mute_btn_bg")) {
                    c11 = 26;
                    break;
                }
                break;
            case -97103333:
                if (str.equals("tt_video_black_desc_gradient")) {
                    c11 = 27;
                    break;
                }
                break;
            case 16094728:
                if (str.equals("tt_ad_loading_three_left")) {
                    c11 = 28;
                    break;
                }
                break;
            case 27541452:
                if (str.equals("tt_mute_wrapper")) {
                    c11 = 29;
                    break;
                }
                break;
            case 57270120:
                if (str.equals("tt_dislike_top_bg")) {
                    c11 = 30;
                    break;
                }
                break;
            case 106179457:
                if (str.equals("tt_comment_tv")) {
                    c11 = 31;
                    break;
                }
                break;
            case 242455215:
                if (str.equals("tt_reward_full_new_bar_bg")) {
                    c11 = ' ';
                    break;
                }
                break;
            case 247520514:
                if (str.equals("tt_reward_full_video_backup_btn_bg")) {
                    c11 = '!';
                    break;
                }
                break;
            case 310787585:
                if (str.equals("tt_full_reward_loading_progress_style")) {
                    c11 = AbstractJsonLexerKt.STRING;
                    break;
                }
                break;
            case 314734139:
                if (str.equals("tt_detail_video_btn_bg")) {
                    c11 = '#';
                    break;
                }
                break;
            case 410262782:
                if (str.equals("tt_pangle_banner_btn_bg")) {
                    c11 = '$';
                    break;
                }
                break;
            case 484030064:
                if (str.equals("tt_seek_thumb_fullscreen_press")) {
                    c11 = '%';
                    break;
                }
                break;
            case 494589792:
                if (str.equals("tt_browser_download_selector")) {
                    c11 = '&';
                    break;
                }
                break;
            case 504597563:
                if (str.equals("tt_ad_loading_three_right")) {
                    c11 = '\'';
                    break;
                }
                break;
            case 507305701:
                if (str.equals("tt_pangle_btn_bg")) {
                    c11 = '(';
                    break;
                }
                break;
            case 708409173:
                if (str.equals("tt_privacy_progress_style")) {
                    c11 = ')';
                    break;
                }
                break;
            case 991946046:
                if (str.equals("tt_privacy_btn_bg")) {
                    c11 = '*';
                    break;
                }
                break;
            case 1054661938:
                if (str.equals("tt_seek_thumb_press")) {
                    c11 = '+';
                    break;
                }
                break;
            case 1094767909:
                if (str.equals("tt_unmute_wrapper")) {
                    c11 = AbstractJsonLexerKt.COMMA;
                    break;
                }
                break;
            case 1115144587:
                if (str.equals("tt_titlebar_close_seletor_for_dark")) {
                    c11 = '-';
                    break;
                }
                break;
            case 1193160467:
                if (str.equals("tt_ad_landing_loading_three_right")) {
                    c11 = '.';
                    break;
                }
                break;
            case 1234814491:
                if (str.equals("tt_landingpage_loading_text_rect")) {
                    c11 = '/';
                    break;
                }
                break;
            case 1241312517:
                if (str.equals("tt_shadow_btn_back_withoutnight")) {
                    c11 = '0';
                    break;
                }
                break;
            case 1360033453:
                if (str.equals("tt_circle_solid_mian")) {
                    c11 = '1';
                    break;
                }
                break;
            case 1391934389:
                if (str.equals("tt_browser_progress_style")) {
                    c11 = '2';
                    break;
                }
                break;
            case 1459143575:
                if (str.equals("tt_download_corner_bg")) {
                    c11 = '3';
                    break;
                }
                break;
            case 1473061455:
                if (str.equals("tt_ad_report_info_button_bg")) {
                    c11 = '4';
                    break;
                }
                break;
            case 1562327088:
                if (str.equals("tt_ad_landing_loading_three_left")) {
                    c11 = '5';
                    break;
                }
                break;
            case 1635801742:
                if (str.equals("tt_pangle_ad_close_btn_bg")) {
                    c11 = '6';
                    break;
                }
                break;
            case 1733712735:
                if (str.equals("tt_lefterbackicon_titlebar_press_wrapper")) {
                    c11 = '7';
                    break;
                }
                break;
            case 1859118378:
                if (str.equals("tt_reward_video_download_btn_bg")) {
                    c11 = '8';
                    break;
                }
                break;
            case 1908435428:
                if (str.equals("tt_ad_loading_rect")) {
                    c11 = '9';
                    break;
                }
                break;
            case 1967077738:
                if (str.equals("tt_shadow_btn_back")) {
                    c11 = AbstractJsonLexerKt.COLON;
                    break;
                }
                break;
            case 1986221289:
                if (str.equals("tt_dislike_top_seletor")) {
                    c11 = ';';
                    break;
                }
                break;
            case 1987199879:
                if (str.equals("tt_video_loading_progress_bar")) {
                    c11 = '<';
                    break;
                }
                break;
            case 1995246663:
                if (str.equals("tt_ad_skip_btn_bg2")) {
                    c11 = '=';
                    break;
                }
                break;
            case 2051103617:
                if (str.equals("tt_privacy_webview_bg")) {
                    c11 = '>';
                    break;
                }
                break;
            case 2091139328:
                if (str.equals("tt_titlebar_close_seletor")) {
                    c11 = '?';
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_lefterbackicon_titlebar_press_for_dark"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_lefterbackicon_titlebar_for_dark"));
                break;
            case 1:
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 8.0f)}, null, null, null);
                break;
            case 2:
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_white_lefterbackicon_titlebar_press"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_white_lefterbackicon_titlebar"));
                break;
            case 3:
                layerDrawable = new LayerDrawable(new Drawable[]{ycx(0, Integer.valueOf(Color.parseColor("#A5FFFFFF")), new int[]{dc.zb(context, 1.5f)}, new int[]{-1, dc.zb(context, 1.0f)}, null, null), new ClipDrawable(ycx(0, -1, new int[]{dc.zb(context, 1.5f)}, new int[]{-1, dc.zb(context, 1.0f)}, null, null), 8388611, 1), new ClipDrawable(ycx(0, Integer.valueOf(Color.parseColor("#fff85959")), new int[]{dc.zb(context, 1.5f)}, new int[]{-1, dc.zb(context, 1.0f)}, null, null), 8388611, 1)});
                drawableYcx = layerDrawable;
                break;
            case 4:
                drawableYcx = ycx(ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fde6e6e6")), null, null, null, null), ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fdffffff")), null, null, null, null));
                break;
            case 5:
                drawableYcx = ycx(ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_2a90d7")), new int[]{dc.zb(context, 6.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "@color/tt_7f2a90d7"))), ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_2a90d7")), new int[]{dc.zb(context, 6.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "@color/tt_2a90d7"))));
                break;
            case 6:
                drawableYcx = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_lefterbackicon_titlebar");
                break;
            case 7:
                drawableYcx = ycx(1, -1, null, new int[]{dc.zb(context, 15.0f), dc.zb(context, 15.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0);
                break;
            case '\b':
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_new_pause_video_press"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_new_pause_video"));
                break;
            case '\t':
                drawableYcx = ycx(ycx(0, Integer.valueOf(Color.parseColor("#33f32830")), new int[]{dc.zb(context, 4.0f)}, null, null, null), ycx(0, Integer.valueOf(Color.parseColor("#f32830")), new int[]{dc.zb(context, 4.0f)}, null, null, null));
                break;
            case '\n':
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 12.0f), dc.zb(context, 12.0f), 0, 0}, null, null, null);
                break;
            case 11:
                drawableYcx = ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_00000000")), new int[]{dc.zb(context, 30.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), -1);
                break;
            case '\f':
                drawableYcx = ycx(ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fde6e6e6")), new int[]{0, 0, dc.zb(context, 5.0f), dc.zb(context, 5.0f)}, null, null, null), ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fdffffff")), new int[]{0, 0, dc.zb(context, 5.0f), dc.zb(context, 5.0f)}, null, null, null));
                break;
            case '\r':
                drawableYcx = ycx(1, -1, null, new int[]{dc.zb(context, 18.0f), dc.zb(context, 18.0f)}, null, null);
                break;
            case 14:
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 6.0f)}, null, Integer.valueOf(dc.zb(context, 0.8f)), -1);
                break;
            case 15:
                drawableYcx = ycx(0, null, null, null, Integer.valueOf(dc.zb(context, 1.5f)), -1);
                break;
            case 16:
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 16.0f)}, null, Integer.valueOf(dc.zb(context, 0.8f)), -1);
                break;
            case 17:
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_close_move_details_pressed"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_close_move_details_normal"));
                break;
            case 18:
                drawableYcx = ycx(1, Integer.valueOf(Color.parseColor("#99333333")), null, new int[]{dc.zb(context, 28.0f), dc.zb(context, 28.0f)}, null, null);
                break;
            case 19:
                drawableYcx = ycx(ycx(1, -1, null, new int[]{dc.zb(context, 22.0f), dc.zb(context, 22.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0), ycx(1, -1, null, new int[]{dc.zb(context, 15.0f), dc.zb(context, 15.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0));
                break;
            case 20:
                drawableYcx = ycx(1, Integer.valueOf(Color.parseColor("#99333333")), null, new int[]{dc.zb(context, 28.0f), dc.zb(context, 28.0f)}, null, null);
                break;
            case 21:
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_new_play_video"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_new_play_video"));
                break;
            case 22:
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_refreshing_video_textpage_pressed"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_refreshing_video_textpage_normal"));
                break;
            case 23:
                layerDrawable = new LayerDrawable(new Drawable[]{ycx(0, Integer.valueOf(Color.parseColor("#4DFC625C")), new int[]{dc.zb(context, 3.0f)}, null, null, null), new ClipDrawable(ycx(0, Integer.valueOf(Color.parseColor("#FC625C")), new int[]{dc.zb(context, 3.0f)}, null, null, null), 8388611, 1)});
                drawableYcx = layerDrawable;
                break;
            case 24:
                drawableYcx = ycx(ycx(1, -1, null, new int[]{dc.zb(context, 18.0f), dc.zb(context, 18.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0), ycx(1, -1, null, new int[]{dc.zb(context, 18.0f), dc.zb(context, 18.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0));
                break;
            case 25:
                drawableYcx = ycx(0, null, null, null, Integer.valueOf(dc.zb(context, 1.5f)), Integer.valueOf(Color.parseColor("#ABACB0")));
                break;
            case 26:
                drawableYcx = ycx(1, Integer.valueOf(Color.parseColor("#99333333")), null, new int[]{dc.zb(context, 28.0f), dc.zb(context, 28.0f)}, null, null);
                break;
            case 27:
                GradientDrawable gradientDrawable = new GradientDrawable();
                gradientDrawable.setShape(0);
                gradientDrawable.setGradientType(0);
                gradientDrawable.setColors(new int[]{com.bytedance.sdk.component.utils.wwx.ul(context, "tt_ff1a1a1a"), com.bytedance.sdk.component.utils.wwx.ul(context, "tt_00000000")});
                gradientDrawable.setOrientation(GradientDrawable.Orientation.TOP_BOTTOM);
                layerDrawable = gradientDrawable;
                drawableYcx = layerDrawable;
                break;
            case 28:
                drawableYcx = ycx(0, null, new int[]{dc.zb(context, 6.0f), 0, 0, dc.zb(context, 6.0f)}, null, Integer.valueOf(dc.zb(context, 1.5f)), -1);
                break;
            case 29:
                Drawable drawableSya = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_mute");
                StateListDrawable stateListDrawable = new StateListDrawable();
                stateListDrawable.addState(new int[0], drawableSya);
                stateListDrawable.setAutoMirrored(true);
                layerDrawable = stateListDrawable;
                drawableYcx = layerDrawable;
                break;
            case 30:
                drawableYcx = ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fdffffff")), new int[]{dc.zb(context, 5.0f), dc.zb(context, 5.0f), 0, 0}, null, null, null);
                break;
            case 31:
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 4.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), Integer.valueOf(Color.parseColor("#0F161823")));
                break;
            case ' ':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#ccffffff")), new int[]{dc.zb(context, 18.0f)}, null, null, null);
                break;
            case '!':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#ff0088ff")), new int[]{dc.zb(context, 6.0f)}, null, null, null);
                break;
            case '\"':
                GradientDrawable gradientDrawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#EAEAEA")), new int[]{dc.zb(context, 50.0f)}, null, null, null);
                GradientDrawable gradientDrawable2 = new GradientDrawable();
                gradientDrawable2.setShape(0);
                gradientDrawable2.setCornerRadius(dc.zb(context, 15.0f));
                gradientDrawable2.setColors(new int[]{Color.parseColor("#1A73E8"), Color.parseColor("#569FFF")});
                gradientDrawable2.setGradientType(0);
                gradientDrawable2.setOrientation(GradientDrawable.Orientation.BOTTOM_TOP);
                drawableYcx = new LayerDrawable(new Drawable[]{gradientDrawableYcx, new ScaleDrawable(gradientDrawable2, 8388611, 1.0f, -1.0f)});
                break;
            case '#':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#26000000")), new int[]{dc.zb(context, 4.0f)}, null, null, null);
                break;
            case '$':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#ff2f87f8")), new int[]{dc.zb(context, 2.0f)}, new int[]{dc.zb(context, 98.0f), dc.zb(context, 25.0f)}, null, null);
                break;
            case '%':
                drawableYcx = ycx(1, -1, null, new int[]{dc.zb(context, 18.0f), dc.zb(context, 18.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0);
                break;
            case '&':
                drawableYcx = ycx(ycx(0, Integer.valueOf(Color.parseColor("#2582c3")), null, null, null, null), ycx(0, Integer.valueOf(Color.parseColor("#2a90d7")), null, null, null, null));
                break;
            case '\'':
                drawableYcx = ycx(0, null, new int[]{0, dc.zb(context, 6.0f), dc.zb(context, 6.0f), 0}, null, Integer.valueOf(dc.zb(context, 1.5f)), -1);
                break;
            case '(':
                GradientDrawable gradientDrawable3 = new GradientDrawable();
                gradientDrawable3.setShape(0);
                gradientDrawable3.setSize(dc.zb(context, 280.0f), dc.zb(context, 38.0f));
                gradientDrawable3.setCornerRadius(dc.zb(context, 19.0f));
                gradientDrawable3.setOrientation(GradientDrawable.Orientation.LEFT_RIGHT);
                gradientDrawable3.setColors(new int[]{Color.parseColor("#fff02d42"), Color.parseColor("#fffc4b3c")});
                gradientDrawable3.setGradientType(0);
                gradientDrawable3.setUseLevel(true);
                layerDrawable = gradientDrawable3;
                drawableYcx = layerDrawable;
                break;
            case ')':
                drawableYcx = new LayerDrawable(new Drawable[]{ycx(0, Integer.valueOf(Color.parseColor("#33007AFF")), null, null, null, null), new ClipDrawable(ycx(0, Integer.valueOf(Color.parseColor("#007AFF")), null, null, null, null), 8388611, 1)});
                break;
            case '*':
                GradientDrawable gradientDrawable4 = new GradientDrawable();
                gradientDrawable4.setShape(0);
                gradientDrawable4.setSize(dc.zb(context, 258.0f), dc.zb(context, 43.0f));
                gradientDrawable4.setCornerRadius(dc.zb(context, 22.0f));
                gradientDrawable4.setColors(new int[]{Color.parseColor("#73CBFC"), Color.parseColor("#3F9CF7")});
                gradientDrawable4.setGradientType(0);
                layerDrawable = gradientDrawable4;
                drawableYcx = layerDrawable;
                break;
            case '+':
                drawableYcx = ycx(1, -1, null, new int[]{dc.zb(context, 22.0f), dc.zb(context, 22.0f)}, Integer.valueOf(dc.zb(context, 1.0f)), 0);
                break;
            case ',':
                Drawable drawableSya2 = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_unmute");
                StateListDrawable stateListDrawable2 = new StateListDrawable();
                stateListDrawable2.addState(new int[0], drawableSya2);
                stateListDrawable2.setAutoMirrored(true);
                layerDrawable = stateListDrawable2;
                drawableYcx = layerDrawable;
                break;
            case '-':
                drawableYcx = ycx(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_titlebar_close_press_for_dark"), com.bytedance.sdk.component.utils.wwx.sya(context, "tt_titlebar_close_for_dark"));
                break;
            case '.':
                drawableYcx = ycx(0, null, new int[]{0, dc.zb(context, 6.0f), dc.zb(context, 6.0f), 0}, null, Integer.valueOf(dc.zb(context, 1.5f)), Integer.valueOf(Color.parseColor("#ABACB0")));
                break;
            case '/':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#141A73E8")), new int[]{dc.zb(context, 5.0f)}, null, null, null);
                break;
            case '0':
                Drawable drawableSya3 = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_shadow_lefterback_titlebar_press_withoutnight");
                StateListDrawable stateListDrawableYcx = ycx(drawableSya3, com.bytedance.sdk.component.utils.wwx.sya(context, "tt_shadow_lefterback_titlebar_withoutnight"));
                stateListDrawableYcx.addState(new int[]{-16842910}, drawableSya3);
                drawableYcx = stateListDrawableYcx;
                break;
            case '1':
                drawableYcx = ycx(1, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_e0e0e0")), null, null, null, null);
                break;
            case '2':
                drawableYcx = new LayerDrawable(new Drawable[]{ycx(0, -1, new int[]{0}, null, null, null), new ClipDrawable(ycx(0, Integer.valueOf(Color.parseColor("#1A73E8")), new int[]{0}, null, null, null), 3, 1)});
                break;
            case '3':
                drawableYcx = ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_4a90e2")), new int[]{dc.zb(context, 4.0f)}, null, null, null);
                break;
            case '4':
                drawableYcx = ycx(ycx(0, Integer.valueOf(Color.parseColor("#0D000000")), new int[]{dc.zb(context, 2.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), Integer.valueOf(Color.parseColor("#1F000000"))), ycx(0, -1, new int[]{dc.zb(context, 2.0f)}, null, Integer.valueOf(dc.zb(context, 1.0f)), Integer.valueOf(Color.parseColor("#1618231F"))));
                break;
            case '5':
                drawableYcx = ycx(0, null, new int[]{dc.zb(context, 6.0f), 0, 0, dc.zb(context, 6.0f)}, null, Integer.valueOf(dc.zb(context, 1.5f)), Integer.valueOf(Color.parseColor("#ABACB0")));
                break;
            case '6':
                drawableYcx = ycx(1, Integer.valueOf(Color.parseColor("#30333333")), null, new int[]{dc.zb(context, 28.0f), dc.zb(context, 28.0f)}, null, null);
                break;
            case '7':
                Drawable drawableSya4 = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_lefterbackicon_titlebar_press");
                StateListDrawable stateListDrawable3 = new StateListDrawable();
                stateListDrawable3.addState(new int[0], drawableSya4);
                stateListDrawable3.setAutoMirrored(true);
                layerDrawable = stateListDrawable3;
                drawableYcx = layerDrawable;
                break;
            case '8':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#ff007aff")), new int[]{dc.zb(context, 18.0f)}, null, null, null);
                break;
            case '9':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#33FFFFFF")), new int[]{dc.zb(context, 15.0f)}, null, null, null);
                break;
            case ':':
                Drawable drawableSya5 = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_shadow_lefterback_titlebar_press");
                StateListDrawable stateListDrawableYcx2 = ycx(drawableSya5, com.bytedance.sdk.component.utils.wwx.sya(context, "tt_shadow_lefterback_titlebar"));
                stateListDrawableYcx2.addState(new int[]{-16842910}, drawableSya5);
                drawableYcx = stateListDrawableYcx2;
                break;
            case ';':
                drawableYcx = ycx(ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fde6e6e6")), new int[]{dc.zb(context, 5.0f), dc.zb(context, 5.0f), 0, 0}, null, null, null), ycx(0, Integer.valueOf(com.bytedance.sdk.component.utils.wwx.ul(context, "tt_fdffffff")), new int[]{dc.zb(context, 5.0f), dc.zb(context, 5.0f), 0, 0}, null, null, null));
                break;
            case '<':
                RotateDrawable rotateDrawable = new RotateDrawable();
                rotateDrawable.setDrawable(com.bytedance.sdk.component.utils.wwx.sya(context, "tt_normalscreen_loading"));
                rotateDrawable.setFromDegrees(0.0f);
                rotateDrawable.setToDegrees(360.0f);
                rotateDrawable.setPivotX(0.5f);
                rotateDrawable.setPivotY(0.5f);
                layerDrawable = rotateDrawable;
                drawableYcx = layerDrawable;
                break;
            case '=':
                drawableYcx = ycx(0, Integer.valueOf(Color.parseColor("#66161823")), new int[]{dc.zb(context, 14.0f)}, null, null, null);
                break;
            case '>':
                drawableYcx = ycx(0, -1, new int[]{dc.zb(context, 14.5f)}, null, null, null);
                break;
            case '?':
                drawableYcx = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_titlebar_close_drawable");
                break;
            default:
                drawableYcx = null;
                break;
        }
        if (z11) {
            ycx.put(str, new Pair<>(drawableYcx, 1));
        }
        return drawableYcx;
    }

    private static void ycx() {
        Map<String, Pair<? extends Drawable, Integer>> map = ycx;
        if (map.size() < f27140zb.intValue()) {
            return;
        }
        String key = null;
        int iIntValue = LayoutNode.NotPlacedPlaceOrder;
        for (Map.Entry<String, Pair<? extends Drawable, Integer>> entry : map.entrySet()) {
            if (((Integer) entry.getValue().second).intValue() < iIntValue) {
                key = entry.getKey();
                iIntValue = ((Integer) entry.getValue().second).intValue();
                if (iIntValue == 1) {
                    break;
                }
            }
        }
        ycx.remove(key);
    }

    private static GradientDrawable ycx(int i5, Integer num, int[] iArr, int[] iArr2, Integer num2, Integer num3) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(i5);
        if (num != null) {
            gradientDrawable.setColor(num.intValue());
        }
        int length = iArr != null ? iArr.length : 0;
        if (length == 1) {
            gradientDrawable.setCornerRadius(iArr[0]);
        } else if (length == 4) {
            int i11 = iArr[0];
            int i12 = iArr[1];
            int i13 = iArr[2];
            int i14 = iArr[3];
            gradientDrawable.setCornerRadii(new float[]{i11, i11, i12, i12, i13, i13, i14, i14});
        }
        if (iArr2 != null && iArr2.length == 2) {
            gradientDrawable.setSize(iArr2[0], iArr2[1]);
        }
        if (num2 != null && num3 != null) {
            gradientDrawable.setStroke(num2.intValue(), num3.intValue());
        }
        return gradientDrawable;
    }

    private static StateListDrawable ycx(Drawable drawable, Drawable drawable2) {
        StateListDrawable stateListDrawable = new StateListDrawable();
        if (drawable != null) {
            stateListDrawable.addState(new int[]{16842919}, drawable);
        }
        if (drawable2 != null) {
            stateListDrawable.addState(new int[0], drawable2);
        }
        return stateListDrawable;
    }

    public static Drawable ycx(Context context, int i5) {
        return ycx(context, Color.parseColor("#1A73E8"), i5);
    }

    public static Drawable ycx(Context context, int i5, int i11) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(i5);
        gradientDrawable.setCornerRadius(dc.zb(context, i11));
        return gradientDrawable;
    }
}
