.class public final synthetic Lhmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljmn;


# direct methods
.method public synthetic constructor <init>(Ljmn;B)V
    .registers 3

    iput-byte p2, p0, Lhmn;->a:B

    iput-object p1, p0, Lhmn;->b:Ljmn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte v0, p0, Lhmn;->a:B

    iget-object p0, p0, Lhmn;->b:Ljmn;

    packed-switch v0, :pswitch_data_ce

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p1

    new-instance v0, Log5;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_1e
    iget-object v0, p0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Ljmn;->x:Laln;

    if-eqz v1, :cond_c4

    iget v1, p0, Ljmn;->P:I

    const/4 v2, 0x1

    if-eqz v1, :cond_30

    and-int/2addr v1, v2

    if-eqz v1, :cond_96

    :cond_30
    iput-boolean v2, p0, Ljmn;->E:Z

    iget-object v1, p0, Ljmn;->A:Lw6j;

    invoke-virtual {v1}, Lw6j;->k()Z

    move-result v3

    if-eqz v3, :cond_70

    iget-object v1, v1, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Llkn;

    iget-object v3, v1, Llkn;->i:Lzjn;

    iget-object v1, v1, Llkn;->a:Lxkn;

    iget-object v1, v1, Lxkn;->a:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v4, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "wallpaper.adjust.id"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget v1, v3, Lzjn;->a:F

    const-string v5, "wallpaper.adjust.scale"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    iget v1, v3, Lzjn;->b:F

    const-string v5, "wallpaper.adjust.pivotx"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    iget v1, v3, Lzjn;->c:F

    const-string v3, "wallpaper.adjust.pivoty"

    invoke-interface {v4, v3, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_70
    iget-object p1, p0, Ljmn;->r:Lqln;

    iget-object v1, p0, Ljmn;->x:Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljmn;->H0()I

    move-result v3

    invoke-virtual {p1, v3, v1}, Lqln;->p(ILjava/lang/String;)V

    iget-object p1, p0, Ljmn;->s:Lonn;

    iget-object v1, p0, Ljmn;->x:Laln;

    iget-object p1, p1, Lonn;->h:Lnnn;

    if-eqz p1, :cond_89

    iput-object v1, p1, Lnnn;->c:Laln;

    :cond_89
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p1

    iget-object v1, p0, Ljmn;->J:Lg7j;

    if-eq p1, v1, :cond_96

    const-string p1, "app_theme_accent_changed_by_user"

    invoke-virtual {v0, v2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_96
    iget p1, p0, Ljmn;->P:I

    and-int/lit8 p1, p1, 0x6

    if-eqz p1, :cond_af

    const/4 v0, 0x2

    if-ne p1, v0, :cond_a2

    sget-object p1, Lkkn;->a:Lkkn;

    goto :goto_aa

    :cond_a2
    const/4 v0, 0x4

    if-ne p1, v0, :cond_a8

    sget-object p1, Lkkn;->b:Lkkn;

    goto :goto_aa

    :cond_a8
    sget-object p1, Lkkn;->c:Lkkn;

    :goto_aa
    iput-boolean v2, p0, Ljmn;->O:Z

    invoke-virtual {p0, p1}, Ljmn;->J0(Lkkn;)V

    :cond_af
    iget p1, p0, Ljmn;->P:I

    if-nez p1, :cond_bd

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const/4 p1, 0x0

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v2, p1}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    goto :goto_c4

    :cond_bd
    iget-boolean p1, p0, Ljmn;->N:Z

    if-nez p1, :cond_c4

    invoke-virtual {p0}, Ljmn;->g0()V

    :cond_c4
    :goto_c4
    return-void

    :pswitch_c5
    iget-object p1, p0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->j:Landroid/view/View;

    invoke-virtual {p0, p1}, Ljmn;->I0(Landroid/view/View;)V

    return-void

    nop

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_1e
    .end packed-switch
.end method
