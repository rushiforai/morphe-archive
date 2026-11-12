.class public final Lbco;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Landroid/content/res/Resources;

.field public final synthetic e:Lp12;


# direct methods
.method public constructor <init>(Lp12;Landroid/content/res/Resources;Landroid/content/res/Resources;B)V
    .registers 6

    iput-byte p4, p0, Lbco;->c:B

    const/16 v0, 0x1d

    packed-switch p4, :pswitch_data_1e

    iput-object p3, p0, Lbco;->d:Landroid/content/res/Resources;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lbco;->e:Lp12;

    invoke-direct {p0, p2, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void

    :pswitch_12
    iput-object p3, p0, Lbco;->d:Landroid/content/res/Resources;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lbco;->e:Lp12;

    invoke-direct {p0, p2, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public final d()V
    .registers 3

    iget-byte v0, p0, Lbco;->c:B

    iget-object p0, p0, Lbco;->e:Lp12;

    packed-switch v0, :pswitch_data_2a

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "allow_ask_again"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void

    :pswitch_18
    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "infobar_shown_before"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final e(Z)V
    .registers 7

    iget-byte v0, p0, Lbco;->c:B

    const/4 v1, 0x5

    iget-object p0, p0, Lbco;->e:Lp12;

    packed-switch v0, :pswitch_data_82

    if-eqz p1, :cond_36

    iget-object p1, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Lq6e;

    iget-object v0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast v0, Leri;

    invoke-virtual {p1, v0}, Lq6e;->o(Leri;)V

    iget-object p1, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p1, Lt5d;

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Lq6e;

    invoke-virtual {v0}, Lq6e;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v2, Lcz4;

    new-instance v3, Ltl3;

    invoke-direct {v3, p0, p1, v0, v1}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lcz4;->f(Lo93;)V

    goto :goto_46

    :cond_36
    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "allow_ask_again"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :goto_46
    return-void

    :pswitch_47
    iget-object v0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    iget-object v2, p0, Lp12;->b:Ljava/lang/Object;

    check-cast v2, Lq6e;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v3, "infobar_shown_before"

    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    if-eqz p1, :cond_80

    iget-object p1, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p1, Leri;

    invoke-virtual {v2, p1}, Lq6e;->o(Leri;)V

    iget-object p1, p0, Lp12;->c:Ljava/lang/Object;

    check-cast p1, Lt5d;

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v2}, Lq6e;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v2, Lcz4;

    new-instance v3, Ltl3;

    invoke-direct {v3, p0, p1, v0, v1}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lcz4;->f(Lo93;)V

    :cond_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_47
    .end packed-switch
.end method

.method public final u()Ljava/lang/String;
    .registers 2

    iget-byte v0, p0, Lbco;->c:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Lbco;->d:Landroid/content/res/Resources;

    const v0, 0x7f140b48

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lbco;->d:Landroid/content/res/Resources;

    const v0, 0x7f140b4b

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
