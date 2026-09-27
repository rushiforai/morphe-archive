.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;
.super Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;
.source "DeepSeekEnabledPreference.java"


# direct methods
.method public static synthetic $r8$lambda$hboyVWTr7Cgx8_ytjIAxBvXc154(Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 10
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;)V

    .line 11
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 15
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 20
    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 31
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->initialize()V

    return-void
.end method

.method private initialize()V
    .registers 2

    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setPersistent(Z)V

    .line 36
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    iget-boolean v0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setChecked(Z)V

    .line 37
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->updateSummary()V

    .line 38
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method private synthetic lambda$initialize$0(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 4

    .line 39
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    .line 40
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->setEngine(Landroid/content/Context;Z)Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_12

    return v0

    .line 41
    :cond_12
    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setChecked(Z)V

    .line 42
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->updateSummary()V

    return v0
.end method

.method private updateSummary()V
    .registers 3

    .line 54
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 55
    iget-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-nez v1, :cond_1a

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u5173\u95ed\u540e\u4f7f\u7528 YouTube \u539f\u751f\u5b57\u5e55\u663e\u793a"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void

    .line 56
    :cond_1a
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u539f\u5b57\u5e55\u53ef\u76f4\u63a5\u663e\u793a\uff1b\u81ea\u52a8\u7ffb\u8bd1\u9700\u586b\u5199 API Key"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void

    .line 57
    :cond_30
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u5df2\u542f\u7528\uff1b\u4ece\u81ea\u52a8\u7ffb\u8bd1\u9009\u62e9\u4efb\u610f\u8bed\u8a00\u5373\u53ef\u542f\u52a8 AI \u5b57\u5e55"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 4

    .line 48
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v0

    .line 49
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->isChecked()Z

    move-result v1

    if-eq v1, v0, :cond_14

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->setChecked(Z)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekEnabledPreference;->updateSummary()V

    .line 50
    :cond_14
    invoke-super {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->onBindView(Landroid/view/View;)V

    return-void
.end method
