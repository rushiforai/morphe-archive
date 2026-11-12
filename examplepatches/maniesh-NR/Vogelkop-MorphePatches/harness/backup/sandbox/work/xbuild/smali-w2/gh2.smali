.class public final synthetic Lgh2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    iput-byte p1, p0, Lgh2;->a:B

    iput-object p2, p0, Lgh2;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lgh2;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lgh2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x4

    const/4 v4, 0x0

    iget-boolean v5, p0, Lgh2;->b:Z

    iget-object v6, p0, Lgh2;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_130

    check-cast v6, Landroid/app/Application;

    sget-object p0, Ljno;->a:Ljno;

    invoke-static {v6, v5}, Ljno;->a(Landroid/app/Application;Z)V

    return-void

    :pswitch_15
    check-cast v6, Lk8;

    invoke-virtual {v6}, Lk8;->isEnabled()Z

    move-result p0

    iget-object v0, v6, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lcrk;

    invoke-virtual {v6}, Lk8;->W()I

    move-result v3

    iget-object v0, v0, Lcrk;->b:Ljava/lang/Object;

    check-cast v0, Lwrl;

    iget-object v6, v0, Lwrl;->b:Lh73;

    const/4 v7, 0x3

    const/4 v8, 0x2

    if-eqz v3, :cond_4b

    if-eq v3, v2, :cond_43

    if-eq v3, v8, :cond_3b

    if-ne v3, v7, :cond_52

    sget-object v2, Lmh0;->m:Lmh0;

    iget-object v9, v6, Lh73;->l:Lx5f;

    invoke-virtual {v9, v2}, Lx5f;->c0(Lmh0;)V

    goto :goto_52

    :cond_3b
    sget-object v2, Lmh0;->c:Lmh0;

    iget-object v9, v6, Lh73;->l:Lx5f;

    invoke-virtual {v9, v2}, Lx5f;->c0(Lmh0;)V

    goto :goto_52

    :cond_43
    sget-object v2, Lmh0;->w:Lmh0;

    iget-object v9, v6, Lh73;->l:Lx5f;

    invoke-virtual {v9, v2}, Lx5f;->c0(Lmh0;)V

    goto :goto_52

    :cond_4b
    sget-object v2, Lmh0;->E:Lmh0;

    iget-object v9, v6, Lh73;->l:Lx5f;

    invoke-virtual {v9, v2}, Lx5f;->c0(Lmh0;)V

    :cond_52
    :goto_52
    if-eqz v5, :cond_5a

    if-eqz p0, :cond_5a

    if-eqz v3, :cond_77

    if-eq v3, v7, :cond_67

    :cond_5a
    if-eqz p0, :cond_83

    iget-object p0, v0, Lwrl;->h:Lqm9;

    new-instance v1, Ltg7;

    invoke-direct {v1, v0, v3}, Ltg7;-><init>(Lwrl;I)V

    invoke-virtual {p0, v1}, Lqm9;->f(Lo93;)V

    goto :goto_83

    :cond_67
    iget-object p0, v6, Lh73;->a:Lf7d;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lexe;

    invoke-direct {v0, v8, v1}, Lexe;-><init>(ILoba;)V

    iget-object p0, p0, Lf7d;->b:Lgjm;

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    goto :goto_83

    :cond_77
    iget-object p0, v6, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance v0, Lvfn;

    invoke-direct {v0, v8, v1, v8}, Lvfn;-><init>(ILoba;I)V

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    :cond_83
    :goto_83
    return-void

    :pswitch_84
    check-cast v6, Lkm5;

    iget-object p0, v6, Lkm5;->d:Ljava/lang/Object;

    check-cast p0, Ljqk;

    iput-object v1, p0, Ljqk;->h:Loml;

    iget-object v0, p0, Ljqk;->d:Leyi;

    iget-object v1, p0, Ljqk;->f:Ljava/lang/String;

    iget-object p0, p0, Ljqk;->e:Ljava/util/List;

    invoke-virtual {v0, v1, p0, v5}, Leyi;->k(Ljava/lang/String;Ljava/util/List;Z)Z

    return-void

    :pswitch_96
    check-cast v6, Ljlj;

    invoke-virtual {v6, v5}, Ljlj;->c(Z)V

    return-void

    :pswitch_9c
    check-cast v6, Lrgh;

    invoke-virtual {v6, v5, v4}, Lrgh;->j(ZZ)I

    move-result p0

    invoke-virtual {v6, p0, v5}, Lrgh;->n(IZ)V

    return-void

    :pswitch_a6
    check-cast v6, Lcom/opera/android/PushedContentHandler$Request;

    iget-object p0, v6, Lcom/opera/android/PushedContentHandler$Request;->e:Lcom/opera/android/PushedContentHandler;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, v6, Lcom/opera/android/PushedContentHandler$Request;->a:J

    sub-long/2addr v0, v2

    invoke-virtual {p0, v0, v1, v5}, Lcom/opera/android/PushedContentHandler;->e(JZ)V

    return-void

    :pswitch_b5
    check-cast v6, Lcom/opera/android/PushedContentHandler;

    invoke-virtual {v6, v2, v5}, Lcom/opera/android/PushedContentHandler;->d(ZZ)V

    return-void

    :pswitch_bb
    check-cast v6, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;

    iget-object p0, v6, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->b:Lwx;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_c7
    check-cast v6, Lbx7;

    invoke-virtual {v6, v5}, Lbx7;->a(Z)V

    return-void

    :pswitch_cd
    check-cast v6, Lfge;

    iget-object p0, v6, Lfge;->D:Landroid/view/View;

    if-eqz p0, :cond_d8

    if-nez v5, :cond_d8

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_d8
    return-void

    :pswitch_d9
    check-cast v6, Lgld;

    iget-object p0, v6, Lgld;->s:Lu02;

    if-eqz p0, :cond_ed

    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_ea

    move v3, v4

    :cond_ea
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_ed
    return-void

    :pswitch_ee
    check-cast v6, Lorg/chromium/device/geolocation/LocationProviderAdapter;

    iget-object p0, v6, Lorg/chromium/device/geolocation/LocationProviderAdapter;->a:Layc;

    invoke-interface {p0, v5}, Layc;->a(Z)V

    return-void

    :pswitch_f6
    check-cast v6, Lcom/opera/android/bubbleview/BubbleView;

    sget p0, Lcom/opera/android/bubbleview/BubbleView;->D:I

    iput-boolean v4, v6, Lcom/opera/android/bubbleview/BubbleView;->x:Z

    iget-object p0, v6, Lcom/opera/android/bubbleview/BubbleView;->w:Llz3;

    if-eqz p0, :cond_103

    invoke-virtual {p0, v5}, Llz3;->c(Z)V

    :cond_103
    return-void

    :pswitch_104
    check-cast v6, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const-wide/16 v7, 0x3e8

    const-wide/16 v9, 0x0

    iget-boolean v11, p0, Lgh2;->b:Z

    invoke-virtual/range {v6 .. v11}, Lcom/opera/android/BrowserActivity;->z1(JJZ)V

    return-void

    :pswitch_112
    check-cast v6, Lpad;

    iget-object p0, v6, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Lmi8;

    sget-object v0, Ltym;->a:Ljava/lang/String;

    iget-object p0, p0, Lmi8;->a:Lqi8;

    iget-boolean v0, p0, Lqi8;->f0:Z

    if-eq v0, v5, :cond_12e

    iput-boolean v5, p0, Lqi8;->f0:Z

    iget-object p0, p0, Lqi8;->n:Lijc;

    new-instance v0, Lgo4;

    invoke-direct {v0, v3, v5}, Lgo4;-><init>(BZ)V

    const/16 v1, 0x17

    invoke-virtual {p0, v1, v0}, Lijc;->i(ILfjc;)V

    :cond_12e
    return-void

    nop

    :pswitch_data_130
    .packed-switch 0x0
        :pswitch_112
        :pswitch_104
        :pswitch_f6
        :pswitch_ee
        :pswitch_d9
        :pswitch_cd
        :pswitch_c7
        :pswitch_bb
        :pswitch_b5
        :pswitch_a6
        :pswitch_9c
        :pswitch_96
        :pswitch_84
        :pswitch_15
    .end packed-switch
.end method
