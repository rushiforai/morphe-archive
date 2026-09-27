.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;
.super Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;
.source "DeepSeekDisplayTextDebugPreference.java"


# direct methods
.method public static synthetic $r8$lambda$R6dhCWLoxON4tWyt5anhLcn9erI(Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 10
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;)V

    .line 11
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 15
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 35
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->initialize()V

    return-void
.end method

.method private initialize()V
    .registers 2

    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->setPersistent(Z)V

    .line 40
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->displayTextDebugEnabled(Landroid/content/Context;)Z

    move-result v0

    .line 41
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->setChecked(Z)V

    .line 42
    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->updateSummary(Z)V

    .line 43
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method private synthetic lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    .line 44
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 45
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveDisplayTextDebugEnabled(Landroid/content/Context;Z)V

    .line 46
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->setChecked(Z)V

    .line 47
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->updateSummary(Z)V

    const/4 p0, 0x0

    return p0
.end method

.method private updateSummary(Z)V
    .registers 3

    .line 53
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p1, :cond_9

    .line 54
    const-string p1, "\u8bca\u65ad\u4e2d\u8bb0\u5f55\u5b57\u5e55\u539f\u6587\u4e0e\u8bd1\u6587\uff0c\u4ec5\u5efa\u8bae\u6392\u67e5\u65f6\u5f00\u542f"

    goto :goto_b

    .line 55
    :cond_9
    const-string p1, "\u5173\u95ed\u65f6\u4e0d\u8bb0\u5f55\u5b57\u5e55\u539f\u6587\u4e0e\u8bd1\u6587"

    .line 53
    :goto_b
    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDisplayTextDebugPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
