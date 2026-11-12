.class public Lnrf;
.super Leog;
.source "SourceFile"


# instance fields
.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Luim;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lnrf;->i:Ljava/lang/String;

    iput-object v0, p0, Lnrf;->j:Ljava/lang/String;

    return-void
.end method

.method public static l0(Ljava/lang/String;Ljava/lang/String;)Ltim;
    .registers 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "title"

    invoke-virtual {v0, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lnrf;

    invoke-direct {p0}, Lnrf;-><init>()V

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    new-instance p1, Ltim;

    invoke-direct {p1, p0}, Ltim;-><init>(Luim;)V

    return-object p1
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 12

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "key"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnrf;->i:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    sparse-switch v2, :sswitch_data_17a

    goto/16 :goto_85

    :sswitch_20
    const-string v2, "user_agent"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/16 v5, 0x9

    goto :goto_85

    :sswitch_2b
    const-string v2, "toolbar_disposition_classic"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/16 v5, 0x8

    goto :goto_85

    :sswitch_36
    const-string v2, "accept_cookies"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x7

    goto :goto_85

    :sswitch_40
    const-string v2, "app_layout"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x6

    goto :goto_85

    :sswitch_4a
    const-string v2, "toolbar_disposition_tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x5

    goto :goto_85

    :sswitch_54
    const-string v2, "addressbar_position"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x4

    goto :goto_85

    :sswitch_5e
    const-string v2, "concurrent_downloads"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x3

    goto :goto_85

    :sswitch_68
    const-string v2, "enable_reading_mode_as_default"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    const/4 v5, 0x2

    goto :goto_85

    :sswitch_72
    const-string v2, "image_mode"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    move v5, v4

    goto :goto_85

    :sswitch_7c
    const-string v2, "tab_disposition"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    move v5, v3

    :cond_85
    :goto_85
    packed-switch v5, :pswitch_data_1a4

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_ec

    :pswitch_8b
    sget-object v0, Ls7j;->b:Ls7j;

    sget-object v2, Ls7j;->c:Ls7j;

    filled-new-array {v0, v2}, [Ls7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_98
    invoke-static {}, Lr7j;->values()[Lr7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_a1
    invoke-static {}, Lj7j;->values()[Lj7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_aa
    invoke-static {}, Le7j;->values()[Le7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_b3
    sget-object v0, Lr7j;->b:Lr7j;

    sget-object v2, Lr7j;->c:Lr7j;

    filled-new-array {v0, v2}, [Lr7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_c0
    invoke-static {}, Lb7j;->values()[Lb7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_c9
    invoke-static {}, Li7j;->values()[Li7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_d2
    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_db
    invoke-static {}, Lm7j;->values()[Lm7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_ec

    :pswitch_e4
    invoke-static {}, Lq7j;->values()[Lq7j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_ec
    const-string v2, "title"

    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnrf;->j:Ljava/lang/String;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    new-instance v2, Lps5;

    invoke-direct {v2, p1}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p0, v2, Lbud;->c:Leog;

    iput-object p0, v2, Lps5;->e:Leog;

    iget-object v5, p0, Lnrf;->i:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    move v5, v3

    :goto_114
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_167

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llrf;

    invoke-interface {v6}, Llrf;->getDescription()I

    move-result v7

    if-nez v7, :cond_12f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-interface {v6, v7}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v7

    goto :goto_147

    :cond_12f
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-interface {v6, v8}, Llrf;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6}, Llrf;->getDescription()I

    move-result v9

    invoke-virtual {p0, v9}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lm5h;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object v7

    :goto_147
    invoke-virtual {v2, v4, v5, v3, v7}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    move-result-object v7

    invoke-interface {v6}, Llrf;->getValue()I

    move-result v8

    if-ne v8, v1, :cond_153

    move v8, v4

    goto :goto_154

    :cond_153
    move v8, v3

    :goto_154
    invoke-virtual {v7, v8}, Lqtd;->setChecked(Z)Landroid/view/MenuItem;

    invoke-interface {v6}, Llrf;->getIcon()I

    move-result v6

    if-eqz v6, :cond_164

    invoke-static {v6, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v7, v6}, Lqtd;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_164
    add-int/lit8 v5, v5, 0x1

    goto :goto_114

    :cond_167
    iget-object p1, p0, Lnrf;->j:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lps5;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    invoke-virtual {v2, v4, v4, v4}, Lbud;->setGroupCheckable(IZZ)V

    iput-object v2, p0, Leog;->d:Lps5;

    new-instance p1, Lbb1;

    invoke-direct {p1, p0, v0, v4}, Lbb1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void

    nop

    :sswitch_data_17a
    .sparse-switch
        -0x67afe9f3 -> :sswitch_7c
        -0x560215f9 -> :sswitch_72
        -0x44fee31f -> :sswitch_68
        -0x11df4f9d -> :sswitch_5e
        0x123e81c9 -> :sswitch_54
        0x389c9b32 -> :sswitch_4a
        0x3f930708 -> :sswitch_40
        0x5e171658 -> :sswitch_36
        0x6a677546 -> :sswitch_2b
        0x724f4d91 -> :sswitch_20
    .end sparse-switch

    :pswitch_data_1a4
    .packed-switch 0x0
        :pswitch_e4
        :pswitch_db
        :pswitch_d2
        :pswitch_c9
        :pswitch_c0
        :pswitch_b3
        :pswitch_aa
        :pswitch_a1
        :pswitch_98
        :pswitch_8b
    .end packed-switch
.end method
