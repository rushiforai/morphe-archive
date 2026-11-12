.class public final Lkpn;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Lrpn;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lrpn;B)V
    .registers 4

    iput-byte p3, p0, Lkpn;->c:B

    invoke-direct {p0, p1}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    iput-object p2, p0, Lkpn;->d:Lrpn;

    return-void
.end method


# virtual methods
.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-byte v0, p0, Lkpn;->c:B

    packed-switch v0, :pswitch_data_5e

    return-void

    :pswitch_6
    if-eqz p1, :cond_b

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_40

    iget v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    iget v1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    iget-object p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->l:Ljava/lang/String;

    const/16 v2, -0x17b

    if-eq v0, v2, :cond_36

    const/16 v1, -0x76

    if-eq v0, v1, :cond_30

    const/16 v1, -0x6a

    if-eq v0, v1, :cond_30

    const/16 v1, -0xf

    if-eq v0, v1, :cond_30

    const/4 v1, -0x7

    if-eq v0, v1, :cond_30

    packed-switch v0, :pswitch_data_64

    new-instance v1, Lo68;

    invoke-direct {v1, v0, p1}, Lo68;-><init>(ILjava/lang/String;)V

    goto :goto_3e

    :cond_30
    :pswitch_30
    new-instance v1, Ln68;

    invoke-direct {v1, v0, p1}, Ln68;-><init>(ILjava/lang/String;)V

    goto :goto_3e

    :cond_36
    new-instance p1, Lo68;

    const-string v0, "HTTP Error"

    invoke-direct {p1, v1, v0}, Lo68;-><init>(ILjava/lang/String;)V

    move-object v1, p1

    :goto_3e
    move-object v5, v1

    goto :goto_43

    :cond_40
    sget-object v1, Lpsp;->c:Lpsp;

    goto :goto_3e

    :goto_43
    iget-object p0, p0, Lkpn;->d:Lrpn;

    iget-object p0, p0, Lrpn;->b:Lnak;

    :cond_47
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lqpn;

    const/4 v6, 0x0

    const/16 v7, 0xb

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v2 .. v7}, Lqpn;->a(Lqpn;Lptl;ZLp68;ZI)Lqpn;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_47

    return-void

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch

    :pswitch_data_64
    .packed-switch -0x68
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
    .end packed-switch
.end method

.method public final didStartLoading(Lorg/chromium/url/GURL;)V
    .registers 8

    iget-byte p1, p0, Lkpn;->c:B

    packed-switch p1, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lkpn;->d:Lrpn;

    iget-object p0, p0, Lrpn;->b:Lnak;

    :cond_a
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lqpn;

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lqpn;->a(Lqpn;Lptl;ZLp68;ZI)Lqpn;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    return-void

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 8

    iget-byte p1, p0, Lkpn;->c:B

    packed-switch p1, :pswitch_data_24

    return-void

    :pswitch_6
    sget-object v3, Lpsp;->c:Lpsp;

    iget-object p0, p0, Lkpn;->d:Lrpn;

    iget-object p0, p0, Lrpn;->b:Lnak;

    :cond_c
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lqpn;

    const/4 v4, 0x0

    const/16 v5, 0xb

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lqpn;->a(Lqpn;Lptl;ZLp68;ZI)Lqpn;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final didStopLoading(Lorg/chromium/url/GURL;Z)V
    .registers 9

    iget-byte p1, p0, Lkpn;->c:B

    packed-switch p1, :pswitch_data_22

    return-void

    :pswitch_6
    iget-object p0, p0, Lkpn;->d:Lrpn;

    iget-object p0, p0, Lrpn;->b:Lnak;

    :cond_a
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lqpn;

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lqpn;->a(Lqpn;Lptl;ZLp68;ZI)Lqpn;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    return-void

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
