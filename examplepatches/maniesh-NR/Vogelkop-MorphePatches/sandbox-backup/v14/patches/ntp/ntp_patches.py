"""NTP / toolbar / menu patches.

Recovered v6 content: bo3 (menu-row builder: Rewards row removed), rqd
(notification-settings binding: seven promo rows hidden).

v14 REWRITE of PT.1/PT.3 (crash fix, 2026-11-16):
  The v11-v13 form of PT.1/PT.3 DELETED the whole row-add block including
  the `const` assignments that define v5/v6/v7 for the fall-through chain
  of `invoke-static/range {v1 .. v7}` row-adds in bo3.invoke(). ART's
  verifier rejected the class with:
    java.lang.VerifyError: Verifier rejected class bo3:
    bo3.invoke(java.lang.Object): [0x1D2] register v7 has type
    Precise Reference: ng but expected Integer
  (v7 is loaded with Lng;->a:Lng; in the method prologue; the deleted
  `const/16 v7, 0x38` was the only int redefinition on that path).
  v14 keeps every const assignment (dead stores) and removes ONLY the
  `invoke-static/range` call line, so the register type state at every
  program point is identical to stock and the row is simply never added.
  Gate: scripts/miniverify.py must PASS on bo3 (it FAILS on the v12 form).
"""
from common import Patch


def register(reg, ver):
    # v6 lineage / v14 fix: bo3 -- the n6j.c(...) call that adds the Rewards
    # entry to the menu/toolbar customizer (string menu_rewards = 0x7f140a39,
    # view settings_rewards = 0x7f0a09ec) is removed, but the const
    # assignments that define v6/v7 for the following fall-through row-adds
    # are KEPT as dead stores (verifier-safe).
    reg.append(Patch(
        "PT.1", "toolbar", "Menu row: Rewards never added (bo3, v14 verifier-safe)", ver,
        "c3/bo3.smali",
        """    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x6

    const v3, 0x7f140a39

    const v4, 0x7f0a09ec

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V
""",
        """    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x6

    const v3, 0x7f140a39

    const v4, 0x7f0a09ec
""",
        count=1, verify_absent="old",
        note="v14: invoke-only deletion; consts kept (dead stores) so register "
             "types stay stock-identical. 0x7f140a39 = string/menu_rewards, "
             "0x7f0a09ec = id/settings_rewards."))

    # v6 lineage: rqd ViewBinding for fragment_notifications_settings --
    # after the last null-check, force GONE on the seven promo rows:
    # v3=settings_esim, v4=settings_feature_tips,
    # v5=settings_feedback_and_ratings, v6=settings_notifications_vpn,
    # v7=settings_product_and_service_news, v8=settings_rewards (0x7f0a09ec),
    # v9=settings_wallpaper_promotions (0x7f0a09f3).
    # (notifications_explanation and system_notifications stay visible.)
    reg.append(Patch(
        "PT.2", "toolbar", "Notification settings: 7 promo rows hidden (rqd)", ver,
        "c3/rqd.smali",
        """    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_8b

    new-instance v0, Lfm9;
""",
        """    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_8b

    const/16 v1, 0x8

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Lfm9;
""",
        count=1,
        note="esim/feature_tips/feedback/vpn/product-news/rewards/wallpaper rows."))

    # v11 / v14 fix: the "Set Opera as default browser" row at the top of the
    # main settings menu (bo3 row builder: string settings_default_browser
    # = 0x7f140fc1, view id settings_default_browser = 0x7f0a09ba). The v11
    # form deleted the block INCLUDING `const/16 v7, 0x38` + `const/4 v5, 0x0`
    # -- the definitions consumed by the NEXT fall-through case's
    # invoke-static/range at (patched) offset 0x1D2 -> VerifyError. v14 keeps
    # all const assignments and removes only the invoke line.
    reg.append(Patch(
        "PT.3", "toolbar", "Settings menu: default-browser row removed (bo3, v14 verifier-safe)", ver,
        "c3/bo3.smali",
        """    sget-object v2, Lhy3;->a:[Lhy3;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f140fc1

    const v4, 0x7f0a09ba

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V
""",
        """    sget-object v2, Lhy3;->a:[Lhy3;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f140fc1

    const v4, 0x7f0a09ba

    const/4 v5, 0x0
""",
        count=1, verify_absent="old",
        note="v14: invoke-only deletion; v5/v6/v7 definitions kept so the "
             "0x1D2 range-invoke sees stock types. 0x7f140fc1 = "
             "string/settings_default_browser."))
