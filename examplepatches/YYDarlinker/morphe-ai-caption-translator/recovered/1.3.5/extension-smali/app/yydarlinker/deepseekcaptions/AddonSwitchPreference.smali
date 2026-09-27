.class public Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;
.super Landroid/preference/Preference;
.source "AddonSwitchPreference.java"


# instance fields
.field private binding:Z

.field private checked:Z

.field private widget:Landroid/widget/Switch;


# direct methods
.method public static synthetic $r8$lambda$Pw1LTTNR3cRJXVjUnbpVGDV7MTw(Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;Landroid/widget/CompoundButton;Z)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->lambda$onCreateView$0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 10
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private synthetic lambda$onCreateView$0(Landroid/widget/CompoundButton;Z)V
    .registers 3

    .line 23
    iget-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->binding:Z

    if-nez p1, :cond_17

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    invoke-virtual {p0, p2}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->setChecked(Z)V

    return-void

    :cond_12
    iget-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->setChecked(Z)V

    :cond_17
    return-void
.end method


# virtual methods
.method public isChecked()Z
    .registers 1

    .line 15
    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    return p0
.end method

.method protected onClick()V
    .registers 2

    .line 26
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->setChecked(Z)V

    :cond_15
    return-void
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .line 17
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 18
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x42800000    # 64.0f

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 19
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const v2, 0x1020016

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 20
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const v2, 0x1020010

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 21
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/Switch;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->widget:Landroid/widget/Switch;

    .line 22
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->widget:Landroid/widget/Switch;

    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 23
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->widget:Landroid/widget/Switch;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;)V

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 24
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->widget:Landroid/widget/Switch;

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object p1
.end method

.method public setChecked(Z)V
    .registers 4

    .line 14
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->checked:Z

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->widget:Landroid/widget/Switch;

    if-eqz v0, :cond_f

    const/4 v1, 0x1

    iput-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->binding:Z

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->binding:Z

    :cond_f
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/AddonSwitchPreference;->notifyChanged()V

    return-void
.end method
