"""VPN patches: VPN Pro surfaces removed, free features unlocked.

Recovered v6 content: ldn (location list), zfn (VpnProBanner), cgn.J0,
p12.n (provider null). v11 additions investigated from rqd/ydn/wdn.
"""
from common import Patch


def register(reg, ver):
    # P3 (v10 lineage): VPN Pro upsell banner never evaluates.
    reg.append(Patch(
        "P3", "vpn", "pfn.S()V -> return-void (VPN upsell banner)", ver,
        "c3/pfn.smali",
        """.method public final S()V
    .registers 16
""",
        """.method public final S()V
    .registers 16

    return-void
""",
        count=1))

    # P4 (v10 lineage): Rewards item never added to main menu (d37.B()).
    reg.append(Patch(
        "P4", "vpn", "d37.B(): rewards menu item never added", ver,
        "c1/d37.smali",
        """    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lm18;->b:Lm18;

    if-ne v1, v2, :cond_70""",
        """    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lm18;->b:Lm18;

    goto :cond_70""",
        count=1, verify_absent="old"))

    # P5 (v10 lineage): eSIM item never added to main menu (d37.B()).
    reg.append(Patch(
        "P5", "vpn", "d37.B(): eSIM menu item never added", ver,
        "c1/d37.smali",
        """    move-result v1

    if-eqz v1, :cond_85

    sget-object v1, Lwol;->n:Lwol;""",
        """    move-result v1

    goto :cond_85

    sget-object v1, Lwol;->n:Lwol;""",
        count=1, verify_absent="old"))

    # v6 lineage: two further menu items never added (wol.k gated by
    # Ld37;->b:Z, wol.l gated by Lpde) -- v6 removed both rows.
    reg.append(Patch(
        "P5b", "vpn", "d37.B(): additional gated menu rows never added", ver,
        "c1/d37.smali",
        """    iget-boolean v1, p0, Ld37;->b:Z

    if-eqz v1, :cond_8e

    sget-object v1, Lwol;->k:Lwol;""",
        """    iget-boolean v1, p0, Ld37;->b:Z

    goto :cond_8e

    sget-object v1, Lwol;->k:Lwol;""",
        count=1, verify_absent="old",
        note="v6 also removed the wol.l row (Lpde gate) -- see P5c."))
    reg.append(Patch(
        "P5c", "vpn", "d37.B(): wol.l row never added", ver,
        "c1/d37.smali",
        """    move-result p0

    if-eqz p0, :cond_a3

    sget-object p0, Lwol;->l:Lwol;""",
        """    move-result p0

    goto :cond_a3

    sget-object p0, Lwol;->l:Lwol;""",
        count=1, verify_absent="old"))

    # v6 lineage: VPN settings virtual locations -- the entitlement-filtered
    # country list is replaced by EMPTY_LIST so only Optimal/America/Asia/
    # Europe (built by ydn) remain.
    reg.append(Patch(
        "PV.1", "vpn", "Non-free VPN locations removed (cnk.a -> EMPTY_LIST)", ver,
        "c3/ldn.smali",
        """    invoke-virtual {v7, v0}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0""",
        """    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;""",
        count=1, verify_absent="old",
        note="Only optimal/america/asia/europe remain, per ydn.h()/n()."))

    # v6 lineage: VpnProBanner hidden in the main settings catalog page.
    reg.append(Patch(
        "PV.2", "vpn", "VpnProBanner hidden (zfn)", ver,
        "c3/zfn.smali",
        """    check-cast v8, Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v8, :cond_550""",
        """    check-cast v8, Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v8, :cond_550

    const/16 v7, 0x8

    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V""",
        count=1,
        note="Adds setVisibility(GONE) right after the banner is bound."))

    # v6 lineage: cgn.J0(Luvg;I)V -> return-void (VPN Pro menu entries /
    # promo rows in the settings catalog state machine).
    reg.append(Patch(
        "PV.3", "vpn", "cgn.J0(Luvg;I)V -> return-void", ver,
        "c3/cgn.smali",
        """.method public final J0(Luvg;I)V
    .registers 4

""",
        """.method public final J0(Luvg;I)V
    .registers 4

    return-void
""",
        count=1))

    # v6 lineage: p12.n() -> null (kills a whole feature provider; used by
    # rewards/minipay plumbing).
    reg.append(Patch(
        "PV.4", "vpn", "p12.n() -> null (feature provider off)", ver,
        "c3/p12.smali",
        """.method public final n()Lp7d;
    .registers 10

""",
        """.method public final n()Lp7d;
    .registers 10

    const/4 v0, 0x0

    return-object v0
""",
        count=1))

    # v6 lineage: EsimTimeZoneChangeReceiver neutered.
    reg.append(Patch(
        "PV.5", "vpn", "EsimTimeZoneChangeReceiver.onReceive -> return-void", ver,
        "c3/com/opera/android/esim/EsimTimeZoneChangeReceiver.smali",
        """.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

""",
        """.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    return-void
""",
        count=1))

    # v11: VPN settings (premium variant) -- the "Sign in to your Opera
    # account to restore VPN" row (vpn_link_to_opera_account_button, v15)
    # is force-hidden regardless of entitlement state.
    reg.append(Patch(
        "PV.6", "vpn", "VPN settings: restore/account button removed (zfn)", ver,
        "c3/zfn.smali",
        """    if-eqz v21, :cond_1db

    const/4 v1, 0x0

    goto :goto_1dd

    :cond_1db
    const/16 v1, 0x8

    :goto_1dd
    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V""",
        """    const/16 v1, 0x8

    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V""",
        count=1, verify_absent="old",
        note="vpn_link_to_opera_account_button = 0x7f0a0cb5."))

    # v11: VPN settings (premium variant) -- vpn_reactivate_banner (v7,
    # 0x7f0a0cbd) and vpn_upsell_promo_banner (v6, 0x7f0a0cc3) forced GONE.
    # Insertion window: v2 is reassigned by the following iget-boolean.
    reg.append(Patch(
        "PV.7", "vpn", "VPN settings: reactivate + upsell banners GONE (zfn)", ver,
        "c3/zfn.smali",
        """    iget-object v14, v6, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    check-cast v2, Landroid/widget/LinearLayout;

    iget-boolean v2, v4, Legn;->e:Z""",
        """    iget-object v14, v6, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    check-cast v2, Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v7, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, v2}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v2, v4, Legn;->e:Z""",
        count=1,
        note="v7=vpn_reactivate_banner, v6=vpn_upsell_promo_banner; also the 'protect your privacy' upsell."))

    # v11: partner speed-dial component never applied. y2g.d([B)V is the
    # component-installer callback that writes <datadir>/ps (partner_sites)
    # which seeds the preloaded speed dial (Facebook, Google, Instagram,
    # Booking, Temu, LiveScores, Wikipedia).
    reg.append(Patch(
        "PN.1", "ntp", "Partner speed-dial component never applied (y2g)", ver,
        "c3/y2g.smali",
        """.method public final d([B)V
    .registers 8

""",
        """.method public final d([B)V
    .registers 8

    return-void
""",
        count=1,
        note="Speed dial starts completely empty; user adds shortcuts manually."))
