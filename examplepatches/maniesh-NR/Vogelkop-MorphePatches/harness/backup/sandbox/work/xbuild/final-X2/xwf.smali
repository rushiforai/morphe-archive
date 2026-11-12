.class public final synthetic Lxwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lywf;


# direct methods
.method public synthetic constructor <init>(Lywf;B)V
    .registers 3

    iput-byte p2, p0, Lxwf;->a:B

    iput-object p1, p0, Lxwf;->b:Lywf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Lxwf;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lxwf;->b:Lywf;

    packed-switch p1, :pswitch_data_6e

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_c
    invoke-virtual {p0}, Ldej;->b()V

    iget-object p0, p0, Lywf;->e:Ld8j;

    new-array p1, v0, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->a([I)V

    return-void

    :pswitch_19
    iget-object p1, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "default_webpage_zoom"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Loup;->n0(I)D

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lywf;->d(D)V

    const/4 v2, 0x1

    iput-boolean v2, p0, Lywf;->g:Z

    iget-object v2, p0, Lywf;->f:Ly83;

    const/4 v3, 0x0

    if-nez v2, :cond_31

    move-object v2, v3

    :cond_31
    iget-object v2, v2, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/slider/Slider;

    int-to-float v4, v1

    invoke-virtual {v2, v4}, Lcom/google/android/material/slider/Slider;->C0(F)V

    iput-boolean v0, p0, Lywf;->g:Z

    invoke-virtual {p0}, Lywf;->g()Z

    move-result v0

    if-eqz v0, :cond_48

    const-string v0, "reader_mode_text_wrap"

    const/4 v2, -0x1

    invoke-virtual {p1, v2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_51

    :cond_48
    invoke-virtual {p0}, Lywf;->e()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_51

    invoke-static {v0}, LJ/N;->M3MkeCX1(Ljava/lang/Object;)V

    :cond_51
    :goto_51
    iget-object v0, p0, Lywf;->f:Ly83;

    if-eqz v0, :cond_56

    move-object v3, v0

    :cond_56
    iget-object v0, v3, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const-string v2, "text_wrap"

    invoke-virtual {p1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lywf;->h()V

    invoke-virtual {p0, v1}, Lywf;->k(I)V

    invoke-virtual {p0, v1}, Lywf;->j(I)V

    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_19
        :pswitch_c
    .end packed-switch
.end method
