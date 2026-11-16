"""Core always-on patches: onboarding skip + splash behavior.

Recovered from the v6 lineage (work/v11/recovered/c3-OperaApplication.diff,
c3-SplashView.diff, c3-ssi.diff) and extended for v11.
"""
from common import Patch

# P1 (since v6, verified in v10): OperaApplication.a()Z -> return true.
# Skips the entire first-run onboarding: T&C dialog, default-browser prompt,
# "Help make Opera better" consent, wallpaper/news interests, "Start browsing".
# v11: same effect, but now anchored on the ORIGINAL stock body (the v10 build
# had already replaced it; anchors must target the stock disassembly).
P1_OLD = """    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "eula_accepted.gdpr"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0"""

P1_NEW = """    const/4 v0, 0x1

    return v0

    const/4 v1, 0x0"""


def register(reg, ver):
    reg.append(Patch(
        "P1", "core", "Skip first-run onboarding (a()Z -> true)", ver,
        "c3/com/opera/android/OperaApplication.smali",
        P1_OLD, P1_NEW, count=1,
        note="Kills T&C, default-browser prompt, CMP consent, interests picker."))

    # P6 (v6 lineage): SplashView constructor paints the splash background
    # white instead of the themed/black default, so the cold-start flash
    # reads as a clean white splash rather than a black screen.
    reg.append(Patch(
        "P6", "core", "SplashView white background", ver,
        "c3/com/opera/android/custom_views/SplashView.smali",
        """.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method""",
        """.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v0, -0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method""",
count=1, verify_absent="old",
        note="From v6: white splash instead of black flash."))

    # P7 (v6 lineage): never make the splash spinner visible (splash_spinner
    # setVisibility(VISIBLE) removed). Removes the 2-second loading circle.
    reg.append(Patch(
        "P7", "core", "Splash spinner never shown", ver,
        "c3/ssi.smali",
        """    check-cast p0, Lcom/opera/android/custom_views/SplashView;

    const v0, 0x7f0a0ab3

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    return-void""",
        """    check-cast p0, Lcom/opera/android/custom_views/SplashView;

    return-void""",
count=1, verify_absent="old",
        note="0x7f0a0ab3 = id/splash_spinner. From v6."))
