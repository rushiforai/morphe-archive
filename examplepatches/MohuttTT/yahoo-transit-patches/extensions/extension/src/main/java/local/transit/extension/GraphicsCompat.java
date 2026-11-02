package local.transit.extension;

import android.app.Application;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;

/** Preserve bitmap consumers (for example notifications) when localized art is a vector. */
public final class GraphicsCompat {
    private static Application application;
    private GraphicsCompat() {}
    public static void initialize(Application app) { application = app; }
    private static final java.util.Map<Integer,String> NAMES = new java.util.HashMap<>();
    private static final java.util.Map<Integer,Integer> IDS = new java.util.HashMap<>();
    static {
        NAMES.put(0x7f08007a, "transit_en_addroute_off");
        NAMES.put(0x7f08007b, "transit_en_addroute_on");
        NAMES.put(0x7f0800d7, "transit_en_bg_menu_delay_notice_off");
        NAMES.put(0x7f0800d8, "transit_en_bg_menu_delay_notice_on");
        NAMES.put(0x7f0800d9, "transit_en_bg_menu_delay_off");
        NAMES.put(0x7f0800da, "transit_en_bg_menu_delay_on");
        NAMES.put(0x7f0800db, "transit_en_bg_menu_spot_off");
        NAMES.put(0x7f0800dc, "transit_en_bg_menu_spot_on");
        NAMES.put(0x7f0800dd, "transit_en_bg_menu_timer_off");
        NAMES.put(0x7f0800de, "transit_en_bg_menu_timer_on");
        NAMES.put(0x7f0800df, "transit_en_bg_menu_timetable_new_off");
        NAMES.put(0x7f0800e0, "transit_en_bg_menu_timetable_new_on");
        NAMES.put(0x7f0800e1, "transit_en_bg_menu_timetable_off");
        NAMES.put(0x7f0800e2, "transit_en_bg_menu_timetable_on");
        NAMES.put(0x7f0800e3, "transit_en_bg_menu_transit_off");
        NAMES.put(0x7f0800e4, "transit_en_bg_menu_transit_on");
        NAMES.put(0x7f080134, "transit_en_btn_addroute_selector");
        NAMES.put(0x7f080140, "transit_en_btn_alerm_off");
        NAMES.put(0x7f080142, "transit_en_btn_before_off");
        NAMES.put(0x7f080143, "transit_en_btn_before_on");
        NAMES.put(0x7f08019e, "transit_en_btn_lasttrain_off");
        NAMES.put(0x7f08019f, "transit_en_btn_lasttrain_on");
        NAMES.put(0x7f0801a5, "transit_en_btn_map_off");
        NAMES.put(0x7f0801a9, "transit_en_btn_myhome01_off");
        NAMES.put(0x7f0801aa, "transit_en_btn_myhome01_on");
        NAMES.put(0x7f0801ab, "transit_en_btn_myhome02_off");
        NAMES.put(0x7f0801ac, "transit_en_btn_myhome02_on");
        NAMES.put(0x7f0801ad, "transit_en_btn_myhome_disable");
        NAMES.put(0x7f0801ae, "transit_en_btn_myhome_enable");
        NAMES.put(0x7f0801af, "transit_en_btn_myoffice01_off");
        NAMES.put(0x7f0801b0, "transit_en_btn_myoffice01_on");
        NAMES.put(0x7f0801b1, "transit_en_btn_myoffice02_off");
        NAMES.put(0x7f0801b2, "transit_en_btn_myoffice02_on");
        NAMES.put(0x7f0801b3, "transit_en_btn_myoffice_disable");
        NAMES.put(0x7f0801b4, "transit_en_btn_myoffice_enable");
        NAMES.put(0x7f0801b5, "transit_en_btn_myother01_off");
        NAMES.put(0x7f0801b6, "transit_en_btn_myother01_on");
        NAMES.put(0x7f0801b7, "transit_en_btn_myother02_off");
        NAMES.put(0x7f0801b8, "transit_en_btn_myother02_on");
        NAMES.put(0x7f0801b9, "transit_en_btn_myother_disable");
        NAMES.put(0x7f0801ba, "transit_en_btn_myother_enable");
        NAMES.put(0x7f0801bd, "transit_en_btn_next_off");
        NAMES.put(0x7f0801be, "transit_en_btn_next_on");
        NAMES.put(0x7f0801cb, "transit_en_btn_route_detour_off");
        NAMES.put(0x7f0801ce, "transit_en_btn_routememo_off");
        NAMES.put(0x7f0801cf, "transit_en_btn_sc_off");
        NAMES.put(0x7f08028f, "transit_en_icn_arv01");
        NAMES.put(0x7f0802c8, "transit_en_icn_dep01");
        NAMES.put(0x7f0802ce, "transit_en_icn_direction_l");
        NAMES.put(0x7f0802cf, "transit_en_icn_direction_r");
        NAMES.put(0x7f0802d0, "transit_en_icn_door_both");
        NAMES.put(0x7f0802d1, "transit_en_icn_door_left");
        NAMES.put(0x7f0802d2, "transit_en_icn_door_right");
        NAMES.put(0x7f0802f4, "transit_en_icn_hayai");
        NAMES.put(0x7f080357, "transit_en_icn_raku");
        NAMES.put(0x7f080392, "transit_en_icn_status_ippatsu01");
        NAMES.put(0x7f080393, "transit_en_icn_status_ippatsu02");
        NAMES.put(0x7f080394, "transit_en_icn_status_ippatsu03");
        NAMES.put(0x7f080395, "transit_en_icn_status_ippatsu04");
        NAMES.put(0x7f080396, "transit_en_icn_status_method01");
        NAMES.put(0x7f080397, "transit_en_icn_status_method02");
        NAMES.put(0x7f080398, "transit_en_icn_status_payment01");
        NAMES.put(0x7f080399, "transit_en_icn_status_payment02");
        NAMES.put(0x7f08039a, "transit_en_icn_status_seat01");
        NAMES.put(0x7f08039b, "transit_en_icn_status_seat02");
        NAMES.put(0x7f08039c, "transit_en_icn_status_seat03");
        NAMES.put(0x7f08039d, "transit_en_icn_status_teiki01");
        NAMES.put(0x7f08039e, "transit_en_icn_status_teiki02");
        NAMES.put(0x7f08039f, "transit_en_icn_status_teiki03");
        NAMES.put(0x7f0803a0, "transit_en_icn_status_walk01");
        NAMES.put(0x7f0803a1, "transit_en_icn_status_walk02");
        NAMES.put(0x7f0803a2, "transit_en_icn_status_walk03");
        NAMES.put(0x7f0803a3, "transit_en_icn_status_walk04");
        NAMES.put(0x7f0803bf, "transit_en_icn_transitb_off");
        NAMES.put(0x7f0803c0, "transit_en_icn_transitb_on");
        NAMES.put(0x7f0803c1, "transit_en_icn_transitf_off");
        NAMES.put(0x7f0803c2, "transit_en_icn_transitf_on");
        NAMES.put(0x7f0803c3, "transit_en_icn_transitm_off");
        NAMES.put(0x7f0803c4, "transit_en_icn_transitm_on");
        NAMES.put(0x7f0803cd, "transit_en_icn_yasui");
        NAMES.put(0x7f080437, "transit_en_img_no_countdown_sta");
        NAMES.put(0x7f08043a, "transit_en_img_no_my_route");
        NAMES.put(0x7f08043b, "transit_en_img_no_mytimetable");
        NAMES.put(0x7f08043c, "transit_en_img_no_route_memo");
        NAMES.put(0x7f08044e, "transit_en_img_promo_diainfopush");
        NAMES.put(0x7f08052a, "transit_en_search_result_btn_before");
        NAMES.put(0x7f08052b, "transit_en_search_result_btn_final_after");
        NAMES.put(0x7f08052c, "transit_en_search_result_btn_next");
        NAMES.put(0x7f08052f, "transit_en_search_result_tab_cheap_selector");
        NAMES.put(0x7f080530, "transit_en_search_result_tab_easy_selector");
        NAMES.put(0x7f080531, "transit_en_search_result_tab_fast_selector");
        NAMES.put(0x7f08054b, "transit_en_tab_hayai_off");
        NAMES.put(0x7f08054c, "transit_en_tab_hayai_on");
        NAMES.put(0x7f08054d, "transit_en_tab_raku_off");
        NAMES.put(0x7f08054e, "transit_en_tab_raku_on");
        NAMES.put(0x7f080550, "transit_en_tab_yasui_off");
        NAMES.put(0x7f080551, "transit_en_tab_yasui_on");
        NAMES.put(0x7f08056c, "transit_en_toolbar01_selector");
        NAMES.put(0x7f08056d, "transit_en_toolbar02_selector");
        NAMES.put(0x7f08056e, "transit_en_toolbar03_new_selector");
        NAMES.put(0x7f08056f, "transit_en_toolbar03_selector");
        NAMES.put(0x7f080570, "transit_en_toolbar04_notice_selector");
        NAMES.put(0x7f080571, "transit_en_toolbar04_selector");
        NAMES.put(0x7f080572, "transit_en_toolbar05_selector");
    }
    public static boolean isEnglish() {
        Application app = application;
        return app != null && "en".equals(app.getResources().getConfiguration().getLocales().get(0).getLanguage());
    }
    public static int localizedId(int id) {
        Application app = application;
        if (app == null || !"en".equals(app.getResources().getConfiguration().getLocales().get(0).getLanguage())) return id;
        String name = NAMES.get(id);
        if (name == null) return id;
        Integer translated = IDS.get(id);
        if (translated == null) {
            translated = app.getResources().getIdentifier(name, "drawable", app.getPackageName());
            IDS.put(id, translated);
        }
        return translated == 0 ? id : translated;
    }
    public static Bitmap decodeResource(Resources resources, int id) {
        id = localizedId(id);
        Bitmap original = BitmapFactory.decodeResource(resources, id);
        if (original != null) return original;
        Application app = application;
        Drawable drawable = resources.getDrawable(id, app == null ? null : app.getTheme());
        int width = Math.max(1, drawable.getIntrinsicWidth());
        int height = Math.max(1, drawable.getIntrinsicHeight());
        float scale = Math.min(1f, 2048f / Math.max(width, height));
        width = Math.max(1, Math.round(width * scale));
        height = Math.max(1, Math.round(height * scale));
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, width, height);
        drawable.draw(new Canvas(bitmap));
        return bitmap;
    }
}
