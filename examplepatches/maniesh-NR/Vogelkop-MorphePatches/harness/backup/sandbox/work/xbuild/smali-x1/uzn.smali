.class public final synthetic Luzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/WelcomeActivity;B)V
    .registers 3

    iput-byte p2, p0, Luzn;->a:B

    iput-object p1, p0, Luzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Luzn;->a:B

    iget-object p0, p0, Luzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    packed-switch v0, :pswitch_data_ca

    check-cast p1, Lkl0;

    if-eqz p1, :cond_1b

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmdf;

    invoke-virtual {p0, p1}, Lmdf;->c(Lkl0;)V

    goto :goto_1d

    :cond_1b
    sget p0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    :goto_1d
    return-void

    :pswitch_1e
    check-cast p1, Lk0o;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    if-eqz p1, :cond_c9

    sget-object v0, Lk0o;->d:Lk0o;

    if-ne p1, v0, :cond_2d

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->L()V

    goto/16 :goto_c9

    :cond_2d
    iget-boolean v0, p1, Lk0o;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    iget-object v2, p0, Lhjf;->h:Lsz4;

    if-eqz v0, :cond_50

    if-eqz v2, :cond_50

    invoke-static {v2}, Lyi4;->T(Lsz4;)Z

    move-result v0

    if-eqz v0, :cond_50

    new-instance v0, Lvk2;

    const/16 v3, 0x1b

    invoke-direct {v0, v3}, Lvk2;-><init>(B)V

    invoke-static {p0, v2, v1, v0}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    :cond_50
    iget-object v0, p1, Lk0o;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    if-nez v0, :cond_5f

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    goto/16 :goto_c9

    :cond_5f
    iget-object p1, p1, Lk0o;->a:Lj0o;

    iget-object v2, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    if-nez v2, :cond_76

    iget-object p1, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p1, p1, Lxbf;->f:Ljava/lang/Object;

    check-cast p1, Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    new-instance p1, Lbl9;

    invoke-direct {p1, p0, v0}, Lbl9;-><init>(Landroidx/fragment/app/r;Landroidx/fragment/app/Fragment;)V

    iput-object p1, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    goto :goto_c9

    :cond_76
    instance-of p0, v0, Lx65;

    if-eqz p0, :cond_7e

    move-object p0, v0

    check-cast p0, Lx65;

    goto :goto_7f

    :cond_7e
    move-object p0, v1

    :goto_7f
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v3, 0x0

    if-eqz p1, :cond_af

    const/4 v4, 0x1

    if-eq p1, v4, :cond_af

    const/4 v5, 0x2

    if-eq p1, v5, :cond_a9

    const/4 v5, 0x3

    if-eq p1, v5, :cond_a3

    const/4 v5, 0x4

    if-ne p1, v5, :cond_9f

    if-eqz p0, :cond_99

    new-instance v1, Ls65;

    invoke-direct {v1, p0, v4}, Ls65;-><init>(Lx65;B)V

    :cond_99
    new-instance p1, Lmn9;

    invoke-direct {p1, v1, v3, p0}, Lmn9;-><init>(Ls65;ZLx65;)V

    goto :goto_b4

    :cond_9f
    invoke-static {}, Lh9o;->p()V

    goto :goto_c9

    :cond_a3
    new-instance p1, Lmn9;

    invoke-direct {p1, v1, v3, p0}, Lmn9;-><init>(Ls65;ZLx65;)V

    goto :goto_b4

    :cond_a9
    new-instance p1, Lnn9;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    goto :goto_b4

    :cond_af
    new-instance p1, Lmn9;

    invoke-direct {p1, v1, v3, v1}, Lmn9;-><init>(Ls65;ZLx65;)V

    :goto_b4
    iget-object p0, v2, Lbl9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    new-instance p0, Lwr9;

    invoke-direct {p0, v2, v1}, Lwr9;-><init>(Lbl9;Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v2, v0, v1, p1, p0}, Lbl9;->b(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/Fragment;Lzm9;Ljava/lang/Runnable;)V

    :cond_c9
    :goto_c9
    return-void

    :pswitch_data_ca
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
