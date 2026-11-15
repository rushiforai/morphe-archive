package com.zai.sysvpn;

/**
 * Opera resource IDs (stable, already compiled into resources.arsc of the
 * patched APK). Kept as local constants so this dex has no dependency on
 * Opera's R class.
 */
public final class Res {

    private Res() {
    }

    // layout/vpn_pro_widget (widget_browser_one.xml)
    public static final int LAYOUT_VPN_WIDGET = 0x7f0d02bf;

    // view ids inside vpn_pro_widget
    public static final int ID_WIDGET_LAYOUT = 0x7f0a08b4; // widget_search_layout (root)
    public static final int ID_WIDGET_ICON = 0x7f0a08ca;   // widget_icon
    public static final int ID_WIDGET_TEXT = 0x7f0a0c05;   // widget_search_box (TextView)
    public static final int ID_WIDGET_BTN1 = 0x7f0a08b6;   // widget_scan_qr
    public static final int ID_WIDGET_BTN2 = 0x7f0a08b5;   // widget_search_mic

    // drawable/ic_material_vpn_on
    public static final int DRAWABLE_VPN_ON = 0x7f0804c3;
}
