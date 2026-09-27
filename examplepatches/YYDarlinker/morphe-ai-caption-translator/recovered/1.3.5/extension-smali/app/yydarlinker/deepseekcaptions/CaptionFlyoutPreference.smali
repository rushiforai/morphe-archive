.class public Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;
.super Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;
.source "CaptionFlyoutPreference.java"


# direct methods
.method public static synthetic $r8$lambda$YEDKgHGFM5QzhMG23RJhcabUrZc(Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 6
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 7
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 8
    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->initialize()V

    return-void
.end method

.method private initialize()V
    .registers 3

    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setPersistent(Z)V

    .line 15
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->title()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u5728\u64ad\u653e\u5668\u5f39\u51fa\u83dc\u5355\u4e2d\u663e\u793a\u5feb\u6377\u5f00\u5173\uff1b\u9690\u85cf\u4e0d\u5173\u95ed AI \u5b57\u5e55\uff0c\u4e0b\u6b21\u6253\u5f00\u83dc\u5355\u751f\u6548"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 17
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->saved()Z

    move-result v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setChecked(Z)V

    .line 18
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method private synthetic lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    .line 19
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 20
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->save(Z)V

    .line 21
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setChecked(Z)V

    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 4

    .line 25
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->saved()Z

    move-result v0

    .line 26
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->isChecked()Z

    move-result v1

    if-eq v1, v0, :cond_d

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->setChecked(Z)V

    .line 27
    :cond_d
    invoke-super {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->onBindView(Landroid/view/View;)V

    return-void
.end method

.method protected save(Z)V
    .registers 2

    .line 11
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveFlyoutMenuEnabled(Landroid/content/Context;Z)V

    return-void
.end method

.method protected saved()Z
    .registers 1

    .line 10
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->flyoutMenuEnabled(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method protected title()Ljava/lang/String;
    .registers 1

    .line 12
    const-string p0, "\u666e\u901a\u89c6\u9891\u5f39\u51fa\u83dc\u5355\u4e2d\u7684 AI \u5b57\u5e55\u5f00\u5173"

    return-object p0
.end method
