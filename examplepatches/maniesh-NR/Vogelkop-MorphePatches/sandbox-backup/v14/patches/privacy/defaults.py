"""Privacy & settings defaults: all in SettingsManager constructor.

Base content recovered from the v6 lineage (c3-SettingsManager.diff).
v11 extends: data-collection keys, cookies mode, secure DNS template,
trending searches, acceptable-ads-related defaults.
"""
from common import Patch

# Register constants inside the ctor: v3 = 0 (stock), v4 = 1 (stock),
# v2 = 2 (stock). The v6 trick: re-load a spare register (v10) with the
# desired value immediately before the targeted putInt, then point the
# putInt at it. Anchors use the stock register (v3 or v4) to stay unique.


def _int(key, stock_reg, val_reg, val):
    """Anchor on the stock putInt for `key` and retarget it to a fresh
    register loaded with `val`."""
    old = f'const-string v0, "{key}"\n\n    invoke-virtual {{v1, v0, {stock_reg}}}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V'
    new = (f'const/16 v10, {val}\n\n    const-string v0, "{key}"\n\n'
           f'    invoke-virtual {{v1, v0, {val_reg}}}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V')
    return old, new


def _int_plain(key, stock_reg, new_reg):
    """Retarget stock putInt for `key` from stock_reg to new_reg
    (new_reg must already hold the desired value)."""
    old = f'const-string v0, "{key}"\n\n    invoke-virtual {{v1, v0, {stock_reg}}}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V'
    new = f'const-string v0, "{key}"\n\n    invoke-virtual {{v1, v0, {new_reg}}}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V'
    return old, new


def register(reg, ver):
    # PD.0 (v6-proven): bump SettingsManager ctor register count 15 -> 16.
    # The ctor has 5 param registers (this + 4 args), so with .registers 15
    # the register v10 IS p0 (this). All PD.* patches write scratch values
    # into v10, so it must become a real local: with 16 registers, p0 = v11
    # and v10 is free. (The v6 lineage shipped exactly this change.)
    reg.append(Patch(
        "PD.0", "privacy", "SettingsManager ctor .registers 15 -> 16", ver,
        "c3/com/opera/android/settings/SettingsManager.smali",
        """.method public constructor <init>(Ly9j;Landroid/content/Context;Lorg/chromium/base/CommandLine;Lumi;)V
    .registers 15
""",
        """.method public constructor <init>(Ly9j;Landroid/content/Context;Lorg/chromium/base/CommandLine;Lumi;)V
    .registers 16
""",
        count=1, verify_absent="old",
        note="Frees v10 as scratch register for all default patches (v6-proven)."))

    # --- P2 family (v10 lineage, register-retarget style) --------------
    p2_keys = [
        "vpn_pro_in_app_notification",          # stock 1 -> 0
        "wallpaper_in_app_notification",        # stock 1 -> 0
        "feedback_in_app_notification",         # stock 1 -> 0
        "product_and_service_in_app_notification",  # stock 1 -> 0
        "feature_tips_notification",            # stock 1 -> 0
        "rewards_notifications",                # stock 1 -> 0
        "esim_notifications",                   # stock 1 -> 0
        "enable_rewards",                       # stock 1 -> 0
        "enable_product_suggestion",            # stock 1 -> 0
    ]
    for i, k in enumerate(p2_keys, start=1):
        old, new = _int_plain(k, "v4", "v3")  # v3 = 0 in ctor
        reg.append(Patch(
            f"P2.{i}", "privacy", f"Default off: {k}", ver,
            "c3/com/opera/android/settings/SettingsManager.smali",
old, new, count=1, verify_absent="old"))

    # --- v6-lineage defaults (register-load style) ----------------------
    v6_specs = [
        # (key, stock_reg, value, note)
        ("ad_blocking", "v3", "0x1", "Ad blocker ON by default (stock 0)"),
        ("ga_usage_statistics", "v4", "0x0", "Usage reports OFF (stock 1)"),
        ("enable_trending_searches", "v4", "0x0", "Trending searches OFF (stock 1)"),
        ("banner_blocker", "v3", "0x1", "Tracker blocker ON (stock 0)"),
        ("dns_over_https_enabled", "v3", "0x1", "Secure DNS ON (stock 0)"),
        ("dns_over_https_mode", "v3", "0x1", "Secure DNS mode custom/choose (stock 0)"),
        ("ad_blocking_mode", "v3", "0x2", "Ad-block mode = CUSTOM (stock 0)"),
    ]
    for i, (k, sreg, val, note) in enumerate(v6_specs, start=1):
        # fresh register v10 loaded right before the key
        old, new = _int(k, sreg, "v10", val)
        reg.append(Patch(
            f"PD.{i}", "privacy", f"Default: {k} = {note}", ver,
            "c3/com/opera/android/settings/SettingsManager.smali",
old, new, count=1, note=note, verify_absent="old"))

    # accept_cookies: stock 1 = "enabled"; 2 = "enabled, excluding 3rd-party"
    # (confirmed via getCookiesInt(): 1 + incognito -> 2). Stock body reloads
    # v4=1 between the key and the putInt, so anchor on that exact shape.
    reg.append(Patch(
        "PD.8", "privacy", "Cookies default: enabled, excluding third-party", ver,
        "c3/com/opera/android/settings/SettingsManager.smali",
        """const-string v0, "accept_cookies"

    const/4 v4, 0x1

    invoke-virtual {v1, v0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V""",
        """const-string v0, "accept_cookies"

    const/4 v4, 0x1

    const/16 v10, 0x2

    invoke-virtual {v1, v0, v10}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V""",
count=1, verify_absent="old",
        note="Enum: 1=enabled, 2=enabled-excl-3rd-party (getCookiesInt)."))

    # Gray out every toggle on the Data Collection settings screen (sb6):
    # after I0() binds all rows, setEnabled(false) on the seven OperaListItem
    # toggles (ei fields c..i): personalized_ads, personalized_news,
    # cmp_consent, website_categories, location, news_topics,
    # usage_statistics. Visible but not interactive.
    reg.append(Patch(
        "PD.10", "privacy", "Data collection toggles grayed out (sb6)", ver,
        "c3/sb6.smali",
        """    invoke-virtual {p0}, Lsb6;->I0()V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->jumpDrawablesToCurrentState()V""",
        """    invoke-virtual {p0}, Lsb6;->I0()V

    const/4 p2, 0x0

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->c:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->e:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->f:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->g:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->i:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    iget-object p1, p0, Lsb6;->y:Lei;

    iget-object p1, p1, Lei;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->jumpDrawablesToCurrentState()V""",
        count=1,
        note="All values default off (PD.2 + stock zeros + personalized_default=-1)."))

    # All custom lists selected (v6 value, opera_fixes + allow-rule lists
    # excluded). The JSON is the exact v6-proven string.
    lists_json = (
        '["regional_spanish_portuguese","regional_france","ublock","regional_india",'
        '"regional_hungary","regional_chinese","regional_poland","regional_macedonia",'
        '"regional_vietnam","regional_sweden","regional_japan","adguard_ads",'
        '"regional_arabic","regional_thailand","regional_slovenia","regional_albania",'
        '"regional_finland","regional_germany","adguard_mobile_ads","regional_persia",'
        '"regional_romania","regional_bulgarian","easylist","regional_greek",'
        '"regional_russia","nocoin","regional_serbia_croatia","regional_estonia",'
        '"regional_indonesia","regional_lithuania","regional_iceland",'
        '"regional_czech_slovak","regional_norway","regional_italy","regional_latvia",'
        '"regional_hebrew","regional_turkey","regional_netherlands","regional_korea"]'
    )
    reg.append(Patch(
        "PD.9", "adblock", "Select all custom blocklists (39, no opera_fixes/allow-rules)", ver,
        "c3/com/opera/android/settings/SettingsManager.smali",
        """const-string v0, "ad_blocking_mode.selected_custom_lists"

    invoke-virtual {v1, v0, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V""",
        f'const-string v10, "{lists_json.replace(chr(34), chr(92) + chr(34))}"\n\n'
        '    const-string v0, "ad_blocking_mode.selected_custom_lists"\n\n'
        '    invoke-virtual {v1, v0, v10}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V',
        count=1,
        note="v6-proven list set; v11 pairs with the abp.manifest surgery + bundled fresh lists."))
