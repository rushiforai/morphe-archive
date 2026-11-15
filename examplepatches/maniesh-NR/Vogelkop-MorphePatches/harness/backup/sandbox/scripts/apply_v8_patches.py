#!/usr/bin/env python3
"""apply_v8_patches.py <sm1_tree> <sm3_tree>

Applies the v8 patch set to the baksmali trees of the v6 universal build:
- the complete v7 patch set (re-derived this session; the v7 scripts were
  lost in a sandbox recycle), preserving v7 semantics
- corrected/extended patches for items v7 missed:
  * V8a  "Protect more devices" in the VPN settings screen (xoj egn branch,
         row 7) - v7 only hit the yoj branch (menu id 0xa7f8)
  * V7b2 second component-enabling site (yen.l - quick settings tile);
         v7 only flipped the app-widget site
  * N8   orphan "In-app notifications" header + separator above it
         (rqd.k, getChildAt(4) via the separator's parent)
  * RS8  Rewards settings row (k9: iwk state showed it; force GONE) -
         the v6 bo3 patch never applied and targeted the wrong row

Fail-loud: every anchor must match exactly once, or the script aborts
without writing anything.
"""
import sys
from pathlib import Path

PATCHES = []
METHOD_PATCHES = []


def patch(pid, relpath, old, new, count=1):
    PATCHES.append((pid, relpath, old, new, count))


def patch_method(pid, relpath, signature, body):
    """Replace the whole method (signature line .. matching .end method)."""
    METHOD_PATCHES.append((pid, relpath, signature, body))


# ------------------------------------------------------------------ V7a
patch(
    "V7a", "xoj.smali",
    """    iget-boolean p0, p2, Lyoj;->a:Z

    if-nez p0, :cond_8
""",
    """    iget-boolean p0, p2, Lyoj;->a:Z

    nop
""",
)

# ------------------------------------------------------------------ V8a
patch(
    "V8a", "xoj.smali",
    """    :cond_1
    if-ne p0, v0, :cond_2

    iget-boolean v1, p2, Legn;->d:Z
""",
    """    :cond_1
    goto :cond_2

    iget-boolean v1, p2, Legn;->d:Z
""",
)

# ------------------------------------------------------------------ V7b1
patch(
    "V7b1", "com/opera/android/OperaApplication.smali",
    """    check-cast v5, Landroid/content/Context;

    const/4 v8, 0x0

    invoke-virtual {v2, v5, v8}, Lien;->l(Landroid/content/Context;Z)V
""",
    """    check-cast v5, Landroid/content/Context;

    const/4 v8, 0x1

    invoke-virtual {v2, v5, v8}, Lien;->l(Landroid/content/Context;Z)V
""",
)

# ------------------------------------------------------------------ V7b2
patch(
    "V7b2", "com/opera/android/OperaApplication.smali",
    """    check-cast v5, Landroid/content/Context;

    const/4 v8, 0x0

    invoke-virtual {v2, v5, v8}, Lyen;->l(Landroid/content/Context;Z)V
""",
    """    check-cast v5, Landroid/content/Context;

    const/4 v8, 0x1

    invoke-virtual {v2, v5, v8}, Lyen;->l(Landroid/content/Context;Z)V
""",
)

# ------------------------------------------------------------------ C7
patch(
    "C7", "com/opera/android/settings/SettingsManager.smali",
    """    const-string v0, "accept_cookies"

    const/4 v4, 0x1
""",
    """    const-string v0, "accept_cookies"

    const/4 v4, 0x2
""",
)

# ------------------------------------------------------------------ N7
patch(
    "N7", "i06.smali",
    """    iget-boolean v0, p1, Ljwk;->a:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0
""",
    """    iget-boolean v0, p1, Ljwk;->a:Z

    goto :cond_0

    const/4 v0, 0x0
""",
)

# ------------------------------------------------------------------ N8
patch(
    "N8", "rqd.smali",
    """    check-cast p2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz p2, :cond_0

    const p1, 0x7f0a0a1c
""",
    """    check-cast p2, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz p2, :cond_0

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const/4 p1, 0x4

    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const p1, 0x7f0a0a1c
""",
)

# ------------------------------------------------------------------ SD1
patch(
    "SD1a", "r4k.smali",
    '    const-string v1, "SELECT * FROM provider_info"\n',
    '    const-string v1, "SELECT * FROM provider_info WHERE 0"\n',
)
patch(
    "SD1b", "r4k.smali",
    '    const-string v1, "SELECT * FROM partner_data"\n',
    '    const-string v1, "SELECT * FROM partner_data WHERE 0"\n',
)
patch(
    "SD1c", "r4k.smali",
    '    const-string v1, "SELECT * FROM partner_tree LIMIT 1"\n',
    '    const-string v1, "SELECT * FROM partner_tree WHERE 0 LIMIT 1"\n',
)

# ------------------------------------------------------------------ SD2
patch(
    "SD2", "com/opera/android/favorites/PushedSpeedDialSuggestionProvider.smali",
    """    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    new-array p0, v0, [Lcom/opera/android/favorites/PushedSpeedDialFavorite;
""",
    """    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    nop

    new-array p0, v0, [Lcom/opera/android/favorites/PushedSpeedDialFavorite;
""",
)

# ------------------------------------------------------------------ M3c
patch(
    "M3c", "d37.smali",
    """    sget-object v2, Lm18;->b:Lm18;

    if-ne v1, v2, :cond_6

    sget-object v1, Lwol;->m:Lwol;
""",
    """    sget-object v2, Lm18;->b:Lm18;

    goto :cond_6

    sget-object v1, Lwol;->m:Lwol;
""",
)

# ------------------------------------------------------------------ R5a
patch(
    "R5a", "lk6.smali",
    """    invoke-virtual {p2}, Lk3i;->b()Z

    move-result p2

    if-eqz p2, :cond_7

    sget-object p2, Lik6;->a:Lik6;
""",
    """    invoke-virtual {p2}, Lk3i;->b()Z

    move-result p2

    nop

    sget-object p2, Lik6;->a:Lik6;
""",
)

# ------------------------------------------------------------------ R5b
patch(
    "R5b", "lk6.smali",
    """    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    if-eqz p0, :cond_6

    sget-object p0, Ljk6;->a:Ljk6;
""",
    """    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    nop

    sget-object p0, Ljk6;->a:Ljk6;
""",
)

# ------------------------------------------------------------------ RS8
patch(
    "RS8", "k9.smali",
    """    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v0

    iget-object v0, v0, Lfl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V
""",
    """    invoke-virtual {p0}, Lgy3;->H0()Lfl9;

    move-result-object v0

    iget-object v0, v0, Lfl9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V
""",
)


# ============================================================ repurposed UI
# The three Opera-declared VPN Pro components keep their FQCNs; their method
# bodies are replaced to drive the embedded system VPN instead of the dead
# Pro SDK. (Adding duplicate classes under these names is impossible - the
# originals already ship in classes3.dex.)

TILE = "com/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService.smali"
WIDGET = "com/opera/android/vpn/app_widget/VpnProAppWidget.smali"
RECEIVER = "com/opera/android/vpn/VpnReceiver.smali"

patch_method(
    "T8a", TILE,
    ".method public final onClick()V",
    """.method public final onClick()V
    .locals 1

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onClick()V

    invoke-static {p0}, Lcom/zai/sysvpn/VpnController;->toggle(Landroid/content/Context;)V

    return-void
.end method""",
)

patch_method(
    "T8b", TILE,
    ".method public final onStartListening()V",
    """.method public final onStartListening()V
    .locals 2

    invoke-super {p0}, Landroid/service/quicksettings/TileService;->onStartListening()V

    invoke-virtual {p0}, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/zai/sysvpn/VpnController;->isRunning(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/service/quicksettings/Tile;->setState(I)V

    invoke-virtual {v0}, Landroid/service/quicksettings/Tile;->updateTile()V

    :cond_0
    return-void
.end method""",
)

patch_method(
    "W8a", WIDGET,
    ".method public final c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V",
    """.method public final c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 9

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->isRunning(Landroid/content/Context;)Z

    move-result v0

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->getRegion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/zai/sysvpn/VpnController;->regionName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.zai.sysvpn.TOGGLE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v3, Lcom/kape/vpnservicemanager/data/externals/Service;

    invoke-virtual {v2, p1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const/high16 v3, 0xc000000

    const/4 v4, 0x0

    invoke-static {p1, v4, v2, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    array-length v3, p3

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget v5, p3, v4

    new-instance v6, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const v7, 0x7f0d02bf

    invoke-direct {v6, p0, v7}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const v7, 0x7f0a08b7

    const-string v8, "setBackgroundResource"

    if-eqz v0, :cond_bg

    const p0, 0x7f0806f4

    goto :goto_bg

    :cond_bg
    const p0, 0x7f0806f3

    :goto_bg
    invoke-virtual {v6, v7, v8, p0}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    const v7, 0x7f0a08bc

    if-eqz v0, :cond_st

    const-string p0, "VPN ON"

    goto :goto_st

    :cond_st
    const-string p0, "VPN OFF"

    :goto_st
    invoke-virtual {v6, v7, p0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v7, 0x7f0a08bb

    invoke-virtual {v6, v7, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v7, 0x7f0a08ba

    if-eqz v0, :cond_hi

    const-string p0, "Tap to stop"

    goto :goto_hi

    :cond_hi
    const-string p0, "Tap to connect"

    :goto_hi
    invoke-virtual {v6, v7, p0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v7, 0x7f0a08b7

    invoke-virtual {v6, v7, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    invoke-virtual {p2, v5, v6}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method""",
)

patch_method(
    "W8b", WIDGET,
    ".method public final b(Landroid/content/Context;)V",
    """.method public final b(Landroid/content/Context;)V
    .locals 3

    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-direct {v1, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    return-void
.end method""",
)

patch_method(
    "W8c", WIDGET,
    ".method public final onEnabled(Landroid/content/Context;)V",
    """.method public final onEnabled(Landroid/content/Context;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b(Landroid/content/Context;)V

    return-void
.end method""",
)

patch_method(
    "R8", RECEIVER,
    ".method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
    """.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-eqz p2, :cond_null

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_act

    :cond_null
    const/4 v0, 0x0

    :goto_act
    if-eqz v0, :cond_done

    const-string v1, "com.opera.android.VPN_PRO_ENABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->enable(Landroid/content/Context;)V

    return-void

    :cond_1
    const-string v1, "com.opera.android.VPN_RESUME"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->enable(Landroid/content/Context;)V

    return-void

    :cond_2
    const-string v1, "com.opera.android.VPN_PRO_DISABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->disable(Landroid/content/Context;)V

    return-void

    :cond_3
    const-string v1, "com.zai.sysvpn.DISABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->disable(Landroid/content/Context;)V

    return-void

    :cond_4
    const-string v1, "com.zai.sysvpn.TOGGLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->toggle(Landroid/content/Context;)V

    return-void

    :cond_5
    const-string v1, "com.zai.sysvpn.ENABLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {p1}, Lcom/zai/sysvpn/VpnController;->enable(Landroid/content/Context;)V

    return-void

    :cond_6
    const-string v1, "com.zai.sysvpn.RESTART"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_done

    const-string v1, "region"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/zai/sysvpn/VpnController;->region(Landroid/content/Context;Ljava/lang/String;)V

    :cond_done
    return-void
.end method""",
)


def replace_method(text, signature, body):
    """Replace the method from its signature line through '.end method'."""
    if text.count(signature + "\n") != 1:
        return None
    start = text.index(signature + "\n")
    end_marker = "\n.end method\n"
    end = text.index(end_marker, start) + len(end_marker)
    return text[:start] + body + "\n" + text[end:]


def main():
    if len(sys.argv) != 3:
        raise SystemExit("usage: apply_v8_patches.py <sm1_tree> <sm3_tree>")
    trees = {1: Path(sys.argv[1]), 3: Path(sys.argv[2])}
    tree_of = {"d37.smali": 1}

    # plan: read all, verify anchors, then write
    edits = []
    for pid, rel, old, new, cnt in PATCHES:
        t = tree_of.get(rel, 3)
        p = trees[t] / rel
        if not p.is_file():
            raise SystemExit(f"FAIL {pid}: missing {p}")
        text = p.read_text()
        found = text.count(old)
        if found != cnt:
            raise SystemExit(
                f"FAIL {pid}: anchor found {found}x (expected {cnt}) in {p}\n--- anchor ---\n{old}")
        edits.append((pid, p, old, new, cnt))

    medits = {}
    for pid, rel, signature, body in METHOD_PATCHES:
        p = trees[3] / rel
        if not p.is_file():
            raise SystemExit(f"FAIL {pid}: missing {p}")
        text = medits.get(p, p.read_text())
        new_text = replace_method(text, signature, body)
        if new_text is None:
            raise SystemExit(f"FAIL {pid}: signature not found exactly once in {p}: {signature}")
        medits[p] = new_text

    for pid, p, old, new, cnt in edits:
        text = p.read_text()
        assert text.count(old) == cnt
        p.write_text(text.replace(old, new, cnt))
        print(f"applied {pid} -> {p}")

    for p, new_text in medits.items():
        p.write_text(new_text)
        print(f"applied method-body patches -> {p}")

    print(f"OK: {len(edits) + len(METHOD_PATCHES)} patches applied")


if __name__ == "__main__":
    main()
