.class public final synthetic Lpt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;
.implements Ltvb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lpt3;->a:B

    iput-object p1, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Leri;Ljava/lang/String;ZZ)V
    .registers 15

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v0, 0x0

    iget-object p0, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->o1(I)V

    sget-object v5, Ll08;->a:Ll08;

    new-instance v1, Lbsi;

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, p1

    move-object v3, p2

    move v9, p3

    invoke-direct/range {v1 .. v9}, Lbsi;-><init>(Leri;Ljava/lang/String;ILjava/util/List;Lx92;Lqt3;ZZ)V

    invoke-virtual {p0, v1, p4}, Lcom/opera/android/BrowserActivity;->f0(Lbsi;Z)V

    return-void
.end method

.method public final f(Lo93;)V
    .registers 4

    iget-byte v0, p0, Lpt3;->a:B

    sget-object v1, Lijm;->b:Lijm;

    iget-object p0, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_2a

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_19
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method

.method public final run()V
    .registers 14

    iget-byte v0, p0, Lpt3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_10a

    :pswitch_9
    new-instance p0, Lsk;

    const/4 v0, 0x4

    invoke-direct {p0, v3, v0}, Lsk;-><init>(Ljava/lang/Object;B)V

    const v0, 0x7f14044c

    const v2, 0x7f14044d

    invoke-static {v3, v1, v0, v2, p0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    return-void

    :pswitch_19
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->R0()V

    return-void

    :pswitch_1f
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->S0()V

    return-void

    :pswitch_25
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->R0()V

    return-void

    :pswitch_2b
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->S0()V

    return-void

    :pswitch_31
    iget-object p0, v3, Lt5d;->u:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_3c

    invoke-interface {p0}, Ll24;->Z()Z

    :cond_3c
    return-void

    :pswitch_3d
    iget-object p0, v3, Lt5d;->u:Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ll24;

    if-eqz p0, :cond_48

    invoke-interface {p0}, Ll24;->u()Z

    :cond_48
    return-void

    :pswitch_49
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_56

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->b()V

    :cond_56
    return-void

    :pswitch_57
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v1, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v3

    const/4 v4, 0x0

    sget-object v5, Llqm;->l:Llqm;

    const/4 v2, 0x1

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    return-void

    :pswitch_68
    iget-object v7, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, v7, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v0, 0x0

    if-nez p0, :cond_70

    move-object p0, v0

    :cond_70
    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-gt p0, v2, :cond_81

    const-wide/16 v8, 0x3e8

    const-wide/16 v10, 0x0

    const/4 v12, 0x1

    invoke-virtual/range {v7 .. v12}, Lcom/opera/android/BrowserActivity;->z1(JJZ)V

    goto :goto_8f

    :cond_81
    invoke-virtual {v7}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_8f

    iget-object v1, v7, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v1, :cond_8c

    move-object v0, v1

    :cond_8c
    invoke-virtual {v0, p0}, Lk6l;->k(Lb2l;)V

    :cond_8f
    :goto_8f
    return-void

    :pswitch_90
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_e3

    check-cast p0, Ld7l;

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-nez v0, :cond_e3

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->z()Z

    move-result v0

    if-eqz v0, :cond_e3

    invoke-virtual {p0}, Ld7l;->o0()Z

    move-result v0

    if-nez v0, :cond_e3

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e3

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e3

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->isOffline(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e3

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->b(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_e3

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->g0()V

    :cond_e3
    return-void

    :pswitch_e4
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v3, p0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v5

    if-eqz v5, :cond_fb

    move-object p0, v5

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_fb

    move v4, v2

    goto :goto_fc

    :cond_fb
    move v4, v1

    :goto_fc
    const/4 v6, 0x0

    sget-object v7, Llqm;->l:Llqm;

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    return-void

    :pswitch_104
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->e1(Z)V

    return-void

    :pswitch_data_10a
    .packed-switch 0xc
        :pswitch_104
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_e4
        :pswitch_90
        :pswitch_68
        :pswitch_57
        :pswitch_49
        :pswitch_3d
        :pswitch_31
        :pswitch_2b
        :pswitch_25
        :pswitch_1f
        :pswitch_19
    .end packed-switch
.end method
