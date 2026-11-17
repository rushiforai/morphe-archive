"""Appearance patches: unlock all wallpapers and app icons.

v6 lineage: k15.a()Z -> true (entitlement gate). v11: verify what k15
gates and extend to the wallpaper points system as needed.
"""
from common import Patch


def register(reg, ver):
    # v6 lineage: k15.a()Z always returns true. k15 wraps an l15 enum
    # (entitlement/purchase state); always-true unlocks gated content.
    reg.append(Patch(
        "PA.1", "appearance", "k15.a()Z -> true (entitlement gate)", ver,
        "c3/k15.smali",
        """.method public final a()Z
    .registers 2

    iget-object p0, p0, Lk15;->c:Ll15;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I""",
        """.method public final a()Z
    .registers 2

    const/4 v0, 0x1

    return v0

    iget-object p0, p0, Lk15;->c:Ll15;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I""",
        count=1,
        note="v6-proven unlock gate (wallpaper/icon points system)."))
